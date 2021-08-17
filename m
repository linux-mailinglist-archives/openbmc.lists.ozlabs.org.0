Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 170A83EE859
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 10:23:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpkYk6j5sz30HX
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 18:23:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=NZVF8fit;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2c;
 helo=mail-qv1-xf2c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=NZVF8fit; dkim-atps=neutral
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpkYK6cl9z2yfZ;
 Tue, 17 Aug 2021 18:22:45 +1000 (AEST)
Received: by mail-qv1-xf2c.google.com with SMTP id g11so1962253qvd.2;
 Tue, 17 Aug 2021 01:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zhjo9QSmw27pDivMhjrb1fCoYUKc8i8zzEI/B9kHVhk=;
 b=NZVF8fit7hyXSPzExzEkJtIoVr1V3KynrL+YIZDtDj3g/VL60ad/eRLqKeY8XfgCTP
 xVxLxfwkyTvks0CJevqs/T6MTnraap9Gs/WvbwPn1gekC5YAv49+9kDizy0zYFbb+swW
 UvIe5jsgoXDmJvdiD4Fhbhhn1Bqw6Kbgb7KqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zhjo9QSmw27pDivMhjrb1fCoYUKc8i8zzEI/B9kHVhk=;
 b=Kb9MLvFKD1bzfhR4lFJOYANOl8g0VZi0W2zSXy7ckIcvYB4+eKQCU+q1IykOBQuOp0
 rlXECwUqeKH3C/6udptfSADeRoXn7q17oqZF6dPI7C85I6TNeFr1jybOU/BO2kJNuaBm
 xdeBCG0DhGikViykhL/WxcFnEGM5sOdfDN+94YZjv5Jw6MlqVT5dCN00ypFF9JVrwKPE
 y8iUilO4+805x9bHDeSRzHd+iwlad1en6RsSRkPBslcUHprYFieh39t9pUI9tXq2Dby+
 s+3ld24IO4KSZ7gytoJywB10xD20BhFo/D0+8ovKsj04OIrj8DVqDHziEMIabdsicbCb
 SFTQ==
X-Gm-Message-State: AOAM5327tOz77FB9dlBbldU5aiaLZq4AOFpJVPSHJ/kCtsDUWSobRFXB
 BkpGc2abOMSY1g347mgtCHwhF680HzuX96KUVrk=
X-Google-Smtp-Source: ABdhPJxs2wRduY04otm4gWEktimpcjtM+CNdRIrl75q4UfXuJ1TNyMFVVKJSyZYP7FRnBlgJIZLHfIdlc0Qw2ayFhlo=
X-Received: by 2002:a05:6214:8c2:: with SMTP id
 da2mr2183129qvb.10.1629188563529; 
 Tue, 17 Aug 2021 01:22:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210816160002.18645-1-jlwright@us.ibm.com>
In-Reply-To: <20210816160002.18645-1-jlwright@us.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 17 Aug 2021 08:22:31 +0000
Message-ID: <CACPK8XcgFkcA4cpqzTmwS-tpauWeAeFHqzhjyxOWvggKSOJFQw@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.10] ARM: dts: aspeed: p10bmc: Add power
 control pins
To: Jim Wright <jlwright@us.ibm.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 16 Aug 2021 at 16:01, Jim Wright <jlwright@us.ibm.com> wrote:
>
> Add to p10bmc systems the GPIO line names used in chassis power on / off
> control and chassis power good monitoring. Names used are as documented at [1].
>
> [1] https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md
>
> Signed-off-by: Jim Wright <jlwright@us.ibm.com>

Thanks, applied.

> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> index 01a0b2b03ddd..941efff7c943 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> @@ -253,7 +253,7 @@ &gpio0 {
>         /*O0-O7*/       "","","","","","","","",
>         /*P0-P7*/       "","","","","led-pcieslot-power","","","",
>         /*Q0-Q7*/       "","","","","","","","",
> -       /*R0-R7*/       "","","","","","I2C_FLASH_MICRO_N","","",
> +       /*R0-R7*/       "","power-chassis-control","power-chassis-good","","","I2C_FLASH_MICRO_N","","",
>         /*S0-S7*/       "","","","","","","","",
>         /*T0-T7*/       "","","","","","","","",
>         /*U0-U7*/       "","","","","","","","",
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index f87bc5dc8aba..605ad80ef967 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -243,7 +243,7 @@ &gpio0 {
>         /*O0-O7*/       "","","","usb-power","","","","",
>         /*P0-P7*/       "","","","","pcieslot-power","","","",
>         /*Q0-Q7*/       "cfam-reset","","","","","","","",
> -       /*R0-R7*/       "","","","","","","","",
> +       /*R0-R7*/       "","power-chassis-control","power-chassis-good","","","","","",
>         /*S0-S7*/       "presence-ps0","presence-ps1","presence-ps2","presence-ps3",
>                                 "","","","",
>         /*T0-T7*/       "","","","","","","","",
> --
> 2.32.0
>
