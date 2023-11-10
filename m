Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 440F27E75CA
	for <lists+openbmc@lfdr.de>; Fri, 10 Nov 2023 01:17:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=i4zIy2RJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRKCC0P6Dz2xFm
	for <lists+openbmc@lfdr.de>; Fri, 10 Nov 2023 11:17:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=i4zIy2RJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SRKBb6sblz2xFm
	for <openbmc@lists.ozlabs.org>; Fri, 10 Nov 2023 11:16:55 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:7e5d:5300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 42DF54256;
	Thu,  9 Nov 2023 16:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1699575409;
	bh=Ltscq+tzdPiMbcpZ/4735rSiWHuvTxXOt46ZGz9PrzM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i4zIy2RJ03ysJsw4O0qMCFgDSj/IOFDKC8bM9CDEIEaLbozhTEKxKWMMqM5Xd34X9
	 PO57jkSbM6fcn+m4YJeEF84PmkBk23G6mWcl11436AvejmxF1G3CIPUkgCWfJh1vu8
	 7RwnLCvWwz2vUAsJoXILZXTCPJLl72OST4Gxbdkk=
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH linux dev-6.5 1/2] dt-bindings: watchdog: aspeed-wdt: Add aspeed,reset-mask property
Date: Thu,  9 Nov 2023 16:16:36 -0800
Message-ID: <20231110001634.6638-5-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231110001634.6638-4-zev@bewilderbeest.net>
References: <20231110001634.6638-4-zev@bewilderbeest.net>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This property configures the Aspeed watchdog timer's reset mask, which
controls which peripherals are reset when the watchdog timer expires.
Some platforms require that certain devices be left untouched across a
reboot; aspeed,reset-mask can now be used to express such constraints.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/20230922104231.1434-5-zev@bewilderbeest.net
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@linux-watchdog.org>
(cherry picked from commit 9931be2cfca35be7040f35a272a7b82b31ec1c71)
---
 .../bindings/watchdog/aspeed-wdt.txt          | 18 +++-
 include/dt-bindings/watchdog/aspeed-wdt.h     | 92 +++++++++++++++++++
 2 files changed, 109 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/watchdog/aspeed-wdt.h

diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
index a8197632d6d2..3208adb3e52e 100644
--- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
@@ -47,7 +47,15 @@ Optional properties for AST2500-compatible watchdogs:
 			   is configured as push-pull, then set the pulse
 			   polarity to active-high. The default is active-low.
 
-Example:
+Optional properties for AST2500- and AST2600-compatible watchdogs:
+ - aspeed,reset-mask: A bitmask indicating which peripherals will be reset if
+		      the watchdog timer expires.  On AST2500 this should be a
+		      single word defined using the AST2500_WDT_RESET_* macros;
+		      on AST2600 this should be a two-word array with the first
+		      word defined using the AST2600_WDT_RESET1_* macros and the
+		      second word defined using the AST2600_WDT_RESET2_* macros.
+
+Examples:
 
 	wdt1: watchdog@1e785000 {
 		compatible = "aspeed,ast2400-wdt";
@@ -55,3 +63,11 @@ Example:
 		aspeed,reset-type = "system";
 		aspeed,external-signal;
 	};
+
+	#include <dt-bindings/watchdog/aspeed-wdt.h>
+	wdt2: watchdog@1e785040 {
+		compatible = "aspeed,ast2600-wdt";
+		reg = <0x1e785040 0x40>;
+		aspeed,reset-mask = <AST2600_WDT_RESET1_DEFAULT
+				     (AST2600_WDT_RESET2_DEFAULT & ~AST2600_WDT_RESET2_LPC)>;
+	};
diff --git a/include/dt-bindings/watchdog/aspeed-wdt.h b/include/dt-bindings/watchdog/aspeed-wdt.h
new file mode 100644
index 000000000000..7ae6d84b2bd9
--- /dev/null
+++ b/include/dt-bindings/watchdog/aspeed-wdt.h
@@ -0,0 +1,92 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef DT_BINDINGS_ASPEED_WDT_H
+#define DT_BINDINGS_ASPEED_WDT_H
+
+#define AST2500_WDT_RESET_CPU		(1 << 0)
+#define AST2500_WDT_RESET_COPROC	(1 << 1)
+#define AST2500_WDT_RESET_SDRAM		(1 << 2)
+#define AST2500_WDT_RESET_AHB		(1 << 3)
+#define AST2500_WDT_RESET_I2C		(1 << 4)
+#define AST2500_WDT_RESET_MAC0		(1 << 5)
+#define AST2500_WDT_RESET_MAC1		(1 << 6)
+#define AST2500_WDT_RESET_GRAPHICS	(1 << 7)
+#define AST2500_WDT_RESET_USB2_HOST_HUB	(1 << 8)
+#define AST2500_WDT_RESET_USB_HOST	(1 << 9)
+#define AST2500_WDT_RESET_HID_EHCI	(1 << 10)
+#define AST2500_WDT_RESET_VIDEO		(1 << 11)
+#define AST2500_WDT_RESET_HAC		(1 << 12)
+#define AST2500_WDT_RESET_LPC		(1 << 13)
+#define AST2500_WDT_RESET_SDIO		(1 << 14)
+#define AST2500_WDT_RESET_MIC		(1 << 15)
+#define AST2500_WDT_RESET_CRT		(1 << 16)
+#define AST2500_WDT_RESET_PWM		(1 << 17)
+#define AST2500_WDT_RESET_PECI		(1 << 18)
+#define AST2500_WDT_RESET_JTAG		(1 << 19)
+#define AST2500_WDT_RESET_ADC		(1 << 20)
+#define AST2500_WDT_RESET_GPIO		(1 << 21)
+#define AST2500_WDT_RESET_MCTP		(1 << 22)
+#define AST2500_WDT_RESET_XDMA		(1 << 23)
+#define AST2500_WDT_RESET_SPI		(1 << 24)
+#define AST2500_WDT_RESET_SOC_MISC	(1 << 25)
+
+#define AST2500_WDT_RESET_DEFAULT 0x023ffff3
+
+#define AST2600_WDT_RESET1_CPU		(1 << 0)
+#define AST2600_WDT_RESET1_SDRAM	(1 << 1)
+#define AST2600_WDT_RESET1_AHB		(1 << 2)
+#define AST2600_WDT_RESET1_SLI		(1 << 3)
+#define AST2600_WDT_RESET1_SOC_MISC0	(1 << 4)
+#define AST2600_WDT_RESET1_COPROC	(1 << 5)
+#define AST2600_WDT_RESET1_USB_A	(1 << 6)
+#define AST2600_WDT_RESET1_USB_B	(1 << 7)
+#define AST2600_WDT_RESET1_UHCI		(1 << 8)
+#define AST2600_WDT_RESET1_GRAPHICS	(1 << 9)
+#define AST2600_WDT_RESET1_CRT		(1 << 10)
+#define AST2600_WDT_RESET1_VIDEO	(1 << 11)
+#define AST2600_WDT_RESET1_HAC		(1 << 12)
+#define AST2600_WDT_RESET1_DP		(1 << 13)
+#define AST2600_WDT_RESET1_DP_MCU	(1 << 14)
+#define AST2600_WDT_RESET1_GP_MCU	(1 << 15)
+#define AST2600_WDT_RESET1_MAC0		(1 << 16)
+#define AST2600_WDT_RESET1_MAC1		(1 << 17)
+#define AST2600_WDT_RESET1_SDIO0	(1 << 18)
+#define AST2600_WDT_RESET1_JTAG0	(1 << 19)
+#define AST2600_WDT_RESET1_MCTP0	(1 << 20)
+#define AST2600_WDT_RESET1_MCTP1	(1 << 21)
+#define AST2600_WDT_RESET1_XDMA0	(1 << 22)
+#define AST2600_WDT_RESET1_XDMA1	(1 << 23)
+#define AST2600_WDT_RESET1_GPIO0	(1 << 24)
+#define AST2600_WDT_RESET1_RVAS		(1 << 25)
+
+#define AST2600_WDT_RESET1_DEFAULT 0x030f1ff1
+
+#define AST2600_WDT_RESET2_CPU		(1 << 0)
+#define AST2600_WDT_RESET2_SPI		(1 << 1)
+#define AST2600_WDT_RESET2_AHB2		(1 << 2)
+#define AST2600_WDT_RESET2_SLI2		(1 << 3)
+#define AST2600_WDT_RESET2_SOC_MISC1	(1 << 4)
+#define AST2600_WDT_RESET2_MAC2		(1 << 5)
+#define AST2600_WDT_RESET2_MAC3		(1 << 6)
+#define AST2600_WDT_RESET2_SDIO1	(1 << 7)
+#define AST2600_WDT_RESET2_JTAG1	(1 << 8)
+#define AST2600_WDT_RESET2_GPIO1	(1 << 9)
+#define AST2600_WDT_RESET2_MDIO		(1 << 10)
+#define AST2600_WDT_RESET2_LPC		(1 << 11)
+#define AST2600_WDT_RESET2_PECI		(1 << 12)
+#define AST2600_WDT_RESET2_PWM		(1 << 13)
+#define AST2600_WDT_RESET2_ADC		(1 << 14)
+#define AST2600_WDT_RESET2_FSI		(1 << 15)
+#define AST2600_WDT_RESET2_I2C		(1 << 16)
+#define AST2600_WDT_RESET2_I3C_GLOBAL	(1 << 17)
+#define AST2600_WDT_RESET2_I3C0		(1 << 18)
+#define AST2600_WDT_RESET2_I3C1		(1 << 19)
+#define AST2600_WDT_RESET2_I3C2		(1 << 20)
+#define AST2600_WDT_RESET2_I3C3		(1 << 21)
+#define AST2600_WDT_RESET2_I3C4		(1 << 22)
+#define AST2600_WDT_RESET2_I3C5		(1 << 23)
+#define AST2600_WDT_RESET2_ESPI		(1 << 26)
+
+#define AST2600_WDT_RESET2_DEFAULT 0x03fffff1
+
+#endif
-- 
2.42.0

