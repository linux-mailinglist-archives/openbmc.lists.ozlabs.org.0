Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B45D590C06
	for <lists+openbmc@lfdr.de>; Fri, 12 Aug 2022 08:37:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3vB52ZCJz3bXZ
	for <lists+openbmc@lfdr.de>; Fri, 12 Aug 2022 16:37:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=pjd.dev header.i=@pjd.dev header.a=rsa-sha256 header.s=fm2 header.b=pNz1Risy;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=GeuIiFQu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pjd.dev (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=peter@pjd.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=pjd.dev header.i=@pjd.dev header.a=rsa-sha256 header.s=fm2 header.b=pNz1Risy;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=GeuIiFQu;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3v9Y5vwQz2xGM
	for <openbmc@lists.ozlabs.org>; Fri, 12 Aug 2022 16:37:20 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id AAC4D5C013A;
	Fri, 12 Aug 2022 02:37:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 12 Aug 2022 02:37:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1660286233; x=1660372633; bh=GuEmN8I7qf
	YDZFGmUjcf/0nxIVgSMJTDNtj/laYDm1I=; b=pNz1RisyP83nylpKpuhnZBEaJx
	PRK3/ljVQ6gW3zu8GvrNFO/Tsymu24TKtpPXO1S0/TxWJX7aPtQucR4VjmeQ2PIr
	TecK7fAymT6tLA2e86KIAikgfS3y8Lpcedo/52tFCTYXlMnnrwNY2V6wtIJ7VooL
	vjG1VRrFN9C1nEk6iaYSb45mDaUKjqVESFChCz5Q07ONdk9QZYJpg72N69DBjlE8
	g7x1VHbm8aEWopSQCADrYPuRnWh8xZu550xBg1BenIJE+u3pKhpKDkZK//COLiSu
	DjeZSOyzBOCOUk/O0mrriIBPDa6/ELBX8W1pWPf5a+xbY5eUBITH5EOpC9Dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660286233; x=1660372633; bh=GuEmN8I7qfYDZFGmUjcf/0nxIVgS
	MJTDNtj/laYDm1I=; b=GeuIiFQulPO38QblcC+/31mYY0mZZ56179VkFmR3rFOO
	XU6u3DrC3n2QQz2F+CpqAVvZBJn019Y/9S/mZx185A2Ns+xnasfAdiz6aWOEJ/FP
	K22RyEUylVcZt635fO+aTaQTmSFhLG/CQNltgxUoHEg+ohb2LGj+vtZAeN7TzHDm
	NE1Kdi51lb+ouogfrioZ7AFUf5zZaops/rdhvBLP6fCKp8D5JX1DJsBnbuRhZ38W
	yeQCnZCHrxK4h7nKGJM5Xx+HP1eLYDuuGfJr3UARG/AO1XYmI2+Uq4C9THl/jQzC
	dgkkaSznm3GSSKErXY3nWkmtow1qOubXIXgbFB8eOg==
X-ME-Sender: <xms:GPX1YtjdN7QgmH3NaKFOb8uRt9OdYkyPtVMZdHI6SJ4SXN96pHIp7w>
    <xme:GPX1YiChLwjVNraNukeOMajwjjlgOPRYcG3L30AdlvcOzrlriN_6wYlnr7k0FqLFn
    TnfWnIoVQI4_LdpQLo>
X-ME-Received: <xmr:GPX1YtGy6ocTVXiiclCpjm34IaCQNCyrd_0drPO8z1_R0_OYMnEHEfgh-dQywT1-uGTs878CMBeC_DwrKl3uiQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeghedgudduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvght
    vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
    htthgvrhhnpeeftedufffgueeiuedtgeehtdevteefueeiieegvdeuudeggfejkefffefh
    vefgveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:GPX1YiRVJRdWdPBKV6AfmMrXK79XVfjd74DrZolSbdxz-a9dbSm8Sg>
    <xmx:GPX1Yqxc11ac19yxpePsba9lLl2_Ss9eOdMICCpVZUrOPWRCnl17_g>
    <xmx:GPX1Yo6Za47vbBc1i4EW9u04l3wHvuPT5dd7otHhRlgjg1eqz2SQNQ>
    <xmx:GfX1Yu9ibHnrkxdl94aK8MOvylhlaWjKbASjTPdo7NYlYs7Y0asZxw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Aug 2022 02:37:11 -0400 (EDT)
Date: Thu, 11 Aug 2022 23:37:09 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: TODO items for the AST2600 PWM driver
Message-ID: <YvX1Fan6RtBYUTwg@pdel-mbp.dhcp.thefacebook.com>
References: <YvQfGlro4tKsZ4T5@pdel-mbp.dhcp.thefacebook.com>
 <6A82FD4A-73CC-44C8-AF23-3CADB2A49C5F@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6A82FD4A-73CC-44C8-AF23-3CADB2A49C5F@aspeedtech.com>
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
Cc: "garnermic@gmail.com" <garnermic@gmail.com>, "joel@jms.id.au" <joel@jms.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Aug 11, 2022 at 10:55:34AM +0000, Billy Tsai wrote:
> Hi Peter,
> 
> Thanks for your organization.
> 
> On 2022/8/11, 5:12 AM, "Peter Delevoryas" <peter@pjd.dev> wrote:
> 
>     > Hey Joel and Billy,
>   
>     > I was looking at this thread from 2021, and I'm trying to figure out
>     > what we need to change to get the driver accepted upstream.
>   
>     > CACPK8XfM4C7v3keXaxMs9SkqNzb8XWbZ6QvcZXWcy3ZKJCrvWQ@mail.gmail.com <https://lore.kernel.org/lkml/<a href=>/">https://lore.kernel.org/lkml/CACPK8XfM4C7v3keXaxMs9SkqNzb8XWbZ6QvcZXWcy3ZKJCrvWQ@mail.gmail.com/
>   
>     > It seems like there's a few major things:
>   
>     > 1. Use one device tree binding, and one driver file.
>     > 2. Should be a hwmon driver and not a pwm driver.
>     > 3. Don't use regmap.
> 
> I agree to use one device tree binding and don't use regmap.
> I will fix these in the next patch.

Ok great, thanks.

> But, I am still confused by treating the PWM device to be a hwmon driver and not a PWM driver.
> As I menthion in https://lore.kernel.org/lkml/ADD1E8B8-60F0-442A-BEF1-1AA304454963@aspeedtech.com/
> I will try to add the reason, why I want to treat the driver as PWM driver instead of hwmon driver, as the link above in the next patch.

Ok, cc peter@pjd.dev

> If you have any advice, please let me know.

I'm still not 100% up to speed on this series, but it seems like having
a different kind of driver than the ast2500 is a sticking point. I would
guess that the upstream would prefer if we changed the ast2500 driver to
pwm too, or put the ast2600 driver in hwmon, but they might not like
having the ast2500 in hwmon and the ast2600 in pwm. I still don't
understand the full context of this though, maybe I'm misunderstanding.

Thanks,
Peter

> 
> Thanks,
> Billy
> 
> 
>     > And, is anybody working on this at the moment? Can someone else pick this up?
>   
>     > Thanks,
>     > Peter
>   
> 
