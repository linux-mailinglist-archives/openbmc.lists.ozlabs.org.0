Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 001E63CB92F
	for <lists+openbmc@lfdr.de>; Fri, 16 Jul 2021 16:55:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GRDmt6HQ0z309L
	for <lists+openbmc@lfdr.de>; Sat, 17 Jul 2021 00:55:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SbY6yJPg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SbY6yJPg; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GRDmW0bYnz2yN4
 for <openbmc@lists.ozlabs.org>; Sat, 17 Jul 2021 00:54:50 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16GEXTSp052882; Fri, 16 Jul 2021 10:54:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=bZe8VMmcH236gc2U619+uy4N/ASzZQmaN5xWqgxwaaU=;
 b=SbY6yJPgW5t68dx7ZUEs3f+QNBhVUxJ5J07qsduD7qEXTsWHeAsfSJ0hY6lg7HImQppg
 P5zsNhCG44564qK42pnHbFxUa0xMUxLMt/iNtqf6xHz/Ynl+B7NX7r6/+gwgSaA4KoMI
 1yxnjjjBob0OhcSQ42/p3RDrIRNxRA1hfcInDVoOhm3/a493gW2s8adUtMKMe59um+xB
 J1MWB9aAeOKYaGAmTa6A1Qa8zABAeqkoDKRJ4QriXvsA03A2ODK5eoRjNaMg82y1mOrj
 KCpp2i27urMpGc6reG+vliklJWpPtQtvLWcDsXe5VZBu7ZW0cakLH2SbMSCPtNIW3C2u YQ== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39twuxe1br-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 10:54:44 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16GEqW8J014732;
 Fri, 16 Jul 2021 14:54:43 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02wdc.us.ibm.com with ESMTP id 39q36e6f65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 14:54:43 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16GEshRs30081484
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Jul 2021 14:54:43 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26081AE062;
 Fri, 16 Jul 2021 14:54:43 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84122AE064;
 Fri, 16 Jul 2021 14:54:42 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.65.250.186])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 16 Jul 2021 14:54:42 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] aspeed/hace: Reset when
 error occurs
From: Adriana Kobylak <anoo@linux.ibm.com>
In-Reply-To: <20210715045258.13912-1-joel@jms.id.au>
Date: Fri, 16 Jul 2021 09:54:41 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <20A7316B-7A1B-41B3-B5D4-EF9CEA98F279@linux.ibm.com>
References: <20210715045258.13912-1-joel@jms.id.au>
To: Joel Stanley <joel@jms.id.au>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Dx04poL_OCZmBC5HbxCtpBsgelBJ-HC4
X-Proofpoint-GUID: Dx04poL_OCZmBC5HbxCtpBsgelBJ-HC4
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-16_05:2021-07-16,
 2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107160088
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Jul 14, 2021, at 11:52 PM, Joel Stanley <joel@jms.id.au> wrote:
>=20
> Some hasing operations have been triggering an error state.
>=20
> This can be reproduced on the u-boot command line:
>=20
> hash sha512 83000128 3762a8
>=20
> This completes, and the hash is correct. However HACE1C, the status
> register, shows an error bit is set 0x00800000.
>=20
> $ bitfield HACE1C 0x00800000 |grep 0x1
>                 Hash input data buffer overflow: 0x1
>=20
> The next operation is queued, and this never completes. The status
> register shows 0x00c00001
>=20
> $ bitfield HACE1C 0x00c00001 |grep 0x1
>                 Hash input data buffer overflow: 0x1
>                 Hash input rorate data overflow: 0x1
>                                Hash engine busy: 0x1
>=20
> A HACE reset will clear this state:
>=20
> mw.l 0x1e6e2040 0x10
> mw.l 0x1e6e2044 0x10
>=20
> Adding code to do this if any error bits are set in the status =
register
> is a workaround for the issue while further debugging is done.
>=20
> Another workaround is to do an operation before running the =
problematic
> operation. This sequence succeeds:
>=20
> hash sha512 83000000 10
> hash sha512 83000128 3762a8
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Tested-by: Adriana Kobylak <anoo@us.ibm.com>


> ---
> drivers/crypto/aspeed_hace.c | 15 ++++++++++++---
> 1 file changed, 12 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/crypto/aspeed_hace.c =
b/drivers/crypto/aspeed_hace.c
> index a99fb7c249be..f40779c08816 100644
> --- a/drivers/crypto/aspeed_hace.c
> +++ b/drivers/crypto/aspeed_hace.c
> @@ -100,9 +100,18 @@ static int digest_object(const void *src, =
unsigned int length, void *digest,
> 	writel(HACE_SHA_BE_EN | method, base + ASPEED_HACE_HASH_CMD);
>=20
> 	/* SHA512 hashing appears to have a througput of about 12MB/s */
> -	return aspeed_hace_wait_completion(base + ASPEED_HACE_STS,
> -			HACE_HASH_ISR,
> -			1000 + (length >> 3));
> +	aspeed_hace_wait_completion(base + ASPEED_HACE_STS, =
HACE_HASH_ISR,
> +				    1000 + (length >> 3));
> +
> +	if (readl(base + ASPEED_HACE_STS)) {
> +		debug("\nHACE error 0x%08x, resetting\n", readl(base + =
0x1c));
> +
> +		writel(0x10, 0x1e6e2040);
> +		mdelay(5);
> +		writel(0x10, 0x1e6e2044);
> +	}
> +
> +	return 0;
> }
>=20
> void hw_sha1(const unsigned char *pbuf, unsigned int buf_len,
> --=20
> 2.32.0
>=20

