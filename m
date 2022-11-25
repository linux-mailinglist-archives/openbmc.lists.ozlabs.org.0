Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDDF63877E
	for <lists+openbmc@lfdr.de>; Fri, 25 Nov 2022 11:26:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NJWGy125Gz3dvh
	for <lists+openbmc@lfdr.de>; Fri, 25 Nov 2022 21:26:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=jwXk+t+H;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=GeqqJwl0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=jwXk+t+H;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=GeqqJwl0;
	dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NJWGG3Q8pz3cC5
	for <openbmc@lists.ozlabs.org>; Fri, 25 Nov 2022 21:25:25 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id E07E45C0154;
	Fri, 25 Nov 2022 05:25:21 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Fri, 25 Nov 2022 05:25:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1669371921; x=1669458321; bh=rY4W1dwJTv
	+7EqlIrBEc1PJGaHApFihTX1HhUWVmKHU=; b=jwXk+t+HjoV7NboSBXE+eI/R+3
	pUHlqzlr3+KK6FB0aOdgXLrC5tTlFW50fLjZx1eBNMWpjRp6N8W0siJ3QpHO8rQQ
	8W2SteprfGGvI7t/JzCrma20Debs5QPJGQL3+UDA266iMf7dqT0nVidoPnSAJi36
	mLuHDn1QovlgzFoEPmquszV1+yB/1b4716JXmYK6rqQIsEPTUqQZFN99P1fDLnZA
	a5KrlFtVG1/4a6ZMAF3lHrqfCqHBA5BlTKvqJO1FGdSGZ1FuqyNypu8dAG0zlPuO
	OelbTlPM/FXxWsUtomWrD3FFamNBCVA6rw1ANlpJT3kSnyoJyDKzfxeOzcVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1669371921; x=1669458321; bh=rY4W1dwJTv+7EqlIrBEc1PJGaHAp
	FihTX1HhUWVmKHU=; b=GeqqJwl0MVa8Hkk3rHnpTBkIqBYjjSnihYFE0c3MrdQq
	ghay5KSp+VV6LH0jWEgWMa2tgdFURWkx6jBjhBKL9Q27i/DfAWcz3ucxz1197EO2
	lVPDVA5T0zaEU7SQEtz/fXaX0Uj6Z0vcJ5cDz1E53hkoVQe0osJch5lCZQ/94AWe
	AAqSpgg6zlNj2Mtupnqi4UaHZR0lUO3hCtfCBYzznQxLpOtUGlG5MjyvTUXN/WAL
	C7ElOoFMfsLoePaYurvlzGXaO15VccbpZUE2vSTpK8JADu7fVYNY++OStSX3es83
	2zG3hXwUhq78eJPupysZKV6ecugs0J7uDSildB/W0w==
X-ME-Sender: <xms:EZiAY76xgaByiZDlDlzn0VJIsd5U9WtpGLOOzTqflpsdNRSKB0Xc0A>
    <xme:EZiAYw5-B8RdxM5cbUEwfp1BijinPw5KpnQ9kNpew5mCO1W3TdkabefnpUa8u_7Qm
    ILDFHiXOxPxOSbyaL0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrieehgdduiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeejvddvvdduleduheejiedtheehiedvjefgleelffeigfevhffhueduhfegfeef
    heenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:EZiAYyeYuYL3d6oKfiL8By3dN-1oFQ23B29_6cnQi6a2OmQMXL9rFw>
    <xmx:EZiAY8I-kMKyvzwJ5imNvi0Hu5Yu-oRiJ5j66jfpB-UN822knu5ucQ>
    <xmx:EZiAY_LI6MISvV2AQ7k7mXGFxnfTmsGxfmDe53g1YlMSrYUMCf227A>
    <xmx:EZiAY45BJNqJJscKAANt0ZnRUCbWz7tLKK78JI0IHrL3XltYEAjEWw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id F1BDAB60086; Fri, 25 Nov 2022 05:25:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <7f43febb-0a89-4313-9c85-a7a44c231b45@app.fastmail.com>
In-Reply-To:  <CAP6Zq1ikqtKOGUZX-VAdyhs+nsvy7ah4gqRrbXVA8Gp9L46hXQ@mail.gmail.com>
References: <20221122201232.107065-1-tmaimon77@gmail.com>
 <20221122201232.107065-3-tmaimon77@gmail.com>
 <577e273d-ff9b-4d8d-b797-d7275ab8374f@app.fastmail.com>
 <CAP6Zq1ikqtKOGUZX-VAdyhs+nsvy7ah4gqRrbXVA8Gp9L46hXQ@mail.gmail.com>
Date: Fri, 25 Nov 2022 11:25:00 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Tomer Maimon" <tmaimon77@gmail.com>
Subject: Re: [PATCH v1 2/2] soc: nuvoton: add NPCM LPC BPC driver
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
Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, devicetree@vger.kernel.org, Brian Norris <briannorris@chromium.org>, benjaminfair@google.com, Sven Peter <sven@svenpeter.dev>, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, Hector Martin <marcan@marcan.st>, Nicolas Ferre <nicolas.ferre@microchip.com>, tali.perry1@gmail.com, "Conor.Dooley" <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Nov 23, 2022, at 19:01, Tomer Maimon wrote:
> On Wed, 23 Nov 2022 at 12:58, Arnd Bergmann <arnd@arndb.de> wrote:
>>
>> On Tue, Nov 22, 2022, at 21:12, Tomer Maimon wrote:
>> > Add Nuvoton BMC NPCM LPC BIOS post code (BPC) driver.
>> >
>> > The NPCM BPC monitoring two configurable I/O address written by the host
>> > on the Low Pin Count (LPC) bus.
>> >
>> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>> > ---
>> >  drivers/soc/Kconfig                |   1 +
>> >  drivers/soc/Makefile               |   1 +
>> >  drivers/soc/nuvoton/Kconfig        |  24 ++
>> >  drivers/soc/nuvoton/Makefile       |   3 +
>> >  drivers/soc/nuvoton/npcm-lpc-bpc.c | 396 +++++++++++++++++++++++++++++
>>
>> In general, I try to keep drivers/soc/ for drivers that are
>> used purely inside of the kernel and don't provide their
>> own user space ABI, those should normally be part of
>> some subsystem grouped by functionality.
>>
>> It appears that we have similar drivers for aspeed already,
>> so there is some precedent, but I would still like to ask
>> you and Joel to try to make sure the two are compatible,
>> or ideally share the code for the user-facing part of the
>> LPC driver.
> Nuvoton and Aspeed use the same user-facing code to manage the host snooping.
> https://github.com/openbmc/phosphor-host-postd

Ok, great!

>> The implementation of npcm-lpc-bpc looks fine otherwise, I only
>> noticed one minor detail that I would change:
>>
>> > +     np = pdev->dev.parent->of_node;
>> > +     if (!of_device_is_compatible(np, "nuvoton,npcm750-lpc") &&
>> > +         !of_device_is_compatible(np, "nuvoton,npcm845-lpc")) {
>> > +             dev_err(dev, "unsupported LPC device binding\n");
>> > +             return -ENODEV;
>> > +     }
>>
>> This check doesn't seem to make sense here, since those are
>> the only two types you support.
> About the LPC, I like to double check with our architectures on it
> because the BPC should working on eSPI as well.
> Maybe I should remove the LPC part.

The version you posted only has LPC support, not eSPI, so that
wouldn't work. I'm not sure how eSPI is normally represented
in device drivers, does that show up the same way as an LPC
device, or do you need to register a separate spi_driver?

If it's part of the same platform driver with different
OF compatible strings, the normal way to handle this would
be to use the .data field in the of_device_id to pass
model specific information to other parts of the driver.

     Arnd
