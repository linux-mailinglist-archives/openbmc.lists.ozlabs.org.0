Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F0A9B72B7
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2024 04:08:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xf8831Zx9z3bxL
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2024 14:08:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.144
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730344096;
	cv=none; b=NSsAim9DE1jDIezOlPKMlJUxNFaPpUrpj8WTwqAH11aHQhxwSjKH8sjE4Ua4vqGN2PSonrerP1xfA1lU06TmZtTkvdD5vczXlcQsfEVcfrN4yE+pCeJvelFNCe1k2Y16Jh0p+M2NBo5PnnGKL1mqkdr6viKJIMw79lnoyEsoxg4dzQClRH0fezSDv7TceUSF+KRmVKi5odQlDvO98xUQE1ppIbK1lC2NJY2DaFNBdpD5sxN6hgGdYfCl5/ywnR+QiIqhw+HpZhJ7YUYw4PKJCbK6u/WROGa51fMEUz2E2usRjpwiB+34ZRSw159Si7RPuVdsH6gNRe3MLWZo3gNN7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730344096; c=relaxed/relaxed;
	bh=eB9aOA+HvimA8d+Zn7mQMQSMIuwCtRLxNPMBgrZqFNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oJ9iZHY5CqO7YRwxZh3vtDGgdoNHcPvRn+pvp4H6Xt9+a7g0EKgNyuCUPM6MWmBzlBlUOshFIHJIZLveNF9/DbBUmo21pMVwyP+oti+MFrLJnIU/15DRwOBpFHXNBNH+dXpWPjJp16kOKhsNEZ2I+Fb+zDbCiizZJxa+eh3lrkEyisQJrBviW/5pq+CDDtDzoZy0VLBp3DCjUW8XCWR8PgiKZcQsKcvTYHqkNakGD8hVlfJbNujkoY00AUudfENEfjvYzm/fv2lTu6jp4mBB21twCBxjLVqiELAxCnSYOTC5xYFSw7op5oPfL+hNB+TVsPhug29/BIHhnAYOn4VS4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=cuyy49l8; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=WEWXh6Xs; dkim-atps=neutral; spf=pass (client-ip=103.168.172.144; helo=fout-a1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=cuyy49l8;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=WEWXh6Xs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.144; helo=fout-a1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xf87v3RWxz2yDm
	for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2024 14:08:10 +1100 (AEDT)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 11E9613801A0;
	Wed, 30 Oct 2024 23:08:06 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Wed, 30 Oct 2024 23:08:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1730344086; x=1730430486; bh=eB9aOA+Hvi
	mA8d+Zn7mQMQSMIuwCtRLxNPMBgrZqFNA=; b=cuyy49l8o3Te9UXPjbGGTrcYFL
	yYvF65Db3g989yPibLZhlXku8gUvytuknTDRF9XSgZhyHromaJo4rvuy5GtSaU/W
	pSuGOOJTzZqAOYag68VzjUN2SP2vI+/1bUTavC0i51u4mHS7XjwZr/vJsyyD/vYU
	bgS2ZNV2VJhBM7vQ/TIvq9XKxC3bnPd25tEvS9A4JwVPMhMDx2bRJRJ0ZVEQ5vbk
	RUPl/k7flyUEdOM9ykdN3YiuygYtSYtrvu4i3vfzAQ0rsMiCWmeFe2v3X48e5vs7
	xz8m3RLWoEQ8ljBZnkS4IznVlbXYRDWdyas+kFMhCa/adu0fVXxDIGJl4s4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1730344086; x=1730430486; bh=eB9aOA+HvimA8d+Zn7mQMQSMIuwCtRLxNPM
	BgrZqFNA=; b=WEWXh6Xs2FjZWRToQhp32Uw1i39oJanGUq0ejcbqzdAuReR6DoT
	ZMxjjqSz613U8p8F0VlxWIyXFPcNhFPUJ51QVolA0OyF6jOZt0se7xvkRu8qLYm6
	R+FzLgVyjECDUKBdeqqTFX0/7SC7Zks/WBcsCD0RNg5u8VvTCKiCQ7N1sOgVXUKu
	5r27O+B7anizX8hH1jdQBceYok7RCvQTRzpPVB9UoLy8I0a90D9UiQsuNDDGtoOq
	7R10Xk6JcuTujaELKlqCMp4yifbXl3GAxREBIiYwUKb2kxQUOspMQwbg3gb7Ncyz
	gQA6wAocrXCRTzy3zw2aSEa8JbmVUNrYYVQ==
X-ME-Sender: <xms:lfQiZ0O7EUgt-CyTTUsSd3C8VCx8SY6NmiDoO2dbl6UwLgmQmTcl2A>
    <xme:lfQiZ68JhaGyvW9J8P5Su1_rl-p0E30ExtQ4-m89rpSVMaVM-rfAocgQCguJh98N5
    2bOCsc2S3hx6WtCSuo>
X-ME-Received: <xmr:lfQiZ7SxDPPdoxRo0OkCKskMKei3zYAziD9oIlBVVwECxbtHz_a0M9AcXkM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekgedgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnegfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhf
    gggtuggjsehgtderredttddunecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmsh
    cuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeekkeel
    hfdtvdeghefhvdegleetueduffejjeeuueelleduheekveekueelteduueenucffohhmrg
    hinhepohhpvghnsghmtggpphhrohhjvggtthdrshhofhhtfigrrhgvnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfi
    gtgidrgiihiidpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepmhhsphhinhhlvghrsehlihhnuhigrdhisghmrdgtohhmpdhrtghpthhtohephi
    hulhgvihdrshhhsegshihtvggurghntggvrdgtohhmpdhrtghpthhtohepohhpvghnsghm
    tgeslhhishhtshdrohiilhgrsghsrdhorhhg
X-ME-Proxy: <xmx:lfQiZ8vN4hIkdh9DIwXMqC5t5gZCZykEmc0np4uJgOn-L8iQlxAyEg>
    <xmx:lfQiZ8fF3cwYnsKnJiex4VX_wX46Mwz7HUpgMBaIMEJLc4DP8rtGzg>
    <xmx:lfQiZw2ceOBLvvB-rbDkGd781sMKxLvCrOyNzrPThYnpa4RR3VPXqQ>
    <xmx:lfQiZw-xJ4TKyLDqAXDg2r2BGQcMLepn0rhwUKYA1eZWknifejDVzg>
    <xmx:lvQiZ06WAV_qlieQ3v5BrP9uTTuwYqSzZk0RNuDEvmQkKk0Qi8htyD8B>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Oct 2024 23:08:05 -0400 (EDT)
Date: Wed, 30 Oct 2024 23:08:04 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: Matt Spinler <mspinler@linux.ibm.com>
Subject: Re: mapper: should it add "default interfaces" and is it valid to
 implement no interfaces on an object?
Message-ID: <ZyL0lM97tKj5O7Ro@heinlein.vulture-banana.ts.net>
References: <CAGm54UE4SXfY30oUrr9vVa+=j_Ra971A7ZcBMyMN2TgTaXN8+w@mail.gmail.com>
 <ZyJ_s_neyNkWAC2m@heinlein.vulture-banana.ts.net>
 <65dabe76-d28f-47db-97c6-0a5ce49b103a@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wpAM9EexgVIFsJ8+"
Content-Disposition: inline
In-Reply-To: <65dabe76-d28f-47db-97c6-0a5ce49b103a@linux.ibm.com>
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Lei Yu <yulei.sh@bytedance.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--wpAM9EexgVIFsJ8+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2024 at 02:49:40PM -0500, Matt Spinler wrote:
> > This is very strange.  I don't know why mapper would be creating
> > these interfaces on objects that don't exist.  It would be reasonable to
> > create these on the association objects, since those are actually being
> > created by mapper.
>=20
> Looks like=A0 every D-Bus service works the same way - if the path only=
=20
> has the 3 interfaces,
> then the GetAll properties method doesn't work:
>=20
> ```
> # busctl introspect xyz.openbmc_project.Software.BMC.Updater=20
> /xyz/openbmc_project
> NAME=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 TYPE=A0=A0=A0=A0=A0 SIGNATURE RESULT/VALUE FLAGS
> org.freedesktop.DBus.Introspectable interface -=A0=A0=A0=A0=A0=A0=A0=A0 -=
 -
> .Introspect=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 method=A0=A0=A0 -=A0=A0=A0=A0=A0=A0=A0=A0 s -
> org.freedesktop.DBus.Peer=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 interface -=A0=A0=
=A0=A0=A0=A0=A0=A0 - -
> .GetMachineId=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 method=A0=A0=A0 -=A0=A0=A0=A0=A0=A0=A0=A0 s -
> .Ping=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 method=A0=A0=A0 -=A0=A0=A0=A0=A0=A0=A0=A0 - -
> org.freedesktop.DBus.Properties=A0=A0=A0=A0 interface -=A0=A0=A0=A0=A0=A0=
=A0=A0 - -
> .Get=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 method=A0=A0=A0 ss=A0=A0=A0=A0=A0=A0=A0 v -
> .GetAll=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 method=A0=A0=A0 s=A0=A0=A0=A0=A0=A0=A0=A0 a{sv} -
> .Set=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 method=A0=A0=A0 ssv=A0=A0=A0=A0=A0=A0 - -
> .PropertiesChanged=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sig=
nal=A0=A0=A0 sa{sv}as=A0 - -

Hmm.  You're right.  I guess I wasn't aware that each segment along the
path, the dbus framework automatically inserts these objects.

I see the same thing from systemd.

If I examine `/org/freedesktop/systemd1/unit/graphical_2dsession_2etarget`,
the whole chain down to even `/` has those 3 interfaces.

> # busctl call xyz.openbmc_project.Software.BMC.Updater
>  =A0/xyz/openbmc_project org.freedesktop.DBus.Properties
> GetAll s org.freedesktop.DBus.Properties
>=20
> Call failed: Unknown object '/xyz/openbmc_project'.
>=20
> ```
>=20
>=20
> >
> > Why is mapper creating interfaces anywhere except where the association
> > itself lives?  I don't think deleting the "DefaultInterfaces" is
> > necessarily appropriate because those interfaces _should_ be created on
> > the association leaf, but elsewhere in the hierarchy they don't belong.
> >
> > On my system if I introspect the `/xyz/openbmc_project/software/XXXX` in
> > mapper, I see only the 3 `org.freedesktop.DBus` interfaces.  If I
> > introspect the `/xyz/openbmc_project/software/XXXX/software_version` I
> > see those 3 plus an `xyz.openbmc_project.Assocation` interface.  Only
> > the `.../software_version` one should have the `org.freedesktop.DBus`
> > interfaces.
> >
> > What I don't know is if this code you've changed is where those
> > interfaces are created (probably not).  So your change might not be
> > appropriate for solving the underlying issue, which is that we have
> > interfaces that don't belong being created on dbus independent from the
> > mapper response.
> >

So these interfaces are legitimate.  Why do we want mapper to filter
them?

--=20
Patrick Williams

--wpAM9EexgVIFsJ8+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmci9JIACgkQqwNHzC0A
wRkqKg//aybV5IkzcMBlhClMKwYlnpJNXW5tJUEcRkiT/sl+/Q4A+PKM6N5Qx3Mn
LkL1GYkvwiTKObEgAaSK/83x5/IglJgQ9B9DJI+smppm9DdCwUPr3FNNDf0WGhTt
BAFFRvFxc/yyvD4LaYzx9Qi77zGIczKTGBOPDFS8a29llyxEgF+SpEkFmFwEtUEL
kq9WyhySbWt2oH2cFEu0OP991XW/1t5CxaJFPredwp3bgkpPC+yBCkkkIiNbC6ri
nb3sliJdWNbuWqGi8V/i4mtakkvIFOiJwZcPSa7UIkIaSHqw9DO74k0icKgHeGZO
8LvxD7gF89mqutsasVIu4GOiR46uqUKVdqOt7VblhCpftqOoW+3zQIsxZ4BOaSAL
lzvxERLCF8MMmeQ3xZg35Jgrx94gYChh3rrbhBARlQxvo23k1V9MmCyUG9ip9nyR
JEd/7CWw3YTm8Yskwsnjr/xmaprKqVL5W6jeOGYPddac5LnX/fXIw1Mc5eY+shnx
wYK95uK9OvTGKdYv+q0WI0GZUwslub1xyjR13/uC1vs3rhKZC3Tsz1gXO6t0JZJU
wqzBcFEYwgNkiJNzFWfBBUUqINdhHb5fNqIZEeIJQNWg/pSc2yeMd4uxzowFJfPT
fCieUxVFQG+DorVlYSEETh/Ql0BzXQFifYssNjGDROILmTB5Aeg=
=MhKO
-----END PGP SIGNATURE-----

--wpAM9EexgVIFsJ8+--
