Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B9687301B0
	for <lists+openbmc@lfdr.de>; Thu, 30 May 2019 20:20:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FG8k2J3XzDqXD
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 04:20:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d43; helo=mail-io1-xd43.google.com;
 envelope-from=benjaminfair@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="D87WOUpu"; 
 dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FG8D0vk2zDqWv
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 04:19:55 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id g16so5899452iom.9
 for <openbmc@lists.ozlabs.org>; Thu, 30 May 2019 11:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wPENEkFnCEubLxv3jR3JjXEbQ8JdjMi4Z0KmVpAvYNk=;
 b=D87WOUpun/S0nFdxsw97Bcf/7+vkLQK5u3ivlnhSx50igPrgmSKRNsG47nlOqY5761
 J1PDYOupf7svdW1bGKmBEwoU2iV9bzw1HqX+M8PyayiEoa+7zurJ80sbpNQ+Czvs2XZo
 IuRalSipChBuN2B0gxzssOPLkbtNXgx3jDLxpOUZBjXCPqEhRVpsoWUx13najbRFd8dD
 8LYCY06tHPLNEffEGrE62Hsl3yOnpTNhsMzpXedcT78mUEdk960kOmCNlMmFxu8q2dVx
 yDLZFuKXx3T9Z5fyHx4ZbCKjFfmzhPaFt6j3ccNjYobelXCNqTLKyyKjSFTXFStGJJWf
 wcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wPENEkFnCEubLxv3jR3JjXEbQ8JdjMi4Z0KmVpAvYNk=;
 b=jYMy3li511PEta7KswKb7svsOBuVWfVhv63nzS/kM/2QWKO3OSuZsI60AIxzUoultb
 rPUIC7g900SZMsb0feGwSiyyebuZUE6qfDmwAraOgkSMegq9onc8WNK1gOq3+uLH0/58
 rZNpTwFL2+PyR7mcr5x+ccU+qXuXpfOG7yGXTm0co1wow3cMKQtVlG6/lcGur7P+cttd
 Np8s9CQPpFbGggG777lj2UuCN9PO5WarSHXGG3Qgh2aljUmB0qVODKqCUSJcTx/SO6hC
 H8Uzx93xq8zsx1yowmgiltLeUH7xqCIgY62GXmN1W2l7b+jMOlJLdukR5AMb8VzXrtkY
 f5qQ==
X-Gm-Message-State: APjAAAWmtq1hsgbKZvDE0GxLZbfU2iloxvQRpVyPX2EZSdwEYgLVWQSr
 aB+tWIHNaDTZvH07AdEwUrpyXtrsoq82wenuTCKx/Q==
X-Google-Smtp-Source: APXvYqxpFlxo/3tgzIccHm0H4hh0L+nXvrZbI49GVPS9Yw8uzIgz6ZLhniwRf01QXDqBMC8qULbxbMFiHCiwMgPrlBQ=
X-Received: by 2002:a6b:b654:: with SMTP id g81mr3606097iof.34.1559240392241; 
 Thu, 30 May 2019 11:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190516111200.13859-1-franhsutw@gmail.com>
 <20190516111200.13859-2-franhsutw@gmail.com>
In-Reply-To: <20190516111200.13859-2-franhsutw@gmail.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Thu, 30 May 2019 11:19:16 -0700
Message-ID: <CADKL2t49pkoejPUm+bogC2M64GzD7r7RSxEcs6eNjHGWPUqyOQ@mail.gmail.com>
Subject: Re: [PATCH dev-5.1 v4 2/4] ARM: dts: nuvoton: Add Quanta GSJ BMC
 Device Tree.
To: Fran Hsu <franhsutw@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 16, 2019 at 4:14 AM Fran Hsu <franhsutw@gmail.com> wrote:
>
> Add Quanta GSJ BMC device tree part 2.
> This file included the definition of following two functions:
> 1.GPIO
> 2.LED
>
> Signed-off-by: Fran Hsu <franhsutw@gmail.com>

The subject line/first line of the commit message should be different
from the previous patch to make it easier to tell them apart.

Maybe something like "ARM: dts: nuvoton: Add GPIOs and LEDs to GSJ device tree"?

> ---
>  arch/arm/boot/dts/nuvoton-npcm730-gsj.dts | 195 ++++++++++++++++++++++
>  1 file changed, 195 insertions(+)
>
> diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> index 7cac83c6566b..bebd3878fcb3 100644
> --- a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> +++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> @@ -409,5 +409,200 @@
>                 };
>         };
>
> +       pinctrl: pinctrl@f0800000 {
> +               pinctrl-names = "default";
> +               pinctrl-0 = <
> +                               /* GPI pins*/
> +                               &gpio8_pins
> +                               &gpio9_pins
> +                               &gpio12_pins
> +                               &gpio13_pins
> +                               &gpio14_pins
> +                               &gpio60_pins
> +                               &gpio83_pins
> +                               &gpio91_pins
> +                               &gpio92_pins
> +                               &gpio95_pins
> +                               &gpio136_pins
> +                               &gpio137_pins
> +                               &gpio141_pins
> +                               &gpio144_pins
> +                               &gpio145_pins
> +                               &gpio146_pins
> +                               &gpio147_pins
> +                               &gpio148_pins
> +                               &gpio149_pins
> +                               &gpio150_pins
> +                               &gpio151_pins
> +                               &gpio152_pins
> +                               &gpio153_pins
> +                               &gpio154_pins
> +                               &gpio155_pins
> +                               &gpio156_pins
> +                               &gpio157_pins
> +                               &gpio158_pins
> +                               &gpio159_pins
> +                               &gpio161_pins
> +                               &gpio162_pins
> +                               &gpio163_pins
> +                               &gpio164_pins
> +                               &gpio165_pins
> +                               &gpio166_pins
> +                               &gpio167_pins
> +                               &gpio168_pins
> +                               &gpio169_pins
> +                               &gpio170_pins
> +                               &gpio177_pins
> +                               &gpio191_pins
> +                               &gpio192_pins
> +                               &gpio203_pins
> +                               /* GPO pins*/
> +                               &gpio0pp_pins
> +                               &gpio1pp_pins
> +                               &gpio2pp_pins
> +                               &gpio3pp_pins
> +                               &gpio4pp_pins
> +                               &gpio5pp_pins
> +                               &gpio6pp_pins
> +                               &gpio7pp_pins
> +                               &gpio10pp_pins
> +                               &gpio11pp_pins
> +                               &gpio15od_pins
> +                               &gpio17pp_pins
> +                               &gpio18pp_pins
> +                               &gpio19pp_pins
> +                               &gpio24pp_pins
> +                               &gpio25pp_pins
> +                               &gpio37od_pins
> +                               &gpio59pp_pins
> +                               &gpio72od_pins
> +                               &gpio73od_pins
> +                               &gpio74od_pins
> +                               &gpio75od_pins
> +                               &gpio76od_pins
> +                               &gpio77od_pins
> +                               &gpio78od_pins
> +                               &gpio79od_pins
> +                               &gpio84pp_pins
> +                               &gpio85pp_pins
> +                               &gpio86pp_pins
> +                               &gpio87pp_pins
> +                               &gpio88pp_pins
> +                               &gpio89pp_pins
> +                               &gpio90pp_pins
> +                               &gpio93pp_pins
> +                               &gpio94pp_pins
> +                               &gpio125pp_pins
> +                               &gpio126od_pins
> +                               &gpio127od_pins
> +                               &gpio142od_pins
> +                               &gpio143ol_pins
> +                               &gpio175od_pins
> +                               &gpio176od_pins
> +                               &gpio190od_pins
> +                               &gpio194pp_pins
> +                               &gpio195od_pins
> +                               &gpio196od_pins
> +                               &gpio197od_pins
> +                               &gpio198od_pins
> +                               &gpio199od_pins
> +                               &gpio200pp_pins
> +                               &gpio202od_pins
> +                               >;
> +       };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               led-bmc-live {
> +                       gpios = <&gpio4 15 GPIO_ACTIVE_HIGH>;
> +                       linux,default-trigger = "heartbeat";
> +               };
> +
> +               LED_U2_0_LOCATE {
> +                       gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_1_LOCATE {
> +                       gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_2_LOCATE {
> +                       gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_3_LOCATE {
> +                       gpios = <&gpio0 3 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_4_LOCATE {
> +                       gpios = <&gpio0 10 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_5_LOCATE {
> +                       gpios = <&gpio0 11 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_BMC_TRAY_PWRGD {
> +                       gpios = <&gpio0 19 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_7_FAULT {
> +                       gpios = <&gpio6 8 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_6_LOCATE {
> +                       gpios = <&gpio0 24 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_7_LOCATE {
> +                       gpios = <&gpio0 25 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_0_FAULT {
> +                       gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_1_FAULT {
> +                       gpios = <&gpio2 21 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_2_FAULT {
> +                       gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_3_FAULT {
> +                       gpios = <&gpio2 23 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_4_FAULT {
> +                       gpios = <&gpio2 24 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_5_FAULT {
> +                       gpios = <&gpio2 25 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +
> +               LED_U2_6_FAULT {
> +                       gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>;
> +                       default-state = "off";
> +               };
> +       };
>
>  };
> --
> 2.21.0
>
