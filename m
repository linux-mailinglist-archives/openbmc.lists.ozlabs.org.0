Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9C52BB12F
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 18:11:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cd3454r7VzDqyb
	for <lists+openbmc@lfdr.de>; Sat, 21 Nov 2020 04:11:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=i3cmMoLj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cd33126YNzDqyb
 for <openbmc@lists.ozlabs.org>; Sat, 21 Nov 2020 04:10:35 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AKH1nFp062566; Fri, 20 Nov 2020 12:10:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=KXRUlIxeV6nsgJW5+Jzf0jofVXpjjvLrJ5MGg4ZA+Sc=;
 b=i3cmMoLjPL/i6YyFt0Hbzt0oYnaYiGeJi9kWNX9cIbrUnHV+5DOqEPXKI+NNVUsAOeLv
 eoMvgKDT9lxz297bs02kCQlUj100Ub8ojnCKT7yLWBfqjovpgV6D7sIMwjm+IiFZirL3
 mVVTm0xhpXSl+gKkZC/w4HMN9Fogr6EZemfLS+HTGL4rO8MWDVGpS/pRd9AFlr9SDN0P
 eA/9YdoEqCpaNnRs+5tRATFZ/SqP6ZbxJQrhX6NWJHVkDDBOjsiIdvdsyuRzJYF8EvlA
 TCH8R3EGKm81ON3pkqhiZCGGdQiDUvcBOW57auOpXsY7Tnge9U8qFqtF114shY1EP8tf Wg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34xd7xjpx1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Nov 2020 12:10:25 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AKH2Wnt071311;
 Fri, 20 Nov 2020 12:10:24 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34xd7xjpwn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Nov 2020 12:10:24 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AKH7bFc001347;
 Fri, 20 Nov 2020 17:10:23 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 34w263f3ur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Nov 2020 17:10:23 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AKHAMUq11535050
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Nov 2020 17:10:22 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF182B2064;
 Fri, 20 Nov 2020 17:10:22 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E36E6B205F;
 Fri, 20 Nov 2020 17:10:21 +0000 (GMT)
Received: from [9.65.247.196] (unknown [9.65.247.196])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 20 Nov 2020 17:10:21 +0000 (GMT)
Subject: Re: Fault handling(Threshold exceeds/low) in Fan and NIC sensors
To: Kumar Thangavel <thangavel.k@hcl.com>, Ed Tanous <ed@tanous.net>
References: <HK0PR04MB2964AA77874471609F0B25BEFDE60@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <CACWQX81k6M6acw0VL3aYA_uqpNsEUjZ3DhiAQp_mXLbGJU87=g@mail.gmail.com>
 <HK0PR04MB2964EA39F0F9AD7ED1A03535FDE30@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <CACWQX82oZiC0e6DJd=M10COJOqORy-ZJyB5biXyecFw26zpaLg@mail.gmail.com>
 <HK0PR04MB2964D64D0DB9F45F5757DF49FDE20@HK0PR04MB2964.apcprd04.prod.outlook.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <d8116efd-678c-2450-1756-a0bacc470858@linux.ibm.com>
Date: Fri, 20 Nov 2020 11:10:25 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <HK0PR04MB2964D64D0DB9F45F5757DF49FDE20@HK0PR04MB2964.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-20_09:2020-11-20,
 2020-11-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 mlxscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 clxscore=1011 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011200113
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
Cc: Zhikui Ren <zhikui.ren@intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Patrick Venture <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>, Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 11/17/2020 5:59 AM, Kumar Thangavel wrote:
> Classification: Internal
>
> Hi Ed,
>
>          Please find below my response inline.
>
> Thanks,
> Kumar.
>
> -----Original Message-----
> From: Ed Tanous <ed@tanous.net>
> Sent: Monday, November 16, 2020 9:29 PM
> To: Kumar Thangavel <thangavel.k@hcl.com>
> Cc: openbmc@lists.ozlabs.org; Velumani T-ERS,HCLTech <velumanit@hcl.com=
>; sdasari@fb.com; Patrick Williams <patrickw3@fb.com>; Patrick Venture <=
venture@google.com>; Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>; Vernon =
Mauery <vernon.mauery@linux.intel.com>; Zhikui Ren <zhikui.ren@intel.com>=

> Subject: Re: Fault handling(Threshold exceeds/low) in Fan and NIC senso=
rs
>
> [CAUTION: This Email is from outside the Organization. Unless you trust=
 the sender, Don=E2=80=99t click links or open attachments as it may be a=
 Phishing email, which can steal your Information and compromise your Com=
puter.]
>
> On Mon, Nov 16, 2020 at 5:05 AM Kumar Thangavel <thangavel.k@hcl.com> w=
rote:
>> Classification: Internal
>>
>> Hi Ed,
>>
>>          In short, Our requirement is to take the actions when the fan=
 fails. That action is platform specific.
>>
>>          Fan failure :  This is based on Fan sensors. If fan sensor's =
tach values is less than 33%, will consider as a fan failure. So will tak=
e the actions to reduce the heat production in the system.
> dbus-sensors and phosphor-pid-control already have mechanisms for handl=
ing fan failure in these ways.  Take a look at the existing config files,=
 and they'll guide you on what you need to do next.
>
>   Kumar :  Are you saying about dbus-sensor's checkThresholds function =
?  In that function, high/low threshold levels are handled.  Please confi=
rm once.
>                   In that function,  planning to add the service to han=
dle the platform specific actions.
>                   Also, planning to add a new field in entity manager t=
o identify the particular sensors to handle this fault condition.

I have a need to monitor some temperature sensor thresholds and take=20
various actions, such as creating
phosphor-logging event logs and doing soft and hard shutdowns after=20
various delays.=C2=A0 In fact, not all sensors
I need to monitor will be provided by D-Bus sensors, but I do need to=20
use data provided by entity
manager to tell me things like how long to delay, etc.

I wouldn't think that dbus-sensors is probably the appropriate place to=20
put this code, since it isn't putting
any sensors on D-Bus and won't necessarily being monitoring sensors=20
provided by that repo.

Does anyone have a good idea of where a daemon like this could go? If=20
nowhere else, I could put it
in phosphor-fan, though not fan related, since our platforms will always =

use the fan-monitor app
provided there which already does similar things for fan errors.

>
>>                                  So that,  hosts, NIC and other power =
consuming modules.
>>
>>          Dbus-sensor's already handles the threshold masking. We just =
use that threshold masking to take the platform specific actions.
>>
>>          Please let us know if any clarifications needed.
>>
>> Thanks,
>> Kumar.
> Ps, Please don't toppost.
> ::DISCLAIMER::
> ________________________________
> The contents of this e-mail and any attachment(s) are confidential and =
intended for the named recipient(s) only. E-mail transmission is not guar=
anteed to be secure or error-free as information could be intercepted, co=
rrupted, lost, destroyed, arrive late or incomplete, or may contain virus=
es in transmission. The e mail and its contents (with or without referred=
 errors) shall therefore not attach any liability on the originator or HC=
L or its affiliates. Views or opinions, if any, presented in this email a=
re solely those of the author and may not necessarily reflect the views o=
r opinions of HCL or its affiliates. Any form of reproduction, disseminat=
ion, copying, disclosure, modification, distribution and / or publication=
 of this message without the prior written consent of authorized represen=
tative of HCL is strictly prohibited. If you have received this email in =
error please delete it and notify the sender immediately. Before opening =
any email and/or attachments, please check them for viruses and other def=
ects.
> ________________________________


