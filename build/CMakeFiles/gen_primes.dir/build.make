# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.8

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/kevin/Documents/Programacion/Discretas3/CrydiLib

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kevin/Documents/Programacion/Discretas3/CrydiLib/build

# Include any dependencies generated for this target.
include CMakeFiles/gen_primes.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/gen_primes.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/gen_primes.dir/flags.make

CMakeFiles/gen_primes.dir/primes/gen_primes.cc.o: CMakeFiles/gen_primes.dir/flags.make
CMakeFiles/gen_primes.dir/primes/gen_primes.cc.o: ../primes/gen_primes.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kevin/Documents/Programacion/Discretas3/CrydiLib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/gen_primes.dir/primes/gen_primes.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/gen_primes.dir/primes/gen_primes.cc.o -c /home/kevin/Documents/Programacion/Discretas3/CrydiLib/primes/gen_primes.cc

CMakeFiles/gen_primes.dir/primes/gen_primes.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gen_primes.dir/primes/gen_primes.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kevin/Documents/Programacion/Discretas3/CrydiLib/primes/gen_primes.cc > CMakeFiles/gen_primes.dir/primes/gen_primes.cc.i

CMakeFiles/gen_primes.dir/primes/gen_primes.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gen_primes.dir/primes/gen_primes.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kevin/Documents/Programacion/Discretas3/CrydiLib/primes/gen_primes.cc -o CMakeFiles/gen_primes.dir/primes/gen_primes.cc.s

CMakeFiles/gen_primes.dir/primes/gen_primes.cc.o.requires:

.PHONY : CMakeFiles/gen_primes.dir/primes/gen_primes.cc.o.requires

CMakeFiles/gen_primes.dir/primes/gen_primes.cc.o.provides: CMakeFiles/gen_primes.dir/primes/gen_primes.cc.o.requires
	$(MAKE) -f CMakeFiles/gen_primes.dir/build.make CMakeFiles/gen_primes.dir/primes/gen_primes.cc.o.provides.build
.PHONY : CMakeFiles/gen_primes.dir/primes/gen_primes.cc.o.provides

CMakeFiles/gen_primes.dir/primes/gen_primes.cc.o.provides.build: CMakeFiles/gen_primes.dir/primes/gen_primes.cc.o


# Object files for target gen_primes
gen_primes_OBJECTS = \
"CMakeFiles/gen_primes.dir/primes/gen_primes.cc.o"

# External object files for target gen_primes
gen_primes_EXTERNAL_OBJECTS =

gen_primes: CMakeFiles/gen_primes.dir/primes/gen_primes.cc.o
gen_primes: CMakeFiles/gen_primes.dir/build.make
gen_primes: libcrydi3.so
gen_primes: CMakeFiles/gen_primes.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/kevin/Documents/Programacion/Discretas3/CrydiLib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable gen_primes"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gen_primes.dir/link.txt --verbose=$(VERBOSE)
	./gen_primes

# Rule to build all files generated by this target.
CMakeFiles/gen_primes.dir/build: gen_primes

.PHONY : CMakeFiles/gen_primes.dir/build

CMakeFiles/gen_primes.dir/requires: CMakeFiles/gen_primes.dir/primes/gen_primes.cc.o.requires

.PHONY : CMakeFiles/gen_primes.dir/requires

CMakeFiles/gen_primes.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/gen_primes.dir/cmake_clean.cmake
.PHONY : CMakeFiles/gen_primes.dir/clean

CMakeFiles/gen_primes.dir/depend:
	cd /home/kevin/Documents/Programacion/Discretas3/CrydiLib/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kevin/Documents/Programacion/Discretas3/CrydiLib /home/kevin/Documents/Programacion/Discretas3/CrydiLib /home/kevin/Documents/Programacion/Discretas3/CrydiLib/build /home/kevin/Documents/Programacion/Discretas3/CrydiLib/build /home/kevin/Documents/Programacion/Discretas3/CrydiLib/build/CMakeFiles/gen_primes.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/gen_primes.dir/depend

