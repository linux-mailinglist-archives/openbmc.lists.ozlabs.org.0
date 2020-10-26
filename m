Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EBC298E6D
	for <lists+openbmc@lfdr.de>; Mon, 26 Oct 2020 14:48:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKbl43ZhCzDqKh
	for <lists+openbmc@lfdr.de>; Tue, 27 Oct 2020 00:48:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Plil0rrQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKbgR45sDzDqCp
 for <openbmc@lists.ozlabs.org>; Tue, 27 Oct 2020 00:45:05 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09QDVrbq012741; Mon, 26 Oct 2020 09:44:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : cc : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=hqG9Epu1KbbxvYw6X5bbrl2YIPnqNIUVkCiP9d2Pclw=;
 b=Plil0rrQ5ar1PfaVwUZKKJbl9QWRz+nBdiyClrvU2P5X9gYnt79osoBbtv669LKW2NNo
 qTwGJaAKGvaa/xSd8UxkeLcEZ2AVNDqbsyB2OlmFp9L3lvbuGd8JTY6sdj8b4ggjoY8B
 azDOE6IOv+U5zHBOZaaHIQlTZeUsLFPPFTmMMZYq10oUYJLRKiUQB4F5polHL1mdBpY5
 l3UZZBjgh5XSk/TywtrjcIC/e3FT3R2DQ/gXeT4Q6B6r5QrBARyl+Cq6ZvOpD1CpUSVT
 4aYFT06naB1NHb+66OPRXLkEyuyHZajQ4uj8nQZfX52vyrXpQrbzxIhPjK9yEJ9ZXE7a rQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34dp3q7bmt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Oct 2020 09:44:59 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09QDgN4V012050;
 Mon, 26 Oct 2020 13:44:58 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 34cbw8ux20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Oct 2020 13:44:58 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09QDipbn2359974
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Oct 2020 13:44:51 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB049BE053;
 Mon, 26 Oct 2020 13:44:56 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E365BE04F;
 Mon, 26 Oct 2020 13:44:56 +0000 (GMT)
Received: from [9.85.130.229] (unknown [9.85.130.229])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 26 Oct 2020 13:44:55 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.8 v2] ARM: dts: Aspeed: Rainier: Add 4U
 device-tree
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <20200923194405.28857-1-eajames@linux.ibm.com>
 <8078a638-48d1-4851-a6bc-f232f62c70af@www.fastmail.com>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <0e6ae8dc-7b09-be95-db53-173b2b8a1a5a@linux.ibm.com>
Date: Mon, 26 Oct 2020 08:44:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <8078a638-48d1-4851-a6bc-f232f62c70af@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-26_06:2020-10-26,
 2020-10-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 spamscore=0 malwarescore=0 mlxscore=0 phishscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010260094
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


On 10/26/20 12:22 AM, Andrew Jeffery wrote:
>
> On Thu, 24 Sep 2020, at 05:14, Eddie James wrote:
>> Add a device-tree for the Rainier 4U system. Change the model name
>> on the existing Rainier device-tree to 2U, and remove the two
>> extra power supplies that are only present on the 4U system.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>> Changes since v1:
>>   - Don't rename the 2U dts
>>   - Include the 2U dts from the 4U and make the necessary changes
>>
>>   arch/arm/boot/dts/Makefile                    |  1 +
>>   .../boot/dts/aspeed-bmc-ibm-rainier-4u.dts    | 47 +++++++++++++++++++
>>   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  | 14 +-----
>>   3 files changed, 50 insertions(+), 12 deletions(-)
>>   create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 56fd8c8a2ba9..8f59cb9a9b71 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -1359,6 +1359,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>   	aspeed-bmc-facebook-yamp.dtb \
>>   	aspeed-bmc-facebook-yosemitev2.dtb \
>>   	aspeed-bmc-ibm-rainier.dtb \
>> +	aspeed-bmc-ibm-rainier-4u.dtb \
>>   	aspeed-bmc-intel-s2600wf.dtb \
>>   	aspeed-bmc-inspur-fp5280g2.dtb \
>>   	aspeed-bmc-lenovo-hr630.dtb \
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
>> b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
>> new file mode 100644
>> index 000000000000..e5d51b9c7a47
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
>> @@ -0,0 +1,47 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +// Copyright 2019 IBM Corp.
>> +/dts-v1/;
>> +
>> +#include "aspeed-bmc-ibm-rainier.dts"
>> +
>> +/ {
>> +	model = "Rainier 4U";
>> +};
>> +
>> +&i2c3 {
>> +	power-supply@6a {
>> +		compatible = "ibm,cffps";
>> +		reg = <0x6a>;
>> +	};
>> +
>> +	power-supply@6b {
>> +		compatible = "ibm,cffps";
>> +		reg = <0x6b>;
>> +	};
> This looks good.
>
>> +};
>> +
>> +&fan_controller {
>> +	fan@0 {
>> +		compatible = "pmbus-fan";
>> +		reg = <0>;
>> +		tach-pulses = <4>;
>> +	};
>> +
>> +	fan@1 {
>> +		compatible = "pmbus-fan";
>> +		reg = <1>;
>> +		tach-pulses = <4>;
>> +	};
>> +
>> +	fan@2 {
>> +		compatible = "pmbus-fan";
>> +		reg = <2>;
>> +		tach-pulses = <4>;
>> +	};
>> +
>> +	fan@3 {
>> +		compatible = "pmbus-fan";
>> +		reg = <3>;
>> +		tach-pulses = <4>;
> Where did you get the information for `tach-pulses = <4>;`?


 From Matthew Barth.


Thanks,

Eddie


>
> Andrew
>
>> +	};
>> +};
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> index e6f422edf454..6b44340a9e8c 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> @@ -8,7 +8,7 @@
>>   #include <dt-bindings/leds/leds-pca955x.h>
>>   
>>   / {
>> -	model = "Rainier";
>> +	model = "Rainier 2U";
>>   	compatible = "ibm,rainier-bmc", "aspeed,ast2600";
>>   
>>   	aliases {
>> @@ -646,16 +646,6 @@ power-supply@69 {
>>   		compatible = "ibm,cffps";
>>   		reg = <0x69>;
>>   	};
>> -
>> -	power-supply@6a {
>> -		compatible = "ibm,cffps";
>> -		reg = <0x6a>;
>> -	};
>> -
>> -	power-supply@6b {
>> -		compatible = "ibm,cffps";
>> -		reg = <0x6b>;
>> -	};
>>   };
>>   
>>   &i2c4 {
>> @@ -769,7 +759,7 @@ tmp275@48 {
>>   		reg = <0x48>;
>>   	};
>>   
>> -	max31785@52 {
>> +	fan_controller: max31785@52 {
>>   		compatible = "maxim,max31785a";
>>   		reg = <0x52>;
>>   		#address-cells = <1>;
>> -- 
>> 2.26.2
>>
>>
