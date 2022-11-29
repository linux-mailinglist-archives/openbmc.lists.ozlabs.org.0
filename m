Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A3263BDDF
	for <lists+openbmc@lfdr.de>; Tue, 29 Nov 2022 11:24:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLz345PYmz3bSy
	for <lists+openbmc@lfdr.de>; Tue, 29 Nov 2022 21:24:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=DM9DMtIk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.22; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=DM9DMtIk;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLz1V0fqPz30RG
	for <openbmc@lists.ozlabs.org>; Tue, 29 Nov 2022 21:22:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1669717359; bh=tCgpIcwmalgSx5qX5kzqlXYpLcTzbL9VQxyupLXaw8A=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DM9DMtIkSyUhCSHewXFjGasoKBNheLeR3gikogX87cgw0WOXFLpUU3JFxrrit9n5u
	 zrqmT4Hg/N5H/rwOcc045NWfjpgjx//7fsDTrbwC8qnus03qE1+1iuD9fyw93SBp6b
	 9iR2DlUbDMyVoND6kAvolsCuLv9/M1W48VGRC+aN6LfK0v9u8QkXki1blEAK6m7cCv
	 x/22XvWrMlLrDcfDRww0wA5eRB7TAkb1/v7PQyVyrYZYAZLP05ooE7z4P30jX6ZnwI
	 NOcY7mzgYcaQYcwuhTWYP7jD1kHGuRLIZLHWqKShksg8Mf2nU6E2qOfrDDnQdgryr6
	 v6PLroQVF4w1A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([95.223.44.31]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1ML9uU-1pI2qD19k2-00IG2C; Tue, 29
 Nov 2022 11:22:39 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-spi@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 2/2] spi: dt-bindings: nuvoton,wpcm450-fiu: Fix warning in example (missing reg property)
Date: Tue, 29 Nov 2022 11:22:25 +0100
Message-Id: <20221129102225.3598044-3-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221129102225.3598044-1-j.neuschaefer@gmx.net>
References: <20221129102225.3598044-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:37RMk8+HGcGRs4RthaIi7B02O6Es4HvsaRkekBdN3uGdbb9W+h6
 w/TxBKwJUAn/LIWYvS+ALmbCWH/uqNsUdER8fKxgK5kukwOO/IQRgChvKdKPVbxNLmthtxX
 FOUdvZJbpCE3E5Ax0xsTyYeqfAFkLy9bpHSzeMIGD/eFXPUAJjieo2KzwXMpDJl7JK9XTyJ
 a6MlPvtaZyJ5DcmQ2uBig==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2kBgosZeI0g=;XxUd51KEo56pe33H/BWqf23JDVK
 t8LuwgMI6PcxP2WBKUKe3dhsR5/U9xLlgSuDRym3omKVXs4NElGix+3OgMzQ4nQHeC6/FvPTz
 PFBN3SWRRMF4bcHQqyUObvHB9l7KmivlphRgHoeTUJrWn6oAkK0srxToLNQJLaY85ZAVzv3k7
 DZwLp1JUQ7+1+DdScK0Df7Rhbuc49zSa+lcSAufouZ4gpVIPsCSF2PK4/LnHLD9WuaAZmod21
 HAD18Z8jbluOrds3n8OFeEYoWUFYO3J0SIUPgMbQanqS/11E4tf5H2xKtVrIXLzYnhxYk83vS
 PTHvAGxZ2/5hVAAHC19S/FvOGQ5krYuHTIGKgVSLY5FKkNFl9todDj4t8rSwTjuoiYjGS4b/J
 EAa431Ld3MtoWfMYHyNfisfFZdouDXq8ALl/0rzwjRX3SquEcbgxT/rEIgGHaKQCqexudRNIb
 aYDIFhnKiIsotgqncmKAmHFtJB/IMR56w06yeYrb3RBq0V2XczgtfEyJIA4b4zUQjpXQ8hTIE
 nK8pPhkr53PGg7rT+qtu3tryPF2VAvph5AKQmmgYPdtFBmpYH94EapyCi7d96RnYrWbJKz+SS
 SV1Eptuh8KbSHolJaKBF9wGXsQAeAQ68Qr33c0wqsMEQhaXlFuuClT2LZJej/HhAeM8Jn08l9
 JBrFQee7vyqsVjZcKlSjUNAfzhlnVX3zzPQsbB+c2cKCNbh994K6jFpg7MT1Yi0GUav+An3+S
 +B9LM2Mz+JsvoyjBqOSZGLe4Z2hbZHXAQZbGC3Qe30+ZkGPYgoqNrdgm7VdGIQtExSyi5o1/g
 JcxgM5kBNu0teaM5pkmmYho6O6vrIheMrS3gBGOJbKNZloVgauC0pRJEp31cXWbBOimf4zwLv
 qcfhH83spSbBISRGUoYoVLssMaBW/iTm/bFu3YKh540hbGMKu21UEKssu3C8WdmxJF/anXXgI
 ckY8yj4MITBBIwXr78LqgZNV2W0=
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, openbmc@lists.ozlabs.org, Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add missing "reg =3D <0>;" property to the flash@0 node in the example.

Fixes: dd71cd4dd6c9b ("spi: Add Nuvoton WPCM450 Flash Interface Unit (FIU)=
 bindings")
Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
=2D--

v2:
- depersonalize commit message
- Add Krzysztof's R-b
=2D--
 Documentation/devicetree/bindings/spi/nuvoton,wpcm450-fiu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/nuvoton,wpcm450-fiu.yam=
l b/Documentation/devicetree/bindings/spi/nuvoton,wpcm450-fiu.yaml
index e4162845fcc1d..4e0d391e1d697 100644
=2D-- a/Documentation/devicetree/bindings/spi/nuvoton,wpcm450-fiu.yaml
+++ b/Documentation/devicetree/bindings/spi/nuvoton,wpcm450-fiu.yaml
@@ -56,6 +56,7 @@ examples:

       flash@0 {
         compatible =3D "jedec,spi-nor";
+        reg =3D <0>;
       };
     };

=2D-
2.35.1

