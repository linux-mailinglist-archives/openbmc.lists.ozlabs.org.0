Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E2D754B6
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2019 18:54:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vdbl6VL0zDqQP
	for <lists+openbmc@lfdr.de>; Fri, 26 Jul 2019 02:54:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vdb61fZNzDqNp
 for <openbmc@lists.ozlabs.org>; Fri, 26 Jul 2019 02:53:53 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jul 2019 09:53:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,307,1559545200"; d="scan'208";a="369193498"
Received: from unknown (HELO [10.241.241.64]) ([10.241.241.64])
 by fmsmga005.fm.intel.com with ESMTP; 25 Jul 2019 09:53:50 -0700
Subject: Re: Creating event logs for blackout power losses
To: Matt Spinler <mspinler@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <77618bc2-0725-c104-1744-7ceca51e2d09@linux.ibm.com>
 <fc74bffa-ca1b-1d3d-cb54-1f4be0cae11b@linux.intel.com>
 <4b906a0b-0750-c724-2864-88589821b0e3@linux.ibm.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <2ac9cea6-8eae-8456-b72f-cf495bd21667@linux.intel.com>
Date: Thu, 25 Jul 2019 09:53:49 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4b906a0b-0750-c724-2864-88589821b0e3@linux.ibm.com>
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



On 7/24/2019 1:10 PM, Matt Spinler wrote:
> 
> 
> On 7/24/2019 2:53 PM, Bills, Jason M wrote:
>> On 6/28/2019 8:26 AM, Matt Spinler wrote:
>>> Hi,
>>> We've been asked by field support to create an OpenBMC event log when 
>>> we detect that
>>> we suffered a power blackout, by which I mean the system is up and 
>>> running, and then the
>>> BMC suddenly reboots and when it comes back up main power is off. The 
>>> issue for it is
>>> https://github.com/ibm-openbmc/dev/issues/677.
>>>
>>> I have a proposal in there for how to detect it in the chassis state 
>>> manager code, which
>>> basically just consists of persisting the chassis power state and 
>>> then checking it against
>>> the actual value on startup, and an error proposed at
>>> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/22791. 
>>>
>>> Does anyone have any other ideas or thoughts?  Is it OK if we make 
>>> this the default behavior, or
>>> would it be preferred we enable it with a compile flag?
>>
>> Sorry for the late replay as I have been out of the office.
>>
>> In my testing on this type of failure, I found that there is a race 
>> condition between the Chassis and BMC losing power after the blackout. 
>> If the Chassis loses power while the BMC is still active, it can 
>> sometimes detect it, change the Chassis State to Off, and persist it 
>> before losing power.  When this happens, the next boot will see only 
>> the Off state persisted and not detect the blackout.
>>
>> To work around this, we have added a delay when persisting the Chassis 
>> State.  In a normal Off, it will be persisted after the delay; in a 
>> blackout off, the delay will prevent the BMC from persisting the Off 
>> state allowing the blackout to be detected.
> 
> Hi, thanks for the response.
> Did you do this in a downstream phosphor-state-manager repository,
> or somewhere else?  If in phosphor-state-manager, would you consider 
> sharing it?
> 

It's in a downstream x86-power-control repository that I haven't had a 
chance to push to the upstream x86-power-control, yet.

>>
>>>
>>> Thanks,
>>> Matt
>>
> 
