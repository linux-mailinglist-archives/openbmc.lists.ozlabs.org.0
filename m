Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D20F9BBA89
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 19:29:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cWX71W5MzDqMN
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 03:29:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cWWF72WYzDqLh
 for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2019 03:28:24 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Sep 2019 10:28:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,541,1559545200"; d="scan'208";a="195432021"
Received: from linux.intel.com ([10.54.29.200])
 by FMSMGA003.fm.intel.com with ESMTP; 23 Sep 2019 10:28:13 -0700
Received: from [10.241.245.57] (unknown [10.241.245.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id E2B3E58045B;
 Mon, 23 Sep 2019 10:28:10 -0700 (PDT)
Subject: Re: Question for ACPI status
To: Payne Yang <pyang4@lenovo.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>
References: <01040816e6cf4b429f137cfbf727742c@lenovo.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <6d1b4c56-4622-f778-97ed-7a789917c48c@linux.intel.com>
Date: Mon, 23 Sep 2019 10:28:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <01040816e6cf4b429f137cfbf727742c@lenovo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 8/24/2019 9:37 PM, Payne Yang wrote:
> Hi Vernon,
> 
> Thanks for your quick reply.
> Please see my comment as below.
> 
>> -----Original Message-----
>> From: Vernon Mauery <vernon.mauery@linux.intel.com>
>> Sent: Saturday, August 24, 2019 4:11 AM
>> To: Payne Yang <pyang4@lenovo.com>
>> Cc: openbmc@lists.ozlabs.org
>> Subject: [External] Re: Question for ACPI status
>>
>> On 23-Aug-2019 09:18 AM, Payne Yang wrote:
>>> Hi Team,
>>>
>>> Is there any ACPI service to update the ACPI state ?
>>> I could find that the property of ACPI state is defined in dbus, and the ipmi
>> command is also done in package "phosphor-host-ipmid".
>>> https://github.com/openbmc/phosphor-host-ipmid/blob/b90a53280c74e8c
>> 65e8
>>> dc58c8964d93a08cfd65e/apphandler.cpp#L202
>>>
>>> However, I could not find other services to update the property
>> "ACPIPowerState".
>>> https://github.com/search?q=org%3Aopenbmc+ACPIPowerState&type=Code
>>
>> That is because the host is the only entity that should be modifying that
>> property.
> [Payne]
> Yes, I know that the host is the only entity.
> Therefore, the host may need to send set ACPI state to BMC when it is shutdown.
> 
>>
>>> Do I miss something ?
>>> If yes, please help to share your comment or suggestion:)
>>
>> According to the IPMI specification:
>> 	The Set ACPI Power State command can also be used as a mechanism
>> for
>> 	setting elements of the platform management subsystem to a
>> 	particular power state. This is an independent setting that may not
>> 	necessarily match the actual power state of the system. This command
>> 	is used to enable the reporting of the power state, it does not
>> 	control or change the power state.
>>
> [Payne]
> It is correct.
> However, actually, I just want to make the power state correct.
> 
>>> If no, it seems to me that I have to write a service as ACPI state monitor.
>>
>> Your particular platform may have different needs than other platforms
>> running OpenBMC. A platform that needs to effect system-wide changes
>> based on the Host-reported state (or possibly intended state) could listen for
>> the property changed signal for the ACPIPowerState property and take
>> action.
>>
>> But as the command is currently written, it conforms to the IPMI
>> specification. There just happens to be no public consumers of that
>> property.
>>
> [Payne]
> Well, as I said previous, I just want to correct the power state.
> My system is with a PWRGOOD pin connect to BMC as other platforms, but there is no service to monitor the PWRGOOD pin if the host shutdown is not caused by BMC.
> In entity manager, the power state won`t change if there is no service to set the power related property.
> Therefore, I want to clarify if I miss some package which could monitor PWRGOOD pin even if the PWRGOOD state change is not caused by BMC (eg. "shutdown/init 0" command in OS, "reset -s" command in BIOS shell or global reset).
> If there is no service, I may have service design to monitor PWRGOOD pin to handle this situation.
> And it may be better to sync the power state and ACPI state:)
> 
Hi Payne,

Were you able to get this resolved?

You are correct that the IPMI power state should follow the PWRGOOD pin 
and be updated based on changes to the pin state.  I think the 
phosphor-state-manager can track the state of the PWRGOOD pin using the 
"pgood" DBus property.  Which is intended to keep the IPMI power status 
in sync with the PWRGOOD pin.

However, from what we can see in the IPMI spec, the ACPI state is set by 
the "Set ACPI Power State" command and is not supposed to be in sync 
with the actual system power state (PWRGOOD pin).

Regards,
-Jason

>> --Vernon
> 
> Best Regards,
> Payne
> 
> 
