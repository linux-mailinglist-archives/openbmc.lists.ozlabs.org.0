Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F28C27D703
	for <lists+openbmc@lfdr.de>; Tue, 29 Sep 2020 21:35:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C18kL4sjzzDqX2
	for <lists+openbmc@lfdr.de>; Wed, 30 Sep 2020 05:35:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=derick.montague@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YpmlHQOs; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C18jS5zywzDqWK
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 05:34:52 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08TJWSDs061274
 for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2020 15:34:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : cc : date : mime-version : references :
 content-transfer-encoding : content-type : message-id; s=pp1;
 bh=0qAV8aiSmw7NO+Gl1lQ3j8d2f83FWmp95UsxZgdwpaI=;
 b=YpmlHQOswbQ5rM21iQcMeVbtAPYrnh1rLDh/1UpzEPlYJOVpnzSX0/r2wergyI3jkFsb
 mTZCLCT4FoSp2Vy6WRN9UMvkmwk9jMGd4c8hskqDYut79SW4gDqio7mMw2tnDw7Lv09a
 nu6Nqptwtgn9b7zxy1D4Fuc3fIQCw11ofX5ZPShDOWSLa2bn/oGhHhzpJYh7+3vlRMNc
 RqSHRePp8r+O4WSL4MK413ATeDVkJCGDf8wiEgMHl+gIAiyHZ5hr7jFPHGvSM0AOPMCL
 ZQlGRH6eomG7EdA7sQ+dIy3acXeEWNmd7YMG9JS73j+wEERzN5hsT7gxAvu6MHLo5q6I 4w== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.67])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33vavr0hts-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 29 Sep 2020 15:34:49 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Tue, 29 Sep 2020 19:34:48 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 29 Sep 2020 19:34:48 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2020092919344774-682394 ;
 Tue, 29 Sep 2020 19:34:47 +0000 
In-Reply-To: <OF79D1C142.B81E873F-ON002585F1.004CE438-002585F1.004D87B5@notes.na.collabserv.com>
Subject: Re: GUI Design Work Group - Wednesday, 9/30
From: "Derick Montague" <Derick.Montague@ibm.com>
To: "Derick Montague" <Derick.Montague@ibm.com>
Date: Tue, 29 Sep 2020 19:34:47 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <OF79D1C142.B81E873F-ON002585F1.004CE438-002585F1.004D87B5@notes.na.collabserv.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 44619
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20092919-7279-0000-0000-000003C89F25
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.000000
X-IBM-SpamModules-Versions: BY=3.00013918; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01441989; UDB=6.00774898; IPR=6.01224675; 
 MB=3.00034311; MTD=3.00000008; XFM=3.00000015; UTC=2020-09-29 19:34:48
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-09-29 14:46:11 - 6.00011898
x-cbparentid: 20092919-7280-0000-0000-00009A6FA7F3
Message-Id: <OF9DA9FB3B.B9448043-ON002585F2.006B6CE8-002585F2.006B8E4C@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-29_11:2020-09-29,
 2020-09-29 signatures=0
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> The IBM Design team is out this week for a Design Summit. I am planning t=
o cancel this week's =20
> work group and would like to know if regular attendees would prefer to ke=
ep the schedule in place =20
> with our next meeting  in two weeks on Wednesday, October 14th or shift t=
he =20
> schedule and meet next Wednesday, October 7th? =20
  =20
Tomorrow's GUI Work Group will be cancelled. The next =20
one will be in two weeks on Wednesday, October 14th. =20
  =20
  =20
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20
=20

  =20

