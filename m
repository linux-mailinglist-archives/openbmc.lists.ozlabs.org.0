Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3538A5EFEA8
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 22:33:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdlS715HRz3c6K
	for <lists+openbmc@lfdr.de>; Fri, 30 Sep 2022 06:33:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=LeFYCHPy;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=VxkVmctj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=LeFYCHPy;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=VxkVmctj;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdlRc4JG1z3bSX
	for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2022 06:32:59 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 2BEDD5C0127;
	Thu, 29 Sep 2022 16:32:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 29 Sep 2022 16:32:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1664483575; x=1664569975; bh=Q+uMOvHkSZ
	zburJBKEfVTBtBWJnv7xWvs6jZ1M5gquI=; b=LeFYCHPypX92h+R13XWpdFN7P3
	IEbQZ186pO9VWnuKWacc2mIEpgzyDRmaz2m60zdnKaV50NhIGxP5Fr9RWdh+BNjo
	ir6/nB/BMxuD3/vgoiLXaaQURZOq5DFywrHPvNj2iAt2ZwWCYgVWozRIFAJY3mho
	bauIp3mAh6fX5qSzGt5yIMFwDROLBdccYlPTJ7ioZEmnWEqVmKYjJxQlOnDsGn/h
	wg2llLrfQMLeqXO7E55AeFB9SQUBsOZfljSv5XRbx+iSfsdrNIXWd0JpoJJNi4lp
	6Cd18D30RaXMKjm5sRHKio3I0jDxdkticVMysJg1qTDTrVzmHCwj26CPi+NA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1664483575; x=1664569975; bh=Q+uMOvHkSZzburJBKEfVTBtBWJnv
	7xWvs6jZ1M5gquI=; b=VxkVmctj9AoCGrro2tsOOXlvAMfua/bwke/v+qrJFeIT
	szsj1yJcYWtN2Lf1CrLNzeJopYK5ctGoPUiGMmLvzRN4rBFlX91/enULDfGG7LHG
	HmPUWPT12jXKwSfBuaL7VmKbl78169ueVnt3BgRoGjg5q6Xz8tnDT749dYiG7uuU
	RpjGsfnz9XUCPVw8Inlu+Jk+DJHR28uH7CeAxbSbS8nNkKw4rkc/d31/3q6QhKhm
	5o+Umc9GuC6kwV9cyuT9qF1YrkcmQls4uj3GMA/EZlyvET6be6DONee7FTyC4O05
	IMtba6FqbKSgF29Mx2VEJZV+qIsxhNQ+8inPtsl1NQ==
X-ME-Sender: <xms:9gA2Y4swohZ1xYvc6LtAfD1I3nAwmr3tJfElonXQR8c7sl5wogKBhw>
    <xme:9gA2Y1epxex6u7FK1ruLT20HuF2QLgYWGUtSivvpfV6QH52zxogpnz98cVp710Zg6
    G1_Ygfsmza07Z3M2GI>
X-ME-Received: <xmr:9gA2Yzyc4es_xXrpHd81JuOZWVeYp-XxKsioa70eVFR4ZMXxtugvwlYxBiX-wqgeIfjdlubVrFXtDd69Mz0Q_qWMP5XZqPkk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddgudehvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculddvfedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreer
    tddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepjefgtdelledvfedtgeegffef
    ueefveegjeekleegueejveevueefiefgiedvjeejnecuffhomhgrihhnpehkvghrnhgvlh
    drohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:9gA2Y7PZoHVFcC94cZkVITHOiRW2ox-Q1BGeyrae1jRaGjFDS0MrHw>
    <xmx:9gA2Y49HW8BaWEa6Jg0I4UeSM5dwVRFnelMwXyZmYvccVaBZ70K0Eg>
    <xmx:9gA2YzWO4mOwGqj3B4-98HRnPGaIpPAzK6QwkQungTlR4FGD5EcGpA>
    <xmx:9wA2Y2lIKNBBtLknYrc-dh3Ce2EHhWKr8IOx060GSsQmtagnJ6RG-A>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 16:32:54 -0400 (EDT)
Date: Thu, 29 Sep 2022 15:32:52 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH linux dev-5.15] leds: pca955x: Fix
 i2c_smbus_read_i2c_block_data return code check
Message-ID: <YzYA9MoKr8BwSpJx@heinlein>
References: <20220929191848.247164-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OVpYX6REZYE3Z8o/"
Content-Disposition: inline
In-Reply-To: <20220929191848.247164-1-eajames@linux.ibm.com>
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
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--OVpYX6REZYE3Z8o/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2022 at 02:18:48PM -0500, Eddie James wrote:
> The function returns either a negative errno or the number of bytes
> successfully read. So, only return for a negative return code.
>=20
> Fixes: c9fb275212da ("leds: pca955x: Add HW blink support")
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/leds/leds-pca955x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
> index cf0a9fe20086..cba9876b1187 100644
> --- a/drivers/leds/leds-pca955x.c
> +++ b/drivers/leds/leds-pca955x.c
> @@ -689,7 +689,7 @@ static int pca955x_probe(struct i2c_client *client)
>  	err =3D i2c_smbus_read_i2c_block_data(client,
>  					    0x10 | (pca955x_num_input_regs(chip->bits) + 4), nls,
>  					    ls1);
> -	if (err)
> +	if (err < 0)
>  		return err;
> =20
>  	for (i =3D 0; i < nls; ++i)
> --=20
> 2.31.1
>=20

I think Potin sent this same patch 2 days ago:
    https://lore.kernel.org/openbmc/20220928085701.1822967-1-potin.lai.pt@g=
mail.com/

Would you mind sending a Reviewed-By / Tested-By for his patch?

--=20
Patrick Williams

--OVpYX6REZYE3Z8o/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmM2APIACgkQqwNHzC0A
wRnceRAAicC+UYUm86SCmh5F2gWKHEenPlutSWcKPZwSPG9iPqJFreKDvlfWonPi
eNamUgVniVE7u2SiLqZ5oisR4s5E2jPjQb5LYqvGun4i1kVi+HKu53zZc8jdMRjp
U7OMtN+u2IkC8Tp/1ZXmFKtUIU9pHAerxU/IqvXmu+LZ8fs0pnmyvkeOMI9E0jRj
WU6C5pl3Z4WefWg9syUe5XLdSVi1mJWfP0Xzul0IN+hjAeMlOk0oPLFyz93AwPXq
NbX5eNIJDMkEWgMaZzYEozWNzc3VMaozgOkKAAqNjkX6GXP+6PAvcjPyKMdCDmze
fMfpwkX6RigibuI9QiOhP7Ni26y0Q1E7xoLKDxmbnre9RqF89WeMe+blwKCDzEYn
YMnFV5ph89qtwa7khiOqfaopIDQGgUWom1+Nvj20wTF6OR3izrsQDi/tveTb5dcZ
cg+mwltszazDwzF7bM43nvBxUA7Ukwa48wauCpwZ+baGGS9Kn7K8cESYPJeaH3GP
Orwenx9qGod1dHICh5aTdCaKPbDZ6NHBlM1FgLeYHv+i75cvY1m5J0lJDpaJBL4b
CocNuq+l/4pFVrFjaWxZ+cwRZIo1JRR6A+pI6hq9dhyke+ueOZm5lOR8kMzLD2x6
WEjq7NGFzmpiCwdP/jjN516dhfYaH//+I/Yfr9GYYssFU9+5nLU=
=Jzv/
-----END PGP SIGNATURE-----

--OVpYX6REZYE3Z8o/--
