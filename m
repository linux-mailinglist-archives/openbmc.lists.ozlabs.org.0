Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E1753F32D
	for <lists+openbmc@lfdr.de>; Tue,  7 Jun 2022 03:05:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHBxZ2zZlz3blR
	for <lists+openbmc@lfdr.de>; Tue,  7 Jun 2022 11:05:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=azE/oHDL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=azE/oHDL;
	dkim-atps=neutral
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHBx84xK3z2xDY
	for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2022 11:05:30 +1000 (AEST)
Received: by mail-wr1-x42d.google.com with SMTP id a15so13447121wrh.2
        for <openbmc@lists.ozlabs.org>; Mon, 06 Jun 2022 18:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NWFEfh7o2yNNi9zQzNdIcMpqQfe+TxeH1wCwj2n+IDc=;
        b=azE/oHDLcjikppZ8YLSTPpWd6nlkuyMhw0myXH1rNj/gY5JOHwfPvWeimkxqYhIn+B
         WudXO5z9tbkYekOsNgUpRfEF/fCulMGhWYBAJi5Alc/TngerXvKKKFJLlJYn0vcpetMp
         oSSj2HTBVABWs8zitBmJIGmVOVMIaqEhq8jDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NWFEfh7o2yNNi9zQzNdIcMpqQfe+TxeH1wCwj2n+IDc=;
        b=N4GU22pwEZ+84bPq4NWzX8m0Nzipmz05/wDvbPMF+37quN3bH4tdha3O/wuC0tKxdb
         ihwWshxMJztvafzy98ipn2f+fwwFqP4eneZUt9FtakWqbqry+FeY+6I0moLunjhoMM7U
         aRvpGmubCTWQItreZmCnMIlyqgGc1FVPlEfscq/WZuOskJiohthBBojmb0TvWoy0KlWB
         eVl/RWi28qS469NP2TwT95sbeMRSmE5OoyESLW3hjPsw2kIY26X1V3XginAD33JdAcG4
         UPj+TkxytOcDTejTd1U3/2eOusckva4q/cmgli8Io3wBufwtQhnLGkyWMzdmoQsG46HG
         2Egg==
X-Gm-Message-State: AOAM533gjRSkL3928o+3nER5cnBCbE0/7xUdyN1Hn+kEDs/h0NEYAG9w
	T5+J5JOd75Jsm8E6dlpVs5gz8KzcY0PBxO7TKKc=
X-Google-Smtp-Source: ABdhPJz/t0lDUiI803+aM1OE9bb/bQm0lLsHqG4takWLcYhHwEv5gVqqg7cKqwehB6eXyYjBs173NGpCjtL9IV6faAw=
X-Received: by 2002:a5d:47c9:0:b0:20f:e7da:6a48 with SMTP id
 o9-20020a5d47c9000000b0020fe7da6a48mr24930867wrc.315.1654563921796; Mon, 06
 Jun 2022 18:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220519185318.62655-1-quic_jaehyoo@quicinc.com> <a9798967-ab87-2469-a8cf-ab8ac237908a@quicinc.com>
In-Reply-To: <a9798967-ab87-2469-a8cf-ab8ac237908a@quicinc.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Jun 2022 01:05:09 +0000
Message-ID: <CACPK8Xf7Bqjk1A+qeJcrTCGL-PdFj5a2yBna+QvrSi5RpfLXsg@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2] ARM: dts: aspeed: add
 Qualcomm DC-SCM V1
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Graeme Gregory <quic_ggregory@quicinc.com>, Jamie Iles <quic_jiles@quicinc.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 6 Jun 2022 at 13:56, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>
> Ping
>
> On 5/19/2022 11:53 AM, Jae Hyun Yoo wrote:
> > From: Graeme Gregory <quic_ggregory@quicinc.com>
> >
> > Add initial version of device tree for Qualcomm DC-SCM V1 BMC which is
> > equipped with Aspeed AST2600 BMC SoC.
> >
> > Signed-off-by: Graeme Gregory <quic_ggregory@quicinc.com>
> > Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> > ---
> > Changes in v2:
> > * Changed vendor name from Nuvia to Qualcomm.
> >
> >   arch/arm/dts/Makefile                   |   1 +
> >   arch/arm/dts/ast2600-qcom-dc-scm-v1.dts | 208 +++++++++++++++++++++++=
+
> >   2 files changed, 209 insertions(+)
> >   create mode 100644 arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
> >
> > diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> > index 3515100c65ce..e86a6c0ed609 100755
> > --- a/arch/arm/dts/Makefile
> > +++ b/arch/arm/dts/Makefile
> > @@ -686,6 +686,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> >       ast2600-intel.dtb \
> >       ast2600-ncsi.dtb \
> >       ast2600-pfr.dtb \
> > +     ast2600-qcom-dc-scm-v1.dts \
> >       ast2600-rainier.dtb \
> >       ast2600-s6q.dtb \
> >       ast2600-slt.dtb \
> > diff --git a/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts b/arch/arm/dts/ast=
2600-qcom-dc-scm-v1.dts
> > new file mode 100644
> > index 000000000000..e966f739b708
> > --- /dev/null
> > +++ b/arch/arm/dts/ast2600-qcom-dc-scm-v1.dts
> > @@ -0,0 +1,208 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +// Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights=
 reserved.
> > +/dts-v1/;
> > +
> > +#include "ast2600-u-boot.dtsi"
> > +
> > +/ {
> > +     model =3D "Qualcomm DC-SCM V1 BMC";
> > +     compatible =3D "qcom,dc-scm-v1-bmc", "aspeed,ast2600";
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
> > +             spi0 =3D &fmc;
> > +             spi1 =3D &spi1;
> > +             spi2 =3D &spi2;
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
> > +
> > +     ethphy3: ethernet-phy@1 {
> > +             reg =3D <1>;
> > +     };
> > +};
> > +
> > +&mac2 {
> > +     status =3D "okay";
> > +     reg =3D <0x1e670000 0x180>, <0x1e650018 0x4>;
> > +     phy-mode =3D "rgmii";
> > +     phy-handle =3D <&ethphy3>;
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_rgmii3_default>;
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

Compatible strings should go from the most general to the most
specific, so these are around the wrong way. I see you've probably
just copied the ast2600-evb which makes the same mistake.

In the dtsi we have jedec,spi-nor which you overwrite here.

u-boot has spi-flash but Linux uses jedec,spi-nor. I wonder if we
should update the aspeed driver to use that?

C=C3=A9dric, do you have thoughts here?

> > +             status =3D "okay";
> > +             spi-max-frequency =3D <133000000>;
> > +             spi-tx-bus-width =3D <4>;
> > +             spi-rx-bus-width =3D <4>;
> > +     };
> > +
> > +     flash@1 {
> > +             compatible =3D "spi-flash", "sst,w25q256";
> > +             status =3D "okay";
> > +             spi-max-frequency =3D <133000000>;
> > +             spi-tx-bus-width =3D <4>;
> > +             spi-rx-bus-width =3D <4>;
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
> > +             spi-max-frequency =3D <133000000>;
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

All of the pinctrl properties are set in the dtsi as of f2b82fa4ba17
("arm: dts: ast2600: Add I2C pinctrl"), so you can drop these.


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
> > +&i2c9 {
> > +     status =3D "okay";
> > +
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_i2c10_default>;
> > +};
> > +
> > +&i2c10 {
> > +     status =3D "okay";
> > +
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_i2c11_default>;
> > +};
> > +
> > +&i2c12 {
> > +     status =3D "okay";
> > +
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_i2c13_default>;
> > +};
> > +
> > +&i2c13 {
> > +     status =3D "okay";
> > +
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_i2c14_default>;
> > +};
> > +
> > +&i2c14 {
> > +     status =3D "okay";
> > +
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_i2c15_default>;
> > +};
> > +
> > +&i2c15 {
> > +     status =3D "okay";
> > +
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_i2c16_default>;
> > +};
> > +
> > +&scu {
> > +     mac0-clk-delay =3D <0x1d 0x1c
> > +                       0x10 0x17
> > +                       0x10 0x17>;
> > +     mac1-clk-delay =3D <0x1d 0x10
> > +                       0x10 0x10
> > +                       0x10 0x10>;
> > +     mac2-clk-delay =3D <0x0a 0x04
> > +                       0x08 0x04
> > +                       0x08 0x04>;
> > +     mac3-clk-delay =3D <0x0a 0x04
> > +                       0x08 0x04
> > +                       0x08 0x04>;
> > +};
