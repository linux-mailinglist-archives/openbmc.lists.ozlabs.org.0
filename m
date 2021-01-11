Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F7A2F2194
	for <lists+openbmc@lfdr.de>; Mon, 11 Jan 2021 22:14:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DF60J0yBDzDqX6
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 08:14:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=XPDP+GbA; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=bcz4TO4Y; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DF5zQ1YfLzDqD9
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 08:13:36 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 3A4955C01E3;
 Mon, 11 Jan 2021 16:13:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 11 Jan 2021 16:13:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=n2U2bRGJipMbIHEU7tP/KuZYN0V
 73QZwleGUdlSUW9E=; b=XPDP+GbAtEkTRRiEBcujhLyEMQfvBt9QS8FSqpcR8Eo
 yJNk8JQfoavQ/HWtJBnRB7foXUYA+0Au/BKUKSp6GE66La1vjzsgw4da0hb5Ez9J
 n4g3FB1qmQnCdmzEYHoiUXveJVcCsob7urKYedLb0BBpsla42m7goyTRF6NgrUxz
 SP/B2UPnUC8BCgBJ+SO07HgO/xNdeH1S46QCjblMtpZt1QDhgAOIh25m3OC8LH6h
 bb7Z8rHqt8q7W05qFIj/1ShDVC8tln86ncGGfhgzH1Ir2gLblgi2NDBKNP9+kBqx
 QlXjTJ47YdGYwlqMv6d63Oh1dgrFCTIoE0s3YNdMGyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=n2U2bR
 GJipMbIHEU7tP/KuZYN0V73QZwleGUdlSUW9E=; b=bcz4TO4Y4JMM0olmpuBcro
 cU/wbp2HgSFA8R96wiykeCZiNCcp1UeCZz19GNQ4CR2GgthpYE2k1mCzyhLq1YD2
 TUg0VuJgI3vx8gxsOvzAVwg0qaVNByT+I0iarJWHUep13E5JjAIxo5xaNIzLeWRo
 kMTL5lVu1Q4F5JDu1lNGiXHSlYE4Vs1bzaWArJ209I90kGln0eUSxS6J3bsjUYww
 wMNYLhX1HdkMAjdOEWAj8tq07GWJSa8zplM9nWVFp/vImMssv0gsWowlyicG3l4h
 2I6LzMPpPQTB0CQaFdgeXXkN30Y1rhsjuqNJKZyVkGyT8BHxK90rrMnUXDnvKSZg
 ==
X-ME-Sender: <xms:e7_8Xy55T1hIdBmd9OBNni81HNMslSzc6qY3gXXr--Qn7IbMloPrZw>
 <xme:e7_8XxL2HKqizVNha59KU_A8RMfdPyGBdaYDfDO-LAMW1HlBjIKP3wD3ZPWdB4wTQ
 gd8nQ-LXauwSRpp7To>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehuddgudegjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tdejnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeekudeutdefiefhheefheefvdej
 ueejieektdetheelvdfhleehkeegvdeiveekhfenucfkphepudeiiedrudejvddruddvud
 drudehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:e7_8XzKRlMCbY9rp5v4Omx5NaniLrlMVUzqjwdG4QcZnL_rpUkQudQ>
 <xmx:e7_8X3W0FeSEVbjx0_dk_d3WHOsBcxOx2sxf4cf6kmLpoI3rnkgwMw>
 <xmx:e7_8X9g8FZey4O1DiDgYxVE69r6dSmu0UxsWlHETRLFb5bAfob-5Iw>
 <xmx:fb_8X5HnscvtwH02bQwj1BESF4Tv-lQN2J0DGPTfcdzh7X3Gh528YA>
Received: from localhost (mobile-166-172-121-152.mycingular.net
 [166.172.121.152])
 by mail.messagingengine.com (Postfix) with ESMTPA id B15E31080059;
 Mon, 11 Jan 2021 16:13:31 -0500 (EST)
Date: Mon, 11 Jan 2021 15:13:30 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Ed Tanous <edtanous@google.com>
Subject: Re: Upstreaming downstream Google BMC repositories
Message-ID: <X/y/es6hNBbWR/bq@heinlein>
References: <CALGRKGM0A9DHYuHrKrCLS8U0+YnbMCgVHWEXjbMW7Juhq+r=Zg@mail.gmail.com>
 <2e3f9acc-cc58-6f71-2e42-e046109dd5ec@molgen.mpg.de>
 <CADKL2t5ajasf9NzFbTwtT0=W7ZO2jcfD5V+tk5VVSrkZTuLNmw@mail.gmail.com>
 <711a5031-c774-4b03-6a6e-1f14d8699789@molgen.mpg.de>
 <CAH2-KxDdHqNXJ0uLd7QNt76MUHbt8WQd52+biaZavN4Tzb2=Vg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eN/h4h+vbojWJ8YX"
Content-Disposition: inline
In-Reply-To: <CAH2-KxDdHqNXJ0uLd7QNt76MUHbt8WQd52+biaZavN4Tzb2=Vg@mail.gmail.com>
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Brandon Kim <brandonkim@google.com>,
 Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--eN/h4h+vbojWJ8YX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Unfortunately we don't have a great policy on any of this.  Hopefully it
is something we can come up with a better definition on in the near
future.

On Thu, Jan 07, 2021 at 01:20:00PM -0800, Ed Tanous wrote:
> On Thu, Jan 7, 2021 at 10:26 AM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
> > Am 07.01.21 um 18:33 schrieb Benjamin Fair:
> > > On Thu, 7 Jan 2021 at 00:09, Paul Menzel <pmenzel@molgen.mpg.de> wrot=
e:
> > >> Am 07.01.21 um 02:49 schrieb Brandon Kim:
> > >>
> > >>> We're exploring ways of upstreaming some of the downstream reposito=
ries
> > >>> from Google to openbmc/* .
> > >>>
> > >>> Half, if not most of the downstream repositories are C++ daemons th=
at are
> > >>> specific to Google so we didn't want to create a bunch of new
> > >>> openbmc/<repo> that no one would use.

Just out of curiousity, if they're not going to be useful to anyone
except Google, what is the utility of getting them into an openbmc repo?
(There are reasons but I don't want to put words in your mouths)

> > >>> An idea that Ed gave me was having something like openbmc/google-mi=
sc
> > >>> repository for all these repositories and if there are any that see=
m useful
> > >>> to others, we can break it out into a different, separate repositor=
y in
> > >>> openbmc/* layer.
> > >>>
> > >>> Please let me know if this seems like a good idea and I'm open to o=
ther
> > >>> suggestions!

I really dislike dumping-ground repositories.  If we're going to allow
company-specific "misc" repositories, I would really like a policy that
they may *only* be referenced from that company's meta-layer.  If anyone
has any use in that code it really should be broken out into its own
repository with a proper maintenance structure.

> > >> Thank you very much for putting in the effort to make these reposito=
ries
> > >> public.
> > >>
> > >> Using the openbmc/google-misc approach, how would the git history
> > >> (commit log) be handled?
> > >>
> > >> Personally, I would prefer having small repositories as git makes th=
at
> > >> very easy to handle. Also it might save you time, as you do not have=
 to
> > >> think about what to do with the git history, and do not have to merg=
e it.
> > >
> > > We would most likely squash the history together, in case there's
> > > something confidential or private in the earlier commits.
> >
> > Understood. If that could be avoided, and only the confidential stuff
> > removed, that would be great, as the git history gives a lot of insight
> > into design decisions.
>=20
> It should be noted, there isn't really much git history to speak of
> for the things we're looking at pushing. =20

How was any code of significance developed without a git history?  It is
unfortunate we're going to lose all of this because of how often I tend
to dig through 'git-blame' to understand the "why" on code.

> Some examples of things that would go in this repository.
> 1. The google public keys/certs.  I would hope that non-google systems
> are using their own root certificates.
> 2. Disabling of ssh login flows.  This is done in a very specific way
> that requires interfacing with out of network components and protocols
> that are specific to our systems.  I'd be surprised if anyone found
> this useful.
> 3. In-band telemetry code implementing interfaces for interfacing to
> google infrastructure.  These haven't been built yet, but will likely
> be a translation from the public facing APIs (Dbus/redfish/ipmi) to
> interface them to google infrastructure.  it's unlikely anyone else
> would use this.

These make me more curious on the value of opening them.

> > > Many small repos would be easy to handle for us, but OpenBMC may not
> > > want to have lots of small Google-specific repos in their org as this
> > > may make it more cumbersome for others to find the relevant repos that
> > > they're interested in.
> >
> > Understood. On the other, with small repositories, they can only use the
> > parts they need.

I'm more comfortable with others utilizing this code if it is in a small
repo like "google-ssh-cert".  As others find it valuable we can rename
the repo.

> See above, if there are pieces that people want to use on non-google
> systems, they don't belong in meta-google.  With that said, your
> statement is incorrect, recipes are not required to be 1:1 with
> repositories.  Multiple recipes can point at subfolders of the same
> repository, allowing you to "use the parts they need" by simply adding
> recipes.  With that said, this is not the intent, and I would much
> rather move code to a more common layer (meta-phosphor for example)
> rather than have non google systems including meta-google in their
> bblayers.conf.
>=20
> >
> > > There's also overhead for the project maintainers to create the
> > > relevant groups and permissions for each new repo.
> > Please note, that Without knowing the contents of the repositories and
> > the size, this is all just my opinion. If the OpenBMC =E2=80=9Cadmins=
=E2=80=9C can
> > easily create several repositories, I=E2=80=99d prefer that route.
>=20
> Today creating new repos is non-trivial, and IMO we already have too
> many of them, which is causing a lot of thrash.  I'd really like to
> see us start consolidating some of these (see my patches to
> consolidate all the meta-layers into openbmc/openbmc with the owners
> plugin)

What do you mean by "thrash"?  Ideally it should be cheap to create a
repository.  If there is significant overhead to create a repository
with the current infrastructure we should document those challenges and
look to improve them.

I don't have any issue with consolidation of the meta-layers because
those are effectively all built together anyhow.  Right now I'm not in
favor of consolidation of code repositories and we've even talked about
splitting out some pieces (EM and fru-device come to mind to me).  Can
you quantify what the advantage of a big[ger] multi-function repositories
are?

--=20
Patrick Williams

--eN/h4h+vbojWJ8YX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl/8v3gACgkQqwNHzC0A
wRlAdw/9H+uVTa0p6yaQ9PUy+0oe99isyjkFG1vB125z1atlI8N49IYKwtSeMkwx
wwqIVT30Y1TMUZeeHt9usy4DpVDNR0UHGMIJRYd9IKjMn4MSp+jrnuuhE1NPTSW1
N3XG+o+8BF+TOKEcb8fCP8CPgd7UxzL6668jjjgJBf0RoHXGyjiT2uiQ/+09g1dy
2Ia6589vj2bttQpG3e2XjY4q+wOzu1dW/T3s0OXzUjFN4KjdhJnjE9XNAJGLqI2s
o5W3BTJjwdWOmkyQWZK7qEO6BC8XPxd7xVcf7MmqrMNQLx4Ksz4cvUOkfZPJoAhZ
wm6pKYVgwBZgo3k32wPRP3XsxuRpgIz6UsH1XPTCxvK9k1qK9ocV7/z6G81r/lN1
u3cdAn11p5poVk4E4AGksYb3DQAlto5WfsOw4xgmItssSAemU7b1ip2ZEwZVVxTb
6c2U8XjN+pklLXa876y6RjiY/SBqdrwWCkOxLVywax3QGrVxDi3qKAGlE7OliuUD
gF6aPKhb9jIK4Vpz5Qn+vyBvq8MYt5ekD36vEykLMhlkUJEzOD1KaHIIWbgV9bwz
qHr7TvJIKeyvlXIKF30E486uSm7uk5HqHjEM+PXRds+mFVcp86zZ+0hODCIw0Na6
M7x5fi95NSLvoblPYPxycWg66h8vt/BEm0d7uV1D41TKdxU0dh8=
=lbW4
-----END PGP SIGNATURE-----

--eN/h4h+vbojWJ8YX--
