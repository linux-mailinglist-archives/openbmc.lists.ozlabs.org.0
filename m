Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A48B258460
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 01:22:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgR741NhQzDq8W
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 09:22:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::543;
 helo=mail-ed1-x543.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=S4tqMihe; dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgR352GbfzDqTg
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 09:18:41 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id n13so7028160edo.10
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 16:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rr/wvG6tsAkowg+Whc/ull1BkHaMh39bz+SOZjBQ6Kc=;
 b=S4tqMiheo4V8Vw/iaSmPmN6sg6geXCUEHyDF4aKW+Eg4xeT8A3HcNs78XRm9Da3t7S
 ypGK9ijUBKu7bTlwKs5cz/wyRATP0DPZKFzEYoXutkgL0UlBSbsTXiqcWdMXRb0u+Yoi
 55qe+twHycIkZ6NEevlmdXVCt3BpDDEps8+FE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rr/wvG6tsAkowg+Whc/ull1BkHaMh39bz+SOZjBQ6Kc=;
 b=TRKooGXoi98Rd/Fvoch0lzmYTPV439/Q02+ZwTpHJGcHTXMrYdT9IVFrZWzAE17rPp
 G2/uxtWMiHX6UL4vImx9PNLg1mOUxOCTsG84NdDMCbGa/2YEbMoEjgnlSTVDfyRyn6mh
 FQf8WqNAQAanPludf25hRBroA8x5Chmli7qkAAlFXm6X8Rm5UTvLImJlnFzGO41wejzd
 JnvjkxydMPT1sz7oTr6qi0zkesC+DTny3ucvFgul3GLP6H93XtZlBdyKgZUNfjfzA84i
 nem+eVtAUmezsttLQkN8ZboB8HtDVzo4NbkHGf2jHLbF4M+SkbBMNN5O6B8qE+GR9QuV
 TO+g==
X-Gm-Message-State: AOAM533ziHzNF2V0j6zgMRCoxKs3cpgBIRyhC7wV3UdXkRpFRHf3Tmcp
 UQcPKmZlOPNZXAfCvchA0CpTQ5QG01aM3cFsgHNmw2DKQgk=
X-Google-Smtp-Source: ABdhPJxVPM1yYvGmQ1ECLS6jJDku0KOMWgFzmtPg4u5E4NXFntG8nmzlxzdGitMXMBdbbjCXqq3BSbLpBltm+kzR6v4=
X-Received: by 2002:aa7:db89:: with SMTP id u9mr3065265edt.267.1598915915924; 
 Mon, 31 Aug 2020 16:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200831190130.47060-1-eajames@linux.ibm.com>
 <20200831190130.47060-5-eajames@linux.ibm.com>
In-Reply-To: <20200831190130.47060-5-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 31 Aug 2020 23:18:23 +0000
Message-ID: <CACPK8XercnXwek9jjoAO2Q6+wBcch0H_c=ctn+O5_0PsYuYqvQ@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 4/5] ARM: dts: Aspeed:
 Tacoma and Rainier: Add eMMC nodes and parameters
To: Eddie James <eajames@linux.ibm.com>, Andrew Jeffery <andrew@aj.id.au>
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

On Mon, 31 Aug 2020 at 19:01, Eddie James <eajames@linux.ibm.com> wrote:
>
> Add the necessary eMMC/SDHC nodes and information to use the eMMC
> from SPL and U-Boot.

I assume these are the same values we use in the kernel?

>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  arch/arm/dts/ast2600-rainier.dts | 8 ++++++++
>  arch/arm/dts/ast2600-tacoma.dts  | 8 ++++++++
>  2 files changed, 16 insertions(+)
>
> diff --git a/arch/arm/dts/ast2600-rainier.dts b/arch/arm/dts/ast2600-rainier.dts
> index ce530eb92b..67e177baf1 100644
> --- a/arch/arm/dts/ast2600-rainier.dts
> +++ b/arch/arm/dts/ast2600-rainier.dts
> @@ -18,6 +18,7 @@
>         };
>
>         aliases {
> +               mmc0 = &emmc_slot0;
>                 spi0 = &fmc;
>                 spi1 = &spi1;
>         };
> @@ -89,9 +90,16 @@
>         };
>  };
>
> +&emmc {
> +       u-boot,dm-pre-reloc;
> +       timing-phase = <0x700ff>;
> +};
> +
>  &emmc_slot0 {
> +       u-boot,dm-pre-reloc;
>         status = "okay";
>         bus-width = <4>;
>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_emmc_default>;
> +       sdhci-drive-type = <1>;
>  };
> diff --git a/arch/arm/dts/ast2600-tacoma.dts b/arch/arm/dts/ast2600-tacoma.dts
> index 22b9f39fa2..85d1e3902b 100644
> --- a/arch/arm/dts/ast2600-tacoma.dts
> +++ b/arch/arm/dts/ast2600-tacoma.dts
> @@ -18,6 +18,7 @@
>         };
>
>         aliases {
> +               mmc0 = &emmc_slot0;
>                 spi0 = &fmc;
>                 spi1 = &spi1;
>         };
> @@ -80,9 +81,16 @@
>         };
>  };
>
> +&emmc {
> +       u-boot,dm-pre-reloc;
> +       timing-phase = <0x700ff>;
> +};
> +
>  &emmc_slot0 {
> +       u-boot,dm-pre-reloc;
>         status = "okay";
>         bus-width = <4>;
>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_emmc_default>;
> +       sdhci-drive-type = <1>;
>  };
> --
> 2.26.2
>
