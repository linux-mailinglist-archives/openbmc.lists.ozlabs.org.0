Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5AA27FF4F
	for <lists+openbmc@lfdr.de>; Thu,  1 Oct 2020 14:38:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C2CMS0jFCzDqVv
	for <lists+openbmc@lfdr.de>; Thu,  1 Oct 2020 22:37:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=PaLlFln/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=fhXov/Tt; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C2CFk72m6zDqTk
 for <openbmc@lists.ozlabs.org>; Thu,  1 Oct 2020 22:32:56 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 367135C0232;
 Thu,  1 Oct 2020 08:32:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 01 Oct 2020 08:32:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=37HAI0LeH8BXJA+NP9qvRiHmLoM
 MpN8JQ/iGE4MZuz0=; b=PaLlFln/JpgsiUu7hwaHyOj1lAIq1Ca5Mqa/W59XDpY
 iFuQUCsE9hCco5oH930pCmr0Cg8x3KdCgpTk3Yojt/Kcny+XSaYnG6MpxzU6TWtP
 Qpu7qgEjO96cpnUSobU9F8nX0PdTZBSIGST4sOlbzWaMDWCuxqr/lkxxbUlXFAe1
 CK83FIItcfFusoI3AERH6ABSBAaXQA5GlRD+fDQWhI1SzhqPtrccLCJ2wKRQ2g/w
 Br5fV9av5wL2qjoQVmnR+ZPJNBlsmAAQFi7RTfIX794tmDe01YVRnOcvzzo3OIYJ
 XS8jlkdDjUGEGYejFkkkM8sgfMWBc3dCoKrU0LvAudw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=37HAI0
 LeH8BXJA+NP9qvRiHmLoMMpN8JQ/iGE4MZuz0=; b=fhXov/Tt2bd8sr42EHvdiQ
 mfvcyfGiWNldcuXu+i2F+f+Wc3FNYbj6L2IeRdZooFRAVXdkPxHibqGCXAwz+5Iv
 g1vZV3kAfbSvl7JGXyaPcTg0AD4zpGBeVtmyRI+6AGW02oQcatlQAOYczU0DsYg8
 yGvvuntNekL5DjWWSGrBfUiSi5MO5so7lbGVGB6ZanlOLz0v2011YPYhQ2LPGqNK
 Pz0T8w0xo3baGTlaR667OOLc3i8BlBnT4MxZ0AOwYErj5lyauyGoxewqOS0mlQNi
 lOm++7tQ9ElrEhRLGmEQyC/iLj5wG9eSJVwIQgEpqvHORVcveE/3CqNHAqlJXxcQ
 ==
X-ME-Sender: <xms:dMx1X5ij0dpUkHFq3pTafNIKgAwVecJmaR_DREy3dNzC8NSh8Zk9vQ>
 <xme:dMx1X-BTU2ycP9imzrITIRidlK66Gx_A9NRkDn_xNWhddLFxEBltH8TIqJkiMaR0-
 ZlXtHgHeEbbiVrQaFM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeeggdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvfedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfduhfeg
 fefgtdehhfektdelffevkefgueffhedtieenucfkphepjeeirddvhedtrdekgedrvdefie
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprght
 rhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:dMx1X5FOtob4SAdUpOYuWqtVnw_CIfdHbv28iCyzKposzJVnabGLJA>
 <xmx:dMx1X-QlxZYDIqbonQ7eGXszYBbsy4qimbTX7S9ENpNC_E7_GL_WKA>
 <xmx:dMx1X2y-bzTwy-pKiBHLW1v3ytb9lg6x04CNC7MT4Z0piTlPBtvbdw>
 <xmx:dcx1X7qJPROK6jmfRUjh41FWUDlRzXRD5b9HKbbB4j0c1ZSCGcSl-g>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id B588B3280060;
 Thu,  1 Oct 2020 08:32:51 -0400 (EDT)
Date: Thu, 1 Oct 2020 07:32:49 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Lancelot <lancelot.kao@fii-usa.com>
Subject: Re: [PATCH linux dev-5.8] hwmon: Ampere Computing ALTRA SMPMPRO
 sensor driver
Message-ID: <20201001123249.GC6152@heinlein>
References: <1601504817-16752-1-git-send-email-lancelot.kao@fii-usa.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7yLcY/JGxB8a0rD4"
Content-Disposition: inline
In-Reply-To: <1601504817-16752-1-git-send-email-lancelot.kao@fii-usa.com>
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
Cc: openbmc@lists.ozlabs.org, Xiaopeng XP Chen <xiao-peng.chen@fii-na.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--7yLcY/JGxB8a0rD4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 05:26:57PM -0500, Lancelot wrote:
> From: Lancelot Kao <lancelot.kao@fii-usa.com>
>=20
> Add SMPMPro-hwmon driver to monitor Ampere CPU/Memory/VR via an
> i2c interface of the CPU's smpmpro management device.
>=20
> Signed-off-by: Xiaopeng XP Chen <xiao-peng.chen@fii-na.com>
> Signed-off-by: Lancelot Kao <lancelot.kao@fii-usa.com>

Nice work at adding this driver.

It does look like you've missed CC'ing upstream though.  Was this
intentional?  (linux-hwmon@vger.kernel.org)

> +/* Capability Registers  */
> +#define TEMP_SENSOR_SUPPORT_REG	0x05
> +#define PWR_SENSOR_SUPPORT_REG	0x06
> +#define VOLT_SENSOR_SUPPORT_REG	0x07
> +#define OTHER_CAP_REG		    0x08
> +#define CORE_CLUSTER_CNT_REG	0x0B
> +#define SYS_CACHE_PCIE_CNT_REG	0x0C
> +#define SOCKET_INFO_REG	        0x0D

There seems to be some sporatic indentation throughout all the #defines
in this file, where it appears you attempted to align the values.  Make
sure you have tabs set to 8-step spacing for kernel code.

> +static void smpmpro_init_device(struct i2c_client *client,
> +				struct smpmpro_data *data)
> +{
> +	u16 ret;
> +
> +	ret =3D i2c_smbus_read_word_swapped(client, TEMP_SENSOR_SUPPORT_REG);
> +	if (ret < 0)
> +		return;
> +	data->temp_support_regs =3D ret;

i2c_smbus_read_word_swapped returns a s32 even though you're looking for
a u16.  By setting `ret` to u16 you've caused two problems:

    * You are immediately truncating -ERRNO values into a u16 so that
      you are unable to differentiate values like 0xFFFFFFFF as a
      register value and -1 as an errno.

    * The if condition here can never be true, so you're never catching
      error conditions.  (An u16 can never be negative, so ret < 0 can
      never be true.)

This issue occurs throughout the driver.

> +static int smpmpro_read_temp(struct device *dev, u32 attr, int channel,
> +			     long *val)
> +{
> +	struct smpmpro_data *data =3D dev_get_drvdata(dev);
> +	struct i2c_client *client =3D data->client;
> +	int ret;

You might want a sized int on this one?  Repeated in most other
functions.

> +static int smpmpro_read_power(struct device *dev, u32 attr, int channel,
> +			     long *val)
> +{
> +	struct smpmpro_data *data =3D dev_get_drvdata(dev);
> +	struct i2c_client *client =3D data->client;
> +	int ret, ret_mw;
> +	int ret2 =3D 0, ret2_mw =3D 0;

Any reason to not initialize ret/ret_mw?  By it being different from
ret2/ret2_mw it makes me question "is this ok?", which spends more time
in review.

> +static int smpmpro_i2c_probe(struct i2c_client *client,
> +			  const struct i2c_device_id *id)
=2E..
> +	/* Initialize the Altra SMPMPro chip */
> +	smpmpro_init_device(client, data);

I didn't see anything in the smpmpro_init_device function, but is there
anything you can or should do to ensure this device really is an
SMPMPro rather than exclusively relying on the device tree compatible?

> +static struct i2c_driver smpmpro_driver =3D {
> +	.class		=3D I2C_CLASS_HWMON,
> +	.probe		=3D smpmpro_i2c_probe,
> +	.driver =3D {
> +		.name	=3D "smpmpro",
> +	},
> +	.id_table	=3D smpmpro_i2c_id,
> +};
> +
> +module_i2c_driver(smpmpro_driver);

Are you missing the .of_match_table inside .driver?  Is that necessary
or useful for your use?  I'm not sure if you can have device tree
entries that automatically instantiate the hwmon driver otherwise.

--=20
Patrick Williams

--7yLcY/JGxB8a0rD4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl91zG8ACgkQqwNHzC0A
wRkYUA/+ItJwUrq2JBKFiOOaHlDcZig/Zad/hXwwI85Z96v/Vg7rX17wtfr8tPWn
swrUfDyQ1Jw6fYGchWVRf9FUlW94R/v0E5wYNzpU7GGzbF7Val1g46RCC8hC5a2Z
qusElxwmt2mKulNkD3PVEr6y1hSoErwyp4gqv2kYMg5x5BQtIU22zsqxpPl7AhUg
zQTCt8kjoVjnx1l/acDsy0bznT4f+U52Z6G1yuEuza4gf++x1qkNZj8dsecK1hWF
pfDLoyoc/9UesRMziwu5iC6AW9yoeEB8l0S6YWBPe+DsEDOPYIZltJtdfU4M9lrf
uphHmBCLtmqUQXmgXuMPX8ZaqqjPzTQkxsoMOz0fjYlRQIuFtmfV2S9uvUjzUnOJ
QoO43zDNoaqWPsqugOohRVILSCWHTHWFs1lsU3d4ZKBmzRK/ybP0aJLwREboVIfQ
tCK28VQjwbrybRw/3RN8+LHIxEw92d7p4G9xrZM0hLMLz4ZYLn4y9JiGYpEgJuNK
9CYhkhHy8DO+X0yfMj+RPNvRToap7AObEEzAsdR944jo7o8ITWHOGJ0U3mv93MI6
XoMyBzi/pM6zHxw7+jiUKbZJbcOVqGhAOckGg/ajQtPjzYYyjnQi8TeaXE4FBR0d
aNvd4Fnh+zigGtd5hwf9cIxW48r7/WpTRzYRXkH1g5IgPUKG6LE=
=u81T
-----END PGP SIGNATURE-----

--7yLcY/JGxB8a0rD4--
