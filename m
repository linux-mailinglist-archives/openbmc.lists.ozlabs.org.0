Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E9B9A66FE
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2024 13:49:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XXDB41yrVz3cDd
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2024 22:49:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729511369;
	cv=none; b=T9+JJCXmT20jABXepsk0luA7voj09xWKt1tjN71R41SBEROmCh+w77h3AIWnIZGnGKNGWD3TfL4GSVTPACR8mLXi9qrmoD4s+2dXWaTn3oZLZAvLzgEUDqg3kqhWz8dtYqL1V4ukjK3NJLYkIx7QWdJpoYauqOMmyxocseETz2dGFZMquZjkHIJ7BQ/86BVkHLwZS6+GVUJ/f57VfJUvPFc9dq5FrjFelITpqM3WZV8qA+YqH3qnjBrdGNt4+Me+6nksnR2U747XyfJmqS95FE22ibE5qOJuPiFzCVTGoArla5H8siYZb47p+oKrBCZ4bhHwsjoJuQPYFxVJP0DgoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729511369; c=relaxed/relaxed;
	bh=ynpv70LgynLfXwRzZBGijnfOVKcOlHyDivF6n67p/a0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VgthX7vJQ9Eg1qqqXvgJT+MavNC/BttkQmBzoyuSKIs1OLDr2pAmdAQzyMvBkDNB8Rb/EtTLV/7MJPxZ0aHFO8sqdbg33F/zgJ3gmRLEdJktvL12qYRoCj/HKr+3wY9d6pI3dexb4jD25mtw1QMRp+xa1dx071OMHw2reKRmGBifIWndyjrzoM51KImU/WxC7dO0sElDIKxjcWysMc3JVCFIfuGGPQNClKuCUvh7Mi3ah5mC2DTFS7jOB4hFKIB/kyJuoJfpuaE8CDcjh9gWmFzq46R1u9pdtwF8/pxJVs2VkddBp1gRcCknBQ5t31TMVBloG6Gz0NtxW826Ak6SBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=X5U62lAj; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=X5U62lAj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XXD9z5Ndfz2xBb;
	Mon, 21 Oct 2024 22:49:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1729511366;
	bh=ynpv70LgynLfXwRzZBGijnfOVKcOlHyDivF6n67p/a0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=X5U62lAjpHb52sbnM+thpFoqHhHFqlG9am9kjKDaxlO+/ehGQolqSyXJOI3Az3xQI
	 sFWWxe+8i4h0FwU0H14eXpD2cpx4gX7SmSNe5c/S0VQzAs7T4p4WA1fLpCNQ2xww2d
	 M9DFsjeGwTH0ETddbtUE6qNxAzXvxchl2KFKk2LIjtBtKStHsQRB6QkQVHkOp/Nyf1
	 PBlXVBBjLqqr/h05iPP8lbAEKOJq8ese96ov4FOSUgLaTNgut+Ng5rYZUghs9fFgrd
	 +g1D4GOWbL3c8RCeNXOLwg7XhOTxGMGYiOg20RbxheS0+B/MgxkmirdJTcVClOTlRO
	 v369jtIGiTipA==
Received: from [192.168.68.112] (58-7-152-218.dyn.iinet.net.au [58.7.152.218])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E91DC684AD;
	Mon, 21 Oct 2024 19:49:22 +0800 (AWST)
Message-ID: <e06a0db538bf62d4aeb7352ecc81a3a679fb9eec.camel@codeconstruct.com.au>
Subject: Re: [PATCH] i2c: aspeed: Consider i2c reset for muti-master case
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tommy Huang <tommy_huang@aspeedtech.com>, brendanhiggins@google.com, 
	benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org
Date: Mon, 21 Oct 2024 22:19:22 +1030
In-Reply-To: <20241018034919.974025-1-tommy_huang@aspeedtech.com>
References: <20241018034919.974025-1-tommy_huang@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: BMC-SW@aspeedtech.com, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tommy,

On Fri, 2024-10-18 at 11:49 +0800, Tommy Huang wrote:
> In the original code, the device reset would not be triggered
> when the driver is set to multi-master and bus is free.

That's not how I read the existing code. As it stands, if it's multi-
master and busy we do the recovery, however, if it's multi-master and
free, or busy but not multi-master, or free and not multi-master, then
we do the reset.

> It needs to be considered with multi-master condition.

Is there a specific circumstance you've found that's problematic? Can
you provide some more details about that scenario?

>=20
> Fixes: <f327c686d3ba> ("i2c: aspeed: Reset the i2c controller when timeou=
t occurs")
>=20
> Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-asp=
eed.c
> index cc5a26637fd5..7639ae3ace67 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -716,14 +716,15 @@ static int aspeed_i2c_master_xfer(struct i2c_adapte=
r *adap,
>  	if (time_left =3D=3D 0) {
>  		/*
>  		 * In a multi-master setup, if a timeout occurs, attempt
> -		 * recovery. But if the bus is idle, we still need to reset the
> -		 * i2c controller to clear the remaining interrupts.
> +		 * recovery device. But if the bus is idle,
> +		 * we still need to reset the i2c controller to clear
> +		 * the remaining interrupts or reset device abnormal condition.
>  		 */
> -		if (bus->multi_master &&
> -		    (readl(bus->base + ASPEED_I2C_CMD_REG) &
> -		     ASPEED_I2CD_BUS_BUSY_STS))
> -			aspeed_i2c_recover_bus(bus);
> -		else
> +		if ((readl(bus->base + ASPEED_I2C_CMD_REG) &
> +			ASPEED_I2CD_BUS_BUSY_STS)){
> +			if (bus->multi_master)
> +				aspeed_i2c_recover_bus(bus);

The change doesn't seem match the commit message. In this case you've
punched a hole - if the bus is busy but _not_ multi-master, we neither
do the reset _nor_ the recovery.

Which is what you intended? The implementation? Or the prose
description?

Now, back to the implementation, punching this hole seems reasonable on
the surface, but I guess we need to keep in mind that time_left has
also expired...

> +		} else
>  			aspeed_i2c_reset(bus);
> =20
>  		/*

Andrew
