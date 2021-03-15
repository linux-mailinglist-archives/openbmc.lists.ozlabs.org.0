Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5820A33C26F
	for <lists+openbmc@lfdr.de>; Mon, 15 Mar 2021 17:47:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dzj5Y2qfPz3019
	for <lists+openbmc@lfdr.de>; Tue, 16 Mar 2021 03:47:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FHlenvJs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FHlenvJs; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dzj5K0Ghrz2yxn
 for <openbmc@lists.ozlabs.org>; Tue, 16 Mar 2021 03:47:31 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12FGYB5s080971
 for <openbmc@lists.ozlabs.org>; Mon, 15 Mar 2021 12:47:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=D3kaDOKLhs5SkGfZwX7Dv+Fp2yOXZZb/hjewpChECcM=;
 b=FHlenvJsLXhauzFMwIpfXKycIT4yj1cRLSf1zb3jy4VYlk0Nsu/7aeygnlLHK3f3myvS
 VuubCpg3ruGCyAfwUtpAdIPaJ/EmlHTR2DzLWNnPgfZ4LrR6Uu2x7NKFP/TMIA42/bAe
 tsMyAd8YNJCg+CnPt5EDbQuoI0XwKPWCXpWeILSIMgTffTK1JdCjpG4kmrlmW8X0WqZ4
 x/w7zXxvp6YiVBUKQusUO0DWN8qr/A5v0FZyfpmkC8UiSFzOvbxDfzg3JrcW5NTdH2ju
 9z4O6ewmyl4UOYW+tEb1nCMa+ioB//SANZ1JWrcK+JZJpGKtaWHJ2HFDwwvsBDXib9vK jw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37aasbs3rm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 15 Mar 2021 12:47:29 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12FGYwwn083826
 for <openbmc@lists.ozlabs.org>; Mon, 15 Mar 2021 12:47:29 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37aasbs3re-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 12:47:29 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12FGg1q6011311;
 Mon, 15 Mar 2021 16:47:28 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 378n19mt95-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 16:47:28 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12FGlRcg27984130
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 16:47:27 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61AD7AC05F;
 Mon, 15 Mar 2021 16:47:27 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4FE9AC05E;
 Mon, 15 Mar 2021 16:47:26 +0000 (GMT)
Received: from [9.85.168.62] (unknown [9.85.168.62])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 15 Mar 2021 16:47:26 +0000 (GMT)
Subject: Re: [oe-core][RFC 0/3] u-boot: Support SPL Verified Boot
To: openbmc@lists.ozlabs.org, Dan Zhang <dz4list@gmail.com>
References: <CAJxKyLed1p-WbcEOZjZ67r61QeEYZ7LBK8xSRDWNNr21pvaMbw@mail.gmail.com>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <6e63a539-f021-28d3-f60d-a0c301ff599f@linux.vnet.ibm.com>
Date: Mon, 15 Mar 2021 13:47:25 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAJxKyLed1p-WbcEOZjZ67r61QeEYZ7LBK8xSRDWNNr21pvaMbw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-15_08:2021-03-15,
 2021-03-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103150113
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



On 3/7/2021 11:51 PM, Dan Zhang wrote:
> Hi Klaus,

Hi Dan - sorry, your reply went under my radar last week!

> Thank you very much for providing this solution to build and sign
> u-boot fit-image.
> 
> I have one suggestion: decouple the U-Boot fit build and signing.
> 
> UBOOT_FIT ==> Create the uboot fit-image (essentially all your
> proposal did, except the latest sign step in uboot_fit_assemble())
> SPL_SIGN_ENABLE ==> create the uboot fit-image, also sign it.
> 
> This similar to kernel_fit means create the kernel fitimage, while
> UBOOT_SIGN_ENABLE means sign it.
> 
> This will allow the user to use a simple script to sign an unsigned
> image with any key, w/o need to be able to tweak the recipe and
> rebuild the image.
> i.e. the manufacturing team, the testing team.

Thanks for the suggestion, however, I'm a bit hesitant with this change,
since for U-Boot the creation/support for the fitImage uImage needs
to be set in the u-boot config, so unlike the kernel I don't think
we could simply enable it on the machine.conf and expect it to work.

I'm about to send the patches below as a proper submission to
openembedded-devel, and I'll continue cross-posting to the openbmc
list. However, please feel free to answer with you suggestions and
copy the openembedded mailing-list as well.

Thanks!

  -Klaus




-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
