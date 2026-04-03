# ==============================================================================
# LBM Solver Makefile
# ==============================================================================

FC       = nvfortran
FFLAGS   = -fast -module $(BUILD) -I$(BUILD)
ACC      = -acc -gpu=cc80        # change cc89 to match your GPU
DBGFLAGS = -g -O0 -Mbounds -Mchkptr -traceback -module $(BUILD) -I$(BUILD)

BUILD    = build
BIN      = bin
TARGET   = $(BIN)/lbm

# ==============================================================================
# Source files — ORDER MATTERS: dependencies must precede dependents
# ==============================================================================

SRCS = \
    src/core/kinds.f90               \
    src/core/constants.f90           \
    src/core/grid.f90                \
    src/scheme/scheme.f90     	     \
    src/scheme/d2q5.f90              \
    src/scheme/d2q9.f90              \
    src/scheme/d3q15.f90             \
    src/scheme/d3q19.f90             \
    src/scheme/d3q27.f90             \
    src/collision/collision.f90 	 \
    src/collision/bgk.f90            \
    src/collision/kbc.f90            \
    src/boundary/bc.f90         	 \
    src/boundary/periodic.f90        \
    src/boundary/bounce_back.f90     \
    src/boundary/zou_he.f90          \
    src/solver/macro_2d.f90          \
    src/solver/macro_3d.f90          \
    src/solver/solver_2d.f90         \
    src/solver/solver_3d.f90         \
    src/io/checkpoint.f90            \
    src/io/vtk_writer.f90            \
    src/main.f90

OBJS = $(patsubst src/%.f90, $(BUILD)/%.o, $(SRCS))

# ==============================================================================
# Targets
# ==============================================================================

.PHONY: all gpu cpu debug clean test info

# Default: GPU build with OpenACC
all: gpu

gpu: FFLAGS += $(ACC)
gpu: $(TARGET)

# CPU-only build (no OpenACC)
cpu: $(TARGET)

# Debug build — no acc, bounds checking, no optimization
debug: FFLAGS = $(DBGFLAGS)
debug: $(TARGET)

$(TARGET): $(OBJS) | $(BIN)
	$(FC) $(FFLAGS) -o $@ $^

# Compile each .f90 -> .o, preserving subdirectory structure under build/
$(BUILD)/%.o: src/%.f90 | $(BUILD)
	@mkdir -p $(dir $@)
	$(FC) $(FFLAGS) -c $< -o $@

$(BUILD):
	mkdir -p $(BUILD)

$(BIN):
	mkdir -p $(BIN)

# ==============================================================================
# Tests
# ==============================================================================

TEST_SRCS = $(wildcard tests/*.f90)
TEST_BINS = $(patsubst tests/%.f90, $(BIN)/test_%, $(TEST_SRCS))

test: $(TEST_BINS)
	@for t in $(TEST_BINS); do echo "Running $$t..."; $$t; done

# Link test binaries against all objects except main.o
$(BIN)/test_%: tests/%.f90 $(filter-out $(BUILD)/main.o, $(OBJS)) | $(BIN)
	$(FC) $(FFLAGS) -o $@ $^

# ==============================================================================
# Utility
# ==============================================================================

clean:
	rm -rf $(BUILD) $(BIN)

info:
	@echo "Compiler : $(FC)"
	@echo "Flags    : $(FFLAGS)"
	@echo "Sources  : $(words $(SRCS)) files"
	@$(FC) --version