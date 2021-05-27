Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FDF392E1A
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 14:36:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrS4M04sQz300X
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 22:36:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=STZkAI+p;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Ij1CjYqr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=STZkAI+p; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Ij1CjYqr; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrS45636Pz2yXv
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 22:36:37 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 772A25C0092;
 Thu, 27 May 2021 08:36:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 27 May 2021 08:36:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=JBnKVOSkkrOAugya7jitmd6Ztoy
 dxzFgMiKzs11+JhI=; b=STZkAI+p7q/gnwM3KiQg1+hENlaBJGaz+RzsYmztu9S
 Akr2nHAYQ6h9bpUVJq2DjbHdsYXAuz8vdv9RALFmLXnfBdDszvR51q5ZAskELbkH
 +0Lr3AdodwB/INt7SMj5mnwafNJkpKUteRRlsaBFAPaCMyrFP/ViKBrhXcLmOtpA
 QZEYy3ZwYxyc847BkRc8TOhpC+RY+M3iaxcTFECVqbofJtkX5DWYBwHWM0Ce72EJ
 gWQ/Wf5qQsoNjocHDBKZti2BIkqvBOsUDQD+KEXU5CiWpkwfC2kNr7wY3N4Xt/MU
 K25WWumG+TOYOExxdhjLLGTeWT4KLjtn/etBdbEQjAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=JBnKVO
 SkkrOAugya7jitmd6ZtoydxzFgMiKzs11+JhI=; b=Ij1CjYqr/f3fYMRv11qSoF
 YJ8A7rpmUrCJFlN6rT1ii4m6xBFu/t2p4jqB02oVJgYj1H0RWJFXxy1K0ITG0vgg
 vmC1a0JxC/wR5sGRu3PDIKDpPgnDI5OuYRTlq1JZ9dQM59d+jBdfYfGzZvwwVO1h
 3jqJI6zl7TfxtNP571My4yY1bxrZaubvJPJJJV96JIObVnU/aPn9cha2wTPwARIj
 KhfqoAMmkbx1NXf2/3ejnvfl1AZ+kd6bB6wdlOVi+9KB0UPZixHBzQ4KT3KULCTx
 3PBq0CSAgaNwhjFdaaIYWwfYaIX2mLunE/70H6FQ0rO94yiqsdTk1UvN3g+kzniA
 ==
X-ME-Sender: <xms:UpKvYD7QfIr42_NjfUOno29QaWhHPYSP-bhE2M3Ehf-Hjk2JrV9jJA>
 <xme:UpKvYI56Wh80fwVV9UNhzTNk8i9XzP5s9RWOKZEHDuPnd0PUsBPEcYPFwGyc0Luy5
 o7IZIALwK2-Ay_m5xg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekhedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtudenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 eptdefjeetuedtfeelfeeiieevveekgeeuvedtveefiedvhfeiueeugffhkeelvdfhnecu
 kfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:UpKvYKca6rkydkleVu68vYh3JIhvuLsle7qUBIeM161yytKm2hcFrA>
 <xmx:UpKvYELPdiWEjl6zvQORl8zy4jYnlza8pXNnoSdf5TfJ8y5mxxGgdA>
 <xmx:UpKvYHJP5zq_UpU9-jecot5QlIdcGjf-pddtdscI0yyP8avdQkM78w>
 <xmx:U5KvYJxFKxkQkMgnrrB0jBwNUnmy1enBgagktVolhLK2BHgbCHEf0Q>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 27 May 2021 08:36:34 -0400 (EDT)
Date: Thu, 27 May 2021 07:36:33 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Jeff <ckimchan17@gmail.com>
Subject: Re: How to submit meta subfolder
Message-ID: <YK+SUUXRcek2KzBv@heinlein>
References: <fd2a0d0e-988c-8bab-aedd-1253ba7042ef@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AmYXCY6v5ilh9nIU"
Content-Disposition: inline
In-Reply-To: <fd2a0d0e-988c-8bab-aedd-1253ba7042ef@gmail.com>
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
Cc: openbmc@lists.ozlabs.org, jeff9_chan@asrockrack.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--AmYXCY6v5ilh9nIU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 27, 2021 at 01:04:37PM +0800, Jeff wrote:
> Hi,
>=20
> We would like to submit meta-asrockrack as a sub folder of openbmc.
>=20
> I followed the steps describe in the document to add remote server:
>  =A0=A0=A0=A0 git remote add gerrit ssh://openbmc.gerrit/openbmc/meta-asr=
ockrack

Which document is this?

Previously you had to request a meta-layer repository be created but
about 4-6 months ago we moved to a model where all layer code is in the
single openbmc/openbmc repository.  We may have missed a documentation
update somewhere.

> when I tried to push it I got below error:
>  =A0=A0=A0 fatal: project openbmc/mata-asrockrack not found
>  =A0=A0=A0 fatal: Could not read from remote repository.
>=20
>  =A0=A0=A0 Please make sure you have the correct access rights
>  =A0=A0=A0 and the repository exists.

You'll want to set your remote to ssh://openbmc.gerrit/openbmc/openbmc
and push there.  Ideally you would have originally cloned from there and
done your work on that repository.

--=20
Patrick Williams

--AmYXCY6v5ilh9nIU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmCvklAACgkQqwNHzC0A
wRnqyg/+OFllsxUWGek9kYYhKjHI6+dexPespFVIvLFznZ+AJaw4WeOnbM00759H
qksi6DEE3Ofp62aGnYfiJVjk5LXUcrik/K/nZBKLdThKbBJkXR5EhEqx1ofKyiE6
DUDxrfNZ3A72NxRo0JL/Egm1sOq0nI32eyZI2cwnn57O9fxVMA0N2IeOwr/VFm6t
a+Fizjqhw5RgGae2IRgjPO8Yo4nhas5FB5WQibbKQ0lFanzVhSVv0M9czSYlzXPe
r/CKjWBzD6tgh/mkJLiDVhWGEl6Axen4APlhAc1YLrkYCg548uPrP2Vqt0EQ/v1l
XIoHHS3nOzNQAkGoLEnPha2kfYgMeDOEr5J9iiu4CYnefrgxKq1cWs4wuCGClMm5
1hZLTUzBtWqsLQ559IczrYAaMhRq9BiP4f34dWXR13ZFrpzc56r6v077lr0JxHYC
FnozlVLTzJhrHjltibDs6Zf2TB4h7ajIEPvvUy2xmWNPm4Y/ytBEe9Gv7F0HyD6M
WtCg4IyATN1hWSQ/G20lOwrayHK/2yNMFhN23fPAqRS3dmVaywkg4oLt9onnMIjF
EvOFK13kIu+KfpmoBLM6YJq9wx+HfNMAfaldOS6tu3c6NjClKcfy+AmHSUz7mgLk
44lQPbfKtYAZNWwB+nqGFC9BJc/fBzJ1P2nDTb1CoRqiNnS0FJ4=
=7eOM
-----END PGP SIGNATURE-----

--AmYXCY6v5ilh9nIU--
