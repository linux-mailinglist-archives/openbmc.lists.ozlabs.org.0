Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2982D19332A
	for <lists+openbmc@lfdr.de>; Wed, 25 Mar 2020 22:58:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nhpS3GdbzDqBW
	for <lists+openbmc@lfdr.de>; Thu, 26 Mar 2020 08:58:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nhnr6M67zDqZj
 for <openbmc@lists.ozlabs.org>; Thu, 26 Mar 2020 08:58:21 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02PLapXm016444; Wed, 25 Mar 2020 17:58:18 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ywf2jrwef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Mar 2020 17:58:18 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02PLoK1d002191;
 Wed, 25 Mar 2020 21:58:18 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 2ywawm5srs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Mar 2020 21:58:17 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02PLwHtX49807740
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Mar 2020 21:58:17 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC13DB2065;
 Wed, 25 Mar 2020 21:58:16 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 594B2B205F;
 Wed, 25 Mar 2020 21:58:16 +0000 (GMT)
Received: from [9.163.69.144] (unknown [9.163.69.144])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 25 Mar 2020 21:58:16 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.4 v2] ARM: aspeed: ast2600: Select timer
To: Joel Stanley <joel@jms.id.au>, Eddie James <eajames@linux.ibm.com>
References: <1585171587-14081-1-git-send-email-eajames@linux.ibm.com>
 <CACPK8XeKR5qt8WvAtxhhajiXMxFd=SMPuzWUOeGh5EhVv1Kw_Q@mail.gmail.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Message-ID: <b97d47b8-7d3c-7ff6-a21f-7bff06b8f6b3@linux.vnet.ibm.com>
Date: Wed, 25 Mar 2020 16:58:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XeKR5qt8WvAtxhhajiXMxFd=SMPuzWUOeGh5EhVv1Kw_Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-25_13:2020-03-24,
 2020-03-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1011 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003250166
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


On 3/25/20 4:56 PM, Joel Stanley wrote:
> On Wed, 25 Mar 2020 at 21:26, Eddie James <eajames@linux.ibm.com> wrote:
>> The AST2600 also uses the FTTMR010.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>> Changes since v1:
>>   - Add back HAVE_ARM_ARCH_TIMER which is apparently necessary to boot...
> We want to use the arch timer. Aspeed recommends not having the
> fttmr010 driver loaded at all, and just using the arch timer. The
> problem with that is the kernel decides that it can't enable hrtimers
> with just the arch timer, so in the past I was working around that by
> enabling the fttmr010.
>
> Another possibility is to use the always-on property in the device tree:
>
> Documentation/devicetree/bindings/timer/arm,arch_timer.yaml
>
>    always-on:
>      type: boolean
>      description: If present, the timer is powered through an always-on power
>        domain, therefore it never loses context.
>
> Can you test adding this, but having fttmr010 disabled?


Ah, I see. Yes I will test that.

Thanks for explaining!

Eddie


>
> Cheers,
>
> Joel
>
>>   arch/arm/mach-aspeed/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
>> index 693cbdd..129bc19 100644
>> --- a/arch/arm/mach-aspeed/Kconfig
>> +++ b/arch/arm/mach-aspeed/Kconfig
>> @@ -39,6 +39,7 @@ config MACH_ASPEED_G6
>>          select CPU_V7
>>          select PINCTRL_ASPEED_G6
>>          select ARM_GIC
>> +       select FTTMR010_TIMER
>>          select HAVE_ARM_ARCH_TIMER
>>          select HAVE_SMP
>>          help
>> --
>> 1.8.3.1
>>
