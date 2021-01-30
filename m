Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CD3309612
	for <lists+openbmc@lfdr.de>; Sat, 30 Jan 2021 15:56:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DScjf5s13zDrSM
	for <lists+openbmc@lfdr.de>; Sun, 31 Jan 2021 01:56:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=AwBqSMfP; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=CecrWKjf; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSbjB3WkFzDrp4
 for <openbmc@lists.ozlabs.org>; Sun, 31 Jan 2021 01:11:08 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 55D3F5C00DB;
 Sat, 30 Jan 2021 09:11:04 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 30 Jan 2021 09:11:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=LSYhQg95w+oOJFlrmJ5SUUgvx2+
 MpYFGUAJed52dkQw=; b=AwBqSMfPFM5U3J67vfGXEYnaXSbDkfZfp+pr1k06sWR
 hmEa47nGsD9Z0Xtp/VxjzSSGGwXqJoei3dVCp5gD5g4RszcSEV89nS6PRtIZhIM5
 bczhwWquBW/DafEDdnA/ntc0r4OU1wbeTXivmfUt33N11gOFFJAxn8pkfBEtoKWJ
 LdrEq/nKxCNgwjbHVWhboQGoHzR0DyhcbXVIEOBd8/qi+YhYOomMQ6/bGUKFpFjC
 1v4hFDrPUDJeVD15HF/NNyWKwJnd7O65YS84uie3taPqCT9UlxAonYbajjA2yfBn
 RF+FYyZ0oeyeYk6iOcbyWX5IwqswW9/t5SetwNna2Sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=LSYhQg
 95w+oOJFlrmJ5SUUgvx2+MpYFGUAJed52dkQw=; b=CecrWKjfqlX1s5UA+kiWYw
 5bNbsOwaYseRkpZMv81cQ5x9rxg2O+w8pna5eZZ+euEMwT45Fmujy3QhUz47UK7D
 OqTsbfLyCUbIqdRb5ysItW60FgSl6hW3oKok2JAPII+ZKx/MnRf6ayu1TwNiNa/Q
 3k0OGD8G6DDv2v7GjB9LOLvkM4oF+dn477wyqTVM867FqdBM/UMlIF24e9bax5It
 CxHCroizDUZafAvMbqJw9uvB94blUxTrzU01pg5koF343/z+srQ4bic3dDqNM+Gy
 UbPSxWCR8WT82J8NZ2531kXD4WDvP/C6jTePL5MaCOSxEdpfqhXqejJw61p15P5Q
 ==
X-ME-Sender: <xms:92gVYJQH5CoJLUaa_NoUBjUfhfz6qrPTjO42z7nNnEJwPeGAe4tQIA>
 <xme:92gVYCxOTL6jhkbETkl5Y88aTgjga6WlOkhhFt0oOZMmzTSErHrbNaCAjaR6HpbNu
 _BWNO16FcyfBjjICVs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeggdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeekieelgeduuefgteejvdfhteejjedt
 tdfgjedvgfektedvfeeihfekveevuddvteenucffohhmrghinhepughishgtohhrugdrtg
 homhenucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:92gVYO0oqcSqjOPk0V3n33zCQKbx0MCywvkpDspjNxKQia6FIn-IAg>
 <xmx:92gVYBDHKjw1WMUptCoroOHEe9XtNzIxRqVZoVNL8mUgSIrd5BE43g>
 <xmx:92gVYCjmEqygz8SM-uBXTrvyogOgiX0g3Rjp3hYynPa5ar8Ao-OJ-w>
 <xmx:-GgVYGakzSO-Cd7bXxO7GiwSDndsuaC9XjljYofxvZcNaXTnqoj1Og>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1211524005B;
 Sat, 30 Jan 2021 09:11:03 -0500 (EST)
Date: Sat, 30 Jan 2021 08:11:01 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: "Thang Q. Nguyen" <thang@os.amperecomputing.com>
Subject: Re: create meta-ampere folder in openbmc repo
Message-ID: <YBVo9es4vomuy7Iw@heinlein>
References: <d5302c4f-c0c4-0bde-2a60-e943a2f41788@os.amperecomputing.com>
 <0e2507bc-f8c5-85c4-cd39-4c603a729f4c@os.amperecomputing.com>
 <da62c090-c6a0-1844-cc2b-44846b83c89d@os.amperecomputing.com>
 <3eff5596ee50878be8623c021816977f42111ea4.camel@fuzziesquirrel.com>
 <96568613-294f-8a3b-9aa9-7918b5df2d9b@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="c2I4mMC9YGSs/oXj"
Content-Disposition: inline
In-Reply-To: <96568613-294f-8a3b-9aa9-7918b5df2d9b@os.amperecomputing.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, Lancelot.Kao@fii-usa.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--c2I4mMC9YGSs/oXj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 30, 2021 at 10:37:52AM +0700, Thang Q. Nguyen wrote:
> On 1/5/21 20:54, Brad Bishop wrote:
> > On Tue, 2021-01-05 at 08:48 +0700, Thang Q. Nguyen wrote:
> With the change recently in owner plugin, what should I do with my=20
> meta-ampere?
>=20
> - Wait for meta-ampere integrated to openbmc/openbmc before pushing new=
=20
> codes?
>=20
> - Start from the beginning on openbmc/openbmc?

Brad said yesterday on Discord he was planning to push the existing
meta-ampere and meta-fii directly to the openbmc/openbmc tree[1] so it
would preserve their existing history.  I suspect you'll just need to wait
for him to do that, hopefully on Monday.  I don't think any of the
permissions exist on the subtrees (like meta-ampere) anymore, so even if
you push a commit there you won't be able to merge it.

1. https://discord.com/channels/775381525260664832/775694761775464468/80474=
0846415118336

--=20
Patrick Williams

--c2I4mMC9YGSs/oXj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmAVaPMACgkQqwNHzC0A
wRkEPhAAnF2j6Z8gnaOG/hCCfs4XpSsvro04KMalOODnyv5eGuaCYXjNyYtAOoCv
ChSyPLFBBf9SAzsqU6ip6ZOw78Cwk0wjbcljVzQ0oeztWMByQARqnSgBeaU82Gmk
+ALbi0/jwnp0RVAzV2oAXvaxwth9YWU7jBGfbtnk4yPv1RFl/XXGCbbwkva/CUbI
8SVwE/uiGhcaPvDopv/cZUxpWOFoxWvmUuwDlXwJVMMIy5QmAEYh1bu3h3Qs12U/
ldFecif3H9gXO4rWnxOudA2AyEJtqW+Ug6dR9xHPwfUuAl4XwFI2/4WOUMGkUVuZ
F7m8f3yUHHHy94+OmiZjm7Vl8+nH/Ag0hYvShxF6kQOrLyH5swGsvL0JJV8+Y2kk
QymZ71kai33f7OED2HaSJpoXqf5JkqRssfOKhCmbF0SKVZ96tlcMHl+nrXMXmDTV
j46qxFvk/sVuZz33z9h3K/8JwYoOhs6ZgI7xQpj6/vg5JxWqf2Vt3O1vPgxcf2JC
hdvXeiSqShDGKuRfE5hxiKlNOgyWOO2Cxl4pFNEs3kmvrKLct/oxRNm2ieIV0pT+
GRwt1Rr9t6FLib8eEHVu+4J2SqDv0l4jk/mYpAaVfL5WqyGRbU0fgFIMc+bn7h56
XhHyZimEr61152xlYb+OIkByrVdBoBYuIsZMSbHQfsONHSPwg+c=
=vR8K
-----END PGP SIGNATURE-----

--c2I4mMC9YGSs/oXj--
