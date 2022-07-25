Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC97A58029C
	for <lists+openbmc@lfdr.de>; Mon, 25 Jul 2022 18:25:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ls545574Dz3c70
	for <lists+openbmc@lfdr.de>; Tue, 26 Jul 2022 02:25:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=pkkDwFrr;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=b5yFqg2x;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=pkkDwFrr;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=b5yFqg2x;
	dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ls53k4yFgz30LS
	for <openbmc@lists.ozlabs.org>; Tue, 26 Jul 2022 02:24:50 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id B0641320090E;
	Mon, 25 Jul 2022 12:24:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 25 Jul 2022 12:24:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1658766288; x=1658852688; bh=BhY72hSrYM
	D8gMsO4hmSRQ1pI88wx7luzPlGw5+gQi4=; b=pkkDwFrrwCx6/l2nS9sxrmT9/c
	hy1/1BoER28fQazMcVgipcFYpK6ejsXlcBnuc5zKAYWGqbtN5ZObwI7GrpgTentz
	h/kZPmxyaznEw2daBnVUhD0QJ4jJETG9mPUY4Q7C13QV3/wHhNUph4sFbVHVBWr5
	PrQo9e1NRTq3ddIKOYP30ybtzA95mzsHtr2NaXf+aQSw/2RGmWD4IzuqPeSvu2ED
	TqlbkKcmIaxxKFEYmZaZHTT/2c3I1wdMD5MU2Rl+eG/THzvjFD54yQ1rDm9BXBMW
	0Rt+UesIi0HqTwPzOTLJm2lkjCyDBoanf2aGmZlvFVcvpfoza6DuMhGjgI1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1658766288; x=
	1658852688; bh=BhY72hSrYMD8gMsO4hmSRQ1pI88wx7luzPlGw5+gQi4=; b=b
	5yFqg2xROXFb33rqjEFpHtrXXvwLKPwreze25VmgDYnQivWRcZc9rIkjBA06w+CF
	haqrVsDfvOXtSS4fIX8hF5fkAk617Nj81S2HWx78UpD/7LH7y6y3/3HvJCm0IASa
	GFqqB5ki5qvJkekTfoEQgLJClOvX0RpScZPa9pGwf2+Y341Nq/TDVqHUNxO1bEsC
	Oft1l5LU13aYfUIVTthEXRrg7+g7GdhuCfgyVbzgYDFfRfkQiN+WyERRKkiEHKCg
	CeIfrfMuXgFc6FSFWZ0NQ16xCkjdO/qgs3U/9YfLdZk01E4ja1vv6YLJP+x3UXww
	dfVyYRTuvxWEBXeLoWTIA==
X-ME-Sender: <xms:0MPeYnfDp5CKOuT-yYhu8IrjxdKqzGz9C4cO6dK90RJh4LMgR7lrvA>
    <xme:0MPeYtM_tfwbBdQK3gtS6sL_vUCFsJpbJEatyBnwjCewkdvChyZiocdZueXc95ZuL
    XkqVWGhKFFUgYNxr1c>
X-ME-Received: <xmr:0MPeYggXaDicu0PBDPmPgohr7O4Ibw02y1B4wtT_d_Q_C87Fm_ZpEehPg-et6NegsGRwFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtkedgleekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpegtggfuhfgjffevgffkfhfvofesthhqmhdt
    hhdtjeenucfhrhhomhepuehrrgguuceuihhshhhophcuoegsrhgrughlvgihsgesfhhuii
    iiihgvshhquhhirhhrvghlrdgtohhmqeenucggtffrrghtthgvrhhnpeejgeffueejjefh
    hfehgefgkeehkedutdfgieeukedugffhfeehhfeuveelkeehffenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiii
    ihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:0MPeYo9qRvl5sEqHH_chTfEnw3yufJ5kKCSf4DDd3-8Is6GHYdlljQ>
    <xmx:0MPeYjudz-DTxa7rTjR4a79YGM6uxRN2nfcYCn7Tl2aeHV1swmzm9g>
    <xmx:0MPeYnGQ89z6runJWKhKv_xUJC2JJ_mYF4xNEJaaYB85gEBRl8Mcrw>
    <xmx:0MPeYh0NLmAhMtwXj-bWs3VHqK-XhV330PK1wylpsBfKFmzpGN1BLQ>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Jul 2022 12:24:47 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: 2022H2 TOF Elections
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <YtcdwFSsS2vsWVoU@heinlein.stwcx.org.github.beta.tailscale.net>
Date: Mon, 25 Jul 2022 12:24:47 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <74405C54-7A16-4079-984C-FAFB9A3B3E8E@fuzziesquirrel.com>
References: <YtcdwFSsS2vsWVoU@heinlein.stwcx.org.github.beta.tailscale.net>
To: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: Apple Mail (2.3696.100.31)
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


> On Jul 19, 2022, at 5:10 PM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> Brad and Ed are the two members who will have their term concluded and
> the open seat is due to a resignation.  If we have 3 or less =
developers
> nominated for the TOF then the election will not be necessary.

I=E2=80=99d like to nominate myself for reelection as well.

Thanks,
Brad=
