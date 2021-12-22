Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1215C47CF23
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 10:24:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJnvb5wsZz3bht
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 20:24:11 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJnvK0h7Lz30Hr
 for <openbmc@lists.ozlabs.org>; Wed, 22 Dec 2021 20:23:56 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1BM9Ht34081427;
 Wed, 22 Dec 2021 17:17:55 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 22 Dec
 2021 17:23:21 +0800
From: Troy Lee <troy_lee@aspeedtech.com>
To: <qemu-devel@nongnu.org>, <openbmc@lists.ozlabs.org>
Subject: [PATCH v1 2/2] hw/arm/aspeed_ast2600: create i3c instance
Date: Wed, 22 Dec 2021 17:23:19 +0800
Message-ID: <20211222092319.2988568-3-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211222092319.2988568-1-troy_lee@aspeedtech.com>
References: <20211222092319.2988568-1-troy_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1BM9Ht34081427
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
 leetroy@gmail.com, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch includes i3c instance in ast2600 soc.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
---
 hw/arm/aspeed_ast2600.c     | 12 ++++++++++++
 include/hw/arm/aspeed_soc.h |  3 +++
 2 files changed, 15 insertions(+)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index f2fef9d706..219b025bc2 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -63,6 +63,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
     [ASPEED_DEV_VUART]     = 0x1E787000,
     [ASPEED_DEV_FSI1]      = 0x1E79B000,
     [ASPEED_DEV_FSI2]      = 0x1E79B100,
+    [ASPEED_DEV_I3C]       = 0x1E7A0000,
     [ASPEED_DEV_SDRAM]     = 0x80000000,
 };
 
@@ -112,6 +113,7 @@ static const int aspeed_soc_ast2600_irqmap[] = {
     [ASPEED_DEV_FSI1]      = 100,
     [ASPEED_DEV_FSI2]      = 101,
     [ASPEED_DEV_DP]        = 62,
+    [ASPEED_DEV_I3C]       = 102,   /* 102 -> 107 */
 };
 
 static qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int ctrl)
@@ -230,6 +232,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
 
     object_initialize_child(obj, "pwm", &s->pwm, TYPE_ASPEED_PWM);
 
+    object_initialize_child(obj, "i3c", &s->i3c, TYPE_ASPEED_I3C);
+
     object_initialize_child(obj, "fsi[*]", &s->fsi[0], TYPE_ASPEED_APB2OPB);
 }
 
@@ -542,6 +546,14 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->pwm), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_PWM));
 
+    /* I3C */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->i3c), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i3c), 0, sc->memmap[ASPEED_DEV_I3C]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i3c), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_I3C));
+
     /* FSI */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->fsi[0]), errp)) {
         return;
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 0db200d813..0c950fab3c 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -21,6 +21,7 @@
 #include "hw/timer/aspeed_timer.h"
 #include "hw/rtc/aspeed_rtc.h"
 #include "hw/i2c/aspeed_i2c.h"
+#include "hw/misc/aspeed_i3c.h"
 #include "hw/ssi/aspeed_smc.h"
 #include "hw/misc/aspeed_hace.h"
 #include "hw/watchdog/wdt_aspeed.h"
@@ -53,6 +54,7 @@ struct AspeedSoCState {
     AspeedRtcState rtc;
     AspeedTimerCtrlState timerctrl;
     AspeedI2CState i2c;
+    AspeedI3CState i3c;
     AspeedSCUState scu;
     AspeedHACEState hace;
     AspeedXDMAState xdma;
@@ -148,6 +150,7 @@ enum {
     ASPEED_DEV_FSI2,
     ASPEED_DEV_DPMCU,
     ASPEED_DEV_DP,
+    ASPEED_DEV_I3C,
 };
 
 #endif /* ASPEED_SOC_H */
-- 
2.25.1

