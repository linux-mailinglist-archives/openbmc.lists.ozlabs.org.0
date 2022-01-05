Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A85B0485BA4
	for <lists+openbmc@lfdr.de>; Wed,  5 Jan 2022 23:30:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JTkgs3ZrRz2yZh
	for <lists+openbmc@lfdr.de>; Thu,  6 Jan 2022 09:30:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QxoR1g+T;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QxoR1g+T; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JTkgN4w61z2yQH
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jan 2022 09:29:35 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 205LEcjc003056
 for <openbmc@lists.ozlabs.org>; Wed, 5 Jan 2022 22:29:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=IavowvYoOdPGCXyUa+hXc4j/S51l0siWldG0OxSu+i8=;
 b=QxoR1g+T8JrCLIMk5DuBaKt9RrSrfr03dDpiVJ2rEmHxDnj9E+H09z/vWvj1gs0FE9+V
 Dap+EIIAzVqteDFiuKVxa1gKeclV1B2I2c9mndYpy0YLd9nP2AiuN7vnlBp9rTHqGZh3
 mqo4At9uvjgdUipsrqu8hsREvqkydiig67F4Wc6xBAImmMTB+r/SBpRyuCSioayLs3qy
 XQWpFCIeJYXR09Fqqs2+yCTeGlRUUdSLzxkG8nGOPayqI05X8Cf5fL1KLaAsG69PgQ5r
 cvplKS9tv0ZlmBhlas2y1TUGM7tp4Ei2EtPmbfRq97n+HGiYAfcyGYpQEBwKrE1PwZq5 tw== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcen892cg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 05 Jan 2022 22:29:31 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 205MQp6e016672
 for <openbmc@lists.ozlabs.org>; Wed, 5 Jan 2022 22:29:30 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 3daekbsav4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 05 Jan 2022 22:29:30 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 205MTTrM17629684
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 5 Jan 2022 22:29:29 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD23EC6055
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jan 2022 22:29:29 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 716BAC6059
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jan 2022 22:29:29 +0000 (GMT)
Received: from [9.160.92.126] (unknown [9.160.92.126])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jan 2022 22:29:29 +0000 (GMT)
Message-ID: <c25985ea-279f-ed71-7924-6cdcbd07b398@linux.ibm.com>
Date: Wed, 5 Jan 2022 16:29:28 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: Security Working Group meeting - Wednesday January 5 - results
Content-Language: en-US
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <d36d0990-7c00-bf7d-890b-82e12687d395@linux.ibm.com>
In-Reply-To: <d36d0990-7c00-bf7d-890b-82e12687d395@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: foSr0InGD_-BTE7DtKT_Q0KHT66MmxxB
X-Proofpoint-GUID: foSr0InGD_-BTE7DtKT_Q0KHT66MmxxB
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_07,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 mlxlogscore=975 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201050140
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

On 1/5/22 11:42 AM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday January 5 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
> and anything else that comes up:
>

Attendance: Joseph R, James M, Dick W, Ratan G, Dhananjay P


1 We discussed some current topics:

1a email thread subject: meta-phosphor: enable `allow-root-login`

We discussed the prospect of moving away from root logins and creating a 
new “admin” userid and then how that admin user would get the root 
access they needed to run commands like busctl and systemctl.  We 
discussed solutions including Restricted bash and sudo.

Note that all processes run as root, and work for “daemon privilege 
separation” needs help, see 
“https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/49100 
<https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/49100>and related 
code reviews.


1b gerrit review “Disallow no-access user login” (the NoAccess role) 
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/49295 
<https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/49295>and 
https://github.com/openbmc/bmcweb/issues/227 
<https://github.com/openbmc/bmcweb/issues/227>

A NoAccess user can login but cannot logout.  There seem to be two ways 
to fix this.


2 The OpenBMC security response team wants to use the github security 
tabs, and is looking for best practices. 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/50115 
<https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/50115>

How can the OpenBMC SRT get authority to publish security advisories on 
github? What are the best practices?  What repo should be used?  
openbmc/openbmc?  openbmc/security-response?  A new repo 
openbmc/security-advisories?

See 
https://docs.github.com/en/organizations/managing-access-to-your-organizations-repositories/repository-roles-for-an-organization 
<https://docs.github.com/en/organizations/managing-access-to-your-organizations-repositories/repository-roles-for-an-organization>


3 The OpenBMC security response team is working to become a Mitre CNA 
(see minutes from 2021-12-22 meeting) so they can have better control 
over CVEs for the OpenBMC project.

James to follow up questions with Mitre.

See CVSS scoring example doc https://www.first.org/cvss/v3.1/examples 
<https://www.first.org/cvss/v3.1/examples>


>
>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph

