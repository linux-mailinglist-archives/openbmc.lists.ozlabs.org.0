Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BF811C62D
	for <lists+openbmc@lfdr.de>; Thu, 12 Dec 2019 08:08:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YPyQ59vTzDqfk
	for <lists+openbmc@lfdr.de>; Thu, 12 Dec 2019 18:07:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=devenrao@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YPxp1F73zDqw3
 for <openbmc@lists.ozlabs.org>; Thu, 12 Dec 2019 18:07:24 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBC72k1c103161
 for <openbmc@lists.ozlabs.org>; Thu, 12 Dec 2019 02:07:21 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.74])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wt2kv8e06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 12 Dec 2019 02:07:21 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <devenrao@in.ibm.com>;
 Thu, 12 Dec 2019 07:07:20 -0000
Received: from us1a3-smtp08.a3.dal06.isc4sb.com (10.146.103.57)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 12 Dec 2019 07:07:16 -0000
Received: from us1a3-mail121.a3.dal06.isc4sb.com ([10.146.45.16])
 by us1a3-smtp08.a3.dal06.isc4sb.com
 with ESMTP id 2019121207071524-94805 ;
 Thu, 12 Dec 2019 07:07:15 +0000 
In-Reply-To: <c31757a8-c71d-43b3-f207-426e94548065@linux.vnet.ibm.com>
From: "Devender Rao" <devenrao@in.ibm.com>
To: ratagupt@linux.vnet.ibm.com
Date: Thu, 12 Dec 2019 07:07:15 +0000
Sensitivity: 
MIME-Version: 1.0
References: <c31757a8-c71d-43b3-f207-426e94548065@linux.vnet.ibm.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1661 | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 49987
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 19121207-3165-0000-0000-0000020CB47F
X-IBM-SpamModules-Scores: BY=0.174425; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=; MB=0.194195
X-IBM-SpamModules-Versions: BY=3.00012229; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01303152; UDB=6.00692111; IPR=6.01085436; 
 MB=3.00029931; MTD=3.00000008; XFM=3.00000015; UTC=2019-12-12 07:07:18
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-12-12 07:00:30 - 6.00010755
x-cbparentid: 19121207-3166-0000-0000-00008765BCD2
Message-Id: <OF3E82A637.78F050C7-ON002584CE.0025B2F4-002584CE.00271DE9@notes.na.collabserv.com>
Subject: Re:  Redfish Dump Service Proposal
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-12_01:2019-12-12,2019-12-12 signatures=0
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
elvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" >Over all the schema=
 looks good. Few observations for clarity, also how about we have multiple =
collection say HostDumpCollection, BMCDumpCollection &nbsp;and also a new s=
ervice DumpLocations similar to "CertificateLocations"</div>
<div dir=3D"ltr" ><br>Page 17: Dump Creation flow</div>
<div dir=3D"ltr" >1. The time line diagram should show that "Request to cre=
ate dump" return immediatley. The redfish client will be notififed asynchro=
nously when the dump is collected through DumpCollected event. Request for =
dump with resource id should be in the same time line when it gets notified=
 of Dump collection completed.<br>&nbsp;</div>
<div dir=3D"ltr" >Page 19: For clarity</div>
<div dir=3D"ltr" >"List Dumps" should be shown as part of DumpColletion rat=
her than under "Operations on dump"<br>"Get Dump details" should be shown u=
nder dump service</div>
<div dir=3D"ltr" >"Delete Dumps" should be shown under DumpService<br>&nbsp=
;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: Ratan Gupta &lt;ra=
tagupt@linux.vnet.ibm.com&gt;<br>Sent by: "openbmc" &lt;openbmc-bounces+dev=
enrao=3Din.ibm.com@lists.ozlabs.org&gt;<br>To: "openbmc@lists.ozlabs.org" &=
lt;openbmc@lists.ozlabs.org&gt;<br>Cc:<br>Subject: [EXTERNAL] Redfish Dump =
Service Proposal<br>Date: Thu, Dec 12, 2019 5:09 AM<br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >Hi All,<br><br>Please find the redfish dump service proposal for the D=
MTF attached.<br><br>Kindly review and provide your inputs.<br><br>Ratan</f=
ont><br><br><br>&nbsp;</div>
<div id=3D"MIMEAttachInfoDiv" style=3D"display:none" title=3D"vnd.openxmlfo=
rmats-officedocument.presentationml.presentation|DumpOffload=5FDMTF=5FPropo=
sal.pptx" >&nbsp;</div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>

