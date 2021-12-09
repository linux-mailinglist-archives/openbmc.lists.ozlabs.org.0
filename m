Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEBF46F163
	for <lists+openbmc@lfdr.de>; Thu,  9 Dec 2021 18:13:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J90xS3gx3z3bjF
	for <lists+openbmc@lfdr.de>; Fri, 10 Dec 2021 04:13:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rghjwJiN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rghjwJiN; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J90wy4pBMz308v
 for <openbmc@lists.ozlabs.org>; Fri, 10 Dec 2021 04:13:22 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B9H9Y1d001242; 
 Thu, 9 Dec 2021 17:13:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=TutM/nOUf30LSIGPkWnFpNDua6aW0XUFS6erpkUsIpo=;
 b=rghjwJiNlkzpHGCkAq/PVUjqgKVtAAg4xgZkbLyP7Udpi/fy3IADMFWl31zOvEoG6jYu
 3HQO2ywY1WEwM8RVd8BK6LfW1rPU8bCl0cFsTkaRxussj4zz74c3QbsZP0wQv/ed7U/J
 cAKuT0ES2Lx9pVcPJXm8qGpx4bl5FQa5zc3Gt68Rd4HympsfK8RaMpjX53y/KR5C8/iQ
 c5+ZHC/v6uqTRw0hReQWQZxvFwgYq6B2GQXCIYzgsSVKLcpryih8/tCwl+jXs5ZvvSvL
 cw7kU4DiP9d/8EYjn2ha/w6FmLc9N71cMZTTmyGxoVmFpMyyfxTdPPVabV5YAbiOrFW/ +Q== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cum4735u9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 17:13:15 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B9HDFU6019256;
 Thu, 9 Dec 2021 17:13:15 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02dal.us.ibm.com with ESMTP id 3cqyycp5vj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 17:13:15 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B9HDDhJ31523128
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Dec 2021 17:13:13 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9192D12405E;
 Thu,  9 Dec 2021 17:13:13 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39B1F124066;
 Thu,  9 Dec 2021 17:13:13 +0000 (GMT)
Received: from [9.65.197.216] (unknown [9.65.197.216])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu,  9 Dec 2021 17:13:13 +0000 (GMT)
Message-ID: <7e7f0779-d6c7-99b3-d88a-5a239440984a@linux.ibm.com>
Date: Thu, 9 Dec 2021 11:13:12 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: Security Working Group meeting - Wednesday December 8 - results
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>
References: <0abb0557-9797-cd8e-1d21-bc8abf24d7ad@linux.ibm.com>
 <64bef7b7-2dae-056c-98dc-696b864f4fb7@linux.ibm.com>
 <2fb7a5f7-a9a3-4c00-9b16-d98a9c0af91c@www.fastmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: <2fb7a5f7-a9a3-4c00-9b16-d98a9c0af91c@www.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3pwxV3pHa7bItjfJMGZ7fzZYyB4SnOXx
X-Proofpoint-GUID: 3pwxV3pHa7bItjfJMGZ7fzZYyB4SnOXx
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-09_07,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=942
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112090089
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/9/21 4:21 AM, Andrew Jeffery wrote:
> On Thu, 9 Dec 2021, at 05:44, Joseph Reynolds wrote:
>
>> 4 Progress on BMC secure boot?
>>
>> AST2600 hardware secure U-boot  boot, then secure booting the Linux
>> kernel. No additional pieces.
>>
>> See the AST security guide.  How is signing-key management done?
>>
>> Dhananjay to  follow up.
> As someone who was involved in integrating the AST2600 secure-boot support into OpenBMC, what's going on here?

Someone asked the question you see above, and Dhananjay tried to 
answer.  The consensus was that there is support for AST2600 secure 
booting U-Boot, support for U-Boot securely loading the Linux kernel, 
and no additional support.  Your summary would be appreciated.

Is there a document which what a system integrator needs to use this 
function?  Ideally it would be linked from 
https://github.com/openbmc/docs/blob/master/features.md

Joseph

>
> Andrew

