Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9D73988F5
	for <lists+openbmc@lfdr.de>; Wed,  2 Jun 2021 14:07:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fw77x09w8z3bxd
	for <lists+openbmc@lfdr.de>; Wed,  2 Jun 2021 22:07:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=G+7z3yjj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.21; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=G+7z3yjj; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fw74S4YL6z3btM
 for <openbmc@lists.ozlabs.org>; Wed,  2 Jun 2021 22:04:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1622635467;
 bh=RTKzM+J9pqSrUr+vTq6pJh5Z2xpl+EIKfucHJ6Hh99I=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=G+7z3yjj689QsI+iP8aKy5EQJUAKmr8sAyAaC/Wild/lOk8KSOUv97lTksuD+WBJ2
 3QUJAftA9Sy58hTi4nHwOROuFcFB+JRw2MnGpegVn3ju47n3L9A4bSXKI+44UX6ciQ
 HuZXGQfWqtZpQSH7jluDwFfWhZNEjKKtMKAu42Hw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.247]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNsw4-1m3jXP1PjM-00OCcw; Wed, 02
 Jun 2021 14:04:27 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 7/8] ARM: dts: wpcm450: Add pin functions
Date: Wed,  2 Jun 2021 14:03:28 +0200
Message-Id: <20210602120329.2444672-8-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
References: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0cK/YI6AJnCyKI30NY3XUNbqcw/TZvI7OpDmGIulKErhvjg21vO
 l/ZZlG8okXNSK5BCkBCSLnC0Gv/nx5vChL+jFANXnNd0tz4G2cjVVl/+a7Q0BYeLNBV2iaR
 bIzjA3fhYtYdPzFLwtDco2GW5Eeu9twvHcjooFyrligtRES7fFeqgQeEP1zay9EWBqWIOgf
 E2HcaBHN5p67J/nHD+2YA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:66ixAULPhaI=:oQgwzf4z2efBGCfzsGtST1
 kiixC4F0MVA8jDyBQDyRyt3eYEASsGP5ayzmWEiis9KqXgXYxkjGlT+UNwchYuP1GQUdgGaS4
 K+91mn/jN7iHKN1UcGZ/J+VTIGB3cVepqTL/EQidXbJEIDOQ1fIQ2tjwF9OhwW/jsenK4sCyq
 TKjt5ic6yi6I8sza8KSMGElT12ugbzP54RsGk81mj1ZdQjSykQAKrDwGbMmVACBAtdxUGUxAG
 swLLUSeTEj8isDSE8CBWmiVLuG2MDuRxz3PFAJcoxU7UiWmVDBCMO8QtOKqRBW89EX+999RCF
 nlU1yeiT7YKXK4NImGjvh1n90/peS8YKXn+uJIkD3Wu06ngEVxvjixy64Yhc5pbrj8aDOrr/i
 dvSENoOPzb6OtfIiX5mabIRKJ9W5ylD4LcPfSzzIwQLl/DASH7yppd5i5dG9xPty2T7NWVBU8
 qKKiBIXeQ7vL8EhLQgZqhpOKDrjzjM4hBL708d+CnK/2LBmPKnqzYSno83Hsn/mn/Jd3aD+4v
 I/9/5ztkHdQ12jfUb3w3fOWir1xgqbhy+iTB0+rIXbY5f9GVmQESOLCqt1G8NPsshgxoGWYvP
 AJBYuj31gfrgBh5nT/lJ/yRmH0ledWomJ4LnQXABqZetEf7RZWqVubfQg/aezP/lxI4Hj3sbD
 cZnofj7y4xquQ0pA22yh8LBUj2RuTO7vPJLMHNUZxk+lgZlKZtrnezWb1jlrg49Xv6NDsUbwp
 7kwdcHkXLJO4kguChUHFhMb04YlSLDUXBcjpn4aHVlII8hnyFW7QSPOAX38I4PAgR9IVCDxEq
 yAdr9OCpHgayM+U00qMKojO9x/0dpwv2K1VBwcyOqdKqVhedXGSMJpA2aCsejcgGcMKJVbfJU
 k/MJdHaiA86ZCjUHUAl96sTE8y9FlsljJH6lDDt6xTNiV/R1igHEoPzg4A65E17+sLwNYBlKP
 sWJlBzLUfdvtMFlKoRFCP9fKKj4Ulzv/XuSoRx6m8VqAOg5xM/Wxv69akV1ayu8Z05NNMWQ2F
 rmJNTDFZjKUgF+TYI/mugAnO7dsPsN8kfIN7USmyRWNMIOUQ98K5JPUmUbsQnwhCTiS6EJpK2
 Ujx+i5CUbNmEKLdP7nQHtaqLwwkjjGMoJVTCX3EI9xfx2Q3lyXde0ERug==
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

As done in nuvoton-common-npcm7xx.dtsi, this patch adds pinmux nodes for
all pin functions to nuvoton-wpcm450.dtsi.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi | 305 +++++++++++++++++++++++++
 1 file changed, 305 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi b/arch/arm/boot/dts/nu=
voton-wpcm450.dtsi
index 1b63943b2a42b..f1a1b1fdcb3e4 100644
=2D-- a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
+++ b/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
@@ -87,6 +87,311 @@ pinctrl: pinctrl@b8003000 {
 				      3 IRQ_TYPE_LEVEL_HIGH
 				      4 IRQ_TYPE_LEVEL_HIGH
 				      5 IRQ_TYPE_LEVEL_HIGH>;
+
+			smb3_pins: smb3-pins {
+				groups =3D "smb3";
+				function =3D "smb3";
+			};
+
+			smb4_pins: smb4-pins {
+				groups =3D "smb4";
+				function =3D "smb4";
+			};
+
+			smb5_pins: smb5-pins {
+				groups =3D "smb5";
+				function =3D "smb5";
+			};
+
+			scs1_pins: scs1-pins {
+				groups =3D "scs1";
+				function =3D "scs1";
+			};
+
+			scs2_pins: scs2-pins {
+				groups =3D "scs2";
+				function =3D "scs2";
+			};
+
+			scs3_pins: scs3-pins {
+				groups =3D "scs3";
+				function =3D "scs3";
+			};
+
+			smb0_pins: smb0-pins {
+				groups =3D "smb0";
+				function =3D "smb0";
+			};
+
+			smb1_pins: smb1-pins {
+				groups =3D "smb1";
+				function =3D "smb1";
+			};
+
+			smb2_pins: smb2-pins {
+				groups =3D "smb2";
+				function =3D "smb2";
+			};
+
+			bsp_pins: bsp-pins {
+				groups =3D "bsp";
+				function =3D "bsp";
+			};
+
+			hsp1_pins: hsp1-pins {
+				groups =3D "hsp1";
+				function =3D "hsp1";
+			};
+
+			hsp2_pins: hsp2-pins {
+				groups =3D "hsp2";
+				function =3D "hsp2";
+			};
+
+			r1err_pins: r1err-pins {
+				groups =3D "r1err";
+				function =3D "r1err";
+			};
+
+			r1md_pins: r1md-pins {
+				groups =3D "r1md";
+				function =3D "r1md";
+			};
+
+			rmii2_pins: rmii2-pins {
+				groups =3D "rmii2";
+				function =3D "rmii2";
+			};
+
+			r2err_pins: r2err-pins {
+				groups =3D "r2err";
+				function =3D "r2err";
+			};
+
+			r2md_pins: r2md-pins {
+				groups =3D "r2md";
+				function =3D "r2md";
+			};
+
+			kbcc_pins: kbcc-pins {
+				groups =3D "kbcc";
+				function =3D "kbcc";
+			};
+
+			dvo0_pins: dvo0-pins {
+				groups =3D "dvo";
+				function =3D "dvo0";
+			};
+
+			dvo3_pins: dvo3-pins {
+				groups =3D "dvo";
+				function =3D "dvo3";
+			};
+
+			clko_pins: clko-pins {
+				groups =3D "clko";
+				function =3D "clko";
+			};
+
+			smi_pins: smi-pins {
+				groups =3D "smi";
+				function =3D "smi";
+			};
+
+			uinc_pins: uinc-pins {
+				groups =3D "uinc";
+				function =3D "uinc";
+			};
+
+			gspi_pins: gspi-pins {
+				groups =3D "gspi";
+				function =3D "gspi";
+			};
+
+			mben_pins: mben-pins {
+				groups =3D "mben";
+				function =3D "mben";
+			};
+
+			xcs2_pins: xcs2-pins {
+				groups =3D "xcs2";
+				function =3D "xcs2";
+			};
+
+			xcs1_pins: xcs1-pins {
+				groups =3D "xcs1";
+				function =3D "xcs1";
+			};
+
+			sdio_pins: sdio-pins {
+				groups =3D "sdio";
+				function =3D "sdio";
+			};
+
+			sspi_pins: sspi-pins {
+				groups =3D "sspi";
+				function =3D "sspi";
+			};
+
+			fi0_pins: fi0-pins {
+				groups =3D "fi0";
+				function =3D "fi0";
+			};
+
+			fi1_pins: fi1-pins {
+				groups =3D "fi1";
+				function =3D "fi1";
+			};
+
+			fi2_pins: fi2-pins {
+				groups =3D "fi2";
+				function =3D "fi2";
+			};
+
+			fi3_pins: fi3-pins {
+				groups =3D "fi3";
+				function =3D "fi3";
+			};
+
+			fi4_pins: fi4-pins {
+				groups =3D "fi4";
+				function =3D "fi4";
+			};
+
+			fi5_pins: fi5-pins {
+				groups =3D "fi5";
+				function =3D "fi5";
+			};
+
+			fi6_pins: fi6-pins {
+				groups =3D "fi6";
+				function =3D "fi6";
+			};
+
+			fi7_pins: fi7-pins {
+				groups =3D "fi7";
+				function =3D "fi7";
+			};
+
+			fi8_pins: fi8-pins {
+				groups =3D "fi8";
+				function =3D "fi8";
+			};
+
+			fi9_pins: fi9-pins {
+				groups =3D "fi9";
+				function =3D "fi9";
+			};
+
+			fi10_pins: fi10-pins {
+				groups =3D "fi10";
+				function =3D "fi10";
+			};
+
+			fi11_pins: fi11-pins {
+				groups =3D "fi11";
+				function =3D "fi11";
+			};
+
+			fi12_pins: fi12-pins {
+				groups =3D "fi12";
+				function =3D "fi12";
+			};
+
+			fi13_pins: fi13-pins {
+				groups =3D "fi13";
+				function =3D "fi13";
+			};
+
+			fi14_pins: fi14-pins {
+				groups =3D "fi14";
+				function =3D "fi14";
+			};
+
+			fi15_pins: fi15-pins {
+				groups =3D "fi15";
+				function =3D "fi15";
+			};
+
+			pwm0_pins: pwm0-pins {
+				groups =3D "pwm0";
+				function =3D "pwm0";
+			};
+
+			pwm1_pins: pwm1-pins {
+				groups =3D "pwm1";
+				function =3D "pwm1";
+			};
+
+			pwm2_pins: pwm2-pins {
+				groups =3D "pwm2";
+				function =3D "pwm2";
+			};
+
+			pwm3_pins: pwm3-pins {
+				groups =3D "pwm3";
+				function =3D "pwm3";
+			};
+
+			pwm4_pins: pwm4-pins {
+				groups =3D "pwm4";
+				function =3D "pwm4";
+			};
+
+			pwm5_pins: pwm5-pins {
+				groups =3D "pwm5";
+				function =3D "pwm5";
+			};
+
+			pwm6_pins: pwm6-pins {
+				groups =3D "pwm6";
+				function =3D "pwm6";
+			};
+
+			pwm7_pins: pwm7-pins {
+				groups =3D "pwm7";
+				function =3D "pwm7";
+			};
+
+			hg0_pins: hg0-pins {
+				groups =3D "hg0";
+				function =3D "hg0";
+			};
+
+			hg1_pins: hg1-pins {
+				groups =3D "hg1";
+				function =3D "hg1";
+			};
+
+			hg2_pins: hg2-pins {
+				groups =3D "hg2";
+				function =3D "hg2";
+			};
+
+			hg3_pins: hg3-pins {
+				groups =3D "hg3";
+				function =3D "hg3";
+			};
+
+			hg4_pins: hg4-pins {
+				groups =3D "hg4";
+				function =3D "hg4";
+			};
+
+			hg5_pins: hg5-pins {
+				groups =3D "hg5";
+				function =3D "hg5";
+			};
+
+			hg6_pins: hg6-pins {
+				groups =3D "hg6";
+				function =3D "hg6";
+			};
+
+			hg7_pins: hg7-pins {
+				groups =3D "hg7";
+				function =3D "hg7";
+			};
 		};
 	};
 };
=2D-
2.30.2

