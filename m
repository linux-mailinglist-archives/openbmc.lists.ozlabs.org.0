Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1AC43C028
	for <lists+openbmc@lfdr.de>; Wed, 27 Oct 2021 04:44:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfChG1J78z2ywG
	for <lists+openbmc@lfdr.de>; Wed, 27 Oct 2021 13:44:30 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfCgv19CDz2xZg;
 Wed, 27 Oct 2021 13:44:08 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 19R2KqK6028146;
 Wed, 27 Oct 2021 10:20:52 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 Oct 2021 10:43:17 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
 <andrew@aj.id.au>, <linux-media@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5] media: aspeed: add debugfs
Date: Wed, 27 Oct 2021 10:43:22 +0800
Message-ID: <20211027024322.20996-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 19R2KqK6028146
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

A debugfs file, /sys/kernel/debug/aspeed-video, will be created. You can
read it to get video real-time information as below:

Capture:
  Signal              : Lock
  Width               : 1920
  Height              : 1080
  FRC                 : 60

Performance:
  Frame#              : 38
  Frame Duration(ms)  :
    Now               : 21
    Min               : 21
    Max               : 21
  FPS                 : 47

Change-Id: Idff3f38a814d47fbbf19ed7df721f10fe222bf54
Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
v5:
  - correct log
  - update commit message
v4:
  - use void as aspeed_video_debugfs_create()'s return type
  - update commit message
v3:
 - let struct, aspeed_video_debugfs_ops, be const
v2:
 - Change the style of debugfs information
 - Use Min/Max to remove test and branch cases
---
 drivers/media/platform/aspeed-video.c | 94 +++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 8b3939b8052d..81876fc28f16 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -21,6 +21,8 @@
 #include <linux/videodev2.h>
 #include <linux/wait.h>
 #include <linux/workqueue.h>
+#include <linux/debugfs.h>
+#include <linux/ktime.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-dev.h>
 #include <media/v4l2-device.h>
@@ -203,6 +205,14 @@ struct aspeed_video_buffer {
 	struct list_head link;
 };
 
+struct aspeed_video_perf {
+	ktime_t last_sample;
+	u32 totaltime;
+	u32 duration;
+	u32 duration_min;
+	u32 duration_max;
+};
+
 #define to_aspeed_video_buffer(x) \
 	container_of((x), struct aspeed_video_buffer, vb)
 
@@ -241,6 +251,8 @@ struct aspeed_video {
 	unsigned int frame_left;
 	unsigned int frame_right;
 	unsigned int frame_top;
+
+	struct aspeed_video_perf perf;
 };
 
 #define to_aspeed_video(x) container_of((x), struct aspeed_video, v4l2_dev)
@@ -444,6 +456,16 @@ static void aspeed_video_write(struct aspeed_video *video, u32 reg, u32 val)
 		readl(video->base + reg));
 }
 
+static void update_perf(struct aspeed_video_perf *p)
+{
+	p->duration =
+		ktime_to_ms(ktime_sub(ktime_get(),  p->last_sample));
+	p->totaltime += p->duration;
+
+	p->duration_max = max(p->duration, p->duration_max);
+	p->duration_min = min(p->duration, p->duration_min);
+}
+
 static int aspeed_video_start_frame(struct aspeed_video *video)
 {
 	dma_addr_t addr;
@@ -482,6 +504,8 @@ static int aspeed_video_start_frame(struct aspeed_video *video)
 	aspeed_video_update(video, VE_INTERRUPT_CTRL, 0,
 			    VE_INTERRUPT_COMP_COMPLETE);
 
+	video->perf.last_sample = ktime_get();
+
 	aspeed_video_update(video, VE_SEQ_CTRL, 0,
 			    VE_SEQ_CTRL_TRIG_CAPTURE | VE_SEQ_CTRL_TRIG_COMP);
 
@@ -600,6 +624,8 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 		u32 frame_size = aspeed_video_read(video,
 						   VE_JPEG_COMP_SIZE_READ_BACK);
 
+		update_perf(&video->perf);
+
 		spin_lock(&video->lock);
 		clear_bit(VIDEO_FRAME_INPRG, &video->flags);
 		buf = list_first_entry_or_null(&video->buffers,
@@ -760,6 +786,7 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
 	det->width = MIN_WIDTH;
 	det->height = MIN_HEIGHT;
 	video->v4l2_input_status = V4L2_IN_ST_NO_SIGNAL;
+	memset(&video->perf, 0, sizeof(video->perf));
 
 	do {
 		if (tries) {
@@ -1450,6 +1477,8 @@ static int aspeed_video_start_streaming(struct vb2_queue *q,
 	struct aspeed_video *video = vb2_get_drv_priv(q);
 
 	video->sequence = 0;
+	video->perf.duration_max = 0;
+	video->perf.duration_min = 0xffffffff;
 
 	rc = aspeed_video_start_frame(video);
 	if (rc) {
@@ -1517,6 +1546,67 @@ static const struct vb2_ops aspeed_video_vb2_ops = {
 	.buf_queue =  aspeed_video_buf_queue,
 };
 
+#ifdef CONFIG_DEBUG_FS
+static int aspeed_video_debugfs_show(struct seq_file *s, void *data)
+{
+	struct aspeed_video *v = s->private;
+
+	seq_puts(s, "\n");
+
+	seq_puts(s, "Capture:\n");
+	seq_printf(s, "  %-20s:\t%s\n", "Signal",
+		   v->v4l2_input_status ? "Unlock" : "Lock");
+	seq_printf(s, "  %-20s:\t%d\n", "Width", v->pix_fmt.width);
+	seq_printf(s, "  %-20s:\t%d\n", "Height", v->pix_fmt.height);
+	seq_printf(s, "  %-20s:\t%d\n", "FRC", v->frame_rate);
+
+	seq_puts(s, "\n");
+
+	seq_puts(s, "Performance:\n");
+	seq_printf(s, "  %-20s:\t%d\n", "Frame#", v->sequence);
+	seq_printf(s, "  %-20s:\n", "Frame Duration(ms)");
+	seq_printf(s, "    %-18s:\t%d\n", "Now", v->perf.duration);
+	seq_printf(s, "    %-18s:\t%d\n", "Min", v->perf.duration_min);
+	seq_printf(s, "    %-18s:\t%d\n", "Max", v->perf.duration_max);
+	seq_printf(s, "  %-20s:\t%d\n", "FPS", 1000/(v->perf.totaltime/v->sequence));
+
+
+	return 0;
+}
+
+int aspeed_video_proc_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, aspeed_video_debugfs_show, inode->i_private);
+}
+
+static const struct file_operations aspeed_video_debugfs_ops = {
+	.owner   = THIS_MODULE,
+	.open    = aspeed_video_proc_open,
+	.read    = seq_read,
+	.llseek  = seq_lseek,
+	.release = single_release,
+};
+
+static struct dentry *debugfs_entry;
+
+static void aspeed_video_debugfs_remove(struct aspeed_video *video)
+{
+	debugfs_remove_recursive(debugfs_entry);
+}
+
+static void aspeed_video_debugfs_create(struct aspeed_video *video)
+{
+	debugfs_entry = debugfs_create_file(DEVICE_NAME, 0444, NULL, video,
+					    &aspeed_video_debugfs_ops);
+}
+#else
+static void aspeed_video_debugfs_remove(struct aspeed_video *video) { }
+static int aspeed_video_debugfs_create(struct aspeed_video *video)
+{
+	return 0;
+}
+#endif /* CONFIG_DEBUG_FS */
+
 static int aspeed_video_setup_video(struct aspeed_video *video)
 {
 	const u64 mask = ~(BIT(V4L2_JPEG_CHROMA_SUBSAMPLING_444) |
@@ -1708,6 +1798,8 @@ static int aspeed_video_probe(struct platform_device *pdev)
 		return rc;
 	}
 
+	aspeed_video_debugfs_create(video);
+
 	return 0;
 }
 
@@ -1719,6 +1811,8 @@ static int aspeed_video_remove(struct platform_device *pdev)
 
 	aspeed_video_off(video);
 
+	aspeed_video_debugfs_remove(video);
+
 	clk_unprepare(video->vclk);
 	clk_unprepare(video->eclk);
 
-- 
2.25.1

