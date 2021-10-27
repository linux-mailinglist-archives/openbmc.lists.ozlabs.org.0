Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D359D43CCE9
	for <lists+openbmc@lfdr.de>; Wed, 27 Oct 2021 17:01:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfX2q5CmJz30JT
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 02:01:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=rIQVpX4U;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=bs1rTwPK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=rIQVpX4U; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=bs1rTwPK; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfX2H706Xz2yHP
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 02:01:10 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 1D7913201DCC
 for <openbmc@lists.ozlabs.org>; Wed, 27 Oct 2021 11:01:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 27 Oct 2021 11:01:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:mime-version:content-type; s=
 fm3; bh=plo6fa9QEiYJJKgTPKHdqaKiEJp/4rZwKVQl50P0dD4=; b=rIQVpX4U
 nXQhc06UXU7ddCw6LwIZgrWrLZ2eMwy4aaxRx5miYzyGQ1t9wjSvPPwqc/b7v47N
 2qf++5gXX+dNa0zqftuHHcgEEF90/iQnWqH5zaICnyaXtf1NR6CuHZoSdJv1lNiV
 tqY9qdZ0npb0gzweMZ5RIjhF8lrXDKTgmKeyeDgtV1u2+q6tZ/0a6WxDDdhreYA2
 xMH2PfmfoG4jpgVvu7YrzXwRZIE3I11kwoCT/0n0fZNeCaPjokEgVh8NcJsJCdkE
 S1I7Sb5SE9O771PVlEMBL8Jcvqaru/u2+fz76FUGoRWDmluTwGalvY7mV1ZOtpvD
 1tLE/Y7mfj7s2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=plo6fa9QEiYJJKgTPKHdqaKiEJp/4
 rZwKVQl50P0dD4=; b=bs1rTwPKrjcZcx3B7on6Q3zn4rnK3etEbg1P6wX79c4Lu
 7KrzBF/gbCqqVhUQ2WXbnJJzEXQjqSko0bDgvtkWRUzvQJoBK+Pyr3G0uWWtcsiO
 DgJkF0WPBbhOoNatTVArsuvIuV0EEQPlhgVbSHmLzGwGtx+rnelPVRPrc8xeIUpa
 SRE0yyB3FCIN+rt/nCwuUuA7Yr8XQ2EO6pT0MObwNULLD7cLOaTgrWYo9HhqznnI
 JTk6HbT5Cab9NLlpwlkf04rqRQzKt7EB1D21RuugCRpG9JTeXxpTS74l52U/Kg5R
 f3C/lE5FlKkJqABw7zGiGD+zq7Yc6qawW2JGy8vbQ==
X-ME-Sender: <xms:sml5YeYFAtjwxh4IP1g2aZHBim0Q3X7c_pPPmCEnN3LnfDHto_yaNQ>
 <xme:sml5YRZDJ_bNXhCSiosOR3Xz8AXKZ8NgBkSu008gxQH7gE89FJ7DYpnAjIy4cSjoS
 DtjVTvcsrCFFRCVsAs>
X-ME-Received: <xmr:sml5YY-spfisKPeocVaIWtqJlhMCdFkXzZpgs6iM13iM2cE3gZr8q_935HRHAwkxcdOA0IXB99TQ4gEO4nJ-b7F1WJEz3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkgggtugesghdtroertddtvden
 ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
 gtgidrgiihiieqnecuggftrfgrthhtvghrnhepfffhhedtueehveekjefhkeefjeefvedv
 geeuhffgveegieefuefhudeijefhueejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrgh
 dpghhithhhuhgsrdgtohhmpdhophgvnhgsmhgtqdhprhhojhgvtghtrdighiiipdhfohhr
 mhgrthdqtghouggvrdhshhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:sml5YQpfShINMBK7-o3eS6BmxiGdl6V1NbeZ4OFg-O35DB7jy1oyqg>
 <xmx:sml5YZo3iSAbifQVtmt7UziFyAIzoWBxcGK4jBIg2xQV0NCOAkui_A>
 <xmx:sml5YeSkP3FjmIreltyRCh0rwcxqALwY1teyPlmCUfTI2Kbne0nVhw>
 <xmx:sml5YbGCrOm9-prm2MrlJ4N8l8fU-ZA_sy-4AxBOmCuRXHAEoUeakw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Wed, 27 Oct 2021 11:01:06 -0400 (EDT)
Date: Wed, 27 Oct 2021 10:01:04 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Additional linting in meta-layer repotest
Message-ID: <YXlpsDxZGsbvgHpQ@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qQa5MVeMJePV5OlP"
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


--qQa5MVeMJePV5OlP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

Ed recently added a test-phase called 'repotest'[1,2] in the openbmc/openbmc
repository that allows us to perform sanity checking on commits at that lev=
el
beyond a simple "does this compile".  The initial checking he added was to
ensure that no new patches are added to the tree (in violation of our meta-=
layer
coding guidelines).

I'm adding[3] additional capabilities to this script to enable linting in t=
he
repository.  This will run `shellcheck` for shell scripts and `eslint` for =
JSON
(Some might be unaware that Manoj added JSON linting with `eslint` as part =
of
our normal unit-test / formatting scripts[4] as well).  Once this is in pla=
ce
new commits will fail CI if they add new shellscripts that violate `shellch=
eck`
rules or JSON with invalid parsing.

Currently, there is quite an extensive list of 'exempted' scripts (~100) wh=
ich
already fail `shellcheck` rules.  It is quite likely that some of these are
real bugs, so I would strongly urge if you are the maintainer of one of the
meta-layers holding an 'exempted' script that you look over the `shellcheck`
failures.  Hopefully over the next few months we will greatly reduce the nu=
mber
of scripts in this exemption list by cleaning up the issues.

1. https://lore.kernel.org/openbmc/CAH2-KxDe6hR1V-Lz1k8cdD11jEquy4UhR4LfLhg=
37E5EG42EJg@mail.gmail.com/
2. https://github.com/openbmc/openbmc/blob/master/meta-phosphor/scripts/run=
-repotest
3. https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/48349
4. https://github.com/openbmc/openbmc-build-scripts/blob/master/scripts/for=
mat-code.sh#L31
--=20
Patrick Williams

--qQa5MVeMJePV5OlP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmF5aa4ACgkQqwNHzC0A
wRmAMRAAlq3VlRqk7UJQQh2uRrUnSyaF5FcBOOSYvjvLW8AyStl/J0102PWr+OpX
6Yl1Py9WGjyc2HnPN5fYmKwA/wa+y19spndorh8iKgkzSR7UN7y3r0S+F2Ld/WNE
sClOuLEA8ZNbesLotUBI5+NUg1gmtU2brjrgEixk/rhybsKkLubH+jH9tCbXrecn
K+IJkG0RxDCIAUgSfZZvZq4IY0a/+78xuVCH81va+pv8HgsCWeWfps1Ib7POZWOC
Q/4t7Fzy/aZZNfPMPdp9JH0EWcMEfiT1VG7GydlEK8Rz3sp47r7enp0zdP+T4h0R
pcQGDxPoMvLCJ+hLs4fs4i1iJWgc7nJcbbIrcHe+fFo4irVoXvMGl9yJUsXVcohp
EzP939mCwqG3dGi4mj+Du62KNUffbSfsjO1cprgGuHbx8rx/fl63MdGyRfEIMH1+
dgz3u3YswylBTJTRIispbuysZnX/HpuIwyscWsi7pbM5pKvEj1nQKUHxVuZGs49L
zVpCX4CviHgs59amv4EGiET0VKYUmu0TV1cFlIojafKXpq1nqYAFCBDMYe5ZDH+6
qfYgF4YHdLgC8ORx572e/DE3Y256GlN99SMeXDWVFgdhxrPAAi5N5LDwkv81L0Kc
G/HqjePToTBqACAoRZZd5tSN9Pe48UKAKlefrCuQgl6lF5EIbGQ=
=w96E
-----END PGP SIGNATURE-----

--qQa5MVeMJePV5OlP--
