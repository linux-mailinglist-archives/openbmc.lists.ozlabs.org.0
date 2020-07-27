Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC7A22F6C1
	for <lists+openbmc@lfdr.de>; Mon, 27 Jul 2020 19:35:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFn5S2WmNzF0PV
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 03:35:40 +1000 (AEST)
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
 header.s=fm2 header.b=miu5Ys1d; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=KU9MYNtA; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFn471lyQzDr4D
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2020 03:34:31 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id B78145C0211;
 Mon, 27 Jul 2020 13:34:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Mon, 27 Jul 2020 13:34:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=cfEUlx4LLyqmFetTJk2V19I3WTb
 i47j7rJSZfv2CA3M=; b=miu5Ys1dtYu5HjiTdNOgwZTolpFwlw85PeuIseNewdA
 B7/y+5BzzpNLjFUkIDsyk7IQdA5T1FJS9oR+AfDTVEbDUVvTwqv1ShLt4UzdbXd/
 1FyA2oELc3Z9Y8R8U1us9EZ27jvUghv31TPmjTnuqwoO/WmjrsLiOVBBny59fsb7
 qY90faw8wmDrhZH2wpmcrko1rjHz94I/+sx5tvYMWH3EQQHZ3oAjg8IKT64yqS8D
 z8HUzTzd55u2mewGbsKzpba+h1nHxLFSDzd1NTmn7MI9qD9ROClParokjOFnm7N5
 LIonzm5vqABMNhYVStvJpaNLcKWDrpaZt6qfewvkLHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=cfEUlx
 4LLyqmFetTJk2V19I3WTbi47j7rJSZfv2CA3M=; b=KU9MYNtAa4xVVJas7FDVDk
 9dVpQvVqNBc40iEFHjRgxhmRFl265KzQC3VI3ARTLyAY6ZZZDda4yeH7H+/Py3qA
 z+X1hmoNQmEWJvOaoV7u9/TowLViEPaWEHvWb3KU1zYvxU5MAnQpsIeeFKwrIMHE
 Sr0Zxqh9El82NJIcl/nS8lbTeX5jWuDtVO2kVyE5gRI1+rDE2A0hioaA7tAwse3P
 8YddD3PtY9sCvKY+7qt3Bk7361BMXGX7Zwk33eeecHRJYmgIMEmry+htajQjoFiy
 yUZ6Pk2DgaNO0tOw+bOFYAxlWLHdy6CTn+Ub//9dNEeQn3rjV1ElogJfrLUC3Gow
 ==
X-ME-Sender: <xms:JBAfX8buOnj-rbg0pZqTGqaZMwbswiLdzs7gf-GqOtpEMXdLn-xF5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedriedtgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 epgeehheefffegkeevhedthffgudfhgeefgfdthefhkedtleffveekgfeuffehtdeinecu
 kfhppeduieeirddujedvrdduvddurdduudeknecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:JBAfX3aqGz6vWrPpAE2vlN9BX6fEUuN1gI_DX6j3nqJCvg6TSCJ9kA>
 <xmx:JBAfX2_wFb2Wh1-AUVVw3pOodComASRxzeXN9Y2vbMLf737H3Uhgpw>
 <xmx:JBAfX2qFkmXnaVCL2ajPWEeZNfCZF7BvicQGvFmwlONGhCQeqpAdfg>
 <xmx:JBAfX00s1CLPHye4BE1gSkFXpg81oM75Fd6YE657RUAEB56aTAQ3Dg>
Received: from localhost (mobile-166-172-121-118.mycingular.net
 [166.172.121.118])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5EB3D328005D;
 Mon, 27 Jul 2020 13:34:28 -0400 (EDT)
Date: Mon, 27 Jul 2020 12:34:27 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: suresh v <suresh.11v@gmail.com>
Subject: Re: Reg Backplane Inventory Support in Open BMC
Message-ID: <20200727173427.GR3922@heinlein>
References: <CAAO56wvAvc-__MdzQriFt4xze1HMRaToozqGL2ephXuMhYJmnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gV1yUYniiDLxW66s"
Content-Disposition: inline
In-Reply-To: <CAAO56wvAvc-__MdzQriFt4xze1HMRaToozqGL2ephXuMhYJmnA@mail.gmail.com>
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


--gV1yUYniiDLxW66s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2020 at 10:58:36PM +0530, suresh v wrote:
> Hi,
>=20
> I'm Suresh looking for frame work support of backplane inventory via side
> band I2C from base board management controller in Open BMC. If there are
> any support in case, can you please give me some pointers to start of
> looking at it?
>=20
> Thanks,
> Suresh

openbmc/entity-manager has support for reading an I2C EEPROM from the
backplane to discover inventory information.

--=20
Patrick Williams

--gV1yUYniiDLxW66s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl8fECMACgkQqwNHzC0A
wRmnuw/+J6qAo7zp7SNCHMTb87ODczP/Eh2I36YPBokwPy1EmCv+RLrGmrHhE9W4
0WgWAo/H8VdT+nHU9aBS/uJ508cLngCjb+JvorEHE6/Wkc/6+z61cvfdwwPxvCHl
f7rgiEpEr3JMWuaGtD2MUqslMJeGYejfTcP45OI5hNSsLFjyreKHV2D7OAsU7jE+
PKIBaRe4WYzHpNJXmggeBGQ/S7md81ExcoERxJ+xh4GNw33b2TtZt1DQgJxoo4uX
jq5YVW0XM54K7iFLe7Ju4Mmb7KvdH66UIx/dSm+oRmDfyPhqi0H1sjIIYmqyG2bv
TGPcJ1/ibAVepaw8eo+GSmShEqH2hAuy8JUEKZBHYDMMgspYWfpGweHv34R1MoFI
e0zyd2NOifYUZeWIFpxX9J16NmEyM2S9KI9rA+mH1TEX2oRqErHiTWVjgPe9pScO
j+L3M3OXyb6vuyIVIK33KPYw9ZaY9VM/vdA0hxINmTvQstWKr0Qs2QPNarC1nQvB
pAHx+qXloHnfH7wp1zzQdPHSAzhcZ4+6j3ljxH3gjVsP8Ucs+eN226TX7f8XhZLn
tOzEPV2PkC+AvTc8Vxsgge8tqntW2OFWIi3+Z6ISQl/kiUhZfC32qzlDazqUdl8b
yUZVLIuTkzyefibajO6f7GCdtyKlzP9nu+/7ylRppS2xplfa2dA=
=8PJt
-----END PGP SIGNATURE-----

--gV1yUYniiDLxW66s--
