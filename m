Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FCB2DA690
	for <lists+openbmc@lfdr.de>; Tue, 15 Dec 2020 04:01:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cw31q3KYTzDqQN
	for <lists+openbmc@lfdr.de>; Tue, 15 Dec 2020 14:01:35 +1100 (AEDT)
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
 header.a=rsa-sha256 header.s=thorn header.b=IEF3oECh; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cw2vY39ndzDqQJ;
 Tue, 15 Dec 2020 13:56:08 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown
 [IPv6:2600:6c44:7f:ba20:1c66:ab2d:5a3:5a9e])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 4F01A806FC;
 Mon, 14 Dec 2020 18:46:02 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 thorn.bewilderbeest.net 4F01A806FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1608000363;
 bh=/VOZ9xkfSILAMzzqqgqchyt0cY3YfGcy6+HU/3zZoCw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IEF3oEChr4h/FkcJqRBZUnvzH0phnVPvxZbZe0W2uDP8sCG4v0mKKC7HAJKpNJYF2
 uSFR+5G1BbdgEx5kN2mYHmT7q+fHO3QT7kWgB1sAhxyznUNEIm/1oZ3teJObF3NotC
 DNGhnWEoyR0AnYiipJEKmUvHSZWqxa53IiC+4uqg=
From: Zev Weiss <zev@bewilderbeest.net>
To: Eddie James <eajames@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, linux-media@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] aspeed-video: add COMP_READY to VE_SPURIOUS_IRQS
Date: Mon, 14 Dec 2020 20:45:42 -0600
Message-Id: <20201215024542.18888-4-zev@bewilderbeest.net>
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

This joins CAPTURE_COMPLETE and FRAME_COMPLETE in the set of interrupts
that have been seen asserted by the hardware even when disabled, leading
to the interrupt eventually getting disabled as described in commit
65d270acb2d662c3346793663ac3a759eb4491b8.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/media/platform/aspeed-video.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
index 218aae3be809..48c52bf91a1b 100644
--- a/drivers/media/platform/aspeed-video.c
+++ b/drivers/media/platform/aspeed-video.c
@@ -564,7 +564,8 @@ static void aspeed_video_irq_res_change(struct aspeed_video *video, ulong delay)
  * register.
  */
 #define VE_SPURIOUS_IRQS \
-	(VE_INTERRUPT_CAPTURE_COMPLETE | VE_INTERRUPT_FRAME_COMPLETE)
+	(VE_INTERRUPT_CAPTURE_COMPLETE | VE_INTERRUPT_FRAME_COMPLETE \
+	 | VE_INTERRUPT_COMP_READY)
 
 static irqreturn_t aspeed_video_irq(int irq, void *arg)
 {
-- 
2.29.2

