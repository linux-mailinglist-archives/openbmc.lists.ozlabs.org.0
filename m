Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E08C67972B
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2019 21:58:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y9VY5ybyzDqQG
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 05:58:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y9TQ0GCwzDqGL
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 05:57:38 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jul 2019 12:57:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,324,1559545200"; d="scan'208";a="173372242"
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga007.fm.intel.com with ESMTP; 29 Jul 2019 12:57:34 -0700
Subject: Re: entity-manager experiments
To: openbmc@lists.ozlabs.org
References: <CAO=notzQbwA32vcyznddZX8Y4ypyvoFcbHRQjpVZBQGfpTieaw@mail.gmail.com>
 <CAO=notwXPOwxDk_J5eZXjqjN-po-OTexSNPz=kBX=iunxhW=+Q@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <d866e2a8-e92c-85d6-fd67-260a3c735b56@intel.com>
Date: Mon, 29 Jul 2019 12:57:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAO=notwXPOwxDk_J5eZXjqjN-po-OTexSNPz=kBX=iunxhW=+Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 7/26/19 4:45 PM, Patrick Venture wrote:
> On Fri, Jul 26, 2019 at 4:40 PM Patrick Venture <venture@google.com> wrote:
>>
>> Hi,
>>
>> I was curious if you had any thoughts on what is missing here -- I
>> wrote a basic json file:
>>
>> razorback.json:
>> {
>>     "Exposes": [
>>         {
>>             "Address": "$address",
>>             "Bus": "$bus",
>>             "Name": "Razorback",
>>             "Type": "EEPROM"
>>         },
>>         {
>>             "Address": "0x4c",
>>             "Bus": "$bus",
>>             "Name": "Razorback Temp Sensor",
>>             "Type": "TMP421"
>>         }
>>     ],
>>     "Name": "Razorback Board",
>>     "Probe" : "xyz.openbmc_project.FruDevice({'PRODUCT_PRODUCT_NAME':
>> '.*Razorback'})",

I'd recommend taking out the wildcard if you can if you don't expect
there to be multiple models of this board.  We've gotten trapped a
little in the past with next-gen boards sporting a similar product name
(think 2019_Razorback vs 2020_Razorback) and configs getting applied
that shouldn't have.

>>     "Type": "Board",
>>     "xyz.openbmc_project.Inventory.Decorator.Asset": {
>>         "Manufacturer": "$PRODUCT_MANUFACTURER",
>>         "Model": "$PRODUCT_PRODUCT_NAME",
>>         "PartNumber": "$PRODUCT_PART_NUMBER",
>>         "SerialNumber": "$PRODUCT_SERIAL_NUMBER"
>>     }
>> }
>>
>> And it finds it:
>> Service xyz.openbmc_project.EntityManager:
>> `-/xyz
>>   `-/xyz/openbmc_project
>>     |-/xyz/openbmc_project/EntityManager
>>     `-/xyz/openbmc_project/inventory
>>       `-/xyz/openbmc_project/inventory/system
>>         `-/xyz/openbmc_project/inventory/system/board
>>           `-/xyz/openbmc_project/inventory/system/board/Razorback_Board
>>             |-/xyz/openbmc_project/inventory/system/board/Razorback_Board/Razorback
>>             `-/xyz/openbmc_project/inventory/system/board/Razorback_Board/Razorback_Temp_Sensor
>>
>> Service xyz.openbmc_project.FruDevice:
>> `-/xyz
>>   `-/xyz/openbmc_project
>>     `-/xyz/openbmc_project/FruDevice
>>       `-/xyz/openbmc_project/FruDevice/_0
>>
>> I don't know why it's named _0, but I can debug that late
The logic for that name is right here:
https://github.com/openbmc/entity-manager/blob/441c7a86749b2331863b115e141033e735bd6ffc/src/FruDevice.cpp#L549

I'm guessing either the board section product name field or the product
section product name field is blank.  In that, we should probably check
for empty string and move on to the next one.

>>
>> So I introspect on it:
>> busctl introspect --no-pager xyz.openbmc_project.EntityManager
>> /xyz/openbmc_project/inventory/system/board/Razorback_Board/Razorback_Temp_Sensor
>> NAME                                     TYPE      SIGNATURE
>> RESULT/VALUE            FLAGS
>> org.freedesktop.DBus.Introspectable      interface -         -
>>               -
>> .Introspect                              method    -         s
>>               -
>> org.freedesktop.DBus.Peer                interface -         -
>>               -
>> .GetMachineId                            method    -         s
>>               -
>> .Ping                                    method    -         -
>>               -
>> org.freedesktop.DBus.Properties          interface -         -
>>               -
>> .Get                                     method    ss        v
>>               -
>> .GetAll                                  method    s         a{sv}
>>               -
>> .Set                                     method    ssv       -
>>               -
>> .PropertiesChanged                       signal    sa{sv}as  -
>>               -
>> xyz.openbmc_project.Configuration.TMP421 interface -         -
>>               -
>> .Address                                 property  t         76
>>               emits-change
>> .Bus                                     property  t         17
>>               emits-change
>> .Name                                    property  s
>> "Razorback Temp Sensor" emits-change
>> .Type                                    property  s         "TMP421"
>>               emits-change
>>
>> and all that looks correct, and now there's an i2c device at 17-004c,
>> but no hwmon path, and:
>>
>> Jul 25 00:27:24 machine intrusion-sensor[2654]: Error communicating to
>> entity manager
>> Jul 25 00:27:24 machine intrusion-sensor[2654]: error communicating to
>> entity manager
>> Jul 25 00:27:24 machine fansensor[2671]: Error communicating to entity manager
>> Jul 25 00:27:24 machine fansensor[2671]: error communicating to entity manager
>> Jul 25 00:27:24 machine fansensor[2671]: Error calling entity manager
>> Jul 25 00:27:24 machine adcsensor[2658]: Error communicating to entity manager
>> Jul 25 00:27:24 machine adcsensor[2658]: error communicating to entity manager
>> Jul 25 00:27:25 machine mcutempsensor[2689]: Error contacting entity manager
>> Jul 25 00:27:25 machine hwmontempsensor[2675]: Error communicating to
>> entity manager
>> Jul 25 00:27:25 machine hwmontempsensor[2675]: error communicating to
>> entity manager
>> Jul 25 00:27:26 machine psusensor[2677]: Error communicating to entity manager
>> Jul 25 00:27:26 machine psusensor[2677]: error get sensor config from
>> entity manager
>> Jul 25 00:27:27 machine ipmbsensor[2674]: Error contacting entity manager
>> Jul 25 00:27:27 machine cpusensor
> [2666]: Error communicating to entity manager
>> Jul 25 00:27:27 machine entity-manager[2694]: Clearing previous configuration
>>
>> Service xyz.openbmc_project.HwmonTempSensor:
>> Only root object discovered.
>>
>> Any thoughts on the disconnect?  Have you seen anything like this?
> 
> I had a hunch the driver was missing:
> 
> tmp/work-shared/machine/kernel-build-artifacts/.config:1827:#
> CONFIG_SENSORS_TMP421 is not set
> 
> ... ok, so that makes sense then! :D  Will try fixing that first!
> 

That would do it.

>>
>> Patrick
