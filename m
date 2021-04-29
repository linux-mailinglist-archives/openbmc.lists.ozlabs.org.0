Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ED036E3D3
	for <lists+openbmc@lfdr.de>; Thu, 29 Apr 2021 05:55:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FW1qG1WC9z2yxj
	for <lists+openbmc@lfdr.de>; Thu, 29 Apr 2021 13:55:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tInIGOOa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tInIGOOa; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FW1px0QkMz2y0J
 for <openbmc@lists.ozlabs.org>; Thu, 29 Apr 2021 13:54:48 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13T3Y20w004577
 for <openbmc@lists.ozlabs.org>; Wed, 28 Apr 2021 23:54:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=KH4NYMdnWZkwqjd/aRF3QJdfh3CKrhAkU/57mmc5n2w=;
 b=tInIGOOaGWHNqZ2qaF/+D+Hb605KOeCNAGy/hbNt0uDhO+UawMnK7ojsjKUi/+YqeuQ/
 c/UH+7Wn7N2AvDwOxGlvbeQKEtRb9mtdaBTi5xx+E3yG/FqsK/TlXD7h7wXB8KctderB
 M8ifeqvMF1dFgM/LUh3PvOkvJS40KyCDFrzvksB2NufVSB+GkDpYzDGxd9DX2mFren72
 Tzxq80OqLVO/C60OdTCk3L1SMoRQO2URERR3luISYY66z6GSjdpkNRdXuFb0AAsCg/nW
 GgypFGRByhXZm8YOU7AXW6lH9ODVsMSSMbAhfeAzd5WrYJA5bokIy6KVYl2ICm09DBWm 3w== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 387n00r97b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 28 Apr 2021 23:54:45 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13T3l7ct031261
 for <openbmc@lists.ozlabs.org>; Thu, 29 Apr 2021 03:54:45 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03wdc.us.ibm.com with ESMTP id 384ay99tfc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 29 Apr 2021 03:54:44 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13T3si8C16581018
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 29 Apr 2021 03:54:44 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 065EABE056
 for <openbmc@lists.ozlabs.org>; Thu, 29 Apr 2021 03:54:44 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE5FFBE04F
 for <openbmc@lists.ozlabs.org>; Thu, 29 Apr 2021 03:54:43 +0000 (GMT)
Received: from demeter.local (unknown [9.160.77.122])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Thu, 29 Apr 2021 03:54:43 +0000 (GMT)
Subject: Re: Security Working Group - Wednesday April 28 - results
To: openbmc@lists.ozlabs.org
References: <965c9157-c64b-6594-fbdf-bd2a44c795a1@linux.ibm.com>
 <41c03072-6e30-a9bd-be1a-d74dafd9c3e1@linux.ibm.com>
 <abd0e8ef-3a1b-4f9a-851a-0663f02977ed@www.fastmail.com>
 <6a444a52-0123-e81c-fcb1-3748b4692547@linux.vnet.ibm.com>
 <63563e1e-446f-4ad6-a104-728bdaa20577@beta.fastmail.com>
 <314a9521-c6f1-0951-15ea-2556ebcd5cbb@linux.vnet.ibm.com>
 <deebe338-fd6c-442a-a965-b51614a0d971@beta.fastmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <aae50b9a-6741-316c-3d96-aebb66b39fba@linux.ibm.com>
Date: Wed, 28 Apr 2021 22:54:42 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
In-Reply-To: <deebe338-fd6c-442a-a965-b51614a0d971@beta.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: e-LipoKenYRpvGE2qbWlQQHfbWWwENtn
X-Proofpoint-GUID: e-LipoKenYRpvGE2qbWlQQHfbWWwENtn
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-29_02:2021-04-28,
 2021-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104290025
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

On 4/28/21 5:43 PM, Andrew Jeffery wrote:
>
> On Thu, 29 Apr 2021, at 08:04, Bruce Mitchell wrote:
>> On 4/28/2021 15:28, Andrew Jeffery wrote:
>>>
>>> On Thu, 29 Apr 2021, at 07:55, Bruce Mitchell wrote:
>>>> On 4/28/2021 15:20, Andrew Jeffery wrote:
>>>>>
>>>>> On Thu, 29 Apr 2021, at 07:01, Joseph Reynolds wrote:
>>>>>> On 4/27/21 4:48 PM, Joseph Reynolds wrote:
>>>>>>> This is a reminder of the OpenBMC Security Working Group meeting
>>>>>>> scheduled for this Wednesday April 28 at 10:00am PDT.
>>>>>>>
>>>>>>> We'll discuss the following items on the agenda
>>>>>>> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>,
>>>>>>> and anything else that comes up:
>>>>>>>
>>>>>>> 1. passwordless sudo access to members of the wheel group
>>>>>> This customization does not match the common OpenBMC use cases.
>>>>>> Abandoning this commit.
>>>>>>
>>>>>> Bonus topics:
>>>>>>
>>>>>> 2. Intel Hack-a-Thon 2021 results are coming soon.
>>>>> What does this mean?
>>>>>
>>>> I believe Intel is trying publishing the results of
>>>> their "Intel (security) Hack-a-Thon 2021" by the end
>>>> of next week.
>>>>
>>> Okay, but what does that mean? Are they pushing patches? Announcing CVEs? Opening bugs?
>>>
>>> What can we expect?
>>>
>> OpenBMC Security Working Group Meeting Notes and Agenda are here:
>> https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit#heading=h.8bihrhc0925u
> Okay, so:
>
>> 2 Intel HaT2021 results are being reviewed
>> internally and are planned to be sent to the
>> OpenBMC security response team.
> So nothing is being made public yet it seems?

Correct.  The OpenBMC security response team should expect to have a 
number of security vulnerability reports to triage.  Some of the results 
from Intel's HaT last year have been turned into fixes, so I'm happy to 
see work being done here.
I'll try to make the announcement more clear next time.

- Joseph

https://github.com/openbmc/docs/blob/master/security/obmc-security-response-team.md

