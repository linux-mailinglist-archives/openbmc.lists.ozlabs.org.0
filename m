Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD64305AF8
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 13:15:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQjH92W4hzDqdt
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 23:15:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=sNLAZ7Zr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQjFV4qp6zDqMK
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 23:14:06 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10RC2MHL032110; Wed, 27 Jan 2021 07:13:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Yfpa/EQVW5rI2ajeoYgeMwuSebFrgZMk4/1r9zUh5fw=;
 b=sNLAZ7Zr9yK+kmQo2DZeqtH90DJx4diB1khZbsSf78iZ47g50ASKmk+CEI5In+D/iTGw
 HRRCYk3/1kHc41AviHK1Y5z3o9kKhiDSN/90f7wFkDaOWrMSjK6MZuneRYOgfAGFq/lr
 +izrv+iA3C13uEZpYzOtZolM6yUbCI89Nz9QMpjuwFG6S1WDt2VW87K0HPn60KE4ZHIa
 QFGNUmbAAPNO6PQPpJmrIEl58YwqpV8cNPWY0HNU2DW0CiaX+thTt159pG6/Rh6LD0QP
 vNP4/P+P/gHseZ4YE4P/x4ALgd/zaZWl0iaRrolXRhvQBIYOjOpZWg//2WygLMiS4HyK 1w== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36b1cuaxbt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 07:13:53 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10RCCoBq009250;
 Wed, 27 Jan 2021 12:13:52 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02wdc.us.ibm.com with ESMTP id 36acj99fxx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 12:13:52 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10RCDp6Y17170850
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jan 2021 12:13:51 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0F78AC062;
 Wed, 27 Jan 2021 12:13:51 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A04DAC05B;
 Wed, 27 Jan 2021 12:13:51 +0000 (GMT)
Received: from [9.80.207.30] (unknown [9.80.207.30])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 27 Jan 2021 12:13:50 +0000 (GMT)
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 1/2] ast2600: Modify SPL
 SRAM layout
To: Joel Stanley <joel@jms.id.au>
References: <20210125045846.448399-1-joel@jms.id.au>
 <20210125045846.448399-2-joel@jms.id.au>
 <d2407df1-75b1-78eb-6bbb-6ce9e771dbed@linux.vnet.ibm.com>
 <CACPK8XcdgZMB-ocZTDxcDDe=5rxsnph-v_gbLf4omCPJSgd1YQ@mail.gmail.com>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <bc9840f1-945e-2d2d-3d99-20d5240a3e62@linux.vnet.ibm.com>
Date: Wed, 27 Jan 2021 09:13:48 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CACPK8XcdgZMB-ocZTDxcDDe=5rxsnph-v_gbLf4omCPJSgd1YQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-27_05:2021-01-27,
 2021-01-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101270063
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
 Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 1/27/2021 3:56 AM, Joel Stanley wrote:
> On Wed, 27 Jan 2021 at 01:55, Klaus Heinrich Kiwi
> <klaus@linux.vnet.ibm.com> wrote:
>>
>> Hi Joel,
>>
>> On 1/25/2021 1:58 AM, Joel Stanley wrote:
>>> The SRAM is 89KB on the A1 and beyond:
>>
>> I guess I'll have to trust you on that one.
> 
> You have access to the datasheet and can verify this.

I'm not sure where to find it. Is that published somewhere?
  
>>
>>>
>>>    0x1000_0000 to 0x1000_ffff: 64KB, with parity check
>>>    0x1001_0000 to 0x1001_5fff: 24KB, w/o parity check
>>>    0x1001_6000 to 0x1001_63ff: 1KB, w/o parity check, each byte write once
>>>
>>> Allow the image to fill the full 64KB payload size (max that secure boot
>>> supports) and plcae the stack at the top of the 24KB of SRAM.
>> typo
>>
>>> @@ -25,8 +25,8 @@
>>>
>>>    /* SPL */
>>>    #define CONFIG_SPL_TEXT_BASE                0x00000000
>>> -#define CONFIG_SPL_MAX_SIZE          0x0000E800
>>> -#define CONFIG_SPL_STACK             0x10010000
>>> +#define CONFIG_SPL_MAX_SIZE          0x00010000
>>> +#define CONFIG_SPL_STACK             0x10016000
>>>    #define CONFIG_SPL_BSS_START_ADDR   0x90000000
>>>    #define CONFIG_SPL_BSS_MAX_SIZE             0x00100000
>>>
>>
>> Got the following when I tried this patch (Ubuntu 18.04.5, gcc 7.5.0, binutils 2.30). Am I missing something?
> 
> This is a very out of date compiler. We use GCC 10 for openbmc.

What compiler version did you test this on?
|   (cd spl && arm-openbmc-linux-gnueabi-ld.bfd   -T u-boot-spl.lds  --gc-sections -Bstatic --gc-sections -pie  --no-dynamic-linker -Ttext 0x00000000 arch/arm/cpu/armv7/start.o --start-group arch/arm/mach-aspeed/built-in.o arch/arm/cpu/armv7/built-in.o arch/arm/cpu/built-in.o arch/arm/lib/built-in.o board/aspeed/evb_ast2600a1/built-in.o common/spl/built-in.o common/init/built-in.o common/built-in.o cmd/built-in.o env/built-in.o lib/built-in.o disk/built-in.o drivers/built-in.o dts/built-in.o fs/built-in.o  --end-group arch/arm/lib/eabi_compat.o arch/arm/lib/lib.a -Map u-boot-spl.map -o u-boot-spl)
| arm-openbmc-linux-gnueabi-ld.bfd: u-boot-spl section `.u_boot_list' will not fit in region `flash'
| arm-openbmc-linux-gnueabi-ld.bfd: region `flash' overflowed by 1736 bytes

$ ./arm-openbmc-linux-gnueabi-gcc --version
arm-openbmc-linux-gnueabi-gcc (GCC) 10.2.0


> 
> I will submit a v2 with some new features for reducing the image size.

Thank you.

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
