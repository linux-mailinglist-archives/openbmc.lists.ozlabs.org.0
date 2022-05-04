Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6E351B1CA
	for <lists+openbmc@lfdr.de>; Thu,  5 May 2022 00:27:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ktrzt4gCYz3bft
	for <lists+openbmc@lfdr.de>; Thu,  5 May 2022 08:27:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AfQZBigt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=AfQZBigt; dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtrzQ0H60z2yHX
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2022 08:26:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651703218; x=1683239218;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=z9zv0jxIz/Ry7Qa1PvzLNPx9zfhShTtwH/8eixv+BFo=;
 b=AfQZBigtiTtsHEEDah+1HWe88ioORov9O47Uv5E9YPUQvBwdrtvkq2Yc
 LhQ9QGrSsicp/pY5+++rrYPlS1K4YC9NhIs3FXhuMisRTwSEGnihZwmH8
 PymdcJzqe4PALeF0EeI2nM/Dxn4HRqKz4svvnDreiF6DA+O6PeF4J4IP8
 k3YLhyRwZL0IANWfFRHnlnEyhh4lC/EJjC8QG2VYgAQQE/Z0f7ObO7u7F
 jm8Raf3pbZBPRMS3N9r6WDymW1titv0SrgqkGf5qPC3uLWLe+Ky5SSmAQ
 S7qpUlN1oxHfVsEauPRbEl9ukcVBz2uFdN66xO+onp6TzlN8hQsiR7KJU g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="267800475"
X-IronPort-AV: E=Sophos;i="5.91,199,1647327600"; d="scan'208";a="267800475"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 15:25:49 -0700
X-IronPort-AV: E=Sophos;i="5.91,199,1647327600"; d="scan'208";a="549067808"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.54.51.82])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 15:25:49 -0700
Date: Wed, 4 May 2022 15:25:43 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Subject: Re: IPMI Restriction Mode
Message-ID: <20220504222543.GB884273@mauery.jf.intel.com>
References: <CAA7Tbctgg9YJPTRcYCwkucajTvk-AUNeHJ9_=MD5dpvxF5D0ZA@mail.gmail.com>
 <20220414004457.GA230974@mauery.jf.intel.com>
 <CAA7TbcsoBoRvcw_oNA4y_5WhV3z3KX73WMqACiXThJHtjmtUBg@mail.gmail.com>
 <20220422232456.GA661800@mauery.jf.intel.com>
 <CAA7Tbctpz6EgJcpYHtRAyWP98Y_hSMn+PCNYX0BKZ=c76sGByQ@mail.gmail.com>
 <CAA7Tbcu8o6epZ8yMTAPNaJii8K=wUAvo-T0WYUgFab6NtMEk9g@mail.gmail.com>
 <20220503230433.GA884273@mauery.jf.intel.com>
 <CAA7TbcuOnorMX_oGbZ15ou7gVyARqFrzvEx4AwRGLPguNB8Eig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAA7TbcuOnorMX_oGbZ15ou7gVyARqFrzvEx4AwRGLPguNB8Eig@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, anoo@us.ibm.com,
 velumanit@hcl.com, velumani.hcl@gmail.com, deepak.kodihalli.83@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 04-May-2022 10:27 PM, Kumar Thangavel wrote:
>On Wed, May 4, 2022 at 4:34 AM Vernon Mauery <vernon.mauery@linux.intel.com>
>wrote:
>
>> On 03-May-2022 07:46 PM, Kumar Thangavel wrote:
>> >Hi Vernon,
>> >
>> >     We may need to write our own custom filter for other channels as you
>> >suggested.
>> >     While implementing this, we need some clarifications.
>> >
>> >     1. How can we map channel Id's with settingsd restriction mode
>> >dbus-objects ?
>>
>> Set up a restriction mode object for each channel? This is really up to
>> your implementation.
>>
>
>    Ack.
>
>>
>> >     2. The Ipmb channel has multiple devices in our system, How can we
>> >handle and apply this multiple Ipmb interfaces with
>> >settingsd restriction mode dbus-objects ?
>> >
>> >     Please refer below link for multiple Ipmb channels for our system.
>> >
>>
>> When ipmb channel commands come in, there is also rqSA set in the
>> ipmi::Context. This should be unique per device. Will this work for you?
>>
>>     That also works. If we use rqSA, again we need to map this rqSA value
>with phosphor-settingsd restriction mode dbus-objects name (
>/xyz/openbmc_project/control/*host1*/restriction_mode) ?
>
>Alternate logic we just think of
>1. Using "hostIdx'' in ipmi::Contextwhich is unique(0, 1, 2 to N) for each
>devices. we can map this with phosphor-settingsd restriction mode
>dbus-objects name ?  We need to maintain order (0, 1, 2 to N-1) for hosts
>and N for debug cards in all configs.
>2. Can we read i*pmb-channels.json* entry in ipmid with name field as
>"host1", "host2", "host3" "host4" and "debug_card" which should match the
>settingsd dbus-object names. ? So that we can map the name field with
>settings objects easily.
>
>  Example :
>  Ipmb-channels.json entry :
>
>{ "name" : "*host1*"
>"type": "ipmb",
>"slave-path": "/dev/ipmb-1",
>"bmc-addr": 32,
>"remote-addr": 64,
>"devIndex": 0
>},
>{ "name" : "*host2*"
>"type": "ipmb",
>"slave-path": "/dev/ipmb-3",
>"bmc-addr": 32,
>"remote-addr": 64,
>"devIndex": 2
>},
>
>{ "name" : "*hostN*"
>"type": "ipmb",
>"slave-path": "/dev/ipmb-7",
>"bmc-addr": 32,
>"remote-addr": 64,
>"devIndex": N
>},
>{ "name" : "*debug_card*"
>"type": "ipmb",
>"slave-path": "/dev/ipmb-13",
>"bmc-addr": 32,
>"remote-addr": 64,
>"devIndex": 4
>}
>]
>
>  Settingsd restriction mode objects :
>
>  /xyz/openbmc_project/control/*debug_card*/restriction_mode
>  /xyz/openbmc_project/control/*host1*/restriction_mode
>  /xyz/openbmc_project/control/*host2*/restriction_mode
>  /xyz/openbmc_project/control/*host3*/restriction_mode
>  /xyz/openbmc_project/control/*host3*/restriction_mode
>
>  Could you please provide your thoughts on this ?

I think you can do all of this in your filter code. You can really do 
just about anything in there. You can have a setup function that gets 
called when the provider library is loaded and read the file and set up 
your map. Then when an IPMI function is called you can consult your map 
and filter however you want.

Just be aware that your filter code will run on *every* IPMI call, so do 
your best to make it streamlined or it will impact performance.

--Vernon

