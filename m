Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3886B221224
	for <lists+openbmc@lfdr.de>; Wed, 15 Jul 2020 18:21:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6N1v43FPzDqnl
	for <lists+openbmc@lfdr.de>; Thu, 16 Jul 2020 02:21:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6N0g1HqYzDqnc
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jul 2020 02:20:48 +1000 (AEST)
IronPort-SDR: EO/tiFRU3lYr55pt06WqO6B3jn9tzqEL27zRC0Akatp5z2tHqwU8AzJCVnSCtyikHjmeYYd7LV
 viMgtZz6/iSQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9683"; a="128763350"
X-IronPort-AV: E=Sophos;i="5.75,355,1589266800"; d="scan'208";a="128763350"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 09:20:25 -0700
IronPort-SDR: PnwZVCKKF/rtY04DhEqUcDHiU3JaHL0Lm+1TgC9OWLtKUknJPpfNi6Vs0kvoOxQnol5+EFPFUZ
 BxUCfHWTUpvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,355,1589266800"; d="scan'208";a="282149088"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.213.169.25])
 ([10.213.169.25])
 by orsmga003.jf.intel.com with ESMTP; 15 Jul 2020 09:20:24 -0700
Subject: Re: Redfish HealthRollup/LED question
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>, vishwa@linux.vnet.ibm.com
References: <56aeaf07-beb1-22ca-ab54-aa984ea82bf1@linux.vnet.ibm.com>
 <a372f939-e33f-db57-5b46-09b7f8e569ff@linux.intel.com>
 <6d013fd8-04f2-4a2a-5c73-90e65895103c@linux.vnet.ibm.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <672edf98-6522-f453-6692-8cd0835ba399@linux.intel.com>
Date: Wed, 15 Jul 2020 09:20:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6d013fd8-04f2-4a2a-5c73-90e65895103c@linux.vnet.ibm.com>
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

On 7/15/2020 1:14 AM, Deepak Kodihalli wrote:
> On 15/07/20 2:40 am, James Feist wrote:
>> On 7/14/2020 4:44 AM, Deepak Kodihalli wrote:
>>> Hi James/Gunnar,
>>>
>>> On IBM platforms, a fault indicator LED associated with a FRU can 
>>> indicate the "Health Rollup" status of the FRU. For eg a CPU can be 
>>> healthy, but something contained within (eg a core) may be broken, so 
>>> the LED will be turned on. I think the Redfish HealthRollup property 
>>> is conceptually similar.
>>>
>>> Question is - do you see a problem if we add code in bmcweb that sets 
>>> the HealthRollup property for a FRU if an associated LED is turned 
>>> on? I believe this is aligned with 
>>> https://github.com/openbmc/docs/blob/master/designs/redfish-health-rolllup.md 
>>> (no new D-Bus objects/interfaces being added, etc). On IBM platforms, 
>>> a D-Bus association might exist between the FRU and the LED, and 
>>> setting the HealthRollup property will be based on this. If the said 
>>> association is missing on other platforms, the code will not do 
>>> anything.
>>
>> What changes does this require? I believe this is how the health roll 
>> up functions today.
> 
> Yes, the bmcweb code around HealthRollup does look up association 
> endpoints today already. What I mentioned above might need code changes 
> to look at additional association types.
> 

I'd prefer we try to be consistent, but if that is not possible 
additional associations are probably fine, as long as the documentation 
is updated.
