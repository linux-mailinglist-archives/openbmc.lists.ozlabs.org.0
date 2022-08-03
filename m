Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFAC588CDC
	for <lists+openbmc@lfdr.de>; Wed,  3 Aug 2022 15:18:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LyXV33csGz3bY3
	for <lists+openbmc@lfdr.de>; Wed,  3 Aug 2022 23:18:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=iFs7WaDC;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=g4g+IMRg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=iFs7WaDC;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=g4g+IMRg;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LyXTY3r4Fz2xVt
	for <openbmc@lists.ozlabs.org>; Wed,  3 Aug 2022 23:17:36 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 2F16E5C0193;
	Wed,  3 Aug 2022 09:17:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 03 Aug 2022 09:17:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1659532652; x=1659619052; bh=HC2P3YWEXg
	j9yWkfsMZ7uRdr3i8ecf1wPH6J36nhfo8=; b=iFs7WaDCvS6xEIzL6lUrM17AgX
	pXb2qOvFH6UrpvRyDb9p6uOvVjyhIE/CNNq/ulTfBoGH6JCoQiyG0lQiPAHNSncX
	qVsK9lwwI7gQEg78CvyTtH7uaYi0vpnMgWh9Ii1biQ6hXBC3RqDnZDZNsNuiA6k3
	tqzA28mDwXgvQEAEuCKrwNEuBJbmwVYeEEzWRVfIwcLVRbvfbys7t/Ytc3iD3JT9
	CbZdQkzBQa8NycXDpFzvWt7cwISEmH6knTP9AdywAd/3sS5lvHVZJUGvq4o2tMfY
	orsamLArsO+zDMxil7ITstSz/YmGJFp2GzeWqq433ZcT+8s3+se75uWVMvzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659532652; x=
	1659619052; bh=HC2P3YWEXgj9yWkfsMZ7uRdr3i8ecf1wPH6J36nhfo8=; b=g
	4g+IMRg7xfJcTQdgV8Z20ApwWIchm+Ga+LPhdF5ENG8qzArANDuXcM9AJgVTvEk7
	jghQHr72pp1demY7Cy3JYGr9VB8NFJoB6acLb4wyN8uYHePwbl6xTkuNW4oZeWOX
	cfnZY/w22Z1OEoq3ByhPx6jHCaA7UdHRwDNsgJNS0Vx26Y4XSQM2oxSJC6GdM+cR
	rZ9MIoWJ0/Y/JSDv+/kdCqIquBh+QKOBNbe5mxGbmsJrh6uZgBmTKVl1tHc0SpGV
	czZJIk6+kWgNqe3a3awVJGfzOj6875RW+6py84FgFJcwgnI2I2On96mA8e8huftD
	isI4UnOmdLt4x2b1rsVYg==
X-ME-Sender: <xms:a3XqYtP3OdWjCTMavi8cLBKa-CqM7sDmwB-BoBmI4ITx6sStKNPKOQ>
    <xme:a3XqYv8y0JblFcBYBYFJ1gRfdmkimDTTgwoFnLUztpQ7fYMl6RbOV3cFwcQQtJMzU
    oB0VztN2NxOcbOP70I>
X-ME-Received: <xmr:a3XqYsQo62D6_OOi2lhnwxt6bfZlam16e058S2JlEikYUHhcIF7R6UhVLuAmez5r0WRd-P85tlGHpUsgo4AE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvjedgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvveffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpeeurhgr
    ugcuuehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtg
    homheqnecuggftrfgrthhtvghrnhepgeetkedufeetjeehveefheektdeifedvhfeilefh
    ieehvdehvddtudfguefgieetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtgho
    mh
X-ME-Proxy: <xmx:a3XqYpvfU1x9useuIpWC5HttD8xAg3x0LDBzssS5mBld_USKol43FA>
    <xmx:a3XqYlc7w3MgMPowGlknILJ25D5kwxB6Z3c9xZHE9XsfiptB99N1yA>
    <xmx:a3XqYl0Ki1hgR4uO53BiLAc3g1KFHEXTP5H_pJP_THPhdPHDrfh3fQ>
    <xmx:bHXqYp5-de1zzwUGZ2-TddfJXtyH_R4UJwX7D9BtcATpl3oRe1F5Uw>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Aug 2022 09:17:31 -0400 (EDT)
Message-ID: <cb6f5e066833f567a9cf4fc10e8a4ca1d5af714b.camel@fuzziesquirrel.com>
Subject: Re: Request to add Yocto meta-arm to OpenBMC
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Williams <patrick@stwcx.xyz>, Benjamin Fair
	 <benjaminfair@google.com>
Date: Wed, 03 Aug 2022 09:17:30 -0400
In-Reply-To: <YuguawbhVP+y4jAv@heinlein.stwcx.org.github.beta.tailscale.net>
References: 	<CADKL2t6YYHWfw_4jt5Z+QbEV+x+bZeVB7OnQh7cceRh=VvFEPA@mail.gmail.com>
	 <YuguawbhVP+y4jAv@heinlein.stwcx.org.github.beta.tailscale.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
MIME-Version: 1.0
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
Cc: timlee660101@gmail.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>, peter@pjd.dev
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2022-08-01 at 14:50 -0500, Patrick Williams wrote:
>=20
> Brad, I don't recall the magic to do this and don't see it documented.
> Can you start the steps to get it done?

Will do.
