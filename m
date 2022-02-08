Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4BA4AE326
	for <lists+openbmc@lfdr.de>; Tue,  8 Feb 2022 22:56:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtcK32QcVz3bV8
	for <lists+openbmc@lfdr.de>; Wed,  9 Feb 2022 08:56:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=r0YGzozJ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=eEu8bJs8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=r0YGzozJ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=eEu8bJs8; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtcJb5T83z2yHL
 for <openbmc@lists.ozlabs.org>; Wed,  9 Feb 2022 08:55:43 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 7B2495C0193;
 Tue,  8 Feb 2022 16:55:39 -0500 (EST)
Received: from imap50 ([10.202.2.100])
 by compute3.internal (MEProxy); Tue, 08 Feb 2022 16:55:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=xmISKJ4ZUBu527dWBfA5I5h7NlJbJ8PL9WhBQ1
 tOcEo=; b=r0YGzozJanyr46SM3rh3/kpQI3ZZwIwOCJ5c3zFnW44eTtnhCUXHg9
 NJNyMBixZiwe6O0/+Ze8N+06diTKmBJmRlGAURXPb1OV8VKEIOHwhfKpl7rK2Qbl
 3YAvHSZm48qlkxMTERkaFSIpEHV/NfRshRRGCRWCrbxkJhMZB+s7j67RPcUO/RTa
 PKR2cSkFNVNUwmFhKxgPkNfYgPuOMvlVvCa6fuDxbdDrB7Xlp8bUh00HgJ85lCvo
 Ci7cIwOFgn0rsHds7tiojt+A+bqaSY6VsFJ6997ISbyqPS8+T6D0Nq5vymEj+s3v
 6vyis7fO+LYLnuf/9hhVwCKRs51aXZ9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xmISKJ4ZUBu527dWB
 fA5I5h7NlJbJ8PL9WhBQ1tOcEo=; b=eEu8bJs82q/mlK1/aXQELEyem24fyjMbW
 uIpbVwsj/U38yQB8FwRfvhQB5+4oVJ9ulruok6RJpqg3zqj7xXpAZzKJ4lyHuxkb
 bM+e7zQ0XvwvbfJ0W9Z02dnvNiXAD2LlMDhUyT1z5GZzrw2BRt13o8mTKZbqhq0F
 YCHz4CQspIj3Ee0UBJtsMwWCRRpcZ9l3Z0tUOJCj6UZJ7GUK2VZl6aLSZkNsyvkh
 A3YM36U0CBU8itOFBofnYFDZItIDFbHiiBtBRy5GlbgePU7W6f4qagnc6j6IbU9m
 aMkNof/0S/ej0PZHhEX3ra3BkbcNOkLaUb4GsPxCJUz0ww235LqHQ==
X-ME-Sender: <xms:2uYCYnKUsMWQOQG_p_kV8jvH7FCBThyKvNxOmqQCB-2oQBPcq-F0zw>
 <xme:2uYCYrK8m86gZUTer-8GvTYIJAAZmdxN7kTgVaxRpkHz5rGXO4x5MCaqWqFZNxcLW
 qMe71psc8hRh40Ukw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheejgdduhedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepudfftddvveekfffgteffffeuveegjeelgefhffejtdehtdfhlefgkeef
 hfefkeeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:2-YCYvubTyu6LQOjjCWJ2KyQ0t0HQO97nT75_ya0u3OSxZjOxsb5-g>
 <xmx:2-YCYgZYULGqjDJmxPX0ybVdZ38BJIttrWrzq8bvgnUqmHMe6ey8sA>
 <xmx:2-YCYuaiFkS5yuzktE6VQ59CYD6Tv7RdHuDgs20Trrzg-AkieH-iPA>
 <xmx:2-YCYuFJdEJeO--wflQ_hXYmrwXVomEeGb8V2bz0SuiSg6R9ClmGtg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E24201920084; Tue,  8 Feb 2022 16:55:38 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4748-g31a5b5f50e-fm-cal2020-20220204.001-g31a5b5f5
Mime-Version: 1.0
Message-Id: <3c14e608-ca3d-4b79-9dfa-4f65ea1fc742@www.fastmail.com>
In-Reply-To: <HK0PR06MB3779465E79CE71DEDB4F5633912C9@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20220131034147.106415-1-andrew@aj.id.au>
 <HK0PR06MB3779465E79CE71DEDB4F5633912C9@HK0PR06MB3779.apcprd06.prod.outlook.com>
Date: Wed, 09 Feb 2022 08:25:16 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
 U-Boot-Denx <u-boot@lists.denx.de>
Subject: Re: [PATCH] image: Control FIT signature verification at runtime
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
Cc: Johnny Huang <johnny_huang@aspeedtech.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Simon Glass <sjg@chromium.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 7 Feb 2022, at 11:37, ChiaWei Wang wrote:
> Hi Andrew,
>
> I am curious about the usage scenario.
> Is the runtime control required for production release?

Yes.

> As this control acts like a backdoor to bypass the chain-of-trust.

Right, just as strap pin controlling the SB ROM in the 2600 allows bypass.

It's just another one of these affecting a different boot stage.

> If it is for debugging/development purposes, should we encourage the 
> use of unsigned images under RD environments?
> Beyond this, I have no concern as the patch provides more flexibility.
>
>> From: Andrew Jeffery <andrew@aj.id.au>
>> Sent: Monday, January 31, 2022 11:42 AM
>> 
>> Some platform designs include support for disabling secure-boot via a jumper
>> on the board. Sometimes this control can be separate from the mechanism
>> enabling the root-of-trust for the platform. Add support for this latter scenario
>> by allowing boards to implement board_fit_image_require_verfied(), which is
>> then invoked in the usual FIT verification paths.
>> 
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> ---
>> Hi,
>> 
>> This patch is extracted from and motivated by a series adding run-time control
>> of FIT signature verification to u-boot in OpenBMC:
>> 
>> https://lore.kernel.org/openbmc/20220131012538.73021-1-andrew@aj.id.au/
>> 
>> Unfortunately the OpenBMC u-boot tree is quite a way behind on tracking
>> upstream and contains a bunch of out-of-tree work as well. As such I'm looking
>> to upstream the couple of changes that make sense against master.
>> 
>> Please take a look!
>> 
>> Andrew
>> 
>>  boot/Kconfig     |  8 ++++++++
>>  boot/image-fit.c | 21 +++++++++++++++++----  include/image.h  |  9
>> +++++++++
>>  3 files changed, 34 insertions(+), 4 deletions(-)
>> 
>> diff --git a/boot/Kconfig b/boot/Kconfig index c8d5906cd304..ec413151fd5a
>> 100644
>> --- a/boot/Kconfig
>> +++ b/boot/Kconfig
>> @@ -78,6 +78,14 @@ config FIT_SIGNATURE
>>  	  format support in this case, enable it using
>>  	  CONFIG_LEGACY_IMAGE_FORMAT.
>> 
>> +if FIT_SIGNATURE
>> +config FIT_RUNTIME_SIGNATURE
>> +	bool "Control verification of FIT uImages at runtime"
>> +	help
>> +	  This option allows board support to disable verification of
>> +	  signatures at runtime, for example through the state of a GPIO.
>> +endif # FIT_SIGNATURE
>> +
>
> Using "depends on" might be preferred for Kconfig dependency.

Yes, that's probably better.

Thanks for taking a look.

Andrew
