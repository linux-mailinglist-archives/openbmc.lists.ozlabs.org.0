Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2E25151CE
	for <lists+openbmc@lfdr.de>; Fri, 29 Apr 2022 19:25:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqfWw0Zlwz3bdY
	for <lists+openbmc@lfdr.de>; Sat, 30 Apr 2022 03:25:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=f4s3nLQV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.22; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=f4s3nLQV; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KqfR95PJLz3bmW
 for <openbmc@lists.ozlabs.org>; Sat, 30 Apr 2022 03:21:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1651252848;
 bh=u1M/i9igpl+WBs+JkHblfLdEsbqQNT/jtX7Z1ECNMVg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=f4s3nLQVht81EXZKXWS2VdgtAVMpMAc1XmcH7oiWWaaauitDNU1ZbOuH4lwZfweTL
 Rz8sLZsT6DOIEsorPEqd/V7DJlGehs9VRCuN9EiILVZzO5/8XzWB0tlY1HLw0n7dYc
 06tYhsvrGqqXZsSKm/Jf2hU8QvjRqv5XlGy8Jbqo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.103]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MysW2-1o7DuM0bgI-00vwLW; Fri, 29
 Apr 2022 19:20:48 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-clk@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v2 5/7] ARM: dts: wpcm450: Add clock controller node
Date: Fri, 29 Apr 2022 19:20:28 +0200
Message-Id: <20220429172030.398011-6-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429172030.398011-1-j.neuschaefer@gmx.net>
References: <20220429172030.398011-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5w8WTRIP7F+Bno5d3r/iMNvZAr/pydK7Dnl1ZI+EUCtsm6H7QTd
 FFO3kj1TeeCaYaFHYu6u3dQGvdEtTnDnZkEPCp9rbbzLEfZVXzpoUiQEpp8LxbZmequ1CN4
 WERVz3FqRB4OFmPreLckTbkuynhDS4lHf35vOuqRhnLA59nUtRnECtacpKpK+WtuwtN8Uf0
 A3VhM2iEV6p9cRgFhGPUw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yLsn5BD1VVY=:cXqMcFYjp6NL4zbtrRSrmb
 RMG0H/ZVas9mOrE5yxIVkDc7oNoH2VGYlo/EzhH82kl9xg9ff+jAYB/eWZHc9OCX0+ktdHOOh
 0V6opfDjBClj0Wj3bgpcsCr/oJQ/9vqOie8ZXyJGc6C9OYe5zWD/N7yVYCOBNHVtVpwktkDgH
 kuszmjWvnkTaRz53UEbMfT7TUgv6FoBoJPQm5huAYNF9g5i8Qf8mxNGF4rYDyQaD5JzMwZPhJ
 IqVFoLKI3g3kOLMKDjU/HpR3ac/VUaOBN0KtvcwzJhVec91LwYz8rcE4CEnIfcEgupLtNuRnq
 CV14ns80l90CySn7w6xR49a/jmdkaWu982oDGNF+umDeaA1JkH/NRDDaWXaUbulmMS98vmQFG
 0S7KYz6emeh4VNZaNExUfz2WY9JR2jnJPO9nxTFNPw770ieHmRFg3Up5RCRDVRRz7Tbj9Rdgn
 LZ44yma0EC4UddTWtKP9YI9ee0RiUVoLTvz4DVM2FR2CoWEKZ+gErTobFRh8pownNHAacKI52
 VYrP9exys9IGdp87LlNqTYL3o2t5PxknR8rN/6uVA8q68GO+5ySvszbd/RnbL4U0bF8WjLY91
 07FbYK8Y9lqzgSgFSiZ31gaITOxYIfUMO2gdA2ltKLO7ikyrQr5k/h5Efw8vrDVhlkZvVxrhF
 feQ/QZm1mBQVkEJlbsjYhHloqe6acoSbgzJYuqhIBAFbvKWfOiJhl0yEsDW3epsgLf1SpJ9rN
 EtIfJLhZaACnlOGicRq3DyRHO7Z/NjbhOubgpLhYx1f3/kcnxYlWjG3tTOPc5a2Cr+JS9U3MW
 Vms7ooQO9QtwEpboR68/IS1R1vc8OFYqYwjUzMMKWjuynouWyhDI63YFYwEkui9c6xfyKI8og
 TMpoZUWauAWc6R/YvP1F+qDlNXv0WCX84rkJuN6QtbfnbYZ+RQOEpyYG1ZnLWomy6wScJkZ6J
 eQ3vj7vwqwcDFuUGC4AoLy8e7NEvJTcrccviLaBavOx4+iLDKpam3AYloXxMY4hpLx06mEVY2
 nLx17jLWA+wF2U6l+8vrP8355yd8DjNX84rnBEospHpxck9xHqsNpFNa3sRmfOuBujGpUNMR1
 hWUAWdN1QPbEGo=
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

v2:
- no changes
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

