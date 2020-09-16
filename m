Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A508726D065
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 03:10:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsJm73gz7zDrqJ
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 11:09:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=kYtEfs3T; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=iC/C80oI; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsJ6p3Q0JzDqqW
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 10:41:05 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 5C11D5C11D3;
 Wed, 16 Sep 2020 13:29:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 16 Sep 2020 13:29:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=y92q8mBPmXGV/iBhcHYGBQqRF5R
 lVk0oYYXuf3BK0sk=; b=kYtEfs3Tkj7qDsJGQfCMkrlHEkbIMy8voXE6A/LQeto
 Vr5mc3xxP8au9HqUCPZEgA+tHHQqS+MzrJMF32A19qn0FuGv3o1vxlBi2dYlcZuK
 9XHFHiZeCtnTyxuvzqC8DLLeaF8tAw4Lat583DUW2f8RgovwS/Wb8/4L1/oKt12L
 YnAi3JIINmz/rwqR/nEa8xLU93P8UbbXBvPa8pOP0h+I4OSULmL0DO7LA7u9ceWe
 NpJW10OZ0G6wnBLKDUvd1fzEXrX/lcvVnQNWQ5X9LcJ/oVHV7qIzZJsFSqocc3Z/
 LCDBlJfbNKb8gBDarGvL8UnwH68tAJJV0aG9Ywbc4NQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=y92q8m
 BPmXGV/iBhcHYGBQqRF5RlVk0oYYXuf3BK0sk=; b=iC/C80oI56Kw/tpbT8HESP
 VaF+xX2dlN4V0DzDM0bnt5SWmeKaGlLRzYDm2nGWeodVR2CZpmaKiwQxOdFFW6lR
 lyopnzco8EC9ueit2Y4CsItEKQCoog6qu2bE04h1RYLr0E++f5eH5JCw7a+xVKEm
 CHtt0uGjPRkLhFNmrYDA1UHO4sUkgNL57AvIb9lCdTwZsSxyXgblLgye/8xyCxID
 O9cgMKQ61Ckv9dFJraszK9Q+rKVWC/4PvXIAhlDLfRjQRKUd6dA0quPsp7Kuki5q
 okKJf4oDuypzeWLud6GOU+KUttNxAtzq1v9Z8kA0M+RNs1986IEQzFB2EkNZMnYQ
 ==
X-ME-Sender: <xms:ektiX_oFPkCHSbi5nCBmdwDEeNIE7IKirTdH0ri5w_oLCVaDG4jBqg>
 <xme:ektiX5pDNarmL3mXPRKRpx8FjOLgTXoyq-IafBs9WTFgMFTrm8cBq-YPtbSKybTk_
 ZPVU8GRcbfbDQWLpDc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtddvgdduudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheplefhjeefkeetveffgeetffdufeeh
 leefhedvgffgvdfghfejhfefffekieeiveejnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:ektiX8N8wije8jjWkDaNAkuupKKrj7ouqP2SeYCuZ9reXUUdphepDQ>
 <xmx:ektiXy69jXkOgHSY5q3qlaIf10gkZq6rLDgm4XPw7mrrBDHH9d-9Aw>
 <xmx:ektiX-6k_J8K65H0jThH5yvM7LifLdy0qAo8S11ZvFtEqKK5290J_A>
 <xmx:e0tiX0QAwrjXYsGXgSrXJ8qJdGRl1lTsSCxgNd22nHSb04EPUYfqTA>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6429E3280065;
 Wed, 16 Sep 2020 13:29:30 -0400 (EDT)
Date: Wed, 16 Sep 2020 12:29:29 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Ed Tanous <ed@tanous.net>
Subject: Re: dbus-sensors: Unit property for xyz.openbmc_project.Sensor.Value
 interface
Message-ID: <20200916172929.GE6152@heinlein>
References: <4456d953b1ea5debbc65a282fd62faf4f42d6a20.camel@yadro.com>
 <a824162a-3c7e-810b-5c9a-e41332a0cd22@linux.intel.com>
 <CACWQX82wHxHz9VLAjeSv_s+J1Ovh985o31ekB0oPdr8A8UBavw@mail.gmail.com>
 <20200916170811.GC6152@heinlein>
 <CACWQX83XPm4DmjgvtjD9L688m+XodRbCZdwDkNmf9n2B_047fg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zjcmjzIkjQU2rmur"
Content-Disposition: inline
In-Reply-To: <CACWQX83XPm4DmjgvtjD9L688m+XodRbCZdwDkNmf9n2B_047fg@mail.gmail.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Andrei Kartashev <a.kartashev@yadro.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--zjcmjzIkjQU2rmur
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2020 at 10:19:56AM -0700, Ed Tanous wrote:
> On Wed, Sep 16, 2020 at 10:08 AM Patrick Williams <patrick@stwcx.xyz> wro=
te:
> > I think we only "got away" with "no impact" from the lack of
> > implementation because the particular implementations that work well
> > with dbus-sensors also didn't implement it because dbus-sensors didn't
> > provide it.  That's kind of circular logic as a reason to eliminate it.
>=20
> Are there any implementations that people use that rely on Units?

Yes.  Originally the IPMI hanlders did and they seem to still.

https://github.com/openbmc/phosphor-host-ipmid/blob/master/sensorhandler.cp=
p#L652

I don't know what happens to this code when a dbus-sensors sensor is
read.

> > There isn't really a programatic way to define and enforce object paths
> > presently.  There is a programatic way to define and enforce
> > enum values.  The enums don't actually need a lookup table, if you're
> > using the sdbusplus generated headers and bindings.
>=20
> The lookup table I was referring to was enum-value -> IPMI value.  I
> don't think sdbusplus has the ability to generate that for you.

Agreed.  But, a C-enum to C-enum map is easier to maintain than a path
segment extraction and string to C-enum map.

> > If I were to guess which of the requirements would be more likely to be
> > changed it would be the object path.  There are very few other places
> > where we have such strict requirements on object paths (though we do
> > have places where the object path has meaning).  The current definition
> > is a bit ambiguous by what is meant by "the correct hierarchy within the
> > sensors namespace[2]", but the current implementations seem to take this
> > to mean `/xyz/openbmc_project/sensors/...`[3].  I don't know that this =
is
> > particular convenient for a multi-host system or any case where a BMC
> > is aggregating sensors from other BMCs.
>=20
> I'd be fine with this solution too.  The question I should've asked is
> "is there a way to get rid of the redundant information".

We could also remove the path segment requirement.  I'm not sure the
value of it in one way or another.  It is only redundant to a human,
isn't it?

--=20
Patrick Williams

--zjcmjzIkjQU2rmur
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9iS3gACgkQqwNHzC0A
wRnA9RAAkuUQk+xUbROhlNBcUqq/zpoiBBdjCuHfQYdSpJRHKqQsZj46xkpPDCMn
3gyeOpoM71yfxtflRGacy62SA1quLkgYXeZwRHhO/4zjpoCAaH8oOCX2Eedovsb2
nAKqZRhwVNy+8kTYDNpO5FLry31AAcvO0w4i5XmA/zSuG9SUuxiVx7T2VvcpoPUs
4SofjQ4vdz8Vfo4jtZTsBf4osyk6oa34DTl4Iw+lSthnWSPX5YnMI8aJJ6zR0iDj
Wgx6OrLopo7Gmcucq8fKtW9/kQq/zztdFutVWQ5OJDsYAd+Zbn28gcaDwsrc6pVR
j/E2G2RY003wBVhEblZmTxHIZ7edzxJVVws7mJyYfdJR1iW5DT4t9nmcqw0afXrN
S8tFNU/eaXwhcNOIEkadfbnsbYHwTDzHoFzoT5JhVsmDUJpKmk7LNGNX6nXDOe7b
fiAGFF98VGuxidU0M5EanXKpbGuoDoxMmQJMqCO4T3/IMxlXLZGU5BgtjUUriCw3
UpjWjI1pcN/HlEXJT26wdOAokSbPz87aC0cpl3kp0jowmEqKzFgt7FDZnpmu6PRq
ZZeralHnYKC5OsPxKBF9mssfOXRMh2LZkVu+0TrkamuRiunDVXWIX8ojiN4g3oNQ
40aSIHBKJ7Bwc712jF/89YkX2qVp/7Ki8kLnfDQsXqWmCl4modQ=
=NT07
-----END PGP SIGNATURE-----

--zjcmjzIkjQU2rmur--
