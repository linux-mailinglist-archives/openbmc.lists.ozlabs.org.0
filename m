Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8AE4A2EAE
	for <lists+openbmc@lfdr.de>; Sat, 29 Jan 2022 13:03:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JmCdN3p3jz30Mj
	for <lists+openbmc@lfdr.de>; Sat, 29 Jan 2022 23:03:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=dtWYqQ9r;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.22; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=dtWYqQ9r; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JmCWP21Dnz3bbR
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jan 2022 22:57:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643457461;
 bh=JOEXiTjFnqOmIEh7FlJF2+6B4pSYnO1bOc1StqmzREg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=dtWYqQ9rMhwIAaAt1/nDb8hfitOQPSoochodgVgrwTGEls6J7bUcY0G1+zj+diFkP
 rfylkaXBv7fG5rB8al//FE5UoS7z/U38oGoUgdum/BRHU41fElBbckRmjNg7+e7k+q
 5PeXv7ueyQaXmJENsMF2YK1fkqp1NYKrlOzrg1gs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFbRm-1n2CpX0Wys-00H76X; Sat, 29
 Jan 2022 12:57:41 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v5 8/9] ARM: dts: wpcm450-supermicro-x9sci-ln4f: Add GPIO LEDs
 and buttons
Date: Sat, 29 Jan 2022 12:52:27 +0100
Message-Id: <20220129115228.2257310-9-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220129115228.2257310-1-j.neuschaefer@gmx.net>
References: <20220129115228.2257310-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Wc57uANddytwidBievKLMxhxtfP7SmTJ1lOnO/Q9apU47qhDU9G
 XL/kZFJ5+TGP4lxVMaEWuIXdI3uFldFTV3wjaZeqgs+OvplcOKoy/A1AtlQ/L3qfQHjmZZR
 C5kKgS5MNFynLZYlwTpeLgaHfHFPWqP08TgJ5wE4daBm1e81Rh+bdPF7s4Egx8B9NWYxqBG
 0LVZmDX4xE3W0kNwiXZQQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MVZlQqyTRgE=:TLIZ/tWv0MtAIkDyoTCxg1
 CkDoqu6gN7iGEkhfEVcfsemO9xbnS/I0qhVREctGoaI0aB6IhB7zf7THOvyz2fusgx4j7Db4u
 t6pJiXIsCE0L9ifpZV9K5j8BNia5UJ6nt4q/2ASmFgPsx0QuOv3xJiBaqNsFfAbUAOz6U5W8Q
 vPvmgh/dGePwrQjS1yHuaigYclaLJsmKjwls88dd9Jrr6ZX5u8vx+fg8MmijA3ktpssEucnmJ
 im1LzGnVvBWCgSgCiW5pGqjKCkCMsnVlvv1mrJim9ZO3IoSXGY2oJIpJwk/E5PSruZXRprNh0
 QFwew/F6knJSw1AtinwXYqksJfxA6FkucGR3KpDCr7gwaRyMDCUTetgQ/gKrkJPgb1GVq0CXO
 D0azOhOwNt0x0GGXyMapNCE0g3yfzyE2+yEm+j72OobL9BMaRZu58fH4yz70NNmQ3up42fJ2k
 9ohtZ5SURQofdb/vRI71ANJQr7J7ZkFFBQTeGi1CqPGr6/38ntT7FejpbwH+YpqTU+ONrR8PF
 m/f5t3dxoIUIKe0uiYrEk2Vv6GUL0gp7fVxx+666s0lFLOLwfcDE+HaVkZ3XFfpscxucmYwkA
 0nybji91QUFNtKg/pWYIArJVITQW+eIta4AQR5xvEgKMXMmPESXi+D36akxzQkuN6FAQ1AOIP
 P0F3y8XcQ8tnDT9Gvkze3FdM7/4XGvMG/l0ilkBkTLbOi/ISHbDIqXrLuNbn8aP1PO0NG4WzX
 wtMf37PclcumK+9EPYU7bIM9DGY97aNzJulGTJGb6vmGEDBQ4lbWpTbI8e6kLwzeu9ZZRNYIa
 9qs5jNuKBfkfcP2u76uTFY12G3P3TK7u9jgK8S3Znd0fidpaAVarauPFll6kjUMDlEPgWMsCR
 0E9uvY+SPS2i/j0Bgqfqo9EzZi0CBfDUDVyZM7VmZrWY+gQDoyk4WRD3ZWCiADEz0tTGgcVwy
 gsU2GjDRScUNEiP+p5kPXUmYb7C8GZ5bQZXcBk4S08QIu6kOuucqfJ+l+s0gUSX4sFPIMFp96
 mDQxaKa+F3L7NxuqZP0zp9qvRT/v52tUm+dhuV1oEXv/lPuZjgrWREQE8FKh2QESOO30a8kdI
 CFbOMN1vrt+uZg=
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 openbmc@lists.ozlabs.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The Supermicro X9SCi-LN4F server mainboard has a two LEDs and a button
under the control of the BMC. This patch makes them accessible under
Linux running on the BMC.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>


=2D--
v4-v5:
- no changes

v3:
- Adjust to schema changes

v2:
- https://lore.kernel.org/lkml/20211207210823.1975632-9-j.neuschaefer@gmx.=
net/
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
index 83f27fbf4e939..3ee61251a16d0 100644
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
+	key_pins: mux-keys {
+		groups =3D "gspi", "sspi";
+		function =3D "gpio";
+	};
+
+	led_pins: mux-leds {
+		groups =3D "hg3", "hg0", "pwm4";
+		function =3D "gpio";
+	};
 };

 &serial0 {
=2D-
2.34.1

