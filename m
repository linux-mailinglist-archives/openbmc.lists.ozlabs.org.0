Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5A37A19DE
	for <lists+openbmc@lfdr.de>; Fri, 15 Sep 2023 11:03:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=KC2wUU5z;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=I+TJrGhI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rn7Wz3Pk2z3cGq
	for <lists+openbmc@lfdr.de>; Fri, 15 Sep 2023 19:03:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=KC2wUU5z;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=I+TJrGhI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rn7WH3K8Rz3c2D
	for <openbmc@lists.ozlabs.org>; Fri, 15 Sep 2023 19:02:50 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 887D732009A6;
	Fri, 15 Sep 2023 05:02:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 15 Sep 2023 05:02:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1694768565; x=1694854965; bh=ip
	pNPN4BEySQ8BIKnJv0m6oOhHBPoOtvA46IgWMxU7k=; b=KC2wUU5zMEyQu++xQV
	/uRckIwzo0ZdpVwp9PvGc0CFQm20SxijbBK5NzzifIe3v41ZHOLRVUsyZICPDh/h
	EboJSYotg/zLkCfzBnNBpgidBhM3RRyNhJwJZJLfWWMtmxI3+8AtZEZpTnNZsy6P
	6RzEiXaVpH0FF3OTrmJeVEja9VbVAgSYPQI65/KcZJryxRBQsouBFS90+iWx/Bue
	ILsRoC80jqi++RMW6BfhvWAmKMGNeb9nDLGVextvaWmTc5Nn3MYwYY+1OehbQFOt
	R+619PbbTYxEITIDTI6Mu9B//CP5SqP/GVAn1SfdnFGzNmEWwH0+W94vMvkt2NE8
	F7PA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1694768565; x=1694854965; bh=ippNPN4BEySQ8
	BIKnJv0m6oOhHBPoOtvA46IgWMxU7k=; b=I+TJrGhI55HJ5u2mRvNIqkdnsu/aG
	3EN/RhqZQAd2Qv5MPHYfeiPHyL4r+OpIVz8VzFf3hd5E1pZMeT0pR2GRLs4yokSJ
	mDE+XWojJk7BhwdvOIsXc4m8+Qzt1Dz6vTXIjhr/+EnzGhB8ep8EIu69WbtTRAph
	MviSvBLQoN9WGWaAOivTpGqAxa6+Db9C9TvNHl9BZLM5g4gjSLbrVy7nCpcjs7Op
	aTZCMh1PoIxM67Lw6NTa1VYXJ7MubJoo5Se+i0JuJG/ny0BSkbKWeR02dWS+gTBp
	orD7uHo4F2ai/1xE7lX7tLdWZ0UCPl1exgIAH/K60xbrmTqUQHLW/SdEQ==
X-ME-Sender: <xms:tR0EZaeXLgS0355ipfd35wv_CyrTjuqtyO1f6jvza6TtQ2y_AwTLwQ>
    <xme:tR0EZUO4AIzn6iYEOj7wxdPT30Ehcsp4zfYcoF5wGE8mn6eJlIjLOwvbXZbKK77lw
    Inu11O6qO-4omfPWEE>
X-ME-Received: <xmr:tR0EZbj-_jDzNloRG4QG-3hQWasbB6XoGpS8cXsf9WXjfKC5ioXpUra9ziQeFLaQbM411czbe3dkZLNMK5xyRKQJZCFxpuHSdII>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudejvddgtdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlvdefmdenucfjughrpeffhf
    fvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefrrghtrhhitghkucghihhl
    lhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrh
    hnpeefkefhueeihfevudefgfeihedtjedvveeiteeljeeihfdtffehkeeffedvjeefheen
    ucffohhmrghinhepphgrshhtvggsihhnrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:tR0EZX8w75twBVWiJ_bD1YJ0zulrzJkpHoJeT1xsqJYx5WlJBxO9sA>
    <xmx:tR0EZWuEwV20lB-4eYHU59zmDb0vdUs93VJ0i9PzuOG4nSG1cYjsNA>
    <xmx:tR0EZeEf6CWX4nFUP4102sDdZeT-aq3cmu_lGpoVvLRgJ326fqmsnQ>
    <xmx:tR0EZc06-PGKXn9ilBiIGUm8j04tbwOoG-FE88PboekMbxNguVEG7w>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Sep 2023 05:02:45 -0400 (EDT)
Date: Fri, 15 Sep 2023 04:02:43 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: =?utf-8?Q?=C5=81ukasz_Przenios=C5=82o?= <bremenpl@gmail.com>
Subject: Re: Support: OpenBMC build failed at bmcweb (commit:
 029f4aada38f4b041b5a171c2e112a267cee3b7f)
Message-ID: <ZQQds-_zQE4Ffo_u@heinlein.vulture-banana.ts.net>
References: <em80cca595-c4f5-47ec-a958-83a5c16e45c2@02cbb70a.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qSL6R8hwOO6s9Hf1"
Content-Disposition: inline
In-Reply-To: <em80cca595-c4f5-47ec-a958-83a5c16e45c2@02cbb70a.com>
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


--qSL6R8hwOO6s9Hf1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 15, 2023 at 08:09:08AM +0000, =C5=81ukasz Przenios=C5=82o wrote:
> Hello,
> I am trying to build OpenBMC on an Ubuntu VM:
>=20
> lukasz@ce-lp:~/ce/openbmc/build/evb-ast2600$ uname -a
> Linux ce-lp 6.2.0-32-generic #32-Ubuntu SMP PREEMPT_DYNAMIC Mon Aug 14=20
> 10:03:50 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
>=20
> I have 16 total cores and 20 GB of RAM assigned to this VM. My target is=
=20
> evb-ast2600. My build fails at bmcweb:
>=20
> | {standard input}: Assembler messages:
> | {standard input}:8616216: Warning: end of file in string; '"' inserted
> | arm-openbmc-linux-gnueabi-g++: fatal error: Killed signal terminated=20
> program cc1plus
> | compilation terminated.
> | ninja: build stopped: subcommand failed.
> | INFO: autodetecting backend as ninja
> | INFO: calculating backend command to run:=20
> /home/lukasz/ce/openbmc/build/evb-ast2600/tmp/work/armv7ahf-vfpv4d16-open=
bmc-linux-gnueabi/bmcweb/1.0+gitAUTOINC+e1bf8bb6a8/recipe-sysroot-native/us=
r/bin/ninja=20
> -j 16 -v
> | WARNING: exit code 1 from a shell command.
> ERROR: Task=20
> (/home/lukasz/ce/openbmc/meta-phosphor/recipes-phosphor/interfaces/bmcweb=
_git.bb:do_compile)=20
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 5292 tasks of which 704 didn't need to be=
=20
> rerun and 1 failed.
>=20
> Summary: 1 task failed:
>   =20
> /home/lukasz/ce/openbmc/meta-phosphor/recipes-phosphor/interfaces/bmcweb_=
git.bb:do_compile
> Summary: There were 2 WARNING messages.
> Summary: There was 1 ERROR message, returning a non-zero exit code.
>=20
> Here is the complete output: https://pastebin.com/yGRDT477
>=20
> My gcc version:
>=20
> lukasz@ce-lp:~/ce/openbmc/build/evb-ast2600$ gcc --version
> gcc (Ubuntu 12.3.0-1ubuntu1~23.04) 12.3.0
>=20
> Before building I have installed all necessary packages via:
>=20
> sudo apt install git python3-distutils gcc g++ make file wget gawk=20
> diffstat bzip2 cpio chrpath zstd lz4 bzip2
>=20
> I cannot figure out what I am missing. I would appreciate all help and=20
> support, thank you!
>=20
> --
> =C5=81ukasz Przenios=C5=82o

Two thoughts:

1. You should be using GCC-13 for our repositories now.

2. The symptoms of unexpected EOF from the assembler are generally an
   indication that another GCC process failed due to the kernel OOM
   killer.  You said you have 20GB of RAM, which is decent, but the
   ratio of cores to RAM is barely above 1GB.  You might want to use
   `ninja -j6` to limit the number of parallel jobs that Ninja kicks
   off.

(At this point you should probably `ninja clean` before retrying).

--=20
Patrick Williams

--qSL6R8hwOO6s9Hf1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmUEHbIACgkQqwNHzC0A
wRmOzw/+KEh2AFKbzJh3XdJhaH+j+MA6SuETm67+6aRTz+taHXzfn6RDy034skKr
RqNavZnkvoB9uEcQhKchn0DaTWpYDv7gu5IS0l+rscxeUJlZc5pzha1ghLbdDMiE
hkTiFcZlp6Q+/FZcGaPpRj7q0mznBRNb9olkOAvS1z11Crtje5PKxhhFqr6k/B86
0LiPrK5hT26pmothdi/vuz3SzWxoK7w2WbBqtjaDH1jIO+3OVtvOzTuDTxCnlu6i
5A7oJKH8I8ZauZJmrJ7OMd3kO0hBL+vdWi7kw5N1NovfVaSv2ZDXagGWP0XFUb+x
oh8/QVJOjfMPa2JsKST9OYx5rGnN/9HtHjc5nnjBucuvusc/T0MUcJGnL3h9AECG
IikEpsZWcAsoFi3nJI5Fk7HaGQxBLmzpvRQ+e/QVndX6GEvYjxI6WxWKqGuXiHaz
YSb3uSC8S7rclLuuUNU5pgNJxv6kURoGFlKyA+pWGOc8NS6ZlhSP1qMVWd7IznzF
sRiIEgRlP7JKfUAoT51hiBFETDTyCRQ2neT84z3/j09qotuxZ3ioyJvLLfYTsP3Y
A0TqLqDOoU432jBfSnZ+uFttndt9GWd1TNQmlxc3PbsJ11z26jIF/bPg/Ohmz8ji
PsvrdryQBxH/xITvzm/ektWBGkhlKkBpIEP4XmJtNCUxvgyTprc=
=rhPJ
-----END PGP SIGNATURE-----

--qSL6R8hwOO6s9Hf1--
