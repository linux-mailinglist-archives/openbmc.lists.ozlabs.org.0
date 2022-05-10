Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9DA5210A5
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 11:19:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyCCV64K4z3c7V
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 19:19:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RNKbzqLE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=RNKbzqLE; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyCB23pjfz3c9H
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 19:17:46 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id j6so14423004pfe.13
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 02:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9gk3IW+c3IPl5Otspv5w0MqdcZ+ptAb9FBKSCbuzjHk=;
 b=RNKbzqLEDFelf84UbDt5sobvhqFBKPsJQbfqW/1LqNo4yggVWV4Vkr3eqfYWhp5UP3
 UFVlTP8ScKlEdYNs8E0dKQFpiWa5vnCxG5LymOave0xPFtYhVvAjlN05BN/Z+NMHYPNP
 m7VJGHL2SkvVQfjDwK3YEKNorA+yS2Ff4nqshEw2TVoh5h8W9lE579o4Uh7+10ytXh8Q
 nkBNSo/EfQbU2HossCgVoV19Pi6xyxnc0FWdE/P8lQGo7Aw8NtVEI9GPwwmtuBkucwKU
 P5CT6SPi7y2cch8ch7qIsIK0h3Zq109LeCIn8NELZJVUlcXSvbgFjcAjWnJptxsq4/X/
 hC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9gk3IW+c3IPl5Otspv5w0MqdcZ+ptAb9FBKSCbuzjHk=;
 b=UQTS+0lexoXkY5xYcY0wEbZX5AXWsDdPhoma/ld+nTh4/psCWwTe5+M6mQEWb2oU0f
 j5RigDPcIJnK68yqEGke1bbes6bxBBFZk06z3SNXvdVIwOvytyW6tVPWJLAK+g7we4+R
 4LwFnTgASXe8i8Nre/gQB2Fy8KkFChKSybKsUTJ5y03USr8GKiXirZ89W1KXeqwS5m1A
 225/ZVq5UsjvTEYNitLZC+p0zft/YeJ9VQaB+Bgju7bURCRIO0J1T3E9RSIIk6kSK/4A
 nBpKlCuXVbBOvirAGU6af5yfKdK7qtftuZkUTLxfPUJBdp1LPd5VYoYYUZtxY3f54aLw
 GrUg==
X-Gm-Message-State: AOAM53228PobyEI63u+zO/SPxlOFrxTU5DDH2rXzdHXNpoo55f+fQ3bm
 emoMnwAmM74xJ7IwwLmBsw==
X-Google-Smtp-Source: ABdhPJzgs5R0DrvZp7C3wbPRnuhZG2Iqc0ixMm9flxHp+6jMwavTIqt5jLmBPF/7lPe2ptjEhhbKhA==
X-Received: by 2002:a65:6c05:0:b0:3c6:e380:9088 with SMTP id
 y5-20020a656c05000000b003c6e3809088mr3687997pgu.429.1652174263972; 
 Tue, 10 May 2022 02:17:43 -0700 (PDT)
Received: from localhost
 (2001-b011-7010-358e-c990-a8c9-85a7-1d3e.dynamic-ip6.hinet.net.
 [2001:b011:7010:358e:c990:a8c9:85a7:1d3e])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a170902bf4b00b0015e8d4eb21asm1469875pls.100.2022.05.10.02.17.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 10 May 2022 02:17:43 -0700 (PDT)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski@canonical.com, wsa@kernel.org,
 andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
 semen.protsenko@linaro.org, sven@svenpeter.dev, jie.deng@intel.com,
 jsd@semihalf.com, lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
 warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
 kfting@nuvoton.com
Subject: [PATCH v4 2/9] i2c: npcm: Change the way of getting GCR regmap
Date: Tue, 10 May 2022 17:16:47 +0800
Message-Id: <20220510091654.8498-3-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220510091654.8498-1-warp5tw@gmail.com>
References: <20220510091654.8498-1-warp5tw@gmail.com>
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 71aad029425d..e6ae11ed2d82 100644
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

