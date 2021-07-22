Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3D63D2606
	for <lists+openbmc@lfdr.de>; Thu, 22 Jul 2021 16:43:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GVwDc296rz30CR
	for <lists+openbmc@lfdr.de>; Fri, 23 Jul 2021 00:43:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F0zLYDL2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=F0zLYDL2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GVwDG0bRKz2yWN
 for <openbmc@lists.ozlabs.org>; Fri, 23 Jul 2021 00:43:09 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16MEWhuW000686; Thu, 22 Jul 2021 10:43:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=LcFmo9c6y3v+uKq3VYBILhgRnDw2BNnJ2WH/oQA0z6k=;
 b=F0zLYDL2FMP3f3abHB14npWs9Ubrl1Z8qotF8751PDcDRt+BrbmJOOICWq1FYgNSvdlp
 gv6ojKoc6bT3avCEjY9I588ExZWevgbwv1gYnrCo1CrhguJQs2a+rkDJsKTuRxwVKp9O
 kBNbd0J3q0uJIBhXkcNHbKkjL8WrhxYlj3EM5JnnjKcJ5nv1XARxKDlTKg78kuts1BoO
 yHLhARKb/olPImI4yVNTHUA/YHvblH45+tetyZ+qFREdAnKDOAMnFgm3+dwqY1wRwq9Y
 dadq4w94MKAB6ynF9H0ZxDJk4FwTPqiHF5Pe5EX9Mj8hlUjMavwINm6DvanK/StHAYgW xg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39ya97gxgk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 10:43:04 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16MEWiT4000847;
 Thu, 22 Jul 2021 10:43:03 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39ya97gxfb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 10:43:03 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16MEbbD4027007;
 Thu, 22 Jul 2021 14:43:01 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 39vuk7tbyp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 14:43:01 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16MEh0UB37552406
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Jul 2021 14:43:00 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17515C605D;
 Thu, 22 Jul 2021 14:43:00 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50184C606C;
 Thu, 22 Jul 2021 14:42:59 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.160.95.46])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 22 Jul 2021 14:42:59 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH linux dev-5.10] ARM: dts: rainier: Add
 'factory-reset-toggle' as GPIOF6
From: Adriana Kobylak <anoo@linux.ibm.com>
In-Reply-To: <20210714214741.1547052-1-blisaac91@gmail.com>
Date: Thu, 22 Jul 2021 09:42:57 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <8A669E1A-81B3-40E6-BD0C-342D1566EEC8@linux.ibm.com>
References: <20210714214741.1547052-1-blisaac91@gmail.com>
To: Isaac Kurth <blisaac91@gmail.com>, mspinler@linux.ibm.com,
 Andrew Geissler <geissonator@gmail.com>, Joel Stanley <joel@jms.id.au>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: P0KyNtTg3VxnxPXxM16RY0MxrVzvjIEn
X-Proofpoint-ORIG-GUID: AGTP1S0D6gnsyOdDRoStbd43ZwkSogf8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-22_09:2021-07-22,
 2021-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107220097
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
Cc: isaac.kurth@ibm.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Jul 14, 2021, at 4:47 PM, Isaac Kurth <blisaac91@gmail.com> wrote:
>=20
> From: Isaac Kurth <isaac.kurth@ibm.com>
>=20
> The state of this GPIO determines whether a factory reset has been
> requested. If a physical switch is used, it can be high or low. During =
boot,
> the software checks and records the state of this switch. If it is =
different
> than the previous recorded state, then the read-write portions of =
memory are
> reformatted.
>=20
> Signed-off-by: Isaac Kurth <isaac.kurth@ibm.com>

Reviewed-by: Adriana Kobylak <anoo@us.ibm.com>

> ---
> arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts =
b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 728855c5cb90..81be3a563e6a 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -231,7 +231,7 @@ &gpio0 {
> 	/*C0-C7*/	"","","","","","","","",
> 	/*D0-D7*/	"","","","","","","","",
> 	/*E0-E7*/	"","","","","","","","",
> -	/*F0-F7*/	"","","","","","","","",
> +	/*F0-F7*/	"","","","","","","factory-reset-toggle","",
> 	/*G0-G7*/	"","","","","","","","",
> 	/*H0-H7*/	=
"","bmc-ingraham0","rear-enc-id0","rear-enc-fault0","","","","",
> 	/*I0-I7*/	"","","","","","","","",
> --=20
> 2.25.1
>=20

