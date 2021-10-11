Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C933E42993A
	for <lists+openbmc@lfdr.de>; Mon, 11 Oct 2021 23:57:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSt1c36Wdz2yNQ
	for <lists+openbmc@lfdr.de>; Tue, 12 Oct 2021 08:57:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lvRrtzmJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lvRrtzmJ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSt1066tyz2xXt;
 Tue, 12 Oct 2021 08:56:36 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19BKfgU0019816; 
 Mon, 11 Oct 2021 17:56:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : message-id :
 content-type : subject : date : in-reply-to : cc : to : references :
 mime-version; s=pp1; bh=As+SfXbk4V2FREYGgka4SDb1vObwSiFe7CX7hwIgNSQ=;
 b=lvRrtzmJE3x+rfrTkMcBi1CaOv9AXWV/ja5JMNxCHOrt9oH0R8n+FuIdu7ggIb71dVMC
 Mvg9UhYB9YVPmH4EaCOCvk4hGSYj8RRCF38C5OGkYjmTndIAox7YQMslAKl3XSGC/gpm
 xnC1DJ9XtU/KU6HQe/8Mp02ISnLTIw9brozAGizQ34UkajYY6Z2VESXNYHkY8ODSLCa4
 OZP0e97Kj5mfpB5wC/trUsH0pOCpg/k6J4pNSLVw+1ZAz+kV4JBiDKPYkow/fo9ecCMP
 VBb4AzZksxVxJeBHCJ4OUzaefC+Fxhfjx94BTqPmvYtQX3S4N24BgPCwJ3vO/TmplbOt Ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bmup427pg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 17:56:25 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19BLaJ9T008291;
 Mon, 11 Oct 2021 17:56:25 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bmup427pa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 17:56:25 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19BLYNjY008296;
 Mon, 11 Oct 2021 21:56:23 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03wdc.us.ibm.com with ESMTP id 3bk2qa6yec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 21:56:23 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19BLuJa253281052
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 21:56:19 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91FB9124058;
 Mon, 11 Oct 2021 21:56:19 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B516D124054;
 Mon, 11 Oct 2021 21:56:18 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.160.123.215])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 11 Oct 2021 21:56:18 +0000 (GMT)
From: Adriana Kobylak <anoo@linux.ibm.com>
Message-Id: <15085868-FAE6-4FC7-A2BB-C786E7EFBDD4@linux.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_C8D98141-8E44-4FE1-B86D-01E45291A1D5"
Subject: Re: [PATCH v3] ARM: dts: aspeed: rainier: Add power-config-full-load
 gpio
Date: Mon, 11 Oct 2021 16:54:05 -0500
In-Reply-To: <CACPK8XdnMfDD6FHOuwyxz5S-wzaY1uSBEso6ov6OKQ0r2H7cTg@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
References: <20211005192226.213539-1-anoo@linux.ibm.com>
 <CACPK8XdnMfDD6FHOuwyxz5S-wzaY1uSBEso6ov6OKQ0r2H7cTg@mail.gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: k4I0G4c_7sbuHp1QlpYJcf972PR2f_7n
X-Proofpoint-ORIG-GUID: eru3Wsueq55BgEa_doyD3ErDW-2j9fLm
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-11_11,2021-10-11_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 suspectscore=0 adultscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110110122
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
Cc: Matt Spinler <spinler@us.ibm.com>, Derek Howard <derekh@us.ibm.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Adriana Kobylak <anoo@us.ibm.com>,
 Eddie James <eajames@linux.ibm.com>, Brandon Wyman <bjwyman@gmail.com>,
 Shawn McCarney <shawnmm@us.ibm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_C8D98141-8E44-4FE1-B86D-01E45291A1D5
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On Oct 7, 2021, at 11:22 PM, Joel Stanley <joel@jms.id.au> wrote:
>=20
> Hi Adriana,
>=20
> On Tue, 5 Oct 2021 at 19:22, Adriana Kobylak <anoo@linux.ibm.com <mailto:=
anoo@linux.ibm.com>> wrote:
>>=20
>> From: Adriana Kobylak <anoo@us.ibm.com>
>>=20
>> Add the power-config-full-load described in:
>> https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-nam=
ing.md#power-config-full-load
>>=20
>> The power-config-full-load gpio is designed to be used to specify how
>> many power supplies the system should have, in rainier it is 2 or 4.  If
>> enough power supplies fail so that the system no longer has redundancy
>> (no longer n+1), the hardware will signal to the Onboard Chip Controller
>> that the system may be oversubscribed, and performance may need to be
>> reduced so the system can maintain it's powered on state.
>>=20
>> Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
>=20
> This looks good. I think the name is much easier to understand now.

Thanks, yeah agree is clearer now.

>=20
> I notice you've dropped all of the other names. Do you not need them?

Right, don=E2=80=99t need them. If we ever do, we=E2=80=99ll go through the=
 same process of proposing adequate names for them in the openbmc design do=
c.

>=20
> It would be great if one of the people you cc'd could provide a
> reviewed-by before I merge this.

Sure, seems Eddie just reviewed it.

>=20
> Cheers,
>=20
> Joel
>=20
>> ---
>>=20
>> v2: Update commit message.
>> v3: Updated gpio name to power-config-full-load to match design doc.
>>=20
>> arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 13 +++++++++++++
>> 1 file changed, 13 insertions(+)
>>=20
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boo=
t/dts/aspeed-bmc-ibm-rainier.dts
>> index 33fae8ad1305..10bde77fb847 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> @@ -1998,6 +1998,19 @@ eeprom@51 {
>>                reg =3D <0x51>;
>>        };
>>=20
>> +       pca_pres3: pca9552@60 {
>> +               compatible =3D "nxp,pca9552";
>> +               reg =3D <0x60>;
>> +               #address-cells =3D <1>;
>> +               #size-cells =3D <0>;
>> +               gpio-controller;
>> +               #gpio-cells =3D <2>;
>> +
>> +               gpio-line-names =3D
>> +                       "", "", "", "", "", "", "", "",
>> +                       "", "", "", "", "", "", "power-config-full-load"=
, "";
>> +       };
>> +
>>        pca_pres2: pca9552@61 {
>>                compatible =3D "nxp,pca9552";
>>                reg =3D <0x61>;
>> --
>> 2.25.1


--Apple-Mail=_C8D98141-8E44-4FE1-B86D-01E45291A1D5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Oct 7, 2021, at 11:22 PM, Joel Stanley &lt;<a =
href=3D"mailto:joel@jms.id.au" class=3D"">joel@jms.id.au</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><meta =
charset=3D"UTF-8" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Verdana; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Hi Adriana,</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Verdana; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Verdana; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Verdana; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">On Tue, 5 Oct 2021 at 19:22, Adriana Kobylak &lt;</span><a =
href=3D"mailto:anoo@linux.ibm.com" style=3D"font-family: Verdana; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" class=3D"">anoo@linux.ibm.com</a><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">&gt; wrote:</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Verdana; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
class=3D"">From: Adriana Kobylak &lt;<a href=3D"mailto:anoo@us.ibm.com" =
class=3D"">anoo@us.ibm.com</a>&gt;<br class=3D""><br class=3D"">Add the =
power-config-full-load described in:<br class=3D""><a =
href=3D"https://github.com/openbmc/docs/blob/master/designs/device-tree-gp=
io-naming.md#power-config-full-load" =
class=3D"">https://github.com/openbmc/docs/blob/master/designs/device-tree=
-gpio-naming.md#power-config-full-load</a><br class=3D""><br =
class=3D"">The power-config-full-load gpio is designed to be used to =
specify how<br class=3D"">many power supplies the system should have, in =
rainier it is 2 or 4. &nbsp;If<br class=3D"">enough power supplies fail =
so that the system no longer has redundancy<br class=3D"">(no longer =
n+1), the hardware will signal to the Onboard Chip Controller<br =
class=3D"">that the system may be oversubscribed, and performance may =
need to be<br class=3D"">reduced so the system can maintain it's powered =
on state.<br class=3D""><br class=3D"">Signed-off-by: Adriana Kobylak =
&lt;anoo@us.ibm.com&gt;<br class=3D""></blockquote><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">This looks good. I think the =
name is much easier to understand now.</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Verdana; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div>Thanks, yeah agree is clearer now.</div><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">I notice you've dropped all of =
the other names. Do you not need them?</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Verdana; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div><div>Right, don=E2=80=99t need them. If we ever do, =
we=E2=80=99ll go through the same process of proposing adequate names =
for them in the openbmc design doc.</div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Verdana; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Verdana; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">It would be great if one of the people you cc'd could provide =
a</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Verdana; font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">reviewed-by =
before I merge this.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Verdana; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div><div>Sure, seems Eddie just reviewed it.</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Cheers,</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">Joel</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Verdana; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">---<br =
class=3D""><br class=3D"">v2: Update commit message.<br class=3D"">v3: =
Updated gpio name to power-config-full-load to match design doc.<br =
class=3D""><br class=3D"">arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | =
13 +++++++++++++<br class=3D"">1 file changed, 13 insertions(+)<br =
class=3D""><br class=3D"">diff --git =
a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts =
b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts<br class=3D"">index =
33fae8ad1305..10bde77fb847 100644<br class=3D"">--- =
a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts<br class=3D"">+++ =
b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts<br class=3D"">@@ -1998,6 =
+1998,19 @@ eeprom@51 {<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;reg =3D &lt;0x51&gt;;<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};<br class=3D""><br =
class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pca_pres3: pca9552@60 =
{<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;compatible =3D "nxp,pca9552";<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;reg =3D &lt;0x60&gt;;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;#address-cells =3D &lt;1&gt;;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;#size-cells =3D &lt;0&gt;;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;gpio-controller;<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;#gpio-cells =3D &lt;2&gt;;<br class=3D"">+<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;gpio-line-names =3D<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"", "", "", =
"", "", "", "", "",<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"", "", "", =
"", "", "", "power-config-full-load", "";<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};<br class=3D"">+<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pca_pres2: =
pca9552@61 {<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;compatible =3D "nxp,pca9552";<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;reg =3D &lt;0x61&gt;;<br class=3D"">--<br =
class=3D"">2.25.1</blockquote></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_C8D98141-8E44-4FE1-B86D-01E45291A1D5--

