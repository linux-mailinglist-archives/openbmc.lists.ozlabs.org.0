Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DBF57C07A
	for <lists+openbmc@lfdr.de>; Thu, 21 Jul 2022 01:05:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LpBBm3qwVz3c7S
	for <lists+openbmc@lfdr.de>; Thu, 21 Jul 2022 09:05:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zu9zO4BA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zu9zO4BA;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpBBH02Q5z2xt3
	for <openbmc@lists.ozlabs.org>; Thu, 21 Jul 2022 09:05:26 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26KMQ2oE016431
	for <openbmc@lists.ozlabs.org>; Wed, 20 Jul 2022 23:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=rnKLw134zLFiQSXyMvh44y95ZMysRLJnNOjKb+uAPD4=;
 b=Zu9zO4BAcKjcXl3FudPxRDdcz3K9HPgZLZqjhb/nXphopxF1s8O3hhOXKGSygeK3RG8l
 lD2RvGzr/YfQznU5FGGNO18Dz5EGAJFJvvhN68rJMwQMNXwUNvqex+HYiIu2L2l7ad9F
 woY97NDo8wPNX9B9vwAGQ+9Lsj79hdo98QAw/LYBK+Zg1E4/JWGNACkDF1S7lhfMWjsI
 sCxxdBJ+aK5ohwqQmX1ry+zH+sYSaZyqUohTeYWNs0gu0KqmvNYc4Fpfk/XPf8sngpII
 LFIGBaTeUQLO31cwqvbyaONXspAjeraeT2NIu/gSJ09Z+UG7q7ovJovrIqNTnrzrZ0hd mQ== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hetga0sqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 20 Jul 2022 23:05:22 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26KMq8h2003018
	for <openbmc@lists.ozlabs.org>; Wed, 20 Jul 2022 23:05:21 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com [9.57.198.28])
	by ppma04wdc.us.ibm.com with ESMTP id 3hbmy9md3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 20 Jul 2022 23:05:21 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
	by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26KN5L173605056
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openbmc@lists.ozlabs.org>; Wed, 20 Jul 2022 23:05:21 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 439ABB2065
	for <openbmc@lists.ozlabs.org>; Wed, 20 Jul 2022 23:05:21 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 17ABBB205F
	for <openbmc@lists.ozlabs.org>; Wed, 20 Jul 2022 23:05:21 +0000 (GMT)
Received: from [9.160.7.2] (unknown [9.160.7.2])
	by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS
	for <openbmc@lists.ozlabs.org>; Wed, 20 Jul 2022 23:05:20 +0000 (GMT)
Message-ID: <f996f61a-b096-f245-2f94-adc1fb453a2f@linux.ibm.com>
Date: Wed, 20 Jul 2022 18:05:20 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: Security Working Group meeting - Wednesday July 20 - results
Content-Language: en-US
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <a2d97190-fc08-5b92-24f6-8bb9939e12b1@linux.ibm.com>
In-Reply-To: <a2d97190-fc08-5b92-24f6-8bb9939e12b1@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1QCUbpBevneF_olEwp_TYaGQA5OopZjj
X-Proofpoint-GUID: 1QCUbpBevneF_olEwp_TYaGQA5OopZjj
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-20_12,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0
 mlxlogscore=897 lowpriorityscore=0 impostorscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207200093
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

On 7/19/22 10:47 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday July 20 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
> and anything else that comes up:
>
> 1. Continue discussing CVE response, SELinux, and Measured Boot 2.

Meeting held 2022-07-20

Attendees: Daniil Engranov, Russel Wilson, Yutaka Sugawara, Ruud Haring, 
James Mihm, Joseph Reynolds, Dhananjay, Jiang Zhang, Krishnan Sugavanam, 
Sandhya Koteshwara


1 CVE Response guidelines

The OpenBMC Security Response Team is meeting regularly to determine 
next steps for how to improve the vulnerability handling process.  See 
background docs here: 
https://github.com/openbmc/docs/blob/master/security/obmc-security-response-team.md 
<https://github.com/openbmc/docs/blob/master/security/obmc-security-response-team.md>

The direction is to move new problems into github advisories as quickly 
as possible.

For example, security vulnerabilities in OpenBMC documentation are 
reported in https://github.com/openbmc/docs/security/advisories 
<https://github.com/openbmc/docs/security/advisories>, BMCWeb defects 
reported in https://github.com/openbmc/bmcweb/security/advisories 
<https://github.com/bmcweb/docs/security/advisories>, etc.  Each repo 
has its own set of security advisories.

The team is working to understand how to give security responders access 
to private security advisories.  Obviously, then we would have to work 
with each repository maintainer to set up its security tab.


2 SELinux updates.

We discussed ideas for the right way to structure the code.  The 
consensus is there are three layers:

Layer 1. Use the existing meta-selinuxbitbake layer.  This layer has the 
poky/meta config changes to use selinux: adds the SELinux support, 
updates coreutils, and introduces policies.

Layer 2: Propose a new bitbake layer, meta-phosphor-selinux, to work on 
top of the meta-selinux layer, to adapt the OpenBMC phosphor 
applications to use SElinux.  This approach avoids changing the base 
repos, so they don’t need to know or care about SELinux.  This further 
customizes openbmc:

 1.

    Override various recipes via *.bbappend to add selinux to recipes
    like busybox, pam, more updates to coreutils, etc.

 2.

    Define minimal/trivial SELinux policies for OpenBMC applications

Layer 3: Add detailed SELinux policy files to the existing meta- layers 
for each target.  For example, add SELinux policies to the OpenPOWER 
platform (the OpenBMC reference platform) 
https://github.com/openbmc/meta-ibm/blob/master/conf/machine/witherspoon.conf

This would do thing like:

 1.

    Increase size of the readonly file system (which is per TARGET).

 2.

    Introduce policy files for that target (test FEATURE to know if
    selinux is enabled).


This three layer approach puts the parts that can be shared into the new 
meta-phosphor-selinux layer, and leaves policy decisions to each TARGET 
machine.


To add SELinux to a machine or a build, the configuration work would be 
here:

 1.

    Insert the meta-selinux layer

 2.

    Insert the meta-phosphor-selinux layer

 3.

    Enhance the layer for your target.



3 TPM/attestation updates.

Working on PoC for the following:

  *

    Working to extend measurements to the TPM

  *

    Working to integrate keylime for remote attestation.


Next steps are to create a design for the step above.  For remote 
attestation: An agent on the BMC collects data.  How can a network 
client get that data?  WIP: Redfish schema for network clients to get 
access to read attestation.  Is there a common solution? We want to 
avoid OEM APIs.


Redfish public discussion here: 
https://redfishforum.com/thread/685/support-bmc-attached-tpm 
<https://redfishforum.com/thread/685/support-bmc-attached-tpm>



>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph

