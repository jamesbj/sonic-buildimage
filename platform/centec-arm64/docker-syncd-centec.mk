# docker image for centec syncd

DOCKER_SYNCD_PLATFORM_CODE = centec
include $(PLATFORM_PATH)/../template/docker-syncd-base.mk

$(DOCKER_SYNCD_BASE)_DEPENDS += $(SYNCD) $(PYTHON_SDK_API)
$(DOCKER_SYNCD_CENTEC)_FILES += $(SUPERVISOR_PROC_EXIT_LISTENER_SCRIPT)
$(DOCKER_SYNCD_BASE)_DBG_DEPENDS += $(SYNCD_DBG) \
                                $(LIBSWSSCOMMON_DBG) \
                                $(LIBSAIMETADATA_DBG) \
                                $(LIBSAIREDIS_DBG)

SONIC_STRETCH_DOCKERS += $(DOCKER_SYNCD_BASE)
SONIC_STRETCH_DBG_DOCKERS += $(DOCKER_SYNCD_BASE_DBG)

$(DOCKER_SYNCD_BASE)_RUN_OPT += -v /host/warmboot:/var/warmboot
$(DOCKER_SYNCD_CENTEC)_RUN_OPT += --privileged -t
$(DOCKER_SYNCD_CENTEC)_RUN_OPT += -v /host/machine.conf:/etc/machine.conf
$(DOCKER_SYNCD_CENTEC)_RUN_OPT += -v /var/run/docker-syncd:/var/run/sswsyncd
$(DOCKER_SYNCD_CENTEC)_RUN_OPT += -v /etc/sonic:/etc/sonic:ro
