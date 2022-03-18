Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AE34DD3B9
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 04:50:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKVQq5KWBz30K0
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 14:50:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=M4uaEXOC;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ZaLf+sek;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=M4uaEXOC; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=ZaLf+sek; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKVQN257bz2xsc
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2022 14:50:03 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id EFC915C018A;
 Thu, 17 Mar 2022 23:49:58 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute3.internal (MEProxy); Thu, 17 Mar 2022 23:49:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=aduxxB8r7pgf7na7R4VuYxpcQv0h1kF5wjUD3P
 2KSlc=; b=M4uaEXOCOftQk405VV1iFjA5wVhRBLirsiVPCLT2pS8xvYnOoS/V4X
 ZLKujj4XbJFOeUJhDt4VGkOK3/+eOVaXBRLWboCFlhzNcEz4S1G8aA4Y/dA2/keG
 f8aqdCjOMz5i84lDLJHgO+55Rt8kqsQhLUnlCHBuoXG6nXbqBVZ+4O7gZz/kesT4
 nUou8pU0yExDdEc8S7MYACHZpD/TMiHO/BwOrKM9IrPIQqTAoW4BCUVhVNhDCumj
 wgOgmaDLk0ae8mOPR/B+6Cbx5gemOYWFRPY0FsQKyo/4yo7ugYO+3zoFqZSMy1qw
 20b8XvU42VA4TiaNEq5zjx3O8pB2zcYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=aduxxB8r7pgf7na7R
 4VuYxpcQv0h1kF5wjUD3P2KSlc=; b=ZaLf+sekRycduIchBcfjV5g4oteCIa92h
 kDGRv486OuwySjd2s6P5umVawpHWz/o/4FyAZq/+SUUOxgvIzvu67e8vCetj8Lhw
 w5ToGeblsfO4ahtbvVLravJavyEcJKf8LUr4cbfh1Nzf2ewCbDyQbSYtDu+oksx0
 yEeagwM6qnjg6YjGjDEeg+DzymmOLIWFL1rQumEuuaB0CKw3Cv2cqWSESnSqgkh6
 BhPyNXdMwYNXP5r67kgSX/gep4HN0cJep4Dgnu6ybpcybM9SeY9bjUA8jJsyhxIV
 zzdZN9C182HMn+r2qTSbfW9B40ls5RLoaMJZQqREuJ9OjrpFSKsUQ==
X-ME-Sender: <xms:ZgE0YovUmffa7vhA4XH8l5W1KWCq-uv3goIyV2bf86Tkw12mUTeWsQ>
 <xme:ZgE0Yld9jmP7QR-8b2c8R8nhOPgt6rTHeUqxc53y_0U3jAUV15MnoVFB97uNCqXMG
 XvUG4LlAQ4dWndsmQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudefhedgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:ZgE0Yjzg2137QIjp2vwPYYbyculAPiKsNabexunIoxdY_tkPozJT0Q>
 <xmx:ZgE0YrPNR4bqzavGG9vZZtkST5qBpE-o72a-_JnllJ34nZ4fEW7ZKA>
 <xmx:ZgE0Yo8rqcatlywu6tSmMai8KaR9AcwcIagjajDiokAFu48L0HcTfg>
 <xmx:ZgE0YhJkjuvcnVJwyZddAoU8_pLPBfF6VnlCqpbs_5Mv7poRY-1GLw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A4DEEF60083; Thu, 17 Mar 2022 23:49:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4907-g25ce6f34a9-fm-20220311.001-g25ce6f34
Mime-Version: 1.0
Message-Id: <8bc1a065-9423-4426-8e6d-87c5f5cd786e@www.fastmail.com>
In-Reply-To: <AM9PR02MB64999E358D561C31D9B31060C1129@AM9PR02MB6499.eurprd02.prod.outlook.com>
References: <AM9PR02MB64999E358D561C31D9B31060C1129@AM9PR02MB6499.eurprd02.prod.outlook.com>
Date: Fri, 18 Mar 2022 14:19:38 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Govert Overgaauw" <govert.overgaauw@prodrive-technologies.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: MCTP LPC FW binding
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



On Fri, 18 Mar 2022, at 02:12, Govert Overgaauw wrote:
>>> Hello,
>>>
>>> I was wondering if anyone is/was successful in using the MCTP over LPC 
>>> binding with an intel platform? I read through the documents, it seems 
>>> to me the binding was designed to use LPC firmware cycles. To me it is 
>>> unclear if the ast2500 supports memory cycles on the LPC2AHB bridge 
>>> (datasheet seems to list it in the features, not much explanation).  
>>> The problem is that the C620 chipset doesn't support firmware cycles 
>>> (only memory and I/O cycles). And having a properly mapped window in 
>>> the C620 chipset and reserved memory in Linux. Writing and Reading to 
>>> it only returns ('1s').
>>>
>>> Writing a simple test on x86 that keeps writing a value to the mapped 
>>> registers, seems to trigger LAD[3:1] = 0xF readout on the BMC LPC host 
>>> controller register 0 (that has some debug registers to see the state 
>>> of the LPC bus). 0xF is the stop frame of a standard LPC memory cycle.
>>
>> As one of the authors of the binding, I just wanted to note that it was 
>> developed for IBM's Power systems (which support FW cycles). I haven't 
>> tried memory cycles, however there are other conditions under which you 
>> might get 0xF, such as if the LPC2AHB isn't enabled. The BMC 
>> aspeed-lpc-ctrl kernel driver should take care of this for you, however 
>> it only does so once you open the character device. From there you'll 
>> need to use the ioctl()s to switch the bridge to use the reserved 
>> memory rather than the default mapping of the host SPI-NOR.
>>
>> Andrew
>
> I can confirm that the BMC works with memory cycles on the LPC bus 
> using this binding. There was a misconfiguration on the x86 side 
> resulting
> in it not generating memory cycles on the bus.

Ah, great. Happy to look at whatever patches it took to get it going.

Andrew
