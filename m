Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76ACE6FFF29
	for <lists+openbmc@lfdr.de>; Fri, 12 May 2023 05:03:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHYVK2jsxz3fP8
	for <lists+openbmc@lfdr.de>; Fri, 12 May 2023 13:03:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=aQPEFrUq;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=TcVMwMSf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=aQPEFrUq;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=TcVMwMSf;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHYTg4M76z3cGk
	for <openbmc@lists.ozlabs.org>; Fri, 12 May 2023 13:02:30 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id CE9EF5C11CE
	for <openbmc@lists.ozlabs.org>; Thu, 11 May 2023 23:02:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 11 May 2023 23:02:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1683860544; x=1683946944; bh=BZ
	uXY3hCBi0ppPq14PPZq9Zzhb1uXluKpYJD8D6GRWA=; b=aQPEFrUq8xtDFaZQiC
	MSzjNXC3a3vPp87GcS0OeIrfUJARHz+vBAcbRQhDUQhlRkpmcEkgdzW8FPUQTYHF
	tWdJqyiDc0ULabBQeALVHDnSIRc4QZfsHyccP+RPXnBgLsYHM6NgoiZqY2JdZg+U
	xHKR5/8hW72sI2tNxLttMIr6BTsQbNwKimI0zwKJLJ9eXKd6gIKSACUKGEzCMM9u
	Y2WKkW34XOCZLJyW3mAZt9m5F1fGP+TI/5D/R7ecdJwZuYiHdChJjzKGsDgf7KMo
	+fUhjM3+jRph8TgFvqI2poQbezC8E17F6UnP09o4SLVQEpA76Pn7CSpCrpkEC1Dt
	T8cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1683860544; x=1683946944; bh=BZuXY3hCBi0pp
	Pq14PPZq9Zzhb1uXluKpYJD8D6GRWA=; b=TcVMwMSfLLWy+N146tkQcPIBVJt+e
	besTyDo+H8kyYSeCzhUTc7+r/YiCao9sv6JpgSEmK//7WT0hFGqIB2EUVKHj/ewW
	ehe0+8uAI69WxEOMEvg8+jj7cowOPOZdaD9GnYNeNG5AZtEUN+1S/XPg0jSQOQ9R
	/PmbXjvV5+5v5PKOpthPAARkR64CorAbvDso+ecR4XFSA1ZIPkWeFW2XqLjkPUBL
	t0zUmupp15Ar1d6N2rL0eaXHC8TkcBD5k1ELuiSIw/FFDXIo8UjQwcMyxFithBDS
	hfJjkfwM58t+3vnfdXNLXMvocYGC14+bm678uqN1rtMj3lKgBPV9FXm4A==
X-ME-Sender: <xms:QKxdZAl78OvzbDbQO4wUhxqOLWMlhEy2VkORRykmr0SPOoWZsk13iw>
    <xme:QKxdZP2UMAaQlruZj9TL39LggY68Uyu9CAFpPTVWAy-FbIX0I8E85sHtNAypiv4fk
    o51l5zsHUOGJzg97cM>
X-ME-Received: <xmr:QKxdZOoVJ_9emk3EUAemxKaD41sonown5lsz2YAWNZFy0y7M1YuPQwZ2eRN_E9m0YCJFKXTZ356HBnaWg-xZGSbHICJQDS9IAL4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeegledgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludejmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
    vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhephffguddtfeevteeiueelfedufeet
    udettdekgfetfeetgffhtdevvedufeegleetnecuffhomhgrihhnpehgihhthhhusgdrtg
    homhdpohhpvghnsghmtgdrohhrghdpvdehgedtthgrnhhouhhsrdhnvghtnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhessh
    htfigtgidrgiihii
X-ME-Proxy: <xmx:QKxdZMn87yXc0gTFVxdOhGVXNMK1tj6Axp4dqoFa9A4QyLf2bsC6YA>
    <xmx:QKxdZO372lds2n3fok_M9MwPRRcWsCIHsd_pbSSR_CYcwK6h6ObC0g>
    <xmx:QKxdZDvO9mv06dyQY5n1UiAXENtY9FUk5fV7CeXTaFeSFWnqygSOBw>
    <xmx:QKxdZHiKIRQcVL09bVpIOhlUstrAku_U1R2k8xzZ3D_6d9bHMiBOeg>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Thu, 11 May 2023 23:02:24 -0400 (EDT)
Date: Thu, 11 May 2023 22:02:22 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: clang-16 rollout
Message-ID: <ZF2sPuvx6O2hQF7i@heinlein.vulture-banana.ts.net>
References: <ZFuSH0kBl3uOp2wg@heinlein.vulture-banana.ts.net>
 <ZFxixiiHQrRY_5jf@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2seYTYT5a2zLPtF2"
Content-Disposition: inline
In-Reply-To: <ZFxixiiHQrRY_5jf@heinlein.vulture-banana.ts.net>
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


--2seYTYT5a2zLPtF2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 10, 2023 at 10:36:38PM -0500, Patrick Williams wrote:

> There are a few pervasive issues related to clang-tidy-16 that we are
> still investigating.  The most common one, which affects many
> repositories  is an issue in Boost that looks something like this (but not
> always io_uring):
>=20
> ```
> /usr/local/include/boost/asio/detail/impl/io_uring_descriptor_service.ipp=
:109:3: error: Called C++ object pointer is null [clang-analyzer-core.CallA=
ndMessage,-warnings-as-errors]
> ```

All known issues except for bmcweb should be resolved now.  We ended up
working around the above error with a change in sdbusplus[1].

> The bmcweb repository has a big set of clang-tidy issues and I've been
> working on fixing some of them [1].

I have the majority of the bmcweb-specific clang-tidy issues resolved
now[2], including one we had to patch boost in CI[3,4], but there are
still a few more minor fixes to be made.=20

[1]: https://github.com/openbmc/sdbusplus/commit/fdfd3af1e7f7a8e4d0caee3edf=
aa12cd53cd0d17
[2]: https://gerrit.openbmc.org/q/status:open+project:openbmc/bmcweb+after:=
2023-05-10+(author:patrick%2540stwcx.xyz+OR+author:ed%2540tanous.net)
[3]: https://github.com/openbmc/openbmc-build-scripts/commit/876ea1efac0970=
372f956971540fcbb9e3b06634
[4]: https://github.com/williamspatrick/beast/commit/98f8b1fbd059a35754c2c7=
b2841769cf8d021272

--=20
Patrick Williams

--2seYTYT5a2zLPtF2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmRdrDwACgkQqwNHzC0A
wRkjkhAAngscCyOr4yoL1TJFLdWwceL8UxwCOOnRX5k92KcfIhBAaI0Xw362JMsc
RCcd75H2cp9doH6d0qhwgsV/Fi/H8zd1s3BeBSBfs6wLA6GH6w1nAlwSu8NrIplv
sQo9MUSAdrP0DuGKj1Yf2Lya2KQgdJu+YgMb2zyr/TJVogUAo+O1nPwENYngwG96
bywnvb8fHCmoj45XGjkeMsHBxOQF7HD2zkdoK5F/uU+Yv+KVUgSZ6HEW9uUdbaAt
hkbee2npWdJyT1H3yc5YY6pRsMFfqboohOGn/ZPVWXhQgSklOhgD2wxdSUkQWJ1v
3yG6aufN4yOmCRc5rXJS5R7yp+BKcAnwOCWB5pmgxY9Mxyb9agBO8NAmYevAP407
i5423d+UZRH2S99NdP1tbctys5I4mpSTaVD/3dAP0Oy+nhXZ4crfi9C+RIFc24Lc
pUcH/8ckHnbcHH1u5nvKVS4YfIxXcg/5M3jzo5VVv8a+GdfMWMCnSkuS5eaVgQx0
kmmfbqNGtGoRH0sU0dyDwMg+jNN+h3NP989uRXcb1Hytt0D/GBlq8qlZeagGjJVh
zmzef8uk+qsLs9yEmj/0RJ2mSC0MDllriC03ueMYyNTygaOXvlrhYNg2EkQE7wt2
sfTtxyzL9sh+wugexzt1RvSD4s3sSErf6J9XHL0DyMchK74CA30=
=xvYW
-----END PGP SIGNATURE-----

--2seYTYT5a2zLPtF2--
