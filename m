Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C35F4957F
	for <lists+openbmc@lfdr.de>; Tue, 18 Jun 2019 00:57:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SRS22HflzDqZR
	for <lists+openbmc@lfdr.de>; Tue, 18 Jun 2019 08:57:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SRRR1x9MzDqXm
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jun 2019 08:56:49 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5HMuYQd146434
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jun 2019 18:56:44 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t6k29srqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jun 2019 18:56:44 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x5HMt5xu002804
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jun 2019 22:56:46 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 2t4ra6g436-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jun 2019 22:56:46 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5HMuhNo36241716
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jun 2019 22:56:43 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4913AE063
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jun 2019 22:56:43 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 128C8AE05F
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jun 2019 22:56:43 +0000 (GMT)
Received: from birb.localdomain (unknown [9.102.42.215])
 by b01ledav005.gho.pok.ibm.com (Postfix) with SMTP
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jun 2019 22:56:42 +0000 (GMT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 2BAFA4EC6EE; Tue, 18 Jun 2019 08:56:39 +1000 (AEST)
From: Stewart Smith <stewart@linux.ibm.com>
To: Joseph Reynolds <jrey@linux.ibm.com>, Openbmc <openbmc@lists.ozlabs.org>
Subject: Re: Move away from default password
In-Reply-To: <1164a9a82b2b59087059c59391e65d04@linux.vnet.ibm.com>
References: <1164a9a82b2b59087059c59391e65d04@linux.vnet.ibm.com>
Date: Tue, 18 Jun 2019 08:56:39 +1000
Message-ID: <874l4n6ct4.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-17_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906170198
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

Joseph Reynolds <jrey@linux.ibm.com> writes:
> There is some interest in moving OpenBMC away from a default password.
> - email:=20
> https://lists.ozlabs.org/pipermail/openbmc/2019-June/016515.html  (which=
=20
> references a RestrictionMode design:=20
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/21195)
>
> Having a default password is a security risk.  Note that changing to a=20
> different default password is not a good solution.  For example, if a=20
> bad actor learns the default password from one device, that actor will=20
> likely know the password for many of them.

and it makes it pretty easy to use something like Shodan to find all the
possible OpenBMCs connected to the Internet (hopefully by accident) and
pop a root shell on them.

Mind you, in a lab environment, it's *really* useful.

> I am exploring two options for OpenBMC, and want your feedback.
>
> 1. Unique password per BMC.
> In this approach, there is a way to change the factory default password.=
=20
>   Example flow: assemble the BMC, test it, factory reset, generate unique=
=20
> password (such as `pwgen`), then use a new function =E2=80=9Csave factory=
=20
> default settings=E2=80=9D which would save the current setting into a new=
=20
> =E2=80=9Cfactory settings=E2=80=9D flash partition.  After that, a factor=
y reset=20
> would reset to the factory installed password, not to the setting in the=
=20
> source code.
> Presumably the new factory default would be printed on a sticker, or=20
> something.
> Are there any other factory settings (settings unique to each device)=20
> that would benefit from being set like this?
> One downside to this approach is someone who orders 100 systems has to=20
> enter 100 unique passwords.

There's also a downside for those of us who often work remotely from
machines, we may have to wait for someone to be awake and be able to
physically go and check what the default password is.

> 2. Create new account on first access.
> Specifically, default OpenBMC to use a new RestrictionMode=3DSetupAccess=
=20
> which:
>   - (A) requires users to set up their credentials (at least: remove the=
=20
> default password) before they can leave that mode, and
>   - (B) does not let the user do anything else, including other=20
> provisioning or operating the host, while in this mode.
> So we could manufacture the BMC with a default password, but require it=20
> to be changed as the first step to provision the BMC.
> We might want to make network services react to this new mode, for=20
> example, the phosphor-webui GUI would likely want to handle this=20
> specially, and most REST APIs would be restricted.
> Note this approach gives an attacker a window of time before the=20
> credentials are set up.

In a lab environment though, we'd have to ensure we had a *very*
reliably way to reset the BMC when we switched who was using the machine.

>
> I believe both of these approaches represent reasonable security=20
> practices which may satisfy laws regarding consumer products.  For=20
> example, CA Law SB-327=20
> https://leginfo.legislature.ca.gov/faces/billTextClient.xhtml?bill_id=3D2=
01720180SB327
>
> Are there guidelines we can follow?  Can you find additional=20
> vulnerabilities with these approaches?  Can we do better than this=20
> without requiring additional infrastructure?
>
> I plan to discuss this at the 2019-06-26 Security working group meeting:=
=20
> https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsD=
UWmAOI/
> and would be happy to see ideas here.

I had an idea that provides less security, but still may be valuable:
make the default password at manufacturing be linked to the MAC address
of the BMC. This prevents people not on a local network to the machine
from gaining access (e.g. I have no idea what the MAC address of 8.8.8.8
is), but if I'm on the same ethernet network, then I can still work it
out. It would also allow someone buying 100 machines to programatically
work out what the password should be.

--=20
Stewart Smith
OPAL Architect, IBM.
