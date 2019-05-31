Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA58C316C2
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 23:49:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Fym41J3SzDqcx
	for <lists+openbmc@lfdr.de>; Sat,  1 Jun 2019 07:49:56 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FyjN6Lw2zDqY2
 for <openbmc@lists.ozlabs.org>; Sat,  1 Jun 2019 07:47:36 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 May 2019 14:47:20 -0700
X-ExtLoop1: 1
Received: from maru.jf.intel.com ([10.54.51.75])
 by orsmga001.jf.intel.com with ESMTP; 31 May 2019 14:47:20 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 dev-5.1 1/3] media: aspeed: remove source buffer allocation
 before mode detection
Date: Fri, 31 May 2019 14:47:14 -0700
Message-Id: <20190531214716.12118-2-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190531214716.12118-1-jae.hyun.yoo@linux.intel.com>
References: <20190531214716.12118-1-jae.hyun.yoo@linux.intel.com>
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

Mode detection doesn't require source buffer allocation so this
commit removes that.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Reviewed-by: Eddie James <eajames@linux.ibm.com>
Tested-by: Eddie James <eajames@linux.ibm.com>
---
v1 -> v2:
- Corrected re-allocation logic of source buffers.

 drivers/media/platform/aspeed-video.c | 37 ++++-----------------------
 1 file changed, 5 insertions(+), 32 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 1bb863b32836..fed51fd22ce2 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -733,27 +733,6 @@ static void aspeed_video_get_resolution(struct aspeed_video *video)
 	det->height = MIN_HEIGHT;
 	video->v4l2_input_status = V4L2_IN_ST_NO_SIGNAL;
 
-	/*
-	 * Since we need max buffer size for detection, free the second source
-	 * buffer first.
-	 */
-	if (video->srcs[1].size)
-		aspeed_video_free_buf(video, &video->srcs[1]);
-
-	if (video->srcs[0].size < VE_MAX_SRC_BUFFER_SIZE) {
-		if (video->srcs[0].size)
-			aspeed_video_free_buf(video, &video->srcs[0]);
-
-		if (!aspeed_video_alloc_buf(video, &video->srcs[0],
-					    VE_MAX_SRC_BUFFER_SIZE)) {
-			dev_err(video->dev,
-				"Failed to allocate source buffers\n");
-			return;
-		}
-	}
-
-	aspeed_video_write(video, VE_SRC0_ADDR, video->srcs[0].dma);
-
 	do {
 		if (tries) {
 			set_current_state(TASK_INTERRUPTIBLE);
@@ -873,20 +852,14 @@ static void aspeed_video_set_resolution(struct aspeed_video *video)
 
 	size *= 4;
 
-	if (size == video->srcs[0].size / 2) {
-		aspeed_video_write(video, VE_SRC1_ADDR,
-				   video->srcs[0].dma + size);
-	} else if (size == video->srcs[0].size) {
-		if (!aspeed_video_alloc_buf(video, &video->srcs[1], size))
-			goto err_mem;
-
-		aspeed_video_write(video, VE_SRC1_ADDR, video->srcs[1].dma);
-	} else {
-		aspeed_video_free_buf(video, &video->srcs[0]);
+	if (size != video->srcs[0].size) {
+		if (video->srcs[0].size)
+			aspeed_video_free_buf(video, &video->srcs[0]);
+		if (video->srcs[1].size)
+			aspeed_video_free_buf(video, &video->srcs[1]);
 
 		if (!aspeed_video_alloc_buf(video, &video->srcs[0], size))
 			goto err_mem;
-
 		if (!aspeed_video_alloc_buf(video, &video->srcs[1], size))
 			goto err_mem;
 
-- 
2.21.0

