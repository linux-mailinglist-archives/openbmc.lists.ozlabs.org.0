Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 262434A51AD
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 22:40:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnhL90HNnz2yY0
	for <lists+openbmc@lfdr.de>; Tue,  1 Feb 2022 08:40:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=FQ25v3ri;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=hKpoEvzF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=FQ25v3ri; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=hKpoEvzF; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnhKg3Ls7z2yQK
 for <openbmc@lists.ozlabs.org>; Tue,  1 Feb 2022 08:39:34 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 6BAAD3202148;
 Mon, 31 Jan 2022 16:39:30 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute3.internal (MEProxy); Mon, 31 Jan 2022 16:39:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=KVVzNJlMWKVD+1J/t/0Mv6gzLMEV0nfyl2fRK/
 VaTmE=; b=FQ25v3riPFefeSRTl8V6vETHSIpepGurQmAk/tib5x5sPc09bCIxBe
 QwFW2A2Ldk2StO7V73qPBCdOcbYt8RIfuNIwIcExhm6Gpiu7liTZUfdOrNv6yCSg
 euzL0wVECFN3v5tLCRI70T5aFkpud80zNepg9702LGVCKvAJ6WKcTmVAJVN809Ia
 QsgrdCyCfiVNBcKQqsDwNJhlN1zvNhcylbMwEgKUOeeqO6t4UIEqRCOT0mOg9ax9
 S6N5GxPj9dOlfg1rhipKKADzxfm5IP/sJdm360U4khRTdpQGv2hbcfX4jLFxqC21
 5hf6cmjdePWkfG/RJVh5+yF143VHmUsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=KVVzNJlMWKVD+1J/t
 /0Mv6gzLMEV0nfyl2fRK/VaTmE=; b=hKpoEvzFLgrzBzxxkNLwIZM2p+PQa2WIi
 hVb8aH6wFYdAozMmMEBoLhwgdtoxekmo7Kbkl8YGUkuW1oK9PYjBi2Ff01tjOjHa
 0CLqFTojatNstd7w03QYFPCe6RhI+tg9yDdE2Y+QuJfrPGT9wP7Jx3CuyeHuB06D
 cfryc5CtVpbp5E1WVVLlqBfb9F4cfqVTkg+r6vqR7CHN83F2nXeUZag+4AEt65gs
 LsbqyjfnUlRAJDKbzqRdnLc5xuj/g+sno+0IWlG0OEehKLQLkXYRMscL9uTfKm8C
 HQkRjJiSOQh9QJOYFK3ViQaZ9IqidLFefGnQZ19ZARuvHqy5eQdiw==
X-ME-Sender: <xms:EVf4YQEk4lq36LRi15aVXXCpnio24W69FupQVyNSVz9KNdh6ToRD-A>
 <xme:EVf4YZVWhDVQ37SCCoQ0Z75T298Jk76yDS97tsozTMIOJON0G7sg-VNJG32Xqo6m9
 L3KaE8xmnS7j4nbww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgedugdduheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepleekgfffkeetjefhtdffgfevjeevvddvveegudduffduudekhffhkeev
 gfeitdffnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:EVf4YaIT362AwiWJSbrGhNQIrjbRDSLElrppDjf8NLBbC3xgh8PHKw>
 <xmx:EVf4YSFU2k3IyGkBK3jAen3MUFrwSjYc__xQuZ-i9XolCBTY_uDJOQ>
 <xmx:EVf4YWU8O7bL4TRr1Gd6UAWtGwAQFUwsumB_gorxM9qtydcn8HE39Q>
 <xmx:EVf4YTiRiXrF0q8NpiWlyJdxlC3_zuwa2Ve7569lcWL3gzGp8u_oDg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 290ACAC0E99; Mon, 31 Jan 2022 16:39:29 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4585-ga9d9773056-fm-20220113.001-ga9d97730
Mime-Version: 1.0
Message-Id: <80be25bd-dd64-47fe-b3d3-0f3fd4a4ca76@www.fastmail.com>
In-Reply-To: <CAOMZO5DOSMXWK7BmfC2NVVLaZkyzsch+Z9tKsyKu1K+aPMd4_A@mail.gmail.com>
References: <20220131032405.105204-1-andrew@aj.id.au>
 <CAOMZO5DOSMXWK7BmfC2NVVLaZkyzsch+Z9tKsyKu1K+aPMd4_A@mail.gmail.com>
Date: Tue, 01 Feb 2022 08:09:08 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Fabio Estevam" <festevam@gmail.com>
Subject: Re: [PATCH] gpio: Add gpio_request_by_line_name()
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
Cc: U-Boot-Denx <u-boot@lists.denx.de>, Simon Glass <sjg@chromium.org>,
 openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Fabio, thanks for taking a look.

On Tue, 1 Feb 2022, at 02:40, Fabio Estevam wrote:
> On Mon, Jan 31, 2022 at 9:55 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>>
>> Add support for the upstream gpio-line-names property already described
>> in the common GPIO binding document[1]. The ability to search for a line
>> name allows boards to lift the implementation of common GPIO behaviours
>> away from specific line indexes on a GPIO controller.
>>
>> [1] https://github.com/devicetree-org/dt-schema/blob/3c35bfee83c2e38e2ae7af5f83eb89ca94a521e8/dtschema/schemas/gpio/gpio.yaml#L17
>>
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>
> Please also add a user for the newly introduced gpio_request_by_line_name().
>
> Otherwise, this is just dead code.

Indeed. I will be working to get some other pieces upstream so I can 
introduce a user of this API. I will resend the patch once I have that 
sorted.

My hope was that I could get a head start on any other feedback people 
might have for the patch while I work to get the other pieces together.

Cheers,

Andrew
