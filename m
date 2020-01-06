Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A65130DB4
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 07:48:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47rmLc0bYLzDqFS
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 17:48:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f43;
 helo=mail-qv1-xf43.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="jASuboOc"; 
 dkim-atps=neutral
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47rmKm0QcQzDqDY;
 Mon,  6 Jan 2020 17:47:55 +1100 (AEDT)
Received: by mail-qv1-xf43.google.com with SMTP id z3so18665204qvn.0;
 Sun, 05 Jan 2020 22:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OdrXgm2hCs01du+T8UYcvLNB/t0F3MI2dMgKBoMDV58=;
 b=jASuboOcMoZrLoqU/58dsKJaW1ZpB5TQiGXmSHu6SuvnehwUeL1CJeFtoo9nQp0FEs
 CWESkJ0rOS4Qq0CalTbKpRblev+e3NOD+9gEi5VhN6HHSb3/ITuJAgpp+WZxZZr4IUJs
 Q0XLeHEEEKx5RnlTMXJZY9O/IjXblGdD9WS1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OdrXgm2hCs01du+T8UYcvLNB/t0F3MI2dMgKBoMDV58=;
 b=W3wH0qT7QpuhDneSOZt5IXEgEtY7feWg5D2Yjo1HvnK9A9fgozueeBtsgeNeftTuXJ
 ToUB7UmHRkh5kHvC7aEq+3zr0XPfEy1drtcgMDsIz3R6gbVzzV3FtQ0jTgH+ejrHucuS
 Yj3hwCD7IjpTOmFwAK9XlyZ0C9034JcwcXtuF07mqllPKFL3uqlBOjMsWmChyQkQqEYt
 Eerop3GsyrJmeYCXj90hDVGhu0ZTexNNvmbfktixljZUofPYpwrpm9VKwuXCZ0BuS/VR
 /ubBqVrsyQsvppilgf0EVmwV6hHSn8GPJLy1dPi4QoB83pv4mH8giF+rooDHICtomZvx
 pdvw==
X-Gm-Message-State: APjAAAVlJEgQSJ4a74o7tHlEVotUN4xVttx98T+K4pXj5AUu7CSZA9CI
 zv8X25wrCQb5miHVwEIe2qS7lnGYLti+7Ei1Pes=
X-Google-Smtp-Source: APXvYqz+B08u8f36zlcVvGyFt7QmFTKQN1wZESA+ZjqGZOY2xqn3mk2uipltS6QD1UxNAL1a0DgbAgBtEUZjITcQB1Q=
X-Received: by 2002:a0c:ead1:: with SMTP id y17mr73914830qvp.210.1578293271759; 
 Sun, 05 Jan 2020 22:47:51 -0800 (PST)
MIME-Version: 1.0
References: <1577350475-127530-1-git-send-email-pengms1@lenovo.com>
In-Reply-To: <1577350475-127530-1-git-send-email-pengms1@lenovo.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 6 Jan 2020 06:47:39 +0000
Message-ID: <CACPK8XeY5dPHtRfFD55dLVHT0SF1gJEVf1DixsbJKpciLP2s5Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] ARM: dts: aspeed: update Hr855xg2 device tree
To: Andrew Peng <pengms1@lenovo.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Yonghui Liu <liuyh21@lenovo.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Derek Lin <dlin23@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 26 Dec 2019 at 08:54, Andrew Peng <pengms1@lenovo.com> wrote:
>

When you have a list of things like below, it's sometimes a good hint
that you should be sending one patch for each bullet point. This makes
it easier to review.

> Update i2c aliases.
> Change flash_memory mapping address and size.
> Add in a gpio-keys section.
> Enable vhub, vuart, spi1 and spi2.
> Add raa228006, ir38164 and sn1701022 hwmon sensors.
> Remove some unuse gpio from gpio section.

unused?

>
> Signed-off-by: Andrew Peng <pengms1@lenovo.com>
> Signed-off-by: Derek Lin <dlin23@lenovo.com>
> Signed-off-by: Yonghui Liu <liuyh21@lenovo.com>

I got two copies of this. I think they are the same.

> ---
> v1: initial version
>
>  arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts | 557 ++++++++++++++++-------
>  1 file changed, 382 insertions(+), 175 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts
> index 8193fad..e1386d4 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-lenovo-hr855xg2.dts
> @@ -15,14 +15,21 @@
>         compatible = "lenovo,hr855xg2-bmc", "aspeed,ast2500";
>

> -               flash_memory: region@98000000 {
> +               flash_memory: region@9EFF0000 {
>                         no-map;
> -                       reg = <0x98000000 0x00100000>; /* 1M */
> +                       reg = <0x9EFF0000 0x00010000>; /* 64K */

Do you really use 64K here, or was this a workaround for the lpc-ctlr
driver requiring a memory region?

If it's a workaround you can now drop the memory region phandle, as
the driver works without it.

> +&spi2 {
>         status = "okay";
>         pinctrl-names = "default";
> -       pinctrl-0 = <&pinctrl_txd1_default
> -                       &pinctrl_rxd1_default>;
> +       pinctrl-0 = <&pinctrl_spi2ck_default
> +                               &pinctrl_spi2cs0_default
> +                               &pinctrl_spi2miso_default
> +                               &pinctrl_spi2mosi_default>;
> +
> +               spidev@0 {
> +                               status = "okay";
> +                               compatible = "aspeed,spidev";
> +                               reg = < 0 >;
> +                               spi-max-frequency = <50000000>;
> +               };

This is for an out of tree driver? We discourage that, and prefer you
submit the driver upstream for review before adding it to the device
tree.

Please drop the sbidev bit from your next version.

> +
> +               flash@0 {
> +                               compatible = "jedec,spi-nor";
> +                               m25p,fast-read;
> +                               label = "fpga";
> +                               reg = < 0 >;
> +                               spi-max-frequency = <50000000>;
> +                               status = "okay";
> +               };
>  };

> +&vuart {
>         status = "okay";
> +       auto-flow-control;
> +       espi-enabled = <&syscon 0x70 25>;

Is this the same as the upstreamed aspeed,sirq-polarity-sense?

Please review https://git.kernel.org/torvalds/c/8d310c9107a2a3f19dc7bb54dd50f70c65ef5409.
I think you will find you can drop the espi-enabled property as
aspeed-g5.dtsi now contains the same information.

> +               pcie_slot12: i2c@4{
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               reg = <4>;
> +               };
> +
> +               switch0_i2c5:i2c@5{

a space after the :

> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               reg = <5>;
> +                               eeprom@54 {
> +                                               compatible = "atmel,24c04";
> +                                               pagesize = <16>;
> +                                               reg = <0x54>;
> +                               };
>                 };
>         };
>  };
> @@ -216,13 +377,43 @@
>         };
>
>         VR@45 {
> -               compatible = "pmbus";
> +               compatible = "raa228006";

Please send this change once you've had your pmbus driver accepted by
Guneter. In the mean time I suggest dropping it from v2 so we can
merge the other changes.

>                 reg = <0x45>;
>         };
>  };
>

> +       CPU0_VCCIN@60 {

Convention is to use lower case for node names.

> +               compatible = "raa228006";
> +               reg = <0x60>;
> +       };
> +
