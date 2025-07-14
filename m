Return-Path: <openbmc+bounces-338-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 874E7B04989
	for <lists+openbmc@lfdr.de>; Mon, 14 Jul 2025 23:30:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bgwTv4Z1kz3c00;
	Tue, 15 Jul 2025 07:30:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752528643;
	cv=none; b=e7XRrIlrCtKX+5x1fnvAmTZZFM/cF9c/Nt/CeDDMNK905f84c/3PWiKmWQYcAI1rY5AaNTgTLFm3RoqZ1pvr9UYln0WcRfIDhHfndsPaF3iawwfVp8UE0QYV6WABguTcGkO+Z3IhNn2PV3sJG+kPbvBKeiLOGXDNASO2dB7kyPxdrsyrOT0fe5OP/xPlvOLtX21FWTbf+Lsh0w+YWETGKq4iY4+wv4a0tGAX3NFnRlhBGibuHA3LZlkBVZ2whUpO8jXw/y3za/8cVKLhUVScHtPgxmFZjWwg4FcdS4glM5C0aRCaqD1ml9hPlNjfc9FsgNvCtzATP4hlcshRw9BnAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752528643; c=relaxed/relaxed;
	bh=LdQ7wO/JRGgWx4qUXQxXpyLZ2vVfBTl337MYXCiXXn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n+ngx8esgciz4MN7ncZvekuT+aPTfQywuOfIOC4tD8tqwz68jq/4Wzrb4FZIL2mfG6Va4NpAW+GwFe9P4vAQhK7V30vx5d1weNRKR+luScMuhOsPbcIG4rezNwiJVI+B2heKwzqd8ed1y3dLUXKNYG4knwrsw0XckYahgRv9LsJs34OIJdOcXlHO/h2qyG0I4dD61aYsFfZ9MsVBxyfJOZKO7CNab4p+bWWBoaU4KFNp7s8nGr2pj4OBkKYVgh+r6od8NI7Xy6Djkej+am3cvUSN8Mjc2bLPxF5+7fuk9qLWH6r2tpwEWyD0YB9eFugXGjOm1pFmAVxeIcxTTvWpBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fv8PUTR1; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fv8PUTR1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bgwTt3pRLz3bwX;
	Tue, 15 Jul 2025 07:30:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D7B71A573EF;
	Mon, 14 Jul 2025 21:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6178C4CEED;
	Mon, 14 Jul 2025 21:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752528637;
	bh=aVMDG6JzIpk4Eo+Pl5FCirxkYzovLZhgl/i7XFV8zEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fv8PUTR1NHH8rdlrIjssAdpWfw5mwtJ5DNRFbgoL21MHikLHTctDgj9m0l+s1TTfJ
	 3BVuVhpqRyhET2DfZzstugtlJYK+gTnoH0jlrdmr4aw+TXw8qUcvWxXdhdtzuVqADS
	 gAAIaJdjfQj8CBTI2HWzg77kqTUNtE3t2Jyq8cFjOcq1zWCXB3OFqr1/XpErYaA9xZ
	 iccXCBDDcU1nFwRBlALl/HO7lhlehm3BVg9R+f5dEVGTatn44j2PCIhstp2YGdFgtV
	 w5VUxZHUlkklM4rw6xqa4wDxGZEMEqYc9FFQL0F36x7Q4fhf63uOmQbpJGBi8jIXuU
	 7x4FxFWjww8SQ==
Date: Mon, 14 Jul 2025 23:30:33 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jian Zhang <zhangjian.3032@bytedance.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: aspeed: change debug level in irq handler
Message-ID: <bhgxk2qopxguthrismqwif4d7xiqals7kwqq2nxvioxr7wriib@b5ee654pfxnm>
References: <20250618102148.3085214-1-zhangjian.3032@bytedance.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250618102148.3085214-1-zhangjian.3032@bytedance.com>
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Jian,

On Wed, Jun 18, 2025 at 06:21:48PM +0800, Jian Zhang wrote:
> In interrupt context, using dev_err() can potentially cause latency
> or affect system responsiveness due to printing to console.
> 
> In our scenario, under certain conditions, i2c1 repeatedly printed
> "irq handled != irq. expected ..." around 20 times within 1 second.
> Each dev_err() log introduced approximately 10ms of blocking time,
> which delayed the handling of other interrupts — for example, i2c2.
> 
> At the time, i2c2 was performing a PMBus firmware upgrade. The
> target device on i2c2 was time-sensitive, and the upgrade protocol
> was non-retryable. As a result, the delay caused by frequent error
> logging led to a timeout and ultimately a failed firmware upgrade.
> 
> Frequent error printing in interrupt context can be dangerous,
> as it introduces latency and interferes with time-critical tasks.
> This patch changes the log level from dev_err() to dev_dbg() to
> reduce potential impact.

this change doesn't fix any issue. This might improve it in your
system because maybe your printing level does not include debug
messages. But if you increase the printing level you would
immediately fall into this same issue.

...

> @@ -665,7 +665,7 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>  
>  	irq_remaining &= ~irq_handled;
>  	if (irq_remaining)
> -		dev_err(bus->dev,
> +		dev_dbg(bus->dev,
>  			"irq handled != irq. expected 0x%08x, but was 0x%08x\n",
>  			irq_received, irq_handled);

I agree that this is excessive logging and in my opinion you can
completely remove this line. But what other error are you
hitting?

Andi

>  
> -- 
> 2.47.0
> 

