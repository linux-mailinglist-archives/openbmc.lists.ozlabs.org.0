Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B815E4AFF0A
	for <lists+openbmc@lfdr.de>; Wed,  9 Feb 2022 22:15:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvCMb3SCGz2yR8
	for <lists+openbmc@lfdr.de>; Thu, 10 Feb 2022 08:15:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=YwkEGVz/;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=SC3IoyUw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=YwkEGVz/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=SC3IoyUw; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvCM64QMTz2xYQ
 for <openbmc@lists.ozlabs.org>; Thu, 10 Feb 2022 08:14:57 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id BF5103200C4A;
 Wed,  9 Feb 2022 16:14:54 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 09 Feb 2022 16:14:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=6tIAkN/WyW0jJ2ntjwRrPM02exhZLd2tAQxzJi
 64Qwo=; b=YwkEGVz/reaDCm4Zi5mal3TrCVreo6FAOaQVzo3acSNUS0hARV/Vmx
 yVHY619W6JxE2kuXarA48/LOFYei8IoNYyJM7MyCeW1MDoS+nlED1FImW+/YrChP
 mu65+HBr4HiOnwUgFUQEcX88aP/5O7KVW/4BHxl9T5xbWC+JQYAG/cMA5R0x39Wo
 ztQzVkFcqjFTfINPXa4EKwundw29hpnoZIlvtjdtUVJ/RViebaqm3vB6ttRoPvi8
 7PPySzisRvufDWEgheWfvWN41BXz8RKVswthAIdxSDWUCd3KyhkpJCnBQGtnGbrk
 dXkZwnYL0FIRdZlc8i7znfVXBdBEgr4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=6tIAkN/WyW0jJ2ntj
 wRrPM02exhZLd2tAQxzJi64Qwo=; b=SC3IoyUwtm0vRVMmdOFzksQVGH7hD/jck
 DnSJKaVzoboWENU2/8llPnoxXODtUrJRRj3otoSX4qmo0XzmvihhB+t3RaRnTZLN
 fJU5o6QstDyGMnbQalK0SlKbsymCwIs0ldvnSE7Lgxz3Xh8VumhglaWWgMt00fil
 JNo685Z4q4jqqOb3LN+4/wKffHw0j8/v+ocPCA/f3/Bs3Ymj9O0wsC6noZMPxOn9
 /HflyvBv0bEf0Di57NJDOGWjVAvVWdSTt2utWvlgAfOtf4FRlCet/R7aqmhkFnw6
 +VGMb07xD0CFyuVPtsVtnRmhclif6R+00wlnHBMdKCqtSq2Wk/raw==
X-ME-Sender: <xms:zi4EYuGhBcUaVwfdP6N0cXm5y_pTVzgWKJTSn1mLXZ1OLX4QP3_Rwg>
 <xme:zi4EYvUuOJQHj9MuKk1QDWCdOz0CgXhvIaSi9meJlsOsE1PPzKdifgU9iw28b6Uy8
 owVxW1KQsRg9Kn2Nf8>
X-ME-Received: <xmr:zi4EYoJ0WE2cFYsV0r4CqdWu4iuzSaYOSa6v3oZCfzWGrXFSIb35ZQ7yscLQI6OiBhdwZ_C52lbdvw6DmmZ29n_lelHxSkgN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheelgddugeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:zi4EYoHTEdASvX-c1a-MaICMpIHsbmYeVE65r-05s2ZjNyvYuDCd_g>
 <xmx:zi4EYkW4zLA_sj6Yig6ObPbbek38yiEXc4c3h28g4gRy4uCAPxqwaQ>
 <xmx:zi4EYrMPO2tCnlhgpIMaWUT40gnQlN014Pj9n2hWF6r0KmESbUm5Ig>
 <xmx:zi4EYhipmiqg__UCdVpdtP9XFtjfki9tUhcdpuwR_Y0cLinEBYW5KA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Feb 2022 16:14:53 -0500 (EST)
Date: Wed, 9 Feb 2022 15:14:52 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Ed Tanous <edtanous@google.com>
Subject: Re: Propose a new application for reading DIMM SPD directly
Message-ID: <YgQuzD9AkrqstygH@heinlein>
References: <CAD1rtg8sa2OG4jUL8x7Gr9ExzH-tEswhHwSDaZtWhcAN4sAvuw@mail.gmail.com>
 <YgIXodbEP9hmae6Q@heinlein>
 <CAD1rtg-tTrbjiL76NRDGnAfx36JBM4Rcb2gyUYjROR-2=H+Uqg@mail.gmail.com>
 <YgQcaInEBq8ZBlIm@heinlein>
 <CAH2-KxAyXn3YndZY_aWAMt4M6eTMrkPA91vCPeOj0tZOgPv-vA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bTVt/3AHGmWN4vDu"
Content-Disposition: inline
In-Reply-To: <CAH2-KxAyXn3YndZY_aWAMt4M6eTMrkPA91vCPeOj0tZOgPv-vA@mail.gmail.com>
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
Cc: openbmc@lists.ozlabs.org, Benjamin Fair <benjaminfair@google.com>,
 Michael Shen <gpgpgp@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--bTVt/3AHGmWN4vDu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 09, 2022 at 12:20:00PM -0800, Ed Tanous wrote:
> On Wed, Feb 9, 2022 at 11:56 AM Patrick Williams <patrick@stwcx.xyz> wrot=
e:
> > On Tue, Feb 08, 2022 at 04:23:12PM +0800, Michael Shen wrote:
> > > On Tue, Feb 8, 2022 at 3:11 PM Patrick Williams <patrick@stwcx.xyz> w=
rote:
> > > > On Tue, Feb 08, 2022 at 01:10:37PM +0800, Michael Shen wrote:

> > > BIOS owns the MUX select pin and it can decide who owns the SPD(I2C/I=
3C) bus.
> > > From my understanding, BIOS only needs to read SPD during the POST st=
age.
> > > For the rest of time, BIOS will hand over the SPD bus to BMC.
> >
> > That seems like it might work.  You'll have to deal with the time when =
the BIOS
> > has the mux in the BMC code somehow.  Ideally I'd ask for the mux selec=
t to also
> > be fed to the BMC as an input GPIO so that you can differentiate betwee=
n "we
> > don't own the mux" and "all the devices are NAKing us".
>=20
> This seems like a nitty gritty design detail that's best handled in
> code when we review it.  I think the important bit here is that there
> are paths where this could work without a significant design issue.

Just one subtlety.  I wouldn't expect this, necessarily, to be in _our_ des=
ign
and/or code, except that we'd want to document the GPIO line like we do all
others.  I was trying to hint that "if I were involved in this hardware des=
ign,
I'd ask for...".  If you leave it out, I'm sure it'll work _most_ of the ti=
me
just fine and it'll be your problem to debug it when it doesn't.

--=20
Patrick Williams

--bTVt/3AHGmWN4vDu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmIELsoACgkQqwNHzC0A
wRkDWBAAih0cuM4d5UtdZGFxcpwU+L4+UPxq0z5iSXnqNUDBlLRxzyyYk53QtB5N
dAlZrQ56eOSaID6qyKHQBHbPVvr3Bt9wncphIjWqMxu1WtnxRf9qvJ3lMrt6gR4p
cNNF1+zjwB6pHm1iw8RlbZxgVr1Uew/gbFUzDzRmCmKeKYbdjipDV0gk49/OWM2h
lOCyRr6zWIus1JRF/tddCxbYozfvuZuVY2CFHJLbmnkVxplQydhV9UqXyiSu8fZ0
JQQj3GkA+I/S6kqJ3paU10w/5w4Uk63RRY1jzRubWsgyVqdkjQ9Y+u3G+hTfUm1/
kPTfVwVDa73yIQ7c7ocBK5CIrO0/3G0+x+pGdgktHXV5sQAk8ZE321AdiCZqLODx
7MStbeY5JLry7kIAet6l/0KB7HE6eey7VTVVogUz0dEvF8pYkeXUtGDwT3ZaROfl
WlDbQPcXfHtzhwPV0baZBCpodoXLbEHeSXP/qpRFTPIEedR8eLFsAAlAuqkqLqsb
B0YOxdo33NZre/7fMDRVE5VvrjLicfQlYTyo3gj/xFVXT5tInrjrONnBWPS/gY9E
PAmftJSGI5E9ZLjO6ZCi0fjSzAkeClIJYaNnNtQc4AHM0ntexkRhhXvsrrBPgUVV
1jl3PGBxt2P5F9xD9i60CW20nhOoL0/xuGGCbYgCFbWVAliw8Qg=
=Jncj
-----END PGP SIGNATURE-----

--bTVt/3AHGmWN4vDu--
