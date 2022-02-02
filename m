Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA614A7A26
	for <lists+openbmc@lfdr.de>; Wed,  2 Feb 2022 22:21:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpvrL67Q8z3bY0
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 08:21:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LmEL/aHK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LmEL/aHK; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jpvqs27j3z2yHL
 for <openbmc@lists.ozlabs.org>; Thu,  3 Feb 2022 08:21:28 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 212L6aak015943
 for <openbmc@lists.ozlabs.org>; Wed, 2 Feb 2022 21:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=4P1WjeiwdFWYIBUmjkEJlGUQHYUpXiYNPzCydDK9q2I=;
 b=LmEL/aHKo/fbboz8M2jJ++4UIVIteD+gJK3dDuvk+rwt9E+28av0PYBigUay8TmjAHvf
 oVjnlHy5ZMWKxPgli76QHgrjb1TuwsXXayHojuCMvvPg7Mq+rAdxOFYw2Kq4CGSqB9CI
 YV4KHhK3G35aNXAJ4FipVbrFp/LozjuVcdnKWR2aqjTZLzAxBDjFW/eIMtpLbEF6K+5v
 bOG+NCP5CxHj6Ity10KfKqDL0gd9HL80wfFEdefMeX0urVS+c2oNMsjBZGsEqFthwMWA
 qBSFbgLWaOow9yCqndFxhvnI32/05uFr+CkUe4MAlXlDkMY6qZ0nRb7zQS9VJlIS3hkE 0A== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dyyy0tan8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 02 Feb 2022 21:21:25 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 212L97H0014822
 for <openbmc@lists.ozlabs.org>; Wed, 2 Feb 2022 21:21:24 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04wdc.us.ibm.com with ESMTP id 3dvw7b66rd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 02 Feb 2022 21:21:24 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 212LLNdr11928088
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 2 Feb 2022 21:21:23 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 414DA6A047
 for <openbmc@lists.ozlabs.org>; Wed,  2 Feb 2022 21:21:23 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2DBE6A051
 for <openbmc@lists.ozlabs.org>; Wed,  2 Feb 2022 21:21:22 +0000 (GMT)
Received: from [9.160.111.142] (unknown [9.160.111.142])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed,  2 Feb 2022 21:21:22 +0000 (GMT)
Message-ID: <de58b515-0f0b-4e49-4955-f9144896d313@linux.ibm.com>
Date: Wed, 2 Feb 2022 15:21:21 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: Security Working Group meeting - Wednesday February 2
Content-Language: en-US
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <5516f17c-5fb4-875f-fae1-00d86923bdae@linux.ibm.com>
In-Reply-To: <5516f17c-5fb4-875f-fae1-00d86923bdae@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: J772FOJKo2ZKetNNN4IgHyY6kgyPY60r
X-Proofpoint-GUID: J772FOJKo2ZKetNNN4IgHyY6kgyPY60r
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-02_10,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 phishscore=0 mlxscore=0 mlxlogscore=556
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202020115
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



On 2/1/22 9:24 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday February 2 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
> and anything else that comes up:

Attended: Joseph, Jiang, Dick, Michael Richardson, Daniil, Surya, James, 
Dhananjay

Note that we started on topic 1 (RoT), and then covered topic 3 (CNA) 
before returning to topic 1.  Topic 2 (NoAccess users) was not covered.


>
> 1. followup from previous meeting: OpenBMC’s AST2600 RoT work 2. 
> discuss the concept and need for NoAccess users and how they would be 
> different from disabled BMC user accounts

1 followup from previous meeting: OpenBMC’s AST2600 RoT work is here 
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/49789 
<https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/49789>with the 
underlying OE/bitbake recipe here: 
https://github.com/openbmc/openbmc/blob/master/meta-aspeed/classes/socsec-sign.bbclass 
<https://github.com/openbmc/openbmc/blob/master/meta-aspeed/classes/socsec-sign.bbclass>.  
Note OTP refers to one-time programmable memory used to set the signing 
key, etc.  Also I (Joseph Reynolds) believe the AST2600 specs are not 
public domain.

…  and general  OpenBMC Root of Trust (RoT) discussion


DISCUSSION:

Secure boot trust chain: the BMC hardware performs secure boot of the 
bootloader (e.g., U-Boot, then U-Boot verifies 
{kernel,devicetree,rootfs}, etc., up to starting the application.


Secure boot has three layers: 1 hardware validates uboot, 2 U-Boot 
validates the Readonly fs, 3 the operation system validates applications.

To validate before starting applications:  DMverity, IMA


The OpenBMC project is working to support the first layer, specifically 
AST2600 secure booting U-Boot.  The intention is then to support U-Boot  
securely booting the next layer (kernel, etc.)  Also there is interest 
in using DMverity and IMA, but no agreements.


Who programs the BMC’s OTP memory?  Different use cases: one of: BMC 
vendor, board manufacturer, or customer/installation.


How to validate the BMC hardware?  Different use cases: RoT is the BMC 
-vs- an external component.


Does BMC download applications as part of its intended operation?  
Different use cases.

In the base use case, the BMC read only file system has all 
applications.  Only developers (and advanced diagnostics) download code, 
presumably to test fixes or collect more diagnostic data.

Use cases include both validating the filesystem which has the code, and 
validating the app itself as it is loaded (exec’d) into a Linux process.


Does OpenBMC support Firmware encryption?  symmetric/asymmetric.    
AST2600 supports AES encrypted bootloaders. But there is not currently 
support for this in OpenBMC.

Note that the latest U-Boot version supports encrypted firmware (for 
example, it decrypts the kernel).



2 Do we need to discuss the concept and need for NoAccess users and how 
they would be different from disabled BMC user accounts?  See discussion 
in https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/49295 
<https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/49295>

DISCUSSION - was not discussed because we were out of time.



3 CNA Organization Admin account and authorized users

DISCUSSION:

James is working with Mitre to get a “CNA organizational admin” account 
so OpenBMC can write CVEs in its role as a CNA.

Working the OpenBMC vulnerability backlog…intends to write CVEs.

We briefly discussed our direction to use Github security workflow to 
publish OpenBMC security bulletins on github.



Joseph

>
>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph

