Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E718B46C49D
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 21:28:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7sMC5Z16z3015
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 07:28:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h18mYXVu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=h18mYXVu; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7sLk0fhvz2yPv
 for <openbmc@lists.ozlabs.org>; Wed,  8 Dec 2021 07:28:13 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B7KM8p3030250; 
 Tue, 7 Dec 2021 20:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=+vGvN2iZOtStJOScKQDdF4Wc/2E0aQHQ/08Sk7tPuD8=;
 b=h18mYXVucp7miS6oL8ZqqUkci9Ila8Q/ZWbG+fWqSmXsAK+iRknlaet4WXlju1wM1Uvv
 EWtykg2EwhL4gXxNyQLdQIW8Kxa7XLjIW7vENtw68kn49gF28e3sKLvkrVulhRDvH/q+
 ru5UBjH4TdopRWaGkmVhLxxECeIMVeptij8IRdO0+m1xRniDFEzk2OubhZhJpBL5JwiG
 ktZAUYON/KqVrjK7HKvlxcV7DsTQlX3AA4ML6G5Li+SxdCP4VwG+1S3FccDszYNrvkId
 DerCrkPlvVgykxirmxGNSle+mTsq4syBgv73sHaUTF9s5KGVQp57SELfjxuKyxEbJz7G QQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ctek983g9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 20:28:08 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B7KRqpd005508;
 Tue, 7 Dec 2021 20:28:08 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 3cqyyb2h5w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 20:28:07 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B7KS6HH55181658
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Dec 2021 20:28:06 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F247AC069;
 Tue,  7 Dec 2021 20:28:06 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A2B3FAC064;
 Tue,  7 Dec 2021 20:28:05 +0000 (GMT)
Received: from [9.211.98.136] (unknown [9.211.98.136])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  7 Dec 2021 20:28:05 +0000 (GMT)
Message-ID: <1dfc35d0-c888-692e-dee3-342753d7228c@linux.ibm.com>
Date: Tue, 7 Dec 2021 14:28:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH linux dev-5.15 1/2] ARM: dts: Aspeed: Rainier: Add GPIO
 hog for USB power control
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20211206213218.104318-1-eajames@linux.ibm.com>
 <CACPK8XehjN1cvRPhOiVYh+3CARJnsr5yPZSwLHAoaLgVrF6gHA@mail.gmail.com>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <CACPK8XehjN1cvRPhOiVYh+3CARJnsr5yPZSwLHAoaLgVrF6gHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: f0QRk_aFhFtLY-n4CVsJnnXQCJrCi7t3
X-Proofpoint-ORIG-GUID: f0QRk_aFhFtLY-n4CVsJnnXQCJrCi7t3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-07_08,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0 mlxlogscore=999
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112070125
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


On 12/6/21 16:54, Joel Stanley wrote:
> On Mon, 6 Dec 2021 at 21:32, Eddie James <eajames@linux.ibm.com> wrote:
>> Set the USB power control to always on.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> index 866f32cdccea..b2af8ad09d33 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> @@ -255,7 +255,7 @@ &gpio0 {
>>          /*L0-L7*/       "","","","","","","","",
>>          /*M0-M7*/       "","","","","","","","",
>>          /*N0-N7*/       "","","","","","","","",
>> -       /*O0-O7*/       "","","","usb-power","","","","",
> Do we want to remove the pin from the gpio-names? Can we leave it
> there as documentation, or does it conflict?


I don't know; The pin isn't documented so I thought it better to remove 
it from the line names. Then below, I named it according to the board 
spec, which somewhat fits with the i2c mux hog. I'm open to whatever we 
think is best here.


Thanks!

Eddie


>
>> +       /*O0-O7*/       "","","","","","","","",
>>          /*P0-P7*/       "","","","","pcieslot-power","","","",
>>          /*Q0-Q7*/       "cfam-reset","","regulator-standby-faulted","","","","","",
>>          /*R0-R7*/       "bmc-tpm-reset","power-chassis-control","power-chassis-good","","","","","",
>> @@ -275,6 +275,13 @@ i2c3_mux_oe_n {
>>                  output-high;
>>                  line-name = "I2C3_MUX_OE_N";
>>          };
>> +
>> +       usb_power_en_n {
>> +               gpio-hog;
>> +               gpios = <ASPEED_GPIO(O, 3) GPIO_ACTIVE_LOW>;
>> +               output-high;
>> +               line-name = "USB_POWER_EN_N";
> This contradicts what you called it above.
>
>> +       };
>>   };
>>
>>   &emmc_controller {
>> --
>> 2.27.0
>>
