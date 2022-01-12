Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D066948CEF7
	for <lists+openbmc@lfdr.de>; Thu, 13 Jan 2022 00:12:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZ3H45yVFz2ymb
	for <lists+openbmc@lfdr.de>; Thu, 13 Jan 2022 10:12:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CaMvpsDQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CaMvpsDQ; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZ3Bl0FBzz30L9;
 Thu, 13 Jan 2022 10:08:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642028895; x=1673564895;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0A7AITUIm+5IbsbXw+0uO22IBFIhmvomSfDP23aiRRU=;
 b=CaMvpsDQb3M0CJHlr5/gSHDt310RxGyLH5/7PHMX9zGwt1vPIWn6HgLC
 N38tILaAMd1LFKXjugrpOc/E/Lwk5MghDe3aR9N9aqUXido3x65t5Pdc1
 XvqYM38vnsWsMfh1m5zNnd/3NsvNtpqtDfAC6IWJLVvLfl9FouLKXY1pX
 qHfuhOkhwLR67kUXsprZG9LcKFO+B5XBJdolL7JNogrgZ17/+CodSgosC
 0oNUtJ5iAfkvIYSe1XSk4Xs6QRrU9pIOOdU23kyXMR5o8xuCoFXXFLJkF
 WecrGQIE2xeX+OdNYqxujAaLuPfjYaCes3BJQxaKKJ+WerSBsKdjnl58t A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="244076492"
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="244076492"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 15:07:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,284,1635231600"; d="scan'208";a="593161765"
Received: from kstefans-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.154.174])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 15:07:03 -0800
From: Iwona Winiarska <iwona.winiarska@intel.com>
To: linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v5 09/13] peci: Add peci-cpu driver
Date: Thu, 13 Jan 2022 00:02:43 +0100
Message-Id: <20220112230247.982212-10-iwona.winiarska@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112230247.982212-1-iwona.winiarska@intel.com>
References: <20220112230247.982212-1-iwona.winiarska@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 Dave Hansen <dave.hansen@intel.com>, Zev Weiss <zweiss@equinix.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Billy Tsai <billy_tsai@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Iwona Winiarska <iwona.winiarska@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Randy Dunlap <rdunlap@infradead.org>, Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PECI is an interface that may be used by different types of devices.
Add a peci-cpu driver compatible with Intel processors. The driver is
responsible for handling auxiliary devices that can subsequently be used
by other drivers (e.g. hwmons).

Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 MAINTAINERS              |   1 +
 drivers/peci/Kconfig     |  15 ++
 drivers/peci/Makefile    |   2 +
 drivers/peci/cpu.c       | 343 +++++++++++++++++++++++++++++++++++++++
 drivers/peci/device.c    |   1 +
 drivers/peci/internal.h  |  27 +++
 drivers/peci/request.c   | 213 ++++++++++++++++++++++++
 include/linux/peci-cpu.h |  40 +++++
 include/linux/peci.h     |   8 -
 9 files changed, 642 insertions(+), 8 deletions(-)
 create mode 100644 drivers/peci/cpu.c
 create mode 100644 include/linux/peci-cpu.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 6564c3b58c83..e79322cc6d29 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14936,6 +14936,7 @@ L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/peci/
 F:	drivers/peci/
+F:	include/linux/peci-cpu.h
 F:	include/linux/peci.h
 
 PENSANDO ETHERNET DRIVERS
diff --git a/drivers/peci/Kconfig b/drivers/peci/Kconfig
index 99279df97a78..89872ad83320 100644
--- a/drivers/peci/Kconfig
+++ b/drivers/peci/Kconfig
@@ -16,6 +16,21 @@ menuconfig PECI
 
 if PECI
 
+config PECI_CPU
+	tristate "PECI CPU"
+	select AUXILIARY_BUS
+	help
+	  This option enables peci-cpu driver for Intel processors. It is
+	  responsible for creating auxiliary devices that can subsequently
+	  be used by other drivers in order to perform various
+	  functionalities such as e.g. temperature monitoring.
+
+	  Additional drivers must be enabled in order to use the functionality
+	  of the device.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called peci-cpu.
+
 source "drivers/peci/controller/Kconfig"
 
 endif # PECI
diff --git a/drivers/peci/Makefile b/drivers/peci/Makefile
index 917f689e147a..7de18137e738 100644
--- a/drivers/peci/Makefile
+++ b/drivers/peci/Makefile
@@ -3,6 +3,8 @@
 # Core functionality
 peci-y := core.o request.o device.o sysfs.o
 obj-$(CONFIG_PECI) += peci.o
+peci-cpu-y := cpu.o
+obj-$(CONFIG_PECI_CPU) += peci-cpu.o
 
 # Hardware specific bus drivers
 obj-y += controller/
diff --git a/drivers/peci/cpu.c b/drivers/peci/cpu.c
new file mode 100644
index 000000000000..68eb61c65d34
--- /dev/null
+++ b/drivers/peci/cpu.c
@@ -0,0 +1,343 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2021 Intel Corporation
+
+#include <linux/auxiliary_bus.h>
+#include <linux/module.h>
+#include <linux/peci.h>
+#include <linux/peci-cpu.h>
+#include <linux/slab.h>
+
+#include "internal.h"
+
+/**
+ * peci_temp_read() - read the maximum die temperature from PECI target device
+ * @device: PECI device to which request is going to be sent
+ * @temp_raw: where to store the read temperature
+ *
+ * It uses GetTemp PECI command.
+ *
+ * Return: 0 if succeeded, other values in case errors.
+ */
+int peci_temp_read(struct peci_device *device, s16 *temp_raw)
+{
+	struct peci_request *req;
+
+	req = peci_xfer_get_temp(device);
+	if (IS_ERR(req))
+		return PTR_ERR(req);
+
+	*temp_raw = peci_request_temp_read(req);
+
+	peci_request_free(req);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(peci_temp_read, PECI_CPU);
+
+/**
+ * peci_pcs_read() - read PCS register
+ * @device: PECI device to which request is going to be sent
+ * @index: PCS index
+ * @param: PCS parameter
+ * @data: where to store the read data
+ *
+ * It uses RdPkgConfig PECI command.
+ *
+ * Return: 0 if succeeded, other values in case errors.
+ */
+int peci_pcs_read(struct peci_device *device, u8 index, u16 param, u32 *data)
+{
+	struct peci_request *req;
+	int ret;
+
+	req = peci_xfer_pkg_cfg_readl(device, index, param);
+	if (IS_ERR(req))
+		return PTR_ERR(req);
+
+	ret = peci_request_status(req);
+	if (ret)
+		goto out_req_free;
+
+	*data = peci_request_data_readl(req);
+out_req_free:
+	peci_request_free(req);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(peci_pcs_read, PECI_CPU);
+
+/**
+ * peci_pci_local_read() - read 32-bit memory location using raw address
+ * @device: PECI device to which request is going to be sent
+ * @bus: bus
+ * @dev: device
+ * @func: function
+ * @reg: register
+ * @data: where to store the read data
+ *
+ * It uses RdPCIConfigLocal PECI command.
+ *
+ * Return: 0 if succeeded, other values in case errors.
+ */
+int peci_pci_local_read(struct peci_device *device, u8 bus, u8 dev, u8 func,
+			u16 reg, u32 *data)
+{
+	struct peci_request *req;
+	int ret;
+
+	req = peci_xfer_pci_cfg_local_readl(device, bus, dev, func, reg);
+	if (IS_ERR(req))
+		return PTR_ERR(req);
+
+	ret = peci_request_status(req);
+	if (ret)
+		goto out_req_free;
+
+	*data = peci_request_data_readl(req);
+out_req_free:
+	peci_request_free(req);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(peci_pci_local_read, PECI_CPU);
+
+/**
+ * peci_ep_pci_local_read() - read 32-bit memory location using raw address
+ * @device: PECI device to which request is going to be sent
+ * @seg: PCI segment
+ * @bus: bus
+ * @dev: device
+ * @func: function
+ * @reg: register
+ * @data: where to store the read data
+ *
+ * Like &peci_pci_local_read, but it uses RdEndpointConfig PECI command.
+ *
+ * Return: 0 if succeeded, other values in case errors.
+ */
+int peci_ep_pci_local_read(struct peci_device *device, u8 seg,
+			   u8 bus, u8 dev, u8 func, u16 reg, u32 *data)
+{
+	struct peci_request *req;
+	int ret;
+
+	req = peci_xfer_ep_pci_cfg_local_readl(device, seg, bus, dev, func, reg);
+	if (IS_ERR(req))
+		return PTR_ERR(req);
+
+	ret = peci_request_status(req);
+	if (ret)
+		goto out_req_free;
+
+	*data = peci_request_data_readl(req);
+out_req_free:
+	peci_request_free(req);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(peci_ep_pci_local_read, PECI_CPU);
+
+/**
+ * peci_mmio_read() - read 32-bit memory location using 64-bit bar offset address
+ * @device: PECI device to which request is going to be sent
+ * @bar: PCI bar
+ * @seg: PCI segment
+ * @bus: bus
+ * @dev: device
+ * @func: function
+ * @address: 64-bit MMIO address
+ * @data: where to store the read data
+ *
+ * It uses RdEndpointConfig PECI command.
+ *
+ * Return: 0 if succeeded, other values in case errors.
+ */
+int peci_mmio_read(struct peci_device *device, u8 bar, u8 seg,
+		   u8 bus, u8 dev, u8 func, u64 address, u32 *data)
+{
+	struct peci_request *req;
+	int ret;
+
+	req = peci_xfer_ep_mmio64_readl(device, bar, seg, bus, dev, func, address);
+	if (IS_ERR(req))
+		return PTR_ERR(req);
+
+	ret = peci_request_status(req);
+	if (ret)
+		goto out_req_free;
+
+	*data = peci_request_data_readl(req);
+out_req_free:
+	peci_request_free(req);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(peci_mmio_read, PECI_CPU);
+
+static const char * const peci_adev_types[] = {
+	"cputemp",
+	"dimmtemp",
+};
+
+struct peci_cpu {
+	struct peci_device *device;
+	const struct peci_device_id *id;
+};
+
+static void adev_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	auxiliary_device_uninit(adev);
+
+	kfree(adev->name);
+	kfree(adev);
+}
+
+static struct auxiliary_device *adev_alloc(struct peci_cpu *priv, int idx)
+{
+	struct peci_controller *controller = to_peci_controller(priv->device->dev.parent);
+	struct auxiliary_device *adev;
+	const char *name;
+	int ret;
+
+	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
+	if (!adev)
+		return ERR_PTR(-ENOMEM);
+
+	name = kasprintf(GFP_KERNEL, "%s.%s", peci_adev_types[idx], (const char *)priv->id->data);
+	if (!name) {
+		ret = -ENOMEM;
+		goto free_adev;
+	}
+
+	adev->name = name;
+	adev->dev.parent = &priv->device->dev;
+	adev->dev.release = adev_release;
+	adev->id = (controller->id << 16) | (priv->device->addr);
+
+	ret = auxiliary_device_init(adev);
+	if (ret)
+		goto free_name;
+
+	return adev;
+
+free_name:
+	kfree(name);
+free_adev:
+	kfree(adev);
+	return ERR_PTR(ret);
+}
+
+static void unregister_adev(void *_adev)
+{
+	struct auxiliary_device *adev = _adev;
+
+	auxiliary_device_delete(adev);
+}
+
+static int devm_adev_add(struct device *dev, int idx)
+{
+	struct peci_cpu *priv = dev_get_drvdata(dev);
+	struct auxiliary_device *adev;
+	int ret;
+
+	adev = adev_alloc(priv, idx);
+	if (IS_ERR(adev))
+		return PTR_ERR(adev);
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(&priv->device->dev, unregister_adev, adev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void peci_cpu_add_adevices(struct peci_cpu *priv)
+{
+	struct device *dev = &priv->device->dev;
+	int ret, i;
+
+	for (i = 0; i < ARRAY_SIZE(peci_adev_types); i++) {
+		ret = devm_adev_add(dev, i);
+		if (ret) {
+			dev_warn(dev, "Failed to register PECI auxiliary: %s, ret = %d\n",
+				 peci_adev_types[i], ret);
+			continue;
+		}
+	}
+}
+
+static int
+peci_cpu_probe(struct peci_device *device, const struct peci_device_id *id)
+{
+	struct device *dev = &device->dev;
+	struct peci_cpu *priv;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, priv);
+	priv->device = device;
+	priv->id = id;
+
+	peci_cpu_add_adevices(priv);
+
+	return 0;
+}
+
+static const struct peci_device_id peci_cpu_device_ids[] = {
+	{ /* Haswell Xeon */
+		.family	= 6,
+		.model	= INTEL_FAM6_HASWELL_X,
+		.data	= "hsx",
+	},
+	{ /* Broadwell Xeon */
+		.family	= 6,
+		.model	= INTEL_FAM6_BROADWELL_X,
+		.data	= "bdx",
+	},
+	{ /* Broadwell Xeon D */
+		.family	= 6,
+		.model	= INTEL_FAM6_BROADWELL_D,
+		.data	= "bdxd",
+	},
+	{ /* Skylake Xeon */
+		.family	= 6,
+		.model	= INTEL_FAM6_SKYLAKE_X,
+		.data	= "skx",
+	},
+	{ /* Icelake Xeon */
+		.family	= 6,
+		.model	= INTEL_FAM6_ICELAKE_X,
+		.data	= "icx",
+	},
+	{ /* Icelake Xeon D */
+		.family	= 6,
+		.model	= INTEL_FAM6_ICELAKE_D,
+		.data	= "icxd",
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(peci, peci_cpu_device_ids);
+
+static struct peci_driver peci_cpu_driver = {
+	.probe		= peci_cpu_probe,
+	.id_table	= peci_cpu_device_ids,
+	.driver		= {
+		.name		= "peci-cpu",
+	},
+};
+module_peci_driver(peci_cpu_driver);
+
+MODULE_AUTHOR("Iwona Winiarska <iwona.winiarska@intel.com>");
+MODULE_DESCRIPTION("PECI CPU driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(PECI);
diff --git a/drivers/peci/device.c b/drivers/peci/device.c
index 184b5e650b0b..e6b0bffb14f4 100644
--- a/drivers/peci/device.c
+++ b/drivers/peci/device.c
@@ -3,6 +3,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/peci.h>
+#include <linux/peci-cpu.h>
 #include <linux/slab.h>
 
 #include "internal.h"
diff --git a/drivers/peci/internal.h b/drivers/peci/internal.h
index 52c02e12874f..9d75ea54504c 100644
--- a/drivers/peci/internal.h
+++ b/drivers/peci/internal.h
@@ -22,6 +22,7 @@ void peci_request_free(struct peci_request *req);
 int peci_request_status(struct peci_request *req);
 
 u64 peci_request_dib_read(struct peci_request *req);
+s16 peci_request_temp_read(struct peci_request *req);
 
 u8 peci_request_data_readb(struct peci_request *req);
 u16 peci_request_data_readw(struct peci_request *req);
@@ -36,6 +37,32 @@ struct peci_request *peci_xfer_pkg_cfg_readw(struct peci_device *device, u8 inde
 struct peci_request *peci_xfer_pkg_cfg_readl(struct peci_device *device, u8 index, u16 param);
 struct peci_request *peci_xfer_pkg_cfg_readq(struct peci_device *device, u8 index, u16 param);
 
+struct peci_request *peci_xfer_pci_cfg_local_readb(struct peci_device *device,
+						   u8 bus, u8 dev, u8 func, u16 reg);
+struct peci_request *peci_xfer_pci_cfg_local_readw(struct peci_device *device,
+						   u8 bus, u8 dev, u8 func, u16 reg);
+struct peci_request *peci_xfer_pci_cfg_local_readl(struct peci_device *device,
+						   u8 bus, u8 dev, u8 func, u16 reg);
+
+struct peci_request *peci_xfer_ep_pci_cfg_local_readb(struct peci_device *device, u8 seg,
+						      u8 bus, u8 dev, u8 func, u16 reg);
+struct peci_request *peci_xfer_ep_pci_cfg_local_readw(struct peci_device *device, u8 seg,
+						      u8 bus, u8 dev, u8 func, u16 reg);
+struct peci_request *peci_xfer_ep_pci_cfg_local_readl(struct peci_device *device, u8 seg,
+						      u8 bus, u8 dev, u8 func, u16 reg);
+
+struct peci_request *peci_xfer_ep_pci_cfg_readb(struct peci_device *device, u8 seg,
+						u8 bus, u8 dev, u8 func, u16 reg);
+struct peci_request *peci_xfer_ep_pci_cfg_readw(struct peci_device *device, u8 seg,
+						u8 bus, u8 dev, u8 func, u16 reg);
+struct peci_request *peci_xfer_ep_pci_cfg_readl(struct peci_device *device, u8 seg,
+						u8 bus, u8 dev, u8 func, u16 reg);
+
+struct peci_request *peci_xfer_ep_mmio32_readl(struct peci_device *device, u8 bar, u8 seg,
+					       u8 bus, u8 dev, u8 func, u64 offset);
+
+struct peci_request *peci_xfer_ep_mmio64_readl(struct peci_device *device, u8 bar, u8 seg,
+					       u8 bus, u8 dev, u8 func, u64 offset);
 /**
  * struct peci_device_id - PECI device data to match
  * @data: pointer to driver private data specific to device
diff --git a/drivers/peci/request.c b/drivers/peci/request.c
index 9bd1d81c6093..33da90d801d5 100644
--- a/drivers/peci/request.c
+++ b/drivers/peci/request.c
@@ -3,6 +3,7 @@
 
 #include <linux/bug.h>
 #include <linux/export.h>
+#include <linux/pci.h>
 #include <linux/peci.h>
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -15,6 +16,10 @@
 #define  PECI_GET_DIB_WR_LEN		1
 #define  PECI_GET_DIB_RD_LEN		8
 
+#define PECI_GET_TEMP_CMD		0x01
+#define  PECI_GET_TEMP_WR_LEN		1
+#define  PECI_GET_TEMP_RD_LEN		2
+
 #define PECI_RDPKGCFG_CMD		0xa1
 #define  PECI_RDPKGCFG_WR_LEN		5
 #define  PECI_RDPKGCFG_RD_LEN_BASE	1
@@ -22,6 +27,45 @@
 #define  PECI_WRPKGCFG_WR_LEN_BASE	6
 #define  PECI_WRPKGCFG_RD_LEN		1
 
+#define PECI_RDIAMSR_CMD		0xb1
+#define  PECI_RDIAMSR_WR_LEN		5
+#define  PECI_RDIAMSR_RD_LEN		9
+#define PECI_WRIAMSR_CMD		0xb5
+#define PECI_RDIAMSREX_CMD		0xd1
+#define  PECI_RDIAMSREX_WR_LEN		6
+#define  PECI_RDIAMSREX_RD_LEN		9
+
+#define PECI_RDPCICFG_CMD		0x61
+#define  PECI_RDPCICFG_WR_LEN		6
+#define  PECI_RDPCICFG_RD_LEN		5
+#define  PECI_RDPCICFG_RD_LEN_MAX	24
+#define PECI_WRPCICFG_CMD		0x65
+
+#define PECI_RDPCICFGLOCAL_CMD			0xe1
+#define  PECI_RDPCICFGLOCAL_WR_LEN		5
+#define  PECI_RDPCICFGLOCAL_RD_LEN_BASE		1
+#define PECI_WRPCICFGLOCAL_CMD			0xe5
+#define  PECI_WRPCICFGLOCAL_WR_LEN_BASE		6
+#define  PECI_WRPCICFGLOCAL_RD_LEN		1
+
+#define PECI_ENDPTCFG_TYPE_LOCAL_PCI		0x03
+#define PECI_ENDPTCFG_TYPE_PCI			0x04
+#define PECI_ENDPTCFG_TYPE_MMIO			0x05
+#define PECI_ENDPTCFG_ADDR_TYPE_PCI		0x04
+#define PECI_ENDPTCFG_ADDR_TYPE_MMIO_D		0x05
+#define PECI_ENDPTCFG_ADDR_TYPE_MMIO_Q		0x06
+#define PECI_RDENDPTCFG_CMD			0xc1
+#define  PECI_RDENDPTCFG_PCI_WR_LEN		12
+#define  PECI_RDENDPTCFG_MMIO_WR_LEN_BASE	10
+#define  PECI_RDENDPTCFG_MMIO_D_WR_LEN		14
+#define  PECI_RDENDPTCFG_MMIO_Q_WR_LEN		18
+#define  PECI_RDENDPTCFG_RD_LEN_BASE		1
+#define PECI_WRENDPTCFG_CMD			0xc5
+#define  PECI_WRENDPTCFG_PCI_WR_LEN_BASE	13
+#define  PECI_WRENDPTCFG_MMIO_D_WR_LEN_BASE	15
+#define  PECI_WRENDPTCFG_MMIO_Q_WR_LEN_BASE	19
+#define  PECI_WRENDPTCFG_RD_LEN			1
+
 /* Device Specific Completion Code (CC) Definition */
 #define PECI_CC_SUCCESS				0x40
 #define PECI_CC_NEED_RETRY			0x80
@@ -202,6 +246,27 @@ struct peci_request *peci_xfer_get_dib(struct peci_device *device)
 }
 EXPORT_SYMBOL_NS_GPL(peci_xfer_get_dib, PECI);
 
+struct peci_request *peci_xfer_get_temp(struct peci_device *device)
+{
+	struct peci_request *req;
+	int ret;
+
+	req = peci_request_alloc(device, PECI_GET_TEMP_WR_LEN, PECI_GET_TEMP_RD_LEN);
+	if (!req)
+		return ERR_PTR(-ENOMEM);
+
+	req->tx.buf[0] = PECI_GET_TEMP_CMD;
+
+	ret = peci_request_xfer(req);
+	if (ret) {
+		peci_request_free(req);
+		return ERR_PTR(ret);
+	}
+
+	return req;
+}
+EXPORT_SYMBOL_NS_GPL(peci_xfer_get_temp, PECI);
+
 static struct peci_request *
 __pkg_cfg_read(struct peci_device *device, u8 index, u16 param, u8 len)
 {
@@ -226,6 +291,108 @@ __pkg_cfg_read(struct peci_device *device, u8 index, u16 param, u8 len)
 	return req;
 }
 
+static u32 __get_pci_addr(u8 bus, u8 dev, u8 func, u16 reg)
+{
+	return reg | PCI_DEVID(bus, PCI_DEVFN(dev, func)) << 12;
+}
+
+static struct peci_request *
+__pci_cfg_local_read(struct peci_device *device, u8 bus, u8 dev, u8 func, u16 reg, u8 len)
+{
+	struct peci_request *req;
+	u32 pci_addr;
+	int ret;
+
+	req = peci_request_alloc(device, PECI_RDPCICFGLOCAL_WR_LEN,
+				 PECI_RDPCICFGLOCAL_RD_LEN_BASE + len);
+	if (!req)
+		return ERR_PTR(-ENOMEM);
+
+	pci_addr = __get_pci_addr(bus, dev, func, reg);
+
+	req->tx.buf[0] = PECI_RDPCICFGLOCAL_CMD;
+	req->tx.buf[1] = 0;
+	put_unaligned_le24(pci_addr, &req->tx.buf[2]);
+
+	ret = peci_request_xfer_retry(req);
+	if (ret) {
+		peci_request_free(req);
+		return ERR_PTR(ret);
+	}
+
+	return req;
+}
+
+static struct peci_request *
+__ep_pci_cfg_read(struct peci_device *device, u8 msg_type, u8 seg,
+		  u8 bus, u8 dev, u8 func, u16 reg, u8 len)
+{
+	struct peci_request *req;
+	u32 pci_addr;
+	int ret;
+
+	req = peci_request_alloc(device, PECI_RDENDPTCFG_PCI_WR_LEN,
+				 PECI_RDENDPTCFG_RD_LEN_BASE + len);
+	if (!req)
+		return ERR_PTR(-ENOMEM);
+
+	pci_addr = __get_pci_addr(bus, dev, func, reg);
+
+	req->tx.buf[0] = PECI_RDENDPTCFG_CMD;
+	req->tx.buf[1] = 0;
+	req->tx.buf[2] = msg_type;
+	req->tx.buf[3] = 0;
+	req->tx.buf[4] = 0;
+	req->tx.buf[5] = 0;
+	req->tx.buf[6] = PECI_ENDPTCFG_ADDR_TYPE_PCI;
+	req->tx.buf[7] = seg; /* PCI Segment */
+	put_unaligned_le32(pci_addr, &req->tx.buf[8]);
+
+	ret = peci_request_xfer_retry(req);
+	if (ret) {
+		peci_request_free(req);
+		return ERR_PTR(ret);
+	}
+
+	return req;
+}
+
+static struct peci_request *
+__ep_mmio_read(struct peci_device *device, u8 bar, u8 addr_type, u8 seg,
+	       u8 bus, u8 dev, u8 func, u64 offset, u8 tx_len, u8 len)
+{
+	struct peci_request *req;
+	int ret;
+
+	req = peci_request_alloc(device, tx_len, PECI_RDENDPTCFG_RD_LEN_BASE + len);
+	if (!req)
+		return ERR_PTR(-ENOMEM);
+
+	req->tx.buf[0] = PECI_RDENDPTCFG_CMD;
+	req->tx.buf[1] = 0;
+	req->tx.buf[2] = PECI_ENDPTCFG_TYPE_MMIO;
+	req->tx.buf[3] = 0; /* Endpoint ID */
+	req->tx.buf[4] = 0; /* Reserved */
+	req->tx.buf[5] = bar;
+	req->tx.buf[6] = addr_type;
+	req->tx.buf[7] = seg; /* PCI Segment */
+	req->tx.buf[8] = PCI_DEVFN(dev, func);
+	req->tx.buf[9] = bus; /* PCI Bus */
+
+	if (addr_type == PECI_ENDPTCFG_ADDR_TYPE_MMIO_D)
+		put_unaligned_le32(offset, &req->tx.buf[10]);
+	else
+		put_unaligned_le64(offset, &req->tx.buf[10]);
+
+	ret = peci_request_xfer_retry(req);
+	if (ret) {
+		peci_request_free(req);
+		return ERR_PTR(ret);
+	}
+
+	return req;
+}
+
 u8 peci_request_data_readb(struct peci_request *req)
 {
 	return req->rx.buf[1];
@@ -256,6 +423,12 @@ u64 peci_request_dib_read(struct peci_request *req)
 }
 EXPORT_SYMBOL_NS_GPL(peci_request_dib_read, PECI);
 
+s16 peci_request_temp_read(struct peci_request *req)
+{
+	return get_unaligned_le16(&req->rx.buf[0]);
+}
+EXPORT_SYMBOL_NS_GPL(peci_request_temp_read, PECI);
+
 #define __read_pkg_config(x, type) \
 struct peci_request *peci_xfer_pkg_cfg_##x(struct peci_device *device, u8 index, u16 param) \
 { \
@@ -267,3 +440,43 @@ __read_pkg_config(readb, u8);
 __read_pkg_config(readw, u16);
 __read_pkg_config(readl, u32);
 __read_pkg_config(readq, u64);
+
+#define __read_pci_config_local(x, type) \
+struct peci_request * \
+peci_xfer_pci_cfg_local_##x(struct peci_device *device, u8 bus, u8 dev, u8 func, u16 reg) \
+{ \
+	return __pci_cfg_local_read(device, bus, dev, func, reg, sizeof(type)); \
+} \
+EXPORT_SYMBOL_NS_GPL(peci_xfer_pci_cfg_local_##x, PECI)
+
+__read_pci_config_local(readb, u8);
+__read_pci_config_local(readw, u16);
+__read_pci_config_local(readl, u32);
+
+#define __read_ep_pci_config(x, msg_type, type) \
+struct peci_request * \
+peci_xfer_ep_pci_cfg_##x(struct peci_device *device, u8 seg, u8 bus, u8 dev, u8 func, u16 reg) \
+{ \
+	return __ep_pci_cfg_read(device, msg_type, seg, bus, dev, func, reg, sizeof(type)); \
+} \
+EXPORT_SYMBOL_NS_GPL(peci_xfer_ep_pci_cfg_##x, PECI)
+
+__read_ep_pci_config(local_readb, PECI_ENDPTCFG_TYPE_LOCAL_PCI, u8);
+__read_ep_pci_config(local_readw, PECI_ENDPTCFG_TYPE_LOCAL_PCI, u16);
+__read_ep_pci_config(local_readl, PECI_ENDPTCFG_TYPE_LOCAL_PCI, u32);
+__read_ep_pci_config(readb, PECI_ENDPTCFG_TYPE_PCI, u8);
+__read_ep_pci_config(readw, PECI_ENDPTCFG_TYPE_PCI, u16);
+__read_ep_pci_config(readl, PECI_ENDPTCFG_TYPE_PCI, u32);
+
+#define __read_ep_mmio(x, y, addr_type, type1, type2) \
+struct peci_request *peci_xfer_ep_mmio##y##_##x(struct peci_device *device, u8 bar, u8 seg, \
+					   u8 bus, u8 dev, u8 func, u64 offset) \
+{ \
+	return __ep_mmio_read(device, bar, addr_type, seg, bus, dev, func, \
+			      offset, PECI_RDENDPTCFG_MMIO_WR_LEN_BASE + sizeof(type1), \
+			      sizeof(type2)); \
+} \
+EXPORT_SYMBOL_NS_GPL(peci_xfer_ep_mmio##y##_##x, PECI)
+
+__read_ep_mmio(readl, 32, PECI_ENDPTCFG_ADDR_TYPE_MMIO_D, u32, u32);
+__read_ep_mmio(readl, 64, PECI_ENDPTCFG_ADDR_TYPE_MMIO_Q, u64, u32);
diff --git a/include/linux/peci-cpu.h b/include/linux/peci-cpu.h
new file mode 100644
index 000000000000..ff8ae9c26c80
--- /dev/null
+++ b/include/linux/peci-cpu.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (c) 2021 Intel Corporation */
+
+#ifndef __LINUX_PECI_CPU_H
+#define __LINUX_PECI_CPU_H
+
+#include <linux/types.h>
+
+#include "../../arch/x86/include/asm/intel-family.h"
+
+#define PECI_PCS_PKG_ID			0  /* Package Identifier Read */
+#define  PECI_PKG_ID_CPU_ID		0x0000  /* CPUID Info */
+#define  PECI_PKG_ID_PLATFORM_ID	0x0001  /* Platform ID */
+#define  PECI_PKG_ID_DEVICE_ID		0x0002  /* Uncore Device ID */
+#define  PECI_PKG_ID_MAX_THREAD_ID	0x0003  /* Max Thread ID */
+#define  PECI_PKG_ID_MICROCODE_REV	0x0004  /* CPU Microcode Update Revision */
+#define  PECI_PKG_ID_MCA_ERROR_LOG	0x0005  /* Machine Check Status */
+#define PECI_PCS_MODULE_TEMP		9  /* Per Core DTS Temperature Read */
+#define PECI_PCS_THERMAL_MARGIN		10 /* DTS thermal margin */
+#define PECI_PCS_DDR_DIMM_TEMP		14 /* DDR DIMM Temperature */
+#define PECI_PCS_TEMP_TARGET		16 /* Temperature Target Read */
+#define PECI_PCS_TDP_UNITS		30 /* Units for power/energy registers */
+
+struct peci_device;
+
+int peci_temp_read(struct peci_device *device, s16 *temp_raw);
+
+int peci_pcs_read(struct peci_device *device, u8 index,
+		  u16 param, u32 *data);
+
+int peci_pci_local_read(struct peci_device *device, u8 bus, u8 dev,
+			u8 func, u16 reg, u32 *data);
+
+int peci_ep_pci_local_read(struct peci_device *device, u8 seg,
+			   u8 bus, u8 dev, u8 func, u16 reg, u32 *data);
+
+int peci_mmio_read(struct peci_device *device, u8 bar, u8 seg,
+		   u8 bus, u8 dev, u8 func, u64 address, u32 *data);
+
+#endif /* __LINUX_PECI_CPU_H */
diff --git a/include/linux/peci.h b/include/linux/peci.h
index 4eda423ba10c..06e6ef935297 100644
--- a/include/linux/peci.h
+++ b/include/linux/peci.h
@@ -14,14 +14,6 @@
  */
 #define PECI_REQUEST_MAX_BUF_SIZE 32
 
-#define PECI_PCS_PKG_ID			0  /* Package Identifier Read */
-#define  PECI_PKG_ID_CPU_ID		0x0000  /* CPUID Info */
-#define  PECI_PKG_ID_PLATFORM_ID	0x0001  /* Platform ID */
-#define  PECI_PKG_ID_DEVICE_ID		0x0002  /* Uncore Device ID */
-#define  PECI_PKG_ID_MAX_THREAD_ID	0x0003  /* Max Thread ID */
-#define  PECI_PKG_ID_MICROCODE_REV	0x0004  /* CPU Microcode Update Revision */
-#define  PECI_PKG_ID_MCA_ERROR_LOG	0x0005  /* Machine Check Status */
-
 struct peci_controller;
 struct peci_request;
 
-- 
2.31.1

