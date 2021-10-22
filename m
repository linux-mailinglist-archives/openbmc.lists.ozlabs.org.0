Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2021B436FB8
	for <lists+openbmc@lfdr.de>; Fri, 22 Oct 2021 04:02:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hb6zt3xqpz3cDn
	for <lists+openbmc@lfdr.de>; Fri, 22 Oct 2021 13:02:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=d32Nc7aV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=d32Nc7aV; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hb6yB1JMDz2ymg
 for <openbmc@lists.ozlabs.org>; Fri, 22 Oct 2021 13:00:49 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id AC68DB49;
 Thu, 21 Oct 2021 19:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1634868048;
 bh=7bg47D2PUr63KTjRLOr3QPGPVQLLJR5F+XwJqWsUVxg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d32Nc7aVCto4w6Kfipr6ZiL8YdmnB5OWrXB2lhs04vNQPWK+6EyeHSmMros6UlQlu
 3k3pSDbEuMoaMFI/V5OYe4FmeEtp3HfKObSMowHvvQjJ69rKZdSeBuAH9jlxfoxGYg
 mnUgrPoj2bSp1jM/i2Ypqq2xmph608ytcAVaee8w=
From: Zev Weiss <zev@bewilderbeest.net>
To: Frank Rowand <frowand.list@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 4/5] driver core: inhibit automatic driver binding on reserved
 devices
Date: Thu, 21 Oct 2021 19:00:31 -0700
Message-Id: <20211022020032.26980-5-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211022020032.26980-1-zev@bewilderbeest.net>
References: <20211022020032.26980-1-zev@bewilderbeest.net>
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
Cc: Zev Weiss <zev@bewilderbeest.net>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Rajat Jain <rajatja@google.com>, Jianxiong Gao <jxgao@google.com>,
 Dave Jiang <dave.jiang@intel.com>, kvm@vger.kernel.org,
 Saravana Kannan <saravanak@google.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Devices whose fwnodes are marked as reserved are instantiated, but
will not have a driver bound to them unless userspace explicitly
requests it by writing to a 'bind' sysfs file.  This is to enable
devices that may require special (userspace-mediated) preparation
before a driver can safely probe them.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/base/bus.c            |  2 +-
 drivers/base/dd.c             | 13 ++++++++-----
 drivers/dma/idxd/compat.c     |  3 +--
 drivers/vfio/mdev/mdev_core.c |  2 +-
 include/linux/device.h        | 14 +++++++++++++-
 5 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/base/bus.c b/drivers/base/bus.c
index bdc98c5713d5..8a30f9a02de0 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -211,7 +211,7 @@ static ssize_t bind_store(struct device_driver *drv, const char *buf,
 
 	dev = bus_find_device_by_name(bus, NULL, buf);
 	if (dev && driver_match_device(drv, dev)) {
-		err = device_driver_attach(drv, dev);
+		err = device_driver_attach(drv, dev, DRV_BIND_EXPLICIT);
 		if (!err) {
 			/* success */
 			err = count;
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 68ea1f949daa..ee64740a63d9 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -22,6 +22,7 @@
 #include <linux/dma-map-ops.h>
 #include <linux/init.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/kthread.h>
 #include <linux/wait.h>
 #include <linux/async.h>
@@ -727,13 +728,14 @@ void wait_for_device_probe(void)
 }
 EXPORT_SYMBOL_GPL(wait_for_device_probe);
 
-static int __driver_probe_device(struct device_driver *drv, struct device *dev)
+static int __driver_probe_device(struct device_driver *drv, struct device *dev, u32 flags)
 {
 	int ret = 0;
 
 	if (dev->p->dead || !device_is_registered(dev))
 		return -ENODEV;
-	if (dev->driver)
+	if (dev->driver ||
+	    (fwnode_device_is_reserved(dev->fwnode) && !(flags & DRV_BIND_EXPLICIT)))
 		return -EBUSY;
 
 	dev->can_match = true;
@@ -778,7 +780,7 @@ static int driver_probe_device(struct device_driver *drv, struct device *dev)
 	int ret;
 
 	atomic_inc(&probe_count);
-	ret = __driver_probe_device(drv, dev);
+	ret = __driver_probe_device(drv, dev, DRV_BIND_DEFAULT);
 	if (ret == -EPROBE_DEFER || ret == EPROBE_DEFER) {
 		driver_deferred_probe_add(dev);
 
@@ -1052,16 +1054,17 @@ static void __device_driver_unlock(struct device *dev, struct device *parent)
  * device_driver_attach - attach a specific driver to a specific device
  * @drv: Driver to attach
  * @dev: Device to attach it to
+ * @flags: Bitmask of DRV_BIND_* flags
  *
  * Manually attach driver to a device. Will acquire both @dev lock and
  * @dev->parent lock if needed. Returns 0 on success, -ERR on failure.
  */
-int device_driver_attach(struct device_driver *drv, struct device *dev)
+int device_driver_attach(struct device_driver *drv, struct device *dev, u32 flags)
 {
 	int ret;
 
 	__device_driver_lock(dev, dev->parent);
-	ret = __driver_probe_device(drv, dev);
+	ret = __driver_probe_device(drv, dev, flags);
 	__device_driver_unlock(dev, dev->parent);
 
 	/* also return probe errors as normal negative errnos */
diff --git a/drivers/dma/idxd/compat.c b/drivers/dma/idxd/compat.c
index 3df21615f888..51df38dea15a 100644
--- a/drivers/dma/idxd/compat.c
+++ b/drivers/dma/idxd/compat.c
@@ -7,7 +7,6 @@
 #include <linux/device/bus.h>
 #include "idxd.h"
 
-extern int device_driver_attach(struct device_driver *drv, struct device *dev);
 extern void device_driver_detach(struct device *dev);
 
 #define DRIVER_ATTR_IGNORE_LOCKDEP(_name, _mode, _show, _store)	\
@@ -56,7 +55,7 @@ static ssize_t bind_store(struct device_driver *drv, const char *buf, size_t cou
 	if (!alt_drv)
 		return -ENODEV;
 
-	rc = device_driver_attach(alt_drv, dev);
+	rc = device_driver_attach(alt_drv, dev, DRV_BIND_EXPLICIT);
 	if (rc < 0)
 		return rc;
 
diff --git a/drivers/vfio/mdev/mdev_core.c b/drivers/vfio/mdev/mdev_core.c
index b314101237fe..f42c6ec543c8 100644
--- a/drivers/vfio/mdev/mdev_core.c
+++ b/drivers/vfio/mdev/mdev_core.c
@@ -309,7 +309,7 @@ int mdev_device_create(struct mdev_type *type, const guid_t *uuid)
 
 	if (!drv)
 		drv = &vfio_mdev_driver;
-	ret = device_driver_attach(&drv->driver, &mdev->dev);
+	ret = device_driver_attach(&drv->driver, &mdev->dev, DRV_BIND_DEFAULT);
 	if (ret)
 		goto out_del;
 
diff --git a/include/linux/device.h b/include/linux/device.h
index e270cb740b9e..1ada1093799b 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -876,12 +876,24 @@ static inline void *dev_get_platdata(const struct device *dev)
 	return dev->platform_data;
 }
 
+/*
+ * Driver-binding flags (for passing to device_driver_attach())
+ *
+ * DRV_BIND_DEFAULT: a default, automatic bind, e.g. as a result of a device
+ *                   being added for which we already have a driver, or vice
+ *                   versa.
+ * DRV_BIND_EXPLICIT: an explicit, userspace-requested driver bind, e.g. as a
+ *                    result of a write to /sys/bus/.../drivers/.../bind
+ */
+#define DRV_BIND_DEFAULT	0
+#define DRV_BIND_EXPLICIT	BIT(0)
+
 /*
  * Manual binding of a device to driver. See drivers/base/bus.c
  * for information on use.
  */
 int __must_check device_driver_attach(struct device_driver *drv,
-				      struct device *dev);
+				      struct device *dev, u32 flags);
 int __must_check device_bind_driver(struct device *dev);
 void device_release_driver(struct device *dev);
 int  __must_check device_attach(struct device *dev);
-- 
2.33.1

