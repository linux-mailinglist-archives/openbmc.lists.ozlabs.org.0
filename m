Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5984369FAE3
	for <lists+openbmc@lfdr.de>; Wed, 22 Feb 2023 19:19:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMPYj348Dz3cFn
	for <lists+openbmc@lfdr.de>; Thu, 23 Feb 2023 05:19:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HHigJ2DY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HHigJ2DY;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMPY33jV7z3bwQ
	for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2023 05:18:30 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31MHOVAK015172;
	Wed, 22 Feb 2023 18:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=TZeLGC6YNcbfWGmQHdPYFGp0yJ+iSnc3UqJVaEI+8n8=;
 b=HHigJ2DYL1pFJoDA+j3y4aWqx3HwflyTLZ+GcDD7LdH7jyF+ZZqBU5OdIxhcsl72+wIR
 1pVZQdunQB1ngXsq7qWrKQ7gHhoidCI7MvRE2KAcfvDVdwzq6ch0zZFn+T5l7RDwvvG6
 v8hbrCnfSIW7yzerrbC9AVEny8e+HpP2z91+8R8hwd/bRlJ1eL0mNeSu5R+dStoQdlNX
 erVZGLUxMI/h18FFkfjM5yv7nWarMcw38MtO2YZIVZ5fWUic43+kaaf/vNT4282Sbe/X
 vBGSUTqqN7kuX/SktLVCKt5YRWOHbby6H77Hj6kYo3XZMwqBysmQawv2yi7C/2zeb5vL tQ== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nwqdys8xc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 18:18:23 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31MGZJoC023041;
	Wed, 22 Feb 2023 18:18:22 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
	by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3ntpa71pny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 18:18:22 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31MIIL0n38338880
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Feb 2023 18:18:21 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 25F025804E;
	Wed, 22 Feb 2023 18:18:21 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BAEE158054;
	Wed, 22 Feb 2023 18:18:20 +0000 (GMT)
Received: from [9.160.89.121] (unknown [9.160.89.121])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 22 Feb 2023 18:18:20 +0000 (GMT)
Message-ID: <de3daeb5-b0b4-00a1-7618-744025fe98f8@linux.ibm.com>
Date: Wed, 22 Feb 2023 12:18:19 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: Questions about OpenBMC
To: Angela_Wang@compal.com, openbmc@lists.ozlabs.org
References: <fa0bc7ae70714cd7816d542a8fc017d7@compal.com>
 <86cb2f3434424349ad39c49aafdba2ce@compal.com>
Content-Language: en-US
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: <86cb2f3434424349ad39c49aafdba2ce@compal.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vfDQxQ5BOYwqWwgT-Vr6dTnskZmefW5C
X-Proofpoint-GUID: vfDQxQ5BOYwqWwgT-Vr6dTnskZmefW5C
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-22_06,2023-02-22_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 malwarescore=0 clxscore=1011
 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302220157
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

On 2/13/23 9:26 PM, Angela_Wang@compal.com wrote:
> Dear Sir or Madam, Greetings. We are interested in incorporating 
> OpenBMC into our commercial product/service, and we are studying 
> OpenBMC’s licensing policy as attached, which is downloaded from 
> https: //github. com/openbmc/docs/blob/master/LICENSE. 
> ZjQcmQRYFpfptBannerStart
> This Message Is From an Untrusted Sender
> You have not previously corresponded with this sender.
> ZjQcmQRYFpfptBannerEnd
>
> Dear Sir or Madam,
>
> Greetings. We are interested in incorporating OpenBMC into our 
> commercial product/service, and we are studying OpenBMC’s licensing 
> policy as attached, which is downloaded from 
> https://github.com/openbmc/docs/blob/master/LICENSE.
>
> To make sure we understand the terms and conditions correctly, may we 
> seek your clarification for below 2 points?
>
> 1.*_Logo_*: in Section 2-b-2 it says “Patent and trademark rights are 
> not licensed under this Public License.”, thus to our understanding, 
> we (licensee) are not allowed to use OpenBMC’s logo because the logo 
> is one kind of trademark and belongs to the licensor.
>
...snip...

I understand projects downstream from OpenBMC (products or services) are 
allowed to use the OpenBMC logo to celebrate the fact that it is "Based 
on OpenBMC" (but I cannot find any statement to that effect).  So I 
don't know the answer.  OpenBMC's controlling Technical Charter is here: 
https://www.openbmc.org/
OpenBMC's Charter mentions licensing and also references the OpenBMC 
"technical steering committee" (TSC), who can help answer questions 
about licensing.

Finally, I think the intention is for downstream projects to replace the 
logo with their own logo.  Asking the Web development team may help.
https://github.com/openbmc/openbmc/blob/master/README.md#contact
Email works, and also consider quicker feedback.  For example, ask the 
Web development how to replace the logo in Discord > OpenBMC > #webui 
channel


> 2.*_Pricing_*: from Section 2-b-3 we understand that we are allowed to 
> sell our commercial product/service which incorporates GitHub’s 
> OpenBMC code on a royalty-free basis. There is no need to report to 
> GitHub our sales amount, and GitHub will not audit our sales record 
> either.  As for the pricing listed in _https://github.com/pricing 
> <https://github.com/pricing>_, it refers to the extra technical 
> support provided by GitHub, and we will need to pay _only if_ we need 
> these extra technical support service from GitHub. *_Is this 
> understanding correct? Please correct me if I am wrong._*
>

That matches my understanding of the intention of the OpenBMC project.  
Pursuant to my previous statement, although I participate in my 
company's license compliance process, please note I am not an attorney, 
so this is not legal advice.
When you pick up the OpenBMC project and use it for yourself, you are 
responsible to comply with all of the open source software licenses for 
components built into your firmware image, whether they are from the 
OpenBMC project itself or from projects they bring in (like the Linux 
kernel, openssl, glibc, etc.)

The Yocto process offers help to get the list of packages, versions, and 
licenses. Ref:
https://docs.yoctoproject.org/dev-manual/common-tasks.html#maintaining-open-source-license-compliance-during-your-product-s-lifecycle


I hope this helps.

Joseph

> Your response is appreciated.
>
> Regards,
>
> Angela
>
...snip...

