Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A15A447CE26
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 09:24:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJmZY3P0kz2yg3
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 19:24:21 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJmX82C3Lz3054;
 Wed, 22 Dec 2021 19:22:15 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1BM8GB1I076083;
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
Subject: [PATCH v2 4/4] media: aspeed: Fix timing polarity incorrect
Date: Wed, 22 Dec 2021 16:21:39 +0800
Message-ID: <20211222082139.26933-5-jammy_huang@aspeedtech.com>
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
X-MAIL: twspam01.aspeedtech.com 1BM8GB1I076083
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

This is a workaround for sync polarity unstable.
Sync value get by VR09C counts from sync's rising edge, which means
sync's polarity is negative if sync value is bigger than total/2.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 v2:
  - Use 'total/2' rather than 'total<<1'
  - Update comment
---
 drivers/media/platform/aspeed-video.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 7c50567f5ab0..c3e3343d91e1 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -989,6 +989,16 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
 
 		video->frame_bottom = FIELD_GET(VE_SRC_TB_EDGE_DET_BOT, src_tb_edge);
 		video->frame_top = FIELD_GET(VE_SRC_TB_EDGE_DET_TOP, src_tb_edge);
+
+		/*
+		 * This is a workaround for polarity detection when the sync
+		 * value is larger than half.
+		 */
+		if (vsync > (vtotal / 2))
+			det->polarities &= ~V4L2_DV_VSYNC_POS_POL;
+		else
+			det->polarities |= V4L2_DV_VSYNC_POS_POL;
+
 		if (det->polarities & V4L2_DV_VSYNC_POS_POL) {
 			det->vbackporch = video->frame_top - vsync;
 			det->vfrontporch = vtotal - video->frame_bottom;
@@ -1003,6 +1013,16 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
 
 		video->frame_right = FIELD_GET(VE_SRC_LR_EDGE_DET_RT, src_lr_edge);
 		video->frame_left = FIELD_GET(VE_SRC_LR_EDGE_DET_LEFT, src_lr_edge);
+
+		/*
+		 * This is a workaround for polarity detection when the sync
+		 * value is larger than half.
+		 */
+		if (hsync > (htotal / 2))
+			det->polarities &= ~V4L2_DV_HSYNC_POS_POL;
+		else
+			det->polarities |= V4L2_DV_HSYNC_POS_POL;
+
 		if (det->polarities & V4L2_DV_HSYNC_POS_POL) {
 			det->hbackporch = video->frame_left - hsync;
 			det->hfrontporch = htotal - video->frame_right;
-- 
2.25.1

