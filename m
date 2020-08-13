Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 655DA243714
	for <lists+openbmc@lfdr.de>; Thu, 13 Aug 2020 11:03:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BS0w45z2wzDqYt
	for <lists+openbmc@lfdr.de>; Thu, 13 Aug 2020 19:03:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=dkodihal@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pYMRct/F; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BS0v13NlhzDqZC
 for <openbmc@lists.ozlabs.org>; Thu, 13 Aug 2020 19:02:04 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D91osX119115
 for <openbmc@lists.ozlabs.org>; Thu, 13 Aug 2020 05:02:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=MLzG7UG5oHnAnFM9XNt9CLvBWeQ9fFnPfBj4WanGKX0=;
 b=pYMRct/Fr5SZ0pGxJR9cecF+xBjWUdnPv/Em/l+Os2NIqg9ONJuNJtKsY/iLXm3FxzKD
 /qZ2WcRJoRTk/C9h8/9IBtysBWNQKJ9t4461NN8xdunchbpE6pDKHp04v+/XpbT1iuZ/
 Hjk1+Xyjr20FNQ/7+FQ3904sIM5jK0gq//Jo4MnsRXwjjYrvqk/efD3Tw6fD/y/taROY
 bFYQXNjitQ4noW83z8TiU3hLdwSin3XDZsK8gfj81QnstJljCprj+9MdlU9jPca75P7x
 oMc2ntOrgfUOkTznwFf5FbYPoV47wSf+2i//I7s37mW+1saw1YCQnKhtZdN2ZbVjtuFX +Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32vcsypa4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 13 Aug 2020 05:02:02 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07D91wbn119753
 for <openbmc@lists.ozlabs.org>; Thu, 13 Aug 2020 05:02:01 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32vcsyp9y5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 05:02:01 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07D8tMlg015516;
 Thu, 13 Aug 2020 09:01:53 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 32skp7ua1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 09:01:53 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 07D90NOX59113868
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Aug 2020 09:00:23 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7D5AA405D;
 Thu, 13 Aug 2020 09:01:50 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A769A4051;
 Thu, 13 Aug 2020 09:01:49 +0000 (GMT)
Received: from Deepaks-MacBook-Pro.local (unknown [9.79.255.166])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 13 Aug 2020 09:01:49 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.7 2/2] rainier: Add LEDs that are controlled
 by ASPEED
To: Joel Stanley <joel@jms.id.au>,
 Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>,
 Andrew Geissler <geissonator@yahoo.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <1596022243-8788-1-git-send-email-vishwa@linux.vnet.ibm.com>
 <CACPK8XdV8P4S2k+fkatMDBmDKHTHFto_sDbg1mJt_EOPR2LS+g@mail.gmail.com>
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Message-ID: <5d413a3f-a5f3-fd3c-37db-aaeaf5b5901c@linux.vnet.ibm.com>
Date: Thu, 13 Aug 2020 14:31:48 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XdV8P4S2k+fkatMDBmDKHTHFto_sDbg1mJt_EOPR2LS+g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_06:2020-08-13,
 2020-08-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 adultscore=0 mlxlogscore=999 malwarescore=0 phishscore=0
 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008130064
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, vishwa@linux.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 13/08/20 8:45 am, Joel Stanley wrote:
> On Wed, 29 Jul 2020 at 11:30, <vishwa@linux.vnet.ibm.com> wrote:
>>
>> From: Vishwanatha Subbanna <vishwa@linux.ibm.com>
>>
>> These are the LEDs that have direct GPIO connection from ASPEED
> 
> Do you mean directly connected to the BMC, and not via a GPIO expander?
> 
> Convetion is to name the patches with a prefix:
> 
>   ARM: dts: aspeed: rainier: Add directly controlled LEDs
> 
> 
>>
>> Signed-off-by: Vishwanatha Subbanna <vishwa@linux.ibm.com>
>> Reviewed-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 24 ++++++++++++++++++++++--
>>   1 file changed, 22 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> index 9b28a30..d1a588f 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> @@ -124,6 +124,26 @@
>>          leds {
>>                  compatible = "gpio-leds";
>>
>> +               /* BMC Card fault LED at the back */
>> +               bmc-ingraham0 {
>> +                       gpios = <&gpio0 ASPEED_GPIO(H, 1) GPIO_ACTIVE_LOW>;
>> +               };
>> +
>> +               /* Enclosure ID LED at the back */
>> +               rear-enc-id0 {
>> +                       gpios = <&gpio0 ASPEED_GPIO(H, 2) GPIO_ACTIVE_LOW>;
>> +               };
>> +
>> +               /* Enclosure fault LED at the back */
>> +               rear-enc-fault0 {
>> +                       gpios = <&gpio0 ASPEED_GPIO(H, 3) GPIO_ACTIVE_LOW>;
>> +               };
>> +
>> +               /* PCIE slot power LED */
>> +               pcieslot-power {
>> +                       gpios = <&gpio0 ASPEED_GPIO(P, 4) GPIO_ACTIVE_LOW>;
>> +               };
>> +
>>                  /* System ID LED that is at front on Op Panel */
>>                  front-sys-id0 {
>>                          retain-state-shutdown;
>> @@ -167,7 +187,7 @@
>>          /*E0-E7*/       "","","","","","","","",
>>          /*F0-F7*/       "","","","","","","","",
>>          /*G0-G7*/       "","","","","","","","",
>> -       /*H0-H7*/       "","","","","","","","",
>> +       /*H0-H7*/       "","bmc-ingraham0","rear-enc-id0","rear-enc-fault0","","","","",
> 
> I think the guideline is to name GPIOs based on their use, so
> bmc-ingraham0 should be fault-bmc-ingraham0 if we follow the psu
> presence GPIO convention of function-name.
> 
> I think we had some documentation written up on naming conventions.

There is 
https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md.

Regards,
Deepak
