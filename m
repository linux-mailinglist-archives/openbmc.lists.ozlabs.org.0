Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA7035070C
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 20:58:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9bDc39Q4z30J0
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 05:58:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZErCe0U4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZErCe0U4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9bDL3tYLz303F
 for <openbmc@lists.ozlabs.org>; Thu,  1 Apr 2021 05:57:53 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12VIXN1X150821
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 14:57:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to :
 references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=hCptCO2lc0SNieA7Rey2ligUZkR7uUcNMGfF7XGt+8s=;
 b=ZErCe0U4+kICOqmy6++IMSWnCOzeYO7zx+xDlxgtxkaCZeEzQlew071W4CzNzmdgvr7x
 /h6ygXRyRaoUX5BkTIwhJnp7p8/Xliz6ntK6i3uXRH8vwKmpFTGyPRyZGlq2g7Cici7Z
 NYtbq69qFK8eDUqmPMcL0OqtRZqpGxaEKUnmzxm/zMDbWOyB+f5jOk1uavZS7FEK0tC2
 /MrSBS/ObSauwVTod+Q6F7Q66oAeTOGwYKVrVS/b3QQ6flOn0AD07oovMYVdSqxQssH2
 4QZN2nkPMaxVJKAJuNapYUJQGRqBQCj0D4cleKN/+HJqo5OmnZjQNbtIgPOE534vbHil SQ== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37mxdb930f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 14:57:51 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12VIvaTO024490
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 18:57:51 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02wdc.us.ibm.com with ESMTP id 37maacyck1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 18:57:51 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12VIvo9d30409136
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 18:57:50 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0FED124055
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 18:57:50 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76EB6124053
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 18:57:50 +0000 (GMT)
Received: from demeter.local (unknown [9.160.114.226])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 31 Mar 2021 18:57:50 +0000 (GMT)
Subject: Re: Security Working Group - Wednesday March 31 - results
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <a8366b66-4a8a-2492-7034-a35b06421961@linux.ibm.com>
Message-ID: <925affec-2bf6-e3a6-7388-36d3e80ee443@linux.ibm.com>
Date: Wed, 31 Mar 2021 13:57:48 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
In-Reply-To: <a8366b66-4a8a-2492-7034-a35b06421961@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rNm9nL7-guqsARj7QX0wRBIEmpxnfU2-
X-Proofpoint-GUID: rNm9nL7-guqsARj7QX0wRBIEmpxnfU2-
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-31_10:2021-03-31,
 2021-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103300000 definitions=main-2103310126
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

On 3/30/21 7:56 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday March 31 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
> and anything else that comes up:
>
> 1.
>
>   Joseph: https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/41560
> <https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/41560> Add
>   PerformService privilege.

Dropping the OemOpenBMCPerformService privilege and custom 
OemOpenBMCServiceAgent role in favor of a more general design.


>
> 2.
>
>   Joseph: Design for User role configuration
>   https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/41652
> <https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/41652>
DISCUSSION:

The design above will intersect with its counterpart 
operation-to-privilege design - in that they both specify privileges.  
We should sketch out that design before proceeding with this one. Next 
piece is operation-to-privilege customization design because it affects 
this design.


>
> 3.
>
>   Joseph: Interest in OpenBMC learning series talk “OpenBMC secure
>   engineering”?

Nope.  Joseph plans to give the talk.

>
> 4.
>
>   Anton: Privilege separation
> <https://docs.google.com/document/d/1EI-HfPb_NMp9GD0fY6-XCpnKAX6-ZsdpDEsmiX5d6fc/edit#heading=h.b167mnkkse22>

Anton reviewed his doc.  We discussed having the D-bus broker use ACLs.

Key to get reviews: create something each maintainer can test.

Need to cover all D-Bus users with ACL before we can throw the secure 
switch (rough number of services to be changed 
<https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/37844>for 
a based set of targets runnable under qemu).

>
>
>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph
>
>

