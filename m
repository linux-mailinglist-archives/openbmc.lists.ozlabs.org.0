Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 979794A883C
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 17:02:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqNjB2Vb5z3bb2
	for <lists+openbmc@lfdr.de>; Fri,  4 Feb 2022 03:02:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qmFp3hLb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qmFp3hLb; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqNhp032mz30Mj
 for <openbmc@lists.ozlabs.org>; Fri,  4 Feb 2022 03:02:01 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 213EWao4018878; 
 Thu, 3 Feb 2022 16:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=/p+cRfIGyyyaJ+MGsCpCAAzbQdKTZI2q400sqmxuz40=;
 b=qmFp3hLbpS2zFh3m6rN3qgSorpOuJwAmwZ+6UaQ2Pd0nPGP0qxGOrtE7PJxGh5qD2UML
 ukgcStzdpFLbbaCqPiEujyUSVp9uj8glQkBTv01UZKjVwoTxTGFLvIGiUy9gvXuRGUha
 Gcvvy2gJ1cXVzIEgiiO1buoIk8oVBkU0ayB7Dhbbia9sJCgb9qCw9/SX2wC9nHi0BYa3
 IKfQkyPfBm4uRgraB+XlmX7gJFABcp1nJK16/74jhvMPt16i8ZhD0T9dOjxM8lTLE7Ym
 6G42f14SGmQTGglaARvJgdQmvJSFcRVh95EdPY32WOxEEyg6meCRTHkwYOet/CPI8Hq2 dA== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e03uqsss3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 16:01:55 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 213Fv9bM004934;
 Thu, 3 Feb 2022 16:01:55 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04wdc.us.ibm.com with ESMTP id 3dvw7bqthb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 16:01:55 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 213G1tBU26804728
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Feb 2022 16:01:55 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2806AC06E;
 Thu,  3 Feb 2022 16:01:54 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9BBA8AC060;
 Thu,  3 Feb 2022 16:01:54 +0000 (GMT)
Received: from [9.163.28.41] (unknown [9.163.28.41])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  3 Feb 2022 16:01:54 +0000 (GMT)
Message-ID: <585eb304-8cb5-563e-d8f9-feb5f336c50e@linux.ibm.com>
Date: Thu, 3 Feb 2022 10:01:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH U-Boot v2019.04-aspeed-openbmc 6/6] ast2600: Add GPIO
 controller and hog TPM reset pin
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <20220124191503.88452-1-eajames@linux.ibm.com>
 <20220124191503.88452-7-eajames@linux.ibm.com>
 <4bd0324e-9226-4072-8cb2-81ae305db55a@www.fastmail.com>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <4bd0324e-9226-4072-8cb2-81ae305db55a@www.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oXbFZ55QqBqpiZGK0HH_THVbceKF8yrj
X-Proofpoint-GUID: oXbFZ55QqBqpiZGK0HH_THVbceKF8yrj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_05,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030097
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


On 2/2/22 20:17, Andrew Jeffery wrote:
>
> On Tue, 25 Jan 2022, at 05:45, Eddie James wrote:
>> Hog the GPIO pin to reset the TPM.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   arch/arm/dts/ast2600-rainier.dts | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm/dts/ast2600-rainier.dts b/arch/arm/dts/ast2600-rainier.dts
>> index aae507b4c2..d0e82d1512 100755
>> --- a/arch/arm/dts/ast2600-rainier.dts
>> +++ b/arch/arm/dts/ast2600-rainier.dts
>> @@ -108,3 +108,14 @@
>>   	u-boot,dm-pre-reloc;
>>   	status = "okay";
>>   };
>> +
>> +&gpio0 {
>> +	u-boot,dm-pre-reloc;
>> +
>> +	tpm_reset {
>> +		u-boot,dm-pre-reloc;
> Do we need this in the hog node? Seems like it's only necessary in controller nodes.


Yes it is necessary, the SPL dtc compiler will cull anything without 
that property.


Thanks,

Eddie


>
>> +		gpio-hog;
>> +		output-high;
>> +		gpios = <ASPEED_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
>> +	};
>> +};
>> -- 
>> 2.27.0
