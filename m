Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C4C1D00E9
	for <lists+openbmc@lfdr.de>; Tue, 12 May 2020 23:32:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49M9xZ2Y5SzDqpB
	for <lists+openbmc@lfdr.de>; Wed, 13 May 2020 07:32:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=XFdn0Lw3; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=2M238+f2; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49M9ws0sX4zDqdX
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 07:31:40 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 0831147B;
 Tue, 12 May 2020 17:31:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 12 May 2020 17:31:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=cO0CFQnGD+DLBmF/Nya9H3Aqvv4
 +T4oGmQO0a6yaD8k=; b=XFdn0Lw3+40Uj+0qUKedWDHCWIn1jnvt3RC7AQiBYpr
 vwjstBQjlxNJqQFAIY8qxSJ7S1wark6FAbmdHiuvMY7WNJFChBPMNH0Qbg5pdemu
 HgaaMR+naTvF3zO6pBox0MO2V4apjPJbFL0BsARkEJ7pXUyrucSazwQ1uTYlXUjg
 cSTjKSDRs3vutbdU83ZPPYNM55EchLlkFokLB4+SFkI4JU5nQAWF8AXtsUVcnS8m
 l+P7T4lvhu/q04DNmaKpC72xlDBP6CaYQ5jLDH47Uzp8WslDc46rA+u9IhQNt+3k
 yAy3WU0a8gr8QaZYd3rW/GoHU4mCUN80gd3xj6OsSZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=cO0CFQ
 nGD+DLBmF/Nya9H3Aqvv4+T4oGmQO0a6yaD8k=; b=2M238+f2ROr+53gzlNNF8r
 3kLz/cjE+j2NwlxmScMlnBBt/XyuTvh6zwQKUcUfphBc8JEWVbqmilOM1vA7p5ct
 5jPAIDuB0ywVuMYyBR54gNq0hK6sEjrtNxh5SBgWoFJkRVFSdICaToCADhVcu9Ry
 8BLeyOX9/MkERlEqfRiUKMRKozZjPo86qvEBt3dYBKscU38nRAZ41vTl2a5S695O
 4Nir0WEV56OKLVKEs1470N4yFKENrZBMIr4iQZBee0Az+T2VZBo1oWVAHNzFFVNO
 DbAiOd8DlXwTp9Jot3FxwxnS+380Evhh62bFb0gCLh0uG1NnNQJyVYBfHcTOEDxQ
 ==
X-ME-Sender: <xms:uRW7Xrwn009vVm6EjPvOCi1CqKcjqN4TlBpmfARw3-5fJ2yj2uegdQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrledvgdduheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepuddufeelueehhfelheejjefgueej
 hefhtdeludefheekudduveekieduudfggeeknecuffhomhgrihhnpehophgvnhgsmhgtqd
 hprhhojhgvtghtrdighiiinecukfhppeduieeirddujeeirdduvddtrddutdeinecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkh
 esshhtfigtgidrgiihii
X-ME-Proxy: <xmx:uRW7XjTv4KOo5Qly23IxWtpMCrlVp85a9OE2Atq5eKi_v2i8rkBvEw>
 <xmx:uRW7XlXp_nBDogfZAaEaSyzPNJAYwFjzMxoLjNFG4W0PZl9vz49hGg>
 <xmx:uRW7XlgjazfafQ0G3UA-Wg7ikD_pDOXoUAkHMg_umIA0QCquoFpN-Q>
 <xmx:uRW7Xgr8XZC-IAfYGlU83AWp_oLKo_fR7akr41fUPo5CzCYVJR8Gpw>
Received: from localhost (mobile-166-176-120-106.mycingular.net
 [166.176.120.106])
 by mail.messagingengine.com (Postfix) with ESMTPA id 355093280059;
 Tue, 12 May 2020 17:31:37 -0400 (EDT)
Date: Tue, 12 May 2020 16:31:35 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: Re: [PATCH u-boot-v2016.07] libfdt: Make it compatible with newer dtc
Message-ID: <20200512213135.GI10214@heinlein>
References: <20200512212755.621891-1-patrick@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4BlIp4fARb6QCoOq"
Content-Disposition: inline
In-Reply-To: <20200512212755.621891-1-patrick@stwcx.xyz>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--4BlIp4fARb6QCoOq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2020 at 04:27:55PM -0500, Patrick Williams wrote:
> From: Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>
>=20
> DTC does not use an underscore for the LIBFDT_H and
> LIBFDT_ENV_H variables, this causes an error since
> u-boot does.
>=20
> Remove the underscore from these variables to allow u-boot
> to compile along with dtc.
>=20
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> ---

Hi Joel,

This patch is a port from facebook/openbmc to fix some failures we're
seeing building u-boot in some cases.  I originally tried to submit it
as a Yocto patch [1] and Andrew Jeffery suggested I send it to your
branch instead.

1. https://gerrit.openbmc-project.xyz/c/openbmc/meta-aspeed/+/31833

--=20
Patrick Williams

--4BlIp4fARb6QCoOq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl67FbUACgkQqwNHzC0A
wRnJqhAAqIYyK/pvmWdffJhBd2luC2wIq2VfMyT+PQDm1ZJ/Zsa/kPG6antjf3nM
SwNCdNHD6sWkNQ2kADtwaS65G0cyB22guoJck+54I9fugs4N6ISlXPYIYmqaIR+A
c5PRPmEyFnPspB6wrnhh20zvbPu88I4nc2BVHP+QTyBlqBrQif/y9KegcqlJGI/6
UlJKXvUXGxMpJHV6bu6Gwwz1a7q6qWI5ay86ieHfCY/INvkno9aXNNljv2pwddt0
XDRm1FAqZbojvlNjITgghr2BTCzeYndLbw3iviP34sE+q6Qv5+fTx0EQz1eZXEyy
858ILnNTfCNFLZOIV3/hIwRBR+K5BAqwuRdui1bWvRaqqZetnMjb1BUPLGWCftRv
Nia33H7f2AnFAolJqxODZZWgR76K2bhrP4bcth3ObOV2PyF8kjRcDGomIVzejc/X
g0xpUldcRoqrYhoUCMswOk7GnvYBJZZE6oS4HZhOLH/Rbbvu0ivjutyIBlx3VzHn
Vj6mfohE6G1ea7fnJ0dky4B5bBbSDsHDhoskw7yHrf84f01DPKfR0yAz1UeDUWyy
dhMtHTGqSrwdL3EApWE2jxviXdGwhQXoL67Ydk7DGAdA4nCYpNjj7qd5rOtA3rmn
i4hbWSeEQ/om5AL6pFWWW95d4W6X0r0dm2rOtj+9PElNkxkTHjw=
=Wk20
-----END PGP SIGNATURE-----

--4BlIp4fARb6QCoOq--
