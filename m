Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D1847A378
	for <lists+openbmc@lfdr.de>; Mon, 20 Dec 2021 03:04:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHNFd1qnGz3c9G
	for <lists+openbmc@lfdr.de>; Mon, 20 Dec 2021 13:04:53 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHNCY3V2Fz3bVC;
 Mon, 20 Dec 2021 13:03:05 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1BK1uUmH075902;
 Mon, 20 Dec 2021 09:56:30 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 20 Dec 2021 10:01:47 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <hverkuil-cisco@xs4all.nl>, <sakari.ailus@linux.intel.com>,
 <gregkh@linuxfoundation.org>, <eajames@linux.ibm.com>,
 <mchehab@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <linux-media@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 3/4] media: aspeed: Support aspeed mode to reduce
 compressed data
Date: Mon, 20 Dec 2021 10:01:42 +0800
Message-ID: <20211220020143.1216-4-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220020143.1216-1-jammy_huang@aspeedtech.com>
References: <20211220020143.1216-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1BK1uUmH075902
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

aspeed supports differential jpeg format which only compress the parts
which are changed. In this way, it reduces both the amount of data to be
transferred by network and those to be decoded on the client side.

3 new ctrls are added:
* Aspeed Compression Scheme: to control aspeed's compression scheme
  0: DCT Only, 1: DCT VQ mix 2-color, 2: DCT VQ mix 4-color
  This is AST2400 only. It will adapt JPEG or VQ encoding method according
  to the context automatically.
* Aspeed HQ Mode: to control aspeed's high quality(2-pass) compression mode
  This only works with yuv444 subsampling.
* Aspeed HQ Quality: to control the quality of aspeed's HQ mode
  only useful if Aspeed HQ mode is enabled

Aspeed JPEG Format requires an additional buffer, called bcd, to store
the information about which macro block in the new frame is different
from the previous one.

To have bcd correctly working, we need to swap the buffers for src0/1 to
make src1 refer to previous frame and src0 to the coming new frame.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
v7:
  - rename compression_mode as compression_scheme
  - add reset bcd buffer every 8 frames to generate an I frame
  - update commit message
v6:
  - no update
v5:
  - use runtime configuration to handle differences between soc
  - add aspeed_video_swap_src_buf().
v4
  - add include/uapi/linux/aspeed-video.h for V4L2_CID_ASPEED_XXX
  - add aspeed_video_set_format
  - remove aspeed_ctrl_format
  - add variable, format, to replace partial_jpeg
  - modify aspeed_ctrl_HQ_jpeg_quality's range
  - reduce bcd buffer size
  - update commit message
v3:
  - 'compression mode' only available for G4
v2:
  - update commit message
  - use v4l2_xxx log rather than self-defined macro
---
 drivers/media/platform/aspeed-video.c | 252 ++++++++++++++++++++++++--
 include/uapi/linux/aspeed-video.h     |  15 ++
 2 files changed, 248 insertions(+), 19 deletions(-)
 create mode 100644 include/uapi/linux/aspeed-video.h

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 2f7451f06c24..c0cfcf98659d 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -31,6 +31,7 @@
 #include <media/v4l2-ioctl.h>
 #include <media/videobuf2-dma-contig.h>
 #include <linux/videodev2.h>
+#include <uapi/linux/aspeed-video.h>
 
 #define ASPEED_VIDEO_V4L2_MIN_BUF_REQ 3
 
@@ -57,6 +58,7 @@
 
 #define VE_MAX_SRC_BUFFER_SIZE		0x8ca000 /* 1920 * 1200, 32bpp */
 #define VE_JPEG_HEADER_SIZE		0x006000 /* 512 * 12 * 4 */
+#define VE_BCD_BUFF_SIZE		0x9000 /* (1920/8) * (1200/8) */
 
 #define VE_PROTECTION_KEY		0x000
 #define  VE_PROTECTION_KEY_UNLOCK	0x1a038aa8
@@ -107,6 +109,13 @@
 #define VE_SCALING_FILTER2		0x020
 #define VE_SCALING_FILTER3		0x024
 
+#define VE_BCD_CTRL			0x02C
+#define  VE_BCD_CTRL_EN_BCD		BIT(0)
+#define  VE_BCD_CTRL_EN_ABCD		BIT(1)
+#define  VE_BCD_CTRL_EN_CB		BIT(2)
+#define  VE_BCD_CTRL_THR		GENMASK(23, 16)
+#define  VE_BCD_CTRL_ABCD_THR		GENMASK(31, 24)
+
 #define VE_CAP_WINDOW			0x030
 #define VE_COMP_WINDOW			0x034
 #define VE_COMP_PROC_OFFSET		0x038
@@ -115,6 +124,7 @@
 #define VE_SRC0_ADDR			0x044
 #define VE_SRC_SCANLINE_OFFSET		0x048
 #define VE_SRC1_ADDR			0x04c
+#define VE_BCD_ADDR			0x050
 #define VE_COMP_ADDR			0x054
 
 #define VE_STREAM_BUF_SIZE		0x058
@@ -135,6 +145,8 @@
 #define  VE_COMP_CTRL_HQ_DCT_CHR	GENMASK(26, 22)
 #define  VE_COMP_CTRL_HQ_DCT_LUM	GENMASK(31, 27)
 
+#define VE_CB_ADDR			0x06C
+
 #define AST2400_VE_COMP_SIZE_READ_BACK	0x078
 #define AST2600_VE_COMP_SIZE_READ_BACK	0x084
 
@@ -202,6 +214,12 @@ enum {
 	VIDEO_CLOCKS_ON,
 };
 
+enum aspeed_video_format {
+	VIDEO_FMT_STANDARD = 0,
+	VIDEO_FMT_ASPEED,
+	VIDEO_FMT_MAX = VIDEO_FMT_ASPEED
+};
+
 struct aspeed_video_addr {
 	unsigned int size;
 	dma_addr_t dma;
@@ -234,9 +252,14 @@ struct aspeed_video_perf {
  * @max_compressed_size:holds max compressed stream's size
  * @srcs:		holds the buffer information for srcs
  * @jpeg:		holds the buffer information for jpeg header
+ * @bcd:		holds the buffer information for bcd work
  * @yuv420:		a flag raised if JPEG subsampling is 420
+ * @format:		holds the video format
+ * @hq_mode:		a flag raised if HQ is enabled. Only for VIDEO_FMT_ASPEED
  * @frame_rate:		holds the frame_rate
  * @jpeg_quality:	holds jpeq's quality (0~11)
+ * @jpeg_hq_quality:	holds hq's quality (1~12) only if hq_mode enabled
+ * @compression_scheme:	holds image coding scheme of aspeed jpeg
  * @frame_bottom:	end position of video data in vertical direction
  * @frame_left:		start position of video data in horizontal direction
  * @frame_right:	end position of video data in horizontal direction
@@ -271,10 +294,15 @@ struct aspeed_video {
 	unsigned int max_compressed_size;
 	struct aspeed_video_addr srcs[2];
 	struct aspeed_video_addr jpeg;
+	struct aspeed_video_addr bcd;
 
 	bool yuv420;
+	enum aspeed_video_format format;
+	bool hq_mode;
 	unsigned int frame_rate;
 	unsigned int jpeg_quality;
+	unsigned int jpeg_hq_quality;
+	unsigned int compression_scheme;
 
 	unsigned int frame_bottom;
 	unsigned int frame_left;
@@ -443,8 +471,20 @@ static const struct v4l2_dv_timings_cap aspeed_video_timings_cap = {
 	},
 };
 
+static const char * const compress_scheme_str[] = {"DCT Only",
+	"DCT VQ mix 2-color", "DCT VQ mix 4-color"};
+static const char * const format_str[] = {"Standard JPEG",
+	"Aspeed JPEG"};
+
 static unsigned int debug;
 
+static bool aspeed_video_alloc_buf(struct aspeed_video *video,
+				   struct aspeed_video_addr *addr,
+				   unsigned int size);
+
+static void aspeed_video_free_buf(struct aspeed_video *video,
+				  struct aspeed_video_addr *addr);
+
 static void aspeed_video_init_jpeg_table(u32 *table, bool yuv420)
 {
 	int i;
@@ -532,6 +572,7 @@ static int aspeed_video_start_frame(struct aspeed_video *video)
 	unsigned long flags;
 	struct aspeed_video_buffer *buf;
 	u32 seq_ctrl = aspeed_video_read(video, VE_SEQ_CTRL);
+	bool bcd_buf_need = (video->format != VIDEO_FMT_STANDARD);
 
 	if (video->v4l2_input_status) {
 		v4l2_warn(&video->v4l2_dev, "No signal; don't start frame\n");
@@ -544,6 +585,20 @@ static int aspeed_video_start_frame(struct aspeed_video *video)
 		return -EBUSY;
 	}
 
+	if (bcd_buf_need && !video->bcd.size) {
+		if (!aspeed_video_alloc_buf(video, &video->bcd,
+					    VE_BCD_BUFF_SIZE)) {
+			dev_err(video->dev, "Failed to allocate BCD buffer\n");
+			dev_err(video->dev, "don't start frame\n");
+			return -ENOMEM;
+		}
+		aspeed_video_write(video, VE_BCD_ADDR, video->bcd.dma);
+		v4l2_dbg(1, debug, &video->v4l2_dev, "bcd addr(%#x) size(%d)\n",
+			 video->bcd.dma, video->bcd.size);
+	} else if (!bcd_buf_need && video->bcd.size) {
+		aspeed_video_free_buf(video, &video->bcd);
+	}
+
 	spin_lock_irqsave(&video->lock, flags);
 	buf = list_first_entry_or_null(&video->buffers,
 				       struct aspeed_video_buffer, link);
@@ -640,6 +695,24 @@ static void aspeed_video_irq_res_change(struct aspeed_video *video, ulong delay)
 	schedule_delayed_work(&video->res_work, delay);
 }
 
+static void aspeed_video_swap_src_buf(struct aspeed_video *v)
+{
+	if (v->format == VIDEO_FMT_STANDARD)
+		return;
+
+	/* Reset bcd buffer to have a full frame update every 8 frames.  */
+	if (IS_ALIGNED(v->sequence, 8))
+		memset((u8 *)v->bcd.virt, 0x00, VE_BCD_BUFF_SIZE);
+
+	if (v->sequence & 0x01) {
+		aspeed_video_write(v, VE_SRC0_ADDR, v->srcs[1].dma);
+		aspeed_video_write(v, VE_SRC1_ADDR, v->srcs[0].dma);
+	} else {
+		aspeed_video_write(v, VE_SRC0_ADDR, v->srcs[0].dma);
+		aspeed_video_write(v, VE_SRC1_ADDR, v->srcs[1].dma);
+	}
+}
+
 /*
  * Interrupts that we don't use but have to explicitly ignore because the
  * hardware asserts them even when they're disabled in the VE_INTERRUPT_CTRL
@@ -691,6 +764,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 
 	if (sts & VE_INTERRUPT_COMP_COMPLETE) {
 		struct aspeed_video_buffer *buf;
+		bool empty = true;
 		u32 frame_size = aspeed_video_read(video,
 						   video->config.comp_size_read);
 
@@ -704,13 +778,23 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 		if (buf) {
 			vb2_set_plane_payload(&buf->vb.vb2_buf, 0, frame_size);
 
-			if (!list_is_last(&buf->link, &video->buffers)) {
+			/*
+			 * aspeed_jpeg requires continuous update.
+			 * On the contrary, standard jpeg can keep last buffer
+			 * to always have the latest result.
+			 */
+			if (video->format == VIDEO_FMT_STANDARD &&
+			    list_is_last(&buf->link, &video->buffers)) {
+				empty = false;
+				v4l2_warn(&video->v4l2_dev, "skip to keep last frame updated\n");
+			} else {
 				buf->vb.vb2_buf.timestamp = ktime_get_ns();
 				buf->vb.sequence = video->sequence++;
 				buf->vb.field = V4L2_FIELD_NONE;
 				vb2_buffer_done(&buf->vb.vb2_buf,
 						VB2_BUF_STATE_DONE);
 				list_del(&buf->link);
+				empty = list_empty(&video->buffers);
 			}
 		}
 		spin_unlock(&video->lock);
@@ -724,7 +808,10 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 		aspeed_video_write(video, VE_INTERRUPT_STATUS,
 				   VE_INTERRUPT_COMP_COMPLETE);
 		sts &= ~VE_INTERRUPT_COMP_COMPLETE;
-		if (test_bit(VIDEO_STREAMING, &video->flags) && buf)
+
+		aspeed_video_swap_src_buf(video);
+
+		if (test_bit(VIDEO_STREAMING, &video->flags) && !empty)
 			aspeed_video_start_frame(video);
 	}
 
@@ -983,10 +1070,14 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
 				   FIELD_PREP(VE_TGS_FIRST, video->frame_top) |
 				   FIELD_PREP(VE_TGS_LAST,
 					      video->frame_bottom + 1));
-		aspeed_video_update(video, VE_CTRL, 0, VE_CTRL_INT_DE);
+		aspeed_video_update(video, VE_CTRL,
+				    VE_CTRL_INT_DE | VE_CTRL_DIRECT_FETCH,
+				    VE_CTRL_INT_DE);
 	} else {
 		v4l2_dbg(1, debug, &video->v4l2_dev, "Capture: Direct Mode\n");
-		aspeed_video_update(video, VE_CTRL, 0, VE_CTRL_DIRECT_FETCH);
+		aspeed_video_update(video, VE_CTRL,
+				    VE_CTRL_INT_DE | VE_CTRL_DIRECT_FETCH,
+				    VE_CTRL_DIRECT_FETCH);
 	}
 
 	size *= 4;
@@ -1021,35 +1112,71 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
 
 static void aspeed_video_update_regs(struct aspeed_video *video)
 {
-	u32 comp_ctrl = VE_COMP_CTRL_RSVD |
-		FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality) |
-		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10);
+	u8 jpeg_hq_quality = clamp((int)video->jpeg_hq_quality - 1, 0,
+				   ASPEED_VIDEO_JPEG_NUM_QUALITIES - 1);
+	u32 comp_ctrl =	FIELD_PREP(VE_COMP_CTRL_DCT_LUM, video->jpeg_quality) |
+		FIELD_PREP(VE_COMP_CTRL_DCT_CHR, video->jpeg_quality | 0x10) |
+		FIELD_PREP(VE_COMP_CTRL_EN_HQ, video->hq_mode) |
+		FIELD_PREP(VE_COMP_CTRL_HQ_DCT_LUM, jpeg_hq_quality) |
+		FIELD_PREP(VE_COMP_CTRL_HQ_DCT_CHR, jpeg_hq_quality | 0x10);
 	u32 ctrl = 0;
-	u32 seq_ctrl = video->config.jpeg_mode;
+	u32 seq_ctrl = 0;
 
-	v4l2_dbg(1, debug, &video->v4l2_dev, "framerate(%d)\n",
-		 video->frame_rate);
-	v4l2_dbg(1, debug, &video->v4l2_dev, "subsample(%s)\n",
+	v4l2_dbg(1, debug, &video->v4l2_dev, "framerate(%d)\n", video->frame_rate);
+	v4l2_dbg(1, debug, &video->v4l2_dev, "jpeg format(%s) subsample(%s)\n",
+		 format_str[video->format],
 		 video->yuv420 ? "420" : "444");
 	v4l2_dbg(1, debug, &video->v4l2_dev, "compression quality(%d)\n",
 		 video->jpeg_quality);
+	v4l2_dbg(1, debug, &video->v4l2_dev, "hq_mode(%s) hq_quality(%d)\n",
+		 video->hq_mode ? "on" : "off", video->jpeg_hq_quality);
+	v4l2_dbg(1, debug, &video->v4l2_dev, "compression scheme(%s)\n",
+		 compress_scheme_str[video->compression_scheme]);
+
+	if (video->format == VIDEO_FMT_ASPEED)
+		aspeed_video_update(video, VE_BCD_CTRL, 0, VE_BCD_CTRL_EN_BCD);
+	else
+		aspeed_video_update(video, VE_BCD_CTRL, VE_BCD_CTRL_EN_BCD, 0);
 
 	if (video->frame_rate)
 		ctrl |= FIELD_PREP(VE_CTRL_FRC, video->frame_rate);
 
+	if (video->format == VIDEO_FMT_STANDARD) {
+		comp_ctrl &= ~FIELD_PREP(VE_COMP_CTRL_EN_HQ, video->hq_mode);
+		seq_ctrl |= video->config.jpeg_mode;
+	}
+
 	if (video->yuv420)
 		seq_ctrl |= VE_SEQ_CTRL_YUV420;
 
 	if (video->jpeg.virt)
 		aspeed_video_update_jpeg_table(video->jpeg.virt, video->yuv420);
 
+	if (video->config.version == 4) {
+		switch (video->compression_scheme) {
+		case 0:	//DCT only
+			comp_ctrl |= VE_COMP_CTRL_VQ_DCT_ONLY;
+			break;
+		case 1:	//DCT VQ mix 2-color
+			comp_ctrl &= ~(VE_COMP_CTRL_VQ_4COLOR |
+				     VE_COMP_CTRL_VQ_DCT_ONLY);
+			break;
+		case 2:	//DCT VQ mix 4-color
+			comp_ctrl |= VE_COMP_CTRL_VQ_4COLOR;
+			break;
+		}
+	}
+
 	/* Set control registers */
 	aspeed_video_update(video, VE_SEQ_CTRL,
 			    video->config.jpeg_mode | VE_SEQ_CTRL_YUV420,
 			    seq_ctrl);
 	aspeed_video_update(video, VE_CTRL, VE_CTRL_FRC, ctrl);
 	aspeed_video_update(video, VE_COMP_CTRL,
-			    VE_COMP_CTRL_DCT_LUM | VE_COMP_CTRL_DCT_CHR,
+			    VE_COMP_CTRL_DCT_LUM | VE_COMP_CTRL_DCT_CHR |
+			    VE_COMP_CTRL_EN_HQ | VE_COMP_CTRL_HQ_DCT_LUM |
+			    VE_COMP_CTRL_HQ_DCT_CHR | VE_COMP_CTRL_VQ_4COLOR |
+			    VE_COMP_CTRL_VQ_DCT_ONLY,
 			    comp_ctrl);
 }
 
@@ -1081,6 +1208,8 @@ static void aspeed_video_init_regs(struct aspeed_video *video)
 
 	/* Set mode detection defaults */
 	aspeed_video_write(video, VE_MODE_DETECT, 0x22666500);
+
+	aspeed_video_write(video, VE_BCD_CTRL, 0);
 }
 
 static void aspeed_video_start(struct aspeed_video *video)
@@ -1114,6 +1243,9 @@ static void aspeed_video_stop(struct aspeed_video *video)
 	if (video->srcs[1].size)
 		aspeed_video_free_buf(video, &video->srcs[1]);
 
+	if (video->bcd.size)
+		aspeed_video_free_buf(video, &video->bcd);
+
 	video->v4l2_input_status = V4L2_IN_ST_NO_SIGNAL;
 	video->flags = 0;
 }
@@ -1132,10 +1264,12 @@ static int aspeed_video_querycap(struct file *file, void *fh,
 static int aspeed_video_enum_format(struct file *file, void *fh,
 				    struct v4l2_fmtdesc *f)
 {
+	struct aspeed_video *video = video_drvdata(file);
+
 	if (f->index)
 		return -EINVAL;
 
-	f->pixelformat = V4L2_PIX_FMT_JPEG;
+	f->pixelformat = video->pix_fmt.pixelformat;
 
 	return 0;
 }
@@ -1150,6 +1284,29 @@ static int aspeed_video_get_format(struct file *file, void *fh,
 	return 0;
 }
 
+static int aspeed_video_set_format(struct file *file, void *fh,
+				   struct v4l2_format *f)
+{
+	struct aspeed_video *video = video_drvdata(file);
+
+	if (vb2_is_busy(&video->queue))
+		return -EBUSY;
+
+	switch (f->fmt.pix.pixelformat) {
+	case V4L2_PIX_FMT_JPEG:
+		video->format = VIDEO_FMT_STANDARD;
+		break;
+	case V4L2_PIX_FMT_AJPG:
+		video->format = VIDEO_FMT_ASPEED;
+		break;
+	default:
+		return -EINVAL;
+	}
+	video->pix_fmt.pixelformat = f->fmt.pix.pixelformat;
+
+	return 0;
+}
+
 static int aspeed_video_enum_input(struct file *file, void *fh,
 				   struct v4l2_input *inp)
 {
@@ -1367,7 +1524,7 @@ static const struct v4l2_ioctl_ops aspeed_video_ioctl_ops = {
 
 	.vidioc_enum_fmt_vid_cap = aspeed_video_enum_format,
 	.vidioc_g_fmt_vid_cap = aspeed_video_get_format,
-	.vidioc_s_fmt_vid_cap = aspeed_video_get_format,
+	.vidioc_s_fmt_vid_cap = aspeed_video_set_format,
 	.vidioc_try_fmt_vid_cap = aspeed_video_get_format,
 
 	.vidioc_reqbufs = vb2_ioctl_reqbufs,
@@ -1416,6 +1573,24 @@ static int aspeed_video_set_ctrl(struct v4l2_ctrl *ctrl)
 		if (test_bit(VIDEO_STREAMING, &video->flags))
 			aspeed_video_update_regs(video);
 		break;
+	case V4L2_CID_ASPEED_COMPRESSION_SCHEME:
+		if (video->config.version > 4)
+			return -EINVAL;
+
+		video->compression_scheme = ctrl->val;
+		if (test_bit(VIDEO_STREAMING, &video->flags))
+			aspeed_video_update_regs(video);
+		break;
+	case V4L2_CID_ASPEED_HQ_MODE:
+		video->hq_mode = ctrl->val;
+		if (test_bit(VIDEO_STREAMING, &video->flags))
+			aspeed_video_update_regs(video);
+		break;
+	case V4L2_CID_ASPEED_HQ_JPEG_QUALITY:
+		video->jpeg_hq_quality = ctrl->val;
+		if (test_bit(VIDEO_STREAMING, &video->flags))
+			aspeed_video_update_regs(video);
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -1427,6 +1602,39 @@ static const struct v4l2_ctrl_ops aspeed_video_ctrl_ops = {
 	.s_ctrl = aspeed_video_set_ctrl,
 };
 
+static const struct v4l2_ctrl_config aspeed_ctrl_compression_scheme = {
+	.ops = &aspeed_video_ctrl_ops,
+	.id = V4L2_CID_ASPEED_COMPRESSION_SCHEME,
+	.name = "Aspeed Compression SCHEME",
+	.type = V4L2_CTRL_TYPE_INTEGER,
+	.min = 0,
+	.max = 2,
+	.step = 1,
+	.def = 0,
+};
+
+static const struct v4l2_ctrl_config aspeed_ctrl_HQ_mode = {
+	.ops = &aspeed_video_ctrl_ops,
+	.id = V4L2_CID_ASPEED_HQ_MODE,
+	.name = "Aspeed HQ Mode",
+	.type = V4L2_CTRL_TYPE_BOOLEAN,
+	.min = false,
+	.max = true,
+	.step = 1,
+	.def = false,
+};
+
+static const struct v4l2_ctrl_config aspeed_ctrl_HQ_jpeg_quality = {
+	.ops = &aspeed_video_ctrl_ops,
+	.id = V4L2_CID_ASPEED_HQ_JPEG_QUALITY,
+	.name = "Aspeed HQ Quality",
+	.type = V4L2_CTRL_TYPE_INTEGER,
+	.min = 1,
+	.max = ASPEED_VIDEO_JPEG_NUM_QUALITIES,
+	.step = 1,
+	.def = 1,
+};
+
 static void aspeed_video_resolution_work(struct work_struct *work)
 {
 	struct delayed_work *dwork = to_delayed_work(work);
@@ -1693,6 +1901,7 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
 	struct v4l2_device *v4l2_dev = &video->v4l2_dev;
 	struct vb2_queue *vbq = &video->queue;
 	struct video_device *vdev = &video->vdev;
+	struct v4l2_ctrl_handler *hdl = &video->ctrl_handler;
 	int rc;
 
 	video->pix_fmt.pixelformat = V4L2_PIX_FMT_JPEG;
@@ -1707,22 +1916,26 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
 		return rc;
 	}
 
-	v4l2_ctrl_handler_init(&video->ctrl_handler, 2);
-	v4l2_ctrl_new_std(&video->ctrl_handler, &aspeed_video_ctrl_ops,
+	v4l2_ctrl_handler_init(hdl, 5);
+	v4l2_ctrl_new_std(hdl, &aspeed_video_ctrl_ops,
 			  V4L2_CID_JPEG_COMPRESSION_QUALITY, 0,
 			  ASPEED_VIDEO_JPEG_NUM_QUALITIES - 1, 1, 0);
-	v4l2_ctrl_new_std_menu(&video->ctrl_handler, &aspeed_video_ctrl_ops,
+	v4l2_ctrl_new_std_menu(hdl, &aspeed_video_ctrl_ops,
 			       V4L2_CID_JPEG_CHROMA_SUBSAMPLING,
 			       V4L2_JPEG_CHROMA_SUBSAMPLING_420, mask,
 			       V4L2_JPEG_CHROMA_SUBSAMPLING_444);
+	if (video->config.version == 4)
+		v4l2_ctrl_new_custom(hdl, &aspeed_ctrl_compression_scheme, NULL);
+	v4l2_ctrl_new_custom(hdl, &aspeed_ctrl_HQ_mode, NULL);
+	v4l2_ctrl_new_custom(hdl, &aspeed_ctrl_HQ_jpeg_quality, NULL);
 
-	rc = video->ctrl_handler.error;
+	rc = hdl->error;
 	if (rc) {
 		dev_err(video->dev, "Failed to init controls: %d\n", rc);
 		goto err_ctrl_init;
 	}
 
-	v4l2_dev->ctrl_handler = &video->ctrl_handler;
+	v4l2_dev->ctrl_handler = hdl;
 
 	vbq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	vbq->io_modes = VB2_MMAP | VB2_READ | VB2_DMABUF;
@@ -1863,6 +2076,7 @@ static int aspeed_video_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	video->frame_rate = 30;
+	video->jpeg_hq_quality = 1;
 	video->dev = &pdev->dev;
 	spin_lock_init(&video->lock);
 	mutex_init(&video->video_lock);
diff --git a/include/uapi/linux/aspeed-video.h b/include/uapi/linux/aspeed-video.h
new file mode 100644
index 000000000000..63f0432192a5
--- /dev/null
+++ b/include/uapi/linux/aspeed-video.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2021 ASPEED Technology Inc.
+ */
+
+#ifndef _UAPI_LINUX_ASPEED_VIDEO_H
+#define _UAPI_LINUX_ASPEED_VIDEO_H
+
+#include <linux/v4l2-controls.h>
+
+#define V4L2_CID_ASPEED_COMPRESSION_SCHEME	(V4L2_CID_USER_ASPEED_BASE  + 1)
+#define V4L2_CID_ASPEED_HQ_MODE			(V4L2_CID_USER_ASPEED_BASE  + 2)
+#define V4L2_CID_ASPEED_HQ_JPEG_QUALITY		(V4L2_CID_USER_ASPEED_BASE  + 3)
+
+#endif /* _UAPI_LINUX_ASPEED_VIDEO_H */
-- 
2.25.1

