Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4F1A0C62
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2019 23:29:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Jf5p2SZMzDrDJ
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 07:29:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Jf565ZFgzDrCX
 for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2019 07:29:13 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2019 14:29:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,442,1559545200"; d="scan'208";a="380547583"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by fmsmga005.fm.intel.com with ESMTP; 28 Aug 2019 14:29:10 -0700
Subject: Re: Entity-Manager's Configuration Generation leaves address as string
To: Patrick Venture <venture@google.com>
References: <CAO=notzA5GNeAbNxvrDs3gwORnjx36d5oPa5R=D-oajCxBC2Ow@mail.gmail.com>
 <6ab26e95-a327-9263-c1f3-9ba02333913d@linux.intel.com>
 <CAO=notxxc_S-DnPL=ObOuA_KiC-j0F-qMOMKmfYMTUAnepVdew@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <309f39a3-8f76-aec1-85a5-0a3907120bd0@linux.intel.com>
Date: Wed, 28 Aug 2019 14:29:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAO=notxxc_S-DnPL=ObOuA_KiC-j0F-qMOMKmfYMTUAnepVdew@mail.gmail.com>
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/28/19 2:16 PM, Patrick Venture wrote:
> On Wed, Aug 28, 2019 at 9:29 AM James Feist <james.feist@linux.intel.com> wrote:
>>
>> On 8/28/19 7:27 AM, Patrick Venture wrote:
>>> I think I've figured out what's happening.
>>>
>>> If a configuration has no fields that are changed by the template code
>>> (or possibly even in that case), nothing happens to the values.  So,
>>> the property Address is left "0x54" if that's what it is.  And the
>>> code is templated, so it just adds that property of type string to the
>>> dbus sensor configuration.  As this is definitely what I'm seeing.
>>> Json doesn't support ints that are written raw as hex, so wrapping
>>> them as strings is what's required to make the json parse.  I've
>>> worked around this problem by just using decimal everywhere, but
>>> that's harder to read when comparing to schematics.
>>
>> Based on this, I think this line might be your issue:
>>
>> https://github.com/openbmc/entity-manager/blob/3b80d7c51ff5d5859c0ca1f2b517c18f4766a1a6/src/EntityManager.cpp#L1336
>>
>>
>> If found device is nullopt, you still want to call this line, but you
>> want to call it with an empty flat_map.
>>
>> I verified if this happens it should work here:
>>
>> https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/24787
> 
> So, we're still hitting the error:
> 
> ...
>      "Exposes": [
>          {
>             "Address": "0x54",
>             "Bus": 31,
>             "Name": "i2cool 0",
>             "Type": "MAX31725"
>          },
> ....

Did you change the above line? What have you tried? Guessing it has to 
do with templateCharReplace not getting hit, if it gets hit it should be 
replacing it.

> 
> Aug 15 22:38:58 MACHINE hwmontempsensor[2697]: terminate called after
> throwing an instance of 'std::bad_variant_access'
> 
> It's failing because the configuration is a string "0x54" in dbus.
> 
>>
>>
>>
>>>
>>> Would it make sense to make the add property code less field agnostic
>>> so that if the field is Address and the Interface for
>>> configuration.XXX that it checks to see if it's a hex string?  Or,
>>> maybe the templateChar replace -- if that supports converting the hex
>>> string to a raw integer value type should always get hit?
>>>
>>> Thanks,
>>> Patrick
>>>
