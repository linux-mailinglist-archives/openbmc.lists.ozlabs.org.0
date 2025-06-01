Return-Path: <openbmc+bounces-110-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EED4DACA1C2
	for <lists+openbmc@lfdr.de>; Mon,  2 Jun 2025 01:30:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b9YB93H3bz2yFJ;
	Mon,  2 Jun 2025 09:30:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748820641;
	cv=none; b=K9K5EQWkvozrIDuGtEWfKDlwvmhAR3Tr/bD20FkInZ6PIbRG6klx3xQtNSa1wdjKmaY4JG+KzM/ka/pWRVcn5KiO2DKMYCf/cA7VAUjjZT1KFO90f7LLH2AZrQySxveoD5CNMmPZDjokilgwp8VSY9lSBxK8lxqtjRZ6BB4Shazvg5wrA03H4bDPwd99pRqNFbOFbnZsesrVx/7hy7URfSiYZUJYDp6uKLspkxwCFaxh6Wg/NWW6VtLapbM+d5dGuohD5IEOVd+OPrW6ARkUOEkspZ2AngX04HwNWMgFupabNDXE9h8FnEQWaEe2ppUJKg6QdgaWywHkLkeG+9rptQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748820641; c=relaxed/relaxed;
	bh=qJP7hoEJC+TGTUJulrWqH+7wnbLVWth6RXrAMsJ8tkA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AubmLyyaVgK3AaICQ7co8Fh3HxrjaBkt73oRf1Df+KNgwwbcMCZmFdCrJZGVjbOsvQbrbBUol3s9JFxMe3mrwKo8DPsgej3Fow8TjznGBCeNxWMR89+Cp7XkBWLR7uXqqMZ+pt9jLN3YZdSeXbGQDXzvSKTiXt8DV/OXXCuIc7oGD5NSs5GmO3YJaaQRjdmxJCjc/d5CVr9E5Mp3Dy4j0v7yU/GhjpX9q1O6gTbsMyToKJeI7J63cpWPF0twmtOAo79n4nsKV17k77++1REr/1DDMwTjLnS8iAfEaO02v3LSis6l3IQV02Jm6+/rpceD9XLGigLg1pRJqvkdLlR45Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iV58evyu; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iV58evyu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b9YB84PGMz2xlK
	for <openbmc@lists.ozlabs.org>; Mon,  2 Jun 2025 09:30:40 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 18FBFA4F9E0;
	Sun,  1 Jun 2025 23:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CE35C4CEF3;
	Sun,  1 Jun 2025 23:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748820637;
	bh=DIIbz0lEb7dnY47PJIaYKLyq8zk6dH2bQFA62F8ojNo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iV58evyuh2UCQg3VEZpFMKA2HSwMkgxK1UNPHz1Iiz+8i3d6rotKkjRZsH8UnIPWa
	 3hcvj9zeXyDwj8i1yzgArDyQOt6McGLAd602nR0iX8XLgauIR7TPfKJgbVcTxKJ/SO
	 xo0Bgdko5vktzAIMvK+cM+8vnFi//Dbz3UZRbMpp4OtP5aJ7t+o1aUzh051NAKUDId
	 lKg/+KKZO9rH5AzFrfWroKm7MPcF3jLBR6qUyoW2ktug0AZ7HQlG4nkdVEX8bHNdee
	 BElbUS00ZjyNV1HCjGdk0OT+PAHa1Ant527qMGgAVey8AeNgmZvC484M1Xr/HVlbEd
	 ocknDmSO1uq+Q==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Michael Chang <zhang971090220@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	kwliu@nuvoton.com,
	kflin@nuvoton.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 022/102] media: nuvoton: npcm-video: Fix stuck due to no video signal error
Date: Sun,  1 Jun 2025 19:28:14 -0400
Message-Id: <20250601232937.3510379-22-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250601232937.3510379-1-sashal@kernel.org>
References: <20250601232937.3510379-1-sashal@kernel.org>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.9
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Michael Chang <zhang971090220@gmail.com>

[ Upstream commit 497f1fb94759fa0c638f15c12b1ab3e586bccfcb ]

Fix the issue when start_frame and detect_resolution
functions are executed at the same time, which may cause driver
stops capturing due to status of no video signal error.

Signed-off-by: Michael Chang <zhang971090220@gmail.com>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Now let me analyze this commit based on the provided information:
**YES** This commit should be backported to stable kernel trees based on
the following analysis: 1. **Bug Fix Nature**: The commit specifically
addresses a driver stuck issue caused by a race condition between the
`start_frame` and `detect_resolution` functions. This is a clear bugfix
that affects the operational functionality of the driver. 2. **User
Impact**: When this race condition occurs, the driver stops capturing
completely due to a "no video signal error" - this directly impacts
users who rely on the video capture functionality. 3. **Minimal and
Contained Changes**: The fix makes only a small, targeted change to the
`npcm_video_detect_resolution()` function in
`drivers/media/platform/nuvoton/npcm-video.c`. Specifically: - Removes
the premature setting of `video->v4l2_input_status =
V4L2_IN_ST_NO_SIGNAL` at the beginning - Only sets this status flag when
the resolution is actually invalid (width/height are 0) - Adds proper
debugging messages for both valid and invalid resolution cases 4. **Low
Risk**: The change is logical and safe - instead of immediately assuming
"no signal" and then potentially overriding it later, the code now only
sets the "no signal" status when there's actually an invalid resolution
detected. This eliminates the race condition without introducing new
complexity. 5. **Similar Pattern to Backported Commits**: Looking at the
reference commits, this follows the same pattern as "Similar Commit #1"
(marked YES) which also fixed reference handling issues in the same
driver. Both commits: - Fix driver-specific bugs - Make small, contained
changes - Address operational issues that affect users - Don't introduce
new features or architectural changes 6. **Race Condition Fix**: Race
condition fixes are typically good candidates for stable backporting as
they address timing-dependent bugs that can be difficult to diagnose and
significantly impact system reliability. The fix addresses a specific
functional bug where the driver could get stuck due to improper status
flag handling during concurrent operations, making it an appropriate
candidate for stable tree inclusion.

 drivers/media/platform/nuvoton/npcm-video.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 7a9d8928ae401..3022fdcf66ec7 100644
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
2.39.5


