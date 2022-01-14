Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0554948F25A
	for <lists+openbmc@lfdr.de>; Fri, 14 Jan 2022 23:21:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JbG3t6V5Lz30Lm
	for <lists+openbmc@lfdr.de>; Sat, 15 Jan 2022 09:21:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=Ox+yKpO+;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Aat0n9FF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=Ox+yKpO+; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Aat0n9FF; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JbG3W2wCvz2yP9
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jan 2022 09:21:11 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 7AB8A5C00D3;
 Fri, 14 Jan 2022 17:21:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 14 Jan 2022 17:21:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=fpNf+2maCDXKXCELf691hEToexx
 UiprO1pNJPWew+q4=; b=Ox+yKpO+9dhFx1ofGOHZ/Xg871EO9isdBjOL7YgwPoG
 vHnGhf0vIYPoHMp9DoaZDorntVpgSVkTmlv8K7XUapRWma+QSykkuz6HroPRefoH
 d7KD++DPJbuZZtAXXxwc9mv01FZthYB4EkBtXX17M0uPQt4D7S0iLu6h2KeSvVGx
 nzm9cE8sRNJg7QzB4ffDIGbS2qvbumBkkpLQ+q7TFCLp6jMi9OhVwgs7E1qO/Xev
 5ZCw+LIK/g+l3nWTnYLMw+AUPm/Hafc1IoRkeIpIKJhYCf6kYR7oOiXWFmGK3Hx9
 Oq6ytXS67WUE4ADS7CPiG6KtanZAiQ0OP9FrkngNazw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=fpNf+2
 maCDXKXCELf691hEToexxUiprO1pNJPWew+q4=; b=Aat0n9FFHVqooqIt8UCogm
 iEGDYJeb9MdFAijBMrt+Cp4nCOK4gIiwfoDo+HXO8fi2ALcV3NEN+AjZpRmAyA/J
 y3/h0nEU5SZaGtfKj4TyMZzNX+K9695ApKq3VenrBpDcQyO28SQ2sHriN3r711/E
 urmHm8CL7pYhNfrAgrQ3/ujiTFahZyydNJtIKVvsSNOOOh0YUuJ9L0fh2W0IQO+9
 3q+gyI4LDvv0YK+6Ij7wfR8WeK4LfmMv3kCZEZoeB+S/9GT+jAfky/XTxl/mxT/1
 SOhRCW3nktLbjgm149Yg8t/xLVJsObesxCUkw38vKKXn7XOuWE96pVhSuRCZtipw
 ==
X-ME-Sender: <xms:VffhYT5SxMBTddb-5hnVQVifLu5LQIYkCOP5ZayTu-2YWzM3y6jspA>
 <xme:VffhYY7UmFLmWEWMEeZmoyemsUWgMwkc5GRxchdxlVSuEKHBeJMOR92l_FPSufGdj
 2Y0B7fOR6WzvrrqW2g>
X-ME-Received: <xmr:VffhYadsUoib4Kv7kzhI3a-Ms_rQmx_-M7_nM57jP5VqWLndaJeT9GlK2vl15p74oWnkQfwO68fuiSVpzf6e-bcQj1WjHJSnVPTtdg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdehgdduheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:VffhYUK5jVmlx9az1nB58DS6ZzmxO0KzPD9jJ8eJSk6gkvmv7SGn9w>
 <xmx:VffhYXLx5Lb6Bqji0IhLwLu0rRvnfzAqNe44WVLsbyknDCJeiOb4aQ>
 <xmx:VffhYdzVZYIJFCcZuIVzGL1qiktwMi3_Unijdw0EPtn81k9b6xbbfg>
 <xmx:VffhYf2aaIGbwCFWGcYbqxzEA-tzXLpd2JPUORvo7r7ny1OkSJ0J_w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Jan 2022 17:21:08 -0500 (EST)
Date: Fri, 14 Jan 2022 16:21:07 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Zev Weiss <zweiss@equinix.com>
Subject: Re: Procedure for the send review on u-boot patch
Message-ID: <YeH3UzT4uAwauF7s@heinlein>
References: <CAGpPFEFoTO-cUxvxEnoNQ3YoKBWRK+pOeyGzni6E5Da-=w+stA@mail.gmail.com>
 <CACPK8Xec1P8xF9t8Uj1Fg0YsX4v6Y6Gi=KkeZD70AoLPqZB=PA@mail.gmail.com>
 <YeHE3qPWS0LpmLIb@heinlein> <20220114220239.GH5754@packtop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9jdOUGftIRPZ9b0M"
Content-Disposition: inline
In-Reply-To: <20220114220239.GH5754@packtop>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "velumanit@hcl.com" <velumanit@hcl.com>,
 logananth hcl <logananth13.hcl@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--9jdOUGftIRPZ9b0M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 14, 2022 at 10:02:40PM +0000, Zev Weiss wrote:
> On Fri, Jan 14, 2022 at 10:45:50AM PST, Patrick Williams wrote:

> >```
> >$ git grep "v2019.04"
> >meta-aspeed/recipes-bsp/u-boot/u-boot-common-aspeed-sdk_2019.04.inc:PV =
=3D "v2019.04+git${SRCPV}"
> >```
> >
> >I think everyone doing AST2400/AST2500 work has been copying from existi=
ng
> >systems and still pointing to the v2016.07 branch that we have working i=
n the
> >tree.
> >
>=20
> I think g200a, fp5280g2, and vegman are all using the new branch?  And
> if I'm interpreting the below correctly, also any aspeed-g6 systems that
> haven't overridden the defaults?

Thanks, my git-grep failed me and for some reason I thought 'sdk' means
something else w.r.t. u-boot.  You appear to be correct.

Logananth, we might want to upgrade Yv2/Tiogapass to this newer branch if
possible then.

--=20
Patrick Williams

--9jdOUGftIRPZ9b0M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmHh91MACgkQqwNHzC0A
wRln/w//XRJwwi9i21yfzzJFDOVm5Nbkd+rOlaAYqKX46lQ4ZbbThk2fWaklWUi+
jWKe7qwaKZFZdJXzNfxNlKkotda6FYTtoDyeK0m8sC3nM+HKtIhZQBvrhhuRC5Oe
B2zKuLdj0mMz/25OJ2v8wrv2yjtvWBFcrNAvBuC+1HpKUtOIHjXbaUcqvDeKt1/N
uC+dBo4Umz7IOxxxOmjR5Ikcbv6iFkPf8mjMP7UGzwcf0NrjLxFW5T/Tixrqr5Nh
lMTTjDS5KZoz+mq2RJXl9VSwiBEahKd9nE+g88VhVZIX49b3L6hNodjPqKtK/DKg
MV40Vf9xG++yUiIodu3tQ9xRxNF5aNlnwgf/+X6/886y0b14+DPYATvsltDXKRRe
Bqka5X5Jk3ViIVGeDmr28aTaGlKeCYRW27yG9vGfENufzF9Qc8YHU2G07GRxu35B
BQh4fMqwGyDmJdQmtz+qHOWfXOq4NRaQs9YNGoIL+Th0vfw65kYAfIh+S1ySRLsg
FutvPWTZTuhVddO5EBxMJ3ZNsAuYjh/EQA63BoH/bSSWq+ff/9EARHsbmA87vHDo
u12gY1Hy5pRxtqlQzReQQ1m8zFIl2c7ipwGnTcZXdiQPbrV+pAE41T+WmYqvBc6f
D3xmaDeZwqzLMtT9LQfUq2GIzWgzRfAhNNtTBzMg0mQJvKmYR+E=
=szUr
-----END PGP SIGNATURE-----

--9jdOUGftIRPZ9b0M--
