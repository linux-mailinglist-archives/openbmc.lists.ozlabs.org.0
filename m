Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A61815B2B7
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2020 22:29:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Ht7Y2rzDzDqS1
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 08:29:13 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Ht6t71yJzDq61
 for <openbmc@lists.ozlabs.org>; Thu, 13 Feb 2020 08:28:38 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CLKSJO017384; Wed, 12 Feb 2020 16:28:34 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y4j86hmj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 16:28:34 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01CLOfw1032320;
 Wed, 12 Feb 2020 21:28:33 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 2y1mm87d0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 21:28:33 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01CLSW0t53018930
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Feb 2020 21:28:32 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 154486E04C;
 Wed, 12 Feb 2020 21:28:32 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 73D186E053;
 Wed, 12 Feb 2020 21:28:31 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.142.217])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 12 Feb 2020 21:28:31 +0000 (GMT)
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Different authority based on how the Redfish service is accessed
Message-ID: <e13a15a6-c63a-1926-2e23-95ab010ae009@linux.ibm.com>
Date: Wed, 12 Feb 2020 15:28:30 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_09:2020-02-12,
 2020-02-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0 mlxscore=0
 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002120146
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

This is re-asking a question from the Redfish forum.  I think the 
OpenBMC project needs to help define the requirements.  I've excerpted 
the conversation here to help facilitate discussion.

- Joseph

Richard:
https://redfishforum.com/thread/279/channel-privilege-support-direction-redfish
 > ...what is the direction from Redfish specification, in terms of 
limiting user roles based on Ethernet channels similar to IPMI....


Joseph:

Redfish's basic model is: an agent uses HTTPS to authenticate to a 
Redfish API server which then maps the identified username (aka account 
name) to a Role which then establishes which privileges are enforced.

I understand OpenBMC systems use Redfish and have multiple Ethernet 
ports (aka Ethernet jacks) which are connected to very-different places. 
Each of these ports can be wired to a different access channel. Typical 
examples:
1. Port connected to a private management network (the canonical setup).
2. Port connected only to the host system, for example.
3. Port normally unused available to a service agent who has the 
privilege of physical access (and a laptop to plug in).

Further, these access channels play a role in establishing security 
domains. For example:
A. The BMC admin normally accesses the BMC via its management network. 
If needed, the admin can use their access the host platform to access to 
the BMC.
B. The BMC admin normally accesses the BMC via its host platform. For 
example, the admin first gains root access to the host computer and then 
accesses the BMC. (This use case is typical for a standalone computer, 
but incompatible with rented bare-metal servers.)

A mechanism is desired to restrict access to the Redfish APIs based on 
the access channel. Questions:

1. Do we need to control access to the channel itself? Like the function 
provided by the ManagerNetworkProtocol?
2. Do we want to restrict which users can access via each channel? Like 
OpenBMC's "group roles" described here?: 
github.com/openbmc/docs/blob/master/architecture/user_management.md#supported-group-roles 
<https://github.com/openbmc/docs/blob/master/architecture/user_management.md#supported-group-roles>
3. Do we want to be able to assign a different Redfish Role to users 
based on which access channel they used to access the BMC?

I think we should start with a problem statement. What problem are we 
trying to solve? Is there a specific use case or requirement?


Jeff:
 > The closest mechanism we have is roles assigned to accounts, so if 
you are looking to distinguish behavior, it should probably be based on 
account and not based on ingress method

