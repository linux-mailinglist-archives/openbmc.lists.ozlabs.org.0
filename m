Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 229E193114D
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2024 11:36:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OkgMh2aG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WMxsL0J2sz3cBG
	for <lists+openbmc@lfdr.de>; Mon, 15 Jul 2024 19:36:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OkgMh2aG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WMxrq1PlYz30Np
	for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2024 19:35:37 +1000 (AEST)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e03a6196223so3996179276.3
        for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2024 02:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721036134; x=1721640934; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SFy4cHiL1HV6rnQV58PnRvfiLRbqBuy43fB+VflMTDo=;
        b=OkgMh2aGhGnKhrR1MkMYjkquYPZEOYwAKfssFxKt19Qts+zY+p9EwiKWsmkcoUA79N
         ahmGMPPgRhPoL7zNb/4a74CnWO6u+2fHfa08KzE/VLtCxybJ+pGbkeaCQVQIRd2QElPF
         fQeLsSuS+v7LibwBkJ170KdnB8MDylf5k0FNPw/dnF/6sHv2mQyDboo/2SzjKWgZaTql
         R/pYsFx6U4C4Bwx8uwOJKerZvd+yTxMzI+uI7Vn1JVodzzd2XW/v7lZNBAvGZw6++QYZ
         NENK/La1GuLPAhv7VIzcXY7+dJOOpUp4b3hOHDoi1sFINysYxhCRjFWt1RCHjfYK5Eju
         4eRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721036134; x=1721640934;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SFy4cHiL1HV6rnQV58PnRvfiLRbqBuy43fB+VflMTDo=;
        b=CjkJmcK9KpX1luQW8Rh7hRj5L4aoruhkSex2AGTvMQWE3vcxyu4CAe4nQJjHeZzArf
         NB4ceASwWjIaUSpqjN3x3q8jfjW21XDpqK+cHWZcLKuJmcGzpQ8UoV8jlGwJuKOLRzmf
         YOMsvVqJsZzoLiS2FamEhFFwbjOP903r/ZcEZgG2/1K0cm0ES/PBYEiJJGac+W2AjZp1
         0AabhLdRas89uqAjkFjSG28k1BLw4DsKLAnuBlADYpFWiX1oI8HuPn73quzjzFx63DFG
         qh7yqR5c3HneQ9Ch4B8PDfusZ+w3oM/TTs0ix+Oln3UWfw3t2ZtiMl1trRmAeOf+R6yT
         s5XA==
X-Gm-Message-State: AOJu0YyhKTngRXhn2hPMDOrIFgvDykj8V8NoPh/HuyEmJ6qi2z6mdAdo
	NXrUUccntDLKhXsoK6STb+POIFapDhfDUaXl1foF5aIgoK74ArFh63g/OCgv8qBY96wYJNS38ZP
	c8HyIIaxRW2Au3BqqsgsCAMdmI2TURA==
X-Google-Smtp-Source: AGHT+IGa9AjViPeuZXY5p3yCXpsoqmVysojPHA797ryL+pkRul/DRZclWH7/W+UUHq4vDY41uGx7QvkYm+PVvanGZzU=
X-Received: by 2002:a81:9251:0:b0:64a:3e36:7fd1 with SMTP id
 00721157ae682-658ee78fc62mr198378007b3.10.1721036134313; Mon, 15 Jul 2024
 02:35:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240714152617.3055768-1-tmaimon77@gmail.com> <20240714152617.3055768-3-tmaimon77@gmail.com>
 <6f4f65d942b156daee15ee493c2bacb87f1ff466.camel@codeconstruct.com.au>
In-Reply-To: <6f4f65d942b156daee15ee493c2bacb87f1ff466.camel@codeconstruct.com.au>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 15 Jul 2024 12:35:23 +0300
Message-ID: <CAP6Zq1jvwa1Uw0g5faJBqqoKNLVMHkXGpXR2qpuRcBb=4sC2hA@mail.gmail.com>
Subject: Re: [linux dev-6.6 v1 3/3] arm64: dts: nuvoton: npcm8xx: add modules node
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

Thank for your comments

On Mon, 15 Jul 2024 at 11:27, Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Sun, 2024-07-14 at 18:26 +0300, Tomer Maimon wrote:
> > Add the following modules nodes to Nuvoton NPCM8xx BMC device tree:
>
> So we seem to be missing bindings for the following nodes:
Sure.
>
> > - GMAC.
> > - OHCI
> > - PCIe.
> > - KCS.
> > - eSPI.
> > - JTAG master.
>
> Can you chop these out of the patch, or send the bindings for these
> nodes as part of the series, along with links to the corresponding
> upstream patch series?
>
> Also:
>
> > - BPC.
>
> What's BPC? I failed to map it to a node below, but possibly I didn't
> look closely enough.
BPC - BIOS Post Code, It was in dev-5.15 and removed I was sent the
BPC dev-6.6 a few months ago, and I will send it in a few days.
>
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 918 +++++++++++++++++-
> >  .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     | 162 ++++
> >  2 files changed, 1075 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > index 8aef313a6ff6..d733509cab90 100644
> > --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> > @@ -21,6 +21,23 @@ soc {
> >               gcr: system-controller@f0800000 {
> >                       compatible = "nuvoton,npcm845-gcr", "syscon";
> >                       reg = <0x0 0xf0800000 0x0 0x1000>;
> > +                     udc9_mux: mux-controller {
> > +                             compatible = "mmio-mux";
> > +                             #mux-control-cells = <1>;
> > +                             mux-reg-masks = <0x9C 0x3000>;
> > +                             idle-states = <0x3000>;
> > +                     };
> > +             };
> > +
> > +             rst: system-controller@f0801000 {
> > +                     compatible = "nuvoton,npcm845-rst", "syscon";
> > +                     reg = <0x0 0xf0801000 0x0 0xC4>;
> > +             };
> > +
> > +             fuse:fuse@f0189000 {
> > +                     compatible = "nuvoton,npcm845-fuse", "syscon",
> > +                             "simple-mfd";
> > +                     reg = <0x0 0xf0189000 0x0 0x1000>;
> >               };
> >
> >               gic: interrupt-controller@dfff9000 {
> > @@ -39,6 +56,12 @@ ppi_cluster0: interrupt-partition-0 {
> >                               };
> >                       };
> >               };
> > +
> > +             spswc: spswc@f0800038 {
> > +                     compatible = "nuvoton,npcm-sp-ctrl";
> > +                     reg = <0x0 0xf0800038 0x0 0x4>;
> > +             };
> > +
> >       };
> >
> >       ahb {
> > @@ -62,15 +85,276 @@ clk: clock-controller@f0801000 {
> >                       clocks = <&refclk>;
> >               };
> >
> > +             gmac0: eth@f0802000 {
> > +                     device_type = "network";
> > +                     compatible = "nuvoton,npcm-dwmac";
> > +                     reg = <0x0 0xf0802000 0x0 0x2000>,
> > +                             <0x0 0xf0780000 0x0 0x200>;
> > +                     interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> > +                     interrupt-names = "macirq";
> > +                     clocks  = <&clk NPCM8XX_CLK_AHB>;
> > +                     clock-names = "stmmaceth";
> > +                     pinctrl-names = "default";
> > +                     pinctrl-0 = <&sg1mdio_pins>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             gmac1: eth@f0804000 {
> > +                     device_type = "network";
> > +                     compatible = "snps,dwmac";
> > +                     reg = <0x0 0xf0804000 0x0 0x2000>;
> > +                     interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> > +                     interrupt-names = "macirq";
> > +                     clocks  = <&clk NPCM8XX_CLK_AHB>;
> > +                     clock-names = "stmmaceth";
> > +                     pinctrl-names = "default";
> > +                     pinctrl-0 = <&rg2_pins
> > +                                     &rg2mdio_pins>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             gmac2: eth@f0806000 {
> > +                     device_type = "network";
> > +                     compatible = "snps,dwmac";
> > +                     reg = <0x0 0xf0806000 0x0 0x2000>;
> > +                     interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
> > +                     interrupt-names = "macirq";
> > +                     clocks  = <&clk NPCM8XX_CLK_AHB>;
> > +                     clock-names = "stmmaceth";
> > +                     pinctrl-names = "default";
> > +                     pinctrl-0 = <&r1_pins
> > +                                     &r1err_pins
> > +                                     &r1md_pins>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             gmac3: eth@f0808000 {
> > +                     device_type = "network";
> > +                     compatible = "snps,dwmac";
> > +                     reg = <0x0 0xf0808000 0x0 0x2000>;
> > +                     interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> > +                     interrupt-names = "macirq";
> > +                     clocks  = <&clk NPCM8XX_CLK_AHB>;
> > +                     clock-names = "stmmaceth";
> > +                     pinctrl-names = "default";
> > +                     pinctrl-0 = <&r2_pins
> > +                                     &r2err_pins
> > +                                     &r2md_pins>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             ehci1: usb@f0828100 {
> > +                     compatible = "nuvoton,npcm750-ehci";
> > +                     reg = <0x0 0xf0828100 0x0 0x1000>;
> > +                     interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             ehci2: usb@f082a100 {
> > +                     compatible = "nuvoton,npcm750-ehci";
> > +                     reg = <0x0 0xf082a100 0x0 0x1000>;
> > +                     interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             ohci1: usb@f0829000 {
> > +                     compatible = "nuvoton,npcm750-ohci", "generic-ohci";
> > +                     reg = <0x0 0xf0829000 0x0 0x1000>;
> > +                     interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             ohci2: usb@f082b000 {
> > +                     compatible = "nuvoton,npcm750-ohci", "generic-ohci";
> > +                     reg = <0x0 0xf082b000 0x0 0x1000>;
> > +                     interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             sdhci: mmc@f0842000 {
> > +                     compatible = "nuvoton,npcm845-sdhci";
> > +                     reg = <0x0 0xf0842000 0x0 0x100>;
> > +                     interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks =  <&clk NPCM8XX_CLK_AHB>;
> > +                     clock-names = "clk_mmc";
> > +                     pinctrl-names = "default";
> > +                     pinctrl-0 = <&mmc8_pins
> > +                                  &mmc_pins>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             pcie: pcie@e1000000 {
> > +                     compatible = "nuvoton,npcm845-pcie";
> > +                     device_type = "pci";
> > +                     reg = <0x0 0xE1000000 0x0 0x1000>,
> > +                             <0x0 0xE8000000 0x0 0x1000>;
> > +                     bus-range = <0x0 0xF>;
> > +                     #address-cells = <3>;
> > +                     #size-cells = <2>;
> > +                     #interrupt-cells = <1>;
> > +                     ranges = <0x01000000 0 0xe9000000 0x0 0xe9000000 0 0x01000000
> > +                             0x02000000 0 0xea000000 0x0 0xea000000 0 0x04000000>;
> > +                     resets = <&rstc 0x34 15>;
> > +                     interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
> > +                     interrupt-map-mask = <0 0 0 7>;
> > +                     interrupt-map = <0 0 0 1 &gic GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
> > +                     nuvoton,sysgcr = <&gcr>;
> > +             };
> > +
> > +             fiu0: spi@fb000000 {
> > +                     compatible = "nuvoton,npcm845-fiu";
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +                     reg = <0x0 0xfb000000 0x0 0x1000>,
> > +                     <0x0 0x80000000 0x0 0x10000000>;
> > +                     reg-names = "control", "memory";
> > +                     clocks = <&clk NPCM8XX_CLK_SPI0>;
> > +                     clock-names = "clk_ahb";
> > +                     status = "disabled";
> > +             };
> > +
> > +             fiu1: spi@fb002000 {
> > +                     compatible = "nuvoton,npcm845-fiu";
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +                     reg = <0x0 0xfb002000 0x0 0x1000>,
> > +                     <0x0 0x90000000 0x0 0x4000000>;
> > +                     reg-names = "control", "memory";
> > +                     clocks = <&clk NPCM8XX_CLK_SPI1>;
> > +                     clock-names = "clk_spi1";
> > +                     pinctrl-names = "default";
> > +                     pinctrl-0 = <&spi1_pins>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             fiu3: spi@c0000000 {
> > +                     compatible = "nuvoton,npcm845-fiu";
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +                     reg = <0x0 0xc0000000 0x0 0x1000>,
> > +                     <0x0 0xA0000000 0x0 0x20000000>;
> > +                     reg-names = "control", "memory";
> > +                     clocks = <&clk NPCM8XX_CLK_SPI3>;
> > +                     clock-names = "clk_spi3";
> > +                     pinctrl-names = "default";
> > +                     pinctrl-0 = <&spi3_pins>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             fiux: spi@fb001000 {
> > +                     compatible = "nuvoton,npcm845-fiu";
> > +                     #address-cells = <1>;
> > +                     #size-cells = <0>;
> > +                     reg = <0x0 0xfb001000 0x0 0x1000>,
> > +                     <0x0 0xf8000000 0x0 0x2000000>;
> > +                     reg-names = "control", "memory";
> > +                     clocks = <&clk NPCM8XX_CLK_SPIX>;
> > +                     clock-names = "clk_ahb";
> > +                     status = "disabled";
> > +             };
> > +
> > +             pcimbox: pcimbox@f0848000 {
> > +                     compatible = "nuvoton,npcm845-pci-mbox", "nuvoton,npcm750-pci-mbox",
> > +                                     "simple-mfd", "syscon";
> > +                     reg = <0x0 0xf084C000 0x0 0x8
> > +                             0x0 0xf0848000 0x0 0x3F00>;
> > +                     interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
> > +             };
> > +
> > +             vcd: vcd@f0810000 {
> > +                     compatible = "nuvoton,npcm845-vcd";
> > +                     reg = <0x0 0xf0810000 0x0 0x10000>;
> > +                     interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
> > +                     resets = <&rstc 0x24 14>;
> > +                     nuvoton,sysgcr = <&gcr>;
> > +                     nuvoton,sysgfxi = <&gfxi>;
> > +                     nuvoton,ece = <&ece>;
> > +                     status = "disabled";
> > +             };
> > +
> > +             ece: video-codec@f0820000 {
> > +                     compatible = "nuvoton,npcm845-ece";
> > +                     reg = <0x0 0xf0820000 0x0 0x2000>;
> > +                     interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> > +                     resets = <&rstc 0x24 13>;
> > +                     status = "disabled";
> > +             };
> > +
> >               apb {
> >                       #address-cells = <1>;
> >                       #size-cells = <1>;
> >                       compatible = "simple-bus";
> >                       interrupt-parent = <&gic>;
> >                       ranges = <0x0 0x0 0xf0000000 0x00300000>,
> > -                             <0xfff00000 0x0 0xfff00000 0x00016000>;
> > +                             <0xfff00000 0x0 0xfff00000 0x00016000>,
> > +                             <0xf0800000 0x0 0xf0800000 0x00060000>;
> > +
> > +                     lpc_kcs: lpc_kcs@7000 {
> > +                             compatible = "nuvoton,npcm845-lpc-kcs",
> > +                                             "simple-mfd", "syscon";
> > +                             reg = <0x7000 0x40>;
> > +                             reg-io-width = <1>;
> > +
> > +                             #address-cells = <1>;
> > +                             #size-cells = <1>;
> > +                             ranges = <0x0 0x7000 0x40>;
> > +
> > +                             kcs1: kcs1@0 {
> > +                                     compatible = "nuvoton,npcm845-kcs-bmc", "nuvoton,npcm750-kcs-bmc";
> > +                                     reg = <0x0 0x40>;
> > +                                     interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> > +                                     kcs_chan = <1>;
> > +                                     status = "disabled";
> > +                             };
> >
> > -                     peci: peci-controller@100000 {
>
> No compatible? Did you test this with `make dtbs_check`?
Will check it again
>
> > +                             kcs2: kcs2@0 {
> > +                                     compatible = "nuvoton,npcm845-kcs-bmc", "nuvoton,npcm750-kcs-bmc";
> > +                                     reg = <0x0 0x40>;
> > +                                     interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> > +                                     kcs_chan = <2>;
> > +                                     status = "disabled";
> > +                             };
> > +
> > +                             kcs3: kcs3@0 {
> > +                                     compatible = "nuvoton,npcm845-kcs-bmc", "nuvoton,npcm750-kcs-bmc";
> > +                                     reg = <0x0 0x40>;
> > +                                     interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> > +                                     kcs_chan = <3>;
> > +                                     status = "disabled";
> > +                             };
> > +                     };
> > +
> > +                     lpc_host: lpc_host@7000 {
> > +                             compatible = "nuvoton,npcm845-lpc-host",
> > +                                             "simple-mfd", "syscon";
> > +                             reg = <0x7000 0x60>;
> > +
> > +                             #address-cells = <1>;
> > +                             #size-cells = <1>;
> > +                             ranges = <0x0 0x7000 0x60>;
> > +
> > +                             lpc_bpc: lpc_bpc@40 {
> > +                                     compatible = "nuvoton,npcm845-lpc-bpc", "nuvoton,npcm750-lpc-bpc";
> > +                                     reg = <0x40 0x20>;
> > +                                     interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> > +                                     status = "disabled";
> > +                             };
> > +                     };
> > +
> > +                     espi: espi@9f000 {
> > +                             compatible = "nuvoton,npcm845-espi",
> > +                                             "simple-mfd", "syscon";
> > +                             reg = <0x9f000 0x1000>;
> > +                             vw_gpio: vw_gpio {
> > +                                     compatible = "nuvoton,npcm845-espi-vwgpio";
> > +                                     interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> > +                                     gpio-controller;
> > +                                     #gpio-cells = <2>;
> > +                                     status = "disabled";
> > +                             };
> > +                     };
> > +
> > +                     peci0: peci-controller@100000 {
>
> Didn't we define this one above? Should they be merged?
Yes, my mistake will remove it.
>
> >                               compatible = "nuvoton,npcm845-peci";
> >                               reg = <0x100000 0x1000>;
> >                               interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> > @@ -79,6 +363,48 @@ peci: peci-controller@100000 {
> >                               status = "disabled";
> >                       };
> >
> > +                     pspi: spi@201000 {
> > +                             compatible = "nuvoton,npcm845-pspi";
> > +                             reg = <0x201000 0x1000>;
> > +                             pinctrl-names = "default";
> > +                             pinctrl-0 = <&pspi_pins>;
> > +                             #address-cells = <1>;
> > +                             #size-cells = <0>;
> > +                             interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
> > +                             clocks = <&clk NPCM8XX_CLK_APB5>;
> > +                             clock-names = "clk_apb5";
> > +                             resets = <&rstc 0x24 23>;
> > +                             status = "disabled";
> > +                     };
> > +
> > +                     jtm1: jtm@208000 {
> > +                             compatible = "nuvoton,npcm845-jtm";
> > +                             reg = <0x208000 0x1000>;
> > +                             pinctrl-names = "default";
> > +                             pinctrl-0 = <&jm1_pins>;
> > +                             #address-cells = <1>;
> > +                             #size-cells = <0>;
> > +                             interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
> > +                             clocks = <&clk NPCM8XX_CLK_APB5>;
> > +                             clock-names = "clk_apb5";
> > +                             resets = <&rstc 0x74 29>;
> > +                             status = "disabled";
> > +                     };
> > +
> > +                     jtm2: jtm@209000 {
> > +                             compatible = "nuvoton,npcm845-jtm";
> > +                             reg = <0x209000 0x1000>;
> > +                             pinctrl-names = "default";
> > +                             pinctrl-0 = <&jm2_pins>;
> > +                             #address-cells = <1>;
> > +                             #size-cells = <0>;
> > +                             interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
> > +                             clocks = <&clk NPCM8XX_CLK_APB5>;
> > +                             clock-names = "clk_apb5";
> > +                             resets = <&rstc 0x74 30>;
> > +                             status = "disabled";
> > +                     };
> > +
> >                       timer0: timer@8000 {
> >                               compatible = "nuvoton,npcm845-timer";
> >                               interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> > @@ -126,27 +452,50 @@ serial3: serial@3000 {
> >                       serial4: serial@4000 {
> >                               compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
> >                               reg = <0x4000 0x1000>;
> > -                             clocks = <&clk NPCM8XX_CLK_UART>;
> > +                             clocks = <&clk NPCM8XX_CLK_UART2>;
> >                               interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
> >                               reg-shift = <2>;
> > +                             pinctrl-names = "default";
> > +                             pinctrl-0 = <&bu4_pins>;
> >                               status = "disabled";
> >                       };
> >
> >                       serial5: serial@5000 {
> >                               compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
> >                               reg = <0x5000 0x1000>;
> > -                             clocks = <&clk NPCM8XX_CLK_UART>;
> > +                             clocks = <&clk NPCM8XX_CLK_UART2>;
> >                               interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
> >                               reg-shift = <2>;
> > +                             pinctrl-names = "default";
> > +                             pinctrl-0 = <&bu5_pins>;
> >                               status = "disabled";
> >                       };
> >
> >                       serial6: serial@6000 {
> >                               compatible = "nuvoton,npcm845-uart", "nuvoton,npcm750-uart";
> >                               reg = <0x6000 0x1000>;
> > -                             clocks = <&clk NPCM8XX_CLK_UART>;
> > +                             clocks = <&clk NPCM8XX_CLK_UART2>;
>
> The UART clock changes seem somewhat unrelated and probably deserve
> their own patch?
O.K.
>
> >                               interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>;
> >                               reg-shift = <2>;
> > +                             pinctrl-names = "default";
> > +                             pinctrl-0 = <&bu6_pins>;
> > +                             status = "disabled";
>
> This too.
O.K.
>
> Andrew
>

Thanks,

Tomer
