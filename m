Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F2261DD90
	for <lists+openbmc@lfdr.de>; Sat,  5 Nov 2022 20:04:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N4RkY5gLYz2xYy
	for <lists+openbmc@lfdr.de>; Sun,  6 Nov 2022 06:04:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=gy03nHyE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=gy03nHyE;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N4Rcn203nz2xfV
	for <openbmc@lists.ozlabs.org>; Sun,  6 Nov 2022 05:59:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1667674766; bh=bK1RUXAe+xpxxpGUjTTgd1x6zwE6ztff1lqUp39rxNQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gy03nHyEDASlmMOM28yBL3RQ4FCZJnUx4G1ivYXgWT0gF+FylMDp8YzFzeWUUYCr2
	 p3mlP+9WXVAvGUy0QQtc4rtgm5FbBFLLzRLmkVoO1h0yAiTmosw3hGQHfhmr6yjMRr
	 FkpxXNbXj7QYj89/ZsDIp/aQM51btLzTrgxI645ZzaAFM9u5gslUIrd2bj+X1Z3wrX
	 CjhC6r1l5QrNRHd7OgMRVOXwDM45iAA5QGNTCaVrg1snGTJmADjGnbW/EBF0EUXuHu
	 dvTrSE1Uvwzr1l+usJbgsUYd2gR/cM7xQYZjRZ7Qcmj/pTb06avNokiYjpNusRTuRc
	 z6dIa0G9efSVg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([87.78.44.193]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MF3He-1op9LK1TeS-00FPgw; Sat, 05
 Nov 2022 19:59:26 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-spi@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH 6/8] ARM: dts: wpcm450-supermicro-x9sci-ln4f: Add SPI flash
Date: Sat,  5 Nov 2022 19:59:09 +0100
Message-Id: <20221105185911.1547847-7-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221105185911.1547847-1-j.neuschaefer@gmx.net>
References: <20221105185911.1547847-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FZU0RXgcUNGQI/fiMCkh0UXPBADSKhLECE8zLUwxtzD6QQYaUX1
 qF/e4enn/IXaBQeQO766lveS0QEfFavPwpY03jbtfdeGVozY/ciEUkF/B5I46RfSJMeey1S
 dEg9k2/zA+OClMPTfA1RzImkg5Y3FqJnQabRCOiFSsZF/KQMLwixLJi09R60XlszJkZO8vY
 3pPld68pPgH5l/Vxfi4vA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2VwYnSXCeMo=;7BAaka/fpvRGgAWjY1Gv6Aadw4m
 kkbfhU43cVx9601VeNjAMuIINK1PSYnH/36qg6AbeRm6NYuZW5+u5XR6yqf3KurydPTDGQ4E0
 TVoqpC03N1SEPLZbpITQIpT5y1lj7hmaQofwUlsb8VRXjn2hxQFJ0mB4agnXiU5TMBy56D7+G
 hNpgkyAb5TTJpuZ9CQ/boVyPYP1f6Bj81ACoPizhHdFfnKgb+kJV6QVRWaSElpSjLsQPUUVnP
 t0DqojkAW1/b/d7Z//onZwYAhu9DTAU5oG5wc1AcNLJuv0DU/O8aExcuC/LdrehkkDy37sVY6
 sMajYmW8cPcO8M3gDUW4YKu3tjVo1A1y37jluVIzvsmSfnkMWwDL0vB2Vsa+hLnbi1dik5feR
 DTnTYAZCh4XYun1ChTrio7Evg1xSX5sOz4cRwwXq4axZQ0/4Qaz2nBoJHHqPm3DsXrqZWUaoE
 DErpINkUvuC03XHPkQ1FLY/cZIHMkrk02eiT9JjFQ89EV5cLaAv4TLgIuJif+qf6xX0Ik+WRc
 NuoMih3e+mw8sceweC5BOWnQa3oa6GvoLwyR7VqK6VtAObQ5rfRdyP4ApF6Xa2ZZITQFR1aGz
 FN6+SyhNHSHTscHz7L22BZw0cEVXpPzQiQ9th8/0vhANOX+ScIu+20QLSB4Q1IZgKhYoU/pri
 COXHOlbs3MnJPixQU+WitLrt5DLl0Wq8E/u5wqTO5xDCzsXSUbt5zaT/G/R2qTmvmFDFusNuh
 EW2mPDe+XE3lIHTr4N/ipd5bjYQJO6IdDNEN3DejyH0IZ+YbiW8dquS+yyRA7mgt9jrNery0C
 t9V2L2NIhLuVza7woT6xlzYNqeJCALPOcZtbDSwkPBHkihbXOTgDLU+khXIlSkhcSJlMCFYDu
 LjnPM0DSu9DwQO/msUgODx0xK+dhUFoWQ8rwO5k/vKlhpDuAJZpcKP0he2mgvyZZ/0y5wMIgQ
 LAArtPgvZh+6qxOfdTteSJugGV0=
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

Add the BMC firmware flash to the devicetree, so that it can be accessed
from Linux.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 .../boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts   | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts b=
/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
index d4472ffdac928..b78c116cbc18e 100644
=2D-- a/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
+++ b/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
@@ -58,6 +58,15 @@ heartbeat {
 	};
 };

+&fiu {
+	status =3D "okay";
+
+	flash@0 {
+		reg =3D <0>;
+		compatible =3D "jedec,spi-nor";
+	};
+};
+
 &gpio0 {
 	gpio-line-names =3D
 		/* 0 */ "", "host-reset-control-n", "", "", "", "", "", "",
=2D-
2.35.1

