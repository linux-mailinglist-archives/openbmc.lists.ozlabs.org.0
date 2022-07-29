Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 975505849B0
	for <lists+openbmc@lfdr.de>; Fri, 29 Jul 2022 04:22:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvB9b32Wgz2xk8
	for <lists+openbmc@lfdr.de>; Fri, 29 Jul 2022 12:22:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=bzYDgNK/;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=vKYogvo+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=bzYDgNK/;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=vKYogvo+;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvB9647Sqz2xH0
	for <openbmc@lists.ozlabs.org>; Fri, 29 Jul 2022 12:21:46 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 5EA023200392;
	Thu, 28 Jul 2022 22:21:38 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Thu, 28 Jul 2022 22:21:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1659061297; x=
	1659147697; bh=ZVA5VAr9sEza59sj5lvDwKu99kazrI0fZD8TDnXo+Tk=; b=b
	zYDgNK/llGV+n6t9aNpOjnakMh9ttI1YaQZqxExDuvOVomghlb0NsyTpE6fxToGl
	0Ad9N5Hr1RFXa3TsiMuwrbolihfB3I7f6Li6+CC4EL7+Floe37Rc6mdbnKXHIxYl
	apJQtOlqplJYk/CZ5zFK+TL9XZYUKyK09wl0Qozd/hBhQVPye8/pcsEZT3rMG/jj
	l7RduVNbfAGl46ufpmZLDfNRlE9jPKvNqeCj2hCEooQT98L+0PXSJjafWrxJ5LC9
	mOWf1MMq3vE/BfrhFSN+/eiiyegwzB0mMcuYgLFcGcL0gBmhfVovPOoiaa0yKr08
	NcLK/ijpbXwG2PzS7GU8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659061297; x=
	1659147697; bh=ZVA5VAr9sEza59sj5lvDwKu99kazrI0fZD8TDnXo+Tk=; b=v
	KYogvo+UV1pRNyBYZXD1q0RpTo2KJg+jtl8GHqDMIxd/jsgu1v3Y4jgUWkszaJ86
	7xKEneC2UhMPRi4Um8VgbFSpbLDC86XQcDL14tNSQG/d+4VI7DqxZpqs2RC5AIkt
	wEzANjeYTCYonzJttRwAWwfZqN/GMasUUZV5dPFFH8Gj9eaOyNlIn7J3ZROxTxVs
	ej2GbHrtZJ5L8oPKRa1QAvfIa/fMQItyFMQkfD6zmdlFjRzJI2REwvAb91m6od/E
	Wf4ZDbgvFYUgW4yINJF66WWVv/RYyf4HKwe+946c9t7oppziPWrWR9L/ofIF8Nu+
	Hr1zoMR5GrYPSiQ2EanTw==
X-ME-Sender: <xms:MUTjYgksjupBXtgjhIIXFHm620ZK_VF4EECqAEsEWV78d7EwWaX0eQ>
    <xme:MUTjYv3xWkhXUtJqnoift56yTYmZ2Q8EAEhN-l0xnxJwB4KuNnWtYnoyi3brCZCYi
    jIUZe1ZuBFMVt1RgQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduiedgtdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    nhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecugg
    ftrfgrthhtvghrnhepgfeiieettdelkeehffevieetgeejgeffveefhfffkedvudefuddv
    veejgeehheevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:MUTjYuquvvZGRrVG_h8zQqTFXbUejOUOC9fHJtXL2RBCT-WAO-bdjw>
    <xmx:MUTjYskh8tCmkO_h63i4-RUcmp8cUTHh7Jm3946Yj4aN3NrN1Hn0EA>
    <xmx:MUTjYu28AjESNPsy0O1I4Sg9kHvOsY_CDnFRToBCX_FiSEyeisKPrQ>
    <xmx:MUTjYhQK0HOL99S8sNenPlxXHmfWPGrlh8iCZ1kUd5YBKet6OHu8UA>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id EB79B1700083; Thu, 28 Jul 2022 22:21:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-758-ge0d20a54e1-fm-20220729.001-ge0d20a54
Mime-Version: 1.0
Message-Id: <3f4399c2-caf3-4506-877a-4ca769bc2a37@www.fastmail.com>
In-Reply-To: <20220729001058.ec2fpmjrrkn75bf7@cheese>
References: <3df049fc-e5ec-449e-b696-a2ca86c37ed3@www.fastmail.com>
 <20220729001058.ec2fpmjrrkn75bf7@cheese>
Date: Fri, 29 Jul 2022 11:51:15 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Brad Bishop" <bradleyb@fuzziesquirrel.com>
Subject: Re: Can we improve the experience of working on OpenBMC?
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, Ed Tanous <edtanous@google.com>, Heyi Guo <guoheyi@linux.alibaba.com>, jebr@google.com, scody@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 29 Jul 2022, at 09:40, Brad Bishop wrote:
> Hi Andrew, thanks for poking at this.
>
> On Wed, Jul 27, 2022 at 10:52:04AM +0930, Andrew Jeffery wrote:
>>
>># Problems
>>
>>1. Yocto is hard
>>    1. Managing patch stacks is hard
>>    2. Yocto-specific tooling is hard
>>    3. Finding the right recipe file to inspect/modify is hard
>>    4. Yocto has too much documentation
>>2. OpenBMC has too much documentation
>
> =F0=9F=99=82 Really?=20
>

Hey, I'm just the messenger =F0=9F=98=85

But of course, I could have misinterpreted the conversation. The mind=20
map has all the quotes and reference links.

I should have mentioned that the mind map I linked to on github was=20
generated with Freemind in case anyone wants to see something more=20
sensible than raw XML.

Andrew
