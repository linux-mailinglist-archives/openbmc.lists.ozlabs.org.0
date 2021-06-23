Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A91603B218B
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 22:05:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9Dlx3gSyz307c
	for <lists+openbmc@lfdr.de>; Thu, 24 Jun 2021 06:05:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KUGUrCSP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KUGUrCSP; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9Dlh0dmTz2yhr
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jun 2021 06:05:35 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15NK3XkR151985; Wed, 23 Jun 2021 16:05:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : mime-version :
 content-type : from : in-reply-to : date : cc : content-transfer-encoding
 : message-id : references : to; s=pp1;
 bh=G6W3krsqcu0bQCcADDgWY0kLkhRtGgNfVTTIKY0S24Y=;
 b=KUGUrCSPzUBcX/ClbTf5TTDJ8tyBDAD1Zj2gqCOx2dLgtEUR3HShn3dKfyBki6fskIUL
 ekyaDmQgt/IYTrP8FTsY0quwUixl3YrofVDGLfW9GOJfbsX5cUR5IrfmQcQhHPvWykCE
 WqNozoZT5a+Z9HmjZ31ea6zzRMbuXiVV3CftuLMDFCo9VH0jVCZupVzXb2Cr+kHilzX0
 qgNe5BUgnJE8uA9XrIhPoYYf91ca78thl6Y4cUY/oE2uoH5pDmwjC8N8p/Wv512HL/ck
 dmjqjIVWm7moD1kX7EwmeLAuyevWFVmDdhy3OGAC8Oztd1SHpXW5rvFEUaps3GBqXmJ7 gQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39cb4kgyau-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jun 2021 16:05:31 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15NK22RH003627;
 Wed, 23 Jun 2021 20:05:30 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01wdc.us.ibm.com with ESMTP id 3998793549-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jun 2021 20:05:30 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15NK5Uua20054418
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 20:05:30 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0203628060;
 Wed, 23 Jun 2021 20:05:30 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C2C228058;
 Wed, 23 Jun 2021 20:05:29 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.65.249.20])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 23 Jun 2021 20:05:29 +0000 (GMT)
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] configs: aspeed-common:
 Add redundant env for mmc
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Content-Type: text/html;
	charset=us-ascii
X-Apple-Auto-Saved: 1
X-Apple-Mail-Remote-Attachments: YES
From: Adriana Kobylak <anoo@linux.ibm.com>
X-Apple-Base-Url: x-msg://5/
In-Reply-To: <CACPK8XfoqoebdX48ORPO=go0XZQC8XU4DvADZ1r+31k_oy=z1A@mail.gmail.com>
X-Apple-Windows-Friendly: 1
Date: Wed, 23 Jun 2021 15:05:14 -0500
X-Apple-Mail-Signature: SKIP_SIGNATURE
Content-Transfer-Encoding: quoted-printable
Message-Id: <DB3755DD-8C4A-4B1B-A9DF-DF1A2B48FBF5@linux.ibm.com>
References: <20210618151436.2266046-1-anoo@linux.ibm.com>
 <CACPK8XfoqoebdX48ORPO=go0XZQC8XU4DvADZ1r+31k_oy=z1A@mail.gmail.com>
X-Uniform-Type-Identifier: com.apple.mail-draft
To: Joel Stanley <joel@jms.id.au>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eaJ1XjVlMk7fqqfGevOFGNht8HUcoQkJ
X-Proofpoint-GUID: eaJ1XjVlMk7fqqfGevOFGNht8HUcoQkJ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-23_12:2021-06-23,
 2021-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106230117
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@us.ibm.com>, Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<html><head></head><body dir=3D"auto" style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;"><meta =
http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"><div=
 style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break: =
after-white-space;" class=3D""><br class=3D""><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On Jun =
22, 2021, at 7:55 AM, Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.au" =
class=3D"">joel@jms.id.au</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><meta =
charset=3D"UTF-8" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: AvenirNext-Regular; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">On Fri, 18 Jun 2021 at 15:14, Adriana Kobylak &lt;</span><a =
href=3D"mailto:anoo@linux.ibm.com" style=3D"font-family: =
AvenirNext-Regular; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" =
class=3D"">anoo@linux.ibm.com</a><span style=3D"caret-color: rgb(0, 0, =
0); font-family: AvenirNext-Regular; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&gt; wrote:</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: AvenirNext-Regular; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: AvenirNext-Regular; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br class=3D"">From: Adriana Kobylak =
&lt;<a href=3D"mailto:anoo@us.ibm.com" =
class=3D"">anoo@us.ibm.com</a>&gt;<br class=3D""><br class=3D"">If the =
env is in MMC, specify the location of the redundant environment.<br =
class=3D"">Per the ast2600_openbmc_spl_emmc_defconfig, the environment =
is located<br class=3D"">at byte offset 0x5000 in the user data =
partition, and is sized at<br class=3D"">0x10000. The redundant =
environment follows it immediately and is the<br class=3D"">same =
size.<br class=3D""><br class=3D"">Signed-off-by: Eddie James &lt;<a =
href=3D"mailto:eajames@linux.ibm.com" =
class=3D"">eajames@linux.ibm.com</a>&gt;<br class=3D"">Signed-off-by: =
Adriana Kobylak &lt;<a href=3D"mailto:anoo@us.ibm.com" =
class=3D"">anoo@us.ibm.com</a>&gt;<br class=3D"">---<br =
class=3D"">include/configs/aspeed-common.h | 1 +<br class=3D"">1 file =
changed, 1 insertion(+)<br class=3D""><br class=3D"">diff --git =
a/include/configs/aspeed-common.h b/include/configs/aspeed-common.h<br =
class=3D"">index 8f404570b1..59449d36d0 100644<br class=3D"">--- =
a/include/configs/aspeed-common.h<br class=3D"">+++ =
b/include/configs/aspeed-common.h<br class=3D"">@@ -83,6 +83,7 @@<br =
class=3D"">#ifdef CONFIG_ENV_IS_IN_MMC<br class=3D"">#define =
CONFIG_SYS_MMC_ENV_DEV =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0<br class=3D"">#define =
CONFIG_SYS_MMC_ENV_PART =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;0<br class=3D"">+#define CONFIG_ENV_OFFSET_REDUND =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0x15000<br class=3D""></blockquote><br=
 style=3D"caret-color: rgb(0, 0, 0); font-family: AvenirNext-Regular; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
AvenirNext-Regular; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Would it make more sense to write it like this:</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: AvenirNext-Regular; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
AvenirNext-Regular; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: AvenirNext-Regular; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">#define CONFIG_ENV_OFFSET_REDUND (CONFIG_ENV_OFFSET + =
CONFIG_ENV_SIZE)</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: AvenirNext-Regular; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div><div>Yeah good point. Just sent a v2 with that =
change.</div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
AvenirNext-Regular; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: AvenirNext-Regular; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: AvenirNext-Regular; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">#endif<br class=3D""><br =
class=3D"">#endif /* __ASPEED_COMMON_CONFIG_H */<br class=3D"">--<br =
class=3D"">2.25.1</blockquote></div></blockquote></div><br =
class=3D""></div></body></html>=
