Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 963813B254E
	for <lists+openbmc@lfdr.de>; Thu, 24 Jun 2021 05:12:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9QDM30mtz306q
	for <lists+openbmc@lfdr.de>; Thu, 24 Jun 2021 13:12:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jB7/M1C/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jB7/M1C/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9QD236rsz2yyC
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jun 2021 13:12:17 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15O33tF5160252
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jun 2021 23:12:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to :
 references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=oqxF/uLb0o29HMC+97+iStrTqM78DWxc61V64cMFjMM=;
 b=jB7/M1C/ai6VGWwURpZ/l64pi+8Owp1awsKTTL6vuydbh4N+O97OT6RlSx/Ny9zQLKR4
 io0PyBMt88iS79Jrx/6V+CBbR2UeoP7b2caJTbDEa6CW8GBNhTLHUuWW0Sdd7anHIPs3
 OOc4+4/Q1cLxv8Qe5tZoS9JEJU0I5nb1VCpGG+B5DNxfjfh5StCC004kjH8L+e9gAx9U
 HC7ZnHdrOFLY5fzXUspeBGwoCbaDPXtg22nPhdkgGX70poSsZxUkKMKQXZU6cna89MoZ
 Mshn1czY0aKMc64rYXiYCyOpIjDXM2+a8nziD+EcMfvAmLZx1yIp5dus6rWAdUKSAaSE QQ== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39cg7ca6vs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jun 2021 23:12:13 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15O38VkX032743
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jun 2021 03:12:12 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02wdc.us.ibm.com with ESMTP id 399879we8b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jun 2021 03:12:12 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15O3CBdD16974132
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jun 2021 03:12:11 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCFCA78064
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jun 2021 03:12:11 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8AB407805F
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jun 2021 03:12:11 +0000 (GMT)
Received: from demeter.local (unknown [9.160.86.39])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jun 2021 03:12:11 +0000 (GMT)
Subject: Re: Security Working Group meeting - Wednesday June 23 - results
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <aca638a3-bc8b-10b6-d902-3092ec43eb89@linux.ibm.com>
Message-ID: <f04d3797-7a1d-ce08-d6b9-96470af800b7@linux.ibm.com>
Date: Wed, 23 Jun 2021 22:12:10 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
In-Reply-To: <aca638a3-bc8b-10b6-d902-3092ec43eb89@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eBRB19jCNQYs5wLJXUHNOvBT-eHCLROL
X-Proofpoint-GUID: eBRB19jCNQYs5wLJXUHNOvBT-eHCLROL
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-23_14:2021-06-23,
 2021-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106240016
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

On 6/23/21 8:45 AM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday June 23 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
> and anything else that comes up:
>

Attended:

Joseph Reynolds, Andrei Yadro, James Mihm, Bruce Mitchell, Chris Engel, 
Daniil Engranov, Dhananjay Phadke, Jiang Zhang.



We switched the order of topics from the original agenda.

Note the July 7 meeting is tentatively cancelled unless someone hosts 
and runs it.

BONUS ITEM:

1 How can the security response team track items reported to openbmc?

DISCUSSION:

Urgency?  The security response team is not losing track of issues, but 
is having difficulty keeping focus on issues.  Will create a spreadsheet 
of currently open issues and email it to the private email list.

We want a database to track issues (see ideas below).

The database needs to be secure.  Meaning (a) a secure database which 
has an active security community, (b) hosted on a secure system, (c) 
handled by a trusted admin.

Options for secure database:

 1.

    Redmine

 2.

    Github based?  Does github have a solution?  TODO: Joseph to look at
    a private issues database.

 3.

    Bugzilla?  Note UEFI uses bugzilla with a “security attribute”


Idea: Set up a secure bug database on a server donated to OpenBMC.  
TODO: Joseph talk to AndrewG

TODO Joseph to ask for help from the Linux Foundation.


> 1. Gerrit review BMCWeb “Automate PrivilegeRegistry to code” 
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/43939 
> <https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/43939>.
>
Gerrit review BMCWeb “Automate PrivilegeRegistry to code” 
https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/43939 
<https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/43939>.

DISCUSSION:

Item 1:

Yes, the consensus is: please separate the tools to (A) download the new 
privilegeRegistry JSON file, and (B) transform a Redfish 
PrivilegeRegistry into the privilege_registry.hpp header file.  The tool 
(B) to transform a Redfish PrivilegeRegistry into the 
privilege_registry.hpp header file should run when the image is being 
built, that is, during bmcweb build-time.


Item 2: Joseph brought up the Redfish spec DSP0266 and described how the 
Redfish operation to privilege mapping worked, and described privilege 
overrides.  The consensus was: the way BMCWeb currently handles property 
overrides and subordinate overrides seems okay.  And: having separate 
follow-on commits to change which privileges are required seems like the 
right approach.


- Joseph

>
> The July 6 meeting is tentatively cancelled, unless someone want to 
> run it.
>
>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph

