Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE8E3063D6
	for <lists+openbmc@lfdr.de>; Wed, 27 Jan 2021 20:11:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQtWK571mzDqvN
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 06:11:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=bruce.mitchell@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=omBaYa58; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQtTr6XHgzDq7d
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 06:10:24 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10RIZ1h3096921
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 14:10:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 in-reply-to : to : cc : from : date : references : content-type :
 message-id : subject; s=pp1;
 bh=bkF3h6uRX8ek5Jt+n3G6siYkHkYWwT6Ij7hoFqy2aNk=;
 b=omBaYa58AawafR7ncfaEH7MPxVsTSDrZX3DN1u7bDzd3P5PZYU6CEaRA4CYdFWL9On0C
 kpN7maWn4UH8FJXa1pUk7R3dVU8oMfpv3naKhbFILiuRjwjv6qmZPBlQ6y272PNYsTez
 m85PIq2OtYBtTH+gqWW8sgg/rMQq4wXGOdWrmKs3Fcr8YjtRVnvgfa4KQA7SVUTjEQwC
 8/Kitu4xREbNQorIPcEBhAtJODCoZPR8lNuG70v913EigPBO6O882WaQ/vmxobQhSory
 vp172Uk5C1g2hHAVaggnE2hmZZkEoApF0zAV+LjiLuXyx1chZtr0L8xg6HNAxggh8Z+S eA== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36b5t4dxh1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jan 2021 14:10:21 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Bruce.Mitchell@ibm.com>;
 Wed, 27 Jan 2021 19:10:17 -0000
Received: from us1a3-smtp08.a3.dal06.isc4sb.com (10.146.103.57)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 27 Jan 2021 19:10:15 -0000
Received: from us1a3-mail31.a3.dal06.isc4sb.com ([10.146.6.26])
 by us1a3-smtp08.a3.dal06.isc4sb.com
 with ESMTP id 2021012719101537-606378 ;
 Wed, 27 Jan 2021 19:10:15 +0000 
MIME-Version: 1.0
In-Reply-To: <OF6FAB2611.F453A139-ON0025866A.00599AC8-8825866A.005B7C0E@notes.na.collabserv.com>
To: "Bruce Mitchell" <Bruce.Mitchell@ibm.com>
From: "Bruce Mitchell" <Bruce.Mitchell@ibm.com>
Date: Wed, 27 Jan 2021 11:10:15 -0800
References: <OF6FAB2611.F453A139-ON0025866A.00599AC8-8825866A.005B7C0E@notes.na.collabserv.com>
X-KeepSent: FE3E13BE:5FAFE791-0025866A:00693889;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 10.0.1FP5 April 28, 2020
X-LLNOutbound: False
X-Disclaimed: 34251
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=8FBB0CF9DFFABE198f9e8a93df938690918c8FBB0CF9DFFABE19"
x-cbid: 21012719-1335-0000-0000-000005D08DE2
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.386041; ST=0; TS=0; UL=0; ISC=; MB=0.013632
X-IBM-SpamModules-Versions: BY=3.00014630; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01499176; UDB=6.00808942; IPR=6.01281723; 
 MB=3.00035950; MTD=3.00000008; XFM=3.00000015; UTC=2021-01-27 19:10:16
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2021-01-27 16:17:08 - 6.00012254
x-cbparentid: 21012719-1336-0000-0000-000041758FDC
Message-Id: <OFFE3E13BE.5FAFE791-ON0025866A.00693889-8825866A.00694EFC@notes.na.collabserv.com>
Subject: Re:  SMP platform_can_cpu_hotplug() for the AST2600
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-27_06:2021-01-27,
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
Cc: mark.rutland@arm.com, BMC-SW@aspeedtech.com, troy_lee@aspeedtech.com,
 ryan_chen@aspeedtech.com, chiawei_wang@aspeedtech.com,
 openbmc <openbmc-bounces+bruce.mitchell=ibm.com@lists.ozlabs.org>,
 openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0__=8FBB0CF9DFFABE198f9e8a93df938690918c8FBB0CF9DFFABE19
Content-type: multipart/alternative; 
	Boundary="1__=8FBB0CF9DFFABE198f9e8a93df938690918c8FBB0CF9DFFABE19"


--1__=8FBB0CF9DFFABE198f9e8a93df938690918c8FBB0CF9DFFABE19
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


To be specific how do I implement cpu=5Fkill and cpu=5Fdie on AST2600?



From:	"Bruce Mitchell" <Bruce.Mitchell@ibm.com>
To:	openbmc@lists.ozlabs.org
Cc:	mark.rutland@arm.com, BMC-SW@aspeedtech.com,
            chiawei=5Fwang@aspeedtech.com, troy=5Flee@aspeedtech.com,
            ryan=5Fchen@aspeedtech.com
Date:	01/27/2021 08:41
Subject:	[EXTERNAL] SMP platform=5Fcan=5Fcpu=5Fhotplug() for the AST2600
Sent by:	"openbmc" <openbmc-bounces
            +bruce.mitchell=3Dibm.com@lists.ozlabs.org>



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


--1__=8FBB0CF9DFFABE198f9e8a93df938690918c8FBB0CF9DFFABE19
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><font size=3D"2" face=3D"Calibri">To be specific how do I im=
plement cpu=5Fkill and cpu=5Fdie on AST2600?</font><br><br><img width=3D"16=
" height=3D"16" src=3D"cid:1=5F=5F=3D8FBB0CF9DFFABE198f9e8a93df938690918c8F=
B@" border=3D"0" alt=3D"Inactive hide details for &quot;Bruce Mitchell&quot=
; ---01/27/2021 08:41:11---I have discussed this on Discord OpenBMC on kern=
el-and-uboo"><font size=3D"2" color=3D"#424282">&quot;Bruce Mitchell&quot; =
---01/27/2021 08:41:11---I have discussed this on Discord OpenBMC on kernel=
-and-uboot, but I do not believe everyone is using</font><br><br><font size=
=3D"2" color=3D"#5F5F5F">From:        </font><font size=3D"2">&quot;Bruce M=
itchell&quot; &lt;Bruce.Mitchell@ibm.com&gt;</font><br><font size=3D"2" col=
or=3D"#5F5F5F">To:        </font><font size=3D"2">openbmc@lists.ozlabs.org<=
/font><br><font size=3D"2" color=3D"#5F5F5F">Cc:        </font><font size=
=3D"2">mark.rutland@arm.com, BMC-SW@aspeedtech.com, chiawei=5Fwang@aspeedte=
ch.com, troy=5Flee@aspeedtech.com, ryan=5Fchen@aspeedtech.com</font><br><fo=
nt size=3D"2" color=3D"#5F5F5F">Date:        </font><font size=3D"2">01/27/=
2021 08:41</font><br><font size=3D"2" color=3D"#5F5F5F">Subject:        </f=
ont><font size=3D"2">[EXTERNAL] SMP platform=5Fcan=5Fcpu=5Fhotplug() for th=
e AST2600</font><br><font size=3D"2" color=3D"#5F5F5F">Sent by:        </fo=
nt><font size=3D"2">&quot;openbmc&quot; &lt;openbmc-bounces+bruce.mitchell=
=3Dibm.com@lists.ozlabs.org&gt;</font><br><hr width=3D"100%" size=3D"2" ali=
gn=3D"left" noshade style=3D"color:#8091A5; "><br><br><br><font size=3D"2">=
I have discussed this on Discord OpenBMC on kernel-and-uboot, but I do not =
believe everyone is using Discord so I am expanding to a larger audience.</=
font><br><font size=3D"2"><br>I am going to be implementing SMP hotplug for=
 the AST2600.<br>Looking to see if ASPEED has any preference or suggestions=
 regarding cpu=5Fkill and cpu=5Fdie for CONFIG=5FHOTPLUG=5FCPU<br>that plat=
form=5Fcan=5Fcpu=5Fhotplug() builds on so as to round out the SMP implement=
ation.</font><br><font size=3D"2"><br>This is currently preventing kexec=5F=
load() from succeeding. </font><br><font size=3D"2"><br>Thank you.</font><b=
r><font size=3D"2"><br>-- <br>Bruce</font><br><br><BR>
</body></html>

--1__=8FBB0CF9DFFABE198f9e8a93df938690918c8FBB0CF9DFFABE19--


--0__=8FBB0CF9DFFABE198f9e8a93df938690918c8FBB0CF9DFFABE19
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=8FBB0CF9DFFABE198f9e8a93df938690918c8FB@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=8FBB0CF9DFFABE198f9e8a93df938690918c8FBB0CF9DFFABE19--

