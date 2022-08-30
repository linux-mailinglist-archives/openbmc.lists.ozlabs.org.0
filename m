Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 850785A6C9A
	for <lists+openbmc@lfdr.de>; Tue, 30 Aug 2022 20:54:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHGh65V50z3c3m
	for <lists+openbmc@lfdr.de>; Wed, 31 Aug 2022 04:54:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q5VNGljq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q5VNGljq;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHGgc5zGmz3bl4
	for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2022 04:54:20 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27UIh0OK025807;
	Tue, 30 Aug 2022 18:54:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : message-id :
 content-type : mime-version : subject : date : in-reply-to : cc : to :
 references; s=pp1; bh=JL4/FWie3Raq0Bi/zUgJnHAftIQMoteHbvw8nl/1IP8=;
 b=Q5VNGljqEZSaAF05D1fxyAcwCH6w21tMBy6wIalheWwyQ3uKoO4HtXl1cm0TsiIlN53R
 8BQ5ZYXOvCLAmc3H4lUl9+6ovgW3ghMEHMyMPvsp7DUMHgP5/X8GZeHFl967N0pF+N6q
 rZ7437E1T2AePG2co53ppSX42SEym6jB0YE3qsQBt6CZYxPLzwGOe3tvSut3zdrvHTj0
 APz6p76XQWbRabjNfr8HhTbRBqNn95b39dyZTo6aUoyeji36yFivrOWcB2jUm39yzQVP
 7Ttz+0s3ssM+wWIkrQgHAId8Fxf7RvdEI7ZnIpAF4P5fEkKAAZwNZva2607ez8R3UDPO iQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j9r2ur8tu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Aug 2022 18:54:07 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27UIoCar004994;
	Tue, 30 Aug 2022 18:54:06 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com [9.57.198.28])
	by ppma03dal.us.ibm.com with ESMTP id 3j7awau08q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Aug 2022 18:54:06 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27UIs6Rs4784664
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Aug 2022 18:54:06 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 02C74AC05B;
	Tue, 30 Aug 2022 18:54:06 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 78981AC059;
	Tue, 30 Aug 2022 18:54:05 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.160.3.248])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
	Tue, 30 Aug 2022 18:54:05 +0000 (GMT)
From: Adriana Kobylak <anoo@linux.ibm.com>
Message-Id: <E34B6589-BD25-44C5-BD6E-007651ECFFDE@linux.ibm.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_7ADC46BD-47BB-4386-8598-80CB2D86C345"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 2/2] ram/aspeed: Remove ECC
 config option
Date: Tue, 30 Aug 2022 13:51:47 -0500
In-Reply-To: <b92f8f95-0adb-4c30-92f5-4d39009fbd96@www.fastmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
References: <20220817015949.16946-1-joel@jms.id.au>
 <20220817015949.16946-3-joel@jms.id.au>
 <b92f8f95-0adb-4c30-92f5-4d39009fbd96@www.fastmail.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JD8qIWR1BG9kI-XdtMEp7QZYU2U0BUVW
X-Proofpoint-ORIG-GUID: JD8qIWR1BG9kI-XdtMEp7QZYU2U0BUVW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-30_10,2022-08-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 mlxscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208300084
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
Cc: Dylan Hung <dylan_hung@aspeedtech.com>, openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_7ADC46BD-47BB-4386-8598-80CB2D86C345
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On Aug 17, 2022, at 12:38 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
>=20
>=20
> On Wed, 17 Aug 2022, at 11:29, Joel Stanley wrote:
>> Always build the code now that it is enabled by device tree.
>>=20
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>> drivers/ram/aspeed/sdram_ast2500.c | 4 ----
>> drivers/ram/aspeed/sdram_ast2600.c | 5 +----
>> drivers/ram/aspeed/Kconfig         | 7 -------
>> 3 files changed, 1 insertion(+), 15 deletions(-)
>>=20
>> diff --git a/drivers/ram/aspeed/sdram_ast2500.c=20
>> b/drivers/ram/aspeed/sdram_ast2500.c
>> index ca3b54295bf0..f76054d80b68 100644
>> --- a/drivers/ram/aspeed/sdram_ast2500.c
>> +++ b/drivers/ram/aspeed/sdram_ast2500.c
>> @@ -278,7 +278,6 @@ static void ast2500_sdrammc_calc_size(struct=20
>> dram_info *info)
>> 			 << SDRAM_CONF_CAP_SHIFT));
>> }
>>=20
>> -#ifdef CONFIG_ASPEED_ECC
>> static void ast2500_sdrammc_ecc_enable(struct dram_info *info, u32=20
>> conf_size_mb)
>> {
>> 	struct ast2500_sdrammc_regs *regs =3D info->regs;
>> @@ -313,7 +312,6 @@ static void ast2500_sdrammc_ecc_enable(struct=20
>> dram_info *info, u32 conf_size_mb)
>> 	writel(0x400, &regs->ecc_test_ctrl);
>> 	printf("ECC enable, ");
>> }
>> -#endif
>>=20
>> static int ast2500_sdrammc_init_ddr4(struct dram_info *info)
>> {
>> @@ -370,14 +368,12 @@ static int ast2500_sdrammc_init_ddr4(struct=20
>> dram_info *info)
>>=20
>> 	writel(SDRAM_MISC_DDR4_TREFRESH, &info->regs->misc_control);
>>=20
>> -#ifdef CONFIG_ASPEED_ECC
>> 	if (dev_read_bool(dev, "aspeed,ecc-enabled")) {
>> 		u32 ecc_size;
>>=20
>> 		ecc_size =3D dev_read_u32_default(dev, =
"aspeed,ecc-size", 0);
>> 		ast2500_sdrammc_ecc_enable(priv, ecc_size);
>> 	}
>> -#endif
>>=20
>> 	/* Enable all requests except video & display */
>> 	writel(SDRAM_REQ_USB20_EHCI1
>> diff --git a/drivers/ram/aspeed/sdram_ast2600.c=20
>> b/drivers/ram/aspeed/sdram_ast2600.c
>> index 6287c45365dd..7f599ff24d69 100644
>> --- a/drivers/ram/aspeed/sdram_ast2600.c
>> +++ b/drivers/ram/aspeed/sdram_ast2600.c
>> @@ -859,7 +859,7 @@ static void ast2600_sdrammc_update_size(struct=20
>> dram_info *info)
>>=20
>> 	info->info.size =3D hw_size;
>> }
>> -#ifdef CONFIG_ASPEED_ECC
>> +
>> static void ast2600_sdrammc_ecc_enable(struct dram_info *info, u32=20
>> conf_size_mb)
>> {
>> 	struct ast2600_sdrammc_regs *regs =3D info->regs;
>> @@ -890,7 +890,6 @@ static void ast2600_sdrammc_ecc_enable(struct=20
>> dram_info *info, u32 conf_size_mb)
>> 	writel(BIT(31), &regs->intr_ctrl);
>> 	writel(0, &regs->intr_ctrl);
>> }
>> -#endif
>>=20
>> static int ast2600_sdrammc_probe(struct udevice *dev)
>> {
>> @@ -988,14 +987,12 @@ L_ast2600_sdramphy_train:
>> 	}
>> #endif
>>=20
>> -#ifdef CONFIG_ASPEED_ECC
>> 	if (dev_read_bool(dev, "aspeed,ecc-enabled")) {
>> 		u32 ecc_size;
>>=20
>> 		ecc_size =3D dev_read_u32_default(dev, =
"aspeed,ecc-size", 0);
>> 		ast2600_sdrammc_ecc_enable(priv, ecc_size);
>> 	}
>> -#endif
>>=20
>> 	setbits_le32(priv->scu + AST_SCU_HANDSHAKE, SCU_HANDSHAKE_MASK);
>> 	clrbits_le32(&regs->intr_ctrl, MCR50_RESET_ALL_INTR);
>> diff --git a/drivers/ram/aspeed/Kconfig b/drivers/ram/aspeed/Kconfig
>> index 54c7769b5bbe..25238bf28d32 100644
>> --- a/drivers/ram/aspeed/Kconfig
>> +++ b/drivers/ram/aspeed/Kconfig
>> @@ -44,13 +44,6 @@ config ASPEED_BYPASS_SELFTEST
>> 	  Say Y here to bypass DRAM self test to speed up the boot time
>> endif
>>=20
>> -config ASPEED_ECC
>> -	bool "aspeed SDRAM error correcting code"
>> -	depends on DM && OF_CONTROL && ARCH_ASPEED
>> -	default n
>> -	help
>> -	  enable SDRAM ECC function
>> -
>=20
> Do we need any config refreshes?

Yeah, the configs/evb-ast2600* have this options and would need to be =
updated.

>=20
> Andrew


--Apple-Mail=_7ADC46BD-47BB-4386-8598-80CB2D86C345
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Aug 17, 2022, at 12:38 AM, Andrew Jeffery &lt;<a =
href=3D"mailto:andrew@aj.id.au" class=3D"">andrew@aj.id.au</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><meta =
charset=3D"UTF-8" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: AvenirNext-Regular; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: AvenirNext-Regular; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: AvenirNext-Regular; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">On Wed, 17 Aug 2022, at 11:29, Joel Stanley wrote:</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: AvenirNext-Regular; =
font-size: 14px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
AvenirNext-Regular; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">Always build the code now that it is =
enabled by device tree.<br class=3D""><br class=3D"">Signed-off-by: Joel =
Stanley &lt;<a href=3D"mailto:joel@jms.id.au" =
class=3D"">joel@jms.id.au</a>&gt;<br class=3D"">---<br =
class=3D"">drivers/ram/aspeed/sdram_ast2500.c | 4 ----<br =
class=3D"">drivers/ram/aspeed/sdram_ast2600.c | 5 +----<br =
class=3D"">drivers/ram/aspeed/Kconfig =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 7 -------<br =
class=3D"">3 files changed, 1 insertion(+), 15 deletions(-)<br =
class=3D""><br class=3D"">diff --git =
a/drivers/ram/aspeed/sdram_ast2500.c<span =
class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">b/drivers/ram/aspeed/sdram_ast2500.c<br class=3D"">index =
ca3b54295bf0..f76054d80b68 100644<br class=3D"">--- =
a/drivers/ram/aspeed/sdram_ast2500.c<br class=3D"">+++ =
b/drivers/ram/aspeed/sdram_ast2500.c<br class=3D"">@@ -278,7 +278,6 @@ =
static void ast2500_sdrammc_calc_size(struct<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">dram_info =
*info)<br class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-converted-space">&nbsp;</span>&lt;&lt;=
 SDRAM_CONF_CAP_SHIFT));<br class=3D"">}<br class=3D""><br =
class=3D"">-#ifdef CONFIG_ASPEED_ECC<br class=3D"">static void =
ast2500_sdrammc_ecc_enable(struct dram_info *info, u32<span =
class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">conf_size_mb)<br class=3D"">{<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>struct =
ast2500_sdrammc_regs *regs =3D info-&gt;regs;<br class=3D"">@@ -313,7 =
+312,6 @@ static void ast2500_sdrammc_ecc_enable(struct<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">dram_info =
*info, u32 conf_size_mb)<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>writel(0x400, =
&amp;regs-&gt;ecc_test_ctrl);<br class=3D""><span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span>printf("ECC enable, ");<br =
class=3D"">}<br class=3D"">-#endif<br class=3D""><br class=3D"">static =
int ast2500_sdrammc_init_ddr4(struct dram_info *info)<br class=3D"">{<br =
class=3D"">@@ -370,14 +368,12 @@ static int =
ast2500_sdrammc_init_ddr4(struct<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">dram_info =
*info)<br class=3D""><br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>writel(SDRAM_MISC_DDR4_TREFRESH, =
&amp;info-&gt;regs-&gt;misc_control);<br class=3D""><br class=3D"">-#ifdef=
 CONFIG_ASPEED_ECC<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (dev_read_bool(dev, =
"aspeed,ecc-enabled")) {<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>u32 ecc_size;<br class=3D""><br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>ecc_size =3D dev_read_u32_default(dev, "aspeed,ecc-size", 0);<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>ast2500_sdrammc_ecc_enable(priv, ecc_size);<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>}<br =
class=3D"">-#endif<br class=3D""><br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>/* Enable =
all requests except video &amp; display */<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>writel(SDRAM_REQ_USB20_EHCI1<br class=3D"">diff --git =
a/drivers/ram/aspeed/sdram_ast2600.c<span =
class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">b/drivers/ram/aspeed/sdram_ast2600.c<br class=3D"">index =
6287c45365dd..7f599ff24d69 100644<br class=3D"">--- =
a/drivers/ram/aspeed/sdram_ast2600.c<br class=3D"">+++ =
b/drivers/ram/aspeed/sdram_ast2600.c<br class=3D"">@@ -859,7 +859,7 @@ =
static void ast2600_sdrammc_update_size(struct<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">dram_info =
*info)<br class=3D""><br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>info-&gt;info.size =3D =
hw_size;<br class=3D"">}<br class=3D"">-#ifdef CONFIG_ASPEED_ECC<br =
class=3D"">+<br class=3D"">static void ast2600_sdrammc_ecc_enable(struct =
dram_info *info, u32<span class=3D"Apple-converted-space">&nbsp;</span><br=
 class=3D"">conf_size_mb)<br class=3D"">{<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>struct =
ast2600_sdrammc_regs *regs =3D info-&gt;regs;<br class=3D"">@@ -890,7 =
+890,6 @@ static void ast2600_sdrammc_ecc_enable(struct<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">dram_info =
*info, u32 conf_size_mb)<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>writel(BIT(31), =
&amp;regs-&gt;intr_ctrl);<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>writel(0, =
&amp;regs-&gt;intr_ctrl);<br class=3D"">}<br class=3D"">-#endif<br =
class=3D""><br class=3D"">static int ast2600_sdrammc_probe(struct =
udevice *dev)<br class=3D"">{<br class=3D"">@@ -988,14 +987,12 @@ =
L_ast2600_sdramphy_train:<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>}<br class=3D"">#endif<br =
class=3D""><br class=3D"">-#ifdef CONFIG_ASPEED_ECC<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(dev_read_bool(dev, "aspeed,ecc-enabled")) {<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>u32 =
ecc_size;<br class=3D""><br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>ecc_size =3D =
dev_read_u32_default(dev, "aspeed,ecc-size", 0);<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>ast2600_sdrammc_ecc_enable(priv, ecc_size);<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>}<br =
class=3D"">-#endif<br class=3D""><br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>setbits_le32(priv-&gt;scu + AST_SCU_HANDSHAKE, =
SCU_HANDSHAKE_MASK);<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	=
</span>clrbits_le32(&amp;regs-&gt;intr_ctrl, MCR50_RESET_ALL_INTR);<br =
class=3D"">diff --git a/drivers/ram/aspeed/Kconfig =
b/drivers/ram/aspeed/Kconfig<br class=3D"">index =
54c7769b5bbe..25238bf28d32 100644<br class=3D"">--- =
a/drivers/ram/aspeed/Kconfig<br class=3D"">+++ =
b/drivers/ram/aspeed/Kconfig<br class=3D"">@@ -44,13 +44,6 @@ config =
ASPEED_BYPASS_SELFTEST<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;Say Y here to bypass =
DRAM self test to speed up the boot time<br class=3D"">endif<br =
class=3D""><br class=3D"">-config ASPEED_ECC<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>bool =
"aspeed SDRAM error correcting code"<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>depends =
on DM &amp;&amp; OF_CONTROL &amp;&amp; ARCH_ASPEED<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>default =
n<br class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>help<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;enable SDRAM ECC =
function<br class=3D"">-<br class=3D""></blockquote><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: AvenirNext-Regular; =
font-size: 14px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
AvenirNext-Regular; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Do we need any config refreshes?</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: AvenirNext-Regular; =
font-size: 14px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""></div></blockquote><div><br class=3D""></div>Yeah, =
the&nbsp;configs/evb-ast2600* have this options and would need to be =
updated.</div><div><br class=3D""></div><div><blockquote type=3D"cite" =
class=3D""><div class=3D""><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: AvenirNext-Regular; font-size: 14px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: AvenirNext-Regular; font-size: 14px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Andrew</span></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_7ADC46BD-47BB-4386-8598-80CB2D86C345--

