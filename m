Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C11E10EB4
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 23:45:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vX4b01k8zDqHP
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 07:45:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vX1g36Q0zDqHP
 for <openbmc@lists.ozlabs.org>; Thu,  2 May 2019 07:42:47 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 May 2019 14:42:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,419,1549958400"; d="scan'208";a="136063319"
Received: from maru.jf.intel.com ([10.54.51.75])
 by orsmga007.jf.intel.com with ESMTP; 01 May 2019 14:42:43 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 dev-5.0 3/4] media: aspeed: remove checking of
 VE_INTERRUPT_CAPTURE_COMPLETE
Date: Wed,  1 May 2019 14:37:49 -0700
Message-Id: <20190501213750.28751-4-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190501213750.28751-1-jae.hyun.yoo@linux.intel.com>
References: <20190501213750.28751-1-jae.hyun.yoo@linux.intel.com>
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

VE_INTERRUPT_CAPTURE_COMPLETE and VE_INTERRUPT_COMP_COMPLETE are
not set at the same time but the current interrupt handling
mechanism of this driver doesn't clear the interrupt flag until
both two are set, and this behavior causes unnecessary interrupt
handler calls. In fact, this driver provides JPEG format only so
taking care of the VE_INTERRUPT_COMP_COMPLETE is enough for getting
compressed image frame so this commit gets rid of the
VE_INTERRUPT_CAPTURE_COMPLETE checking logic to simplify the logic.
Handling of VE_INTERRUPT_CAPTURE_COMPLETE could be added back later
when it's actually needed.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Reviewed-by: Eddie James <eajames@linux.ibm.com>
---
Changes since v1:
 None

 drivers/media/platform/aspeed-video.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 429f676f9dea..77c209a472ca 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -463,8 +463,7 @@ static int aspeed_video_start_frame(struct aspeed_video *video)
 	aspeed_video_write(video, VE_COMP_ADDR, addr);
 
 	aspeed_video_update(video, VE_INTERRUPT_CTRL, 0,
-			    VE_INTERRUPT_COMP_COMPLETE |
-			    VE_INTERRUPT_CAPTURE_COMPLETE);
+			    VE_INTERRUPT_COMP_COMPLETE);
 
 	aspeed_video_update(video, VE_SEQ_CTRL, 0,
 			    VE_SEQ_CTRL_TRIG_CAPTURE | VE_SEQ_CTRL_TRIG_COMP);
@@ -570,8 +569,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 		}
 	}
 
-	if ((sts & VE_INTERRUPT_COMP_COMPLETE) &&
-	    (sts & VE_INTERRUPT_CAPTURE_COMPLETE)) {
+	if (sts & VE_INTERRUPT_COMP_COMPLETE) {
 		struct aspeed_video_buffer *buf;
 		u32 frame_size = aspeed_video_read(video,
 						   VE_OFFSET_COMP_STREAM);
@@ -600,11 +598,9 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 				    VE_SEQ_CTRL_FORCE_IDLE |
 				    VE_SEQ_CTRL_TRIG_COMP, 0);
 		aspeed_video_update(video, VE_INTERRUPT_CTRL,
-				    VE_INTERRUPT_COMP_COMPLETE |
-				    VE_INTERRUPT_CAPTURE_COMPLETE, 0);
+				    VE_INTERRUPT_COMP_COMPLETE, 0);
 		aspeed_video_write(video, VE_INTERRUPT_STATUS,
-				   VE_INTERRUPT_COMP_COMPLETE |
-				   VE_INTERRUPT_CAPTURE_COMPLETE);
+				   VE_INTERRUPT_COMP_COMPLETE);
 
 		if (test_bit(VIDEO_STREAMING, &video->flags) && buf)
 			aspeed_video_start_frame(video);
-- 
2.21.0

