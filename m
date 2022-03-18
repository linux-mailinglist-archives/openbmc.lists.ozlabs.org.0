Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E94B44DDB51
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 15:11:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKmCN5y9kz2y6K
	for <lists+openbmc@lfdr.de>; Sat, 19 Mar 2022 01:11:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V49VlplC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=V49VlplC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKmBv5vjCz2y6K
 for <openbmc@lists.ozlabs.org>; Sat, 19 Mar 2022 01:11:03 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22ICns4Z011658; 
 Fri, 18 Mar 2022 14:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=+Zonnu1cRoX95VJfyuHHAuo36ESL7gzP0rIKXUfIgCo=;
 b=V49VlplC0tMHzuXeCADWhjQNlstUaeixwg23xzYbeJ7EkSQowVDCUHy1wcg+1cltujcU
 0oiByhZ17RAe3BAdRJpBoywMdnNHDpD8U9JiDjAvYxN0wX2o4fbK0dag/tNEsNaaBdVQ
 awVY1WrHkOMkUZiPQ8LeL2ZZPqFZeXs01h9/h6ZDKFKBOVd3XmjZr8jpF6YH0OhRREyO
 Vp8VEUylkFyuJ2mginQG/txDJmOfl6VFtB5JXuaAUAgYtcMXha6xfPWK7e8Q+Hh7A80m
 2xohiO/i1l2FI8Lf5iv8ck3rw87XqUbPgfjjqEILeRXW0vBAjIyY5QC7Z+GUBjZXxjY6 4A== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3euxtr9c97-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 14:10:52 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22IE7WBN017764;
 Fri, 18 Mar 2022 14:10:51 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 3erk5ad44k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Mar 2022 14:10:51 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22IEAnKU10289560
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 14:10:49 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92014112069;
 Fri, 18 Mar 2022 14:10:49 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E099112064;
 Fri, 18 Mar 2022 14:10:48 +0000 (GMT)
Received: from [9.163.28.80] (unknown [9.163.28.80])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 18 Mar 2022 14:10:48 +0000 (GMT)
Message-ID: <acec0279-f5a2-2b0c-e044-6200e7a37e37@linux.ibm.com>
Date: Fri, 18 Mar 2022 09:10:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] spi: fsi: Implement a timeout for polling status
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20220317211426.38940-1-eajames@linux.ibm.com>
 <CACPK8Xd42+NgTfS8ERagv-1GkAb8XiY8U71Q8Hz0wQ9dEUJekQ@mail.gmail.com>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <CACPK8Xd42+NgTfS8ERagv-1GkAb8XiY8U71Q8Hz0wQ9dEUJekQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iOwkf6G1zoXNOjsObzSjWU5vMS0ZwXlh
X-Proofpoint-ORIG-GUID: iOwkf6G1zoXNOjsObzSjWU5vMS0ZwXlh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-18_10,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203180078
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
 Mark Brown <broonie@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 3/17/22 23:19, Joel Stanley wrote:
> On Thu, 17 Mar 2022 at 21:14, Eddie James <eajames@linux.ibm.com> wrote:
>> The data transfer routines must poll the status register to
>> determine when more data can be shifted in or out. If the hardware
>> gets into a bad state, these polling loops may never exit. Prevent
>> this by returning an error if a timeout is exceeded.
> This makes sense. We may even want to put this code in regardless.
>
> However, I'm wondering why the code in fsi_spi_status didn't catch this.


Same, which is why I thought the problem couldn't be happening here for 
a long time. See below with what I think is going on.


>
>> static int fsi_spi_status(struct fsi_spi *ctx, u64 *status, const char *dir)
>> {
>>         int rc = fsi_spi_read_reg(ctx, SPI_FSI_STATUS, status);
> You mentioned the error condition is we get back 0xff. That means that
> status will be 0xffff_ffff_ffff_ffff ?
>
> Did you observe status being this value?


No, I think my observation of 0xff is not universal. I suspect that 
while the CFAM is IN reset, 0xff is returned, but once it's been reset, 
valid (though maybe uninitialized) data is returned. I observed a status 
of 0x0001100000000000, which means the controller is idle, which makes 
sense since it's been reset. So the issue occurs if we start an 
operation before a CFAM reset and are waiting for it to complete during 
the CFAM reset, but we also don't get any failed/invalid data FSI 
operations during/after the reset (very timing dependent - the FSI 
master does lock during the reset but doesn't wait afterwards for the 
hardware to initialize).


>
>>         if (rc)
>>                 return rc;
>>
>>         if (*status & SPI_FSI_STATUS_ANY_ERROR) {
> I think that we're checking against 0xffe0f000.
>
>>                 dev_err(ctx->dev, "%s error: %016llx\n", dir, *status);
>>
>>                 rc = fsi_spi_reset(ctx);
>>                 if (rc)
>>                         return rc;
> Is the problem here? fsi_spi_reset writes to the clock config
> registers, but doesn't read the status.
>
> Obviously doing the writes causes a call to fsi_spi_check_status, but
> that checks the FSI2SPI bridge, not the SPI master.
>
> ...but it doesn't matter, because we're either going to return an
> error from the reset, or return EREMOTEIO, so there's no masking of
> the error.


Not sure I follow. I don't think we were hitting this path in this error 
scenario. Do you think we need to check the status after a reset? It 
should always be the same.


>
>>                 return -EREMOTEIO;
>>         }
>>
>>         return 0;
>> }
>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   drivers/spi/spi-fsi.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/spi/spi-fsi.c b/drivers/spi/spi-fsi.c
>> index b6c7467f0b59..d403a7a3021d 100644
>> --- a/drivers/spi/spi-fsi.c
>> +++ b/drivers/spi/spi-fsi.c
>> @@ -25,6 +25,7 @@
>>
>>   #define SPI_FSI_BASE                   0x70000
>>   #define SPI_FSI_INIT_TIMEOUT_MS                1000
>> +#define SPI_FSI_STATUS_TIMEOUT_MS      100
> Can you add a comment (or put something in the commit message) about
> why you chose 100ms.


Hm, sure, but I chose it pretty arbitrarily. I'm not sure how to choose 
something like this.


>
>>   #define SPI_FSI_MAX_RX_SIZE            8
>>   #define SPI_FSI_MAX_TX_SIZE            40
>>
>> @@ -299,6 +300,7 @@ static int fsi_spi_transfer_data(struct fsi_spi *ctx,
>>                                   struct spi_transfer *transfer)
>>   {
>>          int rc = 0;
>> +       unsigned long end;
>>          u64 status = 0ULL;
>>
>>          if (transfer->tx_buf) {
>> @@ -315,10 +317,14 @@ static int fsi_spi_transfer_data(struct fsi_spi *ctx,
>>                          if (rc)
>>                                  return rc;
>>
>> +                       end = jiffies + msecs_to_jiffies(SPI_FSI_STATUS_TIMEOUT_MS);
>>                          do {
>>                                  rc = fsi_spi_status(ctx, &status, "TX");
>>                                  if (rc)
>>                                          return rc;
>> +
>> +                               if (time_after(jiffies, end))
>> +                                       return -ETIMEDOUT;
>>                          } while (status & SPI_FSI_STATUS_TDR_FULL);
>>
>>                          sent += nb;
>> @@ -329,10 +335,14 @@ static int fsi_spi_transfer_data(struct fsi_spi *ctx,
>>                  u8 *rx = transfer->rx_buf;
>>
>>                  while (transfer->len > recv) {
>> +                       end = jiffies + msecs_to_jiffies(SPI_FSI_STATUS_TIMEOUT_MS);
>>                          do {
>>                                  rc = fsi_spi_status(ctx, &status, "RX");
>>                                  if (rc)
>>                                          return rc;
>> +
>> +                               if (time_after(jiffies, end))
>> +                                       return -ETIMEDOUT;
>>                          } while (!(status & SPI_FSI_STATUS_RDR_FULL));
>>
>>                          rc = fsi_spi_read_reg(ctx, SPI_FSI_DATA_RX, &in);
>> --
>> 2.27.0
>>
