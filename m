Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AD9DCCC
	for <lists+openbmc@lfdr.de>; Mon, 29 Apr 2019 09:26:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44sx6d0ykGzDqP4
	for <lists+openbmc@lfdr.de>; Mon, 29 Apr 2019 17:26:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="cewqaV7K"; 
 dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44sx5r6MKYzDqKN
 for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2019 17:25:52 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id d14so1206010qkl.11
 for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2019 00:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=t1hsfWr4PrNXEvRvlKqYRNJY9G8X93pdPaPe8RE83WE=;
 b=cewqaV7Ky+ENoRJgSy0Ifzu0I3/CcLyDS6pKV8gbEYwPGdh6CSHHYEpk8tP4Rfv8ZU
 0AtY+gvvcstKJkuQN6odaK4JY7dYDWeaiwsWJf0RwSELxoMHTitXHoj3UrATbG/zsm62
 PfA4THR1uKsELvPUHVgmiicxxrjYsv3Ofbu5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t1hsfWr4PrNXEvRvlKqYRNJY9G8X93pdPaPe8RE83WE=;
 b=jNdlunB5LGx+qyhi3RMrZfkoQkfa9szz5AiqKag2kMys84JD0axnEXGvIMP3Hi6L7P
 kiZr2H0oLZtH+7EwQBiptR79KvfVwX+OygmecLgsKJri4i5h0QmKI17PGOkIuVJcD32m
 ndrK+9nL5Bst72y65vSLogjcF/XAek8B0pSYPwVCL0tiXPUjjx2AcZp5RwJCP+8fwYEY
 49lLcNVD0nLBlREaf6aNSisIR3b53RsfWlg+45sgRCKkpZb2QkOmfx/93VssGcWTo2A1
 ZUP30RXJc8GXhpQd/0mwXUhhDR3Akeu9xDzeh0M15HfwWvyom8jGwrptdMHLO4OfDArt
 58Gg==
X-Gm-Message-State: APjAAAXGQASpV11OPjq7rYGskjNBCOsxBNaEKI72NoUiLGW7kUwLfHnU
 GKBcs7bcJlIE55iH4obJn7dvgp1TUStfQndeszk=
X-Google-Smtp-Source: APXvYqwsSfXY7wcvzEoHIvbYg5BQ9Tmh498+hfKeScLI5gGCZXpYYeaGz5s5mh6X2IyoivhGgFT1GzKRl37p7J76t9I=
X-Received: by 2002:a37:88b:: with SMTP id 133mr36176343qki.25.1556522749648; 
 Mon, 29 Apr 2019 00:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <1556216903-24529-1-git-send-email-hongweiz@ami.com>
In-Reply-To: <1556216903-24529-1-git-send-email-hongweiz@ami.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 29 Apr 2019 07:25:37 +0000
Message-ID: <CACPK8Xd7kyrcjAn=47=+OB2wxqxt7AHDJjqYGyA6hc+P6T2Xzg@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.0] ARM: dts: aspeed: Initial git pull request
 for Microsoft Olympus BMC
To: Hongwei Zhang <hongweiz@ami.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Hongwei,

Thanks for the patch. It looks good. I've made some minor suggestions
below that we should try to fix before merging.

The subject needs work. Take a look at the other patches:

git log --oneline arch/arm/boot/dts/

Something like:

ARM: dts: aspeed: Add Microsoft Olympus OCP BMC

On Thu, 25 Apr 2019 at 18:29, Hongwei Zhang <hongweiz@ami.com> wrote:
>
> Olympus is a Microsoft OCP platform equipped with Aspeed 2400 BMC
> SoC.

Nice.

> Tested: meta-olympus has been tested on an ASPEED AST2400 EVB board
>         and MT Olympus server.
>         The U-boot and kernel start and run as expected.

This is nice to know, however we don't generally put this in the
commit message for the kernel. It's up to you.

>
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> ---
>  arch/arm/boot/dts/Makefile                   |   3 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-olympus.dts | 219 +++++++++++++++++++++=
++++++
>  2 files changed, 221 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-olympus.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index bd40148..34c0b7a0 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1247,4 +1247,5 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
>         aspeed-bmc-opp-witherspoon.dtb \
>         aspeed-bmc-opp-zaius.dtb \
>         aspeed-bmc-portwell-neptune.dtb \
> -       aspeed-bmc-quanta-q71l.dtb
> +       aspeed-bmc-quanta-q71l.dtb \
> +       aspeed-bmc-opp-olympus.dts

'opp' means openpower. I think Olympus is an x86 system, so it should
not have the opp prefix. The vendor (microsoft?) would be appropriate.

This list is sorted alphabetically.

> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-olympus.dts b/arch/arm/boot=
/dts/aspeed-bmc-opp-olympus.dts
> new file mode 100644
> index 0000000..8b4b00d0
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-olympus.dts
> @@ -0,0 +1,219 @@
> +//SPDX-License-Identifier: GPL-2.0+

Missing  space. It should look something like this:

// SPDX-License-Identifier: GPL-2.0+
// Copyright (C) Company Name 2019

> +/dts-v1/;
> +
> +#include "aspeed-g4.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +       model =3D "Olympus BMC";
> +       compatible =3D "microsoft,olympus-bmc", "aspeed,ast2400";
> +
> +       chosen {
> +               stdout-path =3D &uart5;
> +               bootargs =3D "console=3DttyS4,115200 earlyprintk";
> +       };
> +
> +       memory@40000000 {
> +               reg =3D <0x40000000 0x20000000>;
> +       };
> +
> +       reserved-memory {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +               ranges;
> +
> +               vga_memory: framebuffer@5f000000 {
> +                       no-map;
> +                       reg =3D <0x5f000000 0x01000000>; /* 16M */
> +               };
> +
> +               flash_memory: region@98000000 {

See my comments below about this node.

> +                       no-map;
> +                       reg =3D <0x98000000 0x01000000>; /* 16MB */
> +               };
> +       };
> +

> +&i2c4 {
> +       status =3D "okay";
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +       clock-frequency =3D <100000>;
> +
> +       slave-mqueue@20 {
> +               compatible =3D "slave-ipmb";

Is this for a driver you have not yet submitted?

If you add device tree bindings for drivers that are not in the tree
then you run the risk of changes being made in review that cause the
two to be out of sync. I suggest submitting your driver for inclusion.

> +               reg =3D <0x40000020>;
> +       };
> +};

> +
> +&lpc_ctrl {
> +       status =3D "okay";
> +       memory-region =3D <&flash_memory>;

Are you sure you use this feature of the driver?

If you are adding this only to enable the lpc clocks, the driver has
recently been modified so the memory-region is not required.

> +       flash =3D <&spi>;
> +};

> --
> 2.7.4
>
>
> Please consider the environment before printing this email.
>
> The information contained in this message may be confidential and proprie=
tary to American Megatrends, Inc.  This communication is intended to be rea=
d only by the individual or entity to whom it is addressed or by their desi=
gnee. If the reader of this message is not the intended recipient, you are =
on notice that any distribution of this message, in any form, is strictly p=
rohibited.  Please promptly notify the sender by reply e-mail or by telepho=
ne at 770-246-8600, and then delete or destroy all copies of the transmissi=
on.

This message doe snot make sense in an email posted to the public list.
