Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E542CB154
	for <lists+openbmc@lfdr.de>; Wed,  2 Dec 2020 01:11:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Clzsw1YfGzDqxX
	for <lists+openbmc@lfdr.de>; Wed,  2 Dec 2020 11:11:48 +1100 (AEDT)
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
 header.s=pp1 header.b=T9Od/shd; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Clzrk0n0FzDqgF
 for <openbmc@lists.ozlabs.org>; Wed,  2 Dec 2020 11:10:44 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B202ifO105992
 for <openbmc@lists.ozlabs.org>; Tue, 1 Dec 2020 19:10:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 in-reply-to : to : from : date : references : content-type : message-id :
 subject; s=pp1; bh=MtL95hA6ieTd2GwqzQ6J6FQwY9jN7MOuMtgSoaUC5dI=;
 b=T9Od/shdveCi4G32fwjMWXcA0PNVYYDusoaTlAJwpRatLrVxUINElXvmX3DauoM7BR+0
 TKKHLkvBRBJZ3z1ZDJW+3MiKwBfZQuGN0nYGcaqsvWCVVtXzHQZ3bavChMCv+fuNt0oW
 9anE99Ic+t2KJn9TViColSPVaGryxnngfFqPZVjGBVwDJWQxsNUdbYa+QEVKiyZEBAkB
 TUz1PZF2hMusXcLnmTH+dm0hHhw5HhzOJzLmsAwSNngoZBWKncOE2j2YEVpJYg2w4dzR
 hmIUVqnEgbq1/Up5Hhh3khnb40WW4rOKMk4CDNjA/aD/n5/pG6Dh/l93am0R9Rmmd0tN ww== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.66])
 by mx0b-001b2d01.pphosted.com with ESMTP id 355j4fv9c9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 01 Dec 2020 19:10:39 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Bruce.Mitchell@ibm.com>;
 Wed, 2 Dec 2020 00:10:39 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 2 Dec 2020 00:10:37 -0000
Received: from us1a3-mail31.a3.dal06.isc4sb.com ([10.146.6.26])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2020120200103632-870227 ;
 Wed, 2 Dec 2020 00:10:36 +0000 
MIME-Version: 1.0
In-Reply-To: <OFD6833344.166C4341-ON00258631.007EBD09-88258631.007F0D6B@notes.na.collabserv.com>
To: openbmc@lists.ozlabs.org
From: "Bruce Mitchell" <Bruce.Mitchell@ibm.com>
Date: Tue, 1 Dec 2020 16:10:36 -0800
References: <OFD6833344.166C4341-ON00258631.007EBD09-88258631.007F0D6B@notes.na.collabserv.com>
X-KeepSent: 8EC2E0B3:F804468E-00258632:0000C9CB;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 10.0.1FP5 April 28, 2020
X-LLNOutbound: False
X-Disclaimed: 20539
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=8FBB0CA1DF934F5B8f9e8a93df938690918c8FBB0CA1DF934F5B"
x-cbid: 20120200-4409-0000-0000-0000042BDC0C
X-IBM-SpamModules-Scores: BY=0.000359; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.373977; ST=0; TS=0; UL=0; ISC=; MB=0.270494
X-IBM-SpamModules-Versions: BY=3.00014293; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01471987; UDB=6.00792741; IPR=6.01254634; 
 MB=3.00035309; MTD=3.00000008; XFM=3.00000015; UTC=2020-12-02 00:10:37
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-12-01 17:50:36 - 6.00012103
x-cbparentid: 20120200-4410-0000-0000-0000A63BE53A
Message-Id: <OF8EC2E0B3.F804468E-ON00258632.0000C9CB-88258632.0000F872@notes.na.collabserv.com>
Subject: Re:  Seeking advice on building and using kdump with OpenBMC.
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

--0__=8FBB0CA1DF934F5B8f9e8a93df938690918c8FBB0CA1DF934F5B
Content-type: multipart/alternative; 
	Boundary="1__=8FBB0CA1DF934F5B8f9e8a93df938690918c8FBB0CA1DF934F5B"


--1__=8FBB0CA1DF934F5B8f9e8a93df938690918c8FBB0CA1DF934F5B
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


In addition both Yocto and OpenBMC have kexec / kdump in the
poky/meta/recipes-kernel/kexec/kexec-tools directories and
poky/meta/recipes-kernel/kexec/kexec-tools=5F2.0.20.bb .  So I  am looking
for guidance on what the higher level perspective is beyond just pulling in
kdump and building a BMC.  I assume there is configuration that both Yocto
and OpenBMC have kexec / kdump in the
poky/meta/recipes-kernel/kexec/kexec-tools directories and
poky/meta/recipes-kernel/kexec/kexec-tools=5F2.0.20.bb .  So I  am looking
for guidance on what the higher level perspective is beyond just pulling in
kdump and building a BMC.  I assume there is configuration that are more
useful for the OpenBMC community.




Seeking advice on building and using kdump with OpenBMC.
Are there any Best Known Methods?
Any troubles and/or issues to lookout for?
What should I avoid?

Are there any security concerns?

Thank you!

--
Bruce


--1__=8FBB0CA1DF934F5B8f9e8a93df938690918c8FBB0CA1DF934F5B
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><font size=3D"2">In addition both Yocto and OpenBMC have kex=
ec / kdump in the poky/meta/recipes-kernel/kexec/kexec-tools directories an=
d poky/meta/recipes-kernel/kexec/kexec-tools=5F2.0.20.bb .  So I  am lookin=
g for guidance on what the higher level perspective is beyond just pulling =
in kdump and building a BMC.  I assume there is configuration that both Yoc=
to and OpenBMC have kexec / kdump in the poky/meta/recipes-kernel/kexec/kex=
ec-tools directories and poky/meta/recipes-kernel/kexec/kexec-tools=5F2.0.2=
0.bb .  So I  am looking for guidance on what the higher level perspective =
is beyond just pulling in kdump and building a BMC.  I assume there is conf=
iguration that are more useful for the OpenBMC community.</font><br><br><im=
g width=3D"16" height=3D"16" src=3D"cid:1=5F=5F=3D8FBB0CA1DF934F5B8f9e8a93d=
f938690918c8FB@" border=3D"0" alt=3D"Inactive hide details for &quot;Bruce =
Mitchell&quot; ---12/01/2020 15:08:38---Seeking advice on building and usin=
g kdump with OpenBMC. Ar"><font size=3D"2" color=3D"#424282">&quot;Bruce Mi=
tchell&quot; ---12/01/2020 15:08:38---Seeking advice on building and using =
kdump with OpenBMC. Are there any Best Known Methods?</font><br><br><br><fo=
nt size=3D"2">Seeking advice on building and using kdump with OpenBMC.<br>A=
re there any Best Known Methods?<br>Any troubles and/or issues to lookout f=
or?<br>What should I avoid?</font><br><font size=3D"2"><br>Are there any se=
curity concerns?</font><br><font size=3D"2"><br>Thank you!</font><br><font =
size=3D"2"><br>-- <br>Bruce</font><br><br><BR>
</body></html>

--1__=8FBB0CA1DF934F5B8f9e8a93df938690918c8FBB0CA1DF934F5B--


--0__=8FBB0CA1DF934F5B8f9e8a93df938690918c8FBB0CA1DF934F5B
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=8FBB0CA1DF934F5B8f9e8a93df938690918c8FB@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=8FBB0CA1DF934F5B8f9e8a93df938690918c8FBB0CA1DF934F5B--

