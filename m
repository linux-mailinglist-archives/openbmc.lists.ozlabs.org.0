Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 455D11B4BA4
	for <lists+openbmc@lfdr.de>; Wed, 22 Apr 2020 19:25:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496nPX5qYPzDqsx
	for <lists+openbmc@lfdr.de>; Thu, 23 Apr 2020 03:25:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496nNc1wyDzDqq8
 for <openbmc@lists.ozlabs.org>; Thu, 23 Apr 2020 03:24:14 +1000 (AEST)
IronPort-SDR: tqaUmejgTLgXOA1uEa/aIIyNXQM5fFODR2PpKoXB3QuPV41AdDijMcGMGt2RyMPVOuVxxFrIIr
 u7i9pEPFPW6g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 10:24:09 -0700
IronPort-SDR: IFTntZGkD3oNHUeHX7nUjMW3kn9iXiP0PASNKNWYMb1zFy1F2LzZuD7+oALMOQg4oLi6LpNnZe
 B9u8yEW9W9OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,304,1583222400"; d="scan'208";a="292013498"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.134.47.201])
 ([10.134.47.201])
 by orsmga008.jf.intel.com with ESMTP; 22 Apr 2020 10:24:09 -0700
Subject: Re: dbus-sensors
To: Matt Spinler <mspinler@linux.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Patrick Williams <patrick@stwcx.xyz>
References: <dbdb4dac-a73a-5c39-8cf8-33dd2d318d16@linux.ibm.com>
 <2cb1c83a-9803-c9ac-ae76-2e09b616562e@linux.intel.com>
 <ED37CD16-CFB6-4D78-BF6E-062849051D02@fuzziesquirrel.com>
 <20200422121131.GE196148@heinlein.lan.stwcx.xyz>
 <56790A50-40DE-44F5-A043-A91E1C48C8C2@fuzziesquirrel.com>
 <672387da-09f5-dc7a-3822-8e9af9c745ca@linux.ibm.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <c2bedc17-9584-93f5-0203-1980134cb458@linux.intel.com>
Date: Wed, 22 Apr 2020 10:24:08 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <672387da-09f5-dc7a-3822-8e9af9c745ca@linux.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 4/22/2020 9:01 AM, Matt Spinler wrote:
> 
> 
> On 4/22/2020 7:24 AM, Brad Bishop wrote:
>> at 8:11 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
>>
>>> On Wed, Apr 22, 2020 at 07:56:14AM -0400, Brad Bishop wrote:
>>>> at 5:54 PM, James Feist <james.feist@linux.intel.com> wrote:
>>>>>> 3. After creating this event log, make sure not to do it again until
>>>>>>    main power is cycled.
>>>>>
>>>>> I'd rather this be until the status goes OK again.
>>>>
>>>> We have user-experience requirements that the server administrator 
>>>> must be
>>>> “nagged” in this fashion when something is broken like this. Could the
>>>> behavior be selectable via build switch?  Any other ideas on how to
>>>> accommodate both behaviors?

As long as it's configurable somehow, fine by me.

>>>
>>> This sounds like a form of error filtering.  Shouldn't that decision be
>>> done at a much higher level in the stack than down in the entity that
>>> reads the hardware sensor?
>>
>> Thats an interesting thought.  When the error reporting code sees the 
>> error for the first time, it could maintain a list of errors that it 
>> needs to “replay” at different system events, like when the server 
>> powers on.
> 
> It isn't really nagging, it's more like error throttling.  At most, only 
> log one error per power cycle.
> I have to check still, but we may also need to still log the other 
> errors, just with a
> different severity (for debug purposes).
> 
> I kinda like this filtering idea too.  It is flexible and we would only 
> have to do it in one place as
> opposed to in all the sensor applications we end up using, and could 
> also be used to change the
> event log severities as mentioned above.  We will have to make sure when 
> creating the event log
> that it contains enough information to recognize the device that is 
> failing so that we can filter
> appropriately.
> 
> 
>>
>> This is certainly more flexible and I like the idea - but one down 
>> side though is the logging code becomes stateful and the complexity is 
>> slightly higher.
> 
