Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAF2338211
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 01:09:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxR5Y3gKkz3cP3
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 11:09:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=jzrHLKWP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729;
 helo=mail-qk1-x729.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=jzrHLKWP; dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxR5L0ZM9z2xZj
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 11:09:41 +1100 (AEDT)
Received: by mail-qk1-x729.google.com with SMTP id g185so22651034qkf.6
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 16:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YLm/Wb3MUpgpqVBBUFDpSyFmU6jHJcJ4y1L4uyLbsSY=;
 b=jzrHLKWPp6ECatJjKT4z//b9m+vOZYlYqJvjZTP4OGS/94kvHswEPMZSxFJW52u+aX
 35pwUc81lywHDw5l7jLvfszeZI8+YMOxzefg9+se5oH4NQlOjJCzLNYyyPEQ5klas7QX
 xYuB5jL/89x1DivTl0bq0hhD7IEQTF0us5e8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YLm/Wb3MUpgpqVBBUFDpSyFmU6jHJcJ4y1L4uyLbsSY=;
 b=tExWLiwF7eWTn3VOlHf5ibK9JYrpLN/T5lZ9Y5rWYRux1mXkmzDF3pmkPEDlpGqQeR
 n2ItLwDbsLFmlakfFtOfwSVJ1FBJR8ZnKC46RxtNt9Pdx2iHS0V2ZI/Hy7kBa+HOarNC
 /4IFBoTIp1y0bx0aIrUxJadmmVbb/HJ59+Pq70WAoQ4rATdangY/tagZRwqbOCTsKBtm
 QYa3DvilOljgjn3M3wjY01zkI/AExp4Zi70VabrohTxVw62jpvNyqQcIiFkPyyMmJdKJ
 uvviN0LAcKa0vvbMsrSEREy4yVq3qbvn68RbqiD40HFFaDz78TBzSsK09xqama12G/zd
 upRA==
X-Gm-Message-State: AOAM530E434yljQKuHf8YkzUr3DBAS3mVf9JzNfZSh+5XxR13WZeVgSl
 sgRcaJEVzpL3NRlmSTInbVN65GjqMsBeZQ8mq/8=
X-Google-Smtp-Source: ABdhPJyyubhAOsyqm5/cCFszkRJhX5s+HJYNcfSvWetvBu3tMaDOp5QuihbXES/w220JmlgBuV+icMeLFRkHfcFc6yM=
X-Received: by 2002:a05:620a:24cd:: with SMTP id
 m13mr10433797qkn.273.1615507778430; 
 Thu, 11 Mar 2021 16:09:38 -0800 (PST)
MIME-Version: 1.0
References: <20210308225419.46530-1-eajames@linux.ibm.com>
 <20210308225419.46530-7-eajames@linux.ibm.com>
In-Reply-To: <20210308225419.46530-7-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Mar 2021 00:09:26 +0000
Message-ID: <CACPK8Xc9XqM3UtpF0xywFwfj8anXWE1-TvbHCQskogrBBF_ZCQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.10 06/35] ARM: dts: aspeed: rainier: Add leds
 that are off PCA9552
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

On Mon, 8 Mar 2021 at 22:54, Eddie James <eajames@linux.ibm.com> wrote:
>
> From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
>
> These LEDs are on the fans and are connected via a
> pca9551 i2c expander

This change doesn't make sense. The pca9551 is an i2c LED expander, so
we don't need to expose the pins as GPIOs and then attach a gpio-leds
driver to them. We should instead simply configure the pca955x driver
to drive the LEDs as LEDs.

>
> Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 41 ++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 6684485a2db0..514a14d3f914 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -263,6 +263,47 @@ fan5-presence {
>                         linux,code = <11>;
>                 };
>         };
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               fan0 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca0 0 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               fan1 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca0 1 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               fan2 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca0 2 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               fan3 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca0 3 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               fan4 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca0 4 GPIO_ACTIVE_LOW>;
> +               };
> +
> +               fan5 {
> +                       retain-state-shutdown;
> +                       default-state = "keep";
> +                       gpios = <&pca0 5 GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +
>  };
>
>  &ehci1 {
> --
> 2.27.0
>
