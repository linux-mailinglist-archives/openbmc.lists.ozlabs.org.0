Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB31E2D6071
	for <lists+openbmc@lfdr.de>; Thu, 10 Dec 2020 16:51:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsJLF51PNzDqM5
	for <lists+openbmc@lfdr.de>; Fri, 11 Dec 2020 02:51:17 +1100 (AEDT)
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
 header.s=pp1 header.b=Ug+ibM4z; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsHRk5JDQzDq8v
 for <openbmc@lists.ozlabs.org>; Fri, 11 Dec 2020 02:10:53 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BAF1hp3008237
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2020 10:10:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to :
 references : message-id : date : mime-version : in-reply-to : content-type
 : content-transfer-encoding; s=pp1;
 bh=a81EJiLC6lixbbFKTb3sRSywfZPQF5YMK9C/rG/0gN4=;
 b=Ug+ibM4zLoO3KSAhvY2Tr5Td03sLIKYUELE0m+yoh8EoiRzyjvPoJezMXJps8gVYOYT4
 LXSef7DCVvpN8c77vVUm2z0PFw15KsW2S1DDX7JzMaVQi9uxoyI057dBmpCCj7KpUqdn
 cm5Km/bSwTR46SYeVI5jXsZkSYM+JaYKYASOTo+OBufhQ9EiHyYXgwuDd0KGc241YqWE
 JfrcQorVQD8l/eM1Wjl88t/3eB/MCZNwIEs657dx60wEZD+rNymz/vUcbgSqk10djJ/3
 eor6QrvP0orvrHIkQzScnbkNTUFKDG4RE9D7QjnlHPHSwyZrA2OTLRxIvb3fPtmE5EE9 NA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35bj9m85x0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2020 10:10:43 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BAF6V5d006992
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2020 15:10:42 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02dal.us.ibm.com with ESMTP id 3581uaahe4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2020 15:10:42 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BAFAfg526018256
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2020 15:10:41 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB9A9112069
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2020 15:10:40 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8ABE0112063
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2020 15:10:40 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.80.199.96])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2020 15:10:40 +0000 (GMT)
Subject: Re: Security Working Group meeting - Wednesday December 9 - results
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <2cfae0a8-e691-fe24-835f-8254c6c93f19@linux.ibm.com>
Message-ID: <3bb5e81c-4b3e-8e6d-28c7-6776c4968042@linux.ibm.com>
Date: Thu, 10 Dec 2020 09:10:39 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <2cfae0a8-e691-fe24-835f-8254c6c93f19@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-10_06:2020-12-09,
 2020-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012100092
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

On 12/8/20 10:01 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday December 9 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
> and anything else that comes up:
>
>
> 1.
>
>    Discord discussion #webui: Dumps and logs may contain sensitive
>    information as documented
>    here 
> https://github.com/ibm-openbmc/dev/issues/1531#issuecomment-642238544
>    and https://github.com/openbmc/openbmc/wiki/Configuration-guide

It is worthwhile to document sensitive info stored in dump and log 
items.  Where are dumps stored?  Encrypted?  Who *should* have read 
access to dumps and logs that may contain sensitive information?  Note 
different use cases with different details in terms of what information 
is present, how sensitive it is, if it needs to be encrypted as it sits 
in the BMC, and who should have read access.

The consensus was to keep these details in the wiki.



> 2.
>
>    Joseph: Proposed PerformService privilege enhancement to BMCWeb
> https://lore.kernel.org/openbmc/1bfe87ea-9fc5-8664-d1de-d3138616a427@linux.ibm.com/T/#u

The question is how to implement Redfish custom roles and Redfish OEM 
privileges in BMCWeb.
Use the email thread for discussion.  The direction is NOT to sprinkle 
customizations throughout the code, instead to implement BMCWeb so we 
can consume Redfish's published PrivilegeRegistry at BMCWeb compile 
time.  Then downstream users can supply customized PrivilegeRegistry 
files that have OEM privileges.  (Refer to the email thread for details, 
corrections to the above, and evolving discussion.)

Bonus topic: The December 23 meeting is cancelled,  Next meeting 
scheduled for January 6.

- Joseph

>
>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>

