Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F2759689C
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 07:29:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6xRC0NPHz2xn8
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 15:29:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=bryoZ3AF;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=CBWC3LLl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=bryoZ3AF;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=CBWC3LLl;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6xQp3YZ4z2xKf
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 15:29:22 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 74D025C012A;
	Wed, 17 Aug 2022 01:29:20 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Wed, 17 Aug 2022 01:29:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660714160; x=1660800560; bh=6LFMoRDRBQ
	jKbL4qtQQjNEig4MDhymXRDAyDjed+Xyg=; b=bryoZ3AFVSh7rrJDnjtMPg2EXI
	Llm8yzFap72YqR+jUfQfz+XE0oVSRpEsV+zPOOpp9/Ap2GOIlU1AJsqzK5L4GOoW
	2TDaIi87ZDRXRODKVtelKQ98rVaKzKEvke0DONMXxKbR7lbRGYjyFU/erKU0nZ1h
	tAzXeiTwdLnOleTvIjxp/QrqINVUKVv/ssZVQqy7CwAD61SIPMF8KPgfxd9C3LzU
	GV0P/QKDZPalEwIYWmbB63u8KXslgDX0gcUw2efwVoPBDLTkQbFD92k1FX/gYO+p
	aOsGwf7iv4ABTNMiNoIdD2jtrdx87YkfEga9sRGs23sFelRPjPJ41yFBrqog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660714160; x=1660800560; bh=6LFMoRDRBQjKbL4qtQQjNEig4MDh
	ymXRDAyDjed+Xyg=; b=CBWC3LLlZBDQqS6MgHl5AnrzcATl+Gi3/sLpSKmyWFuT
	tjzxIxan1rDznNadvrAc4McFLiBfKZYqnYamcTQiv15gsahoc3Ryj3OLKH7Jmwik
	ZFznY6VMjVw6JwDCVDJ00nBTW6euqdokeTTX/ACXW+xWMQjv6Lj5iEdcjauszLBz
	AkXqunpVX6ZOcOOEmZgTTmY8Tqplo3ntxDZpnj6Ut9Ou/SexusIO65c7W+V1L451
	XiPZpEppmHE2jSv9cQGBx3TZjq3ddmjVVKmhYgGA+oDpNcEBw0XaLOGhZUVC7u68
	RHzUHvbJFBPXJQqQwxPydVI8coHQmHYnmjCWIvAGbw==
X-ME-Sender: <xms:r3z8YkckjGRRaQa1D9U8LfEtgUqO8zUsErQTVl5Htwk5m9Hs6AvcNA>
    <xme:r3z8YmNYrQPRoGBwyFQWS6oiZ3H4HfoFrFBeWVlnaXETJX5wYNyuC1-B6zf5nmaOW
    SfKOaldHxflDfxHaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehhedgleeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:r3z8Yljs25r5ENBVtKMekva6niM14ImXnNU9X_vdnGGgf3TSZGGwXw>
    <xmx:r3z8Yp8d_vtuuaGWbLVy3Rv2oXR_IO8fZ0QircaXS8qVCWRTqJrYXg>
    <xmx:r3z8Ygs7pwZJDmXVYxHbb_Q8vKZh51wcUxNKmofkfLdFX47hX0EShA>
    <xmx:sHz8YtWdeXSMdq0eoJ9JuH8x_bYIumukbLDzGgTD9byClKAmmUIqvA>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id AD13F1700082; Wed, 17 Aug 2022 01:29:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <aa3eaa5c-a24a-4d93-8e59-e31511e21615@www.fastmail.com>
In-Reply-To: <f4a037ce-c775-df5a-171c-0752dc65dcc8@linux.microsoft.com>
References: <20220817015949.16946-1-joel@jms.id.au>
 <20220817015949.16946-2-joel@jms.id.au>
 <f4a037ce-c775-df5a-171c-0752dc65dcc8@linux.microsoft.com>
Date: Wed, 17 Aug 2022 14:58:59 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Dhananjay Phadke" <dphadke@linux.microsoft.com>,
 "Joel Stanley" <joel@jms.id.au>, "Dylan Hung" <dylan_hung@aspeedtech.com>,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 1/2] aspeed/sdram: Use device tree
 to configure ECC
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



On Wed, 17 Aug 2022, at 12:34, Dhananjay Phadke wrote:
> On 8/16/2022 6:59 PM, Joel Stanley wrote:
>> Instead of configuring ECC based on the build config, use a device tree
>> property to selectively enable ECC at runtime.
>> 
>> There are two properties:
>> 
>>    aspeed,ecc-enabled;
>>    aspeed,ecc-size = "512";
>> 
>> The enabled property is a boolean that enables ECC if it is present.
>> 
>> The size is the number of MB that should be covered by ECC. Setting it
>> to zero, or omitting it, defaults the ECC size to "auto detect".
>
> What's the use case for enabling ECC only on part of the DRAM or not
> using max possible DRAM space?
>

I have some hand-wavy concerns about the impact of ECC on the 
configuration of the AHB bridges, but that needs to be investigated 
with some experiments.

As Joel said, some feedback from Aspeed on the use-cases would be handy.

Andrew
