Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C84B2E37A9
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 18:15:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zXQj6CNLzDqWc
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 03:15:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zXPw2S5tzDqNx
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 03:14:42 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Oct 2019 09:14:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,225,1569308400"; d="scan'208";a="373267463"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga005.jf.intel.com with ESMTP; 24 Oct 2019 09:14:39 -0700
Subject: Re: multiple telemetry designs
To: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>,
 Justin Thaler <thalerj@linux.vnet.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "kunyi@google.com" <kunyi@google.com>,
 "apparao.puli@linux.intel.com" <apparao.puli@linux.intel.com>
References: <D1177195-CDC9-4BB0-B9DE-6FC99B7ADE31@fuzziesquirrel.com>
 <dd81fb28-4d01-8726-9b16-81a677eb3e16@linux.intel.com>
 <8998b51b-4e67-738e-becd-63c26ea626be@linux.intel.com>
 <d69d24c7-d07f-35d4-1395-859a0df2a05a@linux.vnet.ibm.com>
 <DBA24EEE99A3B3489FF472F5E94DE6D7A30F946F@IRSMSX101.ger.corp.intel.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <c3dd56aa-b9e2-1efd-1da6-70b0e056446f@linux.intel.com>
Date: Thu, 24 Oct 2019 09:14:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <DBA24EEE99A3B3489FF472F5E94DE6D7A30F946F@IRSMSX101.ger.corp.intel.com>
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
Cc: "Mihm, James" <james.mihm@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "neladk@microsoft.com" <neladk@microsoft.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/24/19 1:48 AM, Matuszczak, Piotr wrote:
> As for the two telemetry design proposals:
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/22257
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24357
> I talked with Kun and we agreed that a common bmcweb interface would be great in order to be able to support either the monitoring service or the collectd. In order to to do that collectd will have to be modified to expose D-Bus interface or bmcweb will have to support libraries to handle collectd directly. We at Intel prefer D-Bus for the OpenBMC architecture consistency.
> As for the implementation, we have monitoring service and Redfish telemetry service implemented (currently without triggers support), however it require some refactoring to be production code quality.

Is there a WIP review somewhere?

> 
> The Redfish Event Service (https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24749) is something different than telemetry service, so I wouldn't consider it as third telemetry design. It is rather prepared to cooperate with the Redfish Telemetry Service and there is reference to telemetry design https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24357 .
> 
> -----Original Message-----
> From: Justin Thaler [mailto:thalerj@linux.vnet.ibm.com]
> Sent: Wednesday, October 23, 2019 10:30 PM
> To: James Feist <james.feist@linux.intel.com>; Brad Bishop <bradleyb@fuzziesquirrel.com>; Matuszczak, Piotr <piotr.matuszczak@intel.com>; kunyi@google.com; apparao.puli@linux.intel.com
> Cc: neladk@microsoft.com; openbmc@lists.ozlabs.org; Mihm, James <james.mihm@intel.com>
> Subject: Re: multiple telemetry designs
> 
> 
> 
> On 10/23/19 12:47 PM, James Feist wrote:
>> On 10/23/19 10:39 AM, James Feist wrote:
>>> On 10/23/19 9:38 AM, Brad Bishop wrote:
>>>> There are two telemetry / metric designs under review right now:
> 
> There's a fourth option that can also be used, but more than just sensor readings. This isn't redfish compliant and relies on secure websockets however.
> 
> https://github.com/openbmc/docs/blob/master/rest-api.md#event-subscription-protocol
> 
>>
>> I've been informed there are actually 3:
>>
>> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24749
>>
>> Added Appu to this conversation as well.
>>
>>
>>>>
>>>> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/22257
>>>> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24357
>>>>
>>>> I would like to see one or both of them merged.  Neither seem to
>>>> have any support….there is a single +1 on the latter review from
>>>> Shawn McCarney.  If you support one of these designs, please go
>>>> review it and indicate your support.
>>>
>>> It looks like Kun has +1ed Piotr's design as well, not sure if that
>>> means we can go with one design?
>>>
>>>>
>>>> I also can’t figure out what the path forward for OpenBMC is.  Maybe
>>>> to start with, we could all level set on where we are at with our
>>>> thinking:
>>>>
>>>> Kun: How far along are you in the implementation of your proposal?
>>>> Piotr: How far along are you in the implementation of your proposal?
>>>> James: OpenBMC can support one or both proposals.  If we support
>>>> both, this means multiple implementations for the same thing in
>>>> bmcweb.  One that gets data from dbus objects, and another that gets
>>>> it from librrd.  As the maintainer of bmcweb are you open to
>>>> accepting one or both of these options?
>>>
>>> With 0 previous knowledge, I would suggest using a way that works
>>> with previous OBMC practices, and that is using dbus. If there has to
>>> be 2 separate designs, then if both produce the same d-bus
>>> interfaces, it shouldn't matter to bmcweb which one is being used.
>>> That being said, if this doesn't work for some reason, we've used
>>> compile switches in the past, although this would be the least preferable option.
>>> Truthfully I haven't looked at these designs yet as I've only
>>> recently taken a larger role in bmcweb reviews, so I'll try to look at them soon.
>>>
>>>
>>>>
>>>> Without any discussion and resolution, I’m afraid both of these
>>>> proposals are just going to sit here, unmerged, indefinitely.
>>>>
>>>> thx - brad
>>>>
