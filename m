Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B77C19B0B4
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 18:29:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ss9T2sSQzDr9W
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 03:29:49 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ss7b4F8VzDr99
 for <openbmc@lists.ozlabs.org>; Thu,  2 Apr 2020 03:28:10 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 031G2uXC101741; Wed, 1 Apr 2020 12:28:07 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3022r0h4kg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 12:28:06 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 031GKjk7023135;
 Wed, 1 Apr 2020 16:28:06 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 301x77jtv2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 16:28:05 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 031GS4mg27590944
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 16:28:04 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E82A6A058;
 Wed,  1 Apr 2020 16:28:04 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 206056A047;
 Wed,  1 Apr 2020 16:28:04 +0000 (GMT)
Received: from [9.163.16.235] (unknown [9.163.16.235])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  1 Apr 2020 16:28:03 +0000 (GMT)
Subject: Re: [PATCH linux dev-5.4] soc: aspeed: xdma: Fix command buffer
 overrun
To: Joel Stanley <joel@jms.id.au>
References: <20200331215600.5507-1-eajames@linux.ibm.com>
 <CACPK8Xfit8NNDjMkfqyjgjkhJ=bKGzqfeNpK2ksA7igYwsTCtQ@mail.gmail.com>
From: Eddie James <eajames@linux.ibm.com>
Message-ID: <d4e06b5a-abc9-3bd9-a020-44ed8c0d44f9@linux.ibm.com>
Date: Wed, 1 Apr 2020 11:28:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xfit8NNDjMkfqyjgjkhJ=bKGzqfeNpK2ksA7igYwsTCtQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_01:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010135
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


On 4/1/20 3:40 AM, Joel Stanley wrote:
> On Tue, 31 Mar 2020 at 21:56, Eddie James <eajames@linux.ibm.com> wrote:
>> In the case of an operation requiring two commands, it was possible to
>> copy the second command into the user's memory space, which also
>> prevents the command from completing since the first doesn't trigger an
>> interrupt. Test for this special case and prevent it.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   drivers/soc/aspeed/aspeed-xdma.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/soc/aspeed/aspeed-xdma.c b/drivers/soc/aspeed/aspeed-xdma.c
>> index 5d97919d38cf..d0a56a5a81ae 100644
>> --- a/drivers/soc/aspeed/aspeed-xdma.c
>> +++ b/drivers/soc/aspeed/aspeed-xdma.c
>> @@ -436,6 +436,13 @@ static void aspeed_xdma_start(struct aspeed_xdma *ctx,
>>
>>          mutex_lock(&ctx->start_lock);
>>
>> +       if ((rc == 2) && (ctx->cmd_idx == (XDMA_NUM_CMDS - 1))) {
> I don't understand what's going on here, so I'm going to explain what
> I read and you can correct me.


Sorry, it was rushed... I have found a cleaner way to do this anyway and 
will send a v2.


>
> rc in this case is the command number? so this operation is attempting
> to queue up the second of our "two commands" you mention in the commit
> message?


rc is the number of commands to send. It can only be 1 or 2. They're 
always queued together because they're processed in one go by the engine.


>
> We're saying if the second command is the last cmd_idx, we reset the
> write pointer back to zero.
>
> We don't reset the pointer back to zero anywhere else in the driver.
> Why do we special case this case?


We do in the reset actually. But we do it here because we have one slot 
left for a single command in the buffer/queue of commands. But since we 
have to send two, we'd better reset to 0 and put both there, instead of 
copying beyond our buffer space...


Thanks,

Eddie


>
>> +               aspeed_xdma_writel(ctx, ctx->chip->regs.bmc_cmdq_readp,
>> +                                  XDMA_BMC_CMDQ_READP_RESET);
>> +               aspeed_xdma_writel(ctx, ctx->chip->regs.bmc_cmdq_writep, 0);
>> +               ctx->cmd_idx = 0;
>> +       }
>> +
>>          memcpy(&ctx->cmdq[ctx->cmd_idx], cmds,
>>                 rc * sizeof(struct aspeed_xdma_cmd));
>>          ctx->cmd_idx = (ctx->cmd_idx + rc) % XDMA_NUM_CMDS;
>> --
>> 2.24.0
>>
