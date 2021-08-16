Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1375D3EDD65
	for <lists+openbmc@lfdr.de>; Mon, 16 Aug 2021 20:55:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpNds4NC2z304F
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 04:55:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=eUCLIA4f;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=K/pch+QT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=eUCLIA4f; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=K/pch+QT; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpNdL0XdTz2yX8
 for <openbmc@lists.ozlabs.org>; Tue, 17 Aug 2021 04:55:00 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 744605C0127;
 Mon, 16 Aug 2021 14:54:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 16 Aug 2021 14:54:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=fXz+9QCGLEVo3tTeq8ct5RwE3f8
 IOsJQR9610BscJu0=; b=eUCLIA4fQiXPkEKyoAB4bs5xZvBqnnvRXr8Q/822Mof
 J6l/tR4CzoHlLN35AqdoUuAyhQVCyNUtuRo57hwBMRhQVl7uV+Jlk9e9T0mYx9Hv
 osBjjeXXAh1u3Th5O/EAiuCxG6jpK7RLFbfMtimfdq1AmJfaGKWbFWmlKMKV84FA
 T+pfTNnFkyFovdTd+SbqLKRpYmDRL1eBKOEFS9NyKYdCH36/7oI07S6eiWxmhuup
 jT+0Anf/2nVOXlUi+PZzHgZaxp1F8Yo5m3WON1XWkJerzjE9IQg31kM8Oo/Y8v6N
 ToRAYrJGtD7VluN1TWxMIyNGwICxBB0OdY+SKXR52bA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=fXz+9Q
 CGLEVo3tTeq8ct5RwE3f8IOsJQR9610BscJu0=; b=K/pch+QTm3uDqnOq/UdlDs
 fZlfxAZYQPpJnQmF20rMH7cdEWzi0jbisI36v3K3jmcP+bYLOCdkNRDQEmUz8eNn
 w85VsGFkJNJRk3s7ddAYfAL/LzYzfClx8lCsXidPg08VqgRMR3EnBV79Y38dTAUm
 E0ibWe1JUqGPC4TavAuYd2Y7xn+et3h2yeZSZHI3UT81UdHFTioilg3mtmjnZI0F
 3BF0u/EQ5c9M9WmhVujeeDdEsN3/BAcY0K/b/2b1tWfpuMp3p6DkOoCjHwQXBn6O
 qUgRd/2nFXFqwfd/6W0VbLMaxqJ/knRMtAMupQRqSbm2mGcGVvuXIVbU5woFMRfQ
 ==
X-ME-Sender: <xms:frQaYfjW4NYAnq7VPI_OOugzCsQ8TQ4maAUsW-d5RBsDeNB2eDkkVw>
 <xme:frQaYcBzdAOI8BQc6TRU0xsdsF5LmV3FmAZtzL_qfxJxg8ULykVoqN6hc-gVAjfsG
 a30GhcUFL6JUneIhZ8>
X-ME-Received: <xmr:frQaYfEg9ESEprU2_DRixD23DTRVBM0K9MYQGt7h9NTu5lgb8HGWqj5qW5ZRDY5SV6Ka2Hxhr2k5NGYUuT5mKmwsMEEubmwgTHM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrledugdduvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:frQaYcT4mVLMHZoSLtULBj7N0tAkQ5u2yZI4hzWs8SSc2pjY6or2MQ>
 <xmx:frQaYczHAgoftQuNKJAoQWx3DeFXIJNoDalDhjveL9fnpMzW7fXM3w>
 <xmx:frQaYS72plvHKLP2FfIYJLxV4lpPzdJjdRJ0lpPnLEDr3FrIEZCwRA>
 <xmx:gLQaYbknIe9cZV7_uKpJPnn2P0ank1rLLFWSMTsO8LIW9KaekCasJQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Aug 2021 14:54:54 -0400 (EDT)
Date: Mon, 16 Aug 2021 13:54:53 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Subject: Re: Creating Hard Shutdown interfaces/alarm for NIC Sensor
Message-ID: <YRq0fULpBC1hJwhw@heinlein>
References: <CAA7TbcveKrAFSODfKKJ_q1yaPEZgvn06mBO2tXe7h=Xr6jZHLw@mail.gmail.com>
 <CAA7TbcsaM_nFeA1q=Eq6zsW1gH_73HXSCmtsc=3O0hi2s8QGfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6lZc4zPzHur0njO5"
Content-Disposition: inline
In-Reply-To: <CAA7TbcsaM_nFeA1q=Eq6zsW1gH_73HXSCmtsc=3O0hi2s8QGfA@mail.gmail.com>
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
Cc: Zhikui Ren <zhikui.ren@intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, Ed Tanous <ed@tanous.net>,
 Jayashree D <jayashree-d@hcl.com>, Amithash Prasad <amithash@fb.com>,
 velumanit@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--6lZc4zPzHur0njO5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 16, 2021 at 09:27:58PM +0530, Kumar Thangavel wrote:
>         Gentle Reminder.  Any suggestions/idea on this.

Hi Kumar,

Can you frame your original email with a question?

I'm not versed in the details here enough to know what you're underlying
concern is.  When I read the email I see mostly a list of "facts".

I suspect others are similarly not responding because they don't know what =
you
want to know or where your doubts are.

--=20
Patrick Williams

--6lZc4zPzHur0njO5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmEatHsACgkQqwNHzC0A
wRnd+xAAkMD6cDsgg7fbJ9S+OqJXLb/guSkFI/cFxAgvYsBukDOPc9ah5mPg82mc
QKjNumM5Hqb+/586KrPzq/rkLG0gyDZSPlD/Zx81gVAJ44CDhxB5jY+sTBSUfdCw
MSmOn+skLnhs1b+8egG4Nld+aJXpaqa8vL0NQPWl4CAu52pplRKzky50IWXzaqIZ
g9K8c0XoWhRdxa0ozeWaILwen8b6/ZHZJPbsqQqRJZjbbKnP3Ngb/AuOmi43LoEM
rEm0pslpM7T8qcKJxyNuGEfTVj3JtwCwJGKmAUkAJ/UXypYBxZzSvReRkliErZU2
PwFUtUC51H3Z11WaWY2MoPGiTJNqPvFPV0XA8iv6hi4NONHBgVDv90NBzTEHmA3Z
PUl3o2GtHjoHFvczm/oMTSIBAoKM1cSthpagU9Z6w6xpUJsjkQ/vEySlmJgnY4Bb
Tso34/e9aYcKAOufN0yhfhYL3LlW+gXxVYlCYsr+CEFnF87nJSvneBb3Wp0WN50W
zSQTLHeJpGgLoVDfLDUsyEUZQIGuR3wowQiE+9ZIAk2akw/urBzSCPA0e7xSW71I
PssmdMcmYeLAGyc2L+2lkM3uaLr3SWdgnKxsGhGO+jnju6q3BXUR6Lji+zbUii5Y
lA69CT87QX8+miDdgowezU4ysSaJpNyT/sOulInWyBmi7JKGUF8=
=JJ3K
-----END PGP SIGNATURE-----

--6lZc4zPzHur0njO5--
