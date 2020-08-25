Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC736251AC6
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 16:26:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbWWK4RryzDqX2
	for <lists+openbmc@lfdr.de>; Wed, 26 Aug 2020 00:26:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=WFQPwLMD; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=BsfasDi3; 
 dkim-atps=neutral
X-Greylist: delayed 68 seconds by postgrey-1.36 at bilbo;
 Wed, 26 Aug 2020 00:17:43 AEST
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbWKg0jl5zDqNy;
 Wed, 26 Aug 2020 00:17:42 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id BD52BE90;
 Tue, 25 Aug 2020 10:17:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 25 Aug 2020 10:17:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=N0zFzCcbm2CQ4Rw0jLZGKfcRoOu
 i7o5d7Rvm4cLzxwQ=; b=WFQPwLMD+Pw7hJuWWj21e75SaZetVYvwcXQGuO4muB7
 d8t0nUVAWq6e35+6m9L5G+667Kn4dlf4bFk7LMHD1L+p4+IeaOcJ3L4YHsYZGpik
 rWN651blf09udXrIhmgnG+hf2AyQI6aeVOUdYD/1OMw9yWIFzv/jwPZpb+sQd8Hg
 HDphVEtOT+njNDSdIZq/9jWBx3n57Aqw7RRdGp6VOSmL8dGjE+joVrFxof7bGC4h
 Ih36NM1m5e1JxaOlCl8YSJBPJUoqyuxu2LwffmHG/AmV8bOSz5ccleWMEhgUSMHM
 hv2yqWL2jOhjbsWxpSQwJZOLBBYd5ZX8kkeSrp7+YIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=N0zFzC
 cbm2CQ4Rw0jLZGKfcRoOui7o5d7Rvm4cLzxwQ=; b=BsfasDi3vj/Ta/t2qSDQbN
 O+RvWZt3FQa/Q6uOW5UJ/78W9f9sG/isMLic9OFH8ORXy3oy0A8iB6FEmjkaPuTu
 aVUVJqR5koWwWx4fQweCyBJRz/Z2SJL/kP7Arqr9irIEj3aP4A0MdoBGT5P4bn9z
 eX7RTqwxopnmFhTDujWgTLplXbKLGeL48zNCd3CqhGbhFOfNDRFvqG1MMAFbaX8K
 6gsOYuHpv/0qNK6cxd4xnhur7ytwA2FedLI6geZgUqs21tC81Yi4XRS5EU/TIl/m
 emzww7qg0k5KQgi9AGXiAuThAYu0D/D/aL6xw+w8TN9TzYVnIbTBHgejDM6INmZQ
 ==
X-ME-Sender: <xms:gx1FX4aYACmz6rxSQ3GEPPbw_T81hkXMM4Ox7jQszIVf586v_xOvXg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvtddgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:gx1FXzZxxxWVN9m8E4mwKDbsa35pNDahyhNdi9DwfaTnMlInjZDSGg>
 <xmx:gx1FXy8Qyp7TB-Y5sDnEOElW0R3_FZ17M4AcPt2yuMKog2t2T2JkQw>
 <xmx:gx1FXyqKyhjbFrgy8-FXJyBqP9X_xaHJ2dG6wGCf2-fypD-db3NQEA>
 <xmx:gx1FX0crfXKrEzgzcswFTnvw8thXchZpJ6NZbSGNK5mvKabx0F1XJw>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id D965030606E9;
 Tue, 25 Aug 2020 10:17:38 -0400 (EDT)
Date: Tue, 25 Aug 2020 09:17:38 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: rentao.bupt@gmail.com
Subject: Re: [PATCH 3/5] ARM: dts: aspeed: yamp: Set 32MB FMC flash layout
Message-ID: <20200825141738.GG3532@heinlein>
References: <20200824211948.12852-1-rentao.bupt@gmail.com>
 <20200824211948.12852-4-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qoTlaiD+Y2fIM3Ll"
Content-Disposition: inline
In-Reply-To: <20200824211948.12852-4-rentao.bupt@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, taoren@fb.com, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--qoTlaiD+Y2fIM3Ll
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2020 at 02:19:46PM -0700, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
>=20
> Set 32MB FMC flash layout in Yamp device tree explicitly because flash
> layout settings were removed from "ast2500-facebook-netbmc-common.dtsi".
>=20
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-facebook-yamp.dts | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20

Reviewed-by: Patrick Williams <patrick@stwcx.xyz>

--=20
Patrick Williams

--qoTlaiD+Y2fIM3Ll
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9FHYIACgkQqwNHzC0A
wRlFehAAilKhh9UL8jwqxfFRsBAEgd/0CfxdTYGbd8Hreo9J8iXVKJF+tS4dKuAH
dH6LaS1W9dkGrXEcLGF+5KJi0fSQ3gcPA26ZB23b8A7nrADTPfczDywoULAhcU8E
2HvQZOYDvqzqNqc9kvuOb/TynXx+h0dY2XORYWTb16t7sLzsyUAVma1VOTRUgd0x
Re3/s3ogYlrtFRrlwZm+dONZPRGpYzbWLdZQT6xBf1PqhjPzLOVWSJISRTmW0AEc
pH87vuWg27g+qyOBrdkmVeMB0I5sYrI/weNNjAORy65eAT6oK8ncvndgglVgxNwH
Rr7B17MwoYDP4RETs3o/DO9AJWiu0krGZA/4IQXQqrzMCYjGWqkmOt8SAlW3mHRD
aVVI1yZpIfiOudyV9noM1TV/BDHWnvFmWsSQEZ6B/72oV079jLSYHnIsCXgTLlbY
6miVgwwVb3dpJP8igXuik2K2dn51dcimV05KK3A6trsJGmZLNoVrGgp5sICFpfvR
0LF2HXxDewUcW7wguJRkevhp7ohIXnafYWZh2hCQhFMbM3gKzTRPsqg1CAjIlL6o
5+Wr6ZEzWUu+iKFw3e0n8eW6H9u5gaoSXb2Mm+JdgoXhYDqmdP/GhPr6UI1abdg7
yI4FP0ahPbgegkE8UhIHa0RVawh/x6P+MhU9n/QAzCxjIIBS4Mk=
=IqLr
-----END PGP SIGNATURE-----

--qoTlaiD+Y2fIM3Ll--
