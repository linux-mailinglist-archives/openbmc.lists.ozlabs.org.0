Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA8846C67E
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 22:14:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7tN60qysz3dkV
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 08:14:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=T9lTMve6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.22; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=T9lTMve6; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7tGD6r9Pz3bqS
 for <openbmc@lists.ozlabs.org>; Wed,  8 Dec 2021 08:09:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1638911340;
 bh=ydeSff7ARSMRyer2h0d+ysVTraGKpuyvVeQKsq5VJR8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=T9lTMve6OGkkF88AplB53qlRFXm0fKHzFXSBQ31Wh1df1U2S9lX6m7sJrt9wly+Il
 8V5sheFbKAstTJPkU6aRS0yIMaWlK0x7ZPvI8QvcWf5S54JHGnvzuKZLqiz32S++mo
 67aku9rwTkRp2b3kinXk7fWoiRzkNxTa6p42Dza8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLzBp-1nBxRS3hRZ-00Hsmq; Tue, 07
 Dec 2021 22:08:59 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 7/8] ARM: dts: wpcm450: Add pin functions
Date: Tue,  7 Dec 2021 22:08:22 +0100
Message-Id: <20211207210823.1975632-8-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211207210823.1975632-1-j.neuschaefer@gmx.net>
References: <20211207210823.1975632-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xPSju/tOW5OV/wGSkbiyijYM7IDYw6LltJqtBLSOpIeyTa3NxH3
 vmF73ZHXxWgqfbe5IJXq/qNtkv47ZHdamDZFg+MoGzxfe63imFGEr4EVPMTy98HnQXfWkwf
 c6HnOWa51B2hYSUWjWlky7B4Wv39yDzrkwL2YZkTNTMu2CD3teyYnfu30nCRenZ5ZFn2lcH
 mRwsS4aTaq0XtJtXE2nYQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gSo5a5iquJs=:x76q+v18WI3JdeYPsXy5v8
 H5FLcwMYpCG0UIvazeDFddTZD04vnUWWb78gYsDC7qVjnPckQbAqPMWdzhWzLtBF9t2LIX0zs
 dcAkzrWnwARrwgdUYg5GQxsKYzwr4J8z11Wss0C7SNGpWwB9X0Oodrj44GThgotPiqruY3Ona
 sX6czn1vCImfsqcFd9SpwWl+6We+v8lKcwvIKyBlwU9pyTQNB7N9lAQs7KwYAoonr0hJu1EeO
 +jV7GwK4z4CRMi0ZUZv9lXaeqkJ9thrP0YdSPFxbQR8dSNWhTTGY9WgOBwHCKqTDvyMslxETM
 T/s29MaiyMsfrCBJ/WmCPqdaMWDbsq6gyFL+lhxEmbOhGj4zTC5CYkRMzfmD54gci0MZh9B0O
 5QcDWqXg0bf9VeqPoQd06NtFNGZLUVws16gh0jCyu/0anNA//kdnYhHoR1fxrKNM5OTsznqeC
 bdCaRfR7kfpchfAXuuwidfRGA1kDvifbxT5Y94xwK4C8yiZqbM1agapPwGr780P+lo2NQqXC0
 8uqY99WRDL7M/pKqUzeziJ7qlPx8bdz1p6nKqPRO3TBa0wQirfXnFAvgCl8MH+GJP0yO5mpST
 FN3XcXwYJ9rlWzSq5A0VZr3f9CVgQBLEyBmsUcKwMVmpkFyULfA5idtiJDmUOdZZxB1CMt9sM
 GcavnR/0rVgGiKh2RKMXk2pqF9zBjsbVUd9P2BLXMj5utG9zNXprxtf2gQzjHqRzx21bRHUFQ
 Xjhrs8lpczYioZqAxCyPc+/hvNw9zMl/o6EOSxgK2zP3djhLAwfGE9m354vYHV66sJyQ9tNcu
 X/HvtAihJKs2uwLcb/fB2eGpC1TWZmLkRndVvJ+l3SuYc4YMEa/TDiDP+qky9RY2L28itr7Xg
 K3UCXtNWMtIccGyfxRxnsT0yG6A46U3telvCzMjOz4PZQ++wNXkfWvEEKRhXf+Sh+/+NvaMdy
 0Xhrpqu0NtWQyCPHMlz1Z+vtfpxCLH8p7Rf6HLbwoGA0lqbjJ8wQEWm328HV9nhkB0M72Wm6b
 7OI9SqiWCT5B4E5e4oDQ3kwuL4UFSIU50RJBlWJ/zDFmh6tW+cCKRCYATzjqc4Jge8nmoRYzP
 JqxVSfc+zxM+Wg=
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

I'm not quite convinced of the value of this patch, as the pin functions
could easily be specified in board.dts files when needed.


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
index a795cc4128654..b377e61714bcb 100644
=2D-- a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
+++ b/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
@@ -150,6 +150,311 @@ gpio7: gpio@7 {
 				gpio-controller;
 				#gpio-cells =3D <2>;
 			};
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

