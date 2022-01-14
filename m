Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E8C48F24E
	for <lists+openbmc@lfdr.de>; Fri, 14 Jan 2022 23:16:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JbFyc0Gl6z30QY
	for <lists+openbmc@lfdr.de>; Sat, 15 Jan 2022 09:16:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=Ee3u55Yj;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=glMywmgg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=Ee3u55Yj; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=glMywmgg; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JbFy63yQvz2ylk
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jan 2022 09:16:29 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 512B25C00E3
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jan 2022 17:16:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 14 Jan 2022 17:16:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=qHIDPCkbZtcz+8fUXCkf++5BzQq
 lLnl1HLrOg/Gu3f8=; b=Ee3u55YjhD6ICcStRURbIM/0sZJwBx0kJxxoeJP1PYs
 oWw+2s3PYwI1SPoIfzeWbF/QuRyNdpJgPDk1qacYnLZBk4SCd5fnOPROk4yFTfrX
 JK7iBqShlZO/k0spfSwQvBVVq+X1uj4hl7xFxthxF5XK5/vm+RdJKiqYKKcJgALn
 V5BYOXiZs3Gz/b1sY+ySObfqR4RUP3CU9CLyt2edjtoz/7fnN5q5Cw85y60zBkQZ
 27o1Nqqi+oucBKdriTJ+IDwDHmw89y/JjksufgOjKtWWK8RHA835f/ujaTrmjdpF
 bfNw3HXfrl7ETTsrTAEObi7zgNZix/WfOpGFLPF8Y+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=qHIDPC
 kbZtcz+8fUXCkf++5BzQqlLnl1HLrOg/Gu3f8=; b=glMywmgg+6230broug6kfL
 SDGcLlFSJA2xfnJdYlbBZWW84YKZGk1Z+XhLhNcrZ5aYEZtyWqyVka9jIN0+3VrK
 OrtQ7XMxOng5dT848a4zfzszwRzg7Eb0AhdeuduCb7wMPQMuGFeQOnWNiAGhDqnx
 G0CU0Xrz9pZCBGPgDMMTdUYGtsMmHxOZnw5szJZY15jCFwuM3Y86M8z45w5Y9mNZ
 tbzFGtBY1La/A/tvdI9Zb79KbDemmm3STsRF7RKiFpIWRDzwxuVmQ9cCbAHhMnWN
 9lPfjjEW6cLDm4djD9r3M+Tg+mLhsxLZ8eayKrePI/X2UBdTcc0HRAzifhe5Bt0A
 ==
X-ME-Sender: <xms:OvbhYSeyy0pDo6GS2MnrG3wgrEFiO6oNmkBN2rIcWUd6RxA8QYsCMA>
 <xme:OvbhYcMAtDCJs-wDEn_SMSp2arJJ5AOUNRDZmvJ1u4MaSzU93E8jx88AH_QxXxLic
 y8el_uJUQ7GrTtQupE>
X-ME-Received: <xmr:OvbhYTjddzqCLmKT4B_miPt0J5OaXP7SF9cwmY1zAOrJVCr77FKlMrbEhuL5gngBjIXEr-jeb-a8pWJWFdx3xCs7579T29cXzd-yRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdehgdduheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepkeevgeegffffhfdtkeefkeefudeg
 heeuleehheegvdfhtdeuteevveevgfejffeunecuffhomhgrihhnpehgihhthhhusgdrtg
 homhdpmhgvmhgsvghrshhhihhpqdgrnhguqdhvohhtihhnghdrmhgunecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfi
 gtgidrgiihii
X-ME-Proxy: <xmx:OvbhYf_sTFrGt_cFZACzFmQgW1P1oqjfGWswZux1Y-s9KZfnYPwb3g>
 <xmx:OvbhYevGBWnQHn-OGcLHIMwEEJSfITHHEag8nZh_GSlvtcBXPSREGw>
 <xmx:OvbhYWFwt5PoMfDu5onLk5bSNxlecCgpV7SSLjULvVq5xSx7zFQ79A>
 <xmx:OvbhYf5ooLzbObsksqkhgDG9z_IY_fjHk3EBz0bVFcnGqbTb0bQXuw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Fri, 14 Jan 2022 17:16:25 -0500 (EST)
Date: Fri, 14 Jan 2022 16:16:24 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: Upcoming TOF elections
Message-ID: <YeH2OHImO/oRgkjN@heinlein>
References: <YdiCUiwh1iD4ycr8@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7XClNi3AyKKJb5fs"
Content-Disposition: inline
In-Reply-To: <YdiCUiwh1iD4ycr8@heinlein>
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


--7XClNi3AyKKJb5fs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 07, 2022 at 12:11:30PM -0600, Patrick Williams wrote:
> * Jan 15th: Current TOF must publish a list of eligible voting members.

The official list of eligible voters for this half has been accepted by the=
 TOF
and is published here:

https://github.com/openbmc/tof-election/blob/b0fcea13c5433a06c6a01b32e27083=
e7cb74420c/2022H1/rollcall.json

I have included the list of github ids at the end of this email as well.

> * Jan 30th:	Developers disputing membership eligibility must submit a pet=
ition
>             request to the current TOF.
> * Feb 15th:	Current TOF must publish a final list of eligible voting memb=
ers
>             and upcoming candidates for TOF seats

If your name is not on the above list and you believe this in error, you ha=
ve
until January 30th to open an issue here with your evidence for inclusion:

https://github.com/openbmc/technical-oversight-forum/issues

> * Jan 30th:	Nominations (self or peer) for TOF seats must be sent to the =
mailing
>             list.

According to this document we have 4 seats up for election this half:
    https://github.com/openbmc/docs/blob/master/tof/membership-and-voting.md

There requirements are:

    - You must be eligible to vote for yourself (ie. you must be in the lin=
ked
      rollcall.json).

    - Only 2 members may be from the same company.  This doesn't mean that
      we cannot have multiple nominations from the same company, but only 2
      may be placed from the election results.
    =20
If you are interested in joining the TOF, or want to nominate someone, plea=
se
reply to the mailing list with your interest by Jan 30th.

---

[ Kostr, Krellan, PlotCondor, PriyangaRamasamy, RashmicaG, ZhikuiRen, adath=
atri,
  amboar, anoo1, anvesh001, bentyner, bjwyman, bradbishop, brandonkimbk,
  derick-montague, dixsie, drakedog2008, edtanous, geissonator, gkeishin,
  gokulsvg, gtmills, jebr224, jmbills, johnwedig, jonathan-doman, jwludzik,
  kazmierczak-lukasz, krzysztof-i, lxwinspur, manojkiraneda, mikecgithub,
  mine260309, msbarth, ojayanth, peterp-ibm, prkatti1, rahulmah, ratagupt,
  sampmisr, sandeepasingh116, santoshpuranik, sbteeks, sdompke, smccarney,
  spinler, sumbhat90, susilsi7, tomjoseph83, tonylee79, vishwabmc, vmauery,
  wak-google, williamspatrick, wltu, wrightjl1, ya-mouse, zane131 ]

--=20
Patrick Williams

--7XClNi3AyKKJb5fs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmHh9jYACgkQqwNHzC0A
wRlfgw//XNCLyRM4CthIX1yg9bF51N54E9RgIM3fw4AFrpiHuUd2VeYKTfkH4iHE
qzdR3R9gKg8lrUA7wP+yVL6ktQc9xeOwDwqoWACxGq9h9N8ys62eQewwuxG/lDgs
R7gDsTxzCnm+1C6hbiKngdGUZc3w58mAW6ZBlob1YRl692MZ2UEyNwbyNUL4FwNo
KOeboTi7uy8hA6Wu4SR8tHs3DckZefUuybHG4O3A5CEAX8uV0N08uJ1/i7N05OT8
t0775B4N1dwHx0m/CvO9FHY3PPiSxhPzNbzZfPwOi6rn3lcZCBfyS0qAFTgwbkP1
QtR7Z0BRy1TqKT5snGl5xiLkHGOSdEDIHAvG9BBpfP88XJunzpkrGQXQC9duRBx2
IVq6E6fVB3ZdlZMoZzoqulU/jSqa5pmqHe3zyt3cci401Y7q/cxN9/U3ijGhdb/Y
2GMl2aEfT1Hx+P3LTpXzjiiwVcKaXjf/+n5+7CE+r/LwWQjhTT6ai5jSVmD081VX
ViOhbpI8wE4dCg/J3uf1pIfbaU4rrV+fxUUynwkaxG9JZvYDdk710SV9/JgBhEkQ
BKwxqozwRWwUwJQ3jwRuJmO5hXeSe1aGeC8qsyTOYEVosli/wH0AFJpTxdlPBJHI
qoiE9m/Z84xu90t7Pglfj91P6aoGSWLOBv6nY5DXj8T3j7Tdj1c=
=GxL6
-----END PGP SIGNATURE-----

--7XClNi3AyKKJb5fs--
