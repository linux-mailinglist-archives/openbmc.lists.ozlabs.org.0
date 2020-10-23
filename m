Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDD729784E
	for <lists+openbmc@lfdr.de>; Fri, 23 Oct 2020 22:37:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHwy30x6JzDr0N
	for <lists+openbmc@lfdr.de>; Sat, 24 Oct 2020 07:36:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=j6M6Fsyg; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHwwr30KpzDqMt
 for <openbmc@lists.ozlabs.org>; Sat, 24 Oct 2020 07:35:55 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09NKWZJE116065
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2020 16:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=XemhxcR3CS+aVCbtsaoiGfanSZMU6nakTVW+t9pQxJM=;
 b=j6M6FsygYQEt2ndnR/QZV/TTgsZHH/tXB3OvMyTlNWtBRdDRmb+1mgwKePCFDVTxjq2A
 f6/MV8uFh4fKKJrjRjqWTrclbnf1DLU6qs3sGnng1Yk4KxvBdIEQBqybRAOWIkodCrJL
 yKJhRlrM0WklNqTMXtrvOSRamMchnHWg2q8MC53NBNr0rPoIrhoD1jbrIyNG9Y7pl8uF
 VoHvHWCnpTxoY9Yhypz10GasILjq+jkJnu3c1QeT0Q8fqYNcEFmdH8kkZLIrhu2Xs96x
 dpZIAEnGj1hYKoNBcT1kYj0O5OqJRkD+3dz6cTzcjtUPYPpLzIe0LnEU+QXNtvbhxQU9 vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34bd0sw45v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2020 16:35:51 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09NKXGHb118090
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2020 16:35:50 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34bd0sw45r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Oct 2020 16:35:50 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09NKWGIB009853;
 Fri, 23 Oct 2020 20:35:50 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02dal.us.ibm.com with ESMTP id 347r8a8cvb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Oct 2020 20:35:49 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09NKZndT12059228
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Oct 2020 20:35:49 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 475B7B2064;
 Fri, 23 Oct 2020 20:35:49 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09494B2066;
 Fri, 23 Oct 2020 20:35:49 +0000 (GMT)
Received: from [9.85.157.1] (unknown [9.85.157.1])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 23 Oct 2020 20:35:48 +0000 (GMT)
Subject: Re: thoughts on livepatch?
To: openbmc@lists.ozlabs.org, Nancy Yuen <yuenn@google.com>
References: <CADfYTpGw9G0ACwhmiZU_v8HoT4nZy8a3wnCGbozM1QiNFaX9og@mail.gmail.com>
 <CADfYTpGQo=N1QV-EgiZ3io6fmv84M4A8gs0oUY2+9_0qVmrM6Q@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <969cdb64-ce3b-cb32-3f1c-c3304a9c20c6@linux.ibm.com>
Date: Fri, 23 Oct 2020 15:35:48 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CADfYTpGQo=N1QV-EgiZ3io6fmv84M4A8gs0oUY2+9_0qVmrM6Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-23_14:2020-10-23,
 2020-10-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010230121
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

On 10/22/20 8:00 PM, Nancy Yuen wrote:
> And I was trigger happy. Meant to include...
> This Message Is From an External Sender
> This message came from outside your organization.
>
> And I was trigger happy.  Meant to include 
> https://www.kernel.org/doc/Documentation/livepatch/livepatch.txt
>
> On Thu, Oct 22, 2020 at 5:59 PM Nancy Yuen <yuenn@google.com 
> <mailto:yuenn@google.com>> wrote:
>
>     Anyone tried it with OpenBMC?  Any thoughts?
>

What is the use case?  I assume this is to patch an OpenBMC-based 
firmware image without having to rebuild and distribute the entire 
image.  What is the benefit of using livepatching compared to creating a 
new image that has the fix included, and rebooting the BMC to apply it?

Benefits?
- Smaller patch requires less bandwidth to distribute.
- Possible increased ability to apply patches sooner (compared to 
installing entire image then rebooting the BMC).
- Quicker apply times means less BMC downtime.

What is the cost?
- More complicated infrastructure to train staff and to create, track  
test, distribute, and apply patches.
- You have to test the patched image and test the image that has the 
permanent fix.
- Does patching work and play nicely with secure boot and attestation 
schemes?

Kernel livepatching is similar to immediate PTFs on IBM i.  As 
developers, we were encouraged to develop patches that could be applied 
immediately (meaning no reboot required).  These sometimes took extra 
time to develop, and it was not always possible to develop such a fix, 
required additional testing, and sometimes caused customer problems.

My 2 cents worth,
- Joseph

>
>     Nancy Yuen
>
>     	
>
>     •
>
>     	
>
>     Google Platforms
>
>     	
>
>     •
>
>     	
>
>     yuenn@google.com <mailto:yuenn@google.com>
>
>     	
>
>     •
>
>     	
>
>     Google LLC
>
>
>
> -- 
>
> Nancy Yuen
>
> 	
>
> •
>
> 	
>
> Google Platforms
>
> 	
>
> •
>
> 	
>
> yuenn@google.com <mailto:yuenn@google.com>
>
> 	
>
> •
>
> 	
>
> Google LLC
>

