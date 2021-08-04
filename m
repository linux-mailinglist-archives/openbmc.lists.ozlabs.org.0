Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BEF3E0822
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 20:47:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gg12c5Gspz3cSP
	for <lists+openbmc@lfdr.de>; Thu,  5 Aug 2021 04:47:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mQtPv/qU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mQtPv/qU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gg12J1Shmz302N
 for <openbmc@lists.ozlabs.org>; Thu,  5 Aug 2021 04:47:35 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 174IYGbf037538
 for <openbmc@lists.ozlabs.org>; Wed, 4 Aug 2021 14:47:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=wAR35fpQaCI2pDKzqWY2XiSkzqY6u7ZD4eEyTMJusiM=;
 b=mQtPv/qUp21jxLALXFeiXlXHselRmS7QLIB1xI2VymydKlPplfgiTvGVgHGK5w8UBTR/
 gtb0zRpG7inEMK51DFyv70niiuneJtKwZeHjdzYAIyHGbGrM9AbII/STy39qj6Zrb1N4
 6V/NLXEJOWVd5BWtlWxz6V/mbrztoTIwLlzK76LUnh72428EDzs6hKblbhYe9mSezvmj
 nvyZLbSE6rH/G/aUKepcrPbkSWmI4DSJSyhh8DG37A4bAj2Einn1OrqBG+VlvvmxKSEa
 4Mit18gMl36NBimawpHJbFAEEHeGCxA7sPeFTOtRtmxzQDFsKPkzNFcTbUbASEpLbaiJ Uw== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a7cfcpkae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 04 Aug 2021 14:47:33 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 174IhAGE011098
 for <openbmc@lists.ozlabs.org>; Wed, 4 Aug 2021 18:47:33 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 3a7vv91rbr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 04 Aug 2021 18:47:33 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 174IlWP333358102
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 4 Aug 2021 18:47:32 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DB6412405A
 for <openbmc@lists.ozlabs.org>; Wed,  4 Aug 2021 18:47:32 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16121124058
 for <openbmc@lists.ozlabs.org>; Wed,  4 Aug 2021 18:47:32 +0000 (GMT)
Received: from demeter.local (unknown [9.160.63.222])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed,  4 Aug 2021 18:47:31 +0000 (GMT)
Subject: Re: Security Working Group meeting - Wednesday August 4 - results
To: openbmc@lists.ozlabs.org
References: <89b3524f-a1b3-513c-fc6a-1d888e479238@linux.ibm.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <638695c3-c0ac-1249-d3d1-fe2cf439432e@linux.ibm.com>
Date: Wed, 4 Aug 2021 13:47:31 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
In-Reply-To: <89b3524f-a1b3-513c-fc6a-1d888e479238@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bHfYbKQyKDDPaq7n8xKpNa4-X2ikenyU
X-Proofpoint-GUID: bHfYbKQyKDDPaq7n8xKpNa4-X2ikenyU
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-04_06:2021-08-04,
 2021-08-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108040110
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

On 8/3/21 5:57 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday August 4 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
> and anything else that comes up:
>
> 1. (Joseph): IBM ACF design (2FA authentication for the special IBM
>   service account) is in review -
>   https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/45201
> <https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/45201>

DISCUSSION: Joseph gave a brief overview with Q&A.


> 2. (Joseph): Updated password hash algorithm from MD5 to SHA512 (while
>   keeping the same cleartext password)
>   https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/45214
> <https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/45214>

DISCUSSION: Joseph gave a brief overview and mentioned the pre-requisite 
patch https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/45614 
<https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/45614>.  Please 
review!

(Note there is a related email thread for this.)

> 3. (Joseph): Change the SSH server per-session idle timeout to an hour
>   (was unlimited)?  (Sent idea to upstream project
>   yocto-security@yoctoproject.org
>   <mailto:yocto-security@yoctoproject.org>.)  Alternatively, update
>   both SSH and BMCWeb to 30 minutes.
>    1. Guidelines:
>        1. NIST SP800-63B requires a timeout of 30 minutes for
>           "assurance level 2" (high confidence that the authentication
>           is still valid), or 15 minutes for "assurance level 2" (very
>           high confidence).
>           https://pages.nist.gov/800-63-3/sp800-63b.html
>           <https://pages.nist.gov/800-63-3/sp800-63b.html>
>        2. OWASP suggests idle timeouts of 15-30 minutes.
> https://cheatsheetseries.owasp.org/cheatsheets/Session_Management_Cheat_Sheet.html#session-expiration
> <https://cheatsheetseries.owasp.org/cheatsheets/Session_Management_Cheat_Sheet.html#session-expiration>
>    2. Alternatively, use the bash shell’s TMOUT variable?
>    3. See Yocto discussion (representative archived email):
>       https://lists.yoctoproject.org/g/yocto-security/message/381
> <https://lists.yoctoproject.org/g/yocto-security/message/381>

DISCUSSION:

There was general agreement that OpenBMC should set a default idle timeout:

  *

    Must be able to configure each interface separately: SSH port 22
    (BMC command shell), SSH port 2200 (host console).

  *

    30 minutes was suggested for the command shell.

  *

    The BMC admin should be able to configure the timeout.  Need to
    check if there is a Redfish API or property for this.

  *

    The technology to have a timeout may be present in the SSH server,
    the underlying application (command shell, host console, etc.), or
    provided by an intervening program such as “screen”.

Joseph to follow up via email.

We also discussed the risks of allowing SSH at all.


Bonus topics:

4 Surya set up a bugzilla within Intel and will administer it.  Demo’d 
the database. We briefly examined the database fields and agreed it 
looks like a good start.

Who has access?: The security response team (see Joseph as admin).  Also 
the bug submitter and the bug fixer will have access to each of their bugs.


https://github.com/openbmc/docs/blob/master/security/obmc-security-response-team.md 
<https://github.com/openbmc/docs/blob/master/security/obmc-security-response-team.md>

Side discussion: Can we add a security responder from Nvidia?  Yes, 
first review See 
https://github.com/openbmc/docs/blob/master/security/obmc-security-response-team-guidelines.md#team-composition-and-email-maintenance 
<https://github.com/openbmc/docs/blob/master/security/obmc-security-response-team-guidelines.md#team-composition-and-email-maintenance>

  And then petition the TSC via email: 
https://github.com/openbmc/openbmc#technical-steering-committee 
<https://github.com/openbmc/openbmc#technical-steering-committee>.


5 How to escalate bugs reported to the security response team?

DISCUSSION: We briefly discussed this as the meeting time was past the 
end.  It is hard to make people fix bugs.  Ideas: keep sending reminder 
emails, and try to get someone to fix the bug.



>
>
>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph

