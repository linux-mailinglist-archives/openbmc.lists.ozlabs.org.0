Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24050134DD0
	for <lists+openbmc@lfdr.de>; Wed,  8 Jan 2020 21:43:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tLmv24HWzDqX6
	for <lists+openbmc@lfdr.de>; Thu,  9 Jan 2020 07:43:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tLm63GTrzDqQP
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jan 2020 07:42:44 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2020 12:42:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,411,1571727600"; d="scan'208";a="303662776"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP; 08 Jan 2020 12:42:42 -0800
Received: from [10.241.245.1] (unknown [10.241.245.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 4BF285803E3
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jan 2020 12:42:42 -0800 (PST)
Subject: Re: Redfish Dump Service Proposal
To: openbmc@lists.ozlabs.org
References: <c31757a8-c71d-43b3-f207-426e94548065@linux.vnet.ibm.com>
 <OF3E82A637.78F050C7-ON002584CE.0025B2F4-002584CE.00271DE9@notes.na.collabserv.com>
 <CAH1kD+YfetwAmGQfjF4ytCQYhhaEorgdiA5svwjm7X91-yG1Tg@mail.gmail.com>
 <CACkAXSpCwhUwzh1uZMMkFvtkO7Tdi4xoHaq1KtaAndR8pR2gbA@mail.gmail.com>
 <ac75a152-9bdf-0029-67e8-60e4e99eb1cc@linux.intel.com>
 <B3B51CCE-D255-489C-9C4C-57DB2F962B31@fuzziesquirrel.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <8ee2690f-0149-3ac3-118a-5489b48afd79@linux.intel.com>
Date: Wed, 8 Jan 2020 12:42:42 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <B3B51CCE-D255-489C-9C4C-57DB2F962B31@fuzziesquirrel.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 1/8/2020 12:04 PM, Brad Bishop wrote:
> 
> 
>> On Dec 13, 2019, at 3:01 PM, Bills, Jason M <jason.m.bills@linux.intel.com> wrote:
>>
>> I like this as well.  I'm trying to support a CPU crashdump that would fit perfectly with this proposal.
> 
> Hi Jason
> 
> Could you say a few words about how your crash dump service works?  I’m asking because Dhruv is working on an implementation of this proposal:

Sure.

I have a service called host-error-monitor that watches for error 
signals from the host.  When a CPU fatal error occurs, the 
host-error-monitor triggers a crashdump from the crashdump service.

The crashdump service itself is very minimal today.  It has two trigger 
methods on DBus.  One is to trigger a log for a real error that may need 
to be stored on the BMC.  The other is to trigger a manual log that does 
not need to persist.

When triggered, the BMC reads the crash data from the CPU using PECI. 
After a log has been completed, it is added to DBus as a new object with 
a 'Log' property which holds the contents of the log as a string.

The host-error-monitor source is shared here: 
https://github.com/Intel-BMC/host-error-monitor.
The crashdump source is not currently licensed for public access.

> 
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/28260
> 
> Right now it looks pretty POWER-centric but depending on how your code works I’m wondering which makes more sense:
> 
> 1 - a single implementation with —-enable-power —-enable-x86 type configure options.
> 
> -or-
> 
> 2 - two completely different implementations with the same dbus interfaces.
I think this is probably the simplest approach.  It will allow us to 
standardize the Redfish interface without worrying about the actual log 
collection.

I also think we can move from this toward option 1 if we find a lot of 
commonalities in the future.

> 
> thoughts?
> 
