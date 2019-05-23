Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBB228D47
	for <lists+openbmc@lfdr.de>; Fri, 24 May 2019 00:36:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45949s2pbqzDqbh
	for <lists+openbmc@lfdr.de>; Fri, 24 May 2019 08:36:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45946S4Vl9zDqWb
 for <openbmc@lists.ozlabs.org>; Fri, 24 May 2019 08:33:52 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 May 2019 15:33:50 -0700
X-ExtLoop1: 1
Received: from maru.jf.intel.com ([10.54.51.75])
 by fmsmga008.fm.intel.com with ESMTP; 23 May 2019 15:33:49 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH dev-5.1 4/4] media: aspeed: add a workaround to fix a silicon
 bug
Date: Thu, 23 May 2019 15:33:29 -0700
Message-Id: <20190523223329.6408-5-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190523223329.6408-1-jae.hyun.yoo@linux.intel.com>
References: <20190523223329.6408-1-jae.hyun.yoo@linux.intel.com>
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
Cc: openbmc@lists.ozlabs.org, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

AST2500 silicon revision A1 and A2 have a silicon bug which causes
extremly long capturing time on specific resolutions (1680 width).
To fix the bug, this commit adjusts the capturing window register
setting to 1728 if detected width is 1680. The compression window
register setting will be kept as the original width so output
result will be the same.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 drivers/media/platform/aspeed-video.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index da20e93f58d3..c2d4a2e6f20f 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -826,8 +826,27 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
 	struct v4l2_bt_timings *act = &video->active_timings;
 	unsigned int size = act->width * act->height;
 
+	/* Set capture/compression frame sizes */
 	aspeed_video_calc_compressed_size(video, size);
 
+	if (video->active_timings.width == 1680) {
+		/*
+		 * This is a workaround to fix a silicon bug on A1 and A2
+		 * revisions. Since it doesn't break capturing operation on A0
+		 * revision, use it for all revisions without checking the
+		 * revision ID.
+		 */
+		aspeed_video_write(video, VE_CAP_WINDOW,
+				   1728 << 16 | act->height);
+		size += (1728 - 1680) * video->active_timings.height;
+	} else {
+		aspeed_video_write(video, VE_CAP_WINDOW,
+				   act->width << 16 | act->height);
+	}
+	aspeed_video_write(video, VE_COMP_WINDOW,
+			   act->width << 16 | act->height);
+	aspeed_video_write(video, VE_SRC_SCANLINE_OFFSET, act->width * 4);
+
 	/* Don't use direct mode below 1024 x 768 (irqs don't fire) */
 	if (size < DIRECT_FETCH_THRESHOLD) {
 		aspeed_video_write(video, VE_TGS_0,
@@ -844,13 +863,6 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
 		aspeed_video_update(video, VE_CTRL, 0, VE_CTRL_DIRECT_FETCH);
 	}
 
-	/* Set capture/compression frame sizes */
-	aspeed_video_write(video, VE_CAP_WINDOW,
-			   act->width << 16 | act->height);
-	aspeed_video_write(video, VE_COMP_WINDOW,
-			   act->width << 16 | act->height);
-	aspeed_video_write(video, VE_SRC_SCANLINE_OFFSET, act->width * 4);
-
 	size *= 4;
 
 	if (size == video->srcs[0].size / 2) {
-- 
2.21.0

