Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7937C2A84A5
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 18:16:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRqtk3KBHzDr0R
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 04:16:30 +1100 (AEDT)
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
 header.s=pp1 header.b=PXB0EJ+F; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRqs857lGzDqyx
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2020 04:15:07 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A5H4eBh043524
 for <openbmc@lists.ozlabs.org>; Thu, 5 Nov 2020 12:15:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : cc : date : references : content-type : message-id :
 content-transfer-encoding : mime-version; s=pp1;
 bh=wC6EXxYCK7JDlD21iKgw2D/mEXU5dd4GIBYFbwOJLus=;
 b=PXB0EJ+FdA5mDprh5XHREh0NVlLGVQxCzxbC368CKGbnsvjvJAszgYANjBHz0ANXgeb9
 nRCcJfmRZf6MjW5uBtA4APv7RwA2EXYR/T5SZJ4i3IaY5ZFbbRRJoj7ikHGSerht+b1Z
 5oBUDBOaYtfWyZJgzBpRTshzBsZ9ZaQupsqfD1iMWu11VT6Pa227RVIDmTvxepFvKdOm
 uEZrHf6MFHkFD3pnB7gDTq2sSEuASPsUFT5kobkyyJJpaC6xHXf1D/w2hjKUFLUzzDme
 Ix2ZUe9kIRiuop9qnAklMB4q9qPK42MaIhgo1u+Sy+yolBASOzFh4bczFhpdgeLinbPa zw== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.67])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34m5ftmmdm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Nov 2020 12:15:04 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Thu, 5 Nov 2020 17:15:03 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 5 Nov 2020 17:15:02 -0000
Received: from us1a3-mail158.a3.dal06.isc4sb.com ([10.146.71.209])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2020110517150181-639507 ;
 Thu, 5 Nov 2020 17:15:01 +0000 
In-Reply-To: <CACSj6VUNsH5c=de2xmNq-KhP9q76xV_BPw8o1JZ72DaKjOi2ww@mail.gmail.com>
Subject: Re: Dynamic layout for the Serial-Over-Lan window in phosphor-webui
From: "Derick Montague" <Derick.Montague@ibm.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Date: Thu, 5 Nov 2020 17:15:01 +0000
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CACSj6VUNsH5c=de2xmNq-KhP9q76xV_BPw8o1JZ72DaKjOi2ww@mail.gmail.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 24035
X-TNEFEvaluated: 1
Content-Type: text/plain; charset=UTF-8
x-cbid: 20110517-7279-0000-0000-000004037D7A
X-IBM-SpamModules-Scores: BY=0.023312; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.198754
X-IBM-SpamModules-Versions: BY=3.00014137; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01459606; UDB=6.00785371; IPR=6.01242259; 
 MB=3.00034878; MTD=3.00000008; XFM=3.00000015; UTC=2020-11-05 17:15:02
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-11-05 07:48:30 - 6.00012034
x-cbparentid: 20110517-7280-0000-0000-00009ACF91D1
Message-Id: <OFD37A2AD5.BA39933E-ON00258617.005D770D-00258617.005EC23F@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-05_10:2020-11-05,
 2020-11-05 signatures=0
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
Cc: aladyshev22@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> I was working on a Serial-Over-Lan layout in a phosphor-webui. For me
> it seems horribly broken

> I came up with a solution where a terminal window resizes according to
> the window changes.

I agree that the SOL layout in the phosphor-webui GUI does not provide a=20
good experience. It was also noted by Patrick Williams that the font stack
being used also did not provide a good experience. To that extent, IBM and
Intel, working with other community members that regularly attend the OpenB=
MC
GUI Design  Work Group, collaborated to improve the SOL and KVM over IP
experiences in the webui-vue GUI (www.github.com/openbmc/webui-vue). The
experience of the web based terminals are consistent and significantly=20
improved.

SOL: https://github.com/openbmc/webui-vue/issues/25
KVM: https://github.com/openbmc/webui-vue/issues/24

We have provide details on the reason for creating the webui-vue GUI
in the repo's README: https://github.com/openbmc/webui-vue#webui-vue
=20
Thank you!=20=20
=20=20=20
Derick Montague
IBM Cognitive Systems User Experience

