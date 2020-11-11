Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 918762AF8FE
	for <lists+openbmc@lfdr.de>; Wed, 11 Nov 2020 20:24:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWZS05mSlzDqvN
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 06:24:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ip+fczVy; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWZRF1dlgzDqbp
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2020 06:24:08 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ABJ8HjQ061470
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 14:24:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to :
 references : message-id : date : mime-version : in-reply-to : content-type
 : content-transfer-encoding; s=pp1;
 bh=h80jWpQCD7PhFsOpBOHr7Y8GW5yZb5+XKaNLJfTyOyE=;
 b=ip+fczVyiruYV4ztQxCMuWO0GhHIPQ2jWTR6MHqEqTh5HTR//vtc5wzpcv3NGq4ZSrRR
 0xfbwEAMoV1Iea85udRTI843uyBdyKZvjKgWBObsgGL59Vzr+ODa5NGNwPSkoaUguFVM
 dfvzt9GKJQ43vcdQXXlytKD0FVHy/Glqs9XVFUWToWGSm0h6tW1zK7RbGkPT7GF2bLdB
 sGtBiOLxOhemZvbNxL6L73Mul16GPNHpaGlWo1E+xQ3LFpTXqBFFaWcY5NkzghP2IVKc
 MhstgEZegjilOATVGv8J4AZ6qlY93ProsE5/fb3McGyInrWavjIBBqjMTCnAUifi5lZ5 Cg== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34r6k0kwb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 14:24:05 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0ABJM7Rw003120
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 19:24:05 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01dal.us.ibm.com with ESMTP id 34nk7amgde-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 19:24:05 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0ABJO33v38535462
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 19:24:03 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CAE706A054
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 19:24:03 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87EE96A047
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 19:24:03 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.80.230.176])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 19:24:03 +0000 (GMT)
Subject: Re: Security Working Group meeting today
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <58c3081c-8867-ffe4-c65e-9bc9139b7587@linux.ibm.com>
Message-ID: <ebd05a9a-77a7-e758-3bb7-eeeadbb67b84@linux.ibm.com>
Date: Wed, 11 Nov 2020 13:24:02 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <58c3081c-8867-ffe4-c65e-9bc9139b7587@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-11_10:2020-11-10,
 2020-11-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 mlxlogscore=999 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 spamscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011110111
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

On 11/11/20 7:58 AM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday November 11 at 10:00am PDT.
> Apologies if this is a duplicate email.

Here are the summary meeting notes.

> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
> and anything else that comes up:
>
> 1.  Is OpenBMC ready to move from root to an admin account?  See
>    https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/33847
> <https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/33847>

Please add an image feature for an admin account. It should work and 
play nicely with the existing phosphor-user-manager support and with the 
sudo package.


>
> 2.  The PAM_ABL module https://github.com/deksai/pam_abl
>    <https://github.com/deksai/pam_abl>is no longer supported.  We had
>    discussed using PAM_ABL to help prevent DoS.

No discussion.


> 3. The CSIS
> <https://www.cloudsecurityindustrysummit.org/#documents>published a
>    paper “A Case for a Trustworthy BMC
> <https://cloudsecurityindustrysummit.s3.us-east-2.amazonaws.com/a-case-for-a-trustworthy-bmc.pdf>”
>    that gives recommendations for security.  A section analyzes how
>    well the OpenBMC project meets these recommendations
> <https://cloudsecurityindustrysummit.s3.us-east-2.amazonaws.com/a-case-for-a-trustworthy-bmc.pdf#h.h0igu5dbvaun>. 
>
>    I’ve added this to the OpenBMC security wiki.

No discussion.  Plans are to track OpenBMC’s efforts in the security wiki.


Bonus item 4: Anton’s progress in running daemon processes as a non-root 
user. ANSWER:

Success making a sandbox that launched multiple daemons (BMCWeb  and 
ipmi-network) using less-privileged “namespace’d users” and using Linux 
groups to carry authority.  These daemons communicate with the rest of 
the system via D-Bus.

We also discussed if this daemon work has any tie-ins or complication 
with the work to login with a non-root admin or operator account. We 
also discussed what model / low-level design to use network user 
successfully authenticates: how to drop root authority.
>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
>

