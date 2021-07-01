Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F15833B938A
	for <lists+openbmc@lfdr.de>; Thu,  1 Jul 2021 16:43:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GG1D060CRz307n
	for <lists+openbmc@lfdr.de>; Fri,  2 Jul 2021 00:43:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WJ/U6jWU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WJ/U6jWU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GG1Cm11p7z2yxm
 for <openbmc@lists.ozlabs.org>; Fri,  2 Jul 2021 00:42:59 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 161EYvWP112460
 for <openbmc@lists.ozlabs.org>; Thu, 1 Jul 2021 10:42:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : subject : to :
 message-id : date : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=18ZC0jlOjoI7FK8+5oQ87R8Cn6JD/UPxJQkzuBhnP8g=;
 b=WJ/U6jWUWTrTbKL8Z4vO+slSy2IMhDm8EFfxeest+CfEB5H+TsQkL03PlGcFKV8094pd
 VG+SUnecM3mmZVohn8z1ag2b7ujha5YGnPYnUhPRA7sxZjUnErBn5svcQeqyJJ7y9oxA
 bSpxRuoupTPWLO7BGnz8jHWFuwn90hykZzOiUc0WDuz2Z7vHmeA2ITF/1mqxkxHly87o
 iwQKftGo4NjZK+EVtNyLS76HG7fLDcTulpnwaOEuZ/ACMyoA5stIaXILQbq8pv4KpTk7
 RkYueduDpvuO+JDkCTz8Ftiwm0dAnDS7Kk3Jt/ajv6s8B988nhmZ+1xhvQm4Wd/URL+q 0A== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39hdyfuq5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 01 Jul 2021 10:42:56 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 161EcqjQ032255
 for <openbmc@lists.ozlabs.org>; Thu, 1 Jul 2021 14:42:56 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 39h1y693e9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 01 Jul 2021 14:42:56 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 161Egtop34865460
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 1 Jul 2021 14:42:55 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A12A112067
 for <openbmc@lists.ozlabs.org>; Thu,  1 Jul 2021 14:42:55 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F8DB112069
 for <openbmc@lists.ozlabs.org>; Thu,  1 Jul 2021 14:42:55 +0000 (GMT)
Received: from demeter.local (unknown [9.160.12.130])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Thu,  1 Jul 2021 14:42:54 +0000 (GMT)
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Update phosphor-defaults with stronger root password hash algorithm
To: openbmc <openbmc@lists.ozlabs.org>
Message-ID: <34f5b89a-3919-e214-a744-4277fba0bbbb@linux.ibm.com>
Date: Thu, 1 Jul 2021 09:42:54 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LCh4fGZXWjNFZjjwO99zYt2iQiGIPQjk
X-Proofpoint-ORIG-GUID: LCh4fGZXWjNFZjjwO99zYt2iQiGIPQjk
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_08:2021-07-01,
 2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 mlxscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107010088
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

OpenBMC Community,

Testing the [libpam_1.5.1 changes][] revealed a limitation with the old 
MD5 hash algorithm used to encode OpenBMC's root password.  The fix is 
to change phosphor-defaults to use an acceptable hash algorithm such as 
SHA-512.  We can keep the same password so our testing tools continue to 
work.  Details are below.  I plan to push a fix for this.

- Joseph


Details:

OpenBMC provisions the BMC firmware image with the root account password 
in a form which is no longer acceptable to Linux-PAM version 1.5.1.

Specifically, [phosphor-defaults.inc][] sets the password hash into 
/etc/shadow as "\$1\$UGMqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/", where $1 
indicates the old weak MD5 hash algorithm.  Ref: [wikipedia passwd 
entry][].  Beginning around PAM version 1.5.1, when you log in, the 
[pam_unix.so module][] authenticates okay but requires the password to 
be changed.  (For example, you'll get a message like "You are required 
to change your password immediately (administrator enforced)."  This 
behavior is undesirable for the OpenBMC project defaults, and is not 
tolerated by the project's current continuous integration tools.)  Note 
the new password is stored using the SHA-512 algorithm.   Thanks to Noah 
Brewer for debugging this issue.

This has an easy fix: use the same password with an updated hash 
algorithm.  Specifically, update the password hash supplied in 
phosphor-defaults.inc to use the same password as before but encoded 
with the SHA-512 algorithm.  An acceptable hash can be provided by the 
`openssl passwd -6 0penBmc` command.  This change ought to be 
transparent, forward and backward compatible.  This change is also a 
prerequisite for going to libpam_1.5.1 (presuming you don't want to 
force users to change their password the first time they login).

Note various meta-layers use this same old hash string in 
conf/local.conf.sample files. They should consider updating to match the 
new value.

Closely related: the [Replace deprecated Linux-PAM modules][] gerrit review.

References:
[libpam_1.5.1 changes]: 
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/41294
[phosphor-defaults.inc]: 
https://github.com/openbmc/openbmc/blob/1a977b269ed437bebb9ae7810e3157746ec9174d/meta-phosphor/conf/distro/include/phosphor-defaults.inc#L245 

[wikipedia passwd entry]: https://en.wikipedia.org/wiki/Passwd
[pam_unix.so module]: 
https://github.com/linux-pam/linux-pam/tree/master/modules/pam_unix
[Replace deprecated Linux-PAM modules]: 
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/41357


