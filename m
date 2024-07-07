Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E12929A14
	for <lists+openbmc@lfdr.de>; Mon,  8 Jul 2024 00:42:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=hOKbzxsM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WHMhL4l86z2xdg
	for <lists+openbmc@lfdr.de>; Mon,  8 Jul 2024 08:42:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=hOKbzxsM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.15; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WHMb629b2z30WB
	for <openbmc@lists.ozlabs.org>; Mon,  8 Jul 2024 08:37:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1720391853; x=1720996653; i=j.neuschaefer@gmx.net;
	bh=6OXJA6Op8AyXGG0UDDxLGH3tvgeicFvPJqUw6T5kUbc=;
	h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hOKbzxsMT2Z1GyX9OwxlQ+9XPM6+mGdULGj8hltvpSZIL5yXLH2zBvg4GwhmOf6o
	 XnIrrp8nqWM2ilWx4CxTz7DrbODRIe+cbgQDRkENhwvqXVOg9nmTgSxebylqcEcHs
	 wcxMWh6KEPe5s3kX2ftcEGBL6CdEIGD46o0GgYjY6/J9XaNBoKQlT6sZFwnyPYuYQ
	 49AxXuqG+k8rAvr1WRFgxulTOyuWsibZ5WQRUuYQEo6lhF+/KesM7dAisEXw1XgZ/
	 JUHGPn5P/mIlG4NNlv6syrW4xW2kaznF29zz/tiunP/i+kyNleUJ0wzDkOOqTOJ8l
	 2UQlsNmcrvc1VoRrTw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.46.161]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJmGZ-1sfm0i1AwT-00Vjvf; Mon, 08
 Jul 2024 00:37:33 +0200
From: =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Date: Mon, 08 Jul 2024 00:37:19 +0200
Subject: [PATCH RESEND v12 6/6] ARM: dts: wpcm450: Switch clocks to clock
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20240708-wpcm-clk-v12-6-1afac539c37d@gmx.net>
References: <20240708-wpcm-clk-v12-0-1afac539c37d@gmx.net>
In-Reply-To: <20240708-wpcm-clk-v12-0-1afac539c37d@gmx.net>
To: openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720391846; l=3443;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=kTIwYF9CzV7EiefFtPbjPQBui0vN/ls9WsnRdurtK5Q=;
 b=Jvhw7ZM3sg31yGmqSFi0QKOVXKPvvAROu66FWKbLZAcKxN5/88ivEgrnqzKDsxkrK2dQjq4LR
 lEnoN2gxMbPD0tT/H9ln+/BJvKMw6b5dkadiK2UXV3lp778putQyqcj
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:Cfn7sVF9yJmxe/Rug/YHADGQRtYxP4GTFoYDHCfBOqRyejKpixx
 zjWkeIq3n1/umG4CO43FAvpr6GIJze1xiQGuHbMGYU5zWIJLwjXV/asPng+xmkb1EPegY5c
 4aQjlXfAIPLEVRBx8r+F0XvrqLII4bVOhVsiONVGlouM+qIaDcbs/TR5616GQRMafq/AW4Q
 22Nng/9LzJ/HWAzviFkmw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Z5q+TLdM1Og=;3GqVIYz92KmRvpvMABWudVwtk9q
 Trycz/qINNm5TyC0kML8Zf3GTSbjjzAlAexwK4fAo3ZBqxsjx1xXXiVesfmw75RBJQhCEIqM9
 7CgWq7RL8GmNSJLVMnxsICjYOV7kP4tq2VGKFVjlV6l9v2d3qLRG+rNRzwnYhs3VlNkt+jFgD
 7/iHo3vwzj5Rf9ilLsIrCnVW1efIT+ZTTd0lk0DJl3ZfLEH2HeyQ9SNnerVYpQOv7mEP9tzVo
 ZCowKaNKlDBN7XMmhiKvuPDcOEyNP2GFGv8q72YNLZAZSVVEPohhs7XYM5UqzGdVo/vaRySsm
 90u235xz97YfCJvbFVRg3WthJnlmfm531/4RrtyzZ4jsA21bt4Nx2lZNWvrLn2d86GEag++v0
 IcSPb3ipgPoO2w5n5sTaPsHAZFUHu8QAMKClY0Ad5Dv7bWNaI56AHFyAzd9OD0sWti3rlaVgi
 9FdCtbaDhzXudzLpVdZFIPeMRr9bG9f8eAdKaT8z7hmkCN80Q6sMPjUXhW/g+Ya/cpFY2vkPL
 4XkvU65kWJTEiRv8WrtVcAJYt59hvkQ8PZluRJHt5CBqriWBgJL2gCrpLLxwbSuS9NrVY3Ql7
 XmFLYjfIBtPyP6KAvlirDQOH7nvZZzZ/ZI7CJv13SiLSq3tUGELno5IusnjUD2N1/hywY7rx3
 aUBkF5hoWWckj+UX1y8WIT6fWldMVCAPZMY635NJIEXbIHk+5ToiUMHJLInkxC7dGgj16WvOo
 VMHKDtj+aMW6/FC/f7E5/L++SbwjQY8x6xUOrgUQmaPbmDbQddAohJs5jRinyOtc/LLlekEUr
 +H9kSoOau6s00wfyUGvPCEIjLvJWmwTcczhksqcSjXN4o=
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Joel Stanley <joel@jms.id.au>, Philipp Zabel <p.zabel@pengutronix.de>
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

v12:
- work around timer-npcm7xx driver issue by providing timer clock separate=
ly

v11:
- no changes

v10:
- Reintroducing this patch as part of the clock/reset controller series
=2D--
 arch/arm/boot/dts/nuvoton/nuvoton-wpcm450.dtsi | 32 ++++++++++++++++-----=
-----
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-wpcm450.dtsi b/arch/arm/boo=
t/dts/nuvoton/nuvoton-wpcm450.dtsi
index ff153858801ccf..daf4d399ecab4c 100644
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
 	refclk: clock-ref {
 		/* 48 MHz reference oscillator */
 		compatible =3D "fixed-clock";
@@ -44,6 +38,19 @@ refclk: clock-ref {
 		#clock-cells =3D <0>;
 	};

+	refclk_div2: clock-refdiv2 {
+		/*
+		 * reference oscillator divided by 2, as a workaround because
+		 * the npcm7xx-timer driver needs its clock earlier than the
+		 * clk-wpcm450 driver (as a platform driver) can provide it.
+		 */
+		compatible =3D "fixed-factor-clock";
+		clocks =3D <&refclk>;
+		#clock-cells =3D <0>;
+		clock-mult =3D <1>;
+		clock-div =3D <2>;
+	};
+
 	soc {
 		compatible =3D "simple-bus";
 		#address-cells =3D <1>;
@@ -70,7 +77,7 @@ serial0: serial@b8000000 {
 			reg =3D <0xb8000000 0x20>;
 			reg-shift =3D <2>;
 			interrupts =3D <7 IRQ_TYPE_LEVEL_HIGH>;
-			clocks =3D <&clk24m>;
+			clocks =3D <&clk WPCM450_CLK_UART0>;
 			pinctrl-names =3D "default";
 			pinctrl-0 =3D <&bsp_pins>;
 			status =3D "disabled";
@@ -81,7 +88,7 @@ serial1: serial@b8000100 {
 			reg =3D <0xb8000100 0x20>;
 			reg-shift =3D <2>;
 			interrupts =3D <8 IRQ_TYPE_LEVEL_HIGH>;
-			clocks =3D <&clk24m>;
+			clocks =3D <&clk WPCM450_CLK_UART1>;
 			status =3D "disabled";
 		};

@@ -89,14 +96,15 @@ timer0: timer@b8001000 {
 			compatible =3D "nuvoton,wpcm450-timer";
 			interrupts =3D <12 IRQ_TYPE_LEVEL_HIGH>;
 			reg =3D <0xb8001000 0x1c>;
-			clocks =3D <&clk24m>;
+			clocks =3D <&refclk_div2>,
+				 <&refclk_div2>;
 		};

 		watchdog0: watchdog@b800101c {
 			compatible =3D "nuvoton,wpcm450-wdt";
 			interrupts =3D <1 IRQ_TYPE_LEVEL_HIGH>;
 			reg =3D <0xb800101c 0x4>;
-			clocks =3D <&clk24m>;
+			clocks =3D <&clk WPCM450_CLK_WDT>;
 		};

 		aic: interrupt-controller@b8002000 {
@@ -480,7 +488,7 @@ fiu: spi-controller@c8000000 {
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

