Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C23165333
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 00:51:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NDyw2Cz4zDqS0
	for <lists+openbmc@lfdr.de>; Thu, 20 Feb 2020 10:51:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NDyF0NGdzDqQR
 for <openbmc@lists.ozlabs.org>; Thu, 20 Feb 2020 10:51:16 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01JNnGgE082962
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 18:51:13 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y8ubugvnf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 18:51:13 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01JNnxFu011259
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 23:51:12 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02wdc.us.ibm.com with ESMTP id 2y6896qw24-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 23:51:12 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01JNpCUf51446226
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 23:51:12 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38991124054
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 23:51:12 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C1FF124053
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 23:51:12 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.252])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 19 Feb 2020 23:51:12 +0000 (GMT)
Subject: Re: Security Working Group meeting - Wednesday Feb 5 - summary results
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <6cfb1c25-14b6-ca76-b917-3bda22ff1ce1@linux.ibm.com>
Message-ID: <908dcee2-f7ef-4059-4731-b41c5fde0a35@linux.ibm.com>
Date: Wed, 19 Feb 2020 17:51:11 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <6cfb1c25-14b6-ca76-b917-3bda22ff1ce1@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-19_07:2020-02-19,
 2020-02-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002190173
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

On 2/5/20 10:06 AM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday Feb 5 at 10:00am PDT.

These are the notes from the previous meeting that was held on 
2020-02-05 -- 2 weeks ago.


>
> We'll discuss current development items, and anything else that comes 
> up.  The current topics:
>
> 1. Moving forward with security assurance work at the OpenBMC project 
> level.  ("How do we know what is most important to work on?")  Review 
> steps forward.

There was general agreement that the list of assurance schemes in thew 
security working group wiki is a good start.

>
> 2. BMCWeb intermediate site identity certificates.

https://lists.ozlabs.org/pipermail/openbmc/2020-January/020321.html
After looking at the code, we figured BMCWeb had no way to present 
intermediate site identity certificates, but support could be added.
The next steps areto complete the investigation, push up an enhancement 
if needed, and document how users can provision the BMC with their 
intermediate certs. Created https://github.com/openbmc/bmcweb/issues/116
>
> 3. BMCWeb account management privilege changes (following the latest 
> Redfish spec) allow account enumeration.

This was pursued (see the minutes).  After the meeting, the outcome was 
learned: Refish did not intend this.  A non admin user will get only 
their own account.  A Redfish spec change will clarify this.

>
> 4. BMCWeb address CWE-307 (unlimited password guessing) via 
> rate-limiting authentication attempts.

The project currently has no such protection, so this seems like a good 
approach.

Have we considered blocking by IP address?  Considered progressively 
longer timeouts? Considered the pam_abl module or PAM modules that 
require MFA?

If an LDAP server is used, it may not allow enumeration of its users, 
which would make this a non-issue for this use case.  Does this apply 
only to local users? (ANSWER: Yes).

There are various disparate use cases including: rate-limiting (as 
proposed here), account lockouts (traditional pam_tally2 solution), 
password reset required, and notifying the admin … just to name a few 
use cases.  I (Joseph) am going for a default least-common-denominator 
solution into the project that the BMC can provide without requiring 
additional elements such as 2FA servers.


This was re-discussed in more depth in the 2020-02-19 meeting.

>
> 5. Discuss progress in setting up an alternate meeting time.

Joseph will followup in the email list.  I (Joseph) think an early 
morning (like 2am CDT) would work for Australia, China, India, and 
Europe.  (See subsequent emails.) The next step is to identify core 
individuals and set up a meeting time.

>
> Access, agenda, and notes are in the wiki:
>
> https://github.com/openbmc/openbmc/wiki/Security-working-group
>
> - Jose 

- Joseph

