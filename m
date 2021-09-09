Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ACD405DF1
	for <lists+openbmc@lfdr.de>; Thu,  9 Sep 2021 22:16:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H59JX0s7Gz2yNf
	for <lists+openbmc@lfdr.de>; Fri, 10 Sep 2021 06:16:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H59JB72JVz2xXP
 for <openbmc@lists.ozlabs.org>; Fri, 10 Sep 2021 06:16:25 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="284600639"
X-IronPort-AV: E=Sophos;i="5.85,281,1624345200"; d="scan'208";a="284600639"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 13:15:17 -0700
X-IronPort-AV: E=Sophos;i="5.85,281,1624345200"; d="scan'208";a="479821177"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 13:15:17 -0700
Date: Thu, 9 Sep 2021 13:15:16 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
Subject: Re: =?utf-8?B?5Zue6KaGOiBbcGhvc3Bob3ItaG9z?= =?utf-8?Q?t-ipmid=5D?=
 Questions about IPMI (OEM) command development
Message-ID: <20210909201516.GA6614@mauery.jf.intel.com>
References: <DM6PR08MB5514D818A3029FA77BFB523BDCCE9@DM6PR08MB5514.namprd08.prod.outlook.com>
 <DM6PR08MB55145854126B411F1A9AFE29DCD29@DM6PR08MB5514.namprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <DM6PR08MB55145854126B411F1A9AFE29DCD29@DM6PR08MB5514.namprd08.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 06-Sep-2021 09:40 AM, Chris Chen (TPI) wrote:
>Hi all,
>
>I guess this mail was got overwhelmed by bunches of emails, so please let me resend it and hope someone could help me. Another, I add one more question marked #5 below.

Thanks for being persistent :)

>
>Hi all,
>
>I have studied "phosphor-host-ipmid" package for a couple of weeks and got understanding that it has implemented some mandatory and optional commands already. And I also knew that I'm able to leverage "intel-ipmi-oem" package to get more command handlers. But there're some questions raised in my mind, I hope someone could give me some suggestions.
>
>  1.  What's the normal development procedure in case I want to make our own OEM commands? I mean do you guys encourage me to create a new "xxx-ipmi-oem" package or to leverage "intel-ipmi-oem" and then add our own commands in it?

First some common language:
1) xxx-ipmi-oem is an IPMI provider library. It doesn't need to be 
called xxx-ipmi-oem, but that is just a convenient naming convention.
2) whitelist (prefer allowlist) is one kind of filter. Filters are 
registered like command handlers, with a priority. Filters can do more 
than just block or allow the commands coming in. The filter is passed 
the request and can do anything it wants before passing it on. Logging, 
mangling, blocking, etc.

It depends on a lot of things. Maybe yes, create a new repo? More 
discussion below.

>  2.  I for now added "intel-ipmi-oem" package only for using its "<Chassis>:<Set Front Panel Enables>" command because I figured out the same command in the "phosphor-host-ipmid" is not able to match the d-bus interface in the "x86-power-control". I'm not sure if I will need other commands in the "intel-ipmi-oem", but what if I don't need other commands, how to remove them? to use the whitelist mechanism?

There is not a method to remove them, but you can filter them as you 
suggested. Also, if you want to add a different implementation (from a 
different IPMI provider library) at a higher priority, only the higher 
priority implementation will be used.

>  3.  Is it okay to add more than 1 xxx-ipmi-ome packages? If yes, how to manage the whitelist between these 2 OEM packages?

You can have as many IPMI provider libraries on the BMC as needed.

The filtering mechanism does not discriminate between the provider, it 
is used at execution time when a command comes in. Every command is 
passed to each filter 

>  4.  Am I able to use "intel-ipmi-oem" on a platform that is using AMD CPU?

IANAL, but, yes. It is open source and the license does not make that 
restriction. It might look kind of weird though :)

If you like all the IPMI functions implemented by the intel-ipmi-oem, it 
is fine to use it as is. If there are things you want to change, there 
are different ways to go about it.

Here are a couple of scenarios with some options:
1) You like the behavior of an IPMI provider library, but want some 
changes. Talk with the owner and see if you can come to some consensus 
that works for everyone. This is the most opensource, 
community-building, good-will behavior of all. Submit a change and see 
if you can get it merged.

2) You like all the IPMI commands in an IPMI provider library except for 
one or two. If you want to own the work to keep a patch up to date, it 
is possible to just add a bbappend and a patch to modify the code prior 
to building. This is okay, but maybe not as ideal. It may end up with a 
smaller image size than adding a new provider library to overload the 
command implementation.

3) You like all the IPMI commands in an IPMI provider library except for 
one or two. You can create a new IPMI provider library for your 
organization that can filter out and/or provide overloads for any 
existing implementation of IPMI commands from any number of other IPMI 
providers.

4) You only like some bits of another IPMI provider. You may be best off 
to just copy those bits into a new IPMI provider library of your own, 
add your own other OEM commands and/or implementations and carry on.

Really, none of the 'solutions' are ideal, but we are trying to make 
trade-offs here that allow individual contributing organizations freedom 
to implement OEM commands as they wish without any one organization 
being a gatekeeper.

--Vernon
