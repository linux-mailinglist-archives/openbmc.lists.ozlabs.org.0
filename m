Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E542419FCC9
	for <lists+openbmc@lfdr.de>; Mon,  6 Apr 2020 20:14:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wzGG6RmVzDqwg
	for <lists+openbmc@lfdr.de>; Tue,  7 Apr 2020 04:14:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wzFL0k57zDqrZ
 for <openbmc@lists.ozlabs.org>; Tue,  7 Apr 2020 04:13:50 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 036I3fJY049631
 for <openbmc@lists.ozlabs.org>; Mon, 6 Apr 2020 14:13:48 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.93])
 by mx0b-001b2d01.pphosted.com with ESMTP id 306kuvqgxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 06 Apr 2020 14:13:48 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Mon, 6 Apr 2020 18:13:47 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.39) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 6 Apr 2020 18:13:44 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2020040618134340-750061 ;
 Mon, 6 Apr 2020 18:13:43 +0000 
In-Reply-To: <4FB1C77E-3FD5-4D56-AD67-BB4A57BE45C1@fuzziesquirrel.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Date: Mon, 6 Apr 2020 18:13:43 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <4FB1C77E-3FD5-4D56-AD67-BB4A57BE45C1@fuzziesquirrel.com>,
 <d51f1a31994d36b1dd98f1bd56260cc3@linux.vnet.ibm.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP64 March 05, 2020 at 12:58
X-LLNOutbound: False
X-Disclaimed: 13031
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20040618-8889-0000-0000-0000025BE072
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.421684; ST=0; TS=0; UL=0; ISC=; MB=0.000000
X-IBM-SpamModules-Versions: BY=3.00012888; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000293; SDB=6.01358591; UDB=6.00725142; IPR=6.01140987; 
 MB=3.00031575; MTD=3.00000008; XFM=3.00000015; UTC=2020-04-06 18:13:46
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-04-06 12:21:48 - 6.00011209
x-cbparentid: 20040618-8890-0000-0000-00005FFDF9C3
Message-Id: <OF793F32B0.F6EEA6D4-ON00258542.00642247-00258542.0064224E@notes.na.collabserv.com>
Subject: RE: [PATCH] Remove checkstop GPIO from gpio-keys definitions
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-06_08:2020-04-06,
 2020-04-06 signatures=0
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
Cc: openbmc@lists.ozlabs.org, bentyner <bentyner@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



-----"openbmc" <openbmc-bounces+miltonm=3Dus.ibm.com@lists.ozlabs.org> wrot=
e: -----

>To: bentyner <bentyner@linux.ibm.com>
>From: Brad Bishop=20
>Sent by: "openbmc"=20
>Date: 04/06/2020 12:36PM
>Cc: openbmc@lists.ozlabs.org
>Subject: [EXTERNAL] Re: [PATCH] Remove checkstop GPIO from gpio-keys
>definitions
>
>at 8:16 AM, bentyner <bentyner@linux.ibm.com> wrote:
>
>> From: Ben Tyner <ben.tyner@ibm.com>
>
>Hi Ben.  How did you invoke git format-patch?  I wasn=E2=80=99t expecting
>this=20
>line.  Have a read through =20

The reason is the commit author likely doesn't match the sender,=20
as the reply address is bentiner@linux.ibm.com but the commit is=20
from ben.tiner@ibm.com.

If this is the case, the commit will need to be amended with the=20
--reset-author flag if that is the public email address.  Some
people's workflow instead includes an additional S-o-B.

milton

