Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A712A3D1740
	for <lists+openbmc@lfdr.de>; Wed, 21 Jul 2021 21:49:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GVR4D41xnz3bVJ
	for <lists+openbmc@lfdr.de>; Thu, 22 Jul 2021 05:49:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b7oKM/yM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=b7oKM/yM; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GVR3y6C19z2yXM
 for <openbmc@lists.ozlabs.org>; Thu, 22 Jul 2021 05:49:18 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16LJXgS0122771
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jul 2021 15:49:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to :
 references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=s9X1U9jIKXtXKhZp6WxnJNeNO6VBcAFrKOKh6oupGqk=;
 b=b7oKM/yMYkAd50P2EliSuIhoG22kSa+tJ7dw8L3d2WUyDpoOqa9zT5onxBr/bXBvmAk7
 KPQZiEq3RnNqsaXZorlsgiRcKqCYmsajqQGi+YYY1H8pMVLxiV0hXDLJqSk1NT382InY
 FSGkgGCzCkhdYoveDO2xF6yNAYu6RpVzxvkiSk5fGsqe8O0uDorjowb3QtG86rOPJDci
 Sd2BOU/I7cG1yney2WNR9tMC9PUXz8QggDHOcGCEThT7H0abZUIhW4W23a5Iz16rlXA8
 ut3xfVOe71usbnBiuM/bx4M3e8g9XEcdSG9xeNAHHVIjxbn9PYEufaktU9WK4szvkVN2 FA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39xn8g96by-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jul 2021 15:49:15 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16LJlZEL019742
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jul 2021 19:49:14 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 39vuk6t0qe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jul 2021 19:49:14 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16LJnDkt15401318
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jul 2021 19:49:13 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7967E7805E
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jul 2021 19:49:13 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11E977806B
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jul 2021 19:49:12 +0000 (GMT)
Received: from demeter.local (unknown [9.160.7.191])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jul 2021 19:49:12 +0000 (GMT)
Subject: Re: Security Working Group meeting - Wednesday July 21 - results
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <cd15ec44-5c29-096b-187d-f3c05680f8a2@linux.ibm.com>
Message-ID: <b4456eee-79c2-6704-ae6f-63cd7485ae9d@linux.ibm.com>
Date: Wed, 21 Jul 2021 14:49:11 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
In-Reply-To: <cd15ec44-5c29-096b-187d-f3c05680f8a2@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lJE3v04BJhxmYLjTQYSUkiFLGqUM__9Q
X-Proofpoint-ORIG-GUID: lJE3v04BJhxmYLjTQYSUkiFLGqUM__9Q
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-21_10:2021-07-21,
 2021-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 malwarescore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107210115
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

On 7/20/21 5:45 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday July 21 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
> and anything else that comes up:
>

Attended: James Mihm, Sorya Intel, Dhananjay Phadke, Dick Wilkins, Jiang 
Zhang, Joseph Reynolds, mbhavsar, guptar (Ratan Gupta)

Bonus item 0: What support fore sOpenBMC have for mTLS client

DISCUSSION: See the Redfish APIs referenced below.  Redfish doesn’t 
support mTLS, but BMCWeb does support mTLS.  Is there a supported 
interface for the BMC admin to upload an mTLS client cert to the BMC?

References:

  *

    https://github.com/openbmc/openbmc/wiki/Configuration-guide#bmcweb
    <https://github.com/openbmc/openbmc/wiki/Configuration-guide#bmcweb>(mTLS)

  *

    https://github.com/openbmc/openbmc/wiki/Configuration-guide#site-identity-certificate
    <https://github.com/openbmc/openbmc/wiki/Configuration-guide#site-identity-certificate>

> 1. See Google’s “unified vulnerability schema for open source”
> https://security.googleblog.com/2021/06/announcing-unified-vulnerability-schema.html?m=1
> <https://security.googleblog.com/2021/06/announcing-unified-vulnerability-schema.html?m=1>

DISCUSSION:

This was included for awareness only, not to propose using this schema.

This seems similar to the forms needed to create CVEs such as here: 
https://cveform.mitre.org/ <https://cveform.mitre.org/>

OpenBMC’s current guidelines for collecting this kind of information are 
here: 
https://github.com/openbmc/docs/blob/master/security/obmc-security-response-team-guidelines.md 
<https://github.com/openbmc/docs/blob/master/security/obmc-security-response-team-guidelines.md>

Related discussion: Should OpenBMC consider becoming CNA?  See previous 
effort here: https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/15621 
<https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/15621>(“Proposed 
answers to DWF CNA Registration Form”)



> 2. Email: Update phosphor-defaults with stronger root password hash
>   algorithm -
> https://lore.kernel.org/openbmc/34f5b89a-3919-e214-a744-4277fba0bbbb@linux.ibm.com/T/#u
> <https://lore.kernel.org/openbmc/34f5b89a-3919-e214-a744-4277fba0bbbb@linux.ibm.com/T/#u>

2 Email: Update phosphor-defaults with stronger root password hash 
algorithm - 
https://lore.kernel.org/openbmc/34f5b89a-3919-e214-a744-4277fba0bbbb@linux.ibm.com/T/#u 
<https://lore.kernel.org/openbmc/34f5b89a-3919-e214-a744-4277fba0bbbb@linux.ibm.com/T/#u>

DISCUSSION:

The group agreed to change the project’s default root password hash, 
while leaving the cleartext password the same.  TODO: Joseph will 
propose the change via a gerrit review.



Topics added after the meeting started:

3 What is the status of the OpenBMC BMC secure boot function?  Who is 
working on it?

DISCUSSION:

ASpeed AST2600 BMC secure boot using AST2600 hardware without TPM and 
without any special hardware (other than pullup resistors).  Interest in 
avoiding Cerberus.

See also Design 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/26169 
<https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/26169>


Two ways to validate uboot: via AST2600 hardware, via Cerberus

Once uboot is running, use uboot to validate the FIT image, kernel, etc.


4 What is happening with the Intel Hack-a-thon 2?

DISCUSSION: Creating CVEs.


5 What is happening with getting a private database to track 
vulnerability submissions?  This would be used by the OpenBMC security 
response team 
https://github.com/openbmc/docs/blob/master/security/obmc-security-response-team.md 
<https://github.com/openbmc/docs/blob/master/security/obmc-security-response-team.md>to 
record security vulnerabilities which were reported to OpenBMC and not 
yet fixed or publicly disclosed.  Only members of the OpenBMC security 
response team would have access (read/write access).

DISCUSSION:

Surya plans to set up bugzilla.

Contact Andrew Geissler in his role as OpenBMC community infrastructure 
if you need a server.


6 What is happening with deploying AppArmor?

DISCUSSION:

Nobody was tracking it closely enough to answer.  Anton had been working 
on it.  See reviews under 
https://gerrit.openbmc-project.xyz/q/owner:rnouse%2540google.com 
<https://gerrit.openbmc-project.xyz/q/owner:rnouse%2540google.com>



>
>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph

