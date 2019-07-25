Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFD074FBD
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2019 15:40:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vYHJ4frrzDqQZ
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2019 23:39:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vYGF6NFNzDqPT;
 Thu, 25 Jul 2019 23:39:00 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6PDbcUJ059200; Thu, 25 Jul 2019 09:38:51 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tyd6ps0cg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jul 2019 09:38:51 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x6PDZam1007939;
 Thu, 25 Jul 2019 13:38:46 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 2tx61n6w0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jul 2019 13:38:46 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6PDcjuG40436048
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Jul 2019 13:38:45 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9749283C2;
 Thu, 25 Jul 2019 13:38:45 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18B88283AC;
 Thu, 25 Jul 2019 13:38:45 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 25 Jul 2019 13:38:44 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 25 Jul 2019 08:41:52 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH linux dev-5.2] ARM: dts: aspeed: swift: Fix FSI GPIOs
In-Reply-To: <7f2c08f5-a04d-499c-b59b-3d62d7f025af@www.fastmail.com>
References: <20190719203037.11795-1-mspinler@linux.ibm.com>
 <7f2c08f5-a04d-499c-b59b-3d62d7f025af@www.fastmail.com>
Message-ID: <28d5c3f99df3c11bc04ba5d79626fec8@linux.vnet.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-25_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907250159
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
Cc: Matt Spinler <spinler@us.ibm.com>, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, Matt Spinler <mspinler@linux.ibm.com>,
 openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2019-07-23 19:32, Andrew Jeffery wrote:
> On Sat, 20 Jul 2019, at 06:01, Matt Spinler wrote:
>> From: Matt Spinler <spinler@us.ibm.com>
>> 
>> Change the FSI clock and data GPIOs to match what the hardware turned
>> out to use.
>> 
>> Signed-off-by: Matt Spinler <spinler@us.ibm.com>
> 
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Adriana Kobylak <anoo@us.ibm.com>

Schematics have been updated.

> 
> And yeah, please make sure to include relevant lists in the future as 
> Olof
> mentioned.
> 
> Andrew
> 
>> ---
>>  arch/arm/boot/dts/aspeed-bmc-opp-swift.dts | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
>> b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
>> index caac895c60b4..f14f745b34ca 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
>> @@ -207,8 +207,8 @@
>>  		#size-cells = <0>;
>>  		no-gpio-delays;
>> 
>> -		clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
>> -		data-gpios = <&gpio ASPEED_GPIO(E, 0) GPIO_ACTIVE_HIGH>;
>> +		clock-gpios = <&gpio ASPEED_GPIO(P, 1) GPIO_ACTIVE_HIGH>;
>> +		data-gpios = <&gpio ASPEED_GPIO(P, 2) GPIO_ACTIVE_HIGH>;
>>  		mux-gpios = <&gpio ASPEED_GPIO(P, 4) GPIO_ACTIVE_HIGH>;
>>  		enable-gpios = <&gpio ASPEED_GPIO(P, 0) GPIO_ACTIVE_HIGH>;
>>  		trans-gpios = <&gpio ASPEED_GPIO(P, 3) GPIO_ACTIVE_HIGH>;
>> --
>> 2.22.0
>> 
>> 
