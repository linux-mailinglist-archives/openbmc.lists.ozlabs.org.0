Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 636C0523E39
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 22:01:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kz5Q01nh3z3c8T
	for <lists+openbmc@lfdr.de>; Thu, 12 May 2022 06:01:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=XuUTSpMH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=XuUTSpMH; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kz5Pc22NZz3bph
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 06:00:51 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id AEDD556;
 Wed, 11 May 2022 13:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1652299248;
 bh=Z19ClNacvQA5kj6yq2qdXnIuVhqmL0cfPfY1JsQHwiQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XuUTSpMHElNQ3nVbCjQRjD6Im4+YV4QIGASJR/oYbmiy54taZgvRmDYrIBf4NbUbI
 IiNZsRl2r4Y2PGkJCkwzpH4hiOwYM/BPyvqlvN8BoP1KYxWsq5wEQCODlPjO8jprZ6
 GuDQhlxYzP39B+xJbOzs8BwMm16Kde45eG2sYI7Y=
Date: Wed, 11 May 2022 13:00:45 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast2400: add
 support for RGMII2
Message-ID: <YnwV7bBcJodKsFSV@hatter.bewilderbeest.net>
References: <20220414205950.26406-1-zev@bewilderbeest.net>
 <CACPK8Xdhx8PZBw3WeP7UuBKA9XD-ATtPgYHnp=SM2-OPFFnThw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8Xdhx8PZBw3WeP7UuBKA9XD-ATtPgYHnp=SM2-OPFFnThw@mail.gmail.com>
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

On Tue, May 10, 2022 at 10:55:32PM PDT, Joel Stanley wrote:
> On Thu, 14 Apr 2022 at 21:00, Zev Weiss <zev@bewilderbeest.net> wrote:
> >
> > The bits configured by this pinctrl group are set to the same values
> > as their reset defaults, so RGMII2 functionality would likely work
> > anyway, but it seems good to make it explicit instead of relying on
> > that.
> >
> > Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> 
> This looks good. When reviewing I checked it against the datasheet,
> and I think it makes it clearer if we also add rgmii1:
> 
> --- a/drivers/pinctrl/aspeed/pinctrl_ast2400.c
> +++ b/drivers/pinctrl/aspeed/pinctrl_ast2400.c
> @@ -133,6 +133,10 @@ static struct aspeed_sig_desc rxd3_link[] = {
>         { 0x80, BIT(23), 0},
>  };
> 
> +static struct aspeed_sig_desc rgmii1_link[] = {
> +       { 0xa0, GENMASK(17, 12) | GENMASK(5, 0), 1 },
> +};
> +
>  static struct aspeed_sig_desc rgmii2_link[] = {
>         { 0xa0, GENMASK(23, 18) | GENMASK(11, 6), 1 },
>  };
> @@ -160,6 +164,7 @@ static const struct aspeed_group_config ast2400_groups[] = {
>         { "SPI1CS1", 1, spi1cs1_link},
>         { "TXD3", 1, txd3_link },
>         { "RXD3", 1, rxd3_link },
> +       { "RGMII1", 1, rgmii1_link },
>         { "RGMII2", 1, rgmii2_link },
>  };
> 
> Can you resend with that squashed in, if it looks correct to you?
> 

Sure, will do -- and yes, that aligns with my reading of the datasheet 
as well.


Thanks,
Zev

