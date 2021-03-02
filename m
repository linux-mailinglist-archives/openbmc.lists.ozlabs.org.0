Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F8C32A050
	for <lists+openbmc@lfdr.de>; Tue,  2 Mar 2021 14:17:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dqd3B4DsXz3cRX
	for <lists+openbmc@lfdr.de>; Wed,  3 Mar 2021 00:17:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=at8NtKH1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=at8NtKH1; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dqd2y72m4z30Hn
 for <openbmc@lists.ozlabs.org>; Wed,  3 Mar 2021 00:17:29 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122D7uLf068094; Tue, 2 Mar 2021 08:17:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to :
 references : message-id : date : mime-version : in-reply-to : content-type
 : content-transfer-encoding; s=pp1;
 bh=Z9BGWqFMpG/vlmeo/s/jAvbsolE1gCpbARzRpGD1bIA=;
 b=at8NtKH1gfKzhvEHW7ypJERXCsDIY5KSvQ8ZSOdc9+KQxjU/1qZYA2roP1DU4+ZPCxTT
 DQ0Hp+jf8OyFYj+ccdJxwcXEGD2CgE7zA7cACIEB0V4PbJTgn3SwXycPxrr+T81lxH5g
 vmUYoRCseClUn94Sd95nVH8sjsw4iYzyJEJVhuUs04t2tzp1QJYdrgN2gUUY0QHA0lw0
 5fajFerDJc4SBBzwYFK7pPVl7LtCjwj1RXRdEnYgsiEQJyLMXhisK5ioEE9CE48IVukC
 JAzXycJfmZttAqYMmKvMWV/HY+4OHye4KBfk4Yvy6cPUq41bDK30tZcaRoLdZh0aV58s aA== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 371mauvbs2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 08:17:17 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 122DCNGj012476;
 Tue, 2 Mar 2021 13:17:16 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 36ydq950p9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 13:17:16 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 122DHGmL32440688
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Mar 2021 13:17:16 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01805AC05F;
 Tue,  2 Mar 2021 13:17:16 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27880AC05B;
 Tue,  2 Mar 2021 13:17:15 +0000 (GMT)
Received: from [9.85.166.234] (unknown [9.85.166.234])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Mar 2021 13:17:14 +0000 (GMT)
Subject: Re: (Aspeed2600) Booting with a SPL loading U-boot fitImage
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>
References: <c893e22c-f552-afb7-d8c7-f75b15e7d2f8@linux.vnet.ibm.com>
Message-ID: <30ad3445-7d0d-cea7-479e-162b6dc90ed3@linux.vnet.ibm.com>
Date: Tue, 2 Mar 2021 10:17:14 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <c893e22c-f552-afb7-d8c7-f75b15e7d2f8@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_06:2021-03-01,
 2021-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 clxscore=1015 mlxscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103020107
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



On 3/1/2021 4:25 PM, Klaus Heinrich Kiwi wrote:
> Has anyone been able to successfully bring-up U-boot proper as a fitImage from the SPL, when using U-boot from the 2019.4 Aspeed SDK?


I spent a bit more time reading through the Aspeed SDK U-boot code and I think this is simply not implemented, and actually might explain why a Legacy Uboot image loads, even if Legacy Image is not enabled in the config...

So arch/arm/mach-aspeed/ast2600/utils.S defines the ast2600 ast_bootmode() to be one of 'AST_BOOTMODE_UART', 'AST_BOOTMODE_SPI' or 'AST_BOOTMODE_EMMC' based on hw strapping info and arch/arm/mach-aspeed/ast2600/spl.c:spl_boot_device() uses that to instruct the SPL which (of these 3 methods) to use...

The SPL is being built with multiple (redundant?) image loaders:

0000e5d0 D _u_boot_list_2_spl_image_loader_2_aspeed_spl_mmc_load_image0ASPEED_BOOT_DEVICE_MMC
0000e5dc D _u_boot_list_2_spl_image_loader_2_aspeed_spl_ram_load_image0ASPEED_BOOT_DEVICE_RAM
0000e5e8 D _u_boot_list_2_spl_image_loader_2_aspeed_spl_ymodem_load_image0ASPEED_BOOT_DEVICE_UART
0000e5f4 D _u_boot_list_2_spl_image_loader_2_spl_mmc_load_image0BOOT_DEVICE_MMC1
0000e600 D _u_boot_list_2_spl_image_loader_2_spl_mmc_load_image0BOOT_DEVICE_MMC2
0000e60c D _u_boot_list_2_spl_image_loader_2_spl_mmc_load_image0BOOT_DEVICE_MMC2_2
0000e618 D _u_boot_list_2_spl_image_loader_2_spl_ram_load_image0BOOT_DEVICE_RAM
0000e624 D _u_boot_list_2_spl_image_loader_2_spl_ymodem_load_image0BOOT_DEVICE_UART

But the ast_bootmode() causes only the aspeed_spl_*_load_image() to be really used.

And if we compare the aspeed versions (from arch/arm/mach-aspeed/ast2600/spl_boot.c) with the common versions (common/spl/spl_mmc.c), we clearly see that the common version has the infrastructure to detect and load the FIT, while the aspeed version is simply loading the raw contents of the mmc into RAM and setting the entry point to it's start (that means: treating the mmc contents as a legacy u-boot image regardless).

I guess that the amount of coding required to catch-up 'aspeed_secboot_spl_*_load_image' with the necessary SPL_LOAD_FIT infrastructure is not trivial, so I'm hoping that the other way around (using the common infrastructure) is easier - Joel, Ryan, any comments?

It would also help in avoiding redundant symbols, since the way it is we cannot fit everything we need in the SPL + SPL DTB in 64KB anyway...

  -Klaus

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
