Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D012D4A73DB
	for <lists+openbmc@lfdr.de>; Wed,  2 Feb 2022 15:56:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JplHw4mnjz3bcW
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 01:56:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IRG7d8u4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=iwona.winiarska@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IRG7d8u4; dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JplF94pwyz3bsp;
 Thu,  3 Feb 2022 01:54:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643813662; x=1675349662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VYVcyYlilG/IomhSUP7zts1Mfzq10W8u10sEZ/E14z8=;
 b=IRG7d8u469oS8fNOehuFuflW/KSoiS6J7uP4ryXOBp2BYhZp1yv+RSa1
 WOttIg47CQR5zCvkR+NauExgHwG+BWb2YY5gWSCnFTKJNscU7cNFuc0qE
 XzjmZpkstki8z4E3VJOZmAw647WXj6XG6dIJ14COVKlYqhU0286x42B8P
 /K7IGKRc54tBltfmmgdasM3iBGCUGLRBpmf0OoDZhGWYDZ64scx9tD6ac
 /rIxvrswLFIdPJ2E7PztToG4r8xd7iIGhZTUN9xSDoaIhCzAioI+Ey66/
 1z7HX4ewpubtM6BZtkz1dYk3B/qIcVcqunFeWqsz0VZvsi0nQASvlGTLc w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="246758370"
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; d="scan'208";a="246758370"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 06:53:18 -0800
X-IronPort-AV: E=Sophos;i="5.88,337,1635231600"; d="scan'208";a="630940988"
Received: from mwnuczyn-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.137.160])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 06:53:09 -0800
From: Iwona Winiarska <iwona.winiarska@intel.com>
To: linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v7 07/13] peci: Add sysfs interface for PECI bus
Date: Wed,  2 Feb 2022 15:48:32 +0100
Message-Id: <20220202144838.163875-8-iwona.winiarska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220202144838.163875-1-iwona.winiarska@intel.com>
References: <20220202144838.163875-1-iwona.winiarska@intel.com>
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

PECI devices may not be discoverable at the time when PECI controller is
being added (e.g. BMC can boot up when the Host system is still in S5).
Since we currently don't have the capabilities to figure out the Host
system state inside the PECI subsystem itself, we have to rely on
userspace to do it for us.

In the future, PECI subsystem may be expanded with mechanisms that allow
us to avoid depending on userspace interaction (e.g. CPU presence could
be detected using GPIO, and the information on whether it's discoverable
could be obtained over IPMI).
Unfortunately, those methods may ultimately not be available (support
will vary from platform to platform), which means that we still need
platform independent method triggered by userspace.

Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
---
 Documentation/ABI/testing/sysfs-bus-peci | 16 +++++
 drivers/peci/Makefile                    |  2 +-
 drivers/peci/core.c                      |  3 +-
 drivers/peci/device.c                    |  1 +
 drivers/peci/internal.h                  |  5 ++
 drivers/peci/sysfs.c                     | 82 ++++++++++++++++++++++++
 6 files changed, 107 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-peci
 create mode 100644 drivers/peci/sysfs.c

diff --git a/Documentation/ABI/testing/sysfs-bus-peci b/Documentation/ABI/testing/sysfs-bus-peci
new file mode 100644
index 000000000000..56c2b2216bbd
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-peci
@@ -0,0 +1,16 @@
+What:		/sys/bus/peci/rescan
+Date:		July 2021
+KernelVersion:	5.15
+Contact:	Iwona Winiarska <iwona.winiarska@intel.com>
+Description:
+		Writing a non-zero value to this attribute will
+		initiate scan for PECI devices on all PECI controllers
+		in the system.
+
+What:		/sys/bus/peci/devices/<controller_id>-<device_addr>/remove
+Date:		July 2021
+KernelVersion:	5.15
+Contact:	Iwona Winiarska <iwona.winiarska@intel.com>
+Description:
+		Writing a non-zero value to this attribute will
+		remove the PECI device and any of its children.
diff --git a/drivers/peci/Makefile b/drivers/peci/Makefile
index c5f9d3fe21bb..917f689e147a 100644
--- a/drivers/peci/Makefile
+++ b/drivers/peci/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 # Core functionality
-peci-y := core.o request.o device.o
+peci-y := core.o request.o device.o sysfs.o
 obj-$(CONFIG_PECI) += peci.o
 
 # Hardware specific bus drivers
diff --git a/drivers/peci/core.c b/drivers/peci/core.c
index c3361e6e043a..e993615cf521 100644
--- a/drivers/peci/core.c
+++ b/drivers/peci/core.c
@@ -29,7 +29,7 @@ struct device_type peci_controller_type = {
 	.release	= peci_controller_dev_release,
 };
 
-static int peci_controller_scan_devices(struct peci_controller *controller)
+int peci_controller_scan_devices(struct peci_controller *controller)
 {
 	int ret;
 	u8 addr;
@@ -162,6 +162,7 @@ EXPORT_SYMBOL_NS_GPL(devm_peci_controller_add, PECI);
 
 struct bus_type peci_bus_type = {
 	.name		= "peci",
+	.bus_groups	= peci_bus_groups,
 };
 
 static int __init peci_init(void)
diff --git a/drivers/peci/device.c b/drivers/peci/device.c
index 2b3a2d893aaf..d10ed1cfcd48 100644
--- a/drivers/peci/device.c
+++ b/drivers/peci/device.c
@@ -116,5 +116,6 @@ static void peci_device_release(struct device *dev)
 }
 
 struct device_type peci_device_type = {
+	.groups		= peci_device_groups,
 	.release	= peci_device_release,
 };
diff --git a/drivers/peci/internal.h b/drivers/peci/internal.h
index 57d11a902c5d..978e12c8e1d3 100644
--- a/drivers/peci/internal.h
+++ b/drivers/peci/internal.h
@@ -8,6 +8,7 @@
 #include <linux/types.h>
 
 struct peci_controller;
+struct attribute_group;
 struct peci_device;
 struct peci_request;
 
@@ -19,12 +20,16 @@ struct peci_request *peci_request_alloc(struct peci_device *device, u8 tx_len, u
 void peci_request_free(struct peci_request *req);
 
 extern struct device_type peci_device_type;
+extern const struct attribute_group *peci_device_groups[];
 
 int peci_device_create(struct peci_controller *controller, u8 addr);
 void peci_device_destroy(struct peci_device *device);
 
 extern struct bus_type peci_bus_type;
+extern const struct attribute_group *peci_bus_groups[];
 
 extern struct device_type peci_controller_type;
 
+int peci_controller_scan_devices(struct peci_controller *controller);
+
 #endif /* __PECI_INTERNAL_H */
diff --git a/drivers/peci/sysfs.c b/drivers/peci/sysfs.c
new file mode 100644
index 000000000000..db9ef05776e3
--- /dev/null
+++ b/drivers/peci/sysfs.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2021 Intel Corporation
+
+#include <linux/device.h>
+#include <linux/kernel.h>
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
+
+static ssize_t remove_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
+{
+	struct peci_device *device = to_peci_device(dev);
+	bool res;
+	int ret;
+
+	ret = kstrtobool(buf, &res);
+	if (ret)
+		return ret;
+
+	if (res && device_remove_file_self(dev, attr))
+		peci_device_destroy(device);
+
+	return count;
+}
+static DEVICE_ATTR_IGNORE_LOCKDEP(remove, 0200, NULL, remove_store);
+
+static struct attribute *peci_device_attrs[] = {
+	&dev_attr_remove.attr,
+	NULL
+};
+
+static const struct attribute_group peci_device_group = {
+	.attrs = peci_device_attrs,
+};
+
+const struct attribute_group *peci_device_groups[] = {
+	&peci_device_group,
+	NULL
+};
-- 
2.34.1

