Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 968C9A19B6A
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2025 00:22:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ydg7t2JyNz3bcS
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2025 10:21:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f2d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737494104;
	cv=none; b=L1nsGtQFLYzNCiYW5Y7x2eMCZxr/Ia++oLZGtOlu03QwZGUger6225deq+s04l1rOVzPw/fI/DGEypqC5tBzSoIhdm/UryrsZclAG/TDYlBEbjtGgfQk+H6W5YLlo4FQFAeWgT3c+W5J7Lq93xY9Wzp3+dnApzPbdnt5A0OlHS9cDqQ0ox5qy8gKcoExH8kcbVBsKrJFh0H2L0l4KYV6rTuPcRmObDhIJvmisZXn1Qsxxn4u7BT10Q5JyXISB5/6HA2GRep5MrYdo0raboBPdUp91YB2C6/dIiDRF1lzbwU0bRDcmD6i3ZcQHR3x7ca0AchVcBgPcwb5t9fdEUkLYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737494104; c=relaxed/relaxed;
	bh=AWWHKFVC6UKJydJIK/G7foijQRC+Q1BFZCM05TTLGSQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yq+EI9fYEzz4CY2FEs3BTICm/Y3gaOBrr3Ol8UcK33flT9l2I1PvqaZDRUKOwK+ilfJRnhw0jdBad1d3P7Sinjo3mXPLpLRJ6lUhgtb+4C27hoUK/DZ4BgLPqsBJOcKi50lzsNuXCZIBaKKf+VykshB59nsjkzJnsPR/HYO/bo1by5BUSEnh+XdsRsMf61V3V8DGiEZYWxqBuPDKkvauQi7GSK6ydo6nZ/uTz03upTu7/XD+OdI3dmcRx0jGtcqI0BiXnsNVHQQOkWPYfWUYr1H6BFzCofsgZz+9Y0cEDSmy0reAxYGVOoCA2BHA1lhA15IZILOgtRLSdmtBHWGvFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LAsobjDd; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f2d; helo=mail-qv1-xf2d.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LAsobjDd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f2d; helo=mail-qv1-xf2d.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yd0N737ldz2yNP
	for <openbmc@lists.ozlabs.org>; Wed, 22 Jan 2025 08:15:03 +1100 (AEDT)
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6dd1962a75bso51913466d6.3
        for <openbmc@lists.ozlabs.org>; Tue, 21 Jan 2025 13:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1737494101; x=1738098901; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWWHKFVC6UKJydJIK/G7foijQRC+Q1BFZCM05TTLGSQ=;
        b=LAsobjDdB5VyjJAkRzNX1MQhMfFrYCLrOOT/WUl8oHvGtIFllb4O54HuaYlat0aiyK
         lz//71LdnvDHXEiH5TVPtVq0xe9P9wHT92BLZXAaYBBjfGdNOylyHfFoMKc+TxaJ1oR6
         tYB7brucxfidnk061veBuUMKCddnTTHt0GLB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737494101; x=1738098901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWWHKFVC6UKJydJIK/G7foijQRC+Q1BFZCM05TTLGSQ=;
        b=wUs6FZozGc4jbg+25EEbVDPvK9HiPr5Wp3CND7pw+pHgtQqfV9NX9TprQXsQyS/Gi3
         aHcQlC32w6Az+MFiIZkHOlnHixH3naXjI+RKuwgcU9kGp67ZSGskqkxO+nLDlCuvWmVe
         bMqeMQnh6Ri3RPhgf/JtSy8yrjOfovJ5mo7RJVmIlORUaAXmkQqkvL5oYzz1GnfN15b0
         qHOmX9WbgMKtlI5+nSvRyTtpjiQZvraK0JO9UXiIMuck12lAGXkEhuQgc+rDvgQpzLz6
         I9YRTH3R9lTVVbj8uM79twLtEj3oe1d8Pg45Nr4CiiJn8DMPg0mRy5VK7MCEm7i2St60
         O0Eg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ0RoLbfkcgQKaR581+dz2ZGwgWg1HucpgogL2gANrokSlSLubaGCYH8S0U2IcC7OhWY7o6l9b@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzk2MJimIkBi6PWfOZxMB+LwTwooCK5qdISh86BJWWSzII8pLjf
	g3dVq/iUH9gUYm08F5lt2YsYEUpUlDs9AmLAH8dWUinGBMYxjyt19evA7dHAFA==
X-Gm-Gg: ASbGncunxiLsQaEwlLPkI50gY9+nbQV4Djv4mYNfyfn4hw0lw+vQpOelEbphciYOvUp
	XV3SEDA27DC7iqjc90pDARMpdTJhSy3pSxt1nGbMYUsTJUCqxRJDVfnCMDec11eOQu+hmwo0kdy
	RrUNqIbmTkLcEf6hRKTUIzFOI8Ug5dGr1ZO0AfCro5TsmnonJronICIwZSCB/QxjmYrGt0/c899
	gTS1pufwksj86P3yM4euxhZYHcUUG4ljY1NItCtipWHLMiUnf3POkX/2/67RUh7V6PnfrekYHRq
	Q21xy3obHXqBvkzqc6UnkVY9QzLap3mtalbC9jgrQPYn/I/q8A==
X-Google-Smtp-Source: AGHT+IG3DsvcJCCgpRI2aTM0TBQe/diTS5TbE7HiFHeA/ESOV/zRmEEEPnnObFwVwY4g2OGPUbxevg==
X-Received: by 2002:a05:6214:3006:b0:6d8:8aa6:ef27 with SMTP id 6a1803df08f44-6e1b2230914mr317755556d6.38.1737494100811;
        Tue, 21 Jan 2025 13:15:00 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afc28f84sm54790186d6.63.2025.01.21.13.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 13:15:00 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 21 Jan 2025 21:14:53 +0000
Subject: [PATCH 4/4] media: nuvoton: Use cleanup.h macros for put_device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-nuvoton-v1-4-1ea4f0cdbda2@chromium.org>
References: <20250121-nuvoton-v1-0-1ea4f0cdbda2@chromium.org>
In-Reply-To: <20250121-nuvoton-v1-0-1ea4f0cdbda2@chromium.org>
To: Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.13.0
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 23 Jan 2025 10:21:31 +1100
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
Cc: openbmc@lists.ozlabs.org, Ricardo Ribalda <ribalda@chromium.org>, Marvin Lin <milkfafa@gmail.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Instead of manually calling put_device, use the __free macros.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/nuvoton/npcm-video.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 8e69fa14433a..7a9d8928ae40 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1669,10 +1669,10 @@ static int npcm_video_ece_init(struct npcm_video *video)
 			dev_err(dev, "Failed to find ECE device\n");
 			return -ENODEV;
 		}
+		struct device *ece_dev __free(put_device) = &ece_pdev->dev;
 
 		regs = devm_platform_ioremap_resource(ece_pdev, 0);
 		if (IS_ERR(regs)) {
-			put_device(&ece_pdev->dev);
 			dev_err(dev, "Failed to parse ECE reg in DTS\n");
 			return PTR_ERR(regs);
 		}
@@ -1680,13 +1680,11 @@ static int npcm_video_ece_init(struct npcm_video *video)
 		video->ece.regmap = devm_regmap_init_mmio(dev, regs,
 							  &npcm_video_ece_regmap_cfg);
 		if (IS_ERR(video->ece.regmap)) {
-			put_device(&ece_pdev->dev);
 			dev_err(dev, "Failed to initialize ECE regmap\n");
 			return PTR_ERR(video->ece.regmap);
 		}
 
-		video->ece.reset = devm_reset_control_get(&ece_pdev->dev, NULL);
-		put_device(&ece_pdev->dev);
+		video->ece.reset = devm_reset_control_get(ece_dev, NULL);
 		if (IS_ERR(video->ece.reset)) {
 			dev_err(dev, "Failed to get ECE reset control in DTS\n");
 			return PTR_ERR(video->ece.reset);

-- 
2.48.0.rc2.279.g1de40edade-goog

