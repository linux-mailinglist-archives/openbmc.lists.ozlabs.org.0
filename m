Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8DE59455
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 08:43:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZnKC5Rd3zDqbv
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 16:43:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZnHg0ryjzDqlY
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2019 16:42:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="uIZhOl9o"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1023)
 id 45ZnHf3p8Rz9s8m; Fri, 28 Jun 2019 16:42:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1561704126; bh=wDMb0t6HjTRIpeZnuyk+96N/5PFQG7usXs1m3LywIrg=;
 h=From:To:Cc:Subject:Date:From;
 b=uIZhOl9oa19jH15SyUjURW15gpPDO9nS1KfYSwIE3XCMskdfM1194p7Ta/uHX7w6T
 vQJ4OCLgtS0tblsWhrs4Jw0wD7n/KQeZ5fy0zcl+3CjLCjJEbYlBo6XNJ/jlg/9rEu
 WYAX18kCgBzPavjR3g2lBSvqjfghhSxm/TyhxdRfUNk2wZUfJw1+3MahKcu71JBTyD
 C3WIQoWAbRJ4uNM89zR82vT73L7Q9uu/reqmSwmmITOoFCgWYI1GtdrIEJ9tCKdpi/
 FqrU4/bAUHKdtDKQg9jidPME7QrGBEPrajc5gpX9CHKE4e89dUAHWexlntT5J72TAF
 YrRwpIZqYhe4w==
From: Jeremy Kerr <jk@ozlabs.org>
To: openbmc@lists.ozlabs.org,
	Lei YU <mine260309@gmail.com>
Subject: [PATCH] fsi/core: Fix error paths on CFAM init
Date: Fri, 28 Jun 2019 14:41:39 +0800
Message-Id: <20190628064139.17408-1-jk@ozlabs.org>
X-Mailer: git-send-email 2.20.1
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Change d1dcd67825 re-worked the struct fsi_slave initialisation in
fsi_slave_init, but introduced a few inconsitencies: the slave->dev is
now registered through cdev_device_add, but we may kfree() the device
out from underneath the cdev registration. We may also leave an IDA
allocated.

This change fixes the error paths, so that we kfree() only before the
device is registered with the core code. We also move the smode write to
before we start creating proper devices, as it's the most likely to
fail. We also remove the IDA-allocated minor on error, and properly
clean up the of_node.

Fixes: d1dcd678257603e71cf3f3d84c70e2b6f0f14bb8
Reported-by: Lei YU <mine260309@gmail.com>
Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---

Lei: Can you test this on your hardware? Thanks!

---
 drivers/fsi/fsi-core.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 1d83f3ba478b..9ba5e19d1c42 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -1029,6 +1029,14 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 
 	}
 
+	rc = fsi_slave_set_smode(slave);
+	if (rc) {
+		dev_warn(&master->dev,
+				"can't set smode on slave:%02x:%02x %d\n",
+				link, id, rc);
+		goto err_free;
+	}
+
 	/* Allocate a minor in the FSI space */
 	rc = __fsi_get_new_minor(slave, fsi_dev_cfam, &slave->dev.devt,
 				 &slave->cdev_idx);
@@ -1040,17 +1048,14 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 	rc = cdev_device_add(&slave->cdev, &slave->dev);
 	if (rc) {
 		dev_err(&slave->dev, "Error %d creating slave device\n", rc);
-		goto err_free;
+		goto err_free_ida;
 	}
 
-	rc = fsi_slave_set_smode(slave);
-	if (rc) {
-		dev_warn(&master->dev,
-				"can't set smode on slave:%02x:%02x %d\n",
-				link, id, rc);
-		kfree(slave);
-		return -ENODEV;
-	}
+	/* Now that we have the cdev registered with the core, any fatal
+	 * failures beyond this point will need to clean up through
+	 * cdev_device_del(). Fortunately though, nothing past here is fatal.
+	 */
+
 	if (master->link_config)
 		master->link_config(master, link,
 				    slave->t_send_delay,
@@ -1067,11 +1072,14 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 		dev_dbg(&master->dev, "failed during slave scan with: %d\n",
 				rc);
 
-	return rc;
+	return 0;
 
- err_free:
-	put_device(&slave->dev);
-	return rc;
+err_free_ida:
+	fsi_free_minor(slave->dev.devt);
+err_free:
+	of_node_put(slave->dev.of_node);
+	kfree(slave);
+	return rc
 }
 
 /* FSI master support */
-- 
2.20.1

