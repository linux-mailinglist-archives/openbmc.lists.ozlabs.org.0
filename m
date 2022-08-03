Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AF9589293
	for <lists+openbmc@lfdr.de>; Wed,  3 Aug 2022 21:06:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LyhCn45tjz3bXg
	for <lists+openbmc@lfdr.de>; Thu,  4 Aug 2022 05:06:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XvY1miL3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XvY1miL3;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LyhCM5T8rz2xJ7
	for <openbmc@lists.ozlabs.org>; Thu,  4 Aug 2022 05:05:51 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 273HroMa031136
	for <openbmc@lists.ozlabs.org>; Wed, 3 Aug 2022 19:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=LDSatLATSKmp9CgnE8kN8qqq/IEflqE+IZpilsmQyHs=;
 b=XvY1miL3rdMQLcKo5EbvU88D88OVOZoVdzs1PsM5n9PZ4W5OLj+CIz8wYiTAoKihahC5
 Jj00KccPiP5w8BzmfWRAYeXlzekj4MAutXV7LQe3MBttz++roDhJ0wbKJDkjpspvEDlz
 1xthGhhl/t6i7YcbQM9fJvrfBRSIPPgQ8iYx2gn4EKoxLZqugUvWGG5q41B5jn9vF4Bn
 LxE0tcRWMIMsViGiH7NhnrzM2kwbRbFfMmPQ2iBwO1S0peUHEmbwEGgeIxuW+v9cguFt
 gwD/u3QvLKOOz06dhtwrujinJzQxBKi6fhnqzZuxMLs2HYBkyJRns/w2bD2DiWxzA5vZ /w== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hqwtca2n2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 03 Aug 2022 19:05:48 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 273Ir92u020890
	for <openbmc@lists.ozlabs.org>; Wed, 3 Aug 2022 19:05:47 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
	by ppma04wdc.us.ibm.com with ESMTP id 3hmv99sxux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 03 Aug 2022 19:05:47 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com [9.57.199.106])
	by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 273J5ldp3408502
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openbmc@lists.ozlabs.org>; Wed, 3 Aug 2022 19:05:47 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 52D4228058
	for <openbmc@lists.ozlabs.org>; Wed,  3 Aug 2022 19:05:47 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 266E728059
	for <openbmc@lists.ozlabs.org>; Wed,  3 Aug 2022 19:05:47 +0000 (GMT)
Received: from [9.65.221.58] (unknown [9.65.221.58])
	by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTPS
	for <openbmc@lists.ozlabs.org>; Wed,  3 Aug 2022 19:05:47 +0000 (GMT)
Message-ID: <8c79b178-0abb-5f9f-037e-bff9931fd887@linux.ibm.com>
Date: Wed, 3 Aug 2022 14:05:46 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: Security Working Group meeting - Wednesday August 3 - results
Content-Language: en-US
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <1bb24451-1407-75e1-ec02-d8d9a90ddb13@linux.ibm.com>
In-Reply-To: <1bb24451-1407-75e1-ec02-d8d9a90ddb13@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WCNBcIDNjHcr5X4v9Vj1DFj1o1RiZAIb
X-Proofpoint-GUID: WCNBcIDNjHcr5X4v9Vj1DFj1o1RiZAIb
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-03_06,2022-08-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208030081
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



On 8/3/22 7:21 AM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday August 3 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
> and anything else that comes up:
>
> 1. Continue discussing CVE response, SELinux, and Measured Boot
>
> 2. Recommend http header values per email dated 2022-07-22 with 
> subject: BMCWeb support new HTTP headers Referrer-Policy and 
> Feature-Policy renamed to Permissions-Policy
>
> 3. Consider increasing the TLS DH keysize from 1024 to 2048 bits per 
> best practice (reference needed).
>
> 4. Consider migrating this meeting access to Discord > Voice channels 
> >  Security.
>
>
Attended:Joseph Reynolds, Russel Wilson, Yutaka Sugawara, Ruud Haring, 
James Mihm, Dhananjay, Krishnan Sugavanam, Sandhya Koteshwara, James 
Bottomley, Dick from Phoenix, Chris Engel, Gheorge Almas, Alda Ohmacht.


1 Continue discussing CVE response, SELinux, and Measured Boot

DISCUSSION: (We skipped over the first topic and went to the second topic.)


2 Recommend http header values per email dated 2022-07-22 with subject: 
BMCWeb support new HTTP headers Referrer-Policy and Feature-Policy 
renamed to Permissions-Policy.

DISCUSSION:

No discussion.  The email archive is 
https://lore.kernel.org/openbmc/CAH2-KxBuPhrv3bBu3ihr1AW6jpLXWvhr3pY0a4zqdFw0eFKkbw@mail.gmail.com/ 
<https://lore.kernel.org/openbmc/CAH2-KxBuPhrv3bBu3ihr1AW6jpLXWvhr3pY0a4zqdFw0eFKkbw@mail.gmail.com/>


3 Consider increasing the TLS DH session keysize from 1024 to 2048 bits 
per best practice (reference needed).

DISCUSSION:

BMCWeb references the  OWASP guidelines.

Reference: NIST SP 800-131A recommends DH keysize 2048 bits.  This is to 
protect against a supercomputer cracking the session key.

An alternative defense is to disallow the Diffie Hellman (DH) algorithm 
and use Elliptic Curve (ECDH).

Note that removing support for DH will break older browsers which don’t 
support ECDH.    Can we increase keysize?  Yes, will take more of the 
limited BMC compute power.


Two of the places which use SSL: BMCWeb, dropbear SSH.  To change these 
would need a configuration or code change to update the key size.  Note 
the BMC creates other SSL connections which also may need similar 
configuration.  See 
https://github.com/openbmc/docs/blob/master/architecture/interface-overview.md 
<https://github.com/openbmc/docs/blob/master/architecture/interface-overview.md>.


Tangentially-related topic: Use the AST2600 BMC’s Hash and crypto engine 
(HACE) engine?

Kernel patch series for AST2600 crypto engine: 
https://lore.kernel.org/linux-crypto/?q=s%3Ahace 
<https://lore.kernel.org/linux-crypto/?q=s%3Ahace>; note just has HACE 
(AES/SHA), no ACRY yet.  ASpeed is working on Kernel driver for the ACRY 
engine for RSA, etc.


New topic: Enhance OpenBMC to enable compliance with NIST FIPS 
compliance?  IBM and Intel are interested in this.  Add to applicable 
standards 
https://github.com/openbmc/openbmc/wiki/Security-working-group#applicable-standards 
<https://github.com/openbmc/openbmc/wiki/Security-working-group#applicable-standards>.  
Next steps: Articulate what FIPS compliance means, and document how the 
FIPS requirements apply to OpenBMC. Perhaps a design or security doc?


4 Consider migrating this meeting to Discord > Voice channels >  Security.

DISCUSSION:

Three responses were: Why?  Seems okay.  Don’t like Discord.

Access question: Can a web client access the discord voice session?

Also, let’s use the discord #security channel.

The direct link is 
https://discord.com/channels/775381525260664832/1002376534377635860 
<https://discord.com/channels/775381525260664832/1002376534377635860>


We went back to the first topic:

1 Continue discussing CVE response, SELinux, and Measured Boot

DISCUSSION: We only had time for the “CVE Response” subtopic.

Email: Change the OpenBMC project to use github security advisories: 
https://lore.kernel.org/openbmc/f52f9a67-b515-8e4d-f904-6ef73346e599@linux.ibm.com/ 
<https://lore.kernel.org/openbmc/f52f9a67-b515-8e4d-f904-6ef73346e599@linux.ibm.com/>with 
gerrit review here: https://gerrit.openbmc.org/c/openbmc/docs/+/55974 
<https://gerrit.openbmc.org/c/openbmc/docs/+/55974>


New sub-sub-topic: to help with static scanning tools (scanning either 
the firmware image file or scan the source code), there is a desire for 
all OpenBMC repos to have versioning numbers (versus using git 
commitID).  This helps the static source code scan tools report 
version.  Specifically, it helps a security-vulnerability-responder to 
map from a BMC firmware version back to the list of source 
package+version used to create that version.  This is related to the 
software bill of materials (SBOM) concept.


The request for repo maintainers is to periodically increment the 
package version (bitbake PV variable) (either within the recipe or the 
recipe filename) per best practices (need reference).  Examples:

  *

    Uboot has the package version as part of the recipe filename:
    https://github.com/openbmc/openbmc/tree/master/poky/meta/recipes-bsp/u-boot
    <https://github.com/openbmc/openbmc/tree/master/poky/meta/recipes-bsp/u-boot>

  *

    BMCWeb has no branches or tags
    (https://github.com/openbmc/bmcweb/tags
    <https://github.com/openbmc/bmcweb/tags>) and specifies a generic
    package version (PV = "1.0+git${SRCPV}") within its recipe
    (https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-phosphor/interfaces/bmcweb_git.bb
    <https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-phosphor/interfaces/bmcweb_git.bb>)
    which merely references the latest bmcweb commit.

James and the security response team to drive this.  Is this a question 
for the Technical Oversight Forum (TOF)?


Next meeting, please cover the Measured boot topic.





>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph

