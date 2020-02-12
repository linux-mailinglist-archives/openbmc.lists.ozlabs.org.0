Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C20615B3A6
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2020 23:26:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HvPw4FR7zDqQL
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 09:26:44 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HvNs29mVzDqP6
 for <openbmc@lists.ozlabs.org>; Thu, 13 Feb 2020 09:25:48 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CMP1GN048414
 for <openbmc@lists.ozlabs.org>; Wed, 12 Feb 2020 17:25:45 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.112])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2y3wxtce0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 12 Feb 2020 17:25:45 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Wed, 12 Feb 2020 22:25:44 -0000
Received: from us1b3-smtp05.a3dr.sjc01.isc4sb.com (10.122.203.183)
 by smtp.notes.na.collabserv.com (10.122.47.54) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 12 Feb 2020 22:25:38 -0000
Received: from us1b3-mail158.a3dr.sjc03.isc4sb.com ([10.160.174.218])
 by us1b3-smtp05.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020021222253854-875561 ;
 Wed, 12 Feb 2020 22:25:38 +0000 
In-Reply-To: <3cee9f0f-9b6a-78da-479e-dd038daafb0d@linux.intel.com>
Subject: Functionality vs Security
From: "Derick Montague" <Derick.Montague@ibm.com>
To: James Feist <james.feist@linux.intel.com>
Date: Wed, 12 Feb 2020 22:25:38 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <3cee9f0f-9b6a-78da-479e-dd038daafb0d@linux.intel.com>,
 <62005ec9-e004-1041-7c5b-9272f8c2d854@linux.intel.com>
 <4F01EAF1-E621-4908-8080-C2BE62287E0C@fuzziesquirrel.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 19463
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20021222-4615-0000-0000-00000182DCF0
X-IBM-SpamModules-Scores: BY=0.000004; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.415652; ST=0; TS=0; UL=0; ISC=; MB=0.000378
X-IBM-SpamModules-Versions: BY=3.00012563; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01333021; UDB=6.00709945; IPR=6.01115373; 
 MB=3.00030775; MTD=3.00000008; XFM=3.00000015; UTC=2020-02-12 22:25:43
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-02-12 20:22:35 - 6.00010997
x-cbparentid: 20021222-4616-0000-0000-0000B890FE1F
Message-Id: <OFAC161FFB.77BDB4DA-ON0025850C.007B3275-0025850C.007B327C@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_10:2020-02-12,
 2020-02-12 signatures=0
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, "Mihm, 
 James" <james.mihm@intel.com>, Gunnar Mills <gmills@linux.vnet.ibm.com>,
 Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> We had someone working on the Web-UI, but they had problems getting
things merged due to differences in design opinions. Unfortunately that
person has moved on, so the up-streaming effort has been halted for now.

We made some progress with finding consensus on design changes. The biggest
issue we struggled with was the size of the commits and the coupling of the
design and functionality changes. As we build out the Vue.js rewrite, we are
using Redfish.

