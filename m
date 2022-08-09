Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF4A58E507
	for <lists+openbmc@lfdr.de>; Wed, 10 Aug 2022 05:00:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2ZRz4VqFz3bbj
	for <lists+openbmc@lfdr.de>; Wed, 10 Aug 2022 13:00:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=nfschina.com (client-ip=2400:dd01:100f:2:72e2:84ff:fe10:5f45; helo=mail.nfschina.com; envelope-from=lvqian@nfschina.com; receiver=<UNKNOWN>)
X-Greylist: delayed 216 seconds by postgrey-1.36 at boromir; Tue, 09 Aug 2022 18:40:32 AEST
Received: from mail.nfschina.com (unknown [IPv6:2400:dd01:100f:2:72e2:84ff:fe10:5f45])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2634051sz2yn3
	for <openbmc@lists.ozlabs.org>; Tue,  9 Aug 2022 18:40:31 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
	by mail.nfschina.com (Postfix) with ESMTP id 4E4011E80CD2;
	Tue,  9 Aug 2022 16:35:04 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
	by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xd3vv3aCZ8YK; Tue,  9 Aug 2022 16:35:01 +0800 (CST)
Received: from localhost.localdomain.localdomain (unknown [219.141.250.2])
	(Authenticated sender: lvqian@nfschina.com)
	by mail.nfschina.com (Postfix) with ESMTPA id AF87A1E80CC5;
	Tue,  9 Aug 2022 16:35:01 +0800 (CST)
From: Lv qian <lvqian@nfschina.com>
To: avifishman70@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de
Subject: [PATCH] clocksource/timer-npcm7xx: Remove unnecessary (void*) conversions
Date: Tue,  9 Aug 2022 16:36:36 +0800
Message-Id: <20220809083636.3789-1-lvqian@nfschina.com>
X-Mailer: git-send-email 2.18.2
X-Mailman-Approved-At: Wed, 10 Aug 2022 13:00:00 +1000
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
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Lv qian <lvqian@nfschina.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

	Remove unnecessary (void*) conversions

Signed-off-by: Lv qian <lvqian@nfschina.com>
---
 drivers/clocksource/timer-npcm7xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-npcm7xx.c b/drivers/clocksource/timer-npcm7xx.c
index a00520cbb660..cc420309d283 100644
--- a/drivers/clocksource/timer-npcm7xx.c
+++ b/drivers/clocksource/timer-npcm7xx.c
@@ -121,7 +121,7 @@ static int npcm7xx_clockevent_set_next_event(unsigned long evt,
 
 static irqreturn_t npcm7xx_timer0_interrupt(int irq, void *dev_id)
 {
-	struct clock_event_device *evt = (struct clock_event_device *)dev_id;
+	struct clock_event_device *evt = dev_id;
 	struct timer_of *to = to_timer_of(evt);
 
 	writel(NPCM7XX_T0_CLR_INT, timer_of_base(to) + NPCM7XX_REG_TISR);
-- 
2.18.2

