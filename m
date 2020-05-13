Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 493701D21B0
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 00:04:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Mpcj5SXQzDqbF
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 08:04:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Mpbt2clSzDqZP
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 08:04:09 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04DM46X6122886
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 18:04:07 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3101kp2xtx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 18:04:04 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04DLxkBB014404
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 22:04:00 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 3100ub9v3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 22:04:00 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04DM3xpZ52298016
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 22:03:59 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 93050AE0B2
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 22:03:59 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DA79AE0AC
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 22:03:59 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.153.254])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 22:03:59 +0000 (GMT)
Subject: Security Working Group - Wednesday May 13 - results
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <d63ad17c-0cf5-5767-84da-147c1d6d3e58@linux.ibm.com>
Message-ID: <d2d98780-8f7e-c2d0-5477-127bffabc475@linux.ibm.com>
Date: Wed, 13 May 2020 17:03:58 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d63ad17c-0cf5-5767-84da-147c1d6d3e58@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-13_09:2020-05-13,
 2020-05-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0
 cotscore=-2147483648 mlxlogscore=999 adultscore=0 clxscore=1015
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005130184
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

On 5/12/20 12:58 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday May 13 at 10:00am PDT.
>
> We'll discuss current development items, and anything else that comes up.
>
> The current topics:
>
> 1. Note: concurrent OCP virtual summit.
Decided to hold the security working group meeting regardless of 
concurrent OCP virtual summit.
>
> 2. Discuss SELinux email use cases (email). 
Discuss SELinux email use cases - 
https://lists.ozlabs.org/pipermail/openbmc/2020-April/021477.html

Manoj led us through SELinux email use-cases.  SELinux can help control 
access so we (OpenBMC contributors) restrict access to those processes 
that should have access:


(Joseph disclaimer): I tried to summarize the use cases as Manoj walked 
through them.  This is a summary only.  Please refer to the email chain.

Use cases:

2-1 NBD (network block device) is used to offload dumps on POWER 
systems.  It reads from PLDM source and writes to NBD device.  Control 
who has write access to the NBD device.

2-2 All processes running root can write to config files under the /etc 
directory.

2-3 All processes can control use of systemctl command.

2-4 All processes can write to the journal (journald).

2-5 All processes can use network tcp and udp ports - port-based 
firewall capability.

2-6 D-Bus service names (paths under /xyz/openbmc_project/*)

2-7 D-Bus message passing - hardening D-Bus communication

2-8 Map existing roles (Administrator, Operator, etc.) to SELinux.  
Assign SELinux label based on ingress vector (serial line vs SSH vs REST 
login).  Uses PAM-selinux config files.

2-9 System calls. For example, disable ptrace.

2-10 Run user executing capabilities.  executables only from specific 
paths, for example, don’t allow running programs from /tmp


Next steps: Compare AppArmor vs SELinux.  Consider Cost/benefit.

- Prioritize the benefits (as listed above).

- Consider costs including: developer time (person-months), BMC 
resources (flash size and memory requirements, BMC performance).

- Also consider the cost of future development, for example consider the 
complications for a developer who is not skilled in security practice: 
adding a security-relevant function (or entirely new service) or 
adapting a service for different use cases.  They can either struggle 
with getting the security controls correct, or accidentally create a 
security hole.


U-Boot focus: Interaction between SELinux and U-Boot (commands like 
fw_setenv)?  For example: functions for factory reset and select BMC 
boot source (such as for BMC firmware update) use the fw_setenv command 
(or underlying mechanism).  Are these functions the only ones who should 
be allowed to access the fw_setenv function?

Related side topic: Protect unattended BMC boot.  Can we harden U-Boot 
itself?


Anton is considering an alternative to apparmor and selinux: KRSI: 
Kernel Runtime Security Instrumentation


Next steps: prioritize which benefits we want.  Followup in email.

> 3. Experimental bmcweb prototype for authentication rate-limiting. 

https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/31841

Joseph briefly walked through the review and talked about Linux-PAM 
issues and alternatives like pam_abl.

Feedback was: Looks right.

> 4. The security wiki now links to OpenBMC's threat models. 

No discussion.


> 5. Are there security considerations in using the fwupd tool? 

No discussion.

> 6. Do we have requirements for BMC admins to disable specific crypto 
> ciphers?
That is, allowing the BMC admin to disable ciphers 
https://lists.ozlabs.org/pipermail/openbmc/2020-May/021619.htmlThis 
seems useful, but nobody jumped up to do it.

Drawbacks: implementation cost.  For example: do we try to prevent the 
admin from removing all supported algorithms so that are none left to 
connect to?


BONUS AGENDA ITEMS:

7 Requirements for security audit log - 
https://lists.ozlabs.org/pipermail/openbmc/2020-May/021640.html

Joseph walked through the email.


8 (Bonus topic) We need a better meeting time for India, Zurich, and others.

Joseph revived the email thread 
https://lists.ozlabs.org/pipermail/openbmc/2020-May/021641.html

Next step is for two people to agree on a meeting time.

- Joseph

>
> Access, agenda, and notes are in the wiki:
>
> https://github.com/openbmc/openbmc/wiki/Security-working-group
>
> - Joseph

