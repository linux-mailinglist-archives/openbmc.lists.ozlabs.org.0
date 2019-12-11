Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A219A11C0D1
	for <lists+openbmc@lfdr.de>; Thu, 12 Dec 2019 00:52:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YDHP0310zDqwT
	for <lists+openbmc@lfdr.de>; Thu, 12 Dec 2019 10:52:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y6rT2YW0zDqrW
 for <openbmc@lists.ozlabs.org>; Thu, 12 Dec 2019 06:46:49 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Dec 2019 11:46:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,303,1571727600"; d="scan'208";a="216033909"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO ubuntu.jf.intel.com)
 ([10.7.153.143])
 by orsmga003.jf.intel.com with ESMTP; 11 Dec 2019 11:46:47 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lee Jones <lee.jones@linaro.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jonathan Corbet <corbet@lwn.net>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "Darrick J . Wong" <darrick.wong@oracle.com>,
 Eric Sandeen <sandeen@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Wu Hao <hao.wu@intel.com>, Tomohiro Kusumi <kusumi.tomohiro@gmail.com>,
 "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>,
 Frederic Barrat <fbarrat@linux.vnet.ibm.com>,
 "David S . Miller" <davem@davemloft.net>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Philippe Ombredanne <pombredanne@nexb.com>, Vinod Koul <vkoul@kernel.org>,
 Stephen Boyd <sboyd@codeaurora.org>,
 David Kershner <david.kershner@unisys.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 Sagar Dharia <sdharia@codeaurora.org>, Johan Hovold <johan@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v11 13/14] hwmon: Add PECI cputemp driver
Date: Wed, 11 Dec 2019 11:46:23 -0800
Message-Id: <20191211194624.2872-14-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191211194624.2872-1-jae.hyun.yoo@linux.intel.com>
References: <20191211194624.2872-1-jae.hyun.yoo@linux.intel.com>
X-Mailman-Approved-At: Thu, 12 Dec 2019 10:31:05 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, linux-doc@vger.kernel.org,
 openbmc@lists.ozlabs.org, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Stef van Os <stef.van.os@prodrive-technologies.com>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Alan Cox <alan@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This commit adds PECI cputemp hwmon driver.

Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Alan Cox <alan@linux.intel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Jason M Biils <jason.m.bills@linux.intel.com>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Stef van Os <stef.van.os@prodrive-technologies.com>
Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Reviewed-by: Haiyue Wang <haiyue.wang@linux.intel.com>
Reviewed-by: James Feist <james.feist@linux.intel.com>
Reviewed-by: Vernon Mauery <vernon.mauery@linux.intel.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
---
Changes since v10:
- Added Skylake Xeon D support.
- Added DTS temperature which is more thermal control friendlier than Die
  temperature.
- Fixed minor bugs and style issues.

 drivers/hwmon/Kconfig        |  14 ++
 drivers/hwmon/Makefile       |   1 +
 drivers/hwmon/peci-cputemp.c | 448 +++++++++++++++++++++++++++++++++++
 drivers/hwmon/peci-hwmon.h   |  46 ++++
 4 files changed, 509 insertions(+)
 create mode 100644 drivers/hwmon/peci-cputemp.c
 create mode 100644 drivers/hwmon/peci-hwmon.h

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 23dfe848979a..b6604759579c 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1349,6 +1349,20 @@ config SENSORS_PCF8591
 	  These devices are hard to detect and rarely found on mainstream
 	  hardware. If unsure, say N.
 
+config SENSORS_PECI_CPUTEMP
+	tristate "PECI CPU temperature monitoring client"
+	depends on PECI
+	select MFD_INTEL_PECI_CLIENT
+	help
+	  If you say yes here you get support for the generic Intel PECI
+	  cputemp driver which provides Digital Thermal Sensor (DTS) thermal
+	  readings of the CPU package and CPU cores that are accessible using
+	  the PECI Client Command Suite via the processor PECI client.
+	  Check <file:Documentation/hwmon/peci-cputemp.rst> for details.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called peci-cputemp.
+
 source "drivers/hwmon/pmbus/Kconfig"
 
 config SENSORS_PWM_FAN
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 6db5db9cdc29..d6fea48697af 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -144,6 +144,7 @@ obj-$(CONFIG_SENSORS_NTC_THERMISTOR)	+= ntc_thermistor.o
 obj-$(CONFIG_SENSORS_PC87360)	+= pc87360.o
 obj-$(CONFIG_SENSORS_PC87427)	+= pc87427.o
 obj-$(CONFIG_SENSORS_PCF8591)	+= pcf8591.o
+obj-$(CONFIG_SENSORS_PECI_CPUTEMP)	+= peci-cputemp.o
 obj-$(CONFIG_SENSORS_POWR1220)  += powr1220.o
 obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
 obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
diff --git a/drivers/hwmon/peci-cputemp.c b/drivers/hwmon/peci-cputemp.c
new file mode 100644
index 000000000000..70ced9f9299f
--- /dev/null
+++ b/drivers/hwmon/peci-cputemp.c
@@ -0,0 +1,448 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2018-2019 Intel Corporation
+
+#include <linux/hwmon.h>
+#include <linux/jiffies.h>
+#include <linux/mfd/intel-peci-client.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include "peci-hwmon.h"
+
+#define DEFAULT_CHANNEL_NUMS   5
+#define CORETEMP_CHANNEL_NUMS  CORE_NUMS_MAX
+#define CPUTEMP_CHANNEL_NUMS   (DEFAULT_CHANNEL_NUMS + CORETEMP_CHANNEL_NUMS)
+
+struct temp_group {
+	struct peci_sensor_data die;
+	struct peci_sensor_data dts;
+	struct peci_sensor_data tcontrol;
+	struct peci_sensor_data tthrottle;
+	struct peci_sensor_data tjmax;
+	struct peci_sensor_data core[CORETEMP_CHANNEL_NUMS];
+};
+
+struct peci_cputemp {
+	struct peci_client_manager *mgr;
+	struct device *dev;
+	char name[PECI_NAME_SIZE];
+	const struct cpu_gen_info *gen_info;
+	struct temp_group temp;
+	u64 core_mask;
+	u32 temp_config[CPUTEMP_CHANNEL_NUMS + 1];
+	uint config_idx;
+	struct hwmon_channel_info temp_info;
+	const struct hwmon_channel_info *info[2];
+	struct hwmon_chip_info chip;
+};
+
+enum cputemp_channels {
+	channel_die,
+	channel_dts,
+	channel_tcontrol,
+	channel_tthrottle,
+	channel_tjmax,
+	channel_core,
+};
+
+static const u32 config_table[DEFAULT_CHANNEL_NUMS + 1] = {
+	/* Die temperature */
+	HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
+	HWMON_T_CRIT_HYST,
+
+	/* DTS margin */
+	HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
+	HWMON_T_CRIT_HYST,
+
+	/* Tcontrol temperature */
+	HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_CRIT,
+
+	/* Tthrottle temperature */
+	HWMON_T_LABEL | HWMON_T_INPUT,
+
+	/* Tjmax temperature */
+	HWMON_T_LABEL | HWMON_T_INPUT,
+
+	/* Core temperature - for all core channels */
+	HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
+	HWMON_T_CRIT_HYST,
+};
+
+static const char *cputemp_label[CPUTEMP_CHANNEL_NUMS] = {
+	"Die",
+	"DTS",
+	"Tcontrol",
+	"Tthrottle",
+	"Tjmax",
+	"Core 0", "Core 1", "Core 2", "Core 3",
+	"Core 4", "Core 5", "Core 6", "Core 7",
+	"Core 8", "Core 9", "Core 10", "Core 11",
+	"Core 12", "Core 13", "Core 14", "Core 15",
+	"Core 16", "Core 17", "Core 18", "Core 19",
+	"Core 20", "Core 21", "Core 22", "Core 23",
+	"Core 24", "Core 25", "Core 26", "Core 27",
+};
+
+static s32 ten_dot_six_to_millidegree(s32 val)
+{
+	return ((val ^ 0x8000) - 0x8000) * 1000 / 64;
+}
+
+static int get_temp_targets(struct peci_cputemp *priv)
+{
+	s32 tthrottle_offset;
+	s32 tcontrol_margin;
+	u8  pkg_cfg[4];
+	int ret;
+
+	/*
+	 * Just use only the tcontrol marker to determine if target values need
+	 * update.
+	 */
+	if (!peci_sensor_need_update(&priv->temp.tcontrol))
+		return 0;
+
+	ret = peci_client_read_package_config(priv->mgr,
+					      PECI_MBX_INDEX_TEMP_TARGET, 0,
+					      pkg_cfg);
+	if (ret)
+		return ret;
+
+	priv->temp.tjmax.value = pkg_cfg[2] * 1000;
+
+	tcontrol_margin = pkg_cfg[1];
+	tcontrol_margin = ((tcontrol_margin ^ 0x80) - 0x80) * 1000;
+	priv->temp.tcontrol.value = priv->temp.tjmax.value - tcontrol_margin;
+
+	tthrottle_offset = (pkg_cfg[3] & 0x2f) * 1000;
+	priv->temp.tthrottle.value = priv->temp.tjmax.value - tthrottle_offset;
+
+	peci_sensor_mark_updated(&priv->temp.tcontrol);
+
+	return 0;
+}
+
+static int get_die_temp(struct peci_cputemp *priv)
+{
+	struct peci_get_temp_msg msg;
+	int ret;
+
+	if (!peci_sensor_need_update(&priv->temp.die))
+		return 0;
+
+	msg.addr = priv->mgr->client->addr;
+
+	ret = peci_command(priv->mgr->client->adapter, PECI_CMD_GET_TEMP, &msg);
+	if (ret)
+		return ret;
+
+	/* Note that the tjmax should be available before calling it */
+	priv->temp.die.value = priv->temp.tjmax.value +
+			       (msg.temp_raw * 1000 / 64);
+
+	peci_sensor_mark_updated(&priv->temp.die);
+
+	return 0;
+}
+
+static int get_dts(struct peci_cputemp *priv)
+{
+	s32 dts_margin;
+	u8  pkg_cfg[4];
+	int ret;
+
+	if (!peci_sensor_need_update(&priv->temp.dts))
+		return 0;
+
+	ret = peci_client_read_package_config(priv->mgr,
+					      PECI_MBX_INDEX_DTS_MARGIN, 0,
+					      pkg_cfg);
+
+	if (ret)
+		return ret;
+
+	dts_margin = (pkg_cfg[1] << 8) | pkg_cfg[0];
+
+	/**
+	 * Processors return a value of DTS reading in 10.6 format
+	 * (10 bits signed decimal, 6 bits fractional).
+	 * Error codes:
+	 *   0x8000: General sensor error
+	 *   0x8001: Reserved
+	 *   0x8002: Underflow on reading value
+	 *   0x8003-0x81ff: Reserved
+	 */
+	if (dts_margin >= 0x8000 && dts_margin <= 0x81ff)
+		return -EIO;
+
+	dts_margin = ten_dot_six_to_millidegree(dts_margin);
+
+	/* Note that the tcontrol should be available before calling it */
+	priv->temp.dts.value = priv->temp.tcontrol.value - dts_margin;
+
+	peci_sensor_mark_updated(&priv->temp.dts);
+
+	return 0;
+}
+
+static int get_core_temp(struct peci_cputemp *priv, int core_index)
+{
+	s32 core_dts_margin;
+	u8  pkg_cfg[4];
+	int ret;
+
+	if (!peci_sensor_need_update(&priv->temp.core[core_index]))
+		return 0;
+
+	ret = peci_client_read_package_config(priv->mgr,
+					      PECI_MBX_INDEX_PER_CORE_DTS_TEMP,
+					      core_index, pkg_cfg);
+	if (ret)
+		return ret;
+
+	core_dts_margin = le16_to_cpup((__le16 *)pkg_cfg);
+
+	/*
+	 * Processors return a value of the core DTS reading in 10.6 format
+	 * (10 bits signed decimal, 6 bits fractional).
+	 * Error codes:
+	 *   0x8000: General sensor error
+	 *   0x8001: Reserved
+	 *   0x8002: Underflow on reading value
+	 *   0x8003-0x81ff: Reserved
+	 */
+	if (core_dts_margin >= 0x8000 && core_dts_margin <= 0x81ff)
+		return -EIO;
+
+	core_dts_margin = ten_dot_six_to_millidegree(core_dts_margin);
+
+	/* Note that the tjmax should be available before calling it */
+	priv->temp.core[core_index].value = priv->temp.tjmax.value +
+					    core_dts_margin;
+
+	peci_sensor_mark_updated(&priv->temp.core[core_index]);
+
+	return 0;
+}
+
+static int cputemp_read_string(struct device *dev,
+			       enum hwmon_sensor_types type,
+			       u32 attr, int channel, const char **str)
+{
+	if (attr != hwmon_temp_label)
+		return -EOPNOTSUPP;
+
+	*str = cputemp_label[channel];
+
+	return 0;
+}
+
+static int cputemp_read(struct device *dev,
+			enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
+{
+	struct peci_cputemp *priv = dev_get_drvdata(dev);
+	int ret, core_index;
+
+	if (channel >= CPUTEMP_CHANNEL_NUMS ||
+	    !(priv->temp_config[channel] & BIT(attr)))
+		return -EOPNOTSUPP;
+
+	ret = get_temp_targets(priv);
+	if (ret)
+		return ret;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		switch (channel) {
+		case channel_die:
+			ret = get_die_temp(priv);
+			if (ret)
+				break;
+
+			*val = priv->temp.die.value;
+			break;
+		case channel_dts:
+			ret = get_dts(priv);
+			if (ret)
+				break;
+
+			*val = priv->temp.dts.value;
+			break;
+		case channel_tcontrol:
+			*val = priv->temp.tcontrol.value;
+			break;
+		case channel_tthrottle:
+			*val = priv->temp.tthrottle.value;
+			break;
+		case channel_tjmax:
+			*val = priv->temp.tjmax.value;
+			break;
+		default:
+			core_index = channel - DEFAULT_CHANNEL_NUMS;
+			ret = get_core_temp(priv, core_index);
+			if (ret)
+				break;
+
+			*val = priv->temp.core[core_index].value;
+			break;
+		}
+		break;
+	case hwmon_temp_max:
+		*val = priv->temp.tcontrol.value;
+		break;
+	case hwmon_temp_crit:
+		*val = priv->temp.tjmax.value;
+		break;
+	case hwmon_temp_crit_hyst:
+		*val = priv->temp.tjmax.value - priv->temp.tcontrol.value;
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+
+	return ret;
+}
+
+static umode_t cputemp_is_visible(const void *data,
+				  enum hwmon_sensor_types type,
+				  u32 attr, int channel)
+{
+	const struct peci_cputemp *priv = data;
+
+	if (channel < ARRAY_SIZE(priv->temp_config) &&
+	    (priv->temp_config[channel] & BIT(attr)) &&
+	    (channel < DEFAULT_CHANNEL_NUMS ||
+	     (channel >= DEFAULT_CHANNEL_NUMS &&
+	      (priv->core_mask & BIT(channel - DEFAULT_CHANNEL_NUMS)))))
+		return 0444;
+
+	return 0;
+}
+
+static const struct hwmon_ops cputemp_ops = {
+	.is_visible = cputemp_is_visible,
+	.read_string = cputemp_read_string,
+	.read = cputemp_read,
+};
+
+static int check_resolved_cores(struct peci_cputemp *priv)
+{
+	struct peci_rd_pci_cfg_local_msg msg;
+	int ret;
+
+	/* Get the RESOLVED_CORES register value */
+	msg.addr = priv->mgr->client->addr;
+	msg.device = 30;
+	msg.function = 3;
+	msg.rx_len = 4;
+	msg.bus = 1;
+	msg.reg = 0xb4;
+
+	ret = peci_command(priv->mgr->client->adapter,
+			   PECI_CMD_RD_PCI_CFG_LOCAL, &msg);
+	if (msg.cc != PECI_DEV_CC_SUCCESS)
+		ret = -EAGAIN;
+	if (ret)
+		return ret;
+
+	priv->core_mask = le32_to_cpup((__le32 *)msg.pci_config);
+	if (!priv->core_mask)
+		return -EAGAIN;
+
+	dev_dbg(priv->dev, "Scanned resolved cores: 0x%llx\n", priv->core_mask);
+
+	return 0;
+}
+
+static int create_core_temp_info(struct peci_cputemp *priv)
+{
+	int ret, i;
+
+	ret = check_resolved_cores(priv);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < priv->gen_info->core_max; i++)
+		if (priv->core_mask & BIT(i))
+			while (priv->config_idx <= i + DEFAULT_CHANNEL_NUMS)
+				priv->temp_config[priv->config_idx++] =
+					config_table[channel_core];
+
+	return 0;
+}
+
+static int peci_cputemp_probe(struct platform_device *pdev)
+{
+	struct peci_client_manager *mgr = dev_get_drvdata(pdev->dev.parent);
+	struct device *dev = &pdev->dev;
+	struct peci_cputemp *priv;
+	struct device *hwmon_dev;
+	int ret;
+
+	if ((mgr->client->adapter->cmd_mask &
+	    (BIT(PECI_CMD_GET_TEMP) | BIT(PECI_CMD_RD_PKG_CFG))) !=
+	    (BIT(PECI_CMD_GET_TEMP) | BIT(PECI_CMD_RD_PKG_CFG)))
+		return -ENODEV;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, priv);
+	priv->mgr = mgr;
+	priv->dev = dev;
+	priv->gen_info = mgr->gen_info;
+
+	snprintf(priv->name, PECI_NAME_SIZE, "peci_cputemp.cpu%d",
+		 mgr->client->addr - PECI_BASE_ADDR);
+
+	priv->temp_config[priv->config_idx++] = config_table[channel_die];
+	priv->temp_config[priv->config_idx++] = config_table[channel_dts];
+	priv->temp_config[priv->config_idx++] = config_table[channel_tcontrol];
+	priv->temp_config[priv->config_idx++] = config_table[channel_tthrottle];
+	priv->temp_config[priv->config_idx++] = config_table[channel_tjmax];
+
+	ret = create_core_temp_info(priv);
+	if (ret)
+		dev_dbg(dev, "Skipped creating core temp info\n");
+
+	priv->chip.ops = &cputemp_ops;
+	priv->chip.info = priv->info;
+
+	priv->info[0] = &priv->temp_info;
+
+	priv->temp_info.type = hwmon_temp;
+	priv->temp_info.config = priv->temp_config;
+
+	hwmon_dev = devm_hwmon_device_register_with_info(priv->dev,
+							 priv->name,
+							 priv,
+							 &priv->chip,
+							 NULL);
+
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
+
+	dev_dbg(dev, "%s: sensor '%s'\n", dev_name(hwmon_dev), priv->name);
+
+	return 0;
+}
+
+static const struct platform_device_id peci_cputemp_ids[] = {
+	{ .name = "peci-cputemp", .driver_data = 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, peci_cputemp_ids);
+
+static struct platform_driver peci_cputemp_driver = {
+	.probe    = peci_cputemp_probe,
+	.id_table = peci_cputemp_ids,
+	.driver   = { .name = KBUILD_MODNAME, },
+};
+module_platform_driver(peci_cputemp_driver);
+
+MODULE_AUTHOR("Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>");
+MODULE_DESCRIPTION("PECI cputemp driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/hwmon/peci-hwmon.h b/drivers/hwmon/peci-hwmon.h
new file mode 100644
index 000000000000..e0e3c901c6e4
--- /dev/null
+++ b/drivers/hwmon/peci-hwmon.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2018-2019 Intel Corporation */
+
+#ifndef __PECI_HWMON_H
+#define __PECI_HWMON_H
+
+#include <linux/peci.h>
+
+#define TEMP_TYPE_PECI   6 /* Sensor type 6: Intel PECI */
+#define UPDATE_INTERVAL  HZ
+
+/**
+ * struct peci_sensor_data - PECI sensor information
+ * @valid: flag to indicate the sensor value is valid
+ * @value: sensor value in millidegree Celsius
+ * @last_updated: time of the last update in jiffies
+ */
+struct peci_sensor_data {
+	uint  valid;
+	s32   value;
+	ulong last_updated;
+};
+
+/**
+ * peci_sensor_need_update - check whether sensor update is needed or not
+ * @sensor: pointer to sensor data struct
+ *
+ * Return: true if update is needed, false if not.
+ */
+static inline bool peci_sensor_need_update(struct peci_sensor_data *sensor)
+{
+	return !sensor->valid ||
+	       time_after(jiffies, sensor->last_updated + UPDATE_INTERVAL);
+}
+
+/**
+ * peci_sensor_mark_updated - mark the sensor is updated
+ * @sensor: pointer to sensor data struct
+ */
+static inline void peci_sensor_mark_updated(struct peci_sensor_data *sensor)
+{
+	sensor->valid = 1;
+	sensor->last_updated = jiffies;
+}
+
+#endif /* __PECI_HWMON_H */
-- 
2.17.1

