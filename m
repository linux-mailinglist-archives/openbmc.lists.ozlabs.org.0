Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AEB4BEF43
	for <lists+openbmc@lfdr.de>; Tue, 22 Feb 2022 03:15:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2jS82fBlz3bVG
	for <lists+openbmc@lfdr.de>; Tue, 22 Feb 2022 13:15:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=FaqB6ci3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2e;
 helo=mail-qv1-xf2e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=FaqB6ci3; dkim-atps=neutral
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2jRj0FSrz2xt0
 for <openbmc@lists.ozlabs.org>; Tue, 22 Feb 2022 13:14:54 +1100 (AEDT)
Received: by mail-qv1-xf2e.google.com with SMTP id p7so37108236qvk.11
 for <openbmc@lists.ozlabs.org>; Mon, 21 Feb 2022 18:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=flhz/EufJpGqyTkxu2HTCsmD/cDYviniWhblXx00oKk=;
 b=FaqB6ci3eH3irJiUlSNmuy/5khddRHwOYs1HbaERrtxQagSlR3bpD3/H76EGywFZmU
 d7H+e9vNMgUN/6HBh28lC/GJuLqPZXB0PddRB4hvQufj0vK0voG94AYlC5bvhUkukWG/
 8SSEiApWuY9SOdbUM5w+7TTCU9FXGEYVhhIxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=flhz/EufJpGqyTkxu2HTCsmD/cDYviniWhblXx00oKk=;
 b=yyA4JswGrfn+wpv8YjdZHn89aFEJb/8NxmhfAQBqpmi1eq2W6oskdF5xCfzIB2Q7n+
 sYuhkwJMQv1o1p6QShqbU9QZBN4iBPXncd0Csns3ED0Lqtz0DJhrJQWhybZL4ZZZMVKn
 doZlJK5BZBnx96KAl6GG7ADAt2VynZ3jg5YoWFmBjhmTbOt3z36nQxBBzqP5vk43OkAD
 5QaBNVvvZDorLr+f56MGSct1vZV2qcuZEqbIc6WPeKs8PfG8E/3RXvofyu/gJIBBoEMG
 AWOTLtrVuCVj1EdFxcKw6J3IsEO8I34EfaYdNZ1Szz07DnBoJxCNBgc6qsmz07C5LClZ
 sqnA==
X-Gm-Message-State: AOAM532Y5KmxBd9L/TTUf1QCcHhC+pBQZjGSHVLLk8ksUiADl+2tdzeX
 Z876H9R3SDGdqyrTHlspTyBi6hjSFUCXJ3xE6lY=
X-Google-Smtp-Source: ABdhPJwrTUkyzSwkVvtp6U5dSC6oOPUBQYA07XSOcbE5HgjOd3bIeZWuNyCLQW3bEae5FGzuG3okaMkD0UwGJy8pq8M=
X-Received: by 2002:ac8:5b82:0:b0:2cf:232d:b1f8 with SMTP id
 a2-20020ac85b82000000b002cf232db1f8mr20439037qta.58.1645496092459; Mon, 21
 Feb 2022 18:14:52 -0800 (PST)
MIME-Version: 1.0
References: <20220211005419.14454-1-potin.lai@quantatw.com>
 <774e60b8-85c7-986b-317c-6231c166f2a5@quantatw.com>
In-Reply-To: <774e60b8-85c7-986b-317c-6231c166f2a5@quantatw.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 22 Feb 2022 02:14:40 +0000
Message-ID: <CACPK8XeKNxXsVDJOb5q4476r1o9JqhwehbHXx43UF8bGbLorEg@mail.gmail.com>
Subject: Re: [u-boot,v2019.04-aspeed-openbmc v3 1/1] arm: dts: Aspeed: add
 Bletchley dts
To: =?UTF-8?B?UG90aW4gTGFpICjos7Tmn4/lu7cp?= <Potin.Lai@quantatw.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 21 Feb 2022 at 11:02, Potin Lai (=E8=B3=B4=E6=9F=8F=E5=BB=B7) <Poti=
n.Lai@quantatw.com> wrote:
>
> On 2/11/22 08:54, Potin Lai (=E8=B3=B4=E6=9F=8F=E5=BB=B7) wrote:
> > Initial introduction of Bletchley equipped with
> > Aspeed 2600 BMC SoC.
> >
> > Signed-off-by: Potin Lai <potin.lai@quantatw.com>
> >
> > ---
> >
> > change v2 -> v3:
> > * update model & compatible to match with kernel dts
> >
> > change v1 -> v2:
> > * sort Makefile alphabetically
> > * add licence and copyright
> > * update model name
> > * remove the nodes not using (fsi, emmc, sdhci, ehci, pcie & display_po=
rt)
>
> Hi Joel, could you help review this patch and let me know if any modifica=
tion needed? Many thanks

It looks good. I've applied it to the openbmc u-boot tree.

In the future, please try to get some reviews from your colleagues.

Cheers,

Joel


>
> Potin
>
> > ---
> >  arch/arm/dts/Makefile              |   9 +-
> >  arch/arm/dts/ast2600-bletchley.dts | 223 +++++++++++++++++++++++++++++
> >  2 files changed, 228 insertions(+), 4 deletions(-)
> >  create mode 100644 arch/arm/dts/ast2600-bletchley.dts
> >
> > diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> > index df844065cd..ac93a89c07 100755
> > --- a/arch/arm/dts/Makefile
> > +++ b/arch/arm/dts/Makefile
> > @@ -677,15 +677,16 @@ dtb-$(CONFIG_ARCH_BCM6858) +=3D \
> >  dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> >       ast2400-evb.dtb \
> >       ast2500-evb.dtb \
> > -     ast2600-evb.dtb \
> > -     ast2600-ncsi.dtb \
> >       ast2600a0-evb.dtb \
> >       ast2600a1-evb.dtb \
> > +     ast2600-bletchley.dtb \
> > +     ast2600-evb.dtb \
> >       ast2600-fpga.dtb \
> > +     ast2600-intel.dtb \
> > +     ast2600-ncsi.dtb \
> >       ast2600-rainier.dtb \
> >       ast2600-slt.dtb \
> > -     ast2600-tacoma.dtb \
> > -     ast2600-intel.dtb
> > +     ast2600-tacoma.dtb
> >
> >  dtb-$(CONFIG_ARCH_STI) +=3D stih410-b2260.dtb
> >
> > diff --git a/arch/arm/dts/ast2600-bletchley.dts b/arch/arm/dts/ast2600-=
bletchley.dts
> > new file mode 100644
> > index 0000000000..57ca845b94
> > --- /dev/null
> > +++ b/arch/arm/dts/ast2600-bletchley.dts
> > @@ -0,0 +1,223 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +// Copyright (c) 2022 Meta Platforms Inc.
> > +/dts-v1/;
> > +
> > +#include "ast2600-u-boot.dtsi"
> > +
> > +/ {
> > +     model =3D "Facebook Bletchley BMC";
> > +     compatible =3D "facebook,bletchley-bmc", "aspeed,ast2600";
> > +
> > +     memory {
> > +             device_type =3D "memory";
> > +             reg =3D <0x80000000 0x40000000>;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path =3D &uart5;
> > +     };
> > +
> > +     aliases {
> > +             mmc0 =3D &emmc_slot0;
> > +             mmc1 =3D &sdhci_slot0;
> > +             mmc2 =3D &sdhci_slot1;
> > +             spi0 =3D &fmc;
> > +             spi1 =3D &spi1;
> > +             spi2 =3D &spi2;
> > +             ethernet0 =3D &mac0;
> > +             ethernet1 =3D &mac1;
> > +             ethernet2 =3D &mac2;
> > +             ethernet3 =3D &mac3;
> > +     };
> > +
> > +     cpus {
> > +             cpu@0 {
> > +                     clock-frequency =3D <800000000>;
> > +             };
> > +             cpu@1 {
> > +                     clock-frequency =3D <800000000>;
> > +             };
> > +     };
> > +};
> > +
> > +&uart5 {
> > +     u-boot,dm-pre-reloc;
> > +     status =3D "okay";
> > +};
> > +
> > +&sdrammc {
> > +     clock-frequency =3D <400000000>;
> > +};
> > +
> > +&wdt1 {
> > +     status =3D "okay";
> > +};
> > +
> > +&wdt2 {
> > +     status =3D "okay";
> > +};
> > +
> > +&wdt3 {
> > +     status =3D "okay";
> > +};
> > +
> > +&mdio {
> > +     status =3D "okay";
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_mdio4_default>;
> > +     #address-cells =3D <1>;
> > +     #size-cells =3D <0>;
> > +};
> > +
> > +&mac2 {
> > +     status =3D "okay";
> > +     phy-mode =3D "rgmii";
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_rgmii3_default &pinctrl_mac3link_default>=
;
> > +     fixed-link {
> > +             speed =3D <1000>;
> > +             full-duplex;
> > +     };
> > +};
> > +
> > +&fmc {
> > +     status =3D "okay";
> > +
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_fmcquad_default>;
> > +
> > +     flash@0 {
> > +             compatible =3D "spi-flash", "sst,w25q256";
> > +             status =3D "okay";
> > +             spi-max-frequency =3D <50000000>;
> > +             spi-tx-bus-width =3D <2>;
> > +             spi-rx-bus-width =3D <2>;
> > +     };
> > +
> > +     flash@1 {
> > +             compatible =3D "spi-flash", "sst,w25q256";
> > +             status =3D "okay";
> > +             spi-max-frequency =3D <50000000>;
> > +             spi-tx-bus-width =3D <2>;
> > +             spi-rx-bus-width =3D <2>;
> > +     };
> > +
> > +     flash@2 {
> > +             compatible =3D "spi-flash", "sst,w25q256";
> > +             status =3D "okay";
> > +             spi-max-frequency =3D <50000000>;
> > +             spi-tx-bus-width =3D <2>;
> > +             spi-rx-bus-width =3D <2>;
> > +     };
> > +};
> > +
> > +&spi1 {
> > +     status =3D "okay";
> > +
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_spi1_default &pinctrl_spi1abr_default
> > +                     &pinctrl_spi1cs1_default &pinctrl_spi1wp_default
> > +                     &pinctrl_spi1wp_default &pinctrl_spi1quad_default=
>;
> > +
> > +     flash@0 {
> > +             compatible =3D "spi-flash", "sst,w25q256";
> > +             status =3D "okay";
> > +             spi-max-frequency =3D <50000000>;
> > +             spi-tx-bus-width =3D <4>;
> > +             spi-rx-bus-width =3D <4>;
> > +     };
> > +
> > +     flash@1 {
> > +             compatible =3D "spi-flash", "sst,w25q256";
> > +             status =3D "okay";
> > +             spi-max-frequency =3D <50000000>;
> > +             spi-tx-bus-width =3D <4>;
> > +             spi-rx-bus-width =3D <4>;
> > +     };
> > +};
> > +
> > +&spi2 {
> > +     status =3D "okay";
> > +
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_spi2_default &pinctrl_spi2cs1_default
> > +                     &pinctrl_spi2cs2_default &pinctrl_spi2quad_defaul=
t>;
> > +
> > +     flash@0 {
> > +             compatible =3D "spi-flash", "sst,w25q256";
> > +             status =3D "okay";
> > +             spi-max-frequency =3D <50000000>;
> > +             spi-tx-bus-width =3D <4>;
> > +             spi-rx-bus-width =3D <4>;
> > +     };
> > +
> > +     flash@1 {
> > +             compatible =3D "spi-flash", "sst,w25q256";
> > +             status =3D "okay";
> > +             spi-max-frequency =3D <50000000>;
> > +             spi-tx-bus-width =3D <4>;
> > +             spi-rx-bus-width =3D <4>;
> > +     };
> > +
> > +     flash@2 {
> > +             compatible =3D "spi-flash", "sst,w25q256";
> > +             status =3D "okay";
> > +             spi-max-frequency =3D <50000000>;
> > +             spi-tx-bus-width =3D <4>;
> > +             spi-rx-bus-width =3D <4>;
> > +     };
> > +};
> > +
> > +&i2c4 {
> > +     status =3D "okay";
> > +
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_i2c5_default>;
> > +};
> > +
> > +&i2c5 {
> > +     status =3D "okay";
> > +
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_i2c6_default>;
> > +};
> > +
> > +&i2c6 {
> > +     status =3D "okay";
> > +
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_i2c7_default>;
> > +};
> > +
> > +&i2c7 {
> > +     status =3D "okay";
> > +
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_i2c8_default>;
> > +};
> > +
> > +&i2c8 {
> > +     status =3D "okay";
> > +
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_i2c9_default>;
> > +};
> > +
> > +&scu {
> > +     mac0-clk-delay =3D <0x10 0x0a
> > +                       0x10 0x10
> > +                       0x10 0x10>;
> > +     mac1-clk-delay =3D <0x10 0x0a
> > +                       0x10 0x10
> > +                       0x10 0x10>;
> > +     mac2-clk-delay =3D <0x08 0x04
> > +                       0x08 0x04
> > +                       0x08 0x04>;
> > +     mac3-clk-delay =3D <0x08 0x04
> > +                       0x08 0x04
> > +                       0x08 0x04>;
> > +};
> > +
> > +&hace {
> > +     status =3D "okay";
> > +};
>
>
