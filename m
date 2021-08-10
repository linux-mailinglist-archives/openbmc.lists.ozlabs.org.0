Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 225763E831C
	for <lists+openbmc@lfdr.de>; Tue, 10 Aug 2021 20:44:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GkhhF08Kxz30JP
	for <lists+openbmc@lfdr.de>; Wed, 11 Aug 2021 04:44:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GH8V1Brq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=abhishek.patel@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GH8V1Brq; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gkhgl1Gdmz2yXW
 for <openbmc@lists.ozlabs.org>; Wed, 11 Aug 2021 04:44:18 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17AIiBLI032150
 for <openbmc@lists.ozlabs.org>; Tue, 10 Aug 2021 14:44:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : date : message-id : content-transfer-encoding : content-type :
 references : mime-version; s=pp1;
 bh=vUXPJsv748CZdaYassTdSi2GYzhBxZJtLZiZpKWcTpk=;
 b=GH8V1BrqgOlT0KgT1KxU9Iiyx5dPKWitLHwUVaDfh81+mSx7MqEEBcAA96xQe8oLNkbC
 lsZkYRvKP22qcdUDqLqTWUbxOWlwWE35pbeU4gPfJgKd1EbYk0kcKoOuEB+wLQD8D1u1
 bTayRijoFgRcphB8ViW50ZAKAVTnayVgyEpKffcWDj1YDIPB5XFTGPJ7ft3iXKJxHTCf
 +Hiy3GbO0jXpLZlc1lgafAnLGVb0MMbLXKnPalhEbxo5rMtz2KyV96oSmeVQvHwE5404
 POac7xy2KLeBhhMjnY1koIViOWhWu525PmUKEUqe1ewNh22HRjWcuCZQBPwBjSSdsusE GA== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3abt970p2a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 10 Aug 2021 14:44:12 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17AIhQIN014670
 for <openbmc@lists.ozlabs.org>; Tue, 10 Aug 2021 18:44:01 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02wdc.us.ibm.com with ESMTP id 3aapjabsn9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 10 Aug 2021 18:44:01 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17AIi0UT20644250
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 10 Aug 2021 18:44:00 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF2E4AC077
 for <openbmc@lists.ozlabs.org>; Tue, 10 Aug 2021 18:44:00 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 823F8AC069
 for <openbmc@lists.ozlabs.org>; Tue, 10 Aug 2021 18:44:00 +0000 (GMT)
Received: from mww0571.wdc07m.mail.ibm.com (unknown [9.208.0.95])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Tue, 10 Aug 2021 18:44:00 +0000 (GMT)
In-Reply-To: 
Subject: bmcweb - Redfish - Fix permissions
From: "Abhishek Patel" <Abhishek.Patel@ibm.com>
To: openbmc@lists.ozlabs.org
Date: Tue, 10 Aug 2021 18:43:58 +0000
Message-ID: <OFB17B0ACB.6D25FB91-ON0025872D.006672CB-0025872D.0066E6FF@ibm.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Release 11.0.1FP2HF97   July 2, 2021
X-MIMETrack: Serialize by http on MWW0571/01/M/IBM at 08/10/2021 18:43:58,
 Serialize complete at 08/10/2021 18:43:58
X-KeepSent: B17B0ACB:6D25FB91-0025872D:006672CB; name=$KeepSent; type=4
X-Disclaimed: 29831
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2NHcpFCGJwocEg3GxEw2RK536AU_4HkJ
X-Proofpoint-GUID: 2NHcpFCGJwocEg3GxEw2RK536AU_4HkJ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-10_08:2021-08-10,
 2021-08-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=465 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108100121
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10pt" ><div class=3D"socmaildefaultfont" dir=
=3D"ltr" style=3D"font-family:Arial, Helvetica, sans-serif;font-size:10pt" =
><div dir=3D"ltr" style=3D"font-family:Arial, Helvetica, sans-serif;font-si=
ze:10pt" ><div dir=3D"ltr" ><div><span style=3D"color:#0e101a;" ><span styl=
e=3D"font-family:Arial,sans-serif;" ><span style=3D"font-size:10.0pt;" >Red=
fish defines a PrivilegeRegistry (</span></span></span><a href=3D"https://r=
edfish.dmtf.org/registries/Redfish=5F1.1.0=5FPrivilegeRegistry.json" style=
=3D"outline:none;" target=3D"=5Fblank" ><span style=3D"color:#4a6ee0;" ><sp=
an data-preserver-spaces=3D"true" style=3D"outline:none;" >https://redfish.=
dmtf.org/registries/Redfish=5F1.1.0=5FPrivilegeRegistry.json</span></span><=
/a><span data-preserver-spaces=3D"true" style=3D"outline:none;" >). This Pr=
ivilege Registry defines which privilege(s) are needed to access the URI. T=
here was work here by Ed to have bmcweb automatically use this PrivilegeReg=
istry,&nbsp;</span><a href=3D"https://github.com/openbmc/bmcweb/commit/ed39=
82131dcef2b499da36e674d2d21b2289ef29" style=3D"outline:none;" target=3D"=5F=
blank" ><span style=3D"color:#4a6ee0;" ><span data-preserver-spaces=3D"true=
" style=3D"outline:none;" >https://github.com/openbmc/bmcweb/commit/ed39821=
31dcef2b499da36e674d2d21b2289ef29</span></span></a><span data-preserver-spa=
ces=3D"true" style=3D"outline:none;" >. The commits below change bmcweb to =
match the PrivilegeRegistry. They include two breaking Operator role change=
s (3 and 4).</span></div>
<div>&nbsp;</div>
<div><span data-preserver-spaces=3D"true" style=3D"outline:none;" ><span st=
yle=3D"color:#0e101a;" ><span style=3D"font-family:Arial,sans-serif;" ><spa=
n style=3D"font-size:10.0pt;" >1) Fix Log=5Fservices privileges</span></spa=
n></span></span></div>
<div><span style=3D"color:#0e101a;" ><span style=3D"font-family:Arial,sans-=
serif;" ><span style=3D"font-size:10.0pt;" ><a href=3D"https://gerrit.openb=
mc-project.xyz/c/openbmc/bmcweb/+/45125" style=3D"outline:none;" target=3D"=
=5Fblank" ><span style=3D"color:#4a6ee0;" ><span data-preserver-spaces=3D"t=
rue" style=3D"outline:none;" >https://gerrit.openbmc-project.xyz/c/openbmc/=
bmcweb/+/45125</span></span></a></span></span></span></div>
<div><span data-preserver-spaces=3D"true" style=3D"outline:none;" ><span st=
yle=3D"color:#0e101a;" ><span style=3D"font-family:Arial,sans-serif;" ><spa=
n style=3D"font-size:10.0pt;" >This change allows Admin, Operator, and Read=
only users to access Crashdump data and related entries. Before this change=
, only an admin role user could access Crashdump data and related entries (=
LogService, LogEntryCollection, and LogEntry). Operator users only had&nbsp=
;access to log entries(LogEntry).&nbsp;</span></span></span></span></div>
<div>&nbsp;</div>
<div><span data-preserver-spaces=3D"true" style=3D"outline:none;" ><span st=
yle=3D"color:#0e101a;" ><span style=3D"font-family:Arial,sans-serif;" ><spa=
n style=3D"font-size:10.0pt;" >2) Fix BIOS privileges</span></span></span><=
/span></div>
<div><span style=3D"color:#0e101a;" ><span style=3D"font-family:Arial,sans-=
serif;" ><span style=3D"font-size:10.0pt;" ><a href=3D"https://gerrit.openb=
mc-project.xyz/c/openbmc/bmcweb/+/45470" style=3D"outline:none;" target=3D"=
=5Fblank" ><span style=3D"color:#4a6ee0;" ><span data-preserver-spaces=3D"t=
rue" style=3D"outline:none;" >https://gerrit.openbmc-project.xyz/c/openbmc/=
bmcweb/+/45470</span></span></a></span></span></span></div>
<div><span data-preserver-spaces=3D"true" style=3D"outline:none;" ><span st=
yle=3D"color:#0e101a;" ><span style=3D"font-family:Arial,sans-serif;" ><spa=
n style=3D"font-size:10.0pt;" >This change allows Admin and operator users =
to Reset bios. Before this change, only an admin role user had that privile=
ge.</span></span></span></span></div>
<div>&nbsp;</div>
<div><strong style=3D"outline:none;" ><span data-preserver-spaces=3D"true" =
style=3D"outline:none;" ><span style=3D"color:#0e101a;" ><span style=3D"fon=
t-family:Arial,sans-serif;" ><span style=3D"font-size:10.0pt;" >Note:</span=
></span></span></span></strong><span data-preserver-spaces=3D"true" style=
=3D"outline:none;" ><span style=3D"color:#0e101a;" ><span style=3D"font-fam=
ily:Arial,sans-serif;" ><span style=3D"font-size:10.0pt;" >&nbsp;Above 1) a=
nd 2) changes are backward compatible because that change does not restrict=
 any original user from access.</span></span></span></span></div>
<div>&nbsp;</div>
<div><span data-preserver-spaces=3D"true" style=3D"outline:none;" ><span st=
yle=3D"color:#0e101a;" ><span style=3D"font-family:Arial,sans-serif;" ><spa=
n style=3D"font-size:10.0pt;" >3) Fix certificate=5Fservice privileges</spa=
n></span></span></span></div>
<div><span style=3D"color:#0e101a;" ><span style=3D"font-family:Arial,sans-=
serif;" ><span style=3D"font-size:10.0pt;" ><a href=3D"https://gerrit.openb=
mc-project.xyz/c/openbmc/bmcweb/+/45470" style=3D"outline:none;" target=3D"=
=5Fblank" ><span style=3D"color:#4a6ee0;" ><span data-preserver-spaces=3D"t=
rue" style=3D"outline:none;" >https://gerrit.openbmc-project.xyz/c/openbmc/=
bmcweb/+/45470</span></span></a></span></span></span></div>
<div><span data-preserver-spaces=3D"true" style=3D"outline:none;" ><span st=
yle=3D"color:#0e101a;" ><span style=3D"font-family:Arial,sans-serif;" ><spa=
n style=3D"font-size:10.0pt;" >This change allows only Admin users to Gener=
ate CSR certificates and restrict Operator users.</span></span></span></spa=
n></div>
<div>&nbsp;</div>
<div><span data-preserver-spaces=3D"true" style=3D"outline:none;" ><span st=
yle=3D"color:#0e101a;" ><span style=3D"font-family:Arial,sans-serif;" ><spa=
n style=3D"font-size:10.0pt;" >4) Fix Ethernet privileges</span></span></sp=
an></span></div>
<div><span style=3D"color:#0e101a;" ><span style=3D"font-family:Arial,sans-=
serif;" ><span style=3D"font-size:10.0pt;" ><a href=3D"https://gerrit.openb=
mc-project.xyz/c/openbmc/bmcweb/+/45469" style=3D"outline:none;" target=3D"=
=5Fblank" ><span style=3D"color:#4a6ee0;" ><span data-preserver-spaces=3D"t=
rue" style=3D"outline:none;" >https://gerrit.openbmc-project.xyz/c/openbmc/=
bmcweb/+/45469</span></span></a></span></span></span></div>
<div><span data-preserver-spaces=3D"true" style=3D"outline:none;" ><span st=
yle=3D"font-family:Arial,sans-serif;" ><span style=3D"font-size:10.0pt;" >T=
his change allows only Admin&nbsp;</span></span><span style=3D"outline:none=
;" ><span data-preserver-spaces=3D"true" style=3D"outline:none;background-a=
ttachment:scroll;background-position-x:0%;background-position-y:0%;" >users=
&nbsp;</span></span><span data-preserver-spaces=3D"true" style=3D"outline:n=
one;" >to post, patch, and delete on VLAN Network Interface Collection and =
restrict Operator users. Same for the EthernetInterfaces patch method.</spa=
n></span></div>
<div>&nbsp;</div>
<div><strong style=3D"outline:none;" ><span data-preserver-spaces=3D"true" =
style=3D"outline:none;" ><span style=3D"color:#0e101a;" ><span style=3D"fon=
t-family:Arial,sans-serif;" ><span style=3D"font-size:10.0pt;" >Note:</span=
></span></span></span></strong><span data-preserver-spaces=3D"true" style=
=3D"outline:none;" ><span style=3D"color:#0e101a;" ><span style=3D"font-fam=
ily:Arial,sans-serif;" ><span style=3D"font-size:10.0pt;" >&nbsp;Above 3) a=
nd 4) change are&nbsp;</span></span></span><strong style=3D"outline:none;" =
><span data-preserver-spaces=3D"true" style=3D"outline:none;" ><span style=
=3D"font-family:Arial,sans-serif;" >not</span></span></strong>&nbsp;<strong=
 style=3D"outline:none;" ><span data-preserver-spaces=3D"true" style=3D"out=
line:none;" ><span style=3D"font-family:Arial,sans-serif;" >backward compat=
ible</span></span></strong><span data-preserver-spaces=3D"true" style=3D"ou=
tline:none;" >&nbsp;because it restricts Operator user from its ability. Do=
es this break anyone? Is anyone opposed to these changes?</span></span></di=
v>
<div>&nbsp;</div></div></div></div></div><BR>
<BR>
