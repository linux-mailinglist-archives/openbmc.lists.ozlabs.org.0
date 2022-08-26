Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 653745A3235
	for <lists+openbmc@lfdr.de>; Sat, 27 Aug 2022 00:49:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MDw4p5ZHWz3bc8
	for <lists+openbmc@lfdr.de>; Sat, 27 Aug 2022 08:49:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=anAbeX55;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=pQWpLtvf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=anAbeX55;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=pQWpLtvf;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MDw4F4fZNz2xbC;
	Sat, 27 Aug 2022 08:49:00 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 74E6A5C0409;
	Fri, 26 Aug 2022 18:48:56 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Fri, 26 Aug 2022 18:48:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1661554136; x=1661640536; bh=MXga4g9UYI
	TGqOF8D51W6gwR+kSZb+o+/avVdF0bauo=; b=anAbeX55M56dKH5uYg6lr2OFEL
	w7OIXcCwkDsm3MAdxfwMOttNRNXrRYhUACedHx7oTJqHVCCcuEK10faDpBvvnGwX
	D076ttjNYA0+jQghEu4BOTEvUuVhvWAiKV5oGluCcXoOb1lb5E+DQQQDH7PQUYIz
	H/KVRtxGbyfsJla0ZpOTI04qb90u+QB2YOBcFTmjaOC3RZr8+TjBJqX9fd1peDA3
	+HlGZoZsgv7xvAQXXCrLUUkZnnDOSsKynSKlKXLUhM/JaO2FMZRo/5k5kvGwPIZ3
	X1GWI+GJJv7lHk2syfecqUiTBR3xOYXIlLQ8Wg4DwL9WUZVqt3bQjf+A3/Pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661554136; x=1661640536; bh=MXga4g9UYITGqOF8D51W6gwR+kSZ
	b+o+/avVdF0bauo=; b=pQWpLtvfa+h486WRDspso+lUE0LI4uWo8V2FCsRUx3Si
	Vqh9/Ft52xt5lvvEOrW62MROjzajE3Pmbe2KxMEmjGC7xpqVQCc7Z1cuDPzeKIIG
	QgIdacZYbGOxR3W5Gz1uYCvdPkMFQzv93rqR3JnuaqtMon+sECuRQtxf7IR0Mipb
	NV7rX2Kt/aHqPKpkhXp4CTBy9cKcMkULzp1IIEdgzbAIlj2DzzUv4vzlRm4dEeDi
	tbu3dX1IgzbES6cVr7gBX9go5Ms8QFw1M8Hr8mBvmCzq6kLI/Mncd5vTkvR4qKwm
	oF1jMfH782ww9nMCD9Un/XSSAQt8y6BlpijF0wgmOw==
X-ME-Sender: <xms:100JY0lFb400hCxXGyMblEcv_YVOrwddDaU8y7-X6IZNpmFkCyUlhw>
    <xme:100JYz0y4qVohGmvFuHjjieFuyF4aIHHULNlWE_36m0yMTtmlvQaOCCtprB0jf95Z
    uE2b6qRKpitRF6Kvg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejiedgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
    feetkeeiteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:100JYyqKDggMGLrUJ8mVCsfhNBH8cdOKtyC7fR3z9hPR9JZaLHhJBw>
    <xmx:100JYwn87Y0OJ4W9t1_ei72_EVxwT5gKId2ldDIC0-62AF0vQ-oJjQ>
    <xmx:100JYy0qVKF8Lcm3iqrxYP9LrgcfIqmWKzprwxedoKQf6YnSSwMLBQ>
    <xmx:2E0JY-_-45oRT2uedeVW_GVQbiOkBuX3h4I3qs6IYccjRlwC2p8Nqw>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 07F971700083; Fri, 26 Aug 2022 18:48:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <e501d2fb-aaa0-470d-a8d5-5f8e97898df7@beta.fastmail.com>
In-Reply-To:  <CACRpkdYpp_1JJQmuX27pECxN0cjzciCuETLPTrSYKqpX0FPABQ@mail.gmail.com>
References: <20220818101839.28860-1-billy_tsai@aspeedtech.com>
 <CACRpkdYpp_1JJQmuX27pECxN0cjzciCuETLPTrSYKqpX0FPABQ@mail.gmail.com>
Date: Sat, 27 Aug 2022 08:18:33 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Linus Walleij" <linus.walleij@linaro.org>,
 "Billy Tsai" <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH] pinctrl: aspeed: Force to disable the function's signal
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Joel Stanley <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Sat, 27 Aug 2022, at 07:26, Linus Walleij wrote:
> On Thu, Aug 18, 2022 at 12:18 PM Billy Tsai <billy_tsai@aspeedtech.com> wrote:
>
>> When the driver want to disable the signal of the function, it doesn't
>> need to query the state of the mux function's signal on a pin. The
>> condition below will miss the disable of the signal:
>> Ball | Default | P0 Signal | P0 Expression               | Other
>> -----+---------+-----------+-----------------------------+----------
>>  E21   GPIOG0    SD2CLK      SCU4B4[16]=1 & SCU450[1]=1    GPIOG0
>> -----+---------+-----------+-----------------------------+----------
>>  B22   GPIOG1    SD2CMD      SCU4B4[17]=1 & SCU450[1]=1    GPIOG1
>> -----+---------+-----------+-----------------------------+----------
>> Assume the register status like below:
>> SCU4B4[16] == 1 & SCU4B4[17] == 1 & SCU450[1]==1
>> After the driver set the Ball E21 to the GPIOG0:
>> SCU4B4[16] == 0 & SCU4B4[17] == 1 & SCU450[1]==0
>> When the driver want to set the Ball B22 to the GPIOG1, the condition of
>> the SD2CMD will be false causing SCU4B4[17] not to be cleared.
>>
>> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
>
> I can't see the verdict for this patch? Will there be a new
> version, or are we in the middle of a discussion?
> I'd really like Andrew's ACK on the result before merging.

Apologies, it's been a bit of A Week :)

Given the approach has been discussed with the IP designer and solves a bug I'm okay for it to be merged. If we run into issues it is easy enough to back it out.

Acked-by: Andrew Jeffery <andrew@aj.id.au>

>
> Yours,
> Linus Walleij
