Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 805FF47CFEE
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 11:25:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJqGX2KsMz2xsr
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 21:25:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=troy_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJqG210LDz305j
 for <openbmc@lists.ozlabs.org>; Wed, 22 Dec 2021 21:25:12 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1BMAJ0j4086708;
 Wed, 22 Dec 2021 18:19:00 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 22 Dec
 2021 18:24:26 +0800
From: Troy Lee <troy_lee@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH qemu master] hw/misc/aspeed_pwm: fix typo
Date: Wed, 22 Dec 2021 18:24:23 +0800
Message-ID: <20211222102423.3121181-1-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1BMAJ0j4086708
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>, leetroy@gmail.com,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Typo found during developing.

Fixes: 70b3f1a34d3c ("hw/misc: Add basic Aspeed PWM model")
Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
---
 hw/misc/aspeed_pwm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/aspeed_pwm.c b/hw/misc/aspeed_pwm.c
index 8ebab5dcef..dbf9634da3 100644
--- a/hw/misc/aspeed_pwm.c
+++ b/hw/misc/aspeed_pwm.c
@@ -96,7 +96,7 @@ static void aspeed_pwm_class_init(ObjectClass *klass, void *data)
 
     dc->realize = aspeed_pwm_realize;
     dc->reset = aspeed_pwm_reset;
-    dc->desc = "Aspeed PWM Controller",
+    dc->desc = "Aspeed PWM Controller";
     dc->vmsd = &vmstate_aspeed_pwm;
 }
 
-- 
2.25.1

