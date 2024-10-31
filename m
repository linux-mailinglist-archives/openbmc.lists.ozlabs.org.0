Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F549B799B
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2024 12:21:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XfM5H3wR8z3c01
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2024 22:21:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730373696;
	cv=none; b=hha5FG/fZ8qnsNlNqFchjMDRjosQWqgbPY2u9pn29qjUEWxAO+0gfRlSIguIbpKG/vg+jqNB9x1Mp+ptnrI1P1r8CTl1TGwQti42oMn0QvABLVdHcZFh+Ram4FWK3bmpajwaOYAB69dglGy0QQXQ1ZrWM7OCSiIYdbtCoffufd2ZAjSysPCOxcqvF1h6fKrYN8lxBaQSK+o5SjD2ac94jCXrgRN45X6pP7r5nXhcHzoUtG0nIOzf7ROk/zRsQkYctwW30EFaYGMT6aiC/F1tJAt7cnyxVgNP0Ch0qVHWrbk0HBYWpVFaHi6GVnoqspiyCZ7WxP+YH0I42snMyUZftA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730373696; c=relaxed/relaxed;
	bh=z6snT4fxSZvPP7VPg9JH34DIX4e7Wa4KfCrWgu9agyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a4xQsLWKF2y3fnLi1wouMEjHn2tM3kE/mLhPv/daoQyjAc5zOPPD0Fu4THTaHEOaECnCv4FaEdIsNM8dPf4CPOq8RCHYsZvDR5+TmxD3HfJZnRBOv82TqglgWSRzCZUP5KHUA7A/xVxo/Uhgw+ff+Bcs2aIDY10gmJ7XcZRxS+uFS5FOm1Iw60IZIZMX2OcqghScggBrCe/cbYxh7KVMPDCGuHLXBVpVN8NeQqCAPmPMhoH/ThkHN1KrPZ60YoWAeMZehrhn7msRUbrtwG8prs9TS6a6+oC9H2gsxL7JSPAelsGnnauGJKj8CHenA2xr79+ZGthXAzlQkmnNR2sz+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=edGUtbKN; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=j1ShSEp2; dkim-atps=neutral; spf=pass (client-ip=202.12.124.157; helo=fhigh-b6-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=edGUtbKN;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=j1ShSEp2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=202.12.124.157; helo=fhigh-b6-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
X-Greylist: delayed 443 seconds by postgrey-1.37 at boromir; Thu, 31 Oct 2024 22:21:30 AEDT
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XfM566m7qz2y8l
	for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2024 22:21:30 +1100 (AEDT)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CFF8D2540101;
	Thu, 31 Oct 2024 07:14:01 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Thu, 31 Oct 2024 07:14:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1730373241; x=1730459641; bh=z6snT4fxSZ
	vPP7VPg9JH34DIX4e7Wa4KfCrWgu9agyw=; b=edGUtbKNJPzjXxD7lKLAfRtush
	9C+AAnwIeUmYYaSF1EkqS17Kvg3NlHFCeIJWkoa5Je8RYsLJ6lkIga8UcYCTOnQY
	Oyvj8gKanlrcgyhLwdRILx95waCqmqU4o9tYxrCgXQyJnGAIEsvQrHzM8zFRViXT
	ErH81bHtnGUiQFxK04yJH9T/cmxMk0HlCmqQ0D/yuWERG8s8L+aLktG6vjbbP33A
	1BdpGJ9WyEe5W0ydVlzb7askRE+sjKKIFZkg/ptSQgYcP5ln6dSQDFH2cQYOWkF3
	aP2nuCRnLDtMHJ/ghXKS03+9+fvzj9RN14aSj3IkvnXr24whvQld6dBJGUFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1730373241; x=1730459641; bh=z6snT4fxSZvPP7VPg9JH34DIX4e7Wa4KfCr
	Wgu9agyw=; b=j1ShSEp2+J/JQ32I3sMVpsRrB2IXioPGrhQjiroxunbmfV384/p
	gCCx0VSGYaUDCRLu6QVGRXHxQKE37AZnul7Mi3iUTthfS3mPFpW2IUN876wpVQPt
	S7VHIqfPojbBWyvkzRwBOb/ScljyYdE8AeUI1tlibdWPT9zQy7W5UZGTSi1wgCKs
	q/jS6U/haKGOVnm67/8jpr+Z+ZI+7HfFV9mhQsRYfKMsyQSAzUAI0MqIKNge4xR3
	IsbWj3vtnJfs0lp+46SfAyE6ul7j8Zvw1lQQlzwzU+BN/czgOq8LLujTaP0xteL7
	BxJjWKifI54n9aF8qmE9UUo4Jgz6ozo1/BA==
X-ME-Sender: <xms:eWYjZ7Y5m4Y9QaUHwBMtMoMGiAReVrZCxSOgSb6DpLQziWfYSSSrUA>
    <xme:eWYjZ6YyrxUE7aU_7PQplTLouncXEc63zWcvAr4oFCTK5gSc3yQSnx6nkHT1kjd0z
    4PvUp7kB9iJKqxHnjs>
X-ME-Received: <xmr:eWYjZ98Mgj9bSRMyzIus4dL5qi6tLIcz0FfpKEaNX4d2VLW6LWY1PoUkS2U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekhedgvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnegfrhhlucfvnfffucdluddvmdenucfjughrpeffhffvvefukfhf
    gggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmsh
    cuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeeigefh
    teekudfgteeuteetvdelfeegjefgleekvdetffdtgeehjeelgeeggeffkeenucffohhmrg
    hinheplhhinhhugihfohhunhgurghtihhonhdrohhrghdpshhtrghtvgdrghhovhenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitg
    hksehsthiftgigrdighiiipdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehfvghrtggvrhhprghvsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    epohhpvghnsghmtgeslhhishhtshdrohiilhgrsghsrdhorhhg
X-ME-Proxy: <xmx:eWYjZxpBZ2axlysSPyBGXpi0up0J_UGv_fX7XqZIjN2dwRZ4yCxIxQ>
    <xmx:eWYjZ2rYrypEza3PKU6xwa3WKj2yeIK6rkl9ZCR1PSTmvKZQAhDXBA>
    <xmx:eWYjZ3T97BdgOuYsyxNf0WzJUUjwwtVz5sulyuWTnPMFXmgFNSgUew>
    <xmx:eWYjZ-qzK825RI2OBbmbd-ysNPBJUmYWykbQXr1QaeECblGNwDizlg>
    <xmx:eWYjZ93IMZKzZ6oj88SAHuA9yuDLsAvHYloUMWK46HtUwtTFRL-QHcQ_>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 31 Oct 2024 07:14:01 -0400 (EDT)
Date: Thu, 31 Oct 2024 07:14:00 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: Paul Fertser <fercerpav@gmail.com>
Subject: Re: Update on some maintainers / contributors.
Message-ID: <ZyNmeMGIV8Bvq5ik@heinlein.vulture-banana.ts.net>
References: <ZyMIJfBoYDPeJhxK@heinlein.vulture-banana.ts.net>
 <ZyNWWLJOBOPdmbVI@home.paul.comp>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ozd/DpA8SsR7aRUV"
Content-Disposition: inline
In-Reply-To: <ZyNWWLJOBOPdmbVI@home.paul.comp>
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Ozd/DpA8SsR7aRUV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2024 at 01:05:12PM +0300, Paul Fertser wrote:
> Hello Patrick,

Hi Paul,

For clarity I've tried to be very purposeful in my use of "I" and "we"
in both this email and the previous one.

    "I" - me personally
    "We" - the project as a whole, speaking as a member of both the
           TSC and TOF.

>=20
> On Thu, Oct 31, 2024 at 12:31:33AM -0400, Patrick Williams wrote:
> > it seems like we should be more forward about what is going on.
>=20
> Great to hear you think that, and thanks a lot for approaching this in
> a more humane way.
>=20
> >    - We are not accepting new CCLAs from entities on the sanctions list
> >      or accepting ICLAs from individuals associated with these
> >      entities.
>=20
> Please consider trying to do better than the "high ranking members of
> the kernel community" mentioned earlier and adding specific, explicit
> rules regarding this issue to the project documentation.

OpenBMC is a Linux Foundation project and we generally look to them to
provide policy for this sort of situation.  Thus far I have not seen
anything formal from them.

The usual "I am not a lawyer" disclaimer...

It is my understanding that, independent of any Linux Foundation policy,
a very large portion of our developers are bound by the US sanctions (even
if you have never even entered the US).  If you are covered by a CCLA,
you are also contributing to the project as an agent of your employer
and also have to comply with your employer's policy on the matter.  Based
on informal conversations I have had, for people that have had explicit
conversations with legal representation, there has been an array of=20
"what to do" advice.

The best we can do at this time is what I have already written.

[[
    Re "very large portion": It would not surprise me if 100% of active
    contributors are subject to the SDN.  If you go back 2 years it was
    still probably over 90%.
]]

> In particular, it would be really important to clarify=20
>=20
> 1. Which sanctions list it is exactly; for Linux they say they are
> going to follow just the SDN and not the whole OFAC so even despite
> e.g. Huawei is sanctioned they are still allowed to not only
> contribute code but also maintain parts of the project.

Yes, the SDN is the primary list of concern right now.  LF has
previously made a statement about Huawei.

https://www.linuxfoundation.org/blog/blog/linux-foundation-statement-on-hua=
wei-entity-list-ruling

Ultimately, there are current 21 different sanctions programs, with
different policies and lists, that many of us are required to follow
even if we are unaware.

https://www.state.gov/economic-sanctions-programs/

[[=20
   I realize I'm taking a very US-centric view here; other countries
   have their own sanctions programs.  It is quite likely that I am
   also required to personally comply with rules from the EU that I'm
   not even aware of.
]]

> 2. How association of an individual with an entity is established. The
> kernel people were mentioning some documents that a developer might
> provide to prove they're not associated but it's hard to imagine what
> kind of document that might even be.

For individuals covered by a CCLA, it is relatively easy; for those
that send an ICLA it is not.  Until there is a formal policy available
to us, I don't really want to say any more because I don't want what I
write here to be construed as the policy.


--=20
Patrick Williams

--Ozd/DpA8SsR7aRUV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmcjZnYACgkQqwNHzC0A
wRlzng/+I3uqfvo2EC+QULpw6wOE9C99Ppt+60LGc54VyoQgd/uoI6Cci9NOvy6S
4I82B4Yy/bZZdVM5uXD8l4NXjLL3aBc6mIGL8BEBq7iqJG2xOBjoqah4L3ovhQIw
+Qjq3k5YMKxw7ePB2Wrc0LwdWviV4Faz3XR4NJOOZMQx89JfS4HUYk5zQkgHKNju
c0BpLWyP3MVNvEocIoeikD3+wQDYqQwNiG1k5G3zMAyeAt9FiUulUAXRfQ33lxwd
bQmr3NkWcLF3UVKjFE0y0/AG2Mbq6qYrsvmS2IZJ8j5glSVME6exS2Q/pENqqq5K
FVhWYdOXqBMsni6oD4vS/9RMYOzSrW7CV5jFOfTCx3NRvxe0quJRADW1YxHZfi9t
5Vllqzpe02Bv+Hb1a/CTVAhKhDt94Brzqy01prPgcF1e4WQlazXjBGAsLDeBC9Zq
eVef2uz246lSoWDwK8qgIYs+UR4Vjz0u74199u7hjXWPA0ZfkbsfuY80f8a+/IVV
HyD4VKXSH/U0EevHwZoJ3Y9UzfzkfWPMB2vNTxv3tn30Xt741rH7gHfY4CTjHaVo
bSUuAg6uD6nrlevNp12Dh39A3I5OdgoEE3fx4VVVvpDv7ZMUKtPHmK53ju7ZTmGQ
pgE9r+tBs+ayI4MuXcO9qGQEgCvvMpnQwM2fPssZQ7JnVI6gDZE=
=7TYJ
-----END PGP SIGNATURE-----

--Ozd/DpA8SsR7aRUV--
