Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D028C4C6016
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 01:09:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6LMl6Qtzz3bWf
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 11:09:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=ia6tmH3+;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=DLCeXARZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=ia6tmH3+; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=DLCeXARZ; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6LHD03wxz3bVd
 for <openbmc@lists.ozlabs.org>; Mon, 28 Feb 2022 11:05:11 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id AF7C55C0051;
 Sun, 27 Feb 2022 19:05:07 -0500 (EST)
Received: from imap49 ([10.202.2.99])
 by compute3.internal (MEProxy); Sun, 27 Feb 2022 19:05:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=hA3aQKlVA7gUqIAkY5jTLAeieDoK11rDfvQNAw
 ZBRpA=; b=ia6tmH3+ptN49WNTzwthuYdZVXhIbjzwcH5euQys1z9qhNzMhIySK+
 77frBGLvgJBefStCv1PCKy03Aq24inRyUTHu53NqCtNFwXCaI6xouAsZeffle3m7
 12z9iurFtwVnyp/zZEM1dwPamiuoXNAQAwdFoLa54A/1Ee81FIN8l13zM08qYZyl
 IiqgLKi63XppCkok/B8csgURagEqru3tn+psMl2r1r0rMwb/PsVd+uXE3uZGvYr7
 iRu+jxOsJGl2vJSHIZsAnE1uA1N5K4DpvNUatP3vTwOypihy8w1JPaQ36TztFzFK
 7YXo0MwLVTZhn6f4k8gvk5Rd0II4/x7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=hA3aQKlVA7gUqIAkY
 5jTLAeieDoK11rDfvQNAwZBRpA=; b=DLCeXARZdVweEfZVMgCrp67qXfMZSfz6C
 MSlWHqhHPztIYbuqx0jNckp+7/oK2aRxKgFRGtyah90e1bzoVCN/33nKk7zOrr4G
 Ct89pR5qG155bRBV68dPShJFCJsRWLJTZix8oldRuVrhC/KR5UF/l9uD/XIizgCV
 VEFMe4Q//kjWlwAU8raE5gzZgp3Sxkwk78CkobZLCkBgq4aekdx5/ih3LsvGD6Rd
 JtsOnFF42Ywg87y9fY9GkbOeKZL8+05iQsYB/s9wgDmXN0ntxJGywUhwkn1dzTlB
 vS0JFguxjaM2HURZrSn+kDVtpHH/x8qVQ48+GD4HjSeBoUifV448Q==
X-ME-Sender: <xms:shEcYjCs1cT--HG6o7K6Q05rVqFQUbT-r3eqOJzkbZeMpZDW9zNcug>
 <xme:shEcYpiM42uEY8EeB8sr8Myic6mLHXsAqsFhxMBBd6Zgw0iEUCaNExcl7ZQW1_b8H
 2j6BfbrKOhai3L8Hg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleelgddujecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:shEcYunEs8M1vlOjABZtAW4qTWE_0RCpITQrmwcH0cO5BhCcMua26w>
 <xmx:shEcYlyZI7DKa0lwViRmKIV1ey7pL0xMtIEbrVz6leA9im86MUl6PQ>
 <xmx:shEcYoS4BGBms5mgFlYQDf6uErNjs39jxx1dU-3QR6sM2z4k0Dlq8Q>
 <xmx:sxEcYjL0eToXl_q3S3MyhadkH-dCRlCNClkUvEq6eyvQ7up_oJtoYw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A9875F6007E; Sun, 27 Feb 2022 19:05:06 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4778-g14fba9972e-fm-20220217.001-g14fba997
Mime-Version: 1.0
Message-Id: <8de40c44-9953-4676-a3fb-7ecbad86ee0f@www.fastmail.com>
In-Reply-To: <d00832b5-e5af-5818-2634-a05bbb22852c@linux.intel.com>
References: <5c24d89c-4e58-4d1c-ffe2-d1586c6eceeb@linux.intel.com>
 <70fda031-ea0a-4155-81d4-74f398134bf8@www.fastmail.com>
 <CACPK8Xf+6cLOWNYpMH21KDxRX3w5W=EwheTwL-ZktJvbG_pGeg@mail.gmail.com>
 <7d792cb4-9eaf-cbdc-d39c-72217d5ebcf8@linux.intel.com>
 <CACPK8XdsoL9_aTJL2KV9KD-djtiLRsJnHqWzL6gTWOMKRkjKOw@mail.gmail.com>
 <d00832b5-e5af-5818-2634-a05bbb22852c@linux.intel.com>
Date: Mon, 28 Feb 2022 10:34:44 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH 1/2] pinctrl: aspeed: Enable pass-through on GPIOE1 and
 GPIOE3 free
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Sat, 26 Feb 2022, at 01:52, Bills, Jason M wrote:
> On 2/24/2022 9:49 PM, Joel Stanley wrote:
>> On Thu, 24 Feb 2022 at 21:03, Bills, Jason M
>> <jason.m.bills@linux.intel.com> wrote:
>>>
>>>>
>>>> Jason, you should send the patch to the upstream lists (use
>>>> get_maintainers.pl) for review.
>>> Sorry for the delay.  I found the right lists with get_maintainers.pl.
>>> Should I send these patches to the upstream lists as they are, or do
>>> they need to be tweaked?
>> 
>> You've got some review comments from Andrew and Zev that you should
>> address. I suggest replying to them, and adding the pinctrl list on
>> cc. Then when you post v2 you can send them to the upstream lists.
>> 
>> If you'd prefer to just send a v2 to the upstream lists to restart the
>> discussion you could do that too. Your call.
> Thanks! Unless I missed something, I didn't see any specific feedback 
> that would require a v2, yet.
>
> It sounded like Andrew was theorizing a better implementation and was 
> going think on it some more.  So, would it be better to wait for a 
> cleaner implementation of this before we send it upstream?

Yeah, I'm still thinking about it in the background. I think it's on me 
to cook something up before we push this further upstream.

Andrew
