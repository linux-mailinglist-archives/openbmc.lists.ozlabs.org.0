Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A56B46B057
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 02:56:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7NhT3mxVz3054
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 12:56:57 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7NhC1H8dz2xY4;
 Tue,  7 Dec 2021 12:56:42 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1B71V0US059545;
 Tue, 7 Dec 2021 09:31:00 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 7 Dec 2021 09:55:54 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
 <andrew@aj.id.au>, <linux-media@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: aspeed: Use runtime configuration
Date: Tue, 7 Dec 2021 09:55:44 +0800
Message-ID: <20211207015544.1755-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1B71V0US059545
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

The aspeed video IP has some differences between SoC families. Currently
the driver decides which registers to use at compile time, which means
a single kernel can not be used between platforms.

Switch to using runtime configuration of the registers that vary between
SoC families.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 drivers/media/platform/aspeed-video.c | 71 ++++++++++++++++++++-------
 1 file changed, 52 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index d2335d669fb3..ba8ee82b38c3 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -75,11 +75,8 @@
 #define  VE_SEQ_CTRL_CAP_BUSY		BIT(16)
 #define  VE_SEQ_CTRL_COMP_BUSY		BIT(18)
 
-#ifdef CONFIG_MACH_ASPEED_G4
-#define  VE_SEQ_CTRL_JPEG_MODE		BIT(8)	/* AST2400 */
-#else
-#define  VE_SEQ_CTRL_JPEG_MODE		BIT(13)	/* AST2500/2600 */
-#endif
+#define AST2500_VE_SEQ_CTRL_JPEG_MODE	BIT(13)
+#define AST2400_VE_SEQ_CTRL_JPEG_MODE	BIT(8)
 
 #define VE_CTRL				0x008
 #define  VE_CTRL_HSYNC_POL		BIT(0)
@@ -136,9 +133,8 @@
 #define  VE_COMP_CTRL_HQ_DCT_CHR	GENMASK(26, 22)
 #define  VE_COMP_CTRL_HQ_DCT_LUM	GENMASK(31, 27)
 
-#define VE_OFFSET_COMP_STREAM		0x078
-
-#define VE_JPEG_COMP_SIZE_READ_BACK	0x084
+#define AST2400_VE_COMP_SIZE_READ_BACK	0x078
+#define AST2600_VE_COMP_SIZE_READ_BACK	0x084
 
 #define VE_SRC_LR_EDGE_DET		0x090
 #define  VE_SRC_LR_EDGE_DET_LEFT	GENMASK(11, 0)
@@ -233,6 +229,8 @@ struct aspeed_video {
 	struct video_device vdev;
 	struct mutex video_lock;	/* v4l2 and videobuf2 lock */
 
+	struct aspeed_video_config config;
+
 	wait_queue_head_t wait;
 	spinlock_t lock;		/* buffer list lock */
 	struct delayed_work res_work;
@@ -258,6 +256,30 @@ struct aspeed_video {
 
 #define to_aspeed_video(x) container_of((x), struct aspeed_video, v4l2_dev)
 
+struct aspeed_video_config {
+	u32 version;
+	u32 jpeg_mode;
+	u32 comp_size_read;
+};
+
+static const struct aspeed_video_config ast2400_config = {
+	.version = 4,
+	.jpeg_mode = AST2400_VE_SEQ_CTRL_JPEG_MODE,
+	.comp_size_read = AST2400_VE_COMP_SIZE_READ_BACK,
+};
+
+static const struct aspeed_video_config ast2500_config = {
+	.version = 5,
+	.jpeg_mode = AST2500_VE_SEQ_CTRL_JPEG_MODE,
+	.comp_size_read = AST2400_VE_COMP_SIZE_READ_BACK,
+};
+
+static const struct aspeed_video_config ast2600_config = {
+	.version = 6,
+	.jpeg_mode = AST2500_VE_SEQ_CTRL_JPEG_MODE,
+	.comp_size_read = AST2600_VE_COMP_SIZE_READ_BACK,
+};
+
 static const u32 aspeed_video_jpeg_header[ASPEED_VIDEO_JPEG_HEADER_SIZE] = {
 	0xe0ffd8ff, 0x464a1000, 0x01004649, 0x60000101, 0x00006000, 0x0f00feff,
 	0x00002d05, 0x00000000, 0x00000000, 0x00dbff00
@@ -640,7 +662,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 	if (sts & VE_INTERRUPT_COMP_COMPLETE) {
 		struct aspeed_video_buffer *buf;
 		u32 frame_size = aspeed_video_read(video,
-						   VE_JPEG_COMP_SIZE_READ_BACK);
+						   video->config.comp_size_read);
 
 		update_perf(&video->perf);
 
@@ -973,7 +995,7 @@ static void aspeed_video_update_regs(struct aspeed_video *video)
 		FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality) |
 		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10);
 	u32 ctrl = 0;
-	u32 seq_ctrl = VE_SEQ_CTRL_JPEG_MODE;
+	u32 seq_ctrl = video->config.jpeg_mode;
 
 	v4l2_dbg(1, debug, &video->v4l2_dev, "framerate(%d)\n",
 		 video->frame_rate);
@@ -993,7 +1015,7 @@ static void aspeed_video_update_regs(struct aspeed_video *video)
 
 	/* Set control registers */
 	aspeed_video_update(video, VE_SEQ_CTRL,
-			    VE_SEQ_CTRL_JPEG_MODE | VE_SEQ_CTRL_YUV420,
+			    video->config.jpeg_mode | VE_SEQ_CTRL_YUV420,
 			    seq_ctrl);
 	aspeed_video_update(video, VE_CTRL, VE_CTRL_FRC, ctrl);
 	aspeed_video_update(video, VE_COMP_CTRL,
@@ -1790,8 +1812,18 @@ static int aspeed_video_init(struct aspeed_video *video)
 	return rc;
 }
 
+static const struct of_device_id aspeed_video_of_match[] = {
+	{ .compatible = "aspeed,ast2400-video-engine", .data = &ast2400_config },
+	{ .compatible = "aspeed,ast2500-video-engine", .data = &ast2500_config },
+	{ .compatible = "aspeed,ast2600-video-engine", .data = &ast2600_config },
+	{}
+};
+MODULE_DEVICE_TABLE(of, aspeed_video_of_match);
+
 static int aspeed_video_probe(struct platform_device *pdev)
 {
+	const struct aspeed_video_config *config;
+	const struct of_device_id *match;
 	int rc;
 	struct resource *res;
 	struct aspeed_video *video =
@@ -1815,6 +1847,13 @@ static int aspeed_video_probe(struct platform_device *pdev)
 	if (IS_ERR(video->base))
 		return PTR_ERR(video->base);
 
+	match = of_match_node(aspeed_video_of_match, pdev->dev.of_node);
+	if (!match)
+		return -EINVAL;
+
+	config = match->data;
+	video->config = *config;
+
 	rc = aspeed_video_init(video);
 	if (rc)
 		return rc;
@@ -1828,6 +1867,8 @@ static int aspeed_video_probe(struct platform_device *pdev)
 
 	aspeed_video_debugfs_create(video);
 
+	dev_info(video->dev, "compatible for g%d\n", config->version);
+
 	return 0;
 }
 
@@ -1860,14 +1901,6 @@ static int aspeed_video_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id aspeed_video_of_match[] = {
-	{ .compatible = "aspeed,ast2400-video-engine" },
-	{ .compatible = "aspeed,ast2500-video-engine" },
-	{ .compatible = "aspeed,ast2600-video-engine" },
-	{}
-};
-MODULE_DEVICE_TABLE(of, aspeed_video_of_match);
-
 static struct platform_driver aspeed_video_driver = {
 	.driver = {
 		.name = DEVICE_NAME,
-- 
2.25.1

