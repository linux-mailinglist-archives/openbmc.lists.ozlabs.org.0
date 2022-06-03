Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5713353DEAB
	for <lists+openbmc@lfdr.de>; Mon,  6 Jun 2022 00:40:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGWls1ldkz3bcj
	for <lists+openbmc@lfdr.de>; Mon,  6 Jun 2022 08:40:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=irrelevant.dk header.i=@irrelevant.dk header.a=rsa-sha1 header.s=fm3 header.b=nYy0O1P4;
	dkim=permerror header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha1 header.s=fm1 header.b=DWYLET/+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=irrelevant.dk (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=its@irrelevant.dk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=irrelevant.dk header.i=@irrelevant.dk header.a=rsa-sha256 header.s=fm3 header.b=nYy0O1P4;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=DWYLET/+;
	dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LDsQL1X7dz302D;
	Fri,  3 Jun 2022 15:49:12 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 4D2485C013C;
	Fri,  3 Jun 2022 01:49:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 03 Jun 2022 01:49:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
	 h=cc:cc:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1654235347; x=1654321747; bh=lI
	jU4LaO1rApVvOShyS8GsBVRsoSsVXvjryTJrZtKjg=; b=nYy0O1P4Jg3wrrSfTQ
	i1ZV2JXrHfgfVbbmBZe862UKfJaGUqdX3KZuUZnKHPsAiNp7fsYkCyJj395RHnna
	NX8ziLucahVzPWgc3eV+EIBy6f5XnqRrdY3QY6OZyY8jLiVSlSptBu1NYNTKKlUg
	wzli+cpj+QudXBh4uJqCBvKA8Kdd+N5BfJnEwBwTdvNIaO49gwdMfhQ/LOzpDEXM
	Uyy65GIQqWBls0aVqyiU4Oz4DjMvfp35igT54Es2ef5MtYoq03nPd87EoOb4yDuh
	5nLMDaYkvI9HvS6QOFV8eyvpPpAoWvjm0cFflfrgdqlikGx+4jgxIgGXyBfIEIvp
	Vrtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1654235347; x=1654321747; bh=lIjU4LaO1rApVvOShyS8GsBVRsoS
	sVXvjryTJrZtKjg=; b=DWYLET/+XU0wgIpSjFaGJqNfUWigRsswi65wQSs1vnYS
	zBmqyej4l+7Eyh3eOfJargM2gMrF8Ty9hUZBmIEnAUzfIdKCme9rQoN6z9H6HQxt
	p5RuAQHXZNlZBNaIwCEJlDz8ldxjqbt+SsZtsxAVdEE2qsAWHyHwj4nrUVHNYlHg
	qIMAOtpMEaFMyWBSx4uyv2BecJrpOfIeAMML3R8ek7N3IP8/I/D8BPEO8UzmOpAK
	G1qq8FxEd3OMW6spsu3yk2apr/YJlX5eaUVM0jvBwT0QvAG9lTCs39jaBgrgZbsb
	y3yqLw+f6f9IAfAQvwYjZWGztIR6IQYZGw+8e8qZcQ==
X-ME-Sender: <xms:0qCZYmx_z6_DqH4Me6LAylQuyrsjgqyeTNi3FqNR3vhNCsw-k0JHNw>
    <xme:0qCZYiRlWq-4IJNRYwf44fjmlXXzDHu2V5SRmkfEnLEmQDWaIGGV3EPyzwe-RpiVI
    TfxtTbDYdtKKbyIsTY>
X-ME-Received: <xmr:0qCZYoXA60zcQ31LtSBRgkprWwnkI8RgQGCwXCpxWCNjGoZXWuUjXvWSxGCLg1P1Hmkt7L2vvUE3yUj2iA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrleehgdellecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
    ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
    gvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteffffej
    veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
    hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:0qCZYsji16QNHoWnUZyivblJITBw7cfdpqBySyBx8Jpi-QPp7BQL0Q>
    <xmx:0qCZYoADT-KyZuTywC0LYuIq19GkQ721risq-V9BStA_XTJqMUyCiQ>
    <xmx:0qCZYtIZsBNGuASds4zG95lJRcHQN-rZRliBCaIHcLtsjKlsS_M_Mg>
    <xmx:06CZYs51fTr8av9ucwhbWcQ0ev30R5OcwABGfGFsbxrxmG32wTT8uw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Jun 2022 01:49:04 -0400 (EDT)
Date: Fri, 3 Jun 2022 07:49:02 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: aspeed: do not mask SLAVE_MATCH
Message-ID: <YpmgzroKbMO3TIsY@apples>
References: <20220602054842.122271-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H0uRup5aAnlYFzFn"
Content-Disposition: inline
In-Reply-To: <20220602054842.122271-1-its@irrelevant.dk>
X-Mailman-Approved-At: Mon, 06 Jun 2022 08:39:16 +1000
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, Brendan Higgins <brendanhiggins@google.com>, Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, Klaus Jensen <k.jensen@samsung.com>, linux-arm-kernel@lists.infradead.org, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--H0uRup5aAnlYFzFn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun  2 07:48, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> When commit f9eb91350bb2 ("i2c: aspeed: added slave support for Aspeed
> I2C driver") added slave mode support, the SLAVE_MATCH interrupt bit
> (bit 7) was not added to INTR_ALL and so will never be set by the Aspeed
> I2C controller.
>=20
> Fixes: f9eb91350bb2 ("i2c: aspeed: added slave support for Aspeed I2C dri=
ver")
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
> I am working on slave mode in QEMU and noticed that the device would not
> generate the SLAVE_ADDR_RX_MATCH interrupt. This patch fixes it, but I
> do not have a spec sheet on the Aspeed, so I am not sure if this is the
> intended behavior?
>=20
>  drivers/i2c/busses/i2c-aspeed.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-asp=
eed.c
> index 771e53d3d197..7f432babcd72 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -86,6 +86,7 @@
>  #define ASPEED_I2CD_INTR_ALL						       \
>  		(ASPEED_I2CD_INTR_SDA_DL_TIMEOUT |			       \
>  		 ASPEED_I2CD_INTR_BUS_RECOVER_DONE |			       \
> +		 ASPEED_I2CD_INTR_SLAVE_MATCH |				       \
>  		 ASPEED_I2CD_INTR_SCL_TIMEOUT |				       \
>  		 ASPEED_I2CD_INTR_ABNORMAL |				       \
>  		 ASPEED_I2CD_INTR_NORMAL_STOP |				       \
> --=20
> 2.36.1
>=20

I've been informed that SLAVE_MATCH should always be generated,
regardless of INTR_CTRL, so please ignore this patch.

--H0uRup5aAnlYFzFn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmKZoMwACgkQTeGvMW1P
DemGlAf/aII/yHlSNHBjG7id0U5uz2uhWKpOBXclCdnrJdDhxNxlXN1R0rGlpUP4
1PX6c9dlVwPdyO3xiu6egzUsvwJdQ8i28xjZZldVIYtNKC4ruvEaR/PCjCQGBRzh
p5QaZAseo1PoAj1M5JJupcgrs20SSoVWs9Sr0X2qNEaCsCgQ3+E1NXS0qhf+0tp7
DXfw6ICyofMrm8Qmjz6WX6f0+SedpmIKBnzxAgyG5W9a/6jC2tWxNEam/W3bozA9
x412Op9vT2UtrN3jHy6gnJQR+mJfMUTk24kLTk1htmBWyY0HP0lRtFex65EVxozO
uuQMHDRxT54gNlrroIl9Rx1qmS3LvQ==
=6I9B
-----END PGP SIGNATURE-----

--H0uRup5aAnlYFzFn--
