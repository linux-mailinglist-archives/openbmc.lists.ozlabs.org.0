Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E39FA3ACF90
	for <lists+openbmc@lfdr.de>; Fri, 18 Jun 2021 17:56:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G63T14s6Hz3byd
	for <lists+openbmc@lfdr.de>; Sat, 19 Jun 2021 01:56:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i+GmdQdn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=i+GmdQdn; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G63Sl2VQmz3076
 for <openbmc@lists.ozlabs.org>; Sat, 19 Jun 2021 01:56:39 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15IFXH87076241; Fri, 18 Jun 2021 11:56:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : message-id :
 content-type : mime-version : subject : date : in-reply-to : cc : to :
 references; s=pp1; bh=mDOq4C6RxnBMtg4/HyjffkMmyycH3X7VVqeDUPdNkP8=;
 b=i+GmdQdn81uVJ7YGUbNNU0HURm/e/GdS77yjsXsN9VAtQmHRvG/yFPrc7j9F+FK3AQCv
 Ign/6p7uD55z7SluZKxlu7daojLD0TwkyFmk/inbkebiu3nipEgOJcNn9p8baDYlrN44
 NYOVrAq3ipmkH8GIKjHBody/4LdIdfQc6h6hMdtrBCFh3+zV7YmAXcbqTc0cSM+2mUfA
 FyABE+r3nfCfVeZiBSJHw+XluF04I6ph8QETvUh6bYx/MXldIjZF0Pj7SLSNG3jVMBJK
 /NsIc/MKT91lln1I1flyYXqka9Hg4nEDCfYAItBjTSi8tFyoerbjX+qTz9MVwSXiqHsg kg== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 398wxy1de4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 11:56:32 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15IFqPto024276;
 Fri, 18 Jun 2021 15:56:31 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 3980b9qekn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Jun 2021 15:56:31 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15IFuUj834603346
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Jun 2021 15:56:30 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5825FB2064;
 Fri, 18 Jun 2021 15:56:30 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C5FB3B205F;
 Fri, 18 Jun 2021 15:56:29 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.160.178.31])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 18 Jun 2021 15:56:29 +0000 (GMT)
From: Adriana Kobylak <anoo@linux.ibm.com>
Message-Id: <0F554355-BB64-4136-83BA-A226AFD09AE7@linux.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_EC7E3084-775A-4BAD-BE70-E24AC9158BA3"
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 0/2] Store default u-boot
 env in
Date: Fri, 18 Jun 2021 10:56:28 -0500
In-Reply-To: <d83a94d5-4e3e-4560-94d2-ea6f19b9e864@www.fastmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
References: <20210618024758.892642-1-joel@jms.id.au>
 <d83a94d5-4e3e-4560-94d2-ea6f19b9e864@www.fastmail.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Vbq6XXE7NusOSmhiZovKr1yFoLOXoUyx
X-Proofpoint-ORIG-GUID: Vbq6XXE7NusOSmhiZovKr1yFoLOXoUyx
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-18_07:2021-06-18,
 2021-06-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: OpenBMC <openbmc@lists.ozlabs.org>, Adriana Kobylak <anoo@us.ibm.com>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_EC7E3084-775A-4BAD-BE70-E24AC9158BA3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Jun 17, 2021, at 11:12 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
>=20
>=20
> On Fri, 18 Jun 2021, at 12:17, Joel Stanley wrote:
>> This patch adds the u-boot environment to the u-boot binary, and a =
build
>> fix for the new configuration that I have also sent upstream.
>>=20
>> We currently rely on the default environment being populated in the
>> image. This has the downside that if something corrupts the =
environment,
>> the system won't know how to boot itself.
>>=20
>> The ast2600_openbmc_mmc.txt is copied from
>> meta-aspeed/recipes-bsp/u-boot/files/u-boot-env-ast2600.txt.
>>=20
>> The downside of this approach is we would need to keep the files in
>> sync, or change the yocto tooling so the in-flash environment is
>> generated from this copy.
>=20
> I think we just go ahead with your approach here until such time that =
we get sick of having to manually fix things up. When we get sick of it =
we figure out how we want to solve the synchronisation problem. What you =
have here is at least a step in the right direction.

Agree we should get this change in, maintaining two files is a small =
price for being able to boot the BMC if the environment gets corrupted.
The u=E2=80=94boot recipe u-boot-aspeed-sdk_2019.04.bb is the one that =
installs the txt file into the environment partition, so I=E2=80=99d =
think it could grab the txt file from the u-boot source code instead. =
I=E2=80=99ll look at that after the u-boot changes are merged.


>=20
> Andrew


--Apple-Mail=_EC7E3084-775A-4BAD-BE70-E24AC9158BA3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Jun 17, 2021, at 11:12 PM, Andrew Jeffery &lt;<a =
href=3D"mailto:andrew@aj.id.au" class=3D"">andrew@aj.id.au</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><br =
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
class=3D"">On Fri, 18 Jun 2021, at 12:17, Joel Stanley wrote:</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: AvenirNext-Regular; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
AvenirNext-Regular; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">This patch adds the u-boot =
environment to the u-boot binary, and a build<br class=3D"">fix for the =
new configuration that I have also sent upstream.<br class=3D""><br =
class=3D"">We currently rely on the default environment being populated =
in the<br class=3D"">image. This has the downside that if something =
corrupts the environment,<br class=3D"">the system won't know how to =
boot itself.<br class=3D""><br class=3D"">The ast2600_openbmc_mmc.txt is =
copied from<br =
class=3D"">meta-aspeed/recipes-bsp/u-boot/files/u-boot-env-ast2600.txt.<br=
 class=3D""><br class=3D"">The downside of this approach is we would =
need to keep the files in<br class=3D"">sync, or change the yocto =
tooling so the in-flash environment is<br class=3D"">generated from this =
copy.<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: AvenirNext-Regular; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: AvenirNext-Regular; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">I think we just go ahead with your approach here until such =
time that we get sick of having to manually fix things up. When we get =
sick of it we figure out how we want to solve the synchronisation =
problem. What you have here is at least a step in the right =
direction.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
AvenirNext-Regular; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div>Agree we should get this change in, maintaining two =
files is a small price for being able to boot the BMC if the environment =
gets corrupted.</div><div>The u=E2=80=94boot =
recipe&nbsp;u-boot-aspeed-sdk_2019.04.bb is the one that installs the =
txt file into the environment partition, so I=E2=80=99d think it could =
grab the txt file from the u-boot source code instead. I=E2=80=99ll look =
at that after the u-boot changes are merged.</div><div><br =
class=3D""></div><div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: AvenirNext-Regular; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: AvenirNext-Regular; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Andrew</span></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_EC7E3084-775A-4BAD-BE70-E24AC9158BA3--

