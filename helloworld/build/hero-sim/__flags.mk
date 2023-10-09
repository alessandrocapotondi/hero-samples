PULP_LDFLAGS      += 
PULP_CFLAGS       += 
PULP_CL_ARCH_CFLAGS ?=  -march=rv32imacxpulpv2 -D__riscv__
PULP_CL_CFLAGS    += -Wextra -Wall -Wno-unused-parameter -Wno-unused-variable -Wno-unused-function -Wundef -fdata-sections -ffunction-sections -I/home/acapotondi/workspace_pulp/hero/pulp/sdk/pkg/sdk/dev/install/include/io -I/home/acapotondi/workspace_pulp/hero/pulp/sdk/pkg/sdk/dev/install/include -include /home/acapotondi/workspace_pulp/hero/openmp-examples/helloworld/build/hero-sim/cl_config.h
PULP_CL_OMP_CFLAGS    += -fopenmp -mnativeomp
ifdef PULP_RISCV_GCC_TOOLCHAIN
PULP_CL_CC = $(PULP_RISCV_GCC_TOOLCHAIN)/bin/riscv32-unknown-elf-gcc 
PULP_CC = $(PULP_RISCV_GCC_TOOLCHAIN)/bin/riscv32-unknown-elf-gcc 
PULP_AR ?= $(PULP_RISCV_GCC_TOOLCHAIN)/bin/riscv32-unknown-elf-ar
PULP_LD ?= $(PULP_RISCV_GCC_TOOLCHAIN)/bin/riscv32-unknown-elf-gcc
PULP_CL_OBJDUMP ?= $(PULP_RISCV_GCC_TOOLCHAIN)/bin/riscv32-unknown-elf-objdump
PULP_OBJDUMP ?= $(PULP_RISCV_GCC_TOOLCHAIN)/bin/riscv32-unknown-elf-objdump
else
PULP_CL_CC = $(PULP_RISCV_GCC_TOOLCHAIN_CI)/bin/riscv32-unknown-elf-gcc 
PULP_CC = $(PULP_RISCV_GCC_TOOLCHAIN_CI)/bin/riscv32-unknown-elf-gcc 
PULP_AR ?= $(PULP_RISCV_GCC_TOOLCHAIN_CI)/bin/riscv32-unknown-elf-ar
PULP_LD ?= $(PULP_RISCV_GCC_TOOLCHAIN_CI)/bin/riscv32-unknown-elf-gcc
PULP_CL_OBJDUMP ?= $(PULP_RISCV_GCC_TOOLCHAIN_CI)/bin/riscv32-unknown-elf-objdump
PULP_OBJDUMP ?= $(PULP_RISCV_GCC_TOOLCHAIN_CI)/bin/riscv32-unknown-elf-objdump
endif
PULP_ARCH_CL_OBJDFLAGS ?= -Mmarch=rv32imacxpulpv2
PULP_ARCH_OBJDFLAGS ?= -Mmarch=rv32imacxpulpv2
PULP_FC_ARCH_CFLAGS ?=  -march=rv32imacxpulpv2 -D__riscv__
PULP_FC_CFLAGS    += -Wextra -Wall -Wno-unused-parameter -Wno-unused-variable -Wno-unused-function -Wundef -fdata-sections -ffunction-sections -I/home/acapotondi/workspace_pulp/hero/pulp/sdk/pkg/sdk/dev/install/include/io -I/home/acapotondi/workspace_pulp/hero/pulp/sdk/pkg/sdk/dev/install/include -include /home/acapotondi/workspace_pulp/hero/openmp-examples/helloworld/build/hero-sim/fc_config.h
PULP_FC_OMP_CFLAGS    += -fopenmp -mnativeomp
ifdef PULP_RISCV_GCC_TOOLCHAIN
PULP_FC_CC = $(PULP_RISCV_GCC_TOOLCHAIN)/bin/riscv32-unknown-elf-gcc 
PULP_CC = $(PULP_RISCV_GCC_TOOLCHAIN)/bin/riscv32-unknown-elf-gcc 
PULP_AR ?= $(PULP_RISCV_GCC_TOOLCHAIN)/bin/riscv32-unknown-elf-ar
PULP_LD ?= $(PULP_RISCV_GCC_TOOLCHAIN)/bin/riscv32-unknown-elf-gcc
PULP_FC_OBJDUMP ?= $(PULP_RISCV_GCC_TOOLCHAIN)/bin/riscv32-unknown-elf-objdump
else
PULP_FC_CC = $(PULP_RISCV_GCC_TOOLCHAIN_CI)/bin/riscv32-unknown-elf-gcc 
PULP_CC = $(PULP_RISCV_GCC_TOOLCHAIN_CI)/bin/riscv32-unknown-elf-gcc 
PULP_AR ?= $(PULP_RISCV_GCC_TOOLCHAIN_CI)/bin/riscv32-unknown-elf-ar
PULP_LD ?= $(PULP_RISCV_GCC_TOOLCHAIN_CI)/bin/riscv32-unknown-elf-gcc
PULP_FC_OBJDUMP ?= $(PULP_RISCV_GCC_TOOLCHAIN_CI)/bin/riscv32-unknown-elf-objdump
endif
PULP_ARCH_FC_OBJDFLAGS ?= -Mmarch=rv32imacxpulpv2
PULP_ARCH_LDFLAGS ?=  -march=rv32imacxpulpv2 -D__riscv__
PULP_LDFLAGS_helloworld = /home/acapotondi/workspace_pulp/hero/pulp/sdk/pkg/sdk/dev/install/lib/hero-urania/rt/crt0.o -nostartfiles -nostdlib -Wl,--gc-sections -T/home/acapotondi/workspace_pulp/hero/openmp-examples/helloworld/build/hero-sim/helloworld.ld -T/home/acapotondi/workspace_pulp/hero/openmp-examples/helloworld/build/hero-sim/helloworld_config.ld -L/home/acapotondi/workspace_pulp/hero/pulp/sdk/pkg/sdk/dev/install/lib/hero-urania -lrt -lrtio -lrt -larchi_host -lvmm -lgcc
PULP_OMP_LDFLAGS_helloworld = -lomp
pulpRunOpt        += --dir=/home/acapotondi/workspace_pulp/hero/openmp-examples/helloworld/build/hero-sim --config-file=/home/acapotondi/workspace_pulp/hero/openmp-examples/helloworld/build/hero-sim/config.json --binary=helloworld/helloworld
