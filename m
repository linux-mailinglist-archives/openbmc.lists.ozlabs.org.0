Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 082A710764C
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 18:18:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47KNRh6dR5zDr3T
	for <lists+openbmc@lfdr.de>; Sat, 23 Nov 2019 04:18:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47KNR46q6QzDr3B
 for <openbmc@lists.ozlabs.org>; Sat, 23 Nov 2019 04:17:36 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAMHHPuu042627; Fri, 22 Nov 2019 12:17:26 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wegnj85yu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Nov 2019 12:17:25 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAMHEplh011878;
 Fri, 22 Nov 2019 17:17:10 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 2wa8r7ynge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Nov 2019 17:17:10 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAMHH94B51642804
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Nov 2019 17:17:09 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE03FAE05F;
 Fri, 22 Nov 2019 17:17:09 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7141EAE05C;
 Fri, 22 Nov 2019 17:17:09 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 22 Nov 2019 17:17:09 +0000 (GMT)
Subject: Re: Redfish OpenBMC OEM - password not accepted
To: Gunnar Mills <gmills@linux.vnet.ibm.com>,
 James Feist <james.feist@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <bec7abfa-8a69-3c8b-7985-dccb80d5c674@linux.vnet.ibm.com>
 <dcfd49c5-48a1-12aa-2f1e-56aef6232cfc@linux.ibm.com>
 <0967abf5-7eb4-8b72-2fe7-d8d4a95ca856@linux.intel.com>
 <5e21e041-aa40-f1a1-e4eb-9aed63db368a@linux.ibm.com>
 <b2654349-f0bf-b341-5736-618dfa2c1fa9@linux.intel.com>
 <bd1c5c4f-68f7-42d4-aebd-daa6629deef5@linux.vnet.ibm.com>
 <e4ce21b1-cab9-765d-100b-5c62843468e0@linux.intel.com>
 <f5078dd7-1b7b-1b93-d1e6-b56081b55835@linux.vnet.ibm.com>
 <e869ddc9-4682-78b1-b289-6f5ad4a525dc@linux.intel.com>
 <ad43dba0-7831-e93d-b073-a6b9de737593@linux.vnet.ibm.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <7f14ff2c-5d81-2464-2aac-d3c813b9160a@linux.ibm.com>
Date: Fri, 22 Nov 2019 11:17:08 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ad43dba0-7831-e93d-b073-a6b9de737593@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-22_03:2019-11-21,2019-11-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911220149
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
Cc: jason.m.bills@linux.intel.com, apparao.puli@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/21/19 1:22 PM, Gunnar Mills wrote:
>
> On 11/21/2019 12:16 PM, James Feist wrote:
>> On 11/21/19 7:39 AM, Gunnar Mills wrote:
>>>
>>> On 11/20/2019 5:50 PM, James Feist wrote:
>>>> On 11/20/19 2:45 PM, Gunnar Mills wrote:
>>>>>>>>> On 11/19/19 10:23 AM, Gunnar Mills wrote:
>>>>>>>>>>
>>>>>>>>>> The process seems a little light for adding OpenBMC OEM 
>>>>>>>>>> Redfish properties and schemas. Can we establish a little 
>>>>>>>>>> more stringent process for adding these?
>>>>>>>>>>
>>>>>
>>>>> James, Joseph, and others would you support having a guideline, 
>>>>> stating before adding an OEM schema or property, please first 
>>>>> engage the Redfish Group? Things Redfish is not interested in 
>>>>> taking are an obvious exception. I am also fine with things that 
>>>>> are in the process of being up-streamed, being added as OEM 
>>>>> temporarily.
>>>>
>>>> What redfish group are you mentioning?
>>>>
>>>
>>> DMTF’s Redfish
>>>
>>> They have an open forum here,  to ask questions and request 
>>> features: https://redfishforum.com/
>>>
>>> To get access to the Redfish code repository and meetings
>>> 1) Your company must be a Redfish Supporter or Promoter, a lot of 
>>> companies working on OpenBMC are
>>> 2) Join the DMTF, www.dmtf.org/join
>>> 3) Join the "Redfish Forum" working group, 
>>> https://members.dmtf.org/apps/org/workgroup/portal/
>>> 4) Send an email asking for access to the Redfish code repository
>>>
>>> I was thinking either of these would establish "engaging Redfish".
>>
>> I'd be fine with adding this to the docs/readme, however as your 
>> company has to be a supporter, it should probably be a weak requirement.
>>
> Added to the DEVELOPING.md here 
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/27480/

There is a vehicle to move this effort forward.  I created a [patch][] 
which defines a new Oem.OpenBMC property for a needed function.  Support 
for this function is already being discussed in a Redfish forum [thread][].

[patch]: https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/27503
[thread]: 
https://redfishforum.com/thread/246/message-send-patch-password-failure

So, the patch is exactly correct.  Please help me out.  It seems like I 
should try to create a new Redfish message.  Here are ideas for a 
straw-man draft for a new Redfish standard message
- Id: PropertyValueError
- Message: The value XYZ for the property ABC was not accepted.
- Resolution: Correct the value for the property in the request body and 
resubmit the request if the operation failed.  Additional information 
about the cause may be provided in the ExtendedInfo.

Then represent each possible cause as an individual 
PropertyValueError@.MessageExtendedInfo message:
  - "The value XYZ  for the property ABC does not comply with the 
regular expression."
  - "The value for the Password property was not accepted.  The reason 
is: %1"  -- I've omitted the password value itself from the message.  
This was done to try to keep the value confidential.  Is that warranted, 
or can we have a generic message (as on the next item below)?  A use 
case for this is messages from PAM like "BAD PASSWORD: it is way too short".
- "The value %1 for the property %2 was not accepted.  The reason is: %3"

Each of the ExtendedInfo messages would also need a formal spec.

Does that sound right?

- Joseph

>
> The Redfish Specification Forum, https://redfishforum.com/  is public. 
> Anyone can request features there.
>
> Thanks,
> Gunnar
>
>

