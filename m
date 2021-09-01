Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5B83FDDC0
	for <lists+openbmc@lfdr.de>; Wed,  1 Sep 2021 16:22:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H05qZ5ZbRz2yNW
	for <lists+openbmc@lfdr.de>; Thu,  2 Sep 2021 00:22:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JPROiNMm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JPROiNMm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H05q3729vz2xnd
 for <openbmc@lists.ozlabs.org>; Thu,  2 Sep 2021 00:22:07 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 181E2j7C063322
 for <openbmc@lists.ozlabs.org>; Wed, 1 Sep 2021 10:22:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to :
 references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=kue1kYOKv/dbN/ggELLGDMR52H3j72D+hRkJJfF3Qno=;
 b=JPROiNMmp0CwA/AazG7yEXfg2xNy6VSV3x8KJnNojzR0BYZ0bU1Bb/kEqW4RdbLZNX9H
 RNKn1w1P1TRUbQkLgbY57PBr1Yt2JeDINFxUYARQKi09NNb2B7a/8pzVOwvf1UH3OsO6
 rzD8fLyJSCaGc1MeZD8+8FOZp7N/QwCU87Ho9Ew+ViQw4T7QFeyABRul1Y5NgSErZpgB
 5PTjgR/fdsIJF5UPHfA0DeXSGWbbaH+X2ezu+9s1uTA2C9koJLaCi2WHyu97Wc7SuW51
 RIZuSLxyG5n0Vb0yWmNCzesSgA2ed4K0CRK8HYoIKd1MU3nFM7jcG7nKJxErwAPlPeb2 gw== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ata3ft4tr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 01 Sep 2021 10:22:03 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 181E3nGt003353
 for <openbmc@lists.ozlabs.org>; Wed, 1 Sep 2021 14:22:03 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 3aqcsdn4dw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 01 Sep 2021 14:22:02 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 181EM1Hn15270374
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 1 Sep 2021 14:22:01 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 801F8C605B
 for <openbmc@lists.ozlabs.org>; Wed,  1 Sep 2021 14:22:01 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B26CC6057
 for <openbmc@lists.ozlabs.org>; Wed,  1 Sep 2021 14:22:01 +0000 (GMT)
Received: from demeter.local (unknown [9.65.120.200])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed,  1 Sep 2021 14:22:01 +0000 (GMT)
Subject: Re: Security Working Group meeting - Wednesday September 1
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <08874286-b3d3-74a1-f20f-973fd0a4e17d@linux.ibm.com>
Message-ID: <f0cee41f-51d8-1ef5-18f7-4ea12b3c9212@linux.ibm.com>
Date: Wed, 1 Sep 2021 09:22:00 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
In-Reply-To: <08874286-b3d3-74a1-f20f-973fd0a4e17d@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: G2jRhKG8tybeI9JGi3IQTMk40VkeRzaV
X-Proofpoint-GUID: G2jRhKG8tybeI9JGi3IQTMk40VkeRzaV
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-01_04:2021-09-01,
 2021-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 phishscore=0 mlxlogscore=899 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2109010084
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

On 8/31/21 10:19 PM, Joseph Reynolds wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday September 1 at 10:00am PDT.
>
> We'll discuss the following items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
> and anything else that comes up:
>
> 1.
>
>   Ratan Gupta wants to join the Security Response Team for NVIDIA.
>   See
> https://github.com/openbmc/docs/blob/master/security/obmc-security-response-team-guidelines.md#team-composition-and-email-maintenance
> <https://github.com/openbmc/docs/blob/master/security/obmc-security-response-team-guidelines.md#team-composition-and-email-maintenance>
>
Additional agenda item:
2.(gerrit review) 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/31548 
<https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/31548>IPMI over 
DTLS - questions about basic direction and sharing of private keys

>
> Access, agenda and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group 
> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>
> - Joseph

