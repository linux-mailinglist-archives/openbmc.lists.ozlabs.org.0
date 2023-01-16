Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D34ED66BC30
	for <lists+openbmc@lfdr.de>; Mon, 16 Jan 2023 11:51:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NwTN75YWgz3cCD
	for <lists+openbmc@lfdr.de>; Mon, 16 Jan 2023 21:51:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=UD/iKX/1;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=tGQuciRd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=UD/iKX/1;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=tGQuciRd;
	dkim-atps=neutral
X-Greylist: delayed 452 seconds by postgrey-1.36 at boromir; Mon, 16 Jan 2023 21:50:48 AEDT
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NwTMX1BfTz3c3N
	for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2023 21:50:48 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 166EC5C00E0;
	Mon, 16 Jan 2023 05:43:09 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Mon, 16 Jan 2023 05:43:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1673865789; x=1673952189; bh=uJ8Z29O6MR
	Aq0KRjgL+wIdJIj9qvUR4EghTVu5Hcgd4=; b=UD/iKX/1Kl0JOaM0oTDC4ga0b+
	4vOOLM0XaigJYzqEETvpcdmHOZyAmYvqxYxIRj8hZdXGiVpJXsOHsIpgatWD0vfy
	9V0D45RdfSZ7kENz+M1rOCPJIl3t/IYCZbM1LtKNoZ0684/QAZA9bwTpql2ZaOvX
	bUF0DEE0G/bbe+myjocBDQLeRHPHBHaC11lvgbWxB2F7vLyanU9GxYNtFzp7u+NG
	wYRsA/+/S8JYnRUnXw2w+VQaFo7RMlzBR2oexVRpUiFGvGsxHMOl08ixn81R2cxI
	UFE/sDYvUBeRXBilgjlHadhZr+dGyCxy/eOgaKIDKbeYrj1EzxwWVum/DvOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1673865789; x=1673952189; bh=uJ8Z29O6MRAq0KRjgL+wIdJIj9qv
	UR4EghTVu5Hcgd4=; b=tGQuciRdXH2bM3w5AMSOeDyC+VILd/9FN+/1keCB3rl6
	YIfX3S5tzymlSgcLzJ+S+LbiewBae47hJYAEecDbnzJ2m+qrlx18m/Kms5REn+PL
	HYyDmd4FhqESIAlLmD+vfhEDJgvP0xcK0y0DMxYOAiQju5PG1k9/+P3K+9vYDgFU
	XQ16213b1TgJZfU5cBNOegzfpq4wyU+az5hcXVLEnUqwdv9Kecpg6sC4A/9kA3Qp
	fhKfJ82N70Fcy4j/Ry6ptECmpQ3a0yefq/c2UQ3ShT2sg5OhHdQ3kVdZowBAKp72
	hCCFxe+Sy/sh78WZ+lD2CaO+rhl/rGg1eDRpotjv8w==
X-ME-Sender: <xms:PCrFY20He12zKsX3rvqXIl-eLwbuwlD2qC6SzoCKEjUuaa3pNSC4XQ>
    <xme:PCrFY5EzgPwL8ei9gwxT7D3TzaNkHe23BZVKu4whTzl7Q1j8RleVGALX7c-RkfIQx
    KcSNUAKipPv5SZOvQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtgedgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
    feetkeeiteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:PCrFY-6S9u-8_PsTF92Kef_P_4Us8TAw5SsZCmjhHV8VoKo75TU4nA>
    <xmx:PCrFY33PSdACtBHLbiNUqOqZBNltCyMvHqc-nZITgazpIk-mJ0Rf8g>
    <xmx:PCrFY5FqV-nzoNmjKmJ0Wpqhljia5SPJGZJ0w3HUf_Vb0a-Ubq2n6w>
    <xmx:PSrFYyO4pYtL3a8SHGg6hIoSprNJf9XwORiJVb2_4a2NystW2rWWUA>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8745A1700089; Mon, 16 Jan 2023 05:43:08 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1187-g678636ba0d-fm-20230113.001-g678636ba
Mime-Version: 1.0
Message-Id: <3d95553d-2e86-40c9-bfe3-a837bfc7f57f@app.fastmail.com>
In-Reply-To:  <SEZPR06MB5269DA226076831F4B36135DF2C19@SEZPR06MB5269.apcprd06.prod.outlook.com>
References: <20230103093702.2613574-1-ryan_chen@aspeedtech.com>
 <SEZPR06MB5269DA226076831F4B36135DF2C19@SEZPR06MB5269.apcprd06.prod.outlook.com>
Date: Mon, 16 Jan 2023 21:12:47 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ryan Chen" <ryan_chen@aspeedtech.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Joel Stanley" <joel@jms.id.au>, "Linus Walleij" <linus.walleij@linaro.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
Subject: Re: [PATCH 0/2] Add ASPEED AST2600 miss pinctrl
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 16 Jan 2023, at 14:03, Ryan Chen wrote:
> Hello Andrew,
> 	Could you help review this series patch?

Yep, I hope to get to it this week, just trying to pick up the pieces 
after the new year break :)

Andrew
