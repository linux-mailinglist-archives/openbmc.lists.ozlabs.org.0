Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AF03D18A4
	for <lists+openbmc@lfdr.de>; Wed, 21 Jul 2021 23:06:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GVSn20K1Dz304h
	for <lists+openbmc@lfdr.de>; Thu, 22 Jul 2021 07:06:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=oBQeKZhp;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=N14/69PO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=oBQeKZhp; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=N14/69PO; 
 dkim-atps=neutral
X-Greylist: delayed 326 seconds by postgrey-1.36 at boromir;
 Thu, 22 Jul 2021 07:06:11 AEST
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GVSmg0xcHz2yWN
 for <openbmc@lists.ozlabs.org>; Thu, 22 Jul 2021 07:06:10 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 0DBA7320096B;
 Wed, 21 Jul 2021 17:00:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 21 Jul 2021 17:00:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=18dREPc8xZObpHg/OR2u77adAfY
 +KcMZlkllpOXne2Q=; b=oBQeKZhpdOTffsJb8+R0HN+MWu4PWx3RIs/QAvplN2N
 rQjfePDb8XHamdyMWsThK8UGFTXzNliOJgCZ0OzO0p3r013gPzASaAtXPK+1hKFu
 i57VeJNJThgpXyvZhpa7VrelT86425on7Ns/nwOZcxP2/rBwyRsPgDf6eVhxKYEP
 pIFT0BXv6BkQvaBDoxGUHd8mU6bfndD3Xuo9YjZ2lFGXG75PEWQesJ5WCAui38lf
 LV77+JXaAfp1v6SmFJqPl5jZWsUvGTBZIwwEfSrxgqLkemOMEQeAe2/a8JwfUvM3
 nl/HBvg8rQPoCafT7u9DXiOfn/CSl/esntbt6mfTblQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=18dREP
 c8xZObpHg/OR2u77adAfY+KcMZlkllpOXne2Q=; b=N14/69POum4ZsH6j9/8C2J
 mzP79YxPbRk+5EIWpkSPTu43pEta4RjzkYAfIg6n+IdQ2juGw/jyGDZB0b0ABQ9Q
 MMMXj9FsvjjyW1JeLWwfIRqpH93A6hkBZfxN65p3nmiieoPln1Z5fJoIo0bsE4VR
 JuxlaKesqWAlXEPEA5C18KdhXgkCttpjKvGIcyKZk2WbmapkaXaKAF5WNeixlJUs
 JEdFQCuKMVEs1ONiKH9STNKvKe827fm+p2kMSq2gtgxhbmOaNzJtvYD++46YVFHB
 BhFqzou3OYX+kMJc18zVNpbWSAz7pxp6EhzpNNMJbEI9X/wNObuoqe8nkByva+5g
 ==
X-ME-Sender: <xms:9Yr4YKuJB0wmjG8PmhzbSCGtCxIoYEvFIsv7188as7M3xG-oCChEZQ>
 <xme:9Yr4YPdbf6A5ud6CLNxEce5bgwDbNCJLW8Rcs09cXK55niT33vA-7Q7UyT5E1Xoam
 Z0rOHty69ZD_hfQ-Jg>
X-ME-Received: <xmr:9Yr4YFxq7rMdL8wgcj5Wrrc71S5Rq2oKMszvcXoVe5BB5nQgwFJeqNxpKpL6AuhZ24nmSZ6Vf48PPiF1g7iKNKa-OT4tbPBUhhBwA2vbexZ9Gw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeeggddufeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 udenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnheptdejueegudetffeljeeuiedvjefh
 uefggeettddvhfevveeuveffteevleejvdegnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhdpohgsmhgtqdhsvggtuhhrihhthidqrhgvshhpohhnshgvqdhtvggrmhdrmhgunecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrih
 gtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:9Yr4YFNdxen2XEQsRW5BZq71Ow5NB_OzvzPQ8zNzLLcU8ogZsSf8lg>
 <xmx:9Yr4YK8SqRmlLqcvF_cR5DTxkzPv37IycWIRM8GjWfSr_VJN0owQ_Q>
 <xmx:9Yr4YNXKAFCpfXYQ8iSrJ5717LpOwgRvRUESrUo6UVuI1ESJGM14cQ>
 <xmx:9Yr4YPH2Y_HVjyiFgfhBFj57x8f9fLDeCozcnCkhdn3riSZCWRF_4Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jul 2021 17:00:36 -0400 (EDT)
Date: Wed, 21 Jul 2021 16:00:35 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Security Working Group meeting - Wednesday July 21 - results
Message-ID: <YPiK8xqFPJFZDa1+@heinlein>
References: <cd15ec44-5c29-096b-187d-f3c05680f8a2@linux.ibm.com>
 <b4456eee-79c2-6704-ae6f-63cd7485ae9d@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BBw18UxwDJaDb010"
Content-Disposition: inline
In-Reply-To: <b4456eee-79c2-6704-ae6f-63cd7485ae9d@linux.ibm.com>
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


--BBw18UxwDJaDb010
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 21, 2021 at 02:49:11PM -0500, Joseph Reynolds wrote:
> On 7/20/21 5:45 PM, Joseph Reynolds wrote:

> 5 What is happening with getting a private database to track=20
> vulnerability submissions?=A0 This would be used by the OpenBMC security=
=20
> response team=20
> https://github.com/openbmc/docs/blob/master/security/obmc-security-respon=
se-team.md=20
> <https://github.com/openbmc/docs/blob/master/security/obmc-security-respo=
nse-team.md>to=20
> record security vulnerabilities which were reported to OpenBMC and not=20
> yet fixed or publicly disclosed.=A0 Only members of the OpenBMC security=
=20
> response team would have access (read/write access).
>=20
> DISCUSSION:
>=20
> Surya plans to set up bugzilla.
>=20
> Contact Andrew Geissler in his role as OpenBMC community infrastructure=
=20
> if you need a server.

I've mentioned this before that we do not need to set up a bugzilla and tha=
t it
is a waste of time to manage a bugzilla instance.  We can create unlimited
private repositories in our github org.  We just need Brad to create one for
security discussions and add the people that are currently part of the secu=
rity
ML to an ACL for access.

--=20
Patrick Williams

--BBw18UxwDJaDb010
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmD4ivEACgkQqwNHzC0A
wRn9tA//ZxHR8Jv6trnHa/lXz4qolc5wNHDwjK7gNXRXTNs4SW9u2xOGEtFD1fNn
ZXYkOwBncftlJF1r/ahCh7Q8DqypF8iSlGn6JOUnrM4oFfTrEZa3xVYfozczP84o
0ErzXxguTK3cLxLf8VByGO8reFon2jXtQcxMfFGJhtisS1xUQxSx1igEOSmyy96X
RcsnxhvxeB8p4mqwVJJL9laXODKVBH87P6xuuhi5SQplsjBUXC9Uo8M/YeBpwB1w
ifBSz2rD74xs6++6kHdWlm7XxcP9ZGm+1+MqhFrbyS3aFkYBFOaAWfuSyOsTY60L
1lDnmTSYr31Z1w1uhcZHLVELPNg+XH5UI5Qln5ibbo3whLpkPSKjgR5Fj7+FBsJG
dG/kHuT64FVpQSLLVCFcf/hFRhFGlOYYMKrx/aFs0MnXTBPGwfId6Sv3mR2BIEeG
JyEoSKt+SiX2/VoKZMsRdJQcsbLx9eNDA5NpKIm03/5hxwEJNmEPxJ0CLh28qPtU
09u8dZTmjkUrtbiVwOCtGuVc8SKEzaKi2pi5FELvN09WADH6VIY178szyqbQDZKG
4PPjEvmqShcJLqMxsB2gJo8KbGIpk15wyaaCaWlwLgjLrQ5A6fh6zVqgMynuFASU
Cn3LBd/yyq4uqXMtngbZHZQJcg4MpEeRGKJ2+GxYfJ+Zi1Ow4jg=
=Lapd
-----END PGP SIGNATURE-----

--BBw18UxwDJaDb010--
