Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 335DD34B36A
	for <lists+openbmc@lfdr.de>; Sat, 27 Mar 2021 01:49:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6gGf0m0Dz3c15
	for <lists+openbmc@lfdr.de>; Sat, 27 Mar 2021 11:49:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=KvC+WB0m;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--wak.bounces.google.com (client-ip=2607:f8b0:4864:20::749;
 helo=mail-qk1-x749.google.com;
 envelope-from=3fofeyamkb5sr5fbjjbg9.7jhjk9i6h7gdnon.jug56n.jmb@flex--wak.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=KvC+WB0m; dkim-atps=neutral
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6gGQ1mbcz2yQt
 for <openbmc@lists.ozlabs.org>; Sat, 27 Mar 2021 11:49:31 +1100 (AEDT)
Received: by mail-qk1-x749.google.com with SMTP id t24so7439373qkg.3
 for <openbmc@lists.ozlabs.org>; Fri, 26 Mar 2021 17:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=khCXg1aUeeUPr6fPfcLIfs+pY/nUgyLWJcmWtf+nG7U=;
 b=KvC+WB0mm0t2MoaY3HuI4LevBA8klMqKXFaAzOO8z07+KQ2WigE9kCSPGa7FKt/Reu
 NT5XQJY5D3IkLxNb901HDyTJe0EkkQo9jcu5U9Sxshc5ql4UDE2M3I0LH1S+0rGWrUoB
 r+fCNgH0x4QtEVXQ6oNovZevXnjFYfat2YUKrmryI8eiIiuU1pAc7n3CMYMftIN+JvHW
 mEHKE5aAebG2gKVz3jvmBGH35uUn0eq8UlVlj2wXXg6E76+ZPplPxusGyK245Ypjv5mQ
 P7pZolLQy7LIdV0Og/xvQoqFpGcKNagZRVbON6tXxgCaHF5SKCTpVnHveTse9ngWY33E
 tZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=khCXg1aUeeUPr6fPfcLIfs+pY/nUgyLWJcmWtf+nG7U=;
 b=Lb3MV4BmKPLMBj+08NpRzFpaK1zCAcT48E3dEBypORrIaQHvpYfIUgyfPSCptllZxQ
 yM2jNeOqBoUzRR/Ct100zCVVxBzFh8XgKmgDTeABOyu+9gqBsraf7mD4CKV6g47pAJj4
 mQGCHfRpyiS3YGbLWauzIus82gvMF7b+wpff7djPAdZaNGmxmAbDWL/GBYfn8/NQByoB
 7UMnubo5ROsVifS3pEtlhDADV6/+WXY2r8gppyOCN7pZL+VC3M6MTAvU/MR87QM8rIOr
 5UnkjzkED6BhKbMduDwM9qH9VrTYgYxBkOPHPtM3opvx/jEA6Lm/f0YYfkqQaBX2b0Lj
 3j1Q==
X-Gm-Message-State: AOAM5309kB4RJ9oOeC7lFzOjbtfGY5xqTHu1DzOMX6y56UwU58+AfAJ9
 46cIO4oLC515fecEbKawFRCqI/E1J3ON6VKvqGrOKiRdA+AaNmdzBlS8hP7Kq1z/JftDDq4dnWL
 8pRJl2TaO8UshQywwOj0cRGR0gIDWNkJ1zkjaOfFVBOeNH/vDiskzmvHs
X-Google-Smtp-Source: ABdhPJyfC/M6MJebbb9czINtP79quG0hk1X0wRC69RMNekosw7O/TMZY45xgVKPuf/9vJJ0qESICFRc=
X-Received: from wak-linux.svl.corp.google.com
 ([2620:15c:2c5:3:98d9:aaa4:a6e1:c8e5])
 (user=wak job=sendgmr) by 2002:a0c:dd14:: with SMTP id
 u20mr16460858qvk.13.1616806166253; 
 Fri, 26 Mar 2021 17:49:26 -0700 (PDT)
Date: Fri, 26 Mar 2021 17:49:20 -0700
Message-Id: <20210327004920.388957-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
Subject: [[PATCH linux dev-5.10] net: npcm: Support for fixed PHYs
From: "William A. Kennington III" <wak@google.com>
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: "William A. Kennington III" <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Most of our machines don't have PHYs between the NIC and the BMC over
their NC-SI port. We don't want to use the kernel NC-SI machinery, but
we do want phyless support.

Signed-off-by: William A. Kennington III <wak@google.com>
---
 drivers/net/ethernet/nuvoton/npcm7xx_emc.c | 31 +++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/nuvoton/npcm7xx_emc.c b/drivers/net/ethernet/nuvoton/npcm7xx_emc.c
index f07449e2f68d..1dc871a72180 100644
--- a/drivers/net/ethernet/nuvoton/npcm7xx_emc.c
+++ b/drivers/net/ethernet/nuvoton/npcm7xx_emc.c
@@ -26,6 +26,7 @@
 #include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/of_device.h>
+#include <linux/of_mdio.h>
 #include <linux/dma-mapping.h>
 
 #include <linux/regmap.h>
@@ -242,6 +243,7 @@ struct  npcm7xx_ether {
 	struct net_device *ndev;
 	struct resource *res;
 	unsigned int msg_enable;
+	struct device_node *phy_dn;
 	struct mii_bus *mii_bus;
 	struct phy_device *phy_dev;
 	struct napi_struct napi;
@@ -1774,6 +1776,17 @@ static int npcm7xx_mii_setup(struct net_device *dev)
 
 	pdev = ether->pdev;
 
+	if (ether->phy_dn) {
+		ether->phy_dev = of_phy_connect(dev, ether->phy_dn,
+					&adjust_link, 0, 0);
+		if (!ether->phy_dn) {
+			dev_err(&dev->dev, "could not connect to phy %pOF\n",
+				ether->phy_dn);
+			return -ENODEV;
+		}
+		return 0;
+	}
+
 	ether->mii_bus = mdiobus_alloc();
 	if (!ether->mii_bus) {
 		err = -ENOMEM;
@@ -2011,6 +2024,15 @@ static int npcm7xx_ether_probe(struct platform_device *pdev)
 		}
 	} else {
 		ether->use_ncsi = false;
+
+		ether->phy_dn = of_parse_phandle(np, "phy-handle", 0);
+		if (!ether->phy_dn && of_phy_is_fixed_link(np)) {
+			error = of_phy_register_fixed_link(np);
+			if (error < 0)
+				goto failed_free_napi;
+			ether->phy_dn = of_node_get(np);
+		}
+
 	error = npcm7xx_mii_setup(dev);
 	if (error < 0) {
 		dev_err(&pdev->dev, "npcm7xx_mii_setup err\n");
@@ -2032,6 +2054,9 @@ static int npcm7xx_ether_probe(struct platform_device *pdev)
 	return 0;
 
 failed_free_napi:
+	of_node_put(ether->phy_dn);
+	if (of_phy_is_fixed_link(np))
+		of_phy_deregister_fixed_link(np);
 	netif_napi_del(&ether->napi);
 	platform_set_drvdata(pdev, NULL);
 failed_free_io:
@@ -2048,13 +2073,17 @@ static int npcm7xx_ether_remove(struct platform_device *pdev)
 {
 	struct net_device *dev = platform_get_drvdata(pdev);
 	struct npcm7xx_ether *ether = netdev_priv(dev);
+	struct device_node *np = pdev->dev.of_node;
 
 #ifdef CONFIG_DEBUG_FS
 	debugfs_remove_recursive(ether->dbgfs_dir);
 #endif
-
 	unregister_netdev(dev);
 
+	of_node_put(ether->phy_dn);
+	if (of_phy_is_fixed_link(np))
+		of_phy_deregister_fixed_link(np);
+
 	free_irq(ether->txirq, dev);
 	free_irq(ether->rxirq, dev);
 
-- 
2.31.0.291.g576ba9dcdaf-goog

