Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A83D3A2104
	for <lists+openbmc@lfdr.de>; Thu, 10 Jun 2021 01:45:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G0kHb1NLqz3bs2
	for <lists+openbmc@lfdr.de>; Thu, 10 Jun 2021 09:45:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ML8PhCXN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ML8PhCXN; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G0kHD1LH3z2ymb
 for <openbmc@lists.ozlabs.org>; Thu, 10 Jun 2021 09:44:55 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 159NWb0x045635
 for <openbmc@lists.ozlabs.org>; Wed, 9 Jun 2021 19:44:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to :
 references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=9aIL5c7e0ThlHzzvB7mCBN/NaS+93AIN8DnGmsJTMxg=;
 b=ML8PhCXNtQcHIIcBu5Qcs7oIpLDH5UgLTERfJTNchJFzi8cTAPIsz/+/2kzRlrqgXcVr
 50bB7Os7Mu1crZ3raORmZT52u9dBG+Fgmix4ChwJh6i3w6FQ+o7LcvtmfsbRbKyM/tBk
 TCjys2znQOvaIYyCbzTftJACPD1QiYkBs9cb1tgCyUYFCw/BlXviyEC6CZGtrNMDr75+
 k1Bb7v7i3E2MDP1zU2Df2ko2kqPl1K+9S+BqjkWkZBXvDQzxWz4NXYLmhSLnjSGIvyJ6
 3axNESOf0CFn2btNFHChNErvuLDbuwnUjYT1djMaPoJ2jCTutbc2EiNCFTQERtPuw+2J pA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3937b2gaff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 09 Jun 2021 19:44:52 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 159Nboc3008641
 for <openbmc@lists.ozlabs.org>; Wed, 9 Jun 2021 23:44:51 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 3900wb4f34-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 09 Jun 2021 23:44:51 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 159Nioh824969578
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 9 Jun 2021 23:44:50 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5362E78060
 for <openbmc@lists.ozlabs.org>; Wed,  9 Jun 2021 23:44:50 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04B127805C
 for <openbmc@lists.ozlabs.org>; Wed,  9 Jun 2021 23:44:49 +0000 (GMT)
Received: from demeter.local (unknown [9.65.208.95])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed,  9 Jun 2021 23:44:49 +0000 (GMT)
Subject: [SecurityWorkGroup] Security Working Group meeting - Wednesday June 9
 - results
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <c725fe55-cebc-849e-5424-71f894cc0359@linux.ibm.com>
Message-ID: <f8946364-d721-dd9d-03ad-e58e8e263aa4@linux.ibm.com>
Date: Wed, 9 Jun 2021 18:44:48 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
In-Reply-To: <c725fe55-cebc-849e-5424-71f894cc0359@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BIMCXSsqzYdO9Cu_1haAB5b7c0rfnscv
X-Proofpoint-ORIG-GUID: BIMCXSsqzYdO9Cu_1haAB5b7c0rfnscv
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-09_07:2021-06-04,
 2021-06-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106090126
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

On 6/9/21 9:14 AM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday June 9 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
> and anything else that comes up:
>
> 1. (Joseph) Updated the wiki “Purpose” section.
> 2. (Joseph) Will resume recording meeting attendance
> 3. (Joseph) Cancel the July 7 meeting (US Holiday)?  Interest in 
> someone else running?  And possibly scheduling for daytime in 
> Australia/China/India?
> 4. (Discord discussion June 3) Interest in BMC command line via BMC 
> web interface.  See 
> https://github.com/openbmc/obmc-console/issues/17.  IBM’s interest 
> here: https://github.com/ibm-openbmc/dev/issues/2243.
> 5. (gerrit review) BMCWeb change affects login/authentication function 
> “Move Sessions to non Node structure” 
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/43759

This email has a new tag in the subject line to better identify its 
content.  I intend to use [SecurityWorkGroup] consistently on future 
emails.  Let me know how you like it.

Here are the results of today's discussion.

Attendance:

 1.

    Prof. Dick Wilkins

 2.

    Jiang Zhang

 3.

    Surya

 4.

    Bruce Mitchell

 5.

    Daniil Egranov Arm

 6.

    Joseph Reynolds

 7.

    Dhananjay MSFT

 8.

    James Mihm



1 Updated the wiki “Purpose” section.  Specifically

https://github.com/openbmc/openbmc/wiki/Security-working-group#purpose 
<https://github.com/openbmc/openbmc/wiki/Security-working-group#purpose>

No discussion.


2 Will resume recording meeting attendance

Discussion: good idea


3 Cancel the July 7 meeting?  Interest in someone else running?  And 
possibly scheduling for daytime in Australia/China/India?

Discussion: The US-based attendees agreed to cancel.

I (Joseph reynolds) would be happy to have someone else run the 
meeting.  There was interest in having the meeting sometime when people 
from Australia/China/India time zones could attend.


4 Interest in BMC command line via BMC web interface.  See 
https://github.com/openbmc/obmc-console/issues/17 
<https://github.com/openbmc/obmc-console/issues/17>.  IBM’s interest 
here: https://github.com/ibm-openbmc/dev/issues/2243 
<https://github.com/ibm-openbmc/dev/issues/2243>.

No discussion.


5 (gerrit review) BMCWeb change affects login/authentication function 
“Move Sessions to non Node structure” 
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/43759 
<https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/43759>

No discussion.  Joseph plans to review.


6 (Discord discussion) Do we need a more general way to support Redfish 
PrivilegeRegistry SubordinateOverrides.  Per discord discussion June 3, 
June 9:

 1.

    Sunitha EthernetInterface SubordinateOverride questions

 2.

    Described in Redfish spec DSP0266 "Security details > Authorization
     > Redfish service operation-to-privilege mapping > Subordinate
    override"

 3.

    Apply to URI=/redfish/v1/Managers/bmc/EthernetInterfaces/ in
    https://github.com/ibm-openbmc/bmcweb/blob/master/redfish-core/lib/network_protocol.hpp
    and in
    https://github.com/ibm-openbmc/bmcweb/blob/master/redfish-core/lib/ethernet.hpp

DISCUSSION:

This was really two discussions (6a) Sunitha’s issue with 
EthernetInterface privileges required, and (6b) a more general way to 
represent the Redfish operation-to-privilege mapping within BMCWeb.

6a:

Joseph will write email describing how BMCWeb’s privileges required for 
URIs like /redfish/v1/Managers/bmc/EthernetInterfaces/  should be 
changed (from ConfigureComponents to ConfigureManager) because of the 
EthernetInterface SubordinateOverride.  This change means BMC 
role=Operator users would no longer be able to configure the network.


6b:

We discussed the fact that BMCWeb hard codes the privilege registry.(For 
example, the code here: 
https://github.com/ibm-openbmc/bmcweb/blob/900f949773795141266271107219ea019f2839cd/redfish-core/lib/account_service.hpp#L1333 
<https://github.com/ibm-openbmc/bmcweb/blob/900f949773795141266271107219ea019f2839cd/redfish-core/lib/account_service.hpp#L1333>

hard-codes the privileges required to work with a 
ManagerAccountCollection under URI 
/redfish/v1/AccountService/Accounts/.  For example, to POST (create) a 
new account requires the ConfigureUsers privilege.  This corresponds to 
the entry in the Redfish PrivilegeRegistry in the OperationMap for the 
ManagerAccountCollection.


We had previously agreed on an approach to remove this hard-coded code 
and directly consume the PrivilegeRegistry provided by Redfish.  See 
minutes below for 2020-12-09 and related community emails.   However, 
that work has not yet been started.


Topics added after the meeting started

7 We need a bug tracker for the OpenBMC security response team, where 
only that team (and possibly the problem subimitter) can see work on the 
bug.  This would be used by the security response team to keep track of 
bugs until they are resolved. (See item 11 below for continued 
discussion).  Can we ask Kurt Taylor or the Linux Foundation or a member 
company for help here?


8 Can we populate the link https://github.com/openbmc/openbmc/security 
<https://github.com/openbmc/openbmc/security>

DISCUSSION: Yes

See previous efforts here: agenda item 2 from the 2020-10-14 entry below

James will follow up


9 Surya was introduced.


10 Can we use a tag like [SecurityWorkGroup] in relevant email headers?

DISCUSSION: Yes, let’s try it


11 The security response team has difficulty tracking reported security 
vulnerabilities to closure and writing CVEs in a timely manner.  Can 
OpenBMC become a CVE numbering authority (CNA)?  [CNAs can directly 
write CVEs without having to ask Mitre.]

DISCUSSION:

Having a confidential bug tracker would help.

Per Dick, the UEFI team uses bugzilla and has a restructured corner for 
the security response team: anyone can write a bug, but only they and 
the security response team members can see it.  Also, the UEFI is a CNA 
with folks from more than one company contributing.


OpenBMC (Joseph) attempted to become a CNA; see agenda item 3 on 
2019-2-6 and https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/15621 
<https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/15621>.  At the 
time, OpenBMC had few CVEs and little interest in them.  Now we have 
more interest and can try again.


______
Joseph


>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph
>

