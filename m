Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7357A19B69
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2025 00:22:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ydg7q0zq8z3fvN
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2025 10:21:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f33"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737494103;
	cv=none; b=IU1Tyb+2ajBUrjYOlPQELmdvEvoOGZkHFhlXSYlCZV9Lq637wTe8HRRiLnCOFRV2wB0ivxTEc8qpdZa9+QG95v3TaeeyLgOYUoI3nPFjZcUYIlqo97/eNjyKbSxzzvQ3W7sulEO3LzkakFIO0u+iLN/J7Xr/zy6usbOeuuRxddh7YaDfw5LVeXSYEHbY9rbC7Sr4ipGE8C/NhUMDBaV2qEZtAVVnoJ7OS77gsikuSYZalhxFp1H/4me7LyB/jgF02EoqK2uFYC2rR9n3kY+kyBDyde1MrzKXaCdfaYuTmXV5DFFjNmLJ/k8ZCwVMre8aKnxy9lWm4uZhi2wJ1wPyfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737494103; c=relaxed/relaxed;
	bh=EDypBRxJvQaUqQoINiNHn6E1UtSb53KvENj6pqF6igs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YQYgcY4T5uwb22zKYxAEdWFW+B97gCotU7Lj5LbPUqwHrblbADf8RGA9cXjPhqvy6vw4tJa51JLRjHKnvWNWeYECJZIBIdMEfEsVl+J4GX6rcNNsorxfFhV8PNLzCxzpeVgdzY5gRZAvZKAfQQ4E7CYkcZPu3/9rGxiafSG6vA3oWueSu559y6AQzrrWaiTrIb9kkMU7BBfqhFxuvvrObBQPmr8b4S1YiTOnaDJoSkYPeHsVQTjOS+FOjIORg05znCTGUakD58fX6PAcgCT7m2Uo9aj6M4iN8G0sxgb1lVbrBljDaV6wEnQH5FU3Qp3ASBwxrXejasBU6VTiw+OiLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JuUJna+I; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f33; helo=mail-qv1-xf33.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JuUJna+I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f33; helo=mail-qv1-xf33.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yd0N63LTNz2yGF
	for <openbmc@lists.ozlabs.org>; Wed, 22 Jan 2025 08:15:02 +1100 (AEDT)
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6d900c27af7so61139046d6.2
        for <openbmc@lists.ozlabs.org>; Tue, 21 Jan 2025 13:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1737494100; x=1738098900; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EDypBRxJvQaUqQoINiNHn6E1UtSb53KvENj6pqF6igs=;
        b=JuUJna+IQnZSmm5J2yeCnkRRqxtb0q1JxBAEqKa1ngDjUfUqCfgIIDERK2O3wiWj4e
         N7wYHO5whvOPQk3mqpYzF1VETtT0H0++hiH9AiSwFO19oiGjnlEakCi1vie16xTrAB2H
         LsrMuGZ/TCmfjFar29je2udcYWZwNvaBjgO9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737494100; x=1738098900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDypBRxJvQaUqQoINiNHn6E1UtSb53KvENj6pqF6igs=;
        b=i4+h5twWEJdTb5c8AKb9chK3prv14yZmVRT0b0kMZoPD1uA0t4wTgXHqsBIyVDSI2N
         8hYECmTes1Sn5XCTagKGlijs6L5//usUXx1XLbNj06FeULYebkB+XoZxTrVzx53Isx/+
         aUosNLwFcT4eMKeOUNcTWXOhuZCLRanHojfxUV66CimPXFMaeGQEDnFKoZABH9gZmWuS
         cS0D1M5DYLZEvyKzUFwNYFXQJ3t0pJCPfibK7KfyxeW9lJqEutCC3zb21fykaao/g8s+
         NXHVVsWwc/TYVKR3R8/GEAYDk+023tw1JM3WeoP2k58hCajZ5yproOHCBGJTbPWLmVc0
         9qGg==
X-Forwarded-Encrypted: i=1; AJvYcCWmW4nfTYPus4jwYusdoFeHtTGDem2izqmLqdRkFv6GAfwa+hQc7hXfdSWnhjimmkWU8hh0SdP4@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxUD5//+OHUvJdhg2fhEvK4fvKeHhwTTYSupLyF1mRdNuAm9EzH
	ua1V/VvmBQRQVBQP4DJIczVcbhPd5jkj6IPQN4rQUyeWmM//dL2wLDGbdL0EWw==
X-Gm-Gg: ASbGnct5T8dltqtd1gxSQ8aheChiZZX2fKN2AP0BkgIR1HFAekT2aiUBsoT0GaD6jsq
	tUkH2C4WAGusCUCt1+7/fDIlo/4Jp0S4d2Ko5TVzxTz6oJsNvVN+NfPUxPcLynOtJud2hfXcD/e
	wR8/Ms20jZiyY0tSj5I5RmOcnEezReqdBA6d+m96pH6nmnAGbwVNLNGy4c08OthPLWroLHS4DcF
	GZXqsG40RDF3Fdy0kM4/EhvqH5sbshygYnAs6Gun0B7tJnXrPM4/Xq0Os59i1cIcfU0Fjbj0Tv+
	A3U+1nTfkrL3oEhh9/b1mvqCsX81aBifWQ6YYp/Ggz4MFYv9RA==
X-Google-Smtp-Source: AGHT+IH2nW3HKiyhk/ib7bj/aH6TJVLtiNxwx87MHvq1Ur/SwGzlc6RDNTd7PprtRI9dniJmJVuT3A==
X-Received: by 2002:ad4:5d6a:0:b0:6d4:215d:91c3 with SMTP id 6a1803df08f44-6e1b220e572mr291236936d6.28.1737494100024;
        Tue, 21 Jan 2025 13:15:00 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afc28f84sm54790186d6.63.2025.01.21.13.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 13:14:59 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 21 Jan 2025 21:14:52 +0000
Subject: [PATCH 3/4] media: nuvoton: Use cleanup.h macros for device_node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-nuvoton-v1-3-1ea4f0cdbda2@chromium.org>
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

Instead of manually calling of_node_put, use the __free macros/helpers.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/nuvoton/npcm-video.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index f6cba17a7924..8e69fa14433a 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1648,8 +1648,8 @@ static int npcm_video_setup_video(struct npcm_video *video)
 
 static int npcm_video_ece_init(struct npcm_video *video)
 {
+	struct device_node *ece_node __free(device_node) = NULL;
 	struct device *dev = video->dev;
-	struct device_node *ece_node;
 	struct platform_device *ece_pdev;
 	void __iomem *regs;
 
@@ -1665,7 +1665,6 @@ static int npcm_video_ece_init(struct npcm_video *video)
 		dev_info(dev, "Support HEXTILE pixel format\n");
 
 		ece_pdev = of_find_device_by_node(ece_node);
-		of_node_put(ece_node);
 		if (!ece_pdev) {
 			dev_err(dev, "Failed to find ECE device\n");
 			return -ENODEV;
@@ -1692,8 +1691,6 @@ static int npcm_video_ece_init(struct npcm_video *video)
 			dev_err(dev, "Failed to get ECE reset control in DTS\n");
 			return PTR_ERR(video->ece.reset);
 		}
-	} else {
-		of_node_put(ece_node);
 	}
 
 	return 0;

-- 
2.48.0.rc2.279.g1de40edade-goog

