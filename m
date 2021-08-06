Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3B23E2C67
	for <lists+openbmc@lfdr.de>; Fri,  6 Aug 2021 16:20:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gh7160BN2z3cmf
	for <lists+openbmc@lfdr.de>; Sat,  7 Aug 2021 00:20:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=g8fqoQ7E;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=nBqJFvod;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=g8fqoQ7E; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=nBqJFvod; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gh70l55wBz308b
 for <openbmc@lists.ozlabs.org>; Sat,  7 Aug 2021 00:20:06 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 2390B5C0056
 for <openbmc@lists.ozlabs.org>; Fri,  6 Aug 2021 10:20:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 06 Aug 2021 10:20:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:mime-version:content-type; s=
 fm2; bh=CvxKrhx/D5JnxB+owfGp/Il+oNMIEqNflhkRiJtAGIs=; b=g8fqoQ7E
 I1LHMryFfzt/9Ds+jc2b96Z+v+38BAEO7BSsfaX4dOK//ttGP2lu4P8VEEEgQMt0
 zqebCmZhkeYVY8BC+9n4jbcKVH5DGze/kAkicUSYAycBi4zQzkKt8mmQWIrvcYGD
 0NTgix48TjRmg3hpHyG7qXkQXNee7/NDIUXYL9LAXKIxsNXzT0vZ/MIr4JzL4hR+
 zIb3JvChXSJKwoBHcZO1a8Ixylu4augAQ9mQa41FsfLxBWK1Bvp876oO7Sn5IcHk
 pDACRphc1GZ7odW9gVYBwBjiI+M5ZbgNAo6/tWi3n+1vKY6BmbEI+tgDv3OUatUs
 4Z638ArXE/8IHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=CvxKrhx/D5JnxB+owfGp/Il+oNMIE
 qNflhkRiJtAGIs=; b=nBqJFvod+7evC1l7gKFsyL8brF7xZV/zzUqXyLsFAn0sO
 DRBcnChL3cmvW+s3ekt0wlOq7s9+DYm1vOiLuMMXZtPX2Wbs1tIq7N3xsLr1wcFo
 guTNHrGoxZyZKbSZgTPv2jr5rjHbJo1SPDUXVKaFPhbc73zuJW0uot79Jek58PKj
 lz/GXxaFm/RPDdF1edTOmBNs3Gr0cY9FbHXD5lKW3W0HpmmHBI78eG1iKBPlkHF0
 IuSMTt1aOwIynNb1HhLcNQjHh08zy0tE9PbHtdo2vRakmObO15DpsSkuNZXu2iU9
 hjXXsjzW8OJ1wAb4HXIS7NYaCL2gyz++kf/utunog==
X-ME-Sender: <xms:EUUNYQJqOm9ufY4iGdUzt03p670d_Qx_nfxxYEusjD8vEfTr_w7FkQ>
 <xme:EUUNYQIL65TIWL9MemQlHQVpzKEBcUgleNcg6LM0Vujha2VhwU8cWpp8DpO3WMoQ8
 E4FFyeRbZ5TE1BlgiA>
X-ME-Received: <xmr:EUUNYQvUL222KBU2LuWeG4oPfgO31akrdof7PnK8n01WxsgP2efN9fzqD_NxdNofC3_WXGTHgkL0ZN5AdftLOFqA1UL9iqvFRr_R9Sm5Jg3VXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjedugdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfggtggusehgtderredttddvnecu
 hfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsthiftg
 igrdighiiiqeenucggtffrrghtthgvrhhnpefffeejtdelhefgvdeufeeiudffjeelteeh
 tefgkefhkeegffduudelgfelvdevffenucffohhmrghinhephihotghtohhprhhojhgvtg
 htrdhorhhgpdgtohhnvhgvrhhtqdhovhgvrhhrihguvghsrdhphienucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftg
 igrdighiii
X-ME-Proxy: <xmx:EUUNYdaW5r5rLcdNtW2_lBzfV4sCeXt0yzFeJ_tPTg3qG3IEwrGEpA>
 <xmx:EUUNYXZBPlHGziem4Aw0y_n3_Q15RKUlFiriaW18QD3JY5W1oAehQg>
 <xmx:EUUNYZB_ALSx5v249LeML9DfsY9o5hxbGQoG_dNA9jCd7_hCMSVpyg>
 <xmx:EkUNYR3cMHMCzimQYFiuc2903Qqi369xE4BsDs5x5XtBjIKya0ffcA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Fri, 6 Aug 2021 10:20:01 -0400 (EDT)
Date: Fri, 6 Aug 2021 09:19:59 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Yocto override syntax change.
Message-ID: <YQ1FD5q8KbhbXVBK@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="A9XefBiJmPFF/h3m"
Content-Disposition: inline
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


--A9XefBiJmPFF/h3m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

TL;DR: There is a required change to all meta-layers by Wednesday August 11,
2021 at 1PM UTC.  Any meta-layer not changed by that time may no longer com=
pile.



There is a major change to the upstream Yocto syntax that requires use to d=
o a
modification to the majority of our recipes and Yocto config files.  We wil=
l not
be able to perform another Yocto upgrade until this work is complete on our
part.

Yocto has an override syntax that is often used for machine and distro-spec=
ific
variable modification.  The previous syntax was something like:

    PACKAGECONFIG_append_machine =3D " pkgfeature"

This is being changed so that colons are used as override separators instea=
d of
underscores:

    PACKAGECONFIG:append:machine =3D " pkgfeature"

In the current bitbake we have in master there is support for both syntaxes,
because the code simply does a `s/:/_/` in variable processing, but the next
bitbake/Yocto pull will remove support for the underscore syntax and all us=
age
of it will be broken.  Again, until we make this change, we cannot pick up
Yocto updates because our current override syntax usage is no longer suppor=
ted.

Upstream has provided a script to help facilitate this transition but I am
finding that it does not catch every case and some additional help is neede=
d.

---- Fix-up procedure and tips ----

The helper script is in the `poky` repository at:
    scripts/contrib/convert-overrides.py

This can be obtained either by cloning or downloading directly:
    $ git clone git://git.yoctoproject.org/poky
    $ wget https://git.yoctoproject.org/cgit/cgit.cgi/poky/plain/scripts/co=
ntrib/convert-overrides.py

You may then run this on your meta-layer:
    $ path/to/convert-overrides.py meta-evb

After this, to find potential misses run the following grep:
    $ git grep "_[a-z0-9_/-]*[ :]" -- meta-evb

In the meta-evb tree I observed a number of _evb-* and _u-boot* variables w=
ere
missed.  I fixed them like this:
    $ git grep -l _evb -- meta-evb | xargs sed -i 's/_evb/:evb/'
    $ git grep -l _u-boot -- meta-evb | xargs sed -i 's/_u-boot/:u-boot/'

(There were a few other variables fixed up, but hopefully you get the patte=
rn
 after two.)
-----------------------------------

After this you will want to do a build of your machine(s).  I would also
recommend spot checking a few recipes with `bitbake <recipe> -ne` to ensure=
 the
overrides are applied as you expect.



I will be making changes to meta-evb, meta-aspeed, meta-phosphor, and
meta-facebook shortly under the gerrit topic "override-syntax".  Hopefully =
this
gives a sufficient pattern for others to mimic over the next few days.

--=20
Patrick Williams

--A9XefBiJmPFF/h3m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmENRQ0ACgkQqwNHzC0A
wRnlGQ/8C2C2sapZUZXoIDhgK1G/wkKhrowGyMb2a3a0I93C5SAf3I9kbEe+KIiE
lYT1eehjaxX8gc2sgge0ZZlyqDDDgAhJBMB90GFqn7pNtlZw/g0CX03/cCQC6+Uu
QxGO3nPg0AFKJRQKLsRnsEEz3AKmyG7JCVYWOUFBS+XdlD4E/BolhJDZwvU6Tw/G
59VGqnqjuB3vRaPyVTYj6ch6EpiC9JRNAhYiUbvriLBPu8xzozH29usn6P/aNW38
zs8/T2/KyUURwPvw3Aia9iimqKrhRoG4XrDcgcbYfiwgIslini5WKlTFOgBrb20x
AxAm2HUcAmjxRBJFOubivgEJuUULjJTA0O5pJZ3JVWPeb1VksMbWNui/thx9BiAt
8zwYUgS7HW3Lh082Ia9szGGWyL9lPboz7TA5pib/jERyXu5z1JwQ8hcaX7kweKG2
sYTLhsDB1GkgpEhNz4udfsQUtXvLVCnC4jQwJJZdjQ1YM88QjWLSQt9l+Yvej2Gj
UWxsUkr/lLbLga8T7kCrYWIzHN4h/Mh6xSaHDOZfJhyUaY6XVLIKXd9pKyk/xv4s
V/tW6Aj1JepBExTsSLP5W8GKnXSY3kNBDU4mlxiwXoTLOJigETQfnb8BOz9Gm1sz
afT20Hdz+N+mJuwDdWZ30mt6cj6iZC/ovFo/EJ4Lj/AoJ69bfEA=
=jNq1
-----END PGP SIGNATURE-----

--A9XefBiJmPFF/h3m--
