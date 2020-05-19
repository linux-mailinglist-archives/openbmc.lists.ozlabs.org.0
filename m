Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3281D9409
	for <lists+openbmc@lfdr.de>; Tue, 19 May 2020 12:07:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RBPk4XNkzDqgk
	for <lists+openbmc@lfdr.de>; Tue, 19 May 2020 20:07:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ratagupt@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RBNf6J2JzDrBc
 for <openbmc@lists.ozlabs.org>; Tue, 19 May 2020 20:06:09 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04JA4g1g110627; Tue, 19 May 2020 06:06:03 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312wshs6b7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 May 2020 06:06:03 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04JA2ZeL009375;
 Tue, 19 May 2020 10:06:01 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 313xehhbvm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 May 2020 10:06:01 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04JA5xFx49741906
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 May 2020 10:05:59 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B2FD42049;
 Tue, 19 May 2020 10:05:59 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9EC0F42047;
 Tue, 19 May 2020 10:05:58 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.79.181.30])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 19 May 2020 10:05:58 +0000 (GMT)
To: openbmc@lists.ozlabs.org, richard.marian.thomaiyar@linux.intel.com
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Subject: LDAP authentication is not working
Message-ID: <b242dd63-3fb2-6c16-bbd2-3797afb23a8e@linux.vnet.ibm.com>
Date: Tue, 19 May 2020 15:35:57 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-19_03:2020-05-19,
 2020-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 cotscore=-2147483648 suspectscore=0 clxscore=1011
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005190086
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

Hi Richard,

This is regarding the commit 
https://github.com/openbmc/bmcweb/commit/cd17b26c893ba9dd1dcb0d56d725f2892c57e125.

where "user without having redfish group user is not authenticated to 
query the details, and login will fail"

As per the pam authentication for the ldap user it gets the user details 
through pam_ldap module
which internally uses standard linux api (getpwnam_r), to fetch the user 
details like(group id of the group
which the LDAP/Local user is tied to)

Now once user gets authenticated by the first pam auth module, second 
auth module(pam_succeed_if.so) gets eXecuted
in following order

https://github.com/linux-pam/linux-pam/blob/c6bef96651ee861baf099a36f0cb1fd4d36669ca/libpam/pam_modutil_ingroup.c#L81
https://github.com/rhuitl/uClinuX/blob/master/lib/libpam/modules/pam_succeed_if/pam_succeed_if.c#L186
https://github.com/linux-pam/linux-pam/blob/955b3e2f100205be2db4358e9c812de2ae453b8e/libpam/pam_modutil_getgrnam.c#L56

getgrnam_r("groupname") will fetch the groupID of the given group name 
in following order(as per the configuration)
=> Local
=> LDAP

We created the new LDAP group named "redfish" in the LDAP server and put 
the ldap user under the newly created "redfish" group
but that didn't help as same group is listed in both places(Local,LDAP)

As I explained above local database will get priortize over LDAP

Hence there would be failure. Now we have following option

Priortize LDAP over Local if LDAP is enabled but in that case the same 
problem will occur for the local user.

We have upstream tagging is planned for this week and with the commit 
below LDAP is broken

(https://github.com/openbmc/bmcweb/commit/cd17b26c893ba9dd1dcb0d56d725f2892c57e125.)

Should we revert it or do you have any plans?

Please let me know your thoughts.

Regards
Ratan Gupta

