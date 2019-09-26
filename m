Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D838BFB52
	for <lists+openbmc@lfdr.de>; Fri, 27 Sep 2019 00:28:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fV2G51Q5zDqys
	for <lists+openbmc@lfdr.de>; Fri, 27 Sep 2019 08:28:38 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fV1N0Qp2zDqxf;
 Fri, 27 Sep 2019 08:27:50 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Sep 2019 15:27:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,553,1559545200"; d="scan'208";a="192972129"
Received: from maru.jf.intel.com ([10.54.51.77])
 by orsmga003.jf.intel.com with ESMTP; 26 Sep 2019 15:27:46 -0700
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
To: Eddie James <eajames@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] media: aspeed: clear garbage interrupts
Date: Thu, 26 Sep 2019 15:27:43 -0700
Message-Id: <20190926222743.18546-1-jae.hyun.yoo@linux.intel.com>
X-Mailer: git-send-email 2.23.0
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
Cc: openbmc@lists.ozlabs.org, Jae Hyun Yoo <jae.hyun.yoo@intel.com>,
 linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Jae Hyun Yoo <jae.hyun.yoo@intel.com>

CAPTURE_COMPLETE and FRAME_COMPLETE interrupts come even when these
are disabled in the VE_INTERRUPT_CTRL register and eventually this
behavior causes disabling irq itself like below:

[10055.108784] irq 23: nobody cared (try booting with the "irqpoll" option)
[10055.115525] CPU: 0 PID: 331 Comm: swampd Tainted: G        W         5.3.0-4fde000-dirty-d683e2e #1
[10055.124565] Hardware name: Generic DT based system
[10055.129355] Backtrace:
[10055.131854] [<80107d7c>] (dump_backtrace) from [<80107fb0>] (show_stack+0x20/0x24)
[10055.139431]  r7:00000017 r6:00000001 r5:00000000 r4:9d51dc00
[10055.145120] [<80107f90>] (show_stack) from [<8074bf50>] (dump_stack+0x20/0x28)
[10055.152361] [<8074bf30>] (dump_stack) from [<80150ffc>] (__report_bad_irq+0x40/0xc0)
[10055.160109] [<80150fbc>] (__report_bad_irq) from [<80150f2c>] (note_interrupt+0x23c/0x294)
[10055.168374]  r9:015b6e60 r8:00000000 r7:00000017 r6:00000001 r5:00000000 r4:9d51dc00
[10055.176136] [<80150cf0>] (note_interrupt) from [<8014df1c>] (handle_irq_event_percpu+0x88/0x98)
[10055.184835]  r10:7eff7910 r9:015b6e60 r8:00000000 r7:9d417600 r6:00000001 r5:00000002
[10055.192657]  r4:9d51dc00 r3:00000000
[10055.196248] [<8014de94>] (handle_irq_event_percpu) from [<8014df64>] (handle_irq_event+0x38/0x4c)
[10055.205113]  r5:80b56d50 r4:9d51dc00
[10055.208697] [<8014df2c>] (handle_irq_event) from [<80151f1c>] (handle_level_irq+0xbc/0x12c)
[10055.217037]  r5:80b56d50 r4:9d51dc00
[10055.220623] [<80151e60>] (handle_level_irq) from [<8014d4b8>] (generic_handle_irq+0x30/0x44)
[10055.229052]  r5:80b56d50 r4:00000017
[10055.232648] [<8014d488>] (generic_handle_irq) from [<8014d524>] (__handle_domain_irq+0x58/0xb4)
[10055.241356] [<8014d4cc>] (__handle_domain_irq) from [<801021e4>] (avic_handle_irq+0x68/0x70)
[10055.249797]  r9:015b6e60 r8:00c5387d r7:00c5387d r6:ffffffff r5:9dd33fb0 r4:9d402380
[10055.257539] [<8010217c>] (avic_handle_irq) from [<80101e34>] (__irq_usr+0x54/0x80)
[10055.265105] Exception stack(0x9dd33fb0 to 0x9dd33ff8)
[10055.270152] 3fa0:                                     015d0530 00000000 00000000 015d0538
[10055.278328] 3fc0: 015d0530 015b6e60 00000000 00000000 0052c5d0 015b6e60 7eff7910 7eff7918
[10055.286496] 3fe0: 76ce5614 7eff7908 0050e2f4 76a3a08c 20000010 ffffffff
[10055.293104]  r5:20000010 r4:76a3a08c
[10055.296673] handlers:
[10055.298967] [<79f218a5>] irq_default_primary_handler threaded [<1de88514>] aspeed_video_irq
[10055.307344] Disabling IRQ #23

To fix this issue, this commit makes the interrupt handler clear
these garbage interrupts. This driver enables and uses only
COMP_COMPLETE interrupt instead for frame handling.

Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@intel.com>
---
 drivers/media/platform/aspeed-video.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index eb12f3793062..e842f99d20a9 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -606,6 +606,16 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 			aspeed_video_start_frame(video);
 	}
 
+	/*
+	 * CAPTURE_COMPLETE and FRAME_COMPLETE interrupts come even when these
+	 * are disabled in the VE_INTERRUPT_CTRL register so clear them to
+	 * prevent unnecessary interrupt calls.
+	 */
+	if (sts & VE_INTERRUPT_CAPTURE_COMPLETE)
+		sts &= ~VE_INTERRUPT_CAPTURE_COMPLETE;
+	if (sts & VE_INTERRUPT_FRAME_COMPLETE)
+		sts &= ~VE_INTERRUPT_FRAME_COMPLETE;
+
 	return sts ? IRQ_NONE : IRQ_HANDLED;
 }
 
-- 
2.23.0

