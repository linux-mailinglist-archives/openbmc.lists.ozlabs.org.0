Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FE639EE83
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 08:07:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzfsP2LWLz304J
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 16:07:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mvx+IKqF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mvx+IKqF; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fzfs43zX3z2xtt
 for <openbmc@lists.ozlabs.org>; Tue,  8 Jun 2021 16:07:04 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15864Yf9005507
 for <openbmc@lists.ozlabs.org>; Tue, 8 Jun 2021 02:07:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : message-id : content-transfer-encoding : content-type :
 mime-version : references : subject; s=pp1;
 bh=8lnnPIIBG42z2gt0q97TwDX5PWT0mkFDdBT58VJzo2k=;
 b=mvx+IKqF0lIpoICNDn23mUxVExy09Bshrcg/lNIwN4AOjTOz6bBNshIKboyiuSwb9+MC
 7/vj55tSvqleV3Gu/+spk7Lwqihw0eH4i1BNoHmHxMK3KAN3CTDAATpticj0zZjP4iUU
 YgZ/0e833keWl52NypEzw2+HW1fJDRGQECIMxRBTZKotdo2nWTekQyxi/CodBOeaT7BQ
 kjBpELccBxQ1rkx5uoJTtB8vrEdWfEYB6iWQLEHQon70O8jkw89vRvkKTOYqVavXZ886
 GdTJEbJNdhTntQCUIVXnms1Hdpw1I3tPa8aDDqikVrf0lDSjURFXc/gK2hj+YXCLRb82 EA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3922ct8w2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 08 Jun 2021 02:07:00 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15865Ggm007711
 for <openbmc@lists.ozlabs.org>; Tue, 8 Jun 2021 02:06:59 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3922ct8w2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Jun 2021 02:06:59 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1585vSmH022551;
 Tue, 8 Jun 2021 06:06:59 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03wdc.us.ibm.com with ESMTP id 3900w9muwx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Jun 2021 06:06:59 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15866wOg20972016
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Jun 2021 06:06:58 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDD4C12405B;
 Tue,  8 Jun 2021 06:06:58 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A6FD3124054;
 Tue,  8 Jun 2021 06:06:58 +0000 (GMT)
Received: from mww0332.dal12m.mail.ibm.com (unknown [9.208.69.80])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  8 Jun 2021 06:06:58 +0000 (GMT)
In-Reply-To: <ME2PR01MB56196A14C09EA4391F4C04E0FE3D9@ME2PR01MB5619.ausprd01.prod.outlook.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: "=?GB2312?B?1twg1LbH5Q==?=" <zhouyuanqing8@outlook.com>
Date: Tue, 8 Jun 2021 06:06:56 +0000
Message-ID: <OF48657B79.8BD900BB-ON002586EE.0020C23B-002586EE.0021982B@ibm.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <ME2PR01MB56196A14C09EA4391F4C04E0FE3D9@ME2PR01MB5619.ausprd01.prod.outlook.com>
X-Mailer: Lotus Domino Web Server Release 11.0.1FP2HF88   April 28, 2021
X-MIMETrack: Serialize by http on MWW0332/03/M/IBM at 06/08/2021 06:06:56,
 Serialize complete at 06/08/2021 06:06:56
X-Disclaimed: 8319
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ocUw32iJgEEgrcpz68MuTY7Ntz6vTN39
X-Proofpoint-GUID: jZ2qzWNC6sqXcJA-oURLQBfYycJskae7
Subject: Re:  cannot modify the files in the overlay file system
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-08_05:2021-06-04,
 2021-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106080042
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
Cc: "uperic@163.com" <uperic@163.com>, openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On June 2, 2021, <zhouyuanqing8@outlook.com> wrote:
> Hi Team=EF=BC=8C=20
>=20
> =20
>    mount command is follow: mount -t overlay overlay -o
>redirect=5Fdir=3Don,index=3Don,lowerdir=3D/run/initramfs/ro/usr/bin,upperd=
ir=3D
>/run/initramfs/rw/cow1,workdir=3D/run/initramfs/rw/work1
>/run/initramfs/rw/merged=20


This seems to create an overlay for /usr/bin and mounts
it at /run/initramfs/rw/merged.

There seems to be some confusion, as the default mtd-static
build with the obmc-phosphor-initfs recipe will create an=20
initramfs that mounts with similar names and has the whole=20
file system mounted writable.

Can you confirm are you using the base layout (static mtd partitions)
or are you using the distro feature for s mmc or ubi (or some other=20
layout custom for your board)?

>    After I mounted the overlay file system , I used vi to open the
>file (vi xxx.sh) in the merged directory, and then when I saved it,
>it prompted "'xxx.sh Invalid argument". Can you help me solve this
>problem?=20

>    On my system, this problem occurs probabilistically on openbmc
>2.8.0, and the probability is very low; but on openbmc 2.9.0, it must
>occur.=20
>=20
> =20
>    openbmc release version :2.9.0=20
>    kernel version=EF=BC=9A5.10.14=E3=80=82=20

There was an issue with overlays before but those should be fixed before=20
5.10.

milton

> =20
> Thankyou.=20
>=20
> =20
> harley   =20
