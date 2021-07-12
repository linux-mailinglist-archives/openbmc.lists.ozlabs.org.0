Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D719B3C664D
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 00:15:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GNykg5kDnz3cgQ
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 08:15:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 124 seconds by postgrey-1.36 at boromir;
 Tue, 13 Jul 2021 08:13:16 AEST
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GNyhD2R1Fz3bvZ;
 Tue, 13 Jul 2021 08:13:16 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="207045871"
X-IronPort-AV: E=Sophos;i="5.84,235,1620716400"; d="scan'208";a="207045871"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 15:10:10 -0700
X-IronPort-AV: E=Sophos;i="5.84,235,1620716400"; d="scan'208";a="464394240"
Received: from jzloch-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.136.11])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 15:10:04 -0700
From: Iwona Winiarska <iwona.winiarska@intel.com>
To: linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH 09/14] peci: Add support for PECI device drivers
Date: Tue, 13 Jul 2021 00:04:42 +0200
Message-Id: <20210712220447.957418-10-iwona.winiarska@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210712220447.957418-1-iwona.winiarska@intel.com>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
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
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 x86@kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Iwona Winiarska <iwona.winiarska@intel.com>,
 Yazen Ghannam <yazen.ghannam@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Here we're adding support for PECI device drivers, which unlike PECI
controller drivers are actually able to provide functionalities to
userspace.

We're also extending peci_request API to allow querying more details
about PECI device (e.g. model/family), that's going to be used to find
a compatible peci_driver.

Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/peci/Kconfig    |   1 +
 drivers/peci/core.c     |  49 +++++++++
 drivers/peci/device.c   |  99 ++++++++++++++++++
 drivers/peci/internal.h |  75 ++++++++++++++
 drivers/peci/request.c  | 217 ++++++++++++++++++++++++++++++++++++++++
 include/linux/peci.h    |  19 ++++
 lib/Kconfig             |   2 +-
 7 files changed, 461 insertions(+), 1 deletion(-)

diff --git a/drivers/peci/Kconfig b/drivers/peci/Kconfig
index 0d0ee8009713..27c31535843c 100644
--- a/drivers/peci/Kconfig
+++ b/drivers/peci/Kconfig
@@ -2,6 +2,7 @@
 
 menuconfig PECI
 	tristate "PECI support"
+	select GENERIC_LIB_X86
 	help
 	  The Platform Environment Control Interface (PECI) is an interface
 	  that provides a communication channel to Intel processors and
diff --git a/drivers/peci/core.c b/drivers/peci/core.c
index ae7a9572cdf3..94426b7f2618 100644
--- a/drivers/peci/core.c
+++ b/drivers/peci/core.c
@@ -143,8 +143,57 @@ void peci_controller_remove(struct peci_controller *controller)
 }
 EXPORT_SYMBOL_NS_GPL(peci_controller_remove, PECI);
 
+static const struct peci_device_id *
+peci_bus_match_device_id(const struct peci_device_id *id, struct peci_device *device)
+{
+	while (id->family != 0) {
+		if (id->family == device->info.family &&
+		    id->model == device->info.model)
+			return id;
+		id++;
+	}
+
+	return NULL;
+}
+
+static int peci_bus_device_match(struct device *dev, struct device_driver *drv)
+{
+	struct peci_device *device = to_peci_device(dev);
+	struct peci_driver *peci_drv = to_peci_driver(drv);
+
+	if (dev->type != &peci_device_type)
+		return 0;
+
+	if (peci_bus_match_device_id(peci_drv->id_table, device))
+		return 1;
+
+	return 0;
+}
+
+static int peci_bus_device_probe(struct device *dev)
+{
+	struct peci_device *device = to_peci_device(dev);
+	struct peci_driver *driver = to_peci_driver(dev->driver);
+
+	return driver->probe(device, peci_bus_match_device_id(driver->id_table, device));
+}
+
+static int peci_bus_device_remove(struct device *dev)
+{
+	struct peci_device *device = to_peci_device(dev);
+	struct peci_driver *driver = to_peci_driver(dev->driver);
+
+	if (driver->remove)
+		driver->remove(device);
+
+	return 0;
+}
+
 struct bus_type peci_bus_type = {
 	.name		= "peci",
+	.match		= peci_bus_device_match,
+	.probe		= peci_bus_device_probe,
+	.remove		= peci_bus_device_remove,
 	.bus_groups	= peci_bus_groups,
 };
 
diff --git a/drivers/peci/device.c b/drivers/peci/device.c
index 1124862211e2..8c4bd1ebbc29 100644
--- a/drivers/peci/device.c
+++ b/drivers/peci/device.c
@@ -1,11 +1,79 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2018-2021 Intel Corporation
 
+#include <linux/bitfield.h>
 #include <linux/peci.h>
 #include <linux/slab.h>
+#include <linux/x86/cpu.h>
 
 #include "internal.h"
 
+#define REVISION_NUM_MASK GENMASK(15, 8)
+static int peci_get_revision(struct peci_device *device, u8 *revision)
+{
+	struct peci_request *req;
+	u64 dib;
+
+	req = peci_get_dib(device);
+	if (IS_ERR(req))
+		return PTR_ERR(req);
+
+	dib = peci_request_data_dib(req);
+	if (dib == 0) {
+		peci_request_free(req);
+		return -EIO;
+	}
+
+	*revision = FIELD_GET(REVISION_NUM_MASK, dib);
+
+	peci_request_free(req);
+
+	return 0;
+}
+
+static int peci_get_cpu_id(struct peci_device *device, u32 *cpu_id)
+{
+	struct peci_request *req;
+	int ret;
+
+	req = peci_pkg_cfg_readl(device, PECI_PCS_PKG_ID, PECI_PKG_ID_CPU_ID);
+	if (IS_ERR(req))
+		return PTR_ERR(req);
+
+	ret = peci_request_status(req);
+	if (ret)
+		goto out_req_free;
+
+	*cpu_id = peci_request_data_readl(req);
+out_req_free:
+	peci_request_free(req);
+
+	return ret;
+}
+
+static int peci_device_info_init(struct peci_device *device)
+{
+	u8 revision;
+	u32 cpu_id;
+	int ret;
+
+	ret = peci_get_cpu_id(device, &cpu_id);
+	if (ret)
+		return ret;
+
+	device->info.family = x86_family(cpu_id);
+	device->info.model = x86_model(cpu_id);
+
+	ret = peci_get_revision(device, &revision);
+	if (ret)
+		return ret;
+	device->info.peci_revision = revision;
+
+	device->info.socket_id = device->addr - PECI_BASE_ADDR;
+
+	return 0;
+}
+
 static int peci_detect(struct peci_controller *controller, u8 addr)
 {
 	struct peci_request *req;
@@ -75,6 +143,10 @@ int peci_device_create(struct peci_controller *controller, u8 addr)
 	device->dev.bus = &peci_bus_type;
 	device->dev.type = &peci_device_type;
 
+	ret = peci_device_info_init(device);
+	if (ret)
+		goto err_free;
+
 	ret = dev_set_name(&device->dev, "%d-%02x", controller->id, device->addr);
 	if (ret)
 		goto err_free;
@@ -98,6 +170,33 @@ void peci_device_destroy(struct peci_device *device)
 	device_unregister(&device->dev);
 }
 
+int __peci_driver_register(struct peci_driver *driver, struct module *owner,
+			   const char *mod_name)
+{
+	driver->driver.bus = &peci_bus_type;
+	driver->driver.owner = owner;
+	driver->driver.mod_name = mod_name;
+
+	if (!driver->probe) {
+		pr_err("peci: trying to register driver without probe callback\n");
+		return -EINVAL;
+	}
+
+	if (!driver->id_table) {
+		pr_err("peci: trying to register driver without device id table\n");
+		return -EINVAL;
+	}
+
+	return driver_register(&driver->driver);
+}
+EXPORT_SYMBOL_NS_GPL(__peci_driver_register, PECI);
+
+void peci_driver_unregister(struct peci_driver *driver)
+{
+	driver_unregister(&driver->driver);
+}
+EXPORT_SYMBOL_NS_GPL(peci_driver_unregister, PECI);
+
 static void peci_device_release(struct device *dev)
 {
 	struct peci_device *device = to_peci_device(dev);
diff --git a/drivers/peci/internal.h b/drivers/peci/internal.h
index 6b139adaf6b8..c891c93e077a 100644
--- a/drivers/peci/internal.h
+++ b/drivers/peci/internal.h
@@ -19,6 +19,34 @@ struct peci_request;
 struct peci_request *peci_request_alloc(struct peci_device *device, u8 tx_len, u8 rx_len);
 void peci_request_free(struct peci_request *req);
 
+int peci_request_status(struct peci_request *req);
+u64 peci_request_data_dib(struct peci_request *req);
+
+u8 peci_request_data_readb(struct peci_request *req);
+u16 peci_request_data_readw(struct peci_request *req);
+u32 peci_request_data_readl(struct peci_request *req);
+u64 peci_request_data_readq(struct peci_request *req);
+
+struct peci_request *peci_get_dib(struct peci_device *device);
+struct peci_request *peci_get_temp(struct peci_device *device);
+
+struct peci_request *peci_pkg_cfg_readb(struct peci_device *device, u8 index, u16 param);
+struct peci_request *peci_pkg_cfg_readw(struct peci_device *device, u8 index, u16 param);
+struct peci_request *peci_pkg_cfg_readl(struct peci_device *device, u8 index, u16 param);
+struct peci_request *peci_pkg_cfg_readq(struct peci_device *device, u8 index, u16 param);
+
+/**
+ * struct peci_device_id - PECI device data to match
+ * @data: pointer to driver private data specific to device
+ * @family: device family
+ * @model: device model
+ */
+struct peci_device_id {
+	const void *data;
+	u16 family;
+	u8 model;
+};
+
 extern struct device_type peci_device_type;
 extern const struct attribute_group *peci_device_groups[];
 
@@ -28,6 +56,53 @@ void peci_device_destroy(struct peci_device *device);
 extern struct bus_type peci_bus_type;
 extern const struct attribute_group *peci_bus_groups[];
 
+/**
+ * struct peci_driver - PECI driver
+ * @driver: inherit device driver
+ * @probe: probe callback
+ * @remove: remove callback
+ * @id_table: PECI device match table to decide which device to bind
+ */
+struct peci_driver {
+	struct device_driver driver;
+	int (*probe)(struct peci_device *device, const struct peci_device_id *id);
+	void (*remove)(struct peci_device *device);
+	const struct peci_device_id *id_table;
+};
+
+static inline struct peci_driver *to_peci_driver(struct device_driver *d)
+{
+	return container_of(d, struct peci_driver, driver);
+}
+
+int __peci_driver_register(struct peci_driver *driver, struct module *owner,
+			   const char *mod_name);
+/**
+ * peci_driver_register() - register PECI driver
+ * @driver: the driver to be registered
+ * @owner: owner module of the driver being registered
+ * @mod_name: module name string
+ *
+ * PECI drivers that don't need to do anything special in module init should
+ * use the convenience "module_peci_driver" macro instead
+ *
+ * Return: zero on success, else a negative error code.
+ */
+#define peci_driver_register(driver) \
+	__peci_driver_register(driver, THIS_MODULE, KBUILD_MODNAME)
+void peci_driver_unregister(struct peci_driver *driver);
+
+/**
+ * module_peci_driver() - Helper macro for registering a modular PECI driver
+ * @__peci_driver: peci_driver struct
+ *
+ * Helper macro for PECI drivers which do not do anything special in module
+ * init/exit. This eliminates a lot of boilerplate. Each module may only
+ * use this macro once, and calling it replaces module_init() and module_exit()
+ */
+#define module_peci_driver(__peci_driver) \
+	module_driver(__peci_driver, peci_driver_register, peci_driver_unregister)
+
 extern struct device_type peci_controller_type;
 
 int peci_controller_scan_devices(struct peci_controller *controller);
diff --git a/drivers/peci/request.c b/drivers/peci/request.c
index 78cee51dfae1..48354455b554 100644
--- a/drivers/peci/request.c
+++ b/drivers/peci/request.c
@@ -1,13 +1,142 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2021 Intel Corporation
 
+#include <linux/bug.h>
 #include <linux/export.h>
 #include <linux/peci.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 
+#include <asm/unaligned.h>
+
 #include "internal.h"
 
+#define PECI_GET_DIB_CMD		0xf7
+#define  PECI_GET_DIB_WR_LEN		1
+#define  PECI_GET_DIB_RD_LEN		8
+
+#define PECI_RDPKGCFG_CMD		0xa1
+#define  PECI_RDPKGCFG_WRITE_LEN	5
+#define  PECI_RDPKGCFG_READ_LEN_BASE	1
+#define PECI_WRPKGCFG_CMD		0xa5
+#define  PECI_WRPKGCFG_WRITE_LEN_BASE	6
+#define  PECI_WRPKGCFG_READ_LEN		1
+
+/* Device Specific Completion Code (CC) Definition */
+#define PECI_CC_SUCCESS				0x40
+#define PECI_CC_NEED_RETRY			0x80
+#define PECI_CC_OUT_OF_RESOURCE			0x81
+#define PECI_CC_UNAVAIL_RESOURCE		0x82
+#define PECI_CC_INVALID_REQ			0x90
+#define PECI_CC_MCA_ERROR			0x91
+#define PECI_CC_CATASTROPHIC_MCA_ERROR		0x93
+#define PECI_CC_FATAL_MCA_ERROR			0x94
+#define PECI_CC_PARITY_ERR_GPSB_OR_PMSB		0x98
+#define PECI_CC_PARITY_ERR_GPSB_OR_PMSB_IERR	0x9B
+#define PECI_CC_PARITY_ERR_GPSB_OR_PMSB_MCA	0x9C
+
+#define PECI_RETRY_BIT			BIT(0)
+
+#define PECI_RETRY_TIMEOUT		msecs_to_jiffies(700)
+#define PECI_RETRY_INTERVAL_MIN		msecs_to_jiffies(1)
+#define PECI_RETRY_INTERVAL_MAX		msecs_to_jiffies(128)
+
+static u8 peci_request_data_cc(struct peci_request *req)
+{
+	return req->rx.buf[0];
+}
+
+/**
+ * peci_request_status() - return -errno based on PECI completion code
+ * @req: the PECI request that contains response data with completion code
+ *
+ * It can't be used for Ping(), GetDIB() and GetTemp() - for those commands we
+ * don't expect completion code in the response.
+ *
+ * Return: -errno
+ */
+int peci_request_status(struct peci_request *req)
+{
+	u8 cc = peci_request_data_cc(req);
+
+	if (cc != PECI_CC_SUCCESS)
+		dev_dbg(&req->device->dev, "ret: %#02x\n", cc);
+
+	switch (cc) {
+	case PECI_CC_SUCCESS:
+		return 0;
+	case PECI_CC_NEED_RETRY:
+	case PECI_CC_OUT_OF_RESOURCE:
+	case PECI_CC_UNAVAIL_RESOURCE:
+		return -EAGAIN;
+	case PECI_CC_INVALID_REQ:
+		return -EINVAL;
+	case PECI_CC_MCA_ERROR:
+	case PECI_CC_CATASTROPHIC_MCA_ERROR:
+	case PECI_CC_FATAL_MCA_ERROR:
+	case PECI_CC_PARITY_ERR_GPSB_OR_PMSB:
+	case PECI_CC_PARITY_ERR_GPSB_OR_PMSB_IERR:
+	case PECI_CC_PARITY_ERR_GPSB_OR_PMSB_MCA:
+		return -EIO;
+	}
+
+	WARN_ONCE(1, "Unknown PECI completion code: %#02x\n", cc);
+
+	return -EIO;
+}
+EXPORT_SYMBOL_NS_GPL(peci_request_status, PECI);
+
+static int peci_request_xfer(struct peci_request *req)
+{
+	struct peci_device *device = req->device;
+	struct peci_controller *controller = device->controller;
+	int ret;
+
+	mutex_lock(&controller->bus_lock);
+	ret = controller->xfer(controller, device->addr, req);
+	mutex_unlock(&controller->bus_lock);
+
+	return ret;
+}
+
+static int peci_request_xfer_retry(struct peci_request *req)
+{
+	long wait_interval = PECI_RETRY_INTERVAL_MIN;
+	struct peci_device *device = req->device;
+	struct peci_controller *controller = device->controller;
+	unsigned long start = jiffies;
+	int ret;
+
+	/* Don't try to use it for ping */
+	if (WARN_ON(!req->rx.buf))
+		return 0;
+
+	do {
+		ret = peci_request_xfer(req);
+		if (ret) {
+			dev_dbg(&controller->dev, "xfer error: %d\n", ret);
+			return ret;
+		}
+
+		if (peci_request_status(req) != -EAGAIN)
+			return 0;
+
+		/* Set the retry bit to indicate a retry attempt */
+		req->tx.buf[1] |= PECI_RETRY_BIT;
+
+		if (schedule_timeout_interruptible(wait_interval))
+			return -ERESTARTSYS;
+
+		wait_interval *= 2;
+		if (wait_interval > PECI_RETRY_INTERVAL_MAX)
+			wait_interval = PECI_RETRY_INTERVAL_MAX;
+	} while (time_before(jiffies, start + PECI_RETRY_TIMEOUT));
+
+	dev_dbg(&controller->dev, "request timed out\n");
+
+	return -ETIMEDOUT;
+}
+
 /**
  * peci_request_alloc() - allocate &struct peci_request with buffers with given lengths
  * @device: PECI device to which request is going to be sent
@@ -72,3 +201,91 @@ void peci_request_free(struct peci_request *req)
 	kfree(req);
 }
 EXPORT_SYMBOL_NS_GPL(peci_request_free, PECI);
+
+struct peci_request *peci_get_dib(struct peci_device *device)
+{
+	struct peci_request *req;
+	int ret;
+
+	req = peci_request_alloc(device, PECI_GET_DIB_WR_LEN, PECI_GET_DIB_RD_LEN);
+	if (!req)
+		return ERR_PTR(-ENOMEM);
+
+	req->tx.buf[0] = PECI_GET_DIB_CMD;
+
+	ret = peci_request_xfer(req);
+	if (ret) {
+		peci_request_free(req);
+		return ERR_PTR(ret);
+	}
+
+	return req;
+}
+EXPORT_SYMBOL_NS_GPL(peci_get_dib, PECI);
+
+static struct peci_request *
+__pkg_cfg_read(struct peci_device *device, u8 index, u16 param, u8 len)
+{
+	struct peci_request *req;
+	int ret;
+
+	req = peci_request_alloc(device, PECI_RDPKGCFG_WRITE_LEN,
+				 PECI_RDPKGCFG_READ_LEN_BASE + len);
+	if (!req)
+		return ERR_PTR(-ENOMEM);
+
+	req->tx.buf[0] = PECI_RDPKGCFG_CMD;
+	req->tx.buf[1] = 0;
+	req->tx.buf[2] = index;
+	put_unaligned_le16(param, &req->tx.buf[3]);
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
+u8 peci_request_data_readb(struct peci_request *req)
+{
+	return req->rx.buf[1];
+}
+EXPORT_SYMBOL_NS_GPL(peci_request_data_readb, PECI);
+
+u16 peci_request_data_readw(struct peci_request *req)
+{
+	return get_unaligned_le16(&req->rx.buf[1]);
+}
+EXPORT_SYMBOL_NS_GPL(peci_request_data_readw, PECI);
+
+u32 peci_request_data_readl(struct peci_request *req)
+{
+	return get_unaligned_le32(&req->rx.buf[1]);
+}
+EXPORT_SYMBOL_NS_GPL(peci_request_data_readl, PECI);
+
+u64 peci_request_data_readq(struct peci_request *req)
+{
+	return get_unaligned_le64(&req->rx.buf[1]);
+}
+EXPORT_SYMBOL_NS_GPL(peci_request_data_readq, PECI);
+
+u64 peci_request_data_dib(struct peci_request *req)
+{
+	return get_unaligned_le64(&req->rx.buf[0]);
+}
+EXPORT_SYMBOL_NS_GPL(peci_request_data_dib, PECI);
+
+#define __read_pkg_config(x, type) \
+struct peci_request *peci_pkg_cfg_##x(struct peci_device *device, u8 index, u16 param) \
+{ \
+	return __pkg_cfg_read(device, index, param, sizeof(type)); \
+} \
+EXPORT_SYMBOL_NS_GPL(peci_pkg_cfg_##x, PECI)
+
+__read_pkg_config(readb, u8);
+__read_pkg_config(readw, u16);
+__read_pkg_config(readl, u32);
+__read_pkg_config(readq, u64);
diff --git a/include/linux/peci.h b/include/linux/peci.h
index cdf3008321fd..f9f37b874011 100644
--- a/include/linux/peci.h
+++ b/include/linux/peci.h
@@ -9,6 +9,14 @@
 #include <linux/mutex.h>
 #include <linux/types.h>
 
+#define PECI_PCS_PKG_ID			0  /* Package Identifier Read */
+#define  PECI_PKG_ID_CPU_ID		0x0000  /* CPUID Info */
+#define  PECI_PKG_ID_PLATFORM_ID	0x0001  /* Platform ID */
+#define  PECI_PKG_ID_DEVICE_ID		0x0002  /* Uncore Device ID */
+#define  PECI_PKG_ID_MAX_THREAD_ID	0x0003  /* Max Thread ID */
+#define  PECI_PKG_ID_MICROCODE_REV	0x0004  /* CPU Microcode Update Revision */
+#define  PECI_PKG_ID_MCA_ERROR_LOG	0x0005  /* Machine Check Status */
+
 struct peci_request;
 
 /**
@@ -41,6 +49,11 @@ static inline struct peci_controller *to_peci_controller(void *d)
  * struct peci_device - PECI device
  * @dev: device object to register PECI device to the device model
  * @controller: manages the bus segment hosting this PECI device
+ * @info: PECI device characteristics
+ * @info.family: device family
+ * @info.model: device model
+ * @info.peci_revision: PECI revision supported by the PECI device
+ * @info.socket_id: the socket ID represented by the PECI device
  * @addr: address used on the PECI bus connected to the parent controller
  *
  * A peci_device identifies a single device (i.e. CPU) connected to a PECI bus.
@@ -50,6 +63,12 @@ static inline struct peci_controller *to_peci_controller(void *d)
 struct peci_device {
 	struct device dev;
 	struct peci_controller *controller;
+	struct {
+		u16 family;
+		u8 model;
+		u8 peci_revision;
+		u8 socket_id;
+	} info;
 	u8 addr;
 };
 
diff --git a/lib/Kconfig b/lib/Kconfig
index cc28bc1f2d84..a74e6c0fa75c 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -721,5 +721,5 @@ config ASN1_ENCODER
 
 config GENERIC_LIB_X86
 	bool
-	depends on X86
+	depends on X86 || PECI
 	default n
-- 
2.31.1

