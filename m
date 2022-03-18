Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE134DE450
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 23:50:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKzkH0zXnz30hl
	for <lists+openbmc@lfdr.de>; Sat, 19 Mar 2022 09:50:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UvLxXo+b;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UvLxXo+b; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKzjp6ZbWz2xsc
 for <openbmc@lists.ozlabs.org>; Sat, 19 Mar 2022 09:50:06 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22IIWAtQ005215; 
 Fri, 18 Mar 2022 22:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=oUad2Itc2zGyBYyYNfpUJjhIFToK5C64xSBJ3Pq54cM=;
 b=UvLxXo+bp4G3fq1gADSakHqTA5fcuHw1vXijy6lqL9PifWgnkGloDv5CHMgIIiS5Xv2Z
 pn2Yh+ySZ2HInym6gT/Bgb5AR8Sz4Z6k9T9IX7zbqNwxLi0VcaNvAolUjq6Zw5foNeEg
 WrAXXM9XT0oTLxwongux0roEcPfnEJNetivU8uxb/b7fmiD4tVCnQ9i6TGkASmOcesqF
 nywBtqd5/Co5hRXYoSDqzgaP0jvmvT/lsjsfevODtDQ7SWJoIX7vxaGSR/4Fir63f7eT
 Xq4jlnq42IvrcdKFZWU/cv5ExHIJT1EZGON9MZv5oL/pwMlCBrWh38GQWNl++SZ8gViI 0Q== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ev10k07cu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 22:50:03 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22IMbG8J014515;
 Fri, 18 Mar 2022 22:50:02 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02wdc.us.ibm.com with ESMTP id 3erk5ad412-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 22:50:02 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22IMo1D032309606
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 22:50:01 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6015112405B;
 Fri, 18 Mar 2022 22:50:01 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DAE2312405A;
 Fri, 18 Mar 2022 22:50:00 +0000 (GMT)
Received: from [9.65.232.98] (unknown [9.65.232.98])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 18 Mar 2022 22:50:00 +0000 (GMT)
Message-ID: <a8da6258-79e9-28eb-d9d0-5725d817fd2b@linux.ibm.com>
Date: Fri, 18 Mar 2022 17:49:59 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: Security Working Group meeting - Wednesday March 16 - results
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>
References: <bcdc1bcd-857c-9110-2ecc-aa3719ce1d10@linux.ibm.com>
 <fcc5d68f-a8d7-e857-370d-d1bf9971d018@linux.ibm.com>
 <YjJxCRUZQD1HcRXF@heinlein>
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: <YjJxCRUZQD1HcRXF@heinlein>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: IIXzmfetFgiOAe6hfxf9Z3Q_Og6Sd877
X-Proofpoint-GUID: IIXzmfetFgiOAe6hfxf9Z3Q_Og6Sd877
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-18_14,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 clxscore=1015 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=640 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203180122
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

On 3/16/22 6:21 PM, Patrick Williams wrote:
> On Wed, Mar 16, 2022 at 12:51:11PM -0500, Joseph Reynolds wrote:
>
>> 1 Please review the phosphor audit design
>> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/46023
>> <https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/46023>and related
>> code under https://github.com/openbmc/phosphor-logging
>> <https://github.com/openbmc/phosphor-logging>directory phosphor-audit.
>>
>> IBM is interested in working on  this.
> Was there any feedback on the design?  The current proposal seems very
> foundational, like phosphor-logging itself, so I want to make sure we have broad
> consensus on it before we invest a lot of effort in this approach.

I liked it, and I just added a comment!

Joseph

