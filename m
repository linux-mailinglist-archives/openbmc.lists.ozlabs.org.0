Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AF6BF549
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 16:50:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fHsq48rDzDqpv
	for <lists+openbmc@lfdr.de>; Fri, 27 Sep 2019 00:50:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=msbarth@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fHrq1g98zDqhR
 for <openbmc@lists.ozlabs.org>; Fri, 27 Sep 2019 00:49:46 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8QEku3D077529; Thu, 26 Sep 2019 10:49:39 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v8xpp2e6d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Sep 2019 10:49:39 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8QElboi080613;
 Thu, 26 Sep 2019 10:49:39 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v8xpp2e5s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Sep 2019 10:49:38 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8QEnZrm009135;
 Thu, 26 Sep 2019 14:49:38 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03dal.us.ibm.com with ESMTP id 2v5bg7uvrd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Sep 2019 14:49:38 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8QEnbe845482352
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Sep 2019 14:49:37 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4CF51AE05F;
 Thu, 26 Sep 2019 14:49:37 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D52E6AE060;
 Thu, 26 Sep 2019 14:49:36 +0000 (GMT)
Received: from [9.10.99.12] (unknown [9.10.99.12])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 26 Sep 2019 14:49:36 +0000 (GMT)
Subject: Re: Fan PWM monitoring and control
To: rgrs <rgrs@protonmail.com>
References: <xsccJqqcmgguxAh42ykWadNuaYHHgIw0933Bk0tYCREDFQMFzoE43c9ULehB-J0Em4kobpg-P8xmKd5ukb9AdyIO9-JYrY8DrNAcVFkURyM=@protonmail.com>
 <CAO=notxUENhPn4bYZVzgyuy-tn6OxP3ojE29MBtXHLGAgkfj_w@mail.gmail.com>
 <Eoms3BmA_hZ-IwjRbWQGhnKCH-ijQ3Am7q1DrTqo73DtZSdsXaMbAcVInBw-SBdTgeqbpsHRuqvkEoAM04KKIqvJnsIv67WATAPVeM9TGv8=@protonmail.com>
 <b8234b9b-1409-33dc-930f-21b8aab590e2@linux.ibm.com>
 <DPtOWfYe4jWodafub9fy5O2kam1xxcqYVW-AwwODBWTmNr0VBvHQulRT6eAywSOxzlmbCuHhLW9vJ_alhSn-fuDwyh_KvJdUYz4AqWcThTE=@protonmail.com>
 <LgdPnRYBfplNFAYHlgeIeqcfaFAY3YBlIY29oEdpPzlBlptZTxYA7eQDOAJL9IWz_b_GYz9PCAMxoudn2QA1ArWs1r74LSBcdkOdlXQ1Slk=@protonmail.com>
 <afa59982-3c5f-8939-bd05-88d1815a2c6f@linux.ibm.com>
 <gCqa3KLpxkaqddp6pnOMKmLCTSjvpuoQHlS5siDs3JCFv3NeXvKc4xul_Ri83w76neUFnIQhrxDDTuXQyTxHYt3hEPCVvmnWi2dHRSs5iKY=@protonmail.com>
 <50f3d08c-192f-acb9-ab5e-bb33919caf2b@linux.ibm.com>
 <lf0ii4u9DsgrAvxZDnYUOqF2u7t3KtPW5LDaZVTq7raeSKUbeVrIdIQlec-d6Ex_Q70t8nQlI_VfTbuIQh1FMrEPlurk0H9YNPXxqkKXQ-A=@protonmail.com>
From: Matthew Barth <msbarth@linux.ibm.com>
Message-ID: <8695ea1c-5fef-366d-a8b4-893fdd85eff3@linux.ibm.com>
Date: Thu, 26 Sep 2019 09:49:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <lf0ii4u9DsgrAvxZDnYUOqF2u7t3KtPW5LDaZVTq7raeSKUbeVrIdIQlec-d6Ex_Q70t8nQlI_VfTbuIQh1FMrEPlurk0H9YNPXxqkKXQ-A=@protonmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-26_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909260137
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
Cc: Patrick Venture <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 9/25/19 1:45 AM, rgrs wrote:
> Hi Matt,
> 
> 
>> Is the `pwm[#]_enable` sysfs file set to a '1' at any point after the AC cycle (i.e. after a poweron?)?
> 
>   No
> 
>> If you think the configs are set correctly, is the hwmon service for the pwm devices running after the AC cycle while at BMC standby?
> 
> I'm not sure, I think phosphor-fan starts after chassis power-on.
I was asking if the hwmon service is started at BMC standby. It sounds 
like it still may be config related but I'm not able to determine where 
it may be. If you believe that hwmon is not setting the pwm[#]_enable 
file correctly, please debug and provide a fix if that's the case, it'd 
be much appreciated!

Matt
> 
> Thanks,
> Raj
> 
> 
> ‐‐‐‐‐‐‐ Original Message ‐‐‐‐‐‐‐
> On Tuesday, September 24, 2019 8:25 PM, Matthew Barth <msbarth@linux.ibm.com> wrote:
> 
>> On 9/23/19 11:25 PM, rgrs wrote:
>>
>>> Thanks Matt :) It works now.
>>> I have one small issue on configuration of ADT7462.
>>> After AC power cycle, it defaults to "automatic" fan control.
>>> We need to change this "manual" so that phosphor-fan control register writes are not ignored by ADT7462.
>>> I came across https://github.com/openbmc/docs/blob/master/sensor-architecture.md
>>>
>>>> ENABLE
>>>> Will write a value to a pwmN_enable file on startup if present.
>>>> ENABLE_fan1 = 2 #Write a 2 to pwm1_enable
>>>
>>> But this doesn't seem to work. We need it to be initialized to '1'.
>>> (It always defaults to 2 after AC cycle)
>>
>> This sounds like the correct hwmon config to use to set it to a '1' upon
>> hwmon starting after an AC cycle. First ensure your hwmon config has
>> these `ENABLE_fan[#]` entries set to a corresponding `pwm[#]_enable`
>> file in sysfs.
>>
>> Is the `pwm[#]_enable` sysfs file set to a '1' at any point after the AC
>> cycle (i.e. after a poweron?)? If you think the configs are set
>> correctly, is the hwmon service for the pwm devices running after the AC
>> cycle while at BMC standby?
>>
>>> Is host-power-on script a good place to "echo 1 > pwmN_enable"?
>>> (planning to add a script to initialize before host power on)
>>> Thanks,
>>> Raj
>>> ‐‐‐‐‐‐‐ Original Message ‐‐‐‐‐‐‐
>>> On Friday, September 20, 2019 9:49 PM, Matthew Barth msbarth@linux.ibm.com wrote:
>>>
>>>> On 9/20/19 4:55 AM, rgrs wrote:
>>>>
>>>>> Hi Matt,
>>>>> I'm able to control fan speed via busctl.
>>>>> root@saber:/sys/class/hwmon/hwmon0# busctl set-property xyz.openbmc_project.Hwmon-2429843755.Hwmon1 /xyz/openbmc_project/sensors/fan_tach/FAN0 xyz.openbmc_project.Control.FanPwm Target t '250'
>>>>> root@saber:/sys/class/hwmon/hwmon0# cat fan*_input
>>>>> 12498
>>>>> 0
>>>>
>>>> Great! that's progress.
>>>>
>>>>> I need a way to verify if the sensor associations are working properly that fans will ramp up when associated temperature sensor's value increases.
>>>>
>>>> Be sure that your fans.yaml contains the correct sensor name ("FAN0",
>>>> etc..) for each fan that contains the Target property on the FanPwm
>>>> interface.
>>>> You can use busctl to monitor the target pwm sensor changes based on
>>>> what you configured within events.yaml for speed increases. This would
>>>> show that fan control is requesting updated targets to hwmon. Then hwmon
>>>> would write these values out to the pwm sysfs file for your fan
>>>> controller device.
>>>>
>>>>> Thanks,
>>>>> Raj
>>>>> ‐‐‐‐‐‐‐ Original Message ‐‐‐‐‐‐‐
>>>>> On Friday, September 20, 2019 2:57 PM, rgrs rgrs@protonmail.com wrote:
>>>>>
>>>>>> Hi Matt,
>>>>>>
>>>>>>>> Not sure I follow what you mean by "no pwm writes", is there an
>>>>>>
>>>>>> application writing to the fan sensor's pwm interface target property?
>>>>>> I thought phoshor-fan control writes to pwm to increase fan speed based on temperature sensors mentioned in events.yaml
>>>>>> (recipes-phosphor/fans/phosphor-fan-control-events-config/events.yaml)
>>>>>> Is it not the case?
>>>>>> Thanks,
>>>>>> Raj
>>>>>> ‐‐‐‐‐‐‐ Original Message ‐‐‐‐‐‐‐
>>>>>> On Thursday, September 19, 2019 8:26 PM, Matthew Barth msbarth@linux.ibm.com wrote:
>>>>>>
>>>>>>> On 9/19/19 5:16 AM, rgrs wrote:
>>>>>>>
>>>>>>>> Hi Patrick, Lei,
>>>>>>>> Thank you, I made some changes according your comments
>>>>>>>>
>>>>>>>> -   added Mutability::Read to fan yaml.
>>>>>>>> -   I didn't see ipmi-sensor-inventory.yaml of romulus having fan sensors, so removed them from IPMI.
>>>>>>>>
>>>>>>>> Now,"busctl monitor" displays Fan tach reads, no pwm writes.
>>>>>>>
>>>>>>> Not sure I follow what you mean by "no pwm writes", is there an
>>>>>>> application writing to the fan sensor's pwm interface target property?
>>>>>>>
>>>>>>>> Is there any way to manually set PWM value and test this?
>>>>>>>> How do I verify PWM values are being written to ADT7462?
>>>>>>>
>>>>>>> If no other application are writing to the PWM sysfs entries, you should
>>>>>>> be able to `echo` a value to each fan's PWM sysfs file to alter the fan
>>>>>>> speeds.
>>>>>>>
>>>>>>>> Another observation is Inventory.Item seems to have invalid(stale) entries.
>>>>>>>
>>>>>>> I believe inventory is persisted by default so that could explain why
>>>>>>> these entries are still showing up. These are persisted under
>>>>>>> `/var/lib/phosphor-inventory-manager/..`.
>>>>>>>
>>>>>>>> IPMI sensor names appear in inventory even after removing from IPMI sensor yaml files (exported JSON in attachment).
>>>>>>>> Logs:
>>>>>>>> busctl monitor | grep -i fan
>>>>>>>> =============================
>>>>>>>> Monitoring bus message stream.
>>>>>>>> Sender=:1.45 Path=/xyz/openbmc_project/sensors/fan_tach/FAN0 Interface=org.freedesktop.DBus.Properties Member=PropertiesChanged
>>>>>>>> Sender=:1.45 Path=/xyz/openbmc_project/sensors/fan_tach/FAN1 Interface=org.freedesktop.DBus.Properties Member=PropertiesChanged
>>>>>>>> Sender=:1.45 Path=/xyz/openbmc_project/sensors/fan_tach/FAN2 Interface=org.freedesktop.DBus.Properties Member=PropertiesChanged
>>>>>>>> [...]
>>>>>>>> Sender=:1.45 Path=/xyz/openbmc_project/sensors/fan_tach/FAN1 Interface=org.freedesktop.DBus.Properties Member=PropertiesChanged
>>>>>>>> Sender=:1.45 Path=/xyz/openbmc_project/sensors/fan_tach/FAN3 Interface=org.freedesktop.DBus.Properties Member=PropertiesChanged
>>>>>>>> ^C
>>>>>>>> busctl get-property xyz.openbmc_project.Hwmon-2429843755.Hwmon1 /xyz/openbmc_project/sensors/fan_tach/FAN0 xyz.openbmc_project.Control.FanPwm Target
>>>>>>>> =============================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================================
>>>>>>>> t 0
>>>>>>>> busctl set-property xyz.openbmc_project.Hwmon-2429843755.Hwmon1 /xyz/openbmc_project/sensors/fan_tach/FAN0 xyz.openbmc_project.Control.FanPwm Target 8000
>>>>>>>> ==============================================================================================================================================================
>>>>>>>
>>>>>>> This is not a valid call to `busctl set-property...`, its missing the
>>>>>>> property's signature type (refer to `busctl help`). Also, a target PWM
>>>>>>> of 8000 is invalid, PWM is 0 - 255.
>>>>>>>
>>>>>>>> Failed to create bus message: Invalid argument
>>>>>>>> busctl introspect --no-pager xyz.openbmc_project.Hwmon-2429843755.Hwmon1 /xyz/openbmc_project/sensors/fan_tach/FAN1
>>>>>>>> ===================================================================================================================================================================
>>>>>>>> NAME TYPE SIGNATURE RESULT/VALUE FLAGS
>>>>>>>> org.freedesktop.DBus.Introspectable interface - - -
>>>>>>>> .Introspect method - s -
>>>>>>>> org.freedesktop.DBus.Peer interface - - -
>>>>>>>> .GetMachineId method - s -
>>>>>>>> .Ping method - - -
>>>>>>>> org.freedesktop.DBus.Properties interface - - -
>>>>>>>> .Get method ss v -
>>>>>>>> .GetAll method s a{sv} -
>>>>>>>> .Set method ssv - -
>>>>>>>> .PropertiesChanged signal sa{sv}as - -
>>>>>>>> xyz.openbmc_project.Control.FanPwm interface - - -
>>>>>>>> .Target property t 0 emits-change writable
>>>>>>>> xyz.openbmc_project.Sensor.Value interface - - -
>>>>>>>> .MaxValue property x 0 emits-change writable
>>>>>>>> .MinValue property x 0 emits-change writable
>>>>>>>> .Scale property x 0 emits-change writable
>>>>>>>> .Unit property s "xyz.openbmc_project.Sensor.Value.Unit.… emits-change writable
>>>>>>>> .Value property x 2983 emits-change writable
>>>>>>>> xyz.openbmc_project.State.Decorator.OperationalStatus interface - - -
>>>>>>>> .Functional property b true emits-change writable
>>>>>>>> Thanks,
>>>>>>>> Raj
>>>>>>>> ‐‐‐‐‐‐‐ Original Message ‐‐‐‐‐‐‐
>>>>>>>> On Wednesday, September 18, 2019 9:35 PM, Patrick Venture venture@google.com wrote:
>>>>>>>>
>>>>>>>>> On Wed, Sep 18, 2019 at 2:30 AM rgrs rgrs@protonmail.com wrote:
>>>>>>>>>
>>>>>>>>>> Hi Patrick, Matt,
>>>>>>>>>> I tried instructions from this wiki: https://developer.ibm.com/linuxonpower/2019/01/07/how-to-port-openbmc/
>>>>>>>>>> There is no GPIO to detect presence of fans, so tach readings is used instead.
>>>>>>>>>> Here's what I did while trying to enable Fan control:
>>>>>>>>>>
>>>>>>>>>> 1.  Added Fan tach sensor in hwmon (adt7462.conf) is in the form LABEL=FANx_RPM
>>>>>>>>>> 2.  "ipmi-sensor-inventory.yaml" has below config:
>>>>>>>>>>
>>>>>>>>>> 60: &fan_tach
>>>>>>>>>> sensorType: 0x04
>>>>>>>>>> path: /xyz/openbmc_project/sensors/fan_tach/FAN0_RPM
>>>>>>>>>> sensorReadingType: 0x01
>>>>>>>>>> multiplierM: 100
>>>>>>>>>> offsetB: 0
>>>>>>>>>> bExp: 0
>>>>>>>>>> unit: xyz.openbmc_project.Sensor.Value.Unit.RPMS
>>>>>>>>>> scale: 0
>>>>>>>>>> rExp: 0
>>>>>>>>>> serviceInterface: org.freedesktop.DBus.Properties
>>>>>>>>>> readingType: readingData
>>>>>>>>>> interfaces:
>>>>>>>>>> xyz.openbmc_project.Sensor.Value:
>>>>>>>>>> Value:
>>>>>>>>>> Offsets:
>>>>>>>>>> 0xFF:
>>>>>>>>>> type: int64_t
>>>>>>>>>> and FAN PWM as
>>>>>>>>>> 89: &fanpwm
>>>>>>>>>> sensorType: 0x04
>>>>>>>>>> path: /xyz/openbmc_project/sensors/fan_tach/FAN0_RPM
>>>>>>>>>> sensorReadingType: 0x01
>>>>>>>>>> multiplierM: 1
>>>>>>>>>> offsetB: 0
>>>>>>>>>> bExp: 0
>>>>>>>>>> mutability: Mutability::Write
>>>>>>>>>
>>>>>>>>> You may need to add ::Read here too, I'm not sure anymore, but you can
>>>>>>>>> check the script that builds this:
>>>>>>>>> https://github.com/openbmc/phosphor-host-ipmid/blob/master/scripts/writesensor.mako.cpp#L69
>>>>>>>>> It'll default to read, but if you've only set write, I don't know.
>>>>>>>>>
>>>>>>>>>>         serviceInterface: org.freedesktop.DBus.Properties
>>>>>>>>>>         readingType: readingData
>>>>>>>>>>         interfaces:
>>>>>>>>>>             xyz.openbmc_project.Control.FanPwm:
>>>>>>>>>>                 Target:
>>>>>>>>>>                     Offsets:
>>>>>>>>>>                         0xFF:
>>>>>>>>>>                             type: uint64_t
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> 3.  I copied meta-romulus/recipes-phosphor/fans to my platform and changed FAN names from "fanx" to "FANx_RPM" in yaml files.
>>>>>>>>>>
>>>>>>>>>> This is what get in busctl tree related to Fans:
>>>>>>>>>> (I expected to see FanPwm entries in busctl and I'm not sure why there are multiple entries in inventory).
>>>>>>>>>> Service xyz.openbmc_project.Hwmon-2429843755.Hwmon1:
>>>>>>>>>> `-/xyz`-/xyz/openbmc_project
>>>>>>>>>> `-/xyz/openbmc_project/sensors |-/xyz/openbmc_project/sensors/fan_tach | |-/xyz/openbmc_project/sensors/fan_tach/FAN0_RPM | |-/xyz/openbmc_project/sensors/fan_tach/FAN1_RPM | |-/xyz/openbmc_project/sensors/fan_tach/FAN2_RPM |`-/xyz/openbmc_project/sensors/fan_tach/FAN3_RPM
>>>>>>>>>> `-/xyz/openbmc_project/sensors/temperature`-/xyz/openbmc_project/sensors/temperature/BACKPLANE_TEMP
>>>>>>>>>
>>>>>>>>> You don't get a separate entry for the PWM from phosphor-hwmon.
>>>>>>>>> It's a separate interface on the same service and path.
>>>>>>>>> I recommend you introspect on the path and see what interfaces are
>>>>>>>>> available (as well as adding "| read" above):
>>>>>>>>> busctl introspect --no-pager
>>>>>>>>> xyz.openbmc_project.Hwmon-2429843755.Hwmon1
>>>>>>>>> /xyz/openbmc_project/sensors/fan_tach/FAN0_RPM
>>>>>>>>>
>>>>>>>>>> Service xyz.openbmc_project.Inventory.Manager:
>>>>>>>>>> `-/xyz`-/xyz/openbmc_project
>>>>>>>>>> `-/xyz/openbmc_project/inventory`-/xyz/openbmc_project/inventory/system
>>>>>>>>>> `-/xyz/openbmc_project/inventory/system/chassis`-/xyz/openbmc_project/inventory/system/chassis/motherboard
>>>>>>>>>> |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN0
>>>>>>>>>> | `-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN0/FAN0 |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN0_RPM |`-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN0_RPM/FAN0_RPM
>>>>>>>>>> |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN1
>>>>>>>>>> | `-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN1/FAN1 |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN1_RPM |`-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN1_RPM/FAN1_RPM
>>>>>>>>>> |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN2
>>>>>>>>>> | `-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN2/FAN2 |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN2_RPM |`-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN2_RPM/FAN2_RPM
>>>>>>>>>> |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN3
>>>>>>>>>> | `-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN3/FAN3 |-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN3_RPM |`-/xyz/openbmc_project/inventory/system/chassis/motherboard/FAN3_RPM/FAN3_RPM
>>>>>>>>>> |-/xyz/openbmc_project/inventory/system/chassis/motherboard/fan0
>>>>>>>>>> |-/xyz/openbmc_project/inventory/system/chassis/motherboard/fan1
>>>>>>>>>> |-/xyz/openbmc_project/inventory/system/chassis/motherboard/fan2
>>>>>>>>>> `-/xyz/openbmc_project/inventory/system/chassis/motherboard/fan3
>>>>>>>>>> Thanks,
>>>>>>>>>> Raj
>>>>>>>>>> ‐‐‐‐‐‐‐ Original Message ‐‐‐‐‐‐‐
>>>>>>>>>> On Tuesday, September 17, 2019 9:18 PM, Patrick Venture venture@google.com wrote:
>>>>>>>>>>
>>>>>>>>>>> On Tue, Sep 17, 2019 at 8:32 AM Matthew Barth msbarth@linux.ibm.com wrote:
>>>>>>>>>>>
>>>>>>>>>>>> On 9/17/19 5:40 AM, rgrs wrote:
>>>>>>>>>>>>
>>>>>>>>>>>>> Hi,
>>>>>>>>>>>>> I need some help with phosphor hwmon related to fan sensors.
>>>>>>>>>>>>> I'm trying to control Fans in a server motherboard using ADT7462
>>>>>>>>>>>>> controller. Hw mon porting is done and the sysfs interfaces are working
>>>>>>>>>>>>> as expected.
>>>>>>>>>>>>> While I am able to read RPM, i don't find pwm/target to control the fans
>>>>>>>>>>>>> exposed as dbus objects.
>>>>>>>>>>>>> Do you have the hwmon config set similar to this to denote the fan
>>>>>>>>>>>>> targets are of PWM type?
>>>>>>>>>>>>
>>>>>>>>>>>> https://github.com/openbmc/openbmc/blob/master/meta-ibm/meta-romulus/recipes-phosphor/sensors/phosphor-hwmon/obmc/hwmon/ahb/apb/pwm-tacho-controller%401e786000.conf
>>>>>>>>>>>>
>>>>>>>>>>>>> busctl --no-page tree xyz.openbmc_project.FanSensor
>>>>>>>>>>>>> ====================================================
>>>>>>>>>>>>> Failed to introspect object / of service xyz.openbmc_project.FanSensor:
>>>>>>>>>>>>> The name is not activatable
>>>>>>>>>>>>> No objects discovered.
>>>>>>>>>>>>> That does not look like a hwmon service name. If you are using
>>>>>>>>>>>>> phosphor-objmgr, you can use `# mapper get-service /xyz/openbmc_project/sensors/fan_tach` otherwise you'll need to find the
>>>>>>>>>>>>> hwmon service name associated with your fan controller device.
>>>>>>>>>>>
>>>>>>>>>>> running`busctl tree --no-pager` will just list everything, and you
>>>>>>>>>>> should see your fans in there. You can use the mapper too. I was
>>>>>>>>>>> curious, are you using entity-manager/dbus-sensors? When you mention
>>>>>>>>>>> FanSensor as the service, that's what it sounds like.
>>>>>>>>>>>
>>>>>>>>>>>>> I came across this post, I think it is similar to my issue.
>>>>>>>>>>>>> (https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-hwmon/+/8353)
>>>>>>>>>>>>> Please someone point to latest documentation or reference Fan porting
>>>>>>>>>>>>> from openBMC repo?
>>>>>>>>>>>>> What are the exact fields in YAML that are used create FanPWM objects.
>>>>>>>>>>>>> The Romulus machine should be a good reference for PWM based fan control
>>>>>>>>>>>>> using phosphor-hwmon. It uses the
>>>>>>>>>>>>> phosphor-fan-presence/[control|monitor] apps for controlling and
>>>>>>>>>>>>> monitoring fans
>>>>>>>>>>>>
>>>>>>>>>>>> https://github.com/openbmc/openbmc/tree/master/meta-ibm/meta-romulus
>>>>>>>>>>>>
>>>>>>>>>>>>> (I'm using Feb release in my sandbox,
>>>>>>>>>>>>> https://github.com/openbmc/docs/blob/master/release/release-notes.md#26-feb-4-2019)
>>>>>>>>>>>>> Thanks,
>>>>>>>>>>>>> Raj
>>>>>>>>>>>>
>>>>>>>>>>>> Matt
> 
> 
