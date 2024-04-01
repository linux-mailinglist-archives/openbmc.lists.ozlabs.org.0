Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F6E893BEB
	for <lists+openbmc@lfdr.de>; Mon,  1 Apr 2024 16:10:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=N/E9b6BD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V7Xwx2Ywxz3dTx
	for <lists+openbmc@lfdr.de>; Tue,  2 Apr 2024 01:10:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=N/E9b6BD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.17.22; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V7XsQ4MpTz3cVd
	for <openbmc@lists.ozlabs.org>; Tue,  2 Apr 2024 01:07:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1711980453; x=1712585253; i=j.neuschaefer@gmx.net;
	bh=ohcs8D59rtgiOiXl0NPvvlBISsJ7WmJzmnNSHdlealo=;
	h=X-UI-Sender-Class:From:Date:Subject:References:In-Reply-To:To:
	 Cc;
	b=N/E9b6BD20PdhRq1dq0Mo5BarztFA2/6ShVeJq5rJrX4YXuOsMpHiBzPIPn88Z+U
	 /z7KvsPqQW9mQHmPoIox7ct0zhr0i2ELogxWEyLAqwyyjsRmO3OqhZn7dn+qXq+98
	 WNEwCZkeARP5OU8sEiXZdsBrQPcyoM8Wp7iLe9Xw/4iZxe8j2FR18Hl97wt8uEtE7
	 E6yLsd/MYkWWl8aIpXj/hIdTT7CtPjfVquoZGcdWUotZ5+FrpNKK1YL25lH2mN0Dp
	 XMSrot5WnD5dhT1ZJBOtMhR1/qZ/h6OoRUb8TSz+tsqU+UfkdfB62TyZEcE2emQrY
	 pU7qQdCtoUuwO6wHNw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([5.145.135.152]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N8GQy-1svAZx037o-014Cw6; Mon, 01
 Apr 2024 16:07:33 +0200
From: =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Date: Mon, 01 Apr 2024 16:06:31 +0200
Subject: [PATCH v11 2/4] ARM: dts: wpcm450: Remove clock-output-names from
 reference clock node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <20240401-wpcm-clk-v11-2-379472961244@gmx.net>
References: <20240401-wpcm-clk-v11-0-379472961244@gmx.net>
In-Reply-To: <20240401-wpcm-clk-v11-0-379472961244@gmx.net>
To: openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711980406; l=1126;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=xn4v/uC5bdj4+skUZRMVN2ehzt22gHcJTXKTwlUUkA8=;
 b=16Q3Qrz5ppda4LwcuRH8xWLzS3xIbppttkVLCnH3UU4PLv9jSu242xpjci+fzvg3KCsdIZH8M
 W8wU4gCjZHVBwVrPm2UMxoLhiRgQxfCQYvlENg9PcjSBWajE2cpxlp1
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:eC/Hz6ZBpjbElbeDeEAblIFj+kCDdDPeTphESbu1bKtGBhVeuOC
 w2fnqIwwjC1Adj1YgTW1pTg4OTzts4DhM2nsaGoeF9PmtTn7Ex/lYWoWbueLJ+0WLjDkiAU
 +QuGhgOVaTFDTM1TIjhwjehtKF4C5AiqokMZF257lxwHOvIyTWYuKdGG0HBm92dmjFK5nya
 i8tZdEWxJ4GXIqqEOJNkw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HNkEzSRCfyI=;QLS6XQfZyEU1e+87eegpOsz1AnW
 TXVnlpicnGsnZlhgzUND6N5HG/ehMWGmZYqCqd++HR5PnqJV8KctJisACU+glbiEI9I7v3LLZ
 apvTHHvAVb0+i4FNctFDdfuLjStb288XZsXRJeOzZT/6+ZgXcbyA5MprNPPOQBv4ELrVzNjY8
 gQVfJCDPP/xsy1jxgZqhNhUMkFq3XbsWS0IC4Ipp36UeUUO+HmQBTnuAmtG83qdVzEkqrUKOh
 OKxPHB2fXYAFeV09I19xjTFCHu3IYyHLYHnk2dZoNHWfI7TI33e/x9J/X0PyVhIPsajc3Pcep
 1SDuEp3oW4+83piVCaalMW0XRXygO4IPiuvV3jjpLa6hguZlaRW5ztMGuy1fWqWmj6qjGiTpW
 mXSbXtcMxpb4AzoBateYqOUHkTGZIT+eTZMuVfSiopCXY978+bi3/dMMvffU8nFbEszl5rfr8
 2yIvD0HjgiQxpwqoTTjHGGyynQJpOVvpGwOUfSkT2hKB3k4JgtsXFcBwT5Hx0dLWZzPDNZ+H9
 uLnCO6pAAXb+ZaAceKasqLjgpDiu7TAHPD+zQzvSGMt5jObmaUqyk4BLIeluvVvKQWOLSWidQ
 esTzaiVQVYmVf0WEoWUQgTWolO0HXjk491Uhhr52u29LyTmqzGURktV4LYBLYXJiU8ZEKJPrv
 rx2z9laFE6C2blf5Or5Ebi+w8pIIODUAffoFK9Kq/BtyyZGP39RcN51MIiEszWc01uw5/fxCV
 PQ22MMCHauRCRFTXiiCuLqjW4a/vFjIBJ7u2aXGCRFRXIcalALYt4QrcsxbYqudP3lIwbK2QV
 KvaSIzHONqpl9XMabxAtvJ9tgiLF+uIilCq5ThwlvZGbjxBn5UBiW2Ox6usZdFeJro
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

A previous version of the as-yet unmerged clk-wpcm450 driver[1] used the
output name, but in the current iteration it doesn't rely on it anymore.
Thus it can be removed from the devicetree.

[1]: Added in "clk: wpcm450: Add Nuvoton WPCM450 clock/reset controller dr=
iver"

Fixes: 362e8be2ec04a6 ("ARM: dts: wpcm450: Add clock controller node")
Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--

v11:
- Specify since when clock-output-names is unnecessary

v10:
- no changes

v9:
- New patch
=2D--
 arch/arm/boot/dts/nuvoton/nuvoton-wpcm450.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-wpcm450.dtsi b/arch/arm/boo=
t/dts/nuvoton/nuvoton-wpcm450.dtsi
index 6e1f0f164cb4f5..9dfdd8f67319d3 100644
=2D-- a/arch/arm/boot/dts/nuvoton/nuvoton-wpcm450.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-wpcm450.dtsi
@@ -40,7 +40,6 @@ clk24m: clock-24mhz {
 	refclk: clock-48mhz {
 		/* 48 MHz reference oscillator */
 		compatible =3D "fixed-clock";
-		clock-output-names =3D "ref";
 		clock-frequency =3D <48000000>;
 		#clock-cells =3D <0>;
 	};

=2D-
2.43.0

