Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C623B27F534
	for <lists+openbmc@lfdr.de>; Thu,  1 Oct 2020 00:35:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C1rgS1LvZzDqNR
	for <lists+openbmc@lfdr.de>; Thu,  1 Oct 2020 08:35:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=o5pym9O1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C1rff0H2bzDqDm
 for <openbmc@lists.ozlabs.org>; Thu,  1 Oct 2020 08:34:49 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08UMX4OS169947
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 18:34:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : mime-version : references : content-transfer-encoding :
 content-type : message-id : subject; s=pp1;
 bh=ySrTiuqtzg3NEkLqm49vvuyyP59W6nR3sGw7puywni8=;
 b=o5pym9O1FUQi3TbmpMaC+EhsLfnbY0h/rNMhPdcCfOse3H2GNfNJ8aRifLLfwvl67Mbt
 HSA8bxjgP2PRUv0Hpm61em44xbejsfDqho+ogSa2+LwlU77LiGDynPGz5cPb8xpMeb9W
 4UHSbOmO6pmYu91MLLTq1tS+/ugoXZVF3uMQ5tzeFBk3UWW21Jh5PTXruQvgkZYWotwR
 GTziatThtuqLSQ4+x6T5ioLI/yyeUKacIkjRsBmI2VrcNn0pKEWLwZaLISEfahF+94Or
 egMt1JfmrfON3VBilGvGYzh2pJ6hpf+m1/Prrn116lcvb5fdbcQOvhZ6fWCB4PgKEUQD 2A== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.73])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33w0egbwc6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 18:34:46 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 30 Sep 2020 22:34:45 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.90) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 30 Sep 2020 22:34:43 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2020093022344283-822887 ;
 Wed, 30 Sep 2020 22:34:42 +0000 
In-Reply-To: <20200929184916.33247-1-eajames@linux.ibm.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Eddie James <eajames@linux.ibm.com>, joel@jms.id.au
Date: Wed, 30 Sep 2020 22:34:42 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <20200929184916.33247-1-eajames@linux.ibm.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 36051
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20093022-8877-0000-0000-000004A0780D
X-IBM-SpamModules-Scores: BY=0.263242; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.000001
X-IBM-SpamModules-Versions: BY=3.00013925; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01442527; UDB=6.00775220; IPR=6.01225215; 
 MB=3.00034327; MTD=3.00000008; XFM=3.00000015; UTC=2020-09-30 22:34:44
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-09-30 09:26:15 - 6.00011901
x-cbparentid: 20093022-8878-0000-0000-0000F02E80B1
Message-Id: <OF73F51A22.F28011F5-ON002585F3.007BD2F6-002585F3.007C06F7@notes.na.collabserv.com>
Subject: Re: [PATCH linux dev-5.8] fsi: Aspeed: Add mutex to protect HW access
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-30_13:2020-09-30,
 2020-09-30 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
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

On September 29, 2020 around 1:50PM in some timezone, Eddie James wrote:
>
>There is nothing to prevent multiple commands being executed
>simultaneously. Add a mutex to prevent this.
>
>Signed-off-by: Eddie James <eajames@linux.ibm.com>
>---
> drivers/fsi/fsi-master-aspeed.c | 48
>++++++++++++++++++++-------------
> 1 file changed, 30 insertions(+), 18 deletions(-)
>
>diff --git a/drivers/fsi/fsi-master-aspeed.c
>b/drivers/fsi/fsi-master-aspeed.c
>index c006ec008a1a..c71d7e9a32b0 100644
>--- a/drivers/fsi/fsi-master-aspeed.c
>+++ b/drivers/fsi/fsi-master-aspeed.c
>@@ -8,6 +8,7 @@
> #include <linux/io.h>
> #include <linux/mfd/syscon.h>
> #include <linux/module.h>
>+#include <linux/mutex.h>
> #include <linux/of.h>
> #include <linux/platform=5Fdevice.h>
> #include <linux/regmap.h>
>@@ -19,6 +20,7 @@
>=20
> struct fsi=5Fmaster=5Faspeed {
> 	struct fsi=5Fmaster	master;
>+	struct mutex		lock;	/* protect HW access */
> 	struct device		*dev;
> 	void =5F=5Fiomem		*base;
> 	struct clk		*clk;
>@@ -254,6 +256,8 @@ static int aspeed=5Fmaster=5Fread(struct fsi=5Fmaster
>*master, int link,
> 	addr |=3D id << 21;
> 	addr +=3D link * FSI=5FHUB=5FLINK=5FSIZE;
>=20
>+	mutex=5Flock(&aspeed->lock);
>+
> 	switch (size) {
> 	case 1:
> 		ret =3D opb=5Freadb(aspeed, fsi=5Fbase + addr, val);
>@@ -265,14 +269,14 @@ static int aspeed=5Fmaster=5Fread(struct fsi=5Fmaster
>*master, int link,
> 		ret =3D opb=5Freadl(aspeed, fsi=5Fbase + addr, val);
> 		break;
> 	default:
>-		return -EINVAL;
>+		ret =3D -EINVAL;
>+		goto done;
> 	}
>=20
> 	ret =3D check=5Ferrors(aspeed, ret);
>-	if (ret)
>-		return ret;
>-
>-	return 0;
>+done:
>+	mutex=5Funlock(&aspeed->lock);
>+	return ret;
> }
>=20
> static int aspeed=5Fmaster=5Fwrite(struct fsi=5Fmaster *master, int link,
>@@ -287,6 +291,8 @@ static int aspeed=5Fmaster=5Fwrite(struct fsi=5Fmaster
>*master, int link,
> 	addr |=3D id << 21;
> 	addr +=3D link * FSI=5FHUB=5FLINK=5FSIZE;
>=20
>+	mutex=5Flock(&aspeed->lock);
>+
> 	switch (size) {
> 	case 1:
> 		ret =3D opb=5Fwriteb(aspeed, fsi=5Fbase + addr, *(u8 *)val);
>@@ -298,14 +304,14 @@ static int aspeed=5Fmaster=5Fwrite(struct
>fsi=5Fmaster *master, int link,
> 		ret =3D opb=5Fwritel(aspeed, fsi=5Fbase + addr, *(=5F=5Fbe32 *)val);
> 		break;
> 	default:
>-		return -EINVAL;
>+		ret =3D -EINVAL;
>+		goto done;
> 	}
>=20
> 	ret =3D check=5Ferrors(aspeed, ret);
>-	if (ret)
>-		return ret;
>-
>-	return 0;
>+done:
>+	mutex=5Funlock(&aspeed->lock);
>+	return ret;
> }
>=20
> static int aspeed=5Fmaster=5Flink=5Fenable(struct fsi=5Fmaster *master, i=
nt
>link,
>@@ -317,20 +323,23 @@ static int aspeed=5Fmaster=5Flink=5Fenable(struct
>fsi=5Fmaster *master, int link,
>=20
> 	idx =3D link / 32;
> 	bit =3D link % 32;
>-
> 	reg =3D cpu=5Fto=5Fbe32(0x80000000 >> bit);
>=20
>-	if (!enable)
>-		return opb=5Fwritel(aspeed, ctrl=5Fbase + FSI=5FMCENP0 + (4 * idx),
>-				  reg);
>+	mutex=5Flock(&aspeed->lock);
>=20
>-	ret =3D opb=5Fwritel(aspeed, ctrl=5Fbase + FSI=5FMSENP0 + (4 * idx), reg=
);
>+	if (!enable)
>+		ret =3D opb=5Fwritel(aspeed, ctrl=5Fbase + FSI=5FMCENP0 + (4 * idx),
>+				 reg);
>+	else
>+		ret =3D opb=5Fwritel(aspeed, ctrl=5Fbase + FSI=5FMSENP0 + (4 * idx),
>+				 reg);
> 	if (ret)
>-		return ret;
>+		goto done;
>=20
> 	mdelay(FSI=5FLINK=5FENABLE=5FSETUP=5FTIME);
>-
>-	return 0;
>+done:
>+	mutex=5Funlock(&aspeed->lock);
>+	return ret;
> }
>=20
> static int aspeed=5Fmaster=5Fterm(struct fsi=5Fmaster *master, int link,
>uint8=5Ft id)
>@@ -431,9 +440,11 @@ static ssize=5Ft cfam=5Freset=5Fstore(struct device
>*dev, struct device=5Fattribute *att
> {
> 	struct fsi=5Fmaster=5Faspeed *aspeed =3D dev=5Fget=5Fdrvdata(dev);
>=20
>+	mutex=5Flock(&aspeed->lock);
> 	gpiod=5Fset=5Fvalue(aspeed->cfam=5Freset=5Fgpio, 1);
> 	usleep=5Frange(900, 1000);
> 	gpiod=5Fset=5Fvalue(aspeed->cfam=5Freset=5Fgpio, 0);
>+	mutex=5Funlock(&aspeed->lock);
>=20
> 	return count;
> }
>@@ -597,6 +608,7 @@ static int fsi=5Fmaster=5Faspeed=5Fprobe(struct
>platform=5Fdevice *pdev)
>=20
> 	dev=5Fset=5Fdrvdata(&pdev->dev, aspeed);
>=20
>+	mutex=5Finit(&aspeed->lock);
> 	aspeed=5Fmaster=5Finit(aspeed);

So you initialize the lock here in the probe function before its=20
used, good.  I notice its not taken in aspeed=5Fmaster=5Finit nor over=20
the opb=5Fread for the version register.  Both are called from the=20
probe function and presumably are therefore the sole context=20
available, but having it taken could be considered a good for=20
consistency.

Are there any concerns that this is part of the fsi master=20
context if we wanted to use both fsi buses in the future?

Reviewed-by: Milton Miller <miltonm@us.ibm.com>

>=20
> 	rc =3D fsi=5Fmaster=5Fregister(&aspeed->master);
>--=20
>2.26.2
>
>

