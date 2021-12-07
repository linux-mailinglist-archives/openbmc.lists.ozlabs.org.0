Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A764246C671
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 22:12:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7tKx4PrKz3cfn
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 08:12:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=V+apZi5Z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.20; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=V+apZi5Z; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7tG85JZQz3c8W
 for <openbmc@lists.ozlabs.org>; Wed,  8 Dec 2021 08:09:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1638911339;
 bh=aJK3aYkTjoNYFomlmBvcJiDYDAbn3yEMMH9PnGcwh0Q=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=V+apZi5Z0+zV19MkjBbX4/XYTOQl0U/cArYg5ZMl2USooSis7W1dZIM6t29q3PxaU
 3nsKTqAyfc7vmRwQla2ZFPhL/fu/1a25QQRUxjpku3eC8D7hBQurPrZFXvD47dY1zG
 1ClI7t3t80QPe1TUohZ5J+ZtN9eRTG3iidqlZjnY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFsYx-1mmDeH3JKp-00HQoC; Tue, 07
 Dec 2021 22:08:58 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 6/8] ARM: dts: wpcm450: Add pinctrl and GPIO nodes
Date: Tue,  7 Dec 2021 22:08:21 +0100
Message-Id: <20211207210823.1975632-7-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211207210823.1975632-1-j.neuschaefer@gmx.net>
References: <20211207210823.1975632-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:usq2/YSpx5wQW1MyCXV07rtFXO7Ivj8A7enhBPFJxzJs5IuTmaR
 ckAN38qm7/pxxiUpvfjpUuJCr9f46BPCSem0daz6ogwZy+o8mQsbHPabpmodHB6/3gHFrlj
 Cbhkc4cqWlOFsg2VLaQ8Ts1Sl00St4JleGysUjV4QoO7B2EArNlhdgc4Fp6onvhPewpa58C
 BfZEppyS9BkFrmPrDwGAQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MeXJvmA2qww=:tZZ1gd1d8hrBvKOxGmsN9d
 utbwS06se01yGQaIQ960mOinzwa7be0TWDBaN3Hrv8U7u6xjRNBy40V3Aa0df3It5Ebs76HNR
 PW1307ibCHkhxRIRyIuHquZ4MU7jPU2aW2fFcLbUPIEtf8a7+TaVzknR+oRw9lbAn+/iUwlYl
 gn+VVC6x5xFy3Je1x9JpKToY6ruyyLw1net/TWVpiqMSQf2coX8NWDwJxJeShLvqGUGe0tCnd
 2dO63p6qGaP6yyd1tU0nDKNygRl+3lHxMF4i3HfkkVoyIQx//H6FMY3LehtuJEMpwrcsA/t6r
 32BrA7BEEyD4sLP7fKMkwDBTwL6onoQOXtJnZxoFEZykOmWnU2o+XX32jEogr2sYXTcu1PUsZ
 BVwd7PfLGA9/tlCnv5cssGMRo8xE4OBCSboeffWq0yn4LOoDd4rIabYjKbPGIdDHVn85E3MSb
 inFBL+jDBzT75p+49eZmyCLcW0BKu/K3XM2CV9w/mEm56R9CDn/P0J3G//PIINDeewuS+Y9kN
 L4rhYoqboW+1MVLG1XwrZb3RfmnSZxR8gq55pFk51wJ4iI+kZO0NDm7Dwf3cTTVHh2ODQpgst
 e3frKGKXXRbo+/YUjGSbm+P5RJkxNw6pQSt9OpZHcP9s+rpq6zu0PJfLmgtNy78Jdcgf8EWf6
 h+oesDOR4XBFBtJgcvlOJbx9EZU6pjFLWDVukBEuXLPDBQzzHOQVJNDDW3TME00AT4HKWXiK2
 Oe2ojapzSCb1IGSEvhog8p+k5Swm45Ts5lx74KKqoFottJW5BHZORCqk4iIkg3uBsk5ph6bnm
 kXrDm2OsjUC7jZwSUmmwbJIs4XDi6WL9Wj6F0q4giJgx4jM2LuJ1NflsSgae6p2oUjH46YR0N
 hq9UHL4guNP55X11K0munVngAoS6qCx4C4FxtLRijTBJ3A5sf3fgk3YUOCdF9fLHfb9fb4CK/
 o7fLQcsGXavKITDUeWxo2cfeCHf19Ag3K0+83XMQW2r7sfhomA5xh8AImjILM9F52mNdbJ17L
 eHbBHJvd8IR0bVyakxOP7wdXV0ruEwWv+EOFIYs6zLtIBfwl9sigGjKJ062eMNCcZwp5jaaFr
 ys8YtwUJKcgV8c=
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
Cc: Tomer Maimon <tmaimon77@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Rob Herring <robh+dt@kernel.org>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch adds the pin controller and GPIO banks to the devicetree for th=
e
WPCM450 SoC.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>


=2D--
v2:
- Move GPIO banks into subnodes
- Add /alias/gpio*

v1:
- https://lore.kernel.org/lkml/20210602120329.2444672-7-j.neuschaefer@gmx.=
net/
=2D--
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi | 74 ++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi b/arch/arm/boot/dts/nu=
voton-wpcm450.dtsi
index a17ee70085dd0..a795cc4128654 100644
=2D-- a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
+++ b/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
@@ -8,6 +8,17 @@ / {
 	#address-cells =3D <1>;
 	#size-cells =3D <1>;

+	aliases {
+		gpio0 =3D &gpio0;
+		gpio1 =3D &gpio1;
+		gpio2 =3D &gpio2;
+		gpio3 =3D &gpio3;
+		gpio4 =3D &gpio4;
+		gpio5 =3D &gpio5;
+		gpio6 =3D &gpio6;
+		gpio7 =3D &gpio7;
+	};
+
 	cpus {
 		#address-cells =3D <1>;
 		#size-cells =3D <0>;
@@ -77,5 +88,68 @@ aic: interrupt-controller@b8002000 {
 			interrupt-controller;
 			#interrupt-cells =3D <2>;
 		};
+
+		pinctrl: pinctrl@b8003000 {
+			compatible =3D "nuvoton,wpcm450-pinctrl";
+			reg =3D <0xb8003000 0x1000>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+
+			gpio0: gpio@0 {
+				reg =3D <0>;
+				gpio-controller;
+				#gpio-cells =3D <2>;
+				interrupts =3D <2 IRQ_TYPE_LEVEL_HIGH
+					      3 IRQ_TYPE_LEVEL_HIGH
+					      4 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-controller;
+				nuvoton,interrupt-map =3D <0 16 0>;
+			};
+
+			gpio1: gpio@1 {
+				reg =3D <1>;
+				gpio-controller;
+				#gpio-cells =3D <2>;
+				interrupts =3D <5 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-controller;
+				nuvoton,interrupt-map =3D <16 2 8>;
+			};
+
+			gpio2: gpio@2 {
+				reg =3D <2>;
+				gpio-controller;
+				#gpio-cells =3D <2>;
+			};
+
+			gpio3: gpio@3 {
+				reg =3D <3>;
+				gpio-controller;
+				#gpio-cells =3D <2>;
+			};
+
+			gpio4: gpio@4 {
+				reg =3D <4>;
+				gpio-controller;
+				#gpio-cells =3D <2>;
+			};
+
+			gpio5: gpio@5 {
+				reg =3D <5>;
+				gpio-controller;
+				#gpio-cells =3D <2>;
+			};
+
+			gpio6: gpio@6 {
+				reg =3D <6>;
+				gpio-controller;
+				#gpio-cells =3D <2>;
+			};
+
+			gpio7: gpio@7 {
+				reg =3D <7>;
+				gpio-controller;
+				#gpio-cells =3D <2>;
+			};
+		};
 	};
 };
=2D-
2.30.2

