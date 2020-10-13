Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E95928D248
	for <lists+openbmc@lfdr.de>; Tue, 13 Oct 2020 18:31:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9gzj3vJZzDqcD
	for <lists+openbmc@lfdr.de>; Wed, 14 Oct 2020 03:31:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lZUWhQSU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9gyf46yYzDqVr
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2020 03:30:49 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09DGORZO158487; Tue, 13 Oct 2020 12:30:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=dUfmXTrcr5yhiQEMjSaJP8wdxxQoSNxM9UTXwj4Vidk=;
 b=lZUWhQSUKPwVk6L9cAIAtjGITH16U0Ga0QVWQDMzfnOeZJwAxq9W3Zd3WIYUYyfdAj4x
 S/Yui2G9raW1e+KkGPz+7hUZ7TG/3R6i8nBXlyh47Ev4pdsCVhjE8f+hgobQ++4okszb
 A32lv39EErytIYe5y937V+9CjK5KNrRnoMR2wHzCvlqnISh4SJcPnK2PYPUgp66i3AZs
 Hq+bydiVBhX+7SBs2A5J2qCtVMJf4P/3AXhuEr1XZoV9+U9ApP/dzStArWeS8lF5GUr4
 9x+voLo6lIyn2su8rRi7pUEr9QVHIRP+epHl/z5A0oCO0D3t9mOx12fipXhAJAWb6zMl 2w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 345fqwr424-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Oct 2020 12:30:42 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09DGOfQp163217;
 Tue, 13 Oct 2020 12:30:41 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 345fqwr41e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Oct 2020 12:30:41 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09DGR8RM032700;
 Tue, 13 Oct 2020 16:30:40 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 3434k90ytm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Oct 2020 16:30:40 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09DGUelB42926372
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Oct 2020 16:30:40 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE984AC064;
 Tue, 13 Oct 2020 16:30:39 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 82DA4AC062;
 Tue, 13 Oct 2020 16:30:37 +0000 (GMT)
Received: from [9.206.222.88] (unknown [9.206.222.88])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 13 Oct 2020 16:30:37 +0000 (GMT)
Subject: Re: How to list all sensors through redfish?
To: Lei Yu <yulei.sh@bytedance.com>, "Li, Yong B" <yong.b.li@intel.com>,
 Ed Tanous <ed@tanous.net>
References: <SN6PR11MB29437D2F974612BD91DBCEC0B7090@SN6PR11MB2943.namprd11.prod.outlook.com>
 <CAGm54UFuP60G6-2BYerdK_+ssuWh0BYUBVdBCSaBHrHbHD0MFQ@mail.gmail.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <c9fc71c8-aa5a-d00d-81f7-40d8ca2d5e63@linux.vnet.ibm.com>
Date: Tue, 13 Oct 2020 10:30:34 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CAGm54UFuP60G6-2BYerdK_+ssuWh0BYUBVdBCSaBHrHbHD0MFQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-13_08:2020-10-13,
 2020-10-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 clxscore=1011 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010130118
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
 "feistjj@gmail.com" <feistjj@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/12/2020 8:17 PM, Lei Yu wrote:
> On Sat, Oct 10, 2020 at 9:06 PM Li, Yong B <yong.b.li@intel.com> wrote:
>>
>> Hi All,
>>
>> Based on the current bmcweb implementation:
>>
>> https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/sensors.hpp#L61
>>
>> The below URL only list these power/current/utilization sensors:
>>
>> redfish/v1/Chassis/$chassis/Sensors
>>
>> Just want to know why not list all running sensors? Is it required by redfish spec?

We asked this question in the Redfish forum thread below and Redfish 
said "for sensors that are not covered elsewhere in the model - meaning 
don't duplicate Power and Thermal".

>>
>>
>> Is there any way to  list all sensors through redfish interface? Like the “ipmitool sensor list” command?
>>

Not in one command. You will have to call the Thermal, Power, and 
Sensors schemas like the webui does: 
https://github.com/openbmc/webui-vue/blob/e9a59c75670461a80156554a4dfa04bab5eaf42c/src/store/modules/Health/SensorsStore.js#L22

In 2020.4, this changes and all sensors will be in one location. :)

> 
> I just saw some discussion in the IRC by GunnarM quoted as:
> 
>> /sensors is sensors that aren't in Power/Thermal https://redfishforum.com/thread/190/sensorcollection-contain-all-sensors-chassis
>> For 2020.4 this changes, all sensors will be under /sensors with only a link to the Power/Thermal/Fan/Powersupply schemas
> 
> But from the Redfish spec it does not say /sensors should exclude the
> ones in Power/Thermal, instead /sensors is "the link to the collection
> of sensors located in the equipment and sub-components"
Yeah the spec should have clarified. Probably isn't worth clarifying in 
the spec now because this changes in 2020.4 and that would be the 
release any updated spec is available.

> So I am expecting that it should contain all the sensors in the system.
> In OpenBMC, this could be done by returning all the objects that
> implement the xyz.openbmc_project.Sensor.Value interface.
> 

We implemented this way because of that thread. Feel free to reply on 
that thread.

Thanks,
Gunnar
