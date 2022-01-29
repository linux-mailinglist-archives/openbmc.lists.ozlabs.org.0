Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C974A2EA6
	for <lists+openbmc@lfdr.de>; Sat, 29 Jan 2022 13:01:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JmCc30Xpwz3bT5
	for <lists+openbmc@lfdr.de>; Sat, 29 Jan 2022 23:01:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=LS0hAuD6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.18; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=LS0hAuD6; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JmCWM1TDnz3c5j
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jan 2022 22:57:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643457460;
 bh=OZ3FImY4buDpM2SCt3sdsnaGAv78MOdHJUgHnb0UnLw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=LS0hAuD6fEHt7jxZ4DEiAvYFOw2NMHAJchraq2jwHh1ClH3sCLBgW49xlnmAn4hCe
 hEwpVJRL4U4jVRYwZAzif4MgGJ5zjpikM9Ne4hJuC25nc7JqBWT1a1YzI+P4lP7MX1
 juXK33ibOLEv9XVmEicOHb4+255ileBR3Ijge2Vo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mplc7-1mSJyw447R-00q7q9; Sat, 29
 Jan 2022 12:57:40 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v5 7/9] ARM: dts: wpcm450: Add pin functions
Date: Sat, 29 Jan 2022 12:52:26 +0100
Message-Id: <20220129115228.2257310-8-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220129115228.2257310-1-j.neuschaefer@gmx.net>
References: <20220129115228.2257310-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OttVufcKJuCBQfYkAHDkJlzfiLdUnPpOsjMx3GOyM1GPohfAYKO
 zXlhgpnXSr4iRnUifiPfy/wG5k5/QhiF8Q1K68D2vKjRhfWeUcC9g8t31lb3eUqsFuq0zbH
 OnklYbFscR8OaKY1gEwIj55MoOYjD3PqtO9U6cg6helZeNb+y8a9p+gubM5cslu2DzuQHag
 W9FOwjFD018sL5CkcvzMg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UM0bW0LUggk=:/UuO5hLvE3K4dIT6WlfL7N
 S+YqJ7SJ73M6ionPQXyi90P71MaPPEPvVVI+9jrHBQbDTzGTxdCzftcoXg43oArto5ivKMuOX
 38de2t23T4vjToj2FzLadDbaJMSN8n4rh6taWhSZaLyLuW0N4GAk/aX96kU+g+EJwogrsVcGg
 qDpVGRNYwibQ6Dzgyg4SNB032Gi5m4IlGNAOMkUK5/hl/QjJm0pSa0lYlSmA/1eUqvNJ/GDtI
 Y27zEglYIvzmieZ64TgZHnoYXrf9F+Mgx/0+YYpV5TB/ZdT3Eu5TE9PMaO7Sccq3x22SkaqgV
 MwCAYBa2PczmLIXbgRu1gENxwUXy6FMJz9cOfqKpOwYMbCZJ0KPHz7PSseuRH/6+1cqDiK8n5
 5c2n5p/MI7kah4H4WDskszQ2yYIPvEXm65BCGtb/PDNqXahfIinqYIJ1t7GV5dCm7G2S522aU
 BKhVsd+TnKjL1jtXSG8mWYIQaohsbaFjlY+GDMMKJRxzh2j7ZEgj8OgYmBQ9ueC9YznopfbJY
 W6EfI+DGmXJhprJ+iyPx5CfATfKqHCFjzW9YMKEY4kRjUib+cH9flW4e//pFi8ccAvgDBt34z
 WvR/WNW2eFDO1WtFqQm1R4HgVFbmg50Zl5M4YJKftvXtJwzz0xPij8LhusP5+MZSvfy+haJ7D
 3T7mj2mh6B89ZE7q+UCLBZqWYO90Zi4x6MnUBYS8rnMc4tw0KfF+lvVVWp0YCJegGioUrB608
 xwd8GdtS/nEXwABNIay+hXSqIzJtxOs9lhBxeTQA1B5bXO0+MKg88RIcdg/AcHpsPa/3Mfk6w
 rjXLbGelSnsHT4GgM4wVfpuyyo5FalVpCyfxnMWLM/MY4wIt1xD0rbxlnyHQOm8R+r5i3d7qb
 cuuluoaLLbFyLkhx+f64zQIDrzKgr6AcKYSG5oK4k8vJ/7iSsXi7s3BpdCQvjG8hDfVKiWSKN
 mvYtiwmZQ/L8txBWsrOFzfreOW9jBt4hb7F8+SY4EHYgirbJ2CI5Sc5qzgO3DXlL9MWzPfulW
 7lcpNX+qPrtpWUn/T79sHvJp7avGZiSTib2HmOAIoHZR0fTiV7ihZ5JFNWdH/HcVlW63lZnd2
 vneiCekPICknH8=
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

As done in nuvoton-common-npcm7xx.dtsi, this patch adds pinmux nodes for
all pin functions to nuvoton-wpcm450.dtsi.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--

v4-v5:
- no changes

v3:
- Adjust to schema changes

v2:
- no changes

v1:
- https://lore.kernel.org/lkml/20210602120329.2444672-8-j.neuschaefer@gmx.=
net/
=2D--
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi | 305 +++++++++++++++++++++++++
 1 file changed, 305 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi b/arch/arm/boot/dts/nu=
voton-wpcm450.dtsi
index 66c35626c80a6..0c547bd88bdbd 100644
=2D-- a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
+++ b/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
@@ -148,6 +148,311 @@ gpio7: gpio@7 {
 				gpio-controller;
 				#gpio-cells =3D <2>;
 			};
+
+			smb3_pins: mux-smb3 {
+				groups =3D "smb3";
+				function =3D "smb3";
+			};
+
+			smb4_pins: mux-smb4 {
+				groups =3D "smb4";
+				function =3D "smb4";
+			};
+
+			smb5_pins: mux-smb5 {
+				groups =3D "smb5";
+				function =3D "smb5";
+			};
+
+			scs1_pins: mux-scs1 {
+				groups =3D "scs1";
+				function =3D "scs1";
+			};
+
+			scs2_pins: mux-scs2 {
+				groups =3D "scs2";
+				function =3D "scs2";
+			};
+
+			scs3_pins: mux-scs3 {
+				groups =3D "scs3";
+				function =3D "scs3";
+			};
+
+			smb0_pins: mux-smb0 {
+				groups =3D "smb0";
+				function =3D "smb0";
+			};
+
+			smb1_pins: mux-smb1 {
+				groups =3D "smb1";
+				function =3D "smb1";
+			};
+
+			smb2_pins: mux-smb2 {
+				groups =3D "smb2";
+				function =3D "smb2";
+			};
+
+			bsp_pins: mux-bsp {
+				groups =3D "bsp";
+				function =3D "bsp";
+			};
+
+			hsp1_pins: mux-hsp1 {
+				groups =3D "hsp1";
+				function =3D "hsp1";
+			};
+
+			hsp2_pins: mux-hsp2 {
+				groups =3D "hsp2";
+				function =3D "hsp2";
+			};
+
+			r1err_pins: mux-r1err {
+				groups =3D "r1err";
+				function =3D "r1err";
+			};
+
+			r1md_pins: mux-r1md {
+				groups =3D "r1md";
+				function =3D "r1md";
+			};
+
+			rmii2_pins: mux-rmii2 {
+				groups =3D "rmii2";
+				function =3D "rmii2";
+			};
+
+			r2err_pins: mux-r2err {
+				groups =3D "r2err";
+				function =3D "r2err";
+			};
+
+			r2md_pins: mux-r2md {
+				groups =3D "r2md";
+				function =3D "r2md";
+			};
+
+			kbcc_pins: mux-kbcc {
+				groups =3D "kbcc";
+				function =3D "kbcc";
+			};
+
+			dvo0_pins: mux-dvo0 {
+				groups =3D "dvo";
+				function =3D "dvo0";
+			};
+
+			dvo3_pins: mux-dvo3 {
+				groups =3D "dvo";
+				function =3D "dvo3";
+			};
+
+			clko_pins: mux-clko {
+				groups =3D "clko";
+				function =3D "clko";
+			};
+
+			smi_pins: mux-smi {
+				groups =3D "smi";
+				function =3D "smi";
+			};
+
+			uinc_pins: mux-uinc {
+				groups =3D "uinc";
+				function =3D "uinc";
+			};
+
+			gspi_pins: mux-gspi {
+				groups =3D "gspi";
+				function =3D "gspi";
+			};
+
+			mben_pins: mux-mben {
+				groups =3D "mben";
+				function =3D "mben";
+			};
+
+			xcs2_pins: mux-xcs2 {
+				groups =3D "xcs2";
+				function =3D "xcs2";
+			};
+
+			xcs1_pins: mux-xcs1 {
+				groups =3D "xcs1";
+				function =3D "xcs1";
+			};
+
+			sdio_pins: mux-sdio {
+				groups =3D "sdio";
+				function =3D "sdio";
+			};
+
+			sspi_pins: mux-sspi {
+				groups =3D "sspi";
+				function =3D "sspi";
+			};
+
+			fi0_pins: mux-fi0 {
+				groups =3D "fi0";
+				function =3D "fi0";
+			};
+
+			fi1_pins: mux-fi1 {
+				groups =3D "fi1";
+				function =3D "fi1";
+			};
+
+			fi2_pins: mux-fi2 {
+				groups =3D "fi2";
+				function =3D "fi2";
+			};
+
+			fi3_pins: mux-fi3 {
+				groups =3D "fi3";
+				function =3D "fi3";
+			};
+
+			fi4_pins: mux-fi4 {
+				groups =3D "fi4";
+				function =3D "fi4";
+			};
+
+			fi5_pins: mux-fi5 {
+				groups =3D "fi5";
+				function =3D "fi5";
+			};
+
+			fi6_pins: mux-fi6 {
+				groups =3D "fi6";
+				function =3D "fi6";
+			};
+
+			fi7_pins: mux-fi7 {
+				groups =3D "fi7";
+				function =3D "fi7";
+			};
+
+			fi8_pins: mux-fi8 {
+				groups =3D "fi8";
+				function =3D "fi8";
+			};
+
+			fi9_pins: mux-fi9 {
+				groups =3D "fi9";
+				function =3D "fi9";
+			};
+
+			fi10_pins: mux-fi10 {
+				groups =3D "fi10";
+				function =3D "fi10";
+			};
+
+			fi11_pins: mux-fi11 {
+				groups =3D "fi11";
+				function =3D "fi11";
+			};
+
+			fi12_pins: mux-fi12 {
+				groups =3D "fi12";
+				function =3D "fi12";
+			};
+
+			fi13_pins: mux-fi13 {
+				groups =3D "fi13";
+				function =3D "fi13";
+			};
+
+			fi14_pins: mux-fi14 {
+				groups =3D "fi14";
+				function =3D "fi14";
+			};
+
+			fi15_pins: mux-fi15 {
+				groups =3D "fi15";
+				function =3D "fi15";
+			};
+
+			pwm0_pins: mux-pwm0 {
+				groups =3D "pwm0";
+				function =3D "pwm0";
+			};
+
+			pwm1_pins: mux-pwm1 {
+				groups =3D "pwm1";
+				function =3D "pwm1";
+			};
+
+			pwm2_pins: mux-pwm2 {
+				groups =3D "pwm2";
+				function =3D "pwm2";
+			};
+
+			pwm3_pins: mux-pwm3 {
+				groups =3D "pwm3";
+				function =3D "pwm3";
+			};
+
+			pwm4_pins: mux-pwm4 {
+				groups =3D "pwm4";
+				function =3D "pwm4";
+			};
+
+			pwm5_pins: mux-pwm5 {
+				groups =3D "pwm5";
+				function =3D "pwm5";
+			};
+
+			pwm6_pins: mux-pwm6 {
+				groups =3D "pwm6";
+				function =3D "pwm6";
+			};
+
+			pwm7_pins: mux-pwm7 {
+				groups =3D "pwm7";
+				function =3D "pwm7";
+			};
+
+			hg0_pins: mux-hg0 {
+				groups =3D "hg0";
+				function =3D "hg0";
+			};
+
+			hg1_pins: mux-hg1 {
+				groups =3D "hg1";
+				function =3D "hg1";
+			};
+
+			hg2_pins: mux-hg2 {
+				groups =3D "hg2";
+				function =3D "hg2";
+			};
+
+			hg3_pins: mux-hg3 {
+				groups =3D "hg3";
+				function =3D "hg3";
+			};
+
+			hg4_pins: mux-hg4 {
+				groups =3D "hg4";
+				function =3D "hg4";
+			};
+
+			hg5_pins: mux-hg5 {
+				groups =3D "hg5";
+				function =3D "hg5";
+			};
+
+			hg6_pins: mux-hg6 {
+				groups =3D "hg6";
+				function =3D "hg6";
+			};
+
+			hg7_pins: mux-hg7 {
+				groups =3D "hg7";
+				function =3D "hg7";
+			};
 		};
 	};
 };
=2D-
2.34.1

