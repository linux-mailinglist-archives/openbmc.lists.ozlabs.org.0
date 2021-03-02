Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 262B932A07C
	for <lists+openbmc@lfdr.de>; Tue,  2 Mar 2021 14:22:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dqd8712g1z3cZy
	for <lists+openbmc@lfdr.de>; Wed,  3 Mar 2021 00:21:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XyTQ5eJI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XyTQ5eJI; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dqd7v2KSMz30JW
 for <openbmc@lists.ozlabs.org>; Wed,  3 Mar 2021 00:21:46 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122D9o5l024016
 for <openbmc@lists.ozlabs.org>; Tue, 2 Mar 2021 08:21:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=DSQ6AFcvBTZdDhfm5F/Y1Bgy56r57VlzKUMepRBQBWc=;
 b=XyTQ5eJI+RrEpfgg5CO4exwiWoSvuGBbUkRKEMTTL0Fk1anDcB9C74o5W81nXvJW7ExT
 Y1o1OrLloG8toap90AikPDhfbF/7d5WPuWFm9UqhLoe21oM+eIEacPXu1Bcqx8o9Na0a
 veLFRFhQxm4MPO0bW/5NFw9hq/GpUa8mjq9DhAJ+a5dmFsVEemUh49a7VvTLzppMFB87
 j+iPAfLoKierFfKctaFzA8jA0+SpmfDqUdGMLL4JGPzJd1Cff2Xuy6MMmjNUzXD1ugCi
 r7CN1dMOfe9tsiukYCylOfnDDoI/hiW/sy6979bzrj/1CDRtnGv/T+v0OyCsOC9SOHMs 6w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 371p0f0ggv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 02 Mar 2021 08:21:44 -0500
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 122DAjJw030416
 for <openbmc@lists.ozlabs.org>; Tue, 2 Mar 2021 08:21:44 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 371p0f0ggn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 08:21:44 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 122DIJ7E012012;
 Tue, 2 Mar 2021 13:21:43 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01wdc.us.ibm.com with ESMTP id 36ydq8y6yq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 13:21:43 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 122DLhTk11469196
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Mar 2021 13:21:43 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D348AC062;
 Tue,  2 Mar 2021 13:21:43 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1D6AAC05E;
 Tue,  2 Mar 2021 13:21:42 +0000 (GMT)
Received: from [9.85.166.234] (unknown [9.85.166.234])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Mar 2021 13:21:42 +0000 (GMT)
Subject: Re: (Aspeed2600) Booting with a SPL loading U-boot fitImage
To: Dan Zhang <dz4list@gmail.com>, openbmc@lists.ozlabs.org
References: <mailman.1404.1614626722.7079.openbmc@lists.ozlabs.org>
 <CAJxKyLcnj=Op-+LLfjCQmX-MFCsk8duud1_Tk0RWjXAzUiKNAA@mail.gmail.com>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <8dc7f4a2-4298-5c46-bae2-02a195b4c7b1@linux.vnet.ibm.com>
Date: Tue, 2 Mar 2021 10:21:42 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAJxKyLcnj=Op-+LLfjCQmX-MFCsk8duud1_Tk0RWjXAzUiKNAA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_06:2021-03-01,
 2021-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 mlxscore=0 suspectscore=0 adultscore=0 mlxlogscore=849 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
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



On 3/2/2021 4:54 AM, Dan Zhang wrote:

> I think within A FIT image, the u-boot binary is not located at your entry point 0x81000000,
> it is behind the fit header, somewhere. This means the entry_point and load_addr is not the same as spl_boot.c defined.
> spl_image->entry_point= CONFIG_ASPEED_UBOOT_DRAM_BASE;
> spl_image->load_addr= CONFIG_ASPEED_UBOOT_DRAM_BASE;
> Also, the u-boot code itself before relocation is position aware ( SYS_TEXT_BASE must be set to 0x81000000, as your second try works). This means the entry_point shall be the same as SYS_TEXT_BASE.

I think it's not that simple. See my answer (to myself) in this same thread with new information.
  
> In fb/OpenBMC, verified boot implementation, use mkimage option:
>    -p => place external data at a static position,
> thus we specify the somewhere to a static offset , then you can set the entry_point = load_addr + offset.

Verified boot should work if you are having u-boot proper validating the Linux Kernel fitimage, but I don't see how the Aspeed 2600 SPL would be able to load and verify the u-boot proper fitimage - the code simply isn't there..

It seems to me that the SPL_LOAD_FIT code should handle recognizing the fitimage, moving it's 'loadables' images into memory and setting the entry point accordingly.

  -Klaus
