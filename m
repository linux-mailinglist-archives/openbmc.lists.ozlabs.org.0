Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 694E8364220
	for <lists+openbmc@lfdr.de>; Mon, 19 Apr 2021 14:59:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FP6Ml087gz2y0C
	for <lists+openbmc@lfdr.de>; Mon, 19 Apr 2021 22:59:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qIcQ+8Lb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qIcQ+8Lb; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FP6MV6S1qz2xYl
 for <openbmc@lists.ozlabs.org>; Mon, 19 Apr 2021 22:59:01 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13JCWvs5027099; Mon, 19 Apr 2021 08:58:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Y5wUjDt8p06JhT4hbd3bzuF14P2XlgRHHlhe/Eo8N64=;
 b=qIcQ+8LbvBqQJrM00j6ZmZhdh8aE/gaZoncHhfhd4CH0nlkPBWw3B26MLPHXPNbKE3TS
 CVlU6/8tJnc1foIoKyj+4VCDkms+VDUQ/7EfYxkAyInbx1oXEEXZMrSajJtQ4aWOLr1u
 aeeIa+Myh3xXBeXgOdWQre7vbPZtz30WILDCmhKDq1GP0MOLSNbpGw8V5sl/aFlqMjIe
 ioDiAZ5Gt+lGD4uvAqAoMru/VJflrnYdznrNmBqubUAi/xs0ZamOhPq0+eyOzSiijSlk
 KM+2LhsOQkZDoTJnc4nALWds9lfuPJPb/8oLa/kzgbR1pv7g6Na8WaSvdZOdgVuGM2ab Kw== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 380crt0qns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Apr 2021 08:58:46 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13JCwdcf025910;
 Mon, 19 Apr 2021 12:58:45 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 37yqa9xddy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Apr 2021 12:58:45 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13JCwiCm27001246
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Apr 2021 12:58:44 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E020678068;
 Mon, 19 Apr 2021 12:58:43 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E317878060;
 Mon, 19 Apr 2021 12:58:42 +0000 (GMT)
Received: from [9.65.64.161] (unknown [9.65.64.161])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 19 Apr 2021 12:58:42 +0000 (GMT)
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 10/11] crypto: Add driver
 for Aspeed HACE
To: Joel Stanley <joel@jms.id.au>
References: <20210413080755.73572-1-joel@jms.id.au>
 <20210413080755.73572-11-joel@jms.id.au>
 <cacf13c1-91b2-ad51-606e-bb208d13ec36@linux.vnet.ibm.com>
 <9779de4a-6985-8b94-9fb6-55c74a7a722f@linux.vnet.ibm.com>
 <CACPK8XcNyXUhe=43NCR1RzrexJGYWw2S-kXWsYDzNYAJujnmpg@mail.gmail.com>
 <001cda88-6e0f-cd48-d274-3764d0ceb18d@linux.vnet.ibm.com>
 <CACPK8XdHNDv8ELvKR9jEps7eR8Lj0n0hXp-TL48kDWWUyMH26g@mail.gmail.com>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <95c27f3c-e7c5-2f10-35fd-3f8033073074@linux.vnet.ibm.com>
Date: Mon, 19 Apr 2021 09:58:41 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <CACPK8XdHNDv8ELvKR9jEps7eR8Lj0n0hXp-TL48kDWWUyMH26g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZWPlZ0TwfJrRTj9a_hpFrKTMr2ZRt84n
X-Proofpoint-ORIG-GUID: ZWPlZ0TwfJrRTj9a_hpFrKTMr2ZRt84n
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-19_10:2021-04-19,
 2021-04-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104190088
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

On 4/19/2021 9:49 AM, Joel Stanley wrote:
> On Thu, 15 Apr 2021 at 21:38, Klaus Heinrich Kiwi

>>
>>    * The AST2600 workbook mentions that the list structure passed to
>>      ASPEED_HACE_HASH_SRC needs to be 8-byte aligned. Normally, glibc's
>>      malloc() would always align memory to (at least) 8-bytes, but that's
>>      the case with u-boot's pre-sdram malloc() implementation. So we need
>>      to explicitly align the context to 8-bytes with malign().
> 
> We're not using the HACE engine pre-SDRAM, so we should be ok.
> 
> common/dlmalloc.c:
> 
>      8-byte alignment is guaranteed by normal malloc calls, so don't
>      bother calling memalign with an argument of 8 or less.
> 
> Were you able to observe any allocations that were not aligned?

yes, I thought I had. And by pre-sdram I guess I was trying to say pre-relocation.
But that might have been an artifact of trying to probe/initialize hace in the
SPL, so I might have mixed things.

I was sure that Qemu and Hardware were behaving differently, since the same
image would work on qemu but fail on hardware. Perhaps we should put a warning
on Qemu for unaligned access instead of just masking.

  
>>
>>    * The __atribute__ ((align 8)) doesn't have an effect in struct
>>      elements. Remove it.
> 
> Agreed.
> 
>>
>>    * Since the struct aspeed_hash_ctx->list element is what we need to
>>      make sure is aligned to 9-bytes, move that to the first element of
>>      the array, and call-out the fact that this needs to be aligned in
>>      the declaration.
> 
> 9 bytes? Did you mean 8?
> I did. A typo.

> Regardless, the array in the structure should be aligned as there will
> be no padding earlier in the struct. I have added a runtime check for
> this and have not hit that in my testing so far.
> 

My change involved moving the array to the first element exactly to not
risk changing the u32 elements before it to something else and breaking
alignment.

>>
>>     * Clear HACE_HASH_ISR before issuing new command
> 
> This makes sense.
> 
> I will send out a new series for review. I've tested it thoroughly in
> qemu, and have tested the u-boot -> Linux path on hardware.
> 
> Cheers,
> 
> Joel

Sounds good. I can give it a spin on rain100 and check if it's all good.

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
