Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F15C9832D
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 20:37:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DGcS3Rd5zDqsb
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 04:37:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DGbl2xNqzDqhF
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 04:37:06 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7LIH1LU025806
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 14:37:04 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uh92ynpt3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 14:37:03 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7LIZwf5003728
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 18:37:03 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02wdc.us.ibm.com with ESMTP id 2ugqwud62s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 18:37:03 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7LIb2ww52822390
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 18:37:03 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E069EAC05B
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 18:37:02 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3DB9AC059
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 18:37:02 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 18:37:02 +0000 (GMT)
Subject: Re: Security Working Group - Wednesday August 21 - results
To: openbmc@lists.ozlabs.org
References: <418a2d9f-375d-d5ec-6e3f-ae81b26a0e2a@linux.ibm.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <05280387-c4fd-73ba-110c-33bd8e966e3c@linux.ibm.com>
Date: Wed, 21 Aug 2019 13:37:02 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <418a2d9f-375d-d5ec-6e3f-ae81b26a0e2a@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-21_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908210181
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



On 8/19/19 1:58 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday August 21 at 10:00am PDT.
>
> Current topics:
> - Development work:
>  + expired password design
>  + phosphor-audit design
> - Recent discussion of CVEs that apply to OpenBMC

Meeting held 2019-08-21:


Note: The 2019-09-04 meeting is cancelled. Next meeting: 2019-09-18.  
See notes for details.



1.

Current development items:

- Expired password design: 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/23849 and email -- 
joseph discussed - no comments

- Auditing user actions: 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/23870 -- no comments

- Prevent overlay filesystem corruption: 
https://lists.ozlabs.org/pipermail/openbmc/2019-August/017704.html -- 
general agreement that filesystem overlays are problematic, and we 
should move to a model where we don’t need overlays, and just mount 
read-write file systems as needed.

- Nancy mentioned they are reviewing security features related to the 
Nuvaton BMC boot ROM and boot block.


2.

There was a question about flashing the firmware (host, and similarly BMC).

- The current OpenBMC firmware update is described here: 
https://github.com/openbmc/docs/blob/master/code-update/code-update.md

- There is interest in using Redfish support for this.(Use the email 
list to follow up.)


3.

We discussed “verified boot” and “One Time Programmable” (OTP) memory to 
hold secret keys needed to establish a root of trust.We talked about 
Aspeed’s AST2500 and AST2600 support for this.  Designs are coming soon!


4.

Joseph: Review level of effort in handling CVEs 
(https://lists.ozlabs.org/pipermail/openbmc/2019-August/017578.html).

- Dick mentioned how this works in the UEFI project...following 
responsible disclosure guidelines:

   + We can freely discuss CVEs, issues, and fixes when fixes are available.

   + However, if someone asks about a CVE or an issue for which we don’t 
have a fix, ideally we would not respond to the problem, not even to say 
that we were invoking the OpenBMC security response team 
(https://github.com/openbmc/docs/blob/master/security/how-to-report-a-security-vulnerability.md).Then 
followup with the response team.

- Dick mentioned that the information embargo period for security fixes 
is 6 months.This gives time for the fixes to be built, tested, deployed, 
and activated.

- TODO: Joseph will propose similar guidelines for the response team.


5.

Joseph: Added web security wish list items (under 
https://github.com/openbmc/openbmc/wiki/Security-working-group#security-feature-wish-list).There 
were no comments.


6.

We elected to cancel the Sep 4 meeting and meet again on Sep 18 because 
of the Open Source Firmware Conference (OSFC ~ https://osfc.io/).


7.

Joseph gave highlights from attending the Blackhat conference 
(https://www.blackhat.com/us-19/) related to firmware security.He plans 
to send an email with details.


- Joseph

> Access, agenda, and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group
>
> - Joseph

