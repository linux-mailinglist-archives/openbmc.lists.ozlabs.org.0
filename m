Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C47D8545D48
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 09:25:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKCDF5HMFz306l
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 17:25:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=NL+S91Nd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.22; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=NL+S91Nd;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKC923d4Kz3000
	for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 17:22:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1654845738;
	bh=6We94l3lbFtVURMV4QMSE5PpvIk0qqwAzLwUr6CCrCw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NL+S91NdZDtjFCi8UAx+8CdEsO/P3xL+aRxK8SCTk6/qo5Hc2DLa/4/1WIf8XgZnb
	 n2H+q38MKZRAIw2OSxvUd6+3BMqKCU9CgbUXBZlT4hCoCmBkUtcVvPUF8cPB7YvlN6
	 Q4fFPNbuwbaAeekoxkPVbCMrHWNalXFQeab0TLf8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.195.3]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MG9kC-1nyQNB3YWC-00GWNP; Fri, 10
 Jun 2022 09:22:17 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v4 6/6] ARM: dts: wpcm450: Switch clocks to clock controller
Date: Fri, 10 Jun 2022 09:21:41 +0200
Message-Id: <20220610072141.347795-7-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610072141.347795-1-j.neuschaefer@gmx.net>
References: <20220610072141.347795-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:a+f+h0WVs/fv4wcts19D+GINBFdJUog3YzlAfih/ywvkXDMuV6O
 J03O9XTJW0v348QMAv+oxGA4CgZP2NVhaLr58/c+oaGf2aY079XyF7dycZEj5F9uEY8WuSS
 WGvzILZLGTMf6ea4C2OtAqe0n4vdZuhABnmzln0Ice39p7lrFGIt/lYUmjQQJk5bFHoWD0z
 MrO7bfY2wWt+gbIbCNoaw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0XrQDZfgnAw=:fii0JarWt4mr8rSUZPxTiR
 03W/bonVOGBCZFyYYvjkQ32o4n6VHB9a30AonqPpRe9QftC/YyoM8f3+W4aIgN5UG2qOeFRJ1
 yqLGnK8HDFW3S4QlBBBbynOAau/eh9MVnd7cwTkXryd/jSTtqX34Lnt7BtV/ZkxKinJtYD+Cn
 PVljnCCEbR2Ar+6Oh9ah62IRHcDC/yJ1HS8+geCHuUeWk15UXgpz+aQlXqMtHJZsGAGuxGiNc
 FVIFTd7rlYcpVF6d9UwJoDEvIuPPmCjbYdlolwoM+7fpO2WKoxvA65GH6OBfeEc0j7Fk8YOFZ
 9BCC5r74Ioofwb3OWiDsqA2Mk81/njHm1t9ddSNGlI/t/3nyXC0Gg3zhF7v8264x1kVYuowbU
 kaySeHk9OBme5uznoP+VdaZLE1U6Gzb+jC3VMoN+JPPkAsqfmM7ssLYrX6G762xMVz/sRwKfz
 mc8WRFSYi03owDqUdHd/LLcBzIg6Bk+N6xRM+0/HSprq4DenVgCaEHtFt0ujafAtZW0SQ8FPR
 nNY42B8wTSKYx9ox2dxQt6v2J7yyvHdo7yR4kvO2P3vkU7mqEtIvKegI/hZws3bWA+TLQiOcX
 yk5MnrvRPoixjbSRT1Pc02lLddhMSJ8jLTZarPMiZlhGEOfzhuPz+vKdCLKJk46+6fhula5Kn
 8cWq3nNNLIIb+ijp3HdHkl8tcF3wnwuSVBWY8VYWDnfUM8dTx2E6Yz+VkHQRhKa/glUocq7O6
 kBiyT6H040wPWyY9xyzvAh2+4dM4EJSnL4SXnU+vubEq4vIEk/Y5NIoEVtedaQo1ZzFcU3Kq3
 ODYFPz7CLbk2ks5h9mmUeDn9l/sdNWS6QDEHgwXyGM5mdT3AWLoE7M6CElA3TqHseahKN7L1E
 ib63guKn6o42VIGa2gJlPbkMVtTqOsyz5TOXcIEqlFxfs0dcznPzOAe27ClFr8EZ6Bgc6KlfO
 UioZpvAFA0FObzAKDPVAQG4qkhz3T+b6RHq7CtBCOnC58eOexgEM3vpvdHBZjozhRr/cvsL0t
 BchZ/5UPaj46VNC+MNQVqqsCmUkHh2H9sxZ1N9Mk6KkHGuiEjDoqbA4etqZpa4YuSkXuIwV+j
 0jxkV60KpSw0iVgSx5kgKLIzotYwnodTYFGYTNYpsg0TubSsKeTVu3hNw==
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

v2-v4:
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

