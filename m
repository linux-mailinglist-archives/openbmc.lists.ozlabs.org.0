Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E33744B74B9
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 20:35:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jyrs82YZMz3cQS
	for <lists+openbmc@lfdr.de>; Wed, 16 Feb 2022 06:35:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=VHC6I9jW;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=BmmaV20b;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=VHC6I9jW; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=BmmaV20b; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jyrrj1gVzz3bPX
 for <openbmc@lists.ozlabs.org>; Wed, 16 Feb 2022 06:34:44 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id B4B865C03B2;
 Tue, 15 Feb 2022 14:34:40 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 15 Feb 2022 14:34:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=bralzlmv1e2pGmLTNNldw2BUoXPacmStfwxhfc
 y7hlI=; b=VHC6I9jWPMV43uf0+ktgGJeXF3RGAcJOv2lJzoSm+avOY8NyvbC1U6
 AIVzgMLuNsBiSDCgvdJQFCU0ctpJGGymW1216ZDL0KF5R2NQebvFfJIoi095Dyed
 jf9nK0QJMCI5bTheOqs9DXyLLLWWr6s0gr8C4zU89h64QzEDAT+H1fDFmTmKYwEC
 OSjddgVL0z6C26bNBtaDQaiIOlXj8FVSYK+OXZuc0tG6Xq6JZk8X/qtAZWBMx36A
 +fAf6wzFaUc17eJj5ZymE89MTHmbnhEEunrP+uo1NmoggoiDWZ7xardsRBPKWPk0
 sgwDM3d44M/9DZQVJpAvwbQ0QMdm4eYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=bralzlmv1e2pGmLTN
 Nldw2BUoXPacmStfwxhfcy7hlI=; b=BmmaV20bOCeGO54eeJDa57MIjCEdaUcby
 fZKunBeZ6oO8lLPkdZSfxqKt9Oujy3F/QL+JO6U8ooaom6cDUzHM5E3Pezo3qgdA
 5ZyWP5gj50hTMdY32ZtUx8JLjKve9GlZqZ2BFdcBvx61mIwfIKH3EBoR+qPbtGQh
 UUyxGnzTCcKQ7cv8Q8gN4zADgv/CHeth55nKUIB7MMQmd5vfHmP+dDCpX5vA23FF
 ru2DQiNW0z+TuexnFIlMESv9UVgu622Yux+ytv7zSPoJG274tnCkNuer0eEwyYwO
 COW3kDh9Awp6HRDHLa84YrUTaEWc2FNxkhy4riWj+xgaGlps0wsZw==
X-ME-Sender: <xms:UAAMYnjv-V14ycKI2u6Pn_qx3XD1VTGqVEglxyEEHAIjOIyiXEa0rg>
 <xme:UAAMYkDiJqv3chrhfZzppbsy5unOhiiMEAAPy_QBUMQwt7JYZnP_5gzNm804Ab5iJ
 ZTTkUsjWj_3KET0NMc>
X-ME-Received: <xmr:UAAMYnEtNNlMcvf8PEz4OCKVbRJvxzcBHtFS8miEAXM1EHLYNmrSaMHqDzgIDb8JEQH5KB7xUvE8fSeLqXpm5jHIa1RTGQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjeeggdduvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 eplefhjeefkeetveffgeetffdufeehleefhedvgffgvdfghfejhfefffekieeiveejnecu
 ffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:UAAMYkRLGoOguFymok8qO8ueRc_8SxTvZrW7lm0EQau0omMOjV6Vjg>
 <xmx:UAAMYkzoxAjSf880VvcLXPQMFceTUjY1FOEXLMqivgP7PVkzJ8tmPw>
 <xmx:UAAMYq7MgTNJA9VIE3ZyLshLT60TghETg2gCOmoPKU-XDhprIuWYbg>
 <xmx:UAAMYqYnlVAzKYFHys_s5hKnBRIegue7DTfb4OqziqKI4E_ksRxmTg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Feb 2022 14:34:40 -0500 (EST)
Date: Tue, 15 Feb 2022 13:34:38 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: damon3000 <damon3000@163.com>
Subject: Re: FRU access configuration
Message-ID: <YgwATu32A9FJUHxk@heinlein>
References: <ad1d881.3105.17efb5ed0dc.Coremail.damon3000@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="S1NYLsCf0rrqhDSU"
Content-Disposition: inline
In-Reply-To: <ad1d881.3105.17efb5ed0dc.Coremail.damon3000@163.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--S1NYLsCf0rrqhDSU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 11:13:22AM +0800, damon3000 wrote:
> Hi All,
>=20
> I am new to openbmc. I am started porting openbmc features to new hardwar=
e.
> So, I want to add support for FRUID EEPROM. FRUID contents should be avai=
lable as dbus objects. What changes needs to done in the application side.
>=20
> Please provide the steps or suggestions to follow.

You should probably look at https://github.com/openbmc/entity-manager and
existing systems that leverage it.  There is already support for specifying=
 the
location of your EEPROM and interpreting it / exposing as dbus objects.

'FruDevice' is typically involved in the EEPROM parsing and then there is
entity-manager JSON that exposes specific EEPROM fields as the Inventory
object(s).

--=20
Patrick Williams

--S1NYLsCf0rrqhDSU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmIMAEwACgkQqwNHzC0A
wRlE6A//RWBAQ8yzZBGV8Vzz+F/JEnN1ZFV0DTJ+JLkOSqsgzf2ezcCUMRYksxr0
qGznKTLO5zAxq/j1NOHHbIpkUzRuuudVS6iIYjXUf5YAAxVEo070z6E6j0uxRBhZ
nYidXS5WIsggPwWEOYcKUy8an7wFOuQq1II8Pd/hbxB8pe17mHCEQAOuCngnjgm7
08pd0GLIyn8Ht+VeuH0rPSiUDLliHQZj8SHKphReiYqPL7RPQwfCo/w9iwOVpMLk
OLW5SDfhrGl/l34ydw1A3Zy+NDiUvSTwmtiEQND1T3S0N6jVnZBLK5MgCZACeV9h
L0Mq9bhZEEXph8zCA3oLAOitTOYcVsajhu/K1emR4x3Iy3m71vKxguOcUfJ3Pp0o
QE8NwzyDY9jZ7P03v57tlELE1kuyA8O/Ca/q0Y7k2jlFNCyBa/xREa0Y+8UoivKu
h586jOaJE73U80ZXky/rSD1kph2r7Xwc0s24RSV3rpEN7Ka2Fx61tzOai0EGMYO+
wlooIY9HFSy2vOottvg9z6wpOgMNrwoE4TojeLIV00LtctWALn1CazPxObFoCvfW
sgkb32m7P1i+ZqyrVIWypYGZEKDYsPs95bCSYgxj/JULKhcGx3NY7+cZk3Z8G9e/
Y8VRVD8c5+mXUbXJntRxDI/RLPtWbaKk64vNFdL46vOBUl6vbGU=
=OSk2
-----END PGP SIGNATURE-----

--S1NYLsCf0rrqhDSU--
