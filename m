Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E0BA50F21
	for <lists+openbmc@lfdr.de>; Wed,  5 Mar 2025 23:53:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7SWK4569z3cl9
	for <lists+openbmc@lfdr.de>; Thu,  6 Mar 2025 09:53:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741164292;
	cv=none; b=c1Pisxct+Cxfg6N8l1uKDi9hs8PiMzfuD/PCUWiYR43N251GVCKHYaQdqsDzC5KXJ67L06Rmr7rVX5AxFn6TnZLmizyTGQ3StgpHvrsO/gBQAtDLqD3eSmJmctPyAtHojPiJC4ovBJt7nvgJUhWSnGEpIXZqcwz8ZoaYwPyJ2UU4M8AAVm5L0zgPR8BI7erX5kwRS1g2GrrdYySDHvw7ouQL5jWPzfBvYZ/yGOjd1llQANB1jIL9FN8q9zdUpegzqY1T0OHg+DMGoXNnmeZpJzUQbVOfTn+kZsX5m+D/Hm3HjAfTMy3OGzKDNbS3gRktFh7WSAWuzbhsYLOdOAHTmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741164292; c=relaxed/relaxed;
	bh=nMh/1IYC1/u6DKKOw2ms/3tpOZM3Bu58eEc2wmPyXZA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eX/Ni1d6tj6ZFpGP5cntgIGRSg9UTMfW50N2WZsQtMuVmPAjiH7SeiZmfZZq+SgL33pa1EEOkZREH1z5ylo4Mz9IYpPymyGHWrD27/juZwvttQTc/4mY/iurWKeYe3VdQPyXipmViv2XSEiXJr1He8wWe3BHGXIwgQ003MklqD1/V+Ze5dZgK+ZReE5cpIzVEvFewN9lwoXn8r9hlj2QGdjv0hLaUqEzKjQXqGYoUOyu21RFZGfBSJor7sjSiRrjI/Qw/ccpadYFSz0R6tClfrpt+x+n+Y1Dm+lmPPsJ7qU1cXlU9ylYyfxINMtVzYPqXNESjxF4eaJiZnMqm671JQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Z/LQdQI+; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=zhang971090220@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Z/LQdQI+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=zhang971090220@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z75hf4RYrz2yVD
	for <openbmc@lists.ozlabs.org>; Wed,  5 Mar 2025 19:44:49 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2f9d3d0f55dso10535771a91.1
        for <openbmc@lists.ozlabs.org>; Wed, 05 Mar 2025 00:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741164287; x=1741769087; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nMh/1IYC1/u6DKKOw2ms/3tpOZM3Bu58eEc2wmPyXZA=;
        b=Z/LQdQI+PdrvQrKchbotf8vNkFag8yv5qJa80EQLaCKKcHUX6ISbkhmq58u3l0j+gq
         IHhZ3nAjNHAIanIpHI2H5LNObqr+5mACSGUhCO2JXwX2pxvId689QlUK9NabWU30TIib
         Gm16D4cnreir6sc8vW0YzEu0hPYIUMUXMks7BRYE0CqpNZPQvjaIOHfjtKMNWoeE8Ri3
         l9z5NO7nxzdEFjqELgkTgeU0jBD090sgbo/eaZ35JK2EfmaODg0+NttKM5s8f5MyzW2V
         FRcghQcYtytPgyab6bnzKBSETAOow8r71mpnmhWwKtiv7oSOXpN6vlJSc5QiilR//5Ir
         Ih7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741164287; x=1741769087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMh/1IYC1/u6DKKOw2ms/3tpOZM3Bu58eEc2wmPyXZA=;
        b=qxpPe6rROVpR3gcq3GAFasZl5gWSW4ZrWgKTCKQus0hVNj2xZrLv6/R6ynmaJmd5mg
         7SX/ccMWGsLvYE2ue4ad2lbdEdl3RIZQzMc+eFgrE13oUW7yTy/2bkyfs//0cRJw5JhI
         IcgVotyX1f/iqZF4/15iLRU/NUXzpiY4noqLg7Dd6H1/dDxGmxAizH7EoF6l9iJp7FvL
         S0H36Pkt3SEQl6V4Xi3b5x2NWjkQ91gW8MarEoxb5uupIjNmIZw1MJnRaJdtWBO/E+HD
         wWlQRAgtKZLtlGZUBNpCdwHTi6PdNBniZKb+3t6pCKEaPyf9nloqQOcn3/J40+tq+zjr
         CRtw==
X-Forwarded-Encrypted: i=1; AJvYcCXA88LnoZ1WVQ/b7HwqLxfN6rLK9zNTN36pqFvAhSmkKlrlfSfFa5ooIwH6092bMgOj9YSkgThm@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywkfvlv8OdUzm5jOTjO7HcWOAyA7WME93tNG00pK45Sp9d7y/2T
	AhIfPkBQ7GUB2klgnfJYoM3l/tccNswH23gQPZ7M2J6SVMJvaTxe
X-Gm-Gg: ASbGncujOka3dTXVHTvSbh34aAEHP0ReudAFA5JLm1lokY5OejgMY0c6lUyxM70rBRZ
	vY9mFXbua5sd3Xn1fxADQP8cuVpIZpR074kKoRosv27ZfjFPPHVqNiopU6F25E27oLtcJaOaI4S
	2Oox7iRdKUSPjaIv7QR0PtufcPA+b3tgC5dJYOTIv5+/gtOgUGYWmuxGtdfd3zq7jrYAsRBHz13
	teXqBMsRH3jubIjPkMOfFqPkmQBuNY5rY4zacwtJGpcIhEXJbZXB+WFJGn53CVWJ2bwPYT9OiI1
	BS71E2RBBlDoGCT6XSYIPAC6myNTCwmQ89+mORawGCq01f+v6a+gXgJ4QqFNdCb5efTTuYar1Rq
	6HGxcHeiMBPnlW50B
X-Google-Smtp-Source: AGHT+IE1y9oYg9eOq2NejaOXd+474ozq3ci5ZYOukGHKwvLj+l8H31AsVZndFe30B0ZQzkAYYdQImw==
X-Received: by 2002:a17:90b:5110:b0:2ea:3f34:f18f with SMTP id 98e67ed59e1d1-2ff551531ddmr483870a91.19.1741164287369;
        Wed, 05 Mar 2025 00:44:47 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e7ffe18sm789169a91.31.2025.03.05.00.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 00:44:46 -0800 (PST)
From: Michael Chang <zhang971090220@gmail.com>
To: kwliu@nuvoton.com,
	kflin@nuvoton.com,
	mchehab@kernel.org,
	zhang971090220@gmail.com
Subject: [PATCH] media: nuvoton: npcm-video: Fix stuck due to no video signal error
Date: Wed,  5 Mar 2025 16:44:18 +0800
Message-Id: <20250305084418.1301030-1-zhang971090220@gmail.com>
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

Fix the issue when start_frame and detect_resolution
functions are executed at the same time, which may cause driver
stops capturing due to status of no video signal error.

Signed-off-by: Michael Chang <zhang971090220@gmail.com>
---
 drivers/media/platform/nuvoton/npcm-video.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 024cd8ee1709..234fdec04f74 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -863,7 +863,6 @@ static void npcm_video_detect_resolution(struct npcm_video *video)
 	struct regmap *gfxi = video->gfx_regmap;
 	unsigned int dispst;
 
-	video->v4l2_input_status = V4L2_IN_ST_NO_SIGNAL;
 	det->width = npcm_video_hres(video);
 	det->height = npcm_video_vres(video);
 
@@ -892,12 +891,16 @@ static void npcm_video_detect_resolution(struct npcm_video *video)
 		clear_bit(VIDEO_RES_CHANGING, &video->flags);
 	}
 
-	if (det->width && det->height)
+	if (det->width && det->height) {
 		video->v4l2_input_status = 0;
-
-	dev_dbg(video->dev, "Got resolution[%dx%d] -> [%dx%d], status %d\n",
-		act->width, act->height, det->width, det->height,
-		video->v4l2_input_status);
+		dev_dbg(video->dev, "Got resolution[%dx%d] -> [%dx%d], status %d\n",
+			act->width, act->height, det->width, det->height,
+			video->v4l2_input_status);
+	} else {
+		video->v4l2_input_status = V4L2_IN_ST_NO_SIGNAL;
+		dev_err(video->dev, "Got invalid resolution[%dx%d]\n", det->width,
+			det->height);
+	}
 }
 
 static int npcm_video_set_resolution(struct npcm_video *video,
-- 
2.34.1

