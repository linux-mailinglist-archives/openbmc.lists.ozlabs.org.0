Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0E5A19B67
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2025 00:22:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ydg7h2Fjvz3dK4
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2025 10:21:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f2e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737494102;
	cv=none; b=JFEX2Kdb+ctZC7WD257xBut4q7RgNGoJewwLqFCQu190F+qbXu3M6xmiA3xuvFiCxqZAo24/5N+E4sdR+0iAz3kUT0Yjdltx7TPB0tYOB2v4JHDhEA++MyAQhgZ6yJ2VJK9VExg3rldoqEBzErxwlzZaLZ9pE97jFs/ht/NVTqiE4YiVkBV5QkWv/8l3cttfmNrK5ltg5u/cx620isusmqzVcWIS9YBeBLGz/Y0FJCujldYoCyEXe2flnZFh1I5Thy03GvYqA4K/AFu5oHPuCvFsiBKjImWKsUYIoQ/7K8Cjx8IHYRsP/UA64CdSp7xywa7k9xp5L6JsweUxr9CcKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737494102; c=relaxed/relaxed;
	bh=1rVEk0Dr4duA7/mRQLTXbAYgAr33LOipnA2cEKQfgjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ln4TT9nPW5OJPtyJiqyj/CGjukpmLGpBvl6B8A3vH73igplOkmqpmwzNBXpjBU4zWUI7mcYhBPCtg0DMaTlL9xZNkmAo/wgYf5NOkjUi07eTpGP4aWMhupDcvFjrc6ts+k/syhqAvnYnAsh/lzJiHziOexv2T+Un8Z3THR0LJixBefxsCG2Jmbn7WWDN+Tyc9L5F7yW2P3s06p0YEzDViM8gNX026Oq+HdamjN7ExGymcy9kOtd4/xZRt0H6HL7ZdcMn1ALs/hWfPzRvEyt0b21bmM9V0VT9qtuBc1Klv1s0EaD2hOHFJDBr34HQ5GMsKRNyLGmS4H0FU08Y1A4Tnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZDUi7yBo; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f2e; helo=mail-qv1-xf2e.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZDUi7yBo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f2e; helo=mail-qv1-xf2e.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yd0N433gKz2yGF
	for <openbmc@lists.ozlabs.org>; Wed, 22 Jan 2025 08:14:59 +1100 (AEDT)
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6d8e773ad77so49000286d6.2
        for <openbmc@lists.ozlabs.org>; Tue, 21 Jan 2025 13:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1737494098; x=1738098898; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1rVEk0Dr4duA7/mRQLTXbAYgAr33LOipnA2cEKQfgjg=;
        b=ZDUi7yBoCRuDfPMBmarqrHqhjEYFD80Dl2HqeL4Alsnml9e6o/c73Cbkf4H5FkgHjc
         gAcmNbEXmnAgPBoGehsfh0iDKeNayO/ml1MHC4R/qEXUhRPcu6TD6Nv15HmBYV1pEs36
         7JDT38H1e1W29PRGgCch7l1RTv1ykeiVVnnPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737494098; x=1738098898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1rVEk0Dr4duA7/mRQLTXbAYgAr33LOipnA2cEKQfgjg=;
        b=N0cexLJmqoSM5Q25oACSVPDjefadPiwVQwougXB6ydpPRXudZTM+A8dl9ZrAVRfNcH
         tYh4fxbjrFF8QSw5jsJEe6KJO+DDGeT6JUE4ynPnj+2E6UBsTU48C2FQ7sdDfM8U5Vcb
         HoIplTXgTlra15O5/LJfBgO/NcPRjii5OzJWafxOyK/0SgXEQ/BpaPM1PriqJvTjy9aI
         4AiHOIiBLrJmEUJobvMNf0xrEwleIsHgxvcTRPF4SBvlCcJHp0f57wVxZj1yrwjW2jf2
         q/IWu4CBW8ZVL+2XAL0cw4HX99djWeM2t1vS40W1p84vWZ9Mh2FbCU4Vg+fs9FROZTtY
         mOZw==
X-Forwarded-Encrypted: i=1; AJvYcCXQaiS5eEzv+JxzFuP0P5ZquHWsuOt+uUX9pgHyrTPlihYia+lb/0xiNqHcTGyM3P+Ry4+7agdc@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwyDcs0X7vk4QwcsPyPFwFs56rSEvH/09HCnAc9EA27xyR23LoE
	60ET6WbizKjM6kf57c2CyMF92VdgEmIHo8/NIF78OD8ZpDgKbhViQlSkRzy0OQ==
X-Gm-Gg: ASbGnct/ibxLRjhMvcOVDMTZCqxNNz4MVYag51jSs8bJ5pfLr4Jw8W9K8gxmj10t8Vt
	W0iNmkeEtNPC6ttwUuOgwHG3O4fPLeFxJ3oEPk0WqOWoDbsd4AcYokDYeeBAH4i6AeAQLd3n1Jv
	iqb4za/BhLvjYguNoH3d6vbx4EVe03rKKbVjjBgb+zLe5kApkSCaxC3dpDfSiqLJGVznPtTglrv
	97dqNjlDt10QaiEohopo4gFIElcVzBxTrT5vf0/tAI4dnAEso8wNVKdhDbuJJYW9cHu1IAJigkE
	759wkSdgTvJeZ39IxRvijZFb77LJi8cOaiCP9v1fFL6CvPOWUQ==
X-Google-Smtp-Source: AGHT+IH+AfjXa1HWP93h0DvJI7kSSGAfNsF6+75hu7mgbzlxXWv7+fIY3EtnqV1a4Imfwy4GAdj7Jg==
X-Received: by 2002:a05:6214:762:b0:6d8:7ed4:3364 with SMTP id 6a1803df08f44-6e1b2168b97mr263725776d6.3.1737494097728;
        Tue, 21 Jan 2025 13:14:57 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afc28f84sm54790186d6.63.2025.01.21.13.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 13:14:56 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 21 Jan 2025 21:14:50 +0000
Subject: [PATCH 1/4] media: nuvoton: Fix reference handling of ece_pdev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-nuvoton-v1-1-1ea4f0cdbda2@chromium.org>
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
Cc: Marvin Lin <milkfafa@gmail.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

When we obtain a reference to of a platform_device, we need to release
it via put_device.

Found by cocci:
./platform/nuvoton/npcm-video.c:1677:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
./platform/nuvoton/npcm-video.c:1684:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
./platform/nuvoton/npcm-video.c:1690:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
./platform/nuvoton/npcm-video.c:1694:1-7: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.

Cc: stable@vger.kernel.org
Fixes: 46c15a4ff1f4 ("media: nuvoton: Add driver for NPCM video capture and encoding engine")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/nuvoton/npcm-video.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 024cd8ee1709..7b4c23dbe709 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1673,6 +1673,7 @@ static int npcm_video_ece_init(struct npcm_video *video)
 
 		regs = devm_platform_ioremap_resource(ece_pdev, 0);
 		if (IS_ERR(regs)) {
+			put_device(&ece_pdev->dev);
 			dev_err(dev, "Failed to parse ECE reg in DTS\n");
 			return PTR_ERR(regs);
 		}
@@ -1680,11 +1681,13 @@ static int npcm_video_ece_init(struct npcm_video *video)
 		video->ece.regmap = devm_regmap_init_mmio(dev, regs,
 							  &npcm_video_ece_regmap_cfg);
 		if (IS_ERR(video->ece.regmap)) {
+			put_device(&ece_pdev->dev);
 			dev_err(dev, "Failed to initialize ECE regmap\n");
 			return PTR_ERR(video->ece.regmap);
 		}
 
 		video->ece.reset = devm_reset_control_get(&ece_pdev->dev, NULL);
+		put_device(&ece_pdev->dev);
 		if (IS_ERR(video->ece.reset)) {
 			dev_err(dev, "Failed to get ECE reset control in DTS\n");
 			return PTR_ERR(video->ece.reset);

-- 
2.48.0.rc2.279.g1de40edade-goog

