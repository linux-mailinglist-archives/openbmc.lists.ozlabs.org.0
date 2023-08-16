Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F25E877E35F
	for <lists+openbmc@lfdr.de>; Wed, 16 Aug 2023 16:16:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FQqqLwBV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQqvB0n4Cz3cCj
	for <lists+openbmc@lfdr.de>; Thu, 17 Aug 2023 00:16:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FQqqLwBV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQqtZ06Rjz2yVd
	for <openbmc@lists.ozlabs.org>; Thu, 17 Aug 2023 00:16:05 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37GE7sIk019036;
	Wed, 16 Aug 2023 14:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=upt80IlYaJUNO5J5QWAXAQBNFIBVk9s01uRU/uGyquk=;
 b=FQqqLwBV2WatFt73l4LsIBss8r986YeFUspBZ587lF1+LZ0tW9YlGU1Di8ZZ/vI4+NBH
 RqaAVNVr11yW0iPcmYtm/pIVWns/fqKJIdh4C46HGDyJvUTF3BfdhJLaLxh2NQzwJ6rF
 boY57ZZUlJJGZYIrhMD0E530uGaerktO4xgb49vYE1/677/d0uk7Xfa4nY3lmMLxA7r8
 xJn4hgJARtc40as0SzYFTVX99s70awhlC+5k1XOQf8j5LLJXzO2Ic7SB5XnnwhxQTIQl
 BuDay1F6hOkKRrbp2amUcm3RrYBhkQJ7qjFCJHUfKCkryM1ZfHY5fxHc+4gMpvs61LY2 tA== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sgxpru0e5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 14:16:00 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37GCoKmN007861;
	Wed, 16 Aug 2023 14:15:59 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3senwkcy5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 14:15:59 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37GEFwWZ22217082
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Aug 2023 14:15:58 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4377F58071;
	Wed, 16 Aug 2023 14:15:58 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2001758067;
	Wed, 16 Aug 2023 14:15:58 +0000 (GMT)
Received: from [9.61.167.96] (unknown [9.61.167.96])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 16 Aug 2023 14:15:58 +0000 (GMT)
Message-ID: <d8138359-f3a6-db9f-6a98-d34ec8b59cff@linux.vnet.ibm.com>
Date: Wed, 16 Aug 2023 08:15:59 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: TOF elections for 2023H2
To: Patrick Williams <patrick@stwcx.xyz>,
        OpenBMC List <openbmc@lists.ozlabs.org>
References: <ZNvDQ9xTbV-Ynk6T@heinlein.vulture-banana.ts.net>
Content-Language: en-US
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
In-Reply-To: <ZNvDQ9xTbV-Ynk6T@heinlein.vulture-banana.ts.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jUkOaMIjRA7NG3Drep8sLCIXGjaV9sAN
X-Proofpoint-ORIG-GUID: jUkOaMIjRA7NG3Drep8sLCIXGjaV9sAN
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 2 URL's were un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-16_13,2023-08-15_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1011
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308160121
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

On 8/15/2023 12:26 PM, Patrick Williams wrote:
> 
> The current election roll-call is available at:
>     https://github.com/openbmc/tof-election/blob/main/2023H2/rollcall.json
> 
> For this half, we have 3 seats up for election.
> 
> Nominations for those 3 seats may be sent to the mailing list by
> replying to this email.  Only those eligible to vote may be nominated.
> 

Hi All,

I would like to nominate Andrew Geissler for the TOF. Andrew has worked 
on OpenBMC for several years. Andrew maintains several OpenBMC 
repositories, manages the CI infrastructure, and is an active community 
member.

Thanks,
Gunnar


