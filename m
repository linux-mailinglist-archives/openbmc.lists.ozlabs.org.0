Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B921E7DAC
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 14:53:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YPcs6pBNzDqjg
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 22:53:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=Ybj7/QAu; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=3m0butx3; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YPXq50nczDqdp;
 Fri, 29 May 2020 22:49:46 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 193AA5C0049;
 Fri, 29 May 2020 08:49:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Fri, 29 May 2020 08:49:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=o2j+GY5asK27Z1VXoeFg0Uoi55A
 sdOpx7sMJH8MuRHo=; b=Ybj7/QAukMZ2eqJn4hVYesRxus97pGGeFCYfc4T0o5x
 mZwE1FL1AgxI222XAzpCYWv6PODswHS9QhGCyK7bKLQaIG8Gf7QDrV/uEIM8ZXvp
 ncO20bL+Z105xckhwJcrlG6m1iNODix/ca9WVqBbXkNnnbF8RslOB7xIV/SX4nWX
 ChRD0yL9FBU4KIswmEQQryfQH5lFVnWZGnNqWlI0CN3meHOxwm5ndPkpCxkWW5gv
 6zNgCOfMFBI4JcNasWaXndXmYkJfVcfA9yL8IR46N4FKzeRcuoP6sJkOseB5NlnX
 Ho+XrO/cZq+vrQ24vs58zhFT6XOuWmuWJnJmvB0MwjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=o2j+GY
 5asK27Z1VXoeFg0Uoi55AsdOpx7sMJH8MuRHo=; b=3m0butx3K2ljKcp+zUwcpd
 iHBRp8m6wRpqOiXBhiW3ey66+MxnsL4A83d4dU279eujA3h8Pu8uEtWi3VvLwUlK
 AnoNVie7qY5a0RDVwuZzEaWND23spz4QD9VMiQ+kssFEgj6c2++4QEnuU6n+cJuJ
 LSBbFCjgvCPqWPxj+mV7FKtatNtzkR0NOmfG6PIstweSI0IALecHpcCS9mOMB8Se
 ws+e+pmOWWFiNCndVHPKdSVba1zIH8Moph69zMkpedmh4Iei+xrTcvev9zKkmxLD
 bqx/qUU+w2nAFCejILPGh9P3WogB5tgMw6EqLkdWFTVyJCfbznM8hY0qPSco1mkQ
 ==
X-ME-Sender: <xms:4wTRXnsxRaB8XQ3GQ3Fk9_zL5DtwZF5PzveIfjskwrc5I-fRyMzKWA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvkedggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 epvdffgefgfeetiefgtefhieevuedugedvgffgjeefheduteejfeffteektdelhefhnecu
 ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepjeeirddvhedtrdekgedrvdefie
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprght
 rhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:4wTRXoevRPcyxIlou1UDDUHyTdo1CLeMIouOfVSv6v-bya9qW4LKAw>
 <xmx:4wTRXqxexteOxLmYwb75EG_winlbEoBhzOL3SSGpzwXP4MF_OTONMg>
 <xmx:4wTRXmND-MsmRwr_EgLiUDq_ojEXcoOcnuyy_6FBLGEip7bjbNcC6Q>
 <xmx:5gTRXinHhCCJ6q6687rNz9MHL1ovPZEWYfS-9YAvYNtPhNOfo5yriQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 86C1530618B7;
 Fri, 29 May 2020 08:49:39 -0400 (EDT)
Date: Fri, 29 May 2020 07:49:38 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
Subject: Re: [PATCH] hwmon:(adm1275) Enable adm1278 ADM1278_TEMP1_EN
Message-ID: <20200529124938.GE17541@heinlein>
References: <20200528141523.GA8810@cnn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GxcwvYAGnODwn7V8"
Content-Disposition: inline
In-Reply-To: <20200528141523.GA8810@cnn>
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
 linux-kernel@vger.kernel.org, vijaykhemka@fb.com, patrickw3@fb.com,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--GxcwvYAGnODwn7V8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2020 at 07:45:23PM +0530, Manikandan Elumalai wrote:

Hi Manikandan,

Adding the PMBus maintainers...

>=20
> The adm1278 temperature sysfs attribute need it for one of the our openbm=
c platform .=20
> This functionality is not enabled by default, so PMON_CONFIG needs to be =
modified in order to enable it.

Vijay already mentioned the Signed-off-by here.

Since this is a kernel patch and your first time contributing one, please
read through:
    https://www.kernel.org/doc/html/latest/process/1.Intro.html
and the MAINTAINERS file.  Another thing you've missed is using the
get_maintainer.pl script to find out who you're suppose to CC.  It is
fine to have additional CCs but we're missing the pmbus maintainer on
this patch.

>=20
> ---
>  drivers/hwmon/pmbus/adm1275.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
> index 5caa37fb..47b293d 100644
> --- a/drivers/hwmon/pmbus/adm1275.c
> +++ b/drivers/hwmon/pmbus/adm1275.c
> @@ -681,6 +681,21 @@ static int adm1275_probe(struct i2c_client *client,
>  			}
>  		}
> =20
> +		config =3D i2c_smbus_read_byte_data(client, ADM1275_PMON_CONFIG);
> +		if (config < 0)
> +			return config;
> +
> +		/* Enable TEMP1 by defult */
> +		config |=3D ADM1278_TEMP1_EN;
> +		ret =3D i2c_smbus_write_byte_data(client,
> +					ADM1275_PMON_CONFIG,
> +					config);
> +		if (ret < 0) {
> +		dev_err(&client->dev,
> +			"Failed to enable temperature config\n");
> +		return -ENODEV;
> +		}
> +

This code might work for your design, but likely doesn't work for
everyone and isn't likely to be accepted in its current state.  I think
you need some kind of detection logic here to know if TEMP1_EN *should*
be enabled.  Do we need a device-tree entry for this?


>  		if (config & ADM1278_TEMP1_EN)
>  			info->func[0] |=3D
>  				PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
> --=20
> 2.7.4
>=20

--=20
Patrick Williams

--GxcwvYAGnODwn7V8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl7RBOAACgkQqwNHzC0A
wRlUkA//cEaRIkB+xtcDWW/e7neekDz/LQI62l2pYd0sfnQQNnDNO0j86e8xO50h
mnDat8c7sEbZNn81ye0wwAX0sN2+Nba5kyl/EYH0tpLfqiqz5QSQDsECFYquZ3bZ
8Hn7ail+Z+FkZOKwOKtAiPm0cXR50DgRZKKcyvF1gHQXwUlYG9n5jxvtyll05VJr
qlr9K/2+Mljn86YyqBie9YlxwE/He+iumE1PR/gWAelB357CtoS6uAjgk0Nu4WSJ
EkMOu/GoivEfBBu/6OlLOG3/riCULgIr8q9lkabUTh6r9+xTzM9RmXckMUTia/Y5
dMXgPMkwobgA62Hs+JDO4irlSmGz8Xzl5LOG1EB3C6z+C14P1oI4K6t6TaCnW2fx
V8xcTCrlNNlbXEbKKXFJOuGGb5BCpEI2mnqcbx/yB+dTXWzgPbrYFjcO5cToZD0/
E7IU4CpQ3o26u8/dQ9irHrGQIQjdRNr9FaNwuUfKZMBcqowh6awA95ton3tpZ+Ns
qrOyAjPbmkokPglGe4BYg20Z3JNnioZzG4s+9+4unK3U+AqvHNHirz43LCXzgyCk
oeigei7klwJX9FUkUF1m2cxo2oJDX/hX07BtemWBnY25kvlL+zCJ7U/BcOfQC8T5
M8jeCwLfEl4G1oOrVND3Q0I2KKMRVxKwxRIxWJLx1qY9j0GzhaE=
=YCrf
-----END PGP SIGNATURE-----

--GxcwvYAGnODwn7V8--
