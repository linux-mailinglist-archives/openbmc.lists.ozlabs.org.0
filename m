Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F214258E28
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 14:25:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgmVf3VrwzDqYP
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 22:25:14 +1000 (AEST)
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
 header.s=fm2 header.b=PjZwoBGP; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=bcEHQyI/; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgmTV52yYzDqXB
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 22:24:14 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 5ABA65C0295;
 Tue,  1 Sep 2020 08:24:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 01 Sep 2020 08:24:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=CeFRjb7fVPsF2pbbe7kVZpUoQiH
 z3BMHM5TBiS72pU0=; b=PjZwoBGPUosDSkKwb/Jw0DkD3utLmp/JLZLqSr/7bCv
 uQObo4/eQMrIDxVdNfezUJw/IocKmqRjV8wcVwKotsRqI4ftNdiLlMtjaV8lm+no
 3tQmi7ECfhCqcxSDDqw+8Z5v8YijW9NtXfUN7PniPbwNCXexf4vvCI/cUj983klV
 14CJEZXgmcJVsHIqPLPI9A0CEA0Tf3dalVFREyIiGUZu2RI+AkJve1F1EK8NWvjW
 jgdMiu7BHEXYN/nal2NJja1ukLSzMTbSYaZ9AKst6XM34sm+DZ/l4VRcZYUtaY6U
 na3zi5p/THCyuDrbaptpj5X0+tLS85aixXOWWxnQFaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=CeFRjb
 7fVPsF2pbbe7kVZpUoQiHz3BMHM5TBiS72pU0=; b=bcEHQyI/FBYkNbirrVn775
 uLNc82blNSUAWTsRYOAgUVqp2HHOFTcYGcEao0D/37qkmvO4E0TrMYl+iQ0XB4to
 sI6e5IT0xSNWK8EyUGhUZWsCXxSQA9oQ21CxL6oP8ERBeAvml8we8707f0eiA5Eu
 COm9yQLOnXGuEIV+YpxG4PN5NvBbzF+SD98DkS0/CllNhVbbwIQkEcqZ0e8Z000z
 QxTHM5CWYuEIslsyhYjkC07lfTZv99a7QdQZfODxnIicU2F0GClHnlYUVBuulfB9
 hhO4sLzu/V5QIrGc5pkDvg17KfBJAcnX1Z5jFrsPNvAo7EV6W3R40U1HTDG/j47g
 ==
X-ME-Sender: <xms:az1OX0wRLu6IyEaTZZ3sIwYwO6nN7a-QIYxHLUDgVQoGuHmKLPGO4A>
 <xme:az1OX4TBLe-Ruha6uxmmx8VnJvkItOQNly82OHa43TZxhy0I5n07vYKPf0zUd9fjA
 oNSZOEIKuE8RKczNOc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefjedghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheplefhjeefkeetveffgeetffdufeeh
 leefhedvgffgvdfghfejhfefffekieeiveejnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:az1OX2VVaMfevf7f-hGz__dSEST3K0RE9-JCcAzhBkqf6csN-2MXww>
 <xmx:az1OXyiGJDgoli_YxO_mGNUeDBs-kZyduq9G4uE4vq2XeC081mRfKA>
 <xmx:az1OX2DTOFGuRuZOkAsCk2PS3DRXXilTmZlKBLVdkRiejC16oEfigQ>
 <xmx:bD1OX98g76MocTJX14FJ5eHMW5z2qDrVTFqXJfD-_RwKwVdiv6PQVw>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 54C8E3060067;
 Tue,  1 Sep 2020 08:24:11 -0400 (EDT)
Date: Tue, 1 Sep 2020 07:24:09 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
Subject: Re: When building OpenBMC . . . ?
Message-ID: <20200901122409.GQ3532@heinlein>
References: <c9737b1c67174a4fa9666b1d8afde380@SCL-EXCHMB-13.phoenix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2D20dG0OqTzqkNh7"
Content-Disposition: inline
In-Reply-To: <c9737b1c67174a4fa9666b1d8afde380@SCL-EXCHMB-13.phoenix.com>
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


--2D20dG0OqTzqkNh7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2020 at 10:02:41PM +0000, Bruce Mitchell wrote:
> When selecting Target hardware https://github.com/openbmc/openbmc#3-targe=
t-your-hardware
> to build for the is a tiogapass, now if I add a meta-phoenix/meta-tiogapa=
ss/conf  how does
> 	source setup tiogapass build
> know which tiogapass to build?

https://github.com/openbmc/openbmc/blob/master/setup#L34

The setup script just does a wildcard, which means you'll get the
alphabetically ordered machine.  In this case, you should get the
meta-facebook one selected before the meta-phoenix (supposing they both
exist).

> Or am I not supposed to choose a name (i.e. tiogapass in this example) th=
at is already in the list
> when I need to create a new meta-phoenix/meta-<machine>/conf?

The overwhelming preference seems to be to not make another
configuration with the same machine, and as one of the maintainers of
meta-facebook, I agree in this case.  But, this answer doesn't solve
your underlying question.

I suspect you're going to make two kinds of changes:
  1. Features you want to enable on Tiogapass that Facebook isn't
     interested in.  (I would cover bmcweb 'branding' changes here
     also).
  2. Fixes and configuration due to features we haven't enabled yet or
     fully vetted.

#2 should go into either meta-facebook (or the underlying code
repository where the fix is needed).  These will be common for any
tiogapass hardware, so lets keep it in the common location.

#1 should go into meta-phoenix.  You're likely the first one doing this,
so we may need some experimentation on the best option.  I have two
ideas (there are probably others):

  * Make an alternative tiogapass variant, like tiogapass-phoenix, which
    ends up including all the common tiogapass code from meta-facebook.

  * Create a new distro type for phoenix, which enhances the underlying
    openbmc distribution with your own branding tweaks.  You'd still
    build meta-facebook/tiogapass but with a different distro flavor.

I believe IBM has experiemented with both of these approaches for
witherspoon (see witherspoon-tacoma and
meta-ibm/conf/distro/openbmc-witherspoon.conf) and might have some
insight into what has worked well for them.

I'm more than willing to work with you and your team to help refactor
meta-facebook/tiogapass in a way that makes it more condusive to what
your team is interested in doing.  I suspect we'll need to create some
additional bitbake '.inc' files and move some of the content we have in
'.conf' to '.inc'.  Catch me here or on IRC as needed.

--=20
Patrick Williams

--2D20dG0OqTzqkNh7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9OPWcACgkQqwNHzC0A
wRlG5g/7BfJE53WZYZI9dkpamDOXOMJ+s/XDe8XlzROlXg9H8+9rVDL8nNASKnFd
i6oCRGh1wtwuM/qJRj5E2IEclQl0tw0n4+cqHHFKFGTQfPO95ADaJNGSFDQ18NC4
gu9n8613T00ul34SN83eIKRc63HZSbkE9q0Y5/PJB+5T8Ub08RGOfYxalnnvCoy8
5x1AgHA6fluO7Zw6/KzOCbirneDGMsVE5acORdMEzMqqZoljibBOFDUfh2wcenkr
8sNYfay4YlHHHLPbgvn43ofBA2dQvWTGe8NdktZubwGR+JJFN24hD/goHHBqBce9
+4dVCBzRnTroOq3olINzAHrsJLnA5pmcZxpFgD7LcR9pviMETvp0J1BTh+P+i03o
DgmLFMaDCW1L2sGckdjQHuCy9txbWaWIBvPxXQYfY+kikdLItUkm0M+Hpornou/u
4FnOIVQS/VQ7Gk1nFlEOmxgF9eonN0aiNoT2rceKbRcph+OsxSugxmlx3/B1XjgK
qYWHNmj7ZMZ8facIn6QXQT2vS11i3lgqijgrWdU2apQDi2MjgxZIC6LUSX/1T6mR
3ZG27knfP9ss6top39uFudtMPUYjpZy2OYlOEFcxawFjyVr6wQvgQb2LMAG9KTht
evdhGz3Zslc8234tO9MSI5aZL27CPSHHncblktHGzV8hy41EnKA=
=tNDx
-----END PGP SIGNATURE-----

--2D20dG0OqTzqkNh7--
