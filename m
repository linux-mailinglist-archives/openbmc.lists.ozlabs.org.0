Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA19258D173
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 02:45:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1vVY4sDwz3bXy
	for <lists+openbmc@lfdr.de>; Tue,  9 Aug 2022 10:45:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=Im5k/Rfb;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Yqy7kkTx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=Im5k/Rfb;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Yqy7kkTx;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1vV70njpz2xGK
	for <openbmc@lists.ozlabs.org>; Tue,  9 Aug 2022 10:44:46 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 7EF62320091E;
	Mon,  8 Aug 2022 20:44:42 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Mon, 08 Aug 2022 20:44:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1660005882; x=
	1660092282; bh=ITdaAn5cpAGjuXlP3+iunYEJdrzYeJPgYgkRwBWnPyU=; b=I
	m5k/RfbwmE7o6aOKQx3wwrdgATLaeNZ59sWbX52ZcK1n5KYI5w8b8G2kljQKqmOI
	ERY9OsGtxriJ/Nk6bKcvnohL4VybrX7HsBtzyZRoaPLhIU3kYsT63l3jSIuNy6J7
	4TvU6lVDJIQdpjMjAeftEFaaOBaGXDjIei3fNsdfH80l9uKGTzI0Xy4aB39sGYJV
	YoJzDk5bhkEilAvh0io1SGQyZi9GnLYeJ6LsXuAjuk1hqyqncSkKDOmtgCCfqel8
	7M7IZ+Zd8mzNIlG21bJ7JpUXJHnZ89sFWqB8sNJhkvufDkWIg722gSPp1hNgbC50
	BEpFEn9KCdAGOm9lP6fNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1660005882; x=
	1660092282; bh=ITdaAn5cpAGjuXlP3+iunYEJdrzYeJPgYgkRwBWnPyU=; b=Y
	qy7kkTx+WDWFU4aDuSUG2jsk2P6/vKn01DNcPikd0ctVdNqIUeNfuPCGY7ByI+JZ
	LG9A9BwiqUQSFlP8bfQ46/S9987UloX5dUG/amxE00eAjquq7AYEc5NPzpKO6Wom
	NbpQIiYf0qfN8W0t6wuBB+tkgWrtXDsk56HZ3zgx25Md4wNISTR+iNbjKTz8n7H9
	14XBl/Kk8e4sjE3GYjihw/+TrvyVmNLnIIdNbdnVJe4uqCwxAqg4dqNayVU/Xxbe
	vFKkK3BVwL9vsa0TmrFW+pe8aWV2vvpuZ+SfrBwMbaNcD9tQlcAtkGl9yZxRZrIn
	LLCjThou68J+z0scXDVjQ==
X-ME-Sender: <xms:-a3xYhWWwAdrBph8omBQq_UTcTEN1tzQdz1Jdv95uxfeNJgkh7kEIw>
    <xme:-a3xYhnhKC0xDYCGoVGoRDZnKIgLy8QLEPMU2Q_3oCqxIxWl5iXchzJ7e9xMWINZl
    i_qosE1BTSkj9lDsw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefledgfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    nhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecugg
    ftrfgrthhtvghrnhepgfeiieettdelkeehffevieetgeejgeffveefhfffkedvudefuddv
    veejgeehheevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:-a3xYtalEB0MRyCa8kPXyeepLRUOdaL_iLJQbgOWJf5jBCEbw9Um0w>
    <xmx:-a3xYkVMQA-JylGgh1T6NNlujza5aRqbc8XNNtij4YfFYWEjb17v5w>
    <xmx:-a3xYrk7xqRq09ujysahvGAucVSmkH7wfWHxp_JAQ4kXZzR0fQCXnw>
    <xmx:-q3xYmsa9ulgF0UyCs9xBdxVGeyRrOXIY1PGpKz2Ya6bJAGqbA2vkw>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 523561700082; Mon,  8 Aug 2022 20:44:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-758-ge0d20a54e1-fm-20220729.001-ge0d20a54
Mime-Version: 1.0
Message-Id: <48aae9a5-89fc-4d87-be1b-5c0639f5330c@www.fastmail.com>
In-Reply-To: <7f80cb3f-def3-f9ca-58f2-eebe053dfd89@yadro.com>
References: <3df049fc-e5ec-449e-b696-a2ca86c37ed3@www.fastmail.com>
 <7f80cb3f-def3-f9ca-58f2-eebe053dfd89@yadro.com>
Date: Tue, 09 Aug 2022 10:14:21 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Alexander Amelkin" <a.amelkin@yadro.com>, openbmc@lists.ozlabs.org
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
Cc: Benjamin Fair <benjaminfair@google.com>, Ed Tanous <edtanous@google.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>, Heyi Guo <guoheyi@linux.alibaba.com>, jebr@google.com, scody@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 2 Aug 2022, at 06:57, Alexander Amelkin wrote:
> Hi Andrew!
>
> 27.07.2022 04:22, Andrew Jeffery =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> # Problems
>>
>> 1. Yocto is hard
>>      1. Managing patch stacks is hard
>>      2. Yocto-specific tooling is hard
>>      3. Finding the right recipe file to inspect/modify is hard
>>      4. Yocto has too much documentation
>> 2. OpenBMC has too much documentation
>> 3. Querying design/implementation/bug properties across the project i=
s hard
>> 4. Coordinating breaking changes is hard
>> 5. Coordinating tree-wide changes is hard
>> 6. Identifying the right repo to file a bug against is hard
>> 7. Transferring bugs between repos is hard
>> 8. Bug reports are duplicated across repos
>> 9. Bug reports are ignored
>> 10. Working out where to submit a patch is hard
>> 11. Getting patches reviewed is hard
>> 12. New repo requests are bottle-necked
>
> To the list of the problems I would add:
>
> 13. D-Bus is hard for newcomers not familiar with it, best practices a=
re=20
> not described,
> inter-process synchronization when accessing large d-bus objects (like=20
> network interfaces)
> is not inherent to d-bus, and auxiliary synchronization using standard=20
> POSIX means is neither
> explicitly requested/advised, nor controlled/enforced. All that may le=
ad=20
> (and have previously led) to
> races and various other problems.
> Add to that the long and inconvenient=20
> prefixing that we've
> discussed earlier in another thread where Brad has supported my point =
of=20
> those being useless
> to the project.
>
> 14. D-Bus may become a bottleneck or a slowing factor (due to the=20
> context switching overhead) for
> the situations when two processes are communicating actively. A standa=
rd=20
> POSIX IPC like pipes,
> mq or shm could become a solution (with d-bus or any other method used=20
> as an aid to negotiate
> names, keys, or whatever other credentials needed to access a common I=
PC).

So to confirm I've understood your concerns and to distill it down to=20
specific things people can agree or disagree with, I have:

* DBus concepts are hard
* Designing for DBus is hard
* DBus use is awkward
* DBus is slow
* Unconventional, OpenBMC-specific DBus patterns are mostly tribal knowl=
edge

Is that fair?

Andrew
