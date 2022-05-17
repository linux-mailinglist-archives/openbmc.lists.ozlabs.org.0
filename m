Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7704C5298DD
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 06:39:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2NgC2Khrz3bq8
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 14:39:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=MaKuPenl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=MaKuPenl; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2Nfq1NgJz3bXy
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 14:38:42 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 436C848B;
 Mon, 16 May 2022 21:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1652762318;
 bh=0DYUA6XSQgxSgf6uohtKb2Alu10/QGcpHyPP7rSrxkE=;
 h=From:To:Cc:Subject:Date:From;
 b=MaKuPenlgNzeR+dHnztb2kfHFyCq8nh/6NTMuC+oSj1HsUDU9YR3ARLxt32Pggge4
 uMSd6GaXi1Cm0IjNn/3LU1v9HgrTkIPoAek6r8ZWPQYFOoMrw28FCnPzWB2m7vpY9d
 ZG114b41xiPePHzzfoIn/PMb0oANjOrmElJ/WdFA=
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH] ftgmac100: use bus name in mdio error messages
Date: Mon, 16 May 2022 21:38:25 -0700
Message-Id: <20220517043825.26893-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.36.1
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Zev Weiss <zev@bewilderbeest.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Previously we'd been using a device name retrieved via
ftgmac100_data->phydev, but the mdio read/write functions may be
called before that member is initialized in ftgmac100_phy_init(),
leading to a NULL pointer dereference while printing the error message
issued if the mdio access fails.  We can instead use bus->name, which
is already available at that point.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Fixes: 538e75d3fc54 ("net: ftgmac100: add MDIO bus and phylib support")
---
 drivers/net/ftgmac100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ftgmac100.c b/drivers/net/ftgmac100.c
index 999941de14ac..aa1d63880c8c 100644
--- a/drivers/net/ftgmac100.c
+++ b/drivers/net/ftgmac100.c
@@ -117,7 +117,7 @@ static int ftgmac100_mdio_read(struct mii_dev *bus, int phy_addr, int dev_addr,
 				 FTGMAC100_MDIO_TIMEOUT_USEC);
 	if (ret) {
 		pr_err("%s: mdio read failed (phy:%d reg:%x)\n",
-		       priv->phydev->dev->name, phy_addr, reg_addr);
+		       bus->name, phy_addr, reg_addr);
 		return ret;
 	}
 
@@ -149,7 +149,7 @@ static int ftgmac100_mdio_write(struct mii_dev *bus, int phy_addr, int dev_addr,
 				 FTGMAC100_MDIO_TIMEOUT_USEC);
 	if (ret) {
 		pr_err("%s: mdio write failed (phy:%d reg:%x)\n",
-		       priv->phydev->dev->name, phy_addr, reg_addr);
+		       bus->name, phy_addr, reg_addr);
 	}
 
 	return ret;
-- 
2.36.1

