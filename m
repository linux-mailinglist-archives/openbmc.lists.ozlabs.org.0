Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AC15E72F
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2019 16:54:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45f3zm1dSMzDqHv
	for <lists+openbmc@lfdr.de>; Thu,  4 Jul 2019 00:54:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45f3ZK6th0zDqS2
 for <openbmc@lists.ozlabs.org>; Thu,  4 Jul 2019 00:36:08 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x63EY81J016406
 for <openbmc@lists.ozlabs.org>; Wed, 3 Jul 2019 10:36:03 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tgwk89xv3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 03 Jul 2019 10:36:03 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Wed, 3 Jul 2019 15:36:02 +0100
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 3 Jul 2019 15:36:00 +0100
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x63EYjPx18153786
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Jul 2019 14:34:45 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0D7FB2065;
 Wed,  3 Jul 2019 14:34:44 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB278B2067;
 Wed,  3 Jul 2019 14:34:44 +0000 (GMT)
Received: from [9.85.218.219] (unknown [9.85.218.219])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  3 Jul 2019 14:34:44 +0000 (GMT)
Subject: Re: [PATCH] OCC: FSI and hwmon: Add sequence numbering
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <1560285038-24233-1-git-send-email-eajames@linux.ibm.com>
 <95aa5594-325b-45d4-b777-075426ca3244@www.fastmail.com>
From: Eddie James <eajames@linux.ibm.com>
Date: Wed, 3 Jul 2019 09:34:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <95aa5594-325b-45d4-b777-075426ca3244@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19070314-2213-0000-0000-000003A802F1
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011372; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01226876; UDB=6.00645934; IPR=6.01008104; 
 MB=3.00027569; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-03 14:36:02
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070314-2214-0000-0000-00005F16FF83
Message-Id: <25cbbfb5-0cc0-e8d9-4808-72bab90cb442@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-03_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907030178
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


On 7/2/19 7:31 PM, Andrew Jeffery wrote:
> On Wed, 12 Jun 2019, at 06:31, Eddie James wrote:
>> Sequence numbering of the commands submitted to the OCC is required by
>> the OCC interface specification. Add sequence numbering and check for
>> the correct sequence number on the response.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   drivers/fsi/fsi-occ.c      | 15 ++++++++++++---
>>   drivers/hwmon/occ/common.c |  4 ++--
>>   drivers/hwmon/occ/common.h |  1 +
>>   3 files changed, 15 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
>> index a2301ce..7da9c81 100644
>> --- a/drivers/fsi/fsi-occ.c
>> +++ b/drivers/fsi/fsi-occ.c
>> @@ -412,6 +412,7 @@ int fsi_occ_submit(struct device *dev, const void
>> *request, size_t req_len,
>>   		msecs_to_jiffies(OCC_CMD_IN_PRG_WAIT_MS);
>>   	struct occ *occ = dev_get_drvdata(dev);
>>   	struct occ_response *resp = response;
>> +	u8 seq_no;
>>   	u16 resp_data_length;
>>   	unsigned long start;
>>   	int rc;
>> @@ -426,6 +427,8 @@ int fsi_occ_submit(struct device *dev, const void
>> *request, size_t req_len,
>>   
>>   	mutex_lock(&occ->occ_lock);
>>   
>> +	/* Extract the seq_no from the command (first byte) */
>> +	seq_no = *(const u8 *)request;
> The fact that your doing this says to me that the fsi_occ_submit() interface
> is wrong.
>
> We already have `struct occ_response` in drivers/hwmon/occ/common.h.
> I think we should add an equivalent `struct occ_request` and pass a
> typed pointer through fsi_occ_submit(), that way we can access the
> sequence number by name rather than through dodgy casts.


I don't think it's too bad. The first byte is always simply the sequence 
number. The worst that can happen is a user doesn't write a request 
correctly and we have a "wrong" sequence number, but in that case the 
request most likely won't work anyway. I think ideally it would be like 
you say, but it's also not ideal to change the interfaces at this stage.


>
> Also why is this sent just to the OpenBMC list? Any reason it's not on
> upstream lists?


It was... it's been accepted.


Thanks,

Eddie



>
> Andrew
>
>>   	rc = occ_putsram(occ, OCC_SRAM_CMD_ADDR, request, req_len);
>>   	if (rc)
>>   		goto done;
>> @@ -441,11 +444,17 @@ int fsi_occ_submit(struct device *dev, const void
>> *request, size_t req_len,
>>   		if (rc)
>>   			goto done;
>>   
>> -		if (resp->return_status == OCC_RESP_CMD_IN_PRG) {
>> +		if (resp->return_status == OCC_RESP_CMD_IN_PRG ||
>> +		    resp->seq_no != seq_no) {
>>   			rc = -ETIMEDOUT;
>>   
>> -			if (time_after(jiffies, start + timeout))
>> -				break;
>> +			if (time_after(jiffies, start + timeout)) {
>> +				dev_err(occ->dev, "resp timeout status=%02x "
>> +					"resp seq_no=%d our seq_no=%d\n",
>> +					resp->return_status, resp->seq_no,
>> +					seq_no);
>> +				goto done;
>> +			}
>>   
>>   			set_current_state(TASK_UNINTERRUPTIBLE);
>>   			schedule_timeout(wait_time);
>> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
>> index d7cc0d2..e9d7167 100644
>> --- a/drivers/hwmon/occ/common.c
>> +++ b/drivers/hwmon/occ/common.c
>> @@ -122,12 +122,12 @@ struct extended_sensor {
>>   static int occ_poll(struct occ *occ)
>>   {
>>   	int rc;
>> -	u16 checksum = occ->poll_cmd_data + 1;
>> +	u16 checksum = occ->poll_cmd_data + occ->seq_no + 1;
>>   	u8 cmd[8];
>>   	struct occ_poll_response_header *header;
>>   
>>   	/* big endian */
>> -	cmd[0] = 0;			/* sequence number */
>> +	cmd[0] = occ->seq_no++;		/* sequence number */
>>   	cmd[1] = 0;			/* cmd type */
>>   	cmd[2] = 0;			/* data length msb */
>>   	cmd[3] = 1;			/* data length lsb */
>> diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
>> index fc13f3c..67e6968 100644
>> --- a/drivers/hwmon/occ/common.h
>> +++ b/drivers/hwmon/occ/common.h
>> @@ -95,6 +95,7 @@ struct occ {
>>   	struct occ_sensors sensors;
>>   
>>   	int powr_sample_time_us;	/* average power sample time */
>> +	u8 seq_no;
>>   	u8 poll_cmd_data;		/* to perform OCC poll command */
>>   	int (*send_cmd)(struct occ *occ, u8 *cmd);
>>   
>> -- 
>> 1.8.3.1
>>
>>

