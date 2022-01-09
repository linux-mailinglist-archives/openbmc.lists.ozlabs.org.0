Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5034F488B62
	for <lists+openbmc@lfdr.de>; Sun,  9 Jan 2022 18:38:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JX41D1D8Cz30LJ
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 04:38:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=crJSj1H5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.22; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=crJSj1H5; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JX3xW19RVz3bSl
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jan 2022 04:34:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1641749664;
 bh=OpCM3vZ70EiANIdlG1jlqbtkhqwAbU91v+KSwrK4vJE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=crJSj1H5B77UWngtLFAxPVnVVyOjhoJ2kZL0Gl8/+bWfJtjC/AUuwk9EbrES1mBUa
 pkHLpSE1Mc8JGiYFE6DG+6vcE6UTKczTZ3Sn56T+UUUm61GbYyrYSmsqcNXZf+VRJ8
 LNGQZule/v0O3R9jb1y6GT/U1hbyJ+Qc1UMu4xwA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([89.0.222.244]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRCKC-1mllJs1oIu-00N6vg; Sun, 09
 Jan 2022 18:34:24 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 6/9] ARM: dts: wpcm450: Add pinctrl and GPIO nodes
Date: Sun,  9 Jan 2022 18:29:57 +0100
Message-Id: <20220109173000.1242703-7-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220109173000.1242703-1-j.neuschaefer@gmx.net>
References: <20220109173000.1242703-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cVf+Eg1icknpyn503zLpSH4nbx7uuCiucRyGheDjBmLOnQwLVTy
 O4iSM7mSiWhxhG88ej7GEPsr+fdUv2rUXlR3ovM8LsqTkZ2Htj9sG8/Xl/6BLrU3QgksN4u
 M8FFEkSAtIapFUlhwh6iJoXq//EsrN9EyQR0wcycbat2cla8QpwMx2Meymd2iYEOM4xJ6BZ
 AmSjyNk+actVvLb4p5ODQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:35ivKYmuKqI=:aMXxvoealo5TqFtOKUXiNg
 lmLgmb6N49HuqRBy0/8tLJzWVMHnVZj6ZeQ3QxfdnYEtTm6xmQnTIQsNjVEw+dMK/OLAW7AqW
 ReBpc9HbU9hXna8gzOPeR9WjvWp65ixkc/Oj1Ho4jhAFnxkeloQJq5soJy5xeG4g+e5XXv9q0
 9aoWALqKjCWasDXZP805zggUNhryNUoF98lzi+p4v7JZtzrHW9aQOl7Z8rzO6vdUOMynhZ+vV
 xEo7GKYwVmcu4SCG/QwKLTFWnXmuqYWA+zuF9uPRJ6J2BziiIPAhKbeFYcd/YxLRRPwc9E9k9
 xnU5n3k2cc4yOOF812kgb0KcQIivzoV1iS1o8UmBbpXy9ZZKJLhVODjoXfqGPuPHJhLO3yHN5
 ChiRIuvB+GFoEmjBo2EpI0jv18becGsrCPkQwsghvPtxzTsVHmAy5OeiZtw/hv/LyRfmotw9L
 pKZGEPIRoW6tajzdg4JhMHNz1c5Af5dbI06Lh7PF4QjGZPOxzVLWSS5pc1Nix6t8VsdBamKfW
 gAeP8rQeRbvZlgx8eDQCqSIJzgotoumeRkjAryHTwLNXi1y0h8iAMfeK0fNGUujqWKhoKNQac
 QXaV87y3SaO0C7tlm7QxKt0vjMh3cF3sTjudINTwaGQKs55zuXN1Sti0UfbgDQJ/HE4sO81RI
 iXicMAkQ1gnfWHhNmVSbF8LWyrVFa+hTziulr6y9PXbjwGNENorYNRL+zMYPeiDTVGUW980fX
 +mICz5WnTHD96xX/zvBQNuURDkumqS9WNHHoiiGGJR11rIHDGLC6zO3+XW44/KRzJ3CVsfDYl
 sLVxc66mbyVL9R13aVhGVLZs8rqoWs53UUkFNMIuGk3QWqO0k1JYnKQ3YgAkEvXi3NvjvyUoe
 bsyJVd/OaPVHAR2XrgHeuILucBsMoNSz+PZ1GcZ9z9+CnRj+Orto32My2tu4mzp6sgJfcxaq9
 Si3gTV35UOrR1z5QVegZrJbgU5o2n4xq+fjvO+tEIM5qqDCVy6cuv7RoSnoPhAxkaZsE8P4N0
 8VT/xh+2t/vm4HicI5daeOr7M7LQmfiGJH9fBkryQ9yMCMMQ2nV/pQezyMx4bSHectdxS+z5a
 B2e0iIsdln+9JI=
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

This patch adds the pin controller and GPIO banks to the devicetree for th=
e
WPCM450 SoC.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

=2D--
v4:
- no changes

v3:
- Add Linus' R-b tag
- Remove nuvoton,interrupt-map again, to simplify the binding
- Make tuples clearer

v2:
- https://lore.kernel.org/lkml/20211207210823.1975632-7-j.neuschaefer@gmx.=
net/
- Move GPIO banks into subnodes
- Add /alias/gpio*

v1:
- https://lore.kernel.org/lkml/20210602120329.2444672-7-j.neuschaefer@gmx.=
net/
=2D--
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi | 72 ++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi b/arch/arm/boot/dts/nu=
voton-wpcm450.dtsi
index a17ee70085dd0..66c35626c80a6 100644
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
@@ -77,5 +88,66 @@ aic: interrupt-controller@b8002000 {
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
+				interrupts =3D <2 IRQ_TYPE_LEVEL_HIGH>,
+					     <3 IRQ_TYPE_LEVEL_HIGH>,
+					     <4 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-controller;
+			};
+
+			gpio1: gpio@1 {
+				reg =3D <1>;
+				gpio-controller;
+				#gpio-cells =3D <2>;
+				interrupts =3D <5 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-controller;
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

