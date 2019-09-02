Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB26A4D00
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 03:05:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MBht0Z8mzDqBX
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 11:05:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="hJbE3szB"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MB402D2WzDqZx
 for <openbmc@lists.ozlabs.org>; Mon,  2 Sep 2019 10:37:03 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id a13so14028434qtj.1
 for <openbmc@lists.ozlabs.org>; Sun, 01 Sep 2019 17:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g3FlrTlj1uFzJWk2nR61QZ5LAdvEpAttSOes6HRka6Y=;
 b=hJbE3szBWXoOcUkOKmu2KTO/DrJl5/78GIuzkKE8fuEDPlaec8lQnYfwoI2swSfU5Z
 pSPrUoogSvsufT06FgZOlnRJDTjoNG8xjVRxXi0ExsAny8POCFJW/Or7uDpHEzv+YLJD
 hKdkyvZhh8JOGN2js3DS493AI8O9H0adSc984=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g3FlrTlj1uFzJWk2nR61QZ5LAdvEpAttSOes6HRka6Y=;
 b=FT/LhTeq1rWigqqtktRMBmSjPvIeLWkwnw9k7EE2ecYt9kYOEG8NFbf427huTOxxVT
 ve/AX7w+gXXgjZVQV2RQ2bIEqN6t0AfZKH/RlcYrWAyN5qAhwU1eLcURVptMf/Pnuz7R
 +BA4zirvAXI/82DBJlMDYsJGBZ4n2dxMb1hGxf0rORxll1gWOZDAtiL8RQ5nq0Rbfn+t
 RAfZfr/RInIe6lwbCGO50IESvT23ULzbULzdA1I+jwBPbB+9znU3tjTx1HPMaH+Q9ZMG
 soUkXK/8KaikeyKEuhkl9x3kpIEWo1L1inymdvfar74RMXLw7F9XAfq/c3xjf0/faSKN
 6Tow==
X-Gm-Message-State: APjAAAWbnwtvUMHW356qQF/IsFC3TUHFVWW1svHhCybYE92tG6WPwJoL
 Wbpd128grQAqVfYvzbgm1NkuZXmf8klOZnzAjp8wMKVD
X-Google-Smtp-Source: APXvYqwEsXomI8HEwJZZwo4+kJ3/Knjv3al7ZxqRLb0e3NOGst4dZUhMAsFNX5YEVb9Gw4dylSZ+t0jOZ8WlhBGACGQ=
X-Received: by 2002:ac8:24b4:: with SMTP id s49mr26225308qts.255.1567384620032; 
 Sun, 01 Sep 2019 17:37:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190830090244.13566-1-andrew@aj.id.au>
 <20190830090244.13566-6-andrew@aj.id.au>
In-Reply-To: <20190830090244.13566-6-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 2 Sep 2019 00:36:48 +0000
Message-ID: <CACPK8Xe7nP0zs084ns5Zknih00C2UXTP+vyA2ncdN-L7qOdSxA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.2 5/5] ARM: dts: ast2600-evb: eMMC
 configuration
To: Andrew Jeffery <andrew@aj.id.au>
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

On Fri, 30 Aug 2019 at 09:02, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Enable the eMMC controller and limit it to 52MHz to avoid the host
> controller reporting error conditions.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Naming is hard :/

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-ast2600-evb.dts | 8 +++++++-
>  arch/arm/boot/dts/aspeed-g6.dtsi         | 4 ++--
>  2 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> index 2cb92d2a1041..9613cff2ce3a 100644
> --- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> @@ -39,8 +39,14 @@
>         phy-handle = <&ethphy1>;
>  };
>
> +&emmc_controller {
> +       status = "okay";
> +};
> +
>  &emmc {
> -       status = "disabled";
> +       non-removable;
> +       bus-width = <4>;
> +       max-frequency = <52000000>;
>  };
>
>  &fsim0 {
> diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
> index d0507f797981..12569e502678 100644
> --- a/arch/arm/boot/dts/aspeed-g6.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g6.dtsi
> @@ -235,7 +235,7 @@
>                                 };
>                         };
>
> -                       emmc: sdc@1e750000 {
> +                       emmc_controller: sdc@1e750000 {
>                                 compatible = "aspeed,ast2600-sd-controller";
>                                 reg = <0x1e750000 0x100>;
>                                 #address-cells = <1>;
> @@ -244,7 +244,7 @@
>                                 clocks = <&syscon ASPEED_CLK_GATE_EMMCCLK>;
>                                 status = "disabled";
>
> -                               sdhci@1e750100 {
> +                               emmc: sdhci@1e750100 {
>                                         compatible = "aspeed,ast2600-sdhci";
>                                         reg = <0x100 0x100>;
>                                         sdhci,auto-cmd12;
> --
> 2.20.1
>
