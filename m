Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B36A19B68
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2025 00:22:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ydg7m0p3Kz3fV0
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2025 10:21:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f2b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737494102;
	cv=none; b=lmsi28kZfx5AYKu9BxAKBs6xg0LyIl9t9woZ6NAEb+IkoXHm9Rt4upbxJQC62238VyTTbrmhujGRZa3sijukVcKgei/7F0JrtS6VevcMhfEffbnLM+hq6rusORCSphTIxVthfuKCijRSz5gkCZ4jKYYcQEivhipSC5IF6C7cVGA7Fh9mw8MN6K5+Nc90V06fBIbS315n63ITJknOa+jwZ0McX+55p1fqD5c9tua8APt3LGa4VJRfitcypKEClRRoTMVQxPcKU22V/gUq+SEhLtnmA7L2UVNGUKmcnb8yNEZ8iEbV38cm4+mNYzcp1gVfU5fTaIktfxLkwTskQ9VL2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737494102; c=relaxed/relaxed;
	bh=YKIWMYbFrbAqwI1LUECt3RJuovYReI3o7uvAyeGPPzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZZPZgXFMu5n4DGANT93ucmDHjvqpWQeVpk00qBxMuZ1YJtOGl0PZBcgfYm++wRXk0c3ELlb4iG9wna9kyBg3MJQNE6idN/xYzgkraoKxgemoBsWHhUJRFvKFOdoYdQiI4zpVeZ2gdGZqmPl2wtXwBqfIiTkgfdw/ezTfwJVNUcQE8x8+CgFh8QpKeo8vjRFpzDg3PgRlOHNJa+g5vUiocoeLf/ltDsIZDC1WABu+vzDDluUCTNt3/QVhe15Ze7+cEjMyrr+MIxaRoRd3pP4orAdNCgw+UDJLoyBFHOoUX0BeWyqimYYj84SuTQW6Pt3MS02DXKFTUyaTA1XejfgsfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kIqnSu2S; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f2b; helo=mail-qv1-xf2b.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kIqnSu2S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::f2b; helo=mail-qv1-xf2b.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yd0N54mnhz2yLr
	for <openbmc@lists.ozlabs.org>; Wed, 22 Jan 2025 08:15:01 +1100 (AEDT)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6dd43aa1558so56322786d6.0
        for <openbmc@lists.ozlabs.org>; Tue, 21 Jan 2025 13:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1737494099; x=1738098899; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YKIWMYbFrbAqwI1LUECt3RJuovYReI3o7uvAyeGPPzQ=;
        b=kIqnSu2S4kEzO3cn/0oBJwkzZrX721cqIZcLVQkKyTQblnqSM7dL81kk6xezOMCJ5J
         Axj2GSopF5Ba+2suC51Tqzk+GuaNoaWfFpVrIFk0JJyEWZtcLssIROAeAk4GBSghslTi
         nLP0L7jK6vbcSWzrxa+hPJbdp8fKDKs6mJFao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737494099; x=1738098899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKIWMYbFrbAqwI1LUECt3RJuovYReI3o7uvAyeGPPzQ=;
        b=Is+SgNOnNa7EQCVLbQ9U1V7Em+a/15tlMIuFzU8hbr8zxPDjlGetv++lk2h4yDG49W
         j3afFotP9dpvUEpUfUHqGCD92yU9RqWpbjKO9QGom0qSITYecl94x9n87zbv6Put96OV
         8GJGmkyr+Q4TEwOI8+OjjGlUC6tFsGqck1ipoEqfmcA7piKEieVGFAchqSzQ9clztOk+
         xMfpJLFcByO8gAZ2B5NmjYJFsCO1136ZTxxdSQ/7Zud89frkgm/YsewxEEb9p9yWm6ld
         WDQ/WlMHjBwugsC5rzIbvlWN7qlvRS3obsIb+fGnDjfDHj194Dwcm72dJFHP04GGQVlA
         UiAw==
X-Forwarded-Encrypted: i=1; AJvYcCXBIpKKfu+TUF3niiP7KxUbdSywpUlJNcXUZSe72b6uUxc2PAwcWMTV0wJ24UXx7n8SVxXu3VRF@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx9DpaCJ/ZRTsE3d1obGT+Hr3CUl5ZzkZjlW060B4iBPnvy/cfE
	0dogMtQEUpaJPuOGYWf67jvK15TdCKPhkss6/prbISDDUUWfp2NPOmaLIDADcA==
X-Gm-Gg: ASbGncs2or5kFDe21hCyV9xGnmlwaQinkQpS9adMBxi4nTWStoDoHWgdIdNtvk6aofd
	xzbrtBZ23+P28Si2Hn84hcfFfZ8+v93QeKorjAX9bfVWKGCgjvf+eh+vpY1k3b5p29rTLZkrRr3
	7xLfrCiTQG21kfMzRQysUFZcPZX+Kw+HfSh7eMqaqEvklJvDsMcZdPw+rKqRlt5ZhyDBftZA7eY
	enfEG2YWtwLl8p0dKaS2JdbjhATQbV1ekeYPlCudyJbgbNuz5wpRAgWumj6MBy4wTii6RgK7htv
	DxB7dqepfrFO0FgmGJEf45tVajiMn6NlTqN8EqxBnHdJYSF+Sw==
X-Google-Smtp-Source: AGHT+IGahO5uMTq52/oBAxLhuuA75vO0AMXdFYbDv0vle1LutgvuSuhG7TKF9rnDFYbC8l6q7rTkxQ==
X-Received: by 2002:a05:6214:486:b0:6d8:95c9:af2b with SMTP id 6a1803df08f44-6e1b224ca45mr298377446d6.35.1737494099195;
        Tue, 21 Jan 2025 13:14:59 -0800 (PST)
Received: from denia.c.googlers.com (172.174.245.35.bc.googleusercontent.com. [35.245.174.172])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afc28f84sm54790186d6.63.2025.01.21.13.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 13:14:58 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 21 Jan 2025 21:14:51 +0000
Subject: [PATCH 2/4] media: nuvoton: Fix reference handling of ece_node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-nuvoton-v1-2-1ea4f0cdbda2@chromium.org>
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

Make sure all the code paths call of_node_put().

Cc: stable@vger.kernel.org
Fixes: 46c15a4ff1f4 ("media: nuvoton: Add driver for NPCM video capture and encoding engine")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/nuvoton/npcm-video.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 7b4c23dbe709..f6cba17a7924 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1665,11 +1665,11 @@ static int npcm_video_ece_init(struct npcm_video *video)
 		dev_info(dev, "Support HEXTILE pixel format\n");
 
 		ece_pdev = of_find_device_by_node(ece_node);
+		of_node_put(ece_node);
 		if (!ece_pdev) {
 			dev_err(dev, "Failed to find ECE device\n");
 			return -ENODEV;
 		}
-		of_node_put(ece_node);
 
 		regs = devm_platform_ioremap_resource(ece_pdev, 0);
 		if (IS_ERR(regs)) {
@@ -1692,6 +1692,8 @@ static int npcm_video_ece_init(struct npcm_video *video)
 			dev_err(dev, "Failed to get ECE reset control in DTS\n");
 			return PTR_ERR(video->ece.reset);
 		}
+	} else {
+		of_node_put(ece_node);
 	}
 
 	return 0;

-- 
2.48.0.rc2.279.g1de40edade-goog

