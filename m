Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 989642DA686
	for <lists+openbmc@lfdr.de>; Tue, 15 Dec 2020 03:59:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cw2zv60pKzDqRF
	for <lists+openbmc@lfdr.de>; Tue, 15 Dec 2020 13:59:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=bewilderbeest.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=TW8je8Fa; 
 dkim-atps=neutral
X-Greylist: delayed 602 seconds by postgrey-1.36 at bilbo;
 Tue, 15 Dec 2020 13:56:09 AEDT
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cw2vY2wNzzDqQF;
 Tue, 15 Dec 2020 13:56:08 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown
 [IPv6:2600:6c44:7f:ba20:1c66:ab2d:5a3:5a9e])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 5E5F4806FA;
 Mon, 14 Dec 2020 18:46:01 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 thorn.bewilderbeest.net 5E5F4806FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1608000362;
 bh=iD+Q0HRdZJ6dUnWWVt4Ox1KAVYD8O2LC2E8h+jcXdtk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TW8je8Fa6vSq7loNGgeQy6xxa+1RFxe9mTStlSgYxecdpopU6M/oBenuqVeNCjTBL
 dN4oNz/ty4nN4z8lzg5DqZObramnu8OyyUBJwryJFVsCbwEUnfrJhs/jW1dyz3OLGC
 BwXvYeQLr+dugo36VnguK1G800qStEl/rY3sKNC4=
From: Zev Weiss <zev@bewilderbeest.net>
To: Eddie James <eajames@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, linux-media@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] aspeed-video: clear spurious interrupt bits
 unconditionally
Date: Mon, 14 Dec 2020 20:45:41 -0600
Message-Id: <20201215024542.18888-3-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201215024542.18888-1-zev@bewilderbeest.net>
References: <20201215024542.18888-1-zev@bewilderbeest.net>
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Zev Weiss <zev@bewilderbeest.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Instead of testing and conditionally clearing them one by one, we can
instead just unconditionally clear them all at once.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/media/platform/aspeed-video.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index eb02043532e3..218aae3be809 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -558,6 +558,14 @@ static void aspeed_video_irq_res_change(struct aspeed_video *video, ulong delay)
 	schedule_delayed_work(&video->res_work, delay);
 }
 
+/*
+ * Interrupts that we don't use but have to explicitly ignore because the
+ * hardware asserts them even when they're disabled in the VE_INTERRUPT_CTRL
+ * register.
+ */
+#define VE_SPURIOUS_IRQS \
+	(VE_INTERRUPT_CAPTURE_COMPLETE | VE_INTERRUPT_FRAME_COMPLETE)
+
 static irqreturn_t aspeed_video_irq(int irq, void *arg)
 {
 	struct aspeed_video *video = arg;
@@ -630,15 +638,8 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 			aspeed_video_start_frame(video);
 	}
 
-	/*
-	 * CAPTURE_COMPLETE and FRAME_COMPLETE interrupts come even when these
-	 * are disabled in the VE_INTERRUPT_CTRL register so clear them to
-	 * prevent unnecessary interrupt calls.
-	 */
-	if (sts & VE_INTERRUPT_CAPTURE_COMPLETE)
-		sts &= ~VE_INTERRUPT_CAPTURE_COMPLETE;
-	if (sts & VE_INTERRUPT_FRAME_COMPLETE)
-		sts &= ~VE_INTERRUPT_FRAME_COMPLETE;
+	/* Squash known bogus interrupts */
+	sts &= ~VE_SPURIOUS_IRQS;
 
 	if (sts)
 		dev_err_ratelimited(video->dev, "unexpected interrupt asserted:"
-- 
2.29.2

