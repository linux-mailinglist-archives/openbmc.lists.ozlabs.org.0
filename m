Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C4C68CE18
	for <lists+openbmc@lfdr.de>; Tue,  7 Feb 2023 05:17:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9qbq12F2z3bW2
	for <lists+openbmc@lfdr.de>; Tue,  7 Feb 2023 15:17:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=SYgVdsor;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=SYgVdsor;
	dkim-atps=neutral
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9qYx0xWJz3cFd
	for <openbmc@lists.ozlabs.org>; Tue,  7 Feb 2023 15:16:04 +1100 (AEDT)
Received: by mail-ej1-x62e.google.com with SMTP id jg8so422112ejc.6
        for <openbmc@lists.ozlabs.org>; Mon, 06 Feb 2023 20:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N6DQdm2Nde0DnOEuJU748FQKUfvOemS57+1I1yjw6WQ=;
        b=SYgVdsordHIwvN9IQBWNmBKLbt0vKuSU5KVNoKEjFf2MN5GdY6KrSOOqI6BSNuyTL5
         pD1J7KLbf004gZvA/jeZheVvWJXipDVZ33UC3wIXISusIKD2BEQ8hDjhk9HfJJIMuzUN
         hsDx/j9SXJkWcws1KNyPmFfpP/glbJhNFIdiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N6DQdm2Nde0DnOEuJU748FQKUfvOemS57+1I1yjw6WQ=;
        b=R8XYldGJeaJL0bLm18x25wsoWH4LR99ZQFZpk4rhVlq7kZpCtr8Us9C9xNHi6xCNMF
         gG7qEebHBP10hPPYZa+A9aSlUQAYsCCNG5Wz81IHlJaRBIs1myioWP5RxTY6u6W0rq1J
         suIY24F9Vja5EUhMFFZFeNwWkT7w1FQoMf5BubfAVnbmifC1MekFUqrTZ+zUcPZkTaHD
         Rmc685vuXaiViMSAgP6R6+4jY4IRgv4wa5rpCJL4AkjGRFlPVoQ0NSyHPrGbtPlgG1MU
         low9BF5IvjoxL/12obIbmbGjAjW7eJbXSD0YhNpl9wFg3EJE38IBMyKrPPG7LFcjTGkA
         vIbg==
X-Gm-Message-State: AO0yUKW+Y3gnEuV4cWJuPSXab94mbEFefXTSTkbeIN2dvAYlLrr+Ec6q
	Mxt9chmrzoSOHoz2tHq3+FbUo9n6iJAI4IvzvQ4=
X-Google-Smtp-Source: AK7set+yHpNr0Gq5XsWLPjeDCVyB00MsvwpMrPVeJW28xE9Wx1cR4/LN7bv1sxmycqNHSYjNqWJAlt5Xy/vMO/C9CRc=
X-Received: by 2002:a17:906:3013:b0:885:2313:c8b5 with SMTP id
 19-20020a170906301300b008852313c8b5mr495546ejz.201.1675743361600; Mon, 06 Feb
 2023 20:16:01 -0800 (PST)
MIME-Version: 1.0
References: <20230202152759.67069-1-eajames@linux.ibm.com>
In-Reply-To: <20230202152759.67069-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Feb 2023 04:15:49 +0000
Message-ID: <CACPK8XeTp79va280i8k3YTsXP8MZL4zr_EPdqckDjBB827Bwdg@mail.gmail.com>
Subject: Re: [PATCH linux dev-6.0] ARM: dts: aspeed: p10bmc: Update battery
 node name
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2 Feb 2023 at 15:28, Eddie James <eajames@linux.ibm.com> wrote:
>
> The ADC sensor for the battery needs to be named "iio-hwmon" for
> compatibility with user space applications.

Can you send this upstream too please?

>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
> index e2a9a18bda57..04f7dde6bcea 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
> @@ -122,7 +122,7 @@ fan1-presence {
>                 };
>         };
>
> -       iio-hwmon-battery {
> +       iio-hwmon {
>                 compatible = "iio-hwmon";
>                 io-channels = <&adc1 7>;
>         };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> index 1448ea895be4..8ad5fe9c2990 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
> @@ -244,7 +244,7 @@ led-pcieslot-power {
>                 };
>         };
>
> -       iio-hwmon-battery {
> +       iio-hwmon {
>                 compatible = "iio-hwmon";
>                 io-channels = <&adc1 7>;
>         };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 20ef958698ec..a3c55a0cc833 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -220,7 +220,7 @@ event-fan5-presence {
>                 };
>         };
>
> -       iio-hwmon-battery {
> +       iio-hwmon {
>                 compatible = "iio-hwmon";
>                 io-channels = <&adc1 7>;
>         };
> --
> 2.31.1
>
