Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EA057791C
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 02:46:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmNZK45krz3bwr
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 10:46:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=AfZuEkOK;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=DR71T04r;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=AfZuEkOK;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=DR71T04r;
	dkim-atps=neutral
X-Greylist: delayed 551 seconds by postgrey-1.36 at boromir; Mon, 18 Jul 2022 10:46:08 AEST
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmNYr5fBfz305v
	for <openbmc@lists.ozlabs.org>; Mon, 18 Jul 2022 10:46:08 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 4529D3200344
	for <openbmc@lists.ozlabs.org>; Sun, 17 Jul 2022 20:36:52 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Sun, 17 Jul 2022 20:36:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1658104611; x=1658191011; bh=RlWX5y2iuE
	QjhD9wTb9v5PZ5NsRQMqbFsoIhcUlAGFE=; b=AfZuEkOKe9G3Ie4o9Da4Bv1M/R
	esTrTI3MgQ662mpXU5ANGCu3EhQxGZ3h73jI+SPnizKS5EZ95nL6txSF1wYISdqq
	YIg7hK7NbaOfeWEwCLA6Sz8XTmcXmZK9oWtE1vrk8zN6wbSBqVSJVkqel1L4GSJq
	up35Efps3+EJvvmmKNh8LnlMybWqDCtjPXS1zc5tHhM5Nroox/wBecsjcC7h1H5v
	z85LbV/U/jwMxqmIXuyiXp8fyz3MGDajC9yceaGbYKb5ExH7KPQsomKO+Ad3WKw2
	Lpb6cHgD9a7CTlheJ0IzSEJCbTdQocXnCUcUPUwMjCXjGHUFH/Dm13dY488Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658104611; x=1658191011; bh=RlWX5y2iuEQjhD9wTb9v5PZ5NsRQ
	MqbFsoIhcUlAGFE=; b=DR71T04r7tsXNN+iNHk3AzO3E//KyfcpgG7b0yxOwNt2
	z3wtFH6WV4wbmL542L+GAxuVuIpAJvF8S5pRx6QHxd/HnO/v+zBwsHAUvTChbk4O
	Q2pGzAWdokHgi1MBurB0rI9SBmZPG0FGQSIuAOcwvHLJgNXOiWvCUMIvMWjdrLZH
	QCUksckP7S/Y+k9AqnDfzZLOFQhiiEgKTuCRC/z1xssLYJJ8xQtYYEh9o58o3Dkh
	M3Gb1c8PZ5vtbd2HlhGlue7GRWBtBCYZWh5ZgLW4aUYqWernXw/9dQDg2EoE/NHs
	1beAZZM+q/MDlQ0JuVP+tP17t9PHPolt6owRCmnn+Q==
X-ME-Sender: <xms:I6vUYgHiSqJoDmdkpEXER_KLuIk4_huk-DuiTq0nL8eJczyWFa3JBA>
    <xme:I6vUYpU80d-QXeJ6SObvjpAJmSyPYHbvqVbzNFSscXTqpiNnG5SLTc3eRy_PU_dXb
    FKolKlHeCgxH4bYJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekjedgfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgv
    fiesrghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeekfeelkeeffeevieffkeegtd
    dtieetgeejgfeigfefleevkedutdeugeeikeduvdenucffohhmrghinhepohhpvghnsghm
    tgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:I6vUYqIBQU-2dZLxMMxSIo-HBM5U8HX56YQ-pogtip0UGrEYUTXIsQ>
    <xmx:I6vUYiGqYGjODZ3nD9lUF8NyauVoVoE2pECLmq6eYPFZbHQGeXn4oA>
    <xmx:I6vUYmXasfqC1X5btcHtT4u9ifHusqBke72GiwW--yINmcb4LuFlyA>
    <xmx:I6vUYugre0Pdo_2D9T54FFfaPADWfwVjsg_TyAE_uFw9tlxC6uC2dA>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 25E3D170007E; Sun, 17 Jul 2022 20:36:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-755-g3e1da8b93f-fm-20220708.002-g3e1da8b9
Mime-Version: 1.0
Message-Id: <f7fe06ea-0c13-4047-8efa-e30aa6c377ad@www.fastmail.com>
In-Reply-To: <YtPrcDzaxXiM6vYJ@heinlein.stwcx.org.github.beta.tailscale.net>
References:  <MN2PR21MB118426E5D86B645A1ADF887AC8889@MN2PR21MB1184.namprd21.prod.outlook.com>
 <YtPrcDzaxXiM6vYJ@heinlein.stwcx.org.github.beta.tailscale.net>
Date: Mon, 18 Jul 2022 10:06:29 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: Re: Extending phosphor-gpio-monitor to expose gpio objects on dbus
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



On Sun, 17 Jul 2022, at 20:28, Patrick Williams wrote:
> On Thu, Jul 14, 2022 at 09:52:57PM +0000, Arvind Nandanahosur Ramesh wrote:
>> Hi Everyone,
>
> Hello Arvind,
>
>> We have been toying with the idea of extending the phosphor-gpio-monitor to expose the the gpio objects it manages on dbus in addition to its current functionality of executing a specified systemd target. This additional functionality can be enabled by an additional parameter in the phosphor-multi-gpio-monitor.json file. Before going down the path of implementing this and upstreaming the changes, I wanted to get a sense on if this is a good or a bad idea. Essentially this would be useful for other services to query the current GPIO value of input signals over dbus or react to changes in its value. What did you all think ?
>
> I'd say about every 6 months someone proposes a change to
> phosphor-dbus-interface with the addition of a "Generic GPIO interface"
> and it has always been rejected.  This has gotten to be so regular that
> I should probably try to track them down in a list so the discussions
> there can be easily referred to.

I did a bit of digging and pushed this:

https://gerrit.openbmc.org/c/openbmc/docs/+/55422

Andrew
