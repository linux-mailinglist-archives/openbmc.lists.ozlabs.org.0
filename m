Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E6752F91C
	for <lists+openbmc@lfdr.de>; Sat, 21 May 2022 07:59:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4tG24gq5z2yn2
	for <lists+openbmc@lfdr.de>; Sat, 21 May 2022 15:59:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dYB42roL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dYB42roL; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4tFd5SdWz2xX6
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2022 15:59:01 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 89F1DB82E26;
 Sat, 21 May 2022 05:58:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0895BC385A5;
 Sat, 21 May 2022 05:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653112737;
 bh=XoZgljNqsNiRJdAa4h/wKAjEiwsx+McQd3rlyMluR1s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dYB42roLKIJZ3vBHPoQHh5u8Z5uCpnofZbYOyt61il509sfMRjReOPqE1yCx1a1zc
 X2+HgcxbANcKsgUw8ZPEJVOiaSF1o5Fpf5APf/UHQEpewrnc50Rr2LEbxz2vopnjEv
 RPcLqtIXODMFqTQqfUFON+EEHiWDz4VImulBTEewKsDn74qwn6dCrhDIoWyNDXP5n4
 AUHtGNdUqjl/ltNHTpA5meGUhfW1KBoE81iHiX6gY/ijft4POkIYcLHLQoSsRUrXet
 Y5Xgi2GyEzJ7MnQFzDPRSgyoym9wNxBTDpEY8MXRVebSExDHEo5F3m7WX5GtmnMk4q
 TMHyryPKPIG4A==
Date: Sat, 21 May 2022 07:58:52 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v5 08/10] i2c: npcm: Remove own slave addresses 2:10
Message-ID: <Yoh/nEYPu++LZSvb@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org,
 andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
 semen.protsenko@linaro.org, rafal@milecki.pl, sven@svenpeter.dev,
 jsd@semihalf.com, jie.deng@intel.com, lukas.bulwahn@gmail.com,
 arnd@arndb.de, olof@lixom.net, tali.perry@nuvoton.com,
 Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
 KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com,
 openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220517101142.28421-1-warp5tw@gmail.com>
 <20220517101142.28421-9-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="UDM9L8RbMLp7eyuG"
Content-Disposition: inline
In-Reply-To: <20220517101142.28421-9-warp5tw@gmail.com>
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, tali.perry1@gmail.com,
 jsd@semihalf.com, krzysztof.kozlowski+dt@linaro.org, rafal@milecki.pl,
 benjaminfair@google.com, openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com,
 lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com,
 arnd@arndb.de, sven@svenpeter.dev, robh+dt@kernel.org, Avi.Fishman@nuvoton.com,
 andriy.shevchenko@linux.intel.com, semen.protsenko@linaro.org,
 jie.deng@intel.com, avifishman70@gmail.com, venture@google.com,
 linux-kernel@vger.kernel.org, kfting@nuvoton.com, tali.perry@nuvoton.com,
 jarkko.nikula@linux.intel.com, olof@lixom.net, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--UDM9L8RbMLp7eyuG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> NPCM can support up to 10 own slave addresses. In practice, only one
> address is actually being used. In order to access addresses 2 and above,
> need to switch register banks. The switch needs spinlock.
> To avoid using spinlock for this useless feature removed support of SA >=
=3D
> 2. Also fix returned slave event enum.

Is the spinlock contention so high? The code paths do not really look
like hot paths to me. A bit sad to see this feature go.

>  static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] =3D {
>  	NPCM_I2CADDR1, NPCM_I2CADDR2, NPCM_I2CADDR3, NPCM_I2CADDR4,
>  	NPCM_I2CADDR5, NPCM_I2CADDR6, NPCM_I2CADDR7, NPCM_I2CADDR8,

Why do we keep this array if we drop the support?

> @@ -604,8 +602,7 @@ static int npcm_i2c_slave_enable(struct npcm_i2c *bus=
, enum i2c_addr addr_type,
>  			i2cctl1 &=3D ~NPCM_I2CCTL1_GCMEN;
>  		iowrite8(i2cctl1, bus->reg + NPCM_I2CCTL1);
>  		return 0;
> -	}
> -	if (addr_type =3D=3D I2C_ARP_ADDR) {
> +	} else if (addr_type =3D=3D I2C_ARP_ADDR) {

I might be wrong but this looks like a seperate change?

> @@ -924,11 +918,15 @@ static int npcm_i2c_slave_get_wr_buf(struct npcm_i2=
c *bus)
>  	for (i =3D 0; i < I2C_HW_FIFO_SIZE; i++) {
>  		if (bus->slv_wr_size >=3D I2C_HW_FIFO_SIZE)
>  			break;
> -		i2c_slave_event(bus->slave, I2C_SLAVE_READ_REQUESTED, &value);
> +		if (bus->state =3D=3D I2C_SLAVE_MATCH) {
> +			i2c_slave_event(bus->slave, I2C_SLAVE_READ_REQUESTED, &value);
> +			bus->state =3D I2C_OPER_STARTED;
> +		} else {
> +			i2c_slave_event(bus->slave, I2C_SLAVE_READ_PROCESSED, &value);
> +		}
>  		ind =3D (bus->slv_wr_ind + bus->slv_wr_size) % I2C_HW_FIFO_SIZE;
>  		bus->slv_wr_buf[ind] =3D value;
>  		bus->slv_wr_size++;
> -		i2c_slave_event(bus->slave, I2C_SLAVE_READ_PROCESSED, &value);
>  	}
>  	return I2C_HW_FIFO_SIZE - ret;
>  }
> @@ -976,7 +974,6 @@ static void npcm_i2c_slave_xmit(struct npcm_i2c *bus,=
 u16 nwrite,
>  	if (nwrite =3D=3D 0)
>  		return;
> =20
> -	bus->state =3D I2C_OPER_STARTED;
>  	bus->operation =3D I2C_WRITE_OPER;

This is definately a seperate change!

All the best!

--UDM9L8RbMLp7eyuG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIf5wACgkQFA3kzBSg
Kbbtcw/+O5/PxrG06H7aHDT/QPyCbnh2+bVtZS2HHoJY+IWrmoW/ebkp0NXqvSz2
9Q+kxSxVNd/Jbbcxy5NpwP8mjPwDHnOXvFot99yiCAFfMhZDuRgRMuEZwHdUrTya
8fmJbAwcZ8p5PPVuVHd6iKbK3B/StrC6uHHYxeWUygMRk9l9tGN26YCyfCrQJykB
cLAZouXdyiThh39RBIKCjclyEthoAf4u2I1y+R5Kf/iE0HeUBWTQJrmfYWqXR+OE
LVPY3PKUY2N4Hp6HqQPzLLxOvFMRHJZuINI25mM9DDjp/98jphGfocGJSYQs+8IP
K6g1Ln5XwX32uew94Y7gcRijSeyU4e2yebsnm7BOeBxXK04q7r2Se5ceiGkLszK6
idsmMr2lOQ52UVlIpbzbfxO0lBo+IUeWQhWSxJWvIEwu9FM87pM0KxRdIs+/lNQG
0VUlOgq9JnADctYAbR57dNzwT6/L60ejmidFk9gyU0aeRCb/0FEDT4wN5SbXmOWk
SEKB6ZWKFBZE4PIOWKwJ96w+guboURKfxnEuZyhcYlhvu3DBr4IJdkwa3pMV7jDY
gyvc2YLDn8CX6oEMQachW8gQx/VKOXI8Fl8K1nmORQX8eDRqjZwuttBU8FOL4RZ5
afvc9vvP1Pl84tUooQ4rojGfvbSHqw0VjFmE1Rfcw6b+NK2e2/Q=
=aTje
-----END PGP SIGNATURE-----

--UDM9L8RbMLp7eyuG--
