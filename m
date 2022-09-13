Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE4D5B7586
	for <lists+openbmc@lfdr.de>; Tue, 13 Sep 2022 17:47:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRnsC4s9cz3bln
	for <lists+openbmc@lfdr.de>; Wed, 14 Sep 2022 01:47:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=oqGKX5oo;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=KTPjdbpX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=oqGKX5oo;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=KTPjdbpX;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRnrj4gFgz2xn5
	for <openbmc@lists.ozlabs.org>; Wed, 14 Sep 2022 01:46:44 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id A59D032008FA;
	Tue, 13 Sep 2022 11:46:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 13 Sep 2022 11:46:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1663084000; x=1663170400; bh=q6uV0A13Hz
	CkSV9ADwvkohZBM9N5waCs5KB6Ttz+SUQ=; b=oqGKX5ooJ2EEHJPH8DIC5L+ZEs
	fOU6UdCoiLTgdHgiXYC+ta4TacLzFl6F4dozIfEef43FXf6Kyuplt45JHGHtW9kN
	xuvoeIDqHXN9xoildbZvBh1VWWsspitJO/S5xhqBiGe3HgZT8Jgi58J1KZIMsZEi
	IAOr9G/7xi5NJuPwUvdgkt+AKOmmhNQZHgMfNON53eJpynf9bVeAzHiQ4UNWT3SC
	RLJ2gxzG9vi5Guja7yI2rZF1EU3oD4ZD6w8x29219qe66uLir+RMd/Lkkp7Vm6Ne
	9GbEYJk0GVzLtvvxmmN5WaYfsk8OVestGjvrFFI7E+nnF8XvCYXGH3glQJGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663084000; x=
	1663170400; bh=q6uV0A13HzCkSV9ADwvkohZBM9N5waCs5KB6Ttz+SUQ=; b=K
	TPjdbpX06384mGPBajnSs9lAVurR/YugW4u4Z5E3yVSVAuRMkWhNxOxrjB+4W4NM
	uXwgjwvD+jhImaC3QDdmZK8xIfdO5ILWMYJGl82mfIXHnpwbYm3S/MpmvVpV8DC2
	V2VZYMaXnOqM1DXzfaHKh1GF9eFCGyOUN+H64Lja0lHRyqQRvDRWsFxXuelevMg/
	OMHI79S7W5Cq6gkt99h0P5hLPKzXuXGGsYBUtNXsF72rldfsZaU7gQwesm6Cjiui
	OUqTB8u7KERj52W2F462RtLO25zQbQpqALtsWYr7uLku4CGkyVdTnWnrh1cvWup9
	NzL6+2fO6XCoUaTYM6JWw==
X-ME-Sender: <xms:36UgY6waB0hytzwAVvV4yiezFeImPAHgXoQGivX_gu6z8kQOUtNxpQ>
    <xme:36UgY2T_ghMdDGQ1oatrGI_xTSIaWv3cmj01kNwVose1gswB4p25q9fbJEYEFxjT9
    8Q43-9tFBIRZszpJ7Q>
X-ME-Received: <xmr:36UgY8Xtyh_K-vKaRbUkfrc5pYYE9WvjXAZQ_rBxrZquSsuUmJt_ZoeH6OXRyrDohrMSnw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedugedgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtddvnecuhfhrohhmpeeurhgr
    ugcuuehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtg
    homheqnecuggftrfgrthhtvghrnhepheefkeeifeeuuedvgfekleelvdevheduteeuteek
    tdelveetieelueejffekudeunecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgih
    sgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:36UgYwinhScjc2ycS0eHCPgHI5Rg_dfrh6giZKxA0EaLKkrpmN9PHw>
    <xmx:36UgY8ASnQ-4ktE23ySSATusK-ZFqsw7VyKaIUXWv8UfOJqzFp3_cA>
    <xmx:36UgYxIYoA7BLwx4KpPNSa9c06M9xVAHbeRzegHKgWPxvSv2OF5uzg>
    <xmx:4KUgY_O3b0RZP04Fv0sWQwbbOztRQtXiXLTY27vrV5_B2RbuCdrDgA>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Sep 2022 11:46:39 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: DBus ObjectManager Interface usages within the project
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAOLfGj6Rxi6+cVoSVqY=GPUV48wNNq8FFEy0mk_zVHrNab+oSw@mail.gmail.com>
Date: Tue, 13 Sep 2022 11:46:38 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <A17313F9-E043-4949-AD49-5953AECCDA48@fuzziesquirrel.com>
References: <CAH2-KxBmFwVmF4cr+_eTFrwdz9-he--PPfRvW=cN6oNGf4KA_A@mail.gmail.com>
 <Ys6riEnZm5SP8v76@heinlein.stwcx.org.github.beta.tailscale.net>
 <CAH2-KxBYyg240d48oNRbhNyRK+JkdWrzOcjrxs2JU959=NGP+A@mail.gmail.com>
 <CAOLfGj4fje3YBb+RTwXOPEpcNVf4O9bZ4CZhpe=Ai=J8baSf_Q@mail.gmail.com>
 <CAOLfGj6Rxi6+cVoSVqY=GPUV48wNNq8FFEy0mk_zVHrNab+oSw@mail.gmail.com>
To: Nan Zhou <nanzhou@google.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
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
Cc: Ed Tanous <edtanous@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Sep 12, 2022, at 12:54 PM, Nan Zhou <nanzhou@google.com> wrote:
>=20
> I searched all the DIMM daemons in the org. =
https://github.com/openbmc/openpower-vpd-parser/search?q=3DDIMM

For what it is worth, this link is not searching the entire org, just =
the openpower-vpd-parser repository.
