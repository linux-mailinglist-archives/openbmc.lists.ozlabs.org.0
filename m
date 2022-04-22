Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E3250BFCD
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 20:34:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KlNP06Hnwz3bcW
	for <lists+openbmc@lfdr.de>; Sat, 23 Apr 2022 04:34:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=Go7zofTF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.21; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=Go7zofTF; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlNLS3KSnz3bZC
 for <openbmc@lists.ozlabs.org>; Sat, 23 Apr 2022 04:32:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1650652318;
 bh=6YuxGgl4dOw9oAtmXhuC816ahBzK2oYrigEc+RKljBI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Go7zofTF6VMJRn7qW+oJommJYwhjfFcXJzv5LakxOCslLGDutZ6HaggT8fztUwkXn
 qAjfRNfUQqiAY/quf7Zvm4kHmvmolRVq211U4H14tfh88R4GzupuLV13PIZUinAkVY
 S1HeXSRtjgLKj1YKMKrkgRU8o8EoBt/U0Y2KsV2w=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([87.78.190.74]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7iCg-1nuMSS1S6M-014olk; Fri, 22
 Apr 2022 20:31:58 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH 7/7] ARM: dts: wpcm450: Switch clocks to clock controller
Date: Fri, 22 Apr 2022 20:30:12 +0200
Message-Id: <20220422183012.444674-8-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422183012.444674-1-j.neuschaefer@gmx.net>
References: <20220422183012.444674-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:I67tF9Nlj04Phq6/V+ryuFf0Cliytuu3Zmf4FI2sPERSmiXM3XH
 R2sSgG7ktBlSjy9OdFQrd6Ec/8zwv1ZLrWy6vGPGRzJYTJArz+9bFEhqtpLtcF+CTwEUHq6
 BpWfwBxU2AxUAF5JBamEAauV775wUODEbE6nCW1yOWZPbsvznU4uZmjcPzjJRpLIujUNFFB
 ooGmDpfMZ9LxJkCORbk5A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8c54XHSt3ac=:psA86FAB40KotvKaXr6W0Y
 wCL17K1pimNjF5dquW7DU2tt03i/m3ex/mnWKTxeiSFqDogjnxeTMf4lJPtoaqdxBTMdbZYBY
 tZPZg7l/jzHhniSnCujCZ7XhdrjubncnSzGdwVXtUJjG8hVrUTWpddtPPR0en0a+OCUWgH/ML
 QKeKyN1CNH4O4VzpQEKoMeMb6U2XfD4NiaZ93AZrNR3YxhMD76AVY3jxOLFyuCk1vDulLgBY8
 1jklPSJNj/ZSea39mdgMU5e0WTc8CqmMTT3ICyYtU6PK7lmin3JvkjKJ3hnwhJmOrLq6WNt6w
 giYfzIUKUQDmdKF9S7vMpDHnd8DASR+SKtF/zGGeKxhpwHYosp7tVV6iClUjTG4IAXAhPd2dP
 pmV+V/cV00ha/fZ1/HEcwvXRChok8HNMV+epsnlIbw9lZWj32QMcpwQoKnEzG5QbxY6QIOnUr
 pFlB1FaNGcS9PyetgcLTrrLOAWWeireG035G/kW3KHnQR0an9wG9lpiISQKMhP1GqqIYpFBGt
 e61jm4+TIGFftMf5UwMjLyK/Sjw/GRP7dPTKUztWVKGgQ5Pi491C5kxhPyNVl9UwKuZqrAvJu
 /TR2//if06otGpwJpfhWnENL62+CwuWmvJDxwyqZW7NtDpcVm1XXRdM0tZykAAkCKDbfIRvtl
 ffDN8JUztcs4bqnNGZHXVo1uk6S6oiE9NFe7hzB3K5gkcSz61zgNQnysD2sMocZ7Oqbf8C+Fc
 NDFcwh/McjhFmZ9fqjus4YGICtiXGHVx2vVXBaI2CBMpDGHgokMXwHHrqLblp5q4xF0Ae7MIf
 hImxk3BsuZGViYNlrB2++iHEkxLBkzrAun3DSk9QnWq15ZmUAnJpxmGneAzYpoTFrgfXRgtlt
 8SW33KDhlympKpRNygP7UMX/P10W209j0GBZaBWeH5mtam55RcwRtY6QEFIKsbrTrghKOMuFx
 0lRYRimBM2TUIeLEz3ebCb+X7B/FRO7jN0Gv3I8DdVecSUzKqeDpVGIZzfwYv1jY6mYYdDwx5
 Ws1eFN1cHtt3A5/rn8y/FmibRGGzMAPz1asfL5N7Ujl7gCDDXR4Zh5TchoK2Og2Y7GYfLTIfn
 Etbdy8JIwXiS/c=
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
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi b/arch/arm/boot/dts/nu=
voton-wpcm450.dtsi
index 62d70fda7b520..f868bd7db009a 100644
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

