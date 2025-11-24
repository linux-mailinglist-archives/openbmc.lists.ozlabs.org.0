Return-Path: <openbmc+bounces-936-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC9DC7EDEF
	for <lists+openbmc@lfdr.de>; Mon, 24 Nov 2025 04:05:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dF9gd5NWYz2yvN;
	Mon, 24 Nov 2025 14:05:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763953549;
	cv=none; b=DZH7TKE4tv+IdY7JYIC2wWYHNgtQ7SAfnio2jmVtcnwZ9vVUUcRCFp3UFTRDOqTPrHa4hR0oKU5TWQD9QS2KxCaKvRsx8DsKa0HPQ61V41T56ZK8k+O5tTK2qsOEi4A6yrX2u0AF6ilFmFccFayfbtQnbrJp90jV9pUf32EMekYMO0PxGeJWPXQOTlYikdcD9C+vl2mhrgysIRzkrpfpgLSMuqxE0IaMj7nbgkA3a1H+KJEfDe2fgebjILdZvnMTt8bfbvnLND4pVqoMlpnEaz44MURPX5KyfuQzbpABC3gey5LArxdmDOBAZd/E1X1HOCganNh5lzkbSIEwmWhcew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763953549; c=relaxed/relaxed;
	bh=Mc6O4SdjGVe0glDr2dRtnu/v/hHIP/v2O9TVaWZr76U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=eMb4phgtbakAIVcT5N8P+oCNDF/eYr/EcYoELgN7L9BWqbhCZt2dE9w6idj5QUscncCaZv7HfhDvWMXmqYH6+67VWphrzcRdfOLy+cDMQoBj5O2tba9N8Evob65tz8t2+2wza0QdFtH6pwNS+eIhKtu+levoTWRKkToHkO+0wHOdc+y5wMqgv1yNA23PbOL8mcHV/htdXDjsKxGcLlmYpOM6Wz63006jlHBcuyUXqcvBDIOMpZQejHn6qN13WetRifLexMR9FasmrjZjtN1IU4hAT9SBGT7zTmpn0+qUv/4UwLcBn6eq2YUT8bdww9mk7bPNgEvdvorGfPsQzQ6qgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dF9gc4MBhz2xS2;
	Mon, 24 Nov 2025 14:05:47 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 24 Nov
 2025 11:05:30 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 24 Nov 2025 11:05:30 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
Date: Mon, 24 Nov 2025 11:05:14 +0800
Subject: [PATCH] media: aspeed: Fix dram hang at res-change
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251124-video_dram_reset-v1-1-9d37229e4ec5@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIAGnLI2kC/x3MQQqAIBBA0avErBNSs6CrRITlWLMoYwwJwrsnL
 d/i/xciMmGEoXqBMVGkcBbIuoJ1t+eGglwxqEYZKVUrEjkMs2N7zIwRb7EaLX23WNNrDyW7GD0
 9/3Kccv4AB0H6jmIAAAA=
X-Change-ID: 20251124-video_dram_reset-c531f6ba573f
To: Eddie James <eajames@linux.ibm.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-media@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, Jammy Huang <jammy_huang@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763953530; l=3275;
 i=jammy_huang@aspeedtech.com; s=20251124; h=from:subject:message-id;
 bh=T6tPkI8Yhq/QCiReLdboMNyc54/4lLjHBMvqDCJv39c=;
 b=eLjDgw5bFeCqwi/if6MHl7scB8sgk6NJB2zQCtHChWUuSG7CfiFUfK7iM21/k5xMbau7Yqt2i
 EqdhlEqPRi6BjXdvgWfAM/l/O1kQmhA1OYr/dMLO9HPhxxrSpxJPXO8
X-Developer-Key: i=jammy_huang@aspeedtech.com; a=ed25519;
 pk=E5YwijeJZZcuDR6srvwNlXrNHvLxwipUg3Mb/xxUF9o=
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Dram hang could happen in the steps below:
1. start capture/compression
2. out-of-lock watchdog raise irq because of res-change.
3. aspeed_video_irq_res_change do clk-off

At step3, capture/compression could be not accomplished yet. If clk-off
in the middle of video operation, dram controller could hang at ast2500.

Use reset rather than clk-off/on to avoid this problem.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
On Aspeed KVM testing, we found it could lead to dram-hang if
res-change. Although the issue rarely happens, the impact is serious.

To avoid this issue, we use reset only rathar than clk-off/on in
res-change to avoid this issue.
---
 drivers/media/platform/aspeed/aspeed-video.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index b83e432452..41cb96f601 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -26,6 +26,7 @@
 #include <linux/workqueue.h>
 #include <linux/debugfs.h>
 #include <linux/ktime.h>
+#include <linux/reset.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
 #include <media/v4l2-ctrls.h>
@@ -310,6 +311,7 @@ struct aspeed_video {
 	void __iomem *base;
 	struct clk *eclk;
 	struct clk *vclk;
+	struct reset_control *reset;
 
 	struct device *dev;
 	struct v4l2_ctrl_handler ctrl_handler;
@@ -720,6 +722,13 @@ static void aspeed_video_on(struct aspeed_video *video)
 	set_bit(VIDEO_CLOCKS_ON, &video->flags);
 }
 
+static void aspeed_video_reset(struct aspeed_video *v)
+{
+	reset_control_assert(v->reset);
+	usleep_range(100, 150);
+	reset_control_deassert(v->reset);
+}
+
 static void aspeed_video_bufs_done(struct aspeed_video *video,
 				   enum vb2_buffer_state state)
 {
@@ -742,7 +751,9 @@ static void aspeed_video_irq_res_change(struct aspeed_video *video, ulong delay)
 
 	video->v4l2_input_status = V4L2_IN_ST_NO_SIGNAL;
 
-	aspeed_video_off(video);
+	aspeed_video_write(video, VE_INTERRUPT_CTRL, 0);
+	aspeed_video_write(video, VE_INTERRUPT_STATUS, 0xffffffff);
+	aspeed_video_reset(video);
 	aspeed_video_bufs_done(video, VB2_BUF_STATE_ERROR);
 
 	schedule_delayed_work(&video->res_work, delay);
@@ -1984,8 +1995,7 @@ static void aspeed_video_stop_streaming(struct vb2_queue *q)
 		 * Need to force stop any DMA and try and get HW into a good
 		 * state for future calls to start streaming again.
 		 */
-		aspeed_video_off(video);
-		aspeed_video_on(video);
+		aspeed_video_reset(video);
 
 		aspeed_video_init_regs(video);
 
@@ -2230,6 +2240,12 @@ static int aspeed_video_init(struct aspeed_video *video)
 	}
 	dev_info(video->dev, "irq %d\n", irq);
 
+	video->reset = devm_reset_control_get(dev, NULL);
+	if (IS_ERR(video->reset)) {
+		dev_err(dev, "Unable to get reset\n");
+		return PTR_ERR(video->reset);
+	}
+
 	video->eclk = devm_clk_get(dev, "eclk");
 	if (IS_ERR(video->eclk)) {
 		dev_err(dev, "Unable to get ECLK\n");

---
base-commit: ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
change-id: 20251124-video_dram_reset-c531f6ba573f

Best regards,
-- 
Jammy Huang <jammy_huang@aspeedtech.com>


