Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4A825DFDA
	for <lists+openbmc@lfdr.de>; Fri,  4 Sep 2020 18:35:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bjjw52lpTzDqtN
	for <lists+openbmc@lfdr.de>; Sat,  5 Sep 2020 02:35:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=QWc8LHPA; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=U+zvRV3W; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bjjv46DcQzDqlR
 for <openbmc@lists.ozlabs.org>; Sat,  5 Sep 2020 02:34:39 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id A6975A64;
 Fri,  4 Sep 2020 12:34:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Fri, 04 Sep 2020 12:34:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=t6b7g54ut622LwLECR1kn1WnA88
 y8JFVsbY9FhZrd94=; b=QWc8LHPAForXNkgCOUCLWbe+hnPNls3wSfZcvcjRGSZ
 QWDvX6tgFg22NVP3JewS7r7ZtIcfzrcSTZtplhK+/gCUyfcQP2fs/0XZE45gXrvv
 +poGBhX1tZSKD2WlS/WFHdCMgFjBhwA2YhfOizEirRkUiV273VEaP8v/030KrL+M
 or3AuUmj1EI8wAiLmPjIWU0hzaElNRiyVx5v1FfMzoM75AFeHAosNOMuxCjfE0az
 UJk1JWO5zwjH/vjp/Fc8AiVjkHdjpDX8OANV18v5xqzX63C3vh8IC4qev+Ca4y+2
 ZO8gLlGLzEfIkgcqvD34cS3ZdRe6NHrjtRaV++Kvwzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=t6b7g5
 4ut622LwLECR1kn1WnA88y8JFVsbY9FhZrd94=; b=U+zvRV3W/CaRVae6LLx5Y1
 xTfnbWDaUuZ7qyKC64vSC54QEyioQ86Ecek8Ye60nIItOEMHO40iUBCuVSXZksph
 P5cbpe9PVivqjWAud/muy6QCQKqkBSOrYeVuaQ+A50PhKbuT6xk21d92jgJEnrhE
 IMIPhol8aeVtqb+D9x29lLHg95/o0qmYgaVEvMZnVeR0/pa5HbqUQv0GhLzfJivE
 4gferVaydrlc/KRCAkr10dhXnp1uvg1ci9zYnMxfnD7HRLRdr2PLPesC3WhpBauS
 2qWw9izXK24rbl613M7KJ/Hk2V5QFncwIJm5N6vxV553Ue0aYe7ahGhUAVDrlJHA
 ==
X-ME-Sender: <xms:mGxSX4mDGkPIsZqGgEm1VXdaSd355LnZalpXaOtuEuOYFlOScj3SXQ>
 <xme:mGxSX30zubxVY7UHO7b5SZ1nC93RpWNbFydury-IIBenK70J71ctWd_Q8BHiQq_ZD
 2Gp0wMAU_EUM3JL4Cs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegfedguddtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpedvfeelkedtleejhfeitdduhfev
 iedujeelheektefgieefiedtjeegvdeggfffffenucffohhmrghinhepohiilhgrsghsrd
 horhhgnecukfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:mGxSX2qSuZPLv4tiSTWa8IHtwqhtwMTxXs1aWfgiTgxmAROylmnBuA>
 <xmx:mGxSX0n_KcqIaZ1WqlYCdW-kJUwwVJO4vfhYY6s1goPJE3-f7pA80g>
 <xmx:mGxSX20MzbBelrFKjEgDr_e4y7Jk2DRP_rSgfhY5HcDB1o90PUrKGQ>
 <xmx:mWxSX7_SenQBuLIQ6fCnO1rHGSW5wDEIjcmfBACfjkUQ2L0QNWutZg>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id D9C10306005C;
 Fri,  4 Sep 2020 12:34:31 -0400 (EDT)
Date: Fri, 4 Sep 2020 11:34:30 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: Re: PECI patchset status
Message-ID: <20200904163430.GA3532@heinlein>
References: <CACPK8XddFvszC1daDKTtqwkE-XDfB7uYFP_H4HZXNUxvNHUaqw@mail.gmail.com>
 <DM5PR11MB188419A3302F33CE6FE80740902C0@DM5PR11MB1884.namprd11.prod.outlook.com>
 <20200903152753.GA57949@patrickw3-mbp.lan.stwcx.xyz>
 <20200903171556.GA32795@mauery.jf.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="q5wOvoHkaccQRDme"
Content-Disposition: inline
In-Reply-To: <20200903171556.GA32795@mauery.jf.intel.com>
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


--q5wOvoHkaccQRDme
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2020 at 10:15:56AM -0700, Vernon Mauery wrote:
> On 03-Sep-2020 10:27 AM, Patrick Williams wrote:
> >On Thu, Sep 03, 2020 at 05:57:48AM +0000, Mihm, James wrote:
> >Rather than create a separate fork of the kernel, is there something
> >that could be done here to have someone from Intel work with Joel on
> >preparing the patches?  When a new kernel comes out, Joel can ensure it
> >works on the base AST2xxx system design and before we move all the
> >systems to it, someone from Intel can rebase the non-upstreamed patches
> >they are carrying?  This hopefully reduces some of the burden on Joel
> >and stops us from further fragmenting the community.
>=20
> Keep in mind that Intel does not plan to keep the fork around=20
> indefinitely. The hope is to fully upstream all of the patches that we=20
> have outstanding. Our intention is not to fragment the community, but to=
=20
> provide a mechanism to continue to move forward while still providing a=
=20
> way for other users to build the intel-platforms target.
>=20
> As an added feature, having our full kernel source in a publicly=20
> available tree will allow us to upstream more features that depend on=20
> kernel support that is not currently available.

I'm not really following this last paragraph.  I suppose you're saying
that you have kernel changes that are not in openbmc/linux that add
additional features?  Why aren't they in openbmc/linux?  I thought there
was a process for getting code in that isn't quite ready for
upstreaming, as long as there is progress towards that?  Is there some
list of what these features are and what the upstreaming state is,
because this original thread was about PECI, but you're implying there
is much more.

If the process isn't working for the community shouldn't we discuss
improving that to something that does work?  It seems like your team has
decided to go to the nuclear option of forking after Joel has proposed
dropping a patchset that he's been carrying for three months short of
three years.

Joel does great work of keeping the kernel up to date, both on a major
release and picking up supplemental fixes.  Is Intel committing to this
same level of support that Joel is currently providing for your own
fork?

Past performance doesn't really give me a lot of confidence that this
will be a short-term fork.  In December 2019, Joel raised this exact
same problem with the PECI driver[1] and it was promised that there
would be forward progress "within a week"[2].  One week later, there was
a v11 of the patches posted[3] and we got some good comments from a
variety of upstream maintainers.  Since then, there has been zero
activity.  Shouldn't we have seen a v12 pretty quickly after that?

1. https://lists.ozlabs.org/pipermail/openbmc/2019-December/019684.html
2. https://lists.ozlabs.org/pipermail/openbmc/2019-December/019728.html
3. https://lists.ozlabs.org/pipermail/openbmc/2019-December/019823.html

--=20
Patrick Williams

--q5wOvoHkaccQRDme
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9SbJQACgkQqwNHzC0A
wRlBXA//YQhJ0/9LXPNmV+dEUoAiGKCcF1N/RW0yNpfWd3yKVrBaS1FDfaTNZqTD
2iXfCED3Qh33LCy696mWoi4y1cQYYcqzfggnNacrmiuXKEvKF76aXOZ2IUzHO1Um
O0btO5mMLvcw5lp9pzjSOoUjwXqcvEb6xWJ8MngIp6RpPhY1sipm0geoQf/yxNvr
iNWEAA15RKq6g9bkNFU5TwSQKJT7zuoaonOlMEufGRYXZ3q3lhHpm3BOXvkwxtci
eHz8q2PdJKYwzHv7Rzi2auYsNqvbFGX4ytEF25IyHrg51iPsLpNkqA3kDDdiYL6r
z7BQa7AdIHQK312RwBxHMmMz6m87LBMT2Bm96tyzGfdkC+0eyxMYx+gb+TjYiKsP
bUcuTauORrAfne3zq/QCPBtn1L39RcxHfVop27uWwSytrSnnbFMdFe+9ZpZ6STjR
MFKsyLQPPati9etRhJbSEW+r2d8FwnFMJm/PdlRkFafR/vrRjeQ6ZT912eUP3tN5
0WM7Q+/A+VpmVZJpbcxtYbcg5Oo1vAx0fxJKTe7mMbI/w3s7COtozEROR6f99RkO
AuxI4qoHlmV3JXJnPDpuuiEqA7TAoP3wxI+oYsjTQ06uHY3FIKDLFWRuCt2w0ryA
rVzYxLr42ve7Zmo7CljroSxQTgp0WahD/P0Z0KmDy3bPsc28yUg=
=00xW
-----END PGP SIGNATURE-----

--q5wOvoHkaccQRDme--
