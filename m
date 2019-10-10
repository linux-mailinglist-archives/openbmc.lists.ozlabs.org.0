Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B8749D2289
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 10:21:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pkZV2jzJzDr0K
	for <lists+openbmc@lfdr.de>; Thu, 10 Oct 2019 19:21:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pkYb37fKzDqyH
 for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2019 19:20:47 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9A8JJo6127241
 for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2019 04:20:44 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vhynajgxp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2019 04:20:44 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <clg@kaod.org>;
 Thu, 10 Oct 2019 09:20:42 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 10 Oct 2019 09:20:40 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x9A8K9Ih30605628
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2019 08:20:09 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28D8CA4055
 for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2019 08:20:39 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20194A4040
 for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2019 08:20:39 +0000 (GMT)
Received: from smtp.tls.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2019 08:20:39 +0000 (GMT)
Received: from yukon.kaod.org (sig-9-145-2-100.uk.ibm.com [9.145.2.100])
 by smtp.tls.ibm.com (Postfix) with ESMTP id CB8BC22016A
 for <openbmc@lists.ozlabs.org>; Thu, 10 Oct 2019 10:20:38 +0200 (CEST)
Subject: Re: [PATCH 0/5] i2c: aspeed: Add buffer and DMA modes support
To: openbmc@lists.ozlabs.org
References: <20191007231313.4700-1-jae.hyun.yoo@linux.intel.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Date: Thu, 10 Oct 2019 10:20:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191007231313.4700-1-jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19101008-0008-0000-0000-00000320C6AF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101008-0009-0000-0000-00004A3FCE59
Message-Id: <b91963ee-2536-43da-0801-e41dc9ad0877@kaod.org>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-10_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=4 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=898 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910100078
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

Hello, Jae

On 08/10/2019 01:13, Jae Hyun Yoo wrote:
> This patch series adds buffer mode and DMA mode transfer support for the
> Aspeed I2C driver. With this change, default transfer mode will be set to
> buffer mode for better performance, and DMA mode can be selectively used
> depends on platform configuration.
> 
> * Buffer mode
>   AST2400:
>     It has 2 KBytes (256 Bytes x 8 pages) of I2C SRAM buffer pool from
>     0x1e78a800 to 0x1e78afff that can be used for all busses with
>     buffer pool manipulation. To simplify implementation for supporting
>     both AST2400 and AST2500, it assigns each 128 Bytes per bus without
>     using buffer pool manipulation so total 1792 Bytes of I2C SRAM
>     buffer will be used.
> 
>   AST2500:
>     It has 16 Bytes of individual I2C SRAM buffer per each bus and its
>     range is from 0x1e78a200 to 0x1e78a2df, so it doesn't have 'buffer
>     page selection' bit field in the Function control register, and
>     neither 'base address pointer' bit field in the Pool buffer control
>     register it has. To simplify implementation for supporting both
>     AST2400 and AST2500, it writes zeros on those register bit fields
>     but it's okay because it does nothing in AST2500.
> 
> * DMA mode
>   Only AST2500 and later versions support DMA mode under some limitations:
>     I2C is sharing the DMA H/W with UHCI host controller and MCTP
>     controller. Since those controllers operate with DMA mode only, I2C
>     has to use buffer mode or byte mode instead if one of those
>     controllers is enabled. Also make sure that if SD/eMMC or Port80
>     snoop uses DMA mode instead of PIO or FIFO respectively, I2C can't
>     use DMA mode.


I just pushed models adding support for the pool buffer mode and DMA mode
to the I2C controller and did some tests on these QEMU Aspeed machines : 

  palmetto (AST2400) : BYTE + BUFFER 
  romulus  (AST2500) : BYTE + BUFFER + DMA (with a custom DT) 
  tacoma   (AST2600) : BYTE

Looks good on the QEMU side. 

Thanks,

C.  


> Please review it.
> 
> -Jae
> 
> Jae Hyun Yoo (5):
>   dt-bindings: i2c: aspeed: add buffer and DMA mode transfer support
>   ARM: dts: aspeed: add I2C buffer mode support
>   i2c: aspeed: fix master pending state handling
>   i2c: aspeed: add buffer mode transfer support
>   i2c: aspeed: add DMA mode transfer support
> 
>  .../devicetree/bindings/i2c/i2c-aspeed.txt    |  67 ++-
>  arch/arm/boot/dts/aspeed-g4.dtsi              |  47 +-
>  arch/arm/boot/dts/aspeed-g5.dtsi              |  47 +-
>  drivers/i2c/busses/i2c-aspeed.c               | 513 ++++++++++++++++--
>  4 files changed, 588 insertions(+), 86 deletions(-)
> 

