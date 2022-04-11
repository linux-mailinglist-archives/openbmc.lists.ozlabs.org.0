Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AF44FC270
	for <lists+openbmc@lfdr.de>; Mon, 11 Apr 2022 18:32:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcZBT6Z1qz3bbN
	for <lists+openbmc@lfdr.de>; Tue, 12 Apr 2022 02:32:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NrBQeVsc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NrBQeVsc; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcZB36lGXz2ync
 for <openbmc@lists.ozlabs.org>; Tue, 12 Apr 2022 02:31:39 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23BFkJZ7024108; 
 Mon, 11 Apr 2022 16:31:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=iH9lBHJhM1J/gyBwR0y/mZ34Ldf8D+ODaA4+c/22vuM=;
 b=NrBQeVscIksbATe3LLXVqjIF4qLNRmr18Kdi5Jlx921F15cj1XQuPin6q7gRwUZOD2Bg
 eYeUhn5mSA7XguxCVeqpViK9hJgiJPJ2swJzaNovBLTv+7kHxdtw7Lnigwa7gmaKWNmK
 E3Itr4DpbueGOZmdXZfClkcPOxCNXC9WiS0MRUEBRV2i1d1TAEr2tOf38opK2ZhkTiTI
 C+BGd/NhF1Wf3wH51tTGc/jlKSs9VXbvv1OY7XIp0+ihn2VCTbu9ixsuOY5wNjM8scmi
 Tv9Rn0TE1PNAsQbWtGqRL7h23F9+DEl6fgk6TgM5VInOe1ZmGMHG0viGh8wQ1hYhoYoc /w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fcn584anq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 16:31:36 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23BGKp3Z023499;
 Mon, 11 Apr 2022 16:31:35 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fcn584ang-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 16:31:35 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23BG3pcD020199;
 Mon, 11 Apr 2022 16:06:37 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03dal.us.ibm.com with ESMTP id 3fb1s9n26s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 16:06:37 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23BG6aH025100720
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Apr 2022 16:06:36 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96BD8AE067;
 Mon, 11 Apr 2022 16:06:36 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1BA4AE063;
 Mon, 11 Apr 2022 16:06:35 +0000 (GMT)
Received: from [9.211.106.206] (unknown [9.211.106.206])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 11 Apr 2022 16:06:35 +0000 (GMT)
Message-ID: <fe69f04f-c356-b532-e82b-0b9b99e25c86@linux.ibm.com>
Date: Mon, 11 Apr 2022 11:06:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] leds: pca955x: Add HW blink support
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20220407183941.36555-1-eajames@linux.ibm.com>
 <20220407183941.36555-3-eajames@linux.ibm.com>
 <CAHp75VfcmhGitd6_6mDVG6_eE02sX2B3_iqZxeiX3iFDkmPShg@mail.gmail.com>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <CAHp75VfcmhGitd6_6mDVG6_eE02sX2B3_iqZxeiX3iFDkmPShg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lJmgO7uB-Y7vD9M0-dOWkcXc3w0CFTup
X-Proofpoint-ORIG-GUID: ARYE2VuD9cgdgj7BI5Lj9Gh-ZfgJXYJB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-11_06,2022-04-11_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204110091
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 4/8/22 06:19, Andy Shevchenko wrote:
> On Thu, Apr 7, 2022 at 10:43 PM Eddie James <eajames@linux.ibm.com> wrote:
>> Support blinking using the PCA955x chip. Use PWM0 for blinking
>> instead of LED_HALF brightness. Since there is only one frequency
>> and brightness register for any blinking LED, track the blink state
>> of each LED and only support one HW blinking frequency. If another
>> frequency is requested, fallback to software blinking.
> ...
>
>> +#define PCA955X_BLINK_DEFAULT  1000
> What's the unit of this number?


milliseconds, I'll change the name to reflect that.


>
> ...
>
>>    * Write to frequency prescaler register, used to program the
>> - * period of the PWM output.  period = (PSCx + 1) / 38
>> + * period of the PWM output.  period = (PSCx + 1) / <38 or 44, chip dependent>
> Using <> in  formulas a bit confusing, what about
>
>   * period of the PWM output.  period = (PSCx + 1) / coeff
>   * where for ... chips coeff = 38, for ... chips coeff = 44.
>
> ?


Ack.


>
> ...
>
>> +               dev_err(&pca955x->client->dev, "%s: reg 0x%x, err %d\n",
>> +                       __func__, n, ret);
> Can be indented better. But I would rather see regmap, where this kind
> of debugging is for free and already present in the regmap core/.


Agree, but perhaps for a future enhancement?


>
> ...
>
>> +static u8 pca955x_period_to_psc(struct pca955x *pca955x, unsigned long p)
>> +{
>> +       p *= (unsigned long)pca955x->chipdef->blink_div;
> Why casting?


Ack, and all the rest. Will get a v2 up.


Thanks Andy.

Eddie

