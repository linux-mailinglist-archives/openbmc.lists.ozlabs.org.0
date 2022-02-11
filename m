Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FE44B2EE2
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 21:53:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwQnr3s3vz3bd4
	for <lists+openbmc@lfdr.de>; Sat, 12 Feb 2022 07:53:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=JYooOT1F;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Fqo6PuV8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=JYooOT1F; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Fqo6PuV8; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwQnM3KG2z2ymg
 for <openbmc@lists.ozlabs.org>; Sat, 12 Feb 2022 07:53:26 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 34608320214B;
 Fri, 11 Feb 2022 15:53:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 11 Feb 2022 15:53:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=aG2pgNnHKU+YAKcBY6dsM1LQnJu7+naXjHyh16
 B1uw8=; b=JYooOT1FKQZtuHyZuJhpNilUCu0cjEjRjZHDrWiShPSyQOHHLHn/3W
 O8hMAEFHWiJTLikwot3tJAKlJgEcM5ImY6mQXJWpHgoB5cpN8U98jMAB1TAaqnp+
 dR7n5C7rwQy2Lnn0g0K/pSMuiTihP4u8qkkp9tgJkFlhYruhm1LPopnQMyZATI/C
 wIJuRkukArel/NNKhwU6NRQxyDQFzRYQFW8+hAokoi+W1CR2J/Tuoqgpn/vrtPTR
 CmWYPQjMD9RjanaoL+w+Qs46b3+0aD/uwfrW/C8vfJJgLpBMCm7GWkVWyxyOmIFJ
 CJXrnee8U5jfyEnJTPIWbvfP81JQhkDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=aG2pgNnHKU+YAKcBY
 6dsM1LQnJu7+naXjHyh16B1uw8=; b=Fqo6PuV8zMNydW/4RCwqE8lxZyls9UD3B
 l4LcGFuXBjwRca+uzrra3GCY1N19Z0HHZZY9wiYhDhmEzEkHONuBs01C507KRrZ9
 wwvPWkIUm5ZIJIovWKqMbQEWN4E3XCXGyHV4lM2OA3ncQw2poTlcLIN673DVXf1V
 YZHWjNdeB+Qd4UyNsvGYd75NePxA8CHFrH2ATV1IDbBIYVc42wiHXR1U/MiXdCwK
 zd+0x1VBFPJyrVtgbW7vWtOEPcEE30KgN9lU4MCgVoJkNQxhJX5NVnBhCPeQrB1T
 DDu4mavrmCnwHMFn1oTLHbGtuaIuiVerVIjDhp1x9E/bi/T+/Njkg==
X-ME-Sender: <xms:wswGYtrpKsrNkrovQdEAd0l-Hhki_lhWeL26os9xrqkhU1WXG4DOXQ>
 <xme:wswGYvqJTYsug5dUfjZ4FrRSKKR9VMnhJKX4g4Dy_8Ab0Otsq6WyYmP3VtbIVyhs0
 03pDAgQlRd2TKuha68>
X-ME-Received: <xmr:wswGYqOz0u_OUkN07Z8yqTK7ikIwjxDAon1mgT1RbXiSKWk-fFW6_9WjEybRkYM5zV7MGIHgQQCA-McnMLybZqXReCyydA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrieefgddufeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 jeenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepkeduuedtfeeihfehfeehfedvjeeu
 jeeikedtteehledvhfelheekgedvieevkefhnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:wswGYo5aQqMo3MWwNU4n_KrS0I8KAETM1dpyO5JwMGEP4jm7-WLslw>
 <xmx:wswGYs7mx_uEC89CxuyKfZeIjgaT1i1TcYkyDgFl1hQDi8UrGQycFA>
 <xmx:wswGYgj2SLjBVrfLLUmlgXGL23hoplI68pMRCzXnP7s2JZ6PsSzYkA>
 <xmx:wswGYqTpqKVBSrrbdFIc6tbTuot0SCbo1kNCnHfra1wv3laot-JdnQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Feb 2022 15:53:21 -0500 (EST)
Date: Fri, 11 Feb 2022 14:53:20 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Shawn McCarney <shawnmm@linux.ibm.com>
Subject: Re: No dbus objects for phosphor-regulators
Message-ID: <YgbMwFhqMO5ikp5E@heinlein>
References: <9aaceaed-1a8a-6a13-d650-8f4678d267d4@linux.ibm.com>
 <6D1561E1-59FC-4126-9271-A7C8BFDB0B11@gmail.com>
 <1858988f-100f-b3b4-c599-80cddaa7247a@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Mr17tZS2tp9o/wRR"
Content-Disposition: inline
In-Reply-To: <1858988f-100f-b3b4-c599-80cddaa7247a@linux.ibm.com>
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
Cc: openbmc@lists.ozlabs.org, Mike Jones <proclivis@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Mr17tZS2tp9o/wRR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 11, 2022 at 09:32:13AM -0600, Shawn McCarney wrote:
> On 2/9/2022 4:30 PM, Mike Jones wrote:
> > iPad On Feb 1, 2022, at 10:38 AM, Shawn McCarney=20
> > <shawnmm@linux.ibm.com> wrote: =EF=BB=BF =E2=80=8D =E2=80=8D =E2=80=8D =
=E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=
=80=8D =E2=80=8D =E2=80=8D=20
> phosphor-regulators currently communicates directly with voltage=20
> regulators using i2c-dev; it does not use device drivers.
>=20
> The reason is that most regulator drivers provide either no or very=20
> limited ability to configure regulators.=C2=A0 For the systems I work on,=
 we=20
> need to do extensive regulator configuration to fine tune things (output=
=20
> voltage, pgood min/max, timing, etc.) Redundant phase fault detection is=
=20
> also pretty device-specific and on involves communicating with multiple=
=20
> devices.

Out of curiosity, had you done any investigation with getting the support y=
ou
need upstreamed in drivers?  If you had upstream discussions I'd like some
pointers to them (lore links) since, as Ed pointed out, we're having design
discussions on this same problem generally speaking.

--=20
Patrick Williams

--Mr17tZS2tp9o/wRR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmIGzL4ACgkQqwNHzC0A
wRktNg/+K1bX2FPutQ6uyjfXbWWHLRxyKKwiDxR+6DPK7UgtUDiOV+7TtiZUCxpZ
yzPcp3PkYyDToLp5qXxl58bHjClYc/4pRm0fOecA09r18gU1D/7PP4w9UJFewwVQ
dpWdeuNqK5ut8hrdI7q5bfjnWRLfzYp7o4TuCAqeveVyo/XzcG8lf7hdCU+o5xHE
TuLpijdJpKptHZx3XrhltViNuK6qp9N8ygwxKakB9dEUWb8gqYxsrFN3FqCdzbo5
fKL/li8ct071LDUf6RpNTXSy3dItR81agaj9nmRBOShuBrR70xFc2+fQTvLLc/QR
2RrLYzrJovECwlQf8jn6E2GhEiCItZxdmlqIDBocJynUOv1oAsVoCw4NTs+oRXT2
FpGyWZuJK4znMp61ePNF2kli4ya+IEOXP2Bf0EEuAG8tTCB79jxj2GosHUdzi25A
Ml/JDbnu4LWFvV39v8wRuqUIv67tzi/13v3Hct6x+Pwo0fuFWdPJT3/LNGfp2Etz
f9b9I8W1DPLVtwwFzr1itJTTjg9iY+wXc1TaDqHrKr5OEaGwyy1btj9V5nWPCarB
+Zosdf3A3LXoft9QltWdvOM2SRl6/e+EfSS4WQZzlz0TS/+kxqaMdfmW3C/kZc7j
9tzS3uB4s543kYd2Ui8U4lVnS6+/FxM/QALYLcKmesIsXyzhFdw=
=9dCo
-----END PGP SIGNATURE-----

--Mr17tZS2tp9o/wRR--
