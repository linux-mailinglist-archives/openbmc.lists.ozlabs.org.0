Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F1A1C3C4A
	for <lists+openbmc@lfdr.de>; Mon,  4 May 2020 16:05:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49G4P425phzDqTY
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 00:04:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49G4L73hzVzDqTF
 for <openbmc@lists.ozlabs.org>; Tue,  5 May 2020 00:02:22 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 044DYcAI181932; Mon, 4 May 2020 10:02:17 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30s316wumk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 May 2020 10:02:16 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 044Dww29003337;
 Mon, 4 May 2020 14:02:16 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04wdc.us.ibm.com with ESMTP id 30s0g6h164-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 May 2020 14:02:16 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 044E2Eb322806930
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 May 2020 14:02:14 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BCE23780B3;
 Mon,  4 May 2020 14:02:14 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17FCB78191;
 Mon,  4 May 2020 14:01:49 +0000 (GMT)
Received: from [9.211.132.8] (unknown [9.211.132.8])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  4 May 2020 14:01:48 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.4 v2 2/3] fsi: occ: Add support for P10
To: Andrew Jeffery <andrew@aj.id.au>, Eddie James <eajames@linux.ibm.com>,
 openbmc@lists.ozlabs.org
References: <20200430220619.31943-1-eajames@linux.ibm.com>
 <20200430220619.31943-3-eajames@linux.ibm.com>
 <2f460711-1108-4dec-a578-ce18cdba0157@www.fastmail.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Message-ID: <3aaf88d9-e9d8-a163-f5d7-2594b2af3245@linux.vnet.ibm.com>
Date: Mon, 4 May 2020 09:01:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <2f460711-1108-4dec-a578-ce18cdba0157@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-04_07:2020-05-04,
 2020-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=2 mlxscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005040111
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


On 5/4/20 12:04 AM, Andrew Jeffery wrote:
>
> On Fri, 1 May 2020, at 07:36, Eddie James wrote:
>> The P10 OCC has a different SRAM address for the command and response
>> buffers. In addition, the SBE commands to access the SRAM have changed
>> format. Add versioning to the driver to handle these differences.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   drivers/fsi/fsi-occ.c | 126 ++++++++++++++++++++++++++++++------------
>>   1 file changed, 92 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
>> index 7da9c81759ac..942eff4032b0 100644
>> --- a/drivers/fsi/fsi-occ.c
>> +++ b/drivers/fsi/fsi-occ.c
>> @@ -14,6 +14,7 @@
>>   #include <linux/mutex.h>
>>   #include <linux/fsi-occ.h>
>>   #include <linux/of.h>
>> +#include <linux/of_device.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/sched.h>
>>   #include <linux/slab.h>
>> @@ -24,8 +25,13 @@
>>   #define OCC_CMD_DATA_BYTES	4090
>>   #define OCC_RESP_DATA_BYTES	4089
>>   
>> -#define OCC_SRAM_CMD_ADDR	0xFFFBE000
>> -#define OCC_SRAM_RSP_ADDR	0xFFFBF000
>> +#define OCC_P9_SRAM_CMD_ADDR	0xFFFBE000
>> +#define OCC_P9_SRAM_RSP_ADDR	0xFFFBF000
>> +
>> +#define OCC_P10_SRAM_CMD_ADDR	0xFFFFD000
>> +#define OCC_P10_SRAM_RSP_ADDR	0xFFFFE000
>> +
>> +#define OCC_P10_SRAM_MODE	0x58	/* Normal mode, OCB channel 2 */
>>   
>>   /*
>>    * Assume we don't have much FFDC, if we do we'll overflow and
>> @@ -37,11 +43,14 @@
>>   #define OCC_TIMEOUT_MS		1000
>>   #define OCC_CMD_IN_PRG_WAIT_MS	50
>>   
>> +enum versions { occ_p9, occ_p10 };
>> +
>>   struct occ {
>>   	struct device *dev;
>>   	struct device *sbefifo;
>>   	char name[32];
>>   	int idx;
>> +	enum versions version;
>>   	struct miscdevice mdev;
>>   	struct mutex occ_lock;
>>   };
>> @@ -235,29 +244,43 @@ static int occ_verify_checksum(struct
>> occ_response *resp, u16 data_length)
>>   	return 0;
>>   }
>>   
>> -static int occ_getsram(struct occ *occ, u32 address, void *data, ssize_t len)
>> +static int occ_getsram(struct occ *occ, u32 offset, void *data, ssize_t len)
>>   {
>>   	u32 data_len = ((len + 7) / 8) * 8;	/* must be multiples of 8 B */
>> -	size_t resp_len, resp_data_len;
>> -	__be32 *resp, cmd[5];
>> -	int rc;
>> +	size_t cmd_len, resp_len, resp_data_len;
>> +	__be32 *resp, cmd[6];
>> +	int idx = 0, rc;
>>   
>>   	/*
>>   	 * Magic sequence to do SBE getsram command. SBE will fetch data from
>>   	 * specified SRAM address.
>>   	 */
>> -	cmd[0] = cpu_to_be32(0x5);
>> +	switch (occ->version) {
>> +	default:
>> +	case occ_p9:
>> +		cmd_len = 5;
>> +		cmd[2] = cpu_to_be32(1);	/* Normal mode */
>> +		cmd[3] = cpu_to_be32(OCC_P9_SRAM_RSP_ADDR + offset);
>> +		break;
>> +	case occ_p10:
>> +		idx = 1;
>> +		cmd_len = 6;
>> +		cmd[2] = cpu_to_be32(OCC_P10_SRAM_MODE);
>> +		cmd[3] = 0;
>> +		cmd[4] = cpu_to_be32(OCC_P10_SRAM_RSP_ADDR + offset);
>> +		break;
>> +	}
>> +
>> +	cmd[0] = cpu_to_be32(cmd_len);
>>   	cmd[1] = cpu_to_be32(SBEFIFO_CMD_GET_OCC_SRAM);
>> -	cmd[2] = cpu_to_be32(1);
>> -	cmd[3] = cpu_to_be32(address);
>> -	cmd[4] = cpu_to_be32(data_len);
>> +	cmd[4 + idx] = cpu_to_be32(data_len);
>>   
>>   	resp_len = (data_len >> 2) + OCC_SBE_STATUS_WORDS;
>>   	resp = kzalloc(resp_len << 2, GFP_KERNEL);
>>   	if (!resp)
>>   		return -ENOMEM;
>>   
>> -	rc = sbefifo_submit(occ->sbefifo, cmd, 5, resp, &resp_len);
>> +	rc = sbefifo_submit(occ->sbefifo, cmd, cmd_len, resp, &resp_len);
>>   	if (rc)
>>   		goto free;
>>   
>> @@ -287,20 +310,21 @@ static int occ_getsram(struct occ *occ, u32
>> address, void *data, ssize_t len)
>>   	return rc;
>>   }
>>   
>> -static int occ_putsram(struct occ *occ, u32 address, const void *data,
>> -		       ssize_t len)
>> +static int occ_putsram(struct occ *occ, const void *data, ssize_t len)
>>   {
>>   	size_t cmd_len, buf_len, resp_len, resp_data_len;
>>   	u32 data_len = ((len + 7) / 8) * 8;	/* must be multiples of 8 B */
>>   	__be32 *buf;
>> -	int rc;
>> +	int idx = 0, rc;
>> +
>> +	cmd_len = (occ->version == occ_p10) ? 6 : 5;
>>   
>>   	/*
>>   	 * We use the same buffer for command and response, make
>>   	 * sure it's big enough
>>   	 */
>>   	resp_len = OCC_SBE_STATUS_WORDS;
>> -	cmd_len = (data_len >> 2) + 5;
>> +	cmd_len += data_len >> 2;
>>   	buf_len = max(cmd_len, resp_len);
>>   	buf = kzalloc(buf_len << 2, GFP_KERNEL);
>>   	if (!buf)
>> @@ -312,11 +336,23 @@ static int occ_putsram(struct occ *occ, u32
>> address, const void *data,
>>   	 */
>>   	buf[0] = cpu_to_be32(cmd_len);
>>   	buf[1] = cpu_to_be32(SBEFIFO_CMD_PUT_OCC_SRAM);
>> -	buf[2] = cpu_to_be32(1);
>> -	buf[3] = cpu_to_be32(address);
>> -	buf[4] = cpu_to_be32(data_len);
>>   
>> -	memcpy(&buf[5], data, len);
>> +	switch (occ->version) {
>> +	default:
>> +	case occ_p9:
>> +		buf[2] = cpu_to_be32(1);	/* Normal mode */
>> +		buf[3] = cpu_to_be32(OCC_P9_SRAM_CMD_ADDR);
>> +		break;
>> +	case occ_p10:
>> +		idx = 1;
>> +		buf[2] = cpu_to_be32(OCC_P10_SRAM_MODE);
>> +		buf[3] = 0;
>> +		buf[4] = cpu_to_be32(OCC_P10_SRAM_CMD_ADDR);
>> +		break;
>> +	}
>> +
>> +	buf[4 + idx] = cpu_to_be32(data_len);
>> +	memcpy(&buf[5 + idx], data, len);
>>   
>>   	rc = sbefifo_submit(occ->sbefifo, buf, cmd_len, buf, &resp_len);
>>   	if (rc)
>> @@ -356,21 +392,35 @@ static int occ_putsram(struct occ *occ, u32
>> address, const void *data,
>>   static int occ_trigger_attn(struct occ *occ)
>>   {
>>   	__be32 buf[OCC_SBE_STATUS_WORDS];
>> -	size_t resp_len, resp_data_len;
>> -	int rc;
>> +	size_t cmd_len, resp_len, resp_data_len;
>> +	int idx = 0, rc;
>>   
>> -	BUILD_BUG_ON(OCC_SBE_STATUS_WORDS < 7);
>> +	BUILD_BUG_ON(OCC_SBE_STATUS_WORDS < 8);
>>   	resp_len = OCC_SBE_STATUS_WORDS;
>>   
>> -	buf[0] = cpu_to_be32(0x5 + 0x2);        /* Chip-op length in words */
>> +	switch (occ->version) {
>> +	default:
>> +	case occ_p9:
>> +		cmd_len = 7;
>> +		buf[2] = cpu_to_be32(3); /* Circular mode */
>> +		buf[3] = 0;
>> +		break;
>> +	case occ_p10:
>> +		idx = 1;
>> +		cmd_len = 8;
>> +		buf[2] = cpu_to_be32(0xd0); /* Circular mode, OCB Channel 1 */
>> +		buf[3] = 0;
>> +		buf[4] = 0;
>> +		break;
>> +	}
>> +
>> +	buf[0] = cpu_to_be32(cmd_len);		/* Chip-op length in words */
>>   	buf[1] = cpu_to_be32(SBEFIFO_CMD_PUT_OCC_SRAM);
>> -	buf[2] = cpu_to_be32(0x3);              /* Mode: Circular */
>> -	buf[3] = cpu_to_be32(0x0);              /* Address: ignore in mode 3 */
>> -	buf[4] = cpu_to_be32(0x8);              /* Data length in bytes */
>> -	buf[5] = cpu_to_be32(0x20010000);       /* Trigger OCC attention */
>> -	buf[6] = 0;
>> +	buf[4 + idx] = cpu_to_be32(8);		/* Data length in bytes */
>> +	buf[5 + idx] = cpu_to_be32(0x20010000);	/* Trigger OCC attention */
>> +	buf[6 + idx] = 0;
>>   
>> -	rc = sbefifo_submit(occ->sbefifo, buf, 7, buf, &resp_len);
>> +	rc = sbefifo_submit(occ->sbefifo, buf, cmd_len, buf, &resp_len);
>>   	if (rc)
>>   		goto error;
>>   
>> @@ -429,7 +479,7 @@ int fsi_occ_submit(struct device *dev, const void
>> *request, size_t req_len,
>>   
>>   	/* Extract the seq_no from the command (first byte) */
>>   	seq_no = *(const u8 *)request;
>> -	rc = occ_putsram(occ, OCC_SRAM_CMD_ADDR, request, req_len);
>> +	rc = occ_putsram(occ, request, req_len);
>>   	if (rc)
>>   		goto done;
>>   
>> @@ -440,7 +490,7 @@ int fsi_occ_submit(struct device *dev, const void
>> *request, size_t req_len,
>>   	/* Read occ response header */
>>   	start = jiffies;
>>   	do {
>> -		rc = occ_getsram(occ, OCC_SRAM_RSP_ADDR, resp, 8);
>> +		rc = occ_getsram(occ, 0, resp, 8);
>>   		if (rc)
>>   			goto done;
>>   
>> @@ -476,8 +526,7 @@ int fsi_occ_submit(struct device *dev, const void
>> *request, size_t req_len,
>>   	/* Grab the rest */
>>   	if (resp_data_length > 1) {
>>   		/* already got 3 bytes resp, also need 2 bytes checksum */
>> -		rc = occ_getsram(occ, OCC_SRAM_RSP_ADDR + 8,
>> -				 &resp->data[3], resp_data_length - 1);
>> +		rc = occ_getsram(occ, 8, &resp->data[3], resp_data_length - 1);
>>   		if (rc)
>>   			goto done;
>>   	}
>> @@ -508,6 +557,7 @@ static int occ_probe(struct platform_device *pdev)
>>   	struct occ *occ;
>>   	struct platform_device *hwmon_dev;
>>   	struct device *dev = &pdev->dev;
>> +	const void *md =  of_device_get_match_data(dev);
>>   	struct platform_device_info hwmon_dev_info = {
>>   		.parent = dev,
>>   		.name = "occ-hwmon",
>> @@ -517,6 +567,7 @@ static int occ_probe(struct platform_device *pdev)
>>   	if (!occ)
>>   		return -ENOMEM;
>>   
>> +	occ->version = (enum versions)md;
>>   	occ->dev = dev;
>>   	occ->sbefifo = dev->parent;
>>   	mutex_init(&occ->occ_lock);
>> @@ -575,7 +626,14 @@ static int occ_remove(struct platform_device *pdev)
>>   }
>>   
>>   static const struct of_device_id occ_match[] = {
>> -	{ .compatible = "ibm,p9-occ" },
>> +	{
>> +		.compatible = "ibm,p9-occ",
>> +		.data = (void *)occ_p9
>> +	},
>> +	{
>> +		.compatible = "ibm,p10-occ",
>> +		.data = (void *)occ_p10
> Why not stick an ops struct pointer in .data and separate out the implementations
> rather than stick a switch over the version in each of the affected functions?


I did try but I found I ended up with two copies of most of the code. 
There is too much in common and no good way to split out the 
processor-specific stuff without duplicating everything...


Thanks,

Eddie


>
> Andrew
