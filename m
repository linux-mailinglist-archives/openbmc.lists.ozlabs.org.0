Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A384E32B807
	for <lists+openbmc@lfdr.de>; Wed,  3 Mar 2021 14:32:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrFKb4fKpz3cjw
	for <lists+openbmc@lfdr.de>; Thu,  4 Mar 2021 00:32:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=EYG4kYz2;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=OqMsCwbC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=EYG4kYz2; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=OqMsCwbC; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrFKM05wZz30Qm
 for <openbmc@lists.ozlabs.org>; Thu,  4 Mar 2021 00:32:06 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A25AC5C00BE;
 Wed,  3 Mar 2021 08:32:04 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 03 Mar 2021 08:32:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Or6JEg3wUy/8TfGFYtl5cA8ygl8
 bFQVdNs81OXhCakw=; b=EYG4kYz2arrthiPpE8w+6GYTg1WgBYr+rEE29yrAjK+
 J93bgoneb1FpXTFaIma2UU/WOArK7zAHtIhTlgxlFZ+4m90ujEeOmgssW5PkRCJO
 zinnhvvTHMbLoQzeOWBi85+VrcieSDk8lxpYQRUyjO5DvfPqX+n0+F88YRyHQf3w
 5XI65GQFBiTmPlUK1fWToXgKY3Uwo8j4uljdMJFFybihifSzBacLsY6+26yPkIrD
 s+HOol55RkGQHW1kINVcLjV6wJmsDyPepxybN3hMh6eVqNxLEoplF7JYyzip1MqE
 5VIZzh5qhyqdrV4X+GrfH1zdVhsiqVXrUbvQrjKKxeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Or6JEg
 3wUy/8TfGFYtl5cA8ygl8bFQVdNs81OXhCakw=; b=OqMsCwbCa3Q/DYzopGB+/B
 w1Vvu1TFqjrCGd+zSQ0rOCixgZR2de4xHM1bxwvEHahvk4pDYwjQsURrbR7JyRVS
 vhr0Os7Ev5QNzIzk5RcCh3UMmgx7n/vzhWNsEqkcf2uHKxq6Lqiccfxfy+2LeB8+
 2NwRHhs6tR2M7tskNmFOmNjm4D/CBUqU3NDC+EmM6a9uRk3c7VpcgUVNFv7L41pd
 HqMsdxyeXdULE6FUkJRjPZqZwCCT8B7gvWu7agprlGiHOtHXweVbRiRuFMgR39eI
 kcNUJJLSVek7blB76b6CRtQQ05EN1rkYCZWPhHPMfRPAMwoAdSpdMne82PQlLYTw
 ==
X-ME-Sender: <xms:1I8_YMoi_Vh32LyZ3v10VVPdvhC2FRWHfBQ8texSN2TTOAbH34sq7w>
 <xme:1I8_YCpoN9d1UjKnd_hk5r9orODltrfMrQWAQkUBqsF-AD53nd5Gww1lGJsjr9SHc
 6ScR8VqFsAESkh3560>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtvddgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgfffleefgeetvdeiheefieeiheel
 veehvefhhedvtdetueetjeefteefgfeifeelnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhdptggrmhgsrhhiughgvgdrohhrghenucfkphepjeeirddvhedtrdekgedrvdefieen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrh
 hitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:1I8_YBNuRdQTSeBn4BIr8qHsy9COTh21_hAGx4KJZHWUr4lO-tpb7g>
 <xmx:1I8_YD5c3PpsiWPPd4D-geVAEOM4TdyH4X6sldnBgqwixSMrked7Qw>
 <xmx:1I8_YL6-HtQQ_9_aDyBCcqTEzif6sANjnGzlKyhPrws03_436dazxw>
 <xmx:1I8_YEW2rLs4gxfyXfuif-XBdIIeVL3OM5NChb2TKLRo-1RsOeGFXg>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id AACA3240066;
 Wed,  3 Mar 2021 08:32:03 -0500 (EST)
Date: Wed, 3 Mar 2021 07:31:59 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Alexander Amelkin <a.amelkin@yadro.com>
Subject: Re: RPMS
Message-ID: <YD+PzxNr6DGFtRU5@heinlein>
References: <6ee37eca-0399-fc0d-8f76-1685167505fc@yadro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/zMb1z4UyVg0LI6R"
Content-Disposition: inline
In-Reply-To: <6ee37eca-0399-fc0d-8f76-1685167505fc@yadro.com>
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


--/zMb1z4UyVg0LI6R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 03, 2021 at 01:08:06AM +0300, Alexander Amelkin wrote:
> Hi all!
>=20
> I have just noticed that we use a wrong unit name for revolutions per=20
> minute.
> The unit we use is called RPMS, which renders to "Revolution Per MinuteS".
> The term RPM is already plural in nature and doesn't need the 'S' suffix.

I think you're talking about the dbus interface [1]?

The units in that interface are all in their plural form.  I don't
recall why we decided to do that originally.

> I believe it needs to be renamed to just 'RPM', what do you think?

In many cases of pluralized acronyms the 's' is moved to the end even
though it adds ambiguity as to which underlying word is pluralized.  I
think this is an artifact of spoken English where almost all plural
forms end with an 's' so it is natural to add them to acronyms.

The Cambridge dictionary indicates that either RPM or RPMs would be a
valid plural form [2]. =20

Interestingly, CFM is arguably both the singular and plural form because
the 'f' can be 'foot' or 'feet'.

> The unit is used very widely, so a lot of files in openbmc project
> and a number of other project will need to be updated.


We did make a minor mistake in that it should be 'RPMs' and not 'RPMS',
but I don't really see that as high-value work to fix at this point.  If
someone wants to go make that change across all the impacted
repositories, I'd certainly merge it in PDI.  If anyone feels strongly
about making it 'RPM' instead at the same time, I'd be fine with that as
well.

1. https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/open=
bmc_project/Sensor/Value.interface.yaml#L55
2. https://dictionary.cambridge.org/us/dictionary/english/rpm
--=20
Patrick Williams

--/zMb1z4UyVg0LI6R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmA/j80ACgkQqwNHzC0A
wRncxBAApkJqVoyAkB6RWM+sgKjYU2/Hzk6ndqRnUSoVXQx7vPqdYqWOICgT4hcM
C7bevqmyGiRpzanZz7DepSah4tNjIVLrdT2DatnjFFm9ElwU5V20vJ9SGspZXjgr
SFTDScibNJEVlqwpC/vLbZ66YUoBFYUsTNEqRAwOPcJJZWAZKneWo6KXQALc62RQ
7qA8lNsJWDOGD+T8s8vxd/enbEveLeThMvHvMiJUawXWCI10u8PUAjfpPghSO7Mg
p/bP5ujGjRYCizPRmO6g/t+cEUVbBWC++PfeHwRqmBHe2erta8CALgPA1K6vvtzO
eGFHXo+H5P/9rkXolcM7bmqxiRekoy7oN1MdkpoIhL7VJX3bo3ephtT6xrtyuZTD
L+M3PJgdEmihrj7FOeROhBL4lNYmUpb9PZRG78hnxOaM8Y4Sf6o/2vnUxz42Bexd
lORpbBlP/TqWPgYsFmLBCc6P1u0KKLihSGJXwznmMZfMC2QqVYXRomv80xbq0mmG
EVVJBmWkSikbObWfwuraFpkfcln42CcTarQgDYRZSE6FxyjxfwikiaaWMs1tH+I/
qMSGJBo3XAQj4n0j4EOuMjXvAavRVF3VYcbGxWWZtAgjWu4kM6XlOE2DqVymNO4K
5sXlQ89t+zIUlD8Pq1nIklciU8udB6abJSDk8uQ1nWOZz1oiF18=
=dbdM
-----END PGP SIGNATURE-----

--/zMb1z4UyVg0LI6R--
