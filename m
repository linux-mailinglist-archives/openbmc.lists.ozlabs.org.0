Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFBE16EB5A
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2020 17:25:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Rkmh3MlszDqRc
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 03:25:08 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Rkll04wXzDqQW
 for <openbmc@lists.ozlabs.org>; Wed, 26 Feb 2020 03:24:17 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01PGKrvZ088734; Tue, 25 Feb 2020 11:24:10 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yb1qdyx31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Feb 2020 11:24:10 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01PGNwsv012852;
 Tue, 25 Feb 2020 16:24:09 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 2yaux6d8t6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Feb 2020 16:24:09 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01PGO8T549545594
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Feb 2020 16:24:08 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E87F6BE051;
 Tue, 25 Feb 2020 16:24:07 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBEEFBE054;
 Tue, 25 Feb 2020 16:24:07 +0000 (GMT)
Received: from [9.211.107.73] (unknown [9.211.107.73])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 25 Feb 2020 16:24:07 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.4] fsi: master: Add link_disable function
To: Joel Stanley <joel@jms.id.au>
References: <20200217201619.16713-1-eajames@linux.ibm.com>
 <CACPK8Xe7_i3N8m7nMv9yZHv4x+LvaouQWjFmFEv8pGf+S_+PuA@mail.gmail.com>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <f6b541da-3610-3d9f-6014-617b3eee27c8@linux.ibm.com>
Date: Tue, 25 Feb 2020 10:24:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CACPK8Xe7_i3N8m7nMv9yZHv4x+LvaouQWjFmFEv8pGf+S_+PuA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-25_05:2020-02-21,
 2020-02-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 clxscore=1011 impostorscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002250124
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 2/24/20 8:01 PM, Joel Stanley wrote:
> On Mon, 17 Feb 2020 at 20:16, Eddie James <eajames@linux.ibm.com> wrote:
>> The master driver should disable links that don't have slaves or links
>> that fail to be accessed. To do this, add a link_disable function and
>> use it in the failure path for slave break and init.
> The implementation looks okay, aside from the code duplication.
>
> We should clear up my first question about disabling the link in all
> error paths. The other questions don't need to block this going into
> dev-5.4, but should be resolved when upstreaming.
>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   drivers/fsi/fsi-core.c          | 13 ++++++++++++-
>>   drivers/fsi/fsi-master-aspeed.c | 30 ++++++++++++++++++++++++++++++
>>   drivers/fsi/fsi-master-hub.c    | 22 ++++++++++++++++++++++
>>   drivers/fsi/fsi-master.h        |  1 +
>>   4 files changed, 65 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
>> index 8244da8a7241..d81ee9f582a5 100644
>> --- a/drivers/fsi/fsi-core.c
>> +++ b/drivers/fsi/fsi-core.c
>> @@ -1154,6 +1154,14 @@ static int fsi_master_write(struct fsi_master *master, int link,
>>          return rc;
>>   }
>>
>> +static int fsi_master_link_disable(struct fsi_master *master, int link)
>> +{
>> +       if (master->link_disable)
>> +               return master->link_disable(master, link);
>> +
>> +       return 0;
>> +}
>> +
>>   static int fsi_master_link_enable(struct fsi_master *master, int link)
>>   {
>>          if (master->link_enable)
>> @@ -1194,10 +1202,13 @@ static int fsi_master_scan(struct fsi_master *master)
>>                  if (rc) {
>>                          dev_dbg(&master->dev,
>>                                  "break to link %d failed: %d\n", link, rc);
>> +                       fsi_master_link_disable(master, link);
>>                          continue;
>>                  }
>>
>> -               fsi_slave_init(master, link, 0);
>> +               rc = fsi_slave_init(master, link, 0);
>> +               if (rc)
>> +                       fsi_master_link_disable(master, link);
> Do we want to set the link as disabled when the init fails in all
> fsi_slave_init error paths?


Yes, I think so. I don't see why that would need to be conditional on 
anything? The link won't work so may as well disable it, right?


>
>>          }
>>
>>          return 0;
>> diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
>> index f49742b310c2..7ce5d9eb6c78 100644
>> --- a/drivers/fsi/fsi-master-aspeed.c
>> +++ b/drivers/fsi/fsi-master-aspeed.c
>> @@ -299,6 +299,35 @@ static int aspeed_master_write(struct fsi_master *master, int link,
>>          return 0;
>>   }
>>
>> +static int aspeed_master_link_disable(struct fsi_master *master, int link)
>> +{
>> +       struct fsi_master_aspeed *aspeed = to_fsi_master_aspeed(master);
>> +       int idx, bit, ret;
>> +       __be32 reg, result;
>> +
>> +       idx = link / 32;
>> +       bit = link % 32;
>> +
>> +       reg = cpu_to_be32(0x80000000 >> bit);
>> +
>> +       ret = opb_writel(aspeed, ctrl_base + FSI_MCENP0 + (4 * idx), reg);
>> +       if (ret)
>> +               return ret;
>> +
>> +       mdelay(FSI_LINK_ENABLE_SETUP_TIME);
>> +
>> +       ret = opb_readl(aspeed, ctrl_base + FSI_MENP0 + (4 * idx), &result);
>> +       if (ret)
>> +               return ret;
> Do we need to have the delay and read when disabling?


I can't find any documentation on a delay for disabling, so I guess not 
actually.


>
>> +
>> +       if (result & reg) {
>> +               dev_err(aspeed->dev, "%s failed: %08x\n", __func__, result);
>> +               return -EIO;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>>   static int aspeed_master_link_enable(struct fsi_master *master, int link)
>>   {
>>          struct fsi_master_aspeed *aspeed = to_fsi_master_aspeed(master);
>> @@ -491,6 +520,7 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
>>          aspeed->master.write = aspeed_master_write;
>>          aspeed->master.send_break = aspeed_master_break;
>>          aspeed->master.term = aspeed_master_term;
>> +       aspeed->master.link_disable = aspeed_master_link_disable;
>>          aspeed->master.link_enable = aspeed_master_link_enable;
>>
>>          dev_set_drvdata(&pdev->dev, aspeed);
>> diff --git a/drivers/fsi/fsi-master-hub.c b/drivers/fsi/fsi-master-hub.c
>> index def35cf92571..26617fd5e2de 100644
>> --- a/drivers/fsi/fsi-master-hub.c
>> +++ b/drivers/fsi/fsi-master-hub.c
>> @@ -77,6 +77,27 @@ static int hub_master_break(struct fsi_master *master, int link)
>>          return hub_master_write(master, link, 0, addr, &cmd, sizeof(cmd));
>>   }
>>
>> +static int hub_master_link_disable(struct fsi_master *master, int link)
>> +{
>> +       struct fsi_master_hub *hub = to_fsi_master_hub(master);
>> +       int idx, bit;
>> +       __be32 reg;
>> +       int rc;
>> +
>> +       idx = link / 32;
>> +       bit = link % 32;
>> +
>> +       reg = cpu_to_be32(0x80000000 >> bit);
>> +
>> +       rc = fsi_device_write(hub->upstream, FSI_MCENP0 + (4 * idx), &reg, 4);
>> +
>> +       mdelay(FSI_LINK_ENABLE_SETUP_TIME);
>> +
>> +       fsi_device_read(hub->upstream, FSI_MENP0 + (4 * idx), &reg, 4);
>> +
>> +       return rc;
>> +}
> This is the same code, with fsi_device_read instead of obp_read.
>
> We should look to share this code between the aspeed master and the hub master.


So is hub_master_link_enable and aspeed_master_link_enable...

It's quite tricky because the writes to the Aspeed master regs are to a 
different offset than like a master.write operation.


>
>> +
>>   static int hub_master_link_enable(struct fsi_master *master, int link)
>>   {
>>          struct fsi_master_hub *hub = to_fsi_master_hub(master);
>> @@ -228,6 +249,7 @@ static int hub_master_probe(struct device *dev)
>>          hub->master.read = hub_master_read;
>>          hub->master.write = hub_master_write;
>>          hub->master.send_break = hub_master_break;
>> +       hub->master.link_disable = hub_master_link_disable;
>>          hub->master.link_enable = hub_master_link_enable;
>>
>>          dev_set_drvdata(dev, hub);
>> diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
>> index 6e8d4d4d5149..7ecb86a678f9 100644
>> --- a/drivers/fsi/fsi-master.h
>> +++ b/drivers/fsi/fsi-master.h
>> @@ -130,6 +130,7 @@ struct fsi_master {
>>                                  uint32_t addr, const void *val, size_t size);
>>          int             (*term)(struct fsi_master *, int link, uint8_t id);
>>          int             (*send_break)(struct fsi_master *, int link);
>> +       int             (*link_disable)(struct fsi_master *, int link);
>>          int             (*link_enable)(struct fsi_master *, int link);
>>          int             (*link_config)(struct fsi_master *, int link,
>>                                         u8 t_send_delay, u8 t_echo_delay);
>> --
>> 2.24.0
>>
