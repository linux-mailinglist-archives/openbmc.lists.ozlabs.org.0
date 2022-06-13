Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AD5549957
	for <lists+openbmc@lfdr.de>; Mon, 13 Jun 2022 18:56:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMHlw401kz3bk5
	for <lists+openbmc@lfdr.de>; Tue, 14 Jun 2022 02:56:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=akamai.com header.i=@akamai.com header.a=rsa-sha256 header.s=jan2016.eng header.b=EJ1pHYJA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=akamai.com (client-ip=2620:100:9005:57f::1; helo=mx0b-00190b01.pphosted.com; envelope-from=iwolosch@akamai.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=akamai.com header.i=@akamai.com header.a=rsa-sha256 header.s=jan2016.eng header.b=EJ1pHYJA;
	dkim-atps=neutral
X-Greylist: delayed 2223 seconds by postgrey-1.36 at boromir; Tue, 14 Jun 2022 02:56:19 AEST
Received: from mx0b-00190b01.pphosted.com (mx0b-00190b01.pphosted.com [IPv6:2620:100:9005:57f::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMHlR6p3Qz3086;
	Tue, 14 Jun 2022 02:56:17 +1000 (AEST)
Received: from pps.filterd (m0122331.ppops.net [127.0.0.1])
	by mx0b-00190b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DEsslR032114;
	Mon, 13 Jun 2022 17:18:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=jan2016.eng;
 bh=9y8X2rLVllcv7n1uyVHv4446S0A8aVUbl0gK5IV3hw8=;
 b=EJ1pHYJADgjQv/UT37V4iJGcMgNGqzhPkNpCHC05d/QQvrywQnUFLX2KIrZHyw0aBGwO
 h3Cn3iBYzMzPWojaWEqHj/3jMEfN6YueTHr0R0gWj46sjIuKAgQT6exh5gH9G5OIpM9k
 nxz9/v88VYOAnMAXDa3t7Pm3sUJa4qa/UId/Eh7hoFYWfWT1BIl/HAPiHJDCFCONurjh
 Gn61dyELWOnd3fjbds2mkgg9UrPzUJZ+RvBvHICDz4PMWBrBbsWNlSrktQAoaEXnSYYi
 WbaQ7IZOA/XSGFvqC8HIZ10y6pLeAt0sYyJVj/ueC5r43TGtEwlLPoX5yikWb9PPVZVx 2g== 
Received: from prod-mail-ppoint5 (prod-mail-ppoint5.akamai.com [184.51.33.60] (may be forged))
	by mx0b-00190b01.pphosted.com (PPS) with ESMTPS id 3gmfwyuhmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jun 2022 17:18:28 +0100
Received: from pps.filterd (prod-mail-ppoint5.akamai.com [127.0.0.1])
	by prod-mail-ppoint5.akamai.com (8.16.1.2/8.16.1.2) with SMTP id 25DFo6gU006113;
	Mon, 13 Jun 2022 09:18:27 -0700
Received: from email.msg.corp.akamai.com ([172.27.91.23])
	by prod-mail-ppoint5.akamai.com with ESMTP id 3gms1bp0jw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jun 2022 09:18:27 -0700
Received: from USTX2EX-DAG3MB2.msg.corp.akamai.com (172.27.165.126) by
 usma1ex-dag4mb7.msg.corp.akamai.com (172.27.91.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.986.26; Mon, 13 Jun 2022 12:18:26 -0400
Received: from ustx2ex-dag3mb5.msg.corp.akamai.com (172.27.165.129) by
 USTX2EX-DAG3MB2.msg.corp.akamai.com (172.27.165.126) with Microsoft SMTP
 Server (TLS) id 15.0.1497.36; Mon, 13 Jun 2022 11:18:26 -0500
Received: from ustx2ex-dag3mb5.msg.corp.akamai.com ([172.27.165.129]) by
 ustx2ex-dag3mb5.msg.corp.akamai.com ([172.27.165.129]) with mapi id
 15.00.1497.036; Mon, 13 Jun 2022 11:18:26 -0500
From: "Woloschin, Ian" <iwolosch@akamai.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
Subject: Re: [PATCH] spi: aspeed: Fix division by zero
Thread-Topic: [PATCH] spi: aspeed: Fix division by zero
Thread-Index: AQHYfX+YOUROQjZHAUuLnzma/6JGFK1NWx4AgAAFDwCAAHsOAA==
Date: Mon, 13 Jun 2022 16:18:25 +0000
Message-ID: <9EDBE426-7AC1-4351-8225-5DFE15C4F8D2@akamai.com>
References: <20220611103929.1484062-1-clg@kaod.org>
 <20220613083952.4z45ulaxdy2okbho@ti.com>
 <367135b2-e5c0-3ebb-9ad2-2a78b2c6af2f@kaod.org>
In-Reply-To: <367135b2-e5c0-3ebb-9ad2-2a78b2c6af2f@kaod.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.27.164.43]
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5B5B54CF-09FD-4BC5-9DCF-62752A49CD87";
	protocol="application/pkcs7-signature"; micalg=sha-256
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.874
 definitions=2022-06-13_07:2022-06-13,2022-06-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206130070
X-Proofpoint-GUID: dcwig-r8m2FidLDoUB1jH6bf7tZBgJLa
X-Proofpoint-ORIG-GUID: dcwig-r8m2FidLDoUB1jH6bf7tZBgJLa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-13_07,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 clxscore=1011
 priorityscore=1501 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206130071
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Joel Stanley <joel@jms.id.au>, "Woloschin, Ian" <iwolosch@akamai.com>, Pratyush Yadav <p.yadav@ti.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--Apple-Mail=_5B5B54CF-09FD-4BC5-9DCF-62752A49CD87
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_708190A5-FF2C-4ABB-9034-7BDBC2516FB1"


--Apple-Mail=_708190A5-FF2C-4ABB-9034-7BDBC2516FB1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Jun 13, 2022, at 4:57 AM, C=C3=A9dric Le Goater <clg@kaod.org> =
wrote:
>=20
> On 6/13/22 10:39, Pratyush Yadav wrote:
>> On 11/06/22 12:39PM, C=C3=A9dric Le Goater wrote:
>>> When using the normal read operation for data transfers, the dummy =
bus
>>> width is zero. In that case, they are no dummy bytes to transfer and
>>> setting the dummy field in the controller register becomes useless.
>>>=20
>>> Issue was found on a custom "Bifrost" board with a AST2500 SoC and
>>> using a MX25L51245GMI-08G SPI Flash.
>>>=20
>>> Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
>>> Reported-by: Ian Woloschin <ian.woloschin@akamai.com>
>>> Fixes: 54613fc6659b ("spi: aspeed: Add support for direct mapping")
>>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>>> ---
>>> drivers/spi/spi-aspeed-smc.c | 12 +++++++++++-
>>> 1 file changed, 11 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git a/drivers/spi/spi-aspeed-smc.c =
b/drivers/spi/spi-aspeed-smc.c
>>> index 496f3e1e9079..3e891bf22470 100644
>>> --- a/drivers/spi/spi-aspeed-smc.c
>>> +++ b/drivers/spi/spi-aspeed-smc.c
>>> @@ -558,6 +558,14 @@ static int aspeed_spi_dirmap_create(struct =
spi_mem_dirmap_desc *desc)
>>> 	u32 ctl_val;
>>> 	int ret =3D 0;
>>> +	dev_dbg(aspi->dev,
>>> +		"CE%d %s dirmap [ 0x%.8llx - 0x%.8llx ] OP %#x =
mode:%d.%d.%d.%d naddr:%#x ndummies:%#x\n",
>>> +		chip->cs, op->data.dir =3D=3D SPI_MEM_DATA_IN ? "read" : =
"write",
>>> +		desc->info.offset, desc->info.offset + =
desc->info.length,
>>> +		op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
>>> +		op->dummy.buswidth, op->data.buswidth,
>>> +		op->addr.nbytes, op->dummy.nbytes);
>>> +
>> Unrelated change. Please send as a separate patch.
>=20
> OK.
>=20
>>> 	chip->clk_freq =3D desc->mem->spi->max_speed_hz;
>>> 	/* Only for reads */
>>> @@ -574,9 +582,11 @@ static int aspeed_spi_dirmap_create(struct =
spi_mem_dirmap_desc *desc)
>>> 	ctl_val =3D readl(chip->ctl) & ~CTRL_IO_CMD_MASK;
>>> 	ctl_val |=3D aspeed_spi_get_io_mode(op) |
>>> 		op->cmd.opcode << CTRL_COMMAND_SHIFT |
>>> -		CTRL_IO_DUMMY_SET(op->dummy.nbytes / op->dummy.buswidth) =
|
>>> 		CTRL_IO_MODE_READ;
>>> +	if (op->dummy.nbytes)
>>> +		ctl_val |=3D CTRL_IO_DUMMY_SET(op->dummy.nbytes / =
op->dummy.buswidth);
>>> +
>> LGTM. With the above fixed,
>>=20
>> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
>=20
> Thanks,
>=20
> C.

I tested just the relevant change and it fixed my problem, allowing my =
board to boot.

Tested-by: Ian Woloschin <iwolosch@akamai.com =
<mailto:iwolosch@akamai.com>>

Thanks!

>=20
>>> 	/* Tune 4BYTE address mode */
>>> 	if (op->addr.nbytes) {
>>> 		u32 addr_mode =3D readl(aspi->regs + CE_CTRL_REG);
>>> --=20
>>> 2.35.3


--Apple-Mail=_708190A5-FF2C-4ABB-9034-7BDBC2516FB1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Jun 13, 2022, at 4:57 AM, C=C3=A9dric Le Goater &lt;<a =
href=3D"mailto:clg@kaod.org" class=3D"">clg@kaod.org</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><meta =
charset=3D"UTF-8" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: RecMonoDuotone-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">On 6/13/22 10:39, Pratyush Yadav wrote:</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: RecMonoDuotone-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
RecMonoDuotone-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">On 11/06/22 12:39PM, C=C3=A9dric Le =
Goater wrote:<br class=3D""><blockquote type=3D"cite" class=3D"">When =
using the normal read operation for data transfers, the dummy bus<br =
class=3D"">width is zero. In that case, they are no dummy bytes to =
transfer and<br class=3D"">setting the dummy field in the controller =
register becomes useless.<br class=3D""><br class=3D"">Issue was found =
on a custom "Bifrost" board with a AST2500 SoC and<br class=3D"">using a =
MX25L51245GMI-08G SPI Flash.<br class=3D""><br class=3D"">Cc: Chin-Ting =
Kuo &lt;<a href=3D"mailto:chin-ting_kuo@aspeedtech.com" =
class=3D"">chin-ting_kuo@aspeedtech.com</a>&gt;<br class=3D"">Reported-by:=
 Ian Woloschin &lt;<a href=3D"mailto:ian.woloschin@akamai.com" =
class=3D"">ian.woloschin@akamai.com</a>&gt;<br class=3D"">Fixes: =
54613fc6659b ("spi: aspeed: Add support for direct mapping")<br =
class=3D"">Signed-off-by: C=C3=A9dric Le Goater &lt;<a =
href=3D"mailto:clg@kaod.org" class=3D"">clg@kaod.org</a>&gt;<br =
class=3D"">---<br class=3D"">drivers/spi/spi-aspeed-smc.c | 12 =
+++++++++++-<br class=3D"">1 file changed, 11 insertions(+), 1 =
deletion(-)<br class=3D""><br class=3D"">diff --git =
a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c<br =
class=3D"">index 496f3e1e9079..3e891bf22470 100644<br class=3D"">--- =
a/drivers/spi/spi-aspeed-smc.c<br class=3D"">+++ =
b/drivers/spi/spi-aspeed-smc.c<br class=3D"">@@ -558,6 +558,14 @@ static =
int aspeed_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>u32 ctl_val;<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>int ret =3D 0;<br class=3D"">+<span=
 class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>dev_dbg(aspi-&gt;dev,<br class=3D"">+<span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>"CE%d %s dirmap [ 0x%.8llx - =
0x%.8llx ] OP %#x mode:%d.%d.%d.%d naddr:%#x ndummies:%#x\n",<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>chip-&gt;cs, op-&gt;data.dir =3D=3D SPI_MEM_DATA_IN ? "read" : =
"write",<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>desc-&gt;info.offset, =
desc-&gt;info.offset + desc-&gt;info.length,<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>op-&gt;cmd.opcode, op-&gt;cmd.buswidth, op-&gt;addr.buswidth,<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>op-&gt;dummy.buswidth, op-&gt;data.buswidth,<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>op-&gt;addr.nbytes, op-&gt;dummy.nbytes);<br class=3D"">+<br =
class=3D""></blockquote>Unrelated change. Please send as a separate =
patch.<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, =
0); font-family: RecMonoDuotone-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: RecMonoDuotone-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">OK.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: RecMonoDuotone-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: RecMonoDuotone-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: RecMonoDuotone-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>chip-&gt;clk_freq =3D desc-&gt;mem-&gt;spi-&gt;max_speed_hz;<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>/* Only for reads */<br class=3D"">@@ -574,9 +582,11 @@ static =
int aspeed_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>ctl_val =3D readl(chip-&gt;ctl) &amp; ~CTRL_IO_CMD_MASK;<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>ctl_val |=3D aspeed_spi_get_io_mode(op) |<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>op-&gt;cmd.opcode &lt;&lt; CTRL_COMMAND_SHIFT |<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>CTRL_IO_DUMMY_SET(op-&gt;dummy.nbytes / op-&gt;dummy.buswidth) =
|<br class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>CTRL_IO_MODE_READ;<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(op-&gt;dummy.nbytes)<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>ctl_val |=3D =
CTRL_IO_DUMMY_SET(op-&gt;dummy.nbytes / op-&gt;dummy.buswidth);<br =
class=3D"">+<br class=3D""></blockquote>LGTM. With the above fixed,<br =
class=3D""><br class=3D"">Reviewed-by: Pratyush Yadav &lt;<a =
href=3D"mailto:p.yadav@ti.com" class=3D"">p.yadav@ti.com</a>&gt;<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: RecMonoDuotone-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: RecMonoDuotone-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Thanks,</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: RecMonoDuotone-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: RecMonoDuotone-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: RecMonoDuotone-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">C.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
RecMonoDuotone-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div><div>I tested just the relevant change and it fixed my =
problem, allowing my board to boot.</div><div><br =
class=3D""></div><div>Tested-by: Ian Woloschin &lt;<a =
href=3D"mailto:iwolosch@akamai.com" =
class=3D"">iwolosch@akamai.com</a>&gt;</div><div><br =
class=3D""></div><div>Thanks!</div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: RecMonoDuotone-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: =
RecMonoDuotone-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>/* Tune 4BYTE address mode */<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(op-&gt;addr.nbytes) {<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>u32 addr_mode =3D =
readl(aspi-&gt;regs + CE_CTRL_REG);<br class=3D"">--<span =
class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">2.35.3</blockquote></blockquote></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_708190A5-FF2C-4ABB-9034-7BDBC2516FB1--

--Apple-Mail=_5B5B54CF-09FD-4BC5-9DCF-62752A49CD87
Content-Disposition: attachment; filename="smime.p7s"
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCCYsw
ggRmMIIEC6ADAgECAhM+AAAACuqzGxBold1TAAAAAAAKMAoGCCqGSM49BAMCMD8xITAfBgNVBAoT
GEFrYW1haSBUZWNobm9sb2dpZXMgSW5jLjEaMBgGA1UEAxMRQWthbWFpQ29ycFJvb3QtRzEwHhcN
MTUwNjA0MTQ0NjA3WhcNMjUwNjA0MTQ1NjA3WjA8MSEwHwYDVQQKExhBa2FtYWkgVGVjaG5vbG9n
aWVzIEluYy4xFzAVBgNVBAMTDkFrYW1haUNsaWVudENBMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcD
QgAEpuPNNA/ZEjWEkhjgWrKAipOQ72FwxtH8l6tvtbIFC5IfpXFiAN5YB//ydeR3aM1Xk9l/JOQl
bwOuOtNP7UgZoqOCAucwggLjMBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBSTh6sxZpDayk0W
A4zkww+95g0sDDCBsAYDVR0gBIGoMIGlMIGiBgsqAwSPTgEJCQgBATCBkjBYBggrBgEFBQcCAjBM
HkoAQQBrAGEAbQBhAGkAIABDAGUAcgB0AGkAZgBpAGMAYQB0AGUAIABQAHIAYQBjAHQAaQBjAGUA
IABTAHQAYQB0AGUAbQBlAG4AdDA2BggrBgEFBQcCARYqaHR0cDovL2FrYW1haWNybC5ha2FtYWku
Y29tL0FrYW1haUNQUy5wZGYAMFUGA1UdJQROMEwGCCsGAQUFBwMCBggrBgEFBQcDBAYKKwYBBAGC
NxQCAgYKKwYBBAGCNwoDBAYKKwYBBAGCNwoDDAYIKwYBBQUHAwcGCCsGAQUFBwMJMBkGCSsGAQQB
gjcUAgQMHgoAUwB1AGIAQwBBMAsGA1UdDwQEAwIBhjAPBgNVHRMBAf8EBTADAQH/MB8GA1UdIwQY
MBaAFK0Bh+rcWa6xEzmVTQ9XoCSGi3u9MIGABgNVHR8EeTB3MHWgc6BxhjFodHRwOi8vYWthbWFp
Y3JsLmFrYW1haS5jb20vQWthbWFpQ29ycFJvb3QtRzEuY3JshjxodHRwOi8vYWthbWFpY3JsLmRm
dzAxLmNvcnAuYWthbWFpLmNvbS9Ba2FtYWlDb3JwUm9vdC1HMS5jcmwwgcgGCCsGAQUFBwEBBIG7
MIG4MC0GCCsGAQUFBzABhiFodHRwOi8vYWthbWFpb2NzcC5ha2FtYWkuY29tL29jc3AwPQYIKwYB
BQUHMAKGMWh0dHA6Ly9ha2FtYWljcmwuYWthbWFpLmNvbS9Ba2FtYWlDb3JwUm9vdC1HMS5jcnQw
SAYIKwYBBQUHMAKGPGh0dHA6Ly9ha2FtYWljcmwuZGZ3MDEuY29ycC5ha2FtYWkuY29tL0FrYW1h
aUNvcnBSb290LUcxLmNydDAKBggqhkjOPQQDAgNJADBGAiEAxb2BDEI5u7VpG4TgR0KbsktKaQOi
FL6T6KtkAx7D8xACIQDJXMn85cVLMHcRe3wdfR/6Nr0ofAejZ6IaKj34qkK5KzCCBR0wggTDoAMC
AQICExcAB5Lsa5l6F73+L6gAAAAHkuwwCgYIKoZIzj0EAwIwPDEhMB8GA1UEChMYQWthbWFpIFRl
Y2hub2xvZ2llcyBJbmMuMRcwFQYDVQQDEw5Ba2FtYWlDbGllbnRDQTAeFw0yMTEwMjEyMzQ5Mzda
Fw0yMzEwMjEyMzQ5MzdaMFIxGTAXBgNVBAsTEE1hY0Jvb2sgUHJvLU1ENlAxETAPBgNVBAMTCGl3
b2xvc2NoMSIwIAYJKoZIhvcNAQkBFhNpd29sb3NjaEBha2FtYWkuY29tMIIBIjANBgkqhkiG9w0B
AQEFAAOCAQ8AMIIBCgKCAQEAno/wydCf0yJn2Ta3gF0zHAkhMYkqm30B10wiUUvvnEwLdnXnCKoL
xOIxtCSXz/ZIF3Rt6piNJdFnPfSX0b/BjH7xFnWNMf+gv8ywUU6GKaDKnv6HTp1uaP2fsTPuEXDm
45sSAilpXbmIK1RddA+vBk/d5VdIMF3SaTVAyw8kCE4cisWHcCb7AjMU2fX3HfK4MDUclcx6+4Zd
uY9mR5a1Z9cpWrQaw4AX/dAHJzzH5gZUwMItGlOPJ5dRxRwB4qvkBrJ9r9XS5u+f6yNrieXv6U1v
bs0ZFtJ7/HC1152fyNnMVME4Ioq4cmxFa0KVzu8lL3BLJHOBrKNAHBv0QDKM2QIDAQABo4ICwTCC
Ar0wCwYDVR0PBAQDAgeAMCkGA1UdJQQiMCAGCCsGAQUFBwMCBggrBgEFBQcDBAYKKwYBBAGCNwoD
BDAdBgNVHQ4EFgQUmsrwBgVr0RBCbc1U/YwowReYTlUwSAYDVR0RBEEwP6AoBgorBgEEAYI3FAID
oBoMGGl3b2xvc2NoQGNvcnAuYWthbWFpLmNvbYETaXdvbG9zY2hAYWthbWFpLmNvbTAfBgNVHSME
GDAWgBSTh6sxZpDayk0WA4zkww+95g0sDDB6BgNVHR8EczBxMG+gbaBrhi5odHRwOi8vYWthbWFp
Y3JsLmFrYW1haS5jb20vQWthbWFpQ2xpZW50Q0EuY3JshjlodHRwOi8vYWthbWFpY3JsLmRmdzAx
LmNvcnAuYWthbWFpLmNvbS9Ba2FtYWlDbGllbnRDQS5jcmwwgcIGCCsGAQUFBwEBBIG1MIGyMDoG
CCsGAQUFBzAChi5odHRwOi8vYWthbWFpY3JsLmFrYW1haS5jb20vQWthbWFpQ2xpZW50Q0EuY3J0
MEUGCCsGAQUFBzAChjlodHRwOi8vYWthbWFpY3JsLmRmdzAxLmNvcnAuYWthbWFpLmNvbS9Ba2Ft
YWlDbGllbnRDQS5jcnQwLQYIKwYBBQUHMAGGIWh0dHA6Ly9ha2FtYWlvY3NwLmFrYW1haS5jb20v
b2NzcDA7BgkrBgEEAYI3FQcELjAsBiQrBgEEAYI3FQiCzuU6h7jULYGFiwei4yGG0g+BSYWlwxCa
1X8CAWQCAVMwNQYJKwYBBAGCNxUKBCgwJjAKBggrBgEFBQcDAjAKBggrBgEFBQcDBDAMBgorBgEE
AYI3CgMEMEQGCSqGSIb3DQEJDwQ3MDUwDgYIKoZIhvcNAwICAgCAMA4GCCqGSIb3DQMEAgIAgDAH
BgUrDgMCBzAKBggqhkiG9w0DBzAKBggqhkjOPQQDAgNIADBFAiEAgI3ieHss2kOdtMYHeJu+ioNN
Uq/HB5OeS5N3Eg/LKDoCID4x/ujQmTaKi76vn/jwkJB/2o9SqWjejVw5mKMsmZoZMYIB6TCCAeUC
AQEwUzA8MSEwHwYDVQQKExhBa2FtYWkgVGVjaG5vbG9naWVzIEluYy4xFzAVBgNVBAMTDkFrYW1h
aUNsaWVudENBAhMXAAeS7GuZehe9/i+oAAAAB5LsMA0GCWCGSAFlAwQCAQUAoGkwGAYJKoZIhvcN
AQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjIwNjEzMTYxODI0WjAvBgkqhkiG9w0B
CQQxIgQgc5FM2NLXJ+55YvO39afKsamS9vDiyV9zWHrMoHDI2e8wDQYJKoZIhvcNAQELBQAEggEA
V1HOazAojPuLI+VJctg9sZh5YHRaohdU7lamIRoYJnVwBArZkdZ3jO6kc4h+ZB1NZMTyEjyZ58xF
LHEe5HixzncmeU0hdmuqWc4UYsXjCJ+GgO9Nr6Nu2vCvrRYSWUjGDKJpsPAMI3spSCspXfjn7erg
FZXncRMgGgCNEa4a7wMxGdyp6+mydWJOnQvtiekPONy2224klHMdIl0r9vPysjW/HheImom/cRSo
aUbhMVp5CYNbAn3N3w5punwq3OF6ig2KxYqgHbM5Sq6Ry3/BGHSC5m3lLLU8CrNdIwyE6sbKDQuC
3VmZH+adbuDho/EHL6qKLTl21cSADOOWmFFOawAAAAAAAA==

--Apple-Mail=_5B5B54CF-09FD-4BC5-9DCF-62752A49CD87--
