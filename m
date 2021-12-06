Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AD046ADCB
	for <lists+openbmc@lfdr.de>; Mon,  6 Dec 2021 23:55:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7Jfp2sH8z308h
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 09:55:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Dxd7mjoG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::733;
 helo=mail-qk1-x733.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Dxd7mjoG; dkim-atps=neutral
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7JfT0jZrz2yP5
 for <openbmc@lists.ozlabs.org>; Tue,  7 Dec 2021 09:54:56 +1100 (AEDT)
Received: by mail-qk1-x733.google.com with SMTP id m186so12818320qkb.4
 for <openbmc@lists.ozlabs.org>; Mon, 06 Dec 2021 14:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gGRk8yNWYz8yknrQTz0xCy2yvVs9Xk8oieE43Kwb2VM=;
 b=Dxd7mjoGgHssN3Qc1R8ynpqBfQyMi+rviliV04CEBwQ6pi7t14hkAid2eCsgvbF7ee
 R2jMZcvrlXfRDRGnmoJvcM4dLiSirTPyYwDNkEaS0gizeFSDjjKHjqptHNDtUKg02jNe
 hGRjofl8DWpC5OufF0VUh7uzSht5HlSytjE5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gGRk8yNWYz8yknrQTz0xCy2yvVs9Xk8oieE43Kwb2VM=;
 b=R4ZpImVKOjyN/MDVNKnAECGs4Uzh8jtQ8ajwLVXrZKPrIFG3igdKaUKaqM78dj/QOC
 6AO+Yq5odx2DOLFbx6nm7SwlKgYI6Usupb7KUZ74ObATDa7R+8zT8WOE1mqiKa50IY6r
 RMxeDlSIqH282JMRMUvoVnFBOQG6KjENdrFvtV2PGaH9NnluOJ9r1Qg1Gyk7B/dIkp/k
 ArjdJaA8OKJNQfjrs+KieYW2GUv0vY8gukWohy6IxKIuCMUQvNWamjwc7Xl2feSoqHUR
 orKXcLZXZ8C1f4hMJuiGXYN765ONjQp5xumyd2gL2MJJzxBdgKj0oXKvchgngDpudU5G
 JQpg==
X-Gm-Message-State: AOAM532TG5ddwzGtBhuapSUx0Ob50dJfwnUsSCDV9Q2rr7Y+8tt5nLg1
 j4ej6rch2TK7M2xDeFnUiEA20+GUxtuxW0DVoNTmcn1fyJs=
X-Google-Smtp-Source: ABdhPJzlmvaPcDKWe7+Tg8Dlm8ubcvXRD/yDYlw9NKPduFMHI4gktfBfqF1l3uZyXzbQ4Lwh+/jx3+slylWVq+/jdWk=
X-Received: by 2002:a05:620a:4081:: with SMTP id
 f1mr35675200qko.165.1638831293543; 
 Mon, 06 Dec 2021 14:54:53 -0800 (PST)
MIME-Version: 1.0
References: <20211206213218.104318-1-eajames@linux.ibm.com>
In-Reply-To: <20211206213218.104318-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 6 Dec 2021 22:54:41 +0000
Message-ID: <CACPK8XehjN1cvRPhOiVYh+3CARJnsr5yPZSwLHAoaLgVrF6gHA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.15 1/2] ARM: dts: Aspeed: Rainier: Add GPIO
 hog for USB power control
To: Eddie James <eajames@linux.ibm.com>
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

On Mon, 6 Dec 2021 at 21:32, Eddie James <eajames@linux.ibm.com> wrote:
>
> Set the USB power control to always on.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 866f32cdccea..b2af8ad09d33 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -255,7 +255,7 @@ &gpio0 {
>         /*L0-L7*/       "","","","","","","","",
>         /*M0-M7*/       "","","","","","","","",
>         /*N0-N7*/       "","","","","","","","",
> -       /*O0-O7*/       "","","","usb-power","","","","",

Do we want to remove the pin from the gpio-names? Can we leave it
there as documentation, or does it conflict?

> +       /*O0-O7*/       "","","","","","","","",
>         /*P0-P7*/       "","","","","pcieslot-power","","","",
>         /*Q0-Q7*/       "cfam-reset","","regulator-standby-faulted","","","","","",
>         /*R0-R7*/       "bmc-tpm-reset","power-chassis-control","power-chassis-good","","","","","",
> @@ -275,6 +275,13 @@ i2c3_mux_oe_n {
>                 output-high;
>                 line-name = "I2C3_MUX_OE_N";
>         };
> +
> +       usb_power_en_n {
> +               gpio-hog;
> +               gpios = <ASPEED_GPIO(O, 3) GPIO_ACTIVE_LOW>;
> +               output-high;
> +               line-name = "USB_POWER_EN_N";

This contradicts what you called it above.

> +       };
>  };
>
>  &emmc_controller {
> --
> 2.27.0
>
