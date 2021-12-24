Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBC147EA4B
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 02:30:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JKqHm1jTjz2yfc
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 12:30:12 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKqGY5N28z2y0B;
 Fri, 24 Dec 2021 12:29:07 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1BO1M74X007689;
 Fri, 24 Dec 2021 09:22:08 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 24 Dec 2021 09:27:37 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <hverkuil-cisco@xs4all.nl>, <sakari.ailus@linux.intel.com>,
 <gregkh@linuxfoundation.org>, <eajames@linux.ibm.com>,
 <mchehab@kernel.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
 <linux-media@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 4/4] media: aspeed: Extend debug message
Date: Fri, 24 Dec 2021 09:27:38 +0800
Message-ID: <20211224012738.1551-5-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211224012738.1551-1-jammy_huang@aspeedtech.com>
References: <20211224012738.1551-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1BO1M74X007689
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

updated as below:

Capture:
  Mode                : Direct fetch
  VGA bpp mode        : 32
  Signal              : lock
  Width               : 1920
  Height              : 1080
  FRC                 : 0

Compression:
  Format              : JPEG
  Subsampling         : 444
  Quality             : 4

Performance:
  Frame#              : 4
  Frame Duration(ms)  :
    Now               : 22
    Min               : 21
    Max               : 22
  FPS                 : 45

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
v8:
  - no update
v7:
  - update debugfs message. Aspeed-jpeg's compression parameters only shown
    if it's aspeed jpeg now
v6:
  - no update
v5:
  - no update
v4:
  - update debugfs log
v3:
  - no update
v2:
  - update commit message
---
 drivers/media/platform/aspeed-video.c | 35 +++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index c0cfcf98659d..b388bc56ce81 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -1835,10 +1835,29 @@ static const struct vb2_ops aspeed_video_vb2_ops = {
 static int aspeed_video_debugfs_show(struct seq_file *s, void *data)
 {
 	struct aspeed_video *v = s->private;
+	u32 val08;
 
 	seq_puts(s, "\n");
 
 	seq_puts(s, "Capture:\n");
+	val08 = aspeed_video_read(v, VE_CTRL);
+	if (FIELD_GET(VE_CTRL_DIRECT_FETCH, val08)) {
+		seq_printf(s, "  %-20s:\tDirect fetch\n", "Mode");
+		seq_printf(s, "  %-20s:\t%s\n", "VGA bpp mode",
+			   FIELD_GET(VE_CTRL_INT_DE, val08) ? "16" : "32");
+	} else {
+		seq_printf(s, "  %-20s:\tSync\n", "Mode");
+		seq_printf(s, "  %-20s:\t%s\n", "Video source",
+			   FIELD_GET(VE_CTRL_SOURCE, val08) ?
+			   "external" : "internal");
+		seq_printf(s, "  %-20s:\t%s\n", "DE source",
+			   FIELD_GET(VE_CTRL_INT_DE, val08) ?
+			   "internal" : "external");
+		seq_printf(s, "  %-20s:\t%s\n", "Cursor overlay",
+			   FIELD_GET(VE_CTRL_AUTO_OR_CURSOR, val08) ?
+			   "Without" : "With");
+	}
+
 	seq_printf(s, "  %-20s:\t%s\n", "Signal",
 		   v->v4l2_input_status ? "Unlock" : "Lock");
 	seq_printf(s, "  %-20s:\t%d\n", "Width", v->pix_fmt.width);
@@ -1847,6 +1866,22 @@ static int aspeed_video_debugfs_show(struct seq_file *s, void *data)
 
 	seq_puts(s, "\n");
 
+	seq_puts(s, "Compression:\n");
+	seq_printf(s, "  %-20s:\t%s\n", "Format", format_str[v->format]);
+	seq_printf(s, "  %-20s:\t%s\n", "Subsampling",
+		   v->yuv420 ? "420" : "444");
+	seq_printf(s, "  %-20s:\t%d\n", "Quality", v->jpeg_quality);
+	if (v->format == VIDEO_FMT_ASPEED) {
+		seq_printf(s, "  %-20s:\t%s\n", "HQ Mode",
+			   v->hq_mode ? "on" : "off");
+		seq_printf(s, "  %-20s:\t%d\n", "HQ Quality",
+			   v->hq_mode ? v->jpeg_hq_quality : 0);
+		seq_printf(s, "  %-20s:\t%s\n", "Coding Scheme",
+			   compress_scheme_str[v->compression_scheme]);
+	}
+
+	seq_puts(s, "\n");
+
 	seq_puts(s, "Performance:\n");
 	seq_printf(s, "  %-20s:\t%d\n", "Frame#", v->sequence);
 	seq_printf(s, "  %-20s:\n", "Frame Duration(ms)");
-- 
2.25.1

