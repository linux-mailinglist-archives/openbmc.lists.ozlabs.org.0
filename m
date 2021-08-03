Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0C03DF8DE
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 02:20:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfXT50fK8z3dF0
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 10:20:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfCY72xxYz2yNp;
 Tue,  3 Aug 2021 21:38:03 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10064"; a="211791940"
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; d="scan'208";a="211791940"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 04:37:12 -0700
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; d="scan'208";a="441135626"
Received: from jdanieck-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.128.99])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 04:37:05 -0700
From: Iwona Winiarska <iwona.winiarska@intel.com>
To: linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 12/15] hwmon: peci: Add cputemp driver
Date: Tue,  3 Aug 2021 13:31:31 +0200
Message-Id: <20210803113134.2262882-13-iwona.winiarska@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210803113134.2262882-1-iwona.winiarska@intel.com>
References: <20210803113134.2262882-1-iwona.winiarska@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 04 Aug 2021 10:16:27 +1000
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
Cc: linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Zev Weiss <zweiss@equinix.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Iwona Winiarska <iwona.winiarska@intel.com>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Randy Dunlap <rdunlap@infradead.org>, Yazen Ghannam <yazen.ghannam@amd.com>,
 Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add peci-cputemp driver for Digital Thermal Sensor (DTS) thermal
readings of the processor package and processor cores that are
accessible via the PECI interface.

The main use case for the driver (and PECI interface) is out-of-band
management, where we're able to obtain the DTS readings from an external
entity connected with PECI, e.g. BMC on server platforms.

Co-developed-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 MAINTAINERS                  |   7 +
 drivers/hwmon/Kconfig        |   2 +
 drivers/hwmon/Makefile       |   1 +
 drivers/hwmon/peci/Kconfig   |  18 ++
 drivers/hwmon/peci/Makefile  |   5 +
 drivers/hwmon/peci/common.h  |  58 ++++
 drivers/hwmon/peci/cputemp.c | 591 +++++++++++++++++++++++++++++++++++
 7 files changed, 682 insertions(+)
 create mode 100644 drivers/hwmon/peci/Kconfig
 create mode 100644 drivers/hwmon/peci/Makefile
 create mode 100644 drivers/hwmon/peci/common.h
 create mode 100644 drivers/hwmon/peci/cputemp.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3f5d48e1d143..e36b5c0824e3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14512,6 +14512,13 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/peaq-wmi.c
 
+PECI HARDWARE MONITORING DRIVERS
+M:	Iwona Winiarska <iwona.winiarska@intel.com>
+R:	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Supported
+F:	drivers/hwmon/peci/
+
 PECI SUBSYSTEM
 M:	Iwona Winiarska <iwona.winiarska@intel.com>
 R:	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index e3675377bc5d..61c0e3404415 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1507,6 +1507,8 @@ config SENSORS_PCF8591
 	  These devices are hard to detect and rarely found on mainstream
 	  hardware. If unsure, say N.
 
+source "drivers/hwmon/peci/Kconfig"
+
 source "drivers/hwmon/pmbus/Kconfig"
 
 config SENSORS_PWM_FAN
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index d712c61c1f5e..f52331f212ed 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -202,6 +202,7 @@ obj-$(CONFIG_SENSORS_WM8350)	+= wm8350-hwmon.o
 obj-$(CONFIG_SENSORS_XGENE)	+= xgene-hwmon.o
 
 obj-$(CONFIG_SENSORS_OCC)	+= occ/
+obj-$(CONFIG_SENSORS_PECI)	+= peci/
 obj-$(CONFIG_PMBUS)		+= pmbus/
 
 ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG
diff --git a/drivers/hwmon/peci/Kconfig b/drivers/hwmon/peci/Kconfig
new file mode 100644
index 000000000000..e10eed68d70a
--- /dev/null
+++ b/drivers/hwmon/peci/Kconfig
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config SENSORS_PECI_CPUTEMP
+	tristate "PECI CPU temperature monitoring client"
+	depends on PECI
+	select SENSORS_PECI
+	select PECI_CPU
+	help
+	  If you say yes here you get support for the generic Intel PECI
+	  cputemp driver which provides Digital Thermal Sensor (DTS) thermal
+	  readings of the CPU package and CPU cores that are accessible via
+	  the processor PECI interface.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called peci-cputemp.
+
+config SENSORS_PECI
+	tristate
diff --git a/drivers/hwmon/peci/Makefile b/drivers/hwmon/peci/Makefile
new file mode 100644
index 000000000000..e8a0ada5ab1f
--- /dev/null
+++ b/drivers/hwmon/peci/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+peci-cputemp-y := cputemp.o
+
+obj-$(CONFIG_SENSORS_PECI_CPUTEMP)	+= peci-cputemp.o
diff --git a/drivers/hwmon/peci/common.h b/drivers/hwmon/peci/common.h
new file mode 100644
index 000000000000..734506b0eca2
--- /dev/null
+++ b/drivers/hwmon/peci/common.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (c) 2021 Intel Corporation */
+
+#include <linux/mutex.h>
+#include <linux/types.h>
+
+#ifndef __PECI_HWMON_COMMON_H
+#define __PECI_HWMON_COMMON_H
+
+#define PECI_HWMON_UPDATE_INTERVAL	HZ
+
+/**
+ * struct peci_sensor_state - PECI state information
+ * @valid: flag to indicate the sensor value is valid
+ * @last_updated: time of the last update in jiffies
+ * @lock: mutex to protect sensor access
+ */
+struct peci_sensor_state {
+	bool valid;
+	unsigned long last_updated;
+	struct mutex lock; /* protect sensor access */
+};
+
+/**
+ * struct peci_sensor_data - PECI sensor information
+ * @value: sensor value in milli units
+ * @state: sensor update state
+ */
+
+struct peci_sensor_data {
+	s32 value;
+	struct peci_sensor_state state;
+};
+
+/**
+ * peci_sensor_need_update() - check whether sensor update is needed or not
+ * @sensor: pointer to sensor data struct
+ *
+ * Return: true if update is needed, false if not.
+ */
+
+static inline bool peci_sensor_need_update(struct peci_sensor_state *state)
+{
+	return !state->valid ||
+	       time_after(jiffies, state->last_updated + PECI_HWMON_UPDATE_INTERVAL);
+}
+
+/**
+ * peci_sensor_mark_updated() - mark the sensor is updated
+ * @sensor: pointer to sensor data struct
+ */
+static inline void peci_sensor_mark_updated(struct peci_sensor_state *state)
+{
+	state->valid = true;
+	state->last_updated = jiffies;
+}
+
+#endif /* __PECI_HWMON_COMMON_H */
diff --git a/drivers/hwmon/peci/cputemp.c b/drivers/hwmon/peci/cputemp.c
new file mode 100644
index 000000000000..9c6858a9fb6d
--- /dev/null
+++ b/drivers/hwmon/peci/cputemp.c
@@ -0,0 +1,591 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2018-2021 Intel Corporation
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/hwmon.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/peci.h>
+#include <linux/peci-cpu.h>
+#include <linux/units.h>
+#include <linux/x86/intel-family.h>
+
+#include "common.h"
+
+#define CORE_NUMS_MAX		64
+
+#define BASE_CHANNEL_NUMS	5
+#define CPUTEMP_CHANNEL_NUMS	(BASE_CHANNEL_NUMS + CORE_NUMS_MAX)
+
+#define TEMP_TARGET_FAN_TEMP_MASK	GENMASK(15, 8)
+#define TEMP_TARGET_REF_TEMP_MASK	GENMASK(23, 16)
+#define TEMP_TARGET_TJ_OFFSET_MASK	GENMASK(29, 24)
+
+#define DTS_MARGIN_MASK		GENMASK(15, 0)
+#define PCS_MODULE_TEMP_MASK	GENMASK(15, 0)
+
+#define DTS_FIXED_POINT_FRACTION	64
+
+struct resolved_cores_reg {
+	u8 bus;
+	u8 dev;
+	u8 func;
+	u8 offset;
+};
+
+struct cpu_info {
+	struct resolved_cores_reg *reg;
+	u8 min_peci_revision;
+};
+
+struct peci_temp_target {
+	s32 tcontrol;
+	s32 tthrottle;
+	s32 tjmax;
+	struct peci_sensor_state state;
+};
+
+enum peci_temp_target_type {
+	tcontrol_type,
+	tthrottle_type,
+	tjmax_type,
+	crit_hyst_type,
+};
+
+struct peci_cputemp {
+	struct peci_device *peci_dev;
+	struct device *dev;
+	const char *name;
+	const struct cpu_info *gen_info;
+	struct {
+		struct peci_temp_target target;
+		struct peci_sensor_data die;
+		struct peci_sensor_data dts;
+		struct peci_sensor_data core[CORE_NUMS_MAX];
+	} temp;
+	const char **coretemp_label;
+	DECLARE_BITMAP(core_mask, CORE_NUMS_MAX);
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
+static const char * const cputemp_label[BASE_CHANNEL_NUMS] = {
+	"Die",
+	"DTS",
+	"Tcontrol",
+	"Tthrottle",
+	"Tjmax",
+};
+
+static int update_temp_target(struct peci_cputemp *priv)
+{
+	s32 tthrottle_offset, tcontrol_margin;
+	u32 pcs;
+	int ret;
+
+	if (!peci_sensor_need_update(&priv->temp.target.state))
+		return 0;
+
+	ret = peci_pcs_read(priv->peci_dev, PECI_PCS_TEMP_TARGET, 0, &pcs);
+	if (ret)
+		return ret;
+
+	priv->temp.target.tjmax =
+		FIELD_GET(TEMP_TARGET_REF_TEMP_MASK, pcs) * MILLIDEGREE_PER_DEGREE;
+
+	tcontrol_margin = FIELD_GET(TEMP_TARGET_FAN_TEMP_MASK, pcs);
+	tcontrol_margin = sign_extend32(tcontrol_margin, 7) * MILLIDEGREE_PER_DEGREE;
+	priv->temp.target.tcontrol = priv->temp.target.tjmax - tcontrol_margin;
+
+	tthrottle_offset = FIELD_GET(TEMP_TARGET_TJ_OFFSET_MASK, pcs) * MILLIDEGREE_PER_DEGREE;
+	priv->temp.target.tthrottle = priv->temp.target.tjmax - tthrottle_offset;
+
+	peci_sensor_mark_updated(&priv->temp.target.state);
+
+	return 0;
+}
+
+static int get_temp_target(struct peci_cputemp *priv, enum peci_temp_target_type type, long *val)
+{
+	int ret;
+
+	mutex_lock(&priv->temp.target.state.lock);
+
+	ret = update_temp_target(priv);
+	if (ret)
+		goto unlock;
+
+	switch (type) {
+	case tcontrol_type:
+		*val = priv->temp.target.tcontrol;
+		break;
+	case tthrottle_type:
+		*val = priv->temp.target.tthrottle;
+		break;
+	case tjmax_type:
+		*val = priv->temp.target.tjmax;
+		break;
+	case crit_hyst_type:
+		*val = priv->temp.target.tjmax - priv->temp.target.tcontrol;
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+unlock:
+	mutex_unlock(&priv->temp.target.state.lock);
+
+	return ret;
+}
+
+/*
+ * Processors return a value of DTS reading in S10.6 fixed point format
+ * (16 bits: 10-bit signed magnitude, 6-bit fraction).
+ * Error codes:
+ *   0x8000: General sensor error
+ *   0x8001: Reserved
+ *   0x8002: Underflow on reading value
+ *   0x8003-0x81ff: Reserved
+ */
+static bool dts_valid(s32 val)
+{
+	return val < 0x8000 || val > 0x81ff;
+}
+
+static s32 dts_to_millidegree(s32 val)
+{
+	return sign_extend32(val, 15) * MILLIDEGREE_PER_DEGREE / DTS_FIXED_POINT_FRACTION;
+}
+
+static int get_die_temp(struct peci_cputemp *priv, long *val)
+{
+	long tjmax;
+	s16 temp;
+	int ret;
+
+	mutex_lock(&priv->temp.die.state.lock);
+	if (!peci_sensor_need_update(&priv->temp.die.state))
+		goto skip_update;
+
+	ret = peci_temp_read(priv->peci_dev, &temp);
+	if (ret)
+		goto err_unlock;
+
+	if (!dts_valid(temp)) {
+		ret = -EIO;
+		goto err_unlock;
+	}
+
+	ret = get_temp_target(priv, tjmax_type, &tjmax);
+	if (ret)
+		goto err_unlock;
+
+	priv->temp.die.value = (s32)tjmax + dts_to_millidegree(temp);
+
+	peci_sensor_mark_updated(&priv->temp.die.state);
+
+skip_update:
+	*val = priv->temp.die.value;
+	mutex_unlock(&priv->temp.die.state.lock);
+
+	return 0;
+
+err_unlock:
+	mutex_unlock(&priv->temp.die.state.lock);
+	return ret;
+}
+
+static int get_dts(struct peci_cputemp *priv, long *val)
+{
+	s32 dts_margin;
+	long tcontrol;
+	u32 pcs;
+	int ret;
+
+	mutex_lock(&priv->temp.dts.state.lock);
+	if (!peci_sensor_need_update(&priv->temp.dts.state))
+		goto skip_update;
+
+	ret = peci_pcs_read(priv->peci_dev, PECI_PCS_THERMAL_MARGIN, 0, &pcs);
+	if (ret)
+		goto err_unlock;
+
+	dts_margin = FIELD_GET(DTS_MARGIN_MASK, pcs);
+	if (!dts_valid(dts_margin)) {
+		ret = -EIO;
+		goto err_unlock;
+	}
+
+	ret = get_temp_target(priv, tcontrol_type, &tcontrol);
+	if (ret)
+		goto err_unlock;
+
+	/* Note that the tcontrol should be available before calling it */
+	priv->temp.dts.value = (s32)tcontrol - dts_to_millidegree(dts_margin);
+
+	peci_sensor_mark_updated(&priv->temp.dts.state);
+
+skip_update:
+	*val = priv->temp.dts.value;
+	mutex_unlock(&priv->temp.dts.state.lock);
+
+	return 0;
+
+err_unlock:
+	mutex_unlock(&priv->temp.dts.state.lock);
+	return ret;
+}
+
+static int get_core_temp(struct peci_cputemp *priv, int core_index, long *val)
+{
+	s32 core_dts_margin;
+	long tjmax;
+	u32 pcs;
+	int ret;
+
+	mutex_lock(&priv->temp.core[core_index].state.lock);
+	if (!peci_sensor_need_update(&priv->temp.core[core_index].state))
+		goto skip_update;
+
+	ret = peci_pcs_read(priv->peci_dev, PECI_PCS_MODULE_TEMP, core_index, &pcs);
+	if (ret)
+		goto err_unlock;
+
+	core_dts_margin = FIELD_GET(PCS_MODULE_TEMP_MASK, pcs);
+	if (!dts_valid(core_dts_margin)) {
+		ret = -EIO;
+		goto err_unlock;
+	}
+
+	ret = get_temp_target(priv, tjmax_type, &tjmax);
+	if (ret)
+		goto err_unlock;
+
+	/* Note that the tjmax should be available before calling it */
+	priv->temp.core[core_index].value = (s32)tjmax + dts_to_millidegree(core_dts_margin);
+
+	peci_sensor_mark_updated(&priv->temp.core[core_index].state);
+
+skip_update:
+	*val = priv->temp.core[core_index].value;
+	mutex_unlock(&priv->temp.core[core_index].state.lock);
+
+	return 0;
+
+err_unlock:
+	mutex_unlock(&priv->temp.core[core_index].state.lock);
+	return ret;
+}
+
+static int cputemp_read_string(struct device *dev, enum hwmon_sensor_types type,
+			       u32 attr, int channel, const char **str)
+{
+	struct peci_cputemp *priv = dev_get_drvdata(dev);
+
+	if (attr != hwmon_temp_label)
+		return -EOPNOTSUPP;
+
+	*str = channel < channel_core ?
+		cputemp_label[channel] : priv->coretemp_label[channel - channel_core];
+
+	return 0;
+}
+
+static int cputemp_read(struct device *dev, enum hwmon_sensor_types type,
+			u32 attr, int channel, long *val)
+{
+	struct peci_cputemp *priv = dev_get_drvdata(dev);
+
+	switch (attr) {
+	case hwmon_temp_input:
+		switch (channel) {
+		case channel_die:
+			return get_die_temp(priv, val);
+		case channel_dts:
+			return get_dts(priv, val);
+		case channel_tcontrol:
+			return get_temp_target(priv, tcontrol_type, val);
+		case channel_tthrottle:
+			return get_temp_target(priv, tthrottle_type, val);
+		case channel_tjmax:
+			return get_temp_target(priv, tjmax_type, val);
+		default:
+			return get_core_temp(priv, channel - channel_core, val);
+		}
+		break;
+	case hwmon_temp_max:
+		return get_temp_target(priv, tcontrol_type, val);
+	case hwmon_temp_crit:
+		return get_temp_target(priv, tjmax_type, val);
+	case hwmon_temp_crit_hyst:
+		return get_temp_target(priv, crit_hyst_type, val);
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static umode_t cputemp_is_visible(const void *data, enum hwmon_sensor_types type,
+				  u32 attr, int channel)
+{
+	const struct peci_cputemp *priv = data;
+
+	if (channel > CPUTEMP_CHANNEL_NUMS)
+		return 0;
+
+	if (channel < channel_core)
+		return 0444;
+
+	if (test_bit(channel - channel_core, priv->core_mask))
+		return 0444;
+
+	return 0;
+}
+
+static int init_core_mask(struct peci_cputemp *priv)
+{
+	struct peci_device *peci_dev = priv->peci_dev;
+	struct resolved_cores_reg *reg = priv->gen_info->reg;
+	u64 core_mask;
+	u32 data;
+	int ret;
+
+	/* Get the RESOLVED_CORES register value */
+	switch (peci_dev->info.model) {
+	case INTEL_FAM6_ICELAKE_X:
+	case INTEL_FAM6_ICELAKE_D:
+		ret = peci_ep_pci_local_read(peci_dev, 0, reg->bus, reg->dev,
+					     reg->func, reg->offset + 4, &data);
+		if (ret)
+			return ret;
+
+		core_mask = (u64)data << 32;
+
+		ret = peci_ep_pci_local_read(peci_dev, 0, reg->bus, reg->dev,
+					     reg->func, reg->offset, &data);
+		if (ret)
+			return ret;
+
+		core_mask |= data;
+
+		break;
+	default:
+		ret = peci_pci_local_read(peci_dev, reg->bus, reg->dev,
+					  reg->func, reg->offset, &data);
+		if (ret)
+			return ret;
+
+		core_mask = data;
+
+		break;
+	}
+
+	if (!core_mask)
+		return -EIO;
+
+	bitmap_from_u64(priv->core_mask, core_mask);
+
+	return 0;
+}
+
+static int create_temp_label(struct peci_cputemp *priv)
+{
+	unsigned long core_max = find_last_bit(priv->core_mask, CORE_NUMS_MAX);
+	int i;
+
+	priv->coretemp_label = devm_kzalloc(priv->dev, core_max * sizeof(char *), GFP_KERNEL);
+	if (!priv->coretemp_label)
+		return -ENOMEM;
+
+	for_each_set_bit(i, priv->core_mask, CORE_NUMS_MAX) {
+		priv->coretemp_label[i] = devm_kasprintf(priv->dev, GFP_KERNEL, "Core %d", i);
+		if (!priv->coretemp_label[i])
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static void check_resolved_cores(struct peci_cputemp *priv)
+{
+	/*
+	 * Failure to resolve cores is non-critical, we're still able to
+	 * provide other sensor data.
+	 */
+
+	if (init_core_mask(priv))
+		return;
+
+	if (create_temp_label(priv))
+		bitmap_zero(priv->core_mask, CORE_NUMS_MAX);
+}
+
+static void sensor_init(struct peci_cputemp *priv)
+{
+	int i;
+
+	mutex_init(&priv->temp.target.state.lock);
+	mutex_init(&priv->temp.die.state.lock);
+	mutex_init(&priv->temp.dts.state.lock);
+
+	for_each_set_bit(i, priv->core_mask, CORE_NUMS_MAX)
+		mutex_init(&priv->temp.core[i].state.lock);
+}
+
+static const struct hwmon_ops peci_cputemp_ops = {
+	.is_visible = cputemp_is_visible,
+	.read_string = cputemp_read_string,
+	.read = cputemp_read,
+};
+
+static const u32 peci_cputemp_temp_channel_config[] = {
+	/* Die temperature */
+	HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT | HWMON_T_CRIT_HYST,
+	/* DTS margin */
+	HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT | HWMON_T_CRIT_HYST,
+	/* Tcontrol temperature */
+	HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_CRIT,
+	/* Tthrottle temperature */
+	HWMON_T_LABEL | HWMON_T_INPUT,
+	/* Tjmax temperature */
+	HWMON_T_LABEL | HWMON_T_INPUT,
+	/* Core temperature - for all core channels */
+	[channel_core ... CPUTEMP_CHANNEL_NUMS - 1] = HWMON_T_LABEL | HWMON_T_INPUT,
+	0
+};
+
+static const struct hwmon_channel_info peci_cputemp_temp_channel = {
+	.type = hwmon_temp,
+	.config = peci_cputemp_temp_channel_config,
+};
+
+static const struct hwmon_channel_info *peci_cputemp_info[] = {
+	&peci_cputemp_temp_channel,
+	NULL
+};
+
+static const struct hwmon_chip_info peci_cputemp_chip_info = {
+	.ops = &peci_cputemp_ops,
+	.info = peci_cputemp_info,
+};
+
+static int peci_cputemp_probe(struct auxiliary_device *adev,
+			      const struct auxiliary_device_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct peci_device *peci_dev = to_peci_device(dev->parent);
+	struct peci_cputemp *priv;
+	struct device *hwmon_dev;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->name = devm_kasprintf(dev, GFP_KERNEL, "peci_cputemp.cpu%d",
+				    peci_dev->info.socket_id);
+	if (!priv->name)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	priv->peci_dev = peci_dev;
+	priv->gen_info = (const struct cpu_info *)id->driver_data;
+
+	/*
+	 * This is just a sanity check. Since we're using commands that are
+	 * guaranteed to be supported on a given platform, we should never see
+	 * revision lower than expected.
+	 */
+	if (peci_dev->info.peci_revision < priv->gen_info->min_peci_revision)
+		dev_warn(priv->dev,
+			 "Unexpected PECI revision %#x, some features may be unavailable\n",
+			 peci_dev->info.peci_revision);
+
+	check_resolved_cores(priv);
+
+	sensor_init(priv);
+
+	hwmon_dev = devm_hwmon_device_register_with_info(priv->dev, priv->name,
+							 priv, &peci_cputemp_chip_info, NULL);
+
+	return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+/*
+ * RESOLVED_CORES PCI configuration register may have different location on
+ * different platforms.
+ */
+static struct resolved_cores_reg resolved_cores_reg_hsx = {
+	.bus = 1,
+	.dev = 30,
+	.func = 3,
+	.offset = 0xb4,
+};
+
+static struct resolved_cores_reg resolved_cores_reg_icx = {
+	.bus = 14,
+	.dev = 30,
+	.func = 3,
+	.offset = 0xd0,
+};
+
+static const struct cpu_info cpu_hsx = {
+	.reg		= &resolved_cores_reg_hsx,
+	.min_peci_revision = 0x33,
+};
+
+static const struct cpu_info cpu_icx = {
+	.reg		= &resolved_cores_reg_icx,
+	.min_peci_revision = 0x40,
+};
+
+static const struct auxiliary_device_id peci_cputemp_ids[] = {
+	{
+		.name = "peci_cpu.cputemp.hsx",
+		.driver_data = (kernel_ulong_t)&cpu_hsx,
+	},
+	{
+		.name = "peci_cpu.cputemp.bdx",
+		.driver_data = (kernel_ulong_t)&cpu_hsx,
+	},
+	{
+		.name = "peci_cpu.cputemp.bdxd",
+		.driver_data = (kernel_ulong_t)&cpu_hsx,
+	},
+	{
+		.name = "peci_cpu.cputemp.skx",
+		.driver_data = (kernel_ulong_t)&cpu_hsx,
+	},
+	{
+		.name = "peci_cpu.cputemp.icx",
+		.driver_data = (kernel_ulong_t)&cpu_icx,
+	},
+	{
+		.name = "peci_cpu.cputemp.icxd",
+		.driver_data = (kernel_ulong_t)&cpu_icx,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(auxiliary, peci_cputemp_ids);
+
+static struct auxiliary_driver peci_cputemp_driver = {
+	.probe		= peci_cputemp_probe,
+	.id_table	= peci_cputemp_ids,
+};
+
+module_auxiliary_driver(peci_cputemp_driver);
+
+MODULE_AUTHOR("Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>");
+MODULE_AUTHOR("Iwona Winiarska <iwona.winiarska@intel.com>");
+MODULE_DESCRIPTION("PECI cputemp driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PECI_CPU);
-- 
2.31.1

