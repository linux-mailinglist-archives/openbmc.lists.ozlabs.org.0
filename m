Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D68D048F277
	for <lists+openbmc@lfdr.de>; Fri, 14 Jan 2022 23:31:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JbGHm5BWqz30Nc
	for <lists+openbmc@lfdr.de>; Sat, 15 Jan 2022 09:31:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=lVEQCgwR;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=i0Hv9k41;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=lVEQCgwR; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=i0Hv9k41; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JbGHK24d4z2xrb
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jan 2022 09:31:24 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 544F85C00F9
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jan 2022 17:31:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 14 Jan 2022 17:31:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=RxFHjea43eOE0bZ9EBM8LGANM5a
 VkMGrcMV0DMYEAJw=; b=lVEQCgwRKmRpnF+9/tbWigjoHM5NVrmzQxfw6RtUl0u
 3xToUFlQU0DuTLYWkoe9iiRQOU6xT8h1LLbnv4C8UHDz47jMLbFAzyNqGytkettV
 BODA3XgWB64bD7sc9+HxUoSs1JeXcSsH+0ibBjLZSVao6CEMUNG33jNZn6aT+J18
 4Jda7Nk0SQ4q2FNxkrTU2VCdU3VniDl5Q79nOBSihgbL9eMvkubGc4o+mcR5dutv
 2flsvqgwlW+uqb+EvAvTx2nOj8Z+gcZ/Fh6ffT1EoviMtMi24iFD/kZIUog+QZ2u
 vF5l/q3t8sUUiJF+75kszcuqDRFnciVG3irmXK5pvmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=RxFHje
 a43eOE0bZ9EBM8LGANM5aVkMGrcMV0DMYEAJw=; b=i0Hv9k4138Pigz0KoWAPbZ
 jm/HpcZL/wkEKkejO6owZksvOcDI4NHEXiM6pEmfbKEWEdMyL4SbSsB1P2DVD9rg
 wLEdLmbHYsKhUR5wpYBa3IBqScyoiWLrAUcKyZmY+WyoVSBbMezCoxIz9aqvDHOZ
 jnXZxND4HxO9YscyXwbMa+QZnCocfwFe4Pq0MAKI2dBfjOlZ01gspbnJN0c6h1g+
 XJds8qnzAtLkUaDsrIl/hfYCq3eadepk+XAeoagG20FlXsU3gO0funSqiNs1Jd5f
 HRDtlkEu40+TWN8M6JV7MANdd/ITr3/gjpIoYdvpS6uS3n3iQeHpf5BYZlxsZYDw
 ==
X-ME-Sender: <xms:ufnhYaDA_dTimtaVmAI5_KBAmjgSq10guRqbnhF0whGJ8iOo667WKQ>
 <xme:ufnhYUjgkEby7YxER5VyzJ-s7F1ATYOv4-tjpYLb_UkSIAKSZ2cyjMZxXNFApc3YA
 Ygue5yqYqXBlWEvXP4>
X-ME-Received: <xmr:ufnhYdmG8F5BoOCDngwE88a6O2z_yAo7hKJy24hED31qSi0a9_GaxoC--SKxNrNfpn4CkG9Yv2FUG-Y8xX-ClIzEEZr3lDONKEGnzg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdehgdduiedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:ufnhYYzMf0hkt7moq6RgCQb93JFPoelZH7GVoXC1VcC5Nk3v1MNRfg>
 <xmx:ufnhYfSjg-UTfliAV6mfdKt-ZgjpYjxibkzsAaX34WUsoo7EVbUjFA>
 <xmx:ufnhYTajMDwrypizBnHPf9_wD8RMdVzZMYzX7rLFgYpb66A67OS35A>
 <xmx:uvnhYSPUJabdtS0odaxgNp6j5ZcwXQIeWFs5vXeLfz-Y6EmSuaFsxw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Fri, 14 Jan 2022 17:31:21 -0500 (EST)
Date: Fri, 14 Jan 2022 16:31:20 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: TOF Nominations
Message-ID: <YeH5uCwUQ02RrGok@heinlein>
References: <YdiCUiwh1iD4ycr8@heinlein>
 <YeH2OHImO/oRgkjN@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="q/HhQ27X6eJ55H7I"
Content-Disposition: inline
In-Reply-To: <YeH2OHImO/oRgkjN@heinlein>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--q/HhQ27X6eJ55H7I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 14, 2022 at 04:16:24PM -0600, Patrick Williams wrote:
> On Fri, Jan 07, 2022 at 12:11:30PM -0600, Patrick Williams wrote:
=20
> > * Jan 30th:	Nominations (self or peer) for TOF seats must be sent to th=
e mailing
> >             list.

I'll be the first to nominate myself for participating in the TOF as my=20
current term is one of the 4 up for election.

I suspect most developers know me already.  I've been around the project si=
nce
the beginning (other than a 2 year break where I didn't work on BMCs) and I=
'm
a very active contributor, reviewer, and Discordian.

--=20
Patrick Williams

--q/HhQ27X6eJ55H7I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmHh+bYACgkQqwNHzC0A
wRlckw/7BPGrW+9Q0iNl+cwI98dBoIPSvKjEsp3iAR/vV20ittMJcPwEGu0l8Py3
x71sb57TQPAYe6lwtGbIzfA8zs2ecPQGLxVCntQZImL5auy/w4TS9sca4kwpolbx
R86VAgbmdwNcYk4AcrpzMlui7CdxjMnMHRpKyc4owP1msQ3+vybczbU5xDTcR5bN
A3oCSjRFAo+KbkDbf9nXwt4Vu2b3+yzs6HCzclCat5iAH2QSVfsErFmhh6FMxgZJ
9b/0UkY/OA42wfLkAao9z5tQ794uJyJH8gk1Qe8+BTfORHFFM4twDLSANjVplTas
i1NbQLzXdH5ubOSJT1EbP05uu2cpJjbEMjrFiazKSOWoDOlWcCmAM/SR+KdUra3r
EQN+qS7BPuGSpWeilAAv7RRHluZomUlUGCS0BNQ/ZUFRTTzWlQ4b9WfNvKG9R02U
rChyA8OtQ0KsXKa+R1xqsYP/stNtnBCWT6/au8Ul4gPC+vc4iGsJHKBGbH2jWYKT
R+C2ZDUgVCM3IjebQxhQongTDiO5K1eEvYYeLx2mNWczZC8nskUaUfY1bJP9Tb1A
oD/P2yW91umK4x/9TMi080TAI84G2OknEQkOk2++0MgcyIRDEbryu2kKFE5MH6Eu
Mp6oudR2ny4ocZCF2wzqDhxKTeScEMt93Zo/hyzmzdOBF5AtIGw=
=hpWS
-----END PGP SIGNATURE-----

--q/HhQ27X6eJ55H7I--
