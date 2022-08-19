Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 695EC5991DC
	for <lists+openbmc@lfdr.de>; Fri, 19 Aug 2022 02:41:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M82xW5tzGz3bZg
	for <lists+openbmc@lfdr.de>; Fri, 19 Aug 2022 10:41:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=e3KNLBFM;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=g19ZwDjp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=e3KNLBFM;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=g19ZwDjp;
	dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M82wy3hDPz3bXY;
	Fri, 19 Aug 2022 10:40:50 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id E8BF05C004F;
	Thu, 18 Aug 2022 20:40:45 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Thu, 18 Aug 2022 20:40:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660869645; x=1660956045; bh=hKTkgJE0Em
	hoc0KV5we9aVtrEb2/1qqim2MoVzcgNlc=; b=e3KNLBFMzdrV5ln0JmwiYxzfz0
	ApOZ4LAZ6OWcQk/D+QdrOpuNR2Z+Cooc2WqCGSLwNDD8kxrvhsdv5xAz4PllADPC
	wM6bTRb+kNxC7J7An7JBHEsOD5aUBKajKWSe/tJeXk8F+vXQKvYaV+qSWudkKtQB
	Q9VoBK7PfLv/WfaJWqZTQDIl7nUIlViLzphq0/jmIVVoYN6yFed+b2uQFr0gar41
	hSDHIo1PE3gnt79Rsud/cSN8b/8WwL0DCljxyllGd7UGRWnJ3XZyFrRnvXdIUmJU
	KCigc3NSBFzhvoNTUBN7VQSrEIBaYzFYWsKPXUzOsUqvn+sLQoN55pqT2U1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660869645; x=1660956045; bh=hKTkgJE0Emhoc0KV5we9aVtrEb2/
	1qqim2MoVzcgNlc=; b=g19ZwDjpwZXpIHfXWknm8aq9Hj+TwAhKOOiHU/lR7CtG
	zAEvnj5oKFXct5/wpjL/FiZPv6q46oVM7/prf7W8p1Wwy2fmqFeieBUa9jSvphSc
	Droaj3pzFKl12Ay1WcP7qlerWvyXOh9jYxQUweCHCIX7r7wuR48C5GLdHbZVLscL
	EyRY+pi+2uGSmNhPa0iq7XszAJlpAr15KqMbT3oaud5QyeTcz1qLtnYYbdIzZcK5
	9xo/o7zEXKLfEtq+8USRydVqJYNkhQVMWVtk7HtAhEU6rvWIETVEEp1aj7BrmH/t
	TZIBLFNm25TNfX7gf1Sk9iizXtFwqnZE43WTAGsfJw==
X-ME-Sender: <xms:Ddz-Ys0-ONHJpseK2y0wnQGeqI2jaAv3nWrptauIQCqO0bZ8U0sVMQ>
    <xme:Ddz-YnEHUZCf2-AnEkql-bV7c-2yTxliygidanxhd5eLaitoi2bq8-eD4makMZNwm
    _eJPWaJqtZPBebOnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeitddgfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:Ddz-Yk4JvBCnbiGqQKoR1Dzu1dkvJJtUQJYdU6wADRjzzoQErJ1CSg>
    <xmx:Ddz-Yl12N43ZaVw5U-tfGvS2THFrChJL4Z7w-GJk_xKyBYsApQWAyg>
    <xmx:Ddz-YvG39PTDjnc58Umc1jsk_ANIC2uV5JV1Sj5XKtpPC32Eo7Sz2Q>
    <xmx:Ddz-YgOpuE2nfaNANOws3Bi_Zgn2IMZoryaLn1FSe_nZAMA9avIn7Q>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 03D201700082; Thu, 18 Aug 2022 20:40:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <6845561a-cb33-4939-a760-2a5722134851@www.fastmail.com>
In-Reply-To: <20220818101839.28860-1-billy_tsai@aspeedtech.com>
References: <20220818101839.28860-1-billy_tsai@aspeedtech.com>
Date: Fri, 19 Aug 2022 10:10:23 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Billy Tsai" <billy_tsai@aspeedtech.com>,
 "Linus Walleij" <linus.walleij@linaro.org>, "Joel Stanley" <joel@jms.id.au>,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: aspeed: Force to disable the function's signal
Content-Type: text/plain
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Billy,

On Thu, 18 Aug 2022, at 19:48, Billy Tsai wrote:
> When the driver want to disable the signal of the function, it doesn't
> need to query the state of the mux function's signal on a pin. The
> condition below will miss the disable of the signal:
> Ball | Default | P0 Signal | P0 Expression               | Other
> -----+---------+-----------+-----------------------------+----------
>  E21   GPIOG0    SD2CLK      SCU4B4[16]=1 & SCU450[1]=1    GPIOG0
> -----+---------+-----------+-----------------------------+----------
>  B22   GPIOG1    SD2CMD      SCU4B4[17]=1 & SCU450[1]=1    GPIOG1
> -----+---------+-----------+-----------------------------+----------
> Assume the register status like below:
> SCU4B4[16] == 1 & SCU4B4[17] == 1 & SCU450[1]==1
> After the driver set the Ball E21 to the GPIOG0:
> SCU4B4[16] == 0 & SCU4B4[17] == 1 & SCU450[1]==0
> When the driver want to set the Ball B22 to the GPIOG1, the condition of
> the SD2CMD will be false causing SCU4B4[17] not to be cleared.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c 
> b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> index 83d47ff1cea8..a30912a92f05 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
> @@ -92,19 +92,10 @@ static int aspeed_sig_expr_enable(struct 
> aspeed_pinmux_data *ctx,
>  static int aspeed_sig_expr_disable(struct aspeed_pinmux_data *ctx,
>  				   const struct aspeed_sig_expr *expr)
>  {
> -	int ret;
> -
>  	pr_debug("Disabling signal %s for %s\n", expr->signal,
>  		 expr->function);
> 
> -	ret = aspeed_sig_expr_eval(ctx, expr, true);
> -	if (ret < 0)
> -		return ret;
> -
> -	if (ret)
> -		return aspeed_sig_expr_set(ctx, expr, false);
> -
> -	return 0;
> +	return aspeed_sig_expr_set(ctx, expr, false);

Okay, maybe I was short-circuiting things in a way that wasn't quite 
right. However, I'm a little nervous that we'll end up whacking state 
that we can't restore and give ourselves mux-request ordering problems. 
The Aspeed pin controllers are such a complex sea of state. Hopefully 
we get away without needing to fix the theory behind the driver's 
implementation.

This code is common to the 2400, 2500 and 2600, have you tested the 
patch on platforms for each to get coverage for the various pin state 
expressions we have?

I also wonder if we can write kunit tests to build some confidence with 
the expected SCU bit state patterns for a given set of desired mux 
states. Is this something you've looked at (it would be handy if kunit 
can intercept regmap accesses)?

Andrew
