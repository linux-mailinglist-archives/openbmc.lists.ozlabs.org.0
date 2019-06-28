Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F949595BA
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 10:09:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZqD64dTczDqtk
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 18:09:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZqCL0Vn1zDqsh
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2019 18:08:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="oRQBRojh"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1023)
 id 45ZqCK6hx8z9s8m; Fri, 28 Jun 2019 18:08:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1561709309; bh=BMDa2jihTaRc3LOhSmr9jBzDHJcuKeEr4HaizjwH3J8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oRQBRojh6OfmeSrkilimMybWvVR6koU+Y3pJWskO5J4jbEX42UR9z/bJQ6sLMc6qS
 YcKAaKkszL2eEALff3qxrMnttpBUhgTQlEfjN/+PTOy6IT6cNrArL0cF2fu5bspIHQ
 ILIKA+BO25jynH1cJ5X4wsyifK9CRAanFztHuRZGTzDApdN1QkcPy/k7iCYEhjiojq
 7XyUN42QIcxnkFbxVhHpfqLNEnP2TkWVo+s2jeUPOi+MJkwXFC1jC5ZN0DKf1bHiAW
 MBo4uT9gJVYl3AhSu3sLBvIpZoVS/po/IFpMp5KjvsHwce6xpH7v1wyAYLstt2Vn9u
 Oal0QYDB9v8pQ==
From: Jeremy Kerr <jk@ozlabs.org>
To: openbmc@lists.ozlabs.org,
	Lei YU <mine260309@gmail.com>
Subject: [PATCH v2] fsi/core: Fix error paths on CFAM init
Date: Fri, 28 Jun 2019 16:07:37 +0800
Message-Id: <20190628080737.25491-1-jk@ozlabs.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190628064139.17408-1-jk@ozlabs.org>
References: <20190628064139.17408-1-jk@ozlabs.org>
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
v2:
  fix dropped semicolon
---
 drivers/fsi/fsi-core.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 1d83f3ba478b..1f76740f33b6 100644
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
@@ -1067,10 +1072,13 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 		dev_dbg(&master->dev, "failed during slave scan with: %d\n",
 				rc);
 
-	return rc;
+	return 0;
 
- err_free:
-	put_device(&slave->dev);
+err_free_ida:
+	fsi_free_minor(slave->dev.devt);
+err_free:
+	of_node_put(slave->dev.of_node);
+	kfree(slave);
 	return rc;
 }
 
-- 
2.20.1

