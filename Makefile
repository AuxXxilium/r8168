# SPDX-License-Identifier: GPL-2.0-only
################################################################################
#
# r8168 is the Linux device driver released for Realtek Gigabit Ethernet
# controllers with PCI-Express interface.
#
# Copyright(c) 2022 Realtek Semiconductor Corp. All rights reserved.
#
# This program is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the Free
# Software Foundation; either version 2 of the License, or (at your option)
# any later version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
# more details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, see <http://www.gnu.org/licenses/>.
#
# Author:
# Realtek NIC software team <nicfae@realtek.com>
# No. 2, Innovation Road II, Hsinchu Science Park, Hsinchu 300, Taiwan
#
################################################################################

################################################################################
#  This product is covered by one or more of the following patents:
#  US6,570,884, US6,115,776, and US6,327,625.
################################################################################

CONFIG_SOC_LAN = n
ENABLE_FIBER_SUPPORT = n
ENABLE_REALWOW_SUPPORT = n
ENABLE_DASH_SUPPORT = n
ENABLE_DASH_PRINTER_SUPPORT = n
CONFIG_DOWN_SPEED_100 = n
CONFIG_ASPM = y
ENABLE_S5WOL = y
ENABLE_S5_KEEP_CURR_MAC = n
ENABLE_EEE = y
ENABLE_S0_MAGIC_PACKET = n
CONFIG_DYNAMIC_ASPM = y
ENABLE_USE_FIRMWARE_FILE = n
CONFIG_CTAP_SHORT_OFF = n

obj-m := r8168.o
r8168-objs := r8168_n.o r8168_asf.o rtl_eeprom.o rtltool.o
ifeq ($(CONFIG_SOC_LAN), y)
	EXTRA_CFLAGS += -DCONFIG_SOC_LAN
endif
ifeq ($(ENABLE_FIBER_SUPPORT), y)
	r8168-objs += r8168_fiber.o
	EXTRA_CFLAGS += -DENABLE_FIBER_SUPPORT
endif
ifeq ($(ENABLE_REALWOW_SUPPORT), y)
	r8168-objs += r8168_realwow.o
	EXTRA_CFLAGS += -DENABLE_REALWOW_SUPPORT
endif
ifeq ($(ENABLE_DASH_SUPPORT), y)
	r8168-objs += r8168_dash.o
	EXTRA_CFLAGS += -DENABLE_DASH_SUPPORT
endif
ifeq ($(ENABLE_DASH_PRINTER_SUPPORT), y)
	r8168-objs += r8168_dash.o
	EXTRA_CFLAGS += -DENABLE_DASH_SUPPORT -DENABLE_DASH_PRINTER_SUPPORT
endif
EXTRA_CFLAGS += -DCONFIG_R8168_NAPI
EXTRA_CFLAGS += -DCONFIG_R8168_VLAN
ifeq ($(CONFIG_DOWN_SPEED_100), y)
	EXTRA_CFLAGS += -DCONFIG_DOWN_SPEED_100
endif
ifeq ($(CONFIG_ASPM), y)
	EXTRA_CFLAGS += -DCONFIG_ASPM
endif
ifeq ($(ENABLE_S5WOL), y)
	EXTRA_CFLAGS += -DENABLE_S5WOL
endif
ifeq ($(ENABLE_S5_KEEP_CURR_MAC), y)
	EXTRA_CFLAGS += -DENABLE_S5_KEEP_CURR_MAC
endif
ifeq ($(ENABLE_EEE), y)
	EXTRA_CFLAGS += -DENABLE_EEE
endif
ifeq ($(ENABLE_S0_MAGIC_PACKET), y)
	EXTRA_CFLAGS += -DENABLE_S0_MAGIC_PACKET
endif
ifeq ($(CONFIG_DYNAMIC_ASPM), y)
	EXTRA_CFLAGS += -DCONFIG_DYNAMIC_ASPM
endif
ifeq ($(ENABLE_USE_FIRMWARE_FILE), y)
	r8168-objs += r8168_firmware.o
	EXTRA_CFLAGS += -DENABLE_USE_FIRMWARE_FILE
endif
ifeq ($(CONFIG_CTAP_SHORT_OFF), y)
	EXTRA_CFLAGS += -DCONFIG_CTAP_SHORT_OFF
endif