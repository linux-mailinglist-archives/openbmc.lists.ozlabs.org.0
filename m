Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C77A524466
	for <lists+openbmc@lfdr.de>; Thu, 12 May 2022 06:40:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzJwb0mhYz3bZg
	for <lists+openbmc@lfdr.de>; Thu, 12 May 2022 14:39:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=fxKyJElU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42e;
 helo=mail-wr1-x42e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=fxKyJElU; dkim-atps=neutral
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzJwD2sm5z2xsc
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 14:39:40 +1000 (AEST)
Received: by mail-wr1-x42e.google.com with SMTP id k2so5532050wrd.5
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2022 21:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Op/4Ba2UIbwX8SBRaZyQfIdIiCKYYWqBqvfJYbU0/oM=;
 b=fxKyJElU7yhSrYRBEjXEXkzc4xSZ8BOK9JLOb9SBKGD2aOPN7waow7hs5AxBiOS7Qw
 BVtM+cZDLvou09H6/Q5cohYJ3s+ZloMxsQlSfbUiFhnIHykccnwA1kvfwkEh4mJYNf7c
 iCNyMx3sPYRTJ45fTzFxf/qccbP/1fX0/9bmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Op/4Ba2UIbwX8SBRaZyQfIdIiCKYYWqBqvfJYbU0/oM=;
 b=AlkXXU5kOONvSz5yXOenTqvVvZrHXwi2+5QTe3GRs1XMWX3nKGZUMbY4ZwtFLy/eI5
 +/C7zxFpfJ7o/6kHCCjg4ZhUEeQLJu/HUZUmJptLZoMO8UvdxGpIk1K3JFms3RLx+v86
 DEec0jDrnxAbLuTzcCPB/GPw/+H5pucZa4utA730EBZcL0LouONh8/iei54vuSssvrLo
 Mlef6k03tMyLuBRojZl2FmB1KwWSLKCEN1jn12Dm/lEyrnuamWbrXGjT9Cwg/T7A+Zrd
 fD+4v43ggYKyfBfnADbxUULyfvQw5W4nLNOhRgk2EzSu/IQ0bF5+RDRweoI15SAeOGZj
 HGug==
X-Gm-Message-State: AOAM532DEgdLQe4yt+criykanvMV+NWGSQxewbzqbEiAHR6kYMTp4DkD
 QhF0LmNXuzZcYZJMOaDgPo5UYeSo8iLsU4pDe+o=
X-Google-Smtp-Source: ABdhPJw/slwC7o39j4asZbFhsD73Iw3wKC4a0w4mtEboOhXbwCTrZuMnxA3grIAOkKgFdK+rhssjcafNXcQissHcBps=
X-Received: by 2002:a5d:6ac4:0:b0:20a:dd04:81da with SMTP id
 u4-20020a5d6ac4000000b0020add0481damr24653813wrw.705.1652330374521; Wed, 11
 May 2022 21:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220511220452.4320-1-zev@bewilderbeest.net>
In-Reply-To: <20220511220452.4320-1-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 12 May 2022 04:39:22 +0000
Message-ID: <CACPK8Xc5DQDN=5ysbeyD0HDQ=W8u0vr9Qm8Kt78fkSwv5p06Ow@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2] pinctrl: ast2400: add
 support for RGMII1 and RGMII2
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
> The bits configured by these pinctrl groups are set to the same values
> as their reset defaults, so RGMII functionality would likely work
> anyway, but it seems good to make it explicit instead of relying on
> that.
>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>
> Changes since v1 [0]:
>  - Added RGMII1 group [Joel]

Thanks, applied.

>
> [0] https://lore.kernel.org/openbmc/20220414205950.26406-1-zev@bewilderbeest.net/
>
>  drivers/pinctrl/aspeed/pinctrl_ast2400.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl_ast2400.c b/drivers/pinctrl/aspeed/pinctrl_ast2400.c
> index a8a5ff517108..531e116c7967 100644
> --- a/drivers/pinctrl/aspeed/pinctrl_ast2400.c
> +++ b/drivers/pinctrl/aspeed/pinctrl_ast2400.c
> @@ -133,6 +133,14 @@ static struct aspeed_sig_desc rxd3_link[] = {
>         { 0x80, BIT(23), 0},
>  };
>
> +static struct aspeed_sig_desc rgmii1_link[] = {
> +       { 0xa0, GENMASK(17, 12) | GENMASK(5, 0), 1 },
> +};
> +
> +static struct aspeed_sig_desc rgmii2_link[] = {
> +       { 0xa0, GENMASK(23, 18) | GENMASK(11, 6), 1 },
> +};
> +
>  static const struct aspeed_group_config ast2400_groups[] = {
>         { "MAC1LINK", 1, mac1_link },
>         { "MAC2LINK", 1, mac2_link },
> @@ -156,6 +164,8 @@ static const struct aspeed_group_config ast2400_groups[] = {
>         { "SPI1CS1", 1, spi1cs1_link},
>         { "TXD3", 1, txd3_link },
>         { "RXD3", 1, rxd3_link },
> +       { "RGMII1", 1, rgmii1_link },
> +       { "RGMII2", 1, rgmii2_link },
>  };
>
>  static int ast2400_pinctrl_get_groups_count(struct udevice *dev)
> --
> 2.35.3
>
