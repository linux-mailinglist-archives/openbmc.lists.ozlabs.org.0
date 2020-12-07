Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCA32D1607
	for <lists+openbmc@lfdr.de>; Mon,  7 Dec 2020 17:36:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqTTl4N0xzDqW6
	for <lists+openbmc@lfdr.de>; Tue,  8 Dec 2020 03:36:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqTPq3XDfzDqNd;
 Tue,  8 Dec 2020 03:33:03 +1100 (AEDT)
IronPort-SDR: irTWM7Adaz7c6VfqU7hx6bN2nes3G4Y0eycZXxkFwgR8IZAof6z4g2LSGpB6ndVf5LLt42f4uw
 o1LOUIU6jHDA==
X-IronPort-AV: E=McAfee;i="6000,8403,9827"; a="161495853"
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; d="scan'208";a="161495853"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 08:33:00 -0800
IronPort-SDR: WlQxwyB0V1M4V9527ULq+RvgRgQS09YAl43Vzzkj6FL61An2RmNcjDfqJCsjw3KJnXK0qrs5MW
 vWCLkKGF53Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; d="scan'208";a="317246242"
Received: from maru.jf.intel.com ([10.54.51.77])
 by fmsmga008.fm.intel.com with ESMTP; 07 Dec 2020 08:33:00 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Eddie James <eajames@linux.ibm.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/2] media: aspeed: fix clock handling logic
Date: Mon,  7 Dec 2020 08:42:40 -0800
Message-Id: <20201207164240.15436-3-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201207164240.15436-1-jae.hyun.yoo@linux.intel.com>
References: <20201207164240.15436-1-jae.hyun.yoo@linux.intel.com>
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
 linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Video engine uses eclk and vclk for its clock sources and its reset
control is coupled with eclk so the current clock enabling sequence works
like below.

 Enable eclk
 De-assert Video Engine reset
 10ms delay
 Enable vclk

It introduces improper reset on the Video Engine hardware and eventually
the hardware generates unexpected DMA memory transfers that can corrupt
memory region in random and sporadic patterns. This issue is observed
very rarely on some specific AST2500 SoCs but it causes a critical
kernel panic with making a various shape of signature so it's extremely
hard to debug. Moreover, the issue is observed even when the video
engine is not actively used because udevd turns on the video engine
hardware for a short time to make a query in every boot.

To fix this issue, this commit changes the clock handling logic to make
the reset de-assertion triggered after enabling both eclk and vclk. Also,
it adds clk_unprepare call for a case when probe fails.

Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
---
 drivers/media/platform/aspeed-video.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index c46a79eace98..db072ff2df70 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -514,8 +514,8 @@ static void aspeed_video_off(struct aspeed_video *video)
 	aspeed_video_write(video, VE_INTERRUPT_STATUS, 0xffffffff);
 
 	/* Turn off the relevant clocks */
-	clk_disable(video->vclk);
 	clk_disable(video->eclk);
+	clk_disable(video->vclk);
 
 	clear_bit(VIDEO_CLOCKS_ON, &video->flags);
 }
@@ -526,8 +526,8 @@ static void aspeed_video_on(struct aspeed_video *video)
 		return;
 
 	/* Turn on the relevant clocks */
-	clk_enable(video->eclk);
 	clk_enable(video->vclk);
+	clk_enable(video->eclk);
 
 	set_bit(VIDEO_CLOCKS_ON, &video->flags);
 }
@@ -1719,8 +1719,11 @@ static int aspeed_video_probe(struct platform_device *pdev)
 		return rc;
 
 	rc = aspeed_video_setup_video(video);
-	if (rc)
+	if (rc) {
+		clk_unprepare(video->vclk);
+		clk_unprepare(video->eclk);
 		return rc;
+	}
 
 	return 0;
 }
-- 
2.17.1

