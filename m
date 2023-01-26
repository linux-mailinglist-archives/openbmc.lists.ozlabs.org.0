Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D867367D833
	for <lists+openbmc@lfdr.de>; Thu, 26 Jan 2023 23:10:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2vzL5K8fz3fCg
	for <lists+openbmc@lfdr.de>; Fri, 27 Jan 2023 09:10:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TuGxpVJc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TuGxpVJc;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2vym2p8Yz3cKM
	for <openbmc@lists.ozlabs.org>; Fri, 27 Jan 2023 09:10:08 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30QLMTlq031328;
	Thu, 26 Jan 2023 22:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=Ld5tNdnc/qsX3qvS22OVJz3miM+CJWfYO+AVLYe3Qy0=;
 b=TuGxpVJcQuQwTuxxniljnO2F5qtIcg1F5fh/J+XN0/zn/6BFFUFnK5jQAQli0iuQqNyI
 cXHCb6nfMhNWugWapt2tvr49tibvMMyGS3bUs9Wte/h+XR8vcVHFPHxxhdb0QTofYiB2
 xZev2hkKOlzBG5/pL5R5cZvtgPLAHxL/bYx9NpY5DzWfAJevS//bRwv8b0pMJlaVxBGq
 WTTf22esQ9xZDJPN4stxTg0/l4v1poa8o9XA53oFas9YcVoZRwzyuqrZfA7QTD/diUs8
 WS87GLmD0VyScKvf0YWHv3esbJ5SVH3wdImAYU/7kHFtFJX4+6gu9lF4VUW9WYKUqDGX Cg== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nc1cm10hb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jan 2023 22:10:03 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30QKkhtK004500;
	Thu, 26 Jan 2023 22:10:02 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3n87p8fbft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jan 2023 22:10:01 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30QMA0n836962750
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Jan 2023 22:10:00 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 734E658058;
	Thu, 26 Jan 2023 22:10:00 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D847058059;
	Thu, 26 Jan 2023 22:09:59 +0000 (GMT)
Received: from [9.160.3.213] (unknown [9.160.3.213])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 26 Jan 2023 22:09:59 +0000 (GMT)
Message-ID: <657a960a-649e-c7b5-8223-a82b1b5ab784@linux.ibm.com>
Date: Thu, 26 Jan 2023 16:09:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 4/4] ast2600: Measure the
 boot
Content-Language: en-US
To: Michael Richardson <mcr@sandelman.ca>, openbmc@lists.ozlabs.org,
        joel@jms.id.au
References: <20230125173025.3725606-1-eajames@linux.ibm.com>
 <20230125173025.3725606-5-eajames@linux.ibm.com> <14591.1674675151@localhost>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <14591.1674675151@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WG1M1tKm_94ZLVFDmwDygjPaNdVOxx1O
X-Proofpoint-GUID: WG1M1tKm_94ZLVFDmwDygjPaNdVOxx1O
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-26_09,2023-01-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=828 clxscore=1011
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301260207
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


On 1/25/23 13:32, Michael Richardson wrote:
> Will you be doing an upstream PR of this great TPM code to u-boot itself?


Yes, see here: 
https://patchwork.ozlabs.org/project/uboot/cover/20230125171810.3724530-1-eajames@linux.ibm.com/


Thanks,

Eddie


