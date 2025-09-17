Return-Path: <openbmc+bounces-653-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A5DB7F017
	for <lists+openbmc@lfdr.de>; Wed, 17 Sep 2025 15:10:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRSp62cP8z3ccN;
	Wed, 17 Sep 2025 16:01:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758088910;
	cv=none; b=Xc9rlfyjHbvmKcq9kEtGJ71ObsXQqrZ6fEJ+nfIX4gwYutQXbgxS22KPFIkhrwGUPbIVVj7MFyQEGYz3VA07YcaxKa91DA4+Bvu6fVTfxF3f7DX3BA8g0IgmWNM4pkS4xaWxYDkfppURK4DePwf1DEX35WMJtHUlcSzHeb78rBc7KXF2BKdHc1b/5sN6vV8GWAnATwBGwffiH/QBEw7a1pFWOQHh0pe/QjO06lAj9WLwSaxB+Q2p+sxE9oWMLBivKZXSFosQFQtusw7GyilMGndAqbtIOV2XObT5nK1O/a2X+gf0fBRGF0JSPsmXyiFrc2Hk6zfgSU84O9lLxgrSlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758088910; c=relaxed/relaxed;
	bh=jCdV+K7YiBVTjoSvGDkLGiR0hcBO7/gHDcR1Panf8ZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GBVYLg9rL3tH/ZitI0HIeRWU5qPofh6cKQHtcV5tCUkgpqonpWpjfarAz6Q1ODRVcSMcgqKp/vQpjIPib5uNw3vqazdTLl63jLLe1a5hIgDAlMnZQeB0UUvV5pWP9jW9w+5s0mIn4M9YJRw214+V1+l43K9my4t4Hgq4eXaTVDjJ5IZ5FC6WVUzPKFoTCTTq66b2PVFNG8TO0chlMvqnmUgE06oegte5cng8g4VI/nzdI4YxhRWjHFQX1ADWxrenup1LT6aadoN743rNo8Jp8VJWbCkR7fkIRN65nv3l3Z/3Ghqb6aG3RYLs0CFzFvZRKgczgA6gKbRZ+9RMafGXFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JyKCuee7; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JyKCuee7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cRSp5505Dz3cZ9
	for <openbmc@lists.ozlabs.org>; Wed, 17 Sep 2025 16:01:49 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2570bf6058aso80857545ad.0
        for <openbmc@lists.ozlabs.org>; Tue, 16 Sep 2025 23:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758088907; x=1758693707; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCdV+K7YiBVTjoSvGDkLGiR0hcBO7/gHDcR1Panf8ZA=;
        b=JyKCuee7kIe20ME4sFwchBz8c1m4bxWcUofXprhCiVI+JBM8KgaYht0DIPdHurhMk6
         HFaaA9q+wszL0LbP6YHzLgNfPR8Eors4MiHbo7+v0V0nJsmeFDAsCptNHsSwBkCkCgWZ
         6HoL6t+AFhnM2kcmwSYb1l0vkUF4N5+aUn20E2B35/0Sutp5kaM8x0kCI9EjGSB+RSxj
         17PJn7amefpZ2tnyVE6A2Q+vnmEhmZv58ZRIri+0MGCyQz436Z0+r+JIJR1TonWEHBJa
         6FJqpqIK08EywGfOM9Cu1j0e69J8OrxmUgmGPiPgWEjwQCB3NzFU4Y8Rn2jwoCwnvGCw
         eKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758088907; x=1758693707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jCdV+K7YiBVTjoSvGDkLGiR0hcBO7/gHDcR1Panf8ZA=;
        b=p5X3jCs1hd7CKcjy+XJM/KFHr7zBUs4eQZg4pcytVYcsOMS2yjB07KzUD6pw8vzKJ2
         WHQ5XhhJYMUlY2x8mzkHtlCfTpBkJlIbzFpIodu7ulHrnuKeNZKSyHUzzTl7omobLY8S
         GtBYA1UJQpyEE4lTI3KXDmc3Kh36buMobinO6+7bVZiGbFevySktjVpnDeD7sxk1OSjJ
         D4KwHMDIgrCprbHS2KUvQO2yxnAmU8Z80ra63IsgmwYkjWrrh5J3dN8s02uKdChTy4Ht
         c5yUX/yOn1MzRvvK2xpopBuJTnhdBinwweJIDyropUhZKGLl9c0fWPYVW43nXkQwcdFm
         2/0A==
X-Forwarded-Encrypted: i=1; AJvYcCUdykx8gvg8TPg2CidM+ClpgzK0at0QuC6nAxfDWeiSdjtCP1lQwjpK4dHI1F2X5XD6yzuK1As/@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxjgw/m9mMY0u6xQWKN6kG6XEM4/eSs2vUGY/iN1H89kD1tEtVo
	GJCj0TEO/ZjyA0Ln2ln+ycEWK9x+rz7zT/jl1iLl4cCVF56bcnRgjkajHh8CPg==
X-Gm-Gg: ASbGnctJqCh5bIlx0N5yVJx3u4lTAe9Yd4ukVYuuDJGSFOAAmtNk4eSug+TCVRlh4em
	+UyGG+PWB6EKuFI/JrrpH3zrPBmuP+l1+xQJcePZ7OwZp137hHKu2SqQKfZt6EZjAyknNjzdDI3
	yLxG+mSsB0v6OgDwwK2TRhj/bf2sqoqF7rSpVmS0PF+Kyny+t22pmG1irtS/mSukCIVdCHDT+Dr
	j2I2mWlQnMgczCdyb3r0+U1ju3KitPqbUHN4E6SYalJDmBsDn7fLZAEP+YihoNHgT2onjEwubx1
	Ta27RrYum3l404Jaocwr1uiqsTAjakBdYH7ik/K0rb7WlQPnQsOtVZcxEEe4cpLMIPwCRMwLp2S
	M7wI7hOu1x28yAKf5yssUtgMLys4glCYWYRxsWKqZs6XMPx7JbOp63j89ppZZn+HRnIGIPQGbDS
	yZu27WeJH19/vHU+tt6N7v8dJa8Q==
X-Google-Smtp-Source: AGHT+IG0fkdns/P4qMr+RRO91u7miqFBV+0f6YAhEdWzhky7lgbEvMTRWszH+a2u/N3qeybRSZkgRA==
X-Received: by 2002:a17:902:ef06:b0:24c:82ad:a4ef with SMTP id d9443c01a7336-268137f3196mr10462655ad.32.1758088907185;
        Tue, 16 Sep 2025 23:01:47 -0700 (PDT)
Received: from eric-eric0420.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2645b8a6357sm92235525ad.130.2025.09.16.23.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 23:01:46 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: andrew@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Cc: peteryin.openbmc@gmail.com
Subject: [linux,dev-6.12,v1 7/9] hwmon: (ina238) Correctly clamp temperature
Date: Wed, 17 Sep 2025 14:01:32 +0800
Message-ID: <20250917060134.2383005-8-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917060134.2383005-1-peteryin.openbmc@gmail.com>
References: <20250917060134.2383005-1-peteryin.openbmc@gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Chris Packham <chris.packham@alliedtelesis.co.nz>

ina238_write_temp() was attempting to clamp the user input but was
throwing away the result. Ensure that we clamp the value to the
appropriate range before it is converted into a register value.

Fixes: 0d9f596b1fe3 ("hwmon: (ina238) Modify the calculation formula to adapt to different chips")
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Link: https://lore.kernel.org/r/20250829030512.1179998-3-chris.packham@alliedtelesis.co.nz
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
(cherry picked from commit 98fd069dd87386d87eaf439e3c7b5767618926d2)
---
 drivers/hwmon/ina238.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
index 5a394eeff676..4d3dc018ead9 100644
--- a/drivers/hwmon/ina238.c
+++ b/drivers/hwmon/ina238.c
@@ -572,7 +572,7 @@ static int ina238_write_temp(struct device *dev, u32 attr, long val)
 		return -EOPNOTSUPP;
 
 	/* Signed */
-	regval = clamp_val(val, -40000, 125000);
+	val = clamp_val(val, -40000, 125000);
 	regval = div_s64(val * 10000, data->config->temp_lsb) << data->config->temp_shift;
 	regval = clamp_val(regval, S16_MIN, S16_MAX) & (0xffff << data->config->temp_shift);
 
-- 
2.43.0


