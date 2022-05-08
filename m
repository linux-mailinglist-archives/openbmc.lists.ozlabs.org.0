Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B9F51F0DB
	for <lists+openbmc@lfdr.de>; Sun,  8 May 2022 21:45:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxFCB1tj0z3c9C
	for <lists+openbmc@lfdr.de>; Mon,  9 May 2022 05:45:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=YX/rOCUp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.20; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=YX/rOCUp; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxFB2661Zz3bdR
 for <openbmc@lists.ozlabs.org>; Mon,  9 May 2022 05:44:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652039032;
 bh=STTQoU0Sy8AHWtV5pttLaup41ExmdLj7vMbHpMMcIaI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=YX/rOCUpfUos0952/SYCVcW3WeHHLmrfMa+TpEoqiKWo/5gghjBsirvjryF8uyO1k
 hl221DfyokbMxUUhatWD2Ur8TSkSgJlYWCqXP6y3TU59UUVvbfBPv6fRqjKQ/Jeogw
 2GSuQzWAi/PAgh7bZwFOmVxnIOMFWPe7X4+b/u+s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.103]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7QxB-1nrZRd2Fif-017jSc; Sun, 08
 May 2022 21:43:52 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v3 5/7] ARM: dts: wpcm450: Add clock controller node
Date: Sun,  8 May 2022 21:43:30 +0200
Message-Id: <20220508194333.2170161-6-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220508194333.2170161-1-j.neuschaefer@gmx.net>
References: <20220508194333.2170161-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0ezSuU0zJBwh/ZGu333EDA+hPHK33sk6Mj8LKS926qLuWkkV0Lr
 dlWJ34pFrBPMP+BubdQlge6s8v05g/+Pw8q/DkOblN8fJZJXz6/G+h55hNbBSRoVg5QhuME
 c96yu2NoB9ByjKLcIk9UWVAlf3xUNrZdS+U7kt13w8l9lH6rxbylF9SfU8+ygCu1iIR94GN
 EeW6+i0WdHMcl83YXieiw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hBfIvakNOYo=:mxNjkROiVYonEK1pOMv76V
 AV7jo26iOQybtrajPGVaCxGrHTPgAyZsyu50/u9Mmv4K1driDuNWXBaowvw1FtK8/mzmpBhoD
 ek9Nq6pzPavd+mUnYrSTtbMQV1ScIKduBP28Fy4Qu4GpS9JPoV/m/hxGwn1wEZ1KTyj9gYO2t
 mavKGYhY3MnbowCvFso/PyyHDGjChrTjPwl9pnXIpZ4Pwh/e4TG7od9X3Hs0MWrOdZZJ8x6Hp
 H7CXRX74gqZp4XW/WFCBGjdxKGKS74Qvm1l3qa/yKWjjI14j2saDfR8Y84/OVbmPiexWIhhis
 hf3djXzT1jG6d5ngB/nQsdoj1Z9rKa73s+AGAjdkYHU7XvaGMvmXMOEZ97dDM6bfQrGn93jv+
 gpUkNpSWVMygGr55tm8k64U63O0SvECs8O1K5wXu+b5b/jEDKrLIc+mn9+uMA/SU0EnKW49Zk
 EqVHNPAmRUVVzAxC8HbChhxIIitk3lQq6rfvYgtuZAnhPbIwEQzAxN2Ib5ZPebbqTJ4LHmC4d
 dLOJi8sRBEFuP1X6S9zVIVrATxtzeFJHG6mH2xUrmXAf5x2pPBaSjzU9McfoF+lOAnSROtxoC
 P9BGHAuiHW4iyEtnapDrDCE8M5ThGPAo7qNrHh2grPwhTgsYDPB7zma97V0qzfpmo1wxAtT4M
 v32a5Cwa+QgGbCo1J5pID+cFDXj40XRQVxvJsZb5e9Xw1tMQLu/DlLWJ0+M30Lv9UlLnW6ys1
 dzK0ZpBoYa0jSJgcNhItaXBjEhSAFDv8ZY6wfgkpvz1vvtwPCFoYnMm6/w+GxrTYOq6+cT2SX
 LNdE3V2AGtV+XiupBIGJBFtSahNzuCCFybs5TjiIF70sBN2bXq2Km3a1sTTkCvhiq2B6aRqo0
 vM2YkBjGuGAbW4XbYuQjAfITGIPYxnd/v7Hf3VnWP02TZVRj10k+KQgYqc8Ppn388JlW+N80P
 nnaKS+A2SWH/82N9jMiGR9DrnMLF1RnSwACB0szJuQ7jIFfeGs38LqQ2sUs7h9T7K7zZaTcJD
 8+KITAnYZQ5ck33U0ABcd6j+skb4e+u6zUOurQT7nJoTu/haYTONEYx3WXf3nPdEzW+0ynB9e
 XadG9D6dDllPFc=
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
index 1c63ab14c4383..515e943787416 100644
=2D-- a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
+++ b/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
@@ -39,6 +39,14 @@ clk24m: clock-24mhz {
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
@@ -51,6 +59,15 @@ gcr: syscon@b0000000 {
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

