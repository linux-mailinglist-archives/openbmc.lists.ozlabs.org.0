Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 595CD725CF
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 06:19:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45thvR3tvDzDqBS
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 14:19:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tQQX2TzZzDqPM
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 03:27:15 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2019 10:27:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,299,1559545200"; d="scan'208";a="368499566"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.251.18.151])
 ([10.251.18.151])
 by fmsmga005.fm.intel.com with ESMTP; 23 Jul 2019 10:27:12 -0700
From: James Feist <james.feist@linux.intel.com>
Subject: Re: dbus-sensors + phosphor-hwmon
To: Patrick Venture <venture@google.com>
References: <CAO=notxxEHzBeCew3OaGs9E=vvzjf9q2XFD1E0S9aRqxzSSHzQ@mail.gmail.com>
 <b6210038-21fb-6e90-fb90-88d5602db81e@linux.intel.com>
 <CAO=notwynLKMA9=37BQTDfdbda1Stfu=kgHt2YO4EwhpT2DekA@mail.gmail.com>
Message-ID: <422051d9-c63a-eb03-09d5-060074de6b12@linux.intel.com>
Date: Tue, 23 Jul 2019 10:27:12 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAO=notwynLKMA9=37BQTDfdbda1Stfu=kgHt2YO4EwhpT2DekA@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Tanous,
 Ed" <ed.tanous@intel.com>, Ofer Yehielli <ofery@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 7/23/2019 10:17 AM, Patrick Venture wrote:
> On Tue, Jul 23, 2019 at 9:58 AM James Feist <james.feist@linux.intel.com> wrote:
>>
>> On 7/22/2019 3:26 PM, Patrick Venture wrote:
>>> I haven't tested yet, but I have a device-tree with a lot of ~40
>>> hard-coded sensors on it, and then the other sensors will be detected
>>> with entity-manager (once that's set up).
>>
>> Entity-manager doesn't detect sensors, it detects removable components
>> then expects certain sensors. For our baseboard here:
>> https://github.com/openbmc/entity-manager/blob/master/configurations/WFT%20Baseboard.json
>> at the bottom of the file there is a dbus-probe for an
>> xyz.openbmc_project.FruDevice interface with some specific properties.
>> If those match, then entity-manager through sysfs can add some sensors
>> https://github.com/openbmc/entity-manager/blob/master/include/devices.hpp
> 
> Right, so entity-manager writes out a configuration to dbus and
> dbus-sensors works from that exported configuration on dbus -- ?
> That's my current understanding, the trick is, the dynamic versus
> static, and how some sensors are already specified in the device-tree.

We don't define any in the device tree. We just use one very basic 
device tree with not much in it (in regards to sensors) besides i2c 
buses. Although you could have some in device tree, right now I believe 
you'd just get export warnings. It uses sysfs to export sensors. In the 
future we'd like to have multiple device trees in u-boot and switch 
between them to allow multiple i2c typologies, but we haven't gotten there.


> 
>>
>> You could also use device tree if you wanted, the export just wouldn't
>> succeed. But you would need a json file with the sensors bus and address
>> for dbus-sensors to work.
>>
>> -James
>>
>>
>>>
>>> In this case, will entity-manager populate the dbus configuration with
>>> those in the device-tree initially making them available to
>>> dbus-sensors? (or will we or should we, also configure phosphor-hwmon
>>> for those sensors?)
>>>
>>> Patrick
>>>
