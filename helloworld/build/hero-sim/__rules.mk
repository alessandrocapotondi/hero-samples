
#
# HEADER RULES
#

define declareInstallFile

$(PULP_SDK_INSTALL)/$(1): $(1)
	install -D $(1) $$@

INSTALL_HEADERS += $(PULP_SDK_INSTALL)/$(1)

endef


define declareWsInstallFile

$(PULP_SDK_WS_INSTALL)/$(1): $(1)
	install -D $(1) $$@

WS_INSTALL_HEADERS += $(PULP_SDK_WS_INSTALL)/$(1)

endef


$(foreach file, $(INSTALL_FILES), $(eval $(call declareInstallFile,$(file))))

$(foreach file, $(WS_INSTALL_FILES), $(eval $(call declareWsInstallFile,$(file))))


#
# CC RULES for domain: cluster
#

PULP_LIB_NAME_helloworld ?= helloworld

PULP_CL_EXTRA_SRCS_helloworld = 
PULP_CL_EXTRA_ASM_SRCS_helloworld = 
PULP_CL_EXTRA_OMP_SRCS_helloworld = 

helloworld_CL_OBJS =     $(patsubst %.cpp,$(CONFIG_BUILD_DIR)/$(PULP_LIB_NAME_helloworld)/cl/%.o, $(patsubst %.c,$(CONFIG_BUILD_DIR)/$(PULP_LIB_NAME_helloworld)/cl/%.o, $(PULP_APP_CL_SRCS_helloworld) $(PULP_CL_SRCS_helloworld) $(PULP_APP_CL_SRCS) $(PULP_APP_SRCS) $(PULP_CL_EXTRA_SRCS_helloworld)))
helloworld_CL_ASM_OBJS = $(patsubst %.S,$(CONFIG_BUILD_DIR)/$(PULP_LIB_NAME_helloworld)/cl/%.o, $(PULP_APP_CL_ASM_SRCS_helloworld) $(PULP_CL_ASM_SRCS_helloworld) $(PULP_APP_CL_ASM_SRCS) $(PULP_APP_ASM_SRCS) $(PULP_CL_EXTRA_ASM_SRCS_helloworld))
helloworld_CL_OMP_OBJS = $(patsubst %.c,$(CONFIG_BUILD_DIR)/$(PULP_LIB_NAME_helloworld)/cl/omp/%.o, $(PULP_APP_CL_OMP_SRCS_helloworld) $(PULP_CL_OMP_SRCS_helloworld) $(PULP_APP_CL_OMP_SRCS) $(PULP_APP_OMP_SRCS) $(PULP_CL_EXTRA_OMP_SRCS_helloworld))

ifneq '$(helloworld_CL_OMP_OBJS)' ''
PULP_LDFLAGS_helloworld += $(PULP_OMP_LDFLAGS_helloworld)
endif

-include $(helloworld_CL_OBJS:.o=.d)
-include $(helloworld_CL_ASM_OBJS:.o=.d)
-include $(helloworld_CL_OMP_OBJS:.o=.d)

helloworld_cl_cflags = $(PULP_CL_ARCH_CFLAGS) $(PULP_CFLAGS) $(PULP_CL_CFLAGS) $(PULP_CFLAGS_helloworld) $(PULP_CL_CFLAGS_helloworld) $(PULP_APP_CFLAGS_helloworld)
helloworld_cl_omp_cflags = $(helloworld_cl_cflags) $(PULP_OMP_CFLAGS) $(PULP_CL_OMP_CFLAGS) $(PULP_OMP_CFLAGS_helloworld) $(PULP_CL_OMP_CFLAGS_helloworld)

$(CONFIG_BUILD_DIR)/$(PULP_LIB_NAME_helloworld)/cl/%.o: %.c
	@mkdir -p `dirname $@`
	$(PULP_CL_CC) $(helloworld_cl_cflags) -MMD -MP -c $< -o $@

$(CONFIG_BUILD_DIR)/$(PULP_LIB_NAME_helloworld)/cl/%.o: %.cpp
	@mkdir -p `dirname $@`
	$(PULP_CL_CC) $(helloworld_cl_cflags) -MMD -MP -c $< -o $@

$(CONFIG_BUILD_DIR)/$(PULP_LIB_NAME_helloworld)/cl/%.o: %.S
	@mkdir -p `dirname $@`
	$(PULP_CL_CC) $(helloworld_cl_cflags) -DLANGUAGE_ASSEMBLY -MMD -MP -c $< -o $@

$(CONFIG_BUILD_DIR)/$(PULP_LIB_NAME_helloworld)/cl/omp/%.o: %.c
	@mkdir -p `dirname $@`
	touch libgomp.spec
	$(PULP_CL_CC) $(helloworld_cl_omp_cflags) -MMD -MP -c $< -o $@

helloworld_OBJS += $(helloworld_CL_OBJS) $(helloworld_CL_ASM_OBJS) $(helloworld_CL_OMP_OBJS)



#
# CC RULES for domain: fabric_controller
#

PULP_LIB_NAME_helloworld ?= helloworld

PULP_FC_EXTRA_SRCS_helloworld = /home/acapotondi/workspace_pulp/hero/openmp-examples/helloworld/build/hero-sim/rt_conf.c
PULP_FC_EXTRA_ASM_SRCS_helloworld = 
PULP_FC_EXTRA_OMP_SRCS_helloworld = 

helloworld_FC_OBJS =     $(patsubst %.cpp,$(CONFIG_BUILD_DIR)/$(PULP_LIB_NAME_helloworld)/fc/%.o, $(patsubst %.c,$(CONFIG_BUILD_DIR)/$(PULP_LIB_NAME_helloworld)/fc/%.o, $(PULP_APP_FC_SRCS_helloworld) $(PULP_FC_SRCS_helloworld) $(PULP_APP_FC_SRCS)  $(PULP_FC_EXTRA_SRCS_helloworld)))
helloworld_FC_ASM_OBJS = $(patsubst %.S,$(CONFIG_BUILD_DIR)/$(PULP_LIB_NAME_helloworld)/fc/%.o, $(PULP_APP_FC_ASM_SRCS_helloworld) $(PULP_FC_ASM_SRCS_helloworld) $(PULP_APP_FC_ASM_SRCS)  $(PULP_FC_EXTRA_ASM_SRCS_helloworld))
helloworld_FC_OMP_OBJS = $(patsubst %.c,$(CONFIG_BUILD_DIR)/$(PULP_LIB_NAME_helloworld)/fc/omp/%.o, $(PULP_APP_FC_OMP_SRCS_helloworld) $(PULP_FC_OMP_SRCS_helloworld) $(PULP_APP_FC_OMP_SRCS)  $(PULP_FC_EXTRA_OMP_SRCS_helloworld))

ifneq '$(helloworld_FC_OMP_OBJS)' ''
PULP_LDFLAGS_helloworld += $(PULP_OMP_LDFLAGS_helloworld)
endif

-include $(helloworld_FC_OBJS:.o=.d)
-include $(helloworld_FC_ASM_OBJS:.o=.d)
-include $(helloworld_FC_OMP_OBJS:.o=.d)

helloworld_fc_cflags = $(PULP_FC_ARCH_CFLAGS) $(PULP_CFLAGS) $(PULP_FC_CFLAGS) $(PULP_CFLAGS_helloworld) $(PULP_FC_CFLAGS_helloworld) $(PULP_APP_CFLAGS_helloworld)
helloworld_fc_omp_cflags = $(helloworld_fc_cflags) $(PULP_OMP_CFLAGS) $(PULP_FC_OMP_CFLAGS) $(PULP_OMP_CFLAGS_helloworld) $(PULP_FC_OMP_CFLAGS_helloworld)

$(CONFIG_BUILD_DIR)/$(PULP_LIB_NAME_helloworld)/fc/%.o: %.c
	@mkdir -p `dirname $@`
	$(PULP_FC_CC) $(helloworld_fc_cflags) -MMD -MP -c $< -o $@

$(CONFIG_BUILD_DIR)/$(PULP_LIB_NAME_helloworld)/fc/%.o: %.cpp
	@mkdir -p `dirname $@`
	$(PULP_FC_CC) $(helloworld_fc_cflags) -MMD -MP -c $< -o $@

$(CONFIG_BUILD_DIR)/$(PULP_LIB_NAME_helloworld)/fc/%.o: %.S
	@mkdir -p `dirname $@`
	$(PULP_FC_CC) $(helloworld_fc_cflags) -DLANGUAGE_ASSEMBLY -MMD -MP -c $< -o $@

$(CONFIG_BUILD_DIR)/$(PULP_LIB_NAME_helloworld)/fc/omp/%.o: %.c
	@mkdir -p `dirname $@`
	touch libgomp.spec
	$(PULP_FC_CC) $(helloworld_fc_omp_cflags) -MMD -MP -c $< -o $@

helloworld_OBJS += $(helloworld_FC_OBJS) $(helloworld_FC_ASM_OBJS) $(helloworld_FC_OMP_OBJS)



#
# LINKER RULES for application: helloworld
#

$(CONFIG_BUILD_DIR)/$(PULP_APP)/$(PULP_APP): $(helloworld_OBJS)
	mkdir -p `dirname $@`
	$(PULP_LD) $(PULP_ARCH_LDFLAGS) -MMD -MP -o $@ $^ $(PULP_LDFLAGS_helloworld) $(PULP_LDFLAGS)

$(CONFIG_BUILD_DIR)/helloworld.ld: $(PULP_SDK_HOME)/install/rules/tools.mk
	plpflags genlink $(FLAGS_OPT) --output-dir=$(CONFIG_BUILD_DIR) $(apps) --config-file=$(CONFIG_BUILD_DIR)/config.json

$(CONFIG_BUILD_DIR)/helloworld_ld:
	plpflags genlink $(FLAGS_OPT) --output-dir=$(CONFIG_BUILD_DIR) $(apps) --config-file=$(CONFIG_BUILD_DIR)/config.json

$(PULP_SDK_INSTALL)/bin/$(PULP_APP): $(CONFIG_BUILD_DIR)/$(PULP_APP)/$(PULP_APP)
	mkdir -p `dirname $@`
	cp $< $@

disopt ?= -d

dis:
	$(PULP_OBJDUMP) $(PULP_ARCH_OBJDFLAGS) $(CONFIG_BUILD_DIR)/$(PULP_APP)/$(PULP_APP) $(disopt)

extract:
	for symbol in $(symbols); do $(PULP_PREFIX)readelf -s $(CONFIG_BUILD_DIR)/$(PULP_APP)/$(PULP_APP) | grep $$symbol | gawk '{print $$2}' > $(CONFIG_BUILD_DIR)/$(PULP_APP)/$$symbol.txt; done

disdump:
	$(PULP_OBJDUMP) $(CONFIG_BUILD_DIR)/$(PULP_APP)/$(PULP_APP) $(disopt) > $(CONFIG_BUILD_DIR)/$(PULP_APP)/$(PULP_APP).s
	@echo
	@echo  "Disasembled binary to $(CONFIG_BUILD_DIR)/$(PULP_APP)/$(PULP_APP).s"

TARGETS += $(CONFIG_BUILD_DIR)/$(PULP_APP)/$(PULP_APP)
GEN_TARGETS += $(CONFIG_BUILD_DIR)/helloworld.ld
GEN_TARGETS_FORCE += $(CONFIG_BUILD_DIR)/helloworld_ld
CLEAN_TARGETS += $(CONFIG_BUILD_DIR)/$(PULP_APP)/$(PULP_APP) $(helloworld_OBJS)
RUN_BINARY = $(PULP_APP)/$(PULP_APP)
override CONFIG_OPT += **/loader/binaries=$(CONFIG_BUILD_DIR)/$(PULP_APP)/$(PULP_APP)
INSTALL_TARGETS += $(PULP_SDK_INSTALL)/bin/$(PULP_APP)


header:: $(INSTALL_HEADERS) $(WS_INSTALL_HEADERS)

fullclean::
	rm -rf $(CONFIG_BUILD_DIR)

clean:: $(GEN_TARGETS) $(CONFIG_BUILD_DIR)/config.mk
	rm -rf $(CLEAN_TARGETS)

prepare:: $(GEN_TARGETS) $(CONFIG_BUILD_DIR)/config.mk
	pulp-run $(pulpRunOpt) prepare

runner:: $(GEN_TARGETS) $(CONFIG_BUILD_DIR)/config.mk
	pulp-run $(pulpRunOpt) $(RUNNER_CMD)

power:: $(GEN_TARGETS) $(CONFIG_BUILD_DIR)/config.mk
	pulp-run $(pulpRunOpt) power

gen: $(GEN_TARGETS_FORCE)

build:: $(GEN_TARGETS) $(CONFIG_BUILD_DIR)/config.mk $(TARGETS)

all:: build prepare

install:: $(INSTALL_TARGETS)

run::
	pulp-run $(pulpRunOpt)

.PHONY: clean header prepare all install run
