Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7F4380FB9
	for <lists+openbmc@lfdr.de>; Fri, 14 May 2021 20:26:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FhcSB2rwbz306C
	for <lists+openbmc@lfdr.de>; Sat, 15 May 2021 04:26:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oJCKA1OE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=oJCKA1OE; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhcRt0Bkxz2yY7
 for <openbmc@lists.ozlabs.org>; Sat, 15 May 2021 04:26:33 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14EI5Wks060933; Fri, 14 May 2021 14:26:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=yiWuDwaxi4eLCbuITO7bIcyKBRFv+IXv2i3ceumx38c=;
 b=oJCKA1OENr1ofhpmojAPvbFJpcUu6ts57uE1tKXb+749HTMlBBp7teN7B1Cd0ysvg66m
 7zCvv3RJ3MCmeAexPoC4sPyublf9vF2u1s46PVVXnGTqmoYpkR/N1cR17GbNWByvkBh+
 4MgNZrDRNtartkjc0j34MUGXcTUZIUntzmy+6nUnL0cCwIyZ+ZBknPWlhbna+Dt6lN1Z
 q5MJal/8W5F9UziVz5zVvQwRn781ciQEubTHVPLrTi3etH2VVA9R7W1fC+VOqAul7KLC
 6zOgKOvf6hcS+u3yH7ektC2NN0O3r071UEPNbsQa68g7u0+vyQB7Tj/BDvaTK7rETGvb NA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38hw919uwu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 May 2021 14:26:29 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14EICj2p006850;
 Fri, 14 May 2021 18:26:28 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 38hc6ffhww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 May 2021 18:26:28 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14EIQRs719464614
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 May 2021 18:26:27 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53C3BBE04F;
 Fri, 14 May 2021 18:26:27 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7F33BE056;
 Fri, 14 May 2021 18:26:26 +0000 (GMT)
Received: from demeter.local (unknown [9.160.6.19])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 14 May 2021 18:26:26 +0000 (GMT)
Subject: Re: Security Working Group - Wednesday May 12 - results
To: Patrick Williams <patrick@stwcx.xyz>
References: <35156c27-e195-c238-1bb9-d20a30db3c63@linux.ibm.com>
 <8febdc9d-08bb-4094-9cad-7e6035c5bd71@linux.ibm.com>
 <YJw9I+q6RYpr1UO6@heinlein>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <cb761cb4-56d8-35ab-c2b6-097e96833260@linux.ibm.com>
Date: Fri, 14 May 2021 13:26:25 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
In-Reply-To: <YJw9I+q6RYpr1UO6@heinlein>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hHrr0VrieOduZ-iqonV4-a9ThhDE-wgY
X-Proofpoint-ORIG-GUID: hHrr0VrieOduZ-iqonV4-a9ThhDE-wgY
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-14_08:2021-05-12,
 2021-05-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105140142
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/12/21 3:40 PM, Patrick Williams wrote:
> On Wed, May 12, 2021 at 01:18:48PM -0500, Joseph Reynolds wrote:
>> On 5/11/21 8:59 PM, Joseph Reynolds wrote:
> [ Copying some stuff from the Google Doc. ]
>
>> Security impacts:
>> - Can be used to defeat secureboot.
>> - Can this function be disabled?  Via kernel config.  Default?
>> - Can restrict which images kexec can load?
>> - Recommend?  Validate the kernel signature before kexec’ing it.  But that doesn't stop an attacker who uses wget to get a malicious image which they pass to kexec.
>> - Why would an attacker want to use kexec?  Opportunity to modify BMC code, load device drivers, create trojan horse(?) or back doors.
>> - How can we force kexec to perform the same signature validation as uboot?  (each part and the whole: kernel, device tree, file system, …)
> Some of this is a concern only because the arm32 support for kexec is
> far behind the other architectures.  Can someone investigate what, if
> anything, is going on upstream to get arm caught up?
>
> On most other architectures there is a new set of system calls, enabled
> by KEXEC_FILE, which moves some of the handling done by the kexec
> executable into the kernel and has signature verification done there.
> arm32 is one of the few architectures that do not currently support this
> KConfig.
>
> See:
> - https://man7.org/linux/man-pages/man8/kexec.8.html (kexec-syscall-auto).
> - http://people.redhat.com/vgoyal/papers-presentations/linux-plumbers-2013/vivek-linux-plumbers-conference-2013-presentation-kexec-secureboot.pdf
>

Patrick,

Thanks for the info!  (I'm learning as I go.)  I'll ask my people to 
look into this (with no promises).

- Joseph

