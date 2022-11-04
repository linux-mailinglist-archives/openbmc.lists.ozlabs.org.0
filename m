Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 848A1619D04
	for <lists+openbmc@lfdr.de>; Fri,  4 Nov 2022 17:21:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3m8S2QrTz3ccg
	for <lists+openbmc@lfdr.de>; Sat,  5 Nov 2022 03:21:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=b7s0Z+KT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=b7s0Z+KT;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3m6m4bMJz3bky
	for <openbmc@lists.ozlabs.org>; Sat,  5 Nov 2022 03:19:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1667578751; bh=MBljRn36u0FL6eNZY6eErtpM03PtwqJkbltkRok4Li4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=b7s0Z+KTIeqEHxHDUdWI9aKPAt+V65qGQebEI6Z3VCLgoEt+ntJjGUdU+DWWYBDiS
	 VMvuhSZimoXNVhLzUtTGaqVT0QeOGAjvQ+ipYZ9VO/wJxH3y0IrfzeDI9engdAKrMT
	 0NPblUT8o/V7j6VZQnXBNmzTfG58pWA1g14rKHOCwHksTepTycL4kVijVCps9nlPDY
	 +DCBeFKr5laZQ8Y60lIZ9OANqszQ3//Aa+vmFxqk0tIPr2g2NhU2wfcEgoHTfSVcz7
	 haoh9VWJ0xBLxWscW2oRn9V2Uobk5U/xq+wdf2k6Rmk+a1n5FhtqE+ooVS9LNbJcQy
	 ixD0He1C55ugA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([95.223.44.31]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M8ykW-1oup9l2QBK-0065Zs; Fri, 04
 Nov 2022 17:19:11 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v5 6/6] [NOT FOR MERGE] ARM: dts: wpcm450: Switch clocks to clock controller
Date: Fri,  4 Nov 2022 17:18:50 +0100
Message-Id: <20221104161850.2889894-7-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221104161850.2889894-1-j.neuschaefer@gmx.net>
References: <20221104161850.2889894-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MYaeCPeDHwfn24gZVmiUqk9z7xM6e/jUPy6MKhIikdpA3HBDwFz
 UPp6tSuHKU/z7b7PsJjllo3vmeFJZptVEU2QXAHNiY2I8AJkob0mzz/qwVYoQJYbkBAD+Dk
 xKVhac7D6yIJca8gtyFgqTjzTz2zPPm3I1es/04qTDxDscDKf0doEVfyMw93mvBqAG0LFoM
 3Ng60zXjhmxenOm0K21iw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:H9UjfNO3BD0=;kgrWtE3l80XGZSPTutt39o5kwnt
 tMldVm6TmhS9PqJSDVDvROfSM4rYukkyJAsxSKKPi7dgzvIG3GUYsHuW/dOdqn2Cow3EpwyxM
 5Iy3vl+0G2Jr2LvKUHz5sRCAZgpn6HZSyUhHYMPCdhzUbWu1mDggnQpD9r/AXNAzi/ZDc7/ge
 5i1w0qZcYXrUu3eKlynm9xXpDWfRmS/MoK7Z7bUzqnwlJR8KsIEkNPR+CuLS6zahqHTpFTgs4
 n9Ly50nI9gdX5MTw0gO/bqtljAnVSk+U8/MQu1wKQ1bD0rJ8087Xx8MSB448YP7lUNQoP9ElD
 3mLkuj+bdlA9ukKpXeJ0EUV9owNOg1kaOdzpmir3KWddJValLUIeWAWKBFVkExzWB7Pdt0wAu
 N/Xzdvh3kc3ueS2J+tfaa7mfQ+Bl9B2Quuw6YPM/ViekkY06/6wQmyRX9L7uoiFDuCkzd6XI6
 L+5WMZJfyrggVRcdiDwdTfDTF7DENd+c9EE9Iuwz5q0EozRzkPV0SMcrbrow5blKiLUNrFAd1
 67fyj8RXn8Z1VuVk16Stlk62ScSoTfpbyIZuPQrrKiT+RizvhX9hSGr7z8+OYiKZa1zcrWUU4
 zNZFT4PLC5wClZBT872ZdEUOtEj5G8uqMO9tzwrhA66deLNIUASfNDqbeapanb57mm8e20SPx
 3q6c9LfFN4DraqBEL1q0QZvp5GAfQGafrEPYLkCog9K5sTbvLe6VTXNckL9bjJ2D5Y4bOAGLw
 BLSOkOWQy81gdBvzYv2RQ0QeIR2pjNFe7G/XbLMyL0W3GLq+2MjvcopTD0UwJhHZfWXsTz4AG
 wEfY7ZPT3FGErm+ZfrptAl8C/Pp4psjCHlo9Yjr4BVygnMKZXjVNwCgY0uSNP7cuKFPFaNLox
 fJegGfD5OF89PN89qdPpOi5miGgk2tj1oIDBR6dQKXILGaDGknOW0kFYBw5sutRLtUgFZBlCD
 EQ5XFqTKKdSMCyOzz4uuXDZUopg=
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
Cc: devicetree@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Patrick Venture <venture@google.com>, Michael Turquette <mturquette@baylibre.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Avi Fishman <avifishman70@gmail.com>, Rob Herring <robh+dt@kernel.org>, Benjamin Fair <benjaminfair@google.com>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Tali Perry <tali.perry1@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Guenter Roeck <linux@roeck-us.net>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This change is incompatible with older kernels because it requires the
clock controller driver, but I think that's acceptable because WPCM450
support is generally still in an early phase.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--

This patch is currently only for demonstration purposes, as it will
break the build if applied in parallel (going through different
maintainer trees) with the other patches in this series.
I will resend it once the other patches have been merged.

v2-v5:
- no changes
=2D--
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi b/arch/arm/boot/dts/nu=
voton-wpcm450.dtsi
index 332cc222c7dc5..439f9047ad651 100644
=2D-- a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
+++ b/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
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
@@ -71,7 +65,7 @@ serial0: serial@b8000000 {
 			reg =3D <0xb8000000 0x20>;
 			reg-shift =3D <2>;
 			interrupts =3D <7 IRQ_TYPE_LEVEL_HIGH>;
-			clocks =3D <&clk24m>;
+			clocks =3D <&clk WPCM450_CLK_UART0>;
 			pinctrl-names =3D "default";
 			pinctrl-0 =3D <&bsp_pins>;
 			status =3D "disabled";
@@ -82,7 +76,7 @@ serial1: serial@b8000100 {
 			reg =3D <0xb8000100 0x20>;
 			reg-shift =3D <2>;
 			interrupts =3D <8 IRQ_TYPE_LEVEL_HIGH>;
-			clocks =3D <&clk24m>;
+			clocks =3D <&clk WPCM450_CLK_UART1>;
 			status =3D "disabled";
 		};

@@ -90,14 +84,18 @@ timer0: timer@b8001000 {
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
=2D-
2.35.1

