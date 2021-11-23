Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA5745A4E9
	for <lists+openbmc@lfdr.de>; Tue, 23 Nov 2021 15:12:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz5gT41yvz3cS0
	for <lists+openbmc@lfdr.de>; Wed, 24 Nov 2021 01:12:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hz5fQ5Xfcz3cP3;
 Wed, 24 Nov 2021 01:11:26 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="321258975"
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; d="scan'208";a="321258975"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2021 06:10:24 -0800
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; d="scan'208";a="509032315"
Received: from romanagn-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.144.24])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2021 06:10:16 -0800
From: Iwona Winiarska <iwona.winiarska@intel.com>
To: linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v4 06/13] peci: Add device detection
Date: Tue, 23 Nov 2021 15:06:59 +0100
Message-Id: <20211123140706.2945700-7-iwona.winiarska@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211123140706.2945700-1-iwona.winiarska@intel.com>
References: <20211123140706.2945700-1-iwona.winiarska@intel.com>
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
 Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Iwona Winiarska <iwona.winiarska@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Randy Dunlap <rdunlap@infradead.org>, Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Since PECI devices are discoverable, we can dynamically detect devices
that are actually available in the system.

This change complements the earlier implementation by rescanning PECI
bus to detect available devices. For this purpose, it also introduces the
minimal API for PECI requests.

Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/peci/Makefile   |   2 +-
 drivers/peci/core.c     |  33 +++++++++++
 drivers/peci/device.c   | 120 ++++++++++++++++++++++++++++++++++++++++
 drivers/peci/internal.h |  14 +++++
 drivers/peci/request.c  |  55 ++++++++++++++++++
 include/linux/peci.h    |   2 +
 6 files changed, 225 insertions(+), 1 deletion(-)
 create mode 100644 drivers/peci/device.c
 create mode 100644 drivers/peci/request.c

diff --git a/drivers/peci/Makefile b/drivers/peci/Makefile
index 926d8df15cbd..c5f9d3fe21bb 100644
--- a/drivers/peci/Makefile
+++ b/drivers/peci/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 # Core functionality
-peci-y := core.o
+peci-y := core.o request.o device.o
 obj-$(CONFIG_PECI) += peci.o
 
 # Hardware specific bus drivers
diff --git a/drivers/peci/core.c b/drivers/peci/core.c
index 73ad0a47fa9d..c3361e6e043a 100644
--- a/drivers/peci/core.c
+++ b/drivers/peci/core.c
@@ -29,6 +29,20 @@ struct device_type peci_controller_type = {
 	.release	= peci_controller_dev_release,
 };
 
+static int peci_controller_scan_devices(struct peci_controller *controller)
+{
+	int ret;
+	u8 addr;
+
+	for (addr = PECI_BASE_ADDR; addr < PECI_BASE_ADDR + PECI_DEVICE_NUM_MAX; addr++) {
+		ret = peci_device_create(controller, addr);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static struct peci_controller *peci_controller_alloc(struct device *dev,
 						     struct peci_controller_ops *ops)
 {
@@ -64,10 +78,23 @@ static struct peci_controller *peci_controller_alloc(struct device *dev,
 	return ERR_PTR(ret);
 }
 
+static int unregister_child(struct device *dev, void *dummy)
+{
+	peci_device_destroy(to_peci_device(dev));
+
+	return 0;
+}
+
 static void unregister_controller(void *_controller)
 {
 	struct peci_controller *controller = _controller;
 
+	/*
+	 * Detach any active PECI devices. This can't fail, thus we do not
+	 * check the returned value.
+	 */
+	device_for_each_child_reverse(&controller->dev, NULL, unregister_child);
+
 	device_unregister(&controller->dev);
 
 	fwnode_handle_put(controller->dev.fwnode);
@@ -113,6 +140,12 @@ struct peci_controller *devm_peci_controller_add(struct device *dev,
 	if (ret)
 		return ERR_PTR(ret);
 
+	/*
+	 * Ignoring retval since failures during scan are non-critical for
+	 * controller itself.
+	 */
+	peci_controller_scan_devices(controller);
+
 	return controller;
 
 err_fwnode:
diff --git a/drivers/peci/device.c b/drivers/peci/device.c
new file mode 100644
index 000000000000..2b3a2d893aaf
--- /dev/null
+++ b/drivers/peci/device.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2018-2021 Intel Corporation
+
+#include <linux/peci.h>
+#include <linux/slab.h>
+
+#include "internal.h"
+
+/*
+ * PECI device can be removed using sysfs, but the removal can also happen as
+ * a result of controller being removed.
+ * Mutex is used to protect PECI device from being double-deleted.
+ */
+static DEFINE_MUTEX(peci_device_del_lock);
+
+static int peci_detect(struct peci_controller *controller, u8 addr)
+{
+	/*
+	 * PECI Ping is a command encoded by tx_len = 0, rx_len = 0.
+	 * We expect correct Write FCS if the device at the target address
+	 * is able to respond.
+	 */
+	struct peci_request req = { 0 };
+	int ret;
+
+	mutex_lock(&controller->bus_lock);
+	ret = controller->ops->xfer(controller, addr, &req);
+	mutex_unlock(&controller->bus_lock);
+
+	return ret;
+}
+
+static bool peci_addr_valid(u8 addr)
+{
+	return addr >= PECI_BASE_ADDR && addr < PECI_BASE_ADDR + PECI_DEVICE_NUM_MAX;
+}
+
+static int peci_dev_exists(struct device *dev, void *data)
+{
+	struct peci_device *device = to_peci_device(dev);
+	u8 *addr = data;
+
+	if (device->addr == *addr)
+		return -EBUSY;
+
+	return 0;
+}
+
+int peci_device_create(struct peci_controller *controller, u8 addr)
+{
+	struct peci_device *device;
+	int ret;
+
+	if (!peci_addr_valid(addr))
+		return -EINVAL;
+
+	/* Check if we have already detected this device before. */
+	ret = device_for_each_child(&controller->dev, &addr, peci_dev_exists);
+	if (ret)
+		return 0;
+
+	ret = peci_detect(controller, addr);
+	if (ret) {
+		/*
+		 * Device not present or host state doesn't allow successful
+		 * detection at this time.
+		 */
+		if (ret == -EIO || ret == -ETIMEDOUT)
+			return 0;
+
+		return ret;
+	}
+
+	device = kzalloc(sizeof(*device), GFP_KERNEL);
+	if (!device)
+		return -ENOMEM;
+
+	device_initialize(&device->dev);
+
+	device->addr = addr;
+	device->dev.parent = &controller->dev;
+	device->dev.bus = &peci_bus_type;
+	device->dev.type = &peci_device_type;
+
+	ret = dev_set_name(&device->dev, "%d-%02x", controller->id, device->addr);
+	if (ret)
+		goto err_put;
+
+	ret = device_add(&device->dev);
+	if (ret)
+		goto err_put;
+
+	return 0;
+
+err_put:
+	put_device(&device->dev);
+
+	return ret;
+}
+
+void peci_device_destroy(struct peci_device *device)
+{
+	mutex_lock(&peci_device_del_lock);
+	if (!device->deleted) {
+		device_unregister(&device->dev);
+		device->deleted = true;
+	}
+	mutex_unlock(&peci_device_del_lock);
+}
+
+static void peci_device_release(struct device *dev)
+{
+	struct peci_device *device = to_peci_device(dev);
+
+	kfree(device);
+}
+
+struct device_type peci_device_type = {
+	.release	= peci_device_release,
+};
diff --git a/drivers/peci/internal.h b/drivers/peci/internal.h
index 918dea745a86..57d11a902c5d 100644
--- a/drivers/peci/internal.h
+++ b/drivers/peci/internal.h
@@ -8,6 +8,20 @@
 #include <linux/types.h>
 
 struct peci_controller;
+struct peci_device;
+struct peci_request;
+
+/* PECI CPU address range 0x30-0x37 */
+#define PECI_BASE_ADDR		0x30
+#define PECI_DEVICE_NUM_MAX	8
+
+struct peci_request *peci_request_alloc(struct peci_device *device, u8 tx_len, u8 rx_len);
+void peci_request_free(struct peci_request *req);
+
+extern struct device_type peci_device_type;
+
+int peci_device_create(struct peci_controller *controller, u8 addr);
+void peci_device_destroy(struct peci_device *device);
 
 extern struct bus_type peci_bus_type;
 
diff --git a/drivers/peci/request.c b/drivers/peci/request.c
new file mode 100644
index 000000000000..7dee51c50dd2
--- /dev/null
+++ b/drivers/peci/request.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2021 Intel Corporation
+
+#include <linux/export.h>
+#include <linux/peci.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#include "internal.h"
+
+/**
+ * peci_request_alloc() - allocate &struct peci_requests
+ * @device: PECI device to which request is going to be sent
+ * @tx_len: TX length
+ * @rx_len: RX length
+ *
+ * Return: A pointer to a newly allocated &struct peci_request on success or NULL otherwise.
+ */
+struct peci_request *peci_request_alloc(struct peci_device *device, u8 tx_len, u8 rx_len)
+{
+	struct peci_request *req;
+
+	/*
+	 * TX and RX buffers are fixed length members of peci_request, this is
+	 * just a warn for developers to make sure to expand the buffers (or
+	 * change the allocation method) if we go over the current limit.
+	 */
+	if (WARN_ON_ONCE(tx_len > PECI_REQUEST_MAX_BUF_SIZE || rx_len > PECI_REQUEST_MAX_BUF_SIZE))
+		return NULL;
+	/*
+	 * PECI controllers that we are using now don't support DMA, this
+	 * should be converted to DMA API once support for controllers that do
+	 * allow it is added to avoid an extra copy.
+	 */
+	req = kzalloc(sizeof(*req), GFP_KERNEL);
+	if (!req)
+		return NULL;
+
+	req->device = device;
+	req->tx.len = tx_len;
+	req->rx.len = rx_len;
+
+	return req;
+}
+EXPORT_SYMBOL_NS_GPL(peci_request_alloc, PECI);
+
+/**
+ * peci_request_free() - free peci_request
+ * @req: the PECI request to be freed
+ */
+void peci_request_free(struct peci_request *req)
+{
+	kfree(req);
+}
+EXPORT_SYMBOL_NS_GPL(peci_request_free, PECI);
diff --git a/include/linux/peci.h b/include/linux/peci.h
index 26e0a4e73b50..7e35673f3786 100644
--- a/include/linux/peci.h
+++ b/include/linux/peci.h
@@ -60,6 +60,7 @@ static inline struct peci_controller *to_peci_controller(void *d)
  * @dev: device object to register PECI device to the device model
  * @controller: manages the bus segment hosting this PECI device
  * @addr: address used on the PECI bus connected to the parent controller
+ * @deleted: indicates that PECI device was already deleted
  *
  * A peci_device identifies a single device (i.e. CPU) connected to a PECI bus.
  * The behaviour exposed to the rest of the system is defined by the PECI driver
@@ -68,6 +69,7 @@ static inline struct peci_controller *to_peci_controller(void *d)
 struct peci_device {
 	struct device dev;
 	u8 addr;
+	bool deleted;
 };
 
 static inline struct peci_device *to_peci_device(struct device *d)
-- 
2.31.1

