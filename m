Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7071E751E04
	for <lists+openbmc@lfdr.de>; Thu, 13 Jul 2023 11:58:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=eqzkyxfd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1qnY2NP6z3c4X
	for <lists+openbmc@lfdr.de>; Thu, 13 Jul 2023 19:58:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=eqzkyxfd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1qmx2Q4Wz3c1R
	for <openbmc@lists.ozlabs.org>; Thu, 13 Jul 2023 19:58:24 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so901723e87.2
        for <openbmc@lists.ozlabs.org>; Thu, 13 Jul 2023 02:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689242301; x=1691834301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cojSysAMXAGtnXzivDEmLEf5S6SkC06gAHJZrjzFWos=;
        b=eqzkyxfdBiS/0GFbYznPWRyufD/z4GsnNmgmkFRC0Uih1WtmgqqUyrkxbDekFMJHT2
         D2xdo73XnJNS9R4WvDoK1s7ORaVsP2NuEA5DdjN7KO3Sax2JW+ZHq9qR0lxqjPXi7M/w
         4aQI6GowaRyEhRFYZKV+6cmfw64m4gwfwMTfVaASR6OaMxu2D7lu+CCZYCcP61Q8zL07
         +L00KNGS1o6nbH7DBnPFWDe0Ra8kkeEKZY2VhfGTi4Q8FsozJkZhZJoWZJjsJSYBfVU7
         1JRx9XUWv+wU4v2GRzqkcMaQVUO1G5fiylynRNfjoCMmnqu47Ua3KyT39MLyzP2E1m0+
         y5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689242301; x=1691834301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cojSysAMXAGtnXzivDEmLEf5S6SkC06gAHJZrjzFWos=;
        b=ZTldjBhDYdTPyrMRYM7hfwCfoG+ajl9YeAaKbg+CZc5k9gHvDdZNAO3ZkKSS4B+939
         73qJGl64RGUsV8v8JPPp86Fb11WQjveB6E4auY9frjP5OZklh+uWKuo22cYm+QNVP8M+
         EcMEL1Pa/CMD+/XDx2d1SY0L9+6Mp4eD2/HlrY04z05X1+WX+yc2P/D+IDTiYFQuVdnC
         SB1ty9E3+YcSRg63IFFoslQH/xa6mXri5FkG0yVMobxNsbV8Jx+3nOfdBRThQufsZagZ
         1End98KfOjqJrtSKKFsDF5Emo4qywfxWOyDRuwwGxcK4j68HgWxCjnT6tcWkX4GufAWi
         ke5Q==
X-Gm-Message-State: ABy/qLaX6bTtUUGqDSNYIFGdp2A46qjVGAhE5U/UDVUW00dxT0jPpv1G
	ZM19TkWu5V1qk733h1Nn7v4=
X-Google-Smtp-Source: APBJJlEm6+XHxZtoswu/zB4wJP8OnPnpvO9fT6LNOOeNewb14cpRxqHFRmCLYMoP2GTU0GshA1HLHQ==
X-Received: by 2002:a05:6512:3b2a:b0:4fa:9817:c1da with SMTP id f42-20020a0565123b2a00b004fa9817c1damr1077376lfv.21.1689242300402;
        Thu, 13 Jul 2023 02:58:20 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id i9-20020ac25d29000000b004faa82946d8sm1056932lfb.178.2023.07.13.02.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 02:58:19 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 36D9wGaC030561;
	Thu, 13 Jul 2023 12:58:17 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 36D9wCKD030560;
	Thu, 13 Jul 2023 12:58:12 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: netdev@vger.kernel.org
Subject: [PATCH] net: ftgmac100: support getting MAC address from NVMEM
Date: Thu, 13 Jul 2023 12:57:43 +0300
Message-Id: <20230713095743.30517-1-fercerpav@gmail.com>
X-Mailer: git-send-email 2.30.2
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
Cc: Andrew Lunn <andrew@lunn.ch>, Leon Romanovsky <leon@kernel.org>, Geoff Levand <geoff@infradead.org>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Eric Dumazet <edumazet@google.com>, Paul Fertser <fercerpav@gmail.com>, Tao Ren <rentao.bupt@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Liang He <windhl@126.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Make use of of_get_ethdev_address() to support reading MAC address not
only from the usual DT nodes but also from an NVMEM provider (e.g. using
a dedicated area in an FRU EEPROM).

Signed-off-by: Paul Fertser <fercerpav@gmail.com>
---
 drivers/net/ethernet/faraday/ftgmac100.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index a03879a27b04..9135b918dd49 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -177,16 +177,20 @@ static void ftgmac100_write_mac_addr(struct ftgmac100 *priv, const u8 *mac)
 	iowrite32(laddr, priv->base + FTGMAC100_OFFSET_MAC_LADR);
 }
 
-static void ftgmac100_initial_mac(struct ftgmac100 *priv)
+static int ftgmac100_initial_mac(struct ftgmac100 *priv)
 {
 	u8 mac[ETH_ALEN];
 	unsigned int m;
 	unsigned int l;
+	int err;
 
-	if (!device_get_ethdev_address(priv->dev, priv->netdev)) {
+	err = of_get_ethdev_address(priv->dev->of_node, priv->netdev);
+	if (err == -EPROBE_DEFER)
+		return err;
+	if (!err) {
 		dev_info(priv->dev, "Read MAC address %pM from device tree\n",
 			 priv->netdev->dev_addr);
-		return;
+		return 0;
 	}
 
 	m = ioread32(priv->base + FTGMAC100_OFFSET_MAC_MADR);
@@ -207,6 +211,8 @@ static void ftgmac100_initial_mac(struct ftgmac100 *priv)
 		dev_info(priv->dev, "Generated random MAC address %pM\n",
 			 priv->netdev->dev_addr);
 	}
+
+	return 0;
 }
 
 static int ftgmac100_set_mac_addr(struct net_device *dev, void *p)
@@ -1843,7 +1849,9 @@ static int ftgmac100_probe(struct platform_device *pdev)
 	priv->aneg_pause = true;
 
 	/* MAC address from chip or random one */
-	ftgmac100_initial_mac(priv);
+	err = ftgmac100_initial_mac(priv);
+	if (err)
+		goto err_phy_connect;
 
 	np = pdev->dev.of_node;
 	if (np && (of_device_is_compatible(np, "aspeed,ast2400-mac") ||
-- 
2.34.1

