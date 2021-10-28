Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF7043E073
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 14:03:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hg42F3nB4z303H
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 23:03:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=CyE/v0JX;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=fUF3H3m1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=CyE/v0JX; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=fUF3H3m1; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hg41n49lGz2x9d
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 23:02:36 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4F6DE5C0195;
 Thu, 28 Oct 2021 08:02:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 28 Oct 2021 08:02:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=qJtRiejhpVtFXcVPsjBiYGG7I69
 KRTaqTQJsvvbe2E4=; b=CyE/v0JXbbThqfo/tUtqM+WmojH4HWBWrZ1dgPzXkoV
 Jp9jtnGkiWS1Sa9jXRTQFQ0oKy8yEQu8llRcXZgCDFzq/qgvI7r/M03zRKw4ts79
 iWx9x7m2H/tbonAap8ZKZTWxjChQtaUpuNaiap7V0UbgLjjvKcGdAHYrvXaAYnwD
 h/Ort2WbjAEvUAvVUJqsLECdgwfpBMhf7SVIOt4xki2mvzghwpN4mE50uatYwCFi
 EVdizJwBvC7LzhSQtZ1erJxWd3QOd5v1SuvbEfmRvLUs4YUHbRGWmNez5QpZdP/B
 XCuar99546FUvzK1Yg9tmIragiqCRYno/FPBcrTcvyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=qJtRie
 jhpVtFXcVPsjBiYGG7I69KRTaqTQJsvvbe2E4=; b=fUF3H3m1ZxzmNSxxFOcrzo
 Owq/RxpAXzD00YD9h3NZ65O+VhBlfEBQCDTnANuPUUbtALBlJdR677WyrmcmupB8
 OOHZMZRRQDuS5BbKl3ASR+db+g2kPa+foXHDuQbWhkfwfLyYbkfIERrEZnwgr82v
 UR4RGkrfoCZOKfNNY02gtidYFOS2htA4cyFpW7fOX2fNnAXxpY2BjipX7bheBIIZ
 5RFxOw2VSxIOHcjsZ9o1+4ipE3epTGXU7sIVDtcmvRjsiNs49tqIh2hOnUzstHc9
 UzUs/KblqqrunKZu1UmadOW/8wbyjKOtg7uggZ1x4YtPCDgh49C4lL7RkBF1ubxg
 ==
X-ME-Sender: <xms:VpF6YasPTlORop_VIPrc12rx7Eni0weozv_YbNqzQx-znLzNfDUxMQ>
 <xme:VpF6Yfdp6p0Cez3YVCB6mTxpy4hyovgv79sU-N8yFLoW2CQAucThhpO9g1e9or8U1
 AK7DDPES6BOv1YFkng>
X-ME-Received: <xmr:VpF6YVxgF7G8zMM7p6A7JLlYIBciJHcSxckJOpMogbUfa5te_cl7SA2fkA63sJc8vMF8AwAWJ_kz2j1QxyOmINgYHZERpvcQVIibl4pUYtuJkw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegvddggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:VpF6YVMbOkkMT5Xd7t-SL8PKZe143nNBA2EvTIE1xBG_BzLHMQW6DQ>
 <xmx:VpF6Ya_4Ecl1sxfrrII9kMDlR9CvUfjshIXhrRkuIOF-Ox9IKVgM7A>
 <xmx:VpF6YdW4TkbjIgePYkjf_LWltCublIm3zRXoJrrvr7oTEulsGRG2jg>
 <xmx:V5F6Yeag5u_GUuODH7heCUcicgkGCQKLu31GO7Hnzg5pCkArMJREpA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Oct 2021 08:02:30 -0400 (EDT)
Date: Thu, 28 Oct 2021 07:02:28 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: John Wedig <johnwedig@google.com>
Subject: Re: eStoraged repo
Message-ID: <YXqRVDLyCL/IYwa2@heinlein>
References: <CACejXs+LALZsTbVazgLjOP-K2d89sgTT0jVLpTKiFECfZdcYjQ@mail.gmail.com>
 <YXlbNoBeD/yE/bg/@heinlein>
 <CACejXsJK1+D+HqxZGgrfeEtVVwY6bQ_HzSTUuR3F_9YAgZPV+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DQrabjv+oxjmBE3p"
Content-Disposition: inline
In-Reply-To: <CACejXsJK1+D+HqxZGgrfeEtVVwY6bQ_HzSTUuR3F_9YAgZPV+Q@mail.gmail.com>
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
Cc: Brandon Kim <brandonkim@google.com>, John Broadbent <jebr@google.com>,
 bradleyb@fuzziesquirrel.com, openbmc@lists.ozlabs.org,
 William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--DQrabjv+oxjmBE3p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 27, 2021 at 04:38:15PM -0700, John Wedig wrote:

> William and Brandon (CC'd on this email) have agreed to be the initial
> maintainers for this new repo. Let me know if you have any other question=
s.

SGTM.

--=20
Patrick Williams

--DQrabjv+oxjmBE3p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmF6kVIACgkQqwNHzC0A
wRmDBA//WPODIXFcWm3loGSfBZegS6G7GLXjhmyLdGod4CdJoluSE38YfSSo43lr
9IoBvU1/kBbuQGDqQdSUeWGhBhlVamztqO7dlk7B+yX+W3vq3ecz3g/2k61zMJmZ
xjwrJBKltrl0vkUL+cvXW+MtFgu1frgCodMsavy5Zyn+ApPlU4SSAozg/73DzOCR
WGnfot/nQ9Zsw9d2fgGv0CLaq/U14H0rF6dvZejQIE5DR4WOfa6tNwZ8amjC22la
4EvcQzJ4KohIfhzgVvn5m2tzgmXpMKPX6BUsIsluadR6e1kQweNWLWjWgB+h9NNE
L/UOooESJPaeXjTz8Q9u9VHaSFnhy59Bzyp/z0jUx3zDseh7+uUkHq1uJUCaWV/K
w+tlrXuSXO3V3b9I9AOSF374dSBZdo9QnLI0InRby9S3vSWczAbabTBO8MBe2MMY
N54TzpTxp+qHT8GfJo5X+9lEf2IC0dLUeUq5V6YHkt68I2N4x+Rn6UEUspz0v3XE
tCaHCIG+8fLV8eAdJ2cEo+iZheIGT26h40DEAlqvM2+Knz0qcMJ9N/F0gOvTHnUI
rRpQDc7EqDrMUrvZc8YPDjOCJkfAb+3ipOFkq0fB4x70fJvmhLQ+oqi2Zj1hd2gg
mUvp48sKj1gfxv6Q8jHsZ4EyFsbE6cNG0sCqTdGEiXKLn+BK4Jg=
=niYz
-----END PGP SIGNATURE-----

--DQrabjv+oxjmBE3p--
