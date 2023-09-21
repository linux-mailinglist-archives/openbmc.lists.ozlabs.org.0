Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D9D7A95C2
	for <lists+openbmc@lfdr.de>; Thu, 21 Sep 2023 18:33:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=mfv+WoEQ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=JnsQSk3A;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rs1DQ1Mjtz3cWT
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 02:33:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=mfv+WoEQ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=JnsQSk3A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rs1Cn53SRz2xYk
	for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2023 02:32:53 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 8BD265C0212;
	Thu, 21 Sep 2023 12:32:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 21 Sep 2023 12:32:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1695313971; x=1695400371; bh=qt
	RVu7l8OdTwOkhgm4EutAkVrTUFEiOg+wivFyIOAnI=; b=mfv+WoEQYNTI2mk+bs
	sTTSm0OZsHguuIFdG0MFUtIQvH90aW3t5FPkakXAbBXMk4Yk3qunqLhLd+/VxzOP
	OnL/yMCUimOgR8fZqDdyhl54xTAwPaLxtkcr0Bf1MZoY4f9ah62q20tfyWyYbAsX
	e8qkYZ4tZVn7vw6uEMO1tfC922C1X1Bw0KM6d0JATiI8QnKupylKHLWN38jcmqJQ
	bqpdkivjWGVsP6B2zIhCC+i75YVKYXPIEjBMZaN5zhfPAQ5uWVPEV9+IbNNiJAiE
	qllMnuCP4Jpe53xXA32lBs+Rzph4l15GOD1/RyNJ/CgJA6k7aa866PIzeMZZhbhJ
	CgEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1695313971; x=1695400371; bh=qtRVu7l8OdTwO
	khgm4EutAkVrTUFEiOg+wivFyIOAnI=; b=JnsQSk3A5zsT8VhLUZ0+6NjJ8T1iS
	509oFOjiOdUDq+N6+fujoK4ZV2LnsvNDjo7ruoMSA2aV+c83jAHXjQPmXDZjF0eL
	N+sCYBzWTW9RbbekgYYRtoCBbVBWSDVAo2JxiZG7nPfPqPQL5kwioy8oP3r7NNLN
	44wQJuog7A00BlERSObIrTfUG+0CTOcwsqgB5NiIBYQxq3zCgrldhVCy/qGd9KHz
	umodE1iynvWvN478PV+88uRhFbStk+ueubagrP4AY/xiPiyj9wrX3zom7VhUsSDC
	SS5mLIYL4nk4CJFivfa0ppkp67B0WBOyQuUVPjJCceEK3Td7gJPoECF7w==
X-ME-Sender: <xms:M3AMZc9Hz5l0p4_Xcp-u40CNQVR1AkscqjqxAo8iRumamyZX7oeSVQ>
    <xme:M3AMZUupj7QdzhaaDb4O17pZ0a0SqJI4hvlzpiizixzxlrJnSMg5Ct2T6pJMPm4fa
    C9pgK6V20CD6BEc_tg>
X-ME-Received: <xmr:M3AMZSDPyAWE9tY7l74csxJ7cDvc6YKK7eERbUKdxokXaa4K7wOASC_mGQJ03YBU0ravCV4Tz1IOAILtSVzuh5kqBjEe_wA1Ks8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudekiedguddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreer
    tddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepheefjeehfedtjeeivdefkeff
    heeludekudelleffkefgtdeludelvddtgedtheeknecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:M3AMZcdc-tbh5Y2CYxpE9w2Zo1G995k3vA0PPz-KsK1li3cZyuBTQA>
    <xmx:M3AMZRMPrM0FYMndafsBfoZVrHkPh5373TIsvj_KxZt-a1-XMnEIvA>
    <xmx:M3AMZWkZOAiaZvomTX43o34apoct_40iR6eSwUMYrvo70N_pdvS74Q>
    <xmx:M3AMZTWwdG-gSsJK4-RmZPr1oA-bSoJr6ACsJfWOWoUs4unNGSUxnQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Sep 2023 12:32:50 -0400 (EDT)
Date: Thu, 21 Sep 2023 11:32:49 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: dhruvaraj S <dhruvaraj@gmail.com>
Subject: Re: Proposal: Removing redundant EpochTime interface from dump entry
Message-ID: <ZQxwMalc2s8yJywp@heinlein.vulture-banana.ts.net>
References: <CAK7WosgDEJN8gaLu+mC3W1xKAysdZY_pHTz46vqTpun69G0hfA@mail.gmail.com>
 <ZQxjlifIOo96FJj9@heinlein.vulture-banana.ts.net>
 <CAK7Wosg0ffdvnEfok0EaRQym+EGbi8R+MXf_nVC9yXiEfozjNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="11aIeOxk/qNkxVyI"
Content-Disposition: inline
In-Reply-To: <CAK7Wosg0ffdvnEfok0EaRQym+EGbi8R+MXf_nVC9yXiEfozjNg@mail.gmail.com>
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


--11aIeOxk/qNkxVyI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2023 at 09:13:44PM +0530, dhruvaraj S wrote:
> On Thu, 21 Sept 2023 at 21:09, Patrick Williams <patrick@stwcx.xyz> wrote:
> >
> > On Thu, Sep 21, 2023 at 08:52:15AM +0530, dhruvaraj S wrote:
> >
> > It looks like the potential concern would be with bmcweb.  There appears
> > to maybe be some common code related to LogServices that expects all
> > logs to have the Time.EpochTime interface.  Are you going to add
> > alternative code there to look at the Common.Progress interface instead?
> > Is this acceptable to the bmcweb side?
>=20
> Common.Progress interface is already implemented in dump entry and
> bmcweb reads that
> for the status of the dump, now that needs to be extended to read the
> CompletedTime also.

Are you planning to do that work or is this a call for assistance?

--=20
Patrick Williams

--11aIeOxk/qNkxVyI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmUMcC8ACgkQqwNHzC0A
wRm8cRAAmymMtYaHzrrEWL6ZQDUOhaUIWfw9GUE76D3UemTrhTIGjMHisR2HtTHU
yavWUeaiUxVWAuljt309qmdbUo3g4NQRpb5Zq2QXtWwIgsXxBMMxEvC7e6OLIyEy
E8bDVjiY4RocD/STUJhSb6JUsCDazSuq32gOudVlxmNy6lqq7Kqz5FfUEugrwVZo
xhQ/sqPjDcJm8tBFpBaOxonLW4Qmy3POcSZf4cw+rmAzRP68+SVxT9VEnDtQidZN
qGf9N9E6+tvD9vsF42NCt/TliSRbCI0aK04SU2jOzgns2mnYY8+k79Z/GZQ99bqX
G88Xo4udeTYUGSbenjMSKNO6dkBkij9nZNS9BOSOUrodnYTHEq67HX7gELQb2FxD
7FHebzxUhw9qX9scJuX0WkG8hENt+IH/La6Zj1q76+VQBgsghEQaI9AOALc5Kh4n
29M2vkGgtdoDUweLQM6NfvZ6kpuClNMI+Rm0TgYQxYFxSEORozBdEuhIQu0Eyv+b
1JJX6dA0nxhfNuZi1LGAZmV933+OGtoA6x+tcUdKa/dCED0CmKLQXUBGpGXSs9Au
FrWOWf8/wEGaf9Y5Wf71ngO9jJJW/SqnYx+/koiTw7sAU3BVfoXmnrlrbvkpYgrm
6hi3OVMg5zAXd3TWeDeL+gSyoVmGPbo+bvS6F8/M2ABRP0RLbwY=
=Y29F
-----END PGP SIGNATURE-----

--11aIeOxk/qNkxVyI--
