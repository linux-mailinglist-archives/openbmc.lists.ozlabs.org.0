Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF86B2B3BDD
	for <lists+openbmc@lfdr.de>; Mon, 16 Nov 2020 04:35:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZF8Q5nWLzDqP2
	for <lists+openbmc@lfdr.de>; Mon, 16 Nov 2020 14:35:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=IU7rG5Id; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZF6b65KHzDqNs;
 Mon, 16 Nov 2020 14:33:59 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id g20so162744qtu.4;
 Sun, 15 Nov 2020 19:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VHApJq/Few3rO+PsJswsAjD2xg/TF+yH8mK3EqygBZ8=;
 b=IU7rG5Id/wjxU9Ko861JgpgdFpxMi2Yz8nDJY+mjhjRrGSK386J/hZczZblhVOIzuU
 rH4sqzCy3PHcqCII7b0K0C1rJ+4ChhzzqBuyP1aPdG/gUNBHS1H0zr2lv8DJtB/06cho
 wa+MxoRPH66reEgtxrrT9RzGvBA2bF+UkSn0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VHApJq/Few3rO+PsJswsAjD2xg/TF+yH8mK3EqygBZ8=;
 b=XYEG5miij0x95tt9fele59FvcF210QkVzQNg0ay2nDAkwVpQH2E4xdmgezJq2fLjW2
 mevF8V2uGiR2V3OXA1zl71yYTKGkrASrYDidJUevalyeP2incMXmHgXc1/MHnaQtHGEj
 9GjoiPFMhfPGM+ixDu57UUzMSoOLRNVgAy9NmB600BsG682w/CoVGSp849k6yT3b36NV
 ZfM39V+yl66yTciYvHK2AShLAs1yxbmZhiQlX/+Ivw3H/lkjf0pphl6FhMmNhH8xzw9u
 oXdpB3T7RjufXvzz/ETcm1kRQTTDZne0U9VfCDqKu8p1fcrvl2m2qEG85x4HJ+HOO7pH
 ICJw==
X-Gm-Message-State: AOAM530HAc+X4PAUtnDtsQibdZeoCmkA/Fb2SxjYPXO4uaJZALHAZ1rM
 DOTG9XdHC9R4qPbPjpxK/8oolMCbQFlvQRmMjAo=
X-Google-Smtp-Source: ABdhPJxLbq++VdHEvuckMaE0oGXrWK+DV7DqHONdzd9K3rD+nUDYKHqxuWIx4CUksHqehv04m7c14zlLrV9z3KwFiJE=
X-Received: by 2002:ac8:6651:: with SMTP id j17mr12485984qtp.176.1605497637791; 
 Sun, 15 Nov 2020 19:33:57 -0800 (PST)
MIME-Version: 1.0
References: <20201110072446.8218-1-rentao.bupt@gmail.com>
In-Reply-To: <20201110072446.8218-1-rentao.bupt@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 16 Nov 2020 03:33:45 +0000
Message-ID: <CACPK8Xcpj_LsYOJ=S0p1D5Wqof_2m7SLnPRantQen61B2_XjAA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: minipack: Fixup I2C tree
To: Tao Ren <rentao.bupt@gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 10 Nov 2020 at 07:24, <rentao.bupt@gmail.com> wrote:
>
> From: Tao Ren <rentao.bupt@gmail.com>
>
> Create all the i2c switches in device tree and use aliases to assign
> child channels with consistent bus numbers.
>
> Besides, "i2c-mux-idle-disconnect" is set for all the i2c switches to
> avoid potential conflicts when multiple devices (beind the switches) use
> the same device address.
>
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

I will apply for 5.11.

> ---
>  .../boot/dts/aspeed-bmc-facebook-minipack.dts | 888 ++++++++++++++++++
>  1 file changed, 888 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts
> index c34741dbd268..9eb23e874f19 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-minipack.dts
> @@ -70,6 +70,162 @@
>                 i2c45 = &imux45;
>                 i2c46 = &imux46;
>                 i2c47 = &imux47;
> +
> +               /*
> +                * I2C Switch 24-0071 (channel #0 of 8-0070): 8 channels for
> +                * connecting to left PDB (Power Distribution Board).
> +                */
> +               i2c48 = &imux48;
> +               i2c49 = &imux49;
> +               i2c50 = &imux50;
> +               i2c51 = &imux51;
> +               i2c52 = &imux52;
> +               i2c53 = &imux53;
> +               i2c54 = &imux54;
> +               i2c55 = &imux55;
> +
> +               /*
> +                * I2C Switch 25-0072 (channel #1 of 8-0070): 8 channels for
> +                * connecting to right PDB (Power Distribution Board).
> +                */
> +               i2c56 = &imux56;
> +               i2c57 = &imux57;
> +               i2c58 = &imux58;
> +               i2c59 = &imux59;
> +               i2c60 = &imux60;
> +               i2c61 = &imux61;
> +               i2c62 = &imux62;
> +               i2c63 = &imux63;
> +
> +               /*
> +                * I2C Switch 26-0076 (channel #2 of 8-0070): 8 channels for
> +                * connecting to top FCM (Fan Control Module).
> +                */
> +               i2c64 = &imux64;
> +               i2c65 = &imux65;
> +               i2c66 = &imux66;
> +               i2c67 = &imux67;
> +               i2c68 = &imux68;
> +               i2c69 = &imux69;
> +               i2c70 = &imux70;
> +               i2c71 = &imux71;
> +
> +               /*
> +                * I2C Switch 27-0076 (channel #3 of 8-0070): 8 channels for
> +                * connecting to bottom FCM (Fan Control Module).
> +                */
> +               i2c72 = &imux72;
> +               i2c73 = &imux73;
> +               i2c74 = &imux74;
> +               i2c75 = &imux75;
> +               i2c76 = &imux76;
> +               i2c77 = &imux77;
> +               i2c78 = &imux78;
> +               i2c79 = &imux79;
> +
> +               /*
> +                * I2C Switch 40-0073 (channel #0 of 11-0070): connecting
> +                * to PIM (Port Interface Module) #1 (1-based).
> +                */
> +               i2c80 = &imux80;
> +               i2c81 = &imux81;
> +               i2c82 = &imux82;
> +               i2c83 = &imux83;
> +               i2c84 = &imux84;
> +               i2c85 = &imux85;
> +               i2c86 = &imux86;
> +               i2c87 = &imux87;
> +
> +               /*
> +                * I2C Switch 41-0073 (channel #1 of 11-0070): connecting
> +                * to PIM (Port Interface Module) #2 (1-based).
> +                */
> +               i2c88 = &imux88;
> +               i2c89 = &imux89;
> +               i2c90 = &imux90;
> +               i2c91 = &imux91;
> +               i2c92 = &imux92;
> +               i2c93 = &imux93;
> +               i2c94 = &imux94;
> +               i2c95 = &imux95;
> +
> +               /*
> +                * I2C Switch 42-0073 (channel #2 of 11-0070): connecting
> +                * to PIM (Port Interface Module) #3 (1-based).
> +                */
> +               i2c96 = &imux96;
> +               i2c97 = &imux97;
> +               i2c98 = &imux98;
> +               i2c99 = &imux99;
> +               i2c100 = &imux100;
> +               i2c101 = &imux101;
> +               i2c102 = &imux102;
> +               i2c103 = &imux103;
> +
> +               /*
> +                * I2C Switch 43-0073 (channel #3 of 11-0070): connecting
> +                * to PIM (Port Interface Module) #4 (1-based).
> +                */
> +               i2c104 = &imux104;
> +               i2c105 = &imux105;
> +               i2c106 = &imux106;
> +               i2c107 = &imux107;
> +               i2c108 = &imux108;
> +               i2c109 = &imux109;
> +               i2c110 = &imux110;
> +               i2c111 = &imux111;
> +
> +               /*
> +                * I2C Switch 44-0073 (channel #4 of 11-0070): connecting
> +                * to PIM (Port Interface Module) #5 (1-based).
> +                */
> +               i2c112 = &imux112;
> +               i2c113 = &imux113;
> +               i2c114 = &imux114;
> +               i2c115 = &imux115;
> +               i2c116 = &imux116;
> +               i2c117 = &imux117;
> +               i2c118 = &imux118;
> +               i2c119 = &imux119;
> +
> +               /*
> +                * I2C Switch 45-0073 (channel #5 of 11-0070): connecting
> +                * to PIM (Port Interface Module) #6 (1-based).
> +                */
> +               i2c120 = &imux120;
> +               i2c121 = &imux121;
> +               i2c122 = &imux122;
> +               i2c123 = &imux123;
> +               i2c124 = &imux124;
> +               i2c125 = &imux125;
> +               i2c126 = &imux126;
> +               i2c127 = &imux127;
> +
> +               /*
> +                * I2C Switch 46-0073 (channel #6 of 11-0070): connecting
> +                * to PIM (Port Interface Module) #7 (1-based).
> +                */
> +               i2c128 = &imux128;
> +               i2c129 = &imux129;
> +               i2c130 = &imux130;
> +               i2c131 = &imux131;
> +               i2c132 = &imux132;
> +               i2c133 = &imux133;
> +               i2c134 = &imux134;
> +               i2c135 = &imux135;
> +
> +               /*
> +                * I2C Switch 47-0073 (channel #7 of 11-0070): connecting
> +                * to PIM (Port Interface Module) #8 (1-based).
> +                */
> +               i2c136 = &imux136;
> +               i2c137 = &imux137;
> +               i2c138 = &imux138;
> +               i2c139 = &imux139;
> +               i2c140 = &imux140;
> +               i2c141 = &imux141;
> +               i2c142 = &imux142;
> +               i2c143 = &imux143;
>         };
>
>         chosen {
> @@ -184,11 +340,16 @@
>  &i2c2 {
>         status = "okay";
>
> +       /*
> +        * I2C Switch 2-0070 is connecting to SCM (System Controller
> +        * Module).
> +        */
>         i2c-switch@70 {
>                 compatible = "nxp,pca9548";
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reg = <0x70>;
> +               i2c-mux-idle-disconnect;
>
>                 imux16: i2c@0 {
>                         #address-cells = <1>;
> @@ -269,29 +430,270 @@
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reg = <0x70>;
> +               i2c-mux-idle-disconnect;
>
> +               /*
> +                * I2C Switch 8-0070 channel #0: connecting to left PDB
> +                * (Power Distribution Board).
> +                */
>                 imux24: i2c@0 {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         reg = <0>;
> +
> +                       i2c-switch@71 {
> +                               compatible = "nxp,pca9548";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               reg = <0x71>;
> +                               i2c-mux-idle-disconnect;
> +
> +                               imux48: i2c@0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0>;
> +                               };
> +
> +                               imux49: i2c@1 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <1>;
> +                               };
> +
> +                               imux50: i2c@2 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <2>;
> +                               };
> +
> +                               imux51: i2c@3 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <3>;
> +                               };
> +
> +                               imux52: i2c@4 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <4>;
> +                               };
> +
> +                               imux53: i2c@5 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <5>;
> +                               };
> +
> +                               imux54: i2c@6 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <6>;
> +                               };
> +
> +                               imux55: i2c@7 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <7>;
> +                               };
> +                       };
>                 };
>
> +               /*
> +                * I2C Switch 8-0070 channel #1: connecting to right PDB
> +                * (Power Distribution Board).
> +                */
>                 imux25: i2c@1 {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         reg = <1>;
> +
> +                       i2c-switch@72 {
> +                               compatible = "nxp,pca9548";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               reg = <0x72>;
> +                               i2c-mux-idle-disconnect;
> +
> +                               imux56: i2c@0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0>;
> +                               };
> +
> +                               imux57: i2c@1 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <1>;
> +                               };
> +
> +                               imux58: i2c@2 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <2>;
> +                               };
> +
> +                               imux59: i2c@3 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <3>;
> +                               };
> +
> +                               imux60: i2c@4 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <4>;
> +                               };
> +
> +                               imux61: i2c@5 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <5>;
> +                               };
> +
> +                               imux62: i2c@6 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <6>;
> +                               };
> +
> +                               imux63: i2c@7 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <7>;
> +                               };
> +                       };
>                 };
>
> +               /*
> +                * I2C Switch 8-0070 channel #2: connecting to top FCM
> +                * (Fan Control Module).
> +                */
>                 imux26: i2c@2 {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         reg = <2>;
> +
> +                       i2c-switch@76 {
> +                               compatible = "nxp,pca9548";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               reg = <0x76>;
> +                               i2c-mux-idle-disconnect;
> +
> +                               imux64: i2c@0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0>;
> +                               };
> +
> +                               imux65: i2c@1 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <1>;
> +                               };
> +
> +                               imux66: i2c@2 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <2>;
> +                               };
> +
> +                               imux67: i2c@3 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <3>;
> +                               };
> +
> +                               imux68: i2c@4 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <4>;
> +                               };
> +
> +                               imux69: i2c@5 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <5>;
> +                               };
> +
> +                               imux70: i2c@6 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <6>;
> +                               };
> +
> +                               imux71: i2c@7 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <7>;
> +                               };
> +                       };
>                 };
>
> +               /*
> +                * I2C Switch 8-0070 channel #3: connecting to bottom
> +                * FCM (Fan Control Module).
> +                */
>                 imux27: i2c@3 {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         reg = <3>;
> +
> +                       i2c-switch@76 {
> +                               compatible = "nxp,pca9548";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               reg = <0x76>;
> +                               i2c-mux-idle-disconnect;
> +
> +                               imux72: i2c@0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0>;
> +                               };
> +
> +                               imux73: i2c@1 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <1>;
> +                               };
> +
> +                               imux74: i2c@2 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <2>;
> +                               };
> +
> +                               imux75: i2c@3 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <3>;
> +                               };
> +
> +                               imux76: i2c@4 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <4>;
> +                               };
> +
> +                               imux77: i2c@5 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <5>;
> +                               };
> +
> +                               imux78: i2c@6 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <6>;
> +                               };
> +
> +                               imux79: i2c@7 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <7>;
> +                               };
> +                       };
>                 };
>
>                 imux28: i2c@4 {
> @@ -323,11 +725,16 @@
>  &i2c9 {
>         status = "okay";
>
> +       /*
> +        * I2C Switch 9-0070 is connecting to MAC/PHY EEPROMs on SMB
> +        * (Switch Main Board).
> +        */
>         i2c-switch@70 {
>                 compatible = "nxp,pca9548";
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reg = <0x70>;
> +               i2c-mux-idle-disconnect;
>
>                 imux32: i2c@0 {
>                         #address-cells = <1>;
> @@ -391,53 +798,534 @@
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reg = <0x70>;
> +               i2c-mux-idle-disconnect;
>
> +               /*
> +                * I2C Switch 11-0070 channel #0: connecting to PIM
> +                * (Port Interface Module) #1 (1-based).
> +                */
>                 imux40: i2c@0 {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         reg = <0>;
> +
> +                       i2c-switch@73 {
> +                               compatible = "nxp,pca9548";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               reg = <0x73>;
> +                               i2c-mux-idle-disconnect;
> +
> +                               imux80: i2c@0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0>;
> +                               };
> +
> +                               imux81: i2c@1 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <1>;
> +                               };
> +
> +                               imux82: i2c@2 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <2>;
> +                               };
> +
> +                               imux83: i2c@3 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <3>;
> +                               };
> +
> +                               imux84: i2c@4 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <4>;
> +                               };
> +
> +                               imux85: i2c@5 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <5>;
> +                               };
> +
> +                               imux86: i2c@6 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <6>;
> +                               };
> +
> +                               imux87: i2c@7 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <7>;
> +                               };
> +                       };
>                 };
>
> +               /*
> +                * I2C Switch 11-0070 channel #1: connecting to PIM
> +                * (Port Interface Module) #2 (1-based).
> +                */
>                 imux41: i2c@1 {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         reg = <1>;
> +
> +                       i2c-switch@73 {
> +                               compatible = "nxp,pca9548";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               reg = <0x73>;
> +                               i2c-mux-idle-disconnect;
> +
> +                               imux88: i2c@0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0>;
> +                               };
> +
> +                               imux89: i2c@1 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <1>;
> +                               };
> +
> +                               imux90: i2c@2 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <2>;
> +                               };
> +
> +                               imux91: i2c@3 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <3>;
> +                               };
> +
> +                               imux92: i2c@4 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <4>;
> +                               };
> +
> +                               imux93: i2c@5 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <5>;
> +                               };
> +
> +                               imux94: i2c@6 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <6>;
> +                               };
> +
> +                               imux95: i2c@7 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <7>;
> +                               };
> +                       };
>                 };
>
> +               /*
> +                * I2C Switch 11-0070 channel #2: connecting to PIM
> +                * (Port Interface Module) #3 (1-based).
> +                */
>                 imux42: i2c@2 {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         reg = <2>;
> +
> +                       i2c-switch@73 {
> +                               compatible = "nxp,pca9548";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               reg = <0x73>;
> +                               i2c-mux-idle-disconnect;
> +
> +                               imux96: i2c@0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0>;
> +                               };
> +
> +                               imux97: i2c@1 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <1>;
> +                               };
> +
> +                               imux98: i2c@2 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <2>;
> +                               };
> +
> +                               imux99: i2c@3 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <3>;
> +                               };
> +
> +                               imux100: i2c@4 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <4>;
> +                               };
> +
> +                               imux101: i2c@5 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <5>;
> +                               };
> +
> +                               imux102: i2c@6 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <6>;
> +                               };
> +
> +                               imux103: i2c@7 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <7>;
> +                               };
> +                       };
>                 };
>
> +               /*
> +                * I2C Switch 11-0070 channel #3: connecting to PIM
> +                * (Port Interface Module) #4 (1-based).
> +                */
>                 imux43: i2c@3 {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         reg = <3>;
> +
> +                       i2c-switch@73 {
> +                               compatible = "nxp,pca9548";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               reg = <0x73>;
> +                               i2c-mux-idle-disconnect;
> +
> +                               imux104: i2c@0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0>;
> +                               };
> +
> +                               imux105: i2c@1 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <1>;
> +                               };
> +
> +                               imux106: i2c@2 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <2>;
> +                               };
> +
> +                               imux107: i2c@3 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <3>;
> +                               };
> +
> +                               imux108: i2c@4 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <4>;
> +                               };
> +
> +                               imux109: i2c@5 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <5>;
> +                               };
> +
> +                               imux110: i2c@6 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <6>;
> +                               };
> +
> +                               imux111: i2c@7 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <7>;
> +                               };
> +                       };
>                 };
>
> +               /*
> +                * I2C Switch 11-0070 channel #4: connecting to PIM
> +                * (Port Interface Module) #5 (1-based).
> +                */
>                 imux44: i2c@4 {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         reg = <4>;
> +
> +                       i2c-switch@73 {
> +                               compatible = "nxp,pca9548";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               reg = <0x73>;
> +                               i2c-mux-idle-disconnect;
> +
> +                               imux112: i2c@0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0>;
> +                               };
> +
> +                               imux113: i2c@1 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <1>;
> +                               };
> +
> +                               imux114: i2c@2 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <2>;
> +                               };
> +
> +                               imux115: i2c@3 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <3>;
> +                               };
> +
> +                               imux116: i2c@4 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <4>;
> +                               };
> +
> +                               imux117: i2c@5 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <5>;
> +                               };
> +
> +                               imux118: i2c@6 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <6>;
> +                               };
> +
> +                               imux119: i2c@7 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <7>;
> +                               };
> +                       };
>                 };
>
> +               /*
> +                * I2C Switch 11-0070 channel #5: connecting to PIM
> +                * (Port Interface Module) #6 (1-based).
> +                */
>                 imux45: i2c@5 {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         reg = <5>;
> +
> +                       i2c-switch@73 {
> +                               compatible = "nxp,pca9548";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               reg = <0x73>;
> +                               i2c-mux-idle-disconnect;
> +
> +                               imux120: i2c@0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0>;
> +                               };
> +
> +                               imux121: i2c@1 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <1>;
> +                               };
> +
> +                               imux122: i2c@2 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <2>;
> +                               };
> +
> +                               imux123: i2c@3 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <3>;
> +                               };
> +
> +                               imux124: i2c@4 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <4>;
> +                               };
> +
> +                               imux125: i2c@5 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <5>;
> +                               };
> +
> +                               imux126: i2c@6 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <6>;
> +                               };
> +
> +                               imux127: i2c@7 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <7>;
> +                               };
> +                       };
>                 };
>
> +               /*
> +                * I2C Switch 11-0070 channel #6: connecting to PIM
> +                * (Port Interface Module) #7 (1-based).
> +                */
>                 imux46: i2c@6 {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         reg = <6>;
> +
> +                       i2c-switch@73 {
> +                               compatible = "nxp,pca9548";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               reg = <0x73>;
> +                               i2c-mux-idle-disconnect;
> +
> +                               imux128: i2c@0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0>;
> +                               };
> +
> +                               imux129: i2c@1 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <1>;
> +                               };
> +
> +                               imux130: i2c@2 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <2>;
> +                               };
> +
> +                               imux131: i2c@3 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <3>;
> +                               };
> +
> +                               imux132: i2c@4 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <4>;
> +                               };
> +
> +                               imux133: i2c@5 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <5>;
> +                               };
> +
> +                               imux134: i2c@6 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <6>;
> +                               };
> +
> +                               imux135: i2c@7 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <7>;
> +                               };
> +                       };
>                 };
>
> +               /*
> +                * I2C Switch 11-0070 channel #7: connecting to PIM
> +                * (Port Interface Module) #8 (1-based).
> +                */
>                 imux47: i2c@7 {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>                         reg = <7>;
> +
> +                       i2c-switch@73 {
> +                               compatible = "nxp,pca9548";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               reg = <0x73>;
> +                               i2c-mux-idle-disconnect;
> +
> +                               imux136: i2c@0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <0>;
> +                               };
> +
> +                               imux137: i2c@1 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <1>;
> +                               };
> +
> +                               imux138: i2c@2 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <2>;
> +                               };
> +
> +                               imux139: i2c@3 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <3>;
> +                               };
> +
> +                               imux140: i2c@4 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <4>;
> +                               };
> +
> +                               imux141: i2c@5 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <5>;
> +                               };
> +
> +                               imux142: i2c@6 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <6>;
> +                               };
> +
> +                               imux143: i2c@7 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       reg = <7>;
> +                               };
> +                       };
>                 };
>         };
>  };
> --
> 2.17.1
>
