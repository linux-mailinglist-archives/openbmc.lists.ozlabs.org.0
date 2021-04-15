Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8E9360F5E
	for <lists+openbmc@lfdr.de>; Thu, 15 Apr 2021 17:49:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLkLB6Mglz30Gc
	for <lists+openbmc@lfdr.de>; Fri, 16 Apr 2021 01:49:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TuLetoGS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TuLetoGS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLkKy0j84z2yRK
 for <openbmc@lists.ozlabs.org>; Fri, 16 Apr 2021 01:49:25 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13FFXwD2091218
 for <openbmc@lists.ozlabs.org>; Thu, 15 Apr 2021 11:49:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to :
 references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=BZO8cdmM0NhP1srKN8etN69NzQU+owxuE5kjyneDcVo=;
 b=TuLetoGSNr5QguXh0ubn3XkZzd2g9w1pY97hXAud+wmLFnlbnycqgDybMFA1dzKCUskF
 NHXQT7QqE1/BsMdSExfJ1ywlO+jhHGWBJzOP5MHAbK2nO6Oc0tF2r+wwgW6zEFq59FvL
 jtRsnTReS2IXPb+ngz75iy+aedlKgIwuJkBZw6paZzJPL61oQiFdhGxhkig9rdmgdVtL
 TtVtacfxzblzQC6UU/taCqi+6M5CPQttG1CUyhlXZ5o/WWO9iWCTDhuuLT6myNVTH5cI
 3bftn3XkI/ct39/vNguGpc7AAvrbFCY2lv8ky7arWp/HR7Fn3Rhj2BNf/xFpP1AAkKq5 tQ== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37x13vpmcv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 15 Apr 2021 11:49:22 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13FFcF4l022721
 for <openbmc@lists.ozlabs.org>; Thu, 15 Apr 2021 15:49:21 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 37xc73nt2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 15 Apr 2021 15:49:21 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13FFnKaZ24707414
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 15 Apr 2021 15:49:20 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFE0F124052
 for <openbmc@lists.ozlabs.org>; Thu, 15 Apr 2021 15:49:20 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98A23124053
 for <openbmc@lists.ozlabs.org>; Thu, 15 Apr 2021 15:49:20 +0000 (GMT)
Received: from demeter.local (unknown [9.65.222.15])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Thu, 15 Apr 2021 15:49:20 +0000 (GMT)
Subject: Re: Security Working Group - Wednesday April 14 - results
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <29402903-aa83-cdc9-9ab6-cfbe3593f466@linux.ibm.com>
Message-ID: <07a651a4-6ea8-12e3-2451-0e7af768e34e@linux.ibm.com>
Date: Thu, 15 Apr 2021 10:49:19 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
In-Reply-To: <29402903-aa83-cdc9-9ab6-cfbe3593f466@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sBO6d2f72wgd0KRxOlMAu-dFvAL-0I6T
X-Proofpoint-ORIG-GUID: sBO6d2f72wgd0KRxOlMAu-dFvAL-0I6T
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_06:2021-04-15,
 2021-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 spamscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104150099
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

On 4/13/21 5:08 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday April 14 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
> and anything else that comes up:
>
> 1. (no topics)
>
> It should be a lively discussion.

The discussion was less lively and more cerebral.

We continued (or restarted) the “physical interface” discussion from  
2021-03-17.

Why focus on BMC interfaces?  Shouldn’t we focus on threats?

  *

    Agreed we should focus on threats.  But the threats come from the
    BMCs interfaces, so we need a clear model of the BMC interfaces
    first to help organize and talk about threats.

  *

    Many organizations have tried threat modeling, and they all say to
    start with modeling the architecture of the thing you want to
    protect.  For OpenBMC, that’s the BMC.

  *

    The high level security schemes used by OpenBMC contributors (see
    https://github.com/openbmc/openbmc/wiki/Security-working-group
    <https://github.com/openbmc/openbmc/wiki/Security-working-group>)
    all say the same thing:

      o

        Create a threat model

      o

        Describe the interfaces as the first part of the threat model


Should we focus on the BMC or focus on the overall system?

Spoiler alert: The focus is on the BMC itself.


This is a tricky issue.  Discussion:

The BMC is a component in its host and the BMC operates various host 
components outside of itself.  This makes it hard to understand the 
BMC’s security boundary.  Both the BMC and the overall host system need 
to be protected.


The trust model for using BMCs in computer servers (OpenBMC’s initial 
model) is:

  *

    The BMC does not trust its host system.

  *

    The host system (for example, the host hypervisor) does not trust
    its BMC.

  *

    Various host elements effectively trust everyone, that is, they take
    no steps to protect themselves.  They may be operated by either BMC
    or host.  (See examples below.)


Expect the host system to protect itself from the BMC.  How it does so 
is outside the scope of the OpenBMC project.  It is expected that host 
security experts will review the shared host-BMC access to host 
components and their complex interactions as carefully as the BMC 
security experts.


In summary, the BMC’s threat model’s focus is on protecting itself.  
When the BMC is integrated into a host system, the BMC’s threat model is 
integrated into the host system’s threat model.


Scope of the BMC architectural model:

The model needs to be sufficient to show allBMC interfaces.  This 
includes host components outside the BMC which the BMC interacts with.  
A rule of thumb: if the OpenBMC project has code to interact with 
something, the BMC’s architectural model should have a place for that 
something.


The model begins with physical architecture: the physical BMC device (as 
a card or board builtin), continues with its physical interfaces to its 
host, and physical host elements the BMC connects with (as outlined 
below).  [This is intended to be descriptive and should not be 
interpreted to exclude virtual BMCs like QEMU].


Examples of items in scope:

  *

    All inband and all host-BMC interfaces.

  *

    All out of band interfaces.

  *

    All management interfaces (such as IPMI and Redfish).

  *

    All physical presence interfaces (like power buttons, physical USB
    ports, and intrusion detection switches).


The model then builds layer by layer.  For example, each layer needed to 
describe:

  *

    PLDM over MCTP over {LPC, PCIe, UART}

  *

    Virtual media is USB over IP over {the BMC’s network}


Some of these items are merely used by OpenBMC and are not very 
interesting.  (Example: i2c).  The BMC’s threat model will likely not 
say much about them, but they need to be present in the architectural 
description.


Each item ought to be described separately so a system integrator who 
mix&match protocols (example: MCTP over PCIe -vs- MCTP over LPC) can 
cleanly refer to the items they need.


Examples of physical elements shared between BMC & host:

  *

    Physical USB ports (BMC-attached and host-attached)

  *

    Physical network port (NC-SI)

  *

    Access to host processors

  *

    Access to cooling fans

  *

    Watchdog timers(?)


Additional examples of complex BMC / host interactions:

  *

    BMC handling host firmware.  The BMC provides firmware to the host,
    and the host may validate its firmware before using it, such as via
    digital signatures.

  *

    Virtual media aka USB over IP

  *

    BMC control of host BIOS settings.  For example, BMC can disable
    host USB ports.

  *

    BMC access to host serial, typically host console



-Joseph

>
>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph
>

