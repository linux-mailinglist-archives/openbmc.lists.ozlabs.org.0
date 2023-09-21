Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3927A95D1
	for <lists+openbmc@lfdr.de>; Thu, 21 Sep 2023 18:48:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=cvciddgR;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=cXNStzE1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rs1ZJ2PSjz3cNP
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 02:48:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=cvciddgR;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=cXNStzE1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rs1Yb1zzPz2ykV
	for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2023 02:48:18 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 61D555C00F3;
	Thu, 21 Sep 2023 12:48:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 21 Sep 2023 12:48:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1695314895; x=1695401295; bh=QW
	a+we9v7A0UQ0PIQEorOuw4jwFK7Ode+XEeTwWRhoU=; b=cvciddgRuj/D+WgK4e
	fkQlA8Vuq08fco1zYc45EDbSdF1FHv/KFwcmCJJzg34hOfLVAkZEuARPIvHL3e4p
	sj1UHBLSwuyqvKy05urWqyujg+iFe0S5Xkh1qirYEQprrNEncOTCn1tLuRDTx1Ll
	WMnkEUyB3DXpR4OjvYaAxAbJihKdZXKi2C0UvP9gXWEq0ft05OlojrA+Qs3xd1Dv
	17ue4lCO4Apo9olP52SqT2+XeTnPsvCPfD+8ongv/kI/EgbL3a70NGkJJgWN2mVN
	evAySdKRW8PicolhQV3vZQmQXNvPiOD5d8ULU2uiGX3UJ2BnIyTX/rxH0eNYWdh2
	7uqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1695314895; x=1695401295; bh=QWa+we9v7A0UQ
	0PIQEorOuw4jwFK7Ode+XEeTwWRhoU=; b=cXNStzE1oC3ClvOVwkfF63PNUcLMh
	8gRENI7JQj1bb1c6q1NWE9ahVCrBKnbHq2GQ0r1nzC4zZBA+5ysN5gOffzpYFff2
	nbRwpPMinQCq4A8McmROYrdZQ8X/Y/aPpjy75Iv9WBz/JPCSyWyp1Af+VVY47Zw2
	/6820MHC1IlWpLUnc+jhsdO57VaTFXrXWeEHeI3MBsNHGt5Sx9WMS2SPvJubwoda
	wOF0/6byfkr22/0L15ri2f2jBEGzw9GoXK4nhEqugg7U2BVZmbVQdmeKrOlydkfo
	1Su6/EvK0SJ2vABrVvXfFj+JP8XPMXw8B3oOce7qYCb3ZAQXOfUxFC+NQ==
X-ME-Sender: <xms:z3MMZZK5T34TgmcImfCs-R160H8-w1zkE3qkPsuVgpyHaTZ0yjZN0w>
    <xme:z3MMZVJLOV9LE_jownt0DAWfniq_QOXfDd0CWPw21BJtA6TzAksJlBXCcnOL3PzwG
    QFB2eTDjbc3vSHx3xk>
X-ME-Received: <xmr:z3MMZRsWCYgAAiIEs5ltSKfgGyc2sW5HNyj5uBEeD6U3vDHYjVypxTSdDCmJDecp41APZNw4Zs7jB6wt-hKZ-xVjA65vm_QCb4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudekiedguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculddvfedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreer
    tddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepjeejteelheelieejuddtudff
    hfeuueefhfefleehveegvdeigfffheduleehlefhnecuffhomhgrihhnpehgihhthhhusg
    drtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:z3MMZaYXgiX6UodEvugL5o_usW2q36QFZL6r8lIRuR0r3gauH_PqGg>
    <xmx:z3MMZQb67tbq5UY88Qqqgj9nb59WW108v286XUetKpY22hF0HgQPFg>
    <xmx:z3MMZeB00GomG-gE_p5LdVxNEmlqHjNZE1yjS1k16I7Yo17B2M-l3A>
    <xmx:z3MMZZC7Gk15C0pjF3ePj9n8-KaVmP7S01FPmjszPeuSg5226Bw2_g>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Sep 2023 12:48:14 -0400 (EDT)
Date: Thu, 21 Sep 2023 11:48:13 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: dhruvaraj S <dhruvaraj@gmail.com>
Subject: Re: Proposal: Removing redundant EpochTime interface from dump entry
Message-ID: <ZQxzzXuy4UXbN2VG@heinlein.vulture-banana.ts.net>
References: <CAK7WosgDEJN8gaLu+mC3W1xKAysdZY_pHTz46vqTpun69G0hfA@mail.gmail.com>
 <ZQxjlifIOo96FJj9@heinlein.vulture-banana.ts.net>
 <CAK7Wosg0ffdvnEfok0EaRQym+EGbi8R+MXf_nVC9yXiEfozjNg@mail.gmail.com>
 <ZQxwMalc2s8yJywp@heinlein.vulture-banana.ts.net>
 <CAK7Wosh6OkftjtQHFe5OwcwOkpzjcdT7reXnED9zw=uc1VXshA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DXfpUtC1MbbXSohh"
Content-Disposition: inline
In-Reply-To: <CAK7Wosh6OkftjtQHFe5OwcwOkpzjcdT7reXnED9zw=uc1VXshA@mail.gmail.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--DXfpUtC1MbbXSohh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2023 at 10:09:57PM +0530, dhruvaraj S wrote:
> On Thu, 21 Sept 2023 at 22:02, Patrick Williams <patrick@stwcx.xyz> wrote:
> >
> > On Thu, Sep 21, 2023 at 09:13:44PM +0530, dhruvaraj S wrote:
> > > On Thu, 21 Sept 2023 at 21:09, Patrick Williams <patrick@stwcx.xyz> w=
rote:
> > > >
> > > > On Thu, Sep 21, 2023 at 08:52:15AM +0530, dhruvaraj S wrote:
> > > >
> > > > It looks like the potential concern would be with bmcweb.  There ap=
pears
> > > > to maybe be some common code related to LogServices that expects all
> > > > logs to have the Time.EpochTime interface.  Are you going to add
> > > > alternative code there to look at the Common.Progress interface ins=
tead?
> > > > Is this acceptable to the bmcweb side?
> > >
> > > Common.Progress interface is already implemented in dump entry and
> > > bmcweb reads that
> > > for the status of the dump, now that needs to be extended to read the
> > > CompletedTime also.
> >
> > Are you planning to do that work or is this a call for assistance?
> I can make that change, but sent this note to understand if any more conc=
erns

As far as I can tell from this query, all other users of Time.EpochTime
are related to Host interfaces for time-base.

https://github.com/search?q=3Dorg%3Aopenbmc%20Time.EpochTime&type=3Dcode

--=20
Patrick Williams

--DXfpUtC1MbbXSohh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmUMc8sACgkQqwNHzC0A
wRl2MA//e8mwd8fN86Kz9R7pGN8fMxGMW+1X5+tvOOmFeZ54xC4/vCv452UmduSB
XfSWl7TXZacm4ck/8D87Vlery3DHZRYkvZeTXxfh+XkLio97GrIK8Ve54sY4Lk6E
iTackWbDh4lg/lXcxpDSUTsA3ce/Sjch42crNfUvFP3ZbBILMc2TJUPxSJgDIlW3
Z5hc6FJwoJ+GxTU2FsrcowBp2vPAZb9iZgQR1I0AJFG+R9kfKut9PGPtcrY8q5zq
aeA710QDaNhj43cuGIbqjk0n5KYnh144L9oiBxkE3MTqUoOOZUHkTBvylN2HzesZ
wc/tHTz8vDYsZDLhFMYINcNVeqxGffLS++B0giJfkCCoI1W9M2KVR1dr4xMP2vxm
SC9S7eleWaz7Df+EFf30BmKWVIzGXD+ZKMYIQQtuQPA+bIvpgik/o7PMqSdOl+9E
AIH3PA2is2ZSvsV8wAWMzvTkvGG8gfIAzqt76CcjkunW9vWrXprchnZS/t76wcS1
lTYKS0n6nQIHk1GAby2a/wcjuBtPSU26ku3kq790hKfpRqx8/eOlAJFNRgykCxHJ
3rKwNX/3YVpEnpnpVCavv6cU/+AlTbkgyT1+Ayv+4pdI4jScNZbJFkLfN7LmdlTy
izjW4f9HXa3mnbgLSH8wyZVe7Zz3aVrCVvCENAhESq9de2TQ8tI=
=WGuM
-----END PGP SIGNATURE-----

--DXfpUtC1MbbXSohh--
