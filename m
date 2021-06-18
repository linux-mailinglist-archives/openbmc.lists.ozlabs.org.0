Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF7F3ACF7B
	for <lists+openbmc@lfdr.de>; Fri, 18 Jun 2021 17:52:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G63Ml2v7cz3bxp
	for <lists+openbmc@lfdr.de>; Sat, 19 Jun 2021 01:52:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CV1Ej41d;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CV1Ej41d; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G63MQ3HVlz304T
 for <openbmc@lists.ozlabs.org>; Sat, 19 Jun 2021 01:52:01 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15IFXbAN190005; Fri, 18 Jun 2021 11:51:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : message-id :
 content-type : subject : date : in-reply-to : cc : to : references :
 mime-version; s=pp1; bh=hRqVdMLNbvboYkBiHuHxvqTS09wFetwuxzC7frWCnAw=;
 b=CV1Ej41djsYy9g7ODd0OM2uujdATi+2AALyc8RqS8On0eDTZmLc2+k2VvxfbMVMVJXYe
 MI/XK8bzTde/8QkkyZI5ul/BbSZoRhQICYeH9+B0nWU2UAzhxrnc0Tq+axcgHmBKrhty
 D/b1UG91bIHO2jujvhUlEZ1uEAUgIFFGf9RLfdBT4lLkmL9Ts2YQfnUAs/FnXjrvJwpA
 S0/21BDF7XN3j2hGu45ossdKtdG3JIIaR3IjqrnD433jGb8BHTreEATGrFET31qGOH3Y
 KP3MvDrEzDYuKFhUZ1aaC3plYwja7DGfthC0qYdaEZwgRjwabnvRQSkCguQXw4+6wxcg Lg== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 398x2q0un5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 11:51:55 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15IFhxUc005841;
 Fri, 18 Jun 2021 15:51:54 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03dal.us.ibm.com with ESMTP id 394mjapwhy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 15:51:54 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15IFprQC36962614
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Jun 2021 15:51:53 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0622B205F;
 Fri, 18 Jun 2021 15:51:53 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55F5CB2064;
 Fri, 18 Jun 2021 15:51:53 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.160.178.31])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 18 Jun 2021 15:51:53 +0000 (GMT)
From: Adriana Kobylak <anoo@linux.ibm.com>
Message-Id: <BC54E54F-CE3D-4DF9-8ABE-FB222EFA1BF7@linux.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_6F9B9D1B-47B8-4FD0-9FD0-61CD73F646A3"
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 2/2] ast2600: Add
 environment for booting from mmc
Date: Fri, 18 Jun 2021 10:51:52 -0500
In-Reply-To: <20210618024758.892642-3-joel@jms.id.au>
To: Joel Stanley <joel@jms.id.au>
References: <20210618024758.892642-1-joel@jms.id.au>
 <20210618024758.892642-3-joel@jms.id.au>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: k3w-5zZ8QrRnx8FYhh6Y-idInzWlL7sO
X-Proofpoint-ORIG-GUID: k3w-5zZ8QrRnx8FYhh6Y-idInzWlL7sO
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-18_07:2021-06-18,
 2021-06-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 clxscore=1011 mlxscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106180091
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
Cc: Andrew Jeffery <andrew@aj.id.au>, OpenBMC <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@us.ibm.com>, Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_6F9B9D1B-47B8-4FD0-9FD0-61CD73F646A3
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Thanks Joel! There are some improvements to the boot command proposed here:=
 https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/41778 <https://gerr=
it.openbmc-project.xyz/c/openbmc/openbmc/+/41778>
Maybe we pick those changes up in this initial commit so the two environmen=
t files are in sync? Otherwise we can submit a follow-up patch latest to up=
date this .txt file.


> On Jun 17, 2021, at 9:47 PM, Joel Stanley <joel@jms.id.au> wrote:
>=20
> This adds the default environment from the OpenBMC project.
>=20
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Adriana Kobylak <anoo@us.ibm.com>

> ---
> board/aspeed/ast2600_openbmc_mmc.txt       | 9 +++++++++
> configs/ast2600_openbmc_spl_emmc_defconfig | 2 ++
> 2 files changed, 11 insertions(+)
> create mode 100644 board/aspeed/ast2600_openbmc_mmc.txt
>=20
> diff --git a/board/aspeed/ast2600_openbmc_mmc.txt b/board/aspeed/ast2600_=
openbmc_mmc.txt
> new file mode 100644
> index 000000000000..47a474c92d70
> --- /dev/null
> +++ b/board/aspeed/ast2600_openbmc_mmc.txt
> @@ -0,0 +1,9 @@
> +bootargs=3Dconsole=3DttyS4,115200n8
> +boota=3Dsetenv bootpart 2; setenv rootfs rofs-a; run setmmcargs; ext4loa=
d mmc 0:${bootpart} ${loadaddr} fitImage && bootm; echo Error loading kerne=
l FIT image
> +bootb=3Dsetenv bootpart 3; setenv rootfs rofs-b; run setmmcargs; ext4loa=
d mmc 0:${bootpart} ${loadaddr} fitImage && bootm; echo Error loading kerne=
l FIT image
> +bootcmd=3Dif test "${bootside}" =3D "b"; then run bootb; run boota; else=
 run boota; run bootb; fi
> +bootdelay=3D2
> +bootside=3Da
> +loadaddr=3D0x83000000
> +rootfs=3Drofs-a
> +setmmcargs=3Dsetenv bootargs ${bootargs} rootwait root=3DPARTLABEL=3D${r=
ootfs}
> diff --git a/configs/ast2600_openbmc_spl_emmc_defconfig b/configs/ast2600=
_openbmc_spl_emmc_defconfig
> index c5d03721c97a..344a4d8f9c96 100644
> --- a/configs/ast2600_openbmc_spl_emmc_defconfig
> +++ b/configs/ast2600_openbmc_spl_emmc_defconfig
> @@ -83,6 +83,8 @@ CONFIG_CMD_MTDPARTS=3Dy
> # CONFIG_SPL_EFI_PARTITION is not set
> CONFIG_SPL_OF_CONTROL=3Dy
> CONFIG_ENV_IS_IN_MMC=3Dy
> +CONFIG_USE_DEFAULT_ENV_FILE=3Dy
> +CONFIG_DEFAULT_ENV_FILE=3D"board/aspeed/ast2600_openbmc_mmc.txt"
> CONFIG_NET_RANDOM_ETHADDR=3Dy
> CONFIG_SPL_DM=3Dy
> CONFIG_REGMAP=3Dy
> --=20
> 2.32.0
>=20


--Apple-Mail=_6F9B9D1B-47B8-4FD0-9FD0-61CD73F646A3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D""><div>Thanks Joel! There are some improvements to the boot =
command proposed here:&nbsp;<a =
href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/41778" =
class=3D"">https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/41778</a=
></div><div>Maybe we pick those changes up in this initial commit so the =
two environment files are in sync? Otherwise we can submit a follow-up =
patch latest to update this .txt file.</div><div><br =
class=3D""></div><div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D"">On Jun 17, 2021, at 9:47 PM, Joel Stanley =
&lt;<a href=3D"mailto:joel@jms.id.au" class=3D"">joel@jms.id.au</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><div =
class=3D"">This adds the default environment from the OpenBMC =
project.<br class=3D""><br class=3D"">Signed-off-by: Joel Stanley &lt;<a =
href=3D"mailto:joel@jms.id.au" class=3D"">joel@jms.id.au</a>&gt;<br =
class=3D""></div></div></blockquote><div><br =
class=3D""></div><div>Reviewed-by:&nbsp;Adriana Kobylak &lt;<a =
href=3D"mailto:anoo@us.ibm.com" =
class=3D"">anoo@us.ibm.com</a>&gt;</div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><div class=3D"">---<br =
class=3D""> board/aspeed/ast2600_openbmc_mmc.txt =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 9 +++++++++<br class=3D""> =
configs/ast2600_openbmc_spl_emmc_defconfig | 2 ++<br class=3D""> 2 files =
changed, 11 insertions(+)<br class=3D""> create mode 100644 =
board/aspeed/ast2600_openbmc_mmc.txt<br class=3D""><br class=3D"">diff =
--git a/board/aspeed/ast2600_openbmc_mmc.txt =
b/board/aspeed/ast2600_openbmc_mmc.txt<br class=3D"">new file mode =
100644<br class=3D"">index 000000000000..47a474c92d70<br class=3D"">--- =
/dev/null<br class=3D"">+++ b/board/aspeed/ast2600_openbmc_mmc.txt<br =
class=3D"">@@ -0,0 +1,9 @@<br =
class=3D"">+bootargs=3Dconsole=3DttyS4,115200n8<br =
class=3D"">+boota=3Dsetenv bootpart 2; setenv rootfs rofs-a; run =
setmmcargs; ext4load mmc 0:${bootpart} ${loadaddr} fitImage &amp;&amp; =
bootm; echo Error loading kernel FIT image<br class=3D"">+bootb=3Dsetenv =
bootpart 3; setenv rootfs rofs-b; run setmmcargs; ext4load mmc =
0:${bootpart} ${loadaddr} fitImage &amp;&amp; bootm; echo Error loading =
kernel FIT image<br class=3D"">+bootcmd=3Dif test "${bootside}" =3D "b"; =
then run bootb; run boota; else run boota; run bootb; fi<br =
class=3D"">+bootdelay=3D2<br class=3D"">+bootside=3Da<br =
class=3D"">+loadaddr=3D0x83000000<br class=3D"">+rootfs=3Drofs-a<br =
class=3D"">+setmmcargs=3Dsetenv bootargs ${bootargs} rootwait =
root=3DPARTLABEL=3D${rootfs}<br class=3D"">diff --git =
a/configs/ast2600_openbmc_spl_emmc_defconfig =
b/configs/ast2600_openbmc_spl_emmc_defconfig<br class=3D"">index =
c5d03721c97a..344a4d8f9c96 100644<br class=3D"">--- =
a/configs/ast2600_openbmc_spl_emmc_defconfig<br class=3D"">+++ =
b/configs/ast2600_openbmc_spl_emmc_defconfig<br class=3D"">@@ -83,6 =
+83,8 @@ CONFIG_CMD_MTDPARTS=3Dy<br class=3D""> # =
CONFIG_SPL_EFI_PARTITION is not set<br class=3D""> =
CONFIG_SPL_OF_CONTROL=3Dy<br class=3D""> CONFIG_ENV_IS_IN_MMC=3Dy<br =
class=3D"">+CONFIG_USE_DEFAULT_ENV_FILE=3Dy<br =
class=3D"">+CONFIG_DEFAULT_ENV_FILE=3D"board/aspeed/ast2600_openbmc_mmc.tx=
t"<br class=3D""> CONFIG_NET_RANDOM_ETHADDR=3Dy<br class=3D""> =
CONFIG_SPL_DM=3Dy<br class=3D""> CONFIG_REGMAP=3Dy<br class=3D"">-- <br =
class=3D"">2.32.0<br class=3D""><br =
class=3D""></div></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_6F9B9D1B-47B8-4FD0-9FD0-61CD73F646A3--

