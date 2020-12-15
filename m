Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA712DA67D
	for <lists+openbmc@lfdr.de>; Tue, 15 Dec 2020 03:58:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cw2yP0Yq7zDqFG
	for <lists+openbmc@lfdr.de>; Tue, 15 Dec 2020 13:58:37 +1100 (AEDT)
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
 header.a=rsa-sha256 header.s=thorn header.b=PgdqqfbX; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cw2vY30yCzDqQH;
 Tue, 15 Dec 2020 13:56:08 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown
 [IPv6:2600:6c44:7f:ba20:1c66:ab2d:5a3:5a9e])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 6D3E5806F8;
 Mon, 14 Dec 2020 18:46:00 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 thorn.bewilderbeest.net 6D3E5806F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1608000361;
 bh=xR8CLmhYhW7l9AVRInyVC7PTJeDKCJBNFlHVTPgUQAg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PgdqqfbXNy4kDvfuNujcew/oE4ykMgotbUQZD640u/xW+xSgkjvUrhwSy2IFYIAw5
 n26ZJP8lr5i/iRccf0ndGIWxFaV62XCB2xKQ0La7ICWRgPBR+Z6MLlLSW8xuzXdBBR
 eB3gNUYRsk91y4I4wyVfGtIY7sjP7rVJIxJC2JIQ=
From: Zev Weiss <zev@bewilderbeest.net>
To: Eddie James <eajames@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, linux-media@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] aspeed-video: add error message for unhandled interrupts
Date: Mon, 14 Dec 2020 20:45:40 -0600
Message-Id: <20201215024542.18888-2-zev@bewilderbeest.net>
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

This device seems to have a propensity for asserting interrupts that
aren't enabled -- in addition to the CAPTURE_COMPLETE and FRAME_COMPLETE
interrupts squashed in commit 65d270acb2d662c3346793663ac3a759eb4491b8,
COMP_READY has also been observed.  Adding a message diagnosing what
happened in the event of unhandled interrupt status bits should
hopefully make the debugging process simpler for any others that pop up
in the future.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/media/platform/aspeed-video.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 7d98db1d9b52..eb02043532e3 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -562,6 +562,7 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 {
 	struct aspeed_video *video = arg;
 	u32 sts = aspeed_video_read(video, VE_INTERRUPT_STATUS);
+	u32 orig_sts = sts;
 
 	/*
 	 * Resolution changed or signal was lost; reset the engine and
@@ -639,6 +640,10 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 	if (sts & VE_INTERRUPT_FRAME_COMPLETE)
 		sts &= ~VE_INTERRUPT_FRAME_COMPLETE;
 
+	if (sts)
+		dev_err_ratelimited(video->dev, "unexpected interrupt asserted:"
+				    " sts=%08x, orig_sts=%08x", sts, orig_sts);
+
 	return sts ? IRQ_NONE : IRQ_HANDLED;
 }
 
-- 
2.29.2

