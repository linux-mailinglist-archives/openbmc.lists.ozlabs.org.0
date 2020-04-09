Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDDB1A3BF3
	for <lists+openbmc@lfdr.de>; Thu,  9 Apr 2020 23:30:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yvSx6G35zDrKq
	for <lists+openbmc@lfdr.de>; Fri, 10 Apr 2020 07:30:41 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yvS91JhmzDrK2
 for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2020 07:30:00 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 039L41bE036168; Thu, 9 Apr 2020 17:29:53 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3091yn4mnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Apr 2020 17:29:53 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 039LT28q032705;
 Thu, 9 Apr 2020 21:29:52 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 3091mec20n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Apr 2020 21:29:52 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 039LTp6b49807798
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Apr 2020 21:29:51 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 715EB6A057;
 Thu,  9 Apr 2020 21:29:51 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 465786A04D;
 Thu,  9 Apr 2020 21:29:51 +0000 (GMT)
Received: from [9.163.95.55] (unknown [9.163.95.55])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  9 Apr 2020 21:29:51 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.4] clk: ast2600: Fix AHB clock divider for A1
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <20200408202711.3509-1-eajames@linux.ibm.com>
 <71cfd9fd-a70f-47ad-8c54-b950e32c0fef@www.fastmail.com>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <afc1c465-3bfc-1f8a-7f61-96329643b02c@linux.ibm.com>
Date: Thu, 9 Apr 2020 16:29:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <71cfd9fd-a70f-47ad-8c54-b950e32c0fef@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-09_08:2020-04-07,
 2020-04-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004090149
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 4/8/20 11:53 PM, Andrew Jeffery wrote:
>
> On Thu, 9 Apr 2020, at 05:57, Eddie James wrote:
>> The latest specs for the AST2600 A1 chip include some different bit
>> definitions for calculating the AHB clock divider. Implement these in
>> order to get the correct AHB clock value in Linux.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   drivers/clk/clk-ast2600.c | 31 +++++++++++++++++++++++++------
>>   1 file changed, 25 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
>> index 42bfdc16bf7a..35f53956c762 100644
>> --- a/drivers/clk/clk-ast2600.c
>> +++ b/drivers/clk/clk-ast2600.c
>> @@ -642,14 +642,22 @@ static const u32 ast2600_a0_axi_ahb_div_table[] = {
>>   	2, 2, 3, 5,
>>   };
>>   
>> -static const u32 ast2600_a1_axi_ahb_div_table[] = {
>> -	4, 6, 2, 4,
>> +static const u32 ast2600_a1_axi_ahb_div0_tbl[] = {
>> +	3, 2, 3, 4,
>> +};
>> +
>> +static const u32 ast2600_a1_axi_ahb_div1_tbl[] = {
>> +	3, 4, 6, 8,
>> +};
>> +
>> +static const u32 ast2600_a1_axi_ahb200_tbl[] = {
>> +	3, 4, 3, 4, 2, 2, 2, 2,
>>   };
>>   
>>   static void __init aspeed_g6_cc(struct regmap *map)
>>   {
>>   	struct clk_hw *hw;
>> -	u32 val, div, chip_id, axi_div, ahb_div;
>> +	u32 val, div, divbits, chip_id, axi_div, ahb_div;
>>   
>>   	clk_hw_register_fixed_rate(NULL, "clkin", NULL, 0, 25000000);
>>   
>> @@ -679,11 +687,22 @@ static void __init aspeed_g6_cc(struct regmap *map)
>>   	else
>>   		axi_div = 2;
>>   
>> +	divbits = (val >> 11) & 0x3;
>>   	regmap_read(map, ASPEED_G6_SILICON_REV, &chip_id);
>> -	if (chip_id & BIT(16))
>> -		ahb_div = ast2600_a1_axi_ahb_div_table[(val >> 11) & 0x3];
>> -	else
>> +	if (chip_id & BIT(16)) {
>> +		if (!divbits) {
>> +			ahb_div = ast2600_a1_axi_ahb200_tbl[(val >> 8) & 0x3];
>> +			if (val & BIT(16))
>> +				ahb_div *= 2;
>> +		} else {
>> +			if (val & BIT(16))
>> +				ahb_div = ast2600_a1_axi_ahb_div1_tbl[divbits];
>> +			else
>> +				ahb_div = ast2600_a1_axi_ahb_div0_tbl[divbits];
>> +		}
>> +	} else {
>>   		ahb_div = ast2600_a0_axi_ahb_div_table[(val >> 11) & 0x3];
>> +	}
> This was hard for me to read. Have you considered giving the conditions
> names?


Yea it's a bit complicated. Do you mean use some boolean variables or 
add some comments?

Thanks,

Eddie


>
> Andrew
