Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4888C1F1BA1
	for <lists+openbmc@lfdr.de>; Mon,  8 Jun 2020 17:03:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gc2g5nMzzDqGW
	for <lists+openbmc@lfdr.de>; Tue,  9 Jun 2020 01:03:39 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gc1h3STrzDq7j
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jun 2020 01:02:47 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 058EXIEP094452; Mon, 8 Jun 2020 11:02:41 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31g7p49409-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jun 2020 11:02:39 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 058ExMBB028143;
 Mon, 8 Jun 2020 15:02:37 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03wdc.us.ibm.com with ESMTP id 31gxfk5nug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jun 2020 15:02:37 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 058F2bco53018886
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Jun 2020 15:02:37 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3BC6FAE073;
 Mon,  8 Jun 2020 15:02:37 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F80CAE07A;
 Mon,  8 Jun 2020 15:02:36 +0000 (GMT)
Received: from [9.211.140.245] (unknown [9.211.140.245])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  8 Jun 2020 15:02:36 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.4] fsi: core: Set slave local bus ownership
 during init
To: Joel Stanley <joel@jms.id.au>, Jeremy Kerr <jk@ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, Alistair Popple <alistair@popple.id.au>
References: <20200520181707.9235-1-eajames@linux.ibm.com>
 <CACPK8Xet=vdApyKXPe0prWhtH3qqa2_NWnoXT=Rzwe+yjNNQ=g@mail.gmail.com>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <27cb28b4-452d-9708-beeb-d8ef60db29a4@linux.ibm.com>
Date: Mon, 8 Jun 2020 10:02:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xet=vdApyKXPe0prWhtH3qqa2_NWnoXT=Rzwe+yjNNQ=g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-08_13:2020-06-08,
 2020-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 mlxlogscore=999 impostorscore=0 suspectscore=0 cotscore=-2147483648
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006080109
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


On 6/1/20 9:05 PM, Joel Stanley wrote:
> On Wed, 20 May 2020 at 18:17, Eddie James <eajames@linux.ibm.com> wrote:
>> The driver ought to claim local bus ownership of the slave it's
>> communicating with.
> I am not familiar with this register's purpose so feel free to explain
> the details.


Sure, I'll add a comment. I don't really understand the details either, 
but I think this is effectively for multi-master setups. The slave (in 
theory) will deny access to masters who try to access the CFAM address 
space but who don't "own" the bus.

>
> Should we also "un-claim" ownership at any point?


Well, the driver doesn't seem to perform any other teardown, so I don't 
think so. Also I'm not aware of any multi-master setup using this driver 
so it shouldn't actually matter. Also, the hardware doesn't seem to 
enforce this despite being required in the specification...


Thanks,

Eddie


>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   drivers/fsi/fsi-core.c | 16 +++++++++++++++-
>>   1 file changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
>> index 8244da8a7241..48424b672295 100644
>> --- a/drivers/fsi/fsi-core.c
>> +++ b/drivers/fsi/fsi-core.c
>> @@ -50,6 +50,7 @@ static const int engine_page_size = 0x400;
>>   #define FSI_SMODE              0x0     /* R/W: Mode register */
>>   #define FSI_SISC               0x8     /* R/W: Interrupt condition */
>>   #define FSI_SSTAT              0x14    /* R  : Slave status */
>> +#define FSI_SLBUS              0x30    /* W  : LBUS Ownership */
>>   #define FSI_LLMODE             0x100   /* R/W: Link layer mode register */
>>
>>   /*
>> @@ -66,6 +67,11 @@ static const int engine_page_size = 0x400;
>>   #define FSI_SMODE_LBCRR_SHIFT  8               /* Clk ratio shift */
>>   #define FSI_SMODE_LBCRR_MASK   0xf             /* Clk ratio mask */
>>
>> +/*
>> + * SLBUS fields
>> + */
>> +#define FSI_SLBUS_FORCE                0x80000000      /* Force LBUS ownership */
>> +
>>   /*
>>    * LLMODE fields
>>    */
>> @@ -981,7 +987,7 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
>>          uint32_t cfam_id;
>>          struct fsi_slave *slave;
>>          uint8_t crc;
>> -       __be32 data, llmode;
>> +       __be32 data, llmode, slbus;
>>          int rc;
>>
>>          /* Currently, we only support single slaves on a link, and use the
>> @@ -1052,6 +1058,14 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
>>
>>          }
>>
>> +       slbus = cpu_to_be32(FSI_SLBUS_FORCE);
>> +       rc = fsi_master_write(master, link, id, FSI_SLAVE_BASE + FSI_SLBUS,
>> +                             &slbus, sizeof(slbus));
>> +       if (rc)
>> +               dev_warn(&master->dev,
>> +                        "can't set slbus on slave:%02x:%02x %d\n", link, id,
>> +                        rc);
>> +
>>          rc = fsi_slave_set_smode(slave);
>>          if (rc) {
>>                  dev_warn(&master->dev,
>> --
>> 2.24.0
>>
