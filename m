Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7754A9021
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 22:44:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqXHW3DgFz3bc4
	for <lists+openbmc@lfdr.de>; Fri,  4 Feb 2022 08:44:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=hRLJnhmc;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=nKdxtaHi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=hRLJnhmc; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=nKdxtaHi; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqXH20zzNz2xXd
 for <openbmc@lists.ozlabs.org>; Fri,  4 Feb 2022 08:43:41 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id AE7675C0215;
 Thu,  3 Feb 2022 16:43:37 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute3.internal (MEProxy); Thu, 03 Feb 2022 16:43:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=SJHlTPNRpYIh14RYymXbv9xTwC1Ia1sh/RNxIi
 /Fo9o=; b=hRLJnhmc2icC9ino8hNrjki+qJyDE3UkHTvY4hLg7P1XL2unNqA0kz
 2qPsQ8gM2XPBAmjanod8t5sVRnmYCt5WBTMkRKmqvNSNcGadXzOIU0aH3Q7exwle
 ePjWw2BKRuITp7Q25mXNKVczex7D7WT0n3T9a2xdmFV9eJqcFfIiZ00TI4JnH9e/
 4ZPVO5xAMIyF18Uj2VNMO+912cdj0azJKnzx2aiuLoDFhwctnxAL/FgXa/XKT1pX
 l71SPeft8supFzZH/yex6qx/CKgc06AqOPAkaMPQsJxDy6v4FEtg1uO0pbwCXAod
 BT7ib8I/mvovrtG0yA+vU4TNA10UHxZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=SJHlTPNRpYIh14RYy
 mXbv9xTwC1Ia1sh/RNxIi/Fo9o=; b=nKdxtaHiFqvWslg197nxLsPDo2ZRTgi1R
 YLam9CzGOIs7j5bE73ZGsAmdYIUPJXKV7N4hK2sxcOs4E6Ujdsm9/pi9ZLgpz3Ey
 AmJQNJRiri33D3UFUk5y/swqeRuV604WxcwsDQSwTZHbHlsx1ZGpSivWDLd5tOMe
 PT6N5BIYjhnsZDIZ7rs7TeF701VggyiRYOmqkcfdz7KfwzwtiFSvrlktNkohnVo7
 h+qGFqiK/9ZplwzJRIMlEy4nmCbK4oXCgjcDv6bQdLGnJWBnVWccrTVNAM9xM7a4
 gWl9ITlAzRwOZUn0AQSL/oGZs+cL7uolJkrcs2U18Fxvaihm/5FpQ==
X-ME-Sender: <xms:iUz8YUxPS26fxgsjZMcw3UISuk9bpoYHP02Mbc00hyiFXXa6OZqYkQ>
 <xme:iUz8YYQnVemU2WyKABLcPS2VYP1QQ5mwtPuiPXheH23HCFlTbUMkWbJol2QhXwjku
 o8P8GJDpq7feo90CQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeejgdduhedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:iUz8YWXD0rcB6ocV2aRGaHTSXwcAkwLLtUTVhzE2WeUpLYpIGzQorg>
 <xmx:iUz8YShcSZwRk3VkdIhiO-aaqYSkDvxbcrSeZPd2dLHpE5mvp3O5vA>
 <xmx:iUz8YWDxK1XMWRWtTfk0PJdCx6FvdJvMzAjvBznYvAFNmHlrhUhPmg>
 <xmx:iUz8Yd9GXRmBKctkMVp5YNfjiGAhvs8nNntQve5XfwajsK0SoKXjuw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3314BAC0E99; Thu,  3 Feb 2022 16:43:37 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4586-g104bd556f9-fm-20220203.002-g104bd556
Mime-Version: 1.0
Message-Id: <f4599e10-9e3f-4e4a-b7b7-f001e498d905@www.fastmail.com>
In-Reply-To: <aa8e6d8c-bef7-6c8e-b0ba-2d644eaf0c27@linux.ibm.com>
References: <20220124191503.88452-1-eajames@linux.ibm.com>
 <20220124191503.88452-5-eajames@linux.ibm.com>
 <926eb042-991c-4794-9e72-84056b7f6473@www.fastmail.com>
 <aa8e6d8c-bef7-6c8e-b0ba-2d644eaf0c27@linux.ibm.com>
Date: Fri, 04 Feb 2022 08:13:16 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH U-Boot v2019.04-aspeed-openbmc 4/6] gpio: Enable hogging
 support in SPL
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



On Fri, 4 Feb 2022, at 02:17, Eddie James wrote:
> On 2/2/22 20:11, Andrew Jeffery wrote:
>>
>> On Tue, 25 Jan 2022, at 05:45, Eddie James wrote:
>>> -	if (IS_ENABLED(CONFIG_GPIO_HOG)) {
>>> +#if CONFIG_IS_ENABLED(GPIO_HOG)
>> Why switch to a CPP conditional here?
>>
>> I mean, it's not clear why there was a choice for a C conditional
>> originally, so I'm curious either way.
>
>
> Well I just thought it should match the other conditionals for GPIO_HOG, 
> and it's obviously more efficient at runtime. Other than that, no reason 
> really.

Well, I expect it will be optimised out in the C case anyway.

Doesn't matter too much.

Andrew
