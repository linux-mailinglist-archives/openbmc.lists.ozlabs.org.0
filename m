Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A534C14A7
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 14:49:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3cp64Xgmz30Mj
	for <lists+openbmc@lfdr.de>; Thu, 24 Feb 2022 00:49:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=ck4ZEG8V;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=LM9oywF1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=ck4ZEG8V; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=LM9oywF1; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3cnd3Dkmz2xC6
 for <openbmc@lists.ozlabs.org>; Thu, 24 Feb 2022 00:48:35 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id C6A225C014E;
 Wed, 23 Feb 2022 08:48:29 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 23 Feb 2022 08:48:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=dzEMTnE0QZHtkzuT/OvJEidLKgCbb4VgVPaie5
 Dgpm4=; b=ck4ZEG8VDRUm9/HNV40QN2SAIa5FFn3Hs3MCtCbTc8wtjnWzUqy204
 rTI6uAb8E+x/zpHlpWzQPcEEI3kYu98Z5a2PI2PPguTAssEZRN586i01xWmuzFH9
 VEESk3ys/aDKEFNdlcF8epBY1bwVi6B7NTuOkheq02ARwDcxlpCnV8cNRwOPhdaK
 POaSqHv5B1n7tXWo6kHpGbZtbrSFwzvXiF1Yf26M9GqQOSP15Ic7+9m5cNcPVi6s
 zntHByfaI9iBmW7Nm/J8Gi3sEjN+Ej5+OOg3BoBqBYTEAXLlM+tqovpkXeS8Ydoa
 jXrEEBH3ey9v0YVBqwqbOHxnkvDBMEAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=dzEMTnE0QZHtkzuT/
 OvJEidLKgCbb4VgVPaie5Dgpm4=; b=LM9oywF15DiPgFEKdgBUCZtAuRPlOdF48
 0mvuM2xSnh22l6lqpD4o79/xMvqiIuRwX0jFt4eBIDBNlFsW6akE2pNc1bF7QrPB
 lWPVrJ2aBM5i2KB7k0xH9ol+tNoAP14P1D+Q5VU/qAYLhUWS2a+/rVa071JzR9zz
 WQteDEnFQ7Kg9RUH6F9ITbP7YFSg7dlKI6VyHw3oqAZKRR1DDIXu39c6N/tZ1gp9
 JJj+UxBMASxNkZ+EHYpg0dmfcq9nAQ2guamuYgMeYNj7QtbnpW4u6U0t36KrHUfd
 2SvXn7KnB78Lm5SyTwfQAwYKpJvH38NtglOHcf/qDH9mvYJ2zVLsA==
X-ME-Sender: <xms:LDsWYtyn-0lMAu16Agj7tkuUDF6-BAJYUHEXCq4b3AWBBb-iHBKbVQ>
 <xme:LDsWYtQ8vGfJt244Szgc1qWFUHyIcsY2U607OCNtqAmtgjENl6n2HKK31IPrXbroy
 WipdlpjaNFmXzObpq4>
X-ME-Received: <xmr:LDsWYnW2nCzdEUwT0BxRv_pmc9QIwlq9xWSzr00H4ea-YhuXapErMxKy9KhZUwas0JLlRD-Aum5xkGAU5NcRlR7t6brxcYJh3l9g4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrledtgdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvfedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegjeehjeetgefgueekudeivdehgfeh
 ieegleefvefgleeitdeiffehtdehteeiueenucffohhmrghinhepfhhrvggvuggvshhkth
 hophdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:LDsWYvg5ZrkM9vZp_xr4jH0nlyZvxHTutPHAQ_XN9gFThV_qEBtl8Q>
 <xmx:LDsWYvBCf4W6hr9kVVSrixYm8zp5pJU03xuMcIW1ueCQmvSw1-jXAA>
 <xmx:LDsWYoK8eYN8jfKfTWbrJotZjhYE90be1TfzOWHjaU45EKb1xxvV6A>
 <xmx:LTsWYmNwOHGuU9OYKejbq0ZCgvV_5fzEAV5C8J2BqueqnQ8EEKlwHw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Feb 2022 08:48:28 -0500 (EST)
Date: Wed, 23 Feb 2022 07:48:27 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: Re: Checking for network online
Message-ID: <YhY7Kxgg6ew0HdUR@heinlein>
References: <af9a0274-2fb3-8195-a02b-c1d5ecf4848e@intel.com>
 <bb39999e8f9638da3d29b865d85fb54d51da9797.camel@codeconstruct.com.au>
 <CAGm54UE1bFeLF9PHUuj__E0m_+CxLRtA4Htrjm4y5M3SnbOhLA@mail.gmail.com>
 <37a29642-788c-b966-3b58-214c3d44c8f4@intel.com>
 <64727f8e-cca3-b04d-e4cf-709ceb60f37f@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FkIYtawwMj8nqfkA"
Content-Disposition: inline
In-Reply-To: <64727f8e-cca3-b04d-e4cf-709ceb60f37f@linux.intel.com>
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
Cc: Jeremy Kerr <jk@codeconstruct.com.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Lei Yu <yulei.sh@bytedance.com>,
 Johnathan Mantey <johnathanx.mantey@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--FkIYtawwMj8nqfkA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 23, 2022 at 10:09:19AM +0800, Jiaqing Zhao wrote:
> I think a solution is to set RequiredForOnline=3Dno (https://www.freedesk=
top.org/software/systemd/man/systemd.network.html#RequiredForOnline=3D) in =
all network interface config. This option skips the interface when running =
systemd-networkd-wait-online.service. Canonical netplan (used in ubuntu ser=
ver) also uses this option to skip the online check for given interface (ht=
tps://github.com/canonical/netplan/blob/main/src/networkd.c#L636-L639).
>=20
> I'll submit a patch to phosphor-networkd later.

I really don't think this is appropriate for all systems.  Services have
dependencies on network-online.target for a reason.  If the side-effect of
having the BMC network cable unplugged is that the host doesn't boot, that =
might
be entirely reasonable behavior in some environments.

We use rsyslog as the mechanism to offload our BMC logging data to an
aggregation point.  When you have a very large scale deployment, it is actu=
ally
better for the system to not come online than for us to lose out on that da=
ta,
since we have spare capacity to take its place.

Note that the Canonical netplan only applies this option if the configurati=
on
indicates that the interface is optional, which is entirely appropriate.  T=
he
way you wrote it could have been interpreted that they set this on *every*
interface, which is what it seems like you're proposing to do to
phosphor-networkd.

If this is desired behavior for someone, can't you supply a wildcard .netwo=
rk
file that adds this option, rather than modifying phosphor-networkd to manu=
ally
add it to each network interface that it is managing?

I believe some designs use a USB network device to connect two internal pie=
ces
of the system and those interfaces are not necessarily managed by
phosphor-networkd (interfaces that, for example connect BMC-to-BMC or
BMC-to-Host).  While it is obviously up to the system designer to work thro=
ugh
this bug, by applying this configuration as you proposed you are causing
unusual default behavior in that networkd is going to start waiting for the=
se
internal connections to come online instead of the external interface.

--=20
Patrick Williams

--FkIYtawwMj8nqfkA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmIWOykACgkQqwNHzC0A
wRkUIRAAqMISoNDuKIFDilQGGvivT6bipzys9ZTkTEGP1qMt6HPATjnT5LzxsoEc
2HDydGjJ7CytQjog7BjkkghMfm03EzLr9T7TRkf9yQlCQq2vOSGRbLoNRtMnYhKj
nUssQQ+0sKn3LWFAPFqQXm3aBzx0vY9zD+NbdS5UBEF/glEKbM14/InyGbuIGSBn
Q9fBl7oaiIN7BjcQxYR/B5Qx5EUTbxtVYGQ/qL492qAXba1/Vd4TcYH8Cr2iLMNt
uLaVnPdnM/UExDD8SYk4qUlrRNZWNBkgkkPjxZg9cD2Vt9X63xm7k0/10njfX5zM
+rK69it5GFjbsmUHQ4WGzu2k8Ok4pZuQMzJn3O/w9lWLR98TFm4t8FwJlQy2aUx9
ggNk+nmC4/vJwRKFZrckSESiG86cZHjoGXWDOkj4ssrG/xAKX2fBTTJzmVZvE+13
+LJ5yEcBSZYZoie0SRGdSQ/JgwuCPJCs6ffzxsdRq6JgGcdsCdkJ10f5/TcW7i6S
bOTOoNzOGTy5MkCSc1Tw1FYINTGC2RfL+2kB8ze24+eze0VQ9h/la4SS3GQw5dzy
qYswR38IZ4ny2Z7DEGy5z6C06qBj2cKW3wc1nNHSmBT5RfhmG+wobBV2pLygiVPf
2LNO7w2BaDzn26IjNPl0D2e0gDCX8xZIlYsrKdICsWBe/KVSe7g=
=zKMT
-----END PGP SIGNATURE-----

--FkIYtawwMj8nqfkA--
