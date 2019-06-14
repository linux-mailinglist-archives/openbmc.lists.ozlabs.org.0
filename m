Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 633894558D
	for <lists+openbmc@lfdr.de>; Fri, 14 Jun 2019 09:17:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QBkx6xbFzDrTQ
	for <lists+openbmc@lfdr.de>; Fri, 14 Jun 2019 17:17:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::344; helo=mail-ot1-x344.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="B01uhPco"; 
 dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QBkR0zMSzDrNy
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jun 2019 17:17:02 +1000 (AEST)
Received: by mail-ot1-x344.google.com with SMTP id l15so1697239otn.9
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jun 2019 00:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=h32rnj/Xf3zmV/TEf8UtDyLfAwJM/I2vMUL6LPoXjQU=;
 b=B01uhPco1VHYGVmDr/AGQ+Z5tVDPv08h85eh7CT8t1nmC01UKwlx17lsYwJag+6Bgc
 ozyE4/S9yRE4zKXuhtbAsyRdJkYgjuMwhK5trMzxwBU6I0VDKS+JXeSH3l3mAqBVmWiz
 Wbr892XmOFMMi2S8/g18ykLXZMzdvSDpXs49GA4/ZHkq8C0Cb7b4rmfV88a3WUhV8euS
 xrlZ7ENteccph53XehdLeTuRzH9HQqAVcI4BgutUFDaIuIWGJ538rbW8l17i1A1bCb7d
 0uR6ERirG3wJI4zuq1V1JTgeaJCXKpeFIPnCx98N1w6ZG3Oe3qQcctt12kHPhsd0NnSz
 MY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=h32rnj/Xf3zmV/TEf8UtDyLfAwJM/I2vMUL6LPoXjQU=;
 b=svGQwFbQ/wNih2W87M2ETl3h5f6+MjmUx6Z0a9QH+6eC6EuFGkH+5+DSCXnO5xPDAT
 aJHKh6phMtITuLqCIHRWpmDJXzIUdaluqJPFJvzpYqO7VtYOnZVqLEnV/tZb2L6gzVFu
 ckF9ca/JJJSLguD9lKlzCTDWGinmvlshSGG0jDQ5PY89/UPtHroVOgDRol4HaoOw1Odb
 SbyPGcVsiyBO7AtgY3Sm41+1t8KTd/ESnZ2sfq0TU6aPopvRSznW4UUInB5DbspFUa2A
 qePP7fAGgrcp7FX/mAKwC+k5z5dlgByGz+K3vhCuVO9WZU4NT+DJ29zAKtceJaNxS7bh
 H1dg==
X-Gm-Message-State: APjAAAWpSA3e7Xw5KmwVIxgtMKuGO88NIIVsti9decnV4/h3xUpswxzQ
 581nr8QXZt3GVq4i75QPvG6++oOHHKgFlA==
X-Google-Smtp-Source: APXvYqzNflSyEc856kOsgMUtwo56xGNV9rd0KtfV/jahIcNRjOY5XdMUe5zZCe7hBsmDYYj1TnCW9Q==
X-Received: by 2002:a9d:5787:: with SMTP id q7mr11555014oth.75.1560496620199; 
 Fri, 14 Jun 2019 00:17:00 -0700 (PDT)
Received: from localhost ([32.97.110.52])
 by smtp.gmail.com with ESMTPSA id y7sm824712oix.47.2019.06.14.00.16.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 14 Jun 2019 00:16:59 -0700 (PDT)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.1] fsi: core: Fix NULL dereference issue
Date: Fri, 14 Jun 2019 15:16:43 +0800
Message-Id: <20190614071643.18607-1-mine260309@gmail.com>
X-Mailer: git-send-email 2.17.1
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

The failure case in fsi_slave_init() is wrong and could cause NULL
dereference issue.
E.g. on FP5280G2 machine, it could get failure in fsi_slave_set_smode(),
and when it does fsi rescan, kernel crashes due to:

    Unable to handle kernel NULL pointer dereference at virtual address 00000060

The fix is to make it not calling kfree() but just goto err_free.

However, in err_free, it calls put_device() to free the device, it still
cause issue during fsi rescan, that the device is used after freed.

    WARNING: CPU: 0 PID: 1433 at lib/refcount.c:190 refcount_sub_and_test_checked+0x94/0xac
    refcount_t: underflow; use-after-free.

So the put_device() is removed and "err_free" label is renamed to "fail".

The slave device is freed by put_device() in fsi_master_remove_slave().

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 drivers/fsi/fsi-core.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 2c31563fdcae..ebede90cf4bd 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -1041,14 +1041,14 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 	rc = __fsi_get_new_minor(slave, fsi_dev_cfam, &slave->dev.devt,
 				 &slave->cdev_idx);
 	if (rc)
-		goto err_free;
+		goto fail;
 
 	/* Create chardev for userspace access */
 	cdev_init(&slave->cdev, &cfam_fops);
 	rc = cdev_device_add(&slave->cdev, &slave->dev);
 	if (rc) {
 		dev_err(&slave->dev, "Error %d creating slave device\n", rc);
-		goto err_free;
+		goto fail;
 	}
 
 	rc = fsi_slave_set_smode(slave);
@@ -1056,8 +1056,8 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 		dev_warn(&master->dev,
 				"can't set smode on slave:%02x:%02x %d\n",
 				link, id, rc);
-		kfree(slave);
-		return -ENODEV;
+		rc = -ENODEV;
+		goto fail;
 	}
 	if (master->link_config)
 		master->link_config(master, link,
@@ -1075,10 +1075,7 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
 		dev_dbg(&master->dev, "failed during slave scan with: %d\n",
 				rc);
 
-	return rc;
-
- err_free:
-	put_device(&slave->dev);
+ fail:
 	return rc;
 }
 
-- 
2.17.1

