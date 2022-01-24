Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21302497C15
	for <lists+openbmc@lfdr.de>; Mon, 24 Jan 2022 10:36:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jj4by0Gzgz3cQb
	for <lists+openbmc@lfdr.de>; Mon, 24 Jan 2022 20:35:58 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jj4ZJ25vjz30Nc;
 Mon, 24 Jan 2022 20:34:32 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 20O9QVlT054148;
 Mon, 24 Jan 2022 17:26:31 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 24 Jan 2022 17:33:48 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
 <andrew@aj.id.au>, <linux-media@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 4/4] media: aspeed: Fix timing polarity incorrect
Date: Mon, 24 Jan 2022 17:33:45 +0800
Message-ID: <20220124093345.3935-5-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124093345.3935-1-jammy_huang@aspeedtech.com>
References: <20220124093345.3935-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 20O9QVlT054148
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

This is a workaround for polarity detection unstable.
Because h/v sync polarity got from VR098 could be wrong, we try to use
ast SoC's characteristic to confirm sync polarity.

In ast SoC's design, sync value got by VR09C counts from sync's rising
edge, which means sync value = bp + active + fp if negative polarity.
Thus, sync value would be larger than de if negative.

Ex. 1920x1200@60
  VR098: c4d3efff, VR09C: 04cc001f
  v-total = 0x4D3 (VR098[27:16]) = 1235
  v-sync  = 0x4CC (VR09C[27:16]) = 1228

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 v3:
  - Use active rather than 'total/2' as critera for workaround
 v2:
  - Use 'total/2' rather than 'total<<1'
  - Update comment
---
 drivers/media/platform/aspeed-video.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 7e988cd05161..a135a31b4234 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -985,6 +985,20 @@ static void aspeed_video_get_timings(struct aspeed_video *v,
 	vsync = FIELD_GET(VE_SYNC_STATUS_VSYNC, sync);
 	hsync = FIELD_GET(VE_SYNC_STATUS_HSYNC, sync);
 
+	/*
+	 * This is a workaround for polarity detection.
+	 * Because ast-soc counts sync from sync's rising edge, the reg value
+	 * of sync would be larger than video's active area if negative.
+	 */
+	if (vsync > det->height)
+		det->polarities &= ~V4L2_DV_VSYNC_POS_POL;
+	else
+		det->polarities |= V4L2_DV_VSYNC_POS_POL;
+	if (hsync > det->width)
+		det->polarities &= ~V4L2_DV_HSYNC_POS_POL;
+	else
+		det->polarities |= V4L2_DV_HSYNC_POS_POL;
+
 	if (det->polarities & V4L2_DV_VSYNC_POS_POL) {
 		det->vbackporch = v->frame_top - vsync;
 		det->vfrontporch = vtotal - v->frame_bottom;
-- 
2.25.1

