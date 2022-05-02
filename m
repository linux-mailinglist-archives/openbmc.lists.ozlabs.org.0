Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F475170A4
	for <lists+openbmc@lfdr.de>; Mon,  2 May 2022 15:36:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KsPJG0hHTz3bYq
	for <lists+openbmc@lfdr.de>; Mon,  2 May 2022 23:36:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oHJPZH+v;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=oHJPZH+v; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KsPHl3myGz3064
 for <openbmc@lists.ozlabs.org>; Mon,  2 May 2022 23:36:02 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 242CJmUM029741;
 Mon, 2 May 2022 13:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=MXtBUfzBb3I8T1gplp5O/d2Vu5W/bN1D/NzKqTAZwE8=;
 b=oHJPZH+vhoEPQ3vCUwBexRrZjWKFKqD6shA37aC9UzdE7jM7NxuaVLqG//7cu2CPWHrz
 gkfqTs+qA4TwrfJVz4llrHyV7mH0IUOox9P1+ueKSZpKaFJax8pwoDLgMrrBdCz5vU9d
 6TDiUSf9SUEb2DNtsHH/xiVnQ93vN/vgEa4Zza23mCJY+EIUOisX4EuKnrU9ioMKG/6d
 9eQJLqUxU2ZphmwVDEBniIV6EzoaReXeyn3gTOUVLB4vRe5SDtOw+aKumF1S3JoYSyfJ
 eEvWN3XzzA02WiaN3tJ80+vb4eTF9bNh1soo1AFN+205YUyRUECwUhzEYRlmt9vIh44H mQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fte23u73g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 May 2022 13:35:57 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 242DSA83013064;
 Mon, 2 May 2022 13:35:57 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 3frvr95ggy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 May 2022 13:35:57 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 242DZuDl13173214
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 May 2022 13:35:56 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4EAFBE053;
 Mon,  2 May 2022 13:35:56 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 758C3BE058;
 Mon,  2 May 2022 13:35:56 +0000 (GMT)
Received: from [9.163.26.47] (unknown [9.163.26.47])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  2 May 2022 13:35:56 +0000 (GMT)
Message-ID: <c651373b-97f1-acb6-9071-5c8a5aefd796@linux.ibm.com>
Date: Mon, 2 May 2022 08:35:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH linux dev-5.15] leds: pca955x: Set blink duty cycle to
 fifty percent
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>
References: <20220427184513.21192-1-eajames@linux.ibm.com>
 <2483e26b-cfe6-b694-7da6-0eb09d5b1bd9@molgen.mpg.de>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <2483e26b-cfe6-b694-7da6-0eb09d5b1bd9@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4WJkdWZYW4BvrUPClF29tW_Odb1tiBiH
X-Proofpoint-ORIG-GUID: 4WJkdWZYW4BvrUPClF29tW_Odb1tiBiH
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-02_04,2022-05-02_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1011 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205020106
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
Cc: openbmc@lists.ozlabs.org, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 4/28/22 10:12, Paul Menzel wrote:
> Dear Eddie,
>
>
> Am 27.04.22 um 20:45 schrieb Eddie James:
>> In order to blink at the specified rate, the blinking LEDs
>> need to maintain a 50% duty cycle. Therefore, don't use PWM0
>> for any attempted brightness change, and set PWM0 when
>> enabling blinking.
>
> Is that specified in some datasheet?


It is in the PCA955X datasheets 
(https://www.nxp.com/docs/en/data-sheet/PCA9552.pdf) but it's not 
exactly clear. The relationship between the PWM rate and the blink rate 
is not specified, but for example, setting maximum duty cycle and 1 
second blink period results in the LED not blinking. Setting 50% duty 
cycle blinks the LED at 1 second intervals, as expected.


>
> Nit: I’d write 50 % in the commit message summary.


Ah ok. Thanks!

Eddie


>
>
> Kind regards,
>
> Paul
>
>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   drivers/leds/leds-pca955x.c | 17 ++++++++++-------
>>   1 file changed, 10 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
>> index 2570f92b6754..da93f04e4d10 100644
>> --- a/drivers/leds/leds-pca955x.c
>> +++ b/drivers/leds/leds-pca955x.c
>> @@ -289,17 +289,12 @@ static enum led_brightness 
>> pca955x_led_get(struct led_classdev *led_cdev)
>>         switch (pca955x_ledstate(ls, pca955x_led->led_num % 4)) {
>>       case PCA955X_LS_LED_ON:
>> +    case PCA955X_LS_BLINK0:
>>           ret = LED_FULL;
>>           break;
>>       case PCA955X_LS_LED_OFF:
>>           ret = LED_OFF;
>>           break;
>> -    case PCA955X_LS_BLINK0:
>> -        ret = pca955x_read_pwm(pca955x, 0, &pwm);
>> -        if (ret)
>> -            return ret;
>> -        ret = 256 - pwm;
>> -        break;
>>       case PCA955X_LS_BLINK1:
>>           ret = pca955x_read_pwm(pca955x, 1, &pwm);
>>           if (ret)
>> @@ -332,7 +327,7 @@ static int pca955x_led_set(struct led_classdev 
>> *led_cdev,
>>               clear_bit(pca955x_led->led_num, &pca955x->active_blink);
>>               ls = pca955x_ledsel(ls, bit, PCA955X_LS_LED_OFF);
>>           } else {
>> -            ret = pca955x_write_pwm(pca955x, 0, 256 - value);
>> +            /* No variable brightness for blinking LEDs */
>>               goto out;
>>           }
>>       } else {
>> @@ -432,6 +427,14 @@ static int pca955x_led_blink(struct led_classdev 
>> *led_cdev,
>>               ret = pca955x_write_ls(pca955x, reg, ls);
>>               if (ret)
>>                   goto out;
>> +
>> +            /*
>> +             * Force 50% duty cycle to maintain the specified
>> +             * blink rate.
>> +             */
>> +            ret = pca955x_write_pwm(pca955x, 0, 128);
>> +            if (ret)
>> +                goto out;
>>           }
>>             if (pca955x->blink_period != p) {
