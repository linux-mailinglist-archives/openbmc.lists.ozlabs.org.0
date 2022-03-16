Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8F64DB79B
	for <lists+openbmc@lfdr.de>; Wed, 16 Mar 2022 18:51:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJdBV5L5Mz30Dh
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 04:51:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RHRDxabe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RHRDxabe; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJdB14Ypdz305v
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 04:51:20 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22GFNqeA020284
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2022 17:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=OqDHE9f97662oMPtINe3UfCFy6POEYu+EP3AMfw65BE=;
 b=RHRDxabekiYk3BazUs9glZ5pTasVjU1tdLIhrWuF5qMho0GljZQBDWkViVxfrwrXDNhl
 KEpsPPlErHnDm94giNNFRQzIhNQI/OMx2DK+/5BTqKbSvcM4b67q18RwGyGSjEJYIZDT
 zLgG92x9wIBbv1KiNNos/+c/pDzFSdIRcunLzb0hCnBOIqmB8xM976D926UCBp0LTyJb
 at5WMpxPwlCGaSvkWFwUeJCwVAT+ryl369vLxGPsh2nlFaz5GJfXsNDwYA3AD5XP0ImD
 YLFlIm8RTW9X9ZhyPsGtIDQNvmXibjxPhP5dqvwNUDM8YO8jC76R7+K73ecVcfNwhhkI Pg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3euhjp4gg7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2022 17:51:17 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22GHm5PQ018707
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2022 17:51:16 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02dal.us.ibm.com with ESMTP id 3etaj722e5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2022 17:51:16 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22GHpEBT24707550
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2022 17:51:15 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF60A124058
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2022 17:51:14 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A127124052
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2022 17:51:14 +0000 (GMT)
Received: from [9.65.232.98] (unknown [9.65.232.98])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2022 17:51:14 +0000 (GMT)
Message-ID: <fcc5d68f-a8d7-e857-370d-d1bf9971d018@linux.ibm.com>
Date: Wed, 16 Mar 2022 12:51:11 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: Security Working Group meeting - Wednesday March 16 - results
Content-Language: en-US
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <bcdc1bcd-857c-9110-2ecc-aa3719ce1d10@linux.ibm.com>
In-Reply-To: <bcdc1bcd-857c-9110-2ecc-aa3719ce1d10@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TPzxLVebYr0nfO6iKOcBlrUzpsvMX0k8
X-Proofpoint-ORIG-GUID: TPzxLVebYr0nfO6iKOcBlrUzpsvMX0k8
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-16_07,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 mlxlogscore=533 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203160103
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



On 3/15/22 9:45 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday March 16 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
> and anything else that comes up:
>

Attended: Joseph, Ratan, James, Mark, Daniil, Dhananjay, Dick, Jiang


1 Please review the phosphor audit design 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/46023 
<https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/46023>and related 
code under https://github.com/openbmc/phosphor-logging 
<https://github.com/openbmc/phosphor-logging>directory phosphor-audit.

IBM is interested in working on  this.


We also discussed encrypting data like logs, and storing keys in a vault 
/ trust zone /  TPM.

See also encrypted volume https://github.com/openbmc/estoraged 
<https://github.com/openbmc/estoraged>


2 CNA work update

James is working on the OpenBMC vulnerability backlog.  First 
transferring each one to our private github issues database together 
with its reserved CVE.  James will share JSON-formatted CVEs with the 
security response team (SRT).  Currently working to upload/submit CVEs 
to mitre.  (Note these are not yet public.)

Helpful tools: formatted vulnerabilities using vulnogram.  Use  
Redhat’s  Cvelib Python-based tool

TODO: Joseph and Dhananjay (as the OpenBMC CNAs): get credentials from 
mitre to allow you to create CVEs.


-Joseph

> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph
>
>

