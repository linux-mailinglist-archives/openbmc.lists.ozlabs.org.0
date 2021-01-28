Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A38930806D
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 22:24:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRYPf0XqhzDrNG
	for <lists+openbmc@lfdr.de>; Fri, 29 Jan 2021 08:24:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aH++uDnD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRYNj36mFzDr7C
 for <openbmc@lists.ozlabs.org>; Fri, 29 Jan 2021 08:23:15 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10SL1YYc096110; Thu, 28 Jan 2021 16:23:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=WT+E3NCEbS2cA/ZYBsuW+V8N8iVmltRwh2HmqNyn/5U=;
 b=aH++uDnDzl2o1CtFDEEkHAnMEn5fCSwRRXuUC4u9gwyMs6U5k0A91LnHBf+7f4pXAfX0
 zNsZSNDzJbM1IQhQFI2OkDb4TtEvEt5IMfLIvtTc+Czo7F2EpFcbF6zGNIVOsss2NirU
 yNx4U8IIzySg5+AaDUo+2beEUgk//kXfXkXRQHn0XqD1BysxAr8wySdmISnhv8bTIZt0
 krmClch0lhNoSYOuKGGaQBdnyqQ3+ful+UX1m0+rzTWHbv3fdRss8zWelxUNVLG8yD2C
 IGjn8btjic3x+ylLfvuk8Iau57MP9jtBFVxauLhc/2IZp8Pe7dgIQ0sL+H92C8HBHx2S bA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36c213d4sq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 16:23:08 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10SLGmSW001756;
 Thu, 28 Jan 2021 21:23:08 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 36a4mccxnn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 21:23:08 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10SLN6wh26673440
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Jan 2021 21:23:06 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B803AC605A;
 Thu, 28 Jan 2021 21:23:06 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF334C6055;
 Thu, 28 Jan 2021 21:23:05 +0000 (GMT)
Received: from [9.80.204.221] (unknown [9.80.204.221])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 28 Jan 2021 21:23:05 +0000 (GMT)
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 5/7] Add support for SHA384
 and SHA512
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org
References: <20210128105304.401058-1-joel@jms.id.au>
 <20210128105304.401058-6-joel@jms.id.au>
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Message-ID: <cc29850b-7b76-6949-0d09-4e389b794127@linux.vnet.ibm.com>
Date: Thu, 28 Jan 2021 18:23:04 -0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210128105304.401058-6-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-28_12:2021-01-28,
 2021-01-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 clxscore=1015 mlxscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101280099
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



On 1/28/2021 7:53 AM, Joel Stanley wrote:
> From: Reuben Dowle <reubendowle0@gmail.com>
> 
> The current recommendation for best security practice from the US government
> is to use SHA384 for TOP SECRET [1].
> 
> This patch adds support for SHA384 and SHA512 in the hash command, and also
> allows FIT images to be hashed with these algorithms, and signed with
> sha384,rsaXXXX and sha512,rsaXXXX
> 
> The SHA implementation is adapted from the linux kernel implementation.
> 
> [1] Commercial National Security Algorithm Suite
> http://www.iad.gov/iad/programs/iad-initiatives/cnsa-suite.cfm
> 
> Signed-off-by: Reuben Dowle <reuben.dowle@4rf.com>
> (cherry picked from commit d16b38f42704fe3cc94fbee1601be96045013151)
> Signed-off-by: Joel Stanley <joel@jms.id.au>

This looks good from a u-boot point of view, but be aware that once
we enable sha512 on an openbmc (ast2600) build, we're going past the
SPL limit:

|   (cd spl && arm-openbmc-linux-gnueabi-ld.bfd   -T u-boot-spl.lds  --gc-sections -Bstatic --gc-sections -pie  --no-dynamic-linker -Ttext 0x00000000 arch/arm/cpu/armv7/start.o --start-group arch/arm/mach-aspeed/built-in.o arch/arm/cpu/armv7/built-in.o arch/arm/cpu/built-in.o arch/arm/lib/built-in.o board/aspeed/evb_ast2600a1/built-in.o common/spl/built-in.o common/init/built-in.o common/built-in.o cmd/built-in.o env/built-in.o lib/built-in.o disk/built-in.o drivers/built-in.o dts/built-in.o fs/built-in.o  --end-group arch/arm/lib/eabi_compat.o arch/arm/lib/lib.a -Map u-boot-spl.map -o u-boot-spl)
| arm-openbmc-linux-gnueabi-ld.bfd: u-boot-spl section `.u_boot_list' will not fit in region `flash'
| arm-openbmc-linux-gnueabi-ld.bfd: region `flash' overflowed by 1216 bytes

So perhaps when enabling this we will need another set of #if-defined's, perhaps
removing the other hashing algos?

Reviewed-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>



-- 
Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
