Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0520E46DBDC
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 20:14:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8RgH6tBpz3bW6
	for <lists+openbmc@lfdr.de>; Thu,  9 Dec 2021 06:14:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cftNaKUe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cftNaKUe; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8Rft0zxfz2xfN
 for <openbmc@lists.ozlabs.org>; Thu,  9 Dec 2021 06:14:13 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B8IbdSC012803
 for <openbmc@lists.ozlabs.org>; Wed, 8 Dec 2021 19:14:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=hUCThIdgMPDCCBgOinNp7vvHkHEF4D66g2WgcO2wH+E=;
 b=cftNaKUeW0VhYWG3QgKpavhs8I6UKsZG3jU32wrxltPPVJl8iZElZk15sDPJDHgUrgG0
 oSo4dIibQz0qjoijQBbFkyZyKg4UuvYmzTmrhjLbqJtyScvTvjamctDXr0bixw/f3rkG
 0MsBedDAeALynjrfdTIvOIHymyeHWQKno2Y+Ty2dbwu4J1rBffvbg7FY0OJiPOrx1Bl6
 3Y9mXqwmRvraAX3MV4+PKLBsfTFwf/mUIGi7zqqoHu0iMvoQrZPbrMmZETOIre41YRbx
 LcP1Oymb+pTo8VtTsrv1V7wJDlvjij6BMyogfOAf9c+NTOYrGIfqKgRLMPdKxXwxCJUW Ww== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cu0hmtrtd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 08 Dec 2021 19:14:10 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B8JDq3v028920
 for <openbmc@lists.ozlabs.org>; Wed, 8 Dec 2021 19:14:09 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma05wdc.us.ibm.com with ESMTP id 3cqyyb8rpd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 08 Dec 2021 19:14:09 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B8JE8oO15466944
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 8 Dec 2021 19:14:08 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA405C60CD
 for <openbmc@lists.ozlabs.org>; Wed,  8 Dec 2021 19:14:07 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FDBFC60F4
 for <openbmc@lists.ozlabs.org>; Wed,  8 Dec 2021 19:14:02 +0000 (GMT)
Received: from [9.65.197.216] (unknown [9.65.197.216])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed,  8 Dec 2021 19:14:02 +0000 (GMT)
Message-ID: <64bef7b7-2dae-056c-98dc-696b864f4fb7@linux.ibm.com>
Date: Wed, 8 Dec 2021 13:14:01 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: Security Working Group meeting - Wednesday December 8 - results
Content-Language: en-US
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <0abb0557-9797-cd8e-1d21-bc8abf24d7ad@linux.ibm.com>
In-Reply-To: <0abb0557-9797-cd8e-1d21-bc8abf24d7ad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qWdVNfguN_TfjJnDNbynurNPKTcJ9mtA
X-Proofpoint-ORIG-GUID: qWdVNfguN_TfjJnDNbynurNPKTcJ9mtA
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-08_07,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112080108
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

On 12/7/21 3:55 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday December 8 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
> and anything else that comes up:
>

Attendance: James, Joseph, Anton, Dhananjay, Ratan


1 OpenBMC CNA onboarding

DISCUSSION:

James started the process to onboard the OpenBMC project as a CNA.  (See 
agenda item 2 from 2021-11-10.)   Onboarding process is next week for 
James, Joseph, and Dhananjay.

Onboarding time commitment: unknown  -  watch  videos

Here are the training links:

please view the six on-boarding videos, available on the CNA On-Boarding 
Channel on YouTube--> Click 
here<https://www.youtube.com/playlist?list=PLWfD9RQVdJ6c4eMkdqbOKqF7zPCqXkgX3 
<https://www.youtube.com/playlist?list=PLWfD9RQVdJ6c4eMkdqbOKqF7zPCqXkgX3>>


   1.  CVE Program Overview

   2.  Becoming a CNA

   3.  CNA Processes

   4.  Assigning CVE IDs

   5.  CVE Record (previously “CVE Entry”) Creation

   6.  CVE Record Submission Process to the MITRE Top-Level Root Only

      *   CVE Record (previously “CVE Entry”) GitHub Submissions


Softcopies of the presentations are available here  
(https://www.cve.org/ResourcesSupport/Resources#CVENumberingAuthorities 
<https://www.cve.org/ResourcesSupport/Resources#CVENumberingAuthorities>)


2 Daemon privilege separation design doc for review 
<https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/49100>(PoC 
<https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/42748>change for 
ACLs)

DISCUSSION:

This is a multi-stage project, and having a design will make it easier 
to move forward.

Next steps:

  *

    approve design doc (need reviewers),

  *

    then write acl rules

  *

    Then change process to an unique user

  *

    List all services which need to participate  - all D-bus service
    owners and clients

  *

    Move to a role-based approach?

Idea: Complete the privilege separation work for a service to use as a 
model for other services.  When this is done, repo maintainers will have 
an easier time to understand what changes are needed.

We briefly talked through an example set of rules for bmcweb and  ipmid 
talking to phosphor-user-manager.


3 Move meeting earlier by 1 hour?  Let’s renegotiate the meeting time.


4 Progress on BMC secure boot?

AST2600 hardware secure U-boot  boot, then secure booting the Linux 
kernel. No additional pieces.

See the AST security guide.  How is signing-key management done?

Dhananjay to  follow up.



Joseph


>
>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph

