Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DF74B2EF1
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 21:57:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwQst4Lpsz3cDY
	for <lists+openbmc@lfdr.de>; Sat, 12 Feb 2022 07:57:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=jFPneRlw;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=VB7+kmBq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=jFPneRlw; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=VB7+kmBq; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwQsV1ZG2z2xs7
 for <openbmc@lists.ozlabs.org>; Sat, 12 Feb 2022 07:57:02 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 76881320208E;
 Fri, 11 Feb 2022 15:57:00 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 11 Feb 2022 15:57:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=bN0nX8sp1rr6tQzxgEKldwFiAOpM4/G5F6TyMw
 NE5Xs=; b=jFPneRlw6N4VBlRPj3TZoOhSYnnUiYkvDbr3Egg4UyDJyp1IzXr4k8
 lRb3CLmAwwlxBjpfcR8XcMbpHd3JxA7VeTJVTE1pk9wdXKNlC35CcrTs2NNlkc31
 RHhS/US2bgurrXx0LHVbS0Cvlw2qw2qxvHB6NNUC11QZpHVBc8l1Td0HKZGvzj0a
 fqI1uRlp+kHM8gzEFtf4nBWVvgqKXc1U72KTlVE+RptRNPoFKcqprLmxaS+5YCkl
 ZBryLrWh2u/G99v4f8M+sHTgvQ9StQHugqtbmgWAPNdd4cfaFmnpMT+dxnwN9E0V
 LwMrJxJF4U7Suzec4mbgLrm4hC2C+LHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=bN0nX8sp1rr6tQzxg
 EKldwFiAOpM4/G5F6TyMwNE5Xs=; b=VB7+kmBqZIj2zImv0CPohBs4ArnxhqpTv
 mxlWaSXjP/xKso9yMwCaKLBdy72k1HkmFlzSCdg52TFXffOr+nJbHfkd/PufMJE7
 JgPqNZsgV3gz/OHf91p3V0wtrCc09hGoQZlv738yecE441oflzlvfNBbxloJDAn0
 8VsMji2Kx4phg9Triyna2961H8T/6nsYF7w8SAPLeROLyrwqcndH0tF9snybZZdT
 +boY2I33kIBa2KZYPamICNSkdz3jOryDo3I8zpwgfHXORSG6Gpqlv93CiLaXjRsO
 RNGJTx2FxhMjKnfm090bj3hilaJzugN91lNE3IeQta7AC2UjYQeEA==
X-ME-Sender: <xms:m80GYg_dqaKjjek2SxyumDNxAErcBi8BJpJa-XoVWsL2tyfr8IrYGw>
 <xme:m80GYou1uPJrpY2kb6r1qamqVzMyUpswANkszj8_qAkdTft9Dp3OSCPIGdCLvtHWT
 C5C2NCHvgJLd1bhRcg>
X-ME-Received: <xmr:m80GYmCGRCnPqbVoLy84CltVjQRVkV8xDVllmJOttBkfEjJBZ8xZtnpHeySVNUe2QZgvZB4bhQ5768oMd4AZxYAAzvvHJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrieefgddugeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:m80GYgfjSohRFzPGSdNu4BrZ0hLDhVsycvBiqUSpH0P_AtgsWxoU2g>
 <xmx:m80GYlO4kugogxje-asLF0YJI-LLMkHQGuRWoXoIumv85RxM6C_00Q>
 <xmx:m80GYqmpfT_N6fCxowD3Z-rrVYwwxRqV2UEM0FMpUufLKTgG8qEAqQ>
 <xmx:nM0GYj2oAll5rJGZjDauHipAKh06WSO5SGkEuB3A9uA1pYI--eozJg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Feb 2022 15:56:59 -0500 (EST)
Date: Fri, 11 Feb 2022 14:56:58 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Thaj <tajudheenk@gmail.com>
Subject: Re: Upcoming OpenBMC release 2.11
Message-ID: <YgbNmq8SVgJMHXcn@heinlein>
References: <YbposjOPwc1puNvR@heinlein> <YehtxgLG3KlzKFAk@heinlein>
 <CAH2KKeY_aGKzp+BjYJPagjWAR2WLuqeib4aPy2nBjSc4_ed_zg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fSZ0DJTMOPOtjyb4"
Content-Disposition: inline
In-Reply-To: <CAH2KKeY_aGKzp+BjYJPagjWAR2WLuqeib4aPy2nBjSc4_ed_zg@mail.gmail.com>
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--fSZ0DJTMOPOtjyb4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 11, 2022 at 03:33:12PM +0530, Thaj wrote:
> Hi Patrick,

Hello Thaj,

>=20
> 2.9 is quiet old. There are a lot of changes after that. A newer u-boot
> with secure boot support, better AST2600 support etc. A new release is
> necessary.=20

It seems that not many people who are active contributors in the community
actually care about releases, so there hasn't been much effort put into it.
You used the word "necessary".  Would you care to expand, for the community,
what your use case is where you rely on releases?

> There is no 2.11.0-rc1 yet. Is it possible to initiate a release
> process?

The honister branch is effectively the '2.11.0-rc'.  I don't have permissio=
ns
to create tags myself.  I'll see if Brad has bandwidth to create a tag in t=
he
near future.

--=20
Patrick Williams

--fSZ0DJTMOPOtjyb4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmIGzZkACgkQqwNHzC0A
wRnqlg//XivCb5+ADxDBtJeq+gCgjoggYVdHY7S/4cC4tiL/fVhv4FIp7gyS9oj8
cjdZ0MVRf2yytI2ylOzEbghsvobGKDTnltd5niNUaVEJxPePY+0Nkp6+7Zw/MWha
tx/Tpy+EGBha0Jv0hA+PCm5WQOHMhzCq6q6HG0w4Qqd8pofVegIT7gTRxXRl/50H
Qe46AjSTqH6dKbn+Pb5yWrkTAb5rrvf+Q8hIkJRPZmMFcYNKezAoEqBGxEZRKbyW
u7qsPaahNYfm71nEB6Q3wGYYbtA152UNJ2d3MU/rFJFOxl9CXYHykX6eJcjjgGFZ
r8uBmCpXNuAsIij79oRTHDo023r53WVaIAOa3qEl832ytEvo8rGC3b9ZZy2Qiqr+
sn7u1XPJXRjgw9Z/05p092Jzd842BqUbVU+OOV9HV01yCcETi0RlxzzP/SkxvaqB
GWbxwAQK4CiUYlHg3TY9iRhGLo3vjeB2qyAp7k3FltOkV6hVrrVOyJdkMyKuO0qS
llwEqyg5PZ9WCQKJcatJKFgyWU46JszOPpAXxkScJ2J1sLLRcmLkNlXQzbj2Lb00
wVKA1KyCwxyCMOcUzE00z2nsQieH96oMwAdzbG39N8cNAKQyGV0RCEaRh07kMbF6
aqFeEkxM/xkwqbyhL2TGv8z0bdcGwGMrpFKPTbRNBbXatOdkRv4=
=a8Cu
-----END PGP SIGNATURE-----

--fSZ0DJTMOPOtjyb4--
