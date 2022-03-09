Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E99C4D3D74
	for <lists+openbmc@lfdr.de>; Thu, 10 Mar 2022 00:13:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDSfr6G0Dz3bVZ
	for <lists+openbmc@lfdr.de>; Thu, 10 Mar 2022 10:13:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DRn1HDV4;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DRn1HDV4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=trix@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=DRn1HDV4; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=DRn1HDV4; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDRY50fJxz2xs7
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2022 09:23:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646864594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Zhhts/oGDUWHDg+NawCvM+Mq5JONWcCcE3XBLs6on8o=;
 b=DRn1HDV4ZAP8wqLPtPtCHELvxjj0CkzsFMu4AqVaX4WRQ3ieGhm1WmXmW2b7X/5Pl35oT8
 khOLYeYbXww0Mufl6HSr99jvUE0r80UXalOxoeLsrntD2QioJiCy2ny6Z9QWSavKRZxNxd
 PCjYpN4YTQnnjtRRM4d3Y9THdI86Of4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646864594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Zhhts/oGDUWHDg+NawCvM+Mq5JONWcCcE3XBLs6on8o=;
 b=DRn1HDV4ZAP8wqLPtPtCHELvxjj0CkzsFMu4AqVaX4WRQ3ieGhm1WmXmW2b7X/5Pl35oT8
 khOLYeYbXww0Mufl6HSr99jvUE0r80UXalOxoeLsrntD2QioJiCy2ny6Z9QWSavKRZxNxd
 PCjYpN4YTQnnjtRRM4d3Y9THdI86Of4=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-gVoMdZhWME25m5ilarDS-Q-1; Wed, 09 Mar 2022 17:23:13 -0500
X-MC-Unique: gVoMdZhWME25m5ilarDS-Q-1
Received: by mail-ot1-f72.google.com with SMTP id
 q18-20020a05683022d200b005b23730dc8eso2562292otc.19
 for <openbmc@lists.ozlabs.org>; Wed, 09 Mar 2022 14:23:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zhhts/oGDUWHDg+NawCvM+Mq5JONWcCcE3XBLs6on8o=;
 b=IWUZLFYaYS4A/OuI3Onn0Q0aGqov82J9T3KNKSTegmjKbUCz4RMGlErm47u8yT2t1W
 DeGlzEEqY/5yJqjHgh4MpEQ/R94H2uTrm/PaD4QzijNAMaQDquXvPXre3BFpS+Xi9pEW
 yoRz94Wj4EQu5Ovwd0jGYHGRgPtTQBSfiCoM/rYKW/m5w93EP/zTfTpZAFQVMkkpMvSz
 QuSjMxwED1uJoi756wuq6ghUqnOhSeZekdugCRlijZmrG0ubWKBlKKbalW4gMo21eP2j
 KVskzg4cIXeaX+HESO7DvZUJRLsv+Mc9MDLrFShHIQ8HQE5T8KSh2eBYHfM5JlEsn711
 lbow==
X-Gm-Message-State: AOAM533G24Bz1/fKcEs483Ur8fGcT3LrSAE7s98H6BvekJdE3HwQdF8K
 +LqbuSMnGfo99lY5k+gwJTqdL8KmcwxNhrXt+wYo+B3UW1fKLjR4261jeX4lCjt/tEacbom89zc
 Cn8GPQiOah8C5UFks76U=
X-Received: by 2002:a05:6870:4582:b0:da:b3f:3221 with SMTP id
 y2-20020a056870458200b000da0b3f3221mr1019109oao.209.1646864591894; 
 Wed, 09 Mar 2022 14:23:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6yYPMYox15vablq5HrgmBlUFo96cy1+xfMCp1uiwN8WKVvpaQrgY1X2l8RSy/eS72PRmQVw==
X-Received: by 2002:a05:6870:4582:b0:da:b3f:3221 with SMTP id
 y2-20020a056870458200b000da0b3f3221mr1019105oao.209.1646864591691; 
 Wed, 09 Mar 2022 14:23:11 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113]) by smtp.gmail.com with ESMTPSA id
 k13-20020a056830150d00b005af8c9f399esm1533712otp.50.2022.03.09.14.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 14:23:11 -0800 (PST)
From: trix@redhat.com
To: robh+dt@kernel.org, krzk+dt@kernel.org, paulburton@kernel.org,
 avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Subject: [PATCH] dt-bindings: clk: cleanup comments
Date: Wed,  9 Mar 2022 14:23:02 -0800
Message-Id: <20220309222302.1114561-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-Mailman-Approved-At: Thu, 10 Mar 2022 10:12:15 +1100
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
Cc: devicetree@vger.kernel.org, Tom Rix <trix@redhat.com>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tom Rix <trix@redhat.com>

For spdx, first line /* */ for *.h, change tab to space

Replacements
devider to divider
Comunications to Communications
periphrals to peripherals
supportted to supported
wich to which
Documentatoin to Documentation

Signed-off-by: Tom Rix <trix@redhat.com>
---
 include/dt-bindings/clock/alphascale,asm9260.h    | 2 +-
 include/dt-bindings/clock/axis,artpec6-clkctrl.h  | 2 +-
 include/dt-bindings/clock/boston-clock.h          | 3 +--
 include/dt-bindings/clock/marvell,mmp2.h          | 4 ++--
 include/dt-bindings/clock/marvell,pxa168.h        | 4 ++--
 include/dt-bindings/clock/marvell,pxa910.h        | 4 ++--
 include/dt-bindings/clock/nuvoton,npcm7xx-clock.h | 2 +-
 include/dt-bindings/clock/stm32fx-clock.h         | 4 ++--
 include/dt-bindings/clock/stratix10-clock.h       | 2 +-
 9 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/include/dt-bindings/clock/alphascale,asm9260.h b/include/dt-bindings/clock/alphascale,asm9260.h
index d3871c63308be..f53f8b16883d6 100644
--- a/include/dt-bindings/clock/alphascale,asm9260.h
+++ b/include/dt-bindings/clock/alphascale,asm9260.h
@@ -55,7 +55,7 @@
 #define CLKID_AHB_I2S1		45
 #define CLKID_AHB_MAC1		46
 
-/* devider */
+/* divider */
 #define CLKID_SYS_CPU		47
 #define CLKID_SYS_AHB		48
 #define CLKID_SYS_I2S0M		49
diff --git a/include/dt-bindings/clock/axis,artpec6-clkctrl.h b/include/dt-bindings/clock/axis,artpec6-clkctrl.h
index b1f4971642e6f..14e424a7c08c2 100644
--- a/include/dt-bindings/clock/axis,artpec6-clkctrl.h
+++ b/include/dt-bindings/clock/axis,artpec6-clkctrl.h
@@ -2,7 +2,7 @@
 /*
  * ARTPEC-6 clock controller indexes
  *
- * Copyright 2016 Axis Comunications AB.
+ * Copyright 2016 Axis Communications AB.
  */
 
 #ifndef DT_BINDINGS_CLK_ARTPEC6_CLKCTRL_H
diff --git a/include/dt-bindings/clock/boston-clock.h b/include/dt-bindings/clock/boston-clock.h
index a6f0098211378..38140fa87b09d 100644
--- a/include/dt-bindings/clock/boston-clock.h
+++ b/include/dt-bindings/clock/boston-clock.h
@@ -1,7 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) 2016 Imagination Technologies
- *
- * SPDX-License-Identifier:	GPL-2.0
  */
 
 #ifndef __DT_BINDINGS_CLOCK_BOSTON_CLOCK_H__
diff --git a/include/dt-bindings/clock/marvell,mmp2.h b/include/dt-bindings/clock/marvell,mmp2.h
index 87f5ad5df72f4..f0819d66b2306 100644
--- a/include/dt-bindings/clock/marvell,mmp2.h
+++ b/include/dt-bindings/clock/marvell,mmp2.h
@@ -32,7 +32,7 @@
 #define MMP2_CLK_I2S0			31
 #define MMP2_CLK_I2S1			32
 
-/* apb periphrals */
+/* apb peripherals */
 #define MMP2_CLK_TWSI0			60
 #define MMP2_CLK_TWSI1			61
 #define MMP2_CLK_TWSI2			62
@@ -60,7 +60,7 @@
 #define MMP3_CLK_THERMAL2		84
 #define MMP3_CLK_THERMAL3		85
 
-/* axi periphrals */
+/* axi peripherals */
 #define MMP2_CLK_SDH0			101
 #define MMP2_CLK_SDH1			102
 #define MMP2_CLK_SDH2			103
diff --git a/include/dt-bindings/clock/marvell,pxa168.h b/include/dt-bindings/clock/marvell,pxa168.h
index caf90436b8483..db2b41f1b1272 100644
--- a/include/dt-bindings/clock/marvell,pxa168.h
+++ b/include/dt-bindings/clock/marvell,pxa168.h
@@ -23,7 +23,7 @@
 #define PXA168_CLK_UART_PLL		27
 #define PXA168_CLK_USB_PLL		28
 
-/* apb periphrals */
+/* apb peripherals */
 #define PXA168_CLK_TWSI0		60
 #define PXA168_CLK_TWSI1		61
 #define PXA168_CLK_TWSI2		62
@@ -45,7 +45,7 @@
 #define PXA168_CLK_SSP4			78
 #define PXA168_CLK_TIMER		79
 
-/* axi periphrals */
+/* axi peripherals */
 #define PXA168_CLK_DFC			100
 #define PXA168_CLK_SDH0			101
 #define PXA168_CLK_SDH1			102
diff --git a/include/dt-bindings/clock/marvell,pxa910.h b/include/dt-bindings/clock/marvell,pxa910.h
index 7bf46238946eb..c9018ab354d06 100644
--- a/include/dt-bindings/clock/marvell,pxa910.h
+++ b/include/dt-bindings/clock/marvell,pxa910.h
@@ -23,7 +23,7 @@
 #define PXA910_CLK_UART_PLL		27
 #define PXA910_CLK_USB_PLL		28
 
-/* apb periphrals */
+/* apb peripherals */
 #define PXA910_CLK_TWSI0		60
 #define PXA910_CLK_TWSI1		61
 #define PXA910_CLK_TWSI2		62
@@ -43,7 +43,7 @@
 #define PXA910_CLK_TIMER0		76
 #define PXA910_CLK_TIMER1		77
 
-/* axi periphrals */
+/* axi peripherals */
 #define PXA910_CLK_DFC			100
 #define PXA910_CLK_SDH0			101
 #define PXA910_CLK_SDH1			102
diff --git a/include/dt-bindings/clock/nuvoton,npcm7xx-clock.h b/include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
index f21522605b94b..3e0a9b68933df 100644
--- a/include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
+++ b/include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Nuvoton NPCM7xx Clock Generator binding
- * clock binding number for all clocks supportted by nuvoton,npcm7xx-clk
+ * clock binding number for all clocks supported by nuvoton,npcm7xx-clk
  *
  * Copyright (C) 2018 Nuvoton Technologies tali.perry@nuvoton.com
  *
diff --git a/include/dt-bindings/clock/stm32fx-clock.h b/include/dt-bindings/clock/stm32fx-clock.h
index 1cc89c548578b..e5dad050d518a 100644
--- a/include/dt-bindings/clock/stm32fx-clock.h
+++ b/include/dt-bindings/clock/stm32fx-clock.h
@@ -7,10 +7,10 @@
  */
 
 /*
- * List of clocks wich are not derived from system clock (SYSCLOCK)
+ * List of clocks which are not derived from system clock (SYSCLOCK)
  *
  * The index of these clocks is the secondary index of DT bindings
- * (see Documentatoin/devicetree/bindings/clock/st,stm32-rcc.txt)
+ * (see Documentation/devicetree/bindings/clock/st,stm32-rcc.txt)
  *
  * e.g:
 	<assigned-clocks = <&rcc 1 CLK_LSE>;
diff --git a/include/dt-bindings/clock/stratix10-clock.h b/include/dt-bindings/clock/stratix10-clock.h
index 08b98e20b7cc7..636498f9e08ee 100644
--- a/include/dt-bindings/clock/stratix10-clock.h
+++ b/include/dt-bindings/clock/stratix10-clock.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier:	GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) 2017, Intel Corporation
  */
-- 
2.26.3

