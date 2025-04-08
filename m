Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F6AA8191B
	for <lists+openbmc@lfdr.de>; Wed,  9 Apr 2025 01:04:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZXM8h0dLMz3cDV
	for <lists+openbmc@lfdr.de>; Wed,  9 Apr 2025 09:04:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744091344;
	cv=none; b=ZFQDcHRxgRU2Dga7g9ICCN1wwfW9fREYwsjmq7CM9CxViTiMxyidd0ukirwLDvbpto3W9eo1hrc6z+/eY4+Y0UC/ZUSoiCnj0eh+rNMc+q0UyKW040GOusygDFiiMuQ35io3Z3eWzLXaPwgdTtkydP7E9vGpiDSb9BpszY5qbgIPNP/SA7vl/wskjKiNBqI0bbJ+rg2SU6o3xqMhbKNpnahSRs8PvH1nRF9MWbEzRyLYdQG43D3hOw16GKImwO39owVaci3wmApCSVf4oY1fvEaO5BadUDFepG6BoTQnEEzw/BeP0+jC8qUW7YJVUMPTkiGt/GGykI4bk8gJyQsXkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744091344; c=relaxed/relaxed;
	bh=nMh/1IYC1/u6DKKOw2ms/3tpOZM3Bu58eEc2wmPyXZA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eqC+UD/Kdnzn56WwEQRDiMVNt2tLN5/4NxYCmYD5Q11hrqzYnqaXeUCj/WX93MOzU2OqdHepicyvrYi8dTq3LNyP+V8ucE8Oq1OyjW9ISvRzhNtz89hvf+sluibWTT41JRdQCYjYzLxqLQn4qd+WOGbf1YPP6hzZimQQECU5U102p9V8Keqkh61iorWhJLk7PFWyT/zBuQddtHWDyuIiXQMqwPGzliVGwjrPJBFlPR8xeIFBWsh+hAt+FBTikGBZfQ+sH7x9GJfseSbWCbVfxXQgekcnIh/HQGKfU4OBMi9WLGSQg/NIp/KR8VWKJ7EfRWQO+KmtO6iBIXwcG9hIPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZAUaPpdv; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=zhang971090220@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZAUaPpdv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=zhang971090220@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWwB55clhz2ySS
	for <openbmc@lists.ozlabs.org>; Tue,  8 Apr 2025 15:49:01 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-224341bbc1dso45039275ad.3
        for <openbmc@lists.ozlabs.org>; Mon, 07 Apr 2025 22:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744091339; x=1744696139; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nMh/1IYC1/u6DKKOw2ms/3tpOZM3Bu58eEc2wmPyXZA=;
        b=ZAUaPpdvbtocgyNTVFHlyOTaUurOAqywRCYjShyuTqMKrGLLmln6aVtAOLvp+XiScu
         /DjOr4VidlSejGNIdvhuj3X0AfDTxKzsYgqVYH+mghCC8NP2nSK24O3kKNwq6tdi6kam
         c/BlO2J37PIIGMcq62GRlTrD2S7a8D5fXZd0v9bFpELHV2Srafr0smIU8/0hBSRBnNVX
         +PK9AcCXXpB0dSnbNME/rGLwSR5mv5GyJz4HbSZX20lUuVoYxVc572MhmnhzOu+QCpyQ
         8uX2NVfjzq0SuDYLVmC2LuP10TPiTpM/3sFeQIiWyfrZvopjjc6QYhAIOoaemGXH26NG
         PkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744091339; x=1744696139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMh/1IYC1/u6DKKOw2ms/3tpOZM3Bu58eEc2wmPyXZA=;
        b=qjmqLJV+k5gj/f0d7LxT8ALG9gW5luXbqG1jtFtQ2O2BiF9hgWspzBYs4aYpIYhu/4
         quaZGfIGKH8b8PoEXbD6sYLZptmW7ukamIgDIAjzx5gPKtwkkOhDHbjR2WirdB+mk8yF
         t4Hz8Vwv+6Ys26s0bllQX6HJim6L0gAzaQCVrX8M7EPx0aqt71ZNdPWGxvsGlXr/N+hn
         jOmPmPZz8df+8Ocxqql3u0fxYO9BfqclCYGTop8QEXhiou9nvuJPhgJzbbFqAKkrB9Q+
         q1GjWqEu84aQiwVMZTkjEmQSR3aBx47c0qDS3Xr7c5uZjiN/aBSlYoXxVbw5XkH3LHEK
         LPfg==
X-Forwarded-Encrypted: i=1; AJvYcCVt1lP8asyQptXIb0KI0lgG0cD16i8NlwMXw+E3LanUKXhWLWkgDuSqhygHAzoP32dVyGUnAelC@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw7MVrPqjyojNDRwPQwCO/n3O9sz0OuPlMXp65jedlEvf62scPB
	BLh8126s/JRUcX75dxRhlBk3OsSq/T7JtnJrvXy+xn1wd3C1NK9u
X-Gm-Gg: ASbGnctO0tGeQgexzkDYfP190hDWqMBL/OVzn1Pz9/nuAHfjZR1rhasOzN2qUw9mTzx
	QyHzu5qNMwX9rVFpsBh22BMvJ5tVbz+1D6pJ3OrGcvpgqVJ6+FbkPD8U7gu6yZ/ltyscg0lGmTc
	x/fEzFTVzP3qS/QuzJQ0FFc7DU/Q4cW8W6n11GjzlBQUc+FqsCm7H0kL5jjaTj5sRYCohHyT3Gq
	PfNdt8vt0QeGKtfoeLV0LZXR1bSQ3QcmMF2uIhsXyDtxOjuKIq+tArOtYBLMfprJtNgqX8lr9US
	CZ7EKVf7ioXNCH914EW30BYjlcbGDTlfXw9HyeQs2ecLv9xcT9hbTS4VzrCCWmcgD4Jsha0Naht
	IIAs7We9ro2qwl9YJ
X-Google-Smtp-Source: AGHT+IEHFO5C7dTJpKvZbOu72CFtYS1ry7Pw+NiDt85wQoNOEA4vc4Tej0qtHWHx8Lq2UnSIkPjYpQ==
X-Received: by 2002:a17:903:2310:b0:215:bc30:c952 with SMTP id d9443c01a7336-22a955166d3mr144831445ad.6.1744091338760;
        Mon, 07 Apr 2025 22:48:58 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c27b3sm92124515ad.97.2025.04.07.22.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 22:48:58 -0700 (PDT)
From: Michael Chang <zhang971090220@gmail.com>
To: kwliu@nuvoton.com,
	kflin@nuvoton.com,
	mchehab@kernel.org,
	zhang971090220@gmail.com
Subject: [RESEND] media: nuvoton: npcm-video: Fix stuck due to no video signal error
Date: Tue,  8 Apr 2025 13:48:39 +0800
Message-Id: <20250408054839.3420989-1-zhang971090220@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailman-Approved-At: Wed, 09 Apr 2025 09:04:16 +1000
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

