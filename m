Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF586105A55
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2019 20:24:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JqHh2bBzzDr7h
	for <lists+openbmc@lfdr.de>; Fri, 22 Nov 2019 06:24:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JqH4138DzDr27
 for <openbmc@lists.ozlabs.org>; Fri, 22 Nov 2019 06:23:43 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xALJI6Ft056214; Thu, 21 Nov 2019 14:22:35 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wdu62n818-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Nov 2019 14:22:35 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xALJK46U005433;
 Thu, 21 Nov 2019 19:22:34 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 2wa8r70kax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Nov 2019 19:22:34 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xALJMXmc47317400
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Nov 2019 19:22:33 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63E206E04C;
 Thu, 21 Nov 2019 19:22:33 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 158966E04E;
 Thu, 21 Nov 2019 19:22:32 +0000 (GMT)
Received: from [9.10.100.31] (unknown [9.10.100.31])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 21 Nov 2019 19:22:32 +0000 (GMT)
Subject: Re: Redfish OpenBMC OEM
To: James Feist <james.feist@linux.intel.com>,
 Joseph Reynolds <jrey@linux.ibm.com>,
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
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <ad43dba0-7831-e93d-b073-a6b9de737593@linux.vnet.ibm.com>
Date: Thu, 21 Nov 2019 13:22:33 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <e869ddc9-4682-78b1-b289-6f5ad4a525dc@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-21_05:2019-11-21,2019-11-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=929 phishscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911210161
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


On 11/21/2019 12:16 PM, James Feist wrote:
> On 11/21/19 7:39 AM, Gunnar Mills wrote:
>>
>> On 11/20/2019 5:50 PM, James Feist wrote:
>>> On 11/20/19 2:45 PM, Gunnar Mills wrote:
>>>>>>>> On 11/19/19 10:23 AM, Gunnar Mills wrote:
>>>>>>>>>
>>>>>>>>> The process seems a little light for adding OpenBMC OEM 
>>>>>>>>> Redfish properties and schemas. Can we establish a little more 
>>>>>>>>> stringent process for adding these?
>>>>>>>>>
>>>>
>>>> James, Joseph, and others would you support having a guideline, 
>>>> stating before adding an OEM schema or property, please first 
>>>> engage the Redfish Group? Things Redfish is not interested in 
>>>> taking are an obvious exception. I am also fine with things that 
>>>> are in the process of being up-streamed, being added as OEM 
>>>> temporarily.
>>>
>>> What redfish group are you mentioning?
>>>
>>
>> DMTF’s Redfish
>>
>> They have an open forum here,  to ask questions and request features: 
>> https://redfishforum.com/
>>
>> To get access to the Redfish code repository and meetings
>> 1) Your company must be a Redfish Supporter or Promoter, a lot of 
>> companies working on OpenBMC are
>> 2) Join the DMTF, www.dmtf.org/join
>> 3) Join the "Redfish Forum" working group, 
>> https://members.dmtf.org/apps/org/workgroup/portal/
>> 4) Send an email asking for access to the Redfish code repository
>>
>> I was thinking either of these would establish "engaging Redfish".
>
> I'd be fine with adding this to the docs/readme, however as your 
> company has to be a supporter, it should probably be a weak requirement.
>
Added to the DEVELOPING.md here 
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/27480/

The Redfish Specification Forum, https://redfishforum.com/  is public. 
Anyone can request features there.

Thanks,
Gunnar


