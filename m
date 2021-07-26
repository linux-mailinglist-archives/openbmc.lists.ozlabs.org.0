Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C3F3D660E
	for <lists+openbmc@lfdr.de>; Mon, 26 Jul 2021 19:53:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYSGP65JQz30DC
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 03:53:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e2922tLX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sandhya.koteshwara@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=e2922tLX; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYSG21Mh3z304J
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jul 2021 03:53:29 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16QHhfOJ164725; Mon, 26 Jul 2021 13:53:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : message-id : content-transfer-encoding : content-type :
 mime-version : references : subject; s=pp1;
 bh=Tbthnb3m6dnWa/PBx22K4rN2xZlMilbPkZ4XeOJSwRQ=;
 b=e2922tLXkzG41pXf8ynL6JgZncgq9dpSr6d8aOq4quq2xuHaumyorkk0Rya02sOn142c
 ISoIbhFMzuriA7RyDjYcNr1zma6rPFTUv0H2cm5eykjVaUy/qFCqZUbF/Zup6CMsSVSE
 BA4xJ+Uuxn8ihAyhsFdbwL24NFTDtgL/s+6T7PVBWdVCOGc7m1iNlR7IrfSbjV9GCgy5
 VXxSZ2u4dFNCrwZv+5ysee2VrQmCeJSLp28qqeehJBgXWnC86IcgOh6tFYEjlvLzQmPq
 OQsdKQ0Q6RDZZJjlsJqCCkj2tHsy8FkO+TpZstjtPFDR4JhQraLV8Jqas4OnBNMBmUT/ Mg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a21q186y0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Jul 2021 13:53:21 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16QHiPhp170114;
 Mon, 26 Jul 2021 13:53:21 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a21q186xs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Jul 2021 13:53:20 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16QHlJG3003268;
 Mon, 26 Jul 2021 17:53:20 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 3a0agc0d4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Jul 2021 17:53:20 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16QHrHRl39387624
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Jul 2021 17:53:18 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C941FC6066;
 Mon, 26 Jul 2021 17:53:17 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4AC5C6062;
 Mon, 26 Jul 2021 17:53:17 +0000 (GMT)
Received: from mww0112.dal12m.mail.ibm.com (unknown [9.208.70.64])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon, 26 Jul 2021 17:53:17 +0000 (GMT)
In-Reply-To: <20210623060742.22158-1-troy_lee@aspeedtech.com>
From: "Sandhya Koteshwara" <Sandhya.Koteshwara@ibm.com>
To: troy_lee@aspeedtech.com
Date: Mon, 26 Jul 2021 17:53:15 +0000
Message-ID: <OF021B0527.BA142969-ON0025871E.005B6D39-0025871E.0062427C@ibm.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
Sensitivity: 
MIME-Version: 1.0
References: 
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Release 11.0.1FP2HF97   July 2, 2021
X-MIMETrack: Serialize by http on MWW0112/03/M/IBM at 07/26/2021 17:53:15,
 Serialize complete at 07/26/2021 17:53:15
X-KeepSent: 021B0527:BA142969-0025871E:005B6D39; name=$KeepSent; type=4
X-Disclaimed: 21315
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Q0Xk1qSJoe2xoL3HEehNPKlMlVL_xwN1
X-Proofpoint-ORIG-GUID: c4ykTu-c688UjkWZezafDOkf-IvGirL0
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v1 1/2] ast2600: spl: Fixes
 boot from RAM device
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-26_10:2021-07-26,
 2021-07-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1011 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107260102
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
Cc: leetroy@gmail.com, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" style=3D"font-family=
:Arial, Helvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" style=3D"fo=
nt-family:Arial, Helvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" st=
yle=3D"font-family:Arial, Helvetica, sans-serif;font-size:10pt" ><div dir=
=3D"ltr" >Hi Troy, Joel,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >I am looking to use these patches to secure boot OpenBMC =
from flash on the AST2600 evaluation board. Is there a relevant UBOOT=5FMAC=
HINE configuration file I can use?</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >I am currently porting configuration for secure boot from=
 the ast2600=5Fopenbmc=5Fspl=5Femmc=5Fdefconfig to the ast2600=5Fopenbmc=5F=
spl=5Fdefconfig. I was only able to get the u-boot-spl to verify u-boot but=
 kernel verification fails.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Thanks,</div>
<div dir=3D"ltr" >Sandhya</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: Troy Lee &lt;troy=
=5Flee@aspeedtech.com&gt;<br>Sent by: "openbmc" &lt;openbmc-bounces+sandhya=
.koteshwara=3Dibm.com@lists.ozlabs.org&gt;<br>To: &lt;leetroy@gmail.com&gt;=
, &lt;openbmc@lists.ozlabs.org&gt;, &lt;joel@jms.id.au&gt;<br>Cc:<br>Subjec=
t: [EXTERNAL] [PATCH u-boot v2019.04-aspeed-openbmc v1 1/2] ast2600: spl: F=
ixes boot from RAM device<br>Date: Wed, Jun 23, 2021 2:08 AM<br>&nbsp;
<div><font size=3D"2" face=3D"Default Monospace,Courier New,Courier,monospa=
ce" >Reporting a BOOT=5FDEVICE=5FRAM can leverage common/spl/spl=5Fram.c<br=
>to bring up u-boot.bin by memory offset 0x00010000.<br><br>Fixes: 13dd0b0f=
7273 ("ast2600: spl: Support common boot loader features")<br>Signed-off-by=
: Troy Lee &lt;troy=5Flee@aspeedtech.com&gt;<br>---<br>&nbsp;arch/arm/mach-=
aspeed/ast2600/spl.c | 2 +-<br>&nbsp;1 file changed, 1 insertion(+), 1 dele=
tion(-)<br><br>diff --git a/arch/arm/mach-aspeed/ast2600/spl.c b/arch/arm/m=
ach-aspeed/ast2600/spl.c<br>index 778b326755..c759a7575d 100644<br>--- a/ar=
ch/arm/mach-aspeed/ast2600/spl.c<br>+++ b/arch/arm/mach-aspeed/ast2600/spl.=
c<br>@@ -66,7 +66,7 @@ u32 spl=5Fboot=5Fdevice(void)<br>&nbsp; case AST=5FB=
OOTMODE=5FEMMC:<br>&nbsp; return BOOT=5FDEVICE=5FMMC1;<br>&nbsp; case AST=
=5FBOOTMODE=5FSPI:<br>- return BOOT=5FDEVICE=5FSPI;<br>+ return BOOT=5FDEVI=
CE=5FRAM;<br>&nbsp; case AST=5FBOOTMODE=5FUART:<br>&nbsp; return BOOT=5FDEV=
ICE=5FUART;<br>&nbsp; }<br>--<br>2.17.1</font><br>&nbsp;</div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div></div></div></div><BR>
<BR>
