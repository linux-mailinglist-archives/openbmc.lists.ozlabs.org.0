Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D1B24C35D
	for <lists+openbmc@lfdr.de>; Thu, 20 Aug 2020 18:31:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXVX26TRTzDqbf
	for <lists+openbmc@lfdr.de>; Fri, 21 Aug 2020 02:31:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=gNGD/P1s; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=DRSwOk+l; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXVVb3LzCzDqbf
 for <openbmc@lists.ozlabs.org>; Fri, 21 Aug 2020 02:29:59 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id F04A65C005F;
 Thu, 20 Aug 2020 12:29:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Thu, 20 Aug 2020 12:29:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=FvvFM8OcuDbA/eqDqCk9QHM78Jj
 VIIHms/UEQ5MUt0w=; b=gNGD/P1s1vmOdX8F0GZrMM+PXOaXhpB8KlL+1o648av
 H9YhgY1y+/tn9LJwE/YzIXo5VfQU06po/xNKpKsELPr5yBsjksR24Pngos47EYc8
 FCkrP354LOmd1KvilsBBHjvCn0USGe3vRfqob/HhhKTz9tS34Ikg/WQPrVO5ryUy
 iWhZjmPP8E9fX3YkRhmHmgr7mvMiPC0kKdMnunKFDm0L81hFij2LtwBV2n/5UUlD
 cPqHMOK6PIlGHt3YMjeSbR7yWRu0P+gdrxCzczn1xkuiDBaVmKTaE6ulHkOtUA1P
 EibChgYAzLD0SEgEssHtTdT7Kr19pVe3KtMGt2tO4dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=FvvFM8
 OcuDbA/eqDqCk9QHM78JjVIIHms/UEQ5MUt0w=; b=DRSwOk+lFpzZ6NPSDgMK8W
 OUjrb4r5BL9OPLq8Yge+zB1ipAhc9tkY3vcybkPS39qiwADI5UiASEAFPdOr1euY
 0gHAOfxISUnQfdLcVDZ4zxrmqSbNr4UP7fC6pNUui4auXaaJrJS6+XCOfH9CZaOk
 X4xe6xlVVRgR4xtgJNox1YZRSeLCTt0bA5cusaIhPRS3d+nKXjLHruknaPaQqOPw
 EvB//hFf+noH99RpDsUVDKzgFovtbZevTAKklMB/rC4oAs9+YngPP7IJ49FFYfwG
 EJREA7z14rxqW96FGGYiDzaq6IXqfnzLR5HPktdKJYESDxjWm0QMkWZjnfYSoqrQ
 ==
X-ME-Sender: <xms:BKU-X2MAHJ_vsciu3PSCRX2b21Utxg7bOFAzdFzit-N2xJBJ7UKMig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddutddgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 epgeehheefffegkeevhedthffgudfhgeefgfdthefhkedtleffveekgfeuffehtdeinecu
 kfhppeduieeirddujedvrdduvdefrddvvdenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:BKU-X084f2RUF36itUcCW1awwskWj3JGh6tdXsQxmpw_3azJBnmYXA>
 <xmx:BKU-X9RL9ni79fkgIL101-dKxziRk5HQN8gZaF_6IMxmiR5N2YApTw>
 <xmx:BKU-X2stUs2qVu1WgK9ArqjLERk7ZmsWrMh6VzU4BnmhSvptnk-m3g>
 <xmx:BKU-X4r0eP6lutjpZZqswDqfbDmJrwSfPW1bEb4M7Mps-5wNq2rNaA>
Received: from localhost (mobile-166-172-123-22.mycingular.net
 [166.172.123.22])
 by mail.messagingengine.com (Postfix) with ESMTPA id 60199328005A;
 Thu, 20 Aug 2020 12:29:56 -0400 (EDT)
Date: Thu, 20 Aug 2020 11:29:55 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: moving meta-{openpower, x86, arm} content to meta-phosphor
Message-ID: <20200820162955.GC3532@heinlein>
References: <d6d450e638d016d29496ef1713083e80551a84bd.camel@fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Y5rl02BVI9TCfPar"
Content-Disposition: inline
In-Reply-To: <d6d450e638d016d29496ef1713083e80551a84bd.camel@fuzziesquirrel.com>
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


--Y5rl02BVI9TCfPar
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2020 at 09:15:52AM -0400, Brad Bishop wrote:
> I propose we allow the creation of additional folders using this
> convention e.g.
>=20
> - recipes-power

I'd like to propose a change to the name of your processor
architecture to avoid confusion between recipes involving the power
subsystem, but I'm sure your marketing organization would have a thing
or two to say about it.  In seriousness, it might be good to continue to
use openpower in this project considering that the OpenPower Foundation
holds the ISA specs and it avoids confusion with the power subsystem.

> - recipes-x86-amd (we might want to look at renaming recipes-x86 to
> recipes-x86-intel)

I think it would be good to come up with a schema on how we represent
the machine overrides and recipe subdirectories so there isn't
inconsistency there.   Something like <arch>-<company>-<model>[1]?

I do have slight concern about there becoming an enormous number of
variable overrides, patch files, etc. as we support an increasing number
of processors, but I suppose that points to an underlying problem in our
implementation which needs refactoring.


1. What do we do about risc-v which has a dash in the architecture name?

--=20
Patrick Williams

--Y5rl02BVI9TCfPar
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl8+pQEACgkQqwNHzC0A
wRnfgg/8Cy5R2Lx/Ah2SAk1WXmO7yNCM/+qNFtyQq6WGkupCaUpaypnGg+76VtOz
6x0k8rlJjmeUrWsIMvx9lneu+tHEASDRwUL5BxLrierkxlXyUh4tkRmr9fUPFPen
4NTsTKFkymVCKrW9m2bi8HSlmZIdeuyHJJW7V3mehzyP6q2dWvz1lznJ2X5Zk+JP
wtikE5SigqUo7Jgp6S1gKUpiZe4IGq83Orr/y2QpBMTi/gvSmaix7geh96cvtDdF
2CIA4GoD1uV7GOEZQ+BluQ+z0MYG7Xm6puIAtp7Wj8Zfsa4JkpgtC1F+F3IoJIJG
nAgqAy2thUkVMRAUBHxn7DRiudHYD+p6BSoFP931Zs3yURmCNWgnxGE7lKI+pBy4
tNAMJS1NEzWGcwJ76I+UM8tQEDWFMaYvWAzVa6qo1yRPuUtzkDI0r59CXxCHz4wW
BYRJiAd4zCo1a74s9/br88wX8XDYpqvX8lpeVwYlZu5KiZ76XFMnkwXsaGEFLjBm
2Hd9SDV3qw/OTj3B6+82DJUPb+W4GJ8FtELzrSoC3c+GY0Oll24JyBnVXiquz1cM
J1NI6cM6FdjZm8mSo3nCXTrFoQQ6+BJQoDQnySYHQeMrk+36wQnxOsGVltscW8kt
agbMpdf7uOaWoz/1d/JYOrV1Cg3EGyr76NWRLg3w54tSTGr7ySg=
=WMsM
-----END PGP SIGNATURE-----

--Y5rl02BVI9TCfPar--
