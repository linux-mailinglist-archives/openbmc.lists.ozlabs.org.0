Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DA236E185
	for <lists+openbmc@lfdr.de>; Thu, 29 Apr 2021 00:26:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVtWj10pHz2yQy
	for <lists+openbmc@lfdr.de>; Thu, 29 Apr 2021 08:26:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A5MdriSr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bruce.mitchell@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=A5MdriSr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVtWR0F0Wz2xZL
 for <openbmc@lists.ozlabs.org>; Thu, 29 Apr 2021 08:25:54 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13SM4O8t121362; Wed, 28 Apr 2021 18:25:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=yYJovC33xVh+XLJIvzJCOT+jeQndA16quHfEkDQbhSM=;
 b=A5MdriSrsx82Z83wLRZH8Gi+euj31QwYgtGVADpAOicSvDlGuyWKEXErmNtRYAisJM8T
 evEdr6uLJtq9fZYX4807EAeqY28mn3zaD5zSj98k2lwWCJehuxdV7pGZPmdtswCnkJL+
 5g2d/tNyf5MNXt9YzBqVzDjTnron1abLCA9odLF4dtS6pT9gtZfCjwwhqbcW0bDeb7Sz
 ndTo9RFS7QUt2cArno0KpCMbIBnv7/lU1BJjsJi6KlZKcag9DC++cQMwwjXG8FewfubT
 1thu/2wI+0BSPFS5eGRG1iUd0mRGV5WRhCVSEAJ8nlCNC6hwtDd+m7wsGa4evniAesbi ig== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 387f0j24q1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 18:25:46 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13SMI8Sv025686;
 Wed, 28 Apr 2021 22:25:46 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03dal.us.ibm.com with ESMTP id 384ay9g5sx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 22:25:46 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13SMPjft31719880
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Apr 2021 22:25:45 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C753BE051;
 Wed, 28 Apr 2021 22:25:45 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 027CFBE056;
 Wed, 28 Apr 2021 22:25:44 +0000 (GMT)
Received: from [9.211.42.130] (unknown [9.211.42.130])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 28 Apr 2021 22:25:44 +0000 (GMT)
Subject: Re: Security Working Group - Wednesday April 28 - results
To: Andrew Jeffery <andrew@aj.id.au>, Joseph Reynolds <jrey@linux.ibm.com>,
 openbmc <openbmc@lists.ozlabs.org>
References: <965c9157-c64b-6594-fbdf-bd2a44c795a1@linux.ibm.com>
 <41c03072-6e30-a9bd-be1a-d74dafd9c3e1@linux.ibm.com>
 <abd0e8ef-3a1b-4f9a-851a-0663f02977ed@www.fastmail.com>
From: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
Message-ID: <6a444a52-0123-e81c-fcb1-3748b4692547@linux.vnet.ibm.com>
Date: Wed, 28 Apr 2021 15:25:45 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <abd0e8ef-3a1b-4f9a-851a-0663f02977ed@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: o6Q6Fr6bWx9MfvUqG_71JEDHeFJHBfZ8
X-Proofpoint-GUID: o6Q6Fr6bWx9MfvUqG_71JEDHeFJHBfZ8
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-28_16:2021-04-28,
 2021-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1011 bulkscore=0 mlxscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
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

On 4/28/2021 15:20, Andrew Jeffery wrote:
> 
> 
> On Thu, 29 Apr 2021, at 07:01, Joseph Reynolds wrote:
>> On 4/27/21 4:48 PM, Joseph Reynolds wrote:
>>> This is a reminder of the OpenBMC Security Working Group meeting
>>> scheduled for this Wednesday April 28 at 10:00am PDT.
>>>
>>> We'll discuss the following items on the agenda
>>> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>,
>>> and anything else that comes up:
>>>
>>> 1. passwordless sudo access to members of the wheel group
>> This customization does not match the common OpenBMC use cases.
>> Abandoning this commit.
>>
>> Bonus topics:
>>
>> 2. Intel Hack-a-Thon 2021 results are coming soon.
> 
> What does this mean?
> 

I believe Intel is trying publishing the results of
their "Intel (security) Hack-a-Thon 2021" by the end
of next week.

