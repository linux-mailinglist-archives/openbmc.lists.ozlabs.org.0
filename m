Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D22637AE72
	for <lists+openbmc@lfdr.de>; Tue, 11 May 2021 20:25:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfmZS1NyWz301v
	for <lists+openbmc@lfdr.de>; Wed, 12 May 2021 04:25:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RFPPQrGJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=msbarth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RFPPQrGJ; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfmZ60Xydz2y8C
 for <openbmc@lists.ozlabs.org>; Wed, 12 May 2021 04:25:33 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14BI2WTu006051; Tue, 11 May 2021 14:25:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=g08bRHhcu1CEeyoStZGUioUrb+SXem/Ehz4pPVQOj8w=;
 b=RFPPQrGJwILamCfH0ZdA5CWkVwVm2GNUmFwGRKvgxvVgbd1aiZvS9QiS/xB41nqECE5h
 jNkTs+jzEZHI/MDYKLSRT3wMGENmkxZDOBjABjN9ZFpsXQb7q3LrqpW0s9w42LzxnRXR
 OOomFLe0N5+KfYz81FDLmZua89qRQoYVyGMMgB+1LQDWFp8BGzTnGJSR9DA2vLb3jmmM
 I5bWj78LaWX9VSExBH6jcI+v5XOMHPjdOxFcWBhtbVFKl6SGRbDwFfUan0yr4zeNLD0t
 AeUh07+GGJM9QUHP/mgLSOSuf2YsjwRs2AQXsd3CyNTOY20Sz7H/JmO/SvdP90nc5pbc Kw== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38fvwqv9bb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 May 2021 14:25:28 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14BIDg4o004657;
 Tue, 11 May 2021 18:25:27 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01wdc.us.ibm.com with ESMTP id 38dj98qvg5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 May 2021 18:25:27 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14BIPRX038601082
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 May 2021 18:25:27 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6EB9B205F;
 Tue, 11 May 2021 18:25:26 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F31AB2064;
 Tue, 11 May 2021 18:25:26 +0000 (GMT)
Received: from [9.163.69.157] (unknown [9.163.69.157])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 11 May 2021 18:25:26 +0000 (GMT)
Subject: Re: Add phosphor-fan configuration for the fan which added by
 dbus-sensor
To: Thu Nguyen <thu@amperemail.onmicrosoft.com>,
 Thu Nguyen OS <thu@os.amperecomputing.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <B6120112-33DD-41A6-A0F2-7A9FBFEEB081@amperemail.onmicrosoft.com>
 <d6b2354e-f0e6-8819-4b39-1481660d1361@linux.ibm.com>
 <DAC41731-7B29-4743-87D8-40324324FF96@amperemail.onmicrosoft.com>
 <37873411-cdda-bcd5-0a2a-6cd46192f80d@linux.ibm.com>
 <6F0BA8AE-40E7-47EB-BA16-B445738548D2@amperemail.onmicrosoft.com>
 <17e3409e-64bb-0c3c-cbe7-028d88df17ca@linux.ibm.com>
 <fc3155f3-87d9-a93f-1115-3a9858e23fe4@amperemail.onmicrosoft.com>
 <2aa18bfd-0229-c73d-51ad-510d68619479@linux.ibm.com>
 <64a79ec3-c2cc-596d-d547-8f35b1973e4a@amperemail.onmicrosoft.com>
From: Matthew Barth <msbarth@linux.ibm.com>
Message-ID: <c8955e65-d089-14af-ee89-b4422d2bbad0@linux.ibm.com>
Date: Tue, 11 May 2021 13:25:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <64a79ec3-c2cc-596d-d547-8f35b1973e4a@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: J0CB7JESEdUar3bEXiSJh8ULXzHYMQzw
X-Proofpoint-GUID: J0CB7JESEdUar3bEXiSJh8ULXzHYMQzw
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-11_04:2021-05-11,
 2021-05-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0 mlxscore=0
 phishscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2105110122
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


On 5/11/21 9:11 AM, Thu Nguyen wrote:
>
> On 11/05/2021 01:14, Matthew Barth wrote:
>> On 5/8/21 11:41 AM, Thu Nguyen wrote:
>>> On 07/05/2021 23:22, Matthew Barth wrote:
>>>> On 5/6/21 5:34 PM, Thu Nguyen OS wrote:
>>>>> ﻿On 06/05/2021, 23:30, "Matthew Barth" <msbarth@linux.ibm.com> wrote:
>>>>>
>>>>>
>>>>>       On 5/6/21 10:59 AM, Thu Nguyen OS wrote:
>>>>>       >
>>>>>       > On 06/05/2021, 20:09, "Matthew Barth" <msbarth@linux.ibm.com> wrote:
>>>>>       >
>>>>>       >
>>>>>       >     On 5/6/21 4:22 AM, Thu Nguyen OS wrote:
>>>>>       >     > Hi,
>>>>>       >     >
>>>>>       >     > I’m supporting the fan control algorithms using phosphor-fan. Phosphor-fan monitoring and controlling require interface xyz.openbmc_project.Control.FanPwm in the fan inventory object.
>>>>>       >     That is a sensor interface, not an interface that's added to inventory objects
>>>>>       >     > https://github.com/openbmc/phosphor-fan-presence/blob/master/docs/monitor/inventory.md
>>>>>       >     What you linked to here refers to where the fan inventory object is located and nothing to do with with the fan sensors that fan monitor is to be monitoring.
>>>>>       >
>>>>>       > [Thu Nguyen] The link detail about the inventory configuration in monitor.yaml for fan monitor  and fan.yaml for fan control feature. It should be " The relative path under inventory where the fan's inventory object exists ".
>>>>>
>>>>>       The README links refer to the use of JSON config files in place of YAML. YAML based configs for the fan presence and fan monitor applications has been deprecated, so please use JSON based configs instead. Fan control is in the process of getting converted to JSON based configs so that it too can have its YAML based config support deprecated. To enable the use of JSON, supply "json" to the PACKAGECONFIG and to continue using YAML based fan control, also provide "--disable-json-control" until fan control's support of JSON is completed. i.e.) https://github.com/openbmc/openbmc/blob/master/meta-ibm/recipes-phosphor/fans/phosphor-fan_%25.bbappend#L59-L60
>>>>>
>>>>>       > Look at the example of the fan control configuration  file named fan.yaml below you can see the yaml file includes "inventory" setting. And xyz.openbmc_project.Control.FanPwm interface is required interface for that inventory path.
>>>>>       > https://github.com/openbmc/phosphor-fan-presence/blob/master/control/example/fans.yaml
>>>>>       Now to address what you're seeing, the "inventory" entry for fans.yaml is just used to name a fan object created within fan control and not related to anything actually in dbus inventory. This will become "name" in the JSON based (fans.json) for fan control.
>>>>>       >     >
>>>>>       >     > But FanSensor daemon of dbus-sensor only adds /xyz/openbmc_project/sensors/fan_tach to inventory list, and this path don’t support xyz.openbmc_project.Control.FanPwm interface.
>>>>>       >     I cant speak to the support of dbus-sensors and the use of the FanPwm interface, but phosphor-fan-monitor can support either the use of RPM or PWM fan sensors for monitoring and updating the corresponding OperationalStatus of a fan in inventory.
>>>>>       >     https://github.com/openbmc/phosphor-fan-presence/blob/master/docs/monitor/sensors.md
>>>>>       >
>>>>>       >     Supplying the ` "target_interface": "xyz.openbmc_project.Control.FanPwm" ` directs fan monitor to monitor the fan sensor using the Target property from that interface. When the "target_interface" is not provided on a fan sensor, the default is to use the "xyz.openbmc_project.Control.FanSpeed" (RPM) interface.
>>>>>       > [Thu Nguyen]
>>>>>       > The point here is the phosphor-fan-monitor/control expect xyz.openbmc_project.Control.FanPwm or xyz.openbmc_project.Control.FanSpeed is included in /xyz/openbmc_project/sensors/fan_tach.
>>>>>       > But dbus-sensor don't support that. In dbus sensor xyz.openbmc_project.Control.FanPwm is only available in /xyz/openbmc_project/control/fanpwm.
>>>>>       Ok, that clarifies things...and I welcome a proposed change to support the different dbus object paths in which the xyz.openbmc_project.Control.* interfaces that the fan sensors can be be at. Before dbus-sensors existed in openbmc, the fan sensors were provided by phosphor-hwmon on the dbus object path of /xyz/openbmc_project/sensors/fan_tach regardless of being PWM or RPM so that's why they are looking at that path.
>>>>>
>>>>> [Thu Nguyen]
>>>>> How about add target_path option in fan.yaml and monitor.yaml to set the dbus object path?
>>>>> Example:
>>>>> target_path: /xyz/openbmc_project/control/fanpwm.
>>>>> The setting of target_path will override value of "FAN_SENSOR_PATH" in fan.cpp and tach_sensor.hpp.
>>>> Does dbus-sensors place the sensor value of the fan on the same dbus object path as the target? Fan monitor looks for the interfaces of both the target and the sensor value(feedback) on the same dbus object path.
>>> [Thu]
>>>
>>> 1. No. Dbus-sensor provided three difference path for one fan:
>>>
>>> /xyz/openbmc_project/control/fanpwm/<Name> have xyz.openbmc_project.Control.FanPwm.Target to control fan.
>>>
>>> /xyz/openbmc_project/sensors/fan_tach/<Name> have fan tach value in xyz.openbmc_project.Sensor.Value.Value.
>>>
>>> /xyz/openbmc_project/sensors/fan_pwm<Name> have fan Pwm value in xyz.openbmc_project.Sensor.Value.Value.
>>>
>> Ok, so then fan monitor would need to have the path given for the target and a separate path given for the sensor(feedback). My preference would be to have an optional `target_path` and optional `sensor_path` configuration options for the list of sensors on a fan to be monitored. These should be optional in the YAML based configs so we dont have to update all the configs of the systems upstream that were using YAML based fan monitoring.
> Yes, In that case we have to support two more option in phosphor-fan-monitor.
>>
>>> 2. I tried to update fan control to support "target_path" option, but still have issue with fan monitor.
>>>
>> This is fine as an optional argument in the fans.yaml file for fan control since it only deals with fan targets.
>>> 3. I wonder when I set has_target=false in monitor.yaml, the fan functional in inventory is set as false.
>>>
>>> If don't have the fanpwm value, fan monitor should bypass checking fan failure in programming speed.
>>>
>>> Is this right?
>> No it should not bypass it. If there is no target for the tach sensor(s) being monitored to compare their feedbacks against, then what is the point of monitoring that fan?
> If has_target should always is true, then do we really need it?

The `has_target` attribute is specific to the original use of phosphor-hwmon which provided the target and sensor value on the same dbus object path so that fan monitor knew which fan sensor also contained the target property.

In what you're looking to add in supporting separate dbus object paths between where the target property is to where the sensor value property is, then `has_target` is not necessary...but as I said, what you're adding needs to be optional to the config as to not cause issues to how the current configs are written for those machines using phosphor-hwmon w/ fan monitor. The use of the `target_path` that you're adding can ignore (not require) a `has_target` attribute.

>>>>>       >     >
>>>>>       >     > Do you have any solution to make phosphor-fan work with dbus-sensor?
>>>>>       >     >
>>>>>       >     > I’m currently update FanSensor in dbus-sensor to add xyz.openbmc_project.Control.FanPwm to /xyz/openbmc_project/sensors/fan_tach.
>>>>>       >     Refer to the doc link I provided above on how to utilize monitoring fans that use a PWM target on that interface. Then phosphor-fan-monitor will update the fan inventory object's (as configured with https://github.com/openbmc/phosphor-fan-presence/blob/master/docs/monitor/inventory.md) xyz.openbmc_project.State.Decorator.OperationalStatus Functional property based on how you configure fan monitor to monitor the fan sensors.
>>>>>       >     >
>>>>>       >     > Regards.
>>>>>       >     > Thu Nguyen.
>>>>>       >
>>>>>
