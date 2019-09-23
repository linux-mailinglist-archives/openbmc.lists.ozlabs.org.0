Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15178BAC6A
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 03:40:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46c6TV1HGxzDqM4
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 11:40:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=in.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=manojeda@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46c6Sh2W0SzDqLs
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 11:39:41 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8N1b3Wb099720
 for <openbmc@lists.ozlabs.org>; Sun, 22 Sep 2019 21:39:37 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.73])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v6c4ebbq4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sun, 22 Sep 2019 21:39:37 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <manojeda@in.ibm.com>;
 Mon, 23 Sep 2019 01:39:37 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.90) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 23 Sep 2019 01:39:34 -0000
Received: from us1a3-mail220.a3.dal06.isc4sb.com ([10.146.71.127])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2019092301393386-613632 ;
 Mon, 23 Sep 2019 01:39:33 +0000 
In-Reply-To: 
Subject: Proposal for 2 properties for Nameservers
From: "Manojkiran Eda" <manojeda@in.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Mon, 23 Sep 2019 01:39:33 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1619 | IBM Domino Build
 SCN1812108_20180501T0841_FP57 August 05, 2019 at 12:42
X-LLNOutbound: False
X-Disclaimed: 22703
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 19092301-8877-0000-0000-000001338F4F
X-IBM-SpamModules-Scores: BY=0.13013; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40304; ST=0; TS=0; UL=0; ISC=; MB=0.070070
X-IBM-SpamModules-Versions: BY=3.00011824; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01265209; UDB=6.00669274; IPR=6.01047140; 
 MB=3.00028757; MTD=3.00000008; XFM=3.00000015; UTC=2019-09-23 01:39:36
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-09-22 21:23:42 - 6.00010439
x-cbparentid: 19092301-8878-0000-0000-00000445A03D
Message-Id: <OFDC47175F.41C9D828-ON0025847E.0008C328-0025847E.00091D63@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-22_09:, , signatures=0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" style=3D"font-family=
:Arial, Helvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" ><div>Hi Al=
l,</div>
<div>&nbsp;</div>
<div>This mail is regarding , the proposal for adding an additional propert=
y `StaticNameservers` and also for changing the definition of the existing =
`Nameservers` property.</div>
<div>&nbsp;</div>
<div>- Currently, we have a single DBUS property under Ethernet interface n=
amed `Nameservers` that captures only StaticNameservers configured on the s=
ystem. It does not populate the information regarding the DNS information t=
hat is obtained by DHCP server.</div>
<div>&nbsp;</div>
<div>It is also to be noted that the static &amp; dynamic configuration can=
 co-exist at the same time(means we might have the DNS set manually by user=
 and also by the DHCP Server at the same time).</div>
<div>&nbsp;</div>
<div>As per the discussion with Ratan &amp; Wak(https://gerrit.openbmc-proj=
ect.xyz/#/c/openbmc/phosphor-networkd/+/24224/),we had come to a conclusion=
 that we need have two properties in the Backend for nameservers (similar t=
o what we have in redfish):</div>
<div>&nbsp;</div>
<div>1. Nameservers - A read only property which captures the current names=
ervers on the system (which may be static or/and dynamic)<br>2. StaticNames=
ervers - A writeable property which captures only the static nameservers.</=
div>
<div>&nbsp;</div>
<div>Please let me know, if anyone have concerns with this proposal.</div>
<div>&nbsp;</div>
<div>Thanks,<br>Manoj</div></div></div></div><BR>

