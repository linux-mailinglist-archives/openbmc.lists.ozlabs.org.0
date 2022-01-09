Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20078488B6C
	for <lists+openbmc@lfdr.de>; Sun,  9 Jan 2022 18:40:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JX44S6yJJz30MQ
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 04:40:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=b5iCVKNM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.20; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=b5iCVKNM; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JX3xj4Gkdz3bSs
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jan 2022 04:35:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1641749666;
 bh=9XPuSrijaVuSFlI6x1GuLlPapXp5wlvz5FaTSoN6P4M=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=b5iCVKNMEfqOxVLmSCzKn/kQBwsJcG2VmIqW2XaVb5Tn+4Q0B4YcEvV+leinWiMMR
 GxRvcBq2KRhXcpU2hCXRSuYo4dz16UAl204ZEhjiD+kaOyUiShhbd3DuxMbhmKo17z
 23xaTdeqbIiVBbySlogLhd6VfbiAgwsoSlVkuZ/I=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([89.0.222.244]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MSt8Q-1mwFxv3J54-00UJCA; Sun, 09
 Jan 2022 18:34:25 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 7/9] ARM: dts: wpcm450: Add pin functions
Date: Sun,  9 Jan 2022 18:29:58 +0100
Message-Id: <20220109173000.1242703-8-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220109173000.1242703-1-j.neuschaefer@gmx.net>
References: <20220109173000.1242703-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:A4gTyO/EMHBziWBAitNEiroYxoWqEQ40FwzGPf1wcRVI/tiT9XM
 uIfQrt5xjpV3CF6I4wlq+Nnh6GY/eF38OjLQ05hO6QUB1FNyXV4A8nSmkDbF6NzRU8vNdQ+
 xNbXLyOi/TkBY7FZrizmaiqcPdc/1PUjbzvs3jkMj0++gFXYfEfhXLvcFHrmH6D6rE4YadR
 i9eK7k6zozIVYTUActbwg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:V+7dhiqZ6bM=:+oZGRATAjXkEPFeP/42uW8
 lmi2ct8X/u8vCSK3GHH/s/MEkwPD7+BfeiRfaEj4KtTyHkDupwRmoeC/CZhTknqcOAHpb9Wvz
 n/zvZdxpKRIZEPTFCtijdIW8/rvAxUY3erot9uvvGRnwdA9f98nOZnRcovzEVsaCe4LExaHix
 aGEBkRUmBXZ46zXGT3yBu9hSCe54k3Wi5bPq0vZzVq02EPgHkjk6oaJ1C1HUJhAXWpM/NoDJr
 kfBS35V0LK9y+dPni3bpAIhPX6s1EI121/G9hg140Z6fePwfrq8DmU5U+poQWLD6UdTQZ8G1x
 N3oYzMJHHh8/7Wd43MiyNgaQXhLrF2p84kc65TLct+DbqSkWxU6d9+DtvS4gFBV7G8eO+NdHc
 4SfayyUM/DF/OyuIUSVdN2PNO4+9o69ADcghc8AFO68Fm3B0LU8fUBlRUD0mYAr3YQqsj3Xgq
 SARRIWbpJIfVQYQAnoD1XouR5YAZbKJ/CJwiMC+eVezQLd5izRPYTQUOajepHhVbDHbunQcHe
 /kmzDg3fYMJyJbaExhnfwSfIN2OxyctPV68awwAl7ws82RtPJfyIDVO5S9HznptAeCk3GAjZJ
 D6Qx7tIjYSK41U5eVG046S4wxDFBaX+2p9idOe9HbzIZfoueebhfieNPn3G8I8V+OLMtW1qeX
 40LadXHU8lXe5Nq5fUALt/dhcaAQB00aCtncGdo9HQhpikbLzkPQMh4L3SdHK2GzA6FCFiwNf
 xwEeL+W8LwGLUaYyz6qEbVO5vCOygOT44QDli3I95LDk2xHdrWHT4sPgF0n7r3ng4ksGKV9Dk
 xb1dRkqiBMKX5o3Gh2D/4qcQJ06cZHMqLlZJ6K+UWTY3Zj71CkshwbcTmvoRFsp9jQibDq5C+
 7sAAFWb/X2Vdkz0X6LZuw9YD0vL/dDj2s4PrM0bMd9ukSFiQ1+j5eos4oajmWR+ss4MdXehaH
 T+qZMMLBLIsqAotB2GFjTGoxAFtwc5yGELPwGQQUq2mjNfCYdlhNV+3QCKsFm6YQZaCIx4HZ/
 cR359vKXFjFjwf691yMG9Hv4OigKk21v8YT2xJeqmqnqFishxsTRce9nYK4L4cEquRR+q+vOJ
 7o+7MD6oRhor7s=
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

v4:
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
2.30.2

