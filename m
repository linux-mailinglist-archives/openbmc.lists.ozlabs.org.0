Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECA410595A
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2019 19:17:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Jnp42CV8zDr4g
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 05:17:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Jnn33QnXzDq6J
 for <openbmc@lists.ozlabs.org>; Fri, 22 Nov 2019 05:16:05 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Nov 2019 10:16:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,226,1571727600"; d="scan'208";a="238283157"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by fmsmga002.fm.intel.com with ESMTP; 21 Nov 2019 10:16:01 -0800
Subject: Re: Redfish OpenBMC OEM
To: Gunnar Mills <gmills@linux.vnet.ibm.com>,
 Joseph Reynolds <jrey@linux.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <bec7abfa-8a69-3c8b-7985-dccb80d5c674@linux.vnet.ibm.com>
 <dcfd49c5-48a1-12aa-2f1e-56aef6232cfc@linux.ibm.com>
 <0967abf5-7eb4-8b72-2fe7-d8d4a95ca856@linux.intel.com>
 <5e21e041-aa40-f1a1-e4eb-9aed63db368a@linux.ibm.com>
 <b2654349-f0bf-b341-5736-618dfa2c1fa9@linux.intel.com>
 <bd1c5c4f-68f7-42d4-aebd-daa6629deef5@linux.vnet.ibm.com>
 <e4ce21b1-cab9-765d-100b-5c62843468e0@linux.intel.com>
 <f5078dd7-1b7b-1b93-d1e6-b56081b55835@linux.vnet.ibm.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <e869ddc9-4682-78b1-b289-6f5ad4a525dc@linux.intel.com>
Date: Thu, 21 Nov 2019 10:16:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <f5078dd7-1b7b-1b93-d1e6-b56081b55835@linux.vnet.ibm.com>
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
Cc: jason.m.bills@linux.intel.com, apparao.puli@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/21/19 7:39 AM, Gunnar Mills wrote:
> 
> On 11/20/2019 5:50 PM, James Feist wrote:
>> On 11/20/19 2:45 PM, Gunnar Mills wrote:
>>>
>>> On 11/20/2019 11:47 AM, James Feist wrote:
>>>> On 11/20/19 7:57 AM, Joseph Reynolds wrote:
>>>>> On 11/19/19 1:04 PM, James Feist wrote:
>>>>>> On 11/19/19 10:03 AM, Joseph Reynolds wrote:
>>>>>>> On 11/19/19 10:23 AM, Gunnar Mills wrote:
>>>>>>>>
>>>>>>>> The process seems a little light for adding OpenBMC OEM Redfish 
>>>>>>>> properties and schemas. Can we establish a little more stringent 
>>>>>>>> process for adding these?
>>>>>>>>
>>>
>>> James, Joseph, and others would you support having a guideline, 
>>> stating before adding an OEM schema or property, please first engage 
>>> the Redfish Group? Things Redfish is not interested in taking are an 
>>> obvious exception. I am also fine with things that are in the process 
>>> of being up-streamed, being added as OEM temporarily.
>>
>> What redfish group are you mentioning?
>>
> 
> DMTF’s Redfish
> 
> They have an open forum here,  to ask questions and request features: 
> https://redfishforum.com/
> 
> To get access to the Redfish code repository and meetings
> 1) Your company must be a Redfish Supporter or Promoter, a lot of 
> companies working on OpenBMC are
> 2) Join the DMTF, www.dmtf.org/join
> 3) Join the "Redfish Forum" working group, 
> https://members.dmtf.org/apps/org/workgroup/portal/
> 4) Send an email asking for access to the Redfish code repository
> 
> I was thinking either of these would establish "engaging Redfish".

I'd be fine with adding this to the docs/readme, however as your company 
has to be a supporter, it should probably be a weak requirement.

> 
> Thanks,
> Gunnar
