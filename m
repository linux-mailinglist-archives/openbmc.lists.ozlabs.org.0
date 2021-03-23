Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18301346B30
	for <lists+openbmc@lfdr.de>; Tue, 23 Mar 2021 22:38:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4l9F15dpz30Pf
	for <lists+openbmc@lfdr.de>; Wed, 24 Mar 2021 08:38:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WIUuuBsu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WIUuuBsu; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4l90618tz2xxl
 for <openbmc@lists.ozlabs.org>; Wed, 24 Mar 2021 08:38:12 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12NLXG3e119130
 for <openbmc@lists.ozlabs.org>; Tue, 23 Mar 2021 17:38:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : subject : to :
 message-id : date : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=Vmco3V1LEF6XbtVj2SWmbb8KpvZoesFN5y6vnWk2bf8=;
 b=WIUuuBsu58/8j8F2DfP/MLM8fTPBqTdYZ2exsCNnENJrYADiZ12C2DKUl/GefMvjF4Zv
 xDfEo9CGXpmmwiNxoF1WSkFdTF36VP43OJsd2k2sa/u1kqJwzcKCTbuIdlCokTuMZAkU
 Eb5WQLFnScuUfFAJVGjVE4msZboqEW9Aje4BFz9xX/WZEd/LytfjM9bpEdK4/y5oGgXk
 xOZc4nfZTZcT5hSYtASdp9baGlrHwhlYopbGfgJMvZBugtLYSfS8Nba6xYowrXM+sRnl
 Hcx6judOvFhlI+rVfwCbciuonDkSY7PdXyV11hkEjwkTC2K8hO6Nbxyn/RJ1wr+swubh oQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37fq7chspp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 23 Mar 2021 17:38:08 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12NLXNF5121724
 for <openbmc@lists.ozlabs.org>; Tue, 23 Mar 2021 17:38:08 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37fq7chspe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 17:38:08 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12NLRbAc019964;
 Tue, 23 Mar 2021 21:38:07 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 37d9akf96w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 21:38:07 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12NLc6P630736678
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Mar 2021 21:38:06 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC499AE05F;
 Tue, 23 Mar 2021 21:38:06 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8278EAE063;
 Tue, 23 Mar 2021 21:38:06 +0000 (GMT)
Received: from demeter.local (unknown [9.160.86.38])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 23 Mar 2021 21:38:06 +0000 (GMT)
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: NOTICE: Backward incompatible Linux-PAM module replacement
To: openbmc <openbmc@lists.ozlabs.org>, Andrew Geissler <geissonator@gmail.com>
Message-ID: <e4dc8f12-4807-cf03-0eea-f19d67387879@linux.ibm.com>
Date: Tue, 23 Mar 2021 16:38:05 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-23_11:2021-03-23,
 2021-03-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103230159
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

OpenBMC community,

Please read this if you support firmware downgrade AND if you allow the 
BMC admin to dynamically configure the BMC's authentication and password 
related parameters.
- Firmware downgrade is firmware update to an older firmware image.
- Dynamically configurable BMC parameters affected include: Redfish 
properties AccountLockoutThreshold and AccountLockoutDuration, related 
D-Bus properties for RememberOldPasswordTimes, minimum password length, 
and includes any on-BMC customization to the /etc/pam.d/ files.

We are seeking approval or strenuous objections to this change.

Thanks,
Joseph


Summary:

1. The OpenBMC project is making an incompatible change to its Linux-PAM 
configuration.
2. A new service converts PAM configuration files to adapt to the 
changes and preserve existing supported customization.
3. But no backward conversion is planned, so downgrading a BMC across 
this incompatible change will cause PAM to fail.  And because PAM is 
needed for authentication, this will brick the BMC.


What happened?

Some Linux-PAM modules used by OpenBMC were deprecated and removed from 
the underlying Yocto recipes.  These modules are no longer supported by 
their project, and are no longer available from the Yocto project.


What is OpenBMC doing?

OpenBMC has a temporary patch to use the old unsupported PAM modules to 
give time to use the replacement modules.  Thanks Andrew!  There is a 
patch (see below) to use newer PAM modules which provide equivalent BMC 
security function.


What is the problem?

The patch necessarily changes the PAM configuration files under 
/etc/pam.d/.  This conflicts with BMC's APIs which allow the BMC admin 
to (indirectly) change these same files.  If your BMC has any such 
changes, they conflict with the changes in this patch!  A new conversion 
service which runs on the BMC resolves the conflict.  See the patch for 
details (file libpam_%.bbapend).

This patch provides only a *forward* conversion service, meaning it 
converts old config files to new.

Although it would be easy enough to provide a *backward* conversion 
service, such a service would have to run on older releases, and we 
missed the time window to do that at the project level, and backward 
compatibility is not deemed essential for BMCs, and that would add 
complexity, so that is a nonstarter.

In summary, you can think of this patch as a downgrade barrier.  You can 
upgrade without any issues: the conversion service will convert your 
BMC's PAM configuration.  And you can downgrade without issues if you 
don't cross the barrier.  Specifically, if you do *not* yet have this 
change then you can downgrade to any older version, and if you *do* have 
this change then you can downgrade to any older release as far back as 
when the change was made, but no further back.


Notes:

1. Please note the conversion service handles only those items which are 
modifiable from supported Redfish and D-Bus APIs.  The conversion 
service may remove nonstandard on-BMC customized PAM configurations and 
reset them to defaults.  See the patch for details (file 
convert-pam-configs.sh).

2. If you have a non-standard PAM configuration built-in to the readonly 
/etc/pam.d/ directory AND your BMC does not allow the admin to 
dynamically configure these files, then forward conversion should not 
need to make any changes, so you have no additional worries.

3. The PAM configuration data is totally independent from the user 
account data (/etc/passwd and /etc/shadow).   Specifically, the issue 
described here does not affect any local user accounts you have 
dynamically created on the BMC and does not affect forward or backward 
migration.

4. The commit message also describes an incompatible operational change: 
The pam_tally2 command (invoked from the BMC's command line) is no 
longer present. If you used the "pam_tally2 -u USER -r" command to 
unlock a user after repeated authentication failures, change to use: 
faillock --user USER --reset


The patch is technically two co-requisite patches in different source 
repos.  These must be applied together, or else you will brick your system:
1) https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/41357
2) 
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-user-manager/+/39853

Can the co-req condition be softened into a pre-req, so one patch could 
be applied first, and then the other?  This was considered (on the 
Discord > OpenBMC > #yocto channel and in earlier gerrit reviews).  The 
idea is to temporarily have both the old and new PAM modules available 
on the BMC, and to enhance phosphor user manager be able to work with 
both the old and new PAM configuration files. That approach was rejected 
due to complexity.

