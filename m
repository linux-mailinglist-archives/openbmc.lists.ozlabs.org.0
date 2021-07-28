Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F383D9733
	for <lists+openbmc@lfdr.de>; Wed, 28 Jul 2021 23:04:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZmPJ2WrNz307m
	for <lists+openbmc@lfdr.de>; Thu, 29 Jul 2021 07:04:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Oerk9T/g;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sandhya.koteshwara@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Oerk9T/g; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZmNz3gwTz307m
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jul 2021 07:04:03 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16SK3eUr112265; Wed, 28 Jul 2021 17:03:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : message-id : content-transfer-encoding : content-type :
 mime-version : references : subject; s=pp1;
 bh=8E9U812dQzCE+LBo7Vx6Ne26Fa1eMMpf3tghJzkHndE=;
 b=Oerk9T/g86QR2GU587aLTdlTC5rC60aVN1z+sGkU44WXgj7ODCtBggp0pYx1UeC0iSbS
 4UdIZaSKuACAdL1KjmiHYW4I1qVN85tjMnkfCfnb2SM0K3rmAJ8DdrKvhTRHKJfYRWaR
 MPyUJTXAZtKhTdbbblKhl4zNhWlnk87PF1gICRcZhaSb872dC0F88ORJ4VMMx47NG3us
 xoRcFof6Kn5V/KTZT6FOaSpH0hb5rYNdupX0wT7WTjt6z2EwRSGKzAflq/Ar5fgA5IqO
 fuBXfLUSuts47SOETqbXBB0KGXtJb/2o7JgZhkyRgJlAFdkUd+d56WQJM785j/zr2bGN Uw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a3dnf23sj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jul 2021 17:03:55 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16SKr3Xb176827;
 Wed, 28 Jul 2021 17:03:55 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a3dnf23sa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jul 2021 17:03:55 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16SKjfnK022477;
 Wed, 28 Jul 2021 21:03:54 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma05wdc.us.ibm.com with ESMTP id 3a2363u091-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jul 2021 21:03:54 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16SL3siF41550332
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Jul 2021 21:03:54 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0B522805E;
 Wed, 28 Jul 2021 21:03:53 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C259728067;
 Wed, 28 Jul 2021 21:03:53 +0000 (GMT)
Received: from mww0111.wdc07m.mail.ibm.com (unknown [9.208.69.238])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 28 Jul 2021 21:03:53 +0000 (GMT)
In-Reply-To: <CAN9Jwz3_oPzCsCXRCM+YfrJ_N79dG1UwdEsGac9hAMS53j3-Bg@mail.gmail.com>
From: "Sandhya Koteshwara" <Sandhya.Koteshwara@ibm.com>
To: leetroy@gmail.com
Date: Wed, 28 Jul 2021 21:03:51 +0000
Message-ID: <OFED926017.E719BFC6-ON00258720.0072B671-00258720.0073B5D4@ibm.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
Sensitivity: 
MIME-Version: 1.0
References: 
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Release 11.0.1FP2HF97   July 2, 2021
X-MIMETrack: Serialize by http on MWW0111/01/M/IBM at 07/28/2021 21:03:51,
 Serialize complete at 07/28/2021 21:03:51
X-Disclaimed: 60427
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hFwTWn-hWEjC0xjjZzy0ulxuPHr-zhzh
X-Proofpoint-GUID: uubbCkX-FlUDcGIiMHO9bHtXGksl2jX2
Subject: RE: [PATCH u-boot v2019.04-aspeed-openbmc v1 1/2] ast2600: spl: Fixes
 boot from RAM device
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-28_10:2021-07-27,
 2021-07-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107280113
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
Cc: openbmc@lists.ozlabs.org, troy_lee@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" style=3D"font-family=
:Arial, Helvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" >Thanks Tro=
y. I got secure booting of the complete chain after copying to DRAM.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Also for u-boot verification I had to add "u-boot,dm-pre-=
reloc;" to the ast2600-evb.dts file to enable the hace engine to be availab=
le before u-boot is relocated.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Thanks,<br>Sandhya</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: "Troy Lee" &lt;lee=
troy@gmail.com&gt;<br>Sent by: "openbmc" &lt;openbmc-bounces+sandhya.kotesh=
wara=3Dibm.com@lists.ozlabs.org&gt;<br>To: "Sandhya Koteshwara" &lt;Sandhya=
.Koteshwara@ibm.com&gt;<br>Cc: "OpenBMC Maillist" &lt;openbmc@lists.ozlabs.=
org&gt;, "Troy Lee" &lt;troy=5Flee@aspeedtech.com&gt;<br>Subject: [EXTERNAL=
] Re: [PATCH u-boot v2019.04-aspeed-openbmc v1 1/2] ast2600: spl: Fixes boo=
t from RAM device<br>Date: Mon, Jul 26, 2021 10:23 PM<br>&nbsp;
<div><font size=3D"2" face=3D"Default Monospace,Courier New,Courier,monospa=
ce" >Hi Sandhya,<br><br>The AST2600 hardware hash and crypto engine (HACE) =
can only exame data<br>in DRAM, please make sure you copy the kernel fit-im=
age into dram<br>first.<br><br>Thanks,<br>Troy Lee<br>--<br>Yu-Ting Lee (Tr=
oy Lee) &lt;LeeTroy@gmail.com&gt;<br><br>On Tue, Jul 27, 2021 at 1:53 AM Sa=
ndhya Koteshwara<br>&lt;Sandhya.Koteshwara@ibm.com&gt; wrote:<br>&gt;<br>&g=
t; Hi Troy, Joel,<br>&gt;<br>&gt; I am looking to use these patches to secu=
re boot OpenBMC from flash on the AST2600 evaluation board. Is there a rele=
vant UBOOT=5FMACHINE configuration file I can use?<br>&gt;<br>&gt; I am cur=
rently porting configuration for secure boot from the ast2600=5Fopenbmc=5Fs=
pl=5Femmc=5Fdefconfig to the ast2600=5Fopenbmc=5Fspl=5Fdefconfig. I was onl=
y able to get the u-boot-spl to verify u-boot but kernel verification fails=
.<br>&gt;<br>&gt; Thanks,<br>&gt; Sandhya<br>&gt;<br>&gt; ----- Original me=
ssage -----<br>&gt; From: Troy Lee &lt;troy=5Flee@aspeedtech.com&gt;<br>&gt=
; Sent by: "openbmc" &lt;openbmc-bounces+sandhya.koteshwara=3Dibm.com@lists=
.ozlabs.org&gt;<br>&gt; To: &lt;leetroy@gmail.com&gt;, &lt;openbmc@lists.oz=
labs.org&gt;, &lt;joel@jms.id.au&gt;<br>&gt; Cc:<br>&gt; Subject: [EXTERNAL=
] [PATCH u-boot v2019.04-aspeed-openbmc v1 1/2] ast2600: spl: Fixes boot fr=
om RAM device<br>&gt; Date: Wed, Jun 23, 2021 2:08 AM<br>&gt;<br>&gt; Repor=
ting a BOOT=5FDEVICE=5FRAM can leverage common/spl/spl=5Fram.c<br>&gt; to b=
ring up u-boot.bin by memory offset 0x00010000.<br>&gt;<br>&gt; Fixes: 13dd=
0b0f7273 ("ast2600: spl: Support common boot loader features")<br>&gt; Sign=
ed-off-by: Troy Lee &lt;troy=5Flee@aspeedtech.com&gt;<br>&gt; ---<br>&gt; &=
nbsp;arch/arm/mach-aspeed/ast2600/spl.c | 2 +-<br>&gt; &nbsp;1 file changed=
, 1 insertion(+), 1 deletion(-)<br>&gt;<br>&gt; diff --git a/arch/arm/mach-=
aspeed/ast2600/spl.c b/arch/arm/mach-aspeed/ast2600/spl.c<br>&gt; index 778=
b326755..c759a7575d 100644<br>&gt; --- a/arch/arm/mach-aspeed/ast2600/spl.c=
<br>&gt; +++ b/arch/arm/mach-aspeed/ast2600/spl.c<br>&gt; @@ -66,7 +66,7 @@=
 u32 spl=5Fboot=5Fdevice(void)<br>&gt; &nbsp; case AST=5FBOOTMODE=5FEMMC:<b=
r>&gt; &nbsp; return BOOT=5FDEVICE=5FMMC1;<br>&gt; &nbsp; case AST=5FBOOTMO=
DE=5FSPI:<br>&gt; - return BOOT=5FDEVICE=5FSPI;<br>&gt; + return BOOT=5FDEV=
ICE=5FRAM;<br>&gt; &nbsp; case AST=5FBOOTMODE=5FUART:<br>&gt; &nbsp; return=
 BOOT=5FDEVICE=5FUART;<br>&gt; &nbsp; }<br>&gt; --<br>&gt; 2.17.1<br>&gt;<b=
r>&gt;<br>&gt;<br>&gt;<br>&gt;</font></div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div></div><BR>
<BR>
