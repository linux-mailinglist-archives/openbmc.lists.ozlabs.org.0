Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1466414CEAB
	for <lists+openbmc@lfdr.de>; Wed, 29 Jan 2020 17:48:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4878YT0RH5zDqSv
	for <lists+openbmc@lfdr.de>; Thu, 30 Jan 2020 03:47:57 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4878Xv0DWszDqSQ
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jan 2020 03:47:25 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00TGiWTL071828; Wed, 29 Jan 2020 11:47:22 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xttw7ccke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2020 11:47:22 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00TGih6E021750;
 Wed, 29 Jan 2020 16:47:21 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 2xrda74atn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2020 16:47:21 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00TGlJET32571748
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jan 2020 16:47:19 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A51C0136059;
 Wed, 29 Jan 2020 16:47:19 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A3C9136051;
 Wed, 29 Jan 2020 16:47:19 +0000 (GMT)
Received: from [9.10.100.197] (unknown [9.10.100.197])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 29 Jan 2020 16:47:19 +0000 (GMT)
Subject: Re: Redfish OpenBMC OEM
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
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
 <ad43dba0-7831-e93d-b073-a6b9de737593@linux.vnet.ibm.com>
Message-ID: <2b781d56-e375-96a9-c83d-87e07f0d00dd@linux.vnet.ibm.com>
Date: Wed, 29 Jan 2020 10:47:21 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <ad43dba0-7831-e93d-b073-a6b9de737593@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-29_04:2020-01-28,
 2020-01-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001290136
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


On 11/21/2019 1:22 PM, Gunnar Mills wrote:
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
>
> The Redfish Specification Forum, https://redfishforum.com/  is public. 
> Anyone can request features there.
>
Still seems like it is too easy to add Redfish "OpenBMC" OEM and they 
just slip in.

Did we engage Redfish on this one 
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/28699 ?

Should the schema go in a different repo, and have a different review 
process? Maybe a minimum of N contributing companies have to sign off on 
the interface definition of a Redfish "OpenBMC" OEM? Do others have a 
similar concern?

Thanks!
Gunnar

