Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D405995113E
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2024 02:55:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wk8vF5vnrz2yjR
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2024 10:55:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wk8ss23fXz2y8m;
	Wed, 14 Aug 2024 10:54:41 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 14 Aug
 2024 08:54:21 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 14 Aug 2024 08:54:21 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
	<andrew@aj.id.au>, <pmenzel@molgen.mpg.de>, <krzk@kernel.org>
Subject: [PATCH v4 2/2] media: aspeed: Allow to capture from SoC display (GFX)
Date: Wed, 14 Aug 2024 08:54:21 +0800
Message-ID: <20240814005421.3362441-3-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240814005421.3362441-1-jammy_huang@aspeedtech.com>
References: <20240814005421.3362441-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

ASPEED BMC IC has 2 different display engines. Please find AST2600's
datasheet to get detailed information.

1. VGA on PCIe
2. SoC Display (GFX)

By default, video engine (VE) will capture video from VGA. This patch
adds an option to capture video from GFX with standard ioctl,
vidioc_s_input.

An enum, aspeed_video_input, is added for this purpose.
enum aspeed_video_input {
	VIDEO_INPUT_VGA = 0,
	VIDEO_INPUT_GFX,
	VIDEO_INPUT_MAX
};

To test this feature, you will need to enable GFX first. Please refer to
ASPEED's SDK_User_Guide, 6.3.x Soc Display driver, for more information.
In your application, you will need to use v4l2 ioctl, VIDIOC_S_INPUT, as
below to select before start streaming.

int rc;
struct v4l2_input input;

input.index = VIDEO_INPUT_GFX;
rc = ioctl(fd, VIDIOC_S_INPUT, &input);
if (rc < 0)
{
	...
}

Link: https://github.com/AspeedTech-BMC/openbmc/releases
Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 drivers/media/platform/aspeed/aspeed-video.c | 192 ++++++++++++++++---
 include/uapi/linux/aspeed-video.h            |   7 +
 2 files changed, 171 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index fc6050e3be0d..927eb790b869 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -4,6 +4,7 @@
 
 #include <linux/atomic.h>
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -25,6 +26,8 @@
 #include <linux/workqueue.h>
 #include <linux/debugfs.h>
 #include <linux/ktime.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-dev.h>
 #include <media/v4l2-device.h>
@@ -203,6 +206,25 @@
 #define VE_MEM_RESTRICT_START		0x310
 #define VE_MEM_RESTRICT_END		0x314
 
+/* SCU's registers */
+#define SCU_MISC_CTRL			0xC0
+#define  SCU_DPLL_SOURCE		BIT(20)
+
+/* GFX's registers */
+#define GFX_CTRL			0x60
+#define  GFX_CTRL_ENABLE		BIT(0)
+#define  GFX_CTRL_FMT			GENMASK(9, 7)
+
+#define GFX_H_DISPLAY			0x70
+#define  GFX_H_DISPLAY_DE		GENMASK(28, 16)
+#define  GFX_H_DISPLAY_TOTAL		GENMASK(12, 0)
+
+#define GFX_V_DISPLAY			0x78
+#define  GFX_V_DISPLAY_DE		GENMASK(27, 16)
+#define  GFX_V_DISPLAY_TOTAL		GENMASK(11, 0)
+
+#define GFX_DISPLAY_ADDR		0x80
+
 /*
  * VIDEO_MODE_DETECT_DONE:	a flag raised if signal lock
  * VIDEO_RES_CHANGE:		a flag raised if res_change work on-going
@@ -262,6 +284,7 @@ struct aspeed_video_perf {
 /*
  * struct aspeed_video - driver data
  *
+ * version:		holds the version of aspeed SoC
  * res_work:		holds the delayed_work for res-detection if unlock
  * buffers:		holds the list of buffer queued from user
  * flags:		holds the state of video
@@ -273,6 +296,7 @@ struct aspeed_video_perf {
  * yuv420:		a flag raised if JPEG subsampling is 420
  * format:		holds the video format
  * hq_mode:		a flag raised if HQ is enabled. Only for VIDEO_FMT_ASPEED
+ * input:		holds the video input
  * frame_rate:		holds the frame_rate
  * jpeg_quality:	holds jpeq's quality (0~11)
  * jpeg_hq_quality:	holds hq's quality (1~12) only if hq_mode enabled
@@ -298,6 +322,9 @@ struct aspeed_video {
 	struct video_device vdev;
 	struct mutex video_lock;	/* v4l2 and videobuf2 lock */
 
+	struct regmap *scu;
+	struct regmap *gfx;
+	u32 version;
 	u32 jpeg_mode;
 	u32 comp_size_read;
 
@@ -316,6 +343,7 @@ struct aspeed_video {
 	bool yuv420;
 	enum aspeed_video_format format;
 	bool hq_mode;
+	enum aspeed_video_input input;
 	unsigned int frame_rate;
 	unsigned int jpeg_quality;
 	unsigned int jpeg_hq_quality;
@@ -331,21 +359,25 @@ struct aspeed_video {
 #define to_aspeed_video(x) container_of((x), struct aspeed_video, v4l2_dev)
 
 struct aspeed_video_config {
+	u32 version;
 	u32 jpeg_mode;
 	u32 comp_size_read;
 };
 
 static const struct aspeed_video_config ast2400_config = {
+	.version = 4,
 	.jpeg_mode = AST2400_VE_SEQ_CTRL_JPEG_MODE,
 	.comp_size_read = AST2400_VE_COMP_SIZE_READ_BACK,
 };
 
 static const struct aspeed_video_config ast2500_config = {
+	.version = 5,
 	.jpeg_mode = AST2500_VE_SEQ_CTRL_JPEG_MODE,
 	.comp_size_read = AST2400_VE_COMP_SIZE_READ_BACK,
 };
 
 static const struct aspeed_video_config ast2600_config = {
+	.version = 6,
 	.jpeg_mode = AST2500_VE_SEQ_CTRL_JPEG_MODE,
 	.comp_size_read = AST2600_VE_COMP_SIZE_READ_BACK,
 };
@@ -485,6 +517,7 @@ static const struct v4l2_dv_timings_cap aspeed_video_timings_cap = {
 
 static const char * const format_str[] = {"Standard JPEG",
 	"Aspeed JPEG"};
+static const char * const input_str[] = {"HOST VGA", "BMC GFX"};
 
 static unsigned int debug;
 
@@ -609,6 +642,14 @@ static int aspeed_video_start_frame(struct aspeed_video *video)
 		aspeed_video_free_buf(video, &video->bcd);
 	}
 
+	if (video->input == VIDEO_INPUT_GFX) {
+		u32 val;
+
+		// update input buffer address as gfx's
+		regmap_read(video->gfx, GFX_DISPLAY_ADDR, &val);
+		aspeed_video_write(video, VE_TGS_0, val);
+	}
+
 	spin_lock_irqsave(&video->lock, flags);
 	buf = list_first_entry_or_null(&video->buffers,
 				       struct aspeed_video_buffer, link);
@@ -1026,9 +1067,23 @@ static void aspeed_video_get_timings(struct aspeed_video *v,
 	}
 }
 
+static void aspeed_video_get_resolution_gfx(struct aspeed_video *video,
+					    struct v4l2_bt_timings *det)
+{
+	u32 h_val, v_val;
+
+	regmap_read(video->gfx, GFX_H_DISPLAY, &h_val);
+	regmap_read(video->gfx, GFX_V_DISPLAY, &v_val);
+
+	det->width = FIELD_GET(GFX_H_DISPLAY_DE, h_val) + 1;
+	det->height = FIELD_GET(GFX_V_DISPLAY_DE, v_val) + 1;
+	video->v4l2_input_status = 0;
+}
+
 #define res_check(v) test_and_clear_bit(VIDEO_MODE_DETECT_DONE, &(v)->flags)
 
-static void aspeed_video_get_resolution(struct aspeed_video *video)
+static void aspeed_video_get_resolution_vga(struct aspeed_video *video,
+					    struct v4l2_bt_timings *det)
 {
 	bool invalid_resolution = true;
 	int rc;
@@ -1036,7 +1091,6 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
 	u32 mds;
 	u32 src_lr_edge;
 	u32 src_tb_edge;
-	struct v4l2_bt_timings *det = &video->detected_timings;
 
 	det->width = MIN_WIDTH;
 	det->height = MIN_HEIGHT;
@@ -1113,14 +1167,20 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
 
 	aspeed_video_get_timings(video, det);
 
-	/*
-	 * Enable mode-detect watchdog, resolution-change watchdog and
-	 * automatic compression after frame capture.
-	 */
+	/* Enable mode-detect watchdog, resolution-change watchdog */
 	aspeed_video_update(video, VE_INTERRUPT_CTRL, 0,
 			    VE_INTERRUPT_MODE_DETECT_WD);
-	aspeed_video_update(video, VE_SEQ_CTRL, 0,
-			    VE_SEQ_CTRL_AUTO_COMP | VE_SEQ_CTRL_EN_WATCHDOG);
+	aspeed_video_update(video, VE_SEQ_CTRL, 0, VE_SEQ_CTRL_EN_WATCHDOG);
+}
+
+static void aspeed_video_get_resolution(struct aspeed_video *video)
+{
+	struct v4l2_bt_timings *det = &video->detected_timings;
+
+	if (video->input == VIDEO_INPUT_GFX)
+		aspeed_video_get_resolution_gfx(video, det);
+	else
+		aspeed_video_get_resolution_vga(video, det);
 
 	v4l2_dbg(1, debug, &video->v4l2_dev, "Got resolution: %dx%d\n",
 		 det->width, det->height);
@@ -1156,7 +1216,7 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
 	aspeed_video_write(video, VE_SRC_SCANLINE_OFFSET, act->width * 4);
 
 	/* Don't use direct mode below 1024 x 768 (irqs don't fire) */
-	if (size < DIRECT_FETCH_THRESHOLD) {
+	if (video->input == VIDEO_INPUT_VGA && size < DIRECT_FETCH_THRESHOLD) {
 		v4l2_dbg(1, debug, &video->v4l2_dev, "Capture: Sync Mode\n");
 		aspeed_video_write(video, VE_TGS_0,
 				   FIELD_PREP(VE_TGS_FIRST,
@@ -1171,10 +1231,20 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
 				    VE_CTRL_INT_DE | VE_CTRL_DIRECT_FETCH,
 				    VE_CTRL_INT_DE);
 	} else {
+		u32 ctrl, val, bpp;
+
 		v4l2_dbg(1, debug, &video->v4l2_dev, "Capture: Direct Mode\n");
+		ctrl = VE_CTRL_DIRECT_FETCH;
+		if (video->input == VIDEO_INPUT_GFX) {
+			regmap_read(video->gfx, GFX_CTRL, &val);
+			bpp = FIELD_GET(GFX_CTRL_FMT, val) ? 32 : 16;
+			if (bpp == 16)
+				ctrl |= VE_CTRL_INT_DE;
+			aspeed_video_write(video, VE_TGS_1, act->width * (bpp >> 3));
+		}
 		aspeed_video_update(video, VE_CTRL,
 				    VE_CTRL_INT_DE | VE_CTRL_DIRECT_FETCH,
-				    VE_CTRL_DIRECT_FETCH);
+				    ctrl);
 	}
 
 	size *= 4;
@@ -1207,6 +1277,22 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
 		aspeed_video_free_buf(video, &video->srcs[0]);
 }
 
+/*
+ * Update relative parameters when timing changed.
+ *
+ * @video: the struct of aspeed_video
+ * @timings: the new timings
+ */
+static void aspeed_video_update_timings(struct aspeed_video *video, struct v4l2_bt_timings *timings)
+{
+	video->active_timings = *timings;
+	aspeed_video_set_resolution(video);
+
+	video->pix_fmt.width = timings->width;
+	video->pix_fmt.height = timings->height;
+	video->pix_fmt.sizeimage = video->max_compressed_size;
+}
+
 static void aspeed_video_update_regs(struct aspeed_video *video)
 {
 	u8 jpeg_hq_quality = clamp((int)video->jpeg_hq_quality - 1, 0,
@@ -1219,6 +1305,8 @@ static void aspeed_video_update_regs(struct aspeed_video *video)
 	u32 ctrl = 0;
 	u32 seq_ctrl = 0;
 
+	v4l2_dbg(1, debug, &video->v4l2_dev, "input(%s)\n",
+		 input_str[video->input]);
 	v4l2_dbg(1, debug, &video->v4l2_dev, "framerate(%d)\n",
 		 video->frame_rate);
 	v4l2_dbg(1, debug, &video->v4l2_dev, "jpeg format(%s) subsample(%s)\n",
@@ -1234,6 +1322,9 @@ static void aspeed_video_update_regs(struct aspeed_video *video)
 	else
 		aspeed_video_update(video, VE_BCD_CTRL, VE_BCD_CTRL_EN_BCD, 0);
 
+	if (video->input == VIDEO_INPUT_VGA)
+		ctrl |= VE_CTRL_AUTO_OR_CURSOR;
+
 	if (video->frame_rate)
 		ctrl |= FIELD_PREP(VE_CTRL_FRC, video->frame_rate);
 
@@ -1252,7 +1343,9 @@ static void aspeed_video_update_regs(struct aspeed_video *video)
 	aspeed_video_update(video, VE_SEQ_CTRL,
 			    video->jpeg_mode | VE_SEQ_CTRL_YUV420,
 			    seq_ctrl);
-	aspeed_video_update(video, VE_CTRL, VE_CTRL_FRC, ctrl);
+	aspeed_video_update(video, VE_CTRL,
+			    VE_CTRL_FRC | VE_CTRL_AUTO_OR_CURSOR |
+			    VE_CTRL_SOURCE, ctrl);
 	aspeed_video_update(video, VE_COMP_CTRL,
 			    VE_COMP_CTRL_DCT_LUM | VE_COMP_CTRL_DCT_CHR |
 			    VE_COMP_CTRL_EN_HQ | VE_COMP_CTRL_HQ_DCT_LUM |
@@ -1280,6 +1373,7 @@ static void aspeed_video_init_regs(struct aspeed_video *video)
 	aspeed_video_write(video, VE_JPEG_ADDR, video->jpeg.dma);
 
 	/* Set control registers */
+	aspeed_video_write(video, VE_SEQ_CTRL, VE_SEQ_CTRL_AUTO_COMP);
 	aspeed_video_write(video, VE_CTRL, ctrl);
 	aspeed_video_write(video, VE_COMP_CTRL, VE_COMP_CTRL_RSVD);
 
@@ -1311,12 +1405,7 @@ static void aspeed_video_start(struct aspeed_video *video)
 	aspeed_video_get_resolution(video);
 
 	/* Set timings since the device is being opened for the first time */
-	video->active_timings = video->detected_timings;
-	aspeed_video_set_resolution(video);
-
-	video->pix_fmt.width = video->active_timings.width;
-	video->pix_fmt.height = video->active_timings.height;
-	video->pix_fmt.sizeimage = video->max_compressed_size;
+	aspeed_video_update_timings(video, &video->detected_timings);
 }
 
 static void aspeed_video_stop(struct aspeed_video *video)
@@ -1401,10 +1490,10 @@ static int aspeed_video_enum_input(struct file *file, void *fh,
 {
 	struct aspeed_video *video = video_drvdata(file);
 
-	if (inp->index)
+	if (inp->index >= VIDEO_INPUT_MAX)
 		return -EINVAL;
 
-	strscpy(inp->name, "Host VGA capture", sizeof(inp->name));
+	sprintf(inp->name, "%s capture", input_str[inp->index]);
 	inp->type = V4L2_INPUT_TYPE_CAMERA;
 	inp->capabilities = V4L2_IN_CAP_DV_TIMINGS;
 	inp->status = video->v4l2_input_status;
@@ -1414,16 +1503,47 @@ static int aspeed_video_enum_input(struct file *file, void *fh,
 
 static int aspeed_video_get_input(struct file *file, void *fh, unsigned int *i)
 {
-	*i = 0;
+	struct aspeed_video *video = video_drvdata(file);
+
+	*i = video->input;
 
 	return 0;
 }
 
 static int aspeed_video_set_input(struct file *file, void *fh, unsigned int i)
 {
-	if (i)
+	struct aspeed_video *video = video_drvdata(file);
+
+	if (i >= VIDEO_INPUT_MAX)
 		return -EINVAL;
 
+	if (IS_ERR(video->scu)) {
+		v4l2_dbg(1, debug, &video->v4l2_dev, "%s: scu isn't ready for input-control\n", __func__);
+		return -EINVAL;
+	}
+
+	if (IS_ERR(video->gfx) && i == VIDEO_INPUT_GFX) {
+		v4l2_dbg(1, debug, &video->v4l2_dev, "%s: gfx isn't ready for GFX input\n", __func__);
+		return -EINVAL;
+	}
+
+	video->input = i;
+
+	if (video->version == 6) {
+		/* modify dpll source per current input */
+		if (video->input == VIDEO_INPUT_VGA)
+			regmap_update_bits(video->scu, SCU_MISC_CTRL, SCU_DPLL_SOURCE, 0);
+		else
+			regmap_update_bits(video->scu, SCU_MISC_CTRL, SCU_DPLL_SOURCE, SCU_DPLL_SOURCE);
+	}
+
+	aspeed_video_update_regs(video);
+
+	/* update signal status */
+	aspeed_video_get_resolution(video);
+	if (!video->v4l2_input_status)
+		aspeed_video_update_timings(video, &video->detected_timings);
+
 	return 0;
 }
 
@@ -1527,13 +1647,7 @@ static int aspeed_video_set_dv_timings(struct file *file, void *fh,
 	if (vb2_is_busy(&video->queue))
 		return -EBUSY;
 
-	video->active_timings = timings->bt;
-
-	aspeed_video_set_resolution(video);
-
-	video->pix_fmt.width = timings->bt.width;
-	video->pix_fmt.height = timings->bt.height;
-	video->pix_fmt.sizeimage = video->max_compressed_size;
+	aspeed_video_update_timings(video, &timings->bt);
 
 	timings->type = V4L2_DV_BT_656_1120;
 
@@ -1911,6 +2025,7 @@ static int aspeed_video_debugfs_show(struct seq_file *s, void *data)
 	val08 = aspeed_video_read(v, VE_CTRL);
 	if (FIELD_GET(VE_CTRL_DIRECT_FETCH, val08)) {
 		seq_printf(s, "  %-20s:\tDirect fetch\n", "Mode");
+		seq_printf(s, "  %-20s:\t%s\n", "Input", input_str[v->input]);
 		seq_printf(s, "  %-20s:\t%s\n", "VGA bpp mode",
 			   FIELD_GET(VE_CTRL_INT_DE, val08) ? "16" : "32");
 	} else {
@@ -2070,12 +2185,32 @@ static int aspeed_video_setup_video(struct aspeed_video *video)
 	return 0;
 }
 
+/*
+ * Get regmap without checking res, such as clk/reset, that could lead to
+ * conflict.
+ */
+static struct regmap *aspeed_regmap_lookup(struct device_node *np, const char *property)
+{
+	struct device_node *syscon_np __free(device_node) = of_parse_phandle(np, property, 0);
+	struct regmap *regmap;
+
+	if (!syscon_np)
+		return ERR_PTR(-ENODEV);
+
+	regmap = device_node_to_regmap(syscon_np);
+
+	return regmap;
+}
+
 static int aspeed_video_init(struct aspeed_video *video)
 {
 	int irq;
 	int rc;
 	struct device *dev = video->dev;
 
+	video->scu = aspeed_regmap_lookup(dev->of_node, "aspeed,scu");
+	video->gfx = aspeed_regmap_lookup(dev->of_node, "aspeed,gfx");
+
 	irq = irq_of_parse_and_map(dev->of_node, 0);
 	if (!irq) {
 		dev_err(dev, "Unable to find IRQ\n");
@@ -2167,6 +2302,7 @@ static int aspeed_video_probe(struct platform_device *pdev)
 	if (!config)
 		return -ENODEV;
 
+	video->version = config->version;
 	video->jpeg_mode = config->jpeg_mode;
 	video->comp_size_read = config->comp_size_read;
 
diff --git a/include/uapi/linux/aspeed-video.h b/include/uapi/linux/aspeed-video.h
index 6586a65548c4..15168e8c931e 100644
--- a/include/uapi/linux/aspeed-video.h
+++ b/include/uapi/linux/aspeed-video.h
@@ -8,6 +8,13 @@
 
 #include <linux/v4l2-controls.h>
 
+/* aspeed video's input types */
+enum aspeed_video_input {
+	VIDEO_INPUT_VGA = 0,
+	VIDEO_INPUT_GFX,
+	VIDEO_INPUT_MAX
+};
+
 #define V4L2_CID_ASPEED_HQ_MODE			(V4L2_CID_USER_ASPEED_BASE  + 1)
 #define V4L2_CID_ASPEED_HQ_JPEG_QUALITY		(V4L2_CID_USER_ASPEED_BASE  + 2)
 
-- 
2.25.1

