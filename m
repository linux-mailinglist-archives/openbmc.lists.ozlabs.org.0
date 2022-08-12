Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBA659135E
	for <lists+openbmc@lfdr.de>; Fri, 12 Aug 2022 17:58:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M47dJ2jQxz3bd4
	for <lists+openbmc@lfdr.de>; Sat, 13 Aug 2022 01:58:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=Wr0caW8l;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Tz4uEnni;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=Wr0caW8l;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Tz4uEnni;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M47cm5Twtz30Hf
	for <openbmc@lists.ozlabs.org>; Sat, 13 Aug 2022 01:58:14 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 6D0FB5C00EA;
	Fri, 12 Aug 2022 11:58:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 12 Aug 2022 11:58:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660319890; x=1660406290; bh=VqC2OzLFOe
	aYVMeepszVHvKhNP5s/FroSOqEolo3pxs=; b=Wr0caW8llFJJ7mBYyor8JnQfpn
	32NTKwkXFJwkOU4eUHddsrK/prj+XgAdb+AqzVTyNOF6ooAK8vhDDwdrsDEW2K2V
	1Drn3NxU3isX5NNpRrzhlqeGSVrV2WpyLyaa1yQLMMYdO37txce0N7LwxAW3wWZH
	16Sg5mOvOb3bACltsOGefOeQ+wg4V9fTEF9Jw2eVgpWnfJV46fhmPKmSvrK+TKoo
	VApfNZECs+xz18gVlxjKVA/1qeDlIFnYHqZNamuX2OJn5Dc30xTMGFjJiGkk/otd
	2akubcdbzv8lBwiozjAhi/vZUJUz3rIXRae8oRq8jYsLkVKuwPzWbY8jA8BA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660319890; x=1660406290; bh=VqC2OzLFOeaYVMeepszVHvKhNP5s
	/FroSOqEolo3pxs=; b=Tz4uEnniWL94TuCLHKbTPz5z4TUOL4tgjn+DaSqO6rxx
	Se8Io+F+S+Pi7ZBx+IlkS66+ZAz+qVywBnSAuR6r/+F3R3pKH8t0drHvllWhD629
	17Rn6gWbPE0bHOpMSwr7Jz7a+mGCwiepGc5lTK56+SVNpP92pWKqcMOWu/CJHHh+
	iHW1RzlbK4dzJF9gI3gWYzlFbv9JLegQUaq46drGzlid9HOaElQyIBk3AW1216sv
	QIDfXJVli/RA6qSE3EMF5gBbOH69RBFZq7yGK1mTydW2bjZYqZTddBxFplJT5G/G
	76REpm1kzbwo0agv1fFS41ZjPpcQ7VMvBU/J+knDEA==
X-ME-Sender: <xms:kHj2YlQ5pNG1fCijCBfPX-m69j3JiNh3-xUDr4DYtBr6BMgxIvobCg>
    <xme:kHj2Yuz808cpOIoTO_inuwQePhmJ98b_He_Opw3z964XjxmmhU0ZqxaBrfq5bBoLC
    kWnspZk4pKUJ7fGcsU>
X-ME-Received: <xmr:kHj2Yq0Qb1OZmAdNAdnr6Ns_RDgq0seYfJt63PB9PZd1fGaZcgdl62LUkGXr8ggU3HON5IpwfvF6WPsG_afTV7E0pGTRtQC9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegiedgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tdejnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeevvedvjeettedtheeuhfeitdfh
    gffguefhvdfggfefteelkefgleekffevheejkeenucffohhmrghinhephihotghtohhprh
    hojhgvtghtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:kHj2YtDzpPl0RjfvJkbk7-UrWN4MNigZ0qnPVH0P6WgR5wwsvrtWYw>
    <xmx:kHj2YuhzTN5vxORHjS_YwGORzUy4nx2Rs8uOCp6oGt-GYCzLUW1zRQ>
    <xmx:kHj2YhpmduH-KbbhMUE0VTziheiKZsv5UTetSss4e06hbSFIjO4LNA>
    <xmx:knj2YmK2-sCn1Sr_EVFS5pBB3dZ51bGa5ZZanhKPEpBF-JK8EiVzaA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Aug 2022 11:58:08 -0400 (EDT)
Date: Fri, 12 Aug 2022 10:58:07 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Roy Zhang <roy.zhang@hj-micro.com>
Subject: Re: Re: OpenBMC compile failed =?utf-8?Q?i?=
 =?utf-8?B?c3N1Ze+8iHVyZ2VuY3nvvIk=?=
Message-ID: <YvZ4jwprW4wrKNkq@heinlein.stwcx.org.github.beta.tailscale.net>
References: <YvP4f0jXDrwV+Ht7@heinlein.stwcx.org.github.beta.tailscale.net>
 <AAYAqACcFBvXx6NfGBs2hKrI.3.1660179689710.Hmail.roy.zhang@hj-micro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NjjckO6YH35IMh7o"
Content-Disposition: inline
In-Reply-To: <AAYAqACcFBvXx6NfGBs2hKrI.3.1660179689710.Hmail.roy.zhang@hj-micro.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--NjjckO6YH35IMh7o
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2022 at 09:01:29AM +0800, Roy Zhang wrote:
>=20
> Hello Patrick,
>=20
>=20
> 1.below is my build machine infor =EF=BC=9A
> bmc@docker:/home/openbmc/build/mtjade/conf$ uname -r=20
> 5.4.196-1.el7.elrepo.x86_64
> bmc@docker:/home/openbmc/build/mtjade/conf$ uname -a
> Linux docker 5.4.196-1.el7.elrepo.x86_64 #1 SMP Tue May 24 12:49:20 EDT 2=
022 x86_64 x86_64 x86_64 GNU/Linux
> bmc@docker:/home/openbmc/build/mtjade/conf$=20

What is 'docker'?  Are you running under Docker or did you just name
your system 'docker'?  This is very confusing.

I'm guessing you're running some variant of CentOS 7 due to the "EL7" in
your kernel name.  Please make sure you've installed everything listed
in the Yocto documentation for your distro:

https://docs.yoctoproject.org/singleindex.html#centos-7-packages

--=20
Patrick Williams

--NjjckO6YH35IMh7o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmL2eI0ACgkQqwNHzC0A
wRlzRA/+Jb0BrlAn0nlN1osl4PZywdbnupEOgTg2fhSQFhTkn+Je/NSkpKdjjwUT
o/5A0SlJqIJwo0ocdL3NqSeH1ZNzkhHa1mnPGbNVJgSxg5dBlUkidzrYrHE2RvDt
X5fcXSKwuJs9TC2z5728tjCVp97o9/OlaDP6nYnzHUc0MxZq0FVsFCKNcqB+YNgL
clfEfflFUUU8ZZJX/f9Ast8W5fMSZYYeE29kiecneBt4nT8S+qZa+4QCgNYRHgya
o9lRw0TfDoZOCn4cwFDZ0bqSHuzt3pB7ruEGIih2M6kEyhbxCcnM76ZGiJsQfgVE
9F+Hc7GjLkAg9zTPqNfXNPiaquGhuBJub2ijkC09IXajmCAe1sXmTfeciy9agFoS
zD1HLOjIrKf5fG9ylCc3F6hw1CBPCoUPpuYm/w3u1VUzo6pLn++YTl7r5L4rY4Tn
7K78io6UO+BZKdYuIaJboNhBkVCfQ+GdJs0WQBGNa8Wghz/tJT84kr0uC0oxBmXj
0/JWpZ76PWcocWvWm5YoWtgts4JIL/Rc7ie/iTFtV2Ng/ooDS9frpJW16+P3FXeH
+1O8bklC75ni13Ye+QHSweU1qjQ7fOEa/0KpDNZoDMBgE1xrpTWfRNz9aanpP6sg
2OAjFM9xgnBdxMyg6E415bDwkWBxq92oPiOTqqxTV+nFA4SgKlM=
=a/se
-----END PGP SIGNATURE-----

--NjjckO6YH35IMh7o--
