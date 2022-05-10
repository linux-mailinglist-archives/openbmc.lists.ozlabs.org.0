Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F005210AC
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 11:20:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyCDb0HNVz3cCV
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 19:19:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DJjHmuLt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DJjHmuLt; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyCB44BP5z3c9p
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 19:17:48 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id q18so3280914pln.12
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 02:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YU+ACQq6gQmiv69eWKJ1cs7k5gUUfV2jP2s9r+r1/GM=;
 b=DJjHmuLtCJJJzNAObnAvbt4EVn2tV1C6HyPbkTNkBkt+u7YzRJWmp+9GkzK+s59HoC
 EkIuWZF78rmXclmWI+XSTsapLvSGVjtd2Pb5wumz0fMlNRrUMaehVBVDGB64cA3ycNtn
 RDmzWRi5no2zOxWpkSrc11oogx70fwsvpY/rbPLi+FhLgf8vMaQQ0cJN+GiQaO5yHhMM
 O1LriYKBTYjLfqlftgL9VZBUJoXUf2GnANNLB/SSsTduJPFJHZlXCRk44Bwf9Jg73os+
 CNU26YD0pG51mRoegeS7lAk5X2LW16H4OgRBppkzJlZFI3BmB64jN5BCAz6w0QMf9K6z
 nIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YU+ACQq6gQmiv69eWKJ1cs7k5gUUfV2jP2s9r+r1/GM=;
 b=17QANb297M+g59U0Jp2El1gjZHLTTfq0DTXtzZjbGAPBqbHd/E+q8+ELMdXu7TovBF
 vkUQkqge77qlZQSukDEkzhFpSDjgUNiVNAJlcf+f7oAuAdgxnRBdUAQxfCRYhKtxZxex
 4/3Zx+Aiu+sqP/kUANprgMDXLpbFzV5ZaCr9fcOfBKLu6DTSuFjMLqrFriQY2UL4kHTe
 ar6dAu61lLxN7BCgJM0dJq+i/MHDZ3bjd6h1hseKFoWzIlTtZj4OCQiIENar9jasQl/R
 RZ0ABrp4jRgibVCbOQaRx8caq5IlQI2w9NDXb1mGxkmHerQMY9ftyWVxGtCp2ogu6Jfn
 Ovhg==
X-Gm-Message-State: AOAM532egG6df6dCOJZKC1DC34b3HcfUp1sq638mhfr5K3YjMQZ6PigA
 TZnhKaoc8OMHknVZ9hJWyA==
X-Google-Smtp-Source: ABdhPJzB9SEZuXBMXDcNqBhEfmRz9mLjvbyU+A0vGOfxeAzh8AZFNe2CLpz9utPPdMNMIMwJ+BAB/A==
X-Received: by 2002:a17:902:d3cb:b0:15b:a002:d80c with SMTP id
 w11-20020a170902d3cb00b0015ba002d80cmr19822236plb.108.1652174266261; 
 Tue, 10 May 2022 02:17:46 -0700 (PDT)
Received: from localhost
 (2001-b011-7010-358e-c990-a8c9-85a7-1d3e.dynamic-ip6.hinet.net.
 [2001:b011:7010:358e:c990:a8c9:85a7:1d3e])
 by smtp.gmail.com with ESMTPSA id
 ls6-20020a17090b350600b001dcf9fe5cddsm1317715pjb.38.2022.05.10.02.17.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 10 May 2022 02:17:45 -0700 (PDT)
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
Subject: [PATCH v4 3/9] i2c: npcm: Remove unused variable clk_regmap
Date: Tue, 10 May 2022 17:16:48 +0800
Message-Id: <20220510091654.8498-4-warp5tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220510091654.8498-1-warp5tw@gmail.com>
References: <20220510091654.8498-1-warp5tw@gmail.com>
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
Reviewed-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index e6ae11ed2d82..1f92c84317e4 100644
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

