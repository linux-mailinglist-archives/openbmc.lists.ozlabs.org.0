Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1A1221363
	for <lists+openbmc@lfdr.de>; Wed, 15 Jul 2020 19:14:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6PBp3pvnzDqpk
	for <lists+openbmc@lfdr.de>; Thu, 16 Jul 2020 03:14:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gkeishin@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6PB10CdQzDqnp
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jul 2020 03:14:00 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06FH2dgD041290
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jul 2020 13:13:58 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.81])
 by mx0a-001b2d01.pphosted.com with ESMTP id 329cukp4yq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jul 2020 13:13:58 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <gkeishin@in.ibm.com>;
 Wed, 15 Jul 2020 17:13:57 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 15 Jul 2020 17:13:54 -0000
Received: from us1a3-mail113.a3.dal06.isc4sb.com ([10.146.6.4])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2020071517135412-638089 ;
 Wed, 15 Jul 2020 17:13:54 +0000 
In-Reply-To: <SG2PR04MB309395DAE41A04DFB435D1BDE1600@SG2PR04MB3093.apcprd04.prod.outlook.com>
To: Jayashree D <jayashree-d@hcl.com>
From: "George Keishing" <gkeishin@in.ibm.com>
Date: Wed, 15 Jul 2020 22:43:48 +0530
References: <SG2PR04MB309395DAE41A04DFB435D1BDE1600@SG2PR04MB3093.apcprd04.prod.outlook.com>
X-KeepSent: 083F3BF9:0AC2A438-002585A6:005E035C;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 10.0.1 November 29, 2018
X-LLNOutbound: False
X-Disclaimed: 315
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=8FBB0F35DFCD85CC8f9e8a93df938690918c8FBB0F35DFCD85CC"
x-cbid: 20071517-3067-0000-0000-000003A08189
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.408524; ST=0; TS=0; UL=0; ISC=; MB=0.249326
X-IBM-SpamModules-Versions: BY=3.00013474; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01406210; UDB=6.00753369; IPR=6.01188451; 
 MB=3.00033021; MTD=3.00000008; XFM=3.00000015; UTC=2020-07-15 17:13:56
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-07-15 10:40:36 - 6.00011603
x-cbparentid: 20071517-3068-0000-0000-0000966E9F9E
Message-Id: <OF083F3BF9.0AC2A438-ON002585A6.005E035C-652585A6.005EA5F6@notes.na.collabserv.com>
MIME-Version: 1.0
Subject: Re:  Issue about redfish in openbmc-test-automation
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-15_12:2020-07-15,
 2020-07-15 signatures=0
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

--0__=8FBB0F35DFCD85CC8f9e8a93df938690918c8FBB0F35DFCD85CC
Content-type: multipart/alternative; 
	Boundary="1__=8FBB0F35DFCD85CC8f9e8a93df938690918c8FBB0F35DFCD85CC"


--1__=8FBB0F35DFCD85CC8f9e8a93df938690918c8FBB0F35DFCD85CC
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


Hey Jayashree,

	The changes are now available in the test repo to support it,
however, the test cases would need to be updated as we go from here.
                Feel free to report by opening a github issue
https://github.com/openbmc/openbmc-test-automation/issues  and we can work
together to make the test code better.

Thanks and Regards,
 George Keishing





From:	Jayashree D <jayashree-d@hcl.com>
To:	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Date:	13-07-2020 11:21 AM
Subject:	[EXTERNAL] Issue about redfish in openbmc-test-automation
Sent by:	"openbmc" <openbmc-bounces
            +gkeishin=3Din.ibm.com@lists.ozlabs.org>




Hi All,

I am facing the below issue in my environment (tiogapass) and it is already
raised in Github.
This will be really helpful if the chassis-id is dynamically available. Is
there any update on this issue?

https://github.com/openbmc/openbmc-test-automation/issues/2091

Thanks,
Regards,
Jayashree


::DISCLAIMER::
The contents of this e-mail and any attachment(s) are confidential and
intended for the named recipient(s) only. E-mail transmission is not
guaranteed to be secure or error-free as information could be intercepted,
corrupted, lost, destroyed, arrive late or incomplete, or may contain
viruses in transmission. The e mail and its contents (with or without
referred errors) shall therefore not attach any liability on the originator
or HCL or its affiliates. Views or opinions, if any, presented in this
email are solely those of the author and may not necessarily reflect the
views or opinions of HCL or its affiliates. Any form of reproduction,
dissemination, copying, disclosure, modification, distribution and / or
publication of this message without the prior written consent of authorized
representative of HCL is strictly prohibited. If you have received this
email in error please delete it and notify the sender immediately. Before
opening any email and/or attachments, please check them for viruses and
other defects.







--1__=8FBB0F35DFCD85CC8f9e8a93df938690918c8FBB0F35DFCD85CC
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 1 URL was un-rewritten

<html><body><p><font size=3D"2">Hey Jayashree,</font><br><br><font size=3D"=
2">        The changes are now available in the test repo to support it, ho=
wever, the test cases would need to be updated as we go from here. </font><=
br><font size=3D"2">                Feel free to report by opening a github=
 issue </font><a href=3D"https://github.com/openbmc/openbmc-test-automation=
/issues"><u><font color=3D"#0000FF">https://github.com/openbmc/openbmc-test=
-automation/issues</font></u></a> <font size=3D"2"> and we can work togethe=
r to make the test code better.</font><br><br><b><font size=3D"2" color=3D"=
#0000FF">Thanks and Regards,</font></b><br><font size=3D"2" color=3D"#0000F=
F"> George Keishing</font><br><font size=3D"2" color=3D"#0000FF">  </font><=
br><br><br><img width=3D"16" height=3D"16" src=3D"cid:1__=3D8FBB0F35DFCD85C=
C8f9e8a93df938690918c8FB@" border=3D"0" alt=3D"Inactive hide details for Ja=
yashree D ---13-07-2020 11:21:47 AM---Hi All, I am facing the below issue i=
n my environment (tiogap"><font size=3D"2" color=3D"#424282">Jayashree D --=
-13-07-2020 11:21:47 AM---Hi All, I am facing the below issue in my environ=
ment (tiogapass) and it is already raised in Github</font><br><br><font siz=
e=3D"2" color=3D"#5F5F5F">From:        </font><font size=3D"2">Jayashree D =
&lt;jayashree-d@hcl.com&gt;</font><br><font size=3D"2" color=3D"#5F5F5F">To=
:        </font><font size=3D"2">&quot;openbmc@lists.ozlabs.org&quot; &lt;o=
penbmc@lists.ozlabs.org&gt;</font><br><font size=3D"2" color=3D"#5F5F5F">Da=
te:        </font><font size=3D"2">13-07-2020 11:21 AM</font><br><font size=
=3D"2" color=3D"#5F5F5F">Subject:        </font><font size=3D"2">[EXTERNAL]=
 Issue about redfish in openbmc-test-automation</font><br><font size=3D"2" =
color=3D"#5F5F5F">Sent by:        </font><font size=3D"2">&quot;openbmc&quo=
t; &lt;openbmc-bounces+gkeishin=3Din.ibm.com@lists.ozlabs.org&gt;</font><br=
><hr width=3D"100%" size=3D"2" align=3D"left" noshade style=3D"color:#8091A=
5; "><br><br><br><font face=3D"Calibri"> </font><br><font face=3D"Calibri">=
Hi All,</font><br><font face=3D"Calibri"> </font><br><font face=3D"Calibri"=
>I am facing the below issue in my environment (tiogapass) and it is alread=
y raised in Github.</font><br><font face=3D"Calibri">This will be really he=
lpful if the chassis-id is dynamically available. Is there any update on th=
is issue?</font><br><font face=3D"Calibri"> </font><br><a href=3D"https://g=
ithub.com/openbmc/openbmc-test-automation/issues/2091"><u><font color=3D"#0=
563C1" face=3D"Calibri">https://github.com/openbmc/openbmc-test-automation/=
issues/2091</font></u></a><br><font face=3D"Calibri"> </font><br><font face=
=3D"Calibri">Thanks,</font><br><font face=3D"Calibri">Regards,</font><br><f=
ont face=3D"Calibri">Jayashree</font><p><font size=3D"1" color=3D"#808080" =
face=3D"Arial">::DISCLAIMER::<br></font><hr width=3D"100%" size=3D"2" align=
=3D"left"><font size=3D"1" color=3D"#808080" face=3D"Arial">The contents of=
 this e-mail and any attachment(s) are confidential and intended for the na=
med recipient(s) only. E-mail transmission is not guaranteed to be secure o=
r error-free as information could be intercepted, corrupted, lost, destroye=
d, arrive late or incomplete, or may contain viruses in transmission. The e=
 mail and its contents (with or without referred errors) shall therefore no=
t attach any liability on the originator or HCL or its affiliates. Views or=
 opinions, if any, presented in this email are solely those of the author a=
nd may not necessarily reflect the views or opinions of HCL or its affiliat=
es. Any form of reproduction, dissemination, copying, disclosure, modificat=
ion, distribution and / or publication of this message without the prior wr=
itten consent of authorized representative of HCL is strictly prohibited. I=
f you have received this email in error please delete it and notify the sen=
der immediately. Before opening any email and/or attachments, please check =
them for viruses and other defects.<br></font><hr width=3D"100%" size=3D"2"=
 align=3D"left"><p><p><BR>
</body></html>

--1__=8FBB0F35DFCD85CC8f9e8a93df938690918c8FBB0F35DFCD85CC--


--0__=8FBB0F35DFCD85CC8f9e8a93df938690918c8FBB0F35DFCD85CC
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=8FBB0F35DFCD85CC8f9e8a93df938690918c8FB@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=8FBB0F35DFCD85CC8f9e8a93df938690918c8FBB0F35DFCD85CC--

