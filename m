Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F5EA4324F
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2025 02:12:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z20276GpKz3fVR
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2025 12:12:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::72a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740380644;
	cv=none; b=KgKNGpfL4/g2Kbq4dzuSTY/qJFVKCfbUGNyAYJLr0NJIM83g2dmDuJWvg6IlZwn9E21KO9BVn/8Ya++hIcwL8BJsYhYGkbtvtwuD6gqLPeGVbha+hP75tbkqBBBtXkkHDalJI7yC9praD0YrDJmjihoYii3Sv0ZZ5p4oa0Q5bvm5IKaMp1/dlXyOZHETOom/3UTiuBQOFS9URvb9z94smQMYugalV1JLDfVPkR6isYXrqcMPj3AJmr5XN7VvewErYo9U+NHxinY9MvmtHbL8HLLwaRssaiyyCfaETSl9Awg+SQgClWtU7mfb2OQWoYSbrc6slwe+j4EHGdnuxIKRyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740380644; c=relaxed/relaxed;
	bh=+zNBSiNN48vAuN3f6QiTHcLYM/YjS/mOVk8GlAcAGX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JVZfYFKjxqU9X/8UEtITMPAw6LQlCe9qBIy0JK8SlzI5KIGongbKHyY3Gjznl/9pLJIANhloLKsbZsV2nYl7D8fDBGwAmh3Cvj/jwBqgNsRT+o+aRDA2w5KOOiplwi+6cmVUVPQ/WamOCrPfc78on/509XZ3oMkVlYUShaDjRNien2UR1WQqcy+pCIBqiJA9XuP6HtyjsekxRuNJoyqzY6Oj7Kobgx0HCG9o5ByyJW5vzBA0kIJ1e2lF5X6kXqcj0UbHm5l+fuo7UnxXWC2U/shdNsCasRuHofBtfHGC5d3A2sSMQa4xRnJb+ysBOtYR4XG3++ywj3zDy3PJxgkHZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=J/G0Js7T; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::72a; helo=mail-qk1-x72a.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=J/G0Js7T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::72a; helo=mail-qk1-x72a.google.com; envelope-from=ribalda@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1WtV6vDpz2xdT
	for <openbmc@lists.ozlabs.org>; Mon, 24 Feb 2025 18:04:01 +1100 (AEDT)
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7c0a1677aebso392422785a.0
        for <openbmc@lists.ozlabs.org>; Sun, 23 Feb 2025 23:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740380639; x=1740985439; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+zNBSiNN48vAuN3f6QiTHcLYM/YjS/mOVk8GlAcAGX0=;
        b=J/G0Js7TUwUDr5G1BcmUshwereFUCADSqvWOubG5PcasjOqLt7aVNX8k1cWKd649U/
         yRE67K3uVFt66mg8cPtex2ywM0CbJm0tdF/QvfSfTpT/PnOOOgeqcAv2vdwg+f/z0fBn
         rp1bqNse9I7FoaCfW/lmcDhZ+MfRpbAyCciyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740380639; x=1740985439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+zNBSiNN48vAuN3f6QiTHcLYM/YjS/mOVk8GlAcAGX0=;
        b=gY3oSC1t+ZP+SahdKPW/MDALBoBFxpc8F94RnTNZ0WmDzoBxdhYnqBUNhOKXtYTRa3
         D4LDzHRjZx22Ll6oKx8ufOH+JAyo1CFWL/sQpB5HpmbJmmMHcL4gtrc6q2uiJ/7jTPXd
         kfMe6/vtStwPoKixRL/iLzuVgNMs9stAYxNV+M43dS8whYB0WdeTaxE7ksviYkN2qNtc
         6NGFQW6zl0+wH1uGnslDQrdJbdQseQFVYgWwbvftlwrRqw4MhBEnu44hpKTOmgD80VW3
         L49pMJbBFYss+ocDCYl/v8nKU6j+DuYxQ7NFp7MHVg3igmxP3QbNtbJF16S4TEC8mMlL
         Q/Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUl/NWa/Hv7V9ZaOXn9vq2TOTlJv9tuXHUkkinI68MVM3lD1vRvqsK6tWSsv5eLetQeRL86F3Ts@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxr4MOJ0tR9rGHl2/QRaLlIUg/tdZOMOmtR9XghSj+YHlB9wk7V
	ZZ/he+2Sk0qzNRxSTp6ggh34vMMgFqVj+l5kuNr1Ei4SdVkUUvNjlxfkdjphoGPocbgiL2IHvLy
	0NQ==
X-Gm-Gg: ASbGncsQ8RD/GcbOsWkW82gVF+b9FnmrBAHT03q+ZEWblnT2MP7ZLGh6kHsrewHAxtY
	/BFnGxyHpL+dHS8yvUHnS5MdNJLoIH5ukH006mYelXNXmwmVoKCqEb4CGk2U/aTiFKX/fhaHrr2
	ah7iSU5zCXK8VQCSSKj44dLWag0pDNLqfjLVqDqgyE5+uje3JZHR+my3QYM2Zioxpnt4dsOX0i9
	iIAQY/Az0Nhe9OUlHucFRIlxnFODBS3aFxHyu2LKMshyXlSgOXJyHWUZpIMawnLhRM8DV0kFcDa
	bkN/Ecnm2hVCUOwwi+QxqjhhzljC06U2TNz4jUKU9npYm/H0sYZD3ArUXkAkS9cMOSMz+mruI3I
	49bc=
X-Google-Smtp-Source: AGHT+IHcm5l4vj+qLy5nO1kcV2ISxYp1Ig6V5tDSH+3S1QoU9rYnKzcGaZk0NeL01r9155s+2saw4Q==
X-Received: by 2002:a05:620a:488f:b0:7c0:b018:5928 with SMTP id af79cd13be357-7c0cf96eeacmr1637963085a.47.1740380639403;
        Sun, 23 Feb 2025 23:03:59 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c09bf81253sm977920485a.47.2025.02.23.23.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 23:03:58 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 24 Feb 2025 07:03:54 +0000
Subject: [PATCH v2 1/2] media: nuvoton: Fix reference handling of ece_node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-nuvoton-v2-1-8faaa606be01@chromium.org>
References: <20250224-nuvoton-v2-0-8faaa606be01@chromium.org>
In-Reply-To: <20250224-nuvoton-v2-0-8faaa606be01@chromium.org>
To: Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.14.1
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 25 Feb 2025 12:12:04 +1100
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

Instead of manually calling of_node_put, use the __free macros/helpers.

Cc: stable@vger.kernel.org
Fixes: 46c15a4ff1f4 ("media: nuvoton: Add driver for NPCM video capture and encoding engine")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/nuvoton/npcm-video.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 024cd8ee1709..0547f119c38f 100644
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
 
@@ -1669,7 +1669,6 @@ static int npcm_video_ece_init(struct npcm_video *video)
 			dev_err(dev, "Failed to find ECE device\n");
 			return -ENODEV;
 		}
-		of_node_put(ece_node);
 
 		regs = devm_platform_ioremap_resource(ece_pdev, 0);
 		if (IS_ERR(regs)) {

-- 
2.48.1.601.g30ceb7b040-goog

