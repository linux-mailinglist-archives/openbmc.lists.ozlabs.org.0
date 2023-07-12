Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7965750310
	for <lists+openbmc@lfdr.de>; Wed, 12 Jul 2023 11:28:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1C8p13knz3c5S
	for <lists+openbmc@lfdr.de>; Wed, 12 Jul 2023 19:28:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.226; helo=mail.aspeedtech.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 87 seconds by postgrey-1.37 at boromir; Wed, 12 Jul 2023 19:28:04 AEST
Received: from mail.aspeedtech.com (211-20-114-226.hinet-ip.hinet.net [211.20.114.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1C8N6nwJz3bYR;
	Wed, 12 Jul 2023 19:28:04 +1000 (AEST)
Received: from JammyHuang-PC.aspeed.com (192.168.2.181) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 12 Jul
 2023 17:26:09 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
	<andrew@aj.id.au>, <linux-media@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] media: aspeed: Fix memory overwrite if timing is 1600x900
Date: Wed, 12 Jul 2023 17:26:06 +0800
Message-ID: <20230712092606.2508-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.181]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

When capturing 1600x900, system could crash when system memory usage is
tight.

The size of macro block captured is 8x8. Therefore, we should make sure
the height of src-buf is 8 aligned to fix this issue.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
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

