Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9453C233ADF
	for <lists+openbmc@lfdr.de>; Thu, 30 Jul 2020 23:32:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHkCD14ldzDrCM
	for <lists+openbmc@lfdr.de>; Fri, 31 Jul 2020 07:32:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHkBH2rQTzDrBd
 for <openbmc@lists.ozlabs.org>; Fri, 31 Jul 2020 07:31:34 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06UL2Krl041858; Thu, 30 Jul 2020 17:31:28 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32m2b3xcc7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 17:31:28 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06ULJRnI032163;
 Thu, 30 Jul 2020 21:31:27 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 32gcy65fnn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Jul 2020 21:31:27 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06ULVLjc44105998
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jul 2020 21:31:21 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8518BE053;
 Thu, 30 Jul 2020 21:31:23 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88004BE058;
 Thu, 30 Jul 2020 21:31:23 +0000 (GMT)
Received: from [9.163.50.101] (unknown [9.163.50.101])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 30 Jul 2020 21:31:23 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.7 2/6] spi: fsi: Fix clock running too fast
To: Joel Stanley <joel@jms.id.au>, Dean Sanner <dsanner@us.ibm.com>,
 Joachim Fenkes <FENKES@de.ibm.com>
References: <20200729204528.15157-1-eajames@linux.ibm.com>
 <20200729204528.15157-3-eajames@linux.ibm.com>
 <CACPK8Xc48KTbw7ZnXTWgEaAiY_Rif-k_Q2Q5ZtZ0U9L+iCMEGA@mail.gmail.com>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <c3847a85-c58c-9019-ce97-cdd40eb3579c@linux.ibm.com>
Date: Thu, 30 Jul 2020 16:31:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xc48KTbw7ZnXTWgEaAiY_Rif-k_Q2Q5ZtZ0U9L+iCMEGA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-30_15:2020-07-30,
 2020-07-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007300144
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 7/29/20 6:25 PM, Joel Stanley wrote:
> On Wed, 29 Jul 2020 at 20:45, Eddie James <eajames@linux.ibm.com> wrote:
>> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
>>
>> Use a clock divider tuned to a 200MHz FSI clock.  Use of the previous
>> divider at 200MHz results in corrupt data from endpoint devices. Ideally
>> the clock divider would be calculated from the FSI clock, but that
>> would require some significant work on the FSI driver.
> This sounds like something we should fix, especially if we're
> experimenting between 200/166/100 MHz FSI clocks?


Yes, but I figured that can be done later. Since 200 is the fastest, 
then using 19 will be safe until we can find the time to implement the 
clock division properly.


Thanks,

Eddie


>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
>> ---
>>   drivers/spi/spi-fsi.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/spi/spi-fsi.c b/drivers/spi/spi-fsi.c
>> index 8f64af0140e0..559d0ff981f3 100644
>> --- a/drivers/spi/spi-fsi.c
>> +++ b/drivers/spi/spi-fsi.c
>> @@ -350,7 +350,7 @@ static int fsi_spi_transfer_init(struct fsi_spi *ctx)
>>          u64 status = 0ULL;
>>          u64 wanted_clock_cfg = SPI_FSI_CLOCK_CFG_ECC_DISABLE |
>>                  SPI_FSI_CLOCK_CFG_SCK_NO_DEL |
>> -               FIELD_PREP(SPI_FSI_CLOCK_CFG_SCK_DIV, 4);
>> +               FIELD_PREP(SPI_FSI_CLOCK_CFG_SCK_DIV, 19);
>>
>>          end = jiffies + msecs_to_jiffies(SPI_FSI_INIT_TIMEOUT_MS);
>>          do {
>> --
>> 2.24.0
>>
