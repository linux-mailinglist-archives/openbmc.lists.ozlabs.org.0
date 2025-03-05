Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 495F7A50F23
	for <lists+openbmc@lfdr.de>; Wed,  5 Mar 2025 23:53:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7SWP15BHz3cDN
	for <lists+openbmc@lfdr.de>; Thu,  6 Mar 2025 09:53:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741164330;
	cv=none; b=d1QU1+7ybHc3Hj760HcoBoJ1SWjFbx5saPxx9TexaFgF9kKy5t1b/fxMGoSW7CNekj46LE8CUrXqpOicVvXxpU2Z6ICTgj1Jjtjx8hBIlsY6RD4Fhpg1FsTYuwvHTYlswofbrfh5NQZRNU/6OpdcJFf0TIu+3BEi3ItSjZ6IVg3WizmtXulJTL7EFo2nxGSVpYMCyTKuZahpqIW9cATJRYpCo+vb3F7JEt51C1THsOm63uLuOKUJgwei4HSA7wi6naxduwvD9l7Yd2QcGN5CHvpaRQmsxh9IpUGBvbp1q/KrGkCBNXPdxwM2PHn+jGsjK6m702tdPHZND2y9bIMThg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741164330; c=relaxed/relaxed;
	bh=Rqpz8NuFEKxlJYYhCortmvxtTD3Iriop0nreRrYWvRM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aHAHXbsxT02HZvjRCUeGFJqlI2CdGJ7F8NuM3gLqnWFZDBlRwEQtj9DvmuZx1c4b0CnSmlW3lAZKsN6IjIqfUI5aWTKOl9aFG4wQWuG+Akj/FjykgPU9z+HBeOv23Y7lZ6I2R/vetG3fwDfWA1hxMlWSRTmxBN3J2JEp6PjAf1Yc1mz+x0Ry6fqdgCd5NGtGWj6VwlRHrD721jUy6lnPizr6cuOqhpCuu57s+QgQG0ZHRLsGIgwLHk1HF+A9iX9tvDb1G0IStMCxQ8rDsBiyAtJcU5JJRw6PIiRtlwtz3gKt7komVkFAr78lnPi4pT8H3ui8+1XitArXbTm3vEe+qA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TT8STZ7D; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=zhang971090220@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TT8STZ7D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=zhang971090220@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z75jP2wpxz2yVV
	for <openbmc@lists.ozlabs.org>; Wed,  5 Mar 2025 19:45:29 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2239f8646f6so68867725ad.2
        for <openbmc@lists.ozlabs.org>; Wed, 05 Mar 2025 00:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741164327; x=1741769127; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rqpz8NuFEKxlJYYhCortmvxtTD3Iriop0nreRrYWvRM=;
        b=TT8STZ7DsfyK2xr3sAnTq7faYNxHBRsa15fhBiqOsWuSk51vTCVM/NDkM89OdIaPFl
         a3l6KnkCPqmw9vU21eLxsJT/n6d2pthedobuKWjVn9Zpu5+jBJSkcYr/gR47cp4Zg3MQ
         SwTVskgYURDWoboamePXBUd4ex9gupP84nSUqA3BK4Pq9dAUCJDAjun3GpDUtOpCl04U
         ZeVYrt0/l5BwIf34sKmvJP7ily0JeZ1L5FJN2Nc1YlABscQ/3lHsnRsA+Bjg0qI8F8wv
         skipE15OMZuVtaCnBPQZZVgGk20l2UsfP/RSZQECOQfnViHHrn9a7BoJc1d+uE3a1cvC
         Tnig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741164327; x=1741769127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rqpz8NuFEKxlJYYhCortmvxtTD3Iriop0nreRrYWvRM=;
        b=BqDZDSELoJKr85BdagrB4gSXFmcmcMnpXVA54iNwDgLYFniEn0q8YwY/LUn0FWajsC
         BVkmBmgQORBEMyTk8DZp7igE6PdzCPXTWyX9el/ugvFQYVDfpWsgRxHLK7pdAk2SCQVv
         FoQSrpzP2irfXKMVgt0iPLImsHcnBcT2u1P2BvLoqfDnAgw9EqVbx1ZRQcDsEmwe5tWL
         ibwsBn4MXV1Mq+hpBnG3OF8naSvBA+64McCEMlb8r/DqlY+Xi33K9fjEl3r/L7jeU9tz
         liAzf0qZlwuAU3vEBCffx8+GQL6f8oisjevbMVtDNDT5fEaIkER958FXXsuedh43timD
         J6xg==
X-Forwarded-Encrypted: i=1; AJvYcCXscYNp1dVkE9GAD0z8WAK7W4ICfocKGeH0mHUuEE4v2JTEf8ZhtTZn6mc1jIaUlQRb3vggVA5z@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz+Orfm/KJB2tXntEGHPCzlRII34izMXwXXcaJRyXUKLC9rtOp2
	1w6QAg8JUdWpHk1PeYkhcRP9sjMXtshrapuLGKdAuA4M5SSHpxMm
X-Gm-Gg: ASbGncvpdzIhYTbbPqWI45KgLMzmChbLqkgbflj7PqO3OqOCLNjOazomwAcSNnkgvma
	tYwsdZbHX13RgUotr1so3P/7E8BgnjLcQEhs1cLwznvuDN6etTn//6FuTF95g3CbI5sewd9u/Pz
	RQLsj4U8VlvNYddRukOX7Xa7A4nImwpmR2YzBby32LEIirLS+dL+8wTwztxg2OkiTRKlebhn9+F
	LF2f/g5QykjIhKEAnqlAQUGwIFxvW6+oHYFwNiJ4lql9m2gfWL5zqV8TbzQLSP5e27Otwooanqm
	kPUmY/2vpQi87r1e+gmQ+MPCrZ87q4teWnI0CQgrnOnf1yKKXvUlBxbExGy2f8VdJmfuj4wiwWP
	WvFYOvzlJAKg9E8lM
X-Google-Smtp-Source: AGHT+IEmMT/Q1ZyuHiSkgiaUWON5hc3roCdGiEGL+IQ72oapCvNgtlkFvSMFcuntcc+xDBZtRtmJWQ==
X-Received: by 2002:a05:6a21:150c:b0:1f3:4581:ce85 with SMTP id adf61e73a8af0-1f3495bfeadmr5303878637.36.1741164327322;
        Wed, 05 Mar 2025 00:45:27 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7dee0ba3sm11433768a12.68.2025.03.05.00.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 00:45:26 -0800 (PST)
From: Michael Chang <zhang971090220@gmail.com>
To: kwliu@nuvoton.com,
	kflin@nuvoton.com,
	mchehab@kernel.org,
	zhang971090220@gmail.com
Subject: [PATCH] media: nuvoton: npcm-video: Prevent returning unsupported resolutions
Date: Wed,  5 Mar 2025 16:45:17 +0800
Message-Id: <20250305084517.1301054-1-zhang971090220@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 06 Mar 2025 09:52:58 +1100
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
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

To restrict the returned resolution due to Nuvoton SoC hardware
limitations.

Signed-off-by: Michael Chang <zhang971090220@gmail.com>
---
 drivers/media/platform/nuvoton/npcm-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 234fdec04f74..8d6d51a674a3 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -578,7 +578,7 @@ static unsigned int npcm_video_hres(struct npcm_video *video)
 	regmap_read(gfxi, HVCNTL, &hvcntl);
 	apb_hor_res = (((hvcnth & HVCNTH_MASK) << 8) + (hvcntl & HVCNTL_MASK) + 1);
 
-	return apb_hor_res;
+	return (apb_hor_res > MAX_WIDTH) ? MAX_WIDTH : apb_hor_res;
 }
 
 static unsigned int npcm_video_vres(struct npcm_video *video)
@@ -591,7 +591,7 @@ static unsigned int npcm_video_vres(struct npcm_video *video)
 
 	apb_ver_res = (((vvcnth & VVCNTH_MASK) << 8) + (vvcntl & VVCNTL_MASK));
 
-	return apb_ver_res;
+	return (apb_ver_res > MAX_HEIGHT) ? MAX_HEIGHT : apb_ver_res;
 }
 
 static int npcm_video_capres(struct npcm_video *video, unsigned int hor_res,
-- 
2.34.1

