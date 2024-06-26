Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8A2919A70
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 00:11:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=ttxa76O7;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=OJNEbphj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8bWW05Nbz3cWc
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 08:11:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=ttxa76O7;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=OJNEbphj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.153; helo=fhigh2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8bVx0gGdz30Vh
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 08:10:48 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 8999A11401B8;
	Wed, 26 Jun 2024 18:10:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 26 Jun 2024 18:10:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1719439847; x=1719526247; bh=/TFkNILTtV
	O9HuKcmpaVWRQR/NdJqlGraUxxp6dEZWY=; b=ttxa76O7xiY+PTT/wW6KaKhCay
	phitLMvnE6dKZu+i34VATsm+3e5/TJUl75L3MyEsctUtnFVq4+wSxWkA3MH6ajRB
	rYjamnZTDFS+WMAp6yIsF0hRhRthitbaS+9D5NxJ+uY9TnrFBRPaQBT88KQj/VY0
	zrNdHqMNvKj8FcDqMEYz9ewDlfc0En5CqpntVOUPndTAEQf2btB6GSqRuFcTEiqD
	vtwhSS4/v1/wmI/fXlEhBt3FRHKV/GFBKpckXXskllSjGYNLSQp3aE6NPWgnLZLg
	9q4zUNPcHEQxLDVjv1yDvv89+X07dqCD2hFiPSv4i3JDM++xvSO8dCYiKkdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1719439847; x=1719526247; bh=/TFkNILTtVO9HuKcmpaVWRQR/NdJ
	qlGraUxxp6dEZWY=; b=OJNEbphj0AWFeMdhWjjszqnBYNdxzSxrkQ/8vMa9wMSO
	zgWx6hGcQ0P9mW4IsRncv41wDn5EvWUzWDrrhekgL25jsQ4KsLnEhEi+AFIdSpjQ
	AyEJG4N1Evij4uKJIQC0a0+NZZ9o40ZjfTB1B0LS0DglXThwtijlQsFmPIylMKvl
	IL+C5XYlat4d2JjG62I9eLd5fbbaPVCsMA8GBhcDL9aha57MBPQFz89Blfnm8cKA
	OpDasfec6CYTTQYoaVyAg3Q6S9UTC/npsm66OkyEX4wllnbYbVppJST/ACPfH3m3
	XFLL+ilMMcXGffdrg0nKphr6u0ztzAeQ9BL4kO5XmA==
X-ME-Sender: <xms:55F8ZguSqji95aLHq9c2cioD22EYYLaf9m2PMuiF0z-4Kxzr75mCqg>
    <xme:55F8Ztcs8NPdtc3DhUtSstVuBiaPETDCXOlk_p-0nH0Ov1zOK0GiUybUbkAMmpyLt
    xjlRYNrnMth-eVfLzY>
X-ME-Received: <xmr:55F8ZryZIMWjXYJD6w7kHom08vb3pDrO4iyXatykwpsq-WIrgmNIIIkYBJgRlbiEeoZtFvf_L0X9KmIsfPGOWErY9I_6J_MfzFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrtdefgddtjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
    hrlhcuvffnffculdefhedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepteetiefgfeegtefftdetueeltddu
    veegleegkedvkeegudekudefhffhtedtuddtnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:55F8ZjPJMz-eCmvnEjsdvp51U7qPiXr9Li6TnPpJlp03zX6vWwze4A>
    <xmx:55F8Zg9BGGEY6EY4g9hQIy8q6GC0Va4PQGQb5W8vmBj60LMGZje7Vw>
    <xmx:55F8ZrXJgZ42eTuKENELKDTmR5oAf-ydAdxV-ZjZnHGqZf3x55_5-g>
    <xmx:55F8ZpcR9XP_hv4XQMbwQI34W9T4W1IpChTr2YVGheKOqrwphoe1tg>
    <xmx:55F8ZtOaKpSBcGDjiFLo1UhfE3tkdzQNUzxMY0pdynSr1ihE-dgFd-bp>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Jun 2024 18:10:46 -0400 (EDT)
Date: Wed, 26 Jun 2024 17:10:45 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Ed Tanous <ed@tanous.net>
Subject: Re: Request for a new vue3 branch in webui-vue
Message-ID: <ZnyR5Rw2Zx5I5elg@heinlein.vulture-banana.ts.net>
References: <1403524602.354586.1719434789488@privateemail.com>
 <ZnyKk8xOmIgqAbs0@heinlein.vulture-banana.ts.net>
 <CACWQX80A_TqXZ5QFyJcEqZZHhRf6ckAnLJJ74guz=SYV3+4gAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n2WL6lJwG//H9hnl"
Content-Disposition: inline
In-Reply-To: <CACWQX80A_TqXZ5QFyJcEqZZHhRf6ckAnLJJ74guz=SYV3+4gAA@mail.gmail.com>
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
Cc: "kirankumarb@ami.com" <kirankumarb@ami.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "a.nikhil@ibm.com" <a.nikhil@ibm.com>, Gunnar M <gunnar@gmills.xyz>, "Renuka.Sharanya.Pundla@ibm.com" <Renuka.Sharanya.Pundla@ibm.com>, "sivaprabug@ami.com" <sivaprabug@ami.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--n2WL6lJwG//H9hnl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 02:57:25PM -0700, Ed Tanous wrote:
> On Wed, Jun 26, 2024 at 2:40=E2=80=AFPM Patrick Williams <patrick@stwcx.x=
yz> wrote:
> >
> > On Wed, Jun 26, 2024 at 02:46:29PM -0600, Gunnar M wrote:
> > > Kiran and his team have volunteered to sync patches merged to master =
to this new 'vue3' branch bi-weekly. Thank you, Kiran! When the migration t=
o Vue 3 is complete, and all commits are synced over, this 'vue3' branch wi=
ll become the 'master' branch.
> >
> > We need to be careful about how we do this.  You don't want it to appear
> > on github as a rewrite of the "master" branch and we absolutely need to
> > at least keep the vue2 code in some branch so that it doesn't get pruned
> > from the github history.  If we don't do this, it will become impossible
> > for people to build older OpenBMC releases.
> >
> > I would suggest either:
> >
> >     a. We do the opposite: create a 'vue2' branch and update the recipe
> >        to point at it.
> >
> >     b. We use this as an opportunity to migrate from 'master' to 'main'
> >        and use 'main' as the vue3 branch.
>=20
>=20
> My expectation was that this branch continues to rebase in patches,
> and once ready to merge, we would just rebase the series on top of
> master before pushing it so there's no discontinuity, no merge commit,
> and autobump would just pick it up.

We would have to give "Kiran and his team" permissions in Gerrit to
force-push to the "vue3" branch in order to facilitate these rebases.
It also means potentially unreviewed content ends up in the branch due
to this permission.

I'm okay with going this route but wanted to make sure everyone is aware
of the implications.

--=20
Patrick Williams

--n2WL6lJwG//H9hnl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmZ8keQACgkQqwNHzC0A
wRmesQ//S5l/hCm4XQcUM5U/TCmQUvwLDQHndoKXOWywh7Szi3b7JYn3lKjdg3vI
XvOCfvEAm5iN2wYD2gfL++mevjxRTmKHWHdVsGZGV06hsCx60HOhYhKQPBQ+5Kgt
eZ0LKDYLNfBGas/IFC5M3FEVL+GIlrU+8JYoixKH2WJm5zxwII/DH+QKqI5DRl81
kVe3VhFx6Z4ROlKzQFWtBDGAAhZu0lXpzRWkgfoHOPAQS87eRUAS/6970DlV4Ws4
UmprEhUUNW+7pqL9n/Z4KN7w/rTKJWnD4nO5NYRMoB63w9vyDA9azNvVlHCLtzUk
lH8H9QFS7yndG2vT6IjqMcxNsMTolLUpwNVhbeaZbECoyCLLM08rCtFEFsB99heW
z8f/yL0jb7P7CIgmAwDVPS3eHODGKkQp6GqGMNj/SN0jix23T9uJZEfQPWp89Qbb
LnlZkfj5VLhrWy2DiIFm8aeFea3+GSdHsDmtl9z6H3ECXE7RIPRaLvEMZx0E/ctY
B+otiSGknVDOl97+9RwgEsrQFuseBS1QL2VVb0NXTXHshGkHPbFXZamWC9UY/6nh
vF1BgqgmNzXbNUVkko2rYXIHI5d9/VxYTCUK95vCBjfGiQOiIoWsWFXfs/xe0UJq
Q37rlmEs3dhANGR7HQt3hfimEaKBjxg9Wi1LCVO7EzU9Jld210k=
=OXmF
-----END PGP SIGNATURE-----

--n2WL6lJwG//H9hnl--
