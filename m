Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 256F54BD4FD
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 06:14:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K29TM40w0z3cDN
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 16:14:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=K/girzw3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=K/girzw3; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K1WpZ57Fxz3bdC
 for <openbmc@lists.ozlabs.org>; Sun, 20 Feb 2022 14:57:10 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id qe15so11940479pjb.3
 for <openbmc@lists.ozlabs.org>; Sat, 19 Feb 2022 19:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6OWdv0iTU9zwpkJfCRiYIgMFcDrBo3I6CJI4Ww7QsUU=;
 b=K/girzw3/yJMxUsozqmoYanuTJpQeOLAarIMpENGa3TVJmspQTSdWJfAFIfMqDJQ33
 q07/ypJChfXtpEuUamGO30kq21ct45CY7Z0RRjIRUD3pP0O5DhqWZpqCqUVjJ1iP8RQE
 YUp4K/QCUzyRp80XNdVd2z3OQ869bogSSPoPlW26nBtrdmQauzcTeRw5Zm3FbsrgGVyg
 OemJDfnGtkNS5G98DygmQZo9e+SQhrp8C7a7Xn5kYvgPI5MQfiNvNEqHhw1vsyqnAPEP
 DHw5Q4TZ+qx6asZl3PCpiGz7c7/9WAB/HSnSBUsQn1aO9AvZfpZebl0+CAjQ5cmTtzJi
 MZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6OWdv0iTU9zwpkJfCRiYIgMFcDrBo3I6CJI4Ww7QsUU=;
 b=1iK7pW+xKkXWvrL8XDRiTXUwYjNOjwolyWF7hRrV6mdfLs112JALI2DblfCMzzrlRk
 Rg951lQoV7Hfo9/t6eMGBU344tXAe9EZVa9TOwH9KiJ8bBgu3fJrw9HBhdvCwPt1FnI3
 YJtxP8ExDb5VMQNQB5/KxlOyAv+i2sp+GuR9H2Y4ridW6Utc8zlnCL41lRqM+nSH3+kv
 dYa7vsC9382sSUHkSKz8W+9BoKCY5JhsFL+jX5Jn+73uWHd3SNWjSHtbZrKIh339EufC
 ddCeybvAX925gawDplT5+1c0yI8lqd1vtxDdslwdNv+yL6/a9ui1R1B/qKAYAaWpzb5O
 RVwg==
X-Gm-Message-State: AOAM531YsO1S4kjiqj6lKjQSEeoUKganJQylcfP9edEprnra6jUNz89y
 HU0nFz8o4WdCoIXSIKsj1A==
X-Google-Smtp-Source: ABdhPJx2Ff4tkjFNCMcVV7FssfPSCfrNVPNVZ3brD9/O5YmQhAVy1rFfIs2tCTMqjIoUXL/Gsf+mpQ==
X-Received: by 2002:a17:902:ead1:b0:14f:95e1:86fe with SMTP id
 p17-20020a170902ead100b0014f95e186femr4073071pld.21.1645329429028; 
 Sat, 19 Feb 2022 19:57:09 -0800 (PST)
Received: from localhost ([2401:e180:8842:e799:9593:a6f2:788b:a48c])
 by smtp.gmail.com with ESMTPSA id g5sm7862590pfv.22.2022.02.19.19.57.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 19 Feb 2022 19:57:08 -0800 (PST)
From: Tyrone Ting <warp5tw@gmail.com>
To: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
 semen.protsenko@linaro.org, yangyicong@hisilicon.com, wsa@kernel.org,
 jie.deng@intel.com, sven@svenpeter.dev, bence98@sch.bme.hu,
 christophe.leroy@csgroup.eu, lukas.bulwahn@gmail.com, olof@lixom.net,
 arnd@arndb.de, digetx@gmail.com, andriy.shevchenko@linux.intel.com,
 warp5tw@gmail.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
 kfting@nuvoton.com
Subject: [PATCH v2 04/11] i2c: npcm: Update gcr property name
Date: Sun, 20 Feb 2022 11:53:14 +0800
Message-Id: <20220220035321.3870-5-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220220035321.3870-1-warp5tw@gmail.com>
References: <20220220035321.3870-1-warp5tw@gmail.com>
X-Mailman-Approved-At: Mon, 21 Feb 2022 16:10:35 +1100
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

Use a generic name for NPCM system manager reigster.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 4c225e1a058f..a51db3f50274 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2236,6 +2236,7 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
 	static struct regmap *clk_regmap;
 	int irq;
 	int ret;
+	struct device_node *np = pdev->dev.of_node;
 
 	bus = devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
 	if (!bus)
@@ -2250,7 +2251,7 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
 		return PTR_ERR(i2c_clk);
 	bus->apb_clk = clk_get_rate(i2c_clk);
 
-	gcr_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-gcr");
+	gcr_regmap = syscon_regmap_lookup_by_phandle(np, "nuvoton,sys-mgr");
 	if (IS_ERR(gcr_regmap))
 		return PTR_ERR(gcr_regmap);
 	regmap_write(gcr_regmap, NPCM_I2CSEGCTL, NPCM_I2CSEGCTL_INIT_VAL);
-- 
2.17.1

