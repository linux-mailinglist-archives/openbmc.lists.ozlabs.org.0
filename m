Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3990C11943
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 14:43:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vw124kMxzDqSr
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2019 22:43:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vvzf4DPVzDqPm;
 Thu,  2 May 2019 22:42:21 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 May 2019 05:42:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,421,1549958400"; d="scan'208";a="166990434"
Received: from unknown (HELO [10.252.171.144]) ([10.252.171.144])
 by fmsmga004.fm.intel.com with ESMTP; 02 May 2019 05:42:16 -0700
Subject: Re: One-way dbus properties
To: Adriana Kobylak <anoo@linux.ibm.com>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
References: <a25981c28a179307d5b8135e32a072ff@linux.vnet.ibm.com>
 <dcca3e80-93a4-beed-33dc-6d59512bd37c@linux.vnet.ibm.com>
 <75d6db408ef61d60de465501e3569787@linux.vnet.ibm.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <9e9d53e9-45c6-4b18-237b-1562c2d797a3@linux.intel.com>
Date: Thu, 2 May 2019 18:12:15 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <75d6db408ef61d60de465501e3569787@linux.vnet.ibm.com>
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
Cc: openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

when this value is false (i.e. not in field), then do we need to take 
actions as per RestrictionList or not (i.e. based on the value of 
RestrictionMode).

regards,

Richard

On 5/1/2019 9:02 PM, Adriana Kobylak wrote:
>>
>> What's the purpose of this property ? Why we are not using the same in
>> RestrictionMode ? Any pointers when RestrictionMode::whitelist /
>> blacklist will be used.
>>
>> Reason: Defining new one, and planning to use
>> Security::RestrictionMode itself to indicate that BMC system in not
>> deployed (i.e. not in field), or deployed with certain restriction?
>>
>
> FieldMode is an 'old' property used in the phosphor-bmc-code-mgmt repo 
> to make decisions such as if the code update should fail when there's 
> a digital signature mismatch, and whether /usr/local/ is allowed to be 
> mounted to allow the system to be patched.
> I'd say it's a bit different than the IPMI whitelist in that it 
> doesn't necessarily block interfaces, but interfaces use it to make 
> decisions. Of course this may be implemented differently in Redfish.
> There was just recently a request to return an error when trying to 
> clear it since historically it has been a no-op.
>
>
>> How is it different from readonly property, so suppose there is a
>> object which implements this interface.
>>
>> when this object gets created, as part of creation we can set the
>> property, but after object creation user can,t set
>>
>> the property.
>>
>
> The intent is that the property is set by an external entity like 
> manufacturing, before a system is shipped, so we don't want to set it 
> when the object is created. We want to keep its value unset in the lab 
> machines, but if the value is set then it can't be cleared (and per 
> Deepak's comment should return an error instead of success).
>
