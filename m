Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F88E47F10C
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 21:16:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JLJH52Zpcz305W
	for <lists+openbmc@lfdr.de>; Sat, 25 Dec 2021 07:16:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=imUjJK14;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.21; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=imUjJK14; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JLJ8B6SvDz3bht
 for <openbmc@lists.ozlabs.org>; Sat, 25 Dec 2021 07:10:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1640376604;
 bh=HvdvwRII9OzXHOV3hlj+3jLrwiFzBRUtAT+xujYMRXs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=imUjJK14h7omdvl/FpxX6RRPdCxAzwrQLVYeJKkwdoGpXApyxLYnA8j1Vk3+h5l78
 JOk8DjFuXHRggG77xv8BZ7SnWkA0jy43TmL/qkh8MGdT7HYCu6mJVSyi2UV09vFTbW
 9UcejbzUHdR394KgWUoOraGnr6p7cZsJXlvBlb18=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N8GMq-1mNRca2sk4-014Atr; Fri, 24
 Dec 2021 21:10:04 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 9/9] ARM: dts: wpcm450: Add pinmux information to UART0
Date: Fri, 24 Dec 2021 21:09:35 +0100
Message-Id: <20211224200935.93817-10-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211224200935.93817-1-j.neuschaefer@gmx.net>
References: <20211224200935.93817-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wviO4hpe9xe7Hm9B7ijEe07GIIOkeP970bOmna5Hn9ObsiSHwl6
 Jlh2qRGqNqlCkbNmgW2E1tHEqf4MFNc6xK7KlOW1R58HJTFF/IiglC9pU1FHtLqKJkXTJXh
 6LyzDLX+snwc0XKqluAKbY/bEbv4n/S3k4d5DDK2PsDLy6CAiIXpQy1KSRcQYJ0FycAPXjJ
 vzbNeijbgL+mrqOFuwN+Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4VYM25R3hbQ=:/eUHdZCzEuu26m+033SHI/
 pnCgVvp5tcX0rT+4RStSsUtRUXikp0RgRruO8v/CVMAr6I5yGc8G7BYIFKyb1Uf8LAuU19pAs
 6+qMGkGjujpkOxKn3OhoVOdEP2Lkpm1YLQg3lAlH5kBNdtnvhG70D7WqlnvXYrTE3rMtUXvtm
 GO37tvdORtwKAgMaAEsSMhPWwldxdzVr7GBWyqRtGzrfpy2kjFbv7XcX4o1D/OsZSBWxc+kO5
 r+El0mea8Lf1fEWo/Wf/8LcHXw81RfkLh+vGYeCgs/+AhLP6wNm2DlAr81B2cweQCWATkI/GB
 ycJWERYsbrTk8s/3HOyGWPpV0FoWCWlzYD5tDG7bESVphFfjGzimHkAZLqyuC6JU68MbH8BRm
 NPGHd9Bc1YL1LZjnnx6JckUlOuU48EbW7JIsGWpQD4B5rUmuF7NmsWMai7G9pqxBOhREsYNwq
 EBIGmacYYpcOIq60NsOgahoszCdCSOj7P9dfTY+JZvfZI0FHlNtUdqMbEozJq6HGoomffAUX8
 +ecLRQksHpgxLQJzZ9h+h3AuyNTUy/oGb+FS09g6J5XBQjTGrUQkY4rUFhyL1SNSDe7OQw1ds
 dggNxGflqN82b68V3jWspZ+L0C3eAc6BgkXCXXUYh9ZgQtQDhxhGDs+nbhHFulrWaOzrbpdJQ
 zKzMHBZfbxYP8qOH4ADFblSMdWTc8mpdUk9n+xe9Fu+NYzzPRDeX+NlMoA0OXMHKxPunG3KQx
 5xuuwLA1b/hMwtZyoz2l+My3cMrAwGNwGYdyK8/Q5B+XGM+ozVB64OIsjhZ5D831OZV53N9GB
 DPDe8G+JpGckvZDxsCgjYCTthfVdY6fjzj6uWwLmJWfF+90p2rZNxYiRMJrMJ5jBYm+SOk3VT
 HitRv7q4LoJeUgXnwiuMbjdpNLgxv1j+IddjNc0+w1sJ6+PragkcFhUvAUgRGTMjcmUTKuAJn
 +p+hrw31xldN7iC43vP3eN6wPvTh2K0Xek2PSB8lm17sblTJjt9TGDA65WqdidERQnL66D589
 tuhkClmwKY24gjpV95Qtyx8Gr71+zWo6uyPZv0S2szOB2+PQ81zg/mIuKTUuGivR75QEiW+Tn
 xykOl4sCm9racA=
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

UART0 always uses the same pins, so lets add the pinctrl information to
the common devicetree for WPCM450.

UART1 has different connection options, so I'm not adding the pinctrl
properties there.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--

v3:
- New patch
=2D--
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi b/arch/arm/boot/dts/nu=
voton-wpcm450.dtsi
index 0c547bd88bdbd..93595850a4c3c 100644
=2D-- a/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
+++ b/arch/arm/boot/dts/nuvoton-wpcm450.dtsi
@@ -55,6 +55,8 @@ serial0: serial@b8000000 {
 			reg-shift =3D <2>;
 			interrupts =3D <7 IRQ_TYPE_LEVEL_HIGH>;
 			clocks =3D <&clk24m>;
+			pinctrl-names =3D "default";
+			pinctrl-0 =3D <&bsp_pins>;
 			status =3D "disabled";
 		};

=2D-
2.30.2

