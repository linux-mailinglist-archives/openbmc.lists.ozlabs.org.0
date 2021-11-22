Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C252D459375
	for <lists+openbmc@lfdr.de>; Mon, 22 Nov 2021 17:52:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HyYGw4RKcz3051
	for <lists+openbmc@lfdr.de>; Tue, 23 Nov 2021 03:52:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=IQFNKJjJ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=MMDuYYFT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=IQFNKJjJ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=MMDuYYFT; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyYGM3cn1z2yZh
 for <openbmc@lists.ozlabs.org>; Tue, 23 Nov 2021 03:52:10 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 637275C0159;
 Mon, 22 Nov 2021 11:52:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 22 Nov 2021 11:52:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=0mqhdL9oJ2KVBJZx09rfP/hJIoO
 laJjsjO96zQZCQl8=; b=IQFNKJjJRmIr6KEBl0X2AFBuO1ECTmQeS7f9cg33X6N
 KXSAyJdfDP2yCL2klzggCSg1U3+3L1lQTUZHm2ALYnmsb2Pdw7aja8yBqklQvnrO
 5WYIzl6uDBtoVupCm8mzf0oYpXssAPgMuXZEaomnzfFeMGoDCx8PHdTMvass9BOs
 ULXSrCDLPHMf3FWgAJgBdUsf/dMyAKvFXluvM4bB43taly5BLZFXRvIQsS6kACii
 08qDX6sDJ1Wyg/1gRKQioLvP2Jnc6T8vlXH5KP4i5tUbhdF37c3PrcLP1pAQXYQf
 iDvocW459IVVKf54VLYC/T7Kgy5+6oP5gCtbZSTEZQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=0mqhdL
 9oJ2KVBJZx09rfP/hJIoOlaJjsjO96zQZCQl8=; b=MMDuYYFT5w28cykFUABIGV
 HW00Fe7Shyb+ddz93sFnZqB19GJ//vGZ8LNktJnFu9zKDf2IEoMywK6yDAcod2HJ
 Pb97TjZSdGht67gXHMxjCRNjc5G9mgMwGeOPC9jg5qZFcgjesFOdC8Kf3N85iXOh
 JtiNYrEpAj69fdwa1gb4Beq7o+viUj256uHe+FiHPFH7SIN4XU4/SBdzwNdsu7mT
 lslg5z1PekigP4fyT5SQlS4Nh09apIXp7YL/DP1SU+61/pZkoE5jWo9UDRSz4OKs
 Vm/uN1sZiQf/M9qBM5kdQyNWifJupzSjEoO/jdrR0VaQxe5PXRIxxt7NAX3ilNtw
 ==
X-ME-Sender: <xms:tcqbYeb76R7R4tbXgtto3qph389hD3PghSjaH0xyqTNMeHjR8UHpdg>
 <xme:tcqbYRYB71U7JEudzC2xINedULo2rL25Jn41jciJhCw7yoA78FcvnonkpM0EAhTsp
 vf0amMi3RiNRJUYN_k>
X-ME-Received: <xmr:tcqbYY-SZV153FQN9TTbRmNueBg90IzXFOY641MJuDAkIldtYmanEv7i4b0fPeyqMd7PZTNoCI7Ie9MSNBFO8GaVuJ-BoHxinjM51g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgeeggdelhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttdej
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeekudeutdefiefhheefheefvdejueej
 ieektdetheelvdfhleehkeegvdeiveekhfenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:tcqbYQpNo2hF6rNaYoSTZG2RZ03sUdHyDdY4gDrRH7dhff1mqnnrog>
 <xmx:tcqbYZqNOjK2yJUQEZe3ik0d4bzWKYNY72nZJ14EzGUaO8BwpLk7XQ>
 <xmx:tcqbYeRCBZVxBtkCm5QgGUApeXkPNBtZsta7GEsd8CeBZKyN8-nVYA>
 <xmx:tcqbYYTSFkjRejk8pQd4jvB79u3YQIFIxB7fsahDRKtiyt4hPRwLFw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Nov 2021 11:52:04 -0500 (EST)
Date: Mon, 22 Nov 2021 10:52:03 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Christian Choi <christianc@nvidia.com>
Subject: Re: [phosphor-logging] Entry Class Methods Mapping
Message-ID: <YZvKs4kgOyU9Sduj@heinlein>
References: <BYAPR12MB2983BE2EFA7A4AFEE875631ABA999@BYAPR12MB2983.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Knw860kzUz+eGRFP"
Content-Disposition: inline
In-Reply-To: <BYAPR12MB2983BE2EFA7A4AFEE875631ABA999@BYAPR12MB2983.namprd12.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Knw860kzUz+eGRFP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 16, 2021 at 08:26:26PM +0000, Christian Choi wrote:
> Hello,
>=20
> I need a way to map the string representation of methods in the Entry cla=
ss to the actual method itself. Right now, I am hard-coding my own map as f=
ollows:
>=20
> // create mapping of function name to actual function of Entry class
> typedef std::string (Entry::*entry_method_t)(std::string);
> std::map<std::string, entry_method_t> fnMap;
> fnMap["resolution"] =3D &Entry::resolution;
> fnMap["eventid"] =3D &Entry::eventId;
>=20
> I was wondering if there already exists some mechanism in the code that a=
ccomplishes this so I don=E2=80=99t have to write the code myself like I di=
d above. I was told by someone that sdbusplus may provide a mapping like th=
is.

I think you're looking for the setPropertyByName and getPropertyByName meth=
ods
on the sdbusplus generated classes.  See
xyz/openbmc_project/Logging/Entry/server.hpp.

--=20
Patrick Williams

--Knw860kzUz+eGRFP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmGbyrEACgkQqwNHzC0A
wRnqXA//fDR9Y7JcHSHb3WI5r3OHZ+Syylgs8kz51wZl7YPA88XAVGYRGSjSxj2v
42JDunXkGsIma4SsPGVFRdechB4vhKiCyagvLpTi/izhEsinZEqedeP3uJBLGp9D
sgpwnim/E0a1NXAl2TDrp7GieVmgNyjJMF1/CsGpDvh2o7C1o5/sxkGxzrbTViVL
9krd5mGdwp+JTkD/o4xH8L8wWP2flhMeNHMdM1FgOkhrAOBK0LQ04J2XUBd85TJE
Xxo9xMmJJfnBnn+egNSrbTiIkat91cYX0mCoXAMX7koT1Ray7mUt/fCqSJrpWDtm
H7FsUm8LNKzGwgm8kbzflCOA5dBZAzAkQKdcBZCyCmc0uZc6IpuWykEjZVZ6fcNm
/BYpC5FehFIiXTKc9BXVP+DFPdXnlYBw3s704V39SXu2AEW+w0OFghHBDTc3PMcJ
K4gHqTHx+Giv63OpgL4OlfQHdNz17ph36FHOICaLxBeQAwN5XXUb00gNFCL4zO5R
i7HTcrygj3Aml4IdC9k4kcXPpk2i+YE5TYOGrni+AcdconfMje/xBrjWZZl3p9Rw
Ho+5fVAQI1/HEYbgfXB14av2nrYDMsjubfT91qNLPW3NcRpoZGvHyuN35N/6yPrm
ON2xTPTIw3+1hewxFUzA9IKJGUQ24DOk+05UasW5lJCyxNo3H9U=
=oWgW
-----END PGP SIGNATURE-----

--Knw860kzUz+eGRFP--
