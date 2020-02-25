Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD1016B7B6
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2020 03:24:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RN710mJdzDqTJ
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2020 13:24:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=syOUWunU; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=DCcleQ7y; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RN6F3YsVzDqN3
 for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2020 13:24:04 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 206706DB3;
 Mon, 24 Feb 2020 21:24:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 24 Feb 2020 21:24:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=XxwBH6adTmou8YzH8IktMRMbGNb
 bYdv3YSiuuW1wRu0=; b=syOUWunU3eZ3cWC9ATMzlLR+fu0ad+4qEzDSBGdLBc6
 Sb8/MogzouxvHXhpbR+LHNNsH5eE9cxYMCzbOuJniog7FVZfmDHxI29xNBgccc0A
 YomClc1ORALzIvlP5dZmjQzMdyiIyM+tulkNfhdLEAGfrvfAAcFcAmINshSPeQG5
 9qn2UJzyhnZk+U7Bj0h9AbrpqrOvGCZYc/HJM/1nIv2llwzZ9RNSgyx2ro3qEBe4
 vv2L6lAv0ocxjKUR+WcsYFSEzXIkisbFilmE52thtur6/5jG5TrnnQzsz+/VgSS+
 ow5pjiV2RXng1P17p7oD5YfKhNblPU+zrk+NuhKeNVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=XxwBH6
 adTmou8YzH8IktMRMbGNbbYdv3YSiuuW1wRu0=; b=DCcleQ7y+2HzB270XxWRBH
 YnX3mlRwWZcXnhvNgnaDhaJs46Km3AXn7g6mgWxdLZHLQoFqGEXU/hMS8eJWEFKg
 8ym2OBR3YXzE+ato4yGNsdKQX07FIReSg9ToKnq0VezG8z8t9C6+rOCYZvstHqEz
 7guerHaL41kTjjOvr3JbD/OmrTfKW6I1g922UhL+t3m0bmTehU1cTYLmy87Xv+aU
 9nzmtAjwvha5I6noPMpTsKj0lkojXR4Kmhaf5vsCIxke0kl1VSZXxA0VP7jZ6DtH
 bGJGDUWL6ykOlPk85n0LlRN3v+NKxqXABgmPFD+qwrBK5+2OE6gVbVYwjvITzDSQ
 ==
X-ME-Sender: <xms:P4VUXvjGGgx3kzy6XFzAU363WhRcmqi85__eAGAc9v_zli-wAzKbDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledugdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftg
 igrdighiii
X-ME-Proxy: <xmx:P4VUXvEdczJf0jeOz5cUF0Ojtle2IfQ3NhmB6DD8fhi8BPRHBGDXKQ>
 <xmx:P4VUXuULs0N_0pGOLt9XlIgU-ToKu1eq48XMcDNH5TbrUwghauKanQ>
 <xmx:P4VUXp8lPP4izwqx-bRprJ8xPhYPjOSiD1oBE5orR5vo-w-Fazj9LA>
 <xmx:QIVUXsv4yj25VpQWUz9hvcatpbJAaHUPvQSgPVORdUoOFUWCSbqIMQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id A17A13060BD1;
 Mon, 24 Feb 2020 21:23:59 -0500 (EST)
Date: Mon, 24 Feb 2020 20:23:58 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Lei YU <mine260309@gmail.com>
Subject: Re: Request for Feedback :: Time Mode setting in timemanager
Message-ID: <20200225022358.GH67957@patrickw3-mbp.dhcp.thefacebook.com>
References: <68732B2D-EB7D-418A-86D9-3095223A31FB@linux.vnet.ibm.com>
 <5B7FD9A0-8A4A-4BCC-9BC5-77B5DEBCDD00@fuzziesquirrel.com>
 <20200218202507.GA2219@patrickw3-mbp.lan.stwcx.xyz>
 <329B2251-4BA2-425F-A8E1-886C4E2F686F@fuzziesquirrel.com>
 <20200218215128.GF2219@patrickw3-mbp.lan.stwcx.xyz>
 <B09077F7-2752-4C7C-B005-38B00C6DD428@linux.vnet.ibm.com>
 <20200220163326.GC41328@patrickw3-mbp.dhcp.thefacebook.com>
 <9B609C37-44FE-4636-BFFE-76BB48DAEB10@linux.vnet.ibm.com>
 <20200224203636.GF67957@patrickw3-mbp.dhcp.thefacebook.com>
 <CAARXrtnVf8cccGk29Xgk7V=LvX+ocnrn1jgQHwDT97xGkKO9vA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="h3LYUU6HlUDSAOzy"
Content-Disposition: inline
In-Reply-To: <CAARXrtnVf8cccGk29Xgk7V=LvX+ocnrn1jgQHwDT97xGkKO9vA@mail.gmail.com>
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--h3LYUU6HlUDSAOzy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2020 at 10:01:21AM +0800, Lei YU wrote:
> On Tue, Feb 25, 2020 at 4:37 AM Patrick Williams <patrick@stwcx.xyz> wrot=
e:
> >
> > On Mon, Feb 24, 2020 at 11:38:56AM +0530, Vishwanatha Subbanna wrote:
> > > Proposal for now is to:  *Remove the support for TimeOwner*. It will =
be as good as BOTH
> >
> > "TimeOwner =3D BOTH" today creates two virtual clocks from the physical
> > RTC by implementing the Host clock as an offset from the BMC clock,
> > doesn't it?  Is that going to continue to be the functionality with your
> > proposal or are you reverting back to a single physical clock where both
> > Host and BMC can update?
>=20
> "TimeOnwer =3D BOTH" does not creates two virtual clocks, "TimeOwner =3D
> Split" does.
> "BOTH" effectively enables both BMC and the Host to set the "single" cloc=
k.

Got it, my mistake.

--=20
Patrick Williams

--h3LYUU6HlUDSAOzy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl5UhTwACgkQqwNHzC0A
wRlRKg//ZHkHKhQtDCHsk1ZqO9hD2i8fijostB+bE9HI/P01ncyoTlfjDIu7kcGS
RRGOe31b+cs3c7tKBAwC7NeQVnlxNphyoFflEYl+cE8qypMsb8G+yptdtjAkn8KL
D04fv6m4HnUK/NYgcYxry6Ad61OX3VVho65WubFSpxX7dAhQCF4jy+gXfc1N2hvZ
7jSCI7qv0RAviAKkrX5eVbdW8egi2NWp+grVL+cAD+f9MkHjhjcEHO5YsFKIUEhj
pj1HygvZgwTx0h646M7eg4HoEoCsed81gaEwoowelaN4jCa1LIr8XZYfiYoUlenD
aye3ZBJEgSyerJbZT+aIuaObdCMOvCMQHn514EVCkHKB4g3CUV4VftL3Cufwr2DV
4pMcsKXur6XvfNLk3Kbf4QvioWXYWQpq2fi5ZHptcs/I0aDBHSevr7+QiIwBMmof
3XdtyCpU7f1/Fvziek/20l3TNY1IZMzrPtnqb5P9ZbrDPHDxsHAI4i+zRWA/Qefs
81Tn71vudY9pyrXVj6PTgdJebV7Tn2X1xpG61cUF8sf38nmyNsH0v4HlGTe85jip
27oM4gcEwF0Ojb2TmxhQZSELcXTrMK9/bEurmQIrsWp0K2QKEHn8CO6sKc7owNu+
chWxE5YP9rxtX2CJCfe9AUktJrmO6xEcCPwlQr7TB7nPBrW+Epk=
=L9lh
-----END PGP SIGNATURE-----

--h3LYUU6HlUDSAOzy--
