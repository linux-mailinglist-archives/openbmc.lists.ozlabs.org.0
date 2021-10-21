Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47513435A18
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 06:48:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZZjx65wjz2ywS
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 15:48:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=ZEPhrH3U;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=iJs3jKH6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=ZEPhrH3U; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=iJs3jKH6; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZZjW4hwgz2xtj
 for <openbmc@lists.ozlabs.org>; Thu, 21 Oct 2021 15:47:59 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id C4FBE5C0195
 for <openbmc@lists.ozlabs.org>; Thu, 21 Oct 2021 00:47:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 21 Oct 2021 00:47:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=4JWXXT0LPm1UpjW+AfJs7pOOx9L
 ATw4uw34THABm5UQ=; b=ZEPhrH3UTyzU6qHR8j/hXc08zuMntgx0la7/muTFYut
 99J6clnJM24x5CRspfr9ND9LjGRe+wSgZLNe/DxUN9BmKh17wna7JMww2fajN/dS
 4YzSrP4HJ+8e/dK+aDlR4Rru6NIRIt/iWllCa6Tw27nYOXAKQ18/gEqa1IUim9N8
 k0m2OzEVWNE6rBTAVEA6NY/mBLTkw1+G+uED5YgFZMz4/gxA6BM+RFUyIQDRplBR
 rrKIXQFDq+FHXeP4TQxJN8H2cM5fIC30U2ayvhLaBVxAfYkau2rgzDFIqw1CLaPS
 kptXyGjM1yyskCBfealrg/0YI6aBVbWvWWBQzzy3pvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=4JWXXT
 0LPm1UpjW+AfJs7pOOx9LATw4uw34THABm5UQ=; b=iJs3jKH6eEXMy2h4bG9sVy
 OsEMq6F9J7G2b0QCnusgZKjongtq6pLw759LkDOOVCPu7ben6OEPpeMgT96rPpQH
 mwwhieaW4e9sydqEX34fRCrMQ+/IvKC53a6gscYPJGxm7AHN5c8bfhsThY66OyKa
 uYzQ07WO3BTQxRVkVtqTK+CVQyGx3AfdamxN3odKZ0usEaqlzMPNccrxsaAcLQTV
 ZdfBc0+1fTjZjkKhj0+zUKmK9ADmDyqE1qKjuy5l6tILKVTGK7lmGz5ngPD7xyW8
 THeYSGi4VoQqNcnQNUjoLCGhmw2T3kRxC13fYPAT1/9UVqg2EW4TY/CSlpJb3uBQ
 ==
X-ME-Sender: <xms:_fBwYRp20nPWEuRZntzR_qmFsUDLIcdaGQsAF9uucbYQ7VWWZpGLiw>
 <xme:_fBwYTrBpRpOXZSKEa6l4O8vuNJzO0p0JeRNjt9u021qQYQltA822TFkTcTr1TCok
 V9vOeIrqzGnBIXfUmc>
X-ME-Received: <xmr:_fBwYeO5Bakp9OddezXl_jRfd9vVnsa1NfQEpa8qeHG4GTzAQSXGWGtkeEu9iQZAs5znOvZH-Kdi9gbdq9bzubRxg-mKCpUV444plxKI1IBIQA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvhedgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepvdeiiedugeelffdvtdfhvdekkeeg
 ledthfelfeejhefgtdehjedvfeejieevgeffnecuffhomhgrihhnpehphihthhhonhdroh
 hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:_fBwYc6DmZhLMaWgV1IiSbXL5VReSfoM2DNbdEaNAnazaTSQM_wANg>
 <xmx:_fBwYQ7380epuH-sXey6ObGNfzLL58tIncY3ju_CEjyXxwb1SJNmfw>
 <xmx:_fBwYUhhpTiKK7R6K0diNRzJaDGFwvIvcaA5CZhcZ5D8qRC7l03N0g>
 <xmx:_fBwYVUhh8VFy05AVR0xh_j4-IDclGcUQqpIAZNgT-YDucZ1sd16AA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Thu, 21 Oct 2021 00:47:57 -0400 (EDT)
Date: Wed, 20 Oct 2021 23:47:56 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: OTP-5: "OpenBMC TOF Proposal" Process
Message-ID: <YXDw/MgZSsmLt6oa@heinlein>
References: <YXDtrwHhUcxwtlij@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zOI6cuY2B7GMMsZf"
Content-Disposition: inline
In-Reply-To: <YXDtrwHhUcxwtlij@heinlein>
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


--zOI6cuY2B7GMMsZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 20, 2021 at 11:33:51PM -0500, Patrick Williams wrote:
> 2. Use the OTP template for the proposal type to write a draft proposal a=
nd send
>    a copy to the [OpenBMC mailing list][4] with the title "OTP-N: Title" =
and the
>    contents being the filled-in OTP template.

I am fully aware we do not have OTP templates yet.  Much like how PEP-1[1]
defines the PEP process and PEP-12[2] gives the templates themselves, we wi=
ll
have the templates come about through a future OTP.

1. https://www.python.org/dev/peps/pep-0001/
2. https://www.python.org/dev/peps/pep-0012/

--=20
Patrick Williams

--zOI6cuY2B7GMMsZf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmFw8PoACgkQqwNHzC0A
wRn8KxAAga9rA664Qehi4iXUhBSpzf/fTYKIbJfh31EQLOwv++JfUfc18rHIjcgS
bafJXIPqpHqZRkA7+fw9ZyYSAMI9hgbAlbDT8Uj+y0TWMq6z+Sf8dl/Jer3xd48y
L9GeMi3LdElFy2mM5Amqf/VCGID8D6+j7E84PsvjQeTP6xN325ex7AdjzvXrybN+
SDG00ssYtGVVzzN2yA7llHh5X88TDaZ+KFjWRzDZGN2wnh3PdzYGndjTPyIcXLzY
gjiTBsBj6924lUe9NZs6nlm6kuSXXyrWBx4SffYzjri32QgrZaz5jitRThfip/dD
xhH8F8/Uft+hERNkXgpmP+A/HPqaCy+JeXkanLNWYkMiKe+QF1Tbaa/nX9XS0IKt
WnQd4/lbuyqhZDx4vqJblKxLg9lyfVRvQVdlu7oIDFa+3VXRfjGIT821U5CR9vRX
5OV190Aw/FMaleIYx8dnzsYfEvEum4MSi6kJJStCCfSJS6fgk6Iw/R4wnL+dGpPF
W5I2Q5wRBPEoNOB+rzrFecbl9zjyLE5LjJk3EIsyXnyJS1CTNOkmHVdDO53EWE+8
QLRo8vtY445NOvZeWgm1BtTJWyveD7MEh2ziyzadFS9dXIDgwLH17evdjxwm0pZo
xZN7Rux4DD/55qux22Y/tkPCb/xf9b6PV0CEJH7sG5bbzRhNJxY=
=+DY7
-----END PGP SIGNATURE-----

--zOI6cuY2B7GMMsZf--
