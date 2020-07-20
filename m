Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D4393225B52
	for <lists+openbmc@lfdr.de>; Mon, 20 Jul 2020 11:22:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9GTC685PzDqcT
	for <lists+openbmc@lfdr.de>; Mon, 20 Jul 2020 19:22:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9GS663wSzDqbf
 for <openbmc@lists.ozlabs.org>; Mon, 20 Jul 2020 19:21:09 +1000 (AEST)
IronPort-SDR: vmacyrECOGO3fBy0AavrGx1QYIUiEZqsG2eGzJIWXq9eWMD9xiJ/yEF/idIULpSGXXIVZXurm1
 hptBUPOfMAMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9687"; a="149033767"
X-IronPort-AV: E=Sophos;i="5.75,374,1589266800"; d="scan'208";a="149033767"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2020 02:21:06 -0700
IronPort-SDR: dT9cppy/pGa7vXFK9pWn4bogMMlNR9P0L+OZeQ3ntxBmOk/xUn0CnH4mb+QfHVliPIv29rjBsU
 kyBtPvmR0qbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,374,1589266800"; d="scan'208";a="487179832"
Received: from rthomaiy-mobl.gar.corp.intel.com (HELO [10.215.125.198])
 ([10.215.125.198])
 by fmsmga006.fm.intel.com with ESMTP; 20 Jul 2020 02:21:04 -0700
Subject: Re: MCTP bridging with one physical port per demux daemon instance
To: Andrew Jeffery <andrew@aj.id.au>, "Bhat, Sumanth"
 <sumanth.bhat@intel.com>, "Winiarska, Iwona" <iwona.winiarska@intel.com>
References: <93c6a27a-db52-4bbb-a2e3-5c1b9837a093@www.fastmail.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <c5f2ce1f-b8ee-c4cd-5e71-2740070b5db1@linux.intel.com>
Date: Mon, 20 Jul 2020 14:51:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <93c6a27a-db52-4bbb-a2e3-5c1b9837a093@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

Hi Andrew,

Reviewed the routing series and provided comments. Overall don't find 
any major issues, and we are fine with having 2 separate demux with each 
handling the tx/rx or single demux. Each having it's own advantage and 
disadvantage as with single demux handling of multiple physical 
interface packet is going to be delayed (i.e, when one Tx is in effect 
another one is going to wait), as we are not starting multiple process 
to handle as per the interface as of today.

With multiple demux we will come up with the issue of client depending 
on multiple daemons for the same.

Regards,

Richard

On 7/2/2020 10:28 AM, Andrew Jeffery wrote:
> Hi all,
>
> First up, I've pushed a series to gerrit implementing bridging and routing in
> libmctp. If you're interested, please provide feedback:
>
> https://gerrit.openbmc-project.xyz/q/project:openbmc/libmctp+topic:%2522routing%2522+(status:open)
>
> The final patch in the series implements the provisional EID concept that we've
> been discussing on the list.
>
> Back to the subject:
>
> I've had a short think about bridging in the configuration where we have one
> mctp-demux-daemon instance per port. I'm not sure what plans you had with
> endpoint ID assignment, so assuming I have free reign with it, one proposal
> looks like below:
>
>
>            demux A                             demux B
>        +------------+                       +------------+
>        |-----+      |                       |      +-----|
>        +--+  |   +--+      demux socket     +--+   |  +--+
> +-----+P0|10|   |P1+-----------------------+P1|   |11|P0+-----+
>        +--+  |   +--+                       +--+   |  +--+
>        |-----+      |                       |      +-----|
>        +------------+                       +------------+
>
> 'demux A' and 'demux B' are our two separate processes. Figure 9 of DSP0236
> (v1.3.1) shows the different arrangements of endpoint assignments that are
> supported by MCTP, and the key element is that ports in a bridge are not
> required to be assigned endpoint IDs. In the diagram above I'm describing two
> ports associated with each process; the physical port P0 which we're
> associating with an mctp-demux-daemon instance, and P1 which we'll have as a
> port for a vendor-defined binding. By configuration, one of either 'demux A' or
> 'demux B' connects to the other and establishes a "virtual bus" via P1. An
> endpoint ID is assigned to P0 in both instances (10 and 11), but neither
> instance assigns an EID to P1. Using null EID messages each side can send 'Get
> Endpoint ID' over the virtual bus linking the two daemons to bootstrap the
> (independent) route tables.
[Richard]: Yes, connecting ports must not have EID. Also, phyiscal 
interface facing port can or can not have EID as per the MCTP 
specification. But in either case, we must not advertise about it's 
presence to the other side of the bus. Say in this diagram, devices 
behind P0 EID 10 of demux A, must not indicate about EID 11 in the 
routing table, but will indicate about all the EID's behind P0 EID 11 of 
demux B.
>   From there, each side uses 'Get Routing Table
> Entries' to pull the route table state from the other, and update their own
> tables with the endpoints reachable through the remote.
>
> In this configuration there's no change necessary to the generic libmctp code
> to handle forwarding packets between the different instances, it takes
> advantage of bridging and routing to do the job for us in concert with a
> vendor-defined binding to handle the socket.
>
> A problem arises with how applications should interact with the separate
> daemons: Each application must connect to all the mctp-demux-daemon instances
> to receive their locally delivered packets.
>
> To resolve this it might be possible to take advantage of the existing "bridge"
> implementation in libmctp which really functions as an adapter that glues
> together two ports of possibly different binding types. By inserting
> appropriate route entries packets arriving on either interface are simply
> forwarded to the other as there is no endpoint ID defined for the instance.
> With this approach you could do the bridging in a third process:
>
>         adapter A                    demux               adapter B
>        +------------+             +------------+            +------------+
>        |            |             |------------|            |            |
>        +--+      +--+             +--+  ||  +--+            +--+      +--+
> +-----+P0|      |P1+-------------+P0|10||11|P1+------------+P1|      |P0+-----+
>        +--+      +--+             +--+  ||  +--+            +--+      +--+
>        |            |             |------------|            |            |
>        +------------+             +------------+            +------------+
>
> We'd probably have to do some tinkering to make sure broadcast and null EID
> messages are passed on. However, applications would then connect to just the
> bridge's domain socket to receive messages for both EID 10 and 11.
[Richard]: Special EID's must not be forwarded or routed. i.e. Both NULL 
EID and Broadcast EID's packets arising from P0 of adapter A must not be 
routed / forwarded to P0 of Adapter B
> That's probably enough to spark some discussion.
>
> Let me know what you think.
>
> Andrew
