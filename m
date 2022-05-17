Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E979B52A229
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 14:56:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2bhn60V1z3c81
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 22:56:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BFLBvUFd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=BFLBvUFd; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2X3R4p6nz3bqB
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 20:12:03 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id r71so16182063pgr.0
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 03:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z+v7OeDU19Dx5OqvJml/LWDpfKUkpKDzMruV+njhM6U=;
 b=BFLBvUFdFjhCmJ5PZQyLahqwcrEeVsJb8I2uszKR2JGRTbHVGU484f+Exmvt8pR8aA
 r0/HSIuQ+pDcBeQt3nOxWqUnXgUXDwwWFjQlU9Ex23B5cjQzUrmmWn9jtTtKWrK7Xehs
 OCg5LB5iCu7aGmidRUaZWww+ZJRYDKxfvXnXOqoD3jwXU9W6AMZ7iWLfwN3tsBEMMWZx
 cNqEnq+TKjaAdtV32WvdnOqEWPqXMTAhaLi0mH1VnevbTngCe0O+mxEyMuqiQZ1uDX4i
 IsuyUvPtbt/1n4W1rTsk9o2rk0P+fLafpHKP31DEGBGk4PdffXw093rlfuLhhYEizbfK
 yu8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z+v7OeDU19Dx5OqvJml/LWDpfKUkpKDzMruV+njhM6U=;
 b=tx/I8K5YNEu8RzlPwamLQNeumGYiwJdtrIjo7rHTYNuGgY/og9vicQ6B9M7HvNG834
 GS1VL3XTcfglozWQnpgCL2xjVmFmjIMX1c6NPm2d7qqbf0Z1XbQmdk+dbwRehTfHA50s
 idfIR1vwjK3kAl1p1ydJ9W5NmKoX5Z/BgXTs9dotkMjliO1EElcQWIAiRMwHr5qHNnpL
 PiXx7koVdX6qdYwpqzo+oClU8qLvNrRXJY7bVuVyeTHXSDclbPjYUEHtGvmG9cQmDxAF
 nICnJZcc8W87MzLZNQdFzF0oId+hra74qn0wV3vSiEfmTWlv5Tn25WIj4XKCPkzdfaVN
 NzzA==
X-Gm-Message-State: AOAM530diSgRIllFNS16FfflMBvNAeHRx6+eHGcmDCE3BrgHYs7u0TDl
 yXH3i1tDsbgow427dVYowA==
X-Google-Smtp-Source: ABdhPJy4CbT2fr0u0NJFcGxWZtYo/tMJgWqT7K5+lEA2ttjksht9DWTaHEpJJEJocxnzFfxwEutZPQ==
X-Received: by 2002:a05:6a00:1c5c:b0:505:7469:134a with SMTP id
 s28-20020a056a001c5c00b005057469134amr21921186pfw.16.1652782321136; 
 Tue, 17 May 2022 03:12:01 -0700 (PDT)
Received: from localhost (220-133-130-217.hinet-ip.hinet.net.
 [220.133.130.217]) by smtp.gmail.com with ESMTPSA id
 t12-20020a1709027fcc00b0015e8d4eb234sm8598283plb.126.2022.05.17.03.12.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 17 May 2022 03:12:00 -0700 (PDT)
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
Subject: [PATCH v5 03/10] i2c: npcm: Remove unused variable clk_regmap
Date: Tue, 17 May 2022 18:11:35 +0800
Message-Id: <20220517101142.28421-4-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220517101142.28421-1-warp5tw@gmail.com>
References: <20220517101142.28421-1-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Remove unused variable clk_regmap.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index de4e5f2f3e5a..550e4a4d1e01 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -2231,7 +2231,6 @@ static int npcm_i2c_probe_bus(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	static struct regmap *gcr_regmap;
-	static struct regmap *clk_regmap;
 	struct i2c_adapter *adap;
 	struct npcm_i2c *bus;
 	struct clk *i2c_clk;
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

