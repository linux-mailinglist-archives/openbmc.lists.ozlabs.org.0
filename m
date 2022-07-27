Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D532B58253D
	for <lists+openbmc@lfdr.de>; Wed, 27 Jul 2022 13:16:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtB6Z5XbGz3c65
	for <lists+openbmc@lfdr.de>; Wed, 27 Jul 2022 21:16:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=Ef4SNwtf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com; envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=Ef4SNwtf;
	dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LtB6572Ccz3bnT
	for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2022 21:15:41 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id B09E2411FA;
	Wed, 27 Jul 2022 11:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:organization:from:from:references:content-language:subject
	:subject:user-agent:mime-version:date:date:message-id:received
	:received:received:received; s=mta-01; t=1658920535; x=
	1660734936; bh=gMtoA78z8gMK/4gCq07hYOfhtJmXB3p0GCIce2kOTUI=; b=E
	f4SNwtfIQunEK2ypVTDn3HL2BlW09vldwfe3MJtssUA/o2kILFfbk+XCBc/SZwB5
	Nzc2EgLsItR9NzATEmQBNVRi2D0ZBu7NL7qLg/77GxZ+fqYPVAVaa6o+0Y8BxaYD
	s9u2qKxrClhwt39BIqCehnvL2WvgGm0+5PDLE0cCTM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lc3779GpBtBW; Wed, 27 Jul 2022 14:15:35 +0300 (MSK)
Received: from T-EXCH-01.corp.yadro.com (t-exch-01.corp.yadro.com [172.17.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id 429E94088A;
	Wed, 27 Jul 2022 14:15:35 +0300 (MSK)
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-EXCH-01.corp.yadro.com (172.17.10.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Wed, 27 Jul 2022 14:15:35 +0300
Received: from [10.199.0.99] (10.199.0.99) by T-EXCH-08.corp.yadro.com
 (172.17.11.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1118.9; Wed, 27 Jul
 2022 14:15:34 +0300
Message-ID: <149abf3d-7afd-7e16-eed2-2099293578da@yadro.com>
Date: Wed, 27 Jul 2022 14:15:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: dbus prefixes (was: DBus ObjectManager Interface usages within
 the project)
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>
References: <CAH2-KxBmFwVmF4cr+_eTFrwdz9-he--PPfRvW=cN6oNGf4KA_A@mail.gmail.com>
 <adb35a4e-718e-03b2-a562-2c2c6d59f3b0@yadro.com>
 <Ys6u143YCgQwujIP@heinlein.stwcx.org.github.beta.tailscale.net>
From: Alexander Amelkin <a.amelkin@yadro.com>
Organization: YADRO
In-Reply-To: <Ys6u143YCgQwujIP@heinlein.stwcx.org.github.beta.tailscale.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.199.0.99]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-08.corp.yadro.com (172.17.11.58)
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

13.07.2022 14:39, Patrick Williams пишет:
> On Wed, Jul 13, 2022 at 01:17:10PM +0300, Alexander Amelkin wrote:
>> I don't see any real reason for the project to be using this long and
>> cumbersome /xyz/openbmc_project/ prefix.
>> Why not use just '/obmc/' or `/phosphor/` ? I believe that would be more
>> than enough to separate all our services from any third-party ones on d-bus.
> FWIW, it isn't required but it is encouraged to use a reverse-domain prefix on
> paths by the dbus spec itself.

Yes, I'm aware of that. But do we actually need to follow that 
recommendation? What for?
I believe, it exists and is encouraged for big open systems to avoid 
conflicts between different pieces of software using d-bus simultaneously.

As I said, OpenBMC is a closed system where the set of software is well 
controlled. We know beforehand what software uses which prefix. I find 
this just inconvenient to use the long prefixes in these circumstances.

>
>>> Object paths are often namespaced by starting with a reversed domain
>>> name...
>> I understand why this prefixing is for in 'big' open desktop or server
>> systems where there on d-bus can be any number of software from any
>> number of vendors. In an embedded system, such as OpenBMC, on the
>> contrary, the set of software using d-bus is strictly limited and we
>> always know beforehand what prefixes are used. I'm pretty sure none of
>> the software included into OpenBMC builds will ever use '/obmc' prefix.
>> So why continue using the inconvenient long prefixes when it is safe to
>> use short ones? I would even propose dropping all prefixes at all, but
>> ok, let's pretend that there can be some other 3rd-party 'Inventory'
>> than '/obmc/' ('/xyz/openbmc_project/').
> Generally speaking, isn't the content in a single process pretty well
> known no matter the type of system the daemon is installed on?  I think
> it is pretty rare for a shared library to create its own dbus objects
> and if it did it'd probably create its own bus-connection too.  I'm not
> sure what is unique about a desktop vs embedded system in this
> discussion.

It's rather that embedded system is unique compared to desktop.

Desktops, if not enforced to use reverse domain prefixes, may end up 
using the same name for a d-bus service if two different software 
authors decide to use the same word. The probability of such a 
coincidence in a desktop is quite high. That's why d-bus spec encourages 
use of reverse domain notation (relying on uniqueness of domain names 
and their binding through registration to physical bodies or legal 
entities).

In embedded systems the probability of that coincidence is negligible on 
the other hand.

> What are we saving by switching to something shorter?  Can you
> elaborate?  It seems like it is mostly just typing...

I guess you're right that it's mostly just typing that we save. That's 
actually a lot when we're talking debugging and running busctl 
repeatedly with changing parameters from a command line.

It may be also that we are achieving some better code readability by 
dropping the identical long prefixes and only leaving what's essential.

At least for me that is important.

>
>> Am I wrong or missing anything? What's stopping us from switching to a
>> shorter prefix, aside from the existing code that will need to be
>> changed to it?
>>
>> The same proposal/question actually applies to service names (e.g.
>> xyz.openbmc_project.ObjectMapper could easily become just
>> obmc.ObjectMapper or phosphor.ObjectMapper), let alone just 'ObjectMapper'.
> Service names and interface names have a strong statement w.r.t
> reverse-domain prefixes.
>>> Interface names should start with the reversed DNS domain name of the
>>> author of the interface (in lower-case), like interface names in
>>> Java.
>>> Like interface names, well-known bus names should start with the
>>> reversed DNS domain name of the author of the interface (in
>>> lower-case)...
> Assuming the typical use of "should" it means "this should be done
> unless you have a good reason not to".

Again, why (for what purpose) do we have to obey those statements?
What exactly are we achieving by obeying them? Do we need to achieve that?

We're creating a closed system that does not interact with any external 
software using d-bus.

IMO, we're completely free to choose the notation of service and interface
names as we see fit. We won't be introducing any disturbance into the
outside world by not using the general purpose notation. No one would 
actually
even notice us doing that.

WBR, Alexander.

