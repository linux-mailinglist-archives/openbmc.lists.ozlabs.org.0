Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C7111BC08
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2019 19:43:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Y5Qp1T4gzDqw3
	for <lists+openbmc@lfdr.de>; Thu, 12 Dec 2019 05:42:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y4Fy6Mt2zDql9
 for <openbmc@lists.ozlabs.org>; Thu, 12 Dec 2019 04:50:13 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Dec 2019 09:29:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,302,1571727600"; d="scan'208";a="245362584"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by fmsmga002.fm.intel.com with ESMTP; 11 Dec 2019 09:29:06 -0800
Subject: Re: Faking Sensor Readings
To: rgrs <rgrs@protonmail.com>
References: <QVdDJHlLW9JS_3uowBPTzSCb1dwpqJjml0ORFR_aQGpuKCve1l8Qwy4GF4X0_dgJmExy8sjJQD_VjnI-o4xwoYhivHJlSPBt42fc1cuDKjw=@protonmail.com>
 <0a4bb951-4f85-728a-8426-af629c870908@yadro.com>
 <234c1d26-7b59-0926-d6c2-6c49f75aab3f@linux.intel.com>
 <x5Z3U1jaa8Tf-HK1htUFoCqgAFdtIXGaDyEU7SKkgNkehJEtqaps9BvN2j_D5lsgjEgoTL81fZ8nJLitwFaqW2zRkFK8vXhbCrld3Ziy43o=@protonmail.com>
 <2de3b2e2-9b02-a1c2-d310-f6e546e72c1e@linux.intel.com>
 <JIIzLFDdd2_yAem6ToyksGqeJ7ulaTOylaocMLH19rYqyv3fSzcEL2H9VDJW66iYQY8L8FwjgpZqPFj8rRD0JP52xsAHQ6kD4_ygDAjj0LE=@protonmail.com>
 <e59e36d1-74fc-5f44-a472-26fdfb127af2@linux.intel.com>
 <iSeeVedIu2fcqVt4W4TlDAQNHMjfTxE0NUAs68nlqossQmqy5OdbHgn9YHO1kh88ZpFMHO6bpGL7ki2hS9mQgw2d7Dk2WQFH-o6jOH6e1g4=@protonmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <8eb66be0-c5a4-ac3d-2421-8648c2fc4a4f@linux.intel.com>
Date: Wed, 11 Dec 2019 09:29:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <iSeeVedIu2fcqVt4W4TlDAQNHMjfTxE0NUAs68nlqossQmqy5OdbHgn9YHO1kh88ZpFMHO6bpGL7ki2hS9mQgw2d7Dk2WQFH-o6jOH6e1g4=@protonmail.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Alexander Amelkin <a.amelkin@yadro.com>, "Thomaiyar,
 Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/11/19 1:14 AM, rgrs wrote:
> Hi James,
> 
> I don't see any results for the grep command.
> 
> Our platform was built referencing Witherspoon IIRC.
> 
> Below links were used during porting,
> 
> https://github.com/openbmc/docs/blob/master/development/add-new-system.md
> 
> https://developer.ibm.com/linuxonpower/2019/01/07/how-to-port-openbmc/
> 
> I don't see "entity manager" being used in above links. Is it something specific to Intel servers?

Entity-manager is here: https://github.com/openbmc/entity-manager, there 
is a readme checked in with some basic information.

There is also a guide here for adding your first sensors: 
https://github.com/openbmc/entity-manager/blob/master/docs/my_first_sensors.md

Configuration files are here: 
https://github.com/openbmc/entity-manager/tree/master/configurations

First step is to add dbus-sensors and entity-manager to your image like 
the earlier provided links.

Thanks,

James






> 
> If I were to port a new board today, which is the reference platform or guide to refer?
> 
> Thx,
> Raj
> 
> 
> 
> 
> ‐‐‐‐‐‐‐ Original Message ‐‐‐‐‐‐‐
> On Monday, December 9, 2019 11:58 PM, James Feist <james.feist@linux.intel.com> wrote:
> 
>> On 12/6/19 3:32 AM, rgrs wrote:
>>
>>> Hi,
>>> I dont see any new service even after adding dbus-sensors.
>>> Please can you point to any platform in upstream that I can refer to?
>>
>> https://github.com/openbmc/meta-intel/blob/daa333d956ad9391abcbb85468d9bc9f26ee1190/meta-common/recipes-intel/packagegroups/packagegroup-intel-apps.bb#L43
>>
>> https://github.com/openbmc/meta-facebook/blob/master/meta-tiogapass/recipes-fbtp/packagegroups/packagegroup-fb-apps.bb
>>
>> If you do a ps do you see any of the sensor daemons running?
>>
>> root@intel-obmc:~# ps | grep -i sensor
>> 332 root 6008 S /usr/bin/adcsensor
>> 333 root 6356 S /usr/bin/cpusensor
>> 334 root 5784 S /usr/bin/exitairtempsensor
>> 335 root 5696 S /usr/bin/fansensor
>> 336 root 5608 S /usr/bin/hwmontempsensor
>> 337 root 5660 S intrusionsensor
>> 339 root 5716 S /usr/bin/ipmbsensor
>> 340 root 5512 S /usr/bin/mcutempsensor
>> 341 root 5868 S /usr/bin/psusensor
>> 588 root 2776 S grep -i sensor
>> root@intel-obmc:~#
>>
>> If so then you'll need to add entity-manager configurations like these:
>>
>> https://github.com/openbmc/entity-manager/blob/7d807754cc9153b04b599804464edd9654d7a81e/configurations/WFT Baseboard.json#L2023
>>
>> Thanks
>>
>> James
>>
>>> Thanks,
>>> Raj
>>> ‐‐‐‐‐‐‐ Original Message ‐‐‐‐‐‐‐
>>> On Wednesday, December 4, 2019 10:40 PM, James Feist james.feist@linux.intel.com wrote:
>>>
>>>> On 12/4/19 1:39 AM, rgrs wrote:
>>>>
>>>>> Hi James,
>>>>> I tried busctl set-property, but the values didn't change.
>>>>> Are the steps below correct?
>>>>> (test with both 'field mode' enabled and disabled)
>>>>> root@obmc:~# busctl introspect xyz.openbmc_project.Hwmon-2439434288.Hwmon1 /xyz/openbmc_project/sensors/temperature/INLET_TEMP xyz.openbmc_project.Sensor.Value --no-pager
>>>>> NAME TYPE SIGNATURE RESULT/VALUE FLAGS
>>>>> .MaxValue property x 0 emits-change writable
>>>>> .MinValue property x 0 emits-change writable
>>>>> .Scale property x -3 emits-change writable
>>>>> .Unit property s "xyz.openbmc_project.Sensor.Value.Unit.… emits-change writable
>>>>
>>>> This looks like phosphor-hwmon, not dbus-sensors
>>>> https://github.com/openbmc/dbus-sensors.
>>>>
>>>>> .Value property x 18500 emits-change writable
>>>>> root@obmc:~# busctl --no-pager set-property xyz.openbmc_project.Hwmon-2439434288.Hwmon1 /xyz/openbmc_project/sensors/temperature/INLET_TEMP xyz.openbmc_project.Sensor.Value Value x 50000
>>>>> root@saber:~# busctl --no-pager get-property xyz.openbmc_project.Hwmon-2439434288.Hwmon1 /xyz/openbmc_project/sensors/temperature/INLET_TEMP xyz.openbmc_project.Sensor.Value Value
>>>>> x 18500
>>>>> root@obmc:~#
>>>>> Thanks,
>>>>> Raj
>>>>> ‐‐‐‐‐‐‐ Original Message ‐‐‐‐‐‐‐
>>>>> On Wednesday, December 4, 2019 1:34 AM, James Feist james.feist@linux.intel.com wrote:
>>>>>
>>>>>> On 12/3/19 5:49 AM, Alexander Amelkin wrote:
>>>>>>
>>>>>>> 03.12.2019 15:06, rgrs wrote:
>>>>>>>
>>>>>>>> Hi,
>>>>>>>> How do I fake sensor readings in OpenBMC?
>>>>>>>> We're trying to fake temperature sensors and make sure fans ramp up/down
>>>>>>>> accordingly.
>>>>>>>
>>>>>>> We ended up patching the kernel driver to fake the readings by request.
>>>>>>> I'm not aware of any ready interface in OpenBMC for that.
>>>>>>
>>>>>> If you're using d-bus sensors, the sensor property is writable. It is
>>>>>> also supported by patching the sensor value in redfish.
>>>>>>
>>>>>>> With best regards,
>>>>>>> Alexander Amelkin
>>>>>>> /james.feist@linux.intel.com
> 
> 
