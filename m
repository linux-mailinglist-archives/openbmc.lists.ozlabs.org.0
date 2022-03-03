Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87ED54CB922
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 09:34:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8PRZ49WKz3byT
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 19:34:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=e+CC4awV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=e+CC4awV; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8PNZ5XQlz3c0G
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 19:31:58 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id
 gj15-20020a17090b108f00b001bef86c67c1so4062806pjb.3
 for <openbmc@lists.ozlabs.org>; Thu, 03 Mar 2022 00:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uLpL759Hbmm5qMBXDqRYgb9jZJR2BhAEaMh2uUGe3dE=;
 b=e+CC4awVZmKTGdEfnWJgf52O0bvQhKqqgQjPr4o69Bux8vgwHbb5ZvJ0X5CBVZD611
 lhM+A2BPkr0ogxuXMcsse6gn6bi3SPbJbVQsFTfcbMZP2FZ90SkKoHtpdDwQ1UzO8RRW
 XiLTgQ90SVBniY0bB4eVuph9Po7QO4yomoI6LItgdo93v6bSU/yZa8/I0Z+9W+u1o6uZ
 z0mTwZwQW85rHoV8rG/kPINDSUrpcdU5NeGrM4KeXyguN8hM1d21acAbL9HAKhs79X+/
 E6ICQiAK7ncTE3ye1Nij7doXsjSsnP3mOMZarK7Acau+S3z24lzd9za2ShuM4UgliPOY
 rNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uLpL759Hbmm5qMBXDqRYgb9jZJR2BhAEaMh2uUGe3dE=;
 b=tmI+ZDrX3a7YTXvSHQglV6m3SCY52u/7B505qoXBdk56MRGKIje0VnDrp+LI8W86u6
 /TaFLs21YPDgDt6uFTB0Y7xHBPsPizRnotFWp+6KVctl1f9QWHUgO5mh88d3vhKoHkne
 NBkndpaue3w++eJEY+mFJ8IjA/hjIzLLiaAzESh0yM/BnMZMqArFZQ9a2eGBEAiBpz42
 iXxIoMAMx4M3YkR4KVXl3YH2iDPRpbPfyroXvLGqfojhH1PAryQHbIr4+Kt618RA525/
 oQ7GM0l/2d1EhHYTOdQ7kryg1lO/CbVIYKEuWa+J292M1FAFeDtbmszKMiyVOx+2IiSI
 5DIQ==
X-Gm-Message-State: AOAM5335c/AcC2tZcJtoDc7EZAe5v3tY0mw9bEvRjhqo94nsClsyx/X7
 tDn4it67HXVOoszEEfbIkQ==
X-Google-Smtp-Source: ABdhPJzfa0A1UQ85/RXmOfLN5Y8Yrwrkjut7cMcn/zZb/mRUhLjS0gIGh6KrPzS3/O5S6TblIeWmLw==
X-Received: by 2002:a17:902:6b04:b0:14f:2cc0:fa98 with SMTP id
 o4-20020a1709026b0400b0014f2cc0fa98mr35126027plk.44.1646296317415; 
 Thu, 03 Mar 2022 00:31:57 -0800 (PST)
Received: from localhost ([2401:e180:8860:3b30:e4a0:392a:996e:c525])
 by smtp.gmail.com with ESMTPSA id
 v21-20020a056a00149500b004e15a113300sm1754956pfu.198.2022.03.03.00.31.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 03 Mar 2022 00:31:57 -0800 (PST)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
 yangyicong@hisilicon.com, semen.protsenko@linaro.org, wsa@kernel.org,
 jie.deng@intel.com, sven@svenpeter.dev, bence98@sch.bme.hu,
 lukas.bulwahn@gmail.com, arnd@arndb.de, olof@lixom.net,
 andriy.shevchenko@linux.intel.com, warp5tw@gmail.com,
 tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
 KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com
Subject: [PATCH v3 04/11] i2c: npcm: Change the way of getting GCR regmap
Date: Thu,  3 Mar 2022 16:31:34 +0800
Message-Id: <20220303083141.8742-5-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303083141.8742-1-warp5tw@gmail.com>
References: <20220303083141.8742-1-warp5tw@gmail.com>
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
---
 drivers/i2c/busses/i2c-npcm7xx.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 4c225e1a058f..fa12212b2428 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2236,6 +2236,7 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
 	static struct regmap *clk_regmap;
 	int irq;
 	int ret;
+	struct device_node *np = pdev->dev.of_node;
 
 	bus = devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
 	if (!bus)
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

