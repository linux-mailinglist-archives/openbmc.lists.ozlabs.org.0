Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 194577B1CDB
	for <lists+openbmc@lfdr.de>; Thu, 28 Sep 2023 14:47:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=g0PoCmoB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxCsw6hmjz3cD0
	for <lists+openbmc@lfdr.de>; Thu, 28 Sep 2023 22:47:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=g0PoCmoB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwbmL01bzz2yDD
	for <openbmc@lists.ozlabs.org>; Wed, 27 Sep 2023 22:40:00 +1000 (AEST)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3231d67aff2so7369790f8f.0
        for <openbmc@lists.ozlabs.org>; Wed, 27 Sep 2023 05:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695818387; x=1696423187; darn=lists.ozlabs.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FIhs4BXY6YTveTvsRzye3j10AAGXVI9gvPzsJlGfAZg=;
        b=g0PoCmoB7IGzlg2fRTa/4dxpEUzRU7FMMuqiOkXAlcS63v8om4QOwmm2ltXTicsiPl
         kpYggD076jhveupUTvQA7sI+hUfsm6YymciA6Q1t2oHjk8TD7Yk9iojX9R4ICLGr+vCc
         R7SCWgvVI+kb+/8GVP/biRexgWm7M70fzTOPVwppnA42Uw3gsUus3qM65j3666ot5JhT
         rwO8guVRzvIBwy7Nhm4R7AEikczQOhPUOcOH/YLCxnSrGvlRFghmIfd9IIwyj1GsIOVk
         cCgAwSGga7qkr4FmqrosGJ8lh8DvCbuftAJjp0x9+lgdXS7Eq32O7aszSjqsWFRUARR2
         PNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695818387; x=1696423187;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FIhs4BXY6YTveTvsRzye3j10AAGXVI9gvPzsJlGfAZg=;
        b=RmrRd/4cbBcvMFvxy+lP2Ph/dMruTGAscKiQDt1YW5DecifWTGzevzo/CEd4S0tr+U
         UGZx3XXB3wS8+QpoAFWR8bJosVZKH3E+BiDXOn2x9suJmKfllUjTxpGKpRXwQfHbjzOH
         W6BFSeZig07TL1VlWas+bAeKTKqn8kty5Axs4CFojOMOOUCIoHA86aCFI2sq3ZJy50lS
         cMaMw9bPCA2enC0aSEOt9uFV3M2rqMsGAYtxbECeELXQXrq5kpNMl91EUY2l+z2QXtzh
         8CGCljz4AtZ0ANC0SQOwaO+FXOBxYy+yGJDmvLohzq6sk60TEogLrBIly1a5tNsMHXnq
         v2nQ==
X-Gm-Message-State: AOJu0Yyk9F4MtLKfIc0faJmzX7TooUsJEBTIhundKVPXFHbF7X7ndu47
	zG0sZeSwasWiD5xTQfhTmDX+7A==
X-Google-Smtp-Source: AGHT+IEX1DR+gf+lCbxY7PiBtDS+udqlOUQsbofCCFY2WMj3GiFEZa/d1gZ3zztXu9BXUCF+I4ff7w==
X-Received: by 2002:adf:fa12:0:b0:31d:c73d:d2ed with SMTP id m18-20020adffa12000000b0031dc73dd2edmr1456778wrr.5.1695818386752;
        Wed, 27 Sep 2023 05:39:46 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x17-20020a5d6511000000b0031fd849e797sm17033260wru.105.2023.09.27.05.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 05:39:46 -0700 (PDT)
Date: Wed, 27 Sep 2023 15:39:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marvin Lin <milkfafa@gmail.com>
Subject: [PATCH] media: nuvoton: npcm-video: Fix IS_ERR() vs NULL bug
Message-ID: <3134a802-75fe-49f3-bcd6-06addc2ffaf5@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Mailman-Approved-At: Thu, 28 Sep 2023 22:44:44 +1000
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
Cc: Joseph Liu <kwliu@nuvoton.com>, openbmc@lists.ozlabs.org, kernel-janitors@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Marvin Lin <kflin@nuvoton.com>, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The of_parse_phandle() function returns NULL on error.  It never returns
error pointers.  Update the check accordingly.

Fixes: 70721089985c ("media: nuvoton: Add driver for NPCM video capture and encoding engine")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/platform/nuvoton/npcm-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index ac8d73b794d3..b9e6782f59b4 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1660,9 +1660,9 @@ static int npcm_video_ece_init(struct npcm_video *video)
 	void __iomem *regs;
 
 	ece_node = of_parse_phandle(video->dev->of_node, "nuvoton,ece", 0);
-	if (IS_ERR(ece_node)) {
+	if (!ece_node) {
 		dev_err(dev, "Failed to get ECE phandle in DTS\n");
-		return PTR_ERR(ece_node);
+		return -ENODEV;
 	}
 
 	video->ece.enable = of_device_is_available(ece_node);
-- 
2.39.2

