Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 539F431E348
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 00:55:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DgvqC0g6Sz30JB
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 10:55:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zt5z53gO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Zt5z53gO; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dgvpy5qM1z30Gv
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 10:55:21 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11HNVYJH105809
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2021 18:55:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=O1B8kBWygjCEpy9Rn6MkJdov6Sx0s8jz+7MaiUd/KHc=;
 b=Zt5z53gO9DHSSUOvWMkmmdbIaCVBfxNQNFF/QNC13sJh27Q8LW/8EaTXrweP/0k/eMZ8
 onfMD/egjvti1IBV20RKGVLsApX8sIim2HWYbQg/bkCNxiVZIh7b31PCokcj4HSYR22S
 05It4psakax0O6TzmmQoxqKcaiNd8uUdRO/Q4zAezNa06DdeJo1L1cd/y7kgIkcocIEn
 MbTkwrbYCVghgok/V6gFS5UpAr8E98ao/4r0Wf3xUQd+BTWPBtI1+mlr0zB7W4iHjnCi
 X6110bUHSVyPVSY+ePXbau7GcdjXwRnMK7cAwdrhN+4W2aPlYr/q/e19ymD+Rz/P54Z1 sw== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36scrwrkc3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2021 18:55:19 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11HNrckU008010
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2021 23:55:18 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03dal.us.ibm.com with ESMTP id 36p6d9j9wy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2021 23:55:18 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11HNtHLv22741254
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2021 23:55:17 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B34DA112062
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2021 23:55:17 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 912AC112066
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2021 23:55:17 +0000 (GMT)
Received: from demeter.local (unknown [9.85.172.6])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2021 23:55:17 +0000 (GMT)
Subject: Re: Security Working Group - threat model progress
To: openbmc@lists.ozlabs.org
References: <f6a11337-711a-81db-23a8-44bc24b0072f@linux.ibm.com>
 <ec572762-8edc-83dc-219a-6d9cdb5b13c5@linux.ibm.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <6e0484bd-302a-8e2f-e299-727bb28bf087@linux.ibm.com>
Date: Wed, 17 Feb 2021 17:55:16 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <ec572762-8edc-83dc-219a-6d9cdb5b13c5@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-17_21:2021-02-16,
 2021-02-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102170171
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

On 2/17/21 5:19 PM, Joseph Reynolds wrote:
> On 2/16/21 5:53 PM, Joseph Reynolds wrote:
>> This is a reminder of the OpenBMC Security Working Group meeting 
>> scheduled for this Wednesday February 17 at 10:00am PDT.
[...snip...]
> 4. Interested in improving the documentation for the OpenBMC interface 
> overview   [...snip...]

I tried to capture the BMC threat model discussion from today's security 
working group meeting.  This gives the basic BMC architecture elements 
from the [interface-overview][], supplemented by [OpenBMC features][], 
and added some ideas from [network security considerations][].  I tried 
to organize them at the level of abstraction needed for threat modeling: 
physical elements first, a physical threat model boundary, and started 
on the conceptual elements needed to describe the BMC's interfaces and 
functions. Please consider this to be a simple incomplete draft 
proposal.  Help wanted.

The overall OpenBMC threat modeling effort is rooted in the [OpenBMC 
security working group wiki][].

[OpenBMC security working group wiki]: 
https://github.com/openbmc/openbmc/wiki/Security-working-group
[interface-overview]: 
https://github.com/openbmc/docs/blob/master/architecture/interface-overview.md
[OpenBMC features]: https://github.com/openbmc/docs/blob/master/features.md
[network security considerations]: 
https://github.com/openbmc/docs/blob/master/security/network-security-considerations.md

OpenBMC threat model components:
- Physical elements:
     - BMC SoC on BMC card plugged into host system
     - Optional cabinet encloses system and prevents physical access to 
most controls
     - BMC's network connection
     - Optional BMC elements:
         - TPM
         - TOD clock with battery
         - security jumpers
         - serial port
         - USB port
     - Host elements:
         - Power on/off control (to the BMC, and to the chassis)
         - Control panel (power button, varies: LED or LCD displays, etc.)
         - CPU
         - Cooling fans and associated sensors: rotation speed and 
temperature
         - Serial UART for host console
         - Keyboard, video, mouse
         - Optional PCIe devices reachable by the BMC
- Candidates for the threat model boundary:
     - The physical pins on the BMC card
     - The BMC card plus elements under BMC's exclusing control:
         - power button and related displays
         - BMC's network interface, NC-SI or whatever
     - Items that transition between BMC and host control: fans, console?
     - Mention the enclosing cabinet (if present).
- Host elements the BMC interacts with:
     - Host firmware upload
     - Host booting status
     - Host error logging
     - Host requests to power off
     - FRUs
- BMC functions: TODO

