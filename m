Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED81F2880C3
	for <lists+openbmc@lfdr.de>; Fri,  9 Oct 2020 05:41:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6v4h2SMqzDqV5
	for <lists+openbmc@lfdr.de>; Fri,  9 Oct 2020 14:41:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f41;
 helo=mail-qv1-xf41.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=BuIE3s6q; dkim-atps=neutral
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6v3s34N1zDqC6
 for <openbmc@lists.ozlabs.org>; Fri,  9 Oct 2020 14:40:39 +1100 (AEDT)
Received: by mail-qv1-xf41.google.com with SMTP id w5so4158657qvn.12
 for <openbmc@lists.ozlabs.org>; Thu, 08 Oct 2020 20:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4B9jSlW2wIOMdNxI+Pf/B5kq6tpO2JQctnikgZADqk4=;
 b=BuIE3s6qETDtoSgvQnHXixjjf9U3e+y0MB/5OhtswlTUFtLDylprxFlyVetEDzuZkI
 8AHqw9LIbpg9hOUx7jcSFshVUBV/WFRYGQ/CYDvhhEnZybUdxfKq+QC6T3PmaMY7mc7t
 CdwWnhMbs1k2a+Mn64WdMevF9KnHJWfjnX6Sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4B9jSlW2wIOMdNxI+Pf/B5kq6tpO2JQctnikgZADqk4=;
 b=jt/Bh1gPtyQicmc/5L5PV4aQu6lAHY6Du9LpWG16JPN98+F7KnTauxmn20rjAO6G2O
 S6bsVar3Y7Qbd4nMX/jWrG2T5H2VH47ABQxgLkM9BfIsN9s8nUx8SkYvcuqukzxnuKae
 HOghu5WVULn875o/PC98cVoeNYlPQaPWEQZgc1Kqm7Dzy1lKwQcwgnfiCgmBaP/GOOZd
 sxx6dJMUbLx5bAjpPTWn1xpRP79FXa4qO14Ga7GpxBfz3gz92HtjlobLbwQ5douVjiGo
 IMLVvODm6PrJ81kMlKATnB1N4VkW8D8emBalfNUcUBQv+2vLCgto5JzQSTKzfSQmbuTo
 WwOg==
X-Gm-Message-State: AOAM530lQRAvgu6LAEhYYXs1fYIMbh/DZTP0feXliZZisbk7/mQfdubo
 F5mkb5tk9Mdodn5Qf6XtAvElOburfRlnKQkogVdQE4rf
X-Google-Smtp-Source: ABdhPJxoMkJKHtvEz/IIXCoSF+3AmI8yeiT7WzAmg/bHKwgXxwzEweupsUu8+QWq3zslmQTB6iaXgUtOa8xo1Ab7/pk=
X-Received: by 2002:a05:6214:11e4:: with SMTP id
 e4mr10393440qvu.61.1602214834959; 
 Thu, 08 Oct 2020 20:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200928202753.58351-1-eajames@linux.ibm.com>
 <20200928202753.58351-2-eajames@linux.ibm.com>
In-Reply-To: <20200928202753.58351-2-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Oct 2020 03:40:22 +0000
Message-ID: <CACPK8XeBQTPKMxWM+-MAAXfmAPsNTCedRLG7f09u=MhaO+N_tQ@mail.gmail.com>
Subject: Re: [PATCH U-Boot v2019.04-aspeed-openbmc 1/3] ARM: dts: Aspeed:
 Tacoma and Rainier: Add eMMC nodes and parameters
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

On Mon, 28 Sep 2020 at 20:28, Eddie James <eajames@linux.ibm.com> wrote:
>
> Add the necessary eMMC/SDHC nodes and information to use the eMMC
> from SPL and U-Boot.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/dts/ast2600-rainier.dts | 8 ++++++++
>  arch/arm/dts/ast2600-tacoma.dts  | 8 ++++++++
>  2 files changed, 16 insertions(+)
>
> diff --git a/arch/arm/dts/ast2600-rainier.dts b/arch/arm/dts/ast2600-rainier.dts
> index ce530eb92b..67e177baf1 100755
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
> index 22b9f39fa2..85d1e3902b 100755
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
