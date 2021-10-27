Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6639443D175
	for <lists+openbmc@lfdr.de>; Wed, 27 Oct 2021 21:11:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfdbT2PFVz2ymg
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 06:11:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kXo8Wksq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kXo8Wksq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hfdb066XSz2yKZ
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 06:11:23 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RHrLuh006691; 
 Wed, 27 Oct 2021 19:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : from : to : references : cc : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=g5Zj20EbRnKSF1/4p2lrjhaIekJLRSrTVUCZg/+Jo2M=;
 b=kXo8Wksqe8xj3pB1CKpFCAw2IkVr0v0tq+LTLSg19OQuEHkUWRWToBS3N+79G+pqjzsu
 Sc6yqPnkVioAnJ8JW+q0qIviBnaFko62ygh1R1DfEKruS9fgmNz/suRD3bl7V8Qshig5
 jK6rZY5L6JOWwIH1wFgco3TwwDAMiErfvX32VpvW9SDVmz2EAMhEEDxtb0cFolR+MVhj
 RJcVDOPGFsuiLnSyRM21VTHJXc/A64Kt+/yVD0DtVObm2xLIKIRb3mQGLO3WN18SKPGw
 xix5zZ4t83X+VmNsQ9nCCk5INvZqFZaWGGImh5yzJ6TfkEv6RyKTKVP2oJUQJ693fo5b Qg== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bybjksef3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Oct 2021 19:11:19 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19RJ3rWd031107;
 Wed, 27 Oct 2021 19:11:19 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 3bx4f0scq3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Oct 2021 19:11:19 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19RJBHqr19464874
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 19:11:17 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF723BE051;
 Wed, 27 Oct 2021 19:11:17 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5046CBE04F;
 Wed, 27 Oct 2021 19:11:17 +0000 (GMT)
Received: from [9.77.132.135] (unknown [9.77.132.135])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 27 Oct 2021 19:11:17 +0000 (GMT)
Message-ID: <58aa5187-9b0a-7c65-f058-79f749287bb1@linux.ibm.com>
Date: Wed, 27 Oct 2021 14:11:15 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: Security Working Group - Wednesday October 27 - results
Content-Language: en-US
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <d0b57999-f452-5239-ccd1-3823fc551a30@linux.ibm.com>
In-Reply-To: <d0b57999-f452-5239-ccd1-3823fc551a30@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: IpiYz_MmMYcEwdaV4r2NdDSfTlhlJR4_
X-Proofpoint-GUID: IpiYz_MmMYcEwdaV4r2NdDSfTlhlJR4_
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-27_05,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxlogscore=999 adultscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110270108
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

On 10/26/21 8:12 AM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday October 27 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
> and anything else that comes up:
>
> 1.Changing the os-release BUILD_ID back to its default value of 
> DATETIME (recipe os-release.bb) - 
> https://lore.kernel.org/openbmc/CAH2-KxB6P2HTE5iqJMx1Gwrrq_w2-gXCZ47ZXaO_x5kZ2RAzCg@mail.gmail.com/T/#m0065dab191fe8048ea02ab3c28b31362252f7622 
> <https://lore.kernel.org/openbmc/CAH2-KxB6P2HTE5iqJMx1Gwrrq_w2-gXCZ47ZXaO_x5kZ2RAzCg@mail.gmail.com/T/#m0065dab191fe8048ea02ab3c28b31362252f7622>(background 
> reference: https://man7.org/linux/man-pages/man5/os-release.5.html 
> <https://man7.org/linux/man-pages/man5/os-release.5.html>).
>
> Will the builder need to supply BUILD_ID to maintain a stable (aka 
> deterministic, aka reproducible) build?
>

Attended: Joseph R, Bruce Mitchell, Vernon M, Jiang Zhang, Dhananjay 
Phadke, James Mihm


The meeting ran about 25 minutes overtime (1h 25m total).


1 FYA: Changing the os-release BUILD_ID back to its default value of 
DATETIME (recipe os-release.bb) - 
https://lore.kernel.org/openbmc/CAH2-KxB6P2HTE5iqJMx1Gwrrq_w2-gXCZ47ZXaO_x5kZ2RAzCg@mail.gmail.com/T/#m0065dab191fe8048ea02ab3c28b31362252f7622 
<https://lore.kernel.org/openbmc/CAH2-KxB6P2HTE5iqJMx1Gwrrq_w2-gXCZ47ZXaO_x5kZ2RAzCg@mail.gmail.com/T/#m0065dab191fe8048ea02ab3c28b31362252f7622>(background 
reference: https://man7.org/linux/man-pages/man5/os-release.5.html 
<https://man7.org/linux/man-pages/man5/os-release.5.html>).

 1.

    Will the builder need to supply BUILD_ID to maintain a stable (aka
    deterministic, aka reproducible) build?

 2.

    https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/48204
    <https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/48204>

 3.

    https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/48205
    <https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/48205>

DISCUSSION:

This was resolved: the project defaults are not being changed.


2 (Joseph, followup): discuss progress toward (1) using github 
advisories, and (2) the Security Response Team’s (SRT) using a private 
github issues database.

DISCUSSION:

This was discussed at two separate times during the meeting.  The first 
discussion notes:

Must test, e.g., no leaks to discord.

The second discussion notes:

To clarify: the private database is needed by the OpenBMC security 
response team (SRT) to organize the security problems which were 
reported and are not yet made public.  For background, see: 
https://github.com/openbmc/docs/blob/master/security/how-to-report-a-security-vulnerability.md 
<https://github.com/openbmc/docs/blob/master/security/how-to-report-a-security-vulnerability.md>

Access to the database would be given to the Openbmc SRT members, plus 
access to each issue is given to the problem reporter and the people 
working on that problem.

Please reply to the email thread “start using github security 
advisories” Oct 13-18.  Example: 
https://lore.kernel.org/openbmc/cd2f6175-475f-0e5a-0b65-4f7a12959ab6@linux.vnet.ibm.com/ 
<https://lore.kernel.org/openbmc/cd2f6175-475f-0e5a-0b65-4f7a12959ab6@linux.vnet.ibm.com/>

We resolved to create the issues database and test it with real but 
well-known vulnerabilities.

We also discussed how the project handles Linux kernel security issues, 
like how we fix CVEs:

  *

    Joel Stanley is active in this area - https://github.com/openbmc/linux/

  *

    Our security wiki
    (https://github.com/openbmc/openbmc/wiki/Security-working-group)
    describes how: Yocto security
    <https://wiki.yoctoproject.org/wiki/Security>efforts flow directly
    into the OpenBMC project.  For example, Yocto puts security fixes
    into its fix branches.


3 Continued discussion: IPMI password over DTLS

DISCUSSION:

Per Vernon, Opaque is not mature and Intel prefers SCRAM or sending 
cleartext username+password through the secure channel (similar to basic 
auth https://en.wikipedia.org/wiki/Basic_access_authentication 
<https://en.wikipedia.org/wiki/Basic_access_authentication>).

Could use scram.  Preferred because it can detect man in the middle 
attack via channel binding.

Looking for scram implementation.

Will add to https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/31548 
<https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/31548>

Staging question: Do we need a protocol to support certificate auth, vs 
password auth via basicAuth or scram?

Would DTLS remove RMCP+’s 20 character password limit.  Yes.


4 Questions about: Password strength (cleartext), lockout after failed 
password attempts

DISCUSSION:

See AccountLockoutDuration and AccountLockoutThreshold in the 
https://github.com/openbmc/openbmc/wiki/Configuration-guide 
<https://github.com/openbmc/openbmc/wiki/Configuration-guide>

See  MinPasswordLength property in 
https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/account_service.hpp 
<https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/account_service.hpp>

Which is brought into the BMC image via recipe: 
https://github.com/openbmc/openbmc/blob/master/poky/meta/recipes-extended/pam/libpam/pam.d/common-auth 
<https://github.com/openbmc/openbmc/blob/master/poky/meta/recipes-extended/pam/libpam/pam.d/common-auth>and 
is customized by OpenBMC here: 
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-extended/pam/libpam/pam.d/common-auth 
<https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-extended/pam/libpam/pam.d/common-auth>with 
pam_tally2 docs here: 
https://man7.org/linux/man-pages/man8/pam_tally2.8.html 
<https://man7.org/linux/man-pages/man8/pam_tally2.8.html>  for example, 
“even_deny_root”.

Do these policies apply to root users?  It doesn’t look like it, per 
https://github.com/openbmc/openbmc/blob/2b59705148feb8ca6aafd9cf050229b069284515/meta-phosphor/recipes-extended/pam/libpam/pam.d/common-auth#L11 
<https://github.com/openbmc/openbmc/blob/2b59705148feb8ca6aafd9cf050229b069284515/meta-phosphor/recipes-extended/pam/libpam/pam.d/common-auth#L11>

Ideally remove root user logins.

We discussed using Linux “capabilities” so we don’t need root (uid=0) 
processes.

Is this general topic (“https://github.com/openbmc/openbmc/issues/3383 
<https://github.com/openbmc/openbmc/issues/3383>”) important enough to 
escalate to the Technical oversight  forum (TOF)?



>
>
>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph

