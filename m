Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E92D8C1F6
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 22:14:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467P7K6zrYzDqLD
	for <lists+openbmc@lfdr.de>; Wed, 14 Aug 2019 06:14:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467P2R6nbXzDqQ8
 for <openbmc@lists.ozlabs.org>; Wed, 14 Aug 2019 06:09:50 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7DK7icK032696; Tue, 13 Aug 2019 16:09:47 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uc1tyngsb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Aug 2019 16:09:47 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7DK5FpN009668;
 Tue, 13 Aug 2019 20:09:46 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 2u9nj63ra2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Aug 2019 20:09:46 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7DK9iJY60752222
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Aug 2019 20:09:44 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C5FC1BE054;
 Tue, 13 Aug 2019 20:09:44 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 90285BE051;
 Tue, 13 Aug 2019 20:09:44 +0000 (GMT)
Received: from demeter.rchland.ibm.com (unknown [9.10.254.219])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 13 Aug 2019 20:09:44 +0000 (GMT)
To: ed.tanous@intel.com, openbmc@lists.ozlabs.org
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: BMCWeb changes for expired password design
Message-ID: <0057c203-b76b-6ecf-7f40-c8e225ea6891@linux.ibm.com>
Date: Tue, 13 Aug 2019 15:09:42 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-13_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908130190
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

Ed,

Please review the "expired password" design: 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/23849

Implementing this requires a few BMCWeb changes:
- For the `/login` URI: when a correct but expired password is given, 
indicate the password was expired via HTTP response body: 
"Unauthorized.  Password expired.  Use Redfish APIs to change the 
password.", and do not create a session.
- For Basic Auth (https://user:password@host): when a correct but 
expired password is given, give HTTP response code 403 or similar.
- For Redfish sessions: when a correct password is given, create the 
session as usual, but set the PasswordChangeRequired field (based on 
PAM_NEW_AUTHTOK_REQD).
- Limit access from sessions which have PasswordChangeRequired=True as 
follows:
     + The session can only be used to GET its own account and session 
information, PATCH its own account's password, and log out.
     + Successfully changing the password terminates the session. That 
is, the session does not change from PasswordChangeRequired=True to 
PasswordChangeRequired=False.
     + Other uses get HTTP response code 403 (or similar).
- The existing password changing mechanism would be used, with the 
additional behavior that when ((PasswordChangeRequired=True) and (the 
password was successfully changed)), the session will terminate.

These changes are based on the design and the Redfish 
PasswordChangeRequired handling specifications (referenced by the 
design).  Would you take a BMCWeb patch to implement this?

- Joseph

