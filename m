Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A37628F49C
	for <lists+openbmc@lfdr.de>; Thu, 15 Oct 2020 16:23:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBs2X1N0FzDqST
	for <lists+openbmc@lfdr.de>; Fri, 16 Oct 2020 01:23:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ajQR7X0+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBs1Y6TK2zDqNL
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2020 01:22:25 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09FEDxgb042031
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2020 10:22:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=iB79ngz902rZKND0+hMnAff98nonZ1bcY1ALDAA+rjU=;
 b=ajQR7X0+biGZ63fIjPGcgBBQiAyE1149uSV6bS8YQkxyxjjGsLx+zqa8HgOBGU3FfSY1
 GFiD0xm5bimdetcnxyX6yKllwhpkAEd1MWlRp75A6JUIrETNeYiacuW/9f7DTMAqZpGg
 XL3SMR8J/Elnsjaai8aZI/40T5jhv0yMzzaUDtBchkChkHBBpFiHG1MfotH8Im3cwDsF
 2svONpVbH/NRum8A/I+sSVcwZ2s6yntNI5hH8Q3dTtaLc2HiN86Rxhy+k0o1rdVYN9+P
 r/icM/0FEI2LPRbfznE9CiSMRT3b7eb346dGLGMUG8BIEE+zFtekuiLHk230lcdywZGe Vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 346r0n89yr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2020 10:22:23 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09FEE5KZ042896
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2020 10:22:23 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 346r0n89y6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Oct 2020 10:22:23 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09FEGknQ001946;
 Thu, 15 Oct 2020 14:22:22 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03wdc.us.ibm.com with ESMTP id 343y2tjaxn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Oct 2020 14:22:22 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09FEMLXu52494846
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Oct 2020 14:22:21 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78C4812405E;
 Thu, 15 Oct 2020 14:22:21 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3504C124054;
 Thu, 15 Oct 2020 14:22:21 +0000 (GMT)
Received: from [9.80.201.12] (unknown [9.80.201.12])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 15 Oct 2020 14:22:21 +0000 (GMT)
Subject: Re: Security Working Group Meeting - Wed 14 October - request for
 security bug tracker
To: openbmc@lists.ozlabs.org, krtaylor <kurt.r.taylor@gmail.com>
References: <CAC1Cx+sq1RM4YBnbbiKq1uJ-1bjdETj2u116cSzsd2vhSo2K7Q@mail.gmail.com>
 <0c8a7bd5-e437-6460-b309-c9146477e120@linux.ibm.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <d29bfcde-bf3f-b739-20b3-c63686f3f746@linux.ibm.com>
Date: Thu, 15 Oct 2020 09:22:20 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <0c8a7bd5-e437-6460-b309-c9146477e120@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-15_08:2020-10-14,
 2020-10-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010150099
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

On 10/15/20 9:14 AM, Joseph Reynolds wrote:
> On 10/13/20 2:06 PM, Parth Shukla wrote:
>> This is a reminder of the OpenBMC Security Working Group meeting 
>> scheduled for this...
>> This Message Is From an External Sender
>> This message came from outside your organization.
>>
>> This is a reminder of the OpenBMC Security Working Group meeting 
>> scheduled for this Wednesday October 14 at 10:00am PDT.
>>
>> We'll discuss the following items on the agenda 
>> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
>> and anything else that comes up:
>>
...snip...
>
> Two subtopics were discussed:
>
> 2A. We reviewed the security reporting and bug fixing process. 
> Specifically:
>
>  * The OpenBMC security response team:
> https://github.com/openbmc/docs/blob/master/security/obmc-security-response-team.md
>
>  * This is what github advocates using:
>    https://github.com/openbmc/openbmc/security/advisories
>
>  * What tools do we use to:
>
>     * Identify which open source pkgs are used in an openbmc build,
>
>     * Identify security bugs in those packages, and
>
>     * Ensure that we pull in fixes or otherwise mitigate the problem.
>
>
> 2B. Given that OpenBMC is a Linux Foundation project, what resources 
> does the Linux Foundation offer?  Specifically, we want a private 
> secure bug tracker for the OpenBMC security response team to use.

Kurt,

The OpenBMC security response team could benefit from a bug tracker to 
track security vulnerabilities that were reported to the project and not 
yet disclosed.  This is to support [1] and would have to be private and 
secure.
What is commonly used for this?  Can we do it at the project level? Can 
LF help?

- Joseph

[1]: 
https://github.com/openbmc/docs/blob/master/security/obmc-security-response-team.md


...snip...
>> Access, agenda and notes are in the wiki:
>> https://github.com/openbmc/openbmc/wiki/Security-working-group
>>
>> Regards,
>> Parth
>

