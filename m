Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA8C5B56D
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2019 08:58:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45cdW12ZQxzDqSh
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2019 16:58:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="KfBv6L0p"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45cdVQ6LglzDqSR
 for <openbmc@lists.ozlabs.org>; Mon,  1 Jul 2019 16:57:50 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id h24so10504963qto.0
 for <openbmc@lists.ozlabs.org>; Sun, 30 Jun 2019 23:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r3XkSck9fLR5PtSj4uog3rujw2o9dpmVrKs7YUwvHxQ=;
 b=KfBv6L0pdueE/aF4jiQNLQJKNHWRiskNLIltTQHRIA4gO48a69aOAfEEU6NZaQyYdt
 vPldjtH1XkMsooqBXTFr7sj5D5ky/hzzR6QmrAXaYgfo6I/iH1vBi1ZWkrpALt3wAnlL
 d6L46gE1ch/3Vl3a6j8UwvqgZImgYnUt71fN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r3XkSck9fLR5PtSj4uog3rujw2o9dpmVrKs7YUwvHxQ=;
 b=e6V9sNa53QOpRtKIncx+uKQkQ9xVBF1YpDLnn9R3CJP9uOhexj7qNR18UOrKmyx63s
 bLS7a9Qa/dlY0IUx3lWtY/0NuZ6GMpJCEjrutM2Lhl9GGcU5JKDMrBvK8bjzVu/EF5fO
 UN1u79GXN6hk/24W5MzV9Fwh4jOs5ZC5LA9+8AfqXNYyYRZ7vtsOwmG6VOXYPSG40b+Q
 4VNFmcEJx42O+Nq2nv6YP3wykY28bktbaTfJmLqU0ylA6/J6QhfRC8ddg5J7nSc35uya
 714Y5pX8bP0LSAZgJmNdKqpcq7dxJ81C8JNwqcBA0xcZVfYJNGb1BXLItHSJKXkgyyTi
 ap8Q==
X-Gm-Message-State: APjAAAVCipvjXu0xHwNuxtJtip2tnQEEvnieaidy9yh0yAOF0A1gpdei
 9jCeCzMhpXMM2nlmqnTD6u/CYzgjhgif6OvJvHI=
X-Google-Smtp-Source: APXvYqxFdd40SKDie2Ny6ScY0HuT1JBzU36o7VIcKnY2f9/dsCNqyHpKu/lAK1CiYlqJXgbyGMhRu3UvR4fJxRU/bFc=
X-Received: by 2002:aed:3e36:: with SMTP id l51mr19201665qtf.269.1561964267478; 
 Sun, 30 Jun 2019 23:57:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190701060137.22116-1-chyishian.jiang@gmail.com>
In-Reply-To: <20190701060137.22116-1-chyishian.jiang@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 1 Jul 2019 06:57:35 +0000
Message-ID: <CACPK8XdR-hSNu+dQHus6_m6K+ERcdLEOg42fD94y5RuYPnM7nQ@mail.gmail.com>
Subject: Re: [PATCH dev-5.17 v1 1/6] ARM: dts: nuvoton: Add Nuvoton RunBMC
 DeviceTree
To: Samuel Jiang <chyishian.jiang@gmail.com>
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
Cc: KWLIU@nuvoton.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Samuel Jiang <Samuel.Jiang@quantatw.com>,
 Tomer Maimon <tomer.maimon@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Samuel,

On Mon, 1 Jul 2019 at 06:02, Samuel Jiang <chyishian.jiang@gmail.com> wrote:
>
> From: Samuel Jiang <Samuel.Jiang@quantatw.com>
>
> Initial Nuvoton RunBMC Module which use NPCM750 SoC.
>
> Including features:
> 1. image partitions
> 2. lpc and kcs
> 3. usb
> 4. serial port
> 5. spi
> 6. fiu
> 7. watchdog

Do you intend submit these patches to the mainline kernel for review?
I would like to see them submitted there first.

When you do that, you don't need the "dev-5.17" part in your patch
subjects. You also can include the "tested" information in the cover
letter, but not in the patches themselves.

Please test against 5.2.

Once these patches have had review we can include them in the openbmc tree.

Cheers,

Joel

>
> Testeed:
>   Build Qunata runbmc-nuvoton image and load on RunBMC-nuvoton module
>
> Signed-off-by: Samuel Jiang <Samuel.Jiang@quantatw.com>
> ---
>  arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts | 292 +++++++++++++++++++
>  1 file changed, 292 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
>
> diff --git a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
> new file mode 100644
> index 000000000000..eec815d2a638
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
> @@ -0,0 +1,292 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2019 Nuvoton Technology kwliu@nuvoton.com
> +// Copyright (c) 2019 Quanta Computer Inc. Samuel.Jiang@quantatw.com
> +
> +/dts-v1/;
> +#include "nuvoton-npcm750.dtsi"
> +
> +/ {
> +       model = "Nuvoton npcm750 RunBMC Module";
> +       compatible = "nuvoton,npcm750";
> +
> +       aliases {
> +               ethernet0 = &emc0;
> +               ethernet1 = &gmac0;
> +               serial0 = &serial0;
> +               serial1 = &serial1;
> +               serial2 = &serial2;
> +               serial3 = &serial3;
> +               udc0 = &udc0;
> +               udc1 = &udc1;
> +               udc2 = &udc2;
> +               udc3 = &udc3;
> +               udc4 = &udc4;
> +               udc5 = &udc5;
> +               udc6 = &udc6;
> +               udc7 = &udc7;
> +               udc8 = &udc8;
> +               udc9 = &udc9;
> +               emmc0 = &sdhci0;
> +               spi0 = &spi0;
> +               spi1 = &spi1;
> +               fiu0 = &fiu0;
> +               fiu1 = &fiu3;
> +       };
> +
> +       chosen {
> +               stdout-path = &serial3;
> +       };
> +
> +       memory {
> +               reg = <0 0x40000000>;
> +       };
> +
> +       ahb {
> +               gmac0: eth@f0802000 {
> +                       phy-mode = "rgmii-id";
> +                       snps,eee-force-disable;
> +                       status = "okay";
> +               };
> +
> +               emc0: eth@f0825000 {
> +                       phy-mode = "rmii";
> +                       use-ncsi;
> +                       status = "okay";
> +               };
> +
> +               ehci1: usb@f0806000 {
> +                       status = "okay";
> +               };
> +
> +               ohci1: ohci@f0807000 {
> +                       status = "okay";
> +               };
> +
> +               udc0:udc@f0830000 {
> +                       status = "okay";
> +               };
> +
> +               udc1:udc@f0831000 {
> +                       status = "okay";
> +               };
> +
> +               udc2:udc@f0832000 {
> +                       status = "okay";
> +               };
> +
> +               udc3:udc@f0833000 {
> +                       status = "okay";
> +               };
> +
> +               udc4:udc@f0834000 {
> +                       status = "okay";
> +               };
> +
> +               udc5:udc@f0835000 {
> +                       status = "okay";
> +               };
> +
> +               udc6:udc@f0836000 {
> +                       status = "okay";
> +               };
> +
> +               udc7:udc@f0837000 {
> +                       status = "okay";
> +               };
> +
> +               udc8:udc@f0838000 {
> +                       status = "okay";
> +               };
> +
> +               udc9:udc@f0839000 {
> +                       status = "okay";
> +               };
> +
> +               aes:aes@f0858000 {
> +                       status = "okay";
> +               };
> +
> +               sha:sha@f085a000 {
> +                       status = "okay";
> +               };
> +
> +               fiu0: fiu@fb000000 {
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&spi0cs1_pins>;
> +                       status = "okay";
> +                       spi-nor@0 {
> +                               compatible = "jedec,spi-nor";
> +                               #address-cells = <1>;
> +                               #size-cells = <1>;
> +                               reg = <0>;
> +                               spi-rx-bus-width = <2>;
> +                               partitions@80000000 {
> +                                       compatible = "fixed-partitions";
> +                                       #address-cells = <1>;
> +                                       #size-cells = <1>;
> +                                       bmc@0{
> +                                               label = "bmc";
> +                                               reg = <0x000000 0x4000000>;
> +                                       };
> +                                       u-boot@0 {
> +                                               label = "u-boot";
> +                                               read-only;
> +                                               reg = <0x0000000 0x80000>;
> +                                       };
> +                                       u-boot-env@100000 {
> +                                               label = "u-boot-env";
> +                                               reg = <0x00100000 0x40000>;
> +                                       };
> +                                       kernel@200000 {
> +                                               label = "kernel";
> +                                               reg = <0x0200000 0x600000>;
> +                                       };
> +                                       rofs@800000 {
> +                                               label = "rofs";
> +                                               reg = <0x0800000 0x1500000>;
> +                                       };
> +                                       rwfs@1c00000 {
> +                                               label = "rwfs";
> +                                               reg = <0x1c00000 0x300000>;
> +                                       };
> +                               };
> +                       };
> +                       spi-nor@1 {
> +                               compatible = "jedec,spi-nor";
> +                               #address-cells = <1>;
> +                               #size-cells = <1>;
> +                               reg = <1>;
> +                               npcm,fiu-rx-bus-width = <2>;
> +                               partitions@88000000 {
> +                                       compatible = "fixed-partitions";
> +                                       #address-cells = <1>;
> +                                       #size-cells = <1>;
> +                                       spare1@0 {
> +                                               label = "spi0-cs1-spare1";
> +                                               reg = <0x0 0x800000>;
> +                                       };
> +                                       spare2@800000 {
> +                                               label = "spi0-cs1-spare2";
> +                                               reg = <0x800000 0x0>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               fiu3: fiu@c0000000 {
> +                       pinctrl-0 = <&spi3_pins>;
> +                       status = "okay";
> +                       spi-nor@0 {
> +                               compatible = "jedec,spi-nor";
> +                               #address-cells = <1>;
> +                               #size-cells = <1>;
> +                               reg = <0>;
> +                               spi-rx-bus-width = <2>;
> +                               partitions@A0000000 {
> +                                       compatible = "fixed-partitions";
> +                                       #address-cells = <1>;
> +                                       #size-cells = <1>;
> +                                       system1@0 {
> +                                               label = "spi3-system1";
> +                                               reg = <0x0 0x800000>;
> +                                       };
> +                                       system2@800000 {
> +                                               label = "spi3-system2";
> +                                               reg = <0x800000 0x0>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               sdhci0: sdhci@f0842000 {
> +                       status = "okay";
> +               };
> +
> +               pcimbox: pcimbox@f0848000 {
> +                       status = "okay";
> +               };
> +
> +               vcd: vcd@f0810000 {
> +                       status = "okay";
> +               };
> +
> +               ece: ece@f0820000 {
> +                       status = "okay";
> +               };
> +
> +               apb {
> +
> +                       watchdog1: watchdog@901C {
> +                               status = "okay";
> +                       };
> +
> +                       rng: rng@b000 {
> +                               status = "okay";
> +                       };
> +
> +                       serial0: serial@1000 {
> +                               status = "okay";
> +                       };
> +
> +                       serial1: serial@2000 {
> +                               status = "okay";
> +                       };
> +
> +                       serial2: serial@3000 {
> +                               status = "okay";
> +                       };
> +
> +                       serial3: serial@4000 {
> +                               status = "okay";
> +                       };
> +
> +                       adc: adc@c000 {
> +                               status = "okay";
> +                       };
> +
> +                       otp:otp@189000 {
> +                               status = "okay";
> +                       };
> +
> +                       lpc_kcs: lpc_kcs@7000 {
> +                               kcs1: kcs1@0 {
> +                                       status = "okay";
> +                               };
> +
> +                               kcs2: kcs2@0 {
> +                                       status = "okay";
> +                               };
> +
> +                               kcs3: kcs3@0 {
> +                                       status = "okay";
> +                               };
> +                       };
> +
> +                       lpc_host: lpc_host@7000 {
> +                               lpc_bpc: lpc_bpc@40 {
> +                                       monitor-ports = <0x80>;
> +                                       status = "okay";
> +                               };
> +                       };
> +
> +                       spi0: spi@200000 {
> +                               cs-gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
> +                               status = "okay";
> +                       };
> +
> +                       spi1: spi@201000 {
> +                               status = "okay";
> +                       };
> +               };
> +       };
> +};
> +
> +&gcr {
> +       serial_port_mux: mux-controller {
> +       compatible = "mmio-mux";
> +       #mux-control-cells = <1>;
> +
> +       mux-reg-masks = <0x38 0x07>;
> +       idle-states = <6>;
> +       };
> +};
> --
> 2.20.1
>
