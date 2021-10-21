Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E88BD4359CF
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 06:24:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZZ9p2kg4z2y7J
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 15:23:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=f8jsbEid;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=LOgMiJNb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=f8jsbEid; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=LOgMiJNb; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZZ9L1x91z2xKJ
 for <openbmc@lists.ozlabs.org>; Thu, 21 Oct 2021 15:23:33 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B727B5C012F;
 Thu, 21 Oct 2021 00:23:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 21 Oct 2021 00:23:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=PXcp7/O4M4o0kiv7lXPTh2nFYOj
 JaUFj7oBk34OUICY=; b=f8jsbEidNKnmZvrqywuDetERJ5uet0q/fu2JREOdBsA
 paV2Whnl8lciJSRlRhU2Ahg/LEWG95cexrJqkkAHTA0qO1sl+markV8s2shnpTIi
 bi911m+uv/d2Sq9csczT989+tUUHPyEc6Piky89zbx9dH9XKQQXNukILmn6yR0HF
 zd9q1j7RU5T4MYUFL6CR80IQ89ROqGspA23J3ITW4FGoes25VnXkN3cSzVymPeQZ
 SHopP7IoOzGbCajkdurd/IRVrPPb7Vaa+iHMBGNj9uw9mTe3lQwIsKoIjJKnzdY3
 rJ+OYwabK0COc4tB8gTJrG04oKsIY74vrSeMsS/MGUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=PXcp7/
 O4M4o0kiv7lXPTh2nFYOjJaUFj7oBk34OUICY=; b=LOgMiJNb8aw8ZXifICLcVD
 GQOQjFA68W3YFv+9duSVT0+npVEX6R4S+CF8LZYiR8Cl/eL+6kq3pkuGDGYroHO6
 ikH4+YmRsxt0mTnn8Ycd1QPRVGOvKSpjNkYLWLgPRe6rr7qK0diGxZML3I4Rs60H
 grHY2TVdRkKk9aBUVIopJUHEIkSkJe9iaraCO3M7E/ejvHJnAU9/JywPWVYW4TUP
 CkLS7AZ5izvidrapL2D8XshfA/RMHVHkskW/JW2dP0VFKt6LC2gNdJc9CC8f9TWb
 jEvaiju0b4yDCfF/RatuD6y1tPFVA9YHydfODegBNlA9BaoX1SxD0y5gUOo3VxdQ
 ==
X-ME-Sender: <xms:QetwYcF4Ksd8RsT5mTKJbvGtSs_AQ8ZKLqU12t8VsUvmvfYB7Npbrg>
 <xme:QetwYVXsdO2skKoYPMhJ6KAm-uqgVL6Xshiqd0QFhpNnfUEKPgPezYIJZWVt1Sz-u
 VU6IE2FnDBW6OQwosg>
X-ME-Received: <xmr:QetwYWJW2bI3_FWtQDQmN0FRi9kytUe-RRwpmUOo6Fil-_jMZTF-EY3X4xM_mxBS01F8NXT1VQMT8wJIY1Wqvm3w6zASpGWwOKYB1AMNu2gz4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvhedgjeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlvdefmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 epfeffvdegtdfghfekueetvdeiveejfedttefhgefgiefhudduffeivedtfefhfedtnecu
 ffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmpdgtohhnthhrrg
 gtthdrmhgupdhophgvnhgsmhgtqdhprhhojhgvtghtrdighiiinecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgi
 drgiihii
X-ME-Proxy: <xmx:QetwYeE_YU1OyvMI6wINvRKSQoJBPXA45zz0IEomVVnUdR1Wlhd84A>
 <xmx:QetwYSUdfI9Sz1uGApJ-I2AWXwfSt_jntXb65V6BsJ-nQN1nngoz1A>
 <xmx:QetwYRNDCg9_Uu_KQV6FzBx5dO5jgAPB7KbOLQMCy6skvlaGDkWO2A>
 <xmx:QetwYbcdIo0Lq5U1ew0RYuPCUvV40e_JRoEacFwOfhUtRlzOszkfDA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Oct 2021 00:23:29 -0400 (EDT)
Date: Wed, 20 Oct 2021 23:23:28 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: introducing the OpenBMC technical oversight forum
Message-ID: <YXDrQAf73igsbu7+@heinlein>
References: <20211020020110.mcf3isoygjfujolt@cheese>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="L6LrHovs38+SIFQd"
Content-Disposition: inline
In-Reply-To: <20211020020110.mcf3isoygjfujolt@cheese>
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


--L6LrHovs38+SIFQd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 19, 2021 at 10:01:10PM -0400, Brad Bishop wrote:
> Hi Everyone
>=20
> It was pointed out to me that my technical oversight forum introductory=
=20
> email here:
>=20
> https://lore.kernel.org/openbmc/20210927162528.tfh6igwuwef7rsk7@cheese/
>=20
> had the unfortunate subject of "call for volunteers" and thus might not=
=20
> have been read :-)  - so I am sending it again in what I hope
> is a more visible way.  Thanks!

I have a follow-on to this.

Recently the TOF began operating as according to the process Brad linked to
previously[1].  Some people may have seen an proposal[2,3] that I wrote and
wondered (among other thoughts):

   * What is an OTP / TOF issue about?
   * Am I allowed to interact with this?  How do I give feedback?
   * Is someone really thinking about deleting code in the project?

I want to give my thoughts to some of these questions.

a) OTP stands for "OpenBMC TOF Proposal".  The 'contract' discusses Github
   issues as the mechanism to alert the TOF that you would like to solicit =
an
   opinion or direction from the TOF, but the 'contract' doesn't really give
   details on how this works.  Based on our experience with issue#4, the TOF
   agreed that we needed a more concrete process and I am working on writing
   that up.

b) Anyone may give feedback to a TOF proposal and we all welcome and encour=
age
   it.  The TOF is not meant to be simply creating edicts for everyone else=
 to
   follow, but instead is there to facilitate forward progress on technical
   designs and process improvements that we've often seen languish in the
   project.  Part of the "concrete process" will be guidelines on the best =
ways
   for any member of the community to provide this feedback.

c) We are not going to be deleting any code or recipes based on issue#4.  T=
he
   TOF did agree that Meson is the best option for the project going forwar=
d,
   but that we need to work as a community to figure out how we get there. =
 I
   will be writing up the outcomes of the TOF discussion on issue#4.

d) The language in issue#4 was written in a way that may have been alarming.
   The TOF is new and we are figuring out, as a group, how we want to go ab=
out
   making improvements to the project.  The initial wording was, somewhat
   purposefully, chosen as the extreme end of how we could go about making
   changes and inspired quite a bit of useful discussion.  The biggest take=
-away
   was that, in general, the TOF should be communicating much more broadly
   before making sweeping changes; especially so given the newness.  As I
   mentioned under (a) and (c), we will be doing so in the near future.

Hopefully this gives some additional clarity and insight into what is going=
 on.

1. https://github.com/openbmc/docs/blob/master/tof/contract.md
2. https://github.com/openbmc/technical-oversight-forum/issues/4
3. https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/47732=20
--=20
Patrick Williams

--L6LrHovs38+SIFQd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmFw6z4ACgkQqwNHzC0A
wRlL2Q//U2RsfYS0YU6ntWjp8SRjbNSaIWGWFS3Mx0uPNzW6LK7EUB/2NSFmTYvy
yLWtW8CpOXp8x2t66jEVkWnZIeb1Q8hQ/qNyzM5VzRLPPJicwsmdTbPrnpznbPPg
7McKpQFhn8zZueAkoMEqQJOcxlE8GEhFTXDEFZ511HxYiAEi5iFDQCJ15SiDmBVx
UAnYn0P2r1LjrgWzS+WWEbIRUToLfJEvgep2gFG8oVN2bwNat9+p2luVWChQOh+1
ThKzPCFVE9rVq7VNypz4iPXfmd5NmKzeY8QIyj2TlnNFFMbtGd6JpWNiKH+dlZsx
cu55NM5ebiokMvxk0GfNvSTDwdHGc7BIOwqBZj8vO/TyK9+qJeWCTeQ1YuiFYQTL
NWdznlBYOt4UOkLECRQRUnfLgNmE9AirH6y+oOMIs+2Tw0TXH8wjNrsI5lLXm/Z1
aimpqQTeEeFFRoVeaJ1llc8kuEzN51yRnsBuhcosEHlX3hnCHUrTeQacaftCsMSJ
RaXK2a+m7vgDtmFTSn5aYvLvkfqpCABSDa40NCeHSlnptjEGIvHITEjGbOVNAa96
RJw4ADf/VMr68i/83w3nuAsBxN3imStEMdQ00yLaRYlrFpyPAK/MMeWtoG1BBRvk
rx3JVjfjjhAmwWkKBuK1SJrPJ7yYLMljcJxE9RioXvwSKIqT1lg=
=bsqp
-----END PGP SIGNATURE-----

--L6LrHovs38+SIFQd--
