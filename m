Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE78819B60F
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 20:58:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48swSh6WJpzDqkc
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 05:58:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48swS33061zDqHk
 for <openbmc@lists.ozlabs.org>; Thu,  2 Apr 2020 05:57:39 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 031IZXZE132496; Wed, 1 Apr 2020 14:57:36 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3043g8m84r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 14:57:36 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 031ItIK8017931;
 Wed, 1 Apr 2020 18:57:35 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02wdc.us.ibm.com with ESMTP id 301x7732qd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 18:57:35 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 031IvYjE53674352
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 18:57:34 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD3D56A054;
 Wed,  1 Apr 2020 18:57:34 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 809C36A051;
 Wed,  1 Apr 2020 18:57:34 +0000 (GMT)
Received: from [9.163.16.235] (unknown [9.163.16.235])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  1 Apr 2020 18:57:34 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.4] ARM: dts: Aspeed: Tacoma: Add iio-hwmon
 nodes for IIO devices
To: Joel Stanley <joel@jms.id.au>
References: <20200330211430.13064-1-eajames@linux.ibm.com>
 <CACPK8XcSvozg23MzbAoJP85ACnCvc8Hx6sFC7ye8BNR71=L6KQ@mail.gmail.com>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <699bee76-27fa-c3ec-128e-e58b66505234@linux.ibm.com>
Date: Wed, 1 Apr 2020 13:57:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XcSvozg23MzbAoJP85ACnCvc8Hx6sFC7ye8BNR71=L6KQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_04:2020-03-31,
 2020-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 clxscore=1015
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010151
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


On 3/30/20 4:36 PM, Joel Stanley wrote:
> On Mon, 30 Mar 2020 at 21:14, Eddie James <eajames@linux.ibm.com> wrote:
>> Connect the BMP280 and DPS310 to the hwmon subsystem with iio-hwmon
>> nodes.
> The BMP280 was on pre-production witherspoons. I imagine most of the
> ones we're using have dps310. Can we drop the bmp280 support?


Yes, sent a new patch for that, so this one can be abandoned.


Thanks,

Eddie


>
> Cheers,
>
> Joel
>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
>> index ff49ec76fa7c..374512a83f33 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
>> @@ -89,6 +89,16 @@
>>                          linux,code = <7>;
>>                  };
>>          };
>> +
>> +       iio-hwmon-dps310 {
>> +               compatible = "iio-hwmon";
>> +               io-channels = <&dps 0>;
>> +       };
>> +
>> +       iio-hwmon-bmp280 {
>> +               compatible = "iio-hwmon";
>> +               io-channels = <&bmp 1>;
>> +       };
>>   };
>>
>>   &fmc {
>> --
>> 2.24.0
>>
