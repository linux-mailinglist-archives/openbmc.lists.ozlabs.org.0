Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D85072E0273
	for <lists+openbmc@lfdr.de>; Mon, 21 Dec 2020 23:23:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0DX71M3vzDqPm
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 09:23:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0DTt01nLzDqM6;
 Tue, 22 Dec 2020 09:21:53 +1100 (AEDT)
IronPort-SDR: zSNd/IsPF3T5xLWdg3tgeF7vKVyj7ZOqYGFk6mjW22NspJ2/PX9f0NdpwILjOZZ4aOq3uOEX/3
 U/tDMga4iRmA==
X-IronPort-AV: E=McAfee;i="6000,8403,9842"; a="155004939"
X-IronPort-AV: E=Sophos;i="5.78,437,1599548400"; d="scan'208";a="155004939"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2020 14:21:47 -0800
IronPort-SDR: kFcfjsqV4Pipj84NLphvf/feutzypujI19wIr2o7BwQHvoHcKKjGsLchUG81EFSNvrHwNx2BOJ
 lCy4h/germcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,437,1599548400"; d="scan'208";a="372892712"
Received: from maru.jf.intel.com ([10.54.51.77])
 by orsmga008.jf.intel.com with ESMTP; 21 Dec 2020 14:21:47 -0800
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Eddie James <eajames@linux.ibm.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 1/1] media: aspeed: fix clock handling logic
Date: Mon, 21 Dec 2020 14:32:25 -0800
Message-Id: <20201221223225.14723-2-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201221223225.14723-1-jae.hyun.yoo@linux.intel.com>
References: <20201221223225.14723-1-jae.hyun.yoo@linux.intel.com>
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
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Eddie James <eajames@linux.ibm.com>

clk: ast2600: fix reset settings for eclk and vclk

Video engine reset setting should be coupled with eclk to match it
with the setting for previous Aspeed SoCs which is defined in
clk-aspeed.c since all Aspeed SoCs are sharing a single video engine
driver. Also, reset bit 6 is defined as 'Video Engine' reset in
datasheet so it should be de-asserted when eclk is enabled. This
commit fixes the setting.

Fixes: d3d04f6c330a ("clk: Add support for AST2600 SoC")
Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
Changes since v1:
- Squashed two patches due to dependency.

 drivers/clk/clk-ast2600.c             | 4 ++--
 drivers/media/platform/aspeed-video.c | 9 ++++++---
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
index 177368cac6dd..882da16575d4 100644
--- a/drivers/clk/clk-ast2600.c
+++ b/drivers/clk/clk-ast2600.c
@@ -60,10 +60,10 @@ static void __iomem *scu_g6_base;
 static const struct aspeed_gate_data aspeed_g6_gates[] = {
 	/*				    clk rst  name		parent	 flags */
 	[ASPEED_CLK_GATE_MCLK]		= {  0, -1, "mclk-gate",	"mpll",	 CLK_IS_CRITICAL }, /* SDRAM */
-	[ASPEED_CLK_GATE_ECLK]		= {  1, -1, "eclk-gate",	"eclk",	 0 },	/* Video Engine */
+	[ASPEED_CLK_GATE_ECLK]		= {  1,  6, "eclk-gate",	"eclk",	 0 },	/* Video Engine */
 	[ASPEED_CLK_GATE_GCLK]		= {  2,  7, "gclk-gate",	NULL,	 0 },	/* 2D engine */
 	/* vclk parent - dclk/d1clk/hclk/mclk */
-	[ASPEED_CLK_GATE_VCLK]		= {  3,  6, "vclk-gate",	NULL,	 0 },	/* Video Capture */
+	[ASPEED_CLK_GATE_VCLK]		= {  3, -1, "vclk-gate",	NULL,	 0 },	/* Video Capture */
 	[ASPEED_CLK_GATE_BCLK]		= {  4,  8, "bclk-gate",	"bclk",	 0 }, /* PCIe/PCI */
 	/* From dpll */
 	[ASPEED_CLK_GATE_DCLK]		= {  5, -1, "dclk-gate",	NULL,	 CLK_IS_CRITICAL }, /* DAC */
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

