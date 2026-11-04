#Constants
CC65 := $(shell which ca65)
LD65 := $(shell which ld65)

TARGET := "./langtons-ant.nes"
SRC_FILES := $(wildcard src/*.asm)
BUILD_OBJS := $(patsubst src/%.asm, build/%.o, $(SRC_FILES))

# Build steps
.PHONY: all clean

# Build the NES
all: $(TARGET)

# Assemble OBJS
build/%.o: src/%.asm
	 @mkdir -p build
	 $(CC65) -t nes -o $@ $<

# Assemble .nes file
$(TARGET): $(BUILD_OBJS)
	   $(LD65) -C nes.cfg -o $@ $^

# Clean the build files
clean:
	rm -rf build/ $(TARGET)




