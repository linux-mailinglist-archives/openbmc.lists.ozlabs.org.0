Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 158FA3115D
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 17:32:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FpN24MyTzDqYB
	for <lists+openbmc@lfdr.de>; Sat,  1 Jun 2019 01:32:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::141; helo=mail-it1-x141.google.com;
 envelope-from=benjaminfair@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="aSpn8Rym"; 
 dkim-atps=neutral
Received: from mail-it1-x141.google.com (mail-it1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FpKz2DLmzDqb9
 for <openbmc@lists.ozlabs.org>; Sat,  1 Jun 2019 01:30:15 +1000 (AEST)
Received: by mail-it1-x141.google.com with SMTP id u186so15929975ith.0
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 08:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1jeeIS4mAtKSz3MSfJ3jiyRUYEZ+t/HNRgLo46a+uZw=;
 b=aSpn8RympcRmywrUEHLnggc9iMtByv7OC2sruyqREq731zITm1JUl75H8Q1iq7mjkW
 2WeuxcS0qil/soR+KiQ+Z5znfoTFBV6ZNDbkh3hjRAqIXYwRhNxGtgP2+rJoMuRM9Sjx
 VX93/9bx4uMRdWlULoiJIov5y1VHCxVTGly7409DSZ62jgZNx+GTDEEphEukLy2ynW9R
 Xt9Qr0aEmsX7MoA/bnb+EuiXKShaZmzOv1cZ298VmRO2jRL/yaUBPkfNySzgu7X5RSPC
 GAOi7UNliu0KV+NjnNCFQ1lfLgwkeszPciyq8wr/H6wpqpmcprNZffyIptk9x80+JgDC
 sBzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1jeeIS4mAtKSz3MSfJ3jiyRUYEZ+t/HNRgLo46a+uZw=;
 b=uVosk3piC/ApSyG1ExcDPNkCvuO4nqCGmZtCl6PQQ8ZnHH+deP/HQNcnIwFKzP4VS/
 DJ/xaIw/cLu6er61meSa4M69rWb3PwBROqdkl+NMQMBJYYllOQyPSaUc9KNOk8VqfguD
 OIUIljPOAprVkqa6kvYhNqsD5rHSQFOhgQL0TQzk323PMezZdgN1V2dQHqGQC5yOny5Y
 QQCN5KR54dpWHkOyxyI+x3PB45HpNOoBAuvczhygnaeRWAex16byrgC/iaCrUSUK3/PI
 x3ilKAQGSDbWJQ9XDjHHmz0N/H9/haF6oeJFLgKV3rQKUPxBn1h7r4L2F57uaxIIDQD2
 bhng==
X-Gm-Message-State: APjAAAXTEQ2LIH1E5LFbQlvTxZYe4xlfKOnddbr+VLXy+c1S10833sQB
 zpQz6xhO5M84XAVL4bY45AN66SLwXAw1pFjsEAZ0Q9690eddoA==
X-Google-Smtp-Source: APXvYqys5hqHT3E7E1zAwnbbLUAAR04qhbDizKWMql0p+vwai0KT1dov9LWCPzzAVdw1yqNwLR0XvHLwNma00ZdfJgI=
X-Received: by 2002:a24:a943:: with SMTP id x3mr7793099iti.64.1559316612930;
 Fri, 31 May 2019 08:30:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190531132440.37572-1-Fran.Hsu@quantatw.com>
 <20190531132440.37572-4-Fran.Hsu@quantatw.com>
In-Reply-To: <20190531132440.37572-4-Fran.Hsu@quantatw.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Fri, 31 May 2019 08:29:37 -0700
Message-ID: <CADKL2t6phkJaMuh_LZGco9RuxMuM98ALsP29S3rPTeUzPWYbXg@mail.gmail.com>
Subject: Re: [PATCH dev-5.1 v5 4/4] ARM: dts: nuvoton: Add GPIOs and LEDs to
 GSJ device tree.
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Fran Hsu <Fran.Hsu@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, May 31, 2019 at 6:26 AM Fran Hsu <franhsutw@gmail.com> wrote:
>
> Add Quanta GSJ BMC device tree part 2.
> This file included the definition of following two functions:
> 1.GPIO
> 2.LED
>
> Signed-off-by: Fran Hsu <Fran.Hsu@quantatw.com>

Reviewed-by: Benjamin Fair <benjaminfair@google.com>

> ---
>  arch/arm/boot/dts/nuvoton-npcm730-gsj.dts | 195 ++++++++++++++++++++++
>  1 file changed, 195 insertions(+)
>
> diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> index 8f4ca6084..380d0d382 100644
> --- a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> +++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
> @@ -415,4 +415,199 @@
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
>  };
> --
> 2.21.0
>
