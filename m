Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3355046C653
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 22:09:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7tG504Zxz3c75
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 08:09:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=LDdAbf3r;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.20; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=LDdAbf3r; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7tFj1Vkmz2xWr
 for <openbmc@lists.ozlabs.org>; Wed,  8 Dec 2021 08:08:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1638911323;
 bh=K4vF7NtANaqqajHsilWhxkIG2LZVP7G25JabgORPFjI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=LDdAbf3rur2gSEH+++YUq4kjIxDYzZjoGzwLi5zLQQk7R/CzZcNtJ5VpPkRWZGxU3
 MK6pOO7OYweYKI+B8VrbUi+ydkePjrkG5uzwYqct7SocjQc/U5B4Ozf4M9E+1mspah
 XrFnVOwZ90+sso/yjmEBbQH7RYP4pT2B/QFAj2is=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MuDbx-1mZJIc0rKX-00uX2z; Tue, 07
 Dec 2021 22:08:43 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/8] Nuvoton WPCM450 pinctrl and GPIO driver
Date: Tue,  7 Dec 2021 22:08:15 +0100
Message-Id: <20211207210823.1975632-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YuSMQ4GRNlylx4koho/4mLk3qqxB2udQnbqjMCtBcyP0tPiO3WS
 y3pZ/wLkBmFN2NorXTAPDj6GwEElNXfeyOj2SI0SGl2hMkxusGP7DcJEkdUyfDZ7VbXS236
 14UTYiNDjx5Lo38xkiU5HCQQ7tYPkBm6UHW1uTB+8buSrx62FA4n+Tj70xjL9PKFqmO3VaE
 runBuV67kPx4vPeUBuVuw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:R8UxeRZfJd8=:KyF77CNJlPuomFUj4jQ9BM
 G/Kk+otr4gfpquo1zt5kdH/2rr0t1/+Fq0NxuIXuDVcCZqKlSf2lfb2SGXN3hiSObBaFomc/h
 31volWN3MFAXtACtagM0bAJwlh6d547RlTCXAGWrzUGNBh0aN+8qyxod5Juklmr3PlJONCEAC
 X6nHNjdVZLCIHS7eKSbSGhN+gcxJ6ZAsYL293OpxJrxa5Cyzw8/OyHtFqSnbajWKkDaQ1eO6z
 t+JccSIXpHEeTTbyqdbCAx4P+nsNtCUYR8tiS3YF4z1XhVNQeYW64O/qnJ99o1kmyRxOmutCY
 YUOCSW0dzvfKLMBp1It2J15po3gCF6fNNeBLdxDSwAQh/c7D3XFVmkT4WtvsjXxM6M3UMhwq/
 cpGBl+RZ0SFFVfuRG/r1J02tvImBh2YKT5Cph09kdUD1p6MJxQdrGG6d3C2K8LcGHOd/waE/r
 Ah7Fwcky9g9abwspFlnLAGknQTje5VOHXI/QLwpH8D3B4dYwwegWne/Vysag+qkb580n22qna
 KbVgh+lVW8XDKybKwkiYL14BG/VldBMVh+VZhoEta/LlNkgKKNbSEBt99A1Ewe4Zx30fxIbqO
 lX/2NicebZmNEVnN84vsAp8Fg0B8pxbY57hJX8NH1oPDqIQk/83yX+lUyKylJOsTyVFD21izk
 MhIzvn/66wkpcHmryc6V5CNFh+8dMV+XopsjA8WO3uRrWMsyJtZvLApA8PwcPHpHpyeWPTS4F
 GvT2rQsSkZdQETPi1twx9DuDTIaZXQpm+0MJIRvB+77L76+so/CAhAVl/Yo4Y53vG37mW5FcX
 ukgR0OyKaDaVxjAjxuNeC+OxqDXzBZHOhlF726pVUI5HThnToTxJf1fzHPkxjqjH/iVAH7o/s
 JT/AyIJX9gLIKz/JgQ64WIUy17YvKReGXIq16xcJT1rRnWcz/X6psvqaBO+IW+7UK94CNEn2v
 H4a0fYwBDWNc2zpN2f70XeiCHv+WuXn8mcUcbO7oJ8HD2pVeMfYgmA8/62Bx2LLD2SVIZd8Kx
 xQ0KCyoZcvrpnPKhSo+oTcabTUviIDwLq43G2GfzSMC2KId3mXzv7F1t23hphf07RqWhTXyN/
 SBzsrIKiSGPKT0=
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

It's been a while, but here is finally version 2 of the WPCM450 GPIO drive=
r.

The biggest change since v1 has been the restructuring of the DT binding t=
o
give each GPIO bank its own node.

Another thing that changed is how pins are muxed to GPIO mode: In v1, this
happened automatically when the corresponding GPIO was used. I copied this
feature from the pinctrl-npcm7xx driver, but removed it along with the
.gpio_request_enable and .gpio_disable_free callbacks. Instead, pins can n=
ow
be switched to GPIO explicitly, if needed.

Everything else is noted in the individual patches.

I hope I didn't miss anything that was requested in response to v1. If I d=
id,
please make your comment again.


Best regards,
Jonathan Neusch=C3=A4fer


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


Jonathan Neusch=C3=A4fer (8):
  dt-bindings: arm/npcm: Add binding for global control registers (GCR)
  MAINTAINERS: Match all of bindings/arm/npcm/ as part of NPCM
    architecture
  ARM: dts: wpcm450: Add global control registers (GCR) node
  dt-bindings: pinctrl: Add Nuvoton WPCM450
  pinctrl: nuvoton: Add driver for WPCM450
  ARM: dts: wpcm450: Add pinctrl and GPIO nodes
  ARM: dts: wpcm450: Add pin functions
  ARM: dts: wpcm450-supermicro-x9sci-ln4f: Add GPIO LEDs and buttons

 .../bindings/arm/npcm/nuvoton,gcr.yaml        |   45 +
 .../pinctrl/nuvoton,wpcm450-pinctrl.yaml      |  190 +++
 MAINTAINERS                                   |    2 +
 .../nuvoton-wpcm450-supermicro-x9sci-ln4f.dts |   43 +
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi        |  384 ++++++
 drivers/pinctrl/Makefile                      |    2 +-
 drivers/pinctrl/nuvoton/Kconfig               |   18 +
 drivers/pinctrl/nuvoton/Makefile              |    1 +
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c     | 1134 +++++++++++++++++
 9 files changed, 1818 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/arm/npcm/nuvoton,gcr=
.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm=
450-pinctrl.yaml
 create mode 100644 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c

=2D-
2.30.2

