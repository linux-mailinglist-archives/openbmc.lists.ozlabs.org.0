Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC3355533B
	for <lists+openbmc@lfdr.de>; Wed, 22 Jun 2022 20:21:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSsCP6Zvxz3bv4
	for <lists+openbmc@lfdr.de>; Thu, 23 Jun 2022 04:21:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JosfStJP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JosfStJP;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSsBv4Kg4z3bnn
	for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2022 04:20:54 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25MGsQK0004842
	for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2022 18:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Tb6qCbYXiCSM8bX9sDB3qO7O8SntC7NftAzV/n0w0ac=;
 b=JosfStJP+sgyGRVJyzBaMWeMjxc3dR6zNtTis7kt2WChwfSOf8ZH58Wvtu0s6bWZZ6SD
 tvNrwBfhMFTn4SDSFH8Ytze7J5zTX7TE0EZQqd7tCd7U1ukPqaOj/98fLhf9jM/k0L5C
 vwxiwYxQxBMBGZX49JHsHB/r4yKH26ySmCbr6rA24jQH6QZlpNANtk7qzbhEj4vc+4vX
 90DZMIT42wGEC2bxfCvTgO5Xn6B1fItVY82xKGTQmngPNhS5CctHCeCoBBmMruU47LZ1
 sX75fZ5srbOjB4TUU86jbDp/+P3k3CtwgNct7kffUO1ONMFZMUVyl5XloHpFkLHtJOL9 ow== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gv70yt6kw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2022 18:20:51 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25MIK2CF008519
	for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2022 18:20:50 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
	by ppma04dal.us.ibm.com with ESMTP id 3gs6ba5cf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2022 18:20:50 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
	by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25MIKnUG35455246
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2022 18:20:49 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F608124058
	for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2022 18:20:49 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 62F1F124053
	for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2022 18:20:49 +0000 (GMT)
Received: from [9.77.148.104] (unknown [9.77.148.104])
	by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS
	for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2022 18:20:49 +0000 (GMT)
Message-ID: <bda71881-1a64-ad19-6fb1-fbb328975935@linux.ibm.com>
Date: Wed, 22 Jun 2022 13:20:48 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: Security Working Group meeting - Wednesday June 22 - results
Content-Language: en-US
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <4ca4257d-58f1-abc7-a85e-34e9904d4602@linux.ibm.com>
In-Reply-To: <4ca4257d-58f1-abc7-a85e-34e9904d4602@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QH2zc9trr84_FEkbdpDG81Su2aP2m53I
X-Proofpoint-ORIG-GUID: QH2zc9trr84_FEkbdpDG81Su2aP2m53I
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 1 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-22_05,2022-06-22_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 bulkscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=901
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206220085
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



On 6/22/22 10:19 AM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday June 22 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
> and anything else that comes up:
>

Attendees: Daniil Engranov, Russel Wilson, Yutaka Sugawara, Ruud Haring, 
James Mihm, Joseph Reynolds


1 Agreed to cancel July 6 due to US holiday week


2 CVE management.

Intel’s internal hack-a-thon 3 was held in May 2022.  Working toward 
private disclosure to OpenBMC SRT.

Next steps: James will set up a private meeting with the OpenBMC 
security response team (SRT) to write some privately-disclosed 
vulnerabilities to the private issues database.


3 Measured boot

Measured boot writes firmware images to TPM

There is an effort to enable measured boot for ASPEED AST2600 platforms 
with a TPM attached to the BMC (distinct from host TPM).

Current work: Working toward measured boot  for U-boot.

Pre-requisite work: Openbmc’s ASPEED UBoot was forked and is about 1000 
commits old and will need to be updated because it does not have new 
features needed.


Will need a design for this.  Design to cover:

  *

    Enable the mechanism to push measurements into the TPM.  The design
    may have parts which are specific to AST2600.

  *

    Describe which pieces get measured: SPL(?), U-boot image, kernel
    image, readonly file system.

  *

    Enable network agents (like keylime server, possibly the host
    system) to get measurements from TPM.  Note the measurements are
    digitally signed by the TPM to ensure their integrity.

  *

    Intent to comply with OCP standards.


The design will omit policy questions: Use cases for the attestation 
data, keylime or other servers, policy questions about what to do when 
attestation fails.

Example policy when BMC goes bad (fails attest): BMC is isolated from 
its management network?  From host control?  External agent is notified, 
e.g., datacenter admin, who will then isolate the BMC and schedule it to 
be replaced.


Consider two underlying use cases: BMC management agent is (1) 
network-based or (2) host-based.  The intent to enable use case 1.  Use 
case 2 may be problematic when the policy is to isolate the BMC from its 
host, but nothing in the design is intended to block this use case.


4 Progress on SELinux

Still working on SELinux design (Ruud): implementation work continues to 
help the design.

Implementation progress (Yutaka): Enabled SELinux on AST2600 using Yocto 
Kirkstone version.  BMC boots in selinux permissive mode and basic 
commands work.  The initial readonly flash size increase is 20Mb, (was 
16Mb, now is 16+20Mb = 36Mb total on flash).  Will look into 
configuration changes to reduce the size.

Will need a later/updated version of busybox which has SELinux features 
enabled.

Starting to define policy for basic BMC workloads.

-Joseph

>
>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph

