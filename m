Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1939F2A3688
	for <lists+openbmc@lfdr.de>; Mon,  2 Nov 2020 23:29:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQ6yx4WB2zDq9b
	for <lists+openbmc@lfdr.de>; Tue,  3 Nov 2020 09:29:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=Jo9UhY5L; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=X+mhGNMM; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQ6xy74nWzDqRv
 for <openbmc@lists.ozlabs.org>; Tue,  3 Nov 2020 09:28:21 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0312C5C0248;
 Mon,  2 Nov 2020 17:28:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 02 Nov 2020 17:28:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=318V6zeyxaoGtveMZQ/79PYdu12
 1rE4CJrV1Z5CG5lI=; b=Jo9UhY5LayhPXGnVwPsch6i+dPvS0usyAL4qALYfEng
 eqnLSABIneDImWS/3ghMmdSj0FIFdTj334ga3JO9CufUAqxj1V87LlN82ptqFFye
 ITm9kduYcfgWJIMduqmeBRgV4ZK0Pl47Bqp7ocAWPsHaWq0yUoWFRZaR8m1UhZ1Y
 /wsXb63Eo18Gde0IWLQHyqkNAM4ib5POMsWysYQKTd3WVB8V2Iuc0Y96pgCsc3GU
 C9DcODCPJFApv0/Bqb9aNbyFiHn5Ikw6JbInud3TLYjRYHopEF8BzbT3W8HWjdj/
 uWzmfXPNUwrAKkDHyIrqJSFBY/W20MGeFbsdyDymN+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=318V6z
 eyxaoGtveMZQ/79PYdu121rE4CJrV1Z5CG5lI=; b=X+mhGNMMA+1p1DJEVhJg5x
 NWg8fK86LqwJyqpe6HmJXzuzaB5sBtOidGS0FoFlJPn7D1+4wt6ja/UCvmDnP3yc
 oswKOisXfnM2+aSu3PaTgEGQPjETuyfVm/qd8wymmtwXdQCHEWae+jFuEgzlqn/p
 P0ZM34ru2yXix7IDE+VtH+Pno0KoXQgB5QCi+REBMFdxaRT3nv0tsPM8D08h87Mk
 it6mh8wA9yyazNPOYkjFymlmeVSNr3BybM8dAjGtsEFbJ4bCyk+oqrpRIh3qxLP4
 zZAka++P7Pl/cpCE5rnHWqnoCxN8PaSCgH0buShp5iLjOitpSg6gZeVcfQQzkOYQ
 ==
X-ME-Sender: <xms:AYigX51V-OvmrP4hy5bGTkq9DWkSPGCc4dLvlXWcTVDlhK9hCd4c7g>
 <xme:AYigXwGeWfAMdUnz0VCl_s0-Cz4GhSGwDC1jVqAjijT2Jkb2N8EX808iCHjMxjNxh
 xRJPkh2C7F9_u_8hAI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtuddgudeiudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpefgfedvkedtffejveffjedvgfei
 hfffueeuheeiudekfeegjefgheefudehteektdenucffohhmrghinhepphgrshhtvggsih
 hnrdgtohhmnecukfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgi
 ihii
X-ME-Proxy: <xmx:AYigX56EaVgmH-huLa060t6z9EDWyDd_LVChfYeTn71Ge--LrWldyw>
 <xmx:AYigX23Xnvx6WGUwKAVmKLTjScbaq8XdPcYe4E7AVU7NS2KbGX3uJQ>
 <xmx:AYigX8Fr7Z_DB1PM3WsZyvN7AiKPbKLL4_ywgZgSC110Q3-jtP05Ew>
 <xmx:AYigX_wvmYltYtVKATOpvHRUXXM7eohCDBPc9gJ1kVZK6Xs8AnXdcQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 182B1328005D;
 Mon,  2 Nov 2020 17:28:17 -0500 (EST)
Date: Mon, 2 Nov 2020 16:28:15 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Anton Kachalov <rnouse@google.com>
Subject: Re: Current master is broken
Message-ID: <20201102222815.GG3614@heinlein>
References: <CADVsX8_pFwe-Zef0fpNfZFL3s9fiJrvRFAfwjZNt911hUq341Q@mail.gmail.com>
 <CADVsX88OzLv2dX4JfQ8+uuKON+hLC1qS6BvLUpwiJ241_N9S5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="p7qwJlK53pWzbayA"
Content-Disposition: inline
In-Reply-To: <CADVsX88OzLv2dX4JfQ8+uuKON+hLC1qS6BvLUpwiJ241_N9S5g@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--p7qwJlK53pWzbayA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2020 at 10:40:40PM +0100, Anton Kachalov wrote:
> Raise it up.
>=20
> Even with the recent checkout it is still broken even for qemutarget.
>=20
> On Fri, 23 Oct 2020 at 20:22, Anton Kachalov <rnouse@google.com> wrote:
>=20
> > The recent commit af5e4ef732faedf66c6dc1756432e9de2ac72988 broke the bu=
ild:
> >
> > https://pastebin.com/5tTYHd68
> >
> > The do_package() step tries to chown the base-files/3.0.14-r89/package/=
usr
> > directory to 0:0 uid/gid
> >
> > I've tried to remove build/tmp and re-run several times. Fails with the
> > same error. If I use the previous commit
> > (36fe5df200a94e3ce82ba2dcad16c0a4127f6d46) it builds without any issues.
> >

Hi Anton,

I don't think anyone else is observing this so that's probably why no
one responded.  I've been building pretty regularly Witherspoon and
Tiogapass and never seen this.

Is this something you're seeing with fresh builds or has your build tree
been around for a while?  The commit you pointed to was a Yocto update,
so it is certainly possible they've messed something up in certain
conditions.

Can you figure out who owns that file from your paste?  Is it your user?

--=20
Patrick Williams

--p7qwJlK53pWzbayA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl+gh/0ACgkQqwNHzC0A
wRm+DQ//ZRncZcoSIQMopmRK41Hma1lQCvWOknbposypaV/+IQMQl39lTZ+14u0b
AAw1voBXzUjY7mSqHcTyx1Xxn/V9hjBuAexsW0zz6/ohEzbRKSYtrByourm1gtHG
zfsbPTsfiyelQpted70bClRQSOdZ5jQtWFEE24az6btH/Xt3Wh8u40n18OjKdmFn
Wp5QbCU9EPrQ4oJcacrZPx0qRLL5k+s/RySlpOvQWWynzOn6fG65fHT2yUIaKK78
WotOHpo7Hzp9KK+QGj+umJ7HtAmSHoqflZkM/XU8o/mplbTvgHw4ZugFlztjxV0d
Z8OF8qRgfvPF02PbAXUwQf1to6IMs7DJQqNIebwNb4CRZCAMFGnZ8/L/F7A90YEU
sp3XcIMYpe6DXNljfETRqpy7rqAilE4Mh1x/7qbsM3DbjakmKOeH6ru1HoVZD4tZ
5oGEHpVmHpKUF0HpY6ARN1b8V8YopQ8EMYidF2Jtcfd3ypP+8+hTbGPm5ROCnG3K
Q3yg2t2A9psr9abMcppXGYu/5Y48sAHXqdZfcaGEsrjvSexIbgHd7Kdo9isFLNH6
YhGO79p2HMt6Bk+0aU/Xs3LXP51XDH4y0jE011B1PZ9NZrcYElILXa2LESRLH1X3
zzadHelTiURIBU6t8oiPrLwo1pIeOiO8jwTsDExiyPv5nMegSzk=
=0kAk
-----END PGP SIGNATURE-----

--p7qwJlK53pWzbayA--
