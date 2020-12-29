Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E0F2E6E6A
	for <lists+openbmc@lfdr.de>; Tue, 29 Dec 2020 07:07:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D4kV10Gr7zDqGX
	for <lists+openbmc@lfdr.de>; Tue, 29 Dec 2020 17:07:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=msbarth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=f68abiT4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D4kSv2LtFzDqFv
 for <openbmc@lists.ozlabs.org>; Tue, 29 Dec 2020 17:06:38 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BT63pg9054722; Tue, 29 Dec 2020 01:06:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type; s=pp1; bh=JyW0VqYwXPp4xsFgsaYNGL7XdbsEYli78TRLJKRCCFg=;
 b=f68abiT4MQck0zjvTsv5+SQyI3h2vYfL4AAjGZL2saVhU/FtDT3/fJxrdXedigom2je+
 A+nsDgD7k52r7m+2xThTU2iG9iZnQciyTx8V+y28rqhfD6BzTOxB+H01rji2uaL3e1Sh
 EoZS8MuL+rNKNPhoY9j5xtiSWw/0bemN4krdxrqoHUo9hwpuMTk102kfyMBng2cFEFSY
 ZmwNGR6R/p0+rjRUB1aQOw/REIXTw/g4xAZNA+f8SBFnDyv6un4tbpEPchcR3POrm27f
 libvR9nzdZlKC7r6iaqiUgM8dieS3P3kM3MJSdFOO3sK56BR0fbRPQKxY7E1HxeNW9fV Kg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35qw2ca6bd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Dec 2020 01:06:32 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BT5vPAB002776;
 Tue, 29 Dec 2020 06:06:31 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 35nvt906vw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Dec 2020 06:06:31 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BT66UjY23986488
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Dec 2020 06:06:30 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24A4F7805E;
 Tue, 29 Dec 2020 06:06:30 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 095AC7805C;
 Tue, 29 Dec 2020 06:06:16 +0000 (GMT)
Received: from [9.163.73.27] (unknown [9.163.73.27])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 29 Dec 2020 06:06:14 +0000 (GMT)
Subject: Re: phosphor-hwmon + phosphor-fan: Fan functional properties are
 mismatched when unplug fan
To: Thu Nguyen <thu@amperemail.onmicrosoft.com>, openbmc@lists.ozlabs.org
References: <117d107d-236d-d361-7188-42065baaa656@amperemail.onmicrosoft.com>
 <c610636d-bf38-4077-edbf-5e0ad727a3ab@linux.ibm.com>
 <7d637357-bc60-032a-712a-cc165d96c573@amperemail.onmicrosoft.com>
From: Matthew Barth <msbarth@linux.ibm.com>
Message-ID: <6caf4ecb-a0c3-4681-f898-d6b6813504c0@linux.ibm.com>
Date: Tue, 29 Dec 2020 00:05:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <7d637357-bc60-032a-712a-cc165d96c573@amperemail.onmicrosoft.com>
Content-Type: multipart/alternative;
 boundary="------------57335364DF9E99F8044A4052"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-29_04:2020-12-28,
 2020-12-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 mlxscore=0 spamscore=0 suspectscore=0 phishscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012290036
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

This is a multi-part message in MIME format.
--------------57335364DF9E99F8044A4052
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/16/20 8:23 PM, Thu Nguyen wrote:
> On 12/17/20 05:03, Matthew Barth wrote: On 12/16/20 2:03 AM,...
> This Message Is From an External Sender
> This message came from outside your organization.
>
> On 12/17/20 05:03, Matthew Barth wrote:
>>
>> On 12/16/20 2:03 AM, Thu Nguyen wrote:
>>> Hi,
>>>
>>>
>>> In the current code of phosphor-hwmon, when flag 
>>> --enable-update-functional-on-fail is set. The fan functional DBus 
>>> property in sensors interface will be set to false when unplug fans 
>>> (FAN4_2).
>>>
>>> ~# busctl get-property xyz.openbmc_project.Hwmon-1644477290.Hwmon1 
>>> /xyz/openbmc_project/sensors/fan_tach/FAN4_2 
>>> xyz.openbmc_project.State.Decorator.OperationalStatus Functional
>>> b false
>>>
>>> AND the fan Value properties will keep the latest reading value 
>>> before unplug.
>>>
>>> ~# busctl get-property xyz.openbmc_project.Hwmon-1644477290.Hwmon1 
>>> /xyz/openbmc_project/sensors/fan_tach/FAN4_2 
>>> xyz.openbmc_project.Sensor.Value Value
>>>
>>> d 4794
>>>
>>> ~# busctl get-property xyz.openbmc_project.Hwmon-1644477290.Hwmon1 
>>> /xyz/openbmc_project/sensors/fan_tach/FAN4_2 
>>> xyz.openbmc_project.Sensor.Value Value
>>> d 4794
>>>
>>> This cause phosphor-fan-monitor failed to detect the fan failure so 
>>> the fan functional are wrong.
>>>
>>> busctl get-property xyz.openbmc_project.Inventory.Manager 
>>> /xyz/openbmc_project/inventory/system/chassis/motherboard/FAN4_2 
>>> xyz.openbmc_project.State.Decorator.OperationalStatus Functional
>>> b true
>>>
>>> Should phosphor-hwmon keep updating the fan value Dbus properties 
>>> with error code when the fans is nonfunctional? Or 
>>> phosphor-fan-monitor should also check the fan functional in sensor 
>>> interface to update fan functional in inventory interface?
>>>
>> I recall this was something that would be needed in 
>> phosphor-fan-monitor when a fan's sensor is marked faulted since the 
>> value should no longer be trusted by phosphor-fan-monitor. A 
>> phosphor-fan-monitor configuration option needs to be added per fan 
>> sensor to check the sensor's functional property and use that to 
>> update the fan's functional state in inventory as well.
>>
>> Please feel free to submit a patch to add this configuration option 
>> to drive setting the fan's functional state in inventory based on the 
>> state of a fan sensor's functional state.
>>
>>
>> Matt
>>
>>>
>>> Regards.
>>>
>>> Thu Nguyen.
>>>
>>>
>>>
> How about Fan Present property? Should we update it to false when fan 
> sensor functional is false?
>
No. These are states with different meanings...a fan's present state 
should not be associated with a fan sensor's functional state. There is 
a case where these may be linked when the sensor device is included in 
the fan FRU itself, however, I would see them being handled by their 
respective applications to update those different states accordingly 
anyways.
>
> I think we can add option "fan_sensor_func_to_fan_inventory_func" in 
> fan configuration as below:
>
> - inventory: /system/chassis/motherboard/FAN3_1
> allowed_out_of_range_time: 30
> deviation: 15
> num_sensors_nonfunc_for_fan_nonfunc: 1
> fan_sensor_func_to_fan_inventory_func: true
> sensors:
> - name: FAN3_1
> has_target: true
> target_interface: xyz.openbmc_project.Control.FanPwm
> factor: 82
> offset: 0
>
> In phosphor-fan-monitor, for each fan, we will signal the fan 
> functional property in sensor, and update the fan function in 
> inventory when that property is changed. Maybe we should update fan 
> present in inventory also.
>
I'd prefer this to be the default and provide a configuration option to 
decouple the fan rotor's functional state from the state of its 
associated sensor(s). In most cases, the sensor being nonfunctional 
should therefore set the fan rotor's functional state to nonfunctional 
when the configuration option to disable this association is not given. 
This optional configuration to disable the sensor-to-fan rotor 
functional association should be supported for each sensor listed per 
fan in the fan monitor configuration file.


Matt

>
> Thu Nguyen
>

--------------57335364DF9E99F8044A4052
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNv
bnRlbnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+CiAgPC9oZWFkPgogIDxib2R5Pgog
ICAgPHA+PGJyPgogICAgPC9wPgogICAgPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij5P
biAxMi8xNi8yMCA4OjIzIFBNLCBUaHUgTmd1eWVuIHdyb3RlOjxicj4KICAgIDwvZGl2Pgog
ICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIKY2l0ZT0ibWlkOjdkNjM3MzU3LWJjNjAtMDMy
YS03MTJhLWNjMTY1ZDk2YzU3M0BhbXBlcmVtYWlsLm9ubWljcm9zb2Z0LmNvbSI+PCEtLSBC
YU5uRXJCbFVyRmxFLUhlQWRFci1zdGFydCAtLT4KICAgICAgPG1ldGEgbmFtZT0idmlld3Bv
cnQiIGNvbnRlbnQ9IndpZHRoPWRldmljZS13aWR0aDsKICAgICAgICBpbml0aWFsLXNjYWxl
PTEuMDsgbWF4aW11bS1zY2FsZT0xLjA7IHVzZXItc2NhbGFibGU9bm87Ij4KICAgICAgPHN0
eWxlPi5wZnB0UHJlaGVhZGVyIHsgZGlzcGxheTpub25lICFpbXBvcnRhbnQ7IHZpc2liaWxp
dHk6aGlkZGVuOyBtc28taGlkZTphbGw7IGZvbnQtc2l6ZToxcHg7IGxpbmUtaGVpZ2h0OjFw
eDsgbWF4LWhlaWdodDowcHg7IG1heC13aWR0aDowcHg7IG9wYWNpdHk6MDsgb3ZlcmZsb3c6
aGlkZGVuOyB9PC9zdHlsZT4KICAgICAgPCEtLSBCYU5uRXJCbFVyRmxFLUhlQWRFci1lbmQg
LS0+CiAgICAgIDxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0idGV4
dC9odG1sOyBjaGFyc2V0PVVURi04Ij4KICAgICAgPCEtLSBCYU5uRXJCbFVyRmxFLUJvRHkt
c3RhcnQgLS0+CiAgICAgIDwhLS0gUHJlaGVhZGVyIFRleHQgOiBCRUdJTiAtLT4gPHNwYW4g
Y2xhc3M9InBmcHRQcmVoZWFkZXIiCiAgICAgICAgc3R5bGU9ImRpc3BsYXk6bm9uZQohaW1w
b3J0YW50O3Zpc2liaWxpdHk6aGlkZGVuO21zby1oaWRlOmFsbDtmb250LXNpemU6MXB4O2Nv
bG9yOiNmZmZmZmY7bGluZS1oZWlnaHQ6MXB4O21heC1oZWlnaHQ6MHB4O21heC13aWR0aDow
cHg7b3BhY2l0eTowO292ZXJmbG93OmhpZGRlbjsiPgogICAgICAgIE9uIDEyLzE3LzIwIDA1
OjAzLCBNYXR0aGV3IEJhcnRoIHdyb3RlOiBPbiAxMi8xNi8yMCAyOjAzIEFNLC4uLsKgCiAg
ICAgICAgwqDCoMKgwqDCoAogICAgICAgIMKgwqDCoMKgwqAKICAgICAgICDCoMKgwqDCoMKg
CiAgICAgICAgwqDCoMKgwqDCoAogICAgICAgIMKgwqDCoMKgwqAKICAgICAgICDCoMKgwqDC
oMKgCiAgICAgICAgwqDCoMKgwqDCoAogICAgICAgIMKgwqDCoMKgwqAKICAgICAgICDCoMKg
wqDCoMKgCiAgICAgICAgwqDCoMKgwqDCoAogICAgICAgIMKgwqDCoMKgwqAKICAgICAgICDC
oMKgwqDCoMKgCiAgICAgICAgwqDCoMKgwqDCoAogICAgICAgIMKgwqDCoMKgwqAKICAgICAg
ICDCoMKgwqDCoMKgCiAgICAgICAgwqDCoMKgwqDCoAogICAgICAgIMKgwqDCoMKgwqAKICAg
ICAgICDCoMKgwqDCoMKgCiAgICAgICAgwqDCoMKgwqDCoAogICAgICAgIMKgwqDCoMKgwqAK
ICAgICAgICDCoMKgwqDCoMKgCiAgICAgICAgwqDCoMKgwqDCoAogICAgICAgIMKgwqDCoMKg
wqAKICAgICAgICDCoMKgwqDCoMKgCiAgICAgICAgwqDCoMKgwqDCoAogICAgICAgIMKgwqDC
oMKgwqAKICAgICAgICDCoMKgwqDCoMKgCiAgICAgICAgwqDCoMKgwqDCoAogICAgICAgIMKg
wqDCoMKgwqAKICAgICAgICDCoMKgwqDCoMKgIDwvc3Bhbj4KICAgICAgPCEtLSBQcmVoZWFk
ZXIgVGV4dCA6IEVORCAtLT4KICAgICAgPCEtLSBFbWFpbCBCYW5uZXIgOiBCRUdJTiAtLT4K
ICAgICAgPHRhYmxlIHN0eWxlPSJ3aWR0aDoxMDAlO2JvcmRlci1yYWRpdXM6NHB4O21hcmdp
bi1ib3R0b206MTZweDsiCiAgICAgICAgd2lkdGg9IjEwMCUiIGNlbGxzcGFjaW5nPSIwIiBj
ZWxscGFkZGluZz0iMTYiIGJvcmRlcj0iMCIKICAgICAgICBiZ2NvbG9yPSIjOUNBM0E3Ij4K
ICAgICAgICA8dGJvZHk+CiAgICAgICAgICA8dHI+CiAgICAgICAgICAgIDx0ZCBhbGlnbj0i
Y2VudGVyIj4KICAgICAgICAgICAgICA8dGFibGUgY2xhc3M9InBmcHRNYWluV3JhcHBlciIg
c3R5bGU9IndpZHRoOjEwMCU7IgogICAgICAgICAgICAgICAgd2lkdGg9IjEwMCUiIGNlbGxz
cGFjaW5nPSIwIiBjZWxscGFkZGluZz0iMCIgYm9yZGVyPSIwIgogICAgICAgICAgICAgICAg
YWxpZ249ImNlbnRlciI+CiAgICAgICAgICAgICAgICA8dGJvZHk+CiAgICAgICAgICAgICAg
ICAgIDx0cj4KICAgICAgICAgICAgICAgICAgICA8dGQgc3R5bGU9ImJvcmRlci1yYWRpdXM6
NHB4OyIgdmFsaWduPSJ0b3AiCiAgICAgICAgICAgICAgICAgICAgICBhbGlnbj0iY2VudGVy
Ij4KICAgICAgICAgICAgICAgICAgICAgIDx0YWJsZSBzdHlsZT0ibWF4LXdpZHRoOjEwMCU7
IHdpZHRoOjEwMCU7IgogICAgICAgICAgICAgICAgICAgICAgICB3aWR0aD0iMTAwJSIgY2Vs
bHNwYWNpbmc9IjAiIGNlbGxwYWRkaW5nPSIwIgogICAgICAgICAgICAgICAgICAgICAgICBi
b3JkZXI9IjAiIGJnY29sb3I9IiM5Q0EzQTciIGFsaWduPSJjZW50ZXIiPgogICAgICAgICAg
ICAgICAgICAgICAgICA8dGJvZHk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgPHRyPgog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgPCEtLSBNZXNzYWdlIDogQkVHSU4gLS0+IDx0
aAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjbGFzcz0icGZwdFRhYmxlQ29sdW1u
TGVmdCIKc3R5bGU9ImZvbnQtd2VpZ2h0Om5vcm1hbDtwYWRkaW5nLXRvcDowcHg7cGFkZGlu
Zy1yaWdodDowcHg7cGFkZGluZy1ib3R0b206MHB4O3BhZGRpbmctbGVmdDowcHg7d2lkdGg6
MTAwJTtoZWlnaHQ6YXV0bzsiCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZhbGln
bj0idG9wIj4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHRhYmxlCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3R5bGU9IndpZHRoOjEwMCU7aGVpZ2h0OmF1dG87
dGV4dC1hbGlnbjpsZWZ0O3ZlcnRpY2FsLWFsaWduOm1pZGRsZTsiCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgd2lkdGg9IjEwMCUiIGNlbGxzcGFjaW5nPSIwIgogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNlbGxwYWRkaW5nPSIwIj4KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICA8dGJvZHk+CiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICA8dHI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx0ZD4g
PHNwYW4gY2xhc3M9InBmcHRUaXRsZSIKc3R5bGU9ImZvbnQtZmFtaWx5OidSb2JvdG8nLCdI
ZWx2ZXRpY2EnLCdBcmlhbCcsc2Fucy1zZXJpZjtmb250LXdlaWdodDpib2xkO2ZvbnQtc2l6
ZToxOHB4O2xpbmUtaGVpZ2h0OjIwcHg7ZGlzcGxheTpibG9jazttYXJnaW4tYm90dG9tOjRw
eDt3b3JkLXdyYXA6bm9ybWFsOyI+VGhpcwogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgTWVzc2FnZSBJcyBGcm9tIGFuIEV4dGVybmFsCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBTZW5kZXI8L3NwYW4+IDwvdGQ+CiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICA8L3RyPgogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgPHRyPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8
dGQ+IDxzcGFuIGNsYXNzPSJwZnB0U3VidGl0bGUiCnN0eWxlPSJmb250LXdlaWdodDpub3Jt
YWw7Zm9udC1mYW1pbHk6J1JvYm90bycsJ0hlbHZldGljYScsJ0FyaWFsJyxzYW5zLXNlcmlm
O2ZvbnQtc2l6ZToxM3B4O2xpbmUtaGVpZ2h0OjE2cHg7ZGlzcGxheTpibG9jazt3b3JkLXdy
YXA6bm9ybWFsOyI+VGhpcwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgbWVzc2FnZSBjYW1lIGZyb20gb3V0c2lkZSB5b3VyCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBvcmdhbml6YXRpb24uPC9zcGFuPiA8L3RkPgogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgPC90cj4KICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICA8L3Rib2R5PgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3Rh
YmxlPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPC90aD4KICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDwhLS0gTWVzc2FnZSA6IEVORCAtLT4gPC90cj4KICAgICAgICAgICAg
ICAgICAgICAgICAgPC90Ym9keT4KICAgICAgICAgICAgICAgICAgICAgIDwvdGFibGU+CiAg
ICAgICAgICAgICAgICAgICAgPC90ZD4KICAgICAgICAgICAgICAgICAgPC90cj4KICAgICAg
ICAgICAgICAgIDwvdGJvZHk+CiAgICAgICAgICAgICAgPC90YWJsZT4KICAgICAgICAgICAg
PC90ZD4KICAgICAgICAgIDwvdHI+CiAgICAgICAgPC90Ym9keT4KICAgICAgPC90YWJsZT4K
ICAgICAgPCEtLSBFbWFpbCBCYW5uZXIgOiBFTkQgLS0+CiAgICAgIDwhLS0gQmFObkVyQmxV
ckZsRS1Cb0R5LWVuZCAtLT4KICAgICAgPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij5P
biAxMi8xNy8yMCAwNTowMywgTWF0dGhldyBCYXJ0aAogICAgICAgIHdyb3RlOjxicj4KICAg
ICAgPC9kaXY+CiAgICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiCiAgICAgICAgY2l0ZT0i
bWlkOmM2MTA2MzZkLWJmMzgtNDA3Ny1lZGJmLTVlMGFkNzI3YTNhYkBsaW51eC5pYm0uY29t
Ij4gPGJyPgogICAgICAgIE9uIDEyLzE2LzIwIDI6MDMgQU0sIFRodSBOZ3V5ZW4gd3JvdGU6
IDxicj4KICAgICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj5IaSwgPGJyPgogICAgICAg
ICAgPGJyPgogICAgICAgICAgPGJyPgogICAgICAgICAgSW4gdGhlIGN1cnJlbnQgY29kZSBv
ZiBwaG9zcGhvci1od21vbiwgd2hlbiBmbGFnCiAgICAgICAgICAtLWVuYWJsZS11cGRhdGUt
ZnVuY3Rpb25hbC1vbi1mYWlsIGlzIHNldC4gVGhlIGZhbiBmdW5jdGlvbmFsCiAgICAgICAg
ICBEQnVzIHByb3BlcnR5IGluIHNlbnNvcnMgaW50ZXJmYWNlIHdpbGwgYmUgc2V0IHRvIGZh
bHNlIHdoZW4KICAgICAgICAgIHVucGx1ZyBmYW5zIChGQU40XzIpLiA8YnI+CiAgICAgICAg
ICA8YnI+CiAgICAgICAgICB+IyBidXNjdGwgZ2V0LXByb3BlcnR5CiAgICAgICAgICB4eXou
b3BlbmJtY19wcm9qZWN0Lkh3bW9uLTE2NDQ0NzcyOTAuSHdtb24xCiAgICAgICAgICAveHl6
L29wZW5ibWNfcHJvamVjdC9zZW5zb3JzL2Zhbl90YWNoL0ZBTjRfMgogICAgICAgICAgeHl6
Lm9wZW5ibWNfcHJvamVjdC5TdGF0ZS5EZWNvcmF0b3IuT3BlcmF0aW9uYWxTdGF0dXMKICAg
ICAgICAgIEZ1bmN0aW9uYWwgPGJyPgogICAgICAgICAgYiBmYWxzZSA8YnI+CiAgICAgICAg
ICA8YnI+CiAgICAgICAgICBBTkQgdGhlIGZhbiBWYWx1ZSBwcm9wZXJ0aWVzIHdpbGwga2Vl
cCB0aGUgbGF0ZXN0IHJlYWRpbmcKICAgICAgICAgIHZhbHVlIGJlZm9yZSB1bnBsdWcuIDxi
cj4KICAgICAgICAgIDxicj4KICAgICAgICAgIH4jIGJ1c2N0bCBnZXQtcHJvcGVydHkKICAg
ICAgICAgIHh5ei5vcGVuYm1jX3Byb2plY3QuSHdtb24tMTY0NDQ3NzI5MC5Id21vbjEKICAg
ICAgICAgIC94eXovb3BlbmJtY19wcm9qZWN0L3NlbnNvcnMvZmFuX3RhY2gvRkFONF8yCiAg
ICAgICAgICB4eXoub3BlbmJtY19wcm9qZWN0LlNlbnNvci5WYWx1ZSBWYWx1ZSA8YnI+CiAg
ICAgICAgICA8YnI+CiAgICAgICAgICBkIDQ3OTQgPGJyPgogICAgICAgICAgPGJyPgogICAg
ICAgICAgfiMgYnVzY3RsIGdldC1wcm9wZXJ0eQogICAgICAgICAgeHl6Lm9wZW5ibWNfcHJv
amVjdC5Id21vbi0xNjQ0NDc3MjkwLkh3bW9uMQogICAgICAgICAgL3h5ei9vcGVuYm1jX3By
b2plY3Qvc2Vuc29ycy9mYW5fdGFjaC9GQU40XzIKICAgICAgICAgIHh5ei5vcGVuYm1jX3By
b2plY3QuU2Vuc29yLlZhbHVlIFZhbHVlIDxicj4KICAgICAgICAgIGQgNDc5NCA8YnI+CiAg
ICAgICAgICA8YnI+CiAgICAgICAgICBUaGlzIGNhdXNlIHBob3NwaG9yLWZhbi1tb25pdG9y
IGZhaWxlZCB0byBkZXRlY3QgdGhlIGZhbgogICAgICAgICAgZmFpbHVyZSBzbyB0aGUgZmFu
IGZ1bmN0aW9uYWwgYXJlIHdyb25nLiA8YnI+CiAgICAgICAgICA8YnI+CiAgICAgICAgICBi
dXNjdGwgZ2V0LXByb3BlcnR5IHh5ei5vcGVuYm1jX3Byb2plY3QuSW52ZW50b3J5Lk1hbmFn
ZXIKICAgICAgICAgIC94eXovb3BlbmJtY19wcm9qZWN0L2ludmVudG9yeS9zeXN0ZW0vY2hh
c3Npcy9tb3RoZXJib2FyZC9GQU40XzIKICAgICAgICAgIHh5ei5vcGVuYm1jX3Byb2plY3Qu
U3RhdGUuRGVjb3JhdG9yLk9wZXJhdGlvbmFsU3RhdHVzCiAgICAgICAgICBGdW5jdGlvbmFs
IDxicj4KICAgICAgICAgIGIgdHJ1ZSA8YnI+CiAgICAgICAgICA8YnI+CiAgICAgICAgICBT
aG91bGQgcGhvc3Bob3ItaHdtb24ga2VlcCB1cGRhdGluZyB0aGUgZmFuIHZhbHVlIERidXMK
ICAgICAgICAgIHByb3BlcnRpZXMgd2l0aCBlcnJvciBjb2RlIHdoZW4gdGhlIGZhbnMgaXMg
bm9uZnVuY3Rpb25hbD8gT3IKICAgICAgICAgIHBob3NwaG9yLWZhbi1tb25pdG9yIHNob3Vs
ZCBhbHNvIGNoZWNrIHRoZSBmYW4gZnVuY3Rpb25hbCBpbgogICAgICAgICAgc2Vuc29yIGlu
dGVyZmFjZSB0byB1cGRhdGUgZmFuIGZ1bmN0aW9uYWwgaW4gaW52ZW50b3J5CiAgICAgICAg
ICBpbnRlcmZhY2U/IDxicj4KICAgICAgICAgIDxicj4KICAgICAgICA8L2Jsb2NrcXVvdGU+
CiAgICAgICAgSSByZWNhbGwgdGhpcyB3YXMgc29tZXRoaW5nIHRoYXQgd291bGQgYmUgbmVl
ZGVkIGluCiAgICAgICAgcGhvc3Bob3ItZmFuLW1vbml0b3Igd2hlbiBhIGZhbidzIHNlbnNv
ciBpcyBtYXJrZWQgZmF1bHRlZCBzaW5jZQogICAgICAgIHRoZSB2YWx1ZSBzaG91bGQgbm8g
bG9uZ2VyIGJlIHRydXN0ZWQgYnkgcGhvc3Bob3ItZmFuLW1vbml0b3IuIEEKICAgICAgICBw
aG9zcGhvci1mYW4tbW9uaXRvciBjb25maWd1cmF0aW9uIG9wdGlvbiBuZWVkcyB0byBiZSBh
ZGRlZCBwZXIKICAgICAgICBmYW4gc2Vuc29yIHRvIGNoZWNrIHRoZSBzZW5zb3IncyBmdW5j
dGlvbmFsIHByb3BlcnR5IGFuZCB1c2UKICAgICAgICB0aGF0IHRvIHVwZGF0ZSB0aGUgZmFu
J3MgZnVuY3Rpb25hbCBzdGF0ZSBpbiBpbnZlbnRvcnkgYXMgd2VsbC4KICAgICAgICA8YnI+
CiAgICAgICAgPGJyPgogICAgICAgIFBsZWFzZSBmZWVsIGZyZWUgdG8gc3VibWl0IGEgcGF0
Y2ggdG8gYWRkIHRoaXMgY29uZmlndXJhdGlvbgogICAgICAgIG9wdGlvbiB0byBkcml2ZSBz
ZXR0aW5nIHRoZSBmYW4ncyBmdW5jdGlvbmFsIHN0YXRlIGluIGludmVudG9yeQogICAgICAg
IGJhc2VkIG9uIHRoZSBzdGF0ZSBvZiBhIGZhbiBzZW5zb3IncyBmdW5jdGlvbmFsIHN0YXRl
LiA8YnI+CiAgICAgICAgPGJyPgogICAgICAgIDxicj4KICAgICAgICBNYXR0IDxicj4KICAg
ICAgICA8YnI+CiAgICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+IDxicj4KICAgICAg
ICAgIFJlZ2FyZHMuIDxicj4KICAgICAgICAgIDxicj4KICAgICAgICAgIFRodSBOZ3V5ZW4u
IDxicj4KICAgICAgICAgIDxicj4KICAgICAgICAgIDxicj4KICAgICAgICAgIDxicj4KICAg
ICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgIDwvYmxvY2txdW90ZT4KICAgICAgPHA+SG93IGFi
b3V0IEZhbiBQcmVzZW50IHByb3BlcnR5PyBTaG91bGQgd2UgdXBkYXRlIGl0IHRvIGZhbHNl
CiAgICAgICAgd2hlbiBmYW4gc2Vuc29yIGZ1bmN0aW9uYWwgaXMgZmFsc2U/PC9wPgogICAg
PC9ibG9ja3F1b3RlPgogICAgTm8uIFRoZXNlIGFyZSBzdGF0ZXMgd2l0aCBkaWZmZXJlbnQg
bWVhbmluZ3MuLi5hIGZhbidzIHByZXNlbnQgc3RhdGUKICAgIHNob3VsZCBub3QgYmUgYXNz
b2NpYXRlZCB3aXRoIGEgZmFuIHNlbnNvcidzIGZ1bmN0aW9uYWwgc3RhdGUuIFRoZXJlCiAg
ICBpcyBhIGNhc2Ugd2hlcmUgdGhlc2UgbWF5IGJlIGxpbmtlZCB3aGVuIHRoZSBzZW5zb3Ig
ZGV2aWNlIGlzCiAgICBpbmNsdWRlZCBpbiB0aGUgZmFuIEZSVSBpdHNlbGYsIGhvd2V2ZXIs
IEkgd291bGQgc2VlIHRoZW0gYmVpbmcKICAgIGhhbmRsZWQgYnkgdGhlaXIgcmVzcGVjdGl2
ZSBhcHBsaWNhdGlvbnMgdG8gdXBkYXRlIHRob3NlIGRpZmZlcmVudAogICAgc3RhdGVzIGFj
Y29yZGluZ2x5IGFueXdheXMuPGJyPgogICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIKY2l0
ZT0ibWlkOjdkNjM3MzU3LWJjNjAtMDMyYS03MTJhLWNjMTY1ZDk2YzU3M0BhbXBlcmVtYWls
Lm9ubWljcm9zb2Z0LmNvbSI+CiAgICAgIDxwPkkgdGhpbmsgd2UgY2FuIGFkZCBvcHRpb24K
ICAgICAgICAiZmFuX3NlbnNvcl9mdW5jX3RvX2Zhbl9pbnZlbnRvcnlfZnVuYyIgaW4gZmFu
IGNvbmZpZ3VyYXRpb24gYXMKICAgICAgICBiZWxvdzo8L3A+CiAgICAgIDxkaXYgc3R5bGU9
ImNvbG9yOiAjZDRkNGQ0O2JhY2tncm91bmQtY29sb3I6ICMxZTFlMWU7Zm9udC1mYW1pbHk6
IE1lbmxvLCBNb25hY28sICdDb3VyaWVyIE5ldycsIG1vbm9zcGFjZTtmb250LXdlaWdodDog
bm9ybWFsO2ZvbnQtc2l6ZTogMThweDtsaW5lLWhlaWdodDogMjdweDt3aGl0ZS1zcGFjZTog
cHJlOyI+PGRpdj48c3BhbiBzdHlsZT0iY29sb3I6ICNkNGQ0ZDQ7Ij4gIC0gPC9zcGFuPjxz
cGFuIHN0eWxlPSJjb2xvcjogIzU2OWNkNjsiPmludmVudG9yeTwvc3Bhbj48c3BhbiBzdHls
ZT0iY29sb3I6ICNkNGQ0ZDQ7Ij46IDwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6ICNjZTkx
Nzg7Ij4vc3lzdGVtL2NoYXNzaXMvbW90aGVyYm9hcmQvRkFOM18xPC9zcGFuPjwvZGl2Pjxk
aXY+PHNwYW4gc3R5bGU9ImNvbG9yOiAjZDRkNGQ0OyI+ICAgIDwvc3Bhbj48c3BhbiBzdHls
ZT0iY29sb3I6ICM1NjljZDY7Ij5hbGxvd2VkX291dF9vZl9yYW5nZV90aW1lPC9zcGFuPjxz
cGFuIHN0eWxlPSJjb2xvcjogI2Q0ZDRkNDsiPjogPC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xv
cjogI2I1Y2VhODsiPjMwPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImNvbG9yOiAj
ZDRkNGQ0OyI+ICAgIDwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6ICM1NjljZDY7Ij5kZXZp
YXRpb248L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiAjZDRkNGQ0OyI+OiA8L3NwYW4+PHNw
YW4gc3R5bGU9ImNvbG9yOiAjYjVjZWE4OyI+MTU8L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBz
dHlsZT0iY29sb3I6ICNkNGQ0ZDQ7Ij4gICAgPC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xvcjog
IzU2OWNkNjsiPm51bV9zZW5zb3JzX25vbmZ1bmNfZm9yX2Zhbl9ub25mdW5jPC9zcGFuPjxz
cGFuIHN0eWxlPSJjb2xvcjogI2Q0ZDRkNDsiPjogPC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xv
cjogI2I1Y2VhODsiPjE8L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iY29sb3I6ICNk
NGQ0ZDQ7Ij4gICAgZmFuXzwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6ICM1NjljZDY7Ij5z
ZW5zb3JfZnVuY190b19mYW5faW52ZW50b3J5X2Z1bmM8L3NwYW4+PHNwYW4gc3R5bGU9ImNv
bG9yOiAjZDRkNGQ0OyI+OiA8L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiAjNTY5Y2Q2OyI+
dHJ1ZTwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuIHN0eWxlPSJjb2xvcjogI2Q0ZDRkNDsiPiAg
ICA8L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiAjNTY5Y2Q2OyI+c2Vuc29yczwvc3Bhbj48
c3BhbiBzdHlsZT0iY29sb3I6ICNkNGQ0ZDQ7Ij46PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4g
c3R5bGU9ImNvbG9yOiAjZDRkNGQ0OyI+ICAgICAgLSA8L3NwYW4+PHNwYW4gc3R5bGU9ImNv
bG9yOiAjNTY5Y2Q2OyI+bmFtZTwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6ICNkNGQ0ZDQ7
Ij46IDwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6ICNjZTkxNzg7Ij5GQU4zXzE8L3NwYW4+
PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iY29sb3I6ICNkNGQ0ZDQ7Ij4gICAgICAgIDwvc3Bh
bj48c3BhbiBzdHlsZT0iY29sb3I6ICM1NjljZDY7Ij5oYXNfdGFyZ2V0PC9zcGFuPjxzcGFu
IHN0eWxlPSJjb2xvcjogI2Q0ZDRkNDsiPjogPC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xvcjog
IzU2OWNkNjsiPnRydWU8L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iY29sb3I6ICNk
NGQ0ZDQ7Ij4gICAgICAgIDwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6ICM1NjljZDY7Ij50
YXJnZXRfaW50ZXJmYWNlPC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xvcjogI2Q0ZDRkNDsiPjog
PC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xvcjogI2NlOTE3ODsiPnh5ei5vcGVuYm1jX3Byb2pl
Y3QuQ29udHJvbC5GYW5Qd208L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iY29sb3I6
ICNkNGQ0ZDQ7Ij4gICAgICAgIDwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6ICM1NjljZDY7
Ij5mYWN0b3I8L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiAjZDRkNGQ0OyI+OiA8L3NwYW4+
PHNwYW4gc3R5bGU9ImNvbG9yOiAjYjVjZWE4OyI+ODI8L3NwYW4+PC9kaXY+PGRpdj48c3Bh
biBzdHlsZT0iY29sb3I6ICNkNGQ0ZDQ7Ij4gICAgICAgIDwvc3Bhbj48c3BhbiBzdHlsZT0i
Y29sb3I6ICM1NjljZDY7Ij5vZmZzZXQ8L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiAjZDRk
NGQ0OyI+OiA8L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiAjYjVjZWE4OyI+MDwvc3Bhbj48
L2Rpdj48L2Rpdj4KICAgICAgPHA+SW4gcGhvc3Bob3ItZmFuLW1vbml0b3IsIGZvciBlYWNo
IGZhbiwgd2Ugd2lsbCBzaWduYWwgdGhlIGZhbgogICAgICAgIGZ1bmN0aW9uYWwgcHJvcGVy
dHkgaW4gc2Vuc29yLCBhbmQgdXBkYXRlIHRoZSBmYW4gZnVuY3Rpb24gaW4KICAgICAgICBp
bnZlbnRvcnkgd2hlbiB0aGF0IHByb3BlcnR5IGlzIGNoYW5nZWQuIE1heWJlIHdlIHNob3Vs
ZCB1cGRhdGUKICAgICAgICBmYW4gcHJlc2VudCBpbiBpbnZlbnRvcnkgYWxzby48L3A+CiAg
ICA8L2Jsb2NrcXVvdGU+CiAgICA8cD5JJ2QgcHJlZmVyIHRoaXMgdG8gYmUgdGhlIGRlZmF1
bHQgYW5kIHByb3ZpZGUgYSBjb25maWd1cmF0aW9uCiAgICAgIG9wdGlvbiB0byBkZWNvdXBs
ZSB0aGUgZmFuIHJvdG9yJ3MgZnVuY3Rpb25hbCBzdGF0ZSBmcm9tIHRoZSBzdGF0ZQogICAg
ICBvZiBpdHMgYXNzb2NpYXRlZCBzZW5zb3IocykuIEluIG1vc3QgY2FzZXMsIHRoZSBzZW5z
b3IgYmVpbmcKICAgICAgbm9uZnVuY3Rpb25hbCBzaG91bGQgdGhlcmVmb3JlIHNldCB0aGUg
ZmFuIHJvdG9yJ3MgZnVuY3Rpb25hbAogICAgICBzdGF0ZSB0byBub25mdW5jdGlvbmFsIHdo
ZW4gdGhlIGNvbmZpZ3VyYXRpb24gb3B0aW9uIHRvIGRpc2FibGUKICAgICAgdGhpcyBhc3Nv
Y2lhdGlvbiBpcyBub3QgZ2l2ZW4uIFRoaXMgb3B0aW9uYWwgY29uZmlndXJhdGlvbiB0bwog
ICAgICBkaXNhYmxlIHRoZSBzZW5zb3ItdG8tZmFuIHJvdG9yIGZ1bmN0aW9uYWwgYXNzb2Np
YXRpb24gc2hvdWxkIGJlCiAgICAgIHN1cHBvcnRlZCBmb3IgZWFjaCBzZW5zb3IgbGlzdGVk
IHBlciBmYW4gaW4gdGhlIGZhbiBtb25pdG9yCiAgICAgIGNvbmZpZ3VyYXRpb24gZmlsZS48
L3A+CiAgICA8cD48YnI+CiAgICA8L3A+CiAgICA8cD5NYXR0PGJyPgogICAgPC9wPgogICAg
PGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIKY2l0ZT0ibWlkOjdkNjM3MzU3LWJjNjAtMDMyYS03
MTJhLWNjMTY1ZDk2YzU3M0BhbXBlcmVtYWlsLm9ubWljcm9zb2Z0LmNvbSI+CiAgICAgIDxw
Pjxicj4KICAgICAgPC9wPgogICAgICA8cD5UaHUgTmd1eWVuPGJyPgogICAgICA8L3A+CiAg
ICA8L2Jsb2NrcXVvdGU+CiAgPC9ib2R5Pgo8L2h0bWw+Cg==
--------------57335364DF9E99F8044A4052--

