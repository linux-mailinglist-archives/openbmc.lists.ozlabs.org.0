Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A55355363
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 14:13:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF5yw0sClz30CL
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 22:13:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=Ub3zaSIR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.22; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=Ub3zaSIR; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF5xN55zYz3bs3
 for <openbmc@lists.ozlabs.org>; Tue,  6 Apr 2021 22:12:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1617711116;
 bh=0mYa4APzjX4y4tzJVfb5VIFApuD/1wa2g96PG4y8oYk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Ub3zaSIRybTv919sY7OiG5Wz49aqrHPqTGFBNMp+u0egrwuWJK+SekF7gT85aGHYW
 2Q5hQjko/65nyjS3PEWlC8QDc46mGV1YaLFK3hU/lfwe7SQHZy1pYK+vpmxXeFyEfq
 htF53lxcFVfWCbe2iOWoOyOd0q4WpMJRn+aLWzA8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MV63q-1l2m3m0BoU-00S4S5; Tue, 06
 Apr 2021 14:11:56 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v2 09/10] ARM: dts: Add devicetree for Supermicro X9SCi-LN4F
 based on WPCM450
Date: Tue,  6 Apr 2021 14:09:20 +0200
Message-Id: <20210406120921.2484986-10-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210406120921.2484986-1-j.neuschaefer@gmx.net>
References: <20210406120921.2484986-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9DiOCvXHwoFh1kDKM09Us9g9xP2gE4HWlzUOVkEO1hQrdf2PPFo
 b68DFZ7wrJu7ib8Me6MhvTQnQLQcF0UI7BqlK6LFSAGmFMQLSQptrojzQPZjh6LgbGlrgYf
 pyaFmci5BiXhsiarsvY+P3VNo9+vLiyhUwa+p5x5dh7EoHxvb9EbjMe/C2B4Rv1AtEV1XhE
 DoMpBBm1KlprrR5TL4U8Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/Qe8xLnpBvA=:HmbDV7ZX29oTuwy/S9tbR/
 HpCQ0/HxeyZVGyH1zGNCPAVNjoDju7G7U9W7qHitOlDMzk8VlLPx6rCFvPLPWEFlxk5h3z8/X
 oNWgjgTcPhxnCHMRqoZHSJN3DSVhCaQlWfC9UnyB5BcHyOYNHL88/EZ/muGs5su03qbhbnedB
 +cJS+HSPAkULfZpTapOks4pPy1kSh2IbgC5eBSIrac+2XnKKNFNCouRvs/RIN7Ss5NGLBFlwt
 Py10Z5Yv3FvUyaAjDu1uc+eWim5W6ySMvoTEF4iXj7Hprbb3a1Wjhu+nYsJlUnvIvQSumUfxy
 cV5niq9BkL0fClTKMTZGzeugYgAFXFoe7129eLh6/lX7swTPI6vbzcmGq6oZf88wSNmj37kN4
 TvzUwkOe2j2B+mC7n1rbkh1sBsHr9Oir8/QEtslIvTf3RARsoNYLfaNuFbKkgJxvAx2O7Zx9L
 CcHBYAxUpskhndkybuq3jLbXV+lp9IhVLIZnKsIFfU7m1RjHNgvZ9cgo4+0rJuR83GbadfBD3
 8H0jIh6L8+bheMy+sYizHTXUfGAMYEJWiBnSXSHSbz1jt+/dnMvr6XbJ61isR0cU6TF/tO2uI
 9QKmWhv+ALzLjKQQeuQ/vhe34jkpgyif5yx9NN1tM4TGJLxHvGhoq+ViRlkVk5TBRWw+e6iG3
 MiR8S548pkRxpucHdXuuzKMhVlXpZLeR6ja4wIxF4ZYSmjhajNl5BwxsDRZm9B2FVhDAAgT/h
 4I8/tsaevKiZ/qUs5ZgZ6dDqPqa1TuRR1Et8KcgLkwUT9ust1o2FAqOmNTKM8dYoH1dkM2fC4
 VVyno+URu5lmP5/5W6t0dDSQF5aXEZH32P5Wq8zN8tdwXlYTWGIkPmo24mFPJiQ3eYDz6396Q
 up7QltPkM5EBKkMvn4DYtbVGyCSOzVOvBZ62mcwnX89Fj2Ksk/1+XsB+RFanWm7Ba9GkVFYVX
 kaEynW8ztuPXY8cKz7uljhKDc5k2C/oTWB4EnuyC8HZ/teEtjs3a7bb5SXRuVwEo98SKmM1bt
 nP1wftmwTWmiJIsXZlOQ89Hpy8jxucakW/1H7OTZ8jp20Lo3O2XREaes4ycYElktld8zXWSh2
 7JWMj+L5s3Og/6ctMZ7kur82utwvhZEjuUm1xnu2JtJ5Fuu8KzCQQbhFs5u8xyTkp4YTTbqWK
 wRhoBh+mFxZmHxWyYsMEJ8Hb0vHAZkDWPAl67yv594rTH82iaBZU/BkzBLYIDHcmQQfyW8SrU
 unSsXH/CqpzPl5QYz
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
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-kernel@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The Supermicro X9SCi-LN4F is a server mainboard featuring the WPCM450
BMC. This patch adds a minimal devicetree for Linux running on the BMC.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>


=2D--

v2:
- Group wpcm450 devicetree with npcm7xx devicetrees in the Makefile
=2D--
 arch/arm/boot/dts/Makefile                    |  2 +
 .../nuvoton-wpcm450-supermicro-x9sci-ln4f.dts | 40 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4=
f.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 8e5d4ab4e75e6..5a9d99d5443e4 100644
=2D-- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -333,6 +333,8 @@ dtb-$(CONFIG_ARCH_LPC18XX) +=3D \
 dtb-$(CONFIG_ARCH_LPC32XX) +=3D \
 	lpc3250-ea3250.dtb \
 	lpc3250-phy3250.dtb
+dtb-$(CONFIG_ARCH_WPCM450) +=3D \
+	nuvoton-wpcm450-supermicro-x9sci-ln4f.dtb
 dtb-$(CONFIG_ARCH_NPCM7XX) +=3D \
 	nuvoton-npcm730-gsj.dtb \
 	nuvoton-npcm730-kudo.dtb \
diff --git a/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts b=
/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
new file mode 100644
index 0000000000000..83f27fbf4e939
=2D-- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+// Copyright 2021 Jonathan Neusch=C3=A4fer
+
+/dts-v1/;
+
+/* The last 16 MiB are dedicated to the GPU */
+/memreserve/ 0x07000000 0x01000000;
+
+#include "nuvoton-wpcm450.dtsi"
+
+/ {
+	model =3D "Supermicro X9SCi-LN4F BMC";
+	compatible =3D "supermicro,x9sci-ln4f-bmc", "nuvoton,wpcm450";
+
+	chosen {
+		stdout-path =3D "serial0:115200n8";
+	};
+
+	memory@0 {
+		device_type =3D "memory";
+		reg =3D <0 0x08000000>; /* 128 MiB */
+	};
+};
+
+&serial0 {
+	/*
+	 * Debug serial port. TX is exposed on the right pad of unpopulated
+	 * resistor R1247, RX on the right pad of R1162.
+	 */
+	status =3D "okay";
+};
+
+&serial1 {
+	/* "Serial over LAN" port. Connected to ttyS2 of the host system. */
+	status =3D "okay";
+};
+
+&watchdog0 {
+	status =3D "okay";
+};
=2D-
2.30.2

