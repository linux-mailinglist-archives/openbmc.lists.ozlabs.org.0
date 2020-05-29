Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B21BD1E856A
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 19:43:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YX3V4HmMzDqX8
	for <lists+openbmc@lfdr.de>; Sat, 30 May 2020 03:43:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=cHIwRIU4; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=RXIK9SBB; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YX2N1ZhVzDqfB;
 Sat, 30 May 2020 03:42:19 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 3D1D55C00C6;
 Fri, 29 May 2020 13:42:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Fri, 29 May 2020 13:42:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=2Ex0Zz9wch/zSb/rCqS4cQz/tb0
 v7syYM+3Nel7cQ34=; b=cHIwRIU4QvItb2KSd7e2X3jH8RI60S1d/s6dC7NBJKY
 te8RbSYNIou5ER7k9EZkbZWJaqdgVPKAAVUyDSfQfblX5eoNDtzdBDhSON3zdoLv
 kOVj0sxFX5gI97T5meTaksqWZvqGVp/R8RaGLAGIiiJud5OKFsUtDzO4Q3/6j/rk
 vqBlbkaTsFBSSbAAiQeqoZj6/6XVdeETNlzU3VLLpiPSL/s4Df3n6PySluXz755D
 8ckB0wZQT0Kzem9cEHRSxz8jBCDN6vE1qZqVYkrIdOCgUcbDvDBDq2SVAP6VFkkX
 IwpwMl4gXJzhobH95n7nzWZObsLrnxjPrCaFBqz1lvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=2Ex0Zz
 9wch/zSb/rCqS4cQz/tb0v7syYM+3Nel7cQ34=; b=RXIK9SBBXLKmBUdVf4JeFC
 ok4VUhfODOIKKfqM3MC5AfW1nBcpJQOrbQynix6XOhzPahAPu3N+rEZxRj3hV+6Q
 5wLcMabHcJUAPyali7p+C5IpE9RykMUGe3/Mos9fLNqGJoTgqGjKiREwf/y5jpwV
 urodvK5McremY3J+KkrXUrR4Ld/mghxRbDVtaKIrmZpOiy/TP8LJnetzBJodL4Zb
 W1cIDr5Vn219tYqbUaktJ38KeVRDnbQT2ZkQJybZ6xXia3hOtnh31Rvp+9qM82Fp
 EZIqLyhspm115dn6E9n0PrFO0djCDu6tGdy2KWsOThoJY49epUBfeLJT1wI1zwyA
 ==
X-ME-Sender: <xms:dEnRXuetVY83Wo2Nhu63G9DYp-vzl0FuWAlpm5WoeiuKOF4cebHoIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvkedgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 epgeehheefffegkeevhedthffgudfhgeefgfdthefhkedtleffveekgfeuffehtdeinecu
 kfhppedutdejrdelvddriedvrddujeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:dEnRXoOxouwawySHiyIhND7MzTFBPGm2lyq6hn6huoB2fmOlFpWjEQ>
 <xmx:dEnRXvie5SKeJ_4fqs_bulUliv6d3GkoOQuEhvEmqBfm5NWmBekwrA>
 <xmx:dEnRXr_rGgqrmMvm8zrxKLpPB_593b5Enlt-ttiSzpTNh8PlQagOjQ>
 <xmx:dknRXuhaNihPZrQ1WwdNgzr1zmhFl0AUnhFHb6KH-kT1daoDqG10Gw>
Received: from localhost (mobile-107-92-62-177.mycingular.net [107.92.62.177])
 by mail.messagingengine.com (Postfix) with ESMTPA id 41EB830618B7;
 Fri, 29 May 2020 13:42:12 -0400 (EDT)
Date: Fri, 29 May 2020 12:42:10 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN
Message-ID: <20200529174210.GF17541@heinlein>
References: <20200529124607.GA3469@cnn>
 <49485085-7cc7-9e29-a719-98d1e184378b@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qp4W5+cUSnZs0RIF"
Content-Disposition: inline
In-Reply-To: <49485085-7cc7-9e29-a719-98d1e184378b@roeck-us.net>
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
Cc: linux-hwmon@vger.kernel.org, manikandan.e@hcl.com,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, vijaykhemka@fb.com, saipsdasari@fb.com,
 Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>, patrickw3@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--qp4W5+cUSnZs0RIF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

Thanks for the initial look at this.

One question for you below...

On Fri, May 29, 2020 at 10:30:16AM -0700, Guenter Roeck wrote:
> On 5/29/20 5:46 AM, Manikandan Elumalai wrote:
> > +		/* Enable TEMP1 by default */
> > +		config |=3D ADM1278_TEMP1_EN;
> > +		ret =3D i2c_smbus_write_byte_data(client,
> > +					ADM1275_PMON_CONFIG,
> > +					config);
> > +		if (ret < 0) {
> > +		dev_err(&client->dev,
> > +			"Failed to enable temperature config\n");
> > +		return -ENODEV;
> > +		}
>=20
> This can be handled in a single operation, together with ADM1278_VOUT_EN
> below. There is no need for two separate write operations.

I don't know if you noticed here but the change ends up enabling
TEMP1_EN in all cases.  Is this acceptable?  If not, do you have any
preference on how it is selected for enablement?

> >  		/* Enable VOUT if not enabled (it is disabled by default) */
> >  		if (!(config & ADM1278_VOUT_EN)) {
> > @@ -681,9 +697,6 @@ static int adm1275_probe(struct i2c_client *client,
> >  			}
> >  		}
> > =20
> > -		if (config & ADM1278_TEMP1_EN)
> > -			info->func[0] |=3D
> > -				PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
> >  		if (config & ADM1278_VIN_EN)
> >  			info->func[0] |=3D PMBUS_HAVE_VIN;
> >  		break;
> >=20
>=20

--=20
Patrick Williams

--qp4W5+cUSnZs0RIF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl7RSXAACgkQqwNHzC0A
wRmWhBAAl+LdXJe7Ab9nypMWBYkhPdmwxWp+qtt+f4CFJyorYFFDNC01yFawHWIz
bBd+VP5hoLPgHaijLr44ZV/UauINiggqaqEEETcfyXymPXMCCsv9Vp1by4jIGe2h
AQRLdIMHDxBrDNgAnLRL1oBoRENn9fA+8K1c2rp/+HQxicdGdj6huxaLhqpLm1gk
g/U5uP5L5T27xER1WxYiUUgsnl0I8gxWH3Gg7trT0g+YUMVofCuwXZIeUXTD2mkN
I2wpNfA/duL+HtHyHExA7UAyOOX8m6obWFaYZ8hxuJvbM2K7ztUmCSUgNb5WIXUi
E4OCYNIhcEjd7wKtM2tWiRYHRAEH2NdPRqpcPKTHeY4aOnpZoHdDuX9pXU6nsFoo
kG9Dy/uOWUH9tzjzZs5p3Swo2FwnHhavWQV/cIycJE2akr1uPh8S0Db9WG701tQ4
BaNi/GAz97hpq37kBuNqnUtspugW4b5wVQ/N5JZD0dr9Iego7bdCd3zF5vu6fnnt
k262KDW3+x8vQT4/dWKF4IY01g6EXBmWZZiounv6Gkg/r/GOipRep2kRvGWN/Wdp
4hZFty0CH7DoNWVaMaJntIJtMW88JRKRJ49iWD5V6GhQptNcdYStgwiL4dPF2eK/
XMO3oKnuTPg5jgvbsNSSnfJlHcevHYcMD4jQ3/xj1RJLaxteEyA=
=TuCV
-----END PGP SIGNATURE-----

--qp4W5+cUSnZs0RIF--
