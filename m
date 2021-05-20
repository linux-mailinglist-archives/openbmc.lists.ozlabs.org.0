Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE3E38B85F
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 22:27:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmLrZ3DjYz309g
	for <lists+openbmc@lfdr.de>; Fri, 21 May 2021 06:27:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=i/WtZxfl;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=RXJd+9dt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=i/WtZxfl; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=RXJd+9dt; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmLrD4LLwz2yWN
 for <openbmc@lists.ozlabs.org>; Fri, 21 May 2021 06:27:07 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id F1E9412AE;
 Thu, 20 May 2021 16:27:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 20 May 2021 16:27:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=uIKz/mh3JqdbSpBji9+nUWegKYO
 jF/Pqsid3+JRNM68=; b=i/WtZxflRGTVhmDiVv+32/FQkGUKRWR4uTC8hG251ej
 pakTS7JSoc0ImQDiP8XwCs6SI8XZEPliAXvvMBrAzIovtaosvtSG1Gh35mCk3DH4
 E67uCTXdtMfFP2E9dWaayTKMlFmFqm2CoexSeBouysw7Njg9KgjJ7rjshxhntXTF
 4FzZnciVqSPEzP08w9kdbqs9wPwVZlTCNxQwfb/cld9zmRD5nTArNqqyWeNFnvPg
 L+3kypwGk2cLZM96MXAPhDVy3byv2g5sjS//+dDbbHq+B1WKzud+8uH5uJZwaYTO
 EehYXpo0YNqAGG77+neeQqoViZLMv3tQTFRDlOookmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=uIKz/m
 h3JqdbSpBji9+nUWegKYOjF/Pqsid3+JRNM68=; b=RXJd+9dtrpmK1tsR1GXD/H
 doAfVjFnQnbhMXnJT0BfP0zqaKSxstIdf79w1o+OCKW6rDVu+Uy0KEPccA4PdOUg
 eIMsS5LKr9MKoDIts2I/RPHw3MM6B/t2j9sh6Se6IMTTk4GuOKzy6804uNSwhnjB
 1wUKNAXlsuO7EN8mHJ0MtbKtQ/kBb5/jTOkFmKRvOfS6uoHM4w7vUAW0Yge8Lx1a
 izCY/we99LOLb3xZGLs30OP35rHMTHVqGEyTrYh73IW6Z3snoRIjmEG0D3xQ0Ws5
 rXXIM2PAvvkGd3sU8FFzIfDTk61L8KW5hZi2DuEYBVgkihWvN8z8u+h8KFt53+fQ
 ==
X-ME-Sender: <xms:FsamYCISsf1eQJ2YykVqQm0DitjwBDOGsAK3jgRlBHr5AvriemiYhw>
 <xme:FsamYKJg_ZWZv1Hc-FhKT-2-id1mtkCySYQwK_L_7dEvFcpsiGlIsg1FEwW1KA1fN
 sXXt3ue1bcRjhLZKPs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejuddgudehtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfdu
 hfegfefgtdehhfektdelffevkefgueffhedtieenucfkphepudeifedruddugedrudefvd
 drfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:FsamYCsJbApCkLsVAtt9O6S1zo9DIXAxY_FGnehiv7ITQfCRWqtXnA>
 <xmx:FsamYHb1w4JPBOYixzwJpY1UzU9k2VoYRKDINSNU7PYev36ou2laVA>
 <xmx:FsamYJZLA5UKob4I-4hQvqLsZQWpATQEviibTyTQ10f--IiXaBMMqA>
 <xmx:F8amYL1F3Llg9Kv4DL6Hi357U8d1YFYEq-H8a0M66j8gCOr21ucw1A>
Received: from localhost (unknown [163.114.132.3])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 20 May 2021 16:27:02 -0400 (EDT)
Date: Thu, 20 May 2021 15:26:59 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Mohammed.Habeeb ISV" <mohammed.habeeb@inventec.com>
Subject: Re: push code to gatesgarth branch
Message-ID: <YKbGE2s7ta47YuAH@patrickw3-mbp.dhcp.thefacebook.com>
References: <PS2PR02MB3541E7D11C2149187922E3F3902A9@PS2PR02MB3541.apcprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pm0n5HlYdhxy8ssa"
Content-Disposition: inline
In-Reply-To: <PS2PR02MB3541E7D11C2149187922E3F3902A9@PS2PR02MB3541.apcprd02.prod.outlook.com>
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


--pm0n5HlYdhxy8ssa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 20, 2021 at 07:46:22PM +0000, Mohammed.Habeeb ISV wrote:
> We have added a new platform in openbmc 2.9 version. I tried to push the =
code for review however below error
> Occur. Can we still push the code to non-master old branches?
> Please let me know.

Hello Mohammed.

Two comments:

1. You tried to push directly into the gatesgarth branch rather than
`refs/for/gatesgarth`.  We don't allow anyone to push directly into
branches without review.

2. We have not been allowing development on old branches.  Is there any
reason why this code cannot go into the master branch, even if you are
using an older branch internally?  (Most open source projects have a
similar policy; development should happen on master and bug fixes can be
backported).

--=20
Patrick Williams

--pm0n5HlYdhxy8ssa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmCmxhAACgkQqwNHzC0A
wRm+xBAAlfPAjUHbSx5C7pZtBQ5mk/AGnL2MhvfNLw5Xl1gYLPlBOaoAMCiI9vMH
VklB1sf+HED8c/AgqNP4E5snnepQJ0Cn1iuw7iLpv++nSpDywlLcPGfKTiYO7R7h
0H0tjrU3Oo6LLPRxCCp5qR0wNKFOrh00g5QNXd+em18MgN7zQkKywtxrrXLPBqjj
g1emBtpiFQE/7a8W/3ONDFAFLe9VmbeFftuQIeiyoc+0CUpoltvQXw4w9lATGvkp
8k2dbM5uscSaO2dN6scu6zPzat13dDTsMAvGCMczzjHceNunEKMtavtcYc5MJBnI
V9Adf4p1lmY9idkCxI/MgrCDDLGT4ZVnOFElAIFr/ogDHvm0hAf4FG/ffiYT82bi
PTjyoJENjdLuE3m2RbWwh/567ERM4L2chbdsfM3G6Gz0kW06KFFFQ1dCB0plm4F+
9cf39u1xejRm+h6hsmog6g9PWMUxYVFe/WaYDw0WzhwDUX1APSSql+frPSy+iBEU
6ljlT7k1Kv3mQS7A7K/ha79kXe18fYziRnPgdvMUQHMS+U4ktCqX25uFYFKAX50/
enhexViVJROuVF9MqQsqqP9vcG+lIIqmf9QuTCPhWJA39NBwQi7QPUFK94zq8jee
m9+Y1DIiAfLYo+uX11jMqAcPYEVmo2aezgNHiiLxcQsZC0k9Riw=
=Ue80
-----END PGP SIGNATURE-----

--pm0n5HlYdhxy8ssa--
