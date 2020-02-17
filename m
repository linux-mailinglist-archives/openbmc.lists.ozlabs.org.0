Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C7A161D31
	for <lists+openbmc@lfdr.de>; Mon, 17 Feb 2020 23:10:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LyqN15rtzDqjd
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 09:10:56 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LypQ5v5WzDqfP
 for <openbmc@lists.ozlabs.org>; Tue, 18 Feb 2020 09:10:05 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01HLxPit066520
 for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2020 17:10:03 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y6bumrcep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2020 17:10:03 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01HM4kDf009160
 for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2020 22:10:02 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 2y6896jctk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2020 22:10:02 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01HMA29b46072272
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2020 22:10:02 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0141828079
 for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2020 22:10:02 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1DD42807B
 for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2020 22:10:01 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.252])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Mon, 17 Feb 2020 22:10:01 +0000 (GMT)
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Proposal: delete BMCWeb sessions after some kinds of account changes
To: openbmc <openbmc@lists.ozlabs.org>
Message-ID: <62c905ac-d35b-f670-aed7-589488676db0@linux.ibm.com>
Date: Mon, 17 Feb 2020 16:10:01 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-17_13:2020-02-17,
 2020-02-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 adultscore=0 suspectscore=0 mlxlogscore=776 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002170179
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

This proposal is to enhance BMCWeb to terminate login session that are 
associated with accounts that have incompatible changes.  I understand 
this practice is allowed Redfish and recommended by OWASP.

Login sessions should be deleted when associated with the following 
account changes:
  - Account is deleted, renamed, or expired.
  - Account [group role][] changes to not include "web".

Login sessions can remain after the following account changes:
  - Account Role changes.  The new role will be used for the next 
operation, next use of that session.
- The [proposed][] ExpiredPassword D-Bus property and the 
PasswordChangeRequired Redfish properties set to True.  Sessions where 
this property is True are needed for a user to change their own password.
- The UserLockedForFailedAttempt D-Bus property.  This property may 
become true during a brute force attack, and it should not cause denial 
of service to existing logged in users.

- Joseph

[group role]: 
https://github.com/openbmc/docs/blob/master/architecture/user_management.md#supported-group-roles
[proposed]: 
https://lists.ozlabs.org/pipermail/openbmc/2020-February/020554.html
[Redfish spec]: 
https://www.dmtf.org/sites/default/files/standards/documents/DSP0266_1.9.0.pdf

