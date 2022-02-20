Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8074BD501
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 06:16:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K29X55FGpz3c5g
	for <lists+openbmc@lfdr.de>; Mon, 21 Feb 2022 16:16:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Qg59jRUN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Qg59jRUN; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K1Wpm2SFWz3bcv
 for <openbmc@lists.ozlabs.org>; Sun, 20 Feb 2022 14:57:20 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id
 cp23-20020a17090afb9700b001bbfe0fbe94so2138229pjb.3
 for <openbmc@lists.ozlabs.org>; Sat, 19 Feb 2022 19:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2tmnTcD52LG4gJnvsrOpevEsC/cYqDPXBT54iZq1tqA=;
 b=Qg59jRUN1ABRuiUYE6VpQvBs5j+vkngwJBnJF8KWwKzqY60FoVK/SbwpAIsuiv/OXj
 6PnQMp8j7rraXPa4QPJKarJBtfjv25eJWGcowwK4eotvlwoO439cQoLX0wurXCE2VsFO
 784p3rZFnNYRir3H9DeWwn5aWKX9TjUhSq6YOxdRTVQlzv546miPMbVnbCIqADElqywq
 2ZP1IVP1CvOjCrq1iPO5WlHTj2E0cnXnTZ8IPJFqKgWBRUGLdO4x2q+v3s8gfdTselgR
 LnTOtO/NL6u8HfpDeikXvjbReZ9JWHqt7W/7vDDZW2xPF9iSUAGZXVq+If1OFWcRrnM+
 P+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2tmnTcD52LG4gJnvsrOpevEsC/cYqDPXBT54iZq1tqA=;
 b=L0deUay4zAne/hYHZ7/YJ93pxhP11Bw79EaJUgRdbUO32WVtujAVfi1iaJVPiBm81A
 M8llqTFg5L/X1UiFhcHpxbBIj8ZF3ZD9bEbjCC9yrV9IGThBTVPx9/g7jb6OcO1RlEqN
 Mn6fYe2RQZQYTjAVl2qgWJvYaNorJTdg7vWarMVVRsBdoqA3zHr5cOnisFo1tYsGlxCe
 1SSfEhVg7Qfvv1q0deGqiIeJgmVa4PGZbbZJyh89iNLSOipOKKq9fraOUP4wDjBQEwb+
 fyZA08mpgne7P+SqgvCnxM/o75gLmLDwqA3cnjorxvs6OmIBK7da0I0A9z72SZDg/uGz
 ySeA==
X-Gm-Message-State: AOAM530Pi8CktxIGIw19NeWye+KIp+LjMfN83kaZlsPbROO1N/2TlYXP
 9ME4QEjEY7Sm+wjuL9dWVg==
X-Google-Smtp-Source: ABdhPJzFdJh2f7Pk+vzmchfosK0MBtO3bXVZVtmCM2acPgLBEajbVl3dTSX3Vb8WrxcqvT/Ng0Oo7Q==
X-Received: by 2002:a17:90b:1e11:b0:1b9:d23:bc3c with SMTP id
 pg17-20020a17090b1e1100b001b90d23bc3cmr19556274pjb.77.1645329438739; 
 Sat, 19 Feb 2022 19:57:18 -0800 (PST)
Received: from localhost ([2401:e180:8842:e799:9593:a6f2:788b:a48c])
 by smtp.gmail.com with ESMTPSA id q1sm7678024pfs.112.2022.02.19.19.57.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 19 Feb 2022 19:57:18 -0800 (PST)
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
Subject: [PATCH v2 08/11] i2c: npcm: Correct register access width
Date: Sun, 20 Feb 2022 11:53:18 +0800
Message-Id: <20220220035321.3870-9-warp5tw@gmail.com>
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

From: Tyrone Ting <kfting@nuvoton.com>

Use ioread8 instead of ioread32 to access the SMBnCTL3 register since
the register is only 8-bit wide.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index ee4757eff4b3..4715afcf9ac4 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -360,14 +360,14 @@ static int npcm_i2c_get_SCL(struct i2c_adapter *_adap)
 {
 	struct npcm_i2c *bus = container_of(_adap, struct npcm_i2c, adap);
 
-	return !!(I2CCTL3_SCL_LVL & ioread32(bus->reg + NPCM_I2CCTL3));
+	return !!(I2CCTL3_SCL_LVL & ioread8(bus->reg + NPCM_I2CCTL3));
 }
 
 static int npcm_i2c_get_SDA(struct i2c_adapter *_adap)
 {
 	struct npcm_i2c *bus = container_of(_adap, struct npcm_i2c, adap);
 
-	return !!(I2CCTL3_SDA_LVL & ioread32(bus->reg + NPCM_I2CCTL3));
+	return !!(I2CCTL3_SDA_LVL & ioread8(bus->reg + NPCM_I2CCTL3));
 }
 
 static inline u16 npcm_i2c_get_index(struct npcm_i2c *bus)
-- 
2.17.1

