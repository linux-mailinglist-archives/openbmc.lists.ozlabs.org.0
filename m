Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EB746C667
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 22:10:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7tHQ56h3z3ccX
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 08:10:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=V9lovWgd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.19; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=V9lovWgd; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7tFm4jrZz2yHj
 for <openbmc@lists.ozlabs.org>; Wed,  8 Dec 2021 08:09:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1638911330;
 bh=1dtTDXD/Lvi01K4UbWYjNJTZ/ggnPgZ9xGaEukkWfB0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=V9lovWgdCch7Uwa7Yur4HhZe67zRs2d/jd5aGtEF6j/jtMXwdljffV47p8JjEkV1E
 gMAjPcyoD5aH+dWGHWQElC6w7osrretjuErJt9kUOyK8WZliTi4V6/vRNl3Ig1/PL6
 3+vAYz1FiP+EhrHfBhtiZvOKSTGXJsAT7VDyAvZQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MatVh-1mIKwz1GcV-00cU1b; Tue, 07
 Dec 2021 22:08:50 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 3/8] ARM: dts: wpcm450: Add global control registers (GCR)
 node
Date: Tue,  7 Dec 2021 22:08:18 +0100
Message-Id: <20211207210823.1975632-4-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211207210823.1975632-1-j.neuschaefer@gmx.net>
References: <20211207210823.1975632-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/AEDgg1Hsm8PKkviv0rCSL50+S5ZpzOGhxAK9NCh4rQtu+koWJT
 dBq0cdOjqi5t/zBU3S/lXxYlVtZZigPP+W/xrO1VKumlqEUd313XNSlV5VKYOFtyIdlJjG7
 VYjsRt5BWbwFmQV9OLiV5PUAwAeHRdqLCi4MuipcN656Y1kHELEdhd0eKJDQlT0bFWerW1J
 MJUl6wglsJuzzRaqUtNQQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Tnd+BuRe4f8=:yASc0zKfgfnnATWaT7symi
 6GFAvsbRe7rInR0lrzfOsy/VFremHTp42/lNqzcVgUj6vzIJVA/tSRZmJ2kIboFDtWMeS4vlE
 JlyGJXaQ1yAZeD6pcH3TR+W+N2lLMMx6fB6ZV13a1BX4DHtdsETLO5dGtGmh6cEYjutoqiyL7
 mt++bB9zhctFCJICtXlqy8vTjOvW4pG/FzQmmMl3T0S7mCXFlzZbWFxaEBNItmPUub4JC4CUQ
 rQ/dKz/p8adTazkUnfAFXuepb40MhKAnTj6rv0iFcjbs4EzHJTDFnm/+/iQjxxwWi1We7JrWR
 WX3swBB9aMpOaeFHvgn8nwNBtebx1/gilk2GD6Ic8Btxq+4k6QJT7Nm9xpZOAJg47QuR378Gk
 xsAruGvaXEfnDAKMSjIfde+Ec5A/7RyIVHC4G0OIC6bYkWOvPaKgGH0F+KjQFsU73hr22g0/v
 fVZXpBol+54u9bF+TjDFFDnCEZfpHXSOUicVoXJMlo9QGv+ngQ8gas8G2qhC/y1FEhkALxXND
 zP+nM2oc8fbzlIVGdSN33uhvPNuAWJQ9TD7360+3uhr8WVTVPs+vn8RF/LWZ8VAvaWGRL5YiR
 /8nGpaFE5VnZ/aAMefzVMp40SD+7Q7IPoOZXLg7vD0RiBWByrpVLXBicGBy4pdKXz+IEgmjRG
 4Hm1NQfagX1/EUPUKhStq2R0Vw1npOL+YyQpRgC9xQ4gjXEbFgqtvU8UD3ftbBOl/U9/+azUg
 T9D9lmdezq5G6nu3vyYgvImjx7aaB+FWeIIKrEMB/11hk7lDptYEgulOmfLbKswVQxQMEdO2u
 9Bca4JJpvG1J2XlHZFzWmROpg7A1DYidqkwTICwFnWN13MgMAUSFcltshNzzHh/XsjNfmnCcZ
 yM89qL5n99knO8m2MZI8ghwpmLMc20JwmKfYKGa0WOWADCBurM+Q3VklasLq9EfSUbereT3v8
 nAfjwVi4oenRkz+xCB9f030dzZ/FAfOSAQdaP3kbLY7Psis8OSAKLmgrwvYT1RiifDV7EL8uq
 xRZg6E9D5N+8CWmVf5y/VG6SOpgEdFRdC9bHV+K7TLla+YFZALjeFCSn7hbtTfga94mhSFBwB
 IyUHRkRzfxK1Pg=
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

The Global Control Registers (GCR) are a block of registers in Nuvoton
SoCs that expose misc functionality such as chip model and version
information or pinmux settings.

This patch adds a GCR node to nuvoton-wpcm450.dtsi in preparation for
enabling pinctrl on this SoC.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>


=2D--
v2:
- Rename node to syscon@b0000000

v1:
- https://lore.kernel.org/lkml/20210602120329.2444672-4-j.neuschaefer@gmx.=
net/
=2D--
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi b/arch/arm/boot/dts/nu=
voton-wpcm450.dtsi
index d7cbeb1874840..a17ee70085dd0 100644
=2D-- a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
+++ b/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
@@ -33,6 +33,11 @@ soc {
 		interrupt-parent =3D <&aic>;
 		ranges;

+		gcr: syscon@b0000000 {
+			compatible =3D "nuvoton,wpcm450-gcr", "syscon", "simple-mfd";
+			reg =3D <0xb0000000 0x200>;
+		};
+
 		serial0: serial@b8000000 {
 			compatible =3D "nuvoton,wpcm450-uart";
 			reg =3D <0xb8000000 0x20>;
=2D-
2.30.2

