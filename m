Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E89809AB8
	for <lists+openbmc@lfdr.de>; Fri,  8 Dec 2023 04:57:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=IpkBpjVl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Smclx5G1dz3cVD
	for <lists+openbmc@lfdr.de>; Fri,  8 Dec 2023 14:57:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=IpkBpjVl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmclF3xf5z3bV7;
	Fri,  8 Dec 2023 14:56:41 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-181-59.adl-adc-lon-bras34.tpg.internode.on.net [118.210.181.59])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E526920016;
	Fri,  8 Dec 2023 11:56:33 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1702007800;
	bh=tyllIWdZHFdzvGcGSWMb1b2dzbhWG0Dcolc/GscISJs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IpkBpjVlJqrjJbUQM32dDSX0YGxz6gBIhe/tBGjUEzsc8/aqUO/E57MQSLhQJmW+g
	 HARu1kXb4P3QDUh5Jg2MiyauB8vTYbUlMHFgGCqgQJK+DltJy6AQd0+N7gPyfPTqH7
	 USmh9YZfNr0wzfkWYs/l9AtBgIPZhIlp490vLAPCX+oRx5vkE5mCKSdC3v/fn/jLuf
	 S3xtdMlrNhHdpFc+PpuQkJl15BtayAhWbaq0qmGZbOcxl7xIU+7769WluDh2AkGiy+
	 lnvUXItICteaSiZzEKyHAZ3wE1cVuWuQcVg7wGScpPnypxaBnY9ML6O/VrzBUlHox/
	 snvJVTJb19R2A==
Message-ID: <79ce9162faeb113ecb13efeb58d95f8a71e1a060.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 1/2] i2c: aspeed: Handle the coalesced stop
 conditions with the start conditions.
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Quan Nguyen <quan@os.amperecomputing.com>, Brendan Higgins
 <brendan.higgins@linux.dev>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>,  Joel Stanley <joel@jms.id.au>, Andi Shyti
 <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>, Jae Hyun Yoo
 <jae.hyun.yoo@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, 
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
Date: Fri, 08 Dec 2023 14:26:31 +1030
In-Reply-To: <20231208033142.1673232-2-quan@os.amperecomputing.com>
References: <20231208033142.1673232-1-quan@os.amperecomputing.com>
	 <20231208033142.1673232-2-quan@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: Cosmo Chou <chou.cosmo@gmail.com>, Open Source Submission <patches@amperecomputing.com>, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 2023-12-08 at 10:31 +0700, Quan Nguyen wrote:
> Some masters may drive the transfers with low enough latency between
> the nak/stop phase of the current command and the start/address phase
> of the following command that the interrupts are coalesced by the
> time we process them.
> Handle the stop conditions before processing SLAVE_MATCH to fix the
> complaints that sometimes occur below.
>=20
> "aspeed-i2c-bus 1e78a040.i2c-bus: irq handled !=3D irq. Expected
> 0x00000086, but was 0x00000084"
>=20
> Fixes: f9eb91350bb2 ("i2c: aspeed: added slave support for Aspeed I2C dri=
ver")
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> v3:
>   + Change to handle the coalesced stop condition with the start
> conditions                                                            [An=
drew]
>   + Revised commit message                                              [=
Quan]
>=20
> v2:
>   + Split to separate series                                            [=
Joel]
>   + Added the Fixes line                                                [=
Joel]
>   + Revised commit message                                              [=
Quan]
>=20
> v1:
>   + First introduced in
> https://lore.kernel.org/all/20210519074934.20712-1-quan@os.amperecomputin=
g.com/
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 47 ++++++++++++++++++++++-----------
>  1 file changed, 31 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-asp=
eed.c
> index 28e2a5fc4528..1c2a4f4c4e1b 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -249,18 +249,45 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_b=
us *bus, u32 irq_status)
>  	if (!slave)
>  		return 0;
> =20
> -	command =3D readl(bus->base + ASPEED_I2C_CMD_REG);
> +	/*
> +	 * Handle stop conditions early, prior to SLAVE_MATCH. Some masters may=
 drive
> +	 * transfers with low enough latency between the nak/stop phase of the =
current
> +	 * command and the start/address phase of the following command that th=
e
> +	 * interrupts are coalesced by the time we process them.
> +	 */
> +	if (irq_status & ASPEED_I2CD_INTR_NORMAL_STOP) {
> +		irq_handled |=3D ASPEED_I2CD_INTR_NORMAL_STOP;
> +		bus->slave_state =3D ASPEED_I2C_SLAVE_STOP;
> +	}
> =20
> -	/* Slave was requested, restart state machine. */
> +	if (irq_status & ASPEED_I2CD_INTR_TX_NAK &&
> +	    bus->slave_state =3D=3D ASPEED_I2C_SLAVE_READ_PROCESSED) {
> +		irq_handled |=3D ASPEED_I2CD_INTR_TX_NAK;
> +		bus->slave_state =3D ASPEED_I2C_SLAVE_STOP;
> +	}
> +
> +	/* Propagate any stop conditions to the slave implementation. */
> +	if (bus->slave_state =3D=3D ASPEED_I2C_SLAVE_STOP) {
> +		i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
> +		bus->slave_state =3D ASPEED_I2C_SLAVE_INACTIVE;
> +	}
> +	/*

If there's a reason to do a v4 then an extra empty line above the
comment would be nice. But let's not get hung up on that if everyone
else is happy.

Thanks for the fixes!

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

> +	 * Now that we've dealt with any potentially coalesced stop conditions,
> +	 * address any start conditions.
> +	 */
>  	if (irq_status & ASPEED_I2CD_INTR_SLAVE_MATCH) {
>  		irq_handled |=3D ASPEED_I2CD_INTR_SLAVE_MATCH;
>  		bus->slave_state =3D ASPEED_I2C_SLAVE_START;
>  	}
> =20
