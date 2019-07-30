Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC597B2D0
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 21:02:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ymBx06vJzDqZB
	for <lists+openbmc@lfdr.de>; Wed, 31 Jul 2019 05:02:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ymB90DqszDqVK
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jul 2019 05:01:35 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jul 2019 12:01:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,327,1559545200"; d="scan'208";a="255758014"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga001.jf.intel.com with ESMTP; 30 Jul 2019 12:01:32 -0700
Subject: Re: entity-manager experiments
To: Patrick Venture <venture@google.com>, Ed Tanous <ed.tanous@intel.com>
References: <CAO=notzQbwA32vcyznddZX8Y4ypyvoFcbHRQjpVZBQGfpTieaw@mail.gmail.com>
 <CAO=notwXPOwxDk_J5eZXjqjN-po-OTexSNPz=kBX=iunxhW=+Q@mail.gmail.com>
 <d866e2a8-e92c-85d6-fd67-260a3c735b56@intel.com>
 <CAO=notxtHNyi9hJTQ5H5LT9BR_6a6yO+e5fdr92-R+jBy0hCUQ@mail.gmail.com>
 <CAO=notxDqf44vz=N_gobOQyTBPeAHOudLNRkidK4ACtJOZsdNw@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <d308a92c-ed00-fc3b-56c4-a0de84a6b561@linux.intel.com>
Date: Tue, 30 Jul 2019 12:01:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAO=notxDqf44vz=N_gobOQyTBPeAHOudLNRkidK4ACtJOZsdNw@mail.gmail.com>
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

On 7/30/19 11:41 AM, Patrick Venture wrote:
> On Mon, Jul 29, 2019 at 1:05 PM Patrick Venture <venture@google.com> wrote:
>>
>> On Mon, Jul 29, 2019 at 12:58 PM Ed Tanous <ed.tanous@intel.com> wrote:
>>>
>>> On 7/26/19 4:45 PM, Patrick Venture wrote:
>>>> On Fri, Jul 26, 2019 at 4:40 PM Patrick Venture <venture@google.com> wrote:
>>>>>
>>>>> Hi,
>>>>>
>>>>> I was curious if you had any thoughts on what is missing here -- I
>>>>> wrote a basic json file:
>>>>>
>>>>> razorback.json:
>>>>> {
>>>>>      "Exposes": [
>>>>>          {
>>>>>              "Address": "$address",
>>>>>              "Bus": "$bus",
>>>>>              "Name": "Razorback",
>>>>>              "Type": "EEPROM"
>>>>>          },
>>>>>          {
>>>>>              "Address": "0x4c",
>>>>>              "Bus": "$bus",
>>>>>              "Name": "Razorback Temp Sensor",
>>>>>              "Type": "TMP421"
>>>>>          }
>>>>>      ],
>>>>>      "Name": "Razorback Board",
>>>>>      "Probe" : "xyz.openbmc_project.FruDevice({'PRODUCT_PRODUCT_NAME':
>>>>> '.*Razorback'})",
>>>
>>> I'd recommend taking out the wildcard if you can if you don't expect
>>> there to be multiple models of this board.  We've gotten trapped a
>>> little in the past with next-gen boards sporting a similar product name
>>> (think 2019_Razorback vs 2020_Razorback) and configs getting applied
>>> that shouldn't have.
>>
>> Thanks.
>>
>>>
>>>>>      "Type": "Board",
>>>>>      "xyz.openbmc_project.Inventory.Decorator.Asset": {
>>>>>          "Manufacturer": "$PRODUCT_MANUFACTURER",
>>>>>          "Model": "$PRODUCT_PRODUCT_NAME",
>>>>>          "PartNumber": "$PRODUCT_PART_NUMBER",
>>>>>          "SerialNumber": "$PRODUCT_SERIAL_NUMBER"
>>>>>      }
>>>>> }
>>>>>
>>>>> And it finds it:
>>>>> Service xyz.openbmc_project.EntityManager:
>>>>> `-/xyz
>>>>>    `-/xyz/openbmc_project
>>>>>      |-/xyz/openbmc_project/EntityManager
>>>>>      `-/xyz/openbmc_project/inventory
>>>>>        `-/xyz/openbmc_project/inventory/system
>>>>>          `-/xyz/openbmc_project/inventory/system/board
>>>>>            `-/xyz/openbmc_project/inventory/system/board/Razorback_Board
>>>>>              |-/xyz/openbmc_project/inventory/system/board/Razorback_Board/Razorback
>>>>>              `-/xyz/openbmc_project/inventory/system/board/Razorback_Board/Razorback_Temp_Sensor
>>>>>
>>>>> Service xyz.openbmc_project.FruDevice:
>>>>> `-/xyz
>>>>>    `-/xyz/openbmc_project
>>>>>      `-/xyz/openbmc_project/FruDevice
>>>>>        `-/xyz/openbmc_project/FruDevice/_0
>>>>>
>>>>> I don't know why it's named _0, but I can debug that late
>>> The logic for that name is right here:
>>> https://github.com/openbmc/entity-manager/blob/441c7a86749b2331863b115e141033e735bd6ffc/src/FruDevice.cpp#L549
>>>
>>> I'm guessing either the board section product name field or the product
>>> section product name field is blank.  In that, we should probably check
>>> for empty string and move on to the next one.
>>
>> Thanks.  I'll take a look there and write up a patch to fix it.
> 
> Dug into it and found that it is finding two of those FRUs on my
> platform, as it should, and it installs one with _0 then the other
> just overwrites it also with _0.
> 
> I'll look into whether it's feasible to add a global list inside
> FruDevice so it can just add a number to the end or something.

This should be doing it: 
https://github.com/openbmc/entity-manager/blob/441c7a86749b2331863b115e141033e735bd6ffc/src/FruDevice.cpp#L596


My guess looking at this is that the for loop needs to be changed to 
loop through until it doesn't find the same product name. If you 
restarted the loop when index was incremented it would fix your issue I 
think.

> 
>>
>>>
>>>>>
>>>>> So I introspect on it:
>>>>> busctl introspect --no-pager xyz.openbmc_project.EntityManager
>>>>> /xyz/openbmc_project/inventory/system/board/Razorback_Board/Razorback_Temp_Sensor
>>>>> NAME                                     TYPE      SIGNATURE
>>>>> RESULT/VALUE            FLAGS
>>>>> org.freedesktop.DBus.Introspectable      interface -         -
>>>>>                -
>>>>> .Introspect                              method    -         s
>>>>>                -
>>>>> org.freedesktop.DBus.Peer                interface -         -
>>>>>                -
>>>>> .GetMachineId                            method    -         s
>>>>>                -
>>>>> .Ping                                    method    -         -
>>>>>                -
>>>>> org.freedesktop.DBus.Properties          interface -         -
>>>>>                -
>>>>> .Get                                     method    ss        v
>>>>>                -
>>>>> .GetAll                                  method    s         a{sv}
>>>>>                -
>>>>> .Set                                     method    ssv       -
>>>>>                -
>>>>> .PropertiesChanged                       signal    sa{sv}as  -
>>>>>                -
>>>>> xyz.openbmc_project.Configuration.TMP421 interface -         -
>>>>>                -
>>>>> .Address                                 property  t         76
>>>>>                emits-change
>>>>> .Bus                                     property  t         17
>>>>>                emits-change
>>>>> .Name                                    property  s
>>>>> "Razorback Temp Sensor" emits-change
>>>>> .Type                                    property  s         "TMP421"
>>>>>                emits-change
>>>>>
>>>>> and all that looks correct, and now there's an i2c device at 17-004c,
>>>>> but no hwmon path, and:
>>>>>
>>>>> Jul 25 00:27:24 machine intrusion-sensor[2654]: Error communicating to
>>>>> entity manager
>>>>> Jul 25 00:27:24 machine intrusion-sensor[2654]: error communicating to
>>>>> entity manager
>>>>> Jul 25 00:27:24 machine fansensor[2671]: Error communicating to entity manager
>>>>> Jul 25 00:27:24 machine fansensor[2671]: error communicating to entity manager
>>>>> Jul 25 00:27:24 machine fansensor[2671]: Error calling entity manager
>>>>> Jul 25 00:27:24 machine adcsensor[2658]: Error communicating to entity manager
>>>>> Jul 25 00:27:24 machine adcsensor[2658]: error communicating to entity manager
>>>>> Jul 25 00:27:25 machine mcutempsensor[2689]: Error contacting entity manager
>>>>> Jul 25 00:27:25 machine hwmontempsensor[2675]: Error communicating to
>>>>> entity manager
>>>>> Jul 25 00:27:25 machine hwmontempsensor[2675]: error communicating to
>>>>> entity manager
>>>>> Jul 25 00:27:26 machine psusensor[2677]: Error communicating to entity manager
>>>>> Jul 25 00:27:26 machine psusensor[2677]: error get sensor config from
>>>>> entity manager
>>>>> Jul 25 00:27:27 machine ipmbsensor[2674]: Error contacting entity manager
>>>>> Jul 25 00:27:27 machine cpusensor
>>>> [2666]: Error communicating to entity manager
>>>>> Jul 25 00:27:27 machine entity-manager[2694]: Clearing previous configuration
>>>>>
>>>>> Service xyz.openbmc_project.HwmonTempSensor:
>>>>> Only root object discovered.
>>>>>
>>>>> Any thoughts on the disconnect?  Have you seen anything like this?
>>>>
>>>> I had a hunch the driver was missing:
>>>>
>>>> tmp/work-shared/machine/kernel-build-artifacts/.config:1827:#
>>>> CONFIG_SENSORS_TMP421 is not set
>>>>
>>>> ... ok, so that makes sense then! :D  Will try fixing that first!
>>>>
>>>
>>> That would do it.
>>>
>>>>>
>>>>> Patrick
