Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0751531B36E
	for <lists+openbmc@lfdr.de>; Mon, 15 Feb 2021 00:36:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Df3XF64RPz30KM
	for <lists+openbmc@lfdr.de>; Mon, 15 Feb 2021 10:36:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=dyKwdlpu;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=NaTT1MK5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=dyKwdlpu; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=NaTT1MK5; 
 dkim-atps=neutral
X-Greylist: delayed 571 seconds by postgrey-1.36 at boromir;
 Mon, 15 Feb 2021 10:36:01 AEDT
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Df3X120CHz2y0G
 for <openbmc@lists.ozlabs.org>; Mon, 15 Feb 2021 10:36:00 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 583D95C0091;
 Sun, 14 Feb 2021 18:26:28 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 14 Feb 2021 18:26:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=2LBXMmzEaYfFSYGGW6smJzJH2AOomOe
 hql8U3oQ9Zw8=; b=dyKwdlpuz/54Hv4iopwcnve3IjtWaHzXjKOxRCyRCAcu4KR
 hh8Qp0AgVAfVhWZatEeSdGE9UYS0h+GWLkY8UdwpNFYcwiTEeIdeqQp5AxBFSG11
 efJDMZU50JqWcZJXWuY86q/Q5t/cqAiKS8Lxp9x1293+dEQ5KErfVXXJXUOA3G99
 IcmpiZ9iMiYddonkwOWKIZktV6xxXIbYh4UNwhKsNjs54e/j2x0lk9ttuAX7V0hl
 Pv2XoAFexNIwBKH65q7Qsh0xx7G0AZJumK4Nl3FtGFLDCq8sehBttMLJnxoZvAOo
 SF0/Wj7qDFSUvHDt0BFhwq4FujzkAO4EoFbRVKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=2LBXMm
 zEaYfFSYGGW6smJzJH2AOomOehql8U3oQ9Zw8=; b=NaTT1MK5ReAreSRI8sYU+u
 Q0FUnN3xglTqk+VPLvkpVSnVzP5tvmpjxRuJoof33r0DLMoSKlnJi+UFZ4P12YVP
 xYCFxzUAt0L7XPsJVYZ3F1ScP7DUK3g+srXojfcMpwt+F90eCffmGaIMThksEla5
 /+0IngGZ7EwU2bQKYPMn6K2NjVTb8HJ96zfTQASYir6wHZXBZe+sOpSuMxT4w/Lc
 i6p9tq7Dsg5qYND3lrSDvAm1r0/SREEwmAAoaPhBOjPu5pf3dxhpWObMfBkpesNt
 iBDblCQpS2WdlgUw1p/Uj478ZNquGRrV3v6aAECuYHTOTy+M9TDRVW6BhRtrULkg
 ==
X-ME-Sender: <xms:o7EpYBvnrWba5FUIGgz6IeQVJpOe3RMbQxOKw5aR61YU8eTlboZ_kw>
 <xme:o7EpYKfEh7Q_tLnmSr3YG-6v6LzreRfRVifDJ-GhDvN_LirqEAJ-ofZlNcVhDqNg6
 roPfCZZ6LuDUvWGlw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrieeigddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeeuueffheetffeitdejtedutedtleeltddtteekleelfeeuveelkefgffeu
 feegueenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhfrhgvvgguvghskhhtohhprd
 horhhgpdifihhrvghshhgrrhhkrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:o7EpYEwd0euCDp9k0SzF7aE7uHb70mQ5MnoVtBoeAg_hortT4DBu4g>
 <xmx:o7EpYIMtT3fsJf-wOoj-0ynLnTYZIH8XCDfJ-6F3lGZaNlUmLZxgAA>
 <xmx:o7EpYB_XoboO1NN1evNLwu8HNgsVZwd8MNCZF6BbfSiClBtJUSg7ng>
 <xmx:pLEpYGJFiy0bjPClw3eCGMrSD2k5oEeYr-eT6KopVg4rh52apd8lmw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 95637A0005E; Sun, 14 Feb 2021 18:26:27 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-141-gf094924a34-fm-20210210.001-gf094924a
Mime-Version: 1.0
Message-Id: <838ffed7-37e3-4d73-a8f9-944439df9317@www.fastmail.com>
In-Reply-To: <20210209090655.GA1147175@aspeedtech.com>
References: <PS1PR06MB260095F62386276E75ADC5708ABB0@PS1PR06MB2600.apcprd06.prod.outlook.com>
 <6ea6d5b9-0e31-4a87-8990-b5ce53e2416d@www.fastmail.com>
 <20210128072947.GB2594588@aspeedtech.com>
 <ce482992-48a2-4744-a466-60628a52ce50@www.fastmail.com>
 <20210201073724.GA2623538@aspeedtech.com>
 <20210209090655.GA1147175@aspeedtech.com>
Date: Mon, 15 Feb 2021 09:56:07 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Troy Lee" <troy_lee@aspeedtech.com>, openbmc@lists.ozlabs.org
Subject: Re: Supporting new interfaces in phosphor-ipmi-flash
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



On Tue, 9 Feb 2021, at 19:36, Troy Lee wrote:
> Hi Team,
> 
> While I'm evaluating the performance for the design, I notice that the
> maximum IPMI through/put over KCS / IPMB / LAN is about 120 command per
> second. Does anyone know where the bottleneck is?

So a few thoughts:

There are a some hints on performance profiling in the wiki:

https://github.com/openbmc/openbmc/wiki/Performance-Profiling-in-OpenBMC

However, I'd start by inspecting the message timings on D-Bus. You can capture
the D-Bus traffic on the BMC with:

```shell
# busctl capture > /tmp/dbus.pcap
```

After that, run your image transfer test. Once the transfer completes, stop the
capture and copy the pcap file off the BMC.

One approach to analysing the capture is to use Wireshark[1]. However, I've
found that for this kind of exploratory stuff, scripting the filtering and
output can give useful results. On that front I've written dbus-pcap:

https://github.com/openbmc/openbmc-tools/tree/master/dbus-pcap

which can spit out the messages in JSON format if necessary and it takes
standard D-Bus match rules for filtering as optional positional arguments:

https://dbus.freedesktop.org/doc/dbus-specification.html#message-bus-routing-match-rules

If the overhead is not dominated by the IPC on its own, it's probably time to
start inspecting specific processes with `perf`. The wiki talks a little more
about that.

Hope that helps.

Andrew

[1] https://www.wireshark.org/
