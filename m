Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2AF47EF2F
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 14:29:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JL7Ff14VJz3051
	for <lists+openbmc@lfdr.de>; Sat, 25 Dec 2021 00:29:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VY2cEJRM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VY2cEJRM; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JL7FD4H8Gz2yP5;
 Sat, 25 Dec 2021 00:29:04 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BFA3462043;
 Fri, 24 Dec 2021 13:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1579AC36AE5;
 Fri, 24 Dec 2021 13:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640352541;
 bh=UoajXc+CrR3PRknu7vySK5yIyh1YJBGaJyOtLXOzKGM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VY2cEJRMR/FqszYdH46i/IcbzJjXbzRFxvm67I4wcZogI/x1PCQ4tRx6H6S8F12yR
 Sw8qpqFmBL8l+x5SG/vchXb75Od27/QRQ8ZsFZM4gTMtDKtNaf98MF0hcHbOhcMgGM
 EsqYZFB7l4IAFL9K6FmQishn700Z45I9uz1MYR9JH10TOvlQE6FZa/G5RDpU5dtGns
 6gTZMf9Av5XRrIIylR0k4c+kTJz4uDI6Svzly6SUbamBxyaS7KbSOOdF1lNyK8j8Yc
 4+Sa0kt+HGL17b7stSuFoR12QfbjwUQS3vgmKE8lVBse4JeikaYsGgRNF+vE5PgnnB
 s7Z+mI1aLilcg==
Date: Fri, 24 Dec 2021 13:28:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v6 6/9] misc: smpro-errmon: Add Ampere's SMpro error
 monitor driver
Message-ID: <YcXLGYWx4gYq/Y+J@sirena.org.uk>
References: <20211224041352.29405-1-quan@os.amperecomputing.com>
 <20211224041352.29405-7-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="p1TkcOZIYZMx6FNy"
Content-Disposition: inline
In-Reply-To: <20211224041352.29405-7-quan@os.amperecomputing.com>
X-Cookie: I brake for chezlogs!
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
Cc: linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Phong Vo <phong@os.amperecomputing.com>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, openbmc@lists.ozlabs.org,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Derek Kiernan <derek.kiernan@xilinx.com>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Arnd Bergmann <arnd@arndb.de>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Rob Herring <robh+dt@kernel.org>,
 Open Source Submission <patches@amperecomputing.com>,
 linux-hwmon@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--p1TkcOZIYZMx6FNy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 24, 2021 at 11:13:49AM +0700, Quan Nguyen wrote:

> +static int read_i2c_block_data(struct i2c_client *client, u16 address, u16 length, u8 *data)
> +{
> +	unsigned char outbuf[MAX_READ_BLOCK_LENGTH];
> +	unsigned char inbuf[2];
> +	struct i2c_msg msgs[2];
> +	ssize_t ret;
> +
> +	inbuf[0] = (address & 0xff);
> +	inbuf[1] = length;
> +
> +	msgs[0].addr = client->addr;
> +	msgs[0].flags = client->flags & I2C_M_TEN;
> +	msgs[0].len = 2;
> +	msgs[0].buf = inbuf;
> +
> +	msgs[1].addr = client->addr;
> +	msgs[1].flags = (client->flags  & I2C_M_TEN) | I2C_M_RD;
> +	msgs[1].len = length;
> +	msgs[1].buf = outbuf;
> +
> +	ret = i2c_transfer(client->adapter, msgs, NUM_I2C_MESSAGES);
> +	if (ret < 0)

regmap already supports bulk data access so it's not clear why we
would open code this.  Given that this is a single I2C transfer
it's also unclear why we'd need to export the regmap lock - a
single I2C transfer is atomic at the bus level so the regmap lock
isn't providing any additional concurrency protection.

--p1TkcOZIYZMx6FNy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHFyxkACgkQJNaLcl1U
h9DP9gf/Q0bcZ3lkRyxjxhgET9fowIKusHVDbL3su16XSlv5Rt4Tih9Rf9nu8FBm
oHmRlAtBCP9ZuA+7I743tz+/H2BeISzoGI8aF3h+MPdh2darno04pVGedC2XR1jn
9Q9cu4/TZhXOt7pazpkfUCmxHT4kn3tMDZ8u9XSWHpDX9mh80/IHwyZ6NFgMruKF
RHWAu9RjAeUCOy8tlembNTm+G9EMDKFS2XI44T3/BtW8u3c7WyiMqdr3EICCyHbd
PjXo5uAjGCljZoVoJ7L0+zUYjzvdQvYuRZ+kQfXEX8MPnE7WyV1MREkMSwl/dqXN
0M6wsXHhdztUM4b2EtWrp6M0kem1tg==
=hzut
-----END PGP SIGNATURE-----

--p1TkcOZIYZMx6FNy--
