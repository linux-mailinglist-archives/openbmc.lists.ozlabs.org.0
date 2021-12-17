Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C29247883D
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 10:55:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFkqy6wbjz3cWW
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 20:55:26 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFkpp4Py6z307B;
 Fri, 17 Dec 2021 20:54:26 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1BH9SGVB026175;
 Fri, 17 Dec 2021 17:28:16 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 17 Dec 2021 17:53:46 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
 <andrew@aj.id.au>, <linux-media@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/4] media: aspeed: Correct values for detected timing
Date: Fri, 17 Dec 2021 17:54:02 +0800
Message-ID: <20211217095403.2618-4-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211217095403.2618-1-jammy_huang@aspeedtech.com>
References: <20211217095403.2618-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1BH9SGVB026175
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

            +--+     +-------------------+     +--+
            |  |     |    v i d e o      |     |  |
         +--+  +-----+                   +-----+  +---+

        sync+--+
    left/top+--------+
right/bottom+----------------------------+

                  +-------------------+
                  |    v i d e o      |
      +--+  +-----+                   +-----+  +---+
         |  |                               |  |
         +--+                               +--+
        sync+-------------------------------+
    left/top+-----+
right/bottom+-------------------------+

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 drivers/media/platform/aspeed-video.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 581a4261f9b7..5ad3a20c5bac 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -988,10 +988,20 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
 						src_tb_edge);
 		video->frame_top = FIELD_GET(VE_SRC_TB_EDGE_DET_TOP,
 					     src_tb_edge);
-		det->vfrontporch = video->frame_top;
-		det->vbackporch = FIELD_GET(VE_MODE_DETECT_V_LINES, mds) -
-			video->frame_bottom;
 		det->vsync = FIELD_GET(VE_SYNC_STATUS_VSYNC, sync);
+		if (det->polarities & V4L2_DV_VSYNC_POS_POL) {
+			det->vbackporch = video->frame_top - det->vsync;
+			det->vfrontporch =
+				FIELD_GET(VE_MODE_DETECT_V_LINES, mds) -
+				video->frame_bottom;
+		} else {
+			det->vsync = FIELD_GET(VE_MODE_DETECT_V_LINES, mds) -
+					       det->vsync;
+			det->vbackporch = video->frame_top;
+			det->vfrontporch =
+				FIELD_GET(VE_MODE_DETECT_V_LINES, mds) -
+				video->frame_bottom - det->vsync;
+		}
 		if (video->frame_top > video->frame_bottom)
 			continue;
 
@@ -999,9 +1009,16 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
 					       src_lr_edge);
 		video->frame_left = FIELD_GET(VE_SRC_LR_EDGE_DET_LEFT,
 					      src_lr_edge);
-		det->hfrontporch = video->frame_left;
-		det->hbackporch = htotal - video->frame_right;
 		det->hsync = FIELD_GET(VE_SYNC_STATUS_HSYNC, sync);
+		if (det->polarities & V4L2_DV_HSYNC_POS_POL) {
+			det->hbackporch = video->frame_left - det->hsync;
+			det->hfrontporch = htotal - video->frame_right;
+		} else {
+			det->hsync = htotal - det->hsync;
+			det->hbackporch = video->frame_left;
+			det->hfrontporch = htotal - video->frame_right -
+					   det->hsync;
+		}
 		if (video->frame_left > video->frame_right)
 			continue;
 
-- 
2.25.1

