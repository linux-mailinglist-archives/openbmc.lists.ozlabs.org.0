Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 818F564AB3
	for <lists+openbmc@lfdr.de>; Wed, 10 Jul 2019 18:23:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kPdC6sRHzDqKr
	for <lists+openbmc@lfdr.de>; Thu, 11 Jul 2019 02:23:43 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kPRk6Fh6zDq7h;
 Thu, 11 Jul 2019 02:15:30 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6AGDheM108876; Wed, 10 Jul 2019 12:15:21 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tngx670ac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jul 2019 12:15:21 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x6AG5Ghu015791;
 Wed, 10 Jul 2019 16:15:20 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03dal.us.ibm.com with ESMTP id 2tjk96vyp9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jul 2019 16:15:20 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6AGFJRt11011056
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Jul 2019 16:15:19 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9B9F112065;
 Wed, 10 Jul 2019 16:15:19 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B759112067;
 Wed, 10 Jul 2019 16:15:19 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 10 Jul 2019 16:15:19 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 10 Jul 2019 11:17:49 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH linux dev-5.2] ARM: dts: aspeed: Remove mbox node from
 device tree
In-Reply-To: <142fc044-fdc9-4a3b-a0eb-6034c1bd86b2@www.fastmail.com>
References: <20190708024749.22039-1-joel@jms.id.au>
 <142fc044-fdc9-4a3b-a0eb-6034c1bd86b2@www.fastmail.com>
Message-ID: <fc343b6b89f70cbf8fa53db62cdbb5f6@linux.vnet.ibm.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-10_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907100184
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
Cc: openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2019-07-08 19:03, Andrew Jeffery wrote:
> On Mon, 8 Jul 2019, at 12:18, Joel Stanley wrote:
>> This device driver was never upstreamed and so it has been dropped 
>> from
>> the tree. Remove the node from systems that had it enabled.
>> 
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
> 
> Acked-by: Andrew Jeffery <andrew@aj.id.au>
> 

Acked-by: Adriana Kobylak <anoo@us.ibm.com>

>> ---
>>  arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts   | 4 ----
>>  arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts | 4 ----
>>  arch/arm/boot/dts/aspeed-bmc-opp-swift.dts         | 4 ----
>>  3 files changed, 12 deletions(-)
>> 
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
>> b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
>> index c762c02dc716..628195b66d46 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
>> @@ -235,10 +235,6 @@
>>  	flash = <&spi1>;
>>  };
>> 
>> -&mbox {
>> -	status = "okay";
>> -};
>> -
>>  &mac0 {
>>  	status = "okay";
>>  	pinctrl-names = "default";
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
>> b/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
>> index a3d6b71518fc..73319917cb74 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
>> @@ -163,10 +163,6 @@
>>  	status = "okay";
>>  };
>> 
>> -&mbox {
>> -	status = "okay";
>> -};
>> -
>>  &pwm_tacho {
>>  	status = "okay";
>>  	pinctrl-names = "default";
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
>> b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
>> index 270c9236deff..caac895c60b4 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
>> @@ -317,10 +317,6 @@
>>  	flash = <&spi1>;
>>  };
>> 
>> -&mbox {
>> -	status = "okay";
>> -};
>> -
>>  &mac0 {
>>  	status = "okay";
>>  	pinctrl-names = "default";
>> --
>> 2.20.1
>> 
>> 
