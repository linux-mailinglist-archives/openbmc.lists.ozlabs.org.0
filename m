Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F1057AF89
	for <lists+openbmc@lfdr.de>; Wed, 20 Jul 2022 05:41:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnhMD3Nwzz3bmD
	for <lists+openbmc@lfdr.de>; Wed, 20 Jul 2022 13:41:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=F7hUjRof;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Ofzo7//F;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=F7hUjRof;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Ofzo7//F;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LnhLj51gQz2xmr
	for <openbmc@lists.ozlabs.org>; Wed, 20 Jul 2022 13:41:00 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 3330232003F4;
	Tue, 19 Jul 2022 23:40:56 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Tue, 19 Jul 2022 23:40:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1658288455; x=1658374855; bh=T9qcQri+TZ
	WU6Mu0zFnWKdGF5W906ViAep9ASGl0yOI=; b=F7hUjRofDgKN9TskaTN4cBBhfk
	WBtxOEeFu4SI1LSVXXegFzvc3I1r49ZfGO4YFfAvBu2VE3ChD1fF5+F6KPStr6ul
	tO72LD4npWirz00JXAv0rkfM6DIWzSa0oRZspuRcSP5nr84UUF680YDQ+J5gxIdX
	LXOfAOATSL3A+ZNb4QVsJRJXCFd156+jI97h6NeKR3DlPwUWID08a2YAAGBEmPmC
	pCDWcvXKXtB31N0PYaphzUIbgoaejI9+07USdlaUVq8wwbbRj2vNowDILv3QT+xB
	S1MxYihvadC3gh/yKM+yae5MYu5LXrQufBfrgfb/BV38oJZuTSR7mXYaVGDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658288455; x=1658374855; bh=T9qcQri+TZWU6Mu0zFnWKdGF5W90
	6ViAep9ASGl0yOI=; b=Ofzo7//FnSKuRTGJ9J5PukztBBO9ZQlm5ZuOxqd2aTE8
	GQui3+P7mM2BDbjJU2Zis0XHMSs0Zio4fBCgFv0dBX2ah5syh9w8czBUyAbGpO9q
	Kz2jd1lJ8RoGB0BneSRsqt5Jcsklg64WurMVx+QBuFi+F9lDgGa5KYiEmBhiQEyb
	N5hCJFNGkbV16oIH7K8BNybbb6I3mNipS7cqgHQT/M6L8X4S/tWhiZQ0v2elPW84
	XmD3obHKxC4GHArwA2llPYYd85vq9hDqgFhsUGpXWDDCYzW4b3wyM78oswpV9Enu
	MGrC5+8hljYkEpIQet9P3IvzwNJeg09SqhXf9oQShQ==
X-ME-Sender: <xms:R3nXYnRJanO6RTGcopnrr0kxfJzFVEhM2GTyx5_vdAt8kmS0wDc7VQ>
    <xme:R3nXYoyaJTm_hd_zDPkTzNmGSiDtPvXTvCLp5zCRYAXrYs9y8FMzimnm2unorzLxT
    QlgREbdeKyD8gJhug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeluddgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdludejmdenucfjughrpefofg
    ggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughrvgifucflvghf
    fhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpe
    ekfeelkeeffeevieffkeegtddtieetgeejgfeigfefleevkedutdeugeeikeduvdenucff
    ohhmrghinhepohhpvghnsghmtgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:R3nXYs3tTPZ_9u1hoHGl2kqTqDiVCz7cOs0378oqfglts-HgwzSzog>
    <xmx:R3nXYnDaRkAHyfoKOYrWDbNeQCGycr3zEwmuH2C46Y-O-fuQpbbZWw>
    <xmx:R3nXYghm78F3edMU-51DwOgQ7jFOBYs5Hs6Ara3ybUqLtLx9q774VA>
    <xmx:R3nXYucS1nIOwqqerEL0UQhkH7jSXvCVEbtwET2jk12uKqhGSj6HJg>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5B88D170007E; Tue, 19 Jul 2022 23:40:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-755-g3e1da8b93f-fm-20220708.002-g3e1da8b9
Mime-Version: 1.0
Message-Id: <8495890e-1e25-40e3-885e-8bc5bf44f3dd@www.fastmail.com>
In-Reply-To: <9ac589e0-d882-431b-898c-9a5e046d0b31@www.fastmail.com>
References:  <MN2PR21MB118426E5D86B645A1ADF887AC8889@MN2PR21MB1184.namprd21.prod.outlook.com>
 <YtPrcDzaxXiM6vYJ@heinlein.stwcx.org.github.beta.tailscale.net>
 <1234822.1658139049@dooku>
 <9ac589e0-d882-431b-898c-9a5e046d0b31@www.fastmail.com>
Date: Wed, 20 Jul 2022 13:10:34 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org, "Michael Richardson" <mcr@sandelman.ca>
Subject: Re: Extending phosphor-gpio-monitor to expose gpio objects on dbus
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Sorry, I hit "Reply to List" rather than "Reply to All"

On Tue, 19 Jul 2022, at 08:59, Andrew Jeffery wrote:
> Hi Michael,
>
> On Mon, 18 Jul 2022, at 19:40, Michael Richardson wrote:
>> Patrick Williams <patrick@stwcx.xyz> wrote:
>>     > I'd say about every 6 months someone proposes a change to
>>     > phosphor-dbus-interface with the addition of a "Generic GPIO interface"
>>     > and it has always been rejected.  This has gotten to be so regular that
>>     > I should probably try to track them down in a list so the discussions
>>     > there can be easily referred to.
>>
>> So, clearly some developers think that they need this :-)
>>
>> I read:
>>    https://gerrit.openbmc.org/c/openbmc/docs/+/55422
>>
>> and this is good, but is little too abstract to be useful I think.
>
> Can you please provide this feedback as comments on 
> https://gerrit.openbmc.org/c/openbmc/docs/+/55422? This way we can 
> ensure all commentary is addressed before submitting the patch.
>
> Thanks,
>
> Andrew
