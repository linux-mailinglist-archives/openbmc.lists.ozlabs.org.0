Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E3D3DF8D7
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 02:19:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfXRD0Mlgz3bW7
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 10:19:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfCWG4lY6z2yNZ;
 Tue,  3 Aug 2021 21:36:26 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10064"; a="213692604"
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; d="scan'208";a="213692604"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 04:35:24 -0700
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; d="scan'208";a="441135155"
Received: from jdanieck-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.128.99])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 04:35:17 -0700
From: Iwona Winiarska <iwona.winiarska@intel.com>
To: linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 08/15] peci: Add device detection
Date: Tue,  3 Aug 2021 13:31:27 +0200
Message-Id: <20210803113134.2262882-9-iwona.winiarska@intel.com>
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

Since PECI devices are discoverable, we can dynamically detect devices
that are actually available in the system.

This change complements the earlier implementation by rescanning PECI
bus to detect available devices. For this purpose, it also introduces the
minimal API for PECI requests.

Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/peci/Makefile   |   2 +-
 drivers/peci/core.c     |  33 ++++++++++++
 drivers/peci/device.c   | 114 ++++++++++++++++++++++++++++++++++++++++
 drivers/peci/internal.h |  14 +++++
 drivers/peci/request.c  |  50 ++++++++++++++++++
 5 files changed, 212 insertions(+), 1 deletion(-)
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
index 7b3938af0396..d143f1a7fe98 100644
--- a/drivers/peci/core.c
+++ b/drivers/peci/core.c
@@ -34,6 +34,20 @@ struct device_type peci_controller_type = {
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
@@ -76,10 +90,23 @@ static struct peci_controller *peci_controller_alloc(struct device *dev,
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
 }
 
@@ -115,6 +142,12 @@ struct peci_controller *devm_peci_controller_add(struct device *dev,
 	if (ret)
 		return ERR_PTR(ret);
 
+	/*
+	 * Ignoring retval since failures during scan are non-critical for
+	 * controller itself.
+	 */
+	peci_controller_scan_devices(controller);
+
 	return controller;
 
 err:
diff --git a/drivers/peci/device.c b/drivers/peci/device.c
new file mode 100644
index 000000000000..32811248997b
--- /dev/null
+++ b/drivers/peci/device.c
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2018-2021 Intel Corporation
+
+#include <linux/peci.h>
+#include <linux/slab.h>
+
+#include "internal.h"
+
+static int peci_detect(struct peci_controller *controller, u8 addr)
+{
+	struct peci_request *req;
+	int ret;
+
+	/*
+	 * PECI Ping is a command encoded by tx_len = 0, rx_len = 0.
+	 * We expect correct Write FCS if the device at the target address
+	 * is able to respond.
+	 */
+	req = peci_request_alloc(NULL, 0, 0);
+	if (!req)
+		return -ENOMEM;
+
+	mutex_lock(&controller->bus_lock);
+	ret = controller->ops->xfer(controller, addr, req);
+	mutex_unlock(&controller->bus_lock);
+
+	peci_request_free(req);
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
+	if (WARN_ON(!peci_addr_valid(addr)))
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
+	device->addr = addr;
+	device->dev.parent = &controller->dev;
+	device->dev.bus = &peci_bus_type;
+	device->dev.type = &peci_device_type;
+
+	ret = dev_set_name(&device->dev, "%d-%02x", controller->id, device->addr);
+	if (ret)
+		goto err_free;
+
+	ret = device_register(&device->dev);
+	if (ret)
+		goto err_put;
+
+	return 0;
+
+err_put:
+	put_device(&device->dev);
+err_free:
+	kfree(device);
+
+	return ret;
+}
+
+void peci_device_destroy(struct peci_device *device)
+{
+	device_unregister(&device->dev);
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
index 000000000000..81b567bc7b87
--- /dev/null
+++ b/drivers/peci/request.c
@@ -0,0 +1,50 @@
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
-- 
2.31.1

