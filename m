Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8884159298E
	for <lists+openbmc@lfdr.de>; Mon, 15 Aug 2022 08:23:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M5kkV2qnWz308w
	for <lists+openbmc@lfdr.de>; Mon, 15 Aug 2022 16:23:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=Zc95vses;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=x+5IoJQR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=Zc95vses;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=x+5IoJQR;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M5kjz4cBxz2xHD
	for <openbmc@lists.ozlabs.org>; Mon, 15 Aug 2022 16:23:19 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 33A555C008D;
	Mon, 15 Aug 2022 02:23:14 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Mon, 15 Aug 2022 02:23:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660544594; x=1660630994; bh=yfW3Y/pc/E
	/5xjKyu2sKc++H0FE104yw283LoPuVqmg=; b=Zc95vsesQYdvVdKe48JRbRx04q
	/3ffgcmVn7jj6hZghKZhJxYmSEM5u/RWqxWOyUAPHwB1uktbJb62Ls/K+4Nafn81
	hIup+5KmB3vne7XTNkc5oP5ftbHKuLvkMtVXKG4h3wm2rVuuB4hFabiK389r37qW
	5jZIGTBOaxXIy23BlZuYgFcVR/ZOXhjLBXuy5sUWB6/NX8b/zUVIiBzOdw4Du9LU
	ECZ9lkDHwjBwCQ/fDgfcYfyGbdJtj2S1hgqkBbRYYu+QZTBeEsS1Z3mdAZ3DdfPX
	fDi/9cgxPtkn/g8s/sKDcRHABzetsc3n1gxy+3KtIMdDkgJ4A5miPeHSwhjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660544594; x=1660630994; bh=yfW3Y/pc/E/5xjKyu2sKc++H0FE1
	04yw283LoPuVqmg=; b=x+5IoJQR+I8xsaN1NqtUQETpWga3XHRrm3aZoAoZDFlR
	jBboa4IV1UUa1emDGfwAoB6+5UkxtMVveIMEyFMZpHBJuWpHUMY0IIDVJQJdwSIy
	mBado+RTFWIo/SkJrFxIhvUhH5QY7EZsoVpkjBjvJ1l/B2IviydVvGuIVVlIqxO7
	ggx7ZP3JUBzgOPHatVpXvdcYRj65KYi8Mja2TieWV4YBIlFfxWwE+nt0R4PgQA0A
	oF+sZtOmNBDsJa3ZNxTlV7KRM1R43S20pg7AYXPYLaoDEc1I7hL0Ycso+VEsvkIF
	RqRYrwt00DySRrdtt9xJaPbg5DH9qEtEVx8QSTJssQ==
X-ME-Sender: <xms:Ueb5Yr1mVFf17jZLxqtHkZY8LJw2uQ3N24Y-iaiZ_DerF7gVIyMUPQ>
    <xme:Ueb5YqGob-fK-r7YnYK_K1EvMl9nH9iPtd9IqS5RCdPhcspyszJ7J0r4uaUywEcUD
    7DSm6E-JCjpe5LDoA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehuddguddutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    nhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecugg
    ftrfgrthhtvghrnhepkedvkeejkefgjeduffetteegjeekteetudevtdfftdeluddthfeh
    veefteekieetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:Ueb5Yr7K1-WdUaztRe8-guN2P0HTbk-SDvXxGg04IIxKWfWrlnJ0DQ>
    <xmx:Ueb5Yg1zE616YBrl1Pu1JKTxoJJNH3cABAD1WJASfY0bjKMsbtO2mA>
    <xmx:Ueb5YuFu5bwq54SOAK-HlT-7stTUwiGWVHwfZIotS1YkUA2kIf2TAw>
    <xmx:Uub5YqCi_hYhwSTi3_pO2Dut1lW_pe8PjGNAnwJPC6ryavj4IcWWBA>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 958971700082; Mon, 15 Aug 2022 02:23:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <f16c2ad8-d3cc-4c7f-b8a0-fc5596137647@www.fastmail.com>
In-Reply-To:  <CALNFmy0T8JUndadBQj+uwJ4g2raTCCkSrwnfgZ0ocvEp0ZeOcg@mail.gmail.com>
References: <20220630110745.345705-1-patrick.rudolph@9elements.com>
 <20220630110745.345705-2-patrick.rudolph@9elements.com>
 <945f5419-3352-4be5-b8fa-5973138f37aa@www.fastmail.com>
 <CALNFmy2-b=V2BroMOgFWZ+++NknvtvQXetVQNaJtpAYW1+iOVA@mail.gmail.com>
 <0a4b11b1-f30d-40d7-bab3-c8c188798d71@www.fastmail.com>
 <CALNFmy0T8JUndadBQj+uwJ4g2raTCCkSrwnfgZ0ocvEp0ZeOcg@mail.gmail.com>
Date: Mon, 15 Aug 2022 15:52:53 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Patrick Rudolph" <patrick.rudolph@9elements.com>
Subject: Re: [RESEND][PATCH u-boot v2019.04-aspeed-openbmc v5 1/2] arm/dts: Add IBM
 Genesis3 board
Content-Type: text/plain
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
Cc: christian.walter@9elements.com, openbmc@lists.ozlabs.org, takken@us.ibm.com, Joel Stanley <joel@jms.id.au>, Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 15 Aug 2022, at 15:11, Patrick Rudolph wrote:
> Hi Andrew,
> the first and second version of this patch were including ast2500.dtsi
> and enabled the devices.
> Joel and Zev recommended including the EVB dts to have less copy&paste code.

Ah okay, maybe I should have tracked down the earlier revisions for context.

I'll defer to Joel as he'll be merging the patches.

Andrew
