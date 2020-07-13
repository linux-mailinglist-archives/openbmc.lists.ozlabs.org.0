Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C33421D273
	for <lists+openbmc@lfdr.de>; Mon, 13 Jul 2020 11:05:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B4yQl3LP5zDqW9
	for <lists+openbmc@lfdr.de>; Mon, 13 Jul 2020 19:05:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vishwa@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B4yN919jyzDqTj
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jul 2020 19:02:48 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06D91laA012277
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jul 2020 05:02:45 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3279kw4awp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jul 2020 05:02:45 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06D92LOZ014679
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jul 2020 05:02:44 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3279kw4avq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 05:02:44 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06D90ZLs031763;
 Mon, 13 Jul 2020 09:02:43 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 327527t0kf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 09:02:42 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06D92eAB61210762
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jul 2020 09:02:40 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C008AA405D;
 Mon, 13 Jul 2020 09:02:40 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E74C0A4057;
 Mon, 13 Jul 2020 09:02:39 +0000 (GMT)
Received: from [9.102.21.19] (unknown [9.102.21.19])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 13 Jul 2020 09:02:39 +0000 (GMT)
From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
Message-Id: <062A643D-06BA-4019-A075-80D5BB763172@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_BE22E946-C569-40E6-82A8-09CD1821509F"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: busctl call "led method" failed
Date: Mon, 13 Jul 2020 14:32:38 +0530
In-Reply-To: <HK2PR04MB38264AF28981EE1CCA3FBCA2FE600@HK2PR04MB3826.apcprd04.prod.outlook.com>
To: =?utf-8?B?5ZGoIOi/nOa4hQ==?= <zhouyuanqing8@outlook.com>
References: <HK2PR04MB38264AF28981EE1CCA3FBCA2FE600@HK2PR04MB3826.apcprd04.prod.outlook.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-13_04:2020-07-10,
 2020-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007130066
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
Cc: "uperic@163.com" <uperic@163.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_BE22E946-C569-40E6-82A8-09CD1821509F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi harley,

I am able to see it working. Please check if there was any typo etc.. =
journalctl would have the info

root@rain4bmc:~# busctl --verbose  call =
xyz.openbmc_project.LED.GroupManager =
/xyz/openbmc_project/led/groups/power_on org.freedesktop.DBus.Properties =
Get ss xyz.openbmc_project.Led.Group Asserted
MESSAGE "v" {
        VARIANT "b" {
                BOOLEAN false;
        };
};

root@rain4bmc:~# busctl --verbose  call =
xyz.openbmc_project.LED.GroupManager =
/xyz/openbmc_project/led/groups/power_on org.freedesktop.DBus.Properties =
Set ssv xyz.openbmc_project.Led.Group Asserted b true=20

root@rain4bmc:~# busctl --verbose  call =
xyz.openbmc_project.LED.GroupManager =
/xyz/openbmc_project/led/groups/power_on org.freedesktop.DBus.Properties =
Get ss xyz.openbmc_project.Led.Group Asserted
MESSAGE "v" {
        VARIANT "b" {
                BOOLEAN true;
        };
};

root@rain4bmc:~# busctl --verbose  call =
xyz.openbmc_project.LED.GroupManager =
/xyz/openbmc_project/led/groups/power_on org.freedesktop.DBus.Properties =
Set ssv xyz.openbmc_project.Led.Group Asserted b false

root@rain4bmc:~# busctl --verbose  call =
xyz.openbmc_project.LED.GroupManager =
/xyz/openbmc_project/led/groups/power_on org.freedesktop.DBus.Properties =
Get ss xyz.openbmc_project.Led.Group Asserted
MESSAGE "v" {
        VARIANT "b" {
                BOOLEAN false;
        };
};

root@rain4bmc:~#=20

Alternatively, you could use bustle set-property=20

busctl set-property xyz.openbmc_project.LED.GroupManager =
/xyz/openbmc_project/led/groups/power_on xyz.openbmc_project.Led.Group =
Asserted b true

busctl get-property xyz.openbmc_project.LED.GroupManager =
/xyz/openbmc_project/led/groups/power_on xyz.openbmc_project.Led.Group =
Asserted

Thanks,
!! Vishwa !!


> On 13-Jul-2020, at 2:07 PM, =E5=91=A8 =E8=BF=9C=E6=B8=85 =
<zhouyuanqing8@outlook.com> wrote:
>=20
> Hello everyone=EF=BC=8C
>=20
>          There are the following calls to busctl, it is normal to use =
the get command, but the set command prompts "Call failed: path or =
object not found", and no other log information is output through the =
journalctl command. Please take a look at how to locate this problem. =
Thank you=EF=BC=81
>=20
>=20
>  ~# busctl --verbose  call xyz.openbmc_project.LED.GroupManager =
/xyz/openbmc_project/led/groups/power_on org.freedesktop.DBus.Properties =
Get ss xyz.openbmc_project.Led.Group Asserted
> MESSAGE "v" {
>         VARIANT "b" {
>                 BOOLEAN false;
>         };
> };
>=20
>  ~# busctl --verbose  call xyz.openbmc_project.LED.GroupManager =
/xyz/openbmc_project/led/groups/power_on org.freedesktop.DBus.Properties =
Set ssv xyz.openbmc_project.Led.Group Asserted b true
> Call failed: path or object not found
>=20
> harley


--Apple-Mail=_BE22E946-C569-40E6-82A8-09CD1821509F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
line-break: after-white-space;" class=3D""><div class=3D"">Hi =
harley,</div><div class=3D""><br class=3D""></div><div class=3D"">I am =
able to see it working. Please check if there was any typo etc.. =
journalctl would have the info</div><div class=3D""><br =
class=3D""></div>root@rain4bmc:~# busctl --verbose &nbsp;call =
xyz.openbmc_project.LED.GroupManager =
/xyz/openbmc_project/led/groups/power_on org.freedesktop.DBus.Properties =
Get ss&nbsp;xyz.openbmc_project.Led.Group Asserted<br class=3D"">MESSAGE =
"v" {<br class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; VARIANT "b" {<br =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
BOOLEAN false;<br class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; };<br =
class=3D"">};<br class=3D""><br class=3D"">root@rain4bmc:~# busctl =
--verbose &nbsp;call xyz.openbmc_project.LED.GroupManager =
/xyz/openbmc_project/led/groups/power_on org.freedesktop.DBus.Properties =
Set ssv&nbsp;xyz.openbmc_project.Led.Group Asserted b true&nbsp;<div =
class=3D""><br class=3D"">root@rain4bmc:~# busctl --verbose &nbsp;call =
xyz.openbmc_project.LED.GroupManager =
/xyz/openbmc_project/led/groups/power_on org.freedesktop.DBus.Properties =
Get ss&nbsp;xyz.openbmc_project.Led.Group Asserted<br class=3D"">MESSAGE =
"v" {<br class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; VARIANT "b" {<br =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
BOOLEAN true;<br class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; };<br =
class=3D"">};<br class=3D""><br class=3D"">root@rain4bmc:~# busctl =
--verbose &nbsp;call xyz.openbmc_project.LED.GroupManager =
/xyz/openbmc_project/led/groups/power_on org.freedesktop.DBus.Properties =
Set ssv&nbsp;xyz.openbmc_project.Led.Group Asserted b false</div><div =
class=3D""><br class=3D"">root@rain4bmc:~# busctl --verbose &nbsp;call =
xyz.openbmc_project.LED.GroupManager =
/xyz/openbmc_project/led/groups/power_on org.freedesktop.DBus.Properties =
Get ss&nbsp;xyz.openbmc_project.Led.Group Asserted<br class=3D"">MESSAGE =
"v" {<br class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; VARIANT "b" {<br =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
BOOLEAN false;<br class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; };<br =
class=3D"">};<br class=3D""><br =
class=3D"">root@rain4bmc:~#&nbsp;</div><div class=3D""><br =
class=3D""></div><div class=3D"">Alternatively, you could use bustle =
set-property&nbsp;</div><div class=3D""><br class=3D""></div><div =
class=3D""><div style=3D"margin: 0px; font-stretch: normal; line-height: =
normal; color: rgb(59, 35, 34); background-color: rgb(215, 211, 183);" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">busctl set-property xyz.openbmc_project.LED.GroupManager =
/xyz/openbmc_project/led/groups/power_on xyz.openbmc_project.Led.Group =
Asserted b true</span></div></div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal; color: rgb(59, 35, 34); =
background-color: rgb(215, 211, 183);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D""><br =
class=3D""></span></div><div class=3D""><span style=3D"color: rgb(59, =
35, 34); background-color: rgb(215, 211, 183);" class=3D"">busctl =
get-property xyz.openbmc_project.LED.GroupManager =
/xyz/openbmc_project/led/groups/power_on xyz.openbmc_project.Led.Group =
Asserted</span></div><div class=3D""><br class=3D""></div><div =
class=3D"">Thanks,</div><div class=3D"">!! Vishwa !!</div><div =
class=3D""><br class=3D""></div><div class=3D""><br class=3D""><blockquote=
 type=3D"cite" class=3D"">On 13-Jul-2020, at 2:07 PM, =E5=91=A8 =E8=BF=9C=E6=
=B8=85 &lt;<a href=3D"mailto:zhouyuanqing8@outlook.com" =
class=3D"">zhouyuanqing8@outlook.com</a>&gt; wrote:<br class=3D""><br =
class=3D"">Hello everyone=EF=BC=8C<br class=3D""><br class=3D"">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;There are the following calls to busctl, it =
is normal to use the get command, but the set command prompts "Call =
failed: path or object not found", and no other log information is =
output through the journalctl command. Please take a look at&nbsp;how to =
locate this problem. Thank you=EF=BC=81<br class=3D""><br class=3D""><br =
class=3D"">&nbsp;~# busctl --verbose &nbsp;call =
xyz.openbmc_project.LED.GroupManager =
/xyz/openbmc_project/led/groups/power_on =
org.freedesktop.DBus.Properties&nbsp;Get&nbsp;ss =
xyz.openbmc_project.Led.Group Asserted<br class=3D"">MESSAGE "v" {<br =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; VARIANT "b" {<br class=3D"">&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; BOOLEAN false;<br =
class=3D"">&nbsp; &nbsp; &nbsp; &nbsp; };<br class=3D"">};<br =
class=3D""><br class=3D"">&nbsp;~# busctl --verbose &nbsp;call =
xyz.openbmc_project.LED.GroupManager =
/xyz/openbmc_project/led/groups/power_on =
org.freedesktop.DBus.Properties&nbsp;Set&nbsp;ssv =
xyz.openbmc_project.Led.Group Asserted b true<br class=3D"">Call failed: =
path or object not found<br class=3D""><br class=3D"">harley<br =
class=3D""></blockquote><br class=3D""></div></body></html>=

--Apple-Mail=_BE22E946-C569-40E6-82A8-09CD1821509F--

