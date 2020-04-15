Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E2D1AB0DD
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 20:49:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492Wcc5WK0zDr9v
	for <lists+openbmc@lfdr.de>; Thu, 16 Apr 2020 04:49:52 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 492Wbr11DgzDr7p
 for <openbmc@lists.ozlabs.org>; Thu, 16 Apr 2020 04:49:11 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03FIYC3c015274
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 14:49:08 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30dnmj7h14-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 14:49:08 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03FIlrDm008174
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 18:49:07 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma05wdc.us.ibm.com with ESMTP id 30b5h73yuy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 18:49:07 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03FIn6xg40567110
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 18:49:06 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9910E6A04D
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 18:49:06 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48CFA6A047
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 18:49:06 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.154.32])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 18:49:06 +0000 (GMT)
Subject: Re: Security Working Group meeting - Wednesday April 15 - results
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <09f2f613-76d4-c8fc-24a0-1b875fd492d4@linux.ibm.com>
Message-ID: <59553b3a-d930-16cd-78a3-89f4322a75f0@linux.ibm.com>
Date: Wed, 15 Apr 2020 13:49:05 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <09f2f613-76d4-c8fc-24a0-1b875fd492d4@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-15_06:2020-04-14,
 2020-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxscore=0 spamscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004150134
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

On 4/14/20 4:57 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday April 15 at 10:00am PDT.

The meeting was held, and minutes are linked off the wiki page.
A fourth agenda item was added.  A summary is below.

- Joseph

>
> We'll discuss current development items, and anything else that comes up.
>
> The current topics:
>
> 1. Remove default private image signing key from openbmc

The leading idea is to disable the recipe that signs the image, but 
leave the private signing key in the source tree.  Then someone who 
builds will get an unsigned image.  If they enable the image signing 
recipe or use it as an example, they will hopefully see the instructions 
that say to use their own key pair.

Note that an unsigned image is a good starting point for build processes 
that use a separate image signing step, such as when the image is signed 
by a hardware security module (HSM).  One difficulty with this approach 
is that the public key needs to be put into the BMC's root file system.

Followup in the email list or https://github.com/openbmc/openbmc/issues/3615

>
> 2. Discuss issues from the “ipmi password storage” email thread.

We pretty much re-hashed the ideas from the email thread with no 
conclusions.
One more idea was added, that we can the BMC's TPM to hold the RMCP+ keys.

>
> 3. Which algorithm should sign OpenBMC images?

The answer will vary between projects that are downstream from OpenBMC.  
We'll keep the default as RSA-SHA256.  Going forward, the plan is: the 
OpenBMC release process will give visibility to this and other ciphers per:
https://github.com/openbmc/openbmc/wiki/Security-working-group#security-end-of-release-checklist


4. Use the Yocto cvecheck vulnerability scan for OpenBMC repos No CVE 
checking is done at the project-level, but similar check are being done 
in projects that are downstream from OpenBMC. The idea is a nightly 
Jenkins job to generate a report of all the unfixed vulnerabilities, 
something like: bitbake -c cvecheck obmc-phosphor-image.
>
> Access, agenda, and notes are in the wiki:
>
> https://github.com/openbmc/openbmc/wiki/Security-working-group
>
> - Joseph

