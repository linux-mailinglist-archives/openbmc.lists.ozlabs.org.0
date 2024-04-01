Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAD1893BCD
	for <lists+openbmc@lfdr.de>; Mon,  1 Apr 2024 16:08:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=pHAZ8pFp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V7Xt26mt5z3dS8
	for <lists+openbmc@lfdr.de>; Tue,  2 Apr 2024 01:08:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=pHAZ8pFp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V7XsR3P0fz2xct
	for <openbmc@lists.ozlabs.org>; Tue,  2 Apr 2024 01:07:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1711980456; x=1712585256; i=j.neuschaefer@gmx.net;
	bh=03Hg8b51Cm5OObGCW/j93uamiBzZPOMrP5OQOfimxno=;
	h=X-UI-Sender-Class:From:Date:Subject:References:In-Reply-To:To:
	 Cc;
	b=pHAZ8pFpBOM2udi+Ii1KCXEPp9nziO2n9MFzmFafA16Qh2rQgWdGr13yDEQANjlT
	 /IxG4EsILCamuDniiphaWV2tL+R9bB3xRlkJ1DHOuAka4sVKF4Yy2A2RufkzP8dSg
	 r+NwupU0YQ1Jq6lUXlWyoaFHlonEtTGdQJadyRJfxEUCKK2hHZNvUYIi5qu6tiBDD
	 cp5osGsZWzEl27zGQJik4e83ATEktWtbbeD/opGdNOkDvVt/koPjkAjCjo2LmAbd1
	 86MUBUjRrx0erk8I18lYzSSjazvNqRVQ5i7Vvd3lHHYJtQsghpbBPFgCJdX6oY+ML
	 arPUztEgmDmVQ1DyHA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([5.145.135.152]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M2f5Z-1rpu4u3ssx-0048uB; Mon, 01
 Apr 2024 16:07:36 +0200
From: =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Date: Mon, 01 Apr 2024 16:06:33 +0200
Subject: [PATCH v11 4/4] ARM: dts: wpcm450: Switch clocks to clock
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20240401-wpcm-clk-v11-4-379472961244@gmx.net>
References: <20240401-wpcm-clk-v11-0-379472961244@gmx.net>
In-Reply-To: <20240401-wpcm-clk-v11-0-379472961244@gmx.net>
To: openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711980406; l=2958;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=a9wNsKmL9/9Z7nom3X5WWjX3p1JuZBHq/uxqGugc7ps=;
 b=KGfgbs04pht1J+1uPQNB6x7oJPqB1LMucztRdVek963PA4D9lgD12YD7farcMuKl9mLBc56hP
 krx4rGmhdTWAc+VMBUXfDtYShzX7561Vv3+vYwRlHHuITIq9uoml3Hq
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:FZ/9Dlh8rpTmwnWT25lRAV1iH6piY77RpmH+PLrywqIQ0fx7QBX
 VS4ZCdGy7Ju/y3eeR5EdmzwsnOUCmLPSqwVuBs6Ow4Vo+fK3y6VUIgSuOsgqiux1MB5RkL7
 JXmdoSnpQ1doIbfPlGOlfeI6na87nT+zfc7+n8iKWxwbJLg6bJ9OqtNVG2RVa3VrDchCKaV
 5PAApv3dRzpl1gvuVXcQQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jPwf5GocbN8=;NOKGBzIo48IViiMM5Ri4xK5HzR8
 I/Jz/Pmkv9LdbYisEXDD9pzEBlbPbXKBHvm+fzNvJd66qmHWiIlti9Cj0NzQdP/RyKnNehDGL
 PfpqLW7wVlzPQ3AY0PUAxEPQ39N4JWLGUUxBtUdC6vDgzbVtemf/AFQY4zLPnucrV7HfYbPph
 y6wV6ahBFo0a2qO8C26t+FGkRqKtMT0NqBoKan/5/Q6dSUlMwPM+zo2+rJZ0xjUnZPF3bqxcw
 pY4EJJHnLLPqy7SQjiUHZpqWjVjoyhsU3uk52lolI/EL3oMbb0tFuasD++vs3gxw8QgBODzsm
 mY0qjKOvm6rQm8B0GpwzBlYmGsYnbyPyQhuJvq1PXUvJcqL3lx7uOkzxvRSRvjroywwXILjPH
 tLYc+zCRIDfOVN6wyuTz/M0ppd+0mAEHfXUCky4juafGyPvdyaDkR5J33lNpM4w+s6JUls9W4
 6vetW+ElOX0TGf/n2szTOyu9IC7XI+GjRQ8gIo43Ai/iNlv207ocCP1C6AzyMoAdqpBNmZvJo
 eX+W9vNAupxIJBAQ3qdgXR94VCkibkEMKzfreBfKJ6DHUzqlsYgZOfg3rKiSFr1qhae1pnxHy
 q4wX+j/mREILlLxfefqq9MzfuJEhp24OXTg7SSfAxTcANPWxhzEqSe2XUURhJ6xT72zbjNjyL
 RWyq9krgx5bg8Ho5juB3iDLJtXVnxVpy3/hTyuZ0JgOS3S2YyBM2YC/4GCOOdsTTDuB8IRR1V
 isKPZa87dlSm851zpvSwj/uogiWrsR1FzHOUpkPs6pn9JFAWmgqDUR6mfHA3yOlbs5y/kgzrm
 Jj91kEJlzWPCCqkS6M7+tVuL4gHJgJK1Uoq6KEsUmg+THejPAVLv8TZCxt1nvAkPmt
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This change is incompatible with older kernels because it requires the
clock controller driver, but I think that's acceptable because WPCM450
support is generally still in an early phase.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--

It's probably best to delay merging of this patch until after the driver
is merged; I'm including it here for review, and in case someone wants
to set up a shared branch between the clock and devicetree parts.

v11:
- no changes

v10:
- Reintroducing this patch as part of the clock/reset controller series
=2D--
 arch/arm/boot/dts/nuvoton/nuvoton-wpcm450.dtsi | 22 ++++++++++-----------=
-
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-wpcm450.dtsi b/arch/arm/boo=
t/dts/nuvoton/nuvoton-wpcm450.dtsi
index 9dfdd8f67319d3..7e3ea8b31151b3 100644
=2D-- a/arch/arm/boot/dts/nuvoton/nuvoton-wpcm450.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-wpcm450.dtsi
@@ -2,6 +2,7 @@
 // Copyright 2021 Jonathan Neusch=C3=A4fer

 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/nuvoton,wpcm450-clk.h>

 / {
 	compatible =3D "nuvoton,wpcm450";
@@ -30,13 +31,6 @@ cpu@0 {
 		};
 	};

-	clk24m: clock-24mhz {
-		/* 24 MHz dummy clock */
-		compatible =3D "fixed-clock";
-		clock-frequency =3D <24000000>;
-		#clock-cells =3D <0>;
-	};
-
 	refclk: clock-48mhz {
 		/* 48 MHz reference oscillator */
 		compatible =3D "fixed-clock";
@@ -70,7 +64,7 @@ serial0: serial@b8000000 {
 			reg =3D <0xb8000000 0x20>;
 			reg-shift =3D <2>;
 			interrupts =3D <7 IRQ_TYPE_LEVEL_HIGH>;
-			clocks =3D <&clk24m>;
+			clocks =3D <&clk WPCM450_CLK_UART0>;
 			pinctrl-names =3D "default";
 			pinctrl-0 =3D <&bsp_pins>;
 			status =3D "disabled";
@@ -81,7 +75,7 @@ serial1: serial@b8000100 {
 			reg =3D <0xb8000100 0x20>;
 			reg-shift =3D <2>;
 			interrupts =3D <8 IRQ_TYPE_LEVEL_HIGH>;
-			clocks =3D <&clk24m>;
+			clocks =3D <&clk WPCM450_CLK_UART1>;
 			status =3D "disabled";
 		};

@@ -89,14 +83,18 @@ timer0: timer@b8001000 {
 			compatible =3D "nuvoton,wpcm450-timer";
 			interrupts =3D <12 IRQ_TYPE_LEVEL_HIGH>;
 			reg =3D <0xb8001000 0x1c>;
-			clocks =3D <&clk24m>;
+			clocks =3D <&clk WPCM450_CLK_TIMER0>,
+				 <&clk WPCM450_CLK_TIMER1>,
+				 <&clk WPCM450_CLK_TIMER2>,
+				 <&clk WPCM450_CLK_TIMER3>,
+				 <&clk WPCM450_CLK_TIMER4>;
 		};

 		watchdog0: watchdog@b800101c {
 			compatible =3D "nuvoton,wpcm450-wdt";
 			interrupts =3D <1 IRQ_TYPE_LEVEL_HIGH>;
 			reg =3D <0xb800101c 0x4>;
-			clocks =3D <&clk24m>;
+			clocks =3D <&clk WPCM450_CLK_WDT>;
 		};

 		aic: interrupt-controller@b8002000 {
@@ -480,7 +478,7 @@ fiu: spi-controller@c8000000 {
 			#size-cells =3D <0>;
 			reg =3D <0xc8000000 0x1000>, <0xc0000000 0x4000000>;
 			reg-names =3D "control", "memory";
-			clocks =3D <&clk 0>;
+			clocks =3D <&clk WPCM450_CLK_FIU>;
 			nuvoton,shm =3D <&shm>;
 			status =3D "disabled";
 		};

=2D-
2.43.0

