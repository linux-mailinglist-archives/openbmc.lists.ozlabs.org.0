Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6373C6626
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 00:11:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GNyf01w5Nz308G
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 08:11:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GNydF2XlWz3bNy;
 Tue, 13 Jul 2021 08:10:41 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="295709105"
X-IronPort-AV: E=Sophos;i="5.84,235,1620716400"; d="scan'208";a="295709105"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 15:09:38 -0700
X-IronPort-AV: E=Sophos;i="5.84,235,1620716400"; d="scan'208";a="464388618"
Received: from jzloch-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.136.11])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 15:09:33 -0700
From: Iwona Winiarska <iwona.winiarska@intel.com>
To: linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH 06/14] peci: Add core infrastructure
Date: Tue, 13 Jul 2021 00:04:39 +0200
Message-Id: <20210712220447.957418-7-iwona.winiarska@intel.com>
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
 Jason M Bills <jason.m.bills@linux.intel.com>,
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

Intel processors provide access for various services designed to support
processor and DRAM thermal management, platform manageability and
processor interface tuning and diagnostics.
Those services are available via the Platform Environment Control
Interface (PECI) that provides a communication channel between the
processor and the Baseboard Management Controller (BMC) or other
platform management device.

This change introduces PECI subsystem by adding the initial core module
and API for controller drivers.

Co-developed-by: Jason M Bills <jason.m.bills@linux.intel.com>
Signed-off-by: Jason M Bills <jason.m.bills@linux.intel.com>
Co-developed-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 MAINTAINERS             |   9 +++
 drivers/Kconfig         |   3 +
 drivers/Makefile        |   1 +
 drivers/peci/Kconfig    |  14 ++++
 drivers/peci/Makefile   |   5 ++
 drivers/peci/core.c     | 166 ++++++++++++++++++++++++++++++++++++++++
 drivers/peci/internal.h |  20 +++++
 drivers/peci/sysfs.c    |  48 ++++++++++++
 include/linux/peci.h    |  82 ++++++++++++++++++++
 9 files changed, 348 insertions(+)
 create mode 100644 drivers/peci/Kconfig
 create mode 100644 drivers/peci/Makefile
 create mode 100644 drivers/peci/core.c
 create mode 100644 drivers/peci/internal.h
 create mode 100644 drivers/peci/sysfs.c
 create mode 100644 include/linux/peci.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 6f77aaca2a30..47411e2b6336 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14495,6 +14495,15 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/peaq-wmi.c
 
+PECI SUBSYSTEM
+M:	Iwona Winiarska <iwona.winiarska@intel.com>
+R:	Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
+L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
+S:	Supported
+F:	Documentation/devicetree/bindings/peci/
+F:	drivers/peci/
+F:	include/linux/peci.h
+
 PENSANDO ETHERNET DRIVERS
 M:	Shannon Nelson <snelson@pensando.io>
 M:	drivers@pensando.io
diff --git a/drivers/Kconfig b/drivers/Kconfig
index 8bad63417a50..f472b3d972b3 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -236,4 +236,7 @@ source "drivers/interconnect/Kconfig"
 source "drivers/counter/Kconfig"
 
 source "drivers/most/Kconfig"
+
+source "drivers/peci/Kconfig"
+
 endmenu
diff --git a/drivers/Makefile b/drivers/Makefile
index 27c018bdf4de..8d96f0c3dde5 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -189,3 +189,4 @@ obj-$(CONFIG_GNSS)		+= gnss/
 obj-$(CONFIG_INTERCONNECT)	+= interconnect/
 obj-$(CONFIG_COUNTER)		+= counter/
 obj-$(CONFIG_MOST)		+= most/
+obj-$(CONFIG_PECI)		+= peci/
diff --git a/drivers/peci/Kconfig b/drivers/peci/Kconfig
new file mode 100644
index 000000000000..601cc3c3c852
--- /dev/null
+++ b/drivers/peci/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+menuconfig PECI
+	tristate "PECI support"
+	help
+	  The Platform Environment Control Interface (PECI) is an interface
+	  that provides a communication channel to Intel processors and
+	  chipset components from external monitoring or control devices.
+
+	  If you want PECI support, you should say Y here and also to the
+	  specific driver for your bus adapter(s) below.
+
+	  This support is also available as a module. If so, the module
+	  will be called peci.
diff --git a/drivers/peci/Makefile b/drivers/peci/Makefile
new file mode 100644
index 000000000000..2bb2f51bcda7
--- /dev/null
+++ b/drivers/peci/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+# Core functionality
+peci-y := core.o sysfs.o
+obj-$(CONFIG_PECI) += peci.o
diff --git a/drivers/peci/core.c b/drivers/peci/core.c
new file mode 100644
index 000000000000..0ad00110459d
--- /dev/null
+++ b/drivers/peci/core.c
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2018-2021 Intel Corporation
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/bug.h>
+#include <linux/device.h>
+#include <linux/export.h>
+#include <linux/idr.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/peci.h>
+#include <linux/pm_runtime.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+
+#include "internal.h"
+
+static DEFINE_IDA(peci_controller_ida);
+
+static void peci_controller_dev_release(struct device *dev)
+{
+	struct peci_controller *controller = to_peci_controller(dev);
+
+	mutex_destroy(&controller->bus_lock);
+}
+
+struct device_type peci_controller_type = {
+	.release	= peci_controller_dev_release,
+};
+
+int peci_controller_scan_devices(struct peci_controller *controller)
+{
+	/* Just a stub, no support for actual devices yet */
+	return 0;
+}
+
+/**
+ * peci_controller_add() - Add PECI controller
+ * @controller: the PECI controller to be added
+ * @parent: device object to be registered as a parent
+ *
+ * In final stage of its probe(), peci_controller driver should include calling
+ * peci_controller_add() to register itself with the PECI bus.
+ * The caller is responsible for allocating the struct peci_controller and
+ * managing its lifetime, calling peci_controller_remove() prior to releasing
+ * the allocation.
+ *
+ * It returns zero on success, else a negative error code (dropping the
+ * controller's refcount). After a successful return, the caller is responsible
+ * for calling peci_controller_remove().
+ *
+ * Return: 0 if succeeded, other values in case errors.
+ */
+int peci_controller_add(struct peci_controller *controller, struct device *parent)
+{
+	struct fwnode_handle *node = fwnode_handle_get(dev_fwnode(parent));
+	int ret;
+
+	if (WARN_ON(!controller->xfer))
+		return -EINVAL;
+
+	ret = ida_alloc_max(&peci_controller_ida, U8_MAX, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+
+	controller->id = ret;
+
+	mutex_init(&controller->bus_lock);
+
+	controller->dev.parent = parent;
+	controller->dev.bus = &peci_bus_type;
+	controller->dev.type = &peci_controller_type;
+	controller->dev.fwnode = node;
+	controller->dev.of_node = to_of_node(node);
+
+	ret = dev_set_name(&controller->dev, "peci-%d", controller->id);
+	if (ret)
+		goto err_id;
+
+	ret = device_register(&controller->dev);
+	if (ret)
+		goto err_put;
+
+	pm_runtime_no_callbacks(&controller->dev);
+	pm_suspend_ignore_children(&controller->dev, true);
+	pm_runtime_enable(&controller->dev);
+
+	/*
+	 * Ignoring retval since failures during scan are non-critical for
+	 * controller itself.
+	 */
+	peci_controller_scan_devices(controller);
+
+	return 0;
+
+err_put:
+	put_device(&controller->dev);
+err_id:
+	fwnode_handle_put(controller->dev.fwnode);
+	ida_free(&peci_controller_ida, controller->id);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(peci_controller_add, PECI);
+
+static int _unregister(struct device *dev, void *dummy)
+{
+	/* Just a stub, no support for actual devices yet */
+	return 0;
+}
+
+/**
+ * peci_controller_remove - Delete PECI controller
+ * @controller: the PECI controller to be removed
+ *
+ * This call is used only by PECI controller drivers, which are the only ones
+ * directly touching chip registers.
+ *
+ * Note that this function also drops a reference to the controller.
+ */
+void peci_controller_remove(struct peci_controller *controller)
+{
+	pm_runtime_disable(&controller->dev);
+	/*
+	 * Detach any active PECI devices. This can't fail, thus we do not
+	 * check the returned value.
+	 */
+	device_for_each_child_reverse(&controller->dev, NULL, _unregister);
+
+	device_unregister(&controller->dev);
+	fwnode_handle_put(controller->dev.fwnode);
+	ida_free(&peci_controller_ida, controller->id);
+}
+EXPORT_SYMBOL_NS_GPL(peci_controller_remove, PECI);
+
+struct bus_type peci_bus_type = {
+	.name		= "peci",
+	.bus_groups	= peci_bus_groups,
+};
+
+static int __init peci_init(void)
+{
+	int ret;
+
+	ret = bus_register(&peci_bus_type);
+	if (ret < 0) {
+		pr_err("failed to register PECI bus type!\n");
+		return ret;
+	}
+
+	return 0;
+}
+subsys_initcall(peci_init);
+
+static void __exit peci_exit(void)
+{
+	bus_unregister(&peci_bus_type);
+}
+module_exit(peci_exit);
+
+MODULE_AUTHOR("Jason M Bills <jason.m.bills@linux.intel.com>");
+MODULE_AUTHOR("Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>");
+MODULE_AUTHOR("Iwona Winiarska <iwona.winiarska@intel.com>");
+MODULE_DESCRIPTION("PECI bus core module");
+MODULE_LICENSE("GPL");
diff --git a/drivers/peci/internal.h b/drivers/peci/internal.h
new file mode 100644
index 000000000000..80c61bcdfc6b
--- /dev/null
+++ b/drivers/peci/internal.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (c) 2018-2021 Intel Corporation */
+
+#ifndef __PECI_INTERNAL_H
+#define __PECI_INTERNAL_H
+
+#include <linux/device.h>
+#include <linux/types.h>
+
+struct peci_controller;
+struct attribute_group;
+
+extern struct bus_type peci_bus_type;
+extern const struct attribute_group *peci_bus_groups[];
+
+extern struct device_type peci_controller_type;
+
+int peci_controller_scan_devices(struct peci_controller *controller);
+
+#endif /* __PECI_INTERNAL_H */
diff --git a/drivers/peci/sysfs.c b/drivers/peci/sysfs.c
new file mode 100644
index 000000000000..36c5e2a18a92
--- /dev/null
+++ b/drivers/peci/sysfs.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2021 Intel Corporation
+
+#include <linux/peci.h>
+
+#include "internal.h"
+
+static int rescan_controller(struct device *dev, void *data)
+{
+	if (dev->type != &peci_controller_type)
+		return 0;
+
+	return peci_controller_scan_devices(to_peci_controller(dev));
+}
+
+static ssize_t rescan_store(struct bus_type *bus, const char *buf, size_t count)
+{
+	bool res;
+	int ret;
+
+	ret = kstrtobool(buf, &res);
+	if (ret)
+		return ret;
+
+	if (!res)
+		return count;
+
+	ret = bus_for_each_dev(&peci_bus_type, NULL, NULL, rescan_controller);
+	if (ret)
+		return ret;
+
+	return count;
+}
+static BUS_ATTR_WO(rescan);
+
+static struct attribute *peci_bus_attrs[] = {
+	&bus_attr_rescan.attr,
+	NULL
+};
+
+static const struct attribute_group peci_bus_group = {
+	.attrs = peci_bus_attrs,
+};
+
+const struct attribute_group *peci_bus_groups[] = {
+	&peci_bus_group,
+	NULL
+};
diff --git a/include/linux/peci.h b/include/linux/peci.h
new file mode 100644
index 000000000000..cdf3008321fd
--- /dev/null
+++ b/include/linux/peci.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (c) 2018-2021 Intel Corporation */
+
+#ifndef __LINUX_PECI_H
+#define __LINUX_PECI_H
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+
+struct peci_request;
+
+/**
+ * struct peci_controller - PECI controller
+ * @dev: device object to register PECI controller to the device model
+ * @xfer: PECI transfer function
+ * @bus_lock: lock used to protect multiple callers
+ * @id: PECI controller ID
+ *
+ * PECI controllers usually connect to their drivers using non-PECI bus,
+ * such as the platform bus.
+ * Each PECI controller can communicate with one or more PECI devices.
+ */
+struct peci_controller {
+	struct device dev;
+	int (*xfer)(struct peci_controller *controller, u8 addr, struct peci_request *req);
+	struct mutex bus_lock; /* held for the duration of xfer */
+	u8 id;
+};
+
+int peci_controller_add(struct peci_controller *controller, struct device *parent);
+void peci_controller_remove(struct peci_controller *controller);
+
+static inline struct peci_controller *to_peci_controller(void *d)
+{
+	return container_of(d, struct peci_controller, dev);
+}
+
+/**
+ * struct peci_device - PECI device
+ * @dev: device object to register PECI device to the device model
+ * @controller: manages the bus segment hosting this PECI device
+ * @addr: address used on the PECI bus connected to the parent controller
+ *
+ * A peci_device identifies a single device (i.e. CPU) connected to a PECI bus.
+ * The behaviour exposed to the rest of the system is defined by the PECI driver
+ * managing the device.
+ */
+struct peci_device {
+	struct device dev;
+	struct peci_controller *controller;
+	u8 addr;
+};
+
+static inline struct peci_device *to_peci_device(struct device *d)
+{
+	return container_of(d, struct peci_device, dev);
+}
+
+/**
+ * struct peci_request - PECI request
+ * @device: PECI device to which the request is sent
+ * @tx: TX buffer specific data
+ * @tx.buf: pointer to TX buffer
+ * @tx.len: transfer data length in bytes
+ * @rx: RX buffer specific data
+ * @rx.buf: pointer to RX buffer
+ * @rx.len: received data length in bytes
+ *
+ * A peci_request represents a request issued by PECI originator (TX) and
+ * a response received from PECI responder (RX).
+ */
+struct peci_request {
+	struct peci_device *device;
+	struct {
+		u8 *buf;
+		u8 len;
+	} rx, tx;
+};
+
+#endif /* __LINUX_PECI_H */
-- 
2.31.1

