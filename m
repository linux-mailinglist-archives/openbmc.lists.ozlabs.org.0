Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 439318F098
	for <lists+openbmc@lfdr.de>; Thu, 15 Aug 2019 18:27:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468X1M4LkSzDr95
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 02:27:51 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 468X0b5MW1zDr69
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 02:27:09 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Aug 2019 09:27:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,389,1559545200"; d="scan'208";a="260863011"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga001.jf.intel.com with ESMTP; 15 Aug 2019 09:27:06 -0700
Subject: Re: unexpected configuration output given examples
To: Patrick Venture <venture@google.com>
References: <CAO=notzZQ4La6sUWYsDqFsbtXV_A4EhdsUA7iTsouxZMsm+bqQ@mail.gmail.com>
 <CAO=notzy6ntzoNV3VB8Qu672nYk6qdu2j4Y2zGfi=zqsGCmmag@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <19d0d4a3-3696-f6af-12e9-663143c79133@linux.intel.com>
Date: Thu, 15 Aug 2019 09:27:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAO=notzy6ntzoNV3VB8Qu672nYk6qdu2j4Y2zGfi=zqsGCmmag@mail.gmail.com>
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

On 8/14/19 6:16 PM, Patrick Venture wrote:
> On Wed, Aug 14, 2019 at 5:48 PM Patrick Venture <venture@google.com> wrote:
>>
>> When hard-coding bus and addresses, I ran into an interesting issue.
>> Previously, my sensors were dynamically bus'd with hard-coded
>> addresses, like:
>>
>> {
>>      "Exposes": [
>>          {
>>              "Address": "0x1c",
>>              "Bus": "$bus",
>>              "Name": "$bus board local",
>>              "Name1": "$bus board external",
>>              "Type": "TMP441"
>>          },
>> ...
>> }
>>
>> Leads to:
>> xyz.openbmc_project.Configuration.TMP441 interface -         -                 -
>> .Address                                 property  t         28
>>          emits-change
>> .Bus                                     property  t         20
>>          emits-change
>>
>> Which is great.
>>
>> But:
>> {
>>      "Exposes": [
>>          {
>>             "Address": "0x54",
>>             "Bus": 15,
>>             "Name": "$bus i2cool 0",
>>             "Type": "MAX31725"
>>          },
>> ...
>> }
>>
>> Leads to:
>> xyz.openbmc_project.Configuration.MAX31725 interface -         -               -
>> .Address                                   property  s         "0x54"
>>          emits-change
>> .Bus                                       property  t         15
>>          emits-change
>>
>>
>> Which crashes the hwmon temp program because it's "getting" a uint64_t
>> and not a string.
> 
> I verified that if I use decimal for the address as an int it works.
> But I'm interested to know why "0x54" doesn't get converted to an int
> every time?

It's possible some of the changes in review fix this.. I added it as a 
unit test here and it seems to work:

https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/24463

Unless something else in the code is preventing it from getting to the 
replacement function.

> 
>>
>> My only caveat worthwhile is that the hwmon instance is already
>> present because that sensor is in the device-tree.  So I would expect
>> it to only fail on the export.
>>
>> Note, I did also try "Address" as an int and not a string, but that
>> then failed the json validation.
>>
>> Thanks,
>> Patrick
