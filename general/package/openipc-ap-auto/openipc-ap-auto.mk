################################################################################
#
# openipc-ap-auto
#
# Auto-start AP mode (hostapd + dnsmasq) on boot for SSV6155P WiFi modules.
#
################################################################################

OPENIPC_AP_AUTO_VERSION = 1.0
OPENIPC_AP_AUTO_SITE_METHOD = local
OPENIPC_AP_AUTO_SITE = $(BR2_EXTERNAL_GENERAL_PATH)/package/openipc-ap-auto
OPENIPC_AP_AUTO_LICENSE = MIT

define OPENIPC_AP_AUTO_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/files/etc/init.d/ssv615x-ap $(TARGET_DIR)/etc/init.d/ssv615x-ap
	$(INSTALL) -m 0644 -D $(@D)/files/etc/hostapd.conf $(TARGET_DIR)/etc/hostapd.conf
	echo "/etc/init.d/ssv615x-ap start &" >> $(TARGET_DIR)/etc/rc.local
endef

$(eval $(generic-package))