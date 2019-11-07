Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 490D2F2D64
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2019 12:26:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4781Lt3m2FzF6Ld
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2019 22:26:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=devenrao@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4781G84mFVzF650
 for <openbmc@lists.ozlabs.org>; Thu,  7 Nov 2019 22:22:23 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA7AxjQx083816
 for <openbmc@lists.ozlabs.org>; Thu, 7 Nov 2019 06:04:49 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.91])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w4f6ay7g2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 07 Nov 2019 06:04:45 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <devenrao@in.ibm.com>;
 Thu, 7 Nov 2019 11:02:32 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 7 Nov 2019 11:02:28 -0000
Received: from us1a3-mail121.a3.dal06.isc4sb.com ([10.146.45.16])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2019110711022752-331607 ;
 Thu, 7 Nov 2019 11:02:27 +0000 
In-Reply-To: <139bf9c3.6e26.16e44e2c237.Coremail.ouyangxuan10@163.com>
From: "Devender Rao" <devenrao@in.ibm.com>
To: ouyangxuan10@163.com
Date: Thu, 7 Nov 2019 11:02:27 +0000
Sensitivity: 
MIME-Version: 1.0
References: <139bf9c3.6e26.16e44e2c237.Coremail.ouyangxuan10@163.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1660 | IBM Domino Build
 SCN1812108_20180501T0841_FP61 October 18, 2019 at 15:11
X-LLNOutbound: False
X-Disclaimed: 51583
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 19110711-2475-0000-0000-00000146030E
X-IBM-SpamModules-Scores: BY=0.00078; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.397008; ST=0; TS=0; UL=0; ISC=; MB=0.078183
X-IBM-SpamModules-Versions: BY=3.00012069; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01286654; UDB=6.00682214; IPR=6.01068824; 
 MB=3.00029413; MTD=3.00000008; XFM=3.00000015; UTC=2019-11-07 11:02:30
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-11-07 10:40:00 - 6.00010620
x-cbparentid: 19110711-2476-0000-0000-00002F5402C0
Message-Id: <OF65345083.058B21A2-ON002584AB.003CA681-002584AB.003CA687@notes.na.collabserv.com>
Subject: Re:  why the object cannot list in rest api?
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-07_03:, , signatures=0
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

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" >Do check out this r=
eadme document for the commands<br><a href=3D"https://gerrit.openbmc-projec=
t.xyz/c/openbmc/phosphor-debug-collector/+/25357" >https://gerrit.openbmc-p=
roject.xyz/c/openbmc/phosphor-debug-collector/+/25357</a></div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: www &lt;ouyangxuan=
10@163.com&gt;<br>Sent by: "openbmc" &lt;openbmc-bounces+devenrao=3Din.ibm.=
com@lists.ozlabs.org&gt;<br>To: "openbmc@lists.ozlabs.org" &lt;openbmc@list=
s.ozlabs.org&gt;<br>Cc:<br>Subject: [EXTERNAL] why the object cannot list i=
n rest api?<br>Date: Thu, Nov 7, 2019 1:56 PM<br>&nbsp;
<div style=3D"line-height:1.7;color:#000000;font-size:14px;font-family:Aria=
l" ><div>Dear all,</div>
<div>&nbsp;</div>
<div>There are some objects on DBUS that can be displayed with busctl comma=
nd, but can't be displayed with rest API. Is there any reason for this?</di=
v>
<div><div>=E2=94=94=E2=94=80/xyz</div>
<div>&nbsp; =E2=94=94=E2=94=80/xyz/openbmc=5Fproject</div>
<div>&nbsp; &nbsp; =E2=94=94=E2=94=80/xyz/openbmc=5Fproject/dump</div>
<div><span style=3D"background-color: rgb(255, 204, 0);" >&nbsp; &nbsp; &nb=
sp; =E2=94=9C=E2=94=80/xyz/openbmc=5Fproject/dump/entry</span></div>
<div><span style=3D"background-color: rgb(255, 204, 0);" >&nbsp; &nbsp; &nb=
sp; =E2=94=82 =E2=94=94=E2=94=80/xyz/openbmc=5Fproject/dump/entry/1</span><=
/div>
<div>&nbsp; &nbsp; &nbsp; =E2=94=94=E2=94=80/xyz/openbmc=5Fproject/dump/int=
ernal</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; =E2=94=94=E2=94=80/xyz/openbmc=5Fproject/d=
ump/internal/manager</div></div>
<div>&nbsp;</div>
<div><div>curl -k -H "X-Auth-Token: $token" https://${bmc}/xyz/openbmc=5Fpr=
oject/dump/list</div>
<div>{</div>
<div>&nbsp; "data": [</div>
<div>&nbsp; &nbsp; "/xyz/openbmc=5Fproject/dump/internal",</div>
<div>&nbsp; &nbsp; "/xyz/openbmc=5Fproject/dump/internal/manager"</div>
<div>&nbsp; ],</div>
<div>&nbsp; "message": "200 OK",</div>
<div>&nbsp; "status": "ok"</div>
<div>}</div></div>
<div>&nbsp;</div>
<div>thanks=EF=BC=8C</div>
<div>Byron</div>
<div>&nbsp;</div></div>&nbsp;

<p><span title=3D"neteasefooter" >&nbsp;</span></p></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>

