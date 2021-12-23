Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1D547E657
	for <lists+openbmc@lfdr.de>; Thu, 23 Dec 2021 17:24:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JKbBb3NyFz3002
	for <lists+openbmc@lfdr.de>; Fri, 24 Dec 2021 03:24:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=b298ok/3;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=X0KKWRqi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=b298ok/3; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=X0KKWRqi; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKbBC4CD0z2xsM
 for <openbmc@lists.ozlabs.org>; Fri, 24 Dec 2021 03:24:35 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 98F4F5C00A8;
 Thu, 23 Dec 2021 11:24:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 23 Dec 2021 11:24:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=2wDTC3fcXNIFVqTrd9rG68uWWMw
 hy8DhBo2mVxVv03c=; b=b298ok/3K80IE54BeJjUVZEMe6R1qXRN/jzW2wrUfSu
 UTTjDiRT7lDuDFY0ht7K6LFrzJh/aVCRnajulSNsb5LI12SOYR8z+Ssa4lxYQg+r
 BQ7K6oj6gOm9BA64VMm+cGDMjRxiVcjpgUPzvVGjVSKMPbA+sobVFgyvY2W0sDwB
 DDIi5dUd33o2aEbUSVnnNjmRqI5WtdwwF4eH/drXMlFYrX/lV95ia3/JIbGrNKaF
 aURACDx+N7f4HxFsGMH5v9EqCwZKt0n1F9uaSUlw4khpAP2uH9M2MrgPfrjABU2R
 JZB0xLgU43m9QAlnAAJR330iMGj3kz3yTgGun7AqOPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=2wDTC3
 fcXNIFVqTrd9rG68uWWMwhy8DhBo2mVxVv03c=; b=X0KKWRqi5iF+nCIX1lTlLY
 0vQ8ApFJYue3/xbB7t7woCPGmcnUlaJrY0L87yazPMASqyKW9Jxr3PkUxYY4T35M
 1p4lZe4v19D1Ge9rl8smvp5ijQq757zuJcpvhGkoq1y+TrY2Mt/2puBx+IqygwtW
 SGGpFZUpzV6upUek9XTzLaMdStRfV1Xq4TV60ht/wEzFCZJEYJ3NrFCGpSHwCW1E
 wZqOMWPmWzsbuVVpjl1Bwpk7t+W8wG+zShXtUVB9q82bY7mPBUtn7v0fOoD2J1aZ
 Fbex9AaM9IUEFFCM5h5SSqEsoIiXncIJwHg5Pd5PY+SQD0Krr5l2TFQvFxOGGqnA
 ==
X-ME-Sender: <xms:wKLEYaoresKq5CqlnwdBkrRQchkWHH1XZATQaZQQsHJ9SvjOJI1Myg>
 <xme:wKLEYYpv7YUyY3RXkmYH-9xgESGUm0JT6oekJrNWhWbH8qG2dhWJtkgiIuwuI5IYo
 S3EQGDqA1wQn4w6rAQ>
X-ME-Received: <xmr:wKLEYfPR5s7OWBQ-644IaddzmckAow4-w886cCwPGbYiQP67koWRzkbnrMBW9OFpQVYmXQ3kpatjIwhww19l6YCnOlSgPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddruddtkedgkeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 eplefhjeefkeetveffgeetffdufeehleefhedvgffgvdfghfejhfefffekieeiveejnecu
 ffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:wKLEYZ4izwOIekXFLSnajRDWXCSiDseDad2Tnv508J77kVeV-lcCAw>
 <xmx:wKLEYZ51N-I_Z7aBi_PUxBEvQ4AQ-sNROZyhY4iGOSzFTavO227i5g>
 <xmx:wKLEYZik1xcc-u8ZIKRn4RwhomSpdW5Fmk0b0oWqCxbeV6HvpjX3FQ>
 <xmx:wKLEYWgak3WScFjGA07etl7uRacRnAkLx95o8BRVTKqVqYZRW1NhPg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Dec 2021 11:24:32 -0500 (EST)
Date: Thu, 23 Dec 2021 10:24:30 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Paul Fertser <fercerpav@gmail.com>
Subject: Re: sdbusplus reading InterfacesAdded issue: not all variants are
 created equal
Message-ID: <YcSivm8L7jKd/7gy@heinlein>
References: <YcSZlt4HPeBO3sL3@home.paul.comp>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="L/j83OjIwr8X5Gbk"
Content-Disposition: inline
In-Reply-To: <YcSZlt4HPeBO3sL3@home.paul.comp>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--L/j83OjIwr8X5Gbk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 23, 2021 at 06:45:26PM +0300, Paul Fertser wrote:
> Hello,
>=20
> While digging into current state of SNMP notifications (traps) support
> in OpenBMC I found some code I have no idea how to properly improve.
>=20
> phosphor-dbus-monitor has a handler that's meant to be called whenever
> a new log entry is created by monitoring InterfacesAdded signals on
> D-Bus logger paths. The processing is at
>=20
> https://github.com/openbmc/phosphor-dbus-monitor/blob/master/src/snmp_tra=
p.cpp#L28
>=20
> It seems OK until you look into PathInterfacesAdded definition which
> includes a hard-coded std::variant<>:
> https://github.com/openbmc/phosphor-dbus-monitor/blob/master/src/data_typ=
es.hpp#L66
>=20
> This already raises suspicions and rightfully so: the interface we're
> specifically interested in, xyz.openbmc_project.Logging.Entry,
> includes AdditionalData property which should be of type
> std::vector<std::string> , but that's not in the list of the allowed
> hardcoded variants.
>=20
> If I'm trying to use the std::variant<> type suitable for
> Logging.Entry then msg.read() fails with InvalidEnum error, probably
> trying to parse data about other interfaces, and this is a bad idea
> anyway.
>=20
> So what is the correct method of using statically-typed sdbusplus APIs
> to parse such a "dynamic" reply?

The short answer is that there isn't currently.  The code doesn't support e=
ither
something like 'std::any' or something like 'std::placeholders' to skip past
parsing of an entry.

Generally, you know the type of the signal you're trying to listen to, so t=
his
wasn't very important.  There are a few cases where the code interacting wi=
th
dbus is "generic" and it becomes important.  I think in this case you're
expecting to be able to match against configuration in JSON?  So we probably
need to do something to make the situation better.

In phosphor-inventory-manager they've had a similar problem and what we've =
ended
up having to do is extend the variant list for each new element type they w=
ant
to accept.  I think they wrote a python script that generates it from the
phosphor-dbus-interfaces YAML information at build time.

There is something a little better than that available though.  If you look=
 at
the generated headers for phosphor-dbus-interface, you'll see that each cla=
ss
has a PropertiesVariant.  Here is the one for Logging.Entry:

   using PropertiesVariant =3D sdbusplus::utility::dedup_variant_t<
                Level,
                bool,
                std::string,
                std::vector<std::string>,
                uint32_t,
                uint64_t>;

`dedup_variant_t` is a class that evaluates to a std::variant, but makes su=
re
that each type is only listed once.  You could pretty easily add a
`merge_variant` on top of this that would be the union of all the variant t=
ypes.
Then, the type you'd pass into `msg.read` would be:

    using Value =3D
        merge_variant<xyz::openbmc_project::Logging::Entry::PropertiesVaria=
nt,
                      ...>;

Where we'd list all the interfaces we expect phosphor-dbus-monitor to be ab=
le to
handle.

You mentioned the InvalidEnum error.  I'd have to see what you were doing t=
here
but if you both an Enum-type and a std::string in the variant it should have
parsed as a std::string if the Enum-matching was unsuccessful and not throw=
n an
error.  I thought I had a test case for that exact scenario as well.  If yo=
u are
seeing that, it sounds like a bug.

--=20
Patrick Williams

--L/j83OjIwr8X5Gbk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmHEorwACgkQqwNHzC0A
wRlwnw//UuR0lzM/5nwhe85WEtjWKhy9tr1gaALsWsdXjKjFo7z2h9yZUn5aqGH+
sSNVs1kLiwhgIzwjka13V32HHrZA8t6sHc0b16rgV6QY9Z9xDigaOYXL7TrCdN1P
fl6Fx+p3tcNQ/+TOd45mKKLpnNJpORTThCZiXoUplSlsKSLj+qSZ9Gr9eCZtzzbl
VYThL0pxSox7GG3o1A2ffhIF3wz8WuAWIlbeQEOyES6NaO2GBoZogHdvhhadj4wF
zhfxeFZCO+ApDrO9GMEc7rdGoXGRhyS63DiDd0rzFbI+ocGV17Nve6eGHberk+rE
IUMYVxyfKow/pJHSWKrVbWGECYrpNDLMX0Dw0oWfv6PuxvRu5NbIkvPpGDL1x1rq
PBpHiUT8g/NJaDF3INF8vOzBL3DpxBqAo4OvSF7uD1njurBqJLjoRlmO/alWlSmZ
HaAM/gWiUpo92Qajh5DWRdKRPtcu2e29FpY3avBFVYB3GUm6dVo1urfGVtgk1H0l
e0zouzCnkOA3nNrcjQNiBlORJxRdAzoaHrdzprWSA06OEpEKwP0EnDu8xjMLGRRD
a5jPUql86FmVQGGFx0e8La7WV03nu0Bp3atnYB/0KWCi/LORUVbJWIMUkjTi21IJ
3kQbfCMNkYBNB4DF5JwUqZ7bCwrTsJEBrwXdYP2v5FGro1KHg0E=
=WLJc
-----END PGP SIGNATURE-----

--L/j83OjIwr8X5Gbk--
