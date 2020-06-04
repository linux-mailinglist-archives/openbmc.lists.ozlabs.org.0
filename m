Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE521EDB3A
	for <lists+openbmc@lfdr.de>; Thu,  4 Jun 2020 04:34:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cqc34VPYzDqhD
	for <lists+openbmc@lfdr.de>; Thu,  4 Jun 2020 12:34:27 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cqYB1rgszDqcn
 for <openbmc@lists.ozlabs.org>; Thu,  4 Jun 2020 12:31:58 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05422vlc148334
 for <openbmc@lists.ozlabs.org>; Wed, 3 Jun 2020 22:31:53 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31e7uxy5cg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 03 Jun 2020 22:31:53 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0542KtiZ006639
 for <openbmc@lists.ozlabs.org>; Thu, 4 Jun 2020 02:31:52 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 31bf48tp79-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 04 Jun 2020 02:31:52 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0542VoKA29622640
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 4 Jun 2020 02:31:50 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A546A6E04C
 for <openbmc@lists.ozlabs.org>; Thu,  4 Jun 2020 02:31:51 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 474876E050
 for <openbmc@lists.ozlabs.org>; Thu,  4 Jun 2020 02:31:51 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.172.239])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Thu,  4 Jun 2020 02:31:51 +0000 (GMT)
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: New ServiceRep role and privilege
To: openbmc <openbmc@lists.ozlabs.org>
Message-ID: <5bc3f00a-208d-e21f-9707-0a569c2d8971@linux.ibm.com>
Date: Wed, 3 Jun 2020 21:31:48 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-03_13:2020-06-02,
 2020-06-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 cotscore=-2147483648 malwarescore=0 mlxlogscore=935 spamscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006040012
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

This is a proposal to add a new ServiceRep role and a new PerformService 
privilege to Redfish.  The motivation for this is given in the "Isolate 
service privileges" email, as archived [1].

To be clear: This email is asking the OpenBMC community for input before 
approaching Redfish with a formal proposal.  Would you be okay with the 
changes described here, or do we have more considerations?

The proposal

1. Add a new PerformService privilege with description: Can perform 
service operations on components that this service manages.
Reference: Update DSP2046 Redfish Resource and Schema Guide > 
PrivilegeRegistry > Property details.

2. Add a new ServiceRep role with the same privileges as Operator, plus 
the PerformService privilege.
ServiceRep - Login, ConfigureComponents, ConfigureSelf, PerformService.
Reference: DSP0266 Redfish Specification > Security Details > Privilege 
model and authorization.

3. Update the Administrator role to optionally have the PerformService 
privilege.  Make this an implementation decision based on use case:
- As an Administrator of a system that does not have dedicated service 
personnel, I need the PerformService privilege so I don't have to create 
a service account just to perform service operations.
- As the OEM of a system that has dedicated service agents, I need the 
Administrator to NOT have the PerformService privilege so they cannot 
interfere with the service personnel.

4. Change various operations to require the PerformService privilege.  
For example, allow PATCH to an EthernetInterface MACAddress.

4a. Reference: DSP8010 Redfish Schema > EthernetInterface.
Change the MACAddress.readonly property to false.

4b. Reference: DSP8011 > Redfish PrivilegeRegistry > EthernetInterface.
Add a PropertyOverride to target MACAddress for the PATCH operation: 
require PerformService.


Discussion points

I believe this would be straightforward to implement in the BMCWeb 
Redfish server [2].  For point 3 above (optionally assigning the 
PerformService privileges), we can have an BMCWeb configuration option 
or image feature.  I believe we need both use cases.

Note that ServiceRep may need the ConfigureManagers privilege depending 
on your service model.  Note also that a ServiceRep with the 
ConfigureUsers privilege is really an Administrator with additional 
powers, as discussed in the OpenBMC security working group minutes [3] 
from 2019-11-21 and 2020-03-04.  That may or may not be what you want.  
All kinds of fun here, we could even make this configurable by the BMC 
admin. [4]

To address how to protect against DSP2045 > "AccountService roles allow 
an escalation of privileges", see discussion in the "Isolate service 
privileges" email [1].

The proposal described here does not fit neatly into the existing 
Redfish model.  The PerformService privilege should optionally be 
assigned to the Administrator role, depending on the use case. Perhaps 
the Redfish spec could make that an implementation option. Otherwise 
using a custom Role and OemPrivileges (as shown in the DSP0266 > 
OEMSysAdminPriv example) would work.  We'll need to work that out with 
Redfish.

The alternate proposal using a custom Role & OemPrivileges would be:
- Custom ServiceRep role, as above.
- OemPrivilegePerformService, as above.
- But with no changes to the Redfish spec.
- A configuration option that determines whether or not Administrator 
contains OemPrivilegePerformService.

Is this the right way to think about alternate role and privilege 
schemes, or is using custom roles and OemPrivileges the way to go?

- Joseph

[1]: https://lists.ozlabs.org/pipermail/openbmc/2020-June/021927.html
[2]: https://github.com/openbmc/bmcweb
[3]: 
https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI
[4]: Just joking.  That's extra works we don't need.

