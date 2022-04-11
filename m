Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7004FC032
	for <lists+openbmc@lfdr.de>; Mon, 11 Apr 2022 17:17:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcXXt1frzz3bWx
	for <lists+openbmc@lfdr.de>; Tue, 12 Apr 2022 01:17:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PUhFJyGh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PUhFJyGh; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcXXM57xPz2xsm
 for <openbmc@lists.ozlabs.org>; Tue, 12 Apr 2022 01:17:22 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23BDmdct030005; 
 Mon, 11 Apr 2022 15:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Wexj+HWaU6vLgwDQsWYPJ9KbhO7qyvQywXRQlLh7xZQ=;
 b=PUhFJyGhVUumL20txeq+D3t211cps4xMKEoaQdgM7zyqcL1DwYsW8vgqIJiMx8x1hf3N
 PNy0xCge11WmIBN6RHGu0sV+TmvmzF7hbinYlhf8j0RmoA2bIdTssDpLVUETuZ9gi1fV
 JRTZn9nUPEitZHSn2jpohJtJBIDhbI4Pf1ZbuDVeMMWkYjVsgrbdgS2RTqYQRuiaPzCl
 IgMvazlXeeF77GJ7NyVi165Enk7oH8dd4jJ504v8i5AAjywUcxu6zFEIlbAuHZBtsOfx
 lVzSS5fM28heXvq5hvRuZ7vUwVUMPoXL4LeFf9seZgqBC2ddpeRAmlx7C7Q0elnh3YAo TQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fcks94qdw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 15:17:18 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23BFHHSe015571;
 Mon, 11 Apr 2022 15:17:17 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fcks94qdj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 15:17:17 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23BFDH0G014511;
 Mon, 11 Apr 2022 15:17:16 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 3fb1s94pw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 15:17:16 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23BFHFrk25100724
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Apr 2022 15:17:16 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DECAAAE064;
 Mon, 11 Apr 2022 15:17:15 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F347AE062;
 Mon, 11 Apr 2022 15:17:15 +0000 (GMT)
Received: from [9.211.106.206] (unknown [9.211.106.206])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 11 Apr 2022 15:17:15 +0000 (GMT)
Message-ID: <47f566cc-bdff-0f4f-557d-b069100911c3@linux.ibm.com>
Date: Mon, 11 Apr 2022 10:17:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] leds: pca955x: Clean up and optimize
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20220407183941.36555-1-eajames@linux.ibm.com>
 <20220407183941.36555-2-eajames@linux.ibm.com>
 <CAHp75VedZdEYB-BjJTVaKJgPwQ9a1DhTp=MYsrh1Ve9Eyfnytw@mail.gmail.com>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <CAHp75VedZdEYB-BjJTVaKJgPwQ9a1DhTp=MYsrh1Ve9Eyfnytw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: etKwe3NLEd6Z7glho5IQ0QJNxjw7N1i4
X-Proofpoint-ORIG-GUID: KVAdM8862jJhTOXTU87YJCBjxK3RL8sv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-11_06,2022-04-11_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=535 mlxscore=0 phishscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204110083
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


On 4/8/22 06:11, Andy Shevchenko wrote:
> On Thu, Apr 7, 2022 at 10:42 PM Eddie James <eajames@linux.ibm.com> wrote:
>> Clean up the I2C access functions to avoid fetching the pca955x
>> driver data again. Optimize the probe to do at most 4 reads and
>> 4 writes of the LED selector regs, rather than 16 of each.
>> Rename some functions and variables to be more consistent and
>> descriptive.
> Separate patch.


Ack.



>
>> +               dev_err(&pca955x->client->dev,
>> +                       "%s: reg 0x%x, val 0x%x, err %d\n", __func__, n, val,
>> +                       ret);
> This can be indented better.
>
> I would add a temporary dev pointer variable and put this on one line.
>
>   struct device *dev = &pca955x->client->dev;
>
>                 dev_err(dev, "%s: reg 0x%x, val 0x%x, err %d\n",
> __func__, n, val, ret);


Hm, I still end up having to use two lines for the dev_err function, so 
not sure it's worth it?


>
> ...
>
>> +               dev_err(&pca955x->client->dev,
>> +                       "%s: reg 0x%x, val 0x%x, err %d\n", __func__, n, val,
>> +                       ret);
> Ditto.
>
> ...
>
>> +               dev_err(&pca955x->client->dev,
>> +                       "%s: reg 0x%x, val 0x%x, err %d\n", __func__, n, val,
>> +                       ret);
> Ditto.
>
> ...
>
>> +               dev_err(&pca955x->client->dev, "%s: reg 0x%x, err %d\n",
>>                          __func__, n, ret);
> Ditto.
>
> ...
>
>> +               dev_err(&pca955x->client->dev, "%s: reg 0x%x, err %d\n",
>>                          __func__, n, ret);
> Ditto.
>
> ...
>
>> +       struct pca955x_led *pca955x_led = container_of(led_cdev,
>> +                                                      struct pca955x_led,
>> +                                                      led_cdev);
> Is it used once? If more than once, consider a helper for that as well.


Ack.


Thanks for the review!

Eddie

>
