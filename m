Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 249AA4671D4
	for <lists+openbmc@lfdr.de>; Fri,  3 Dec 2021 07:21:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J52l407nwz3058
	for <lists+openbmc@lfdr.de>; Fri,  3 Dec 2021 17:21:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=NrYxsPP3;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=aVbGd5/e;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=NrYxsPP3; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=aVbGd5/e; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J52kY37gvz2yZv
 for <openbmc@lists.ozlabs.org>; Fri,  3 Dec 2021 17:20:36 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8A4655C0340;
 Fri,  3 Dec 2021 01:20:33 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute4.internal (MEProxy); Fri, 03 Dec 2021 01:20:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=NolDgpibMX9cQ8oCzV2c7s/wsKLOFWh
 zZAgQevKD3V8=; b=NrYxsPP3o8VSiY0SYlg6nx6L3CdgzlBrpHiTCvj+zrlp6lf
 ZSlBZacibQMlDAKAOYVAxt7UtAXSGL1Ri1wpNMtUlsHUseF0np48/UuMJPpW99f3
 2WrrXmJv1xWCTJmhcrBXu2kq2V2F7NtkMKfMiWYAzm1CdycnP96XhZqWoKPRxchs
 GgA/+19/4cdAKAwVhf29ZBW0Srtxo9TR9UaaoG3opAZv4yVmR/xMtGez/kUXLGNW
 cRyCJAfZsrmBVtUtpdN4RYvH3KSru4/ZafbppCEaL2dc/ZuyYDHvxg7wogtF3yRc
 2p0oMNhbssURe5MuNThOmV7NqQruyq6DpDsvP2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=NolDgp
 ibMX9cQ8oCzV2c7s/wsKLOFWhzZAgQevKD3V8=; b=aVbGd5/eZYkmXfYdlx+NJh
 GEcPVUSAdaUT5Ig9K6d8OEUIcZAJ017a3VyBx8JbFuStICV8pqSt28IxMRjb8qKt
 SMm9t83v3Z3/wr6VX2Ew0WucbqKieke/SZdIZDaIbG3y/qnnRUUp2y9fmJ7GaTU1
 8m/i5H6AGaJCzRlsTwkRa7QNSlhAyPg1FVzpvK+CI2UyqNltG8Qy7DqOWI8nU7z+
 CKmGJwv/dIOOy6DbL0O8EZ1Du53pnAmKo4w96rxfPRnMPM7xxEt5XV/kLQdacvHK
 54W+fOdTzBMjeET8fQQR4GNNZHfd/EfSOKsnJ8pnIviZiXYTmq/XLIuELgoCJ/EQ
 ==
X-ME-Sender: <xms:MbepYbrKigQ1C_qzySko92gpGu7NFtaMHKn0BOs95Lc_dvgUG_gqng>
 <xme:MbepYVqJqRgMI1P3IsLNo8p2vsYcQMrDkHohwe8HlBL0OMgufo-ljARvVGCqj8ffU
 H-_V0VL_LozmoAA8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieeigdeliecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:MbepYYOv7nN6nuXfk03xcV9PI5Zqhas9p3_KoVZ90U89GfwV2Tei3w>
 <xmx:MbepYe7Y93m_051lR_P3CnSflMCRAK__2CfI2rW4jXQnoZDxNkRZlg>
 <xmx:MbepYa71GDfXkXbr-9qVH6tBP9D8I6DiWVXsTVKT9jTfDYsWkG_34Q>
 <xmx:MbepYQn2ICqffieWadpY25ZqP5cTqtGc30htWfTcVhpu-G49Ke5REA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 142D5AC03DB; Fri,  3 Dec 2021 01:20:33 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4458-g51a91c06b2-fm-20211130.004-g51a91c06
Mime-Version: 1.0
Message-Id: <56d66cf6-a05f-461f-9db5-b02b30dc12b2@www.fastmail.com>
In-Reply-To: <20211203035019.GC25091@packtop>
References: <20211201072902.127542-1-joel@jms.id.au>
 <CAMRc=McG0stAC_v9_oLjwXa4=nyJVpmuyi2eVWCFA+NW9mWibg@mail.gmail.com>
 <CACPK8XcEhsz8Xk2m7bdPaFnwQ3BrKTH80r-ir_qwngTZ+FmGBQ@mail.gmail.com>
 <20211203035019.GC25091@packtop>
Date: Fri, 03 Dec 2021 16:50:12 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Zev Weiss" <zweiss@equinix.com>, "Joel Stanley" <joel@jms.id.au>
Subject: Re: [libgpiod PATCH] gpioget: Add --line-name to lookup GPIO line
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
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Eddie James <eajames@linux.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 3 Dec 2021, at 14:20, Zev Weiss wrote:
> On Wed, Dec 01, 2021 at 08:29:47PM PST, Joel Stanley wrote:
>>On Wed, 1 Dec 2021 at 08:29, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>>
>>> On Wed, Dec 1, 2021 at 8:29 AM Joel Stanley <joel@jms.id.au> wrote:
>>> >
>>> > Systems provide line names to make using GPIOs easier for userspace. Use
>>> > this feature to make the tools user friendly by adding the ability to
>>> > show the state of a named line.
>>> >
>>> >  $ gpioget --line-name power-chassis-good
>>> >  1
>>> >
>>> >  $ gpioget -L pcieslot-power
>>> >  0
>>
>>> I'm not very convinced to be honest. It's not like "gpioget gpiochip0
>>> `gpiofind gpiochip0 line-name`" requires much more typing than
>>> "gpioget gpiochip --line-name=name".
>>
>>I'm taking on feedback from people working in our labs, and
>>implementing userspace applications. We've been building BMCs with
>>mainline Linux for about six years now, and it's been a long road
>>re-training them from "back in the day we just did devmem <this>
>><that>" and "why can't we just do cat /sys/class/gpio/gpio305/value",
>>and now "why does the level of the GPIO change back after I run the
>>command?".
>>
>>This usability improvement is one more step towards them using and
>>being happy with the "new world" of the gpiod API.
>>
>>Once we settle on a good API here, I plan on submitting a version of
>>gpioget/gpioset added to busybox.
>>
>>> There are also other questions:
>>> this uses getopt and only allows to specify a single line name. What
>>> if we want to specify more lines like with offsets? Even if you allow
>>> multiple names, getopt() doesn't guarantee ordering of arguments.
>>
>>If you're happy with the concept I'm happy to iterate on the implementation.
>>
>>Yes, it only allows a single line name. That tends to be how the tool
>>is used, both from the command line and in scripts.
>>
>>Can you give me an example of your proposed command line API, so I can
>>understand what you're suggesting here?
>>
>
> My two cents: like Jeremy, I would very much welcome the ability to
> specify GPIOs by name instead of number, but the one-line-only
> limitation does seem unfortunate.  How about making a command-line flag
> that just means "line-specifier arguments should be interpreted as names
> instead of numbers"?
>
> So you could do:
>
>   $ gpioget --by-name chassis-intrusion cpu1-prochot
>   0 1
>
>   $ gpioset --by-name led-green=1 led-red=0
>

I came up with this approach as well (independently, just thinking 
about Joel's patch). I think it has good ergonomics. I hadn't figured 
out how we should interpret the arguments as line index vs line name, 
but your --by-name option solves that. I like it a lot.

Andrew
