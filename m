Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B01C33831D
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 02:21:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxShS45Z4z3dHR
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 12:21:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=KydqWPLF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82a;
 helo=mail-qt1-x82a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=KydqWPLF; dkim-atps=neutral
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxSgm3LH2z3cGs
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 12:21:05 +1100 (AEDT)
Received: by mail-qt1-x82a.google.com with SMTP id x9so2678737qto.8
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 17:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zL0tD8rGUXFO4Qkv46zO0ros0eKWAcJu4QcnRpFWSPc=;
 b=KydqWPLFtDqnckZM5bgoBC/cBUnc++t+niMv2U6KPYqIsI51ByYJYHekMxFCx0tw68
 Yw8ULPsSEAjQx/DTF82+HGkF6urVOxGSTD+faAd0p2TpGX4GAU/JTny6D0PAJkcu3GEv
 AVH06GkBDzhbjfV8ZekSKkMo2zPxNmAgiWg08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zL0tD8rGUXFO4Qkv46zO0ros0eKWAcJu4QcnRpFWSPc=;
 b=VzNuwu0Y5iIqO9llYe5EiLeuzL6uvMZjWNZmeSOezf7L2vEBf7C5skExQ5xunlapup
 Ekg0iIcbUST4XCRCzA8yK23FFyBHIpzBvasnsdNv4Nh5X4CwfbfGm8xRrn4A2mMxJwYT
 imkDTim5NDi82RiuGMB5VeYWbC+pXThTdjutG2mc1Wz2qS6YYeeDwq29F3eOcRfxHHC2
 0d5yTSG3dOHFB5eBOlVJdjTPbvOU1H81UW73v5O5Ay5jtpPTZ36qznjzV48+s74i9mlO
 /tJnGhocj6pQDZfQBPBhd3D/vaDumL9EfP8DG7V/PzmMfPlJwKRVwSD2Odf2BOAgSn+a
 bnIg==
X-Gm-Message-State: AOAM531N12pxssux+u1jY9PKis20CE+oWHVA/+mAX8BborHYga9QQlj9
 D4fo5BqiHsajpXBNQobjHgUvpDV7A00XieCQDIc=
X-Google-Smtp-Source: ABdhPJwKtab6FIKHJm8a6jRHvEYyTe3Wky8rC16X3k2IU+at+AGIrtmhwpaWy4Cr5bWR5atfayaxDwGOO3odezfp4Ik=
X-Received: by 2002:ac8:7153:: with SMTP id h19mr10328384qtp.176.1615512062376; 
 Thu, 11 Mar 2021 17:21:02 -0800 (PST)
MIME-Version: 1.0
References: <20210310030952.26090-1-george.hung@quantatw.com>
In-Reply-To: <20210310030952.26090-1-george.hung@quantatw.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Mar 2021 01:20:50 +0000
Message-ID: <CACPK8XfW-ZMkJbfemDMiJPn=i8sSiQ8nexwj6Q0c_x68Enn5+A@mail.gmail.com>
Subject: Re: [PATCH dev-5.10 v1] ARM: dts: nuvoton: Add Quanta GBS BMC Device
 Tree
To: George Hung <ghung.quanta@gmail.com>
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
Cc: kwliu@nuvoton.com, yschu@nuvoton.com,
 Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, brandonkim@google.com,
 Tomer Maimon <tomer.maimon@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 10 Mar 2021 at 03:18, George Hung <ghung.quanta@gmail.com> wrote:
>
> Add initial version of device tree for Quanta GBS
> BMC (NPCM730 SoC)
>
> Signed-off-by: George Hung <george.hung@quantatw.com>
> ---
>  arch/arm/boot/dts/Makefile                |    1 +
>  arch/arm/boot/dts/nuvoton-npcm730-gbs.dts | 1233 +++++++++++++++++++++
>  2 files changed, 1234 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index c57729f40185..82785fe2c8bf 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -340,6 +340,7 @@ dtb-$(CONFIG_ARCH_LPC32XX) += \
>         lpc3250-phy3250.dtb
>  dtb-$(CONFIG_ARCH_NPCM7XX) += \
>         nuvoton-npcm730-gsj.dtb \
> +       nuvoton-npcm730-gbs.dtb \
>         nuvoton-npcm730-kudo.dtb \
>         nuvoton-npcm750-evb.dtb \
>         nuvoton-npcm750-runbmc-olympus.dtb
> diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
> new file mode 100644
> index 000000000000..15357ae97ec4
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
> @@ -0,0 +1,1233 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2020 Quanta Computer Inc. George.Hung@quantatw.com
> +
> +/dts-v1/;
> +#include "nuvoton-npcm730.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +       model = "Quanta GBS Board (Device Tree)";
> +       compatible = "nuvoton,npcm750";

Give your machine a compatible string too. eg:

 compatible = "qanta,gbs-bmc", "nuvoton,npcm750";

> +
> +       ahb {
> +               fiu0: spi@fb000000 {
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&spi0cs1_pins>;
> +                       status = "okay";
> +                       spi-nor@0 {
> +                               compatible = "jedec,spi-nor";
> +                               #address-cells = <1>;
> +                               #size-cells = <1>;
> +                               reg = <0>;
> +                               spi-max-frequency = <19000000>;
> +                               spi-rx-bus-width = <2>;
> +                               label = "bmc";
> +                               partitions@80000000 {
> +                                       compatible = "fixed-partitions";
> +                                       #address-cells = <1>;
> +                                       #size-cells = <1>;
> +                                       u-boot@0 {
> +                                               label = "u-boot";
> +                                               reg = <0x0000000 0xf0000>;
> +                                       };
> +                                       image-descriptor@f0000 {
> +                                               label = "image-descriptor";
> +                                               reg = <0xf0000 0x10000>;
> +                                       };
> +                                       hoth-update@100000 {
> +                                               label = "hoth-update";
> +                                               reg = <0x100000 0x100000>;
> +                                       };

Is this layout common for all nuvoton openbmc machines?

> +                                       kernel@200000 {
> +                                               label = "kernel";
> +                                               reg = <0x200000 0x500000>;
> +                                       };
> +                                       rofs@700000 {
> +                                               label = "rofs";
> +                                               reg = <0x700000 0x35f0000>;
> +                                       };
> +                                       rwfs@3cf0000 {
> +                                               label = "rwfs";
> +                                               reg = <0x3cf0000 0x300000>;
> +                                       };
> +                                       hoth-mailbox@3ff0000 {
> +                                               label = "hoth-mailbox";
> +                                               reg = <0x3ff0000 0x10000>;
> +                                       };
> +                               };
> +                       };
> +               };

> +
> +               gmac0: eth@f0802000 {

Please take a look at the latest version of the other nuvoton device
trees. They now follow the convention of using phandles to enable
devices. eg:

&gmac {
   status = "okay";
   phy-mode = "rgmii-id";
   snps,eee-force-disable;
};

Please update all of the nodes to use this style.

> +                       status = "okay";
> +                       phy-mode = "rgmii-id";
> +                       snps,eee-force-disable;
> +               };
> +
>
