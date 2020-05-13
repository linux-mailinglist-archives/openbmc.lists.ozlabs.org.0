Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A01841D1BA5
	for <lists+openbmc@lfdr.de>; Wed, 13 May 2020 18:57:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Mgnv097BzDqSN
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 02:57:23 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Mgn32SCmzDq9S
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 02:56:39 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04DGWqEK049960
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 12:56:37 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31016m2gj3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 12:56:36 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04DGst3L029379
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 16:56:35 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04wdc.us.ibm.com with ESMTP id 3100ubg36q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 16:56:35 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04DGuZSV46465410
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 16:56:35 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75881AE060
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 16:56:35 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F956AE05C
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 16:56:35 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.153.254])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 16:56:35 +0000 (GMT)
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Requirements for security audit logs?
To: openbmc <openbmc@lists.ozlabs.org>
Message-ID: <87f78066-22d5-6f15-56a2-134388844a66@linux.ibm.com>
Date: Wed, 13 May 2020 11:56:34 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-13_07:2020-05-13,
 2020-05-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0
 cotscore=-2147483648 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005130144
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

What are our requirements for Security Audit Logs?  The main idea is to 
add a new BMC logging service to hold security-relevant events.

Considerations:
- The log holds *only* security-relevant entries (and no irrelevant 
entries).
- Consumed by a security auditor (currently the Administrator Role).  
The log is likely to contain sensitive and possibly personal information 
(such as IP addresses), so it must be protected from reading.  Perhaps 
only the admin can read this.
- Entries must be available, so the admin should not be able to delete 
the log or any entries.
- Log can be held on BMC persistent storage (like flash) or streamed off 
the BMC, just like any other log.
- Low-level design: any BMC service can write a security log entry when 
it encounters a security-relevant event.  (In addition to its regular 
logging.)
+ Note that security holes exist.  I would like to keep these outside 
the scope of this initial discussion except to note that examples shown 
below ought to generate a security log entry. Examples:
+A: root SSH access can do whatever it wants to the security log
+B: factory reset clears the logs

Examples of security-relevant events:
Network:
- New connections via HTTPS (se BMCWeb below), SSH, use of the serial 
line to access the BMC's shell, etc.
BMCWeb:
- All authentication attempts (login, basic auth, etc.)
- When accounts are locked out or reset
- Attempts to use REST APIs that require Administrator access. NOTE: 
This covers a large number of functions and may overlap with services 
provided by D-Bus daemons.  Example: LDAP config, local user config.  
Example: when an admin uses their authority to change a user account 
password.
Services:
- Password changes (in phosphor-user-manager)
- BMC rebooting or power on
- Host state transitions
- Firmware update (BMC or host)
- BMC Factory reset

We can consider a more formal set of requirements given by NIST SP 800-92:
https://en.wikipedia.org/wiki/NIST_Special_Publication_800-92
with additional controls as specified by NIST SP 800-53.

- Joseph

This topic was previously discussed as agenda item 3 in the 2020-04-29 
Security Working Group results
https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI
> 3. Requirements for security audit logs.  Access, deleting, APIs.
There was general support for the ideas that the BMC should have 
dedicated security audit log that could not be deleted or cleared. This 
log would have only security-relevant events.

