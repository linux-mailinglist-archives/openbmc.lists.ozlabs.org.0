Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3171840CD05
	for <lists+openbmc@lfdr.de>; Wed, 15 Sep 2021 21:10:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8qYm0xgYz2ybD
	for <lists+openbmc@lfdr.de>; Thu, 16 Sep 2021 05:10:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TuOThL2m;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TuOThL2m; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8qYH0zgfz2yJq;
 Thu, 16 Sep 2021 05:10:26 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18FIgO7W032603;
 Wed, 15 Sep 2021 15:10:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 mime-version; s=pp1; bh=8hXoEL9tzOIgSJEA8wqQ9wcLFXvB6awn9Caw4pPWWdE=;
 b=TuOThL2mBUrRO+060rgBLCm+W8vWL/s3AjDjjkYtlE2GPuFXgSZQJQIcdFqrd2yEhZLN
 1f8XIaMAdcKEaIEl4/M1l54WQgGJFWmQ4tU10iDsFhV4+XnHpRsjhFJbC26r/1CJNL+R
 Z3OoOgwdFrxs8T3eM/5D3ec0o/LjF57dMvoUF4m4zCZ2BQZ6Zp0UkM5UkoHsqOpR4OiT
 gkjiyjAH/WIx0D8oWJVNmMGZucKWfT7xH37uDcsq0k5xBp9FQPJKd4gynM1MYHK4HOWe
 BBHRu9RN4w2ypFfEbAqhM2FCS+FLBq02alymEJeCv7VPUAqsUbIuHZluqKaIRXtupJCh NA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b3nqysb5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 15:10:16 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18FJ6F5h017631;
 Wed, 15 Sep 2021 15:10:15 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b3nqysb4w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 15:10:15 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18FIrSsU011199;
 Wed, 15 Sep 2021 19:10:14 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 3b0m3by1fb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 19:10:14 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18FJACkd19595970
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Sep 2021 19:10:12 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 06E74C605D;
 Wed, 15 Sep 2021 19:10:12 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66E04C605F;
 Wed, 15 Sep 2021 19:10:10 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.77.132.249])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 15 Sep 2021 19:10:10 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_F225E0ED-03A6-423F-BB15-CA369B1C4DC6"
Subject: Re: [EXTERNAL] [PATCH v2] ARM: dts: aspeed: rainier: Add N_MODE_VREF
 gpio
From: Adriana Kobylak <anoo@linux.ibm.com>
X-Priority: 3 (Normal)
In-Reply-To: <OFC8E57D8E.A167EBF7-ON00258751.001786E9-00258751.001CE2C3@ibm.com>
Date: Wed, 15 Sep 2021 14:10:08 -0500
Message-Id: <26DB52A3-A380-475E-B335-D866DDD0150E@linux.ibm.com>
References: <CACPK8Xd9MK6oZ=Ac85EkKn7vPvEfqjMKSk=73_R=_16US+6gHQ@mail.gmail.com>
 <20210910195417.2838841-1-anoo@linux.ibm.com>
 <CACPK8XfjF+aiEMLocscMEOw8ebKoT2MK8djvv4voyFOBjumXRg@mail.gmail.com>
 <23EB5226-63A1-45AF-A50E-2A9D6DABFC08@linux.ibm.com>
 <OFC8E57D8E.A167EBF7-ON00258751.001786E9-00258751.001CE2C3@ibm.com>
To: Milton Miller II <miltonm@us.ibm.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZOtGgVJ24DTA7mp3NotzCKPAGNU7om50
X-Proofpoint-ORIG-GUID: I0sVe0wRVpIsfmvbFyTwUUJf5Ff79XVu
X-Proofpoint-UnRewURL: 1 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 adultscore=0 phishscore=0 bulkscore=0 mlxlogscore=999 clxscore=1011
 malwarescore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109150102
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Adriana Kobylak <anoo@us.ibm.com>, Brandon Wyman <bjwyman@gmail.com>,
 Shawn McCarney <shawnmm@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_F225E0ED-03A6-423F-BB15-CA369B1C4DC6
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On Sep 15, 2021, at 12:15 AM, Milton Miller II <miltonm@us.ibm.com> wrote:
>=20
> On September 14, 2021, Joel Stanley wrote:
>> On Tue, 14 Sept 2021 at 20:46, Adriana Kobylak <anoo@linux.ibm.com>
>> wrote:
>>>> On Sep 14, 2021, at 3:49 AM, Joel Stanley <joel@jms.id.au> wrote:
>>>> On Fri, 10 Sept 2021 at 19:54, Adriana Kobylak
>>>> <anoo@linux.ibm.com> wrote:
>>>>>=20
>>>>> From: Adriana Kobylak <anoo@us.ibm.com>
>>>>>=20
>>>>> The N_MODE_VREF gpio is designed to be used to specify how many
>>>>> power
>>>>> supplies the system should have (2 or 4).  If enough power
>>>>> supplies fail
>>>>> so that the system no longer has redundancy (no longer n+1), the
>>>>> hardware will signal to the Onboard Chip Controller that the
>>>>> system may
>>>>> be oversubscribed, and performance may need to be reduced so the
>>>>> system
>>>>> can maintain it's powered on state. This gpio is on a 9552,
>>>>> populate all
>>>>> the gpios on that chip for completeness.
>>>>>=20
>>>>> Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
>>>>> ---
>>>>>=20
>>>>> v2: Update commit message.
>>>>>=20
>>>>> arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 103
>> +++++++++++++++++++
>>>>> 1 file changed, 103 insertions(+)
>>>>>=20
>>>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>>>>> index 6fd3ddf97a21..d5eea86dc260 100644
>>>>> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>>>>> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>>>>> @@ -1502,6 +1502,109 @@ eeprom@51 {
>>>>>               reg =3D <0x51>;
>>>>>       };
>>>>>=20
>>>>> +       pca_pres3: pca9552@60 {
>>>>> +               compatible =3D "nxp,pca9552";
>>>>> +               reg =3D <0x60>;
>>>>> +               #address-cells =3D <1>;
>>>>> +               #size-cells =3D <0>;
>>>>> +               gpio-controller;
>>>>> +               #gpio-cells =3D <2>;
>>>>> +
>>>>> +               gpio-line-names =3D
>>>>> +                       "",
>>>>> +                       "APSS_RESET_N",
>>>>> +                       "", "", "", "",
>>>>> +                       "P10_DCM0_PRES",
>>>>> +                       "P10_DCM1_PRES",
>>>>> +                       "", "",
>>>>> +                       "N_MODE_CPU_N",
>>>>> +                       "",
>>>>> +                       "PRESENT_VRM_DCM0_N",
>>>>> +                       "PRESENT_VRM_DCM1_N",
>>>>> +                       "N_MODE_VREF",
>>>>=20
>>>> Should any (all?) of these names be documented?
>>>>=20
>>>>=20
>> INVALID URI REMOVED <INVALID URI REMOVED>
>> mc_docs_blob_master_designs_device-2Dtree-2Dgpio-2Dnaming.md&d=3DDwIFaQ
>> &c=3Djf_iaSHvJObTbx-siA1ZOg&r=3Dbvv7AJEECoRKBU02rcu4F5DWd-EwX8As2xrXeO9ZS
>> o4&m=3DJzmffOJA0hX_vgi3n0P-A6l60imZToV7q1U2W2h6xt4&s=3D14_ACuQWMp-IFlhLQa
>> ejLVBN8XVgDnn1_l6336-FBG8&e=3D=20
>>>=20
>>> Not sure. Seems the openbmc doc is documenting the gpios for
>>> gpiochip0 only?
>=20
>> AIUI the document is for GPIOs that are exposed to userspace.
>>=20
>> It doesn't matter where they're coming from. If they are going to be
>> used by a libgpio application, they need to have names, and the names
>> should be documented where possible.
>>=20
>=20
> I agree which gpiochip is just a board wiring consideration and has=20
> no bearing on the documentation.
>=20
> However, in the introductory sections in the document clearly says=20
> the purpose is to establish naming for common (function) GPIOs, and
> the justification is by using consistent names across machines code=20
> will be able to be reused with little to no configuration.  In=20
> addition it mentions "common" GPIOs must be added to the document in=20
> the future.  So an evaluation should be made to the likelihood that=20
> such code reuse can be anticipated.
>=20
> Most of the names added in this patch are presence detect signals used
> to cross check VPD is read into inventory.   I'd expect any such uses to
> be configured in an inventory config file listing the name and where the
> FRU appears in the Dbus or Redfish model.  I'd argue the names for any=20
> such gpio would be beyond the present document scope.
>=20
> The one mentioned in the changelog, N_MODE_VREF, is intended to=20
> be relayed to the OCC, basically a power management controller in
> common in POWER processor chips.  I can see an argument to list this,
> but feel it would be in the OpenPOWER specific section unless the=20
> activation method is exposed in some method that would be common=20
> to other chipsets.

Thanks. I submitted a proposal to define N_MODE_VREF: https://gerrit.openbm=
c-project.xyz/c/openbmc/docs/+/46914 <https://gerrit.openbmc-project.xyz/c/=
openbmc/docs/+/46914>
Once the name is approved I=E2=80=99ll add just that one to the device tree=
, since the others are not going to be used.

>=20
>> ...documented in the openbmc design
>> doc, such as SLOT6_PRSNT_EN_RSVD, SLOT11_EXPANDER_PRSNT_N, etc.
>>=20
>> They should be fixed, if possible.
>=20
> The scope is clearly use reusable names going forward.  The technical
> debt from past naming can be brought down as new uses are added but
> we are not renaming every GPIO in every existing platform, and we don't
> have the review bandwidth to agree on common names should be added for
> all existing signals.
>=20
> milton


--Apple-Mail=_F225E0ED-03A6-423F-BB15-CA369B1C4DC6
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8"></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: s=
pace; line-break: after-white-space;" class=3D""><br class=3D""><div><br cl=
ass=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On Sep 15, 20=
21, at 12:15 AM, Milton Miller II &lt;<a href=3D"mailto:miltonm@us.ibm.com"=
 class=3D"">miltonm@us.ibm.com</a>&gt; wrote:</div><br class=3D"Apple-inter=
change-newline"><div class=3D""><meta charset=3D"UTF-8" class=3D""><span st=
yle=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font-size: 12px; fo=
nt-style: normal; font-variant-caps: normal; font-weight: normal; letter-sp=
acing: normal; text-align: start; text-indent: 0px; text-transform: none; w=
hite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text=
-decoration: none; float: none; display: inline !important;" class=3D"">On =
September 14, 2021, Joel Stanley wrote:</span><br style=3D"caret-color: rgb=
(0, 0, 0); font-family: Verdana; font-size: 12px; font-style: normal; font-=
variant-caps: normal; font-weight: normal; letter-spacing: normal; text-ali=
gn: start; text-indent: 0px; text-transform: none; white-space: normal; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" cla=
ss=3D""><blockquote type=3D"cite" style=3D"font-family: Verdana; font-size:=
 12px; font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px;=
 text-transform: none; white-space: normal; widows: auto; word-spacing: 0px=
; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-deco=
ration: none;" class=3D"">On Tue, 14 Sept 2021 at 20:46, Adriana Kobylak &l=
t;<a href=3D"mailto:anoo@linux.ibm.com" class=3D"">anoo@linux.ibm.com</a>&g=
t;<br class=3D"">wrote:<br class=3D""><blockquote type=3D"cite" class=3D"">=
<blockquote type=3D"cite" class=3D"">On Sep 14, 2021, at 3:49 AM, Joel Stan=
ley &lt;<a href=3D"mailto:joel@jms.id.au" class=3D"">joel@jms.id.au</a>&gt;=
 wrote:<br class=3D"">On Fri, 10 Sept 2021 at 19:54, Adriana Kobylak<br cla=
ss=3D"">&lt;<a href=3D"mailto:anoo@linux.ibm.com" class=3D"">anoo@linux.ibm=
.com</a>&gt; wrote:<br class=3D""><blockquote type=3D"cite" class=3D""><br =
class=3D"">From: Adriana Kobylak &lt;<a href=3D"mailto:anoo@us.ibm.com" cla=
ss=3D"">anoo@us.ibm.com</a>&gt;<br class=3D""><br class=3D"">The N_MODE_VRE=
F gpio is designed to be used to specify how many<br class=3D"">power<br cl=
ass=3D"">supplies the system should have (2 or 4). &nbsp;If enough power<br=
 class=3D"">supplies fail<br class=3D"">so that the system no longer has re=
dundancy (no longer n+1), the<br class=3D"">hardware will signal to the Onb=
oard Chip Controller that the<br class=3D"">system may<br class=3D"">be ove=
rsubscribed, and performance may need to be reduced so the<br class=3D"">sy=
stem<br class=3D"">can maintain it's powered on state. This gpio is on a 95=
52,<br class=3D"">populate all<br class=3D"">the gpios on that chip for com=
pleteness.<br class=3D""><br class=3D"">Signed-off-by: Adriana Kobylak &lt;=
<a href=3D"mailto:anoo@us.ibm.com" class=3D"">anoo@us.ibm.com</a>&gt;<br cl=
ass=3D"">---<br class=3D""><br class=3D"">v2: Update commit message.<br cla=
ss=3D""><br class=3D"">arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 103<b=
r class=3D""></blockquote></blockquote></blockquote>+++++++++++++++++++<br =
class=3D""><blockquote type=3D"cite" class=3D""><blockquote type=3D"cite" c=
lass=3D""><blockquote type=3D"cite" class=3D"">1 file changed, 103 insertio=
ns(+)<br class=3D""><br class=3D"">diff --git a/arch/arm/boot/dts/aspeed-bm=
c-ibm-rainier.dts<br class=3D""></blockquote></blockquote></blockquote>b/ar=
ch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts<br class=3D""><blockquote type=
=3D"cite" class=3D""><blockquote type=3D"cite" class=3D""><blockquote type=
=3D"cite" class=3D"">index 6fd3ddf97a21..d5eea86dc260 100644<br class=3D"">=
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts<br class=3D"">+++ b/arch=
/arm/boot/dts/aspeed-bmc-ibm-rainier.dts<br class=3D"">@@ -1502,6 +1502,109=
 @@ eeprom@51 {<br class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;reg =3D &lt;0x51&gt;;<br class=3D"">=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;};<br class=3D""><br class=3D"">+ &nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pca_pres3: pca9552@60 {<br class=3D"">+ &nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;compatible =3D "nxp,pca9552";<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;reg =3D &lt;0x6=
0&gt;;<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#address-cells =3D &lt;1&gt;;<br class=3D""=
>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;#size-cells =3D &lt;0&gt;;<br class=3D"">+ &nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;gpio-contro=
ller;<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#gpio-cells =3D &lt;2&gt;;<br class=3D"">+<b=
r class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;gpio-line-names =3D<br class=3D"">+ &nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"",<br class=3D"">+ &nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"APSS_RESET_N",<br class=3D"">+=
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"", "", "", "",<b=
r class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"P1=
0_DCM0_PRES",<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;"P10_DCM1_PRES",<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;"", "",<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"N_MODE_CPU_N",<br class=3D"">+ &nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"",<br class=3D"">+ &nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"PRESENT_VRM_DCM0_N",<br c=
lass=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"PRESE=
NT_VRM_DCM1_N",<br class=3D"">+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;"N_MODE_VREF",<br class=3D""></blockquote><br class=3D"">Shou=
ld any (all?) of these names be documented?<br class=3D""><br class=3D""><b=
r class=3D""></blockquote></blockquote><a href=3D"INVALID URI REMOVED" clas=
s=3D"">INVALID URI REMOVED</a><br class=3D"">mc_docs_blob_master_designs_de=
vice-2Dtree-2Dgpio-2Dnaming.md&amp;d=3DDwIFaQ<br class=3D"">&amp;c=3Djf_iaS=
HvJObTbx-siA1ZOg&amp;r=3Dbvv7AJEECoRKBU02rcu4F5DWd-EwX8As2xrXeO9ZS<br class=
=3D"">o4&amp;m=3DJzmffOJA0hX_vgi3n0P-A6l60imZToV7q1U2W2h6xt4&amp;s=3D14_ACu=
QWMp-IFlhLQa<br class=3D"">ejLVBN8XVgDnn1_l6336-FBG8&amp;e=3D<span class=3D=
"Apple-converted-space">&nbsp;</span><br class=3D""><blockquote type=3D"cit=
e" class=3D""><br class=3D"">Not sure. Seems the openbmc doc is documenting=
 the gpios for<br class=3D"">gpiochip0 only?<br class=3D""></blockquote></b=
lockquote><br style=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; fon=
t-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: n=
ormal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tr=
ansform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-=
width: 0px; text-decoration: none;" class=3D""><blockquote type=3D"cite" st=
yle=3D"font-family: Verdana; font-size: 12px; font-style: normal; font-vari=
ant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: aut=
o; text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; -w=
ebkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">AIUI the d=
ocument is for GPIOs that are exposed to userspace.<br class=3D""><br class=
=3D"">It doesn't matter where they're coming from. If they are going to be<=
br class=3D"">used by a libgpio application, they need to have names, and t=
he names<br class=3D"">should be documented where possible.<br class=3D""><=
br class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); font-fam=
ily: Verdana; font-size: 12px; font-style: normal; font-variant-caps: norma=
l; font-weight: normal; letter-spacing: normal; text-align: start; text-ind=
ent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span style=
=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font-size: 12px; font-=
style: normal; font-variant-caps: normal; font-weight: normal; letter-spaci=
ng: normal; text-align: start; text-indent: 0px; text-transform: none; whit=
e-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-de=
coration: none; float: none; display: inline !important;" class=3D"">I agre=
e which gpiochip is just a board wiring consideration and has<span class=3D=
"Apple-converted-space">&nbsp;</span></span><br style=3D"caret-color: rgb(0=
, 0, 0); font-family: Verdana; font-size: 12px; font-style: normal; font-va=
riant-caps: normal; font-weight: normal; letter-spacing: normal; text-align=
: start; text-indent: 0px; text-transform: none; white-space: normal; word-=
spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=
=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font-=
size: 12px; font-style: normal; font-variant-caps: normal; font-weight: nor=
mal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tran=
sform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-wi=
dth: 0px; text-decoration: none; float: none; display: inline !important;" =
class=3D"">no bearing on the documentation.</span><br style=3D"caret-color:=
 rgb(0, 0, 0); font-family: Verdana; font-size: 12px; font-style: normal; f=
ont-variant-caps: normal; font-weight: normal; letter-spacing: normal; text=
-align: start; text-indent: 0px; text-transform: none; white-space: normal;=
 word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;"=
 class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; f=
ont-size: 12px; font-style: normal; font-variant-caps: normal; font-weight:=
 normal; letter-spacing: normal; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; word-spacing: 0px; -webkit-text-strok=
e-width: 0px; text-decoration: none;" class=3D""><span style=3D"caret-color=
: rgb(0, 0, 0); font-family: Verdana; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;=
 float: none; display: inline !important;" class=3D"">However, in the intro=
ductory sections in the document clearly says<span class=3D"Apple-converted=
-space">&nbsp;</span></span><br style=3D"caret-color: rgb(0, 0, 0); font-fa=
mily: Verdana; font-size: 12px; font-style: normal; font-variant-caps: norm=
al; font-weight: normal; letter-spacing: normal; text-align: start; text-in=
dent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -w=
ebkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span styl=
e=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font-size: 12px; font=
-style: normal; font-variant-caps: normal; font-weight: normal; letter-spac=
ing: normal; text-align: start; text-indent: 0px; text-transform: none; whi=
te-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-d=
ecoration: none; float: none; display: inline !important;" class=3D"">the p=
urpose is to establish naming for common (function) GPIOs, and</span><br st=
yle=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font-size: 12px; fo=
nt-style: normal; font-variant-caps: normal; font-weight: normal; letter-sp=
acing: normal; text-align: start; text-indent: 0px; text-transform: none; w=
hite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text=
-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); fo=
nt-family: Verdana; font-size: 12px; font-style: normal; font-variant-caps:=
 normal; font-weight: normal; letter-spacing: normal; text-align: start; te=
xt-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0p=
x; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; disp=
lay: inline !important;" class=3D"">the justification is by using consisten=
t names across machines code<span class=3D"Apple-converted-space">&nbsp;</s=
pan></span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; fo=
nt-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; text-t=
ransform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke=
-width: 0px; text-decoration: none;" class=3D""><span style=3D"caret-color:=
 rgb(0, 0, 0); font-family: Verdana; font-size: 12px; font-style: normal; f=
ont-variant-caps: normal; font-weight: normal; letter-spacing: normal; text=
-align: start; text-indent: 0px; text-transform: none; white-space: normal;=
 word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; =
float: none; display: inline !important;" class=3D"">will be able to be reu=
sed with little to no configuration. &nbsp;In<span class=3D"Apple-converted=
-space">&nbsp;</span></span><br style=3D"caret-color: rgb(0, 0, 0); font-fa=
mily: Verdana; font-size: 12px; font-style: normal; font-variant-caps: norm=
al; font-weight: normal; letter-spacing: normal; text-align: start; text-in=
dent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -w=
ebkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span styl=
e=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font-size: 12px; font=
-style: normal; font-variant-caps: normal; font-weight: normal; letter-spac=
ing: normal; text-align: start; text-indent: 0px; text-transform: none; whi=
te-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-d=
ecoration: none; float: none; display: inline !important;" class=3D"">addit=
ion it mentions "common" GPIOs must be added to the document in<span class=
=3D"Apple-converted-space">&nbsp;</span></span><br style=3D"caret-color: rg=
b(0, 0, 0); font-family: Verdana; font-size: 12px; font-style: normal; font=
-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-al=
ign: start; text-indent: 0px; text-transform: none; white-space: normal; wo=
rd-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" cl=
ass=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; fo=
nt-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; text-t=
ransform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke=
-width: 0px; text-decoration: none; float: none; display: inline !important=
;" class=3D"">the future. &nbsp;So an evaluation should be made to the like=
lihood that<span class=3D"Apple-converted-space">&nbsp;</span></span><br st=
yle=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font-size: 12px; fo=
nt-style: normal; font-variant-caps: normal; font-weight: normal; letter-sp=
acing: normal; text-align: start; text-indent: 0px; text-transform: none; w=
hite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text=
-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); fo=
nt-family: Verdana; font-size: 12px; font-style: normal; font-variant-caps:=
 normal; font-weight: normal; letter-spacing: normal; text-align: start; te=
xt-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0p=
x; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; disp=
lay: inline !important;" class=3D"">such code reuse can be anticipated.</sp=
an><br style=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font-size:=
 12px; font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0,=
 0); font-family: Verdana; font-size: 12px; font-style: normal; font-varian=
t-caps: normal; font-weight: normal; letter-spacing: normal; text-align: st=
art; text-indent: 0px; text-transform: none; white-space: normal; word-spac=
ing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"=
"><span style=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none; float: none; display: inline !important;" clas=
s=3D"">Most of the names added in this patch are presence detect signals us=
ed</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font=
-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: no=
rmal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tra=
nsform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-w=
idth: 0px; text-decoration: none;" class=3D""><span style=3D"caret-color: r=
gb(0, 0, 0); font-family: Verdana; font-size: 12px; font-style: normal; fon=
t-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-a=
lign: start; text-indent: 0px; text-transform: none; white-space: normal; w=
ord-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; fl=
oat: none; display: inline !important;" class=3D"">to cross check VPD is re=
ad into inventory. &nbsp;&nbsp;I'd expect any such uses to</span><br style=
=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font-size: 12px; font-=
style: normal; font-variant-caps: normal; font-weight: normal; letter-spaci=
ng: normal; text-align: start; text-indent: 0px; text-transform: none; whit=
e-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-de=
coration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-=
family: Verdana; font-size: 12px; font-style: normal; font-variant-caps: no=
rmal; font-weight: normal; letter-spacing: normal; text-align: start; text-=
indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; display=
: inline !important;" class=3D"">be configured in an inventory config file =
listing the name and where the</span><br style=3D"caret-color: rgb(0, 0, 0)=
; font-family: Verdana; font-size: 12px; font-style: normal; font-variant-c=
aps: normal; font-weight: normal; letter-spacing: normal; text-align: start=
; text-indent: 0px; text-transform: none; white-space: normal; word-spacing=
: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><=
span style=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font-size: 1=
2px; font-style: normal; font-variant-caps: normal; font-weight: normal; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;" class=
=3D"">FRU appears in the Dbus or Redfish model. &nbsp;I'd argue the names f=
or any<span class=3D"Apple-converted-space">&nbsp;</span></span><br style=
=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font-size: 12px; font-=
style: normal; font-variant-caps: normal; font-weight: normal; letter-spaci=
ng: normal; text-align: start; text-indent: 0px; text-transform: none; whit=
e-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-de=
coration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-=
family: Verdana; font-size: 12px; font-style: normal; font-variant-caps: no=
rmal; font-weight: normal; letter-spacing: normal; text-align: start; text-=
indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; display=
: inline !important;" class=3D"">such gpio would be beyond the present docu=
ment scope.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Verd=
ana; font-size: 12px; font-style: normal; font-variant-caps: normal; font-w=
eight: normal; letter-spacing: normal; text-align: start; text-indent: 0px;=
 text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; text-decoration: none;" class=3D""><br style=3D"caret-c=
olor: rgb(0, 0, 0); font-family: Verdana; font-size: 12px; font-style: norm=
al; font-variant-caps: normal; font-weight: normal; letter-spacing: normal;=
 text-align: start; text-indent: 0px; text-transform: none; white-space: no=
rmal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: n=
one;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Ver=
dana; font-size: 12px; font-style: normal; font-variant-caps: normal; font-=
weight: normal; letter-spacing: normal; text-align: start; text-indent: 0px=
; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-tex=
t-stroke-width: 0px; text-decoration: none; float: none; display: inline !i=
mportant;" class=3D"">The one mentioned in the changelog, N_MODE_VREF, is i=
ntended to<span class=3D"Apple-converted-space">&nbsp;</span></span><br sty=
le=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font-size: 12px; fon=
t-style: normal; font-variant-caps: normal; font-weight: normal; letter-spa=
cing: normal; text-align: start; text-indent: 0px; text-transform: none; wh=
ite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-=
decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); fon=
t-family: Verdana; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; tex=
t-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; displ=
ay: inline !important;" class=3D"">be relayed to the OCC, basically a power=
 management controller in</span><br style=3D"caret-color: rgb(0, 0, 0); fon=
t-family: Verdana; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; tex=
t-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; letter-=
spacing: normal; text-align: start; text-indent: 0px; text-transform: none;=
 white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; te=
xt-decoration: none; float: none; display: inline !important;" class=3D"">c=
ommon in POWER processor chips. &nbsp;I can see an argument to list this,</=
span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0=
, 0, 0); font-family: Verdana; font-size: 12px; font-style: normal; font-va=
riant-caps: normal; font-weight: normal; letter-spacing: normal; text-align=
: start; text-indent: 0px; text-transform: none; white-space: normal; word-=
spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float:=
 none; display: inline !important;" class=3D"">but feel it would be in the =
OpenPOWER specific section unless the<span class=3D"Apple-converted-space">=
&nbsp;</span></span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Ve=
rdana; font-size: 12px; font-style: normal; font-variant-caps: normal; font=
-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0p=
x; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-te=
xt-stroke-width: 0px; text-decoration: none;" class=3D""><span style=3D"car=
et-color: rgb(0, 0, 0); font-family: Verdana; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: nor=
mal; text-align: start; text-indent: 0px; text-transform: none; white-space=
: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoratio=
n: none; float: none; display: inline !important;" class=3D"">activation me=
thod is exposed in some method that would be common<span class=3D"Apple-con=
verted-space">&nbsp;</span></span><br style=3D"caret-color: rgb(0, 0, 0); f=
ont-family: Verdana; font-size: 12px; font-style: normal; font-variant-caps=
: normal; font-weight: normal; letter-spacing: normal; text-align: start; t=
ext-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0=
px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><spa=
n style=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font-size: 12px=
; font-style: normal; font-variant-caps: normal; font-weight: normal; lette=
r-spacing: normal; text-align: start; text-indent: 0px; text-transform: non=
e; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" class=3D""=
>to other chipsets.</span><br style=3D"caret-color: rgb(0, 0, 0); font-fami=
ly: Verdana; font-size: 12px; font-style: normal; font-variant-caps: normal=
; font-weight: normal; letter-spacing: normal; text-align: start; text-inde=
nt: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; text-decoration: none;" class=3D""></div></bloc=
kquote><div><br class=3D""></div><div>Thanks. I submitted a proposal to def=
ine N_MODE_VREF: <a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/do=
cs/+/46914" class=3D"">https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/=
46914</a></div><div>Once the name is approved I=E2=80=99ll add just that on=
e to the device tree, since the others are not going to be used.</div><br c=
lass=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><br style=3D=
"caret-color: rgb(0, 0, 0); font-family: Verdana; font-size: 12px; font-sty=
le: normal; font-variant-caps: normal; font-weight: normal; letter-spacing:=
 normal; text-align: start; text-indent: 0px; text-transform: none; white-s=
pace: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decor=
ation: none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: Ve=
rdana; font-size: 12px; font-style: normal; font-variant-caps: normal; font=
-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-widt=
h: 0px; text-decoration: none;" class=3D"">...documented in the openbmc des=
ign<br class=3D"">doc, such as SLOT6_PRSNT_EN_RSVD, SLOT11_EXPANDER_PRSNT_N=
, etc.<br class=3D""><br class=3D"">They should be fixed, if possible.<br c=
lass=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); font-family:=
 Verdana; font-size: 12px; font-style: normal; font-variant-caps: normal; f=
ont-weight: normal; letter-spacing: normal; text-align: start; text-indent:=
 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit=
-text-stroke-width: 0px; text-decoration: none;" class=3D""><span style=3D"=
caret-color: rgb(0, 0, 0); font-family: Verdana; font-size: 12px; font-styl=
e: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; white-sp=
ace: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decora=
tion: none; float: none; display: inline !important;" class=3D"">The scope =
is clearly use reusable names going forward. &nbsp;The technical</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; letter-=
spacing: normal; text-align: start; text-indent: 0px; text-transform: none;=
 white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; te=
xt-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Verdana; font-size: 12px; font-style: normal; font-variant-cap=
s: normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; word-spacing: =
0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; di=
splay: inline !important;" class=3D"">debt from past naming can be brought =
down as new uses are added but</span><br style=3D"caret-color: rgb(0, 0, 0)=
; font-family: Verdana; font-size: 12px; font-style: normal; font-variant-c=
aps: normal; font-weight: normal; letter-spacing: normal; text-align: start=
; text-indent: 0px; text-transform: none; white-space: normal; word-spacing=
: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><=
span style=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font-size: 1=
2px; font-style: normal; font-variant-caps: normal; font-weight: normal; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;" class=
=3D"">we are not renaming every GPIO in every existing platform, and we don=
't</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; font=
-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: no=
rmal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tra=
nsform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-w=
idth: 0px; text-decoration: none;" class=3D""><span style=3D"caret-color: r=
gb(0, 0, 0); font-family: Verdana; font-size: 12px; font-style: normal; fon=
t-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-a=
lign: start; text-indent: 0px; text-transform: none; white-space: normal; w=
ord-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; fl=
oat: none; display: inline !important;" class=3D"">have the review bandwidt=
h to agree on common names should be added for</span><br style=3D"caret-col=
or: rgb(0, 0, 0); font-family: Verdana; font-size: 12px; font-style: normal=
; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; t=
ext-align: start; text-indent: 0px; text-transform: none; white-space: norm=
al; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: non=
e;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Verda=
na; font-size: 12px; font-style: normal; font-variant-caps: normal; font-we=
ight: normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-=
stroke-width: 0px; text-decoration: none; float: none; display: inline !imp=
ortant;" class=3D"">all existing signals.</span><br style=3D"caret-color: r=
gb(0, 0, 0); font-family: Verdana; font-size: 12px; font-style: normal; fon=
t-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-a=
lign: start; text-indent: 0px; text-transform: none; white-space: normal; w=
ord-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" c=
lass=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: Verdana; fon=
t-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: n=
ormal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tr=
ansform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-=
width: 0px; text-decoration: none;" class=3D""><span style=3D"caret-color: =
rgb(0, 0, 0); font-family: Verdana; font-size: 12px; font-style: normal; fo=
nt-variant-caps: normal; font-weight: normal; letter-spacing: normal; text-=
align: start; text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; f=
loat: none; display: inline !important;" class=3D"">milton</span></div></bl=
ockquote></div><br class=3D""></body></html>=

--Apple-Mail=_F225E0ED-03A6-423F-BB15-CA369B1C4DC6--

