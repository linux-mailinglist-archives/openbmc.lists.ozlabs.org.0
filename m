Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B8B2CB0A6
	for <lists+openbmc@lfdr.de>; Wed,  2 Dec 2020 00:08:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClyT60mZkzDqj1
	for <lists+openbmc@lfdr.de>; Wed,  2 Dec 2020 10:08:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bruce.mitchell@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=D3WQjwmX; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClySF32Q8zDqSl
 for <openbmc@lists.ozlabs.org>; Wed,  2 Dec 2020 10:07:50 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B1N40fx065508
 for <openbmc@lists.ozlabs.org>; Tue, 1 Dec 2020 18:07:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version : subject :
 to : from : date : content-type : message-id; s=pp1;
 bh=hDmkYFJ86+hi6+cN7ikq2E8uTwF6Jt8ftQpsHPkjybc=;
 b=D3WQjwmXaD3rpqhx7VTxdyNiUCJy0DaRGMY5Igx8er/2r9DGSlUBBy79LZ2iwZ5/IX7y
 glFvyCj0WqESefnYkY5J+FNLX/CAMxEL7yG9IN7BM6W9ufqOP89AJq6aPQujZpriL2FR
 aJREcbN6QZHc7jmYcHPCGT7B6X+U2Pmll4575kb1tYsXUOU4GyVkDzCr66aSst1zlhYg
 tP8npbLSsRdlY1C3Vm1fVy0jyWdAQeayjuiZndCMux8chBWw/1c7GW2sz3we0/2aRVVi
 9mCCObbxDqA5JXwpmhDrhu55dmu47bLWfMxgq7oc3YF2SKKX3eRhMbx1/86S1Xr09TDy Kg== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.91])
 by mx0b-001b2d01.pphosted.com with ESMTP id 355jwvf2rg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 01 Dec 2020 18:07:47 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Bruce.Mitchell@ibm.com>;
 Tue, 1 Dec 2020 23:07:46 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 1 Dec 2020 23:07:45 -0000
Received: from us1a3-mail31.a3.dal06.isc4sb.com ([10.146.6.26])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2020120123074516-829401 ;
 Tue, 1 Dec 2020 23:07:45 +0000 
MIME-Version: 1.0
Subject: Seeking advice on building and using kdump with OpenBMC.
To: openbmc@lists.ozlabs.org
From: "Bruce Mitchell" <Bruce.Mitchell@ibm.com>
Date: Tue, 1 Dec 2020 15:07:45 -0800
X-KeepSent: D6833344:166C4341-00258631:007EBD09;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 10.0.1FP5 April 28, 2020
X-LLNOutbound: False
X-Disclaimed: 53971
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=8FBB0CA2DFED3B998f9e8a93df938690918c8FBB0CA2DFED3B99"
Content-Disposition: inline
x-cbid: 20120123-2475-0000-0000-000004A5D4B6
X-IBM-SpamModules-Scores: BY=0.000005; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.423878; ST=0; TS=0; UL=0; ISC=; MB=0.000004
X-IBM-SpamModules-Versions: BY=3.00014293; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01471966; UDB=6.00792728; IPR=6.01254613; 
 MB=3.00035308; MTD=3.00000008; XFM=3.00000015; UTC=2020-12-01 23:07:46
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-12-01 17:54:34 - 6.00012103
x-cbparentid: 20120123-2476-0000-0000-0000DB36E1DD
Message-Id: <OFD6833344.166C4341-ON00258631.007EBD09-88258631.007F0D6B@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-01_12:2020-11-30,
 2020-12-01 signatures=0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--0__=8FBB0CA2DFED3B998f9e8a93df938690918c8FBB0CA2DFED3B99
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


Seeking advice on building and using kdump with OpenBMC.
Are there any Best Known Methods?
Any troubles and/or issues to lookout for?
What should I avoid?

Are there any security concerns?

Thank you!

--
Bruce

--0__=8FBB0CA2DFED3B998f9e8a93df938690918c8FBB0CA2DFED3B99
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><font size=3D"2">Seeking advice on building and using kdump =
with OpenBMC.</font><br><font size=3D"2">Are there any Best Known Methods?<=
/font><br><font size=3D"2">Any troubles and/or issues to lookout for?</font=
><br><font size=3D"2">What should I avoid?</font><br><br><font size=3D"2">A=
re there any security concerns?</font><br><br><font size=3D"2">Thank you!</=
font><br><br><font size=3D"2">-- </font><br><font size=3D"2">Bruce</font><B=
R>
</body></html>

--0__=8FBB0CA2DFED3B998f9e8a93df938690918c8FBB0CA2DFED3B99--

