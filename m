Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B78D31D27DF
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 08:31:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49N1sN5v1yzDqX0
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 16:31:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=prkatti1@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49N1rH4nChzDqS4
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 16:30:33 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04E6250H142001
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 02:30:29 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.73])
 by mx0b-001b2d01.pphosted.com with ESMTP id 310x51bx90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 02:30:29 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <prkatti1@in.ibm.com>;
 Thu, 14 May 2020 06:30:29 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.90) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 14 May 2020 06:30:26 -0000
Received: from us1a3-mail267.a3.dal06.isc4sb.com ([10.146.127.216])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2020051406302643-160274 ;
 Thu, 14 May 2020 06:30:26 +0000 
In-Reply-To: <b77b57256b8e40e683f7f9ce6054626e@quantatw.com>
To: "=?ISO-2022-JP?B?VG9ueSBMZWUgKBskQk17SjhJWRsoQik=?="
 <Tony.Lee@quantatw.com>
From: "Prashanth Katti1" <prkatti1@in.ibm.com>
Date: Thu, 14 May 2020 12:00:25 +0530
References: <77fbcecc2f4b4ceab3dca7319b2a9f66@quantatw.com>
 <CAAMkS13sM+zjAmSGp9Vx1O-ocWbLDcwgft18iruM96BS7wMx8A@mail.gmail.com>
 <b77b57256b8e40e683f7f9ce6054626e@quantatw.com>
MIME-Version: 1.0
X-Mailer: IBM Notes Release 10.0.1 November 29, 2018
X-LLNOutbound: False
X-Disclaimed: 52767
X-TNEFEvaluated: 1
Content-Type: multipart/alternative;
 boundary="=_alternative 0023B50765258568_="
x-cbid: 20051406-8877-0000-0000-000003859A82
X-IBM-SpamModules-Scores: BY=0.032672; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.426071; ST=0; TS=0; UL=0; ISC=; MB=0.000000
X-IBM-SpamModules-Versions: BY=3.00013089; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000294; SDB=6.01376492; UDB=6.00735765; IPR=6.01158846; 
 MB=3.00032158; MTD=3.00000008; XFM=3.00000015; UTC=2020-05-14 06:30:28
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-05-14 02:28:21 - 6.00011359
x-cbparentid: 20051406-8878-0000-0000-0000A1CFCB1E
Message-Id: <OFC9095D4F.198D5617-ON00258568.002386A2-65258568.0023B678@notes.na.collabserv.com>
Subject: RE: Test suite 'test_bmc_network_conf' in openbmc-test-automation
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-13_09:2020-05-13,
 2020-05-13 signatures=0
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--=_alternative 0023B50765258568_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-2022-JP"

Hi Tony,
These tests fail for us also. But we skip these tests while running=20
network suite.

Prashanth Katti



From:   "Tony Lee (=1B$BM{J8IY=1B(B)" <Tony.Lee@quantatw.com>
To:     "prkatti1@in.ibm.com" <prkatti1@in.ibm.com>
Cc:     "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Date:   14-05-2020 11:56
Subject:        [EXTERNAL] RE: Test suite 'test=5Fbmc=5Fnetwork=5Fconf' in =

openbmc-test-automation



Hi Prashanth,

Do you have any suggestions for this issue? Will these cases also fail in=20
your environment?

Thanks
Best Regards,
Tony

From: Rahul Maheshwari <rahulmaheshwari01@gmail.com>=20
Sent: Thursday, April 30, 2020 8:09 PM
To: Tony Lee (=1B$BM{J8IY=1B(B) <Tony.Lee@quantatw.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Test suite 'test=5Fbmc=5Fnetwork=5Fconf' in openbmc-test-autom=
ation

mailto:prkatti1@in.ibm.com

Prashant
Can you look at this query?

Thanks,
Rahul

On Wed, Apr 29, 2020 at 3:56 PM Tony Lee (=1B$BM{J8IY=1B(B) <
mailto:Tony.Lee@quantatw.com> wrote:
Hi Rahul,=20

Cases like 'Configure Broadcast IP', 'Configure Multicast IP' and=20
'Configure Loopback IP' in redfish test=5Fbmc=5Fnetwork=5Fconf.robot.
In these cases, when using redfish to set an invalid type ip (such as=20
broadcast ip), an HTTP=5FBAD=5FREQUEST response is expected.

However, the invalid type ip in openbmc repo 'bmcweb' has no restrictions.
Therefore, those test cases related to setting invalid type ip or gateway=20
will fail.

Do you have any suggestions for this issue? Will these cases also fail in=20
your environment?

Thanks
Best Regards,
Tony






--=_alternative 0023B50765258568_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="ISO-2022-JP"

<span style=3D" font-size:10pt;font-family:sans-serif">Hi Tony,</span><br><=
span style=3D" font-size:10pt;font-family:sans-serif">These tests fail
for us also. But we skip these tests while running network suite.</span><br=
><br><span style=3D" font-size:10pt;font-family:sans-serif">Prashanth Katti=
</span><br><br><br><br><span style=3D" font-size:9pt;color:#5f5f5f;font-fam=
ily:sans-serif">From:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">&quot;Tony
Lee (=1B$BM{J8IY=1B(B)&quot; &lt;Tony.Lee@quantatw.com&gt;</span><br><span =
style=3D" font-size:9pt;color:#5f5f5f;font-family:sans-serif">To:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">&quot;prkatti1@in.ibm.com&quot;
&lt;prkatti1@in.ibm.com&gt;</span><br><span style=3D" font-size:9pt;color:#=
5f5f5f;font-family:sans-serif">Cc:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">&quot;openbmc@lists.ozlabs.org&quot;
&lt;openbmc@lists.ozlabs.org&gt;</span><br><span style=3D" font-size:9pt;co=
lor:#5f5f5f;font-family:sans-serif">Date:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">14-05-2020
11:56</span><br><span style=3D" font-size:9pt;color:#5f5f5f;font-family:san=
s-serif">Subject:
&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=3D" font-size:9pt;font-family=
:sans-serif">[EXTERNAL]
RE: Test suite 'test=5Fbmc=5Fnetwork=5Fconf' in openbmc-test-automation</sp=
an><br><hr noshade><br><br><br><tt><span style=3D" font-size:10pt">Hi Prash=
anth,<br><br>Do you have any suggestions for this issue? Will these cases a=
lso fail
in your environment?<br><br>Thanks<br>Best Regards,<br>Tony<br><br>From: Ra=
hul Maheshwari &lt;rahulmaheshwari01@gmail.com&gt; <br>Sent: Thursday, Apri=
l 30, 2020 8:09 PM<br>To: Tony Lee (=1B$BM{J8IY=1B(B) &lt;Tony.Lee@quantatw=
.com&gt;<br>Cc: openbmc@lists.ozlabs.org<br>Subject: Re: Test suite 'test=
=5Fbmc=5Fnetwork=5Fconf' in openbmc-test-automation<br><br></span></tt><a h=
ref=3Dmailto:prkatti1@in.ibm.com><tt><span style=3D" font-size:10pt">mailto=
:prkatti1@in.ibm.com</span></tt></a><tt><span style=3D" font-size:10pt"><br=
><br>Prashant<br>Can you look at this query?<br><br>Thanks,<br>Rahul<br><br=
>On Wed, Apr 29, 2020 at 3:56 PM Tony Lee (=1B$BM{J8IY=1B(B) &lt;</span></t=
t><a href=3Dmailto:Tony.Lee@quantatw.com><tt><span style=3D" font-size:10pt=
">mailto:Tony.Lee@quantatw.com</span></tt></a><tt><span style=3D" font-size=
:10pt">&gt;
wrote:<br>Hi Rahul, <br><br>Cases like 'Configure Broadcast IP', 'Configure=
 Multicast IP' and 'Configure
Loopback IP' in redfish test=5Fbmc=5Fnetwork=5Fconf.robot.<br>In these case=
s, when using redfish to set an invalid type ip (such as broadcast
ip), an HTTP=5FBAD=5FREQUEST response is expected.<br><br>However, the inva=
lid type ip in openbmc repo 'bmcweb' has no restrictions.<br>Therefore, tho=
se test cases related to setting invalid type ip or gateway
will fail.<br><br>Do you have any suggestions for this issue? Will these ca=
ses also fail
in your environment?<br><br>Thanks<br>Best Regards,<br>Tony<br><br></span><=
/tt><br><br><BR>

--=_alternative 0023B50765258568_=--

