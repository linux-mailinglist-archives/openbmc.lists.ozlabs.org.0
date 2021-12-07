Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 052A746C678
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 22:13:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7tLf5s4tz3dfT
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 08:13:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=FNRyavxN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.21; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=FNRyavxN; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7tGD2wWqz3c9Q
 for <openbmc@lists.ozlabs.org>; Wed,  8 Dec 2021 08:09:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1638911341;
 bh=n/IMLw8RlRNMl11ZPwUHyr0pgPADtPhByeB9Tw0skmg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=FNRyavxNkzUybVYlqRDiUBF4KqPm+OMZ0TK9Q76YZWrZ9TS/zwjSQA3TJ28xp4wkU
 ZUjZXZqX+VWJv+xzSLgZPBdMdEOzHn28a5ncFmL4tW3tsflrdfgk4cKy+1uqOE4kBZ
 uD4izYA8RmvKAIyi1IDINzq3RFEiShnmjHBezw0c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MV63q-1n1ogk3gJy-00S6Qt; Tue, 07
 Dec 2021 22:09:00 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 8/8] ARM: dts: wpcm450-supermicro-x9sci-ln4f: Add GPIO LEDs
 and buttons
Date: Tue,  7 Dec 2021 22:08:23 +0100
Message-Id: <20211207210823.1975632-9-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211207210823.1975632-1-j.neuschaefer@gmx.net>
References: <20211207210823.1975632-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:w6zd2sE7qX7biDctX7/3wm69kxDwHCnk4KmUNJeio84MbEdf15g
 Nk4DGNQcIQZwB1WFZSh9/PQx+THVkVtuSTVWUOPwXdu90s3phD3XLmM7j3Z699COuz29WVL
 Cmegvh5QaJaHEs5/Gu0uKZQDHMBVmO8vmA0V439F55aZdyJdJpT5iUq6gWiNrp2G2WviA9v
 3xVbF/GMsHJQpPfU/V+GQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bRTl+6Zn8hA=:cOkpSHY7Gl7GjEPQmOCJqG
 7B3+v1lKhy9tm0z++wILvQcoyNzdflutetAfJ+8UthJc0bvDoROUhnzTQZEGCyNmWMotgMqjf
 zR6IqqP0rwACE2ZgvuSCIdu4yGHfO83ypsWwArlQVupPUNgqZpZhZFBfkqDlmHrai0XcK7+Bl
 88YlBbmdnciBXstf3UougA7U6aAU1n7YqJsfpa1QgytE4aEjXSpbX2BP/NCWHYX9XE70R2xZD
 v9B8xdr+sysQgbWbVi+SbPylQd89Zm27Ss/xXifhtI+Zv6Ym8Vqy8mrOw45p7dd/QFJ23cIUy
 qUtLya324sAK+1BA1LIWk3DS/K+hV21ZqXQjsXguOMw90N5mldFtJye8NrGxIGi5lTGTeX/9A
 ruT5eZnDHlpfkoJVgS8Faa9snuAWJcuwXcXOw78j18UnP5JXydLkLxiv3ZUS2fHRXFq+H6ixp
 HVUb8Oc0vuhH/TDVv919SdnSfIGZNPntjcKEeZd8Affjr7BBeraZtbj2ZFa2C+XC0012qJpYF
 fgF13H78PgCU+aTBCrmiDPqhfiiipJ3rIRXf/xWSm5Kpz7krCZ0GoHTNbGMX/gOellWYg17U5
 Ouvt7PlOr3Beitp0EzQOxHPaEx+ufSxELv5wdYYJHNhZWM2I8xfvEqRJTn8XU5nL82Hof1YDl
 o4Ebxzd2mDLadUxRsMG6SOrFMMhN9pz74GmYfIAWGkJl0RlYfPSHXtkKxQ3TB41ojil8e31KZ
 XoAp3vOIxChIPynhhaWrY7uxYn/fivj34AtOIEI9hz9jl9pvusUK2d2mQ6fNTzLnYggD/jkWS
 AXHWJZ5SMMNDTlcc2HeR5y39fBmf8fOnjc/WP70R9vFHqwctQqg6Npg7RA+0xmH/RnN5rZbvl
 qj/KmdhhinGrPfvNXbYKuPPJhMyh5gNV+m5f4iuOA50TcLvyBXLKzFyFDsVeXPA49dLs7yPGx
 JNTNwhGdh1Fo3wsDEBHH4iwl5Vxc6fkYOi0XiHjxoT0e6SICMiB5dVa55Qm3Sp6fQUKjQFbEo
 SPyIs3tEHCxtwbmy2P312zYJDleF+0es0kt40jaVbSrvGhWXLcPnUauGkyXfWwfA7j8ENrPdF
 CID38zHhZk82tU=
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

The Supermicro X9SCi-LN4F server mainboard has a two LEDs and a button
under the control of the BMC. This patch makes them accessible under
Linux running on the BMC.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>


=2D--
v2:
- Adjust to new GPIO controller names
- Explicitly set pinmux to GPIO for GPIO keys and LEDs

v1:
- https://lore.kernel.org/lkml/20210602120329.2444672-9-j.neuschaefer@gmx.=
net/
=2D--
 .../nuvoton-wpcm450-supermicro-x9sci-ln4f.dts | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts b=
/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
index 83f27fbf4e939..cd8d3a6bbf853 100644
=2D-- a/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
+++ b/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
@@ -8,6 +8,9 @@

 #include "nuvoton-wpcm450.dtsi"

+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/gpio/gpio.h>
+
 / {
 	model =3D "Supermicro X9SCi-LN4F BMC";
 	compatible =3D "supermicro,x9sci-ln4f-bmc", "nuvoton,wpcm450";
@@ -20,6 +23,46 @@ memory@0 {
 		device_type =3D "memory";
 		reg =3D <0 0x08000000>; /* 128 MiB */
 	};
+
+	gpio-keys {
+		compatible =3D "gpio-keys";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&key_pins>;
+
+		uid {
+			label =3D "UID button";
+			linux,code =3D <KEY_HOME>;
+			gpios =3D <&gpio0 14 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	gpio-leds {
+		compatible =3D "gpio-leds";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&led_pins>;
+
+		uid {
+			label =3D "UID";
+			gpios =3D <&gpio1 7 GPIO_ACTIVE_HIGH>;
+		};
+
+		heartbeat {
+			label =3D "heartbeat";
+			gpios =3D <&gpio1 4 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&pinctrl {
+	key_pins: mux_keys {
+		groups =3D "gspi", "sspi";
+		function =3D "gpio";
+	};
+
+	led_pins: mux_leds {
+		groups =3D "hg3", "hg0", "pwm4";
+		function =3D "gpio";
+	};
 };

 &serial0 {
=2D-
2.30.2

