Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C81C316C1
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 23:49:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FylN64gYzDqZ9
	for <lists+openbmc@lfdr.de>; Sat,  1 Jun 2019 07:49:20 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FyjN3mQwzDqXr
 for <openbmc@lists.ozlabs.org>; Sat,  1 Jun 2019 07:47:36 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 May 2019 14:47:21 -0700
X-ExtLoop1: 1
Received: from maru.jf.intel.com ([10.54.51.75])
 by orsmga001.jf.intel.com with ESMTP; 31 May 2019 14:47:21 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 dev-5.1 2/3] media: aspeed: use different delays for
 triggering VE H/W reset
Date: Fri, 31 May 2019 14:47:15 -0700
Message-Id: <20190531214716.12118-3-jae.hyun.yoo@linux.intel.com>
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

In case of watchdog timeout detected while doing mode detection,
it's better triggering video engine hardware reset immediately so
this commit fixes code for the case. Other than the case, it will
trigger video engine hardware reset after RESOLUTION_CHANGE_DELAY.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Reviewed-by: Eddie James <eajames@linux.ibm.com>
Tested-by: Eddie James <eajames@linux.ibm.com>
---
v1 -> v2:
 None.

 drivers/media/platform/aspeed-video.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index fed51fd22ce2..67d6380d4ef3 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -522,7 +522,7 @@ static void aspeed_video_bufs_done(struct aspeed_video *video,
 	spin_unlock_irqrestore(&video->lock, flags);
 }
 
-static void aspeed_video_irq_res_change(struct aspeed_video *video)
+static void aspeed_video_irq_res_change(struct aspeed_video *video, ulong delay)
 {
 	spin_lock(&video->lock);
 	dev_dbg(video->dev, "Resolution changed; resetting\n");
@@ -534,7 +534,7 @@ static void aspeed_video_irq_res_change(struct aspeed_video *video)
 	spin_unlock(&video->lock);
 	aspeed_video_bufs_done(video, VB2_BUF_STATE_ERROR);
 
-	schedule_delayed_work(&video->res_work, RESOLUTION_CHANGE_DELAY);
+	schedule_delayed_work(&video->res_work, delay);
 }
 
 static irqreturn_t aspeed_video_irq(int irq, void *arg)
@@ -547,7 +547,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 	 * re-initialize
 	 */
 	if (sts & VE_INTERRUPT_MODE_DETECT_WD) {
-		aspeed_video_irq_res_change(video);
+		aspeed_video_irq_res_change(video, 0);
 		return IRQ_HANDLED;
 	}
 
@@ -565,7 +565,8 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 			 * Signal acquired while NOT doing resolution
 			 * detection; reset the engine and re-initialize
 			 */
-			aspeed_video_irq_res_change(video);
+			aspeed_video_irq_res_change(video,
+						    RESOLUTION_CHANGE_DELAY);
 			return IRQ_HANDLED;
 		}
 	}
-- 
2.21.0

