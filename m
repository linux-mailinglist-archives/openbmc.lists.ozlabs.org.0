Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D365819B875
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 00:34:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48t1G10dDkzDqgk
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 09:34:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=sVq7/o0f; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=NCY6t+9C; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48t1FJ27v4zDqkG
 for <openbmc@lists.ozlabs.org>; Thu,  2 Apr 2020 09:33:39 +1100 (AEDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 6619E5C034D
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 18:33:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 01 Apr 2020 18:33:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=NhdWtWSFmrzHmzn7Oos+23ebYzd
 q1DnrjJuZG3ff3XY=; b=sVq7/o0f6wgZNwfVJKK7Coz9Umb52SF7/QJxYsIX1KV
 4735+FNxDZxdhOvChF8xvrFmPrpzHRi15dn7glmuruWOV+966xM3YZcpD2Fnx56w
 RhvglpnVJkmYQx8oucqDbqmJMtiegZE1bEjwoPDFDyti9Uv/VfDnQn2WUWGouf9g
 EWldy7Y+u65+L+2uti+SyJMgPI9BGu7GGv3MahZRNO0Py2AGqaKRfcJkCM/Ga1cz
 5Dh3RqtyVBruzzZg7KTPlZ76KF7/S/DVrVQ1NPrAh2exnQg9c29LQM82UrwblV8i
 p8T0TG2E4HMh/3uUG7CGpAhWDi+ZN9WVxBZDwK2Qlcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=NhdWtW
 SFmrzHmzn7Oos+23ebYzdq1DnrjJuZG3ff3XY=; b=NCY6t+9CP85dnOn/REaLxf
 4pxURGs3HSDhvMBioBKJ2ZGm8wJ6SEpDAV8AN7jh7K/mMdJUAFLV7bvEDqlZqRHv
 scmaCeQWstNSe46Unr/vBEs1o53yLWN3QnbGaVPLNynP7ao7tj7zaPZcqTwBrFLC
 N3NEk0u6t2n6EX78LUGlqgYZF0TcS0nS292jhvTn9h/raUTH08WEia40LAcBscdh
 Ltrm9TySGZwYMJrYhNg/l7YSiDAeqsSCkf3NDQS6QU9ElUTUfmCSx6BisvAA1kWT
 VRyo2s6mFWfLX/JDlmDS6pHDlms1PsIrCnsI5RQPX+hQ7uUyFkpNsZEr/5fCMZsw
 ==
X-ME-Sender: <xms:vxaFXrWxB80qt8dasHDEonwI00VA_V5c2yXsdEzW-EA-sE4t5hxBcg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrtdefgdduudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdejtddmnecujfgurhepfffhvf
 fukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhi
 rghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucfkphepjeeirddvhedtrd
 ekgedrvdefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:vxaFXoyPSy8wCeoLPj29GSP_EArxyiO8Qyn5hxWqBp898ZUDESlFCg>
 <xmx:vxaFXqxunuKHlDuLa28MpghHZYz5aKB21Kv_UOTuwDiWOQbleGpstA>
 <xmx:vxaFXl3mkaEnsEZFKMqJZw0CLT-v8MkuOx9b5Kg2N-qtYnqFD5u6yA>
 <xmx:vxaFXmD2XQbLeleIZH_BZq4dr99e6kG-5jW2rU7r_xYj_FZrKjs4_Q>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id BD820306CD3A
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 18:33:34 -0400 (EDT)
Date: Wed, 1 Apr 2020 17:33:32 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: meta-inventec MAINTAINERS
Message-ID: <20200401223332.GD580847@heinlein.lan.stwcx.xyz>
References: <20200401222641.GB580847@heinlein.lan.stwcx.xyz>
 <20200401223006.GC580847@heinlein.lan.stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fXStkuK2IQBfcDe+"
Content-Disposition: inline
In-Reply-To: <20200401223006.GC580847@heinlein.lan.stwcx.xyz>
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


--fXStkuK2IQBfcDe+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Similarly, meta-inventec has no MAINTAINERS.

On Wed, Apr 01, 2020 at 05:30:06PM -0500, Patrick Williams wrote:
> Similarly, meta-ingrasys has no MAINTAINERS.
>=20
> On Wed, Apr 01, 2020 at 05:26:41PM -0500, Patrick Williams wrote:
> > Can we get a MAINTAINERS file added for meta-intel?  There isn't one now
> > and I'm not sure who should be added by default for any code reviews to
> > it.
> >=20
> > --=20
> > Patrick Williams
>=20
>=20
>=20
> --=20
> Patrick Williams



--=20
Patrick Williams

--fXStkuK2IQBfcDe+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl6FFrwACgkQqwNHzC0A
wRlr0g/+IrZbuQBs3NheYkSyvtoPmO3QvxpMiVD/y7BtCwYqNETKnBaOhFmkUhyH
RlZ1AKOMMXrCSWl1qMa6jvwlDaxTOo01VoI2bdQg/nAKf/eYa2EyPjfck1QtSe9M
cOGCt1uyQxxT5bzsnUumyZSv9NR2OH9U2g8MymnH54WJl34m3KuQHXxG14QBhCmN
BIx/VyNYapKHV9H7Dmm9tVcTZa407v1lFR0XdP99OMAFqH9OxeGOkdgT+p5p4KyD
FemDXX6KcAAZ95cw3XbMFh0v0bFC40G66d+9nvAif6P60kh00u6j23aVrSmdmwKx
f+w3H6W4H+df5CLN+BtD5i8VUa0+adkcWAu9raenF+ND56eVl3Y5E2pokF17OnJT
9IX39/4q6dSTBBWaLZ8hg4IK1V77q06DAriee/CMqsm3WSzgRxtJu1v30pnJdvDQ
2hA1GvQVvcc334vRbM9UwF2/xtQszTjSAaN33m4zHVspWfzjnWaMXy6qNxqyumSj
K5JqREFfiTSYZTJK485stsSBeXcK0WxQKcivE93YxJVOJz5wrYMQdcHYEqBJTd+f
OUWlLml1kZJW9oF/BjC2FYrtqOYk3mHbVxrEKQeP2UAqtnIXTzSJPI6+Dmw0YR1Q
AgpQCEvbT6zWsiimADV0H4vDpSUXJmX1ES4bg6llRp6w9Wvk140=
=UYmg
-----END PGP SIGNATURE-----

--fXStkuK2IQBfcDe+--
