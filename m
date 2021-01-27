Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB7D306126
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 17:41:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQq9h388pzDqNZ
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 03:41:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bruce.mitchell@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KV0XOOtp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQq7c6ly6zDqjg
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 03:39:21 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10RGXGqU147135
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 11:39:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version : subject :
 to : cc : from : date : content-type : message-id; s=pp1;
 bh=WxokoKG+7DhqzytWbOhQntE2j0nm0g6ju0T8SHR0fqA=;
 b=KV0XOOtp/2eUHdXyseY82b62R5wX0tJ3jQ3b1MHCKCYVe4yAGRHDMPt6mw/8ixInmJwx
 bBwAyu9aIqiXvBYBCbKKZJep3OuvrvRWUHQAuLYkx6y07rcOjD35xVP0O0ws0kYWWc9b
 NdkG8B5IF/O+4Wx/U7tTX1LxbqjLnwELvVw3GEGTSFBDMPmAWGyHl013Wekz7VjQ1q1u
 77UF174BY031SghdQzy87Mc8IyyqFIk/hCfDzNsp2dVYjVNqDJsNadbXEXwWQXZHJGdU
 E4nK7KrNbYTlIH4zArersDDmj9lTv7Q4xSHEPyqKgHZCUccheYZb+UiwRgLy1N0biCSb 1g== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.75])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36aweeyyhg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 11:39:18 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Bruce.Mitchell@ibm.com>;
 Wed, 27 Jan 2021 16:39:17 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.123) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 27 Jan 2021 16:39:16 -0000
Received: from us1a3-mail31.a3.dal06.isc4sb.com ([10.146.6.26])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2021012716391578-506394 ;
 Wed, 27 Jan 2021 16:39:15 +0000 
MIME-Version: 1.0
Subject: SMP platform_can_cpu_hotplug() for the AST2600
To: openbmc@lists.ozlabs.org
From: "Bruce Mitchell" <Bruce.Mitchell@ibm.com>
Date: Wed, 27 Jan 2021 08:39:15 -0800
X-KeepSent: 6FAB2611:F453A139-0025866A:00599AC8;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 10.0.1FP5 April 28, 2020
X-LLNOutbound: False
X-Disclaimed: 15283
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=8FBB0CF9DFCA1C588f9e8a93df938690918c8FBB0CF9DFCA1C58"
Content-Disposition: inline
x-cbid: 21012716-6875-0000-0000-000004565CB3
X-IBM-SpamModules-Scores: BY=0.000001; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.423878; ST=0; TS=0; UL=0; ISC=; MB=0.000000
X-IBM-SpamModules-Versions: BY=3.00014629; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01499125; UDB=6.00808912; IPR=6.01281673; 
 MB=3.00035949; MTD=3.00000008; XFM=3.00000015; UTC=2021-01-27 16:39:16
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2021-01-27 11:06:07 - 6.00012253
x-cbparentid: 21012716-6876-0000-0000-000026605D4A
Message-Id: <OF6FAB2611.F453A139-ON0025866A.00599AC8-8825866A.005B7C0E@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-27_05:2021-01-27,
 2021-01-27 signatures=0
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
Cc: mark.rutland@arm.com, BMC-SW@aspeedtech.com, chiawei_wang@aspeedtech.com,
 troy_lee@aspeedtech.com, ryan_chen@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--0__=8FBB0CF9DFCA1C588f9e8a93df938690918c8FBB0CF9DFCA1C58
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


I have discussed this on Discord OpenBMC on kernel-and-uboot, but I do not
believe everyone is using Discord so I am expanding to a larger audience.

I am going to be implementing SMP hotplug for the AST2600.
Looking to see if ASPEED has any preference or suggestions regarding
cpu=5Fkill and cpu=5Fdie for CONFIG=5FHOTPLUG=5FCPU
that platform=5Fcan=5Fcpu=5Fhotplug() builds on so as to round out the SMP
implementation.

This is currently preventing kexec=5Fload() from succeeding.

Thank you.

--
Bruce

--0__=8FBB0CF9DFCA1C588f9e8a93df938690918c8FBB0CF9DFCA1C58
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><font size=3D"2">I have discussed this on Discord OpenBMC on=
 kernel-and-uboot, but I do not believe everyone is using Discord so I am e=
xpanding to a larger audience.</font><br><font size=3D"2"> </font><br><font=
 size=3D"2">I am going to be implementing SMP hotplug for the AST2600.</fon=
t><br><font size=3D"2">Looking to see if ASPEED has any preference or sugge=
stions regarding cpu=5Fkill and cpu=5Fdie for CONFIG=5FHOTPLUG=5FCPU</font>=
<br><font size=3D"2">that platform=5Fcan=5Fcpu=5Fhotplug() builds on so as =
to round out the SMP implementation.</font><br><br><font size=3D"2">This is=
 currently preventing kexec=5Fload() from succeeding. </font><br><br><font =
size=3D"2">Thank you.</font><br><br><font size=3D"2">-- </font><br><font si=
ze=3D"2">Bruce</font><BR>
</body></html>

--0__=8FBB0CF9DFCA1C588f9e8a93df938690918c8FBB0CF9DFCA1C58--

