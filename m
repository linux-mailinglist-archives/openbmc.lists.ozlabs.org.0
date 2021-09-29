Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4A741CFF4
	for <lists+openbmc@lfdr.de>; Thu, 30 Sep 2021 01:29:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKXdk07n9z308J
	for <lists+openbmc@lfdr.de>; Thu, 30 Sep 2021 09:29:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sjtu.edu.cn (client-ip=202.120.2.181; helo=smtp181.sjtu.edu.cn;
 envelope-from=qtxuning1999@sjtu.edu.cn; receiver=<UNKNOWN>)
X-Greylist: delayed 354 seconds by postgrey-1.36 at boromir;
 Wed, 29 Sep 2021 21:11:34 AEST
Received: from smtp181.sjtu.edu.cn (smtp181.sjtu.edu.cn [202.120.2.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKDGG6BySz2yL9
 for <openbmc@lists.ozlabs.org>; Wed, 29 Sep 2021 21:11:34 +1000 (AEST)
Received: from proxy02.sjtu.edu.cn (smtp188.sjtu.edu.cn [202.120.2.188])
 by smtp181.sjtu.edu.cn (Postfix) with ESMTPS id 789C21008CBC0;
 Wed, 29 Sep 2021 19:05:34 +0800 (CST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by proxy02.sjtu.edu.cn (Postfix) with ESMTP id 8CD3F200B5753;
 Wed, 29 Sep 2021 19:05:31 +0800 (CST)
X-Virus-Scanned: amavisd-new at 
Received: from proxy02.sjtu.edu.cn ([127.0.0.1])
 by localhost (proxy02.sjtu.edu.cn [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Rn75ASWTZkzI; Wed, 29 Sep 2021 19:05:31 +0800 (CST)
Received: from guozhi-ipads.ipads-lab.se.sjtu.edu.cn (unknown [202.120.40.82])
 (Authenticated sender: qtxuning1999@sjtu.edu.cn)
 by proxy02.sjtu.edu.cn (Postfix) with ESMTPSA id 84914200C02CB;
 Wed, 29 Sep 2021 19:05:14 +0800 (CST)
From: Guo Zhi <qtxuning1999@sjtu.edu.cn>
To: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] clockresource/npcm: Fix kernel pointer leak
Date: Wed, 29 Sep 2021 19:04:29 +0800
Message-Id: <20210929110431.1113708-1-qtxuning1999@sjtu.edu.cn>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 30 Sep 2021 09:29:17 +1000
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
Cc: openbmc@lists.ozlabs.org, Guo Zhi <qtxuning1999@sjtu.edu.cn>,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Pointers should be printed with %p rather than %px
which printed kernel pointer directly.
Change %px to %p to print the secured pointer.

Signed-off-by: Guo Zhi <qtxuning1999@sjtu.edu.cn>
---
 drivers/clocksource/timer-npcm7xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-npcm7xx.c b/drivers/clocksource/timer-npcm7xx.c
index a00520cbb660..bf477685d545 100644
--- a/drivers/clocksource/timer-npcm7xx.c
+++ b/drivers/clocksource/timer-npcm7xx.c
@@ -202,7 +202,7 @@ static int __init npcm7xx_timer_init(struct device_node *np)
 	npcm7xx_clocksource_init();
 	npcm7xx_clockevents_init();
 
-	pr_info("Enabling NPCM7xx clocksource timer base: %px, IRQ: %d ",
+	pr_info("Enabling NPCM7xx clocksource timer base: %p, IRQ: %d ",
 		timer_of_base(&npcm7xx_to), timer_of_irq(&npcm7xx_to));
 
 	return 0;
-- 
2.33.0

