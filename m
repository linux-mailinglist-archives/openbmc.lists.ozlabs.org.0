Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7362DAABC3
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 21:10:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PVdB1KyLzDr5D
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2019 05:10:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PVcQ3Xp4zDqs1
 for <openbmc@lists.ozlabs.org>; Fri,  6 Sep 2019 05:09:41 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x85J2TXK111757; Thu, 5 Sep 2019 15:09:33 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uu72n2c4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Sep 2019 15:09:32 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x85J0Fda003373;
 Thu, 5 Sep 2019 19:09:32 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 2uqgh7mpwg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Sep 2019 19:09:32 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x85J9Ujf46334232
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Sep 2019 19:09:30 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B16C6E052;
 Thu,  5 Sep 2019 19:09:30 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDB5E6E04C;
 Thu,  5 Sep 2019 19:09:29 +0000 (GMT)
Received: from [9.41.179.222] (unknown [9.41.179.222])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  5 Sep 2019 19:09:29 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.2 2/2] i2c: Aspeed: Add AST2600 compatible
To: Andrew Jeffery <andrew@aj.id.au>, Eddie James <eajames@linux.ibm.com>,
 openbmc@lists.ozlabs.org
References: <1567629311-7553-1-git-send-email-eajames@linux.ibm.com>
 <1567629311-7553-2-git-send-email-eajames@linux.ibm.com>
 <a01c913e-1ae9-4aad-83a3-dec3dbd5b7f4@www.fastmail.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Message-ID: <d6ee4952-6d29-b0e9-08d1-6647472a2dad@linux.vnet.ibm.com>
Date: Thu, 5 Sep 2019 14:09:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a01c913e-1ae9-4aad-83a3-dec3dbd5b7f4@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-05_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909050177
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


On 9/4/19 10:02 PM, Andrew Jeffery wrote:
>
> On Thu, 5 Sep 2019, at 06:05, Eddie James wrote:
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Have you tested this on hardware? What was the outcome?


Yes. The I2C devices I accessed through hwmon worked fine, including the 
PSU, tmp275, and ir35521. I didn't check every single device on every 
bus, but everything seemed to probe up fine.


Thanks,

Eddie


>
> Andrew
>
>> ---
>>   drivers/i2c/busses/i2c-aspeed.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
>> index 8931792..1943977 100644
>> --- a/drivers/i2c/busses/i2c-aspeed.c
>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>> @@ -1274,6 +1274,10 @@ static int aspeed_i2c_reset(struct aspeed_i2c_bus *bus)
>>   		.compatible = "aspeed,ast2500-i2c-bus",
>>   		.data = aspeed_i2c_25xx_get_clk_reg_val,
>>   	},
>> +	{
>> +		.compatible = "aspeed,ast2600-i2c-bus",
>> +		.data = aspeed_i2c_25xx_get_clk_reg_val,
>> +	},
>>   	{ },
>>   };
>>   MODULE_DEVICE_TABLE(of, aspeed_i2c_bus_of_table);
>> -- 
>> 1.8.3.1
>>
>>
