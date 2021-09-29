Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C92541C3DA
	for <lists+openbmc@lfdr.de>; Wed, 29 Sep 2021 13:54:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKFD30Ngkz2yng
	for <lists+openbmc@lfdr.de>; Wed, 29 Sep 2021 21:54:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=VRFSmCsu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=VRFSmCsu; 
 dkim-atps=neutral
X-Greylist: delayed 61015 seconds by postgrey-1.36 at boromir;
 Wed, 29 Sep 2021 21:54:27 AEST
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKFCl08ftz2yKJ
 for <openbmc@lists.ozlabs.org>; Wed, 29 Sep 2021 21:54:26 +1000 (AEST)
Received: from hatter.bewilderbeest.net (71-212-29-146.tukw.qwest.net
 [71.212.29.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 0769E703;
 Wed, 29 Sep 2021 04:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1632916464;
 bh=TO54FDsoCMWCMt79Pdb9/ZG9fjkHhkFEnzaM9kEuuFY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VRFSmCsuA73GFLA2ZHn1JHXvx/nQv0K/qCNkNKiFrd2PdnRnKilrKd5z0zpb3mwwH
 mSZgbq9RE1MUVuwlHAVYZi9Rp3ApmmZLsJOloly5AU1DJZgNyb0U4dHpnVjvDRVb5a
 8eBWHqXed0OrO6Yx+f50VYXSZriDiFVU7p46SiRU=
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 2/6] mtd: core: clear out unregistered devices a bit more
Date: Wed, 29 Sep 2021 04:54:04 -0700
Message-Id: <20210929115409.21254-3-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210929115409.21254-1-zev@bewilderbeest.net>
References: <20210929115409.21254-1-zev@bewilderbeest.net>
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Zev Weiss <zev@bewilderbeest.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Jeremy Kerr <jk@codeconstruct.com.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This allows an MTD device that has been unregistered to be easily
re-registered later without triggering "already registered" warnings in
mtd_device_parse_register() and add_mtd_device().

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/mtd/mtdcore.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index c8fd7f758938..e22266f63ae9 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -747,6 +747,9 @@ int del_mtd_device(struct mtd_info *mtd)
 
 		device_unregister(&mtd->dev);
 
+		/* Clear dev so mtd can be safely re-registered later if desired */
+		memset(&mtd->dev, 0, sizeof(mtd->dev));
+
 		idr_remove(&mtd_idr, mtd->index);
 		of_node_put(mtd_get_of_node(mtd));
 
@@ -1018,8 +1021,10 @@ int mtd_device_unregister(struct mtd_info *master)
 {
 	int err;
 
-	if (master->_reboot)
+	if (master->_reboot) {
 		unregister_reboot_notifier(&master->reboot_notifier);
+		memset(&master->reboot_notifier, 0, sizeof(master->reboot_notifier));
+	}
 
 	if (master->otp_user_nvmem)
 		nvmem_unregister(master->otp_user_nvmem);
-- 
2.33.0

