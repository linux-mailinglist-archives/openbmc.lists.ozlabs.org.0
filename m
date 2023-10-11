Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED55E7C55C3
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 15:44:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Amcs7GVU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S5DX16Dhcz3cQ4
	for <lists+openbmc@lfdr.de>; Thu, 12 Oct 2023 00:44:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Amcs7GVU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S5DWR6d1Dz3cB6
	for <openbmc@lists.ozlabs.org>; Thu, 12 Oct 2023 00:43:47 +1100 (AEDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39BDdCVb031738;
	Wed, 11 Oct 2023 13:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=jCPgB3cd8fxikKPpXBUDx4RyX7mvaorDHSrPY1PVQVA=;
 b=Amcs7GVULT+E0gv4gtO+1rsdT0hvTL6SH97W1VLkcj4a2JLOZbv4Syu3GJ+YcE3yJs9r
 S1mOuokBVeJ+yf3rrLKHJOrIPlJ9HM8Xtx+Db2R+zRr+VF7TMqFZFdftThZDciaeSZHH
 Ov/dpbB6DOK3wc6z2Cp1+Hov//dbrxzmN6d9MkWw+ar6hwI55Dyj50WSGyA3sMDIsA+8
 w0Y918lQCIWUERMifz60aKfLwXMiG2AqbHOLeE0lwprzfYeo/+2mOg+VS5AGCJ31zhJx
 92UfGW49q6MqWrbL7XX7zcyy/eMTPI63kb7Eohtgi1ohFkcIJHUHM8SQk+6y4MvwUoHd uA== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tnvmd8h22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 13:43:41 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39BBjd8v025927;
	Wed, 11 Oct 2023 13:43:40 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tkjnng9q5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 13:43:40 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39BDhdZ947186664
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Oct 2023 13:43:40 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD0E558059;
	Wed, 11 Oct 2023 13:43:39 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B6D6458055;
	Wed, 11 Oct 2023 13:43:39 +0000 (GMT)
Received: from [9.61.37.205] (unknown [9.61.37.205])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 11 Oct 2023 13:43:39 +0000 (GMT)
Message-ID: <3731ff1c-0b23-8ada-836a-4d45f3bcbfc8@linux.ibm.com>
Date: Wed, 11 Oct 2023 08:43:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH linux dev-6.5 0/4] ARM: dts: aspeed: p10bmc: Add fan
 controller properties
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20231006172735.420566-1-eajames@linux.ibm.com>
 <CACPK8XcwULKU16zr5CKtufMV2xqeqhWk+1Pv0VMDmMA6oXUgdQ@mail.gmail.com>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <CACPK8XcwULKU16zr5CKtufMV2xqeqhWk+1Pv0VMDmMA6oXUgdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UrbUaUvb2Mdu0f7fElsDzAaxRCeVgUHS
X-Proofpoint-ORIG-GUID: UrbUaUvb2Mdu0f7fElsDzAaxRCeVgUHS
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_09,2023-10-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=764 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310110120
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 10/10/23 20:46, Joel Stanley wrote:
> On Sat, 7 Oct 2023 at 03:58, Eddie James <eajames@linux.ibm.com> wrote:
>> Now that the max31785 driver can parse the relevant properties, update
> I can't see a patch that adds that support. Can you point it out?


Sure, 
https://github.com/openbmc/linux/commit/ebd863b5c2a2f5bc3ee26fadf39a213a2cdc6efb


Thanks,

Eddie


>
> Cheers,
>
> Joel
>
>> the device trees with the necessary properties.
>>
>> Eddie James (4):
>>    ARM: dts: aspeed: Rainier: Add fan controller properties
>>    ARM: dts: aspeed: Everest: Add fan controller properties
>>    ARM: dts: aspeed: Bonnell: Add fan controller properties
>>    ARM: dts: aspeed: Rainier 4U: Delete fan dual-tach properties
>>
>>   .../dts/aspeed/aspeed-bmc-ibm-bonnell.dts     | 14 +++++++
>>   .../dts/aspeed/aspeed-bmc-ibm-everest.dts     | 28 +++++++++++++
>>   .../dts/aspeed/aspeed-bmc-ibm-rainier-4u.dts  | 24 +++++++++++
>>   .../dts/aspeed/aspeed-bmc-ibm-rainier.dts     | 42 +++++++++++++++++++
>>   4 files changed, 108 insertions(+)
>>
>> --
>> 2.39.3
>>
