Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D51551BD6A2
	for <lists+openbmc@lfdr.de>; Wed, 29 Apr 2020 09:55:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BrQm01PjzDqtK
	for <lists+openbmc@lfdr.de>; Wed, 29 Apr 2020 17:55:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=the-dreams.de (client-ip=88.99.104.3; helo=pokefinder.org;
 envelope-from=wsa@the-dreams.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=the-dreams.de
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by lists.ozlabs.org (Postfix) with ESMTP id 49BrPW2l3bzDq6k;
 Wed, 29 Apr 2020 17:54:04 +1000 (AEST)
Received: from localhost (p54B330EB.dip0.t-ipconnect.de [84.179.48.235])
 by pokefinder.org (Postfix) with ESMTPSA id 3F6972C08B2;
 Wed, 29 Apr 2020 09:53:59 +0200 (CEST)
Date: Wed, 29 Apr 2020 09:53:57 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: ryan_chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v0 linux master] i2c/busses: Avoid i2c interrupt status
 clear race condition.
Message-ID: <20200429075357.GA1957@kunai>
References: <20200429033737.2781-1-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Content-Disposition: inline
In-Reply-To: <20200429033737.2781-1-ryan_chen@aspeedtech.com>
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, Brendan Higgins <brendanhiggins@google.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2020 at 11:37:37AM +0800, ryan_chen wrote:
> In AST2600 there have a slow peripheral bus between CPU
>  and i2c controller.
> Therefore GIC i2c interrupt status clear have delay timing,
> when CPU issue write clear i2c controller interrupt status.
> To avoid this issue, the driver need have read after write
>  clear at i2c ISR.
>=20
> Signed-off-by: ryan_chen <ryan_chen@aspeedtech.com>

v0? is it a prototype?

And is there maybe a Fixes: tag for it?

> ---
>  drivers/i2c/busses/i2c-aspeed.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-asp=
eed.c
> index 07c1993274c5..f51702d86a90 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -603,6 +603,7 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *=
dev_id)
>  	/* Ack all interrupts except for Rx done */
>  	writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
>  	       bus->base + ASPEED_I2C_INTR_STS_REG);
> +	readl(bus->base + ASPEED_I2C_INTR_STS_REG);
>  	irq_remaining =3D irq_received;
> =20
>  #if IS_ENABLED(CONFIG_I2C_SLAVE)
> @@ -645,9 +646,11 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void =
*dev_id)
>  			irq_received, irq_handled);
> =20
>  	/* Ack Rx done */
> -	if (irq_received & ASPEED_I2CD_INTR_RX_DONE)
> +	if (irq_received & ASPEED_I2CD_INTR_RX_DONE) {
>  		writel(ASPEED_I2CD_INTR_RX_DONE,
>  		       bus->base + ASPEED_I2C_INTR_STS_REG);
> +		readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> +	}
>  	spin_unlock(&bus->lock);
>  	return irq_remaining ? IRQ_NONE : IRQ_HANDLED;
>  }
> --=20
> 2.17.1
>=20

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6pMo4ACgkQFA3kzBSg
KbbntRAAs++ZnC+iCmSLY5Q3M4OON+jEs3K4ZhdSuNgzbZsLaWVt5Cx7cCjT/JDi
988C8kzysPKL8Cknlqyv4GBus0cCPwylvFZGHWXdot89RmG4stjYb3JbaV+Qm9Ov
8bCKE8xEWEHyYFFEgreqtLbEFCnHCNf7TnX21b8+L6E988R1AE7r5qIFCTuK1/4/
hrNCRmEoXYLp0pSDC6BuAgJvayrewlTkvCfnBVv39FzN95ghtC21cC73I6SKfDat
qxCyKy1x++V6n03sprTFgc8MCqOpYu6rIgFKm94NSltyJWaRAZKY1vd/Pzj7D0Oc
UPhtu7ldQAbllMAZmMutCDf8m0ek+Ob4jHF+DQKqq2E8MQZs35RxrNnDYzFOLm7r
NISJkGAZ6ZmC3lmyH1t1GRxZls5RfqpUJuVFIke07C4eSO7r6y9rWoOOhzMYJERC
cQuG05T6fcJRGx35/h9GHbcb9+kafQXXRaM65H4aEPKBjbtDbyC8j9PT5WGTRFwS
kS0iSZ5XnSiCccMv33mJqgotV9yPTaVHstupHCnI7K77MH0b7l4Ni1Q7DAnR0cE/
7mhN81qc04aqCi4+Zi1PtWRKMBcgvdX9QmHQnt2KYc7kSmgD9gy454O1NOIbA97S
c1UOGjbptbrnl1VaH9/o0SldOXlHGdNzkzspFGAhk/5ioC8I2oE=
=hr47
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--
