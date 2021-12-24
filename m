Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B331F47F109
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 21:14:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JLJDx47Wgz303Z
	for <lists+openbmc@lfdr.de>; Sat, 25 Dec 2021 07:14:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=cHdNzbmQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.22; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=cHdNzbmQ; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JLJ883dg6z3bT7
 for <openbmc@lists.ozlabs.org>; Sat, 25 Dec 2021 07:10:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1640376602;
 bh=2dPShzHFzriRqFtF9y9WKwPMzzdl/zbLzrTjgdDn6yw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=cHdNzbmQAEkhxgczTvaGiwnDUn4P/vpmb6FfNbzYZrvWir0COSlIJmfHctf+3FIK7
 ikDbFeofW/J73/QlDoKfEPRql3FVNSXNRKbSQWwY9IS6UPE5LvrneaMcuWceg8RG6l
 rEvme9hBUeMI7NGpvsRdT1H8W+jdsmV2lJQS04eA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPXdC-1mnBuq2Dg2-00MYOR; Fri, 24
 Dec 2021 21:10:02 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 7/9] ARM: dts: wpcm450: Add pin functions
Date: Fri, 24 Dec 2021 21:09:33 +0100
Message-Id: <20211224200935.93817-8-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211224200935.93817-1-j.neuschaefer@gmx.net>
References: <20211224200935.93817-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KeAON96EusSGtc1TAmVKCAO4ZyrOffMl31UPPQgHwRvLeGR87I7
 F70+1M/BEXwruyEFH+cV0Lgpj/qgS2wUIEuhjIIMYkjXO6Or1SF68boWqcI+q51G6NapbgS
 ngOVW4CeJfC+c8wufCmOQVYvvno3BObiaPCjL1vN2VReDMvrVgmoL2QDG+j+Z/MC6ZCfOKl
 jTV4XwK/hSDtHJBJA6Xag==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y7/l5wAHr2Y=:k1t2XnCiseVt1SKbBbteGf
 5c+I1cl7tt3YAoP9dnkdSphW72gSjjErocrkmpcQ8iggkZ/dRbPcA/InuoLx/9XL6abQft29s
 XkbVlx6kGsmnlJTcXhxL1QFmS+8MRHYN3H9IT632m1D4P5JPFKImZEKg+l9f0TKsvpQKbg260
 Ooqx0T220O0+N0+1d+Xo1HGzkwYUzSn2Phr8F/ieDsI3/LuxCTcJwBAcN1blkIdIdzCDpLjPp
 Heo7j/zHYmv3N7/gA3sCxNK9xiOvZGpV/QL8XErBpYrQxN1vxpiIposLn8B9LPJNz381bcmi9
 V7P5W43/DiygyHAJCjpdRaGZNhIUGmltSLIwS9AqLv/GBQDL90+iDqg4lSvlq/urdv3hPu+QQ
 B51r/IhxlAbmBpef2j8nlm7ehNukL7Qx/oPs5poXzHoF3EMmJGXHiCCvhFR+Tn1KfKFxjpalf
 AiP6rFz1lGBiI76r4KPGsp14a/vA2VQE6tsiCb6cwBkrgq32dIJ61MN9+h4hgJUWLtVTs0PuL
 Hn1YNKUOMxSDRCulPzXZ/h4DOLC2vHrY4ZtCwmLX6R8jJe0JhcmSB/no/xC+kbtluIPWm8F6b
 wiJH8I6kVRsqn7FsFM2nBSj3bgz2Pz8/Z+DeTcGEtaJlu5fcliNNDpvkU4edwpLcXLOe6eARS
 ut5Si+jaANfu/wrzA2gozrGpN/L+1d5SIWvCaytnag2n0YUYSsQQprTMPkJHiGcpHrONbArZG
 VfemcaWqBAh2Rd0FX7ImdmqE3MAoeAfCCJs/FXDVg0hzfNVWVBi2kstf4h82ugacbRJWsgVQB
 3ZJKc/YO245kHwcZGfIa1LRVlVBmTAX8Fp0e6GwCPOjUcIo1xv1cy79YwaouV7w+9wVLFVPTj
 3PFm9A383acRHXvR44gKgGT3wYHLI7pD72uvbifOACwbLlHG4fJPgCuKm85rIAuykcpl/LtS6
 Jam/Al4Mf3WTCOHQvwX20c93nqfQFVNm57lNgVI6VxcxVkO8I87g6s9e+MrgMgSu0pSl+tXTt
 SwptsAqhkjy5Xm+dgU8jQe5eZ8ukNoWDEHBYkBhgRlEi5L3OYA862boaI9DVSR5WxP9JTevwF
 kCVH/pI9TwEDH4=
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

I'm not quite convinced of the value of this patch, as the pin functions
could easily be specified in board.dts files when needed.


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
2.30.2

