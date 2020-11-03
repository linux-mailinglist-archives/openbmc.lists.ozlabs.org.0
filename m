Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD7C2A531F
	for <lists+openbmc@lfdr.de>; Tue,  3 Nov 2020 21:57:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQhtJ0vZ7zDqlS
	for <lists+openbmc@lfdr.de>; Wed,  4 Nov 2020 07:57:12 +1100 (AEDT)
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
 header.s=fm3 header.b=w881u5pf; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=SgygXTEA; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQhs42BtGzDqn1
 for <openbmc@lists.ozlabs.org>; Wed,  4 Nov 2020 07:56:06 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 90B3D5C0041;
 Tue,  3 Nov 2020 15:56:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 03 Nov 2020 15:56:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=COYvTT8IuJBm/ubl+T5GBBJ2nzr
 YDZVXii02BhwNGi4=; b=w881u5pf+1OzpYlSez2sWkoxN5TBt6AXZR640KadPGO
 cvTHiBR0lnK0IKffVSEg0A7xMTTVKLe9FtVIaVAjsXcsOIxut3pMvQo0hM+BQtdv
 q4FolWRwztT+N1sW3py+LkR+UNr9lMF8BB/E8NNJjT9hq7wu+JnPgpnjqhqnSyAx
 dJ6xbpL+QWvSiARWEtn5cIDxAJ+4yoGiYLKiLNYHGLMlLZwl5bz7ezVIHAJe3Uy6
 Z5GcCf9WGYQP0HrKorM6pT5/SOKQmNergeiQEDynSG6Z5CdBtG5cAZU0ViOEerU3
 RxG9zcgztmJjjRqiDHa4QAVsZITNqyz/458aUD4Qbew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=COYvTT
 8IuJBm/ubl+T5GBBJ2nzrYDZVXii02BhwNGi4=; b=SgygXTEA683VgmrYzgWTnI
 cmQQS5PulZVQTcw1sa0xgmaZjTTg0x6D8M3r/kZ2ebFoR3T29t0xmYJa9YNTxpyA
 DZ9PrNikLvrjqbqDKYgZ7gLX9AqKgm1SPZTVUzlI25y5PxXF4cDf3wyt9890PFCH
 K/B71Z9Y0cgvrN8s2SVf5Ebp/PxigQGoUgFOt68x1tEUrUuc+HArIAjJmft+h9Ga
 KD7DMprWp7JpmAS38q7wx2+ng/XvVhCkpXiFHeUA8SkV1oYDEKL4E6FVQdYkG1VZ
 CjnEq23TZBGbQvz7Q/6KjubhhnciYZ78cRVPeONge6UBBCOsodBQ/yIjREKcjQMA
 ==
X-ME-Sender: <xms:4sOhX4DD5yaR0_NM3M__pcP2Blw1TPbXXtG3dgYtBaqZEFWe7IgN3A>
 <xme:4sOhX6hZSUwey-VdYEErIxzoq7p8VWnitu6ef1eyT3T9bGv16oPTLwilu08Q_bZ7j
 bv3UiG-zBCyC8zFmeI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtfedgudegudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculddvfedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpedtuddujeegtdejkefgkeetfefh
 gfeifeeukedvffegfeetffffgfeuffefheevieenucffohhmrghinhepohhpvghnsghmtg
 dqphhrohhjvggtthdrgiihiidpfihikhhiphgvughirgdrohhrghdpohhpvghnthhithgr
 nhdrohhrghdpghhithhhuhgsrdgtohhmpdhinhhtvghlrdgtohhmnecukfhppeejiedrvd
 ehtddrkeegrddvfeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:4sOhX7l0CLDZsDcWobV0qSFsDkEV_RqSEXRJj2UR4UzFZPDkySRc2w>
 <xmx:4sOhX-xU59n8jBIRlaOtYvqWSOe6C5hqQ0hR4EpDZJUQjknxcaxIKQ>
 <xmx:4sOhX9T0nsuh2DojQqk0rd5-OFPeufUqbhJFtIjQwnpjFL5Tu3M0Bg>
 <xmx:48OhX4dI_MQV1VxDVS6iopbVRHa-K91PJjXGPv3MPL1n3_htNZwYmw>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2481932800FF;
 Tue,  3 Nov 2020 15:56:02 -0500 (EST)
Date: Tue, 3 Nov 2020 14:56:00 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Subject: Re: Secure boot/signed images and GPL code
Message-ID: <20201103205600.GA38269@patrickw3-mbp.lan.stwcx.xyz>
References: <CAM=TmwWinuWjpNr+NeTXTmPv0wUCCzg5BUKhhR=Rp=mfmma_6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Content-Disposition: inline
In-Reply-To: <CAM=TmwWinuWjpNr+NeTXTmPv0wUCCzg5BUKhhR=Rp=mfmma_6Q@mail.gmail.com>
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
Cc: cjengel@us.ibm.com, openbmc@lists.ozlabs.org, joseph-reynolds@charter.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I'm not a lawyer and I don't speak for the legal team of my employer in
any way here nor should this be taken as legal advice...

On Tue, Nov 03, 2020 at 10:50:07PM +0530, Deepak Kodihalli wrote:
> Hi,
>=20
> Does secure boot on the BMC (I think for my question it doesn't matter
> where the hardware root of trust is - it could be on the BMC or an extern=
al
> chip) or signed images deprive users of rights associated with code in
> OpenBMC that is GPL licensed? Meaning, GPL allows users to modify and
> distribute the GPL components. I'm not a legal expert, but I understand
> from the legal team in my company that these rights are not limited to
> making modifications to the GPL code and that they also imply being able =
to
> deploy/boot such modified code; and the problem is secure boot/signed
> images would prevent the same. It also looks like this isn't specific to
> GPLv3, but GPL in general (for eg GPLv2 clause 6).

My reading and understanding of GPLv2 does not suggest there is any
right to *run* the code; only that the source is available.  This was a
big debate about 15 years ago around Tivo[1].  What they were doing was
against the spirit of what Stallman intended with GNU, but wasn't
against the letter of the license.  The response was GPLv3 with better
language.

I've re-read GPLv2 Clause 6 and I'm not sure how someone could derive a
requirement to publish keys or disable key verification as a result.
I think the relevant part here is "You may not impose any further
restrictions on the recipients' exercise of the rights granted herein",
but you need to answer what rights are these?  Throughout the GPLv2 the
rights are { copy, distribute, modify }.  You can modify a digitally
signed image all you want; it just won't work anymore.  This is the
letter verses spirit.  The intent was clearly(?) "modify *and run*" but
the language wasn't precise as such.

If FSF/GNU thought they had a legal standing here, I think they would
have went after Tivo and others years ago.  They didn't and instead
wrote GPLv3.

Most of our software uses the Apache license which does not prevent
Tivoization like GPLv3 might.  I haven't done an analysis lately but I
wonder if we have any packages at all that are GPLv3-only in the default
image.  Does anyone care enough that we should work to remove them
and/or prohibit future ones?  Yocto has a pretty straight-forward way to
error out on certain licenses.

> How are others dealing with this:
> - By having an ability to disable secure boot (I see this as optional in
> https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/26169/)? What if th=
is
> is not an option on a system?
> - Other options?

In the context of a server, I don't think most companies would want a
way to disable secure boot.  It does provide fairly important protection
to the integrity of the server.  But, it is valuable to many customers
to have a method to transition the trusted signing keys from one entity
to another.

A few examples from our use cases:

    - We make customizations to our firmware that are specific to our
      deployment processes and are not relevant to other environments.
      We want a method to bundle those customizations into our own
      images and an OEM/ODM might not have access to those
      customizations.

    - We trust our own signing mechanism and not the OEM/ODMs.  At
      another company, I personally witnessed an ODM that had production
      secureboot signing keys on developer laptops and those keys were
      also used to sign debug images.  Either the keys or the debug
      images could have escaped that ODM and could be used to compromise
      our servers.

    - When we remove a server from our datacenter we want it to be
      recycled.  This means we need to transition the keys away from our
      own keys and into a state where either the recycler's or
      end-user's keys can become the trusted authority.  Without this,
      the server is a paperweight.=20

    - There have been security vulnerabilities in software packages used
      by OpenBMC (ex. SSL, systemd to pick on a few) but the OEM who
      originally supplied the firmware may no longer support updates for
      the server, or may not deliver those updates in a timely manner
      relative to the CVE release.  There should be a mechanism for the
      end-user to deploy security fixes without the OEM's involvement.

In the doc you pointed to, I asked how key transition works, but the
doc hasn't been updated to better describe it yet[2].  The initial
response makes it seem like the AST2600 OTP doesn't give a whole lot of
capabilities here, which is fairly concerning.  I know there are some
design proposals that use a secondary device to assist with
secureboot[3,4,5] which might better handle key transition.

1. https://en.wikipedia.org/wiki/Tivoization
2. https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/26169/2/security/Ope=
nBMCSecureBoot.md#93
3. https://opentitan.org/
4. https://github.com/opencomputeproject/Project_Olympus/tree/master/Projec=
t_Cerberus
5. https://www.intel.com/content/dam/www/public/us/en/documents/solution-br=
iefs/firmware-resilience-blocks-solution-brief.pdf

--=20
Patrick Williams

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl+hw94ACgkQqwNHzC0A
wRlSgw/9GBroigmTYgGlsauj6hJYjK6lMlrMRYzRHrMyFKhl35CzcY3HA9DJ+qmx
0YEd2oAXqHtMXlB7ITmiXUzPVTQlXkr/QzK+9vv7eFux/6Mj4z4EEXBpwVIhxP1O
xoZ7w1yr3BUQwfyXbarS1SJADrHR2Ryt9RgFSy7lTzSjqfEma7B0D9C2y3fIRqS5
r0j6ES7oKKEBNJ6ZTImBbGkavVchPnCrOKXFtC2W3GUA8OHrXpYn0avR0yuellyJ
MvRXTZ1cVLQCNbY+/Za8eFnx2yGB1WdoL3SDCKu3KRHXsBnymBpp44BoW91s5NAU
BFVeLCnva+rnGD+TdQyb9KVXvVvHiamqcdA7r/J4alYYQiLzgOm4ycbp6dN5bwOQ
ljknA1mZZ5oFf1je9gaIE6ftynWyBFksyJmXQKXLl+kZs7peWVhHe7zviwXqtKfR
Bnfflo2c5/pB+Ri/3Q2UhalupQn3VSdb/S8wx75bd1H4BW7PXEh5iA2sbrSgI4Ta
58AgDZvXioxLwFUWga+MhtgbEYZTzoyKLs0Ti8IQKPj6RnC9sBIYD3YSQuqTqZHY
MwEKKOpR1Gbt/G3/TIX6VYA4PsYFKLOGB7DhGfNDsXkDk1BuIWc9Qcis0Qynm9d2
7+rcefTl7dVxHRdvIYtGhDxberivSoe3vNpZZxXbuXgJXCgZVy8=
=Jljq
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
