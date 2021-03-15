Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A3933C8EA
	for <lists+openbmc@lfdr.de>; Mon, 15 Mar 2021 22:59:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dzr144Vz9z303B
	for <lists+openbmc@lfdr.de>; Tue, 16 Mar 2021 08:59:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gzb0oVEQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gzb0oVEQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dzr0r4JFxz2yQm
 for <openbmc@lists.ozlabs.org>; Tue, 16 Mar 2021 08:59:07 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12FLYOYm135679
 for <openbmc@lists.ozlabs.org>; Mon, 15 Mar 2021 17:59:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=U5NlaJ/2Dyaa0Xb6TQBatKMvPrhCpTHcP42QfxPPchY=;
 b=gzb0oVEQcpnDGuPlRrhs4nWM38Mgi9E0D64gpFXEraYqnbR5dPt7D61EReoKVdo3vLb1
 7t8hQ2ntXEgM12vVv2mnB53A9bnN3UB3aauFG1u6ydWspY3vjfhqiPkMuccvKD7z8HYC
 ywYvITF/8U9a0WcMuvHIGaaLKe+Gle7jVLFUlQRDecnO4Pon4oaP9KwT3DWokTngqo6b
 VPx8KMnLGfNe0b1UcCYySB5dOIiUiiIBKoGQrZ/ECEN2GSa3BTVyyadk5t/oI/Y+0J0t
 19aQyjk3yOLBxO4SKUNeI3J+sIhiepY+5ISxX+rDROdwvehVLJLxftZq+hUpsdEQTON0 UQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37abvaec0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 15 Mar 2021 17:59:05 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12FLvoNZ090485
 for <openbmc@lists.ozlabs.org>; Mon, 15 Mar 2021 17:59:04 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37abvaebys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 17:59:04 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12FLv5WK023644;
 Mon, 15 Mar 2021 21:59:03 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma05wdc.us.ibm.com with ESMTP id 378n192etb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 21:59:03 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12FLx3vw35914158
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 21:59:03 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4826EAC05B;
 Mon, 15 Mar 2021 21:59:03 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95DE9AC059;
 Mon, 15 Mar 2021 21:59:02 +0000 (GMT)
Received: from [9.85.168.62] (unknown [9.85.168.62])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 15 Mar 2021 21:59:02 +0000 (GMT)
Subject: Re: [oe-core][RFC 0/3] u-boot: Support SPL Verified Boot
To: Dan Zhang <dz4list@gmail.com>
References: <CAJxKyLed1p-WbcEOZjZ67r61QeEYZ7LBK8xSRDWNNr21pvaMbw@mail.gmail.com>
 <6e63a539-f021-28d3-f60d-a0c301ff599f@linux.vnet.ibm.com>
 <CAJxKyLdnTRXoTXHM0w1Y7dPCdAf5H-gBWJvYe-Rh+KfJBQYvaQ@mail.gmail.com>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <d68da5f9-ee9f-2922-d006-74a4d6425b0f@linux.vnet.ibm.com>
Date: Mon, 15 Mar 2021 18:59:01 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAJxKyLdnTRXoTXHM0w1Y7dPCdAf5H-gBWJvYe-Rh+KfJBQYvaQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-15_12:2021-03-15,
 2021-03-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103150145
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 3/15/2021 6:31 PM, Dan Zhang wrote:
> Hi Kaus,

Hi Dan,


> What's my suggestion essentially is add a configuration i.e.
> DO_UBOOT_SIGN to allow users only create a "signable" fit-image, but
> sign later.
> 
> in the code
> + uboot_fitimage_assemble() {
> ...
> +       #
> +       # Sign the U-boot FIT image and add public key to SPL dtb
> +       #
>          if [ "x${DO_UBOOT_SIGN}" = "x1" ] ; then
> +       ${UBOOT_MKIMAGE_SIGN} \
> +               ${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if
> len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
> +               -F -k "${UBOOT_SIGN_KEYDIR}" \
> +               -K "${spl_dtb}" \
> +               -r ${uboot_bin} \
> +               ${UBOOT_MKIMAGE_SIGN_ARGS}
>         fi
> }
> 

Yes, thanks for the suggestion. As I said, I'm a bit hesitant since the
semantics for creating a Kernel fitImage (i.e., setting KERNEL_CLASSES
and KERNEL_IMAGETYPES) is essentially non-existent for U-Boot.

I'll work on your suggestion, but I think we should use something like
UBOOT_ENABLE_FITIMAGE = "1" - creates the U-Boot fitImage
UBOOT_FITIMAGE_% - variables that control the fitImage creation
SPL_SIGN_ENABLE = "1" signs the U-boot fitImage
SPL_MKIMAGE_% - variables that control the U-boot fitImage signing

That way I guess the variables are used in a similar way as the kernel
fitImage scenario.

Thanks!

  -Klaus

-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
