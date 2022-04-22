Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C7A50BFD5
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 20:36:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KlNR40fZkz3bcr
	for <lists+openbmc@lfdr.de>; Sat, 23 Apr 2022 04:36:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=WOQoej4L;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.20; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=WOQoej4L; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlNLY0s2jz3bZP
 for <openbmc@lists.ozlabs.org>; Sat, 23 Apr 2022 04:32:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1650652315;
 bh=BHUkq4qIz1dh922+/iqR/+zEXRIaC4ZyZF4Bphn8Po8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=WOQoej4LQV7pehkbxx/LFN6/QZW/wbVPlGFB9uakv59EcbIREz9Pdtnh9SwBQ3kBG
 7IQL3Ya49XduW41FHp2LIVZXWuKEwSQ15EvGe1iNR7do5U13pmX/meO269rxU/SiW+
 l1o2sQfa6w/FMwl7UY+wn5ZaakT6kxkaYqEZaYPs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([87.78.190.74]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N8ofO-1nvSO519eg-015ujL; Fri, 22
 Apr 2022 20:31:55 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH 5/7] ARM: dts: wpcm450: Add clock controller node
Date: Fri, 22 Apr 2022 20:30:10 +0200
Message-Id: <20220422183012.444674-6-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422183012.444674-1-j.neuschaefer@gmx.net>
References: <20220422183012.444674-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Fag6c+9a1Pz3T5xG3Pe4SmIRM1zshVKs/bhtGtFRhEqmEKmvImL
 mQiew5bwtAn5jmH7DaPyUusvR9/woaryKVpQFAXUKgw39r3F9k9/a1u2LQItUrXdsy7diry
 CBT1J59AfeqO/3Z6yii0UgOL51/2BFCdmCC74iM+zjFRl7g/SRd0Lu5Q5I0YJ4tANpkLGDo
 PYSdA+hdkEp96fsM9/7sw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FHS5GREvf+U=:A+388ueI27epBq/o5/JPE1
 77zKVdTw8p87RexnMBTk1Uta8jvrAyIT7wLjVsHmRe6+EGGdjSsda4ALwVRH84JjezrYkgLIV
 HkWd3g9adYqJ7Ksy5w89HPga7O8H1rNaLeW8w6Xy3WEzz5okX1CdnQxTHP8OD1TI8iCoMkoSe
 9/oZsxvc70gvTYruGwo7H6eJr+QPOIWdu3MXvlbfYP6Z9xSdckBq4XDmVqUr9aXud/eyRHAis
 vRemOkw+MYRfX9FkApUrWrHCDbpaZxrWNgXYCTrXWQl6tCllVR3zuKUvcwrwgk4zP0WxUC48P
 IJgF7DZR5IIMp58CuPzHmJow1lgfheMtE3qIUOY7IkeeY6Ex0t5lIMxyZD4wg+y2pBuBe8OVR
 FZJqwusFctNjjX+T1UujjnDkDmCepIrKeMZ7kBCGz2sKU1nFhkP869q8EnuPBx9h4BL0cP/B+
 KUbfL2Ekn8k3e9rsXxDkvv4eTAZN1y9ZjMdH0hhg5UKftuInK8vcXcgGR83g68unH4HA/Lehr
 bfghZMlzyJmpTLaZlPXUhmz94JqvV8pj/cOvMqy4ZmLK1MvRt9Yb4hPhcoi2uaVM+NAnMJzB5
 ZOQm+wvDyejtdlxAZjEubz1gN1tK9KSpXqaLxyZJM92V/W8SXS30BR1M4W9RF5Jqcl4SrlGFw
 Utn4qSWdN9jqUug9RvxLpTA9qxftwf9ZnoBxtfYWXi5eP6KD5fuR3CJ1QFcnBnhpBTU0jpLBy
 RGCO5Xt7IKxusKfqVrEmoIjymzC1IGWGuEKCv47IGI7LteiDoiMbjczxH4YlgjZzGZjOrex8/
 XDgWUo34XRp8YrsQL8dtNFxfUjIsSrX4clGvTLTFWrqwFusWLD89rqB3igLg9CjHrQtr4nc+T
 N8KZnKDMtRlGbswogDsiy4FX1XEKuLPUakVrutS4Mbl52Cc4w6+ISkv8rSN1OVirewFDD0McW
 jYMgzpTfN3uhJ8YJXn3wpwAAhqgWGlZIdY2xW89OonoTAX/Vb00lef5jot8D9Jzr2G8NuolJ6
 6yqAWmHiBBeE0zI2R9lwO6ysdMk2J1CgQC1rFL7l3yr7Qt0I6xB11qaihAaWs29G7EJqYJhwk
 SJHZxMop8EWIQ8=
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

This declares the clock controller and the necessary 48 Mhz reference
clock in the WPCM450 device. Switching devices over to the clock
controller is intentionally done in a separate patch to give time for
the clock controller driver to land.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi b/arch/arm/boot/dts/nu=
voton-wpcm450.dtsi
index 1c63ab14c4383..62d70fda7b520 100644
=2D-- a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
+++ b/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
@@ -39,6 +39,14 @@ clk24m: clock-24mhz {
 		#clock-cells =3D <0>;
 	};

+	refclk: clock-48mhz {
+		/* 48 MHz reference oscillator */
+		compatible =3D "fixed-clock";
+		clock-output-names =3D "refclk";
+		clock-frequency =3D <48000000>;
+		#clock-cells =3D <0>;
+	};
+
 	soc {
 		compatible =3D "simple-bus";
 		#address-cells =3D <1>;
@@ -51,6 +59,15 @@ gcr: syscon@b0000000 {
 			reg =3D <0xb0000000 0x200>;
 		};

+		clk: clock-controller@b0000200 {
+			compatible =3D "nuvoton,wpcm450-clk";
+			reg =3D <0xb0000200 0x100>;
+			clocks =3D <&refclk>;
+			clock-names =3D "refclk";
+			#clock-cells =3D <1>;
+			#reset-cells =3D <1>;
+		};
+
 		serial0: serial@b8000000 {
 			compatible =3D "nuvoton,wpcm450-uart";
 			reg =3D <0xb8000000 0x20>;
=2D-
2.35.1

