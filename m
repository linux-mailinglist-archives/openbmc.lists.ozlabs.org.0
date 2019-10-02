Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C212DC929B
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 21:47:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46k69m6zJhzDqWp
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2019 05:47:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46k6960mNmzDqRH
 for <openbmc@lists.ozlabs.org>; Thu,  3 Oct 2019 05:47:05 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x92JbJEL065237; Wed, 2 Oct 2019 15:46:59 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vcy4gwyy6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Oct 2019 15:46:58 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x92JjojC018184;
 Wed, 2 Oct 2019 19:46:58 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 2v9y5883bx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Oct 2019 19:46:58 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x92Jkv2951839278
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Oct 2019 19:46:57 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7191728059;
 Wed,  2 Oct 2019 19:46:57 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 03DAE2805C;
 Wed,  2 Oct 2019 19:46:56 +0000 (GMT)
Received: from [9.211.157.115] (unknown [9.211.157.115])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  2 Oct 2019 19:46:56 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.3] ARM: dts: aspeed: rainier: Add i2c eeproms
To: Jinu Thomas <jinujoy@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>
References: <77b1d8b9-08a6-9a75-15a1-1c54dc7ddd9f@linux.vnet.ibm.com>
 <CACPK8XdP1NcOeBODTFXUz7XSjfe5xkaR0tf49yPLscGk+WfW2Q@mail.gmail.com>
 <dc9a7d4a-b388-bc9c-14e4-5046d2d01095@linux.vnet.ibm.com>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <c0bf6059-48c8-1e79-8907-c7d9bd1622d5@linux.ibm.com>
Date: Wed, 2 Oct 2019 14:46:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <dc9a7d4a-b388-bc9c-14e4-5046d2d01095@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-02_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910020153
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


On 10/2/19 11:53 AM, Jinu Thomas wrote:
> Hi Joel,
>
>  This is from the schematics, also it has been tested on rainier 
> simics model. do you still need someone else to review it ?
>
> Regards,
>
> Jinu Joy
>
>
> On 02/10/19 5:39 PM, Joel Stanley wrote:
>> Hello Jinu,
>>
>> On Tue, 1 Oct 2019 at 06:05, Jinu Thomas <jinujoy@linux.vnet.ibm.com> 
>> wrote:
>>>
>>> Added eeproms for the below VPD devices
>>> - BMC
>>> - TPM
>>> - System Planar
>>> - DCM 0 VRM
>>> - DCM 1 VRM
>>> - Base Op panel
>>> - Lcd Op panel
>>>
>>> Signed-off-by: Jinu Joy Thomas <jinu.joy.thomas@in.ibm.com>
>> Your patch looks good. Can you please find someone who has access to
>> the Rainier schematics to review your changes?
>>
>> Cheers,
>>
>> Joel
>>
>>> ---
>>>    arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 35 
>>> ++++++++++++++++++++
>>>    1 file changed, 35 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>>> b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>>> index cdc65eb28d20..7d2f3257b419 100644
>>> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>>> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>>> @@ -53,6 +53,11 @@
>>>
>>>    &i2c0 {
>>>        status = "okay";
>>> +
>>> +        eeprom@50 {
>>> +                compatible = "atmel,24c64";
>>> +                reg = <0x50>;
>>> +        };
>>>    };
>>>
>>>    &i2c1 {
>>> @@ -262,6 +267,16 @@
>>>            reg = <0x76>;
>>>            #io-channel-cells = <0>;
>>>        };
>>> +
>>> +        eeprom@50 {
>>> +                compatible = "atmel,24c64";
>>> +                reg = <0x50>;
>>> +        };
>>> +
>>> +        eeprom@51 {
>>> +                compatible = "atmel,24c64";
>>> +                reg = <0x51>;
>>> +        };


Hi Jinu,

These addresses appear to be lm25066 from the schematic. Also they're 
marked as hotplug? I'm not sure of the significance.


Thanks,

Eddie


>>>    };
>>>
>>>    &i2c8 {
>>> @@ -296,6 +311,16 @@
>>>            compatible = "ti,tmp275";
>>>            reg = <0x4a>;
>>>        };
>>> +
>>> +        eeprom@50 {
>>> +                compatible = "atmel,24c64";
>>> +                reg = <0x50>;
>>> +        };
>>> +
>>> +        eeprom@51 {
>>> +                compatible = "atmel,24c64";
>>> +                reg = <0x51>;
>>> +        };
>>>    };
>>>
>>>    &i2c9 {
>>> @@ -340,6 +365,11 @@
>>>            compatible = "infineon,ir35221";
>>>            reg = <0x74>;
>>>        };
>>> +
>>> +        eeprom@50 {
>>> +                compatible = "atmel,24c64";
>>> +                reg = <0x50>;
>>> +        };
>>>    };
>>>
>>>    &i2c10 {
>>> @@ -384,6 +414,11 @@
>>>            compatible = "infineon,ir35221";
>>>            reg = <0x74>;
>>>        };
>>> +        eeprom@50 {
>>> +                compatible = "atmel,24c64";
>>> +                reg = <0x50>;
>>> +        };
>>> +
>>>    };
>>>
>>>    &i2c11 {
>>> -- 
>>> 2.20.1 (Apple Git-117)
>>>
>
