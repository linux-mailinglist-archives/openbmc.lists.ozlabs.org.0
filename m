Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F00032A2D55
	for <lists+openbmc@lfdr.de>; Mon,  2 Nov 2020 15:49:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CPwmc0y7jzDqNd
	for <lists+openbmc@lfdr.de>; Tue,  3 Nov 2020 01:49:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=l0tZZpHB; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CPwlK6CNqzDqNj
 for <openbmc@lists.ozlabs.org>; Tue,  3 Nov 2020 01:48:28 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A2EWJOX087601; Mon, 2 Nov 2020 09:48:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=rPfX13RY7niaMbKsluOpT0p7zcQ8S3AOZAJ+Jrsr4BM=;
 b=l0tZZpHBxujoMioE5FokxHE6KlHJnGX78WRoeXqijnf80c5JpZoQilfc4+7CRyIeySd9
 tQfT5FZ7Yr0vZzcQK8IjdMqq8ScpHGiWUXNm366nvIGbWGVMuo/EzxnusWRmInNHZR6p
 V8l/3iqMoXsmj5G4qTK/KQgAYMygSeGW2dasuJZOfmUfuhGgMySFfwIgvS7Fep2ZqX57
 z8FHZL+VIdje5gTWT14HNpaWDYg4HTnfxuzjtfe4ysvSbHAJklzS/1rI73vqL8snEIuU
 hjTleBTe7S38NQ01F7mTsG+xv1wjMGiRoyRc1xFpYrItZQfjB/wZmR8O/IeQzBZY5jDb cQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34j94ja2sr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Nov 2020 09:48:26 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A2El457024969;
 Mon, 2 Nov 2020 14:48:25 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 34hs32e4rt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Nov 2020 14:48:25 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0A2EmOX848103692
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Nov 2020 14:48:24 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36CE5BE05D;
 Mon,  2 Nov 2020 14:48:24 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD63EBE058;
 Mon,  2 Nov 2020 14:48:23 +0000 (GMT)
Received: from [9.160.32.235] (unknown [9.160.32.235])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  2 Nov 2020 14:48:23 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.8 v3] ARM: dts: Aspeed: Rainier: Add 4U
 device-tree
To: Joel Stanley <joel@jms.id.au>
References: <20201028185647.14565-1-eajames@linux.ibm.com>
 <CACPK8XfmYy3+Z3Mzn3s=AuWbOt9UwrQ6-BDKndq=rhUdn-UUzg@mail.gmail.com>
 <5d230deb-8c8b-01b7-95b0-45e1f25dfd8e@linux.ibm.com>
 <CACPK8XfrGiJUctpr3MaX1t88oB52KznpbONtrJxWVrJoud2Tfw@mail.gmail.com>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <70888696-34b9-c353-37da-a091d1ec3994@linux.ibm.com>
Date: Mon, 2 Nov 2020 08:48:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CACPK8XfrGiJUctpr3MaX1t88oB52KznpbONtrJxWVrJoud2Tfw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-02_07:2020-11-02,
 2020-11-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011020112
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 11/1/20 5:14 PM, Joel Stanley wrote:
> On Fri, 30 Oct 2020 at 13:51, Eddie James <eajames@linux.ibm.com> wrote:
>>
>> On 10/29/20 11:14 PM, Joel Stanley wrote:
>>> Hi Eddie,
>>>
>>> On Wed, 28 Oct 2020 at 18:56, Eddie James <eajames@linux.ibm.com> wrote:
>>>> Add a device-tree for the Rainier 4U system. Change the model name
>>>> on the existing Rainier device-tree to 2U, and remove the two
>>>> extra power supplies that are only present on the 4U system. Also
>>>> add labels to the fan nodes for use in the 4U device-tree.
>>>>
>>>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>>>> ---
>>>> Changes since v2:
>>>>    - Just reference individual fan nodes rather than the whole fan
>>>>      controller
>>>>
>>>> Changes since v1:
>>>>    - Don't rename the 2U dts
>>>>    - Include the 2U dts from the 4U and make the necessary Changes
>>>>
>>>>    arch/arm/boot/dts/Makefile                    |  1 +
>>>>    .../boot/dts/aspeed-bmc-ibm-rainier-4u.dts    | 37 +++++++++++++++++++
>>>>    arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  | 20 +++-------
>>>>    3 files changed, 43 insertions(+), 15 deletions(-)
>>>>    create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
>>>>
>>>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>>>> index 7e4d3600e16d..9a2ab5e6e924 100644
>>>> --- a/arch/arm/boot/dts/Makefile
>>>> +++ b/arch/arm/boot/dts/Makefile
>>>> @@ -1360,6 +1360,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>>>           aspeed-bmc-facebook-yamp.dtb \
>>>>           aspeed-bmc-facebook-yosemitev2.dtb \
>>>>           aspeed-bmc-ibm-rainier.dtb \
>>>> +       aspeed-bmc-ibm-rainier-4u.dtb \
>>>>           aspeed-bmc-intel-s2600wf.dtb \
>>>>           aspeed-bmc-inspur-fp5280g2.dtb \
>>>>           aspeed-bmc-lenovo-hr630.dtb \
>>>> diff --git a/arch/
>>>> arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
>>>> new file mode 100644
>>>> index 000000000000..9c35ac1d19a6
>>>> --- /dev/null
>>>> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
>>>> @@ -0,0 +1,37 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>> +// Copyright 2020 IBM Corp.
>>>> +/dts-v1/;
>>>> +
>>>> +#include "aspeed-bmc-ibm-rainier-4u.dts"
>>> Did you test this patch?
>>
>> Yes, Rainier hardware BMC booted to Ready state. I suspect it wouldn't
>> power on properly due to bad fan configuration though, so I didn't try
>> that. DTS looked good under /sys/firmware though.
> Are you sure? The version of the patch you posted here doesn't compile.


I tested the downstream version... which should be the exact same except 
for additional fan config. I must have missed something.


>
>>
>> Thanks,
>>
>> Eddie
>>
>>
>>>> +
>>>> +/ {
>>>> +       model = "Rainier 4U";
>>>> +};
>>>> +
>>>> +&i2c3 {
>>>> +       power-supply@6a {
>>>> +               compatible = "ibm,cffps";
>>>> +               reg = <0x6a>;
>>>> +       };
>>>> +
>>>> +       power-supply@6b {
>>>> +               compatible = "ibm,cffps";
>>>> +               reg = <0x6b>;
>>>> +       };
>>>> +};
>>>> +
>>>> +&fan0 {
>>>> +       tach-pulses = <4>;
>>>> +};
>>>> +
>>>> +&fan1 {
>>>> +       tach-pulses = <4>;
>>>> +};
>>>> +
>>>> +&fan2 {
>>>> +       tach-pulses = <4>;
>>>> +};
>>>> +
>>>> +&fan3 {
>>>> +       tach-pulses = <4>;
>>>> +};
>>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>>>> index 183e1a4dcc65..676ae5602fb9 100644
>>>> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>>>> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>>>> @@ -8,7 +8,7 @@
>>>>    #include <dt-bindings/leds/leds-pca955x.h>
>>>>
>>>>    / {
>>>> -       model = "Rainier";
>>>> +       model = "Rainier 2U";
>>>>           compatible = "ibm,rainier-bmc", "aspeed,ast2600";
>>>>
>>>>           aliases {
>>>> @@ -646,16 +646,6 @@ power-supply@69 {
>>>>                   compatible = "ibm,cffps";
>>>>                   reg = <0x69>;
>>>>           };
>>>> -
>>>> -       power-supply@6a {
>>>> -               compatible = "ibm,cffps";
>>>> -               reg = <0x6a>;
>>>> -       };
>>>> -
>>>> -       power-supply@6b {
>>>> -               compatible = "ibm,cffps";
>>>> -               reg = <0x6b>;
>>>> -       };
>>>>    };
>>>>
>>>>    &i2c4 {
>>>> @@ -775,25 +765,25 @@ max31785@52 {
>>>>                   #address-cells = <1>;
>>>>                   #size-cells = <0>;
>>>>
>>>> -               fan@0 {
>>>> +               fan0: fan@0 {
>>>>                           compatible = "pmbus-fan";
>>>>                           reg = <0>;
>>>>                           tach-pulses = <2>;
>>>>                   };
>>>>
>>>> -               fan@1 {
>>>> +               fan1: fan@1 {
>>>>                           compatible = "pmbus-fan";
>>>>                           reg = <1>;
>>>>                           tach-pulses = <2>;
>>>>                   };
>>>>
>>>> -               fan@2 {
>>>> +               fan2: fan@2 {
>>>>                           compatible = "pmbus-fan";
>>>>                           reg = <2>;
>>>>                           tach-pulses = <2>;
>>>>                   };
>>>>
>>>> -               fan@3 {
>>>> +               fan3: fan@3 {
>>>>                           compatible = "pmbus-fan";
>>>>                           reg = <3>;
>>>>                           tach-pulses = <2>;
>>>> --
>>>> 2.26.2
>>>>
