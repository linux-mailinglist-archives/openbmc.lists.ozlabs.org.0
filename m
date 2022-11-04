Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4DD619D08
	for <lists+openbmc@lfdr.de>; Fri,  4 Nov 2022 17:23:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3mBW6yL4z3cXX
	for <lists+openbmc@lfdr.de>; Sat,  5 Nov 2022 03:22:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=pF0UJd52;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=pF0UJd52;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3m6m5SQ8z3cJY
	for <openbmc@lists.ozlabs.org>; Sat,  5 Nov 2022 03:19:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1667578748; bh=5nTOWHVLx+MZr7NjLvj6ZC6mnVnRo8KPzHbjhk46sVU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=pF0UJd52/aoFrY9j6aW5ecjl4zTwGWbLjZdGdE5a2s3toZv4u+cabdtZBkk5O1oDJ
	 fTjBSuliX+AQe0TzgqrBoCCIMTfBXi50hRMgJ9RyyIo+7+po6iuK1ebUkdePSimxEl
	 WrDQB5ROVK3VWHEIN2xpLOK746BkidAW4A0u19Mt9ooBlQnQTBGFrFBPXV3eGoHX3C
	 LO036qKbFjUNYv/R1saX769DfDsgt6QF17QJtW3OeRjx+RoHP/X/c4s9fm25bQEWhM
	 5VwR373Am3wu21GW/3yPhKlk0FLGekFFUepaVz94peSjPnqNnP3Thk7D8NDz6pFLNI
	 AD3hoS8XL+cPw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([95.223.44.31]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mt75H-1pAi5F2ik5-00tXrC; Fri, 04
 Nov 2022 17:19:08 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v5 4/6] ARM: dts: wpcm450: Add clock controller node
Date: Fri,  4 Nov 2022 17:18:48 +0100
Message-Id: <20221104161850.2889894-5-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221104161850.2889894-1-j.neuschaefer@gmx.net>
References: <20221104161850.2889894-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6GvRklvuiyAtWqrEnqxNuJ2Hc85LbGEBI/GCoPGar4I+bEWfCpu
 i0tKTbICpY+FZVhd472ngdn11RIAaonUb0UVXfgtUIoWPuuxsPTn8E59MMQWpo+2o/t6dQ2
 XTqCnuyfrC2rYN4rlb0YPgzBt8Q1/+IMxuM2Qktm3/3AXPyj9Sxq4nshOqwU4exHo8FigD4
 oVALzHtdq9oBvvqyDsCpw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3f2zS5TzCt4=;IAeV4M4Oen9SP2XuT03OCcXQkfT
 EReOc8Rd+WPVqYjTKIzmrx+94zn5TMR407ldOXqk9l4ZwbLyflmVeDq0R+yC/RGTGYjTsc78V
 EUzbCcDgR8BLLFJN9ivjmvefdxYRv6plJSSWFqLYxOJRovK3SdWYSqAJ+wTo9t54NPSdZ/6or
 w2T35/DGf7VcU9M445YwXr/+9h6WvKjz2vlTXJpq23yoC2S4CM+oFS0MVfdDa2JbYLkNmw81L
 FeDupeOwxuGWUKzkB+9+ER2WR7c6WyG7Sjet/PfNOMMUM9t3Uw1m/HyfcsZHZ6IaHtjfcX2Y3
 jCm9omGRPoUyCjIBmUEHrtjcssj9fansfrPLFK8NYTbBFnkmu9uB5YRq9vHkB5sH6twX56qro
 hdbQcyS+EO8h/WdL89foTy+VImi913I8LLeHkot2xipqZ8U5bweH4MwvDInjQNNzcIo1cInwy
 3cJRTVS1K9Mzt/h14OnyNJi0S4IgYm64n0+yglOdotM67pnkZLspYJh2lwfKZVjyeCq+mtX+9
 xfF/oS0BbOJk2ye/fO7HYlQuUYl+ImEstolMKVxmYRaqoBtvqG40Oqqo4BxoTs5JS5ptjXqRg
 zetpCutRxARXJ50ohSJL4bQymyo9/X+pepcGfk4oQM2GQfYZK5gbHh5lDQ3zH1WIgYKIZWkQo
 BmqS7yX8awToAF2usdBXeU72J2N64UX1hyraGq+FI4m730XrkZpEHWj9xcK0qxiVFv9YNk6Tg
 21581uGlpdbYqdFbT3uW2EyLpcqe8Y19NZrAa3NnxDvUspj7mCe28m2qZ/YsX1KMeR+RsquKx
 Dj2KSQZLVPxXa5zfxBRe2O7/LZAbs/NzAkccAuAdpWvJvBnstVouKuWlDt4ZjxEiCXdPl+2AO
 Z44UsehWDpz4TJB9m66pkMSZZLJgPkpePJwT7tLsXkUUXNveepZqNE4OwQDhHJ24S6v7mwt07
 XYHl5SHqlqVEWWrRaVJ+03+VhJ0=
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

This declares the clock controller and the necessary 48 Mhz reference
clock in the WPCM450 device. Switching devices over to the clock
controller is intentionally done in a separate patch to give time for
the clock controller driver to land.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--

v4-5:
- no changes

v3:
- Change clock-output-names and clock-names from "refclk" to "ref"

v2:
- https://lore.kernel.org/lkml/20220429172030.398011-6-j.neuschaefer@gmx.n=
et/
- no changes
=2D--
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi b/arch/arm/boot/dts/nu=
voton-wpcm450.dtsi
index b9b669cd632f1..332cc222c7dc5 100644
=2D-- a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
+++ b/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
@@ -37,6 +37,14 @@ clk24m: clock-24mhz {
 		#clock-cells =3D <0>;
 	};

+	refclk: clock-48mhz {
+		/* 48 MHz reference oscillator */
+		compatible =3D "fixed-clock";
+		clock-output-names =3D "ref";
+		clock-frequency =3D <48000000>;
+		#clock-cells =3D <0>;
+	};
+
 	soc {
 		compatible =3D "simple-bus";
 		#address-cells =3D <1>;
@@ -49,6 +57,15 @@ gcr: syscon@b0000000 {
 			reg =3D <0xb0000000 0x200>;
 		};

+		clk: clock-controller@b0000200 {
+			compatible =3D "nuvoton,wpcm450-clk";
+			reg =3D <0xb0000200 0x100>;
+			clocks =3D <&refclk>;
+			clock-names =3D "ref";
+			#clock-cells =3D <1>;
+			#reset-cells =3D <1>;
+		};
+
 		serial0: serial@b8000000 {
 			compatible =3D "nuvoton,wpcm450-uart";
 			reg =3D <0xb8000000 0x20>;
=2D-
2.35.1

