Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5583F20EFA0
	for <lists+openbmc@lfdr.de>; Tue, 30 Jun 2020 09:37:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wx5H2yCczDqP6
	for <lists+openbmc@lfdr.de>; Tue, 30 Jun 2020 17:37:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vishwa@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wx4Y30jszDqjQ
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jun 2020 17:36:25 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05U7XDH6138466; Tue, 30 Jun 2020 03:36:21 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ydjxu1r3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 03:36:21 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05U7ZFsM018283;
 Tue, 30 Jun 2020 07:36:19 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 31wwr8bd3a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 07:36:19 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05U7aGwU37683334
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Jun 2020 07:36:16 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CBA1AE055;
 Tue, 30 Jun 2020 07:36:16 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1F9CAE045;
 Tue, 30 Jun 2020 07:36:15 +0000 (GMT)
Received: from [9.85.87.239] (unknown [9.85.87.239])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 30 Jun 2020 07:36:15 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH linux dev-5.4] leds: pca955x: Add a software
 implementation of the PCA9552 chip
From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
In-Reply-To: <20200622154542.20930-1-eajames@linux.ibm.com>
Date: Tue, 30 Jun 2020 13:06:13 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <681E8D36-2B64-4D68-BF5A-666BC00B1138@linux.vnet.ibm.com>
References: <20200622154542.20930-1-eajames@linux.ibm.com>
To: Eddie James <eajames@linux.ibm.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-06-30_02:2020-06-30,
 2020-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011
 cotscore=-2147483648 bulkscore=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006300054
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
Cc: andrew@aj.id.au, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On 22-Jun-2020, at 9:15 PM, Eddie James <eajames@linux.ibm.com> wrote:
>=20
> There is an implementation of the PCA9552 on a PIC16F microcontroller.
> The I2C device addresses are different from the hardware PCA9552, so =
add
> a new compatible string and associated platform data to be able to =
probe
> this device.
>=20
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
> drivers/leds/leds-pca955x.c | 8 ++++++++
> 1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
> index 4037c504589c..4d3a36538c6c 100644
> --- a/drivers/leds/leds-pca955x.c
> +++ b/drivers/leds/leds-pca955x.c
> @@ -65,6 +65,7 @@ enum pca955x_type {
> 	pca9550,
> 	pca9551,
> 	pca9552,
> +	pca9552_soft,
> 	pca9553,
> };
>=20
> @@ -90,6 +91,11 @@ static struct pca955x_chipdef pca955x_chipdefs[] =3D =
{
> 		.slv_addr	=3D /* 1100xxx */ 0x60,
> 		.slv_addr_shift	=3D 3,
> 	},
> +	[pca9552_soft] =3D {
> +		.bits		=3D 16,
> +		.slv_addr	=3D /* 0110xxx */ 0x30,
> +		.slv_addr_shift	=3D 3,
> +	},
> 	[pca9553] =3D {
> 		.bits		=3D 4,
> 		.slv_addr	=3D /* 110001x */ 0x62,
> @@ -101,6 +107,7 @@ static const struct i2c_device_id pca955x_id[] =3D =
{
> 	{ "pca9550", pca9550 },
> 	{ "pca9551", pca9551 },
> 	{ "pca9552", pca9552 },
> +	{ "pca9552-soft", pca9552_soft },
> 	{ "pca9553", pca9553 },
> 	{ }
> };
> @@ -412,6 +419,7 @@ static const struct of_device_id =
of_pca955x_match[] =3D {
> 	{ .compatible =3D "nxp,pca9550", .data =3D (void *)pca9550 },
> 	{ .compatible =3D "nxp,pca9551", .data =3D (void *)pca9551 },
> 	{ .compatible =3D "nxp,pca9552", .data =3D (void *)pca9552 },
> +	{ .compatible =3D "nxp,pca9552-soft", .data =3D (void =
*)pca9552_soft },
> 	{ .compatible =3D "nxp,pca9553", .data =3D (void *)pca9553 },
> 	{},
> };
> =E2=80=94=20
> 2.24.0
>=20

This looks good to me and I have tested it successfully.

Reviewed-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>=20=
