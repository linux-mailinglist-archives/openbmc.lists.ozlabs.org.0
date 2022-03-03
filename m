Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 985004CB927
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 09:35:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8PSh42dQz3bth
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 19:35:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qOb/GhQm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qOb/GhQm; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8PNd3xkSz3c1B
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 19:32:01 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id q11so3865774pln.11
 for <openbmc@lists.ozlabs.org>; Thu, 03 Mar 2022 00:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gemv/m3fy5mH7vN3z4SfVeW61ie6+SbsNCmd1e66iDM=;
 b=qOb/GhQmaW5qzuMbeq6CVTbF0XKcUkXoSq4Tw0lrE9tI0NC8uGOjn1c2iX8uEZQvTh
 pifD0Ac3NjO/Dpy2XMMqyAJAL3c6WU0M2xfF6aU9ZF5efYgwxsseDauE5znM44M+W3M1
 hDcyd/jmAaWOXymcIryXBoYtA3W4GRoWQ/JgyYDMhaWLPcYzsHErv4KFWX/VfSvW/ygz
 tLxOB5FNrgLsCC8EQjMeLi5UiimRZ6Be87GJEwkQMJqUm3O7G0A35Ym8SxidfWLynZrs
 08sQL0ddLlyjD5SOw3ggGouUNXxhL23ibonAsWxuLLXb9dZankXlQdLjphwOxhv23ODC
 4zYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gemv/m3fy5mH7vN3z4SfVeW61ie6+SbsNCmd1e66iDM=;
 b=xNnVYUb8doq7KAYMco4QwPgtcbnkgyy71oHBCHHLpfTCVGogS6qOZxppXzpt3NgVbe
 tus++C5MmF+oYm/6f6X94+/a/+1jqluPaAil28sqlbTTl0N4nEB32ESJmH0j1JvWzCc3
 /YsEjFtNRjKEGJ5pmqhNXHHqyhL66qJEtCx1agJnYJ42VceV49ynrfxdozP+bGx2cwyc
 f//yZZxDe2tSjkbCsUjS9op6sH/kWvc3sn0RrY6cx9mAXOwHBgMkKEymW+P6j2Jx8U1F
 Xbp8zb0ZiUjDquPq0/yfq+hmwptkiVs13idg/lxLb0yOn/Z8dBNWN91tT+u2u3B2RsbQ
 4EiQ==
X-Gm-Message-State: AOAM532FxXhLuRGAL/3PSbIhXdkL3wTSb7Mer0w7Zrd0jr0HEYYPBmVT
 IviOuKniIZW+IbiMYz+Nbw==
X-Google-Smtp-Source: ABdhPJw7csZ9mmUKOrvkTmQLtl79hsqW2wKR7aaJgSWlydcfx7rL96BlJq+OKUTqLzAq+G0r+Yq5Yw==
X-Received: by 2002:a17:90a:ba8e:b0:1bc:202b:8657 with SMTP id
 t14-20020a17090aba8e00b001bc202b8657mr4190100pjr.16.1646296320231; 
 Thu, 03 Mar 2022 00:32:00 -0800 (PST)
Received: from localhost ([2401:e180:8860:3b30:e4a0:392a:996e:c525])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001bc4ec15949sm7330431pjy.2.2022.03.03.00.31.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 03 Mar 2022 00:31:59 -0800 (PST)
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
Subject: [PATCH v3 05/11] i2c: npcm: Remove unused variable clk_regmap
Date: Thu,  3 Mar 2022 16:31:35 +0800
Message-Id: <20220303083141.8742-6-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303083141.8742-1-warp5tw@gmail.com>
References: <20220303083141.8742-1-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tali Perry <tali.perry1@gmail.com>

Remove unused variable clk_regmap.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index fa12212b2428..c41de3afcf38 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2233,7 +2233,6 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
 	struct i2c_adapter *adap;
 	struct clk *i2c_clk;
 	static struct regmap *gcr_regmap;
-	static struct regmap *clk_regmap;
 	int irq;
 	int ret;
 	struct device_node *np = pdev->dev.of_node;
@@ -2259,10 +2258,6 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
 		return PTR_ERR(gcr_regmap);
 	regmap_write(gcr_regmap, NPCM_I2CSEGCTL, NPCM_I2CSEGCTL_INIT_VAL);
 
-	clk_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-clk");
-	if (IS_ERR(clk_regmap))
-		return PTR_ERR(clk_regmap);
-
 	bus->reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bus->reg))
 		return PTR_ERR(bus->reg);
-- 
2.17.1

