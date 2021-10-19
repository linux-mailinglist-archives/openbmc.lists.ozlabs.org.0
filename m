Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75979432E8A
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 08:46:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYPRg6y8hz2yp2
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 17:46:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=IzzuT+2l;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f33;
 helo=mail-qv1-xf33.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=IzzuT+2l; dkim-atps=neutral
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYPRF4L5vz2xtg;
 Tue, 19 Oct 2021 17:46:31 +1100 (AEDT)
Received: by mail-qv1-xf33.google.com with SMTP id n12so11688857qvk.3;
 Mon, 18 Oct 2021 23:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kPpGQ/usuIv6r0JFjkYFCgDGOkeWZxHqy3uYPgIqN/E=;
 b=IzzuT+2lP0r9gPF/tnCzyet81txYZEuBr5EoUfq65UCXmd97IUKjxfSDYaFTsb9dRi
 ERBJQbcImNnmeYDOMJKGvrYchDdOaqywyLjfHETEP1kLLHJHrOcHXrPh4bWXZRan4azb
 SzzXJ2xjgvZjZ/2rHlRvEpVJUWtGBwDSF/94U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kPpGQ/usuIv6r0JFjkYFCgDGOkeWZxHqy3uYPgIqN/E=;
 b=AYZ40LVnOmUPSivdbmC7F+fewSD9fiSnnlVYjOPpqU+B5O/hnbT4jrRJ6X4ckBsaIx
 NzJCg/Rdzir/Xqi5roNaNCOCqBIRb7a2poqlb+A6up7sybzdQMq4DnSNjTho52GvWVlK
 HP1trCC+frBsxXplU3zFYgtDOD3kr1adA2quZZvirB5v/kItqMI0wbwx97c41V4GaX86
 F4O5ap3HZjimjAp7PHAK/6QyxCgaTqgVQUueb8F6QgBRmFcdb+Q7hDP6fgQGHV9sgdyL
 l6GRGddqle9+uDiaUkWuMb8pvxQx+mXJoJUgCE/h9wy+0jUktsRq1wlCsgC/rCeRdQO0
 bt6A==
X-Gm-Message-State: AOAM532k14MZDvv5iQlrniFiVgQFcmX0zsPNDZeqv6FI5lE+4+vwS8Me
 JTqx5LTQXtCPE1pLzAZRPSPzEYJf/AA5odcsl/E=
X-Google-Smtp-Source: ABdhPJwVUsADq1mo1BO5nQp+62iE2cz6mNTV9MKZGvspzkW1xufQZsSlNx1FUVk9bHcWeRidndx81yd4a16pLT2Ymo0=
X-Received: by 2002:ad4:5de9:: with SMTP id jn9mr30214330qvb.41.1634625986385; 
 Mon, 18 Oct 2021 23:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20211019060155.945-1-quan@os.amperecomputing.com>
 <20211019060155.945-2-quan@os.amperecomputing.com>
In-Reply-To: <20211019060155.945-2-quan@os.amperecomputing.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 19 Oct 2021 06:46:14 +0000
Message-ID: <CACPK8Xcp0ruL-7p3AA+yvba3Drrwm-=-hMnMpd=a1aHwQHnE1A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ARM: dts: aspeed: mtjade: Add some gpios
To: Quan Nguyen <quan@os.amperecomputing.com>
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>,
 Open Source Submission <patches@amperecomputing.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 19 Oct 2021 at 06:02, Quan Nguyen <quan@os.amperecomputing.com> wrote:
>
> Add S0_SCP_AUTH_FAIL, S1_SCP_AUTH_FAIL gpios to indicates firmware
> authentication fail on each socket.

These use the gpio-keys API to expose the GPIOs. I think OpenBMC is
moving away from this abstraction, and instead reading the GPIOs with
the gpio chardev interface.

>
> Add gpio RTC_BAT_SEN_EN to enable RTC battery adc sensor.
>
> Add BMC_I2C4_O_EN gpio to go high at boot to enable access to I2C4 bus.

OpenBMC has started a process to document GPIOs that are exposed to
userspace, initially so a common userspace can be used across
machines. I like doing it for the additional reason that it provides
consistency in the naming.

https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md

If you could take a look at that document and add your GPIOs where
possible, and then update the device tree.

>
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> Signed-off-by: Thang Nguyen <thang@os.amperecomputing.com>
> ---
> v2:
>   - None
>
>  .../arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 21 ++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
> index 57b0c45a2298..3515d55bd312 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts
> @@ -86,6 +86,18 @@ S0_cpu_fault {
>                         linux,code = <ASPEED_GPIO(J, 1)>;
>                 };
>
> +               S0_scp_auth_fail {
> +                       label = "S0_SCP_AUTH_FAIL";
> +                       gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(J, 2)>;
> +               };
> +
> +               S1_scp_auth_fail {
> +                       label = "S1_SCP_AUTH_FAIL";
> +                       gpios = <&gpio ASPEED_GPIO(Z, 5) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(Z, 5)>;
> +               };
> +
>                 S1_overtemp {
>                         label = "S1_OVERTEMP";
>                         gpios = <&gpio ASPEED_GPIO(Z, 6) GPIO_ACTIVE_LOW>;
> @@ -590,7 +602,7 @@ &gpio {
>         /*Q0-Q7*/       "","","","","","UID_BUTTON","","",
>         /*R0-R7*/       "","","BMC_EXT_HIGHTEMP_L","OCP_AUX_PWREN",
>                         "OCP_MAIN_PWREN","RESET_BUTTON","","",
> -       /*S0-S7*/       "","","","","","","","",
> +       /*S0-S7*/       "","","","","RTC_BAT_SEN_EN","","","",

I suggest you create a proposal to call this one
battery-voltage-read-enable. I know that some of the IBM machines
intend to have this same GPIO.

>         /*T0-T7*/       "","","","","","","","",
>         /*U0-U7*/       "","","","","","","","",
>         /*V0-V7*/       "","","","","","","","",
> @@ -604,4 +616,11 @@ &gpio {
>                         "S1_BMC_DDR_ADR","","","","",
>         /*AC0-AC7*/     "SYS_PWR_GD","","","","","BMC_READY","SLAVE_PRESENT_L",
>                         "BMC_OCP_PG";
> +
> +       i2c4_o_en {
> +               gpio-hog;
> +               gpios = <ASPEED_GPIO(Y, 2) GPIO_ACTIVE_HIGH>;
> +               output-high;
> +               line-name = "BMC_I2C4_O_EN";
> +       };
>  };
> --
> 2.28.0
>
