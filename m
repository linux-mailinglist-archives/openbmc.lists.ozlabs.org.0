Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BD630E3FE
	for <lists+openbmc@lfdr.de>; Wed,  3 Feb 2021 21:25:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWCpt0M3VzDx0d
	for <lists+openbmc@lfdr.de>; Thu,  4 Feb 2021 07:25:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MeRG9yDR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWCnk3T2vzDwxb
 for <openbmc@lists.ozlabs.org>; Thu,  4 Feb 2021 07:24:08 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 113K3ivD123522
 for <openbmc@lists.ozlabs.org>; Wed, 3 Feb 2021 15:24:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to :
 references : message-id : date : mime-version : in-reply-to : content-type
 : content-transfer-encoding; s=pp1;
 bh=uVhxz8GILkzcxi33smBCrwtY1sYFCl0/pox6CXFKhiI=;
 b=MeRG9yDR/cmubDmm+7tTAXVQ3Ort9yeEO6Z52M1C0KieU2RExUCd7WhCy6OgulHqXbb3
 20vC/3wqdCeF+nMQemsYjPr6CO9mEhgizDbscpRVwHi94Gs/kCGZGaFg3fDuvWX/mR24
 AZOaFPL1iuKA2Uw9xhaXOHCC2YUGBfhS6AcTGrJn99Y0AwwEBeIgUmZhyxOVwNoEPbaZ
 2Yqovzg9xS4S0zfKJuWG0GaL9sRp9oV9S02lS/vOQkSyQs80X1ufOWLj3F8nf6mvP0Gh
 oVuZHJKU/V5miHDxOuiPMLRDSF3jtB77pc40o2KZFLPFe8q3MrUhOD6px2CvSO4U3TGy ag== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36g2aks30j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 03 Feb 2021 15:24:05 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 113KI7od004030
 for <openbmc@lists.ozlabs.org>; Wed, 3 Feb 2021 20:24:04 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 36f3kvf3jy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 03 Feb 2021 20:24:04 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 113KO37E24248802
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 3 Feb 2021 20:24:03 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D46613604F
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2021 20:24:03 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E024136051
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2021 20:24:03 +0000 (GMT)
Received: from demeter.local (unknown [9.85.155.134])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2021 20:24:03 +0000 (GMT)
Subject: Re: Security Working Group meeting - Wednesday February 3 - results
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <e42da574-888d-cc33-3f7f-80c8cef4dac0@linux.ibm.com>
Message-ID: <da438d90-d5e8-7cf4-6fc6-8e6a24cc9206@linux.ibm.com>
Date: Wed, 3 Feb 2021 14:24:02 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <e42da574-888d-cc33-3f7f-80c8cef4dac0@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-03_08:2021-02-03,
 2021-02-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxlogscore=853 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102030118
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



On 2/2/21 10:51 AM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday February 3 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
> and anything else that comes up:
>
> 1. Continue to discuss APIs to disable HTTPS 
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/39006 
> <https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/39006>

Is there a use case to allow users to disable the interface they are 
currently using?  For example, a Redfish user might disable IPMI and 
SSH, but why would they disable HTTPS?

Agreed: Redfish should not be allowed to disable HTTPS.  IPMI should not 
be allowed to disable IPMI in a way that it could not be used to 
re-enable itself.

We also mentioned MCTP channels.


What {does|should} happen to login sessions {ipmi|https} when an 
interface is disabled?  They get logged off.  The ports get “cut” and 
the services get disabled.

We discussed a race condition such that HTTPS disables IPMI at the same 
time IPMI disabled HTTPS.  Both might become disabled, resulting in no 
usable interfaces.  The consensus was this problem is not worth solving 
at this time.

>
> 2. Review Linux-PAM changes 
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/40102 
> <https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/40102> and 
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-user-manager/+/39853 
> <https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-user-manager/+/39853> 
>

Joseph described the effort to replace deprecated and removed PAM 
modules.  These modules were used by OpenBMC and their configuration 
arguments were modified by Redfish APIs (details are in the reviews).


>
> 3. Discuss plans for IBM Enterprise system “service” login support.
> 3a. Implement restricted roles and restricted privileges per Redfish 
> spec DSP0266 1.12.0 aka 2020.4 
> https://www.dmtf.org/sites/default/files/standards/documents/DSP0266_1.12.0.pdf 
> <https://www.dmtf.org/sites/default/files/standards/documents/DSP0266_1.12.0.pdf> 
>
> 3b. Story here: https://github.com/ibm-openbmc/dev/issues/1756 
> <https://github.com/ibm-openbmc/dev/issues/1756>
> 3c. Need a special REST API to require variable privileges: 
> https://github.com/ibm-openbmc/dev/issues/2875 
> <https://github.com/ibm-openbmc/dev/issues/2875>

Joseph introduced the Redfish spec changes (DSP0266 referenced above).

We talked about aspects of the Access Control File (ACF) design

The ACF design is similar to mutual TLS (mTLS) which is already 
implemented in OpenBMC.  Can we build on top of the mTLS design?

What are the similarities between IBM’s & Intel’s approach?


>
> 4. Need help for 
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/39756 
> <https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/39756> ?
Need reviews.

>
> 5. (Discord > OpenBMC > #yocto 2021-02-02) Security concerns using a 
> sstate cache.

[Copied from Joseph’s Discord post]: I think yocto security agrees that 
you should trust a shared sstate cache that someone else built only if 
you trust that other party. (Reference 
email:https://lists.yoctoproject.org/g/yocto-security/message/264 
<https://lists.yoctoproject.org/g/yocto-security/message/264>). For 
someone to use the OpenBMC project-level sstate cache, they would have 
to trust whoever has write access to that cache (such as: the host 
system, the host system admin, and the CI build process -- in other 
words, the geissonator). With this outlook, it seems okay to me to have 
a shared sstate cache.

DISCUSSION: General agreement that this is okay, with the understanding 
that individual companies may decline to use this cache.

Bonus topic 6:


6 There is interest in using yocto reproducible builds 
<https://wiki.yoctoproject.org/wiki/Reproducible_Builds>- 
https://wiki.yoctoproject.org/wiki/Reproducible_Builds

>
>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>

