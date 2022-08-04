Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A52B958963E
	for <lists+openbmc@lfdr.de>; Thu,  4 Aug 2022 04:43:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LytML3zswz2ywr
	for <lists+openbmc@lfdr.de>; Thu,  4 Aug 2022 12:43:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=LtOGRT5W;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=LtOGRT5W;
	dkim-atps=neutral
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LytLL61Grz305X
	for <openbmc@lists.ozlabs.org>; Thu,  4 Aug 2022 12:42:34 +1000 (AEST)
Received: by mail-wr1-x431.google.com with SMTP id j7so23647854wrh.3
        for <openbmc@lists.ozlabs.org>; Wed, 03 Aug 2022 19:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hlOW+Gk3VJkE+ZXV15EuXQxsCDDaJ896NcJGNGhHmgI=;
        b=LtOGRT5WMde2jqvBv/j/q1R3p5u3BslynYsTMovMyk4bdlHylKAO+6t115JMhQTioM
         J/HyCScgaH1fwi1J/jS0guxnXkd/dFRbDCNf+uHQMHsxmZfXa+pUlGwlRiPQXVIyGMI8
         eAFE2kN4p1lrQ3IozCL6hbzTaB/ilp4IZbgAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hlOW+Gk3VJkE+ZXV15EuXQxsCDDaJ896NcJGNGhHmgI=;
        b=k1Txf2/xuCCUtIj3A5o/3EuXSZBZHiQG6oYFd5oxlhjaRWj+5VW8PdN75LvXGkageP
         ZE8l4zrLO8eHBgTqIjXBPOfGKS+VPu6Oquxsu/npABA/TyviqhRynHb4fCaYK/8mGRQO
         vS/9O0qqi70UWqa5fw4OmMneokd8mahahfmMsxwJoQk5mTwl/4DzYU7qW/SE5KU4D84C
         ooz3TIS7VhGqVDHAFQm4y10uFYFRuvqYFramIxyoIfDltYQ3dOS+6tJH8qfqM6Y8Wy1b
         fsD94Ax7BZsAd0NRhr60OnBWH17zDpWxvjvOiAkrJPHvMnWC2qovGEiWfJ9f+a9PCt5d
         1H4g==
X-Gm-Message-State: ACgBeo3B4wRLfk0mpH2DhmePSitOtx5xoq6cD9QrAUkJVXGXT2TP2aBu
	BioO+dkLJEAbD4jt/u8PVpDliJdLrdBhmlWgyL8=
X-Google-Smtp-Source: AA6agR7ccG4yzvUtZaSR0th5KSrGO1aIhBuqoEuB4H0+i4BzKXqsBzkTna7qrUgcbpG/1eunodobYGf8bwGgSR8hilg=
X-Received: by 2002:a5d:5984:0:b0:220:5cb7:f772 with SMTP id
 n4-20020a5d5984000000b002205cb7f772mr12489408wri.3.1659580951016; Wed, 03 Aug
 2022 19:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220708142529.2727969-1-quic_jaehyoo@quicinc.com>
In-Reply-To: <20220708142529.2727969-1-quic_jaehyoo@quicinc.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 4 Aug 2022 02:42:18 +0000
Message-ID: <CACPK8XfLa=AhvB2Qv1TgB5eyOvX_=yomO=Cm6rXKSwApjNAxyA@mail.gmail.com>
Subject: Re: [PATCH dev-5.15] ARM: dts: aspeed: nuvia: rename vendor nuvia to qcom
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
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
Cc: openbmc@lists.ozlabs.org, Graeme Gregory <quic_ggregory@quicinc.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Arnd Bergmann <arnd@arndb.de>, Jamie Iles <quic_jiles@quicinc.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 8 Jul 2022 at 14:26, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>
> Nuvia has been acquired by Qualcomm and the vendor name 'nuvia' will
> not be used anymore so rename aspeed-bmc-nuvia-dc-scm.dts to
> aspeed-bmc-qcom-dc-scm-v1.dts and change 'nuvia' to 'qcom' as its vendor
> name in the file.
>
> Fixes: 7b46aa7c008d ("ARM: dts: aspeed: Add Nuvia DC-SCM BMC")
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Link: https://lore.kernel.org/r/20220523175640.60155-1-quic_jaehyoo@quicinc.com
> Link: https://lore.kernel.org/r/20220624070511.4070659-1-joel@jms.id.au'
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> It's a backporting patch from upstream. Please apply it as it's needed for
> making a bitbake machine target in OpenBMC yocto build.

Thanks, applied.

>
> Thanks,
> Jae
>
>  arch/arm/boot/dts/Makefile                                    | 2 +-
>  ...eed-bmc-nuvia-dc-scm.dts => aspeed-bmc-qcom-dc-scm-v1.dts} | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename arch/arm/boot/dts/{aspeed-bmc-nuvia-dc-scm.dts => aspeed-bmc-qcom-dc-scm-v1.dts} (97%)
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index dc225e354791..134cdcdec271 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1487,7 +1487,6 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         aspeed-bmc-lenovo-hr630.dtb \
>         aspeed-bmc-lenovo-hr855xg2.dtb \
>         aspeed-bmc-microsoft-olympus.dtb \
> -       aspeed-bmc-nuvia-dc-scm.dtb \
>         aspeed-bmc-opp-lanyang.dtb \
>         aspeed-bmc-opp-mihawk.dtb \
>         aspeed-bmc-opp-mowgli.dtb \
> @@ -1500,6 +1499,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         aspeed-bmc-opp-witherspoon.dtb \
>         aspeed-bmc-opp-zaius.dtb \
>         aspeed-bmc-portwell-neptune.dtb \
> +       aspeed-bmc-qcom-dc-scm-v1.dtb \
>         aspeed-bmc-quanta-q71l.dtb \
>         aspeed-bmc-quanta-s6q.dtb \
>         aspeed-bmc-supermicro-x11spi.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts b/arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dts
> similarity index 97%
> rename from arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts
> rename to arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dts
> index f4a97cfb0f23..259ef3f54c5c 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dts
> @@ -6,8 +6,8 @@
>  #include "aspeed-g6.dtsi"
>
>  / {
> -       model = "Nuvia DC-SCM BMC";
> -       compatible = "nuvia,dc-scm-bmc", "aspeed,ast2600";
> +       model = "Qualcomm DC-SCM V1 BMC";
> +       compatible = "qcom,dc-scm-v1-bmc", "aspeed,ast2600";
>
>         aliases {
>                 serial4 = &uart5;
> --
> 2.25.1
>
