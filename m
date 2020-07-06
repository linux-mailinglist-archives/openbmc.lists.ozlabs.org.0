Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 556722152CC
	for <lists+openbmc@lfdr.de>; Mon,  6 Jul 2020 08:52:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0bpk3R7QzDqZk
	for <lists+openbmc@lfdr.de>; Mon,  6 Jul 2020 16:52:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=adrian.ambrozewicz@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0bnw5VDYzDqcR
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jul 2020 16:51:30 +1000 (AEST)
IronPort-SDR: /95WbfdHMTomcYHfSUIrUKl+Q1l7JHwVY/lUIGUGOBLJazRXuYEY+XuEUzcA7ZnT8Nc6jVyt5I
 QIpNtcLUTPTA==
X-IronPort-AV: E=McAfee;i="6000,8403,9673"; a="144869386"
X-IronPort-AV: E=Sophos;i="5.75,318,1589266800"; d="scan'208";a="144869386"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2020 23:51:28 -0700
IronPort-SDR: GdeIPczWyAPc3a9g9/1y9ZqJdwj0o4qZ1dxdfA4L7oItld6soRySn/R09aj4zl51yWlp1vxJjs
 WvTa00l2ojXg==
X-IronPort-AV: E=Sophos;i="5.75,318,1589266800"; d="scan'208";a="483018425"
Received: from hkrasnod-mobl.ger.corp.intel.com (HELO [10.213.29.198])
 ([10.213.29.198])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2020 23:51:27 -0700
Subject: Re: "Initial commit" with entire git history - possible?
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <6e3f0ebd-9ca0-c5b6-c49a-a533cea6c9ea@linux.intel.com>
 <43a3c7b0-df25-b4a7-13e7-3d944f892420@linux.intel.com>
 <c7907f47-db04-12e2-9812-ee72cde822a9@linux.intel.com>
 <20200701121554.bfkoh34xxiz7k5hr@thinkpad.dyn.fuzziesquirrel.com>
From: =?UTF-8?Q?Adrian_Ambro=c5=bcewicz?= <adrian.ambrozewicz@linux.intel.com>
Message-ID: <254ce7a8-9d6b-51b1-4595-3677baba4e90@linux.intel.com>
Date: Mon, 6 Jul 2020 08:51:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200701121554.bfkoh34xxiz7k5hr@thinkpad.dyn.fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



W dniu 7/1/2020 o 14:15, Brad Bishop pisze:
> On Wed, Jul 01, 2020 at 01:08:20PM +0200, Adrian Ambrożewicz wrote:
>> Brad,
>>
>> How (as a maintainer) I could 'move' code from our internal repository
>> to github/openbmc hosted one? Is it specified somewhere?
> 
> git push <remote> HEAD:master
> 
> The gerrit remote is something like:
> ssh://<user>@gerrit.openbmc-project.xyz:2918/openbmc/telemetry
> 
> and the github remote is:
> ssh://git@github.com/openbmc/telemetry
> 
> You'll need to have configured both github and gerrit to accept whatever
> ssh keys you present.
Thanks, will try this, it was much simpler than I anticipated - sorry!

> 
>> Currently I've pushed whole code to gerrit as usual review to gather
>> feedback, but after that I would still want to pursue path of pushing
>> entire git history + review changes on top  of that.
> 
> I'm glad to see you are willing to entertain feedback but I'd be
> suprised if Intel let you spend time on making any meaningful changes
> (e.g. ones that cause significant rework and time investment on your
> part) at this point.  This is why code should be developed and reviewed
> in the open in the first place if you actually want others to use it.
Thanks for pointing that out. I'm aware of inconvenience with big-bang 
approach for code publication. I hope feedback like that will advocate 
for higher priority on legal issues next time. As for bigger changes I 
wouldn't be so pessimistic - we have allocated time for bugfixes and 
further development in following months.

Regards,
Adrian
