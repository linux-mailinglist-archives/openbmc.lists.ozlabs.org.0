Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A14B355B
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2019 09:13:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46WyBK1hmmzF4VL
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2019 17:12:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=in.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=gkeishin@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Wy9f2wQdzF44m
 for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2019 17:12:15 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8G77SRd113530
 for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2019 03:12:11 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.74])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v252chdhr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2019 03:12:11 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <gkeishin@in.ibm.com>;
 Mon, 16 Sep 2019 07:12:10 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 16 Sep 2019 07:12:07 -0000
Received: from us1a3-mail113.a3.dal06.isc4sb.com ([10.146.6.4])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2019091607120702-160541 ;
 Mon, 16 Sep 2019 07:12:07 +0000 
MIME-Version: 1.0
In-Reply-To: <CAE33tLGtWJ-aJKRPt812zc1yj8TVBVxcSR1KX5_NznoVxJg7Fg@mail.gmail.com>
To: AKASH G J <akashgj91@gmail.com>
From: "George Keishing" <gkeishin@in.ibm.com>
Date: Mon, 16 Sep 2019 12:42:03 +0530
References: <CAE33tLGtWJ-aJKRPt812zc1yj8TVBVxcSR1KX5_NznoVxJg7Fg@mail.gmail.com>
X-KeepSent: 0AEE1426:28DFDF49-00258477:0027585E;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 10.0.1 November 29, 2018
X-LLNOutbound: False
X-Disclaimed: 39911
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=8FBB0EE4DFB4DECE8f9e8a93df938690918c8FBB0EE4DFB4DECE"
x-cbid: 19091607-3165-0000-0000-00000102DE5D
X-IBM-SpamModules-Scores: BY=0.035264; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.386041; ST=0; TS=0; UL=0; ISC=; MB=0.002348
X-IBM-SpamModules-Versions: BY=3.00011782; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000291; SDB=6.01262049; UDB=6.00667327; IPR=6.01043897; 
 MB=3.00028643; MTD=3.00000008; XFM=3.00000015; UTC=2019-09-16 07:12:09
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-09-16 02:31:01 - 6.00010412
x-cbparentid: 19091607-3166-0000-0000-00001C35E6F2
Message-Id: <OF0AEE1426.28DFDF49-ON00258477.0027585E-65258477.00278E77@notes.na.collabserv.com>
Subject: Re:  CurrentBMCState: BMCState.NotReady
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-16_04:, , signatures=0
X-Proofpoint-Spam-Reason: safe
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0__=8FBB0EE4DFB4DECE8f9e8a93df938690918c8FBB0EE4DFB4DECE
Content-type: multipart/alternative; 
	Boundary="1__=8FBB0EE4DFB4DECE8f9e8a93df938690918c8FBB0EE4DFB4DECE"


--1__=8FBB0EE4DFB4DECE8f9e8a93df938690918c8FBB0EE4DFB4DECE
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=ISO-8859-1


Probably the host services are still not up and started as per the log
there.

systemctl=A0list-jobs --no-pager | cat

You can check like that to see what services are pending to complete and
perhaps take the   journalctl=A0--no-pager    logs and see what services are
crashing out.

That should help where to look at.


Thanks and Regards,




From:	AKASH G J <akashgj91@gmail.com>
To:	openbmc@lists.ozlabs.org
Date:	16-09-2019 12:08
Subject:	[EXTERNAL] CurrentBMCState: BMCState.NotReady
Sent by:	"openbmc" <openbmc-bounces
            +gkeishin=3Din.ibm.com@lists.ozlabs.org>



Hi all,

root@s2600wf:~# cat /etc/os-release
ID=3D"openbmc-phosphor"
NAME=3D"Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)"
VERSION=3D"2.8.0-dev"
VERSION=5FID=3D"2.8.0-dev-309-g2e155a0-dirty"
PRETTY=5FNAME=3D"Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distr=
o)
2.8.0"
BUILD=5FID=3D"2.8.0-dev"
OPENBMC=5FTARGET=5FMACHINE=3D"s2600wf"

The BMC console shows that the BMC state is 'Not Ready'.

root@s2600wf:~# obmcutil state
CurrentBMCState =A0 =A0 : xyz.openbmc=5Fproject.State.BMC.BMCState.NotReady
CurrentPowerState =A0 : xyz.openbmc=5Fproject.State.Chassis.PowerState.Off
Error finding '/xyz/openbmc=5Fproject/state/host0' service: No such file or
directory


Regards,
Akash


--1__=8FBB0EE4DFB4DECE8f9e8a93df938690918c8FBB0EE4DFB4DECE
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=ISO-8859-1
Content-Disposition: inline

<html><body><p><font face=3D"Calibri">Probably the host services are still =
not up and started as per the log there.</font><br><br><i><font face=3D"Cal=
ibri">systemctl=A0list-jobs --no-pager | cat</font></i> <br><br><font size=
=3D"2">You can check like that to see what services are pending to complete=
 and perhaps take the   </font><font face=3D"Calibri">journalctl=A0--no-pag=
er</font> <font size=3D"2">   logs and see what services are crashing out. =
</font><br><br><font size=3D"2">That should help where to look at.</font><b=
r><br><br><b><font size=3D"2" color=3D"#0000FF">Thanks and Regards,</font><=
/b><br><br><br><img width=3D"16" height=3D"16" src=3D"cid:1=5F=5F=3D8FBB0EE=
4DFB4DECE8f9e8a93df938690918c8FB@" border=3D"0" alt=3D"Inactive hide detail=
s for AKASH G J ---16-09-2019 12:08:46---Hi all, root@s2600wf:~# cat /etc/o=
s-release"><font size=3D"2" color=3D"#424282">AKASH G J ---16-09-2019 12:08=
:46---Hi all, root@s2600wf:~# cat /etc/os-release</font><br><br><font size=
=3D"2" color=3D"#5F5F5F">From:        </font><font size=3D"2">AKASH G J &lt=
;akashgj91@gmail.com&gt;</font><br><font size=3D"2" color=3D"#5F5F5F">To:  =
      </font><font size=3D"2">openbmc@lists.ozlabs.org</font><br><font size=
=3D"2" color=3D"#5F5F5F">Date:        </font><font size=3D"2">16-09-2019 12=
:08</font><br><font size=3D"2" color=3D"#5F5F5F">Subject:        </font><fo=
nt size=3D"2">[EXTERNAL] CurrentBMCState: BMCState.NotReady</font><br><font=
 size=3D"2" color=3D"#5F5F5F">Sent by:        </font><font size=3D"2">&quot=
;openbmc&quot; &lt;openbmc-bounces+gkeishin=3Din.ibm.com@lists.ozlabs.org&g=
t;</font><br><hr width=3D"100%" size=3D"2" align=3D"left" noshade style=3D"=
color:#8091A5; "><br><br><br>Hi all,<br><br>root@s2600wf:~# cat /etc/os-rel=
ease <br>ID=3D&quot;openbmc-phosphor&quot;<br>NAME=3D&quot;Phosphor OpenBMC=
 (Phosphor OpenBMC Project Reference Distro)&quot;<br>VERSION=3D&quot;2.8.0=
-dev&quot;<br>VERSION=5FID=3D&quot;2.8.0-dev-309-g2e155a0-dirty&quot;<br>PR=
ETTY=5FNAME=3D&quot;Phosphor OpenBMC (Phosphor OpenBMC Project Reference Di=
stro) 2.8.0&quot;<br>BUILD=5FID=3D&quot;2.8.0-dev&quot;<br>OPENBMC=5FTARGET=
=5FMACHINE=3D&quot;s2600wf&quot;<br><br>The BMC console shows that the BMC =
state is '<b>Not Ready</b>'.<br><br>root@s2600wf:~# obmcutil state<br>Curre=
ntBMCState =A0 =A0 : xyz.openbmc=5Fproject.State.BMC.BMCState.NotReady<br>C=
urrentPowerState =A0 : xyz.openbmc=5Fproject.State.Chassis.PowerState.Off<b=
r>Error finding '/xyz/openbmc=5Fproject/state/host0' service: No such file =
or directory<br><br><br>Regards,<br>Akash<br><br><BR>
</body></html>

--1__=8FBB0EE4DFB4DECE8f9e8a93df938690918c8FBB0EE4DFB4DECE--


--0__=8FBB0EE4DFB4DECE8f9e8a93df938690918c8FBB0EE4DFB4DECE
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=8FBB0EE4DFB4DECE8f9e8a93df938690918c8FB@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=8FBB0EE4DFB4DECE8f9e8a93df938690918c8FBB0EE4DFB4DECE--

