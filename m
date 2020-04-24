Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 866AB1B7EA6
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 21:13:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4983jj5bYhzDqTJ
	for <lists+openbmc@lfdr.de>; Sat, 25 Apr 2020 05:13:29 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4983cn1lQJzDqwD
 for <openbmc@lists.ozlabs.org>; Sat, 25 Apr 2020 05:09:12 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03OJ21RX116524
 for <openbmc@lists.ozlabs.org>; Fri, 24 Apr 2020 15:09:10 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30jrc7aet5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 24 Apr 2020 15:09:10 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03OJ0niY001323
 for <openbmc@lists.ozlabs.org>; Fri, 24 Apr 2020 19:09:09 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma05wdc.us.ibm.com with ESMTP id 30fs67btat-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 24 Apr 2020 19:09:09 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03OJ97GD8520104
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Fri, 24 Apr 2020 19:09:07 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3796713606A
 for <openbmc@lists.ozlabs.org>; Fri, 24 Apr 2020 19:09:08 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E42F9136065
 for <openbmc@lists.ozlabs.org>; Fri, 24 Apr 2020 19:09:07 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.137.230])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Fri, 24 Apr 2020 19:09:07 +0000 (GMT)
Subject: Re: Security Working Group - Wednesday March 4 -
 PasswordChangeRequired ready for function test
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <144fb54a-9858-6a99-fbcc-bde71fce42a4@linux.ibm.com>
 <cee38096-2466-164f-b74c-c691dcf0e84e@linux.ibm.com>
Message-ID: <94a24c57-6728-1a09-b33c-e23cf37dac43@linux.ibm.com>
Date: Fri, 24 Apr 2020 14:09:06 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <cee38096-2466-164f-b74c-c691dcf0e84e@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-24_09:2020-04-24,
 2020-04-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004240141
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

On 3/4/20 6:08 PM, Joseph Reynolds wrote:
> On 3/2/20 6:05 PM, Joseph Reynolds wrote:
>> This is a reminder of the OpenBMC Security Working Group meeting 
>> scheduled for this Wednesday March 4 at 10:00am PDT.
>>
>> We'll discuss current development items, and anything else that comes 
>> up.
>>
>> The current topics:
>>
>> 1. Proposal to add new Redfish roles for ServiceRep & OemRep. 2. 
>> Implement the Redfish PasswordChangeRequired property. 3. Proposal to 
>> delete BMCWeb sessions after some kinds of account changes.
>>
>> ...snip...
>
> Here is a summary of the discussion.  More details are in the minutes 
> linked below.
>
> 1. Weagreed that ServiceRep and ManufacturingRep Privileges are useful 
> to articulate. We found two use cases: Admin same as service agent and 
> manufacturer, and Admin/Service/manufacturer are different roles. 
> Joseph will pursue getting these roles and privileges defined in 
> Redfish. We also discussed the problem of how to prevent the admin 
> from escalating to the Service role given they control User 
> management. (With possible solutions discussed), and some alternate 
> designs.
> The next step is: Joseph will send an email to the openbmc list with 
> updated details and proposal.
>
> 2. Joseph is working on a new D-Bus property for UserPasswordExpired 
> that is needed for BMCWeb.
>
> 3. Terminating BMCWeb sessions when there are severe account changes 
> sounds like a good idea.
> Nobody signed up to work on it. :)
...snip...

My PasswordChangeRequired code is ready for review.
- This completes all of the planned changes in this area.
- This implements the Redfish ManagerAccount PasswordChangeRequired 
property.
- This implements dynamic Redfish PasswordChangeRequired handling.

There are three parts:
- BMCWeb: Dynamic PasswordChangeRequired handling:
    https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/29136
- phosphor-user-manager: New User.Attributes UserPasswordExpired property
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-user-manager/+/31449
- phosphor-dbus-interfaces: New User.Attributes UserPasswordExpired property
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/31450

The BMCWeb commit requires (pre-reqs) the User manager commit which then 
pre-reqs the D-Bus interface commit.

The reason I made this change:
This change makes it possible to default the admin account password to 
the expired state (so the password must be changed before access to the 
BMC is granted).  Specifically, this change enables the admin to update 
their own expired password.  I believe the webui team has plans to 
implement an "expired password dialog" to do that.  Note that the 
dynamic Redfish PasswordChangeRequired handling means the user will not 
need to reestablish a new session after changing their expired password.

- Joseph

