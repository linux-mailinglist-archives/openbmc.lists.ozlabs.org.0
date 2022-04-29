Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB485151D1
	for <lists+openbmc@lfdr.de>; Fri, 29 Apr 2022 19:26:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqfXb0PBCz3bdg
	for <lists+openbmc@lfdr.de>; Sat, 30 Apr 2022 03:26:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=B7xslFnJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.22; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=B7xslFnJ; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KqfRC6CNlz3bdg
 for <openbmc@lists.ozlabs.org>; Sat, 30 Apr 2022 03:21:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1651252851;
 bh=jFeo/rlMoN3F0JvMc3759b06/L1UffYivvp83FqyW6o=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=B7xslFnJ51XNV2ADIknZnclvBN0gfTSbt4TcwaSv6Ps3K+/Dr4hBlmEskFceY0gA5
 pkV1tifXQaZge56H52Mk/d8OIJng3txyPTfXLb7nIih4fsU/1nMB5fQMevpOWUmbK0
 TUhRci4P0rZi/jKgsQoEs8eid301qNizICHYK8sY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.103]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUXtY-1nKByF2qyO-00QPKS; Fri, 29
 Apr 2022 19:20:51 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v2 7/7] ARM: dts: wpcm450: Switch clocks to clock controller
Date: Fri, 29 Apr 2022 19:20:30 +0200
Message-Id: <20220429172030.398011-8-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429172030.398011-1-j.neuschaefer@gmx.net>
References: <20220429172030.398011-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CapGnF66PbIaJCrYydROSSzdBD4+jGIG259czWWFShncx/7mfO5
 n7LWPKDdswQhfnHBzXYt8/fCGYBOs/TNhEn25Fwffb80q+MwOOZ/NEiURk+UPXwY48HALAb
 FbieQhHcsWYBrn+zRmzCSCsAlAiOK8G3pN4hGDYJzh4lauaSbA0mrj4YIkwuAW/mxJDP71A
 WtSOAngqDLdX/T5fi7Z+Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:op7guGsTdCo=:wC4SD8Y6g9Umj7VnspIayf
 M+K6RolgpoBePq+LQFfem4hZ/4qtppk6wZv/b5ufzOtFf7pn5u7aptkk68boj8jPa3xOSKeCm
 gvipfpEuKYq6jwsFS5l3nUNpNTle18GMbLDwHoOBahGxOmNyZrl1pPQY5sl1IVs0W2F1iKeTR
 J74wtKyQBw9WsURuXNCp6j9F8MktBcPOo6HSVGT8H9HNV4Ti4fp53S6OzQS2la/BqcZWwPi7s
 wxm//FqpVJutc+WperY1CO5EBT9pMzH08efPnCua8Ek6xBeUKHtnAlxlxlLGDofQcJ95YEmRQ
 xA//2YdM7BrZXFuRtGcdGVn9QDRrVBMyOaT3bX6HwvjR9sEc4Z/IOWhfgPWk5hldVXknze4Vk
 uX9cBpXZMZkwBpg+1RqNzjyLrPUG1e1l1MAl/BUWM1sKkIu775SQJtBF8xgpBoHyl0sySYrqb
 WH8a1koFNspArjEaKdsgNa867z1EsE8FeV1ec2l4fTr18MdA/vC1eeab1Ib30aLklltfp76Cv
 xP7pcO7oPQZI/FWhPoFiFonH1RGGBNXuUqSQkwR8AKZN0aPpc/LoYUOUXnUXMgVdOrGXL9Y32
 z9R/fMTs0xz0hrXAoR12Y6uBZ4XGBS2eqdb3AuMNcadYYNHLWhPeXq8omoaZe1/kniBnF88Tn
 Mk6AZ31Wx2wrI5OCfEnJ2DxnIuz8w7QSUea1K/xzn2xj0B+Ef4fU9aj9jwFSJ4bEX3UGCWXhz
 qb3BTZJ1ELYrxLj5ocIlmWSxEnorHWa6iBGSsRFu4hv7wGTJFojL+iOvxrhhQlRX052pW7cuu
 Gk9lTUcxyeOvMHPGnnta/R8yeasFpp395WVdzy4c4GxowDOmNdkH79Od/BiXM/x1DxUtHjJFB
 lcVIQayLDqnFmRNEoYJ/8y7J2K4M9QJ+Tb/4W4RcHfO4qjaNWwy7gDGwQbV0PQfGR7pgL1/mY
 QcBCw+n+yE56UXHSAdTIDM3Uwh2Agsn7aNZJ7+LP4KSIk09Nmxas2hUkDrNP2j1zJgEo9NJA4
 yRJSkKhI/E9xl/lQQXPs+bEwm96qYbA5l6hDaoB9oFjin3r6pMCPubmsgXG9upCPTcKDBfxJ1
 xKJR09p/xyGTsc=
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

v2:
- no changes
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

