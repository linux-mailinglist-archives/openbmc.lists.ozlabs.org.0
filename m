Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DA748BC70
	for <lists+openbmc@lfdr.de>; Wed, 12 Jan 2022 02:29:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYVN76QNhz2xBq
	for <lists+openbmc@lfdr.de>; Wed, 12 Jan 2022 12:29:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pb5rPCIS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Two or more type
 TXT spf records found.) smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pb5rPCIS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYVMZ2JqRz2xX8;
 Wed, 12 Jan 2022 12:28:57 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20BMxNM0006519; 
 Wed, 12 Jan 2022 01:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date : from
 : cc : to : content-type : mime-version : subject; s=pp1;
 bh=csUnf65UK6mPGGDdRv370RZvdzjBrePQKrCJuQagHGw=;
 b=pb5rPCISjQqCD1yp2oQGU5X84Zwiiv3p9VmraC1C5beCQ7JjnOMfbPy93lP6qXASDw/R
 0u4m4vbooOKMSMfXbgbcjc/K7qqpcnT/CjxkxSkVjdxtdhpGEze4QctVNLOc/T42dsE7
 2wXs8i8DQO8GodtQ3vyxr6K1dC+RDCmLp/YwNa2qgmiHepJTftDRwCS/ZqI41JMqcWoc
 hV70LhhIXQkQOhpmeDRjoLzpQUDwEKzw8tMB8UFKL6SPTzD1C9BcEeTZwSTXvCbcODBS
 OkMM5bPDgNAE1INx5h/4S5zE9srxNBPh1ChCm3pNRlZnBRx8qg+qPZxkivpjT58LReCL 1w== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dhdev258e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 01:28:40 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20C1IPa8022067;
 Wed, 12 Jan 2022 01:28:39 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma05wdc.us.ibm.com with ESMTP id 3df28b0xte-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 01:28:39 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20C1ScOw6947206
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 01:28:38 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F8A578066;
 Wed, 12 Jan 2022 01:28:38 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EEDA97805C;
 Wed, 12 Jan 2022 01:28:37 +0000 (GMT)
Received: from mww0332.dal12m.mail.ibm.com (unknown [9.208.69.80])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 12 Jan 2022 01:28:37 +0000 (GMT)
Message-ID: <OF56051358.C6261723-ON002587C8.00081CB9-1641950916512@ibm.com>
Date: Wed, 12 Jan 2022 01:28:36 +0000
From: "Milton Miller II" <miltonm@us.ibm.com>
To: "Zev Weiss" <zev@bewilderbeest.net>, "Joel Stanley" <joel@jms.id.au>
Content-Type: multipart/mixed;
 boundary="--_com.fiberlink.maas360.email_397748017531830"
X-MIMETrack: Itemize by traveler on TWW2043/03/G/IBM(Release 11.0.1FP2HF125 |
 November 22, 2021) at 01/12/2022 01:28:36
X-Mailer: Traveler 11.0.1.1 Build 202005211639_30 on server tww2043/03/G/IBM on
 behalf of device with id mdm...4a2, type 1300 (maas360android) and
 description MaaS360-MaaS360 Mail-Android:MaaS360-MaaS360 Mail-Android/7.70
 at 20220112012836663 by DS-7f4967a69700[SendMail]
X-KeepSent: 56051358:C6261723-002587C8:00081CB9; name=$KeepSent; type=4
X-Disclaimed: 51803
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: itov74uvdQBMeTWl4jVNqUTH7cXNa0W7
X-Proofpoint-ORIG-GUID: itov74uvdQBMeTWl4jVNqUTH7cXNa0W7
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
Subject: RE: [PATCH] ARM: dts: aspeed: Add ASRock ROMED8HM3 BMC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-11_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 mlxlogscore=999 spamscore=0 clxscore=1011 bulkscore=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120002
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 Andrew
 Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Olof Johansson <olof@lixom.net>, Anthony
 Jenkins <anthony.jenkins@privafy.com>, Neil
 Horman <neil.horman@privafy.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


----_com.fiberlink.maas360.email_397748017531830
Content-Type: multipart/alternative;
	 boundary="--_com.fiberlink.maas360.email_397748018473401"



----_com.fiberlink.maas360.email_397748018473401
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

My response tagged=20


-------- Original Message --------
From: Zev Weiss=20
Date: Tue, January 11, 2022 7:15 PM -0600
To: Joel Stanley=20
CC: devicetree , linux-aspeed , Arnd Bergmann , Andrew Jeffery , OpenBMC Ma=
illist , Linux Kernel Mailing List , Rob Herring , Neil Horman , Olof Johan=
sson , Anthony Jenkins , Linux ARM=20
Subject: [EXTERNAL] Re: [PATCH] ARM: dts: aspeed: Add ASRock ROMED8HM3 BMC


On Tue, Jan 11, 2022 at 02:59:28AM PST, Joel Stanley wrote:
>On Wed, 5 Jan 2022 at 23:10, Zev Weiss wrote:
>>
>> This is a half-width, single-socket Epyc server board with an AST2500
>> BMC.=C2=A0=C2=A0This device tree is sufficient for basic OpenBMC functio=
nality,
>> but we'll need to add a few more devices (as driver support becomes
>> available) before it's fully usable.
>>
>> Signed-off-by: Zev Weiss=20
>
>Reviewed-by: Joel Stanley=20
>

Thanks!

>Have you considered using the openbmc gpio naming scheme for the
>gpio-line-names?
>

I looked at it, but decided not to for a few reasons:

=C2=A0=C2=A0- For systems that are in the early stages of a porting effort =
(like=20
=C2=A0=C2=A0=C2=A0=C2=A0this one currently is), I'm still referring to hard=
ware schematics=20
=C2=A0=C2=A0=C2=A0=C2=A0fairly often, and using the same identifiers in sof=
tware that are=20
=C2=A0=C2=A0=C2=A0=C2=A0used in the schematics simplifies things by avoidin=
g an extra
=C2=A0=C2=A0=C2=A0=C2=A0translation step between the two.

=C2=A0=C2=A0- Most of the GPIO-related userspace components (that I'm deali=
ng with=20
=C2=A0=C2=A0=C2=A0=C2=A0anyway, e.g. x86-power-control and host-error-monit=
or) already have=20
=C2=A0=C2=A0=C2=A0=C2=A0their own GPIO line-name configuration/remapping me=
chanisms that need=20
=C2=A0=C2=A0=C2=A0=C2=A0to be set up anyway.

=C2=A0=C2=A0- There's a solid mix of GPIOs that would be covered by the nam=
ing=20
=C2=A0=C2=A0=C2=A0=C2=A0guidelines and others that aren't; having a mix of =
the two styles=20
=C2=A0=C2=A0=C2=A0=C2=A0seems a bit awkward to me.

That said, I sympathize with the motivation behind it and I'm not=20
vehemently opposed on the whole, so if there's a strong preference to=20
follow that scheme I could probably be talked into changing it.



Milton >=C2=A0=C2=A0Did this assessment take into consideration=20
Milton > https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/49863

Milton > is there something that could be improved?=20


Zev



----_com.fiberlink.maas360.email_397748018473401
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

My response tagged <br><br><br>-------- Original Message --------<br>From: =
Zev Weiss <zev@bewilderbeest.net><br>Date: Tue, January 11, 2022 7:15 PM -0=
600<br>To: Joel Stanley <joel@jms.id.au><br>CC: devicetree <devicetree@vger=
.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <=
arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc=
@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org=
>, Rob Herring <robh+dt@kernel.org>, Neil Horman <neil.horman@privafy.com>,=
 Olof Johansson <olof@lixom.net>, Anthony Jenkins <anthony.jenkins@privafy.=
com>, Linux ARM <linux-arm-kernel@lists.infradead.org><br>Subject: [EXTERNA=
L] Re: [PATCH] ARM: dts: aspeed: Add ASRock ROMED8HM3 BMC<br><br><br>On Tue=
, Jan 11, 2022 at 02:59:28AM PST, Joel Stanley wrote:<br>>On Wed, 5 Jan 202=
2 at 23:10, Zev Weiss <zev@bewilderbeest.net> wrote:<br>>><br>>> This is a =
half-width, single-socket Epyc server board with an AST2500<br>>> BMC.&nbsp=
;&nbsp;This device tree is sufficient for basic OpenBMC functionality,<br>>=
> but we'll need to add a few more devices (as driver support becomes<br>>>=
 available) before it's fully usable.<br>>><br>>> Signed-off-by: Zev Weiss =
<zev@bewilderbeest.net><br>><br>>Reviewed-by: Joel Stanley <joel@jms.id.au>=
<br>><br><br>Thanks!<br><br>>Have you considered using the openbmc gpio nam=
ing scheme for the<br>>gpio-line-names?<br>><br><br>I looked at it, but dec=
ided not to for a few reasons:<br><br>&nbsp;&nbsp;- For systems that are in=
 the early stages of a porting effort (like <br>&nbsp;&nbsp;&nbsp;&nbsp;thi=
s one currently is), I'm still referring to hardware schematics <br>&nbsp;&=
nbsp;&nbsp;&nbsp;fairly often, and using the same identifiers in software t=
hat are <br>&nbsp;&nbsp;&nbsp;&nbsp;used in the schematics simplifies thing=
s by avoiding an extra<br>&nbsp;&nbsp;&nbsp;&nbsp;translation step between =
the two.<br><br>&nbsp;&nbsp;- Most of the GPIO-related userspace components=
 (that I'm dealing with <br>&nbsp;&nbsp;&nbsp;&nbsp;anyway, e.g. x86-power-=
control and host-error-monitor) already have <br>&nbsp;&nbsp;&nbsp;&nbsp;th=
eir own GPIO line-name configuration/remapping mechanisms that need <br>&nb=
sp;&nbsp;&nbsp;&nbsp;to be set up anyway.<br><br>&nbsp;&nbsp;- There's a so=
lid mix of GPIOs that would be covered by the naming <br>&nbsp;&nbsp;&nbsp;=
&nbsp;guidelines and others that aren't; having a mix of the two styles <br=
>&nbsp;&nbsp;&nbsp;&nbsp;seems a bit awkward to me.<br><br>That said, I sym=
pathize with the motivation behind it and I'm not <br>vehemently opposed on=
 the whole, so if there's a strong preference to <br>follow that scheme I c=
ould probably be talked into changing it.<br><br><br><br>Milton >&nbsp;&nbs=
p;Did this assessment take into consideration <br> Milton > <a href=3D"http=
s://gerrit.openbmc-project.xyz/c/openbmc/docs/+/49863" target=3D"=5Fblank">=
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/49863</a><br><br>Milton=
 > is there something that could be improved? <br><br><br>Zev<br><br><BR>
<BR>

----_com.fiberlink.maas360.email_397748018473401--

----_com.fiberlink.maas360.email_397748017531830--

