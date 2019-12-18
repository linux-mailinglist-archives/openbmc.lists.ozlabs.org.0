Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BBF123CA1
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 02:45:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cyWH1CcjzDqXZ
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 12:45:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cy7p5JSqzDqSM
 for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2019 12:28:22 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 17:28:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,327,1571727600"; d="scan'208";a="390019055"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO ubuntu.jf.intel.com)
 ([10.7.153.147])
 by orsmga005.jf.intel.com with ESMTP; 17 Dec 2019 17:28:21 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org
Subject: [PATCH dev-5.4 14/14] hwmon: Add PECI dimmtemp driver
Date: Tue, 17 Dec 2019 17:28:08 -0800
Message-Id: <20191218012808.6482-15-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218012808.6482-1-jae.hyun.yoo@linux.intel.com>
References: <20191218012808.6482-1-jae.hyun.yoo@linux.intel.com>
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This commit adds PECI dimmtemp hwmon driver.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Reviewed-by: Haiyue Wang <haiyue.wang@linux.intel.com>
Reviewed-by: James Feist <james.feist@linux.intel.com>
Reviewed-by: Vernon Mauery <vernon.mauery@linux.intel.com>
---
Changes since v11:
- Added supported CPU model checking into probe.
- Replaced DIMM temperature label table with dynamic table.
- Fixed style issues.

Changes since v10:
- Added Skylake Xeon D support.
- Added max and crit properties for temperature threshold checking.
- Fixed minor bugs and style issues.

 drivers/hwmon/Kconfig         |  14 ++
 drivers/hwmon/Makefile        |   1 +
 drivers/hwmon/peci-dimmtemp.c | 425 ++++++++++++++++++++++++++++++++++
 3 files changed, 440 insertions(+)
 create mode 100644 drivers/hwmon/peci-dimmtemp.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index d1422d9b8055..e244a7901392 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1336,6 +1336,20 @@ config SENSORS_PECI_CPUTEMP
 	  This driver can also be built as a module. If so, the module
 	  will be called peci-cputemp.
 
+config SENSORS_PECI_DIMMTEMP
+	tristate "PECI DIMM temperature monitoring client"
+	depends on PECI
+	select MFD_INTEL_PECI_CLIENT
+	help
+	  If you say yes here you get support for the generic Intel PECI hwmon
+	  driver which provides Digital Thermal Sensor (DTS) thermal readings of
+	  DIMM components that are accessible using the PECI Client Command
+	  Suite via the processor PECI client.
+	  Check <file:Documentation/hwmon/peci-dimmtemp.rst> for details.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called peci-dimmtemp.
+
 source "drivers/hwmon/pmbus/Kconfig"
 
 config SENSORS_PWM_FAN
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index bab572e5bac0..1c7ab361adc7 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -142,6 +142,7 @@ obj-$(CONFIG_SENSORS_PC87360)	+= pc87360.o
 obj-$(CONFIG_SENSORS_PC87427)	+= pc87427.o
 obj-$(CONFIG_SENSORS_PCF8591)	+= pcf8591.o
 obj-$(CONFIG_SENSORS_PECI_CPUTEMP)	+= peci-cputemp.o
+obj-$(CONFIG_SENSORS_PECI_DIMMTEMP)	+= peci-dimmtemp.o
 obj-$(CONFIG_SENSORS_POWR1220)  += powr1220.o
 obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
 obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
diff --git a/drivers/hwmon/peci-dimmtemp.c b/drivers/hwmon/peci-dimmtemp.c
new file mode 100644
index 000000000000..c758cac3c777
--- /dev/null
+++ b/drivers/hwmon/peci-dimmtemp.c
@@ -0,0 +1,425 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2018-2019 Intel Corporation
+
+#include <linux/hwmon.h>
+#include <linux/jiffies.h>
+#include <linux/mfd/intel-peci-client.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/workqueue.h>
+#include "peci-hwmon.h"
+
+#define DIMM_MASK_CHECK_DELAY_JIFFIES	msecs_to_jiffies(5000)
+#define DIMM_MASK_CHECK_RETRY_MAX	60 /* 60 x 5 secs = 5 minutes */
+
+struct peci_dimmtemp {
+	struct peci_client_manager	*mgr;
+	struct device			*dev;
+	char				name[PECI_NAME_SIZE];
+	const struct cpu_gen_info	*gen_info;
+	struct workqueue_struct		*work_queue;
+	struct delayed_work		work_handler;
+	struct peci_sensor_data		temp[DIMM_NUMS_MAX];
+	long				temp_max[DIMM_NUMS_MAX];
+	long				temp_crit[DIMM_NUMS_MAX];
+	u32				dimm_mask;
+	int				retry_count;
+	u32				temp_config[DIMM_NUMS_MAX + 1];
+	struct hwmon_channel_info	temp_info;
+	const struct hwmon_channel_info	*info[2];
+	struct hwmon_chip_info		chip;
+	char				**dimmtemp_label;
+};
+
+static const u8 support_model[] = {
+	INTEL_FAM6_HASWELL_X,
+	INTEL_FAM6_BROADWELL_X,
+	INTEL_FAM6_SKYLAKE_X,
+	INTEL_FAM6_SKYLAKE_XD,
+};
+
+static inline int read_ddr_dimm_temp_config(struct peci_dimmtemp *priv,
+					    int chan_rank,
+					    u8 *cfg_data)
+{
+	return peci_client_read_package_config(priv->mgr,
+					       PECI_MBX_INDEX_DDR_DIMM_TEMP,
+					       chan_rank, cfg_data);
+}
+
+static int get_dimm_temp(struct peci_dimmtemp *priv, int dimm_no)
+{
+	int dimm_order = dimm_no % priv->gen_info->dimm_idx_max;
+	int chan_rank = dimm_no / priv->gen_info->dimm_idx_max;
+	struct peci_rd_pci_cfg_local_msg rp_msg;
+	u8  cfg_data[4];
+	int ret;
+
+	if (!peci_sensor_need_update(&priv->temp[dimm_no]))
+		return 0;
+
+	ret = read_ddr_dimm_temp_config(priv, chan_rank, cfg_data);
+	if (ret)
+		return ret;
+
+	priv->temp[dimm_no].value = cfg_data[dimm_order] * 1000;
+
+	switch (priv->gen_info->model) {
+	case INTEL_FAM6_SKYLAKE_X:
+		rp_msg.addr = priv->mgr->client->addr;
+		rp_msg.bus = 2;
+		/*
+		 * Device 10, Function 2: IMC 0 channel 0 -> rank 0
+		 * Device 10, Function 6: IMC 0 channel 1 -> rank 1
+		 * Device 11, Function 2: IMC 0 channel 2 -> rank 2
+		 * Device 12, Function 2: IMC 1 channel 0 -> rank 3
+		 * Device 12, Function 6: IMC 1 channel 1 -> rank 4
+		 * Device 13, Function 2: IMC 1 channel 2 -> rank 5
+		 */
+		rp_msg.device = 10 + chan_rank / 3 * 2 +
+			     (chan_rank % 3 == 2 ? 1 : 0);
+		rp_msg.function = chan_rank % 3 == 1 ? 6 : 2;
+		rp_msg.reg = 0x120 + dimm_order * 4;
+		rp_msg.rx_len = 4;
+
+		ret = peci_command(priv->mgr->client->adapter,
+				   PECI_CMD_RD_PCI_CFG_LOCAL, &rp_msg);
+		if (rp_msg.cc != PECI_DEV_CC_SUCCESS)
+			ret = -EAGAIN;
+		if (ret)
+			return ret;
+
+		priv->temp_max[dimm_no] = rp_msg.pci_config[1] * 1000;
+		priv->temp_crit[dimm_no] = rp_msg.pci_config[2] * 1000;
+		break;
+	case INTEL_FAM6_SKYLAKE_XD:
+		rp_msg.addr = priv->mgr->client->addr;
+		rp_msg.bus = 2;
+		/*
+		 * Device 10, Function 2: IMC 0 channel 0 -> rank 0
+		 * Device 10, Function 6: IMC 0 channel 1 -> rank 1
+		 * Device 12, Function 2: IMC 1 channel 0 -> rank 2
+		 * Device 12, Function 6: IMC 1 channel 1 -> rank 3
+		 */
+		rp_msg.device = 10 + chan_rank / 2 * 2;
+		rp_msg.function = (chan_rank % 2) ? 6 : 2;
+		rp_msg.reg = 0x120 + dimm_order * 4;
+		rp_msg.rx_len = 4;
+
+		ret = peci_command(priv->mgr->client->adapter,
+				   PECI_CMD_RD_PCI_CFG_LOCAL, &rp_msg);
+		if (rp_msg.cc != PECI_DEV_CC_SUCCESS)
+			ret = -EAGAIN;
+		if (ret)
+			return ret;
+
+		priv->temp_max[dimm_no] = rp_msg.pci_config[1] * 1000;
+		priv->temp_crit[dimm_no] = rp_msg.pci_config[2] * 1000;
+		break;
+	case INTEL_FAM6_HASWELL_X:
+	case INTEL_FAM6_BROADWELL_X:
+		rp_msg.addr = priv->mgr->client->addr;
+		rp_msg.bus = 1;
+		/*
+		 * Device 20, Function 0: IMC 0 channel 0 -> rank 0
+		 * Device 20, Function 1: IMC 0 channel 1 -> rank 1
+		 * Device 21, Function 0: IMC 0 channel 2 -> rank 2
+		 * Device 21, Function 1: IMC 0 channel 3 -> rank 3
+		 * Device 23, Function 0: IMC 1 channel 0 -> rank 4
+		 * Device 23, Function 1: IMC 1 channel 1 -> rank 5
+		 * Device 24, Function 0: IMC 1 channel 2 -> rank 6
+		 * Device 24, Function 1: IMC 1 channel 3 -> rank 7
+		 */
+		rp_msg.device = 20 + chan_rank / 2 + chan_rank / 4;
+		rp_msg.function = chan_rank % 2;
+		rp_msg.reg = 0x120 + dimm_order * 4;
+		rp_msg.rx_len = 4;
+
+		ret = peci_command(priv->mgr->client->adapter,
+				   PECI_CMD_RD_PCI_CFG_LOCAL, &rp_msg);
+		if (rp_msg.cc != PECI_DEV_CC_SUCCESS)
+			ret = -EAGAIN;
+		if (ret)
+			return ret;
+
+		priv->temp_max[dimm_no] = rp_msg.pci_config[1] * 1000;
+		priv->temp_crit[dimm_no] = rp_msg.pci_config[2] * 1000;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	peci_sensor_mark_updated(&priv->temp[dimm_no]);
+
+	return 0;
+}
+
+static int dimmtemp_read_string(struct device *dev,
+				enum hwmon_sensor_types type,
+				u32 attr, int channel, const char **str)
+{
+	struct peci_dimmtemp *priv = dev_get_drvdata(dev);
+
+	if (attr != hwmon_temp_label)
+		return -EOPNOTSUPP;
+
+	*str = (const char *)priv->dimmtemp_label[channel];
+
+	return 0;
+}
+
+static int dimmtemp_read(struct device *dev, enum hwmon_sensor_types type,
+			 u32 attr, int channel, long *val)
+{
+	struct peci_dimmtemp *priv = dev_get_drvdata(dev);
+	int ret;
+
+	ret = get_dimm_temp(priv, channel);
+	if (ret)
+		return ret;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		*val = priv->temp[channel].value;
+		break;
+	case hwmon_temp_max:
+		*val = priv->temp_max[channel];
+		break;
+	case hwmon_temp_crit:
+		*val = priv->temp_crit[channel];
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+
+	return ret;
+}
+
+static umode_t dimmtemp_is_visible(const void *data,
+				   enum hwmon_sensor_types type,
+				   u32 attr, int channel)
+{
+	const struct peci_dimmtemp *priv = data;
+
+	if (priv->temp_config[channel] & BIT(attr) &&
+	    priv->dimm_mask & BIT(channel))
+		return 0444;
+
+	return 0;
+}
+
+static const struct hwmon_ops dimmtemp_ops = {
+	.is_visible = dimmtemp_is_visible,
+	.read_string = dimmtemp_read_string,
+	.read = dimmtemp_read,
+};
+
+static int check_populated_dimms(struct peci_dimmtemp *priv)
+{
+	u32 chan_rank_max = priv->gen_info->chan_rank_max;
+	u32 dimm_idx_max = priv->gen_info->dimm_idx_max;
+	int chan_rank, dimm_idx;
+	u8  cfg_data[4];
+
+	for (chan_rank = 0; chan_rank < chan_rank_max; chan_rank++) {
+		int ret;
+
+		ret = read_ddr_dimm_temp_config(priv, chan_rank, cfg_data);
+		if (ret) {
+			priv->dimm_mask = 0;
+			return ret;
+		}
+
+		for (dimm_idx = 0; dimm_idx < dimm_idx_max; dimm_idx++)
+			if (cfg_data[dimm_idx])
+				priv->dimm_mask |= BIT(chan_rank *
+						       dimm_idx_max +
+						       dimm_idx);
+	}
+
+	if (!priv->dimm_mask)
+		return -EAGAIN;
+
+	dev_dbg(priv->dev, "Scanned populated DIMMs: 0x%x\n", priv->dimm_mask);
+
+	return 0;
+}
+
+static int create_dimm_temp_label(struct peci_dimmtemp *priv, int chan)
+{
+	int rank, idx;
+
+	priv->dimmtemp_label[chan] = devm_kzalloc(priv->dev,
+						  PECI_HWMON_LABEL_STR_LEN,
+						  GFP_KERNEL);
+	if (!priv->dimmtemp_label[chan])
+		return -ENOMEM;
+
+	rank = chan / priv->gen_info->dimm_idx_max;
+	idx = chan % priv->gen_info->dimm_idx_max;
+
+	sprintf(priv->dimmtemp_label[chan], "DIMM %c%d", 'A' + rank, idx);
+
+	return 0;
+}
+
+static int create_dimm_temp_info(struct peci_dimmtemp *priv)
+{
+	int ret, i, config_idx, channels;
+	struct device *dev;
+
+	ret = check_populated_dimms(priv);
+	if (ret) {
+		if (ret == -EAGAIN) {
+			if (priv->retry_count < DIMM_MASK_CHECK_RETRY_MAX) {
+				queue_delayed_work(priv->work_queue,
+						   &priv->work_handler,
+						 DIMM_MASK_CHECK_DELAY_JIFFIES);
+				priv->retry_count++;
+				dev_dbg(priv->dev,
+					"Deferred DIMM temp info creation\n");
+			} else {
+				dev_err(priv->dev,
+					"Timeout DIMM temp info creation\n");
+				ret = -ETIMEDOUT;
+			}
+		}
+
+		return ret;
+	}
+
+	channels = priv->gen_info->chan_rank_max *
+		   priv->gen_info->dimm_idx_max;
+
+	priv->dimmtemp_label = devm_kzalloc(priv->dev,
+					    channels * sizeof(char *),
+					    GFP_KERNEL);
+	if (!priv->dimmtemp_label)
+		return -ENOMEM;
+
+	for (i = 0, config_idx = 0; i < channels; i++)
+		if (priv->dimm_mask & BIT(i)) {
+			while (i >= config_idx)
+				priv->temp_config[config_idx++] =
+					HWMON_T_LABEL | HWMON_T_INPUT |
+					HWMON_T_MAX | HWMON_T_CRIT;
+
+			ret = create_dimm_temp_label(priv, i);
+			if (ret)
+				return ret;
+		}
+
+	priv->chip.ops = &dimmtemp_ops;
+	priv->chip.info = priv->info;
+
+	priv->info[0] = &priv->temp_info;
+
+	priv->temp_info.type = hwmon_temp;
+	priv->temp_info.config = priv->temp_config;
+
+	dev = devm_hwmon_device_register_with_info(priv->dev,
+						   priv->name,
+						   priv,
+						   &priv->chip,
+						   NULL);
+	if (IS_ERR(dev)) {
+		dev_err(priv->dev, "Failed to register hwmon device\n");
+		return PTR_ERR(dev);
+	}
+
+	dev_dbg(priv->dev, "%s: sensor '%s'\n", dev_name(dev), priv->name);
+
+	return 0;
+}
+
+static void create_dimm_temp_info_delayed(struct work_struct *work)
+{
+	struct delayed_work *dwork = to_delayed_work(work);
+	struct peci_dimmtemp *priv = container_of(dwork, struct peci_dimmtemp,
+						  work_handler);
+	int ret;
+
+	ret = create_dimm_temp_info(priv);
+	if (ret && ret != -EAGAIN)
+		dev_dbg(priv->dev, "Failed to create DIMM temp info\n");
+}
+
+static int peci_dimmtemp_probe(struct platform_device *pdev)
+{
+	struct peci_client_manager *mgr = dev_get_drvdata(pdev->dev.parent);
+	struct device *dev = &pdev->dev;
+	struct peci_dimmtemp *priv;
+	int ret, i;
+
+	if ((mgr->client->adapter->cmd_mask &
+	    (BIT(PECI_CMD_GET_TEMP) | BIT(PECI_CMD_RD_PKG_CFG))) !=
+	    (BIT(PECI_CMD_GET_TEMP) | BIT(PECI_CMD_RD_PKG_CFG)))
+		return -ENODEV;
+
+	for (i = 0; i < ARRAY_SIZE(support_model); i++) {
+		if (mgr->gen_info->model == support_model[i])
+			break;
+	}
+	if (i == ARRAY_SIZE(support_model))
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
+	snprintf(priv->name, PECI_NAME_SIZE, "peci_dimmtemp.cpu%d",
+		 priv->mgr->client->addr - PECI_BASE_ADDR);
+
+	priv->work_queue = alloc_ordered_workqueue(priv->name, 0);
+	if (!priv->work_queue)
+		return -ENOMEM;
+
+	INIT_DELAYED_WORK(&priv->work_handler, create_dimm_temp_info_delayed);
+
+	ret = create_dimm_temp_info(priv);
+	if (ret && ret != -EAGAIN) {
+		dev_dbg(dev, "Failed to create DIMM temp info\n");
+		goto err_free_wq;
+	}
+
+	return 0;
+
+err_free_wq:
+	destroy_workqueue(priv->work_queue);
+	return ret;
+}
+
+static int peci_dimmtemp_remove(struct platform_device *pdev)
+{
+	struct peci_dimmtemp *priv = dev_get_drvdata(&pdev->dev);
+
+	cancel_delayed_work_sync(&priv->work_handler);
+	destroy_workqueue(priv->work_queue);
+
+	return 0;
+}
+
+static const struct platform_device_id peci_dimmtemp_ids[] = {
+	{ .name = "peci-dimmtemp", .driver_data = 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, peci_dimmtemp_ids);
+
+static struct platform_driver peci_dimmtemp_driver = {
+	.probe		= peci_dimmtemp_probe,
+	.remove		= peci_dimmtemp_remove,
+	.id_table	= peci_dimmtemp_ids,
+	.driver		= { .name = KBUILD_MODNAME, },
+};
+module_platform_driver(peci_dimmtemp_driver);
+
+MODULE_AUTHOR("Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>");
+MODULE_DESCRIPTION("PECI dimmtemp driver");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

