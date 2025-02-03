Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 511CAA251B9
	for <lists+openbmc@lfdr.de>; Mon,  3 Feb 2025 04:31:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YmX922156z3bXn
	for <lists+openbmc@lfdr.de>; Mon,  3 Feb 2025 14:31:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738553491;
	cv=none; b=jMKvnnJsYIjXTSHc55rcx3CSmkdEsSvBanUExNiwlJfd+5aurnMSlvQiZ5RXkOI3dt1Zfqjh4X60DaPseCMv6ZoDmQnZDursWIueELunTskNYuRPIqW0aMkNCgsv98lzvv0lTqKgjS2+jGduG9xN+Cs2OyoqJ+c/0OnCX2YqDOESL0NgTrbCrNdmv/cWfzmaJeg4O/hg7SP39pY6pLmJ0J9XLntyzrLrvFjUUYo9pLjnPCwZh9nl8OsvTqEQBIvKCO48vs9gYSjQEWyMtll0elzd7WBgdVooZskQdy4YtLITZQwqU1kMwQu0srdS2az+YPc19Iv39xczBKTudqgKTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738553491; c=relaxed/relaxed;
	bh=zIM0HNxOpd+mwy4yH9/zK7GjEdI1Hw/l7uc/DAJMasc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DNymUINP1T3ZZxnhQIZzbLF9YaJy2Il7hnuRS9FCC2zQJu28AzgaPC+FsuGUf5x9VKnIoINPTY5tm1Gy+FwHnfeEpDbJOOUVj921pstgl0Mf56e+0nmgHNYTgjm6Va3DM7jWiT6/Z9xu1sJU2LmrlQrpLfM6sRbopR3Jyu1X6qX/VRYaDJX9JqWdq4TnDTD137GH3e1VsLMARSylwGW62zk5BQjmrisYyudd9dQEHuqjx3Ac3uEWfwmiX7UYXhRDwNDPjYV9jLsVHwNmIfQ3q9E9s1VclxVzI5Ufb12BnOJoQQDhh1GEJIAKk0P5u108q5PmVMGPMeHyvpl+YRFtrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=XO0VtXFL; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=XO0VtXFL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YmX8y5NZFz2yvj
	for <openbmc@lists.ozlabs.org>; Mon,  3 Feb 2025 14:31:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1738553490;
	bh=zIM0HNxOpd+mwy4yH9/zK7GjEdI1Hw/l7uc/DAJMasc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XO0VtXFL/rr/RxhK4obFlxxlnRmLC1ovr8B0+KmZ9ZCElM/lv+YJze58gfCxjyZ6b
	 Fy7uZIiO6QjpVNDqiHuV6lBxx8GMdKO4ILWUdol5Jvu8jrOG1SKuhPPQnFkOItpORW
	 BV6APxJvd/wFp3W26kobYkA/Tfnnoh0PIxCJIPGkVyQjIaIsoedB3XgveECN9sPUm5
	 zdjEza8OepN34DJxomTF5bEnWFI0QArWiBk2/rlKGrn2yh3iGCenyY/0DOsxlH58f6
	 J0mNtcbyf3QmOADC9xfXMiVCQncv6X7hUkuBhJWh47Ho7hcxlI0pLvc/Xc/sIEdtcY
	 xHdyLl/JjkZjg==
Received: from [192.168.68.112] (58-7-156-140.dyn.iinet.net.au [58.7.156.140])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C605873C54;
	Mon,  3 Feb 2025 11:31:28 +0800 (AWST)
Message-ID: <8f51f0852317a28fc5cf1ba213902be838c9545e.camel@codeconstruct.com.au>
Subject: Re: [PATCH] i2c: aspeed: Nullify bus messages after timeout
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Eddie James <eajames@linux.ibm.com>, linux-i2c@vger.kernel.org
Date: Mon, 03 Feb 2025 14:01:28 +1030
In-Reply-To: <20250131222941.798065-1-eajames@linux.ibm.com>
References: <20250131222941.798065-1-eajames@linux.ibm.com>
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
Cc: openbmc@lists.ozlabs.org, ryan_chen@aspeedtech.com, joel@jms.id.au, andi.shyti@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 2025-01-31 at 16:29 -0600, Eddie James wrote:
> For multimaster case, it's conceivable that an interrupt comes
> in after the transfer times out and attempts to use bus messages
> that have already been freed by the i2c core.

This description seems a little vague. Did you hit this case in
practice?

>=20
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
> =C2=A0drivers/i2c/busses/i2c-aspeed.c | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/i2c/busses/i2c-aspeed.c
> b/drivers/i2c/busses/i2c-aspeed.c
> index 1550d3d552aed..e344dcc2233fe 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -731,6 +731,7 @@ static int aspeed_i2c_master_xfer(struct
> i2c_adapter *adap,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 * master command.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0spin_lock_irqsave(&bus->lock, flags);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0bus->msgs =3D NULL;

It feels like there's buggy code elsewhere in the driver that this is
protecting (broken state machine)? I've had a look at the
aspeed_i2c_master_irq() implementation and can't see what though, as we
take an early-exit (before indexing into bus->msgs) if bus-
>master_state is INACTIVE or PENDING.

Can you be a bit more specific about where the issue lies?

Andrew


> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0if (bus->master_state =3D=3D ASPEED_I2C_MASTER_PEND=
ING)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bus=
->master_state =3D
> ASPEED_I2C_MASTER_INACTIVE;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0spin_unlock_irqrestore(&bus->lock, flags);

