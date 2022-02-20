Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3F94BD4FE
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 06:15:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K29V21HZMz3cDS
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 16:15:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bGb9MWeN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=bGb9MWeN; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K1Wpd3ZwDz30H3
 for <openbmc@lists.ozlabs.org>; Sun, 20 Feb 2022 14:57:13 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id
 t14-20020a17090a3e4e00b001b8f6032d96so12163350pjm.2
 for <openbmc@lists.ozlabs.org>; Sat, 19 Feb 2022 19:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=krxrJMNBibw4X2UMTZ790HAtT7R38NRGiHkdwGL9/6g=;
 b=bGb9MWeN7FHpDg495KS7+TlI5vXRFpbTrMLEJgSZe4PPIM6j6SzmKanme//Ljiyz9b
 eBxJeuJS9danM9QTLRgdIO3Cs1HY+BZoQbZNLP/MCn3iEf4j1vatNsFUIQEa4ez5yvnm
 a3CB3ivcTQFmYVpy9Ndd+cRsC7MrlraShax+mznAT8iukN6jsyLuLMNmGeuecRITXO81
 GmzG6T2WhbYpmEmqgm30w4qYdsj82u46mwgS2lk9HLpxtFZvz4iQKFjNa3LiVHm9Y1ou
 Xwh4OWVP9FLoBjCSSwv06q+Bmfk72EFCHTv6/Tg/RWd2E2lbNQfoc9uegkfpNPvx5RZX
 uCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=krxrJMNBibw4X2UMTZ790HAtT7R38NRGiHkdwGL9/6g=;
 b=lP1uRJMJPmLV07bXhrZ1WFwskY0TUBKgRI6F2BmxG75ulxagWWJhNXc9/hDcK7E+rc
 1GngnRGYoVJq7qe17hKkpx0QJpNosl3T4QiFR8XeOBu6vsYC2W332f/2jCKAFWRTLPTC
 441cPmCaClWv0MMMWme0Nlu0EkGwSoELoxAGdB9EIgQ0rgnSmDI5lfdIDo+W0BaXoqcq
 5o6eBPt7gAO1CLPt/k5oGFAnQqvJmehMluyZTG4Fqz056bxEWuko9dTQI4zVIN6zYiCn
 r59/DylMaZm/6ITYR88WWzjEpMmaXI4bXOkNhTK8b4Jbod+pRQwbULIr0KXEN+rzrWUa
 4s9A==
X-Gm-Message-State: AOAM530LfrcQ0+6VdBZNFGQPo1WfvQ+vD0s+0v32kLnpCVefSgkbDgBm
 B+jSJKNMZ7VWLv/mVVGCsg==
X-Google-Smtp-Source: ABdhPJz0iTAw94T1v7Qcn6hNjEMYPSkdyjVPAD0/ep2NaSYe4xQQG1d7d7cAsfdLf/buXrOQuLownA==
X-Received: by 2002:a17:902:8509:b0:14e:f9b7:6cab with SMTP id
 bj9-20020a170902850900b0014ef9b76cabmr13964607plb.162.1645329431733; 
 Sat, 19 Feb 2022 19:57:11 -0800 (PST)
Received: from localhost ([2401:e180:8842:e799:9593:a6f2:788b:a48c])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a17090a859100b001bc20ddcc67sm753354pjn.34.2022.02.19.19.57.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 19 Feb 2022 19:57:11 -0800 (PST)
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
Subject: [PATCH v2 05/11] i2c: npcm: Remove unused clock node
Date: Sun, 20 Feb 2022 11:53:15 +0800
Message-Id: <20220220035321.3870-6-warp5tw@gmail.com>
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

Remove unused npcm750-clk node.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index a51db3f50274..9ccb9958945e 100644
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
@@ -2256,10 +2255,6 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
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

