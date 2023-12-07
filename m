Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EFE807F7C
	for <lists+openbmc@lfdr.de>; Thu,  7 Dec 2023 05:17:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=bxJKMdnz;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=xcJDd9mY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sm1FL4VLMz3cVX
	for <lists+openbmc@lfdr.de>; Thu,  7 Dec 2023 15:17:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=bxJKMdnz;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=xcJDd9mY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sm1Df2w63z2yps
	for <openbmc@lists.ozlabs.org>; Thu,  7 Dec 2023 15:16:33 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 6D4C05C014E;
	Wed,  6 Dec 2023 23:16:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 06 Dec 2023 23:16:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1701922587; x=1702008987; bh=8Z
	KTl/atlH4EYLRz68pTwmSqQpN6m+pmJRTzXUR9ifY=; b=bxJKMdnz1NsymCOlFW
	+joV7oQ18kjQJTR/Ehc2w2Sa/obWKPh8BVupyREzwaHze8VgTB/AjK46sMEg80nv
	GplKalBKUgtZRObaeZ2apdkIgIGzhBo70/UuJkDHw8A5wydoWLebfX1s7yp5rBF/
	Nu5fuw/y42pV9C1LqsmCfp/D0T0vMzSAbIZBbcuO9zXMBAlaNg8YHyzDBi5gJgzK
	4Ku2gFiOrWqrazZv9MOpHkhSd5VwVU2Yzs6+CD2gumsQkxBSjOHLvGLR9gumK7w6
	ujUhuRM3lvjIcq/oW3SSEBgKctC6AxDWRUCNiUr6lPmnrmUIuZmkZzEHCvp5WdK2
	3HDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1701922587; x=1702008987; bh=8ZKTl/atlH4EY
	LRz68pTwmSqQpN6m+pmJRTzXUR9ifY=; b=xcJDd9mYWWWFrOR6EHv1DDkCff4fO
	VISXKYgpdL5Hs/9ZZal8t5FikPqpipLQ9Qh1O7SWIrk+FE5HV7hLKbJa3qKFgWyf
	4FdvZOXsgvLKNw5I3dPle2taLxn5o+p0v7XpExbwIbaaKHnHqmnAeEBRMG4yrriD
	4bGdQ73cN7lltAluwGLNfN/TGsw3ErWawqJ4Jf/r7yE4SjO7SUdc7+fiY2/QLkuE
	WV358gSNl/D+sq36UBVjw92J4rdxS1S9RLjylgZsWI6UT395y1ycRRfixRPYKqY7
	TTXt4evAG9fgPJjJ693M65eLrkqtdzp+2Jhn87bdNk3pR7mYevKf3brSw==
X-ME-Sender: <xms:G0dxZWTOp6NCtW6_CTg9-DoHOo4LMekF9Mad2NiYXG_zhgegjjTciA>
    <xme:G0dxZbzUBraNrJTU_p2ANZ7_SqgT4Nsv_Tx66OfPaf4QBiuRoiFbKW-bCIUZ9Z61H
    emE7xrcWo0oWfnmB6A>
X-ME-Received: <xmr:G0dxZT3UucAGb8Dzb4wYmSF3Q6pH4f6kU-EZLMDCHkXDiumK875dScnTzynR66m8lIuzW_lFyhnndZKd1U8jmhleQdgt3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudekuddgieejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegieevuedufedvgeetleekkefh
    jefgieeilefhtdegvdehkeffkeduvdfhfffhheenucffohhmrghinhepohhpvghnsghmtg
    drohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:G0dxZSCY7dYBAH8Xdcuj9hmnOW2_MkmcqdvSS-W8zZv1A_wuas7kzg>
    <xmx:G0dxZfhJmjMl2q-nyO8whjuYdLszf3TqutBQ3cGKmlMc6cAvn7yKbg>
    <xmx:G0dxZerqrFg2ymLMM3-QkR27KQkq8BgwIv3GhUsXemo4puRl4g7_EQ>
    <xmx:G0dxZXaHEz7x73YXGVosCAY5shJFJUMu8B6JPAyHbDQ-6PHEPGExtA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Dec 2023 23:16:26 -0500 (EST)
Date: Wed, 6 Dec 2023 22:16:25 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: OpenBMC Linux 6.6
Message-ID: <ZXFHGagfYsg3eQm2@heinlein.vulture-banana.ts.net>
References: <CACPK8Xfgwf58Usn0FSWYigD2HbwNKh4DTLX+HLE36HbMC7D1JQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9ZbROcgfmdwBPfos"
Content-Disposition: inline
In-Reply-To: <CACPK8Xfgwf58Usn0FSWYigD2HbwNKh4DTLX+HLE36HbMC7D1JQ@mail.gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--9ZbROcgfmdwBPfos
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 06, 2023 at 05:29:59PM +1030, Joel Stanley wrote:
> Hot on the heels of the last bump, here is the latest kernel base for
> the aspeed machines.
>=20
>   https://gerrit.openbmc.org/c/openbmc/openbmc/+/67772
>=20
> If you're able to test, please comment on gerrit and give the change a +1.

What is the tentative timeline for merging this?  I'd like to try it out
on a few of our platforms but it'll probably be Friday before I get
around to that.

--=20
Patrick Williams

--9ZbROcgfmdwBPfos
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmVxRxcACgkQqwNHzC0A
wRlibBAAhq5kXU4kph3sjuPjodHYLIpUXnHWswltzqqIEDGpPsFF/aN9Cmz7uY0O
JrBqwUAkP0Tg6jxJpMwoTQ/FdljEaVE7FSfB4FclfmCEfSKKJ4Xnp4QJ9RVMvngI
elhSTwc6w8LFK+LsOFIW1fzIoVRawuL1UPByoJGZQ/mkylcNe7nBrtTEjcrh+m/e
F0fascKLBgKCBTn4lWW9wFgPXxDAG+MtFSQrwfWkvKax+fDgnFvdnc0tfTtrLiem
t7GcbsIMIfqo0Tm5lPCx9qBv01B0en1Yb55cdCeXbYatc5KDkYEQus18Whg0FaBb
nKST803px/HNDSH30YVbpRrJ8oIT9puN19d9cM2NiPy7JIxDKmx+EkbgW4Z5HZGk
O8ptazVe315RB5oNDRd2Mvf5hw/WWKlKSsCFA2M4/jhzriULXWOWbOgmZ4d8L+o2
zTJi5Jd8lZo8ED1+rDMBwVj7vmxK+PeQNofkVrRNcYvQLBDkGlmX2qamZKtS7l3B
kW90I+CPF/9AB63YIncz2XQ41Z5EOkhJ61uo6FvUVi5lh2++RbKnITrEGUGsjSdJ
HG196CDWQ9hZXM4vs3BDgcSoNfV7EWfvoq0iUDdf77BjFGXye3GVbsZNPUTnZa/4
T/12816H4Q297wSS2OIpa/hYAzr3ALJenuUDZBFlW/Ufs8Capc4=
=Hj1h
-----END PGP SIGNATURE-----

--9ZbROcgfmdwBPfos--
