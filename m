Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7659851F0DE
	for <lists+openbmc@lfdr.de>; Sun,  8 May 2022 21:46:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxFDZ2PGGz3bf9
	for <lists+openbmc@lfdr.de>; Mon,  9 May 2022 05:46:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=RjEIdeqK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.21; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=RjEIdeqK; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxFB25Yjkz3bdM
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2022 05:44:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652039036;
 bh=ZMFFSXatdPBOGp95nTHs++I59HrGyDFQ5G/SIMPqqhM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=RjEIdeqKWDmOJO5dgr+BdpN++zY6zcrKaVZ2pnkcdtLw5XNe3asI7lmlLvJNsJyXj
 PvVtQPC7xkGaziwR5ghao0q6zoDZWd0jjllui6MmaX0xEHS7IoWTcVCaCHLusQ+ID6
 jZsZM3gb3oez8m7qJInVhpAihqewZ06TnaZY6F+Y=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.103]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEm6F-1nZDoV2X3D-00GJDe; Sun, 08
 May 2022 21:43:56 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v3 7/7] ARM: dts: wpcm450: Switch clocks to clock controller
Date: Sun,  8 May 2022 21:43:32 +0200
Message-Id: <20220508194333.2170161-8-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220508194333.2170161-1-j.neuschaefer@gmx.net>
References: <20220508194333.2170161-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kkDcTVKHYxQWJty64O/zo4HzicYg5+GXVtXaJFZY35ZwbBQKgYd
 zvZ0lSKISIrw6iDMJ30CaX1EaqdEq5W5IO9XJUBy0Gh7/8kqKAEiVS3LhmC6TI7z9IQucXf
 JqKzmNiJsHin8PcaWclRQQ5oU0oXvgvqiaouMJH5V6j0w9Kk4bgsuy7UwJU5jOzpZ74yA9m
 +xh6sCA5teAj0W96PLtEw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:h7PjhEGAGOY=:E9L81qjT7kzz0e1fwo1uT7
 hP7PDfwv9bFJoDbDNnAEoAeD6NEVYJPBRko2AGHhE2c4NefKXvFE+mKhavU6F132Pc0Ga84WC
 jG+5Oc5Hg0WtD7vI/Qx9dcU7qjLROxeUhOAQCNiNkhbKs2MoOwUver026OQbwrsPgPm4LBmOC
 TLdqKJ1RVwRv5ZSzuT7chMxc4qU+YdCrkHBF58CgwQDz9YZA9ZG20hcKyLodBiv5SIDQSDjrS
 mu+3ffQjErTwwkioRN/2l7Be4b8Kzi4BcXTyLyL+CyNQT+bqRhIn+gQy8+Ye+RwPXOU+xipyd
 6F1JK4aHJf6SzOJdNmWBUKNtkx8+p1SnJeVtjU6VpGuAIowdksfXwih+1vhYwFHR2benybRk3
 E8tSm+YyqXHbPjjDqSkxn/5wYNXHfU6Vz/euXhJEVHPru0tHID+wPfTsSEKXfNBSSnfiYsT0E
 bbnHBmOe9CRkNO1noDUUixS6PItcivvP2Xo33MeSXE0eXUewx3f7xZnJG8xJA+Ggc0QavlIfn
 Hp6K9ZScZ6kAEBkRwPJrJuHhHsYdxFtRfdSyhjVQsAcZcmZrXYZv0sh/LB+8zpTSRu/NLoOFM
 AKfvDfBq+UspetCK7m3vnW7RCbvg2nIL14mwfcp02+y+l+uoB7d+Sl5U8EbFRlD6huvwpexvv
 ghDkuJ2yrptKI1a49kcTtECiYe+KNtR1BO+zEgTeM+TG0FNH3fq6lLcivQ6Uk+YycR1BTFNfF
 3bU+WjihzPQF4h1OgOIHULAngsFKFw4FYFxDMXHp42pKDuJF7s+UhCKqZVDTpqRitgHEuG6JA
 BGtlo8BSF/TUlG4lwa7q+FcIwQEOLQQh1GalrIieqlKkeHNaeLuTGLlckdF0RetlbtheLLhqE
 Vp0SWHJDzskYAcEw6xGZdaLrBLQb9afN+UoydsSlz65hBfErrB/VC+v+HGnrxzsyn64s0Vlm4
 tq798DMw7fpFLru9XucyPLtcNsGmQbgr2KZIgHvrJ5xGnlX7X+s1dfhULtOO8gS5FUYmLHwKi
 7iibNhowRvgn9ewxJwU45M1lLex5AsQdEEFWnYMFkZ+9qi6BFFCHMCFTP1QmAgqwrQGhC2oME
 C30VTj5QQgijc0=
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
Cc: devicetree@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Patrick Venture <venture@google.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Avi Fishman <avifishman70@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Tali Perry <tali.perry1@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Guenter Roeck <linux@roeck-us.net>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This change is incompatible with older kernels because it requires the
clock controller driver, but I think that's acceptable because WPCM450
support is generally still in an early phase.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--

v2, v3:
- no changes
=2D--
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi b/arch/arm/boot/dts/nu=
voton-wpcm450.dtsi
index 515e943787416..d5ed95ef810e8 100644
=2D-- a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
+++ b/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
@@ -2,6 +2,7 @@
 // Copyright 2021 Jonathan Neusch=C3=A4fer

 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/nuvoton,wpcm450-clk.h>

 / {
 	compatible =3D "nuvoton,wpcm450";
@@ -32,13 +33,6 @@ cpu@0 {
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
@@ -73,7 +67,7 @@ serial0: serial@b8000000 {
 			reg =3D <0xb8000000 0x20>;
 			reg-shift =3D <2>;
 			interrupts =3D <7 IRQ_TYPE_LEVEL_HIGH>;
-			clocks =3D <&clk24m>;
+			clocks =3D <&clk WPCM450_CLK_UART0>;
 			pinctrl-names =3D "default";
 			pinctrl-0 =3D <&bsp_pins>;
 			status =3D "disabled";
@@ -84,7 +78,7 @@ serial1: serial@b8000100 {
 			reg =3D <0xb8000100 0x20>;
 			reg-shift =3D <2>;
 			interrupts =3D <8 IRQ_TYPE_LEVEL_HIGH>;
-			clocks =3D <&clk24m>;
+			clocks =3D <&clk WPCM450_CLK_UART1>;
 			status =3D "disabled";
 		};

@@ -92,14 +86,18 @@ timer0: timer@b8001000 {
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

