Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF74524469
	for <lists+openbmc@lfdr.de>; Thu, 12 May 2022 06:40:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzJxZ48zNz3cLC
	for <lists+openbmc@lfdr.de>; Thu, 12 May 2022 14:40:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Ou3cMOX5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42c;
 helo=mail-wr1-x42c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Ou3cMOX5; dkim-atps=neutral
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzJxB2Jknz3br4
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 14:40:30 +1000 (AEST)
Received: by mail-wr1-x42c.google.com with SMTP id u3so5536220wrg.3
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2022 21:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l+55EIeQtv6X2urGQi6YJuOcykmtU96i3Z2Yqy/K8GQ=;
 b=Ou3cMOX5ctVNOAjmYbSh4cXtVBSBY4YeoFhkTciv27uzh0LwgmMUiFJqamwXfEdGkJ
 qQOCdwQLVw7HFcL57vE0gWuoAYR3VB/C6VmiEIFLl3lBQDfoWrzXiZnxHkXlu+9n+TPv
 /u2+X++3J6wadzAP99X7kaRoOn1/j6nYtU0mE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l+55EIeQtv6X2urGQi6YJuOcykmtU96i3Z2Yqy/K8GQ=;
 b=U++lhcH48Do6J4bj/0rYN27mJ+hoyjsDPHknLEho5Ot5z+i9wjaLOsvwudWm5+uj4g
 B2GMniR3I/zw0y86OWqrY4Q2oIvIgLK4NyObKU2ZAvEelpGb3OFIBZ6GhsKPBPtDtUfA
 Qe11065op2u/+DKE5+iES8T5nTTFkkUITPaMiE/3ZDW/gXh+F6q1MPP86eqrtOO/VlB1
 1lD630yOkASVO7RM1VD789kqLO3GJMziCnfsHqExcEEnqobjY8Sv/ogRwNSAP+aYS7hC
 XQQhg1aR0j4xkO0vlVM9GGq9Ifw2F1Wyg9w/+ROiyAibjvUBuiqTqR/IciFF5O5XE8Bm
 dBIw==
X-Gm-Message-State: AOAM532BcBOaNSr+bB0ShCNf2/X+EtGWuk3buDnH5j+LMaMJxWvrThun
 TvxvcwCribxGrd27iqAH/AvHQrFg1fL4aXYnUqQ=
X-Google-Smtp-Source: ABdhPJxeli847hMwHHiZNCFHoLgMSDLNx3O2BKAJh4B2gDFUwr1n1/J/BFrKqNGCl9CMxgDsA7QyFC3wIWWCGm0sBjg=
X-Received: by 2002:a5d:6d04:0:b0:20c:52de:9ce4 with SMTP id
 e4-20020a5d6d04000000b0020c52de9ce4mr27169102wrq.572.1652330426901; Wed, 11
 May 2022 21:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220511220542.4394-1-zev@bewilderbeest.net>
In-Reply-To: <20220511220542.4394-1-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 12 May 2022 04:40:15 +0000
Message-ID: <CACPK8XdYMzsEQXHYwdx7si9SBUhD9xeB+0D2eGgoR-LKosq4Tg@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2] ARM: dts: aspeed: add
 Delta AHE-50DC BMC
To: Zev Weiss <zev@bewilderbeest.net>
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
 Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 11 May 2022 at 22:05, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> The Delta AHE-50DC Open19 power shelf uses a pair of AST1250 BMCs that
> are mostly compatible with the existing ast2400-evb device tree, with
> a couple small tweaks for the serial console UART and ethernet MACs.
>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>
> Changes since v1 [0]:
>  - Disabled spi1, which this system doesn't use [Joel]

Thanks, applied.

>
> [0] https://lore.kernel.org/openbmc/20220414210045.26480-1-zev@bewilderbeest.net/
>
>  arch/arm/dts/Makefile             |  1 +
>  arch/arm/dts/ast2400-ahe-50dc.dts | 38 +++++++++++++++++++++++++++++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 arch/arm/dts/ast2400-ahe-50dc.dts
>
> diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
> index a79f885f54fb..3515100c65ce 100755
> --- a/arch/arm/dts/Makefile
> +++ b/arch/arm/dts/Makefile
> @@ -676,6 +676,7 @@ dtb-$(CONFIG_ARCH_BCM6858) += \
>
>  dtb-$(CONFIG_ARCH_ASPEED) += \
>         ast2400-evb.dtb \
> +       ast2400-ahe-50dc.dtb \
>         ast2500-evb.dtb \
>         ast2600a0-evb.dtb \
>         ast2600a1-evb.dtb \
> diff --git a/arch/arm/dts/ast2400-ahe-50dc.dts b/arch/arm/dts/ast2400-ahe-50dc.dts
> new file mode 100644
> index 000000000000..d5e6f1989586
> --- /dev/null
> +++ b/arch/arm/dts/ast2400-ahe-50dc.dts
> @@ -0,0 +1,38 @@
> +/dts-v1/;
> +
> +#include "ast2400-evb.dts"
> +
> +/ {
> +       model = "Delta AHE-50DC BMC";
> +       compatible = "delta,ahe-50dc-bmc", "aspeed,ast2400-evb", "aspeed,ast2400";
> +
> +       chosen {
> +               stdout-path = &uart3;
> +       };
> +};
> +
> +&uart5 {
> +       status = "disabled";
> +};
> +
> +&uart3 {
> +       u-boot,dm-pre-reloc;
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_txd3_default &pinctrl_rxd3_default>;
> +};
> +
> +&mac0 {
> +       status = "disabled";
> +};
> +
> +&mac1 {
> +       status = "okay";
> +       phy-mode = "rgmii";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
> +};
> +
> +&spi1 {
> +       status = "disabled";
> +};
> --
> 2.35.3
>
