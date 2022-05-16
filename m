Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A251527D8B
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 08:25:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L1q4T5SBnz2xBk
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 16:25:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=facebook header.b=ZAXiWRAq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=6135bb9a91=pdel@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=ZAXiWRAq; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L1q2b1SqXz2ypn
 for <openbmc@lists.ozlabs.org>; Mon, 16 May 2022 16:23:50 +1000 (AEST)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24G2dm6W023330
 for <openbmc@lists.ozlabs.org>; Sun, 15 May 2022 23:23:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=kDV6iV5F7fBqFLCXnJIhHkzMTp2lToozwCevtU/G/aw=;
 b=ZAXiWRAqaEXz7mr6Q7btcPxjNe4m5HpMQULsqhfX06PxAsZlZ68AVQfFFTyao06L8GCi
 lwuPlVC2DVahwv9zSS1hwVASvWV7GU2En14ATTSEZRav9FoE6CD8XB+1nH8p7rOpVS6N
 qukuqKSuR88NdUWzTQ87HcDWpbuafbrwHJQ= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3g29xxf9ys-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sun, 15 May 2022 23:23:48 -0700
Received: from twshared3657.05.prn5.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c085:21d::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sun, 15 May 2022 23:23:42 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 1A49964DCACC; Sun, 15 May 2022 23:23:30 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
Subject: [PATCH v2 4/5] hw: aspeed: Introduce common UART init function
Date: Sun, 15 May 2022 23:23:27 -0700
Message-ID: <20220516062328.298336-5-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220516062328.298336-1-pdel@fb.com>
References: <20220516062328.298336-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: JFyoWjwChkSNIxVjDzhAjcNnVbil6ZBp
X-Proofpoint-ORIG-GUID: JFyoWjwChkSNIxVjDzhAjcNnVbil6ZBp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-15_11,2022-05-13_01,2022-02-23_01
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
Cc: peter.maydell@linaro.org, zev@bewilderbeest.net, andrew@aj.id.au,
 irischenlj@fb.com, openbmc@lists.ozlabs.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, clg@kaod.org, pdel@fb.com, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/arm/aspeed_ast10x0.c     |  7 ++-----
 hw/arm/aspeed_ast2600.c     |  7 ++-----
 hw/arm/aspeed_soc.c         | 16 ++++++++++++----
 include/hw/arm/aspeed_soc.h |  1 +
 4 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index faafb800f3..938615d55f 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -15,7 +15,6 @@
 #include "sysemu/sysemu.h"
 #include "hw/qdev-clock.h"
 #include "hw/misc/unimp.h"
-#include "hw/char/serial.h"
 #include "hw/arm/aspeed_soc.h"
=20
 #define ASPEED_SOC_IOMEM_SIZE 0x00200000
@@ -215,10 +214,8 @@ static void aspeed_soc_ast1030_realize(DeviceState *=
dev_soc, Error **errp)
                        qdev_get_gpio_in(DEVICE(&s->armv7m),
                                 sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_=
kcs_4));
=20
-    /* UART - attach an 8250 to the IO space as our UART */
-    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
-                   aspeed_soc_get_irq(s, s->uart_default),
-                   38400, serial_hd(0), DEVICE_LITTLE_ENDIAN);
+    /* UART */
+    aspeed_soc_uart_init(s);
=20
     /* Timer */
     object_property_set_link(OBJECT(&s->timerctrl), "scu", OBJECT(&s->sc=
u),
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index a9523074a0..b0a4199b69 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -11,7 +11,6 @@
 #include "qapi/error.h"
 #include "hw/misc/unimp.h"
 #include "hw/arm/aspeed_soc.h"
-#include "hw/char/serial.h"
 #include "qemu/module.h"
 #include "qemu/error-report.h"
 #include "hw/i2c/aspeed_i2c.h"
@@ -372,10 +371,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *=
dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
=20
-    /* UART - attach an 8250 to the IO space as our UART */
-    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
-                   aspeed_soc_get_irq(s, s->uart_default), 38400,
-                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
+    /* UART */
+    aspeed_soc_uart_init(s);
=20
     /* I2C */
     object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr)=
,
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 7008cd1af7..912798a9c9 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -303,10 +303,8 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
=20
-    /* UART - attach an 8250 to the IO space as our UART */
-    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
-                   aspeed_soc_get_irq(s, s->uart_default), 38400,
-                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
+    /* UART */
+    aspeed_soc_uart_init(s);
=20
     /* I2C */
     object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr)=
,
@@ -544,3 +542,13 @@ qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int d=
ev)
 {
     return ASPEED_SOC_GET_CLASS(s)->get_irq(s, dev);
 }
+
+void aspeed_soc_uart_init(AspeedSoCState *s)
+{
+    AspeedSoCClass *sc =3D ASPEED_SOC_GET_CLASS(s);
+
+    /* Attach an 8250 to the IO space as our UART */
+    serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
+                   aspeed_soc_get_irq(s, s->uart_default), 38400,
+                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
+}
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 669bc49855..02a5a9ffcb 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -164,5 +164,6 @@ enum {
 };
=20
 qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
+void aspeed_soc_uart_init(AspeedSoCState *s);
=20
 #endif /* ASPEED_SOC_H */
--=20
2.30.2

