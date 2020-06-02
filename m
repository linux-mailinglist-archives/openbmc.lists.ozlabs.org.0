Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6CC1EC600
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 02:00:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49c8Dy1NV1zDqXV
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 10:00:34 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49c8D61CFmzDqWf
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jun 2020 09:59:48 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 052NWOvR113244
 for <openbmc@lists.ozlabs.org>; Tue, 2 Jun 2020 19:59:46 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31dnxw4bp5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 02 Jun 2020 19:59:46 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 052No0Lq010669
 for <openbmc@lists.ozlabs.org>; Tue, 2 Jun 2020 23:59:45 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 31bf49pwgh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 02 Jun 2020 23:59:45 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 052Nxh3311534768
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 2 Jun 2020 23:59:44 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3B047805E
 for <openbmc@lists.ozlabs.org>; Tue,  2 Jun 2020 23:59:43 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A12097805C
 for <openbmc@lists.ozlabs.org>; Tue,  2 Jun 2020 23:59:43 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.136.4])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Tue,  2 Jun 2020 23:59:43 +0000 (GMT)
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Isolate service privileges
Message-ID: <09e6ee03-ce22-17b5-b19d-062effcd97c0@linux.ibm.com>
Date: Tue, 2 Jun 2020 18:59:40 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-02_15:2020-06-02,
 2020-06-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 cotscore=-2147483648 priorityscore=1501 mlxscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006020160
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


Summary: This presents a requirement to isolate service functions and a 
use case where the administrator does not have service privileges.  The 
motivation for a new service representative role is presented along with 
extensions to the Redfish privilege model. Additional changes needed to 
make this work are described.

Motivation

A service representative is a person authorized to perform service on a 
computer system, typically a high-end system, serviced by an independent 
organization, and working under a service agreement.  An example service 
call is to power off a PCIe slot, physically replace a defective FRU 
device, then use BMC functions to update FRU data like serial number or 
MAC address, mark error logs entries as handled, etc.  The service rep 
needs access to enhanced service tools that allow deeper diagnostics and 
repair procedures.

Why do we need to lock out the administrator from sensitive service 
functions?  Updating FRU data can cause incorrect operations when done 
improperly.  Marking error log entries as "handled" without following 
repair procedures can cause incorrect diagnosis, unnecessary repair 
actions, and cost more time.  These are examples of BMC functions that 
the service rep must perform, and BMC admins must not be allowed to perform.

To be clear, by default, the administrator will have full privileges 
including service privileges.  There will be a new option (like an image 
feature) to remove service privileges from the administrator role and 
achieve the effect described in this note.

The main pieces are:
- Create a new ServiceRep role and service privilege.  These would be 
available in the base implementation.
- Require the service privilege to perform sensitive service 
operations.  This affects the Redfish operation-to-privilege mapping and 
its implementation in BMCWeb.
- Have a build-time option to either allow the admin to perform service 
operations or lock them out.

When the Administrator is locked out of service privileges:
- The admin maintains control of user management, for example, disabling 
service rep accounts.
- The admin must not be allowed to escalate to the ServiceRep role. For 
example, they could create a ServiceRep account for themselves and then 
try to use it to perform service operations.  Examples of how the system 
can prevent this escalation:
    + The admin must not be allowed to create or change any account to 
have the ServiceRep role, or
    + Using the service privilege must require additional authentication.
- The admin must not be allowed to access the command shell as the root 
user.  For example, the admin account must not be root, and if SSH is 
available, the admin user must not have `sudo` authority or `su` 
credentials.  Root can subvert access controls and perform service 
functions.

Next steps

1. I will propose a new ServiceRep Role and related PerformService 
privilege in a followup email.
2. The mechanism to authenticate a service rep in a way an admin cannot 
use is outside the scope of this design.  We had discussed a 
certificate-based approach in the security working group.  I believe the 
other items in this email have merit even without this piece.
3. To prevent the admin from escalating to the service account, we can 
have a new image feature to restrict use of the ServiceRep role (so the 
admin cannot create or change existing accounts with this role) and then 
pre-create the "service" account.
4. As a prerequisite, I would like to move the project away from the 
default "root" login to a new "admin" account.  The Administrator 
accounts would then be able to use the `sudo` command to become root.  A 
new image feature could disallow the admin from `sudo` access.

All of these taken together will achieve the goal of isolating BMC 
service functions.  I plan to start with the ServiceRep piece, first 
gathering comments from the OpenBMC community, then presenting it to 
Redfish.  Next priority is creating an admin account and disallowing 
root logins.  I plan to send details for each piece as I go, and welcome 
your participation.

- Joseph

