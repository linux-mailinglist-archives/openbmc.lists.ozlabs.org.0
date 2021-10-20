Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 806EA435114
	for <lists+openbmc@lfdr.de>; Wed, 20 Oct 2021 19:18:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZHPZ6BRfz2ynf
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 04:18:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=Qg1GM0J5;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=fB5quKBF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=Qg1GM0J5; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=fB5quKBF; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZHP46HWRz2y7K
 for <openbmc@lists.ozlabs.org>; Thu, 21 Oct 2021 04:17:43 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id CFF155C026A;
 Wed, 20 Oct 2021 13:17:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 20 Oct 2021 13:17:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=+6iX5UdKl+EHpWRKRsY1wJWcBRe
 BYt0WUJTYUGli4dE=; b=Qg1GM0J5e4lPmBwgLazWndnEujyM5XguS+QjeRJIsdi
 roo0GO19n503mwbbz1GTHFe1kck1OpRJI63oZ+PNI7nLhPBZOBR1GypANuQDIQVu
 3HrAnJWCexOmefzCNGPrb5HrcGPimZEMa1vOD1pQHmWezrJn2OsX84NLCywDAeKw
 m121qDNLHnxyzWGJ90X8EIPbhFei4jEpFGzF8rAJU9VOO8dkMKasjXM3mNiEndfy
 TXKkn03Xp6gyC+OMQNaM4HnzA8hiqZmB+eEJYcD4yVIzanVqCBmMWrUqw1LDqV9s
 WoLeT13RDxFqZUTt8U5wijb6guWwgg9QnM26byxWavg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+6iX5U
 dKl+EHpWRKRsY1wJWcBReBYt0WUJTYUGli4dE=; b=fB5quKBFsmxnFZbklkzubo
 wVYsSLg4C5sSSil26Ovdiw9hXrGL3hyixqwWLnQz4HWKmRVK4Ev4vb2jvITsypR4
 rMoeApkjPDgq+IdxahXJxW370CFz+5QYbVx1Cka4iJ1wfMpS/CVPI4AK4nR2xyL7
 DdN4nJDO1xNSv93z9Ujd3pgUm/DLQ+nl1bsrljfltoLkhujszTrntoVgs5Z5m372
 7zh/w4AiXdSSBwnnL38yb6lniTKlAVnDojmjjf1R64htv9STMMv04Lx0phMQMzsN
 vYPMGH3kvsqc7/htwE5MxtPAu+PjXkgmR3FJ9LF89f6UlKAO/3sKokXJXMj2lgPQ
 ==
X-ME-Sender: <xms:Mk9wYUjkijMIvb0ohGx3l9qTSSBgOb4Hdso-jgutIR9VUfBaJwnElQ>
 <xme:Mk9wYdD-keWp7KvYCVp3ZM4pnv5RXbKap55Z8K03p3Fg2Vtn0e5yIpl_smUM7SnHc
 p4ZS2tRsX53O58ZhJ8>
X-ME-Received: <xmr:Mk9wYcG2OCn37ml8ud5oHqiodz_-CYbB-G9zKdEohJOywQyvEuiSUPRm2yX7y9Yu84tv5mdegvxjg1G5LhPm2aWJfnKLnhS4rop9VZ12G9EoJw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvgedguddtiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddunecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeefffffvdfgtdeludefleefvdff
 kedvfeefueelveduiedtgeeuvefgtdeiueeuveenucffohhmrghinhepghhithhhuhgsrd
 gtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:Mk9wYVSiJp7iDBY4G9dpCYd1m6dj02WapEXJVInToVqCAER9BuabCw>
 <xmx:Mk9wYRxa_sVZqV7kABoHmLn7_-xFafzI-0EXAwMSIUkUod7juAKJ8A>
 <xmx:Mk9wYT4i-Ky0uy-MvWLulTAfqIn66W0X-5Jb4OOpI8aVdsuFqUUL2Q>
 <xmx:Mk9wYSokSB_MKxW1dEiRLMbTSRoUh2GxGjET5UbXfwMEGw_KzhSVew>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Oct 2021 13:17:38 -0400 (EDT)
Date: Wed, 20 Oct 2021 12:17:36 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Matt Spinler <mspinler@linux.ibm.com>
Subject: Re: [phosphor-logging] About the "Stop emitting Entry propChanged
 before ifacesAdded" change reason
Message-ID: <YXBPMNi5yzzEtE/R@heinlein>
References: <HK0PR03MB3089CFCA31102DE7BB551413F5BE9@HK0PR03MB3089.apcprd03.prod.outlook.com>
 <b71bb325-cf41-deab-5422-11520f85cc55@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="d5oEeF01dGEj/BmI"
Content-Disposition: inline
In-Reply-To: <b71bb325-cf41-deab-5422-11520f85cc55@linux.ibm.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 CS20 CHMa0 <CHMA0@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--d5oEeF01dGEj/BmI
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 20, 2021 at 10:13:06AM -0500, Matt Spinler wrote:
> values, and then explicitly emits the IA signal.=A0=A0 Others can chime i=
n,=20
> but I didn't see it as proper D-Bus behavior to emit propertiesChanged=20
> before InterfacesAdded, since in fact no property is changing after the=
=20
> interface was added.

Correct.  PropertiesChanged signals should not show up before InterfacesAdd=
ed.

> It seems like every application does their own thing here, so maybe we=20
> can come up with some official best practices for how to emit signals=20
> for new interfaces (unless it's there and I missed it).

I'll admit the sdbusplus API is not great for this and a lot of application=
s do
it wrong.  There was this issue on the backlog to come up with something
"better": https://github.com/openbmc/sdbusplus/issues/53

--=20
Patrick Williams

--d5oEeF01dGEj/BmI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmFwTy8ACgkQqwNHzC0A
wRlnfxAAhpnUpLReXj+q60nUkH+boUjAPCmUb0DlwJY7oI6TxdegBLFZrOeFBRfY
mr73wtgqKqVpxu5cSGQzsfHYFc+nYNoW4RL09loW6WP6ZhahOZ2QFPJMdOYTOyyX
dkfg2kgl/TInOhPWacAtAR4Rhi+0o2dLtt/ZiJTeB5GifsMq1k/tPyVVhLUWuC6Q
anBsWx4i+OuPkWygVN2TgV6Hax23IkBMBzcJCdKAEc4Bwp5aUyFc7I00Uy2/9u8s
Mj/yj4KlLGnC3GbV+32jLrex9gV58LI0Hj348LCDs1JOAQwV/ro2B2W/oLwNQ6V4
FHnPvBy1dF+XzbPZNQ8Ncb/D1ndHZyvkLAfX9q6pyYdwlgtvJ2C1m+3nDoiMwbry
/o0NH7a3kn0uNR6l2ilQc/RcksR1/qgyekuexPYUU9u9r5lTg2kfSq7LnbSdxzas
1Bc/K+0BGZ4IS/n6QoyOc5Ochv2mxvdahJXLRxjDJZ/VktzhGq73DFkPPZfjyJu8
CTQ7GUbigHxRtr4aXibPn72LiYlFnOLr1GuyPHHTu+SfsUOLBuYZjjYtmfx9joXY
TYdu6UlPPCU1JMvhXOVThfhs5gjqI70f54T2KquCKYsO2Af18MMGrfTk8m09Boc2
XX9BzJoVqL6c+wCFLVvXEVg1jumja8/Cpe7Z+jW+cYfUyO2nXu8=
=jgqn
-----END PGP SIGNATURE-----

--d5oEeF01dGEj/BmI--
