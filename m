Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCDF42D14A
	for <lists+openbmc@lfdr.de>; Thu, 14 Oct 2021 05:52:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVFpC63ZZz3bj4
	for <lists+openbmc@lfdr.de>; Thu, 14 Oct 2021 14:52:03 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVFmC63vgz3bfv;
 Thu, 14 Oct 2021 14:50:19 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 19E3QcPi006363;
 Thu, 14 Oct 2021 11:26:38 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 14 Oct 2021 11:48:16 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
 <andrew@aj.id.au>, <linux-media@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 5/6] media: aspeed: add comments and macro
Date: Thu, 14 Oct 2021 11:48:18 +0800
Message-ID: <20211014034819.2283-6-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211014034819.2283-1-jammy_huang@aspeedtech.com>
References: <20211014034819.2283-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 19E3QcPi006363
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

Add comments to describe video-stat and 'struct aspeed_video'.
Add macro, ASPEED_VIDEO_V4L2_MIN_BUF_REQ, to describe the buffers
needed.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 drivers/media/platform/aspeed-video.c | 39 ++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 6b887fcaab7c..e1031fd09ac6 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -37,6 +37,8 @@
 #define V4L2_CID_ASPEED_HQ_MODE			(ASPEED_CID_CUSTOM_BASE  + 3)
 #define V4L2_CID_ASPEED_HQ_JPEG_QUALITY		(ASPEED_CID_CUSTOM_BASE  + 4)
 
+#define ASPEED_VIDEO_V4L2_MIN_BUF_REQ 3
+
 #define LOG_REG		BIT(4)
 #define LOG_DEBUG	BIT(3)
 #define LOG_TRACE	BIT(2)
@@ -213,6 +215,15 @@
 #define VE_MEM_RESTRICT_START		0x310
 #define VE_MEM_RESTRICT_END		0x314
 
+/*
+ * @VIDEO_MODE_DETECT_DONE:	a flag raised if signal lock
+ * @VIDEO_RES_CHANGE:		a flag raised if res_change work on-going
+ * @VIDEO_RES_DETECT:		a flag raised if res. detection on-going
+ * @VIDEO_STREAMING:		a flag raised if user requires stream-on
+ * @VIDEO_FRAME_INPRG:		a flag raised if hw working on a frame
+ * @VIDEO_STOPPED:		a flag raised if device release
+ * @VIDEO_CLOCKS_ON:		a flag raised if clk is on
+ */
 enum {
 	VIDEO_MODE_DETECT_DONE,
 	VIDEO_RES_CHANGE,
@@ -245,6 +256,28 @@ struct aspeed_video_perf {
 #define to_aspeed_video_buffer(x) \
 	container_of((x), struct aspeed_video_buffer, vb)
 
+/**
+ * struct aspeed_video - driver data
+ *
+ * @flags:		holds the state of video
+ * @sequence:		holds the last number of frame completed
+ * @max_compressed_size:holds max compressed stream's size
+ * @srcs:		holds the buffer information for srcs
+ * @jpeg:		holds the buffer information for jpeg header
+ * @bcd:		holds the buffer information for bcd work
+ * @yuv420:		a flag raised if JPEG subsampling is 420
+ * @partial_jpeg:	a flag raised if JPEG supports partial capture
+ * @hq_mode:		a flag raised if HQ is enabled. Only for partial_jpeg
+ * @frame_rate:		holds the frame_rate
+ * @jpeg_quality:	holds jpeq's quality (0~11)
+ * @jpeg_hq_quality:	holds hq's quality (0~11) only if hq_mode enabled
+ * @compression_mode:	holds jpeg compression mode
+ * @frame_bottom:	end position of video data in vertical direction
+ * @frame_left:		start position of video data in horizontal direction
+ * @frame_right:	end position of video data in horizontal direction
+ * @frame_top:		start position of video data in vertical direction
+ * @perf:		holds the statistics primary for debugfs
+ */
 struct aspeed_video {
 	void __iomem *base;
 	struct clk *eclk;
@@ -1250,7 +1283,7 @@ static int aspeed_video_get_parm(struct file *file, void *fh,
 	struct aspeed_video *video = video_drvdata(file);
 
 	a->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
-	a->parm.capture.readbuffers = 3;
+	a->parm.capture.readbuffers = ASPEED_VIDEO_V4L2_MIN_BUF_REQ;
 	a->parm.capture.timeperframe.numerator = 1;
 	if (!video->frame_rate)
 		a->parm.capture.timeperframe.denominator = MAX_FRAME_RATE;
@@ -1267,7 +1300,7 @@ static int aspeed_video_set_parm(struct file *file, void *fh,
 	struct aspeed_video *video = video_drvdata(file);
 
 	a->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
-	a->parm.capture.readbuffers = 3;
+	a->parm.capture.readbuffers = ASPEED_VIDEO_V4L2_MIN_BUF_REQ;
 
 	if (a->parm.capture.timeperframe.numerator)
 		frame_rate = a->parm.capture.timeperframe.denominator /
@@ -1876,7 +1909,7 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
 	vbq->drv_priv = video;
 	vbq->buf_struct_size = sizeof(struct aspeed_video_buffer);
 	vbq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	vbq->min_buffers_needed = 3;
+	vbq->min_buffers_needed = ASPEED_VIDEO_V4L2_MIN_BUF_REQ;
 
 	rc = vb2_queue_init(vbq);
 	if (rc) {
-- 
2.25.1

