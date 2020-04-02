Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F14E19C5EB
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 17:31:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tRqZ4PpnzDrVP
	for <lists+openbmc@lfdr.de>; Fri,  3 Apr 2020 02:31:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=ZqNxXvjF; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=CmBgECC8; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tRpS3rW3zDqr6
 for <openbmc@lists.ozlabs.org>; Fri,  3 Apr 2020 02:30:23 +1100 (AEDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 22BBB5C01F9;
 Thu,  2 Apr 2020 11:30:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Thu, 02 Apr 2020 11:30:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=vngPeKbgJF2Elzy6El/Hq2g2GWK
 WUltJ2gwzZe8GGnA=; b=ZqNxXvjFENOjhjgm/aVaCjCA8nrJhfZuJAZFtHMfT91
 HBtts5nvKu6yQUvZ19XoFmN/1khdSsnT7We2doDp3UMqYjhImRQ0I8v78oyM/wO5
 MiP2iGGHx7trhFn/AvOja3rmuRZXLzPJJKggPdSIh1Hbo2xi/xebCT4nft4Zak6o
 kYLfU/FYKEtXDWBZt6DmgRv6stCIwEJJofng9eZ5LvavOgcmtdfn0DQGD471U75r
 s+X/CcSw43pmBWdtJIGYT+s9NF9VeieD2aIstI7CdbbIMxZxSqKnpe4Q1/koYwcl
 +6xv0CKk2qhniqGOEBdJZ+w3rNcpe4oizzFNpsg4f6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=vngPeK
 bgJF2Elzy6El/Hq2g2GWKWUltJ2gwzZe8GGnA=; b=CmBgECC8MwKwcbRxNGcF5g
 5wSkgq1BNjUn/SpO4JSOGXxQEGO0+g4DytZcmAZ76HakZ6GgOXNsVGZzIOyzYLG1
 iCf3I4ZbFr0yAS6USF08AdVtH1uHzMV2o/4wzIXen9z+wyKQxa29Wy7WPbwPHW5s
 UXn3qAxAkBBifKdIJS9B0SslfM8/W9OzzM8zOYu86XXBljW7x1m+a6t54Tof7WVK
 TiDd5GD5FFXbklhUdyN4s0kdqS0UDmhdxsp46h/PoFFUTagE+Mil8vHruRMjYT2x
 40oY6E5h2RjfSzO6Gb4gYcWo+fnxTdKuqfADat8nBMokiNYeUNgTj+kfiw8wLEew
 ==
X-ME-Sender: <xms:CwWGXnYBA8HVrfzKyCeq_ENcxYlg7cXH7PsR5CqjAH2i9bVjvsBF5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrtdeggdekfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucfkphepudeiiedrudejvddruddvuddrjeenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftg
 igrdighiii
X-ME-Proxy: <xmx:CwWGXtMIgDLksixP2f5nGQENr8lFrIQvK58kCU6SYcJCmEC4I5iuzw>
 <xmx:CwWGXi7qgoIyz7ngBj8VoU0YuVBgEJCL_tZ8gzk1cknrcLa7gLm4rw>
 <xmx:CwWGXgfVjA4F--CrDyjP2iFoUIAWDGW1xFFHhfOB6oRCnIZTlvuwpg>
 <xmx:DAWGXqK7K3rjrglVcy6wkG5SmXTEbUQ-EvPICpVEOvPZAHG7zRtyKw>
Received: from localhost (mobile-166-172-121-7.mycingular.net [166.172.121.7])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5C750328006C;
 Thu,  2 Apr 2020 11:30:19 -0400 (EDT)
Date: Thu, 2 Apr 2020 10:30:18 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: Re: Dead machines?
Message-ID: <20200402153018.GE580847@heinlein.lan.stwcx.xyz>
References: <20200401213251.GA580847@heinlein.lan.stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Oiv9uiLrevHtW1RS"
Content-Disposition: inline
In-Reply-To: <20200401213251.GA580847@heinlein.lan.stwcx.xyz>
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
Cc: Patrick Venture <venture@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Oiv9uiLrevHtW1RS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Patrick [Venture],

I even got a bounce from the only person @hxt-semi that has committed to
this repo.  Can you help track this down?

On Wed, Apr 01, 2020 at 04:32:51PM -0500, Patrick Williams wrote:
> Hello,
>=20
> As part of the python2 -> 3 transition, I was looking for recipes that are
> still have a "inherit pythonnative" line to see how much farther we have
> until python2 is eliminated.
>=20
> I came across two machines that have recipes using the very old
> "config-in-skeleton" feature and include python2 machine configuration
> scripts.  Running python 2to3 on the contained scripts give parsing errors
> even.
>=20
> Do these machines even build and run anymore?  Is anyone planning to main=
tain
> them, or should we delete them?  The last time either meta was touched
> in a meaningful way was a year ago.
>=20
> ./meta-hxt/meta-stardragon4800-rep2/recipes-phosphor/workbook/stardragon4=
800-rep2-config.bb
> ./meta-qualcomm/meta-centriq2400-rep/recipes-phosphor/workbook/centriq240=
0-rep-config.bb
>=20
> --=20
> Patrick Williams



--=20
Patrick Williams

--Oiv9uiLrevHtW1RS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl6GBQgACgkQqwNHzC0A
wRmsDQ//dnAl9zbvXMq7g3y5pei+O4Fl1JFfvyQh41otj+2rOoST321VABc+POGY
TNB1zld+Fy1epYnAC3lu5tsqWSsjUoDCnkxUm5McloaU2rqKhCerH7CvrF64gEVB
g7kuwLJh28J+ZrmeiHykgWkzxrXBlXbpykyx9x0NlZGPVki0bbYmiZQstubUDXiE
aIWEjtqhsKz1FlXAB0o+aXNkvi9hS4K6Hc40zGAId/B5dXF2tyd0+A+GJnbWot07
a+MYeiRAut7IBty1y29bjVZeL1gQhCrfylW7GGhAcLuDa0trmW9bejZfess/70WS
bh+did2Y3sbj4P7VYxny+qrJX+tnSmX3uuT1xcdFXEDtwDdjCgXXzXEG5wAiqS8i
U5/H/YJryGKZyvv6Hn2KJyuDznjBMCJ1Y0qqT2S7VCQIZ9pony36tcz2P2ol5ACY
PmJyomKL26wc9QxylQdBPfQMrnVKnKrRztLe9kEvzRp335woKWJqgT9FaucGq2Kc
xV0l1RlLJk1jzroWRna0DRvdiWngyLNUOOn6fXR6lsBjfpaGBBq3qTN1uij6WzDr
nYbgrCQirS6f+xLJujyTmgvT9cwLv7fTIJ3KjND92WAXJrYgfsG+9GfbQptpjMd4
rN3rsViJfyacGp2O/lW/1HU4X4GFj28/T3Fxl8S529in5vGr7ZA=
=j68B
-----END PGP SIGNATURE-----

--Oiv9uiLrevHtW1RS--
