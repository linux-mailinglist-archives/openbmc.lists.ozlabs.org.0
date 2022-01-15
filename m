Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F3648F486
	for <lists+openbmc@lfdr.de>; Sat, 15 Jan 2022 04:10:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JbNTM6vLLz30Mb
	for <lists+openbmc@lfdr.de>; Sat, 15 Jan 2022 14:10:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=aftRCBxG;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=dxw0ur+M;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=aftRCBxG; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=dxw0ur+M; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JbNSs6Gdxz2xYK
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jan 2022 14:10:04 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 2F9803201F94
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jan 2022 22:10:01 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 14 Jan 2022 22:10:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=Xkh7ojir6ZpGQH1rAq2sjdocGKl
 M1XWFTp3Wx9xRmbY=; b=aftRCBxG9jbuIpHSLI1Yd8iAXG8ucIJQ1ticr9it+Ts
 pG/30jPcbda8UYMI+LTG64SM8j+PEN72DQlBpKuinl5VJWbdW+Cjt4Kj6+5OiZAO
 0j+zrbcE7Qze6qW4zqTjmxNQFE+yBmmUi6vC9Xj1xUxue62PqJ2MI6ZkJoJ0v6Nz
 6u3sZzGprjWOH9lTA6nyif6P/gATNC/6Kl3+OV6Onjvl4MtDeRe39+fFlBhM9D7O
 u329GRuQs++P2mDXJ1CECtDQ1DknfIWEHcNpYI7H14bPaHb6Nk+PFnhidKYHt962
 ciONH0fbKOHOmYAOOAlzUZcAgIoiy5S5ez8JZFRKDYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Xkh7oj
 ir6ZpGQH1rAq2sjdocGKlM1XWFTp3Wx9xRmbY=; b=dxw0ur+MEarFFl41IJN+sk
 oDYllYhlD2zTWPJfiNLXvBCxuGPfK3/zyr7hxPH0TSXRdgLTzCyGabqj8E5HNzQV
 65GaxnEhF46TpXik9AyK51hIeIyB/EkRBt2dJAlPD9RxAtKCkLFXweARn55lHe2K
 fDU7CBFGk6jIyW56U8grPN2J3BcseB2najI7YU+5Qk0RO0zpE1SVf0nEroJnV67r
 2osQTO8KmboA2LeAFFL3uQ4gOPebR0aC7TyxxRDoa0SV0enwRVWK7OdhVIKiqunA
 1av7Xaytt7O3Kjq23g2wakiH9FsZctYzrNgh640REgKLybulmd7koO4gun2v8JXQ
 ==
X-ME-Sender: <xms:CDviYbxJJPyRqMTcEKoTVxrgR9_BjFobRi3dLk1eX_5asjwbMLJNvA>
 <xme:CDviYTRp-D41-mXzC0joRJ8XV9TG-jfMgHuWjv5E5A2gWUVBWcF2seKHMhsye4XQc
 9dVbVl6QJpvhrA40lc>
X-ME-Received: <xmr:CDviYVXbmQnrXnWI2q8adrZQlbdOvsHklM7ygem9NrkbJnjUZkr_b_IuHlejhwB4RjgW4YH1EMVh12nym6qi3F77fu68JLsa_1gNag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdeigdehiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeelhfejfeekteevffegteffudefheel
 feehvdfggfdvgffhjefhfeffkeeiieevjeenucffohhmrghinhepghhithhhuhgsrdgtoh
 hmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:CDviYVgt0H5v-U5mzczR--suy5tWdbsQyF9zndD71wGlb7q1ITbVDw>
 <xmx:CDviYdAixGC3b2W7GvRjgDB0d3OFswC66y0dJUY8LJ496qdCZ9qajw>
 <xmx:CDviYeJOcGMw44H-aLjUalFZQ1lJMPYGslWykEnzCgaaqJBSYy3ycA>
 <xmx:CDviYY8OpVd0OHY0uF1v9jcuySx21-F23gneXTjNJTyqewqj5YLUIg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Fri, 14 Jan 2022 22:10:00 -0500 (EST)
Date: Fri, 14 Jan 2022 21:09:58 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: Upcoming TOF elections
Message-ID: <YeI7BqF/D3lYHMn+@heinlein>
References: <YdiCUiwh1iD4ycr8@heinlein>
 <YeH2OHImO/oRgkjN@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZTYpAoFjFT90zekQ"
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


--ZTYpAoFjFT90zekQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 14, 2022 at 04:16:24PM -0600, Patrick Williams wrote:
> On Fri, Jan 07, 2022 at 12:11:30PM -0600, Patrick Williams wrote:
> The official list of eligible voters for this half has been accepted by t=
he TOF
> and is published here:
>=20
> https://github.com/openbmc/tof-election/blob/b0fcea13c5433a06c6a01b32e270=
83e7cb74420c/2022H1/rollcall.json

Someone found a bug in the script that I used to generate the points from
Gerrit, which caused us to under-count commits.  The result of fixing this =
is
that more people qualified for the election than originally published.

An unofficial list is now published here:
https://github.com/openbmc/tof-election/blob/c50f5beea2be92806cebad57486474=
c7dabecef2/2022H1/rollcall.json

The TOF will need to re-vote in order to make this the new official list.

The [likely] qualified individuals are now:
[ AshwiniC777, FighterNan, Howitzer105mm, IsaacPK, JinFuLin, Kostr, Krellan,
  Pavithrab7, PlotCondor, PriyangaRamasamy, RameshIyyar, RashmicaG, Spencer=
Ku,
  SrideviRamesh, Srisuk, SunnySrivastava1984, SurenNeware, ZhikuiRen, aahme=
d-2,
  adathatri, alatarum, amboar, anoo1, anvesh001, bentyner, bjwyman, bradbis=
hop,
  brandonkimbk, chalapathivenkataramashetty, cjcain, derick-montague,
  dheerajpdsk, dhruvibm, dixsie, drakedog2008, eddiejames, edtanous,
  geissonator, georgehung1210, gkeishin, gokulsvg, gtmills, jaypadath, jebr=
224,
  jmbills, johnwedig, jonathan-doman, jwludzik, kazmierczak-lukasz, krzyszt=
of-i,
  lxwinspur, manojkiraneda, meghagn12345, mikecgithub, mine260309, msbarth,
  ojayanth, patelabhishek9893, paulfertser, peterp-ibm, prkatti1, pstrinkle,
  rahulmah, ratagupt, raviteja-b, sagisin, sampmisr, sandeepasingh116,
  santoshpuranik, sbteeks, sdompke, shrsuman123, smccarney, spinler, sumbha=
t90,
  sunharis, sushmm99, susilsi7, tomjoseph83, tonylee79, vijaykhemka, vishwa=
bmc,
  vmauery, wak-google, williamspatrick, wltu, wrightjl1, ya-mouse,
  yoshiemuranaka, zane131, zevweiss ]

--=20
Patrick Williams

--ZTYpAoFjFT90zekQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmHiOwQACgkQqwNHzC0A
wRliZA/+Mju3zzTRRG7cv+7A1GPgjTcAlVJctPKiGUVM0o3OB6UFUlOem7YJ++1w
dP9D661Rph1vUwwD2RIW6Epl/TGfctucmc9oOk9/zIZ1cu5/nJ61tlaeZZttDo8Z
jaj6u2pSmqoY3sMmI2iPdtjo3IK4VqBzcvY+/Oe/sVZnX62FbXLk31z7OWD9OAk3
t+G3iH8ismcwbxqhetobM/lmr/uoLJfJhmRG9FqWuZUQ4sWDhhHj6dVVNaNO9JVj
Bm3qI/pQobNMVc6vD0AQ+I2O+zMY1ttD/DGRGgWfNDC+gajSH96tP1WR96b9CCtr
DZP61H0KnePVH3rEnAV4WUpeT7LDiW603QiRCQvTKXGKnfhqbk5xTNqSnJmarUQ4
rIhm8y6SzHgU+Uyi2Ql/xtVHDggNLDQ1WU0LX2tEeMKZoI2F7apBt4xv1wrYJgmb
zGZLGzcC1psiSiG0Qm6FxZp+O1Yiqh6ul3p8qXcfcrAuQSKaqjoaM53UMX3CfE9N
ilIYiYwdzvkxTc51LV8z+qDCQ9PkUKfowpf5aW/wiG7GdoPXRoYpdRurnQIR+I0C
9nw0FXoT2b1m0vWUTB4AuBPlnH+K6I3EW3/49lUOeSqOD9gPepDyDM8SXXQlW4K5
1AiMMIp+fjiWne5hB+IjC8KlYWbHSHqaFk3zsgZdDdRTavS18zI=
=NDb8
-----END PGP SIGNATURE-----

--ZTYpAoFjFT90zekQ--
