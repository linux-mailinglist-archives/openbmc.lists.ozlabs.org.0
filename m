Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 282557FE5F6
	for <lists+openbmc@lfdr.de>; Thu, 30 Nov 2023 02:21:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=WLWOIw79;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgdhC4T5fz3cVF
	for <lists+openbmc@lfdr.de>; Thu, 30 Nov 2023 12:21:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=WLWOIw79;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgdgY305Bz2yQL;
	Thu, 30 Nov 2023 12:21:13 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-131-38.adl-adc-lon-bras33.tpg.internode.on.net [118.210.131.38])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 12E632012A;
	Thu, 30 Nov 2023 09:21:01 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1701307268;
	bh=S70Q88P2OxNQtAi62UJSVFWaRnUGB5ZmV47MfgF9zgw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WLWOIw79MGqwV1g45ayblaPYk3dljx/vHL51Rns4b76tJD4oOElPf6nAb+w7S0Usb
	 9j4uQio+I7Qmb+4UQLN+QiZP+uc7X2DWBL7x3hSUwGUWBScHWYYLImSksEEP0j3JEl
	 d+kGu8Z5OddVm9Ukd2fHroAMji3fRUZ+WsKdffvVdqq+E/1yw0i02gndCPYWE0VQdd
	 mqlbhfl+Xbt4ft5u/QDYpKmAohmFbL66aN7VGvPOtzt8R2tiGSalv4h0Fq0MtzFe2p
	 vr2ClbKV5huf7gkQsUCzMYWRz7UOpTHlyCEdltOrh0PtSI0440hlX9wW+haqLBJhTC
	 pr8IJXXteUYjQ==
Message-ID: <c3813b6f01405f7060b68352fd03ddb727bb3438.camel@codeconstruct.com.au>
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
Date: Thu, 30 Nov 2023 11:50:57 +1030
In-Reply-To: <99dff4f2-cfe1-4a3d-a10b-313b9e7a29b3@os.amperecomputing.com>
References: <20231128075236.2724038-1-quan@os.amperecomputing.com>
	 <20231128075236.2724038-2-quan@os.amperecomputing.com>
	 <4a9fe86f0349106adaa4e0c04c5839bab631f26c.camel@codeconstruct.com.au>
	 <99dff4f2-cfe1-4a3d-a10b-313b9e7a29b3@os.amperecomputing.com>
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

On Wed, 2023-11-29 at 16:03 +0700, Quan Nguyen wrote:
>=20
> On 29/11/2023 07:19, Andrew Jeffery wrote:
> > On Tue, 2023-11-28 at 14:52 +0700, Quan Nguyen wrote:
> > > Under normal conditions, after the last byte is sent by the Slave, th=
e
> > > TX_NAK interrupt is raised.  However, it is also observed that
> > > sometimes the Master issues the next transaction too quickly while th=
e
> > > Slave IRQ handler is not yet invoked and the TX_NAK interrupt for the
> > > last byte of the previous READ_PROCESSED state has not been ack=E2=80=
=99ed.
> > > This TX_NAK interrupt is then raised together with SLAVE_MATCH interr=
upt
> > > and RX_DONE interrupt of the next coming transaction from Master. The
> > > Slave IRQ handler currently handles the SLAVE_MATCH and RX_DONE, but
> > > ignores the TX_NAK, causing complaints such as
> > > "aspeed-i2c-bus 1e78a040.i2c-bus: irq handled !=3D irq. Expected
> > > 0x00000086, but was 0x00000084"
> > >=20
> > > This commit adds code to handle this case by emitting a SLAVE_STOP ev=
ent
> > > for the TX_NAK before processing the RX_DONE for the coming transacti=
on
> > > from the Master.
> > >=20
> > > Fixes: f9eb91350bb2 ("i2c: aspeed: added slave support for Aspeed I2C=
 driver")
> > > Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> > > ---
> > > v2:
> > >    + Split to separate series [Joel]
> > >    + Added the Fixes line [Joel]
> > >    + Revised commit message [Quan]
> > >=20
> > > v1:
> > >    + First introduced in
> > > https://lore.kernel.org/all/20210519074934.20712-1-quan@os.amperecomp=
uting.com/
> > > ---
> > >   drivers/i2c/busses/i2c-aspeed.c | 5 +++++
> > >   1 file changed, 5 insertions(+)
> > >=20
> > > diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c=
-aspeed.c
> > > index 28e2a5fc4528..79476b46285b 100644
> > > --- a/drivers/i2c/busses/i2c-aspeed.c
> > > +++ b/drivers/i2c/busses/i2c-aspeed.c
> > > @@ -253,6 +253,11 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2=
c_bus *bus, u32 irq_status)
> > >  =20
> > >   	/* Slave was requested, restart state machine. */
> > >   	if (irq_status & ASPEED_I2CD_INTR_SLAVE_MATCH) {
> > > +		if (irq_status & ASPEED_I2CD_INTR_TX_NAK &&
> > > +		    bus->slave_state =3D=3D ASPEED_I2C_SLAVE_READ_PROCESSED) {
> > > +			irq_handled |=3D ASPEED_I2CD_INTR_TX_NAK;
> > > +			i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
> > > +		}
> >=20
> > So we're already (partially) processing this a bit later on line 287:
> >=20
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/i2c/busses/i2c-aspeed.c?h=3Dv6.7-rc3#n287
> >=20
>=20
> Thanks Andrew for the review.
>=20
> I think it's worth noting that the byte mode is used in this case.
>=20
> About the code you mentioned, it is for the general process of single=20
> Slave transmission with NAK which should be interpret as I2C_SLAVE_STOP=
=20
> event.
>=20
> In this case, there is a mix of Slave events:
>=20
>    + I2C_SLAVE_STOP (due to INTR_TX_NAK, BIT(1) of previous transaction)
>    + Followed by I2C_SLAVE_[READ|WRITE]_REQUESTED (due to=20
> INTR_SLAVE_MATCH and INTR_RX_DONE, BIT(7) and BIT(2), of next transaction=
)
>=20
> That is the reason we need to emit the I2C_SLAVE_STOP first for Slave=20
> backend to process.
>=20
> >  From the description of the problem in the commit message it sounds
> > like the ordering of the interrupt processing is incorrect.=20
>=20
> Yes, this is correct as per my explanation above.
>=20
> Prior to
> > this patch we have the following abstract ordering of interrupt
> > processing:
> >=20
> > 1. Process ASPEED_I2CD_INTR_SLAVE_MATCH
> > 2. Process ASPEED_I2CD_INTR_TX_NAK when in ASPEED_I2C_SLAVE_READ_PROCES=
SED
> >=20
>=20
>  From my test, the flow is as below:
>=20
>    1. Process ASPEED_I2CD_INTR_SLAVE_MATCH, slave_state is set to=20
> ASPEED_I2C_SLAVE_START
>    2. As there is INTR_RX_DONE and slave_state is=20
> ASPEED_I2C_SLAVE_START, depends on the data received, the slave_state=20
> moves to either ASPEED_I2C_SLAVE_[READ|WRITE]_REQUESTED.
>    3. When reach to the if statement to process INTR_TX_NAK, slave_state=
=20
> is already moves to either ASPEED_I2C_SLAVE_[READ|WRITE]_REQUESTED, not=
=20
> in ASPEED_I2C_SLAVE_READ_PROCESSED anymore. This eventually evaluate as=
=20
> false and the if statement is bypass. IOW, this INTR_TX_NAK is not proces=
s.
>=20
> > With this patch we have:
> >=20
> > 1. If ASPEED_I2CD_INTR_SLAVE_MATCH then process ASPEED_I2CD_INTR_TX_NAK=
 when in ASPEED_I2C_SLAVE_READ_PROCESSED
> > 2. Process ASPEED_I2CD_INTR_SLAVE_MATCH
> > 3. Process ASPEED_I2CD_INTR_TX_NAK when in ASPEED_I2C_SLAVE_READ_PROCES=
SED
> >=20
>=20
> With this patch:
>=20
>    0. The I2C_SLAVE_STOP is emitted to backend Slave driver first to=20
> complete the previous transaction. And let the rest process as before=20
> this patch.
>=20
>    1. Process ASPEED_I2CD_INTR_SLAVE_MATCH, slave_state is set to=20
> ASPEED_I2C_SLAVE_START
>    2. As there is INTR_RX_DONE and slave_state is=20
> ASPEED_I2C_SLAVE_START, depends on the data received, the slave_state=20
> moves to either ASPEED_I2C_SLAVE_[READ|WRITE]_REQUESTED.
>    3. When reach to the if statement to process INTR_TX_NAK, slave_state=
=20
> is already moves to either ASPEED_I2C_SLAVE_[READ|WRITE]_REQUESTED, not=
=20
> in ASPEED_I2C_SLAVE_READ_PROCESSED anymore. This eventually evaluated as=
=20
> false and the if statement is bypass. IOW, this INTR_TX_NAK is not proces=
s.
>=20
> > That feels a bit complex and redundant. What I think we can have is:
> >=20
> > 1. Process ASPEED_I2CD_INTR_TX_NAK when in ASPEED_I2C_SLAVE_READ_PROCES=
SED
> > 1. Process ASPEED_I2CD_INTR_SLAVE_MATCH
> >=20
> > Moving back from the abstract to the concrete, implementing what I
> > believe we need would look something like this patch:
> >=20
> > diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-a=
speed.c
> > index 28e2a5fc4528..98dd0f35c9d3 100644
> > --- a/drivers/i2c/busses/i2c-aspeed.c
> > +++ b/drivers/i2c/busses/i2c-aspeed.c
> > @@ -251,6 +251,14 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_=
bus *bus, u32 irq_status)
> >  =20
> >          command =3D readl(bus->base + ASPEED_I2C_CMD_REG);
> >  =20
> > +       /* Complete any active read */
> > +       if (irq_status & ASPEED_I2CD_INTR_TX_NAK &&
> > +           bus->slave_state =3D=3D ASPEED_I2C_SLAVE_READ_PROCESSED) {
> > +               irq_handled |=3D ASPEED_I2CD_INTR_TX_NAK;
> > +               i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
> > +               bus->slave_state =3D ASPEED_I2C_SLAVE_STOP;
> > +       }
> > +
>=20
> It is not confirmed through test yet but I'm afraid the switch case part=
=20
> will emit another I2C_SLAVE_STOP event in case there is no mix of=20
> interrupts.

Ah, good catch. I think we can rework things a bit to rationalise the
logic at the expense a bigger diff. What do you think about this? I've
boot tested it on an ast2600-evb and poked at some NVMe drives over
MCTP to exercise the slave path.

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspee=
d.c
index aec8966bceab..3c9333a12967 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -249,18 +249,47 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus=
 *bus, u32 irq_status)
 	if (!slave)
 		return 0;
=20
-	command =3D readl(bus->base + ASPEED_I2C_CMD_REG);
+	/*
+	 * Handle stop conditions early, prior to SLAVE_MATCH. Some masters may d=
rive
+	 * transfers with low enough latency between the nak/stop phase of the cu=
rrent
+	 * command and the start/address phase of the following command that the
+	 * interrupts are coalesced by the time we process them.
+	 */
+
+	if (irq_status & ASPEED_I2CD_INTR_NORMAL_STOP) {
+		irq_handled |=3D ASPEED_I2CD_INTR_NORMAL_STOP;
+		bus->slave_state =3D ASPEED_I2C_SLAVE_STOP;
+	}
+
+	if (irq_status & ASPEED_I2CD_INTR_TX_NAK &&
+	    bus->slave_state =3D=3D ASPEED_I2C_SLAVE_READ_PROCESSED) {
+		irq_handled |=3D ASPEED_I2CD_INTR_TX_NAK;
+		bus->slave_state =3D ASPEED_I2C_SLAVE_STOP;
+	}
+
+	/* Propagate any stop conditions to the slave implementation */
+	if (bus->slave_state =3D=3D ASPEED_I2C_SLAVE_STOP) {
+		i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
+		bus->slave_state =3D ASPEED_I2C_SLAVE_INACTIVE;
+	}
=20
-	/* Slave was requested, restart state machine. */
+	/*
+	 * Now that we've dealt with any potentially coalesced stop conditions,
+	 * address any start conditions.
+	 */
 	if (irq_status & ASPEED_I2CD_INTR_SLAVE_MATCH) {
 		irq_handled |=3D ASPEED_I2CD_INTR_SLAVE_MATCH;
 		bus->slave_state =3D ASPEED_I2C_SLAVE_START;
 	}
=20
-	/* Slave is not currently active, irq was for someone else. */
+	/*
+	 * If the slave has been stopped and not started then slave interrupt han=
dling
+	 * is complete.
+	 */
 	if (bus->slave_state =3D=3D ASPEED_I2C_SLAVE_INACTIVE)
 		return irq_handled;
=20
+	command =3D readl(bus->base + ASPEED_I2C_CMD_REG);
 	dev_dbg(bus->dev, "slave irq status 0x%08x, cmd 0x%08x\n",
 		irq_status, command);
=20
@@ -279,17 +308,6 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus =
*bus, u32 irq_status)
 		irq_handled |=3D ASPEED_I2CD_INTR_RX_DONE;
 	}
=20
-	/* Slave was asked to stop. */
-	if (irq_status & ASPEED_I2CD_INTR_NORMAL_STOP) {
-		irq_handled |=3D ASPEED_I2CD_INTR_NORMAL_STOP;
-		bus->slave_state =3D ASPEED_I2C_SLAVE_STOP;
-	}
-	if (irq_status & ASPEED_I2CD_INTR_TX_NAK &&
-	    bus->slave_state =3D=3D ASPEED_I2C_SLAVE_READ_PROCESSED) {
-		irq_handled |=3D ASPEED_I2CD_INTR_TX_NAK;
-		bus->slave_state =3D ASPEED_I2C_SLAVE_STOP;
-	}
-
 	switch (bus->slave_state) {
 	case ASPEED_I2C_SLAVE_READ_REQUESTED:
 		if (unlikely(irq_status & ASPEED_I2CD_INTR_TX_ACK))
@@ -324,8 +342,7 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *=
bus, u32 irq_status)
 		i2c_slave_event(slave, I2C_SLAVE_WRITE_RECEIVED, &value);
 		break;
 	case ASPEED_I2C_SLAVE_STOP:
-		i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
-		bus->slave_state =3D ASPEED_I2C_SLAVE_INACTIVE;
+		/* Stop event handling is done early. Unreachable. */
 		break;
 	case ASPEED_I2C_SLAVE_START:
 		/* Slave was just started. Waiting for the next event. */;
