Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D09E342EF2
	for <lists+openbmc@lfdr.de>; Sat, 20 Mar 2021 19:24:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F2q0j2S1tz30BJ
	for <lists+openbmc@lfdr.de>; Sun, 21 Mar 2021 05:24:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=g6mZ9TYd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.22; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=g6mZ9TYd; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F2q0V1KmBz2xZN
 for <openbmc@lists.ozlabs.org>; Sun, 21 Mar 2021 05:24:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1616264633;
 bh=g7ln86j48NBzVCWhAoLlq90X9ie2pByGlx1NbuGnqws=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=g6mZ9TYdYjPvM83QQEpByFU2nzVCEM6TSN+BxEuTNcJvAaEB2Iq42tNjt3kQKRepV
 KLblAosxSZVVw2UkRy2ftip1jGx1lnhbatEBmexmBBoEaENoVCLam3GhAUJRJuGVVY
 u9dH3pd4VoI7l1gR4oxbgzVO6oGQygd48LhdErXY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mnpru-1m30Tr2iTK-00pLIg; Sat, 20
 Mar 2021 19:23:53 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 12/14] ARM: dts: Add devicetree for Nuvoton WPCM450 BMC chip
Date: Sat, 20 Mar 2021 19:16:08 +0100
Message-Id: <20210320181610.680870-13-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210320181610.680870-1-j.neuschaefer@gmx.net>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:o6Yjk0rYMnIkhnBBV1UC+FHWQWNuBBUJo9pSXksFeBHmkFrYXrI
 gxP139WnU8/Ju/GeHzgBm6QfdJDFOinwv1hNPNh2bU9743iHs0+iAzakoWGzgRsoPfBgdaI
 eRmOZe7wfBB9iOwetKpLtneXBK2zntcXxQtPh3yZEnS4Se++le4oCEm/tlIGiRomwa6Uf36
 mx3/HbLKG7W7NoRUaWWBw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OL4jqKuClAE=:lhDSiaHFlFQJqJbw2xSa30
 SX+hRBTKT7q5EVT+Z82DirCXrHtnNFsUkUf3K07BkDqxZoCfxVY0H1w99eOKq5bao2d+pNo7x
 DIwR+T+zPt8zXJ01u7A2kZgkQ4RwxYnifddewb2mZEZ+6BN8g4xD+AKf9cu5myCuWhaT75HZs
 Wt8RPh01VLLmb7b/YMtzOkYrOyxAZPhjhR1Anwz8ic8j6rSzwEOvP9RZWeKgjvFJbghpymI84
 elJTHgnmmTmTiynMjcSM0kdfknsv6AjnAp+RQsgP9GmplVpaQR/qVBD+lVD6gPkA5aN4PBpe7
 xdUAx2gEEAXwrUsDeOUiz5srSI8N81XGcmJicwogvmcwA6+8Y/+6V8ziVS378xZqixzb6J1iC
 0fNbGnByxUrD7twTqqRCoH0+g9mwJla/JYBIBtvgCFVwLuToYZbZ30d+DHbOf1UbOq0XCAuuf
 TJoKK/s4gRcwKEgYQSdgZ8cQEeKxlhsRXc/gM6vBY8cICrz6FN6FWF7jRtaT9FOePNL652u0B
 RXWAxVP/ls7byDxAETzara7jdt6TLNcLvGOrBDwzTNScSTiMN6g9jQ7rHSGmjDCO25L9mvy9o
 o8JLavcy1c/Tr3V6Wa4S4oy0hrf6wvNVxEjSAg7T8Sqq0ZZaokQK6tbMKiF80fpREJZ0LLjbz
 xyuGTPlDk/EMioPV8o6WrzQc0Biq4CT+Zz3pHi9AQSTOCuFtFiboDxuUAk9M8DlMOsn3VNCDy
 W6KB0l5DwtUBmdWbGAUDvBCdrTvaeFZ/F1QmyPAewVkEildtiSBC1Kyp+hiKKoUev+A9jnTS4
 Q4x2KpiWiAjwxJacNeTNlgaIlQX2w7gL9QP7dUKmJMBaR95+k5sdf30Hd/M8AcqckSFnfJlLQ
 N2X5OO16nomFzumsW8pw==
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Rob Herring <robh+dt@kernel.org>, Tali Perry <tali.perry1@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The WPCM450 is an older BMC SoC in the Nuvoton NPCM family, originally
marketed as Winbond WPCM450.

This patch adds a devicetree with basic functionality.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi | 76 ++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 arch/arm/boot/dts/nuvoton-wpcm450.dtsi

diff --git a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi b/arch/arm/boot/dts/nu=
voton-wpcm450.dtsi
new file mode 100644
index 0000000000000..d7cbeb1874840
=2D-- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+// Copyright 2021 Jonathan Neusch=C3=A4fer
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	compatible =3D "nuvoton,wpcm450";
+	#address-cells =3D <1>;
+	#size-cells =3D <1>;
+
+	cpus {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		cpu@0 {
+			compatible =3D "arm,arm926ej-s";
+			device_type =3D "cpu";
+			reg =3D <0>;
+		};
+	};
+
+	clk24m: clock-24mhz {
+		/* 24 MHz dummy clock */
+		compatible =3D "fixed-clock";
+		clock-frequency =3D <24000000>;
+		#clock-cells =3D <0>;
+	};
+
+	soc {
+		compatible =3D "simple-bus";
+		#address-cells =3D <1>;
+		#size-cells =3D <1>;
+		interrupt-parent =3D <&aic>;
+		ranges;
+
+		serial0: serial@b8000000 {
+			compatible =3D "nuvoton,wpcm450-uart";
+			reg =3D <0xb8000000 0x20>;
+			reg-shift =3D <2>;
+			interrupts =3D <7 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&clk24m>;
+			status =3D "disabled";
+		};
+
+		serial1: serial@b8000100 {
+			compatible =3D "nuvoton,wpcm450-uart";
+			reg =3D <0xb8000100 0x20>;
+			reg-shift =3D <2>;
+			interrupts =3D <8 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&clk24m>;
+			status =3D "disabled";
+		};
+
+		timer0: timer@b8001000 {
+			compatible =3D "nuvoton,wpcm450-timer";
+			interrupts =3D <12 IRQ_TYPE_LEVEL_HIGH>;
+			reg =3D <0xb8001000 0x1c>;
+			clocks =3D <&clk24m>;
+		};
+
+		watchdog0: watchdog@b800101c {
+			compatible =3D "nuvoton,wpcm450-wdt";
+			interrupts =3D <1 IRQ_TYPE_LEVEL_HIGH>;
+			reg =3D <0xb800101c 0x4>;
+			clocks =3D <&clk24m>;
+			status =3D "disabled";
+		};
+
+		aic: interrupt-controller@b8002000 {
+			compatible =3D "nuvoton,wpcm450-aic";
+			reg =3D <0xb8002000 0x1000>;
+			interrupt-controller;
+			#interrupt-cells =3D <2>;
+		};
+	};
+};
=2D-
2.30.2

