Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E592432A2
	for <lists+openbmc@lfdr.de>; Thu, 13 Aug 2020 05:16:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRsDJ5W9NzDqbh
	for <lists+openbmc@lfdr.de>; Thu, 13 Aug 2020 13:16:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::542;
 helo=mail-ed1-x542.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Hvt2NguY; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRsCN110wzDqYK
 for <openbmc@lists.ozlabs.org>; Thu, 13 Aug 2020 13:15:43 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id di22so3049411edb.12
 for <openbmc@lists.ozlabs.org>; Wed, 12 Aug 2020 20:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LUoRiiS2f/wYcSnL51bB5jPauQU7hvabt9xaE8lkrxQ=;
 b=Hvt2NguYv5KYch6CY0Ow4To3rcHP+eZufxsmR1vN6Y9DYDVJjJNoDvzfwGXSCVIUov
 PxFSeSeP8arJJX2qP9t9n34N17RV/l2u7IL7jmgSwWuZEOYV7h81wmrrHUQf/kBm7UTP
 BmHV2geHv5ZplJHa0yUbVw8N/VwAbwMzaSiGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LUoRiiS2f/wYcSnL51bB5jPauQU7hvabt9xaE8lkrxQ=;
 b=tOsmMN1V1XWuXaiNqDzz8nAQddqUW9piW4RE+MP0+cXUyb+euSMmBQBjsTv3i1fyGk
 kiuQnXs8d/YZP1hw4nQZ7PGAEzPdna00sHN/Zxjq8SSb+OqTfliIt3ubb0Fxe/O/d6d8
 XIWy5alohgHv21A5IaxiBmn7Xv4H3uBJWGjgY4BmSMr5OoEEK1tpwFEbKcpYWnvdwbC/
 /3UUuzntY+aOhXlhx8oyvhuqXL0Q1jlLEhqyTzqwGcLOsOAeLWvOztIGfiYETj+yBV8G
 CgzYZz7/RBJDExVTv8qL5IsdNcUYqAPihz1jDGbZtlRaoYsBeJossNUU0+zbcGpMFqZW
 YcDw==
X-Gm-Message-State: AOAM531paoWL2zxzTFcZ9W/y1WDI8Ic9xO7fq+7PKmSyObuNAfgV4cRy
 HwvRMmD5CRZlMjlqjwMNcqzZBM1qouhulhnmYi8=
X-Google-Smtp-Source: ABdhPJwVAbmQC07LZ7R1PHw6DjdswV/7ELINKa7bjGyTHj21SBnuWPT1b4mcw/DOA9wpZvmBtwGQOW7p40szh0wxb5k=
X-Received: by 2002:aa7:cd07:: with SMTP id b7mr2952777edw.172.1597288537748; 
 Wed, 12 Aug 2020 20:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <1596022243-8788-1-git-send-email-vishwa@linux.vnet.ibm.com>
In-Reply-To: <1596022243-8788-1-git-send-email-vishwa@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 13 Aug 2020 03:15:25 +0000
Message-ID: <CACPK8XdV8P4S2k+fkatMDBmDKHTHFto_sDbg1mJt_EOPR2LS+g@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.7 2/2] rainier: Add LEDs that are controlled
 by ASPEED
To: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>,
 Andrew Geissler <geissonator@yahoo.com>, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, vishwa@linux.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 29 Jul 2020 at 11:30, <vishwa@linux.vnet.ibm.com> wrote:
>
> From: Vishwanatha Subbanna <vishwa@linux.ibm.com>
>
> These are the LEDs that have direct GPIO connection from ASPEED

Do you mean directly connected to the BMC, and not via a GPIO expander?

Convetion is to name the patches with a prefix:

 ARM: dts: aspeed: rainier: Add directly controlled LEDs


>
> Signed-off-by: Vishwanatha Subbanna <vishwa@linux.ibm.com>
> Reviewed-by: Eddie James <eajames@linux.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 9b28a30..d1a588f 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -124,6 +124,26 @@
>         leds {
>                 compatible = "gpio-leds";
>
> +               /* BMC Card fault LED at the back */
> +               bmc-ingraham0 {
> +                       gpios = <&gpio0 ASPEED_GPIO(H, 1) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               /* Enclosure ID LED at the back */
> +               rear-enc-id0 {
> +                       gpios = <&gpio0 ASPEED_GPIO(H, 2) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               /* Enclosure fault LED at the back */
> +               rear-enc-fault0 {
> +                       gpios = <&gpio0 ASPEED_GPIO(H, 3) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               /* PCIE slot power LED */
> +               pcieslot-power {
> +                       gpios = <&gpio0 ASPEED_GPIO(P, 4) GPIO_ACTIVE_LOW>;
> +               };
> +
>                 /* System ID LED that is at front on Op Panel */
>                 front-sys-id0 {
>                         retain-state-shutdown;
> @@ -167,7 +187,7 @@
>         /*E0-E7*/       "","","","","","","","",
>         /*F0-F7*/       "","","","","","","","",
>         /*G0-G7*/       "","","","","","","","",
> -       /*H0-H7*/       "","","","","","","","",
> +       /*H0-H7*/       "","bmc-ingraham0","rear-enc-id0","rear-enc-fault0","","","","",

I think the guideline is to name GPIOs based on their use, so
bmc-ingraham0 should be fault-bmc-ingraham0 if we follow the psu
presence GPIO convention of function-name.

I think we had some documentation written up on naming conventions.

Brad, do you have any input here?

>         /*I0-I7*/       "","","","","","","","",
>         /*J0-J7*/       "","","","","","","","",
>         /*K0-K7*/       "","","","","","","","",
> @@ -175,7 +195,7 @@
>         /*M0-M7*/       "","","","","","","","",
>         /*N0-N7*/       "","","","","","","","",
>         /*O0-O7*/       "","","","usb-power","","","","",
> -       /*P0-P7*/       "","","","","","","","",
> +       /*P0-P7*/       "","","","","pcieslot-power","","","",
>         /*Q0-Q7*/       "cfam-reset","","","","","","","",
>         /*R0-R7*/       "","","","","","","","",
>         /*S0-S7*/       "presence-ps0","presence-ps1","presence-ps2","presence-ps3",
> --
> 1.8.3.1
>
