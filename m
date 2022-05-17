Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF3752A221
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 14:55:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2bh50xgrz30Dp
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 22:55:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=U4TUEDQd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=U4TUEDQd; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2X3P2hgmz3bqG
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 20:12:01 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id n8so16915160plh.1
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 03:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=oBrUS4cUnYCukBR9QE9N3XBr+fjKNffpl/fgC0cqOiw=;
 b=U4TUEDQdH7GITaysYyldEdGwlpv6UEzDB5eXkMk+C/CuL4/H0IMXqID1CQghmGhXBZ
 tOhdwuPM5FuRUGd+cwETTJA+HuuxxWheGPzqkyaJwnS9H1Q6MGLiJ6kw0ZP0u/sB/HcF
 AmmzSNBe8g5HcxIMtyUlVg7KSamG2zQ03qfiJtGm0e334EOm8zpR/h4gS86mu1hv7ptG
 6TtY0+LM2jXYoidXplKAAx49o7iVt2clz2lghoiLmyBbgN0+JBawh/IzdcsunMu7cHaH
 vsJ7aPM64E1rtimGzMqWCO1dkVMMIin+FyiumV5iQppsXcIeFeoauf+M9iHDrE4WDOkT
 7fgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=oBrUS4cUnYCukBR9QE9N3XBr+fjKNffpl/fgC0cqOiw=;
 b=YnYrqZkMUynPUcFssRKQO3NkmYyiijxAELyuzug2KDxvGM6GbUmnW3ITcXyr3BS9Xt
 AW5yeFfMaX1K2D4ygD/iIEkgEcb8D2LteoZIJ4ZTRJ1W+aPiAQiNcAxI5a0T7hoIlTkR
 vF+LHeLLaQhwdfnjAgvCZ964EgsaN8nzBcL7Z7dAxKZ2HGQ0Hks1wiHLVm3IXbh4UFe3
 b0q61ZzP70d6r2FWGCnM4OIbi0NZTdF4H2p4YcpzFrahKU410vOkfapjxQpVNQpW6j+8
 nyCKxCj56ncv2h23nPsTk89+GVN7omin3BH8Xq+eT41mfrjMIsHy7bB6JTPKvGOPt/x9
 JT7w==
X-Gm-Message-State: AOAM533spY7OCdg9uN58w2e5eHafyPQ+vixDXStecZsMfukV++r55AM3
 YhUxUqbBZICAsSyGikS8gw==
X-Google-Smtp-Source: ABdhPJwyHdOXXr1USDm5VHABkdGunFN0dkddP7cfCZyjpdaZzp/TBVc6dDq5QHZCZLtB6IsZoWphwA==
X-Received: by 2002:a17:902:cf0a:b0:156:39c9:4c44 with SMTP id
 i10-20020a170902cf0a00b0015639c94c44mr21528650plg.124.1652782319470; 
 Tue, 17 May 2022 03:11:59 -0700 (PDT)
Received: from localhost (220-133-130-217.hinet-ip.hinet.net.
 [220.133.130.217]) by smtp.gmail.com with ESMTPSA id
 193-20020a6214ca000000b0050dc76281ecsm902465pfu.198.2022.05.17.03.11.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 17 May 2022 03:11:59 -0700 (PDT)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, wsa@kernel.org,
 andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
 semen.protsenko@linaro.org, rafal@milecki.pl, sven@svenpeter.dev,
 jsd@semihalf.com, jie.deng@intel.com, lukas.bulwahn@gmail.com,
 arnd@arndb.de, olof@lixom.net, warp5tw@gmail.com, tali.perry@nuvoton.com,
 Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com,
 JJLIU0@nuvoton.com, kfting@nuvoton.com
Subject: [PATCH v5 02/10] i2c: npcm: Change the way of getting GCR regmap
Date: Tue, 17 May 2022 18:11:34 +0800
Message-Id: <20220517101142.28421-3-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220517101142.28421-1-warp5tw@gmail.com>
References: <20220517101142.28421-1-warp5tw@gmail.com>
X-Mailman-Approved-At: Tue, 17 May 2022 22:52:11 +1000
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tali Perry <tali.perry1@gmail.com>

Change the way of getting NPCM system manager reigster (GCR)
and still maintain the old mechanism as a fallback if getting
nuvoton,sys-mgr fails while working with the legacy devicetree
file.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 71aad029425d..de4e5f2f3e5a 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2229,11 +2229,12 @@ static void npcm_i2c_init_debugfs(struct platform_device *pdev,
 
 static int npcm_i2c_probe_bus(struct platform_device *pdev)
 {
-	struct npcm_i2c *bus;
-	struct i2c_adapter *adap;
-	struct clk *i2c_clk;
+	struct device_node *np = pdev->dev.of_node;
 	static struct regmap *gcr_regmap;
 	static struct regmap *clk_regmap;
+	struct i2c_adapter *adap;
+	struct npcm_i2c *bus;
+	struct clk *i2c_clk;
 	int irq;
 	int ret;
 
@@ -2250,7 +2251,10 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
 		return PTR_ERR(i2c_clk);
 	bus->apb_clk = clk_get_rate(i2c_clk);
 
-	gcr_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-gcr");
+	gcr_regmap = syscon_regmap_lookup_by_phandle(np, "nuvoton,sys-mgr");
+	if (IS_ERR(gcr_regmap))
+		gcr_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-gcr");
+
 	if (IS_ERR(gcr_regmap))
 		return PTR_ERR(gcr_regmap);
 	regmap_write(gcr_regmap, NPCM_I2CSEGCTL, NPCM_I2CSEGCTL_INIT_VAL);
-- 
2.17.1

