Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4725E304F17
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 02:56:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQRXZ5R4QzDqtV
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 12:56:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FyTCbM1d; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQRWc4WbVzDqfX
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 12:55:23 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10R1WHe1078835; Tue, 26 Jan 2021 20:55:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=3cDMownAOeBuz6GyFtm9T9ss7Nl6cnOpQl6FJIcHCAw=;
 b=FyTCbM1dJMvrdUd6+E2Ij4+YWtdyvy3POUR+OBie7AbKjPAy5DH9Cm1vrzMS32SrbEd7
 3kcC9+kUMA17kl9VUTiY17dTlVMSJd2JQD7S7z+Y8wgNI0e7s27BrSsXOLfrvrcBZRct
 QS+wvpb9cxcH+AMiAysUFv5gRZAP6kuAFhVLg8oVSAy+Vz7E3Q5QPk4KmRXTmprxqRKP
 RjUk4ugfcXDkrw33qBrKfdMH1XVTEEEWgbTCg+hXDj/D8XF9iX486xRqiAL0drQTLoTs
 vJyixxEDwYCdSmYoVYUmiGb94q3Da3pbZ3/p4noYLM92BG2/16YHJ/3G5aGu/uou/bLX Dg== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36aup2v17h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jan 2021 20:55:11 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10R1qquR015327;
 Wed, 27 Jan 2021 01:55:10 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04wdc.us.ibm.com with ESMTP id 36ag3y5b1c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 01:55:10 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10R1t9jV12649058
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jan 2021 01:55:09 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFF0AC6055;
 Wed, 27 Jan 2021 01:55:09 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7DEE6C6059;
 Wed, 27 Jan 2021 01:55:08 +0000 (GMT)
Received: from [9.85.151.130] (unknown [9.85.151.130])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 27 Jan 2021 01:55:08 +0000 (GMT)
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 1/2] ast2600: Modify SPL
 SRAM layout
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>
References: <20210125045846.448399-1-joel@jms.id.au>
 <20210125045846.448399-2-joel@jms.id.au>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <d2407df1-75b1-78eb-6bbb-6ce9e771dbed@linux.vnet.ibm.com>
Date: Tue, 26 Jan 2021 22:55:06 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210125045846.448399-2-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-26_11:2021-01-26,
 2021-01-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 malwarescore=0 suspectscore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2101270002
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

Hi Joel,

On 1/25/2021 1:58 AM, Joel Stanley wrote:
> The SRAM is 89KB on the A1 and beyond:

I guess I'll have to trust you on that one.

> 
>   0x1000_0000 to 0x1000_ffff: 64KB, with parity check
>   0x1001_0000 to 0x1001_5fff: 24KB, w/o parity check
>   0x1001_6000 to 0x1001_63ff: 1KB, w/o parity check, each byte write once
> 
> Allow the image to fill the full 64KB payload size (max that secure boot
> supports) and plcae the stack at the top of the 24KB of SRAM.
typo

> @@ -25,8 +25,8 @@
> 
>   /* SPL */
>   #define CONFIG_SPL_TEXT_BASE		0x00000000
> -#define CONFIG_SPL_MAX_SIZE		0x0000E800
> -#define CONFIG_SPL_STACK		0x10010000
> +#define CONFIG_SPL_MAX_SIZE		0x00010000
> +#define CONFIG_SPL_STACK		0x10016000
>   #define CONFIG_SPL_BSS_START_ADDR	0x90000000
>   #define CONFIG_SPL_BSS_MAX_SIZE		0x00100000
> 

Got the following when I tried this patch (Ubuntu 18.04.5, gcc 7.5.0, binutils 2.30). Am I missing something?

   LD      spl/u-boot-spl
arm-linux-gnueabihf-ld.bfd: u-boot-spl section `.u_boot_list' will not fit in region `flash'
arm-linux-gnueabihf-ld.bfd: region `flash' overflowed by 1612 bytes
scripts/Makefile.spl:384: recipe for target 'spl/u-boot-spl' failed
make[1]: *** [spl/u-boot-spl] Error 1
Makefile:1663: recipe for target 'spl/u-boot-spl' failed
make: *** [spl/u-boot-spl] Error 2


-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
