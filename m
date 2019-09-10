Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3A0AF1B4
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 21:10:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SZNf5jM6zF1g8
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2019 05:10:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SZLl4bdtzF1SP;
 Wed, 11 Sep 2019 05:08:31 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Sep 2019 12:08:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,490,1559545200"; d="scan'208";a="200347633"
Received: from maru.jf.intel.com ([10.54.51.77])
 by fmsmga001.fm.intel.com with ESMTP; 10 Sep 2019 12:08:25 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Eddie James <eajames@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH -next 1/2] media: aspeed: refine hsync/vsync polarity setting
 logic
Date: Tue, 10 Sep 2019 12:07:55 -0700
Message-Id: <20190910190756.31432-2-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190910190756.31432-1-jae.hyun.yoo@linux.intel.com>
References: <20190910190756.31432-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: openbmc@lists.ozlabs.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This commit refines hsync/vsync polarity setting logic by making
also clearing register bits possible based on probed sync state
accordingly.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 drivers/media/platform/aspeed-video.c | 43 +++++++++++++--------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index eb12f3793062..8f77079da55a 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -614,7 +614,7 @@ static void aspeed_video_check_and_set_polarity(struct aspeed_video *video)
 	int i;
 	int hsync_counter = 0;
 	int vsync_counter = 0;
-	u32 sts;
+	u32 sts, ctrl;
 
 	for (i = 0; i < NUM_POLARITY_CHECKS; ++i) {
 		sts = aspeed_video_read(video, VE_MODE_DETECT_STATUS);
@@ -629,30 +629,29 @@ static void aspeed_video_check_and_set_polarity(struct aspeed_video *video)
 			hsync_counter++;
 	}
 
-	if (hsync_counter < 0 || vsync_counter < 0) {
-		u32 ctrl = 0;
+	ctrl = aspeed_video_read(video, VE_CTRL);
 
-		if (hsync_counter < 0) {
-			ctrl = VE_CTRL_HSYNC_POL;
-			video->detected_timings.polarities &=
-				~V4L2_DV_HSYNC_POS_POL;
-		} else {
-			video->detected_timings.polarities |=
-				V4L2_DV_HSYNC_POS_POL;
-		}
-
-		if (vsync_counter < 0) {
-			ctrl = VE_CTRL_VSYNC_POL;
-			video->detected_timings.polarities &=
-				~V4L2_DV_VSYNC_POS_POL;
-		} else {
-			video->detected_timings.polarities |=
-				V4L2_DV_VSYNC_POS_POL;
-		}
+	if (hsync_counter < 0) {
+		ctrl |= VE_CTRL_HSYNC_POL;
+		video->detected_timings.polarities &=
+			~V4L2_DV_HSYNC_POS_POL;
+	} else {
+		ctrl &= ~VE_CTRL_HSYNC_POL;
+		video->detected_timings.polarities |=
+			V4L2_DV_HSYNC_POS_POL;
+	}
 
-		if (ctrl)
-			aspeed_video_update(video, VE_CTRL, 0, ctrl);
+	if (vsync_counter < 0) {
+		ctrl |= VE_CTRL_VSYNC_POL;
+		video->detected_timings.polarities &=
+			~V4L2_DV_VSYNC_POS_POL;
+	} else {
+		ctrl &= ~VE_CTRL_VSYNC_POL;
+		video->detected_timings.polarities |=
+			V4L2_DV_VSYNC_POS_POL;
 	}
+
+	aspeed_video_write(video, VE_CTRL, ctrl);
 }
 
 static bool aspeed_video_alloc_buf(struct aspeed_video *video,
-- 
2.23.0

