Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF25E3ABE88
	for <lists+openbmc@lfdr.de>; Fri, 18 Jun 2021 00:03:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5bf53ByDz3bwp
	for <lists+openbmc@lfdr.de>; Fri, 18 Jun 2021 08:03:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=F9Tcc6TK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=F9Tcc6TK; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5bdl2lK5z3bvs;
 Fri, 18 Jun 2021 08:02:50 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 098B62B9;
 Thu, 17 Jun 2021 15:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1623967364;
 bh=FQzjrW5WNAOrVkJs/Hts+Ik3+Hqt7NokValuBbhexNw=;
 h=From:To:Cc:Subject:Date:From;
 b=F9Tcc6TKUxeEZshhBHAE4lTP1tdqkb4gjBU2K/1a+9NCGvuD0das9eNYChfQpq3Qu
 4/myI7/JUaErXS8bPiH3kt6RTx0Bl2ejRLMqUxZ+n9RbXyHRkeNxhxYjdypO1opJLT
 s1VuxP9adGTe1ztK7An+nQdgXLN1L3ZPDoKybD6M=
From: Zev Weiss <zev@bewilderbeest.net>
To: Eddie James <eajames@linux.ibm.com>
Subject: [PATCH v3] media: aspeed-video: ignore interrupts that aren't enabled
Date: Thu, 17 Jun 2021 17:02:29 -0500
Message-Id: <20210617220229.7352-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.32.0
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
 Ryan Chen <ryan_chen@aspeedtech.com>, linux-aspeed@lists.ozlabs.org,
 Zev Weiss <zev@bewilderbeest.net>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

As partially addressed in commit 65d270acb2d6 ("media: aspeed: clear
garbage interrupts"), the ASpeed video engine sometimes asserts
interrupts that the driver hasn't enabled.  In addition to the
CAPTURE_COMPLETE and FRAME_COMPLETE interrupts dealt with in that
patch, COMP_READY has also been observed.  Instead of playing
whack-a-mole with each one individually, we can instead just blanket
ignore everything we haven't explicitly enabled.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---

Changes since v2 [1]:
 - minor commit message improvements

Changes since v1 [0]:
 - dropped error message
 - switched to a blanket-ignore approach as suggested by Ryan

[0] https://lore.kernel.org/linux-arm-kernel/20201215024542.18888-1-zev@bewilderbeest.net/
[1] https://lore.kernel.org/openbmc/20210506234048.3214-1-zev@bewilderbeest.net/

 drivers/media/platform/aspeed-video.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 7bb6babdcade..77611c296a25 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -563,6 +563,12 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
 	struct aspeed_video *video = arg;
 	u32 sts = aspeed_video_read(video, VE_INTERRUPT_STATUS);
 
+	/*
+	 * Hardware sometimes asserts interrupts that we haven't actually
+	 * enabled; ignore them if so.
+	 */
+	sts &= aspeed_video_read(video, VE_INTERRUPT_CTRL);
+
 	/*
 	 * Resolution changed or signal was lost; reset the engine and
 	 * re-initialize
@@ -629,16 +635,6 @@ static irqreturn_t aspeed_video_irq(int irq, void *arg)
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
-
 	return sts ? IRQ_NONE : IRQ_HANDLED;
 }
 
-- 
2.32.0

