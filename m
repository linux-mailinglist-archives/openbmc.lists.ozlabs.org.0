Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E8947CE12
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 09:23:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJmYd4vNnz3cDn
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 19:23:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=jammy_huang@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJmX21b2Vz2ywd;
 Wed, 22 Dec 2021 19:22:10 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1BM8GBaG076076;
 Wed, 22 Dec 2021 16:16:11 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 22 Dec 2021 16:21:37 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
 <andrew@aj.id.au>, <linux-media@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/4] media: aspeed: Correct values for detected timing
Date: Wed, 22 Dec 2021 16:21:38 +0800
Message-ID: <20211222082139.26933-4-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211222082139.26933-1-jammy_huang@aspeedtech.com>
References: <20211222082139.26933-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1BM8GBaG076076
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

Correct timing's fp/sync/bp value based on the information below.
It should be noticed that the calculation formula should be changed
per sync polarity.

The sequence of signal: sync - backporch - video data - frontporch

The following registers start counting from sync's rising edge:
1. VR090: frame edge's left and right
2. VR094: frame edge's top and bottom
3. VR09C: counting from sync's rising edge to falling edge

[Vertical timing]
            +--+     +-------------------+     +--+
            |  |     |    v i d e o      |     |  |
         +--+  +-----+                   +-----+  +---+

       vsync+--+
   frame_top+--------+
frame_bottom+----------------------------+

                  +-------------------+
                  |    v i d e o      |
      +--+  +-----+                   +-----+  +---+
         |  |                               |  |
         +--+                               +--+
       vsync+-------------------------------+
   frame_top+-----+
frame_bottom+-------------------------+

[Horizontal timing]
            +--+     +-------------------+     +--+
            |  |     |    v i d e o      |     |  |
         +--+  +-----+                   +-----+  +---+

       hsync+--+
  frame_left+--------+
 frame_right+----------------------------+

                  +-------------------+
                  |    v i d e o      |
      +--+  +-----+                   +-----+  +---+
         |  |                               |  |
         +--+                               +--+
       hsync+-------------------------------+
  frame_left+-----+
 frame_right+-------------------------+

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 v2:
  - Code refined per Joel's suggestion
  - Update commit message to have name matching variable
---
 drivers/media/platform/aspeed-video.c | 30 ++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index c241038ee27c..7c50567f5ab0 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -936,7 +936,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
 	u32 src_lr_edge;
 	u32 src_tb_edge;
 	u32 sync;
-	u32 htotal;
+	u32 htotal, vtotal, vsync, hsync;
 	struct v4l2_bt_timings *det = &video->detected_timings;
 
 	det->width = MIN_WIDTH;
@@ -983,21 +983,35 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
 		mds = aspeed_video_read(video, VE_MODE_DETECT_STATUS);
 		sync = aspeed_video_read(video, VE_SYNC_STATUS);
 		htotal = aspeed_video_read(video, VE_H_TOTAL_PIXELS);
+		vtotal = FIELD_GET(VE_MODE_DETECT_V_LINES, mds);
+		vsync = FIELD_GET(VE_SYNC_STATUS_VSYNC, sync);
+		hsync = FIELD_GET(VE_SYNC_STATUS_HSYNC, sync);
 
 		video->frame_bottom = FIELD_GET(VE_SRC_TB_EDGE_DET_BOT, src_tb_edge);
 		video->frame_top = FIELD_GET(VE_SRC_TB_EDGE_DET_TOP, src_tb_edge);
-		det->vfrontporch = video->frame_top;
-		det->vbackporch = FIELD_GET(VE_MODE_DETECT_V_LINES, mds) -
-			video->frame_bottom;
-		det->vsync = FIELD_GET(VE_SYNC_STATUS_VSYNC, sync);
+		if (det->polarities & V4L2_DV_VSYNC_POS_POL) {
+			det->vbackporch = video->frame_top - vsync;
+			det->vfrontporch = vtotal - video->frame_bottom;
+			det->vsync = vsync;
+		} else {
+			det->vbackporch = video->frame_top;
+			det->vfrontporch = vsync - video->frame_bottom;
+			det->vsync = vtotal - vsync;
+		}
 		if (video->frame_top > video->frame_bottom)
 			continue;
 
 		video->frame_right = FIELD_GET(VE_SRC_LR_EDGE_DET_RT, src_lr_edge);
 		video->frame_left = FIELD_GET(VE_SRC_LR_EDGE_DET_LEFT, src_lr_edge);
-		det->hfrontporch = video->frame_left;
-		det->hbackporch = htotal - video->frame_right;
-		det->hsync = FIELD_GET(VE_SYNC_STATUS_HSYNC, sync);
+		if (det->polarities & V4L2_DV_HSYNC_POS_POL) {
+			det->hbackporch = video->frame_left - hsync;
+			det->hfrontporch = htotal - video->frame_right;
+			det->hsync = hsync;
+		} else {
+			det->hbackporch = video->frame_left;
+			det->hfrontporch = hsync - video->frame_right;
+			det->hsync = htotal - hsync;
+		}
 		if (video->frame_left > video->frame_right)
 			continue;
 
-- 
2.25.1

