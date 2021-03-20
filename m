Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CF8342EF4
	for <lists+openbmc@lfdr.de>; Sat, 20 Mar 2021 19:25:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F2q1P74fWz30G8
	for <lists+openbmc@lfdr.de>; Sun, 21 Mar 2021 05:24:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=i9WAWF6o;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.20; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=i9WAWF6o; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F2q0g06Pzz2yxF
 for <openbmc@lists.ozlabs.org>; Sun, 21 Mar 2021 05:24:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1616264647;
 bh=2AbvT+t6I/5SrOX/KVZ+I53SOpZfpJdS7RCiPvq3x/k=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=i9WAWF6oKKIisItVn4d3H+0fkD0Nzg+CJJc7KJ1Ux+BRb7RNarvmGaG+ArdgJlNrU
 BWT3d8VpgAeBE5G46F/i4aZ954ldz7GRmg+tk2oMkKn1m+vcPI2vOmW5NOaP9H92Ok
 gbFO5ehVQyjZwoB8IBk5Qrd13Mjrzqwqkl+AMa+g=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MryXN-1m0X8V43mf-00nyed; Sat, 20
 Mar 2021 19:24:07 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 13/14] ARM: dts: Add devicetree for Supermicro X9SCi-LN4F
 based on WPCM450
Date: Sat, 20 Mar 2021 19:16:09 +0100
Message-Id: <20210320181610.680870-14-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210320181610.680870-1-j.neuschaefer@gmx.net>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PEypSEJy4+y6pwGs/F7tTTw2HYOpWJcAfxDYsBzRXSVr1Grggt8
 hq7+0fo4spR//YQ45+PF07pLN0xUZT1K1jN9VVSo3vp5cjVfzEwrcbXrKd8IgHZZPnJThLI
 ybxzR0py6yH9qhhE0G0kceVWfmG8QOf/XAPTP0SVsPrR4mXrdP6TxkWI4pbHLCX24/n12cP
 iINn2ZPIgjwf4Qt1P7dyw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xgSe58BAH8Y=:eztxVx8Xlsb1vF5bbObaKW
 K3cxyhz6du57rJhOAnQkucjRmlu/gvVsASiyPTOGZeQCytMev9xiFVfZXKR2R5RZPO9aq3WkJ
 IcYaRQ2+vmZCVcYlManoh1KUljHdwEzq7Yw4rrAIl5GHon0rlRZ/GEpo5TUbMTp6NyrgYjGTA
 j0QP6s6SG2E3kMiTNZEzml1SHWN56I1UJ9VlhYSm1qeekl9/oY9nBnV31tPkl20yJQBZKFDvS
 AjxyDuEX35Cusf5r/ZJlDwDbs2gRN1I6Q7ZaEOyura6IhiHiwIpsCSRZ4M573ZikXF9FatPwy
 z6sLQXCg3jIm3+3jYaxYUBbwBhsQTj58a0dUe0Gxibjozcv66ip+8VMbA5vmT9BifZ9KRo1Ok
 y4IJhDNy/e1JERbgkr/9DXg5ihX+I4r1ro8Rbc63vgLmKVHa+VKqewLKSkoSpmzgVOHZsiKfB
 DMbIWmfCO1oo9rHalX3677hjCpEWP00d4wF2zepSctP5/Vqe0tdbxkPawHl8UmNmYscKFPVw+
 LF0kc0lcqi4iAyHGzIuJehYdBYPdJWxO2C2cnFklIf5HN06xlsSKbIeZ03X1SV8xYqbQZ6ZGo
 AendBryVRBGqjvYz4KhOlQ6jC8IZPwuYR+UgZddSYmzz2DQYX6+Oqy7EOx8bwd6CWwZLet0QL
 hCrGAu3AtIHcz9UZtXUyjxqW00VVhoCM9P2PSGW5LaFjGp06csj9RKVBVARHBLG3O+0rsq60q
 Z+uyi+Y8zeVpulljC23DlGtMeoSti5vGClnUwDofCECqT8NiPIUJdAwbAWihouPTz5PlcCxJ8
 KdKmKBaiRiRtUZxMhxZfyrQWJOuof2D/MSqncZ5tpqY9LmDHpnPfQmB/JiBgbREhVlu3PD9Xs
 gFjNdAyOEI1a/10PMxSocCJAY9GuD9Uz5Nf4hCMkhLH6rq25o6EAU+P3rIq2IE5ERXn9/I1EF
 JM6FaH1HdHyEi1uWVUGB8rb4byu+S/DcSEGFh4IXIwL3WRHhDj1qclSsK7pWxAQUfskIYK76P
 MkBxdX6muSjBtZ28VBdfmDjDd1N4+askq39FwUZpJ63AWeyEnJMZqqRX9Z4zvZGqDXj3Ik8ZD
 ZU/bPt1fa05206CiUzymOGAXfwLoQ4ICVIbCWj2/ifJiRLn7MKSygEiJf/fFVS790csQawvM0
 vWJF2yuRd+A1uCTcOcOzjrUrIAjBZuCbjKLznU60Fkl8ox1Vo4s5zZ33GhJZpUSE6mFKHBbZO
 pIZwtKwpCOvTfJChN
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
 Arnd Bergmann <arnd@arndb.de>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>,
 Tali Perry <tali.perry1@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The Supermicro X9SCi-LN4F is a server mainboard featuring the WPCM450
BMC. This patch adds a minimal devicetree for Linux running on the BMC.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 arch/arm/boot/dts/Makefile                    |  2 +
 .../nuvoton-wpcm450-supermicro-x9sci-ln4f.dts | 40 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 arch/arm/boot/dts/nuvoton-wpcm450-supermicro-x9sci-ln4=
f.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 8e5d4ab4e75e6..cab5b3c906f83 100644
=2D-- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1305,6 +1305,8 @@ dtb-$(CONFIG_ARCH_VT8500) +=3D \
 	wm8650-mid.dtb \
 	wm8750-apc8750.dtb \
 	wm8850-w70v2.dtb
+dtb-$(CONFIG_ARCH_WPCM450) +=3D \
+	nuvoton-wpcm450-supermicro-x9sci-ln4f.dtb
 dtb-$(CONFIG_ARCH_ZYNQ) +=3D \
 	zynq-cc108.dtb \
 	zynq-ebaz4205.dtb \
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

