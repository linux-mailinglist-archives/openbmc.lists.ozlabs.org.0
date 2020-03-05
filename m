Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AB6179E4E
	for <lists+openbmc@lfdr.de>; Thu,  5 Mar 2020 04:36:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XxJ75QmTzDqk7
	for <lists+openbmc@lfdr.de>; Thu,  5 Mar 2020 14:36:55 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XxFP2MFCzDqS0
 for <openbmc@lists.ozlabs.org>; Thu,  5 Mar 2020 14:34:32 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0253TuKZ042320
 for <openbmc@lists.ozlabs.org>; Wed, 4 Mar 2020 22:34:29 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.66])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yhyxrfr29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 04 Mar 2020 22:34:29 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Thu, 5 Mar 2020 03:34:28 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 5 Mar 2020 03:34:24 -0000
Received: from us1a3-mail157.a3.dal06.isc4sb.com ([10.146.71.179])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2020030503342395-18364 ;
 Thu, 5 Mar 2020 03:34:23 +0000 
In-Reply-To: <c7d6f785-755b-1c1c-9ec9-66862a6fedfb@linux.ibm.com>
Subject: Re: OpenBMC GUI Design Workgroup - Today 10:00 AM CST
From: "Derick Montague" <Derick.Montague@ibm.com>
To: jrey@linux.ibm.com
Date: Thu, 5 Mar 2020 03:34:23 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <c7d6f785-755b-1c1c-9ec9-66862a6fedfb@linux.ibm.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 10711
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20030503-4409-0000-0000-00000222BFB3
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.388783; ST=0; TS=0; UL=0; ISC=; MB=0.058665
X-IBM-SpamModules-Versions: BY=3.00012689; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000293; SDB=6.01343092; UDB=6.00715943; IPR=6.01125484; 
 MB=3.00031085; MTD=3.00000008; XFM=3.00000015; UTC=2020-03-05 03:34:27
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-03-05 00:58:57 - 6.00011079
x-cbparentid: 20030503-4410-0000-0000-00003E800F9E
Message-Id: <OFFE8CB186.710715E7-ON00258522.00132915-00258522.0013A0F0@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-04_10:2020-03-04,
 2020-03-04 signatures=0
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

Hi Joseph,

Thank you for your feedback.

> My two cents worth:
> 1. Data should be stored untranslated whenever possible, and translated
> only when it is presented to the user.
>=20
> 2. It seems to me the language preference should ideally be associated
> with the session (whether login session or a session to perform a single
> operation ~
> https://lists.ozlabs.org/pipermail/openbmc/2019-November/019422.html).

1. The GUI translations are stored in JSON files. Which content is determin=
ed
by the Vue i18n Plugin.=20


2. The language preference will be stored in local storage, so it will pers=
ist
for as long as the user doesn't change the language or clear their browser's
local storage. The question is whether the user should have to log out if t=
hey
want to change their preference.
=20

