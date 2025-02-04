Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE5EA26AF1
	for <lists+openbmc@lfdr.de>; Tue,  4 Feb 2025 05:13:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yn92l1vr9z3bNh
	for <lists+openbmc@lfdr.de>; Tue,  4 Feb 2025 15:13:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738642396;
	cv=none; b=ApqdGSPfRTAadiKFDhi6wpJyHFVj1w2iSX3/aPHHCDmGWvwGurkeeLgrjZVpi4noR3rqSrcD4XjiFn2ODZLpGE1JkSZ2rQBdvR8NS48V+Ly5upIMhkpfZERWgh/Uqee2yzamfm5FJy3DjKKG16hx2OWtv/kFcs4RMPhKX5YmnuPjTYquz43Xn4TOnEg1hipNJAMkKTsDz+8M6atWk2VNoo6fEpLGofn4cuFcK2NetXJHh5nG1BlB+wjtuXYnfQfPdMfunA8ad4eqfhLbvh/c7JmwW8hDR1uGH59Pp0uHszZUsUIwXUBuSNtY2W1MpX0oaV9RrRFItgc5/1MX5alX0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738642396; c=relaxed/relaxed;
	bh=RExAYE+eg3+DqD0aIdg6MvAYfgTf4PN07K9zMtWgBAY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XwrcnO9aWzG8G8ULAWjOfHlWY7HA/WS9l42peZgtuE6QidR2WCE/XJ7pifQQ3L7pYUeoHKLaS3/FGKP1/0Zdo7rzbPOY0Ye6qL7TQSgZMPoePrLL6Nu7rSWjsAmqt1kN4v8SzYWAqkJFXBf21oHZga++lXFPd3lieBkjU2D4cyfG1uEoWvRjrY5hcV25jrnxRmAo6oTs7hF/lcwOGO7omlOF9Pv5wDaJ0E7DuyF5C+OsISyHc+TtBBk+kwq5s3O/6WtpbHmDaTSWOcSOUY0FFNOVkbmzD+A+vs/c7RQb9mj2CSe5qsJJHHwDH6XELT2+DmuIEnZiG+rn0g3AYo0Ysg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=jOSBxYDT; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=jOSBxYDT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yn92g0Z7qz2yDT
	for <openbmc@lists.ozlabs.org>; Tue,  4 Feb 2025 15:13:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1738642391;
	bh=RExAYE+eg3+DqD0aIdg6MvAYfgTf4PN07K9zMtWgBAY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jOSBxYDTc82cZ0EYD5pVAKqHHryvcacd/mHlBdRPSwerUw6+8ums9QlQaQkNIcajB
	 6sFBcgF708q3xkMkipQjabZqJgeGrjc2kK0y1k7U1sF8aOra4a26tBaqzwY9lp/e/I
	 X4jq+0Ch7xnpCTLAl2bIVobPfN1b3MvV+wh9JANA5fZ+2rHuMmMpNDkMaEHzLU1cEV
	 2Im2nA45kMPZ1fwD6cWrRERtCACkCEbNUyWkcsGXB87WG/CS2TzpmXo8IjG2ERHLka
	 3WVGuGUerfGX6Bymgqy1ofdxZ4aoYCYuMyEdLoZdkJuw5GrTYmdaUWKL0Z5I4/qZy1
	 /PAithJv8ayjg==
Received: from [192.168.68.112] (58-7-156-140.dyn.iinet.net.au [58.7.156.140])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 005A7735E6;
	Tue,  4 Feb 2025 12:13:08 +0800 (AWST)
Message-ID: <c35202743a7c63414e19766a54c4b9f055d59d97.camel@codeconstruct.com.au>
Subject: Re: [PATCH] i2c: aspeed: Nullify bus messages after timeout
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Eddie James <eajames@linux.ibm.com>, linux-i2c@vger.kernel.org
Date: Tue, 04 Feb 2025 14:43:07 +1030
In-Reply-To: <e68a787b-f442-4509-bd3b-b407a6075130@linux.ibm.com>
References: <20250131222941.798065-1-eajames@linux.ibm.com>
	 <8f51f0852317a28fc5cf1ba213902be838c9545e.camel@codeconstruct.com.au>
	 <e68a787b-f442-4509-bd3b-b407a6075130@linux.ibm.com>
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

On Mon, 2025-02-03 at 14:29 -0600, Eddie James wrote:
>=20
> On 2/2/25 21:31, Andrew Jeffery wrote:
> > On Fri, 2025-01-31 at 16:29 -0600, Eddie James wrote:
> > > For multimaster case, it's conceivable that an interrupt comes
> > > in after the transfer times out and attempts to use bus messages
> > > that have already been freed by the i2c core.
> > This description seems a little vague. Did you hit this case in
> > practice?
>=20
>=20
> Yes. I no longer have the back trace but it's a null pointer access in=
=20
> the interrupt handler. We had a certain system that would hit this under=
=20
> certain conditions and this patch fixed it.
>=20
>=20
> I can update the commit message with some more detail.

Thanks.

>=20
>=20
> >=20
> > > Signed-off-by: Eddie James <eajames@linux.ibm.com>
> > > ---
> > > =C2=A0=C2=A0drivers/i2c/busses/i2c-aspeed.c | 1 +
> > > =C2=A0=C2=A01 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/drivers/i2c/busses/i2c-aspeed.c
> > > b/drivers/i2c/busses/i2c-aspeed.c
> > > index 1550d3d552aed..e344dcc2233fe 100644
> > > --- a/drivers/i2c/busses/i2c-aspeed.c
> > > +++ b/drivers/i2c/busses/i2c-aspeed.c
> > > @@ -731,6 +731,7 @@ static int aspeed_i2c_master_xfer(struct
> > > i2c_adapter *adap,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * master command.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0spin_lock_irqsave(&bus->lock, flags);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0bus->msgs =3D NULL;
> > It feels like there's buggy code elsewhere in the driver that this is
> > protecting (broken state machine)? I've had a look at the
> > aspeed_i2c_master_irq() implementation and can't see what though, as we
> > take an early-exit (before indexing into bus->msgs) if bus-
> > > master_state is INACTIVE or PENDING.
> > Can you be a bit more specific about where the issue lies?
>=20
>=20
> I'm sure the state machine isn't perfect, yea.
>=20

Right, so I think that's what should be fixed; the explicit states
define possible invariants in the implementation. We shouldn't need to
test `msgs` to know its value (whether its value is correct should be
defined by the current state).

> The bad access can happen=20
> like this: if a transfer times out while waiting for an interrupt, the=
=20
> aspeed_i2c_master_xfer function will either reset the engine or recover=
=20
> the bus, and exit ETIMEDOUT. Resetting the engine will turn off=20
> interrupts, so we're safe. But recovering the bus doesn't turn off=20
> interrupts, so after the function exits ETIMEDOUT, I assume what happens=
=20
> is we get the interrupt for the previous transfer and try and access the=
=20
> messages pointer, which the i2c core has already freed.

So what immediately concerns me is there's no RECOVER state in `enum
aspeed_i2c_master_state` or the rest of the implementation. We do have
the PENDING state, which we don't have in hardware, so there's no
reason for RECOVER to be missing, especially since we have the RECOVER
state in hardware (I2CD14[22:19] =3D 0b0011).

What do you think of adding that, and testing for it in the interrupt
handler?

Andrew
