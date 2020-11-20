Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9886A2BA263
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 07:38:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ccn1g4DvJzDqtr
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 17:38:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mPRNdKeg; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ccn0k3wHVzDqtR
 for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2020 17:37:35 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AK63MKi132165
 for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2020 01:37:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : mime-version : references : content-transfer-encoding :
 content-type : message-id : subject; s=pp1;
 bh=Tq7leq838oQjPltzJ9e1B4GC2PPMznV3WBRqGLbtFgI=;
 b=mPRNdKeg0sutIpyR0XK/GgckQAfpTEZPlthiZtqyACpFbN8h8jqBQC0sAk2hkanst8Jd
 wmQAIA+NxNVJXEsyKYNJA1ug3myrbaetFECKlLUJW9D8aOwf3l9Lm/vgh55hlui47vx/
 YSUowV+cwk0zW/QHlHNxeU+pWW7AKJr2pVMVKHVsvGJtRZ50Ao4bbt04Js48gHKchI3S
 +MnMPDOsN9knQ2IrzkeHUgylaaUq9mcyovXZtCNmOBx2BXCl+w2xhCe3ZRiwK3zmdQ3l
 IMW3AYGysQxVnsERr6BKEh3ys34wr77Eu/iuzAM2WKFgwCSSqds24AQ/HKPdaEmZzHzU jA== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.82])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34x1m0svyx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2020 01:37:31 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Fri, 20 Nov 2020 06:37:31 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 20 Nov 2020 06:37:30 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2020112006372907-64231 ;
 Fri, 20 Nov 2020 06:37:29 +0000 
In-Reply-To: <94a84c0d54f94193be2f21212e3749a7@quantatw.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: "=?ISO-2022-JP?B?SnVuLUxpbiBDaGVuICgbJEJERD1TcEMbKEIp?="
 <Jun-Lin.Chen@quantatw.com>
Date: Fri, 20 Nov 2020 06:37:29 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <94a84c0d54f94193be2f21212e3749a7@quantatw.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 6599
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20112006-9463-0000-0000-000004AA046F
X-IBM-SpamModules-Scores: BY=0.044676; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.046031
X-IBM-SpamModules-Versions: BY=3.00014220; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01466387; UDB=6.00789399; IPR=6.01249025; 
 MB=3.00035130; MTD=3.00000008; XFM=3.00000015; UTC=2020-11-20 06:37:30
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-11-20 03:36:05 - 6.00012073
x-cbparentid: 20112006-9464-0000-0000-00005F7B0AFF
Message-Id: <OF6C0BDCD9.6939B3A4-ON00258626.00246422-00258626.0024642A@notes.na.collabserv.com>
Subject: Re: The Subscription will disappear and config of EventService restore
 initial value after reboot
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-20_01:2020-11-19,
 2020-11-20 signatures=0
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

On November 19, 2020 around 11:47PM in some timezone, Jun-Lin Chen (=E9=99=
=B3=E4=BF=8A=E9=9C=96) wrote:

> Hi,
> I have an issue about EventService: after reboot, Subscription
>disappear and config of EventService restore initial value.
> I look up the codes in event=5Fservice=5Fmanager.hpp and found
>Subscription and EventService config will store i
>/var/lib/bmcweb/eventservice=5Fconfig.json.
> But If BMC has no bmcweb folder in /var/lib/ , It not save
>eventservice=5Fconfig.json.
> =20
> I try create bmcweb folder manually and POST a new Subscription then
>reboot, the Subscription will be saved and not disappear this time.
> This performance seems to be inconsistent with the design concept if
>there is no bmcweb folder at the beginning. Does need to add to the
>code that detect the path is valid?
> =20

Rather than add to the code to detect if the path is valid, add to=20
the service  script a presetup command that does=20
'mkdir -p /var/lib/bmcweb/' to create the directory.   Ideally this=20
would be written to have the path in a meson variable that is built
into a configuration .h file and into the service file using variable
substition to make sure the path in the code is the same as the=20
directory in the service file.

milton


> Jim> =20
>    =20

