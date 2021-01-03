Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CB42E8D48
	for <lists+openbmc@lfdr.de>; Sun,  3 Jan 2021 17:45:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D84Px3QkQzDqGh
	for <lists+openbmc@lfdr.de>; Mon,  4 Jan 2021 03:45:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UtLJ8SBQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D84Nx0kk3zDqGQ
 for <openbmc@lists.ozlabs.org>; Mon,  4 Jan 2021 03:44:47 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 103GUxHv183356
 for <openbmc@lists.ozlabs.org>; Sun, 3 Jan 2021 11:44:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to :
 mime-version : content-type : message-id : subject; s=pp1;
 bh=z7ygxqeISqYpozQx9AFOvfIOeXv/ot0vnG9nd002r9w=;
 b=UtLJ8SBQbF5+RuGp4ckU1ZKyJ+0mzWz1BpW5oijSsD0tBwpU4+3JxhDYHtOUX059Xd1J
 H9dj+jl91eyN5bixfIJagC4Gb+mL2a9xRBGDX3uB6WV2nDbHBJEekMYVotzEV+PaSQxs
 D+GYaY4obr+Ep4qvma/aIULe0CoRbip8w/x1ccgRdSlcbu5TOnVJ6in4sx2ozh9QY0bU
 YwsRTGO/BUsMWpwOOP6+0rw+msYy/oCfLu8dDn3IyMMufjoihiDNywlT/Z+ftXkPBwg/
 oUNAK/4P0nnrXqKgh5fwvWtQ19DVDDkUgYFHeaw/YS6K5t1r0Kzj8pz1hKWSw+Ta8Zw3 GA== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.93])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35ug29h7ch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sun, 03 Jan 2021 11:44:43 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Sun, 3 Jan 2021 16:44:42 -0000
Received: from us1a3-smtp07.a3.dal06.isc4sb.com (10.146.103.14)
 by smtp.notes.na.collabserv.com (10.106.227.39) with
 smtp.notes.na.collabserv.com ESMTP; Sun, 3 Jan 2021 16:44:40 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp07.a3.dal06.isc4sb.com
 with ESMTP id 2021010316443953-204575 ;
 Sun, 3 Jan 2021 16:44:39 +0000 
Date: Sun, 3 Jan 2021 16:44:40 +0000
From: "Milton Miller II" <miltonm@us.ibm.com>
To: "Thu Nguyen" <thu@amperemail.onmicrosoft.com>, "openbmc"
 <openbmc@lists.ozlabs.org>
MIME-Version: 1.0
X-Mailer: IBM Traveler 10.0.1.2 Build 202002141540_20 on behalf of device with
 id
 mdm...eb5, type 1300 (maas360android) and description MaaS360-MaaS360
 Mail-Android:MaaS360-MaaS360 Mail-Android/7.21 at 20210103164440415 by
 DS-7f64184a6700[SendMail]
X-KeepSent: 1171F140:21EF2A71-00258652:005BFA8E;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 40499
X-TNEFEvaluated: 1
Content-Type: multipart/mixed;
 boundary="--_com.fiberlink.maas360.email_2293627634267232"
x-cbid: 21010316-8889-0000-0000-0000045510F7
X-IBM-SpamModules-Scores: BY=0.000659; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.373977; ST=0; TS=0; UL=0; ISC=; MB=0.013059
X-IBM-SpamModules-Versions: BY=3.00014487; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01487640; UDB=6.00802050; IPR=6.01270211; 
 MB=3.00035727; MTD=3.00000008; XFM=3.00000015; UTC=2021-01-03 16:44:41
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2021-01-03 16:00:40 - 6.00012192
x-cbparentid: 21010316-8890-0000-0000-0000AE78116D
Message-Id: <OF1171F140.21EF2A71-ON00258652.005BFA8E-1609692280165@notes.na.collabserv.com>
Subject: Re:  NC-SI driver: Detect OCP module power down!
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-03_07:2020-12-31,
 2021-01-03 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
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


----_com.fiberlink.maas360.email_2293627634267232
Content-Type: multipart/alternative;
	 boundary="--_com.fiberlink.maas360.email_2293627634931293"



----_com.fiberlink.maas360.email_2293627634931293
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=utf-8

January 03, 2021 8:45 AM Thu Nguyen wrote and miltonm@us.ibm.com responded:=
=0A=0AIn our test platform, BMC boot up with NC-SI module is plugged and =
=0Apowered. NC-SI interface (eth0) is up and worked well.=0A=0AThen the pow=
er of NC-SI module is power off. NC-SI driver can't detect =0Athis state.=
=0A=0ABMC console keeps print:=0A=0A[ 1780.411126] ftgmac100 1e660000.ether=
net eth0: NCSI Channel 0 timed out!=0A=0A[ 1785.579455] ftgmac100 1e660000.=
ethernet eth0: NCSI: No channel with =0Alink found, configuring channel 0=
=0A=0A[ 1802.253375] ftgmac100 1e660000.ethernet eth0: NCSI Channel 0 timed=
 out!=0A=0A[ 1807.501456] ftgmac100 1e660000.ethernet eth0: NCSI: No channe=
l with =0Alink found, configuring channel 0=0A=0ALook at the ncs-manager.c =
code, it seems if a channel of NC-SI module is =0Atime out its' monitor=5Fs=
tate will be disabled, the link will be down then =0Athe driver will go to =
next channel.=0A=0ABut if all of channels of NC-SI module are down. The dri=
ver will reset =0Athe monitor=5Fstate of all channels and check their state=
s again.=0A=0AMilton> The NCSI specification explicitly says that power to =
the nics and the controller must be synchronized.=C2=A0 =C2=A0=0A=0A=0ADo w=
e have any mechanism to detect power off state of NC-SI module?=0A=0AMilton=
> No, but the state machines will reset if you ifconfig down the interface.=
=0A=0AHow about hot plug NC-SI module?=0A=0A=0ARegards.=0A=0AThu Nguyen.=0A=
=0A=0A=0A=0A=0A=0A

----_com.fiberlink.maas360.email_2293627634931293
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=utf-8

January 03, 2021 8:45 AM Thu Nguyen wrote and <a href=3D"mailto:miltonm@us.=
ibm.com">miltonm@us.ibm.com</a> responded:<br><br>In our test platform, BMC=
 boot up with NC-SI module is plugged and <br>powered. NC-SI interface (eth=
0) is up and worked well.<br><br>Then the power of NC-SI module is power of=
f. NC-SI driver can't detect <br>this state.<br><br>BMC console keeps print=
:<br><br>[ 1780.411126] ftgmac100 1e660000.ethernet eth0: NCSI Channel 0 ti=
med out!<br><br>[ 1785.579455] ftgmac100 1e660000.ethernet eth0: NCSI: No c=
hannel with <br>link found, configuring channel 0<br><br>[ 1802.253375] ftg=
mac100 1e660000.ethernet eth0: NCSI Channel 0 timed out!<br><br>[ 1807.5014=
56] ftgmac100 1e660000.ethernet eth0: NCSI: No channel with <br>link found,=
 configuring channel 0<br><br>Look at the ncs-manager.c code, it seems if a=
 channel of NC-SI module is <br>time out its' monitor=5Fstate will be disab=
led, the link will be down then <br>the driver will go to next channel.<br>=
<br>But if all of channels of NC-SI module are down. The driver will reset =
<br>the monitor=5Fstate of all channels and check their states again.<br><b=
r>Milton> The NCSI specification explicitly says that power to the nics and=
 the controller must be synchronized.=C2=A0 =C2=A0<br><br><br>Do we have an=
y mechanism to detect power off state of NC-SI module?<br><br>Milton> No, b=
ut the state machines will reset if you ifconfig down the interface.<br><br=
>How about hot plug NC-SI module?<br><br><br>Regards.<br><br>Thu Nguyen.<br=
><br><br><br><br><br><br><BR>

----_com.fiberlink.maas360.email_2293627634931293--

----_com.fiberlink.maas360.email_2293627634267232--

