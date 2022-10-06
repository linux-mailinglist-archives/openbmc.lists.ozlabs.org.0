Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7ECC5F5FA3
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 05:32:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjcSb6w2sz3bjk
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 14:32:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=Lo296oqD;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=FC+tOaUj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=Lo296oqD;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=FC+tOaUj;
	dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjcRz1NR5z2xH8
	for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2022 14:31:43 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 2B34D32000CC;
	Wed,  5 Oct 2022 23:31:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 05 Oct 2022 23:31:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1665027100; x=1665113500; bh=LL0J8s3Z9M
	96DaaIPXjcyA+O13cbMchgQekwqStvd6U=; b=Lo296oqDY8JTz+h8JZZRii0cVJ
	dCfOdqqNBiNrJHfjX6Ajt7Df7+Fdec9/BSj0Sc1md+BrSxVGWJXkjldlu0plkUWs
	PtEu4E2vl7Bdn8qND2JgdIZt5gOd32XR/mycgZGjok/Sz2rDZMyru0YYbcnmGJzj
	/OZzxfvPoiOyZEYXTfjB2fmxbNnSzQmXo6lUoToy6EbWn0vqdXl87v7Sv7nC8wY4
	nnLVn20eZ8wBWRT99t8V9eoBWFRxct73xCgK2f0AG6V60IReuTdmOF7TUFirGoH+
	+TAnbhr8GRQadbuubR7QTuTPd0WELmbZBMSLLVk1CQlrQFJfjfFYuWVau+4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1665027100; x=1665113500; bh=LL0J8s3Z9M96DaaIPXjcyA+O13cb
	MchgQekwqStvd6U=; b=FC+tOaUjF4M0Kj40du7FJOIplbb69KFJvo6fTaDiphwE
	AWb5ZQt7vEqSyk/e0KhXYG/Mu9J7+AWrRVBilbpvAjZrnUFN/uuJWI4efbGyO9Ae
	YVR/1/fKlI6fXoIgMor/2Q7PxId1nuvSbqHbORjv6IaoPNTFsp4zmZEtK0V2mDjx
	sF1RX9t+CIReV+h5XcrlivWiKL6OGx49FDHDVDsHEJBm6B1xxCsodtRadi4r1gaE
	Q8+Lrs31IeLAwfVcyJhiTP+ArQk33a6M4IV+2EgLjlF3HIXHs8A81HlfCnv0fE9O
	zCd3rAEx4m34UAl1lZ94tapp7WyBGK84MgxGrcfrPw==
X-ME-Sender: <xms:HEw-Y5aWTPuUEDutz7v4uGivDjZTkVGfipzJYCZYKhveMWhk6w2ADA>
    <xme:HEw-Ywb-JP0zjPtj_uhjnEw6OVrzekNFm1iWVahx9k8cOe1hDjMnMYUPzGPQB0BGj
    MVt8M2vmm4_Jh5YvRg>
X-ME-Received: <xmr:HEw-Y7_k4V0rqGj3pgbZkTaRDIjk7-3zwT4RE31jUIuJfWZBgGo2-tQqgbVDMiVp5OEbHcSo6j135JYqMt2WT1eBRXAXT5-e>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeigedgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeejgfdtleelvdeftdeggefffeeu
    feevgeejkeelgeeujeevveeufeeigfeivdejjeenucffohhmrghinhepkhgvrhhnvghlrd
    horhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    phgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:HEw-Y3prqbP4YGMzKqnILxuTUtrfGVng-yf1Lxlk7ImCkGVqGRKQhQ>
    <xmx:HEw-Y0ojbtLoqoI38n3f5uyymI64b-nqCevvkzL2OeZzSQD13l0UjQ>
    <xmx:HEw-Y9QeuMHlhPN2KwqAsiuYe0SjrrQn7epZtLt1IiBZm943HH0H4w>
    <xmx:HEw-Y7Q6GUD8LIEA4rHfV1XUy89JYUJBLEqHP6G2qSKdj-QeqgdSYQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Oct 2022 23:31:40 -0400 (EDT)
Date: Wed, 5 Oct 2022 22:31:39 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: Linux kernel updates and v6.0
Message-ID: <Yz5MGyM9yXFPz1Er@heinlein>
References: <CACPK8XdERea0Mt+3o1z2TwbN_NXJ-FDYf8mxUEAWe5Lp7oFRmg@mail.gmail.com>
 <CACPK8XfrECvJtwZ8AR1EgsVHpSnkKCVp2LovCXCyFXBpjeBbfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pjBmdw79oXmcMaFU"
Content-Disposition: inline
In-Reply-To: <CACPK8XfrECvJtwZ8AR1EgsVHpSnkKCVp2LovCXCyFXBpjeBbfQ@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--pjBmdw79oXmcMaFU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 06, 2022 at 01:26:13AM +0000, Joel Stanley wrote:
> On Wed, 28 Sept 2022 at 06:34, Joel Stanley <joel@jms.id.au> wrote:
> > Please address any future patches to the dev-6.0 tree.
>=20
> If you have pending patches then please let me know that you want them
> merged to the dev-6.0 branch. Otherwise, rebase and re-send them to
> the list.

Hi Joel,

We'd like to have this series applied to your tree and backported to
dev-6.0.

https://lore.kernel.org/lkml/20220929013130.1916525-1-potin.lai.pt@gmail.co=
m/

--=20
Patrick Williams

--pjBmdw79oXmcMaFU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmM+TBsACgkQqwNHzC0A
wRkiiw//U/vzmHD/DlxuSlSCTQK0Oh15/g+70ShYXVSB1n8Xf5+4diUa3ktnsM2t
LaGkOO2YBN1hahDCkBsHfXnBidhnWvB4iDpx51lPzqRNA04Uh1OwZjSeNeBAtk2e
strvxULxREUtenFWH0aNSIyAOMWoR+cNVFJ+tGs4IsZ267U/UuRRa7z92DnXkYVJ
nS4lO+r+bWpRCl/hh5uG5+GUUZ9fnaUIwpfgw+e1aRKaWM2akIwXoSgiHZm6igdz
X4QU0ftXPKBnStKrN/qEI+t1xEzB5lIO52tYbYhV0TAceX4t0L3+m7R1gmtKf/+f
NzI+DeEcgQAWcmYywkdvKfAqWMhrZaMvfAzs9TiwXUu0A4IUBEKzKBUPxtsH5SJ7
JZeDIjc19AEWALS7Tm1blwjQfHZriSNhKRUNEtsE1sKkdF1WJb5EC7lP/+9jFHqf
7bkC2ObK4UYJNGFyJjAlAjGSKqqcljaWe2/E2OG+5dgaSMf3u00s6UXF946iUVFT
A0smg8XAweks1ZcktWKmZonW1ew1eSw8gRH4nu7qduUPI1w5Wcq8lO5+TQyc2pIx
k9cUc430A9QNknDyns1SVLCmjIwDh5IfMFv/eQilFAEyRGfRCoeICU7f7cZf4RtA
pGyOtHsGy76GoGx+egz/olFkiG1LcppBDhsUSvcngnijMQF0Y1k=
=zuEQ
-----END PGP SIGNATURE-----

--pjBmdw79oXmcMaFU--
