Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BFD488B5E
	for <lists+openbmc@lfdr.de>; Sun,  9 Jan 2022 18:36:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JX3zP3RLWz30JN
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 04:36:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=EtLMy0lN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.19; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=EtLMy0lN; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JX3x019Gpz305B
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jan 2022 04:34:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1641749650;
 bh=zAkaWJtIEiaF5BfrxXNSoNcVTm5LuijzYenPGRzKFfY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=EtLMy0lNnp534bvX0eXuPogRMdMSytQIZ67ZliFa8+COM9XLaGU7mgHMzIHbgWaZR
 DGgwfB7M5lJLN2bJVGB4bafLqwlau2Nu1i7HH3PMz7dcLf0eeVr9S4xyEzl2wjSP6w
 /a+e5X1hAvousPQRGrj2/jsNr/fPzRropOssd8pU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([89.0.222.244]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N17Ye-1mM6HI1RAQ-012ZBi; Sun, 09
 Jan 2022 18:34:10 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 0/9] Nuvoton WPCM450 pinctrl and GPIO driver
Date: Sun,  9 Jan 2022 18:29:51 +0100
Message-Id: <20220109173000.1242703-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lJDLqNjp7ysf9WlEHyM8eGXsDJj7j+Frzh8G7J7w5jv5TCQhCD7
 Rogey9YoPUoD8Ni40TfPiwrALwDCmZVhp+LHdGogPZ5R0sx9jhiVQ3ZdPgdHiLhjFo/AGtZ
 GRR9A7idEXcKkZjoq2+OwePQmQSYg8Lqt0fqEpCduCM41Q4bdyO8pSG5seaq7OnBivvofwk
 DVW2IzqhG7op/Utd7F9Vw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:M7KWjGScLuE=:dcmuNyJu0CCqHDSq9p9xpZ
 gXM5rmscCC/kQ+HxOGNqr63s2xPlthIsbuOs0ahwvWKllKEQuVdwQNYwkxzC6xH7yIjvP0CxS
 v/wUqpr+iMEnbiOWCXnlWdpzqOSxt1eTvsPx2rwVHB8CH4Y5OkEE0rlrel6diSwaA3XJu2E3s
 Vvp5zVrj1gyA1ZH4StKvsK1Fcy82PJiyoRoV5SsibzrvZx2rl/IgEE1Pj+KS9h9A+GEBlaRoM
 BhAc5nxPMzq+thOkESyBqXVD3bBr1cNxHFs6odVb95PbxQB1eqhyu2DZhdfOzD32TPQEEeIYW
 XX7v3Y+1O3Ms32OzqBtPjcbrt7+Hd0D6HJj/a1+TSe4rrAEMYUy6QkHc4cdYci0aD9/A+YUdp
 NgB1+MFXWhiRpi4cG/E3VHBbDWlf0CWNbXHmPVAjTUImRhqu/A1V0aL6bohD/JCg5UJNj4h3A
 nj4Rx3gDEmGk25hEUXsw1JSMC1qNcoufGg3n7VdYzyNSawnJ8S69lLXnRijqg+IgqGQsN2+bG
 SpEwAVGSmKhw+OHS+2bphX8RhdbwE4KC1YCKb2TMZ+vhZBByIAwyOodrFnNzvTznYv41/wz43
 1gZSLBXRhhYGAucds4HhLHMnzjFDBFrY4wnF8AZq+YYrwIHniXHUnPz1Cfo/nZVRrcYL0ggQN
 C49+631wYqE+39vWE7PqgIiFR0oABljsYXjqbsu65zw3v3ZxcVd9GynVvbCE0wJ+zFWDHI33o
 Z8+e6YSg9NLCV+YAwyb06jQetGVAT1UV3fZVgquArXrdLwlcamyIW4RymCMrAqr7uniQaQePR
 ayZGGJyBEP+Rxeg/hIw9DAHKzmIldRpFZQilDSXxhIDFYmXiu6PGRweWPxTNGxiv7asH49LnJ
 mTFaw5RhRRwveDEOcZMV91ozO5Xbjg4o6r8wcSfWzgJ5EHVUaL2+D0kPK8QjLzAYvYAt76UPc
 sqADX3SNsgduU7xYhOhjCbjuiS1Yek5cU2IvIxl10tT1CwyN3bdu3baHT4xIgqNBSg7x6tu1J
 AN0L3KKcTEaAo0znoGSN6sJlID79T3KhWym0qk3Yl2+KSMnieKTwhNGvFUaXNWgFndc3hR1Xf
 f5AuZxGvtbUdus=
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

This is version 4 of the WPCM450 pinctrl/GPIO driver patchset,
with some small, (hopefully) final improvements and cleanups
(see patches 4 and 5).

I'm targetting 5.18, it's now too close to the 5.17 merge window anyway.

Best regards,
Jonathan Neusch=C3=A4fer

v3:
- https://lore.kernel.org/lkml/20211224200935.93817-1-j.neuschaefer@gmx.ne=
t/

v2:
- https://lore.kernel.org/lkml/20211207210823.1975632-1-j.neuschaefer@gmx.=
net/

v1:
- https://lore.kernel.org/lkml/20210602120329.2444672-1-j.neuschaefer@gmx.=
net/

> This series adds support for pinctrl and GPIO in the Nuvoton WPCM450 SoC=
.
> Both my DT bindings and my driver are based on the work done by others f=
or
> the newer Nuvoton NPCM7xx SoC, and I've tried to keep both similar.
>
> Instead of extending the pinctrl-npcm7xx driver to add WPCM450 support,
> I copied/forked it. The pinmux mechanism is very similar (using MFSEL1 a=
nd
> MFSEL2 registers), but the GPIO register interface has been redesigned f=
or
> NPCM7xx; adding support for the older GPIO controller would make the dri=
ver
> harder to understand, while only enabling a small amount of code sharing=
.
>
> The DT binding in YAML format might make a good template for also conver=
ting
> the nuvoton,npcm7xx-pinctrl binding to YAML.
>
> Both in the DT binding and in the driver I kept the name "pinctrl". For =
the
> driver, I find it accurate enough because it handles pinctrl and GPIO. F=
or
> the DT node, it's a bit less accurate because the register block at 0xb8=
003000
> is about GPIOs, and pin control happens in the global control registers =
(GCR)
> block, except for input debouncing. So, "GPIO" might be the more appropr=
iate
> name component there.

Jonathan Neusch=C3=A4fer (9):
  dt-bindings: arm/npcm: Add binding for global control registers (GCR)
  MAINTAINERS: Match all of bindings/arm/npcm/ as part of NPCM
    architecture
  ARM: dts: wpcm450: Add global control registers (GCR) node
  dt-bindings: pinctrl: Add Nuvoton WPCM450
  pinctrl: nuvoton: Add driver for WPCM450
  ARM: dts: wpcm450: Add pinctrl and GPIO nodes
  ARM: dts: wpcm450: Add pin functions
  ARM: dts: wpcm450-supermicro-x9sci-ln4f: Add GPIO LEDs and buttons
  ARM: dts: wpcm450: Add pinmux information to UART0

 .../bindings/arm/npcm/nuvoton,gcr.yaml        |   48 +
 .../pinctrl/nuvoton,wpcm450-pinctrl.yaml      |  160 +++
 MAINTAINERS                                   |    2 +
 .../nuvoton-wpcm450-supermicro-x9sci-ln4f.dts |   43 +
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi        |  384 ++++++
 drivers/pinctrl/Makefile                      |    2 +-
 drivers/pinctrl/nuvoton/Kconfig               |   18 +
 drivers/pinctrl/nuvoton/Makefile              |    1 +
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c     | 1130 +++++++++++++++++
 9 files changed, 1787 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/arm/npcm/nuvoton,gcr=
.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm=
450-pinctrl.yaml
 create mode 100644 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c

=2D-
2.30.2

