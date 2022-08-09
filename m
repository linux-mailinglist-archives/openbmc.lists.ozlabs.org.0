Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 033ED58D269
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 05:43:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1zSM5nKVz306r
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 13:43:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=sgnSuwqh;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=cqbrdtkh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=sgnSuwqh;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=cqbrdtkh;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1zRs4SZvz2xGx
	for <openbmc@lists.ozlabs.org>; Tue,  9 Aug 2022 13:43:05 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id BE5E032008C0;
	Mon,  8 Aug 2022 23:43:01 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Mon, 08 Aug 2022 23:43:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660016581; x=1660102981; bh=ElXk4KBItU
	Yfm+wr85Cn0Gn1spjtq3AioEeFPmARxKU=; b=sgnSuwqh743+fAO5o3Gi8wfbdC
	fwA334MI87t0s1Zogfnk77++i/7uorIpDY5gPwO/J0RuXxNSSXDZOmVvy/3mtFMs
	jZeGT6+Uu0LwrrAzU1Y+cc/YVQCPxlqiFArfjCTHP5BqcUxkISmshhPmg0yz9iEp
	LcO2qYQN4pCrRv6JeqeTi/UYTppGM5oDTxFgcjSXrJ9xYWq6kPMJDQFLTWzQ5KVh
	4ZuiYlwDVGXGyUnMMwUtP4ZJDF6dAIQ5RYtF5yU8J8Pvfy3l7wl0sEHU5ITH/kTw
	pr9F1WXdgYBCMGfGu8PAE4ovM6+TCPk5LKxBTwj2iU2TRFF0F5ihDhENCNBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660016581; x=1660102981; bh=ElXk4KBItUYfm+wr85Cn0Gn1spjt
	q3AioEeFPmARxKU=; b=cqbrdtkhMBr9aOpqH4eYolBk5O2fOs26T0iaPgk1KqK5
	uI7lPGxq9rTM4q6mFERCAyUsfmBrGf6kaj1YR1B+HJCN2rXk9NE5Mz1uJNJOvl7W
	6Bwa4E6XiTWiT1OBEMiMzlC3UO14yWykUUZzauQRDLLg2GndO8Pa3ncmCR/bmqnW
	6Sw99edHCbXn4ytKHMRTg5pmM1r9OPVCGUEB95lBtfjgzwFkri+oFYl7FyVAl+dA
	stV9kUSQNYCOyWWL15w4l3oE0lTcjBB7D8CXp/gEJ+aX03xoomq5dvhNVwklN5OY
	L4HWW7GhcinRyMaSMinh7t67RPusok2y9aI3kyAuSA==
X-ME-Sender: <xms:xNfxYrsPcdlZHYdBt26iNDRfCUEHcs7FeEtBSVSP3MATcBEgYrDLAw>
    <xme:xNfxYsfQnxs2nTBWfERCk0Vz583-xS-0sYf4zXQw9014J6NdyZ3Ur27SqxkAVvS2_
    XzvVJ_qDt1b_8j1gw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefledgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
    feetkeeiteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:xNfxYuwGc1mz9ORR45joAAizcfQIdT4im-b-aWHA8y-V4V83uel0Cw>
    <xmx:xNfxYqNmpbyimuamLnm7p_6rCxCa2Mk-OMG4Si55wtmE3TjjtNFakg>
    <xmx:xNfxYr_pKiE2DMhPYgYHh438lUMxJY7tz8X5ZSu-LxLGMM9MgjyfOg>
    <xmx:xdfxYmmGTJS5qSzB095Y6sCT-x1pdyOPznBfstmJmtWzCeM5WifhQQ>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id CAF951700086; Mon,  8 Aug 2022 23:43:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-758-ge0d20a54e1-fm-20220729.001-ge0d20a54
Mime-Version: 1.0
Message-Id: <0fcf0cf5-e7b0-484d-a3d9-27f288884685@www.fastmail.com>
In-Reply-To:  <CAH2-KxAWTgmc_C_vEkB-zObOG9La-u5H0=_8YdauCkunaVsefg@mail.gmail.com>
References: <3df049fc-e5ec-449e-b696-a2ca86c37ed3@www.fastmail.com>
 <7f80cb3f-def3-f9ca-58f2-eebe053dfd89@yadro.com>
 <CAH2-KxAWTgmc_C_vEkB-zObOG9La-u5H0=_8YdauCkunaVsefg@mail.gmail.com>
Date: Tue, 09 Aug 2022 13:12:38 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ed Tanous" <edtanous@google.com>,
 "Alexander Amelkin" <a.amelkin@yadro.com>
Subject: Re: Can we improve the experience of working on OpenBMC?
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
Cc: Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, Brad Bishop <bradleyb@fuzziesquirrel.com>, Heyi Guo <guoheyi@linux.alibaba.com>, jebr@google.com, scody@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 2 Aug 2022, at 07:09, Ed Tanous wrote:
> On Mon, Aug 1, 2022 at 2:27 PM Alexander Amelkin <a.amelkin@yadro.com> wrote:
>>
>> 14. D-Bus may become a bottleneck or a slowing factor (due to the
>> context switching overhead) for
>> the situations when two processes are communicating actively. A standard
>> POSIX IPC like pipes,
>> mq or shm could become a solution (with d-bus or any other method used
>> as an aid to negotiate
>> names, keys, or whatever other credentials needed to access a common IPC).
>
> FWIW, in the original context of "a single repo would help with these
> things" I don't think either of these would be helped with a
> rearrangement of code.
>
> With that said, lots of people dislike dbus.  There are performance
> critical things (SOL, KVM, Virtual media) that have completely avoided
> it.  If you have a proposal for something better, I'd highly recommend
> writing up a design doc.

Yep, fixing this requires addressing specific concerns. Patches or 
design docs would be helpful, or even just a list of specific things 
that we think are a concern.

>
>>
>> WBR, Alexander
>>
>> P.S. All in all, I think d-bus wasn't a good choice of IPC for a system
>> running on a low-performance single-core ARM chip.

u-bmc might be something to look at here?

Andrew
