Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCCB300DD5
	for <lists+openbmc@lfdr.de>; Fri, 22 Jan 2021 21:36:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMrdH0FhkzDsGv
	for <lists+openbmc@lfdr.de>; Sat, 23 Jan 2021 07:36:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UfbFx4Bv; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMrcC28ynzDrpk
 for <openbmc@lists.ozlabs.org>; Sat, 23 Jan 2021 07:35:18 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10MKWY06082623; Fri, 22 Jan 2021 15:35:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : message-id :
 content-type : mime-version : subject : date : in-reply-to : cc : to :
 references; s=pp1; bh=4xfVF9aHvFEK2jV1BNCTX3Uyc+ips2GXI+2uIwa4Grk=;
 b=UfbFx4BvGxBjLv2Xgn9UROkAnzAt5cEdArDS/85iyQi/tgsPmrui4JnvegDPzWL4xzuD
 XH2zV83rnxtVNMvPlrOusilEH/JMRSbzQcAD5aRlusa1BlzjsSgO6edQ6Txb8hwcwQeM
 sxRNqMRAwEV/FIA2KHZhFxz6+dk+5nrz7hUreUuDdvjhCsb52/suLzSX+UcxC7XpodGX
 NwIlzN+iI/4yScL70JZBWE1dwihsFLQpQ5p0+/11R4IMgaQ/wZ3wRR+vEdpsT18+vU8o
 3fgtxAys6r6m2yPFy3C2JuRZ9YDEf99AR7hOTSwjIGZTiU4MgK/rHK3DUWq48upmOcu2 0Q== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36856ds38n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 15:35:14 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10MKWvNZ007108;
 Fri, 22 Jan 2021 20:35:14 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 367k0sr245-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 20:35:13 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10MKZDK722807008
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jan 2021 20:35:13 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 345D82805C;
 Fri, 22 Jan 2021 20:35:13 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A94DF28059;
 Fri, 22 Jan 2021 20:35:12 +0000 (GMT)
Received: from [9.65.214.180] (unknown [9.65.214.180])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 22 Jan 2021 20:35:12 +0000 (GMT)
From: Adriana Kobylak <anoo@linux.ibm.com>
Message-Id: <6420B5F6-D830-4260-B582-B7E9745F954D@linux.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_F239B80A-C485-4BF5-AF3A-277A92B01477"
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: Add the ExtendedVersion to MANIFEST file and os-release
Date: Fri, 22 Jan 2021 14:32:55 -0600
In-Reply-To: <SN6PR01MB4973E83D23824C0F08258DA595A90@SN6PR01MB4973.prod.exchangelabs.com>
To: Chanh Nguyen OS <chanh@os.amperecomputing.com>
References: <SN6PR01MB4973E83D23824C0F08258DA595A90@SN6PR01MB4973.prod.exchangelabs.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-22_14:2021-01-22,
 2021-01-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101220102
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
Cc: Phong Vo <pvo@amperecomputing.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Thang Nguyen <thangqn@amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_F239B80A-C485-4BF5-AF3A-277A92B01477
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Chanh,

I don=E2=80=99t see any issues. I=E2=80=99d say go ahead and submit the =
changes to add this new field to the MANIFEST and os-release, with a =
value set to an empty string as default, which can then be filled in as =
needed for different systems that want it. Then the bmc-code-mgmt repo =
can use this new info to create the Extended Version d-bus object.

Thanks.

> On Jan 12, 2021, at 9:51 PM, Chanh Nguyen OS =
<chanh@os.amperecomputing.com> wrote:
>=20
> This Message Is =46rom an External Sender
> This message came from outside your organization.
>  <>Hi all,
>=20
> I'm supporting the ExtendedVersion in phosphor-bmc-code-mgmt. You can =
see more at =
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-bmc-code-mgmt/+/3940=
6 =
<https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-bmc-code-mgmt/+/394=
06>=20
>=20
> I would like to add the ExtendedVersion field to the MANIFEST and =
store at os-release. So, I send this mail to discuss the new field name =
and the value in MANIFEST, os-release. I suggest=20
>=20
> The new field name in MANIFEST is ExtendedVersion . It will like as:
> purpose=20
> version
> ExtendedVersion
> KeyType=20
> HashType
> MachineName
> The new field name in os-release is EXTENDED_VERSION=20
> ID
> NAME
> VERSION
> VERSION_ID
> PRETTY_NAME
> BUILD_ID
> OPENBMC_TARGET_MACHINE
> EXTENDED_VERSION
> The "ExtendedVersion" value will be similar to the "MACHINE" field. It =
is typically set in the =
openbmc/meta-*/meta-MACHINE/conf/local.conf.sample file.
> Please raise your ideas for this design!=20
>=20
> Thank you!
> Chanh


--Apple-Mail=_F239B80A-C485-4BF5-AF3A-277A92B01477
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Hi =
Chanh,<div class=3D""><br class=3D""></div><div class=3D"">I don=E2=80=99t=
 see any issues. I=E2=80=99d say go ahead and submit the changes to add =
this new field to the MANIFEST and os-release, with a value set to an =
empty string as default, which can then be filled in as needed for =
different systems that want it. Then the bmc-code-mgmt repo can use this =
new info to create the Extended Version d-bus object.</div><div =
class=3D""><br class=3D""></div><div class=3D"">Thanks.<br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Jan 12, 2021, at 9:51 PM, Chanh Nguyen OS &lt;<a =
href=3D"mailto:chanh@os.amperecomputing.com" =
class=3D"">chanh@os.amperecomputing.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><meta =
charset=3D"UTF-8" class=3D""><table width=3D"100%" bgcolor=3D"#9CA3A7" =
border=3D"0" cellspacing=3D"0" cellpadding=3D"16" style=3D"caret-color: =
rgb(0, 0, 0); font-family: AvenirNext-Regular; letter-spacing: normal; =
orphans: auto; text-indent: 0px; text-transform: none; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none; width: 1041px; =
border-top-left-radius: 4px; border-top-right-radius: 4px; =
border-bottom-right-radius: 4px; border-bottom-left-radius: 4px; =
margin-bottom: 16px;" class=3D""><tbody class=3D""><tr class=3D""><td =
align=3D"center" class=3D""><table class=3D"pfptMainWrapper" =
width=3D"100%" cellspacing=3D"0" cellpadding=3D"0" border=3D"0" =
align=3D"center" style=3D"width: 1009px;"><tbody class=3D""><tr =
class=3D""><td align=3D"center" valign=3D"top" =
style=3D"border-top-left-radius: 4px; border-top-right-radius: 4px; =
border-bottom-right-radius: 4px; border-bottom-left-radius: 4px;" =
class=3D""><table bgcolor=3D"#9CA3A7" width=3D"100%" cellspacing=3D"0" =
cellpadding=3D"0" border=3D"0" align=3D"center" style=3D"max-width: =
100%; width: 1009px;" class=3D""><tbody class=3D""><tr class=3D""><th =
class=3D"pfptTableColumnLeft" valign=3D"top" style=3D"width: 1009px; =
height: auto; font-weight: normal; padding: 0px;"><table width=3D"100%" =
cellspacing=3D"0" cellpadding=3D"0" style=3D"width: 1009px; height: =
auto; text-align: left; vertical-align: middle;" class=3D""><tbody =
class=3D""><tr class=3D""><td class=3D""><span class=3D"pfptTitle" =
style=3D"font-family: Roboto, Helvetica, Arial, sans-serif; font-weight: =
bold; font-size: 18px; line-height: 20px; display: block; margin-bottom: =
4px; word-wrap: normal;">This Message Is =46rom an External =
Sender</span></td></tr><tr class=3D""><td class=3D""><span =
class=3D"pfptSubtitle" style=3D"font-weight: normal; font-family: =
Roboto, Helvetica, Arial, sans-serif; font-size: 13px; line-height: =
16px; display: block; word-wrap: normal;">This message came from outside =
your =
organization.</span></td></tr></tbody></table></th></tr></tbody></table></=
td></tr></tbody></table></td></tr></tbody></table><div =
style=3D"font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; font-family: =
Calibri, Arial, Helvetica, sans-serif; font-size: 12pt;" class=3D""><a =
style=3D"caret-color: rgb(0, 0, 0); font-weight: 400; font-family: =
Times; font-size: 12px; orphans: 2; widows: 2; background-color: =
rgb(255, 255, 255);" class=3D""></a>Hi all,</div><div style=3D"font-style:=
 normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; font-family: Calibri, Arial, Helvetica, =
sans-serif; font-size: 12pt;" class=3D""><br class=3D""></div><div =
style=3D"font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; font-family: =
Calibri, Arial, Helvetica, sans-serif; font-size: 12pt;" class=3D"">I'm =
supporting the ExtendedVersion in&nbsp;phosphor-bmc-code-mgmt. You can =
see more at&nbsp;<a =
href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-bmc-code-mgm=
t/+/39406" id=3D"LPlnk408546" =
class=3D"">https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-bmc-code-=
mgmt/+/39406</a>&nbsp;</div><div style=3D"font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; font-family: Calibri, Arial, Helvetica, =
sans-serif; font-size: 12pt;" class=3D""><br class=3D""></div><div =
style=3D"font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; font-family: =
Calibri, Arial, Helvetica, sans-serif; font-size: 12pt;" class=3D""><span =
style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: =
12pt; background: var(--white);" class=3D"">I would like to add =
the&nbsp;</span><span style=3D"font-family: Calibri, Arial, Helvetica, =
sans-serif; font-size: 12pt;" class=3D"">ExtendedVersion&nbsp;field to =
the MANIFEST and store at os-release. So,&nbsp;</span><span =
style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: =
12pt; background: var(--white);" class=3D"">I send this mail to discuss =
the new field name and the value in MANIFEST,&nbsp;os-release. I =
suggest&nbsp;</span></div><div style=3D"font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; font-family: Calibri, Arial, Helvetica, =
sans-serif; font-size: 12pt;" class=3D""><span style=3D"caret-color: =
rgb(0, 0, 0); background-color: rgb(255, 255, 255); display: inline =
!important;" class=3D""><span class=3D"Apple-converted-space"><br =
class=3D""></span></span></div><div style=3D"caret-color: rgb(0, 0, 0); =
font-family: AvenirNext-Regular; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><ol class=3D""><li class=3D""><font =
face=3D"Calibri, Arial, Helvetica, sans-serif" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0);" class=3D"">The new field name =
in<span class=3D"Apple-converted-space">&nbsp;</span><b class=3D""><i =
class=3D"">MANIFEST</i></b><span =
class=3D"Apple-converted-space">&nbsp;</span>is&nbsp;<b class=3D""><i =
class=3D"">ExtendedVersion&nbsp;</i></b>. It will like as:<br =
class=3D""><span style=3D"color: rgb(33, 33, 33); font-family: =
&quot;Courier New&quot;, monospace; font-size: 14px; orphans: 2; widows: =
2; background: var(--white);" class=3D"">purpose&nbsp;</span><span =
style=3D"color: rgb(33, 33, 33); font-family: Roboto, -apple-system, =
system-ui, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif, =
&quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe =
UI Symbol&quot;; font-size: 14px; orphans: 2; widows: 2; background: =
var(--white);" class=3D""><br class=3D""></span></span></font><span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(33, 33, 33); font-family: =
&quot;Courier New&quot;, monospace; font-size: 14px; orphans: 2; widows: =
2; background: var(--white);" class=3D"">version</span><span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(33, 33, 33); font-family: =
Roboto, -apple-system, system-ui, &quot;Segoe UI&quot;, Helvetica, =
Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI =
Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 14px; orphans: 2; =
widows: 2; background: var(--white);" class=3D""><br =
class=3D""></span><span style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(33, 33, 33); font-family: &quot;Courier New&quot;, monospace; =
font-size: 14px; orphans: 2; widows: 2; background: var(--white);" =
class=3D"">ExtendedVersion</span><span style=3D"caret-color: rgb(0, 0, =
0); color: rgb(33, 33, 33); font-family: Roboto, -apple-system, =
system-ui, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif, =
&quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe =
UI Symbol&quot;; font-size: 14px; orphans: 2; widows: 2; background: =
var(--white);" class=3D""><br class=3D""></span><span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(33, 33, 33); font-family: =
&quot;Courier New&quot;, monospace; font-size: 14px; orphans: 2; widows: =
2; background: var(--white);" class=3D"">KeyType&nbsp;</span><span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(33, 33, 33); font-family: =
Roboto, -apple-system, system-ui, &quot;Segoe UI&quot;, Helvetica, =
Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI =
Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 14px; orphans: 2; =
widows: 2; background: var(--white);" class=3D""><br =
class=3D""></span><span style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(33, 33, 33); font-family: &quot;Courier New&quot;, monospace; =
font-size: 14px; orphans: 2; widows: 2; background: var(--white);" =
class=3D"">HashType</span><span style=3D"caret-color: rgb(0, 0, 0); =
color: rgb(33, 33, 33); font-family: Roboto, -apple-system, system-ui, =
&quot;Segoe UI&quot;, Helvetica, Arial, sans-serif, &quot;Apple Color =
Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;; =
font-size: 14px; orphans: 2; widows: 2; background: var(--white);" =
class=3D""><br class=3D""></span><span style=3D"caret-color: rgb(0, 0, =
0); color: rgb(33, 33, 33); font-family: &quot;Courier New&quot;, =
monospace; font-size: 14px; orphans: 2; widows: 2; background: =
var(--white);" class=3D"">MachineName</span><span style=3D"caret-color: =
rgb(0, 0, 0); color: rgb(33, 33, 33); font-family: Roboto, =
-apple-system, system-ui, &quot;Segoe UI&quot;, Helvetica, Arial, =
sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, =
&quot;Segoe UI Symbol&quot;; font-size: 14px; orphans: 2; widows: 2; =
background: var(--white);" class=3D""><br class=3D""></span></li><li =
class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
calibri, arial, helvetica, sans-serif; font-size: 12pt; =
background-color: rgb(255, 255, 255); line-height: normal; display: =
inline !important;" class=3D"">The new field name in<span =
class=3D"Apple-converted-space">&nbsp;</span><b class=3D""><i =
class=3D"">os-release</i></b><span =
class=3D"Apple-converted-space">&nbsp;</span>is&nbsp;<i =
style=3D"font-weight: bold;" class=3D"">EXTENDED_VERSION&nbsp;<br =
class=3D""></i></span><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: &quot;Courier New&quot;, monospace; font-size: 10pt; =
font-variant-caps: inherit; line-height: normal;" =
class=3D"">ID</span><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: calibri, arial, helvetica, sans-serif; font-size: 12pt; =
font-variant-caps: inherit;" class=3D""><br class=3D""></span><span =
style=3D"font-family: &quot;Courier New&quot;, monospace; font-size: =
10pt; background-color: rgba(0, 0, 0, 0); caret-color: rgb(0, 0, 0); =
line-height: normal;" class=3D"">NAME</span><span style=3D"font-family: =
Arial, Helvetica, sans-serif; font-size: 12pt; background-color: rgba(0, =
0, 0, 0); caret-color: rgb(0, 0, 0);" class=3D""><br =
class=3D""></span><span style=3D"font-family: &quot;Courier New&quot;, =
monospace; font-size: 10pt; background-color: rgba(0, 0, 0, 0); =
caret-color: rgb(0, 0, 0); line-height: normal;" =
class=3D"">VERSION</span><span style=3D"font-family: Arial, Helvetica, =
sans-serif; font-size: 12pt; background-color: rgba(0, 0, 0, 0); =
caret-color: rgb(0, 0, 0);" class=3D""><br class=3D""></span><span =
style=3D"font-family: &quot;Courier New&quot;, monospace; font-size: =
10pt; background-color: rgba(0, 0, 0, 0); caret-color: rgb(0, 0, 0); =
line-height: normal;" class=3D"">VERSION_ID</span><span =
style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; =
background-color: rgba(0, 0, 0, 0); caret-color: rgb(0, 0, 0);" =
class=3D""><br class=3D""></span><span style=3D"font-family: =
&quot;Courier New&quot;, monospace; font-size: 10pt; background-color: =
rgba(0, 0, 0, 0); caret-color: rgb(0, 0, 0); line-height: normal;" =
class=3D"">PRETTY_NAME</span><span style=3D"font-family: Arial, =
Helvetica, sans-serif; font-size: 12pt; background-color: rgba(0, 0, 0, =
0); caret-color: rgb(0, 0, 0);" class=3D""><br class=3D""></span><span =
style=3D"font-family: &quot;Courier New&quot;, monospace; font-size: =
10pt; background-color: rgba(0, 0, 0, 0); caret-color: rgb(0, 0, 0); =
line-height: normal;" class=3D"">BUILD_ID</span><span =
style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; =
background-color: rgba(0, 0, 0, 0); caret-color: rgb(0, 0, 0);" =
class=3D""><br class=3D""></span><span style=3D"font-family: =
&quot;Courier New&quot;, monospace; font-size: 10pt; background-color: =
rgba(0, 0, 0, 0); caret-color: rgb(0, 0, 0); line-height: normal;" =
class=3D"">OPENBMC_TARGET_MACHINE</span><span style=3D"font-family: =
Arial, Helvetica, sans-serif; font-size: 12pt; background-color: rgba(0, =
0, 0, 0); caret-color: rgb(0, 0, 0);" class=3D""><br =
class=3D""></span><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
&quot;Courier New&quot;, monospace; font-size: 10pt; background-color: =
rgba(0, 0, 0, 0); line-height: normal;" =
class=3D"">EXTENDED_VERSION</span></li><li class=3D""><span =
style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; =
line-height: normal;" class=3D"">The</span><span style=3D"font-family: =
Arial, Helvetica, sans-serif; font-size: 12pt; line-height: normal;" =
class=3D""><span style=3D"font-weight: 400; text-align: start; color: =
rgb(33, 33, 33); font-family: Arial, Helvetica, sans-serif; font-size: =
12pt; orphans: 2; widows: 2; line-height: normal; display: inline =
!important;" class=3D"">&nbsp;"ExtendedVersion" value will be similar to =
the "MACHINE" field. It is typically set in the =
openbmc/meta-*/meta-MACHINE/conf/local.conf.sample =
file.</span></span><br class=3D""></li></ol><div style=3D"orphans: 2; =
widows: 2;" class=3D""><font color=3D"#212121" face=3D"Arial, Helvetica, =
sans-serif" class=3D""><span style=3D"caret-color: rgb(33, 33, 33);" =
class=3D"">Please raise your ideas for this =
design!&nbsp;</span></font></div><div style=3D"orphans: 2; widows: 2;" =
class=3D""><font color=3D"#212121" face=3D"Arial, Helvetica, sans-serif" =
class=3D""><span style=3D"caret-color: rgb(33, 33, 33);" class=3D""><br =
class=3D""></span></font></div><div style=3D"orphans: 2; widows: 2;" =
class=3D""><font color=3D"#212121" face=3D"Arial, Helvetica, sans-serif" =
class=3D""><span style=3D"caret-color: rgb(33, 33, 33);" class=3D"">Thank =
you!</span></font></div></div><div style=3D"caret-color: rgb(0, 0, 0); =
font-family: AvenirNext-Regular; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; orphans: 2; widows: 2;" class=3D""><font =
color=3D"#212121" face=3D"Arial, Helvetica, sans-serif" class=3D""><span =
style=3D"caret-color: rgb(33, 33, 33);" =
class=3D"">Chanh</span></font></div></div></blockquote></div><br =
class=3D""></div></body></html>=

--Apple-Mail=_F239B80A-C485-4BF5-AF3A-277A92B01477--

