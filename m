Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B044CB932
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 09:37:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8PVn59t5z3bsc
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 19:37:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aVZAbdB6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=aVZAbdB6; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8PNm2lsbz3c3b
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 19:32:08 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id bx5so4034271pjb.3
 for <openbmc@lists.ozlabs.org>; Thu, 03 Mar 2022 00:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/rDAVTie3SxeAVR95vRKlzdmhRE4hsYCRa8DjWFbl6c=;
 b=aVZAbdB6qOjS5fF2o7kwdQwkygkcvelz0L16o+BUrVTIgWAA33e3g/AFxHk+vcXIBT
 vqfzkeq8Scdw0wnsLV4EKkyBx8CKfzrrRwouqAVTtiJmwF/08MvGswQ7oxqzPjxc5bld
 kLNdIUwrdxm8tDoRrKX3H9Ej0qPw3NUecQNTiBX6fwZRe0DYyBwRgrfs9hpO7l15QA9k
 JKfyT9RrhuMc7tz2i25A82VOODVcnQj40yVHIGJPN5llbT66Uv+JvONfKsVL9CT9yy3D
 1kpR5SHazPl4oUWjLmKfsJo5OKIOfTsSAwAa2rdoIfRu4VSkuyOwz3SXlKbgCd7XdgW3
 GntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/rDAVTie3SxeAVR95vRKlzdmhRE4hsYCRa8DjWFbl6c=;
 b=1E7j+rJuYjwOQp8XH6sHlBz4svQ3tiVqD5/3QAT7mfLkpPjBMTZP7/lOlYBr3YOsMF
 Z71wwg28/KYDRiMP35GpEwj48N7rQ4y33d5n0dwb8fPbscR4m9H1WNT2uCZAKKLTYyKn
 HnZc90kd//r6B7myoHhHSQLx+FaVUeXgktRW/EJ7JbF5beDrnxjJqg3Kd3FLIPrYLYSD
 DtmmUeTlzwbgc474B7tWCvecUycRsJKvgm1gB7rHdO5ViDakVO2PWu232dHcQNFMKXsy
 tqz0koZy+yAVEBrwrE/BZCk1wKB5CD58pTTp/COdqLB2XZKBsYdZcUQHAAxdAC5gbVbR
 u5cg==
X-Gm-Message-State: AOAM530zzcH7qIO3yS/6yNP8moRCcBD/RKvyKz+BBPrOOD30FzX1TIf3
 LmCPTpl+jW9lkS3jc1unsw==
X-Google-Smtp-Source: ABdhPJzNYvYxi1ws8nYxWLiJ/HZhxdhvXlIHm+oQdyzpYJ3n4q+nNTm2xHYXmM9w8T95ElGmIKl0kw==
X-Received: by 2002:a17:902:d643:b0:151:6f2c:cfb4 with SMTP id
 y3-20020a170902d64300b001516f2ccfb4mr17463802plh.120.1646296327067; 
 Thu, 03 Mar 2022 00:32:07 -0800 (PST)
Received: from localhost ([2401:e180:8860:3b30:e4a0:392a:996e:c525])
 by smtp.gmail.com with ESMTPSA id
 142-20020a621894000000b004dfc714b076sm1823145pfy.11.2022.03.03.00.32.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 03 Mar 2022 00:32:06 -0800 (PST)
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
Subject: [PATCH v3 08/11] i2c: npcm: Correct register access width
Date: Thu,  3 Mar 2022 16:31:38 +0800
Message-Id: <20220303083141.8742-9-warp5tw@gmail.com>
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

From: Tyrone Ting <kfting@nuvoton.com>

Use ioread8 instead of ioread32 to access the SMBnCTL3 register since
the register is only 8-bit wide.

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Reviewed-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 237da0ef32ca..66532c680338 100644
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

