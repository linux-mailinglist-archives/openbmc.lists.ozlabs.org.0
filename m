Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 239C7443CD3
	for <lists+openbmc@lfdr.de>; Wed,  3 Nov 2021 06:43:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkbKl0G5dz2yV7
	for <lists+openbmc@lfdr.de>; Wed,  3 Nov 2021 16:43:39 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkbKR1FXDz2xCs;
 Wed,  3 Nov 2021 16:43:21 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1A35Jl9W075146;
 Wed, 3 Nov 2021 13:19:47 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 3 Nov 2021 13:42:38 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
 <andrew@aj.id.au>, <linux-media@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: aspeed: use reset to replace clk off/on
Date: Wed, 3 Nov 2021 13:43:16 +0800
Message-ID: <20211103054316.25272-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1A35Jl9W075146
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

reset should be more proper than clk off/on to bring HW back to good
state.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 drivers/media/platform/aspeed-video.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index fea5e4d0927e..10d182139809 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -23,6 +23,7 @@
 #include <linux/workqueue.h>
 #include <linux/debugfs.h>
 #include <linux/ktime.h>
+#include <linux/reset.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-dev.h>
 #include <media/v4l2-device.h>
@@ -220,6 +221,7 @@ struct aspeed_video {
 	void __iomem *base;
 	struct clk *eclk;
 	struct clk *vclk;
+	struct reset_control *reset;
 
 	struct device *dev;
 	struct v4l2_ctrl_handler ctrl_handler;
@@ -554,6 +556,13 @@ static void aspeed_video_on(struct aspeed_video *video)
 	set_bit(VIDEO_CLOCKS_ON, &video->flags);
 }
 
+static void aspeed_video_reset(struct aspeed_video *v)
+{
+	reset_control_assert(v->reset);
+	udelay(100);
+	reset_control_deassert(v->reset);
+}
+
 static void aspeed_video_bufs_done(struct aspeed_video *video,
 				   enum vb2_buffer_state state)
 {
@@ -574,7 +583,9 @@ static void aspeed_video_irq_res_change(struct aspeed_video *video, ulong delay)
 	set_bit(VIDEO_RES_CHANGE, &video->flags);
 	clear_bit(VIDEO_FRAME_INPRG, &video->flags);
 
-	aspeed_video_off(video);
+	aspeed_video_write(video, VE_INTERRUPT_CTRL, 0);
+	aspeed_video_write(video, VE_INTERRUPT_STATUS, 0xffffffff);
+	aspeed_video_reset(video);
 	aspeed_video_bufs_done(video, VB2_BUF_STATE_ERROR);
 
 	schedule_delayed_work(&video->res_work, delay);
@@ -1507,8 +1518,7 @@ static void aspeed_video_stop_streaming(struct vb2_queue *q)
 		 * Need to force stop any DMA and try and get HW into a good
 		 * state for future calls to start streaming again.
 		 */
-		aspeed_video_off(video);
-		aspeed_video_on(video);
+		aspeed_video_reset(video);
 
 		aspeed_video_init_regs(video);
 
@@ -1715,6 +1725,12 @@ static int aspeed_video_init(struct aspeed_video *video)
 		return rc;
 	}
 
+	video->reset = devm_reset_control_get(dev, NULL);
+	if (IS_ERR(video->reset)) {
+		dev_err(dev, "Unable to get reset\n");
+		return PTR_ERR(video->reset);
+	}
+
 	video->eclk = devm_clk_get(dev, "eclk");
 	if (IS_ERR(video->eclk)) {
 		dev_err(dev, "Unable to get ECLK\n");
-- 
2.25.1

