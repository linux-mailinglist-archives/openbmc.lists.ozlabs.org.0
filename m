Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E171287784C
	for <lists+openbmc@lfdr.de>; Sun, 10 Mar 2024 20:28:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=KSMmSzhZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tt91Z4pyFz3cVd
	for <lists+openbmc@lfdr.de>; Mon, 11 Mar 2024 06:28:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=KSMmSzhZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 325 seconds by postgrey-1.37 at boromir; Mon, 11 Mar 2024 06:28:07 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tt9133WXyz3btn
	for <openbmc@lists.ozlabs.org>; Mon, 11 Mar 2024 06:28:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1710098882; x=1710703682; i=j.neuschaefer@gmx.net;
	bh=Lc1pMRgsV+StSf5fgFNpvmYafFqXYMKdh+E4JPDHkIM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=KSMmSzhZdH/DubdvIiLid0lUEXJbPY1f7gSdBwVylQeesC7Ki7Vkg2hTobC81NiZ
	 dAnoyMhChLWm4d5V5ffU4ey/o6abf6qGNmj8UdPqPdU0NJrwTeOaan97wI6InDfSM
	 adEJDl1YDm/FtbzeiP1sWo6jNLu1nQCQLyyA5lpL0cCjtK98RnS7dl0BVSHje4yaU
	 WwMM4IQBuPCPh9PCYg8/oGKEuqFE/zMIqv8S5dx2ykU+IDy/mnzL+8VcXp3merB4V
	 T+cmVP8dVFaWpMSjhCmLYva+Ff/FO8kZIGPrirNMS2fDIu+rhsr8I+5s+ji5v//rI
	 Bfj4FbJKIdNf3ls1rA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([78.35.216.168]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MgNh7-1rBBBJ0KLv-00hvec; Sun, 10
 Mar 2024 20:22:06 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v10 4/4] ARM: dts: wpcm450: Switch clocks to clock controller
Date: Sun, 10 Mar 2024 20:21:02 +0100
Message-ID: <20240310192108.2747084-5-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240310192108.2747084-1-j.neuschaefer@gmx.net>
References: <20240310192108.2747084-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CZOP/2JyhuYMjvSoJftgiK/2nFIgRon1+neVh/LZn4z7J6VfK+Y
 phi/XYNwa4bSKC6jy9/3KudhpuaCSWhKSnAvYt0goG/vWKXb0E9SIIDCkWj6VF420nX5Wa6
 Np3/bXESt4ZTzvjlR4m8nFawznti+83B1GljuO5cYG8N+gcWJbGj0tbZN83upD3iWlEP/GK
 ZseouWgpoYKKzhSS+0NvQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tGAWbs6apBk=;uxYWua3QHt2dYmjgOorlzJcIWhI
 44mZrq34upeYHz1w2eJ3eXA8+jts2ywcQ7KX3xbNaZMDg2OkxM9IKAkP9Lf0+h6W3Oduxzccb
 W5oiMZK8TFnxvVEgSnFnwoEgYnaO1Mj0myZbo9ukY0OIB1JFHEppcvzt2vp9TjNZpuG7PbZRo
 V/lB4UYPvaERXwGfKbd7N+f6lC4lQc0RflmXAljmmc/3vYdjtu0XmJU7awU8JFAlLtiqpYf5d
 g8z+7WdGrakDGZ3mtYs0iwN+4/QMjNoHwh/F5ckEd3GGcOHeJeupbWH4U9ef6m8XqSY3qujMS
 ww3EVkQsQz36+KojkK+KCVvPQt7WCEPsuR0iZNesQQ+1S1WMUe+B+8eiRLIaMvouXPbmHNnvV
 EJlSUqbZBAuPe9s552zsYp+LNrviy3tgID71fK3Qvoo11PZkGApC/Iwnj9Dvg0jqNRl+xddF+
 okKm7QAt6Vxbr3pZxsxMZcWxIZR1SOGLK42v0dVHFxpubg0OoX5k2FPM8aBr83afRwiXIP9jE
 quHUWlPo8FXA9wU6us+EzdsquVDtVA0lcF4QdF9NhPfvsd6VfN7rLA7/qr8OYtHX270Ugr2AK
 MxFFSXk6Toh5XdQ+iGdzOn4y6qw/G1WidjVvHYRmt66QzMq8A6DzRchIutnH95BfDPHCC+nas
 /+X+koYNlGV9vWmPju2hhyhnuexO/9mPNccThYAhUki0r/dXt5xnI5S8R1S31FGGNmLqWBZcH
 GwRHBP8u8SnFRBuWnvcTqxe0e28Zx/se2KRaWGS51BYwXv2/j9hWUWU+ukOMgYpjAOYxp88K3
 TlNoAqCjTKQD9zXK7+namTotDPifxXNB34dC3HhXVw+zQ=
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Patrick Venture <venture@google.com>, Michael Turquette <mturquette@baylibre.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Avi Fishman <avifishman70@gmail.com>, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Benjamin Fair <benjaminfair@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>, Tali Perry <tali.perry1@gmail.com>, Guenter Roeck <linux@roeck-us.net>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This change is incompatible with older kernels because it requires the
clock controller driver, but I think that's acceptable because WPCM450
support is generally still in an early phase.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--

It's probably best to delay merging of this patch until after the driver
is merged; I'm including it here for review, and in case someone want's
to set up a shared branch between the clock and devicetree parts.

v10:
- Reintroducing this patch as part of the clock/reset controller series
=2D--
 .../arm/boot/dts/nuvoton/nuvoton-wpcm450.dtsi | 22 +++++++++----------
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

