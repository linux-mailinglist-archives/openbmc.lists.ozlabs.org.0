Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 364FD7FCB3D
	for <lists+openbmc@lfdr.de>; Wed, 29 Nov 2023 01:19:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=GIAkYfOy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sg0MB56R9z3cjf
	for <lists+openbmc@lfdr.de>; Wed, 29 Nov 2023 11:19:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=GIAkYfOy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sg0Lc1NWTz3cG6;
	Wed, 29 Nov 2023 11:19:20 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-131-38.adl-adc-lon-bras33.tpg.internode.on.net [118.210.131.38])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C8EB620173;
	Wed, 29 Nov 2023 08:19:09 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1701217154;
	bh=dk/ur1RQW3iSmbO2wQE4io8VUkp6+K+uoymueMamZHg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GIAkYfOyibSsdEqnXCDSdp7D18aGaGAUgQIZUt1T7ELSgV6ttYVwpLxqwnWClUCvb
	 V39xOaFy/s73LGvRAH3gSpAMiN2NVy5ivuP8FZEk3nRunQZUVagLBhTINw/2oW9Upr
	 p1DhJ8skCfCFIJmAY+yeUFxDZwog8b+gvtu+DBOwsbuObxSFPy/6vng10+31GZGrV/
	 LP5KlDGcC88/0tBcYb7Xd2EoNW6VNSZc8xV4F0gs/UMbSiNriwAmX9pBDrCMSCa0id
	 3NAQPHgVxH8EQ+RqLsoqIJuYKpCNzXdZ0QijrjDRNABl6Hfy3TkqIOZ+12He4YsvD+
	 bqgDHgnoJZOgw==
Message-ID: <4a9fe86f0349106adaa4e0c04c5839bab631f26c.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 RESEND 1/2] i2c: aspeed: Fix unhandled Tx done with
 NAK
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Quan Nguyen <quan@os.amperecomputing.com>, Brendan Higgins
 <brendan.higgins@linux.dev>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>,  Joel Stanley <joel@jms.id.au>, Andi Shyti
 <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>, Jae Hyun Yoo
 <jae.hyun.yoo@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, 
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
Date: Wed, 29 Nov 2023 10:49:08 +1030
In-Reply-To: <20231128075236.2724038-2-quan@os.amperecomputing.com>
References: <20231128075236.2724038-1-quan@os.amperecomputing.com>
	 <20231128075236.2724038-2-quan@os.amperecomputing.com>
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

On Tue, 2023-11-28 at 14:52 +0700, Quan Nguyen wrote:
> Under normal conditions, after the last byte is sent by the Slave, the
> TX_NAK interrupt is raised.  However, it is also observed that
> sometimes the Master issues the next transaction too quickly while the
> Slave IRQ handler is not yet invoked and the TX_NAK interrupt for the
> last byte of the previous READ_PROCESSED state has not been ack=E2=80=99e=
d.
> This TX_NAK interrupt is then raised together with SLAVE_MATCH interrupt
> and RX_DONE interrupt of the next coming transaction from Master. The
> Slave IRQ handler currently handles the SLAVE_MATCH and RX_DONE, but
> ignores the TX_NAK, causing complaints such as
> "aspeed-i2c-bus 1e78a040.i2c-bus: irq handled !=3D irq. Expected
> 0x00000086, but was 0x00000084"
>=20
> This commit adds code to handle this case by emitting a SLAVE_STOP event
> for the TX_NAK before processing the RX_DONE for the coming transaction
> from the Master.
>=20
> Fixes: f9eb91350bb2 ("i2c: aspeed: added slave support for Aspeed I2C dri=
ver")
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> v2:
>   + Split to separate series [Joel]
>   + Added the Fixes line [Joel]
>   + Revised commit message [Quan]
>=20
> v1:
>   + First introduced in
> https://lore.kernel.org/all/20210519074934.20712-1-quan@os.amperecomputin=
g.com/
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-asp=
eed.c
> index 28e2a5fc4528..79476b46285b 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -253,6 +253,11 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bu=
s *bus, u32 irq_status)
> =20
>  	/* Slave was requested, restart state machine. */
>  	if (irq_status & ASPEED_I2CD_INTR_SLAVE_MATCH) {
> +		if (irq_status & ASPEED_I2CD_INTR_TX_NAK &&
> +		    bus->slave_state =3D=3D ASPEED_I2C_SLAVE_READ_PROCESSED) {
> +			irq_handled |=3D ASPEED_I2CD_INTR_TX_NAK;
> +			i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
> +		}

So we're already (partially) processing this a bit later on line 287:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/i2c/busses/i2c-aspeed.c?h=3Dv6.7-rc3#n287

From the description of the problem in the commit message it sounds
like the ordering of the interrupt processing is incorrect. Prior to
this patch we have the following abstract ordering of interrupt
processing:

1. Process ASPEED_I2CD_INTR_SLAVE_MATCH
2. Process ASPEED_I2CD_INTR_TX_NAK when in ASPEED_I2C_SLAVE_READ_PROCESSED

With this patch we have:

1. If ASPEED_I2CD_INTR_SLAVE_MATCH then process ASPEED_I2CD_INTR_TX_NAK whe=
n in ASPEED_I2C_SLAVE_READ_PROCESSED
2. Process ASPEED_I2CD_INTR_SLAVE_MATCH
3. Process ASPEED_I2CD_INTR_TX_NAK when in ASPEED_I2C_SLAVE_READ_PROCESSED

That feels a bit complex and redundant. What I think we can have is:

1. Process ASPEED_I2CD_INTR_TX_NAK when in ASPEED_I2C_SLAVE_READ_PROCESSED
1. Process ASPEED_I2CD_INTR_SLAVE_MATCH

Moving back from the abstract to the concrete, implementing what I
believe we need would look something like this patch:

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspee=
d.c
index 28e2a5fc4528..98dd0f35c9d3 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -251,6 +251,14 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus =
*bus, u32 irq_status)
=20
        command =3D readl(bus->base + ASPEED_I2C_CMD_REG);
=20
+       /* Complete any active read */
+       if (irq_status & ASPEED_I2CD_INTR_TX_NAK &&
+           bus->slave_state =3D=3D ASPEED_I2C_SLAVE_READ_PROCESSED) {
+               irq_handled |=3D ASPEED_I2CD_INTR_TX_NAK;
+               i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
+               bus->slave_state =3D ASPEED_I2C_SLAVE_STOP;
+       }
+
        /* Slave was requested, restart state machine. */
        if (irq_status & ASPEED_I2CD_INTR_SLAVE_MATCH) {
                irq_handled |=3D ASPEED_I2CD_INTR_SLAVE_MATCH;
@@ -284,11 +292,6 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus =
*bus, u32 irq_status)
                irq_handled |=3D ASPEED_I2CD_INTR_NORMAL_STOP;
                bus->slave_state =3D ASPEED_I2C_SLAVE_STOP;
        }
-       if (irq_status & ASPEED_I2CD_INTR_TX_NAK &&
-           bus->slave_state =3D=3D ASPEED_I2C_SLAVE_READ_PROCESSED) {
-               irq_handled |=3D ASPEED_I2CD_INTR_TX_NAK;
-               bus->slave_state =3D ASPEED_I2C_SLAVE_STOP;
-       }
=20
        switch (bus->slave_state) {
        case ASPEED_I2C_SLAVE_READ_REQUESTED:

Thoughts? I haven't tested it, it's just something to throw darts at.

Andrew

