Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 122E8522BF0
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 07:56:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kykg26Y6Qz3c1K
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 15:56:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=bABZhbC7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32c;
 helo=mail-wm1-x32c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=bABZhbC7; dkim-atps=neutral
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kykfc5WzJz3bhR
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2022 15:55:50 +1000 (AEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 k126-20020a1ca184000000b003943fd07180so567946wme.3
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 22:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bg/FieHR6lJpbfjpRxqOkWs5k42ETVw5AAxpu86TOEc=;
 b=bABZhbC7FQO+8LfGOoy/zpQdca2oTUc7oGjPwRKmTI8NXw+PsmMJ1ZLU0esaEZOzlq
 PPMl9uqQIsQk6t8ey0zVZS8pzYytbydTvZAxkJeCgVnvQVycZ01DQGG3nA28V/I0W++6
 Av7sh3QNkJS4vywqAON/F2t20U1uCY+ROKA50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bg/FieHR6lJpbfjpRxqOkWs5k42ETVw5AAxpu86TOEc=;
 b=uPU7htut8M9cY55yqDRv1ZYJ8T6TwzxgRUu60V7IsymsHMoLqVcPwjTyamceoUCI7+
 QQ0Vpi8IvnjW1qkqDtmvnEg7G+65xQBim0f0QZhwY1blN3MgGTKHeZCVR+2TagNYspBk
 k+sgwO+pWDrQwmWEcUQDDNr3f/AtUN5d6Qbbg8glIC3mzQRYniiEZzoy7edI/GsdgiRE
 VZecOmDFWKbHCEHwmGNGEIYCQOFCgwNFgAO0rTuCB4DOiOicd1KlppB6JiUrjWxzUVQ3
 wWdCzjMReNaBs7pnjv2moR6gva0JzfMioOiPs0mMnOz2bcK8kNCOeAPlYaceL76k3yVG
 sgnQ==
X-Gm-Message-State: AOAM530RGGdZR6YtJJxYgaluz89vAkmvxXYIFsxEDa7/WDq0nH27mgoT
 B6NRSwa+ulgOy7wTZNEgUyf3t0b493CADk7YHmI=
X-Google-Smtp-Source: ABdhPJx2tTk6HMF4hWV0HWPyjaGPTGJ/yb49Oxz4OeBvjJZc/OkAmnE759nEK+Ksf+vAynHRSgr+t7UqMYCDuRbxXkM=
X-Received: by 2002:a7b:cd82:0:b0:389:77ef:66d7 with SMTP id
 y2-20020a7bcd82000000b0038977ef66d7mr2916990wmj.171.1652248544571; Tue, 10
 May 2022 22:55:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220414205950.26406-1-zev@bewilderbeest.net>
In-Reply-To: <20220414205950.26406-1-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 May 2022 05:55:32 +0000
Message-ID: <CACPK8Xdhx8PZBw3WeP7UuBKA9XD-ATtPgYHnp=SM2-OPFFnThw@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast2400: add
 support for RGMII2
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

On Thu, 14 Apr 2022 at 21:00, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> The bits configured by this pinctrl group are set to the same values
> as their reset defaults, so RGMII2 functionality would likely work
> anyway, but it seems good to make it explicit instead of relying on
> that.
>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

This looks good. When reviewing I checked it against the datasheet,
and I think it makes it clearer if we also add rgmii1:

--- a/drivers/pinctrl/aspeed/pinctrl_ast2400.c
+++ b/drivers/pinctrl/aspeed/pinctrl_ast2400.c
@@ -133,6 +133,10 @@ static struct aspeed_sig_desc rxd3_link[] = {
        { 0x80, BIT(23), 0},
 };

+static struct aspeed_sig_desc rgmii1_link[] = {
+       { 0xa0, GENMASK(17, 12) | GENMASK(5, 0), 1 },
+};
+
 static struct aspeed_sig_desc rgmii2_link[] = {
        { 0xa0, GENMASK(23, 18) | GENMASK(11, 6), 1 },
 };
@@ -160,6 +164,7 @@ static const struct aspeed_group_config ast2400_groups[] = {
        { "SPI1CS1", 1, spi1cs1_link},
        { "TXD3", 1, txd3_link },
        { "RXD3", 1, rxd3_link },
+       { "RGMII1", 1, rgmii1_link },
        { "RGMII2", 1, rgmii2_link },
 };

Can you resend with that squashed in, if it looks correct to you?


> ---
>  drivers/pinctrl/aspeed/pinctrl_ast2400.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl_ast2400.c b/drivers/pinctrl/aspeed/pinctrl_ast2400.c
> index a8a5ff517108..debe6b83d553 100644
> --- a/drivers/pinctrl/aspeed/pinctrl_ast2400.c
> +++ b/drivers/pinctrl/aspeed/pinctrl_ast2400.c
> @@ -133,6 +133,10 @@ static struct aspeed_sig_desc rxd3_link[] = {
>         { 0x80, BIT(23), 0},
>  };
>
> +static struct aspeed_sig_desc rgmii2_link[] = {
> +       { 0xa0, GENMASK(23, 18) | GENMASK(11, 6), 1 },
> +};
> +
>  static const struct aspeed_group_config ast2400_groups[] = {
>         { "MAC1LINK", 1, mac1_link },
>         { "MAC2LINK", 1, mac2_link },
> @@ -156,6 +160,7 @@ static const struct aspeed_group_config ast2400_groups[] = {
>         { "SPI1CS1", 1, spi1cs1_link},
>         { "TXD3", 1, txd3_link },
>         { "RXD3", 1, rxd3_link },
> +       { "RGMII2", 1, rgmii2_link },
>  };
>
>  static int ast2400_pinctrl_get_groups_count(struct udevice *dev)
> --
> 2.35.1
>
