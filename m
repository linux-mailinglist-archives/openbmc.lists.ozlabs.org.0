Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C20E23988DD
	for <lists+openbmc@lfdr.de>; Wed,  2 Jun 2021 14:04:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fw74F0kNkz30Fs
	for <lists+openbmc@lfdr.de>; Wed,  2 Jun 2021 22:04:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=BDfuHGi8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.22; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=BDfuHGi8; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fw73l4bj0z3063
 for <openbmc@lists.ozlabs.org>; Wed,  2 Jun 2021 22:04:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1622635431;
 bh=qZQhWTowqiYkoxgkXmb/cPyIhbsC75immN9JA51QEdc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=BDfuHGi8WuHAGrhX5zpQ3z78xionogXW72XsR7XgE+5jGRayl9uCmG0J4Cv7RRGhu
 q2F88BKS7SCNO2O7mVTti0Ef9F6FXKKuIG87psMle01TyOJDqoM/CLLIK927Tk+tfE
 m/uIm7Vza8/l4SKWLEsye4Ugzcq+ZrksbgKh6J4g=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.247]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MkYXm-1l74tF2IAA-00m4IC; Wed, 02
 Jun 2021 14:03:51 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/8] Nuvoton WPCM450 pinctrl and GPIO driver
Date: Wed,  2 Jun 2021 14:03:21 +0200
Message-Id: <20210602120329.2444672-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IUlyBz6GVy3FvZTNDuMIU0068YJy7lfTqN9vz0te/7WdNJ+uQH6
 LhaVf27+sP0fS0jrph/qhiKLByDfd2/9CKo4aXIcT/wkEJItJ5qZeb8VXft/lnTykxwahcO
 opNE/uMKAnVXN48iEjhfdnuIUs4AwDTpesl6liZjNyk9eQDFtxInmeEdre9qF4dvYw8tWuS
 +VoVDQB8xQONJzwEwDm3A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vqQs+XfWXTU=:f6JmwZ/CsuoalnE9uTIxk6
 ySJ1/fwPWwJ00RUsSebb66g+MibxEZQR5MFVjYbxVUPJv12KcaO/aKldZZ6rQYRRHfEAZW2CL
 XmfPr6m0VTuqv22VCk7+w1G0TFyI3zyLnZfbOM2xcmKpT+zxAj+y3Ssu3svxoAThZBdYMDad+
 J3Ojrk4ZqjGfPae3A/AyhSskPVcURJUtE/zSsjEWEAGqar6K3mZ/za0Rfl9zSb/ZSJ8FVJmNh
 m+8au1hl3Xlrzv5O3cq+hw7vG3W77d1kMa/JhE/6ZFIo7pEDw8Ly/wqyjqSBJ5pm0j8RclgWk
 jqc+5LXRwnUOoKZLmZilc6U31xb5GCLO5Xd5P39e2QAPTnp58Abdgf2sVcR1A3Te1cHd06wM1
 JN2vNFBhdhv44CekSTYt8FeRRKh4IfK/v5TefkT/Pw5rljoDcnxaG0sPDH7BrRG9AzpWG4Q1F
 xTOGr6cgTIZ6y74t46JbgELT4cEvCDXM9U40h3rULYTn3w0HDNg94zRq7vuYY/sOmZ//9UZKk
 WtmCRhbn3Zc158fg4tloRxMQd+7n5Fpl+d+TAbgQk9FFOezjBK3JtqBuM3WlVXkwp+QfzTlpf
 muFrEh6UDAWAHWGmDUsAsED56Rld6rPLFvVlDDARKnEseEbo9LVuz0Zq7MVUQnUHrQosuQzzJ
 Kr0/t+J8D2uzFkqd06dEzIXEb1WM0aSQBkqSkeT3BdjFaiJBYxuqVPT7ZNKgIuSXThHBiUIfY
 AW9fGSiISGWNxOu5Ae7ZQurPQeuZqXq0PlNdCfEwZxrHkcCXxhR3ysfH0zA11N2p1QVdIEdzq
 NxJWVGYR+iHgMFNsYxlADxok/0S2Yn8CpMqzyvveAljhUTDANIHP4TmkYkKJFTY37lZwLfP85
 PXH9Whk8zYEXOgp0JXoWwBmsTvIaVNhiHg9HHcmbU286hr3VpmmmHXb1JgyUCXbtzNU0zCsCX
 n6ObvV9LImrF+e3bq8qHDtJcxNpz4i1dibzoIUxzlokkaGaHMpitIk419rLpvLjVpd3v/P86u
 8GRwvRj8FqBxLismpJSq5B62Mli6gqHVg8GL7TsMGUs7Hw6AoJfrQIplq5civ/g/eobZ86U9z
 8Dx2v6tchmuRXYMgB0u2HOMnlF40QdMYgDb9+NXyJZge4il7ssiz1Bh7g==
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

This series adds support for pinctrl and GPIO in the Nuvoton WPCM450 SoC.
Both my DT bindings and my driver are based on the work done by others for
the newer Nuvoton NPCM7xx SoC, and I've tried to keep both similar.

Instead of extending the pinctrl-npcm7xx driver to add WPCM450 support,
I copied/forked it. The pinmux mechanism is very similar (using MFSEL1 and
MFSEL2 registers), but the GPIO register interface has been redesigned for
NPCM7xx; adding support for the older GPIO controller would make the drive=
r
harder to understand, while only enabling a small amount of code sharing.

The DT binding in YAML format might make a good template for also converti=
ng
the nuvoton,npcm7xx-pinctrl binding to YAML.

Both in the DT binding and in the driver I kept the name "pinctrl". For th=
e
driver, I find it accurate enough because it handles pinctrl and GPIO. For
the DT node, it's a bit less accurate because the register block at 0xb800=
3000
is about GPIOs, and pin control happens in the global control registers (G=
CR)
block, except for input debouncing. So, "GPIO" might be the more appropria=
te
name component there.


Jonathan Neusch=C3=A4fer (8):
  dt-bindings: arm/npcm: Add binding for global control registers (GCR)
  MAINTAINERS: Match all of bindings/arm/npcm/ as part of NPCM
    architecture
  ARM: dts: wpcm450: Add global control registers (GCR) node
  dt-bindings: pinctrl: Add Nuvoton WPCM450
  pinctrl: nuvoton: Add driver for WPCM450
  ARM: dts: wpcm450: Add pinctrl node
  ARM: dts: wpcm450: Add pin functions
  ARM: dts: wpcm450-supermicro-x9sci-ln4f: Add GPIO LEDs and buttons

 .../bindings/arm/npcm/nuvoton,gcr.yaml        |   38 +
 .../pinctrl/nuvoton,wpcm450-pinctrl.yaml      |  142 ++
 MAINTAINERS                                   |    2 +
 .../nuvoton-wpcm450-supermicro-x9sci-ln4f.dts |   27 +
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi        |  321 +++++
 drivers/pinctrl/Makefile                      |    2 +-
 drivers/pinctrl/nuvoton/Kconfig               |   14 +
 drivers/pinctrl/nuvoton/Makefile              |    1 +
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c     | 1230 +++++++++++++++++
 9 files changed, 1776 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/arm/npcm/nuvoton,gcr=
.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm=
450-pinctrl.yaml
 create mode 100644 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c

=2D-
2.30.2

