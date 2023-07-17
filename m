Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AF675938C
	for <lists+openbmc@lfdr.de>; Wed, 19 Jul 2023 12:57:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=H2COhlx6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5Xnj4kskz30KG
	for <lists+openbmc@lfdr.de>; Wed, 19 Jul 2023 20:56:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=H2COhlx6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com; envelope-from=orbit.huang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4HQv1PwVz2yDd;
	Mon, 17 Jul 2023 19:51:18 +1000 (AEST)
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-77a62a84855so171844439f.1;
        Mon, 17 Jul 2023 02:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689587474; x=1692179474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tcwB+50WnrsP8py0GmyCczQm2hmYLGk+1hGHK9Qssd8=;
        b=H2COhlx61z8Ns4BSCqx04DRIvFD+dsah8oj7ScwfTlakaVfK/hmNgyBgCiEZV9wn49
         lZnRqqSMNGzqDHsfko26Tvdcjvyv5rnEfk1DNATnd1BSJBNRMonWacSi7kVjl0RESo1u
         K2vJPh3Asy9Iwt2WYiYU6J5/xjDKA9SIkdkFtNAcGPn6mO6yZZYyINZRVUXyq+iOjAJn
         k+T4GCyqwrVEix9sUBEblydFtWxmzvWWNa2/qj8XIVisN1vP8fOjGM1ERjz55eIobWtS
         7JZC6SAieh+l+26E9qWgi9cRFu1ERmFGu4dU7jaNzjMO4wbyRajs1wdvfPoszrnCwNU7
         Y6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689587474; x=1692179474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tcwB+50WnrsP8py0GmyCczQm2hmYLGk+1hGHK9Qssd8=;
        b=lRa9akxxUA8cQ6zoMyiODhgQ3o2t9ER0IQ0RxR6XTBa/hLi0I1MoMBq7GKKi1lByy9
         hcayhJuvOo8CUjDThjrmN2eJKuhbL28RMD3fYjjaeB1YalDR0rooukVeXCfsKoR6B+qu
         gnhm6wzoADaG6Rbek4zUwa3Bb87dd7OXmGfa/Yf1O/goshFoXIfT9ufuWZf7iKAcbX7W
         egq0IAnIaluH8j8omgyZEW54ybT24qk3jInF0wWKRW4rAG9KLeC4WGE+sJpkodmGPrGx
         4yFcdD9pnxZjMVg1Ek/A/yD3jx/Vk0DFouazz0Ho6+Hbfr/1f+90Np2ZSAG4Xaw+FWzB
         XK3w==
X-Gm-Message-State: ABy/qLZ1yvhJfGosYp6jZ+Ua4WCvoZa8CaEpnFR5PUbbhZAKeVyxc7JW
	fevpGMXD9n6bLYoyE4utv0g=
X-Google-Smtp-Source: APBJJlFdf/+zUrmvf62IEu/h0Ce8005lr+fBlUd78kDZAW2R9nniW9R9S7bI2n8dcGtTrzCuxGWMQQ==
X-Received: by 2002:a5e:aa14:0:b0:786:4795:30c9 with SMTP id s20-20020a5eaa14000000b00786479530c9mr10485510ioe.20.1689587474435;
        Mon, 17 Jul 2023 02:51:14 -0700 (PDT)
Received: from JammyHuang-PC.aspeed.com ([118.99.208.177])
        by smtp.gmail.com with ESMTPSA id g11-20020a02b70b000000b0042b3ff53458sm4376819jam.169.2023.07.17.02.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 02:51:14 -0700 (PDT)
From: Jammy Huang <orbit.huang@gmail.com>
X-Google-Original-From: Jammy Huang <jammy_huang@aspeedtech.com>
To: eajames@linux.ibm.com,
	mchehab@kernel.org,
	joel@jms.id.au,
	andrew@aj.id.au,
	linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: aspeed: Fix memory overwrite if timing is 1600x900
Date: Mon, 17 Jul 2023 17:51:11 +0800
Message-Id: <20230717095111.1957-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 19 Jul 2023 20:56:29 +1000
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
Cc: Jammy Huang <jammy_huang@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

When capturing 1600x900, system could crash when system memory usage is
tight.

The way to reproduce this issue:
1. Use 1600x900 to display on host
2. Mount ISO through 'Virtual media' on OpenBMC's web
3. Run script as below on host to do sha continuously
  #!/bin/bash
  while [ [1] ];
  do
	find /media -type f -printf '"%h/%f"\n' | xargs sha256sum
  done
4. Open KVM on OpenBMC's web

The size of macro block captured is 8x8. Therefore, we should make sure
the height of src-buf is 8 aligned to fix this issue.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 v2 changes
  - Add how to reproduce this issue.
---
 drivers/media/platform/aspeed/aspeed-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index 374eb7781936..14594f55a77f 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -1130,7 +1130,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
 static void aspeed_video_set_resolution(struct aspeed_video *video)
 {
 	struct v4l2_bt_timings *act = &video->active_timings;
-	unsigned int size = act->width * act->height;
+	unsigned int size = act->width * ALIGN(act->height, 8);
 
 	/* Set capture/compression frame sizes */
 	aspeed_video_calc_compressed_size(video, size);
@@ -1147,7 +1147,7 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
 		u32 width = ALIGN(act->width, 64);
 
 		aspeed_video_write(video, VE_CAP_WINDOW, width << 16 | act->height);
-		size = width * act->height;
+		size = width * ALIGN(act->height, 8);
 	} else {
 		aspeed_video_write(video, VE_CAP_WINDOW,
 				   act->width << 16 | act->height);

base-commit: 2605e80d3438c77190f55b821c6575048c68268e
-- 
2.25.1

