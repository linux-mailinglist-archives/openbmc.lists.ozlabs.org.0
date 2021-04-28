Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C378736E18E
	for <lists+openbmc@lfdr.de>; Thu, 29 Apr 2021 00:34:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVtjK4nysz2xZL
	for <lists+openbmc@lfdr.de>; Thu, 29 Apr 2021 08:34:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VVOznyKL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bruce.mitchell@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VVOznyKL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVtj46Lrrz2xVt
 for <openbmc@lists.ozlabs.org>; Thu, 29 Apr 2021 08:34:16 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13SM66KT105971; Wed, 28 Apr 2021 18:34:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=f6hvFXCjX9MEIM02hKB/1zFJh3d1LakyHW6RQlw7/sU=;
 b=VVOznyKLsxG30ED6mnneEtRMk93tyV0VmKPQu65Lqgvo1O2sOXmnM5wyIwqnixqcsIHC
 OtPD8Hg6lqcIqhQ/pfDjSjEMl+jy1/nn5OS91D+AXfdnZRr/JF3SnqI5TaA+4xUSx0YF
 ze7EgoLQX9g8NFzpObVAapV5pn8criCE/d96MwhChAHNyG5/bzNV/Fskm2Sb7lv9vWWL
 8wMefyPkmFlDANuE/0Pe2nDefsy/wmBY7gqOlsUyd9zjU3j1XmXgUJXRU7vB+sl0m4zI
 qRTqTjL/k1dnDhwQHts1qX7bCBl3j/HZ7cqdb1RrzF0fw5JsqV0PDTxsYFKcVvAvcHPx cQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 387ffm1dq0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 18:34:09 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13SMQmSI005245;
 Wed, 28 Apr 2021 22:34:08 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01wdc.us.ibm.com with ESMTP id 384ay9r8jj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 22:34:08 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13SMY7dG33423748
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Apr 2021 22:34:07 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3DDDFBE05A;
 Wed, 28 Apr 2021 22:34:07 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6C99BE059;
 Wed, 28 Apr 2021 22:34:06 +0000 (GMT)
Received: from [9.211.42.130] (unknown [9.211.42.130])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 28 Apr 2021 22:34:06 +0000 (GMT)
Subject: Re: Security Working Group - Wednesday April 28 - results
To: Andrew Jeffery <andrew@aj.id.au>, Joseph Reynolds <jrey@linux.ibm.com>,
 openbmc <openbmc@lists.ozlabs.org>, "Mihm, James" <james.mihm@intel.com>
References: <965c9157-c64b-6594-fbdf-bd2a44c795a1@linux.ibm.com>
 <41c03072-6e30-a9bd-be1a-d74dafd9c3e1@linux.ibm.com>
 <abd0e8ef-3a1b-4f9a-851a-0663f02977ed@www.fastmail.com>
 <6a444a52-0123-e81c-fcb1-3748b4692547@linux.vnet.ibm.com>
 <63563e1e-446f-4ad6-a104-728bdaa20577@beta.fastmail.com>
From: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
Message-ID: <314a9521-c6f1-0951-15ea-2556ebcd5cbb@linux.vnet.ibm.com>
Date: Wed, 28 Apr 2021 15:34:07 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <63563e1e-446f-4ad6-a104-728bdaa20577@beta.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: I_sCMth5s46bhaJzO0ZTBsx4Fsg3RjhX
X-Proofpoint-ORIG-GUID: I_sCMth5s46bhaJzO0ZTBsx4Fsg3RjhX
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-28_16:2021-04-28,
 2021-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 clxscore=1011 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104280141
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

On 4/28/2021 15:28, Andrew Jeffery wrote:
> 
> 
> On Thu, 29 Apr 2021, at 07:55, Bruce Mitchell wrote:
>> On 4/28/2021 15:20, Andrew Jeffery wrote:
>>>
>>>
>>> On Thu, 29 Apr 2021, at 07:01, Joseph Reynolds wrote:
>>>> On 4/27/21 4:48 PM, Joseph Reynolds wrote:
>>>>> This is a reminder of the OpenBMC Security Working Group meeting
>>>>> scheduled for this Wednesday April 28 at 10:00am PDT.
>>>>>
>>>>> We'll discuss the following items on the agenda
>>>>> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>,
>>>>> and anything else that comes up:
>>>>>
>>>>> 1. passwordless sudo access to members of the wheel group
>>>> This customization does not match the common OpenBMC use cases.
>>>> Abandoning this commit.
>>>>
>>>> Bonus topics:
>>>>
>>>> 2. Intel Hack-a-Thon 2021 results are coming soon.
>>>
>>> What does this mean?
>>>
>>
>> I believe Intel is trying publishing the results of
>> their "Intel (security) Hack-a-Thon 2021" by the end
>> of next week.
>>
> 
> Okay, but what does that mean? Are they pushing patches? Announcing CVEs? Opening bugs?
> 
> What can we expect?
> 

OpenBMC Security Working Group Meeting Notes and Agenda are here:
https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit#heading=h.8bihrhc0925u

Anything beyond that Intel would have to state what they are doing;
James?


