Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F7E104835
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2019 02:46:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JMqf3cvMzDqsw
	for <lists+openbmc@lfdr.de>; Thu, 21 Nov 2019 12:46:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=derick.montague@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JMpp6W80zDq62
 for <openbmc@lists.ozlabs.org>; Thu, 21 Nov 2019 12:46:09 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAL1fbeb103240
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 20:46:04 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.109])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wd3fmb8ks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2019 20:46:04 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Thu, 21 Nov 2019 01:46:03 -0000
Received: from us1b3-smtp01.a3dr.sjc01.isc4sb.com (10.122.7.174)
 by smtp.notes.na.collabserv.com (10.122.47.48) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 21 Nov 2019 01:45:59 -0000
Received: from us1b3-mail158.a3dr.sjc03.isc4sb.com ([10.160.174.218])
 by us1b3-smtp01.a3dr.sjc01.isc4sb.com
 with ESMTP id 2019112101455916-1019503 ;
 Thu, 21 Nov 2019 01:45:59 +0000 
In-Reply-To: <FD0BD680739BFC41807C96BD23118BB1319100@ORSMSX113.amr.corp.intel.com>
From: "Derick Montague" <Derick.Montague@ibm.com>
To: kathryn.elainex.pine@intel.com
Date: Thu, 21 Nov 2019 01:45:58 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <FD0BD680739BFC41807C96BD23118BB1319100@ORSMSX113.amr.corp.intel.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 49747
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 19112101-1429-0000-0000-000000D6047E
X-IBM-SpamModules-Scores: BY=0.000001; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.020073
X-IBM-SpamModules-Versions: BY=3.00012141; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01293082; UDB=6.00686080; IPR=6.01075304; 
 MB=3.00029636; MTD=3.00000008; XFM=3.00000015; UTC=2019-11-21 01:46:01
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-11-21 01:17:02 - 6.00010672
x-cbparentid: 19112101-1430-0000-0000-00008C81207B
Message-Id: <OF17CE7DF8.3D38338C-ON002584B9.00093657-002584B9.0009B3F8@notes.na.collabserv.com>
Subject: RE: GUI Component Library
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-20_08:2019-11-20,2019-11-20 signatures=0
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
Cc: openbmc@lists.ozlabs.org, jandraara@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> Thank you, Jandra, for putting together this mockup to demonstrate how ou=
r proposed design style could be somewhat maintained with this library. Is =
this all done via CSS overrides?
=20
She used the Carbon Design System toolkit to mock this up in Sketch. We wou=
ld implement this through custom theming.
Rounded corners, larger font size, etc could be simple overrides, but I thi=
nk best way to accomplish this is by creating
custom themes.

