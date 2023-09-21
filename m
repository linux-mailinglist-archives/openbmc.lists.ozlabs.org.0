Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 155707A9598
	for <lists+openbmc@lfdr.de>; Thu, 21 Sep 2023 17:39:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=hecvMABj;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=bmfgYPvS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rs02W6svzz3cPT
	for <lists+openbmc@lfdr.de>; Fri, 22 Sep 2023 01:39:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=hecvMABj;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=bmfgYPvS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rs01q0NxLz3cBs
	for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2023 01:39:09 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 145705C01DD;
	Thu, 21 Sep 2023 11:39:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 21 Sep 2023 11:39:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1695310746; x=1695397146; bh=QJ
	PncY590BystE38vBasDOe4OnggXJa7neDi2jvf4Oc=; b=hecvMABjQhLwpNOv47
	J+iR/VvKGjuzLTjVJ7TnWU+xr989TS5L89RLQA50WiS+REqWtQ36fiOEqc4lCm6F
	uLsX3C31huL4p4TriCTCMkGUA58lKl/ynPQQZbruWIXwLU09bqX8lcIGyOB160Fl
	oERzVHpMDNs5+X/lman88rFdmjJRkeJxmVVDpzXNSNebeN9K/YoM2S+vo35VRKKg
	yQ6Voi/MLJQfhj/p2XMw6fKxm/1yQkEp1ge0mGja0dZD5o2uKj01FhoLbdBwD0sk
	OurWWmtTPw0TvasPfUJlvNd/veuoJCL2VEY5GRa6F1x+vYfqEJDUgm+4Gk/M87IX
	zukQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1695310746; x=1695397146; bh=QJPncY590Byst
	E38vBasDOe4OnggXJa7neDi2jvf4Oc=; b=bmfgYPvSzdwvFYC9hU8C9wEwlbY4H
	c4CeoodJUF5sjfSZZZazkN/7zbrmz9MgQvCq1BYiswO6uy3rjTfhA6/GD1ODeoW4
	+qqCJJCbXq01AA7WvSqijrMhUhm1h1aQsRvgUI5QezWOAVOoRX9vEAWe2nAFWRg4
	P+qo2iV6bZ8mDy06p3CB78/3IqAjviKETurMKh38huF4yjBSe3JgLpK1fywlJvOc
	RRZg0zbpHawimc0Nj9n3MrdXhXDTq1p1x2tBntsDbocVdTzNjVlXnejMg1j+4U2N
	UWKW5pvVdLocpJGgpcgU5bwdB0+wkQ6tgknKyhMiQTBPxvz0duhnvF08A==
X-ME-Sender: <xms:mWMMZXmTkdaC5qp2FMcRWzFPuLzyfJZWj8ycocJENuVzxnf1xCIXUA>
    <xme:mWMMZa2c_E_l1iqfYKk3V2ynf7TsCSD71mYxk-Zu4iuagq_H2bcqb8HRl8sw2mJr_
    8ecbVZvwkOJlwONf_I>
X-ME-Received: <xmr:mWMMZdp7LnAPEjiN3O50VFyfdLKWRzU-Jvj__Zk0KNrp-mh5bZyaY8WRi7gtzo6HZ2i24fuqnBIDGIlXayq7d7nOBHVu2o1gEn0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudekiedgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludejmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeekieefgefgvedvudduheevgedv
    gedtgeffheejjeekkefgieefhfekueeujeegteenucffohhmrghinhepohhpvghnsghmtg
    drohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:mWMMZfkD7AThXM2tRA5vash_2JQt3iThNUsy1tlo_pU-Apr3M1eTdQ>
    <xmx:mWMMZV0r3_eyAtrMbGnI-g33zJOIrwk_DSA-ABgsaCSr7Vbp2rn36A>
    <xmx:mWMMZeugnSsdme7tlNJWaVs6_K8TJ6z7fBtcq9kFj_Um8gXUCaCVMw>
    <xmx:mmMMZS96uck2l5PxwClz17rsQvqfpYcq9ZQMLzlC9ZImN88gJNuxEQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Sep 2023 11:39:05 -0400 (EDT)
Date: Thu, 21 Sep 2023 10:39:02 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: dhruvaraj S <dhruvaraj@gmail.com>
Subject: Re: Proposal: Removing redundant EpochTime interface from dump entry
Message-ID: <ZQxjlifIOo96FJj9@heinlein.vulture-banana.ts.net>
References: <CAK7WosgDEJN8gaLu+mC3W1xKAysdZY_pHTz46vqTpun69G0hfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BDwDLZvMXW1BuzSi"
Content-Disposition: inline
In-Reply-To: <CAK7WosgDEJN8gaLu+mC3W1xKAysdZY_pHTz46vqTpun69G0hfA@mail.gmail.com>
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


--BDwDLZvMXW1BuzSi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2023 at 08:52:15AM +0530, dhruvaraj S wrote:
> Hi,
>=20
> In the current implementation, objects implementing the dump entry
> interface implement both xyz.openbmc_project.Common.Progress (for dump
> creation start time, end time, and status) and
> xyz.openbmc_project.Time.Epoch (for dump creation time, which is
> effectively the end time). This leads to a redundancy in specifying
> the dump creation end time.
>=20
> My proposed change updates the documentation of the interface,
> removing the reference to xyz.openbmc_project.Time.Epoch and adding a
> reference to xyz.openbmc_project.Common.Progress. This is to remove
> the need for updating the creation time in multiple locations.
>=20
> You can review the change here:
> https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/66680
>=20
> Please note that this change will have an impact on any applications
> that are currently reading the dump creation time from the EpochTime
> interface. These applications will need to be updated to read the
> creation time from the xyz.openbmc_project.Common.Progress interface
> instead.
> Link to the interface
> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/=
openbmc_project/Common/Progress.interface.yaml
>=20
> I would appreciate it if you could take a look at the change and
> provide any feedback you have.
>=20

It looks like the potential concern would be with bmcweb.  There appears
to maybe be some common code related to LogServices that expects all
logs to have the Time.EpochTime interface.  Are you going to add
alternative code there to look at the Common.Progress interface instead?
Is this acceptable to the bmcweb side?

--=20
Patrick Williams

--BDwDLZvMXW1BuzSi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmUMY5UACgkQqwNHzC0A
wRmQMxAAgsnfj47mqNHbyT2XRL6MOFO6gX119w+kgqk/E6jLmQbBiB/+uhQLT453
09xHn4LX2WkrXPFNjN6i+63GR6epVpkuJH9pFtVmyrIhVSpEqyjfZvcSqtVbHg+x
LSa0XKa2YxaY3qZACQ8Lvp2mFgFOkJmOkes8fnpV6k8CDfHV80VoLIkHdFTUIFK8
gUEjuV6zwk6bYiyr0HgLXQBCklrKyH21ieIx9rPwGCSkSmQTz9JFiOfgTeESX93p
67iFjfqnnHxS9cl9727dnomPAqJg6WoEYdzJw24tHYvLP4HM/JG3ssPKCY167WNu
d51copmgvY+gp+oGeztjHoTZCbgIvpbCfkKy7P9X4vnYDEp3RINjlg2iSurs9NAc
4oA3/a6L9ND6Nc/doZMOT06Q5a0rBqj3nUUjjJeqy9w4bpubHiQJJjvA4d0nbeMf
Iv9QcxX1eb/NDRqcP96/3ywGtiqCoRqjbrPaIlukszdUO2DobndYguO7Ie0YoJIo
ps2cJ6wo9+ZrmEvrlQQuo6YrftNPh39MTWcv+qLsie0CxFf8NVpviCSt/oBAbxDX
D307lWmFzXzC589FOlAkAPl70c/1JMrgTFV8BZsOu7HWnKDtHvq5LxUc9CscMFJc
T4gKXkbigtPPsKTkOmJfNqWiCJaEiuYkPmVSSzbCnlnAXUXjTTk=
=Z9AB
-----END PGP SIGNATURE-----

--BDwDLZvMXW1BuzSi--
