Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AF01CC6B
	for <lists+openbmc@lfdr.de>; Tue, 14 May 2019 18:03:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453MsZ0KjpzDqG8
	for <lists+openbmc@lfdr.de>; Wed, 15 May 2019 02:02:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (helo) smtp.helo=mga12.intel.com
 (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453MrQ5fcCzDqDs
 for <openbmc@lists.ozlabs.org>; Wed, 15 May 2019 02:01:56 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 May 2019 09:01:52 -0700
X-ExtLoop1: 1
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga002.jf.intel.com with ESMTP; 14 May 2019 09:01:52 -0700
Subject: Re: about phosphor pid control package
To: =?UTF-8?B?V2lsbCBMaWFuZyAo5qKB5rC46YmJKQ==?= <Will.Liang@quantatw.com>,
 Patrick Venture <venture@google.com>
References: <28581f1979a946fdb2f53013bab4661c@quantatw.com>
 <CAO=notyeTBr3BSKrhxDP3uW3s0kma6cek-Dz-33tczKU0pL-Mg@mail.gmail.com>
 <aa5dec4830f349429f440dda2aee7bf2@quantatw.com>
 <CAO=notzHKYjCd++=A+rEzV8bdLc782caeDA=aHg2bC4-6JTp=g@mail.gmail.com>
 <0a0149bc-5120-78ee-1fc3-877f510b66a4@linux.intel.com>
 <06213e65eb3c48ce8eaa3699265bf8ae@quantatw.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <4349110e-75c5-1f7b-1f1b-5978eb84c454@linux.intel.com>
Date: Tue, 14 May 2019 09:01:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <06213e65eb3c48ce8eaa3699265bf8ae@quantatw.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


>>>>> But one more question I have is that the above code can only check
>>>>> if a
>>> single fan has failed.
>>>>
>>>>> Our project needs to check for dual-fan failures. Do you have any
>>> suggestions for checking the failure of the dual-fan?
>>>>
>>>> I'm not entirely certain what you mean.  You're saying a dual-fan is
>>>> a fan that has two outputs but one input?
>>>
>>> If this is what you mean, on our systems we simply have a tach sensor
>>> per tach in the fan, i.e. fan1a and fan1b. I think the above logic
>>> would work for this issue.
> I think someone may also need to check for one rotor fan fail, I will push the above code into gerrit
> 
>> I'm so sorry to make you misunderstand because of my unclear expression.
>> The "dual-fan" means "Dual rotor fan" , two tachometer output one PWM
>> input.
> Our architecture is that both fan1a and fan1b fail (dual rotor fan failure) and then this situation is identified as one fan fail.
> 
> Would you have any suggestion or idea?

What we have done in the past is used fan redundancy failures for this 
sort of thing. I would suggest monitoring the fan redundancy interface 
for redundancy lost to create failure: 
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Control/FanRedundancy.interface.yaml

-James

