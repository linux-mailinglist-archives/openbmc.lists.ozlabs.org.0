Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E47B61DD81
	for <lists+openbmc@lfdr.de>; Sat,  5 Nov 2022 20:00:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N4RdP0gMfz3cB8
	for <lists+openbmc@lfdr.de>; Sun,  6 Nov 2022 06:00:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=J3PoKDvh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.20; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=J3PoKDvh;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N4Rck1l91z3bkZ
	for <openbmc@lists.ozlabs.org>; Sun,  6 Nov 2022 05:59:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1667674760; bh=p9YDZV3SVh65N5p5g+sDDmYbRp27o4nub0l5+Ua3VKI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=J3PoKDvhApuEyAoHR4cjNCvmbpvk2J/OZ40T+2RY1HFR429dXWIEeyNkwPA7EK9tp
	 mHU1yaiirfCRgKcCOZWd9VPPFo5Xcot1DA7vG7NJ3ISPpmksfeMUA4tBQmsie+MGkk
	 Lc/KX+d9f2EvBnqHiDKyacD4JjvHjf+om+tB8sHQCOLgjibvnDjo24iAQTgKmoJdx/
	 vm2lFk8Wx+d0+D8s7bEfZa9l9t8rFmWKzL35jOOTXLd89PMCb36IJdOUBjv+LVBISV
	 xQXAhYJJTI3xeLrCQKju0d+a+VtIxCimbzhcElA3qDTOtuKnap5NDn7bqFV1FJgK61
	 lWYQ86eYKEn7Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([87.78.44.193]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MdvmY-1pOnvi0Akw-00b1X1; Sat, 05
 Nov 2022 19:59:20 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-spi@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH 1/8] pinctrl: nuvoton: wpcm450: Refactor MFSEL setting code
Date: Sat,  5 Nov 2022 19:59:04 +0100
Message-Id: <20221105185911.1547847-2-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221105185911.1547847-1-j.neuschaefer@gmx.net>
References: <20221105185911.1547847-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:O8qPZWuqzhHITt3VaDtMUqy6A+mhRlAcyIBz33LYKVUSnA0k061
 eiFGOgB4CIqGiB4MazQ7WXcCbS1g20BwUtujxoGnrLpKrecE+6hwRCpKQxXXuhRCCp3sOYY
 nqIdtLBweaYTKm6UE9Jf9NoSM+QGGXPgF5vmgLLQ+ZuzzQLEAORevw6Xn4ObjtbY0lErAJ3
 kPuVjeMlnaVb3lso+lFaw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/kSkirQ6yIk=;ZbO3NPnwS5AqaGY/XtD5IpIPc0R
 tsuV8YWbMT4oFeb12DQe+y8AEpJqAGYPMHZNzCxovoY+9lPOV4geaYtEaarPft+Rpn4h73Kt1
 4Ii3uESLo/r6W3EB9eQZNYFmFH3ASH/wW4a1g7i3/1aUrJLHnOXA9jCgzixyL1k2maPOTuApy
 d5WH3XI+wV+a18ZDvcGVqEBZdobunWXOS3hbxC3cAhHFwDgMRaOTwDvnMfDu8tfC88T1uQOPW
 u1uNFbUfMvNWWIam+MMaDk+0D9rNuGkNba/AloMkcsGrV+YP9xTkV6pf8do61VeqFiN/VQCTj
 QXNO0naRHjUJ/e7zPbww4iPsAxdjckURvF0adISGLt5x4x9p3KUhO3VKv6FiidNMve1PCaCB7
 RLRJtTRIjEDqVHPxXJ2ipN77mT/aYWfWgBO84sGVNzqr8OcA5KIfxS7rBJufgfbTY/EFJ5ARq
 Y7gH/0XoAK4kDrvQUCVV53n6U3ImswM8bZs0fm9EjNI9I4cSE4ag9heIXa9pHxVdwTecCyh6t
 2XKDkLhtBqTLNas0jmYBC3ZHZSzPoypOsaEETecyUDLliHJS3zmUkIJhqbEkXl7Msb1GjliWy
 mPqM+Iy/RAKkAZPruz/oLXa6OHvDRaTQwlqLm6QzQHTSkTGRRTsewwhjjokjQqSz5upr1xxRL
 tpdXcUY8akmfmCNAn+7GVVeopF91ZupfWX7M7hz5fbAzKU5jK64+lbgwnm4fD3jaFeE4KHeic
 O+t7FeRscFNtsZWnqnr3PwQiwgUFm+0bc1rMUs9y7PwdMcU8sy97p1T3spZ9s7r1Tskg2L8pF
 vEabcZjtF8HBfeA8DAOw4ALOsKh+BzagWb/OBx5byi+WFMMO9WdsJXTVn+7cHocetKPsHRNDB
 BjuqsQ5P66YBH8ntab0bZpGl0kyfTcAYo+Mkuq6MLt5dxw+LuwcFTOPda42/Pacr1WdZMr/Z0
 fJI7DRAxgxV779NC7sMwEnCl+5A=
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
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In preparation for the next patch, which makes the logic around
setting/resetting bits in MFSEL a little more complicated, move that
code to a new function

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/n=
uvoton/pinctrl-wpcm450.c
index 211ad32cc0d8f..49b2177af17b2 100644
=2D-- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -800,6 +800,14 @@ static const struct pinctrl_pin_desc wpcm450_pins[] =
=3D {
 	WPCM450_PIN(124), WPCM450_PIN(125), WPCM450_PIN(126), WPCM450_PIN(127),
 };

+/* Helper function to update MFSEL field according to the selected functi=
on */
+static void wpcm450_update_mfsel(struct regmap *gcr_regmap, int reg, int =
bit, int fn, int fn_selected)
+{
+	bool value =3D (fn =3D=3D fn_selected);
+
+	regmap_update_bits(gcr_regmap, reg, BIT(bit), value ? BIT(bit) : 0);
+}
+
 /* Enable mode in pin group */
 static void wpcm450_setfunc(struct regmap *gcr_regmap, const unsigned int=
 *pin,
 			    int npins, int func)
@@ -811,13 +819,11 @@ static void wpcm450_setfunc(struct regmap *gcr_regma=
p, const unsigned int *pin,
 		cfg =3D &pincfg[pin[i]];
 		if (func =3D=3D fn_gpio || cfg->fn0 =3D=3D func || cfg->fn1 =3D=3D func=
) {
 			if (cfg->reg0)
-				regmap_update_bits(gcr_regmap, cfg->reg0,
-						   BIT(cfg->bit0),
-						   (cfg->fn0 =3D=3D func) ?  BIT(cfg->bit0) : 0);
+				wpcm450_update_mfsel(gcr_regmap, cfg->reg0,
+						     cfg->bit0, cfg->fn0, func);
 			if (cfg->reg1)
-				regmap_update_bits(gcr_regmap, cfg->reg1,
-						   BIT(cfg->bit1),
-						   (cfg->fn1 =3D=3D func) ?  BIT(cfg->bit1) : 0);
+				wpcm450_update_mfsel(gcr_regmap, cfg->reg1,
+						     cfg->bit1, cfg->fn1, func);
 		}
 	}
 }
=2D-
2.35.1

