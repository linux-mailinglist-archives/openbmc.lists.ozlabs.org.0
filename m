Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E32B1BE13E
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 17:27:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dhkV3qmvzDqld
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 01:27:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=youhour@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dhjV3tdczDqlJ
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 01:26:19 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8PFNfBL106514
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 11:26:14 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.93])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v8a6b24sk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 11:26:14 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <youhour@us.ibm.com>;
 Wed, 25 Sep 2019 15:26:13 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.39) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 25 Sep 2019 15:26:11 -0000
Received: from us1a3-mail23.a3.dal06.isc4sb.com ([10.146.6.50])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2019092515261075-681162 ;
 Wed, 25 Sep 2019 15:26:10 +0000 
MIME-Version: 1.0
Subject: bitbake failed on dhcp
To: openbmc@lists.ozlabs.org
From: "Michael Lim" <youhour@us.ibm.com>
Date: Wed, 25 Sep 2019 10:26:13 -0500
X-KeepSent: 20D322C6:2FBF2CBD-00258480:00540EEF;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP10 SHF252 August 10, 2018
X-LLNOutbound: False
X-Disclaimed: 39755
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=8FBB0E13DFC7887F8f9e8a93df938690918c8FBB0E13DFC7887F"
Content-Disposition: inline
x-cbid: 19092515-8889-0000-0000-0000008E1495
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.423878; ST=0; TS=0; UL=0; ISC=; MB=0.002013
X-IBM-SpamModules-Versions: BY=3.00011838; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01266404; UDB=6.00670007; IPR=6.01048375; 
 MB=3.00028804; MTD=3.00000008; XFM=3.00000015; UTC=2019-09-25 15:26:12
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-09-25 12:09:23 - 6.00010449
x-cbparentid: 19092515-8890-0000-0000-000000D01424
Message-Id: <OF20D322C6.2FBF2CBD-ON00258480.00540EEF-86258480.0054CC48@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-25_07:, , signatures=0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--0__=8FBB0E13DFC7887F8f9e8a93df938690918c8FBB0E13DFC7887F
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


I'm using openbmc "warrior" branch.

I setup to do a bitbake and adding the following line to the local.conf
IMAGE=5FINSTALL=5Fappend +=3D "dhcp ".  bitbake failed with "ERROR: Required
build target 'core-image-minimal' has no buildable providers."
More error info below...

I ran "bitbake dhcp"  and it seems to work fine.

dhcp recipe locates here
./poky/meta/recipes-connectivity/dhcp/dhcp=5F4.4.1.bb

./poky/meta layer is in my bblayers.conf

Any thought what I'm missing?  Any hint where to look for error info?


********************************************
(openbmc)[youhour@gfwa180 build]$ bitbake core-image-minimal
NOTE: Bitbake server didn't start within 5 seconds, waiting for 90
Parsing recipes: 100% |
###########################################################################=
################################################|
 Time: 0:03:00
Parsing of 2520 .bb files complete (0 cached, 2520 parsed). 3713 targets,
358 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES
'dhcp' (but /esw/san5/youhour/obmc/obmc=5F20190918a/openbmc/meta/recipes-co=
re/images/core-image-minimal.bb
 RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'dhcp' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['dhcp']
ERROR: Required build target 'core-image-minimal' has no buildable
providers.
Missing or unbuildable dependency chain was: ['core-image-minimal', 'dhcp']

Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
***************************************************************************


Thanks in advance.

Best Regards,
Michael Y. Lim

HW VPD Template
Boston SFO


Office:     045/C-08
Tie Line:  363-7244
Phone:   (512) 286-7244
email:  youhour@us.ibm.com

--0__=8FBB0E13DFC7887F8f9e8a93df938690918c8FBB0E13DFC7887F
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><font size=3D"2">I'm using openbmc &quot;warrior&quot; branc=
h.</font><br><br><font size=3D"2">I setup to do a bitbake and adding the fo=
llowing line to the local.conf </font><br><font size=3D"2">IMAGE=5FINSTALL=
=5Fappend +=3D &quot;dhcp &quot;.  bitbake failed with </font><font size=3D=
"2" color=3D"#FF0000">&quot;ERROR: Required build target 'core-image-minima=
l' has no buildable providers.&quot; </font><br><font size=3D"2">More error=
 info below...</font><br><br><font size=3D"2">I ran &quot;bitbake dhcp&quot=
;  and it seems to work fine.</font><br><br><font size=3D"2">dhcp recipe lo=
cates here</font><br><font size=3D"2">./poky/meta/recipes-connectivity/dhcp=
/dhcp=5F4.4.1.bb</font><br><br><font size=3D"2">./poky/meta layer is in my =
bblayers.conf </font><br><br><font size=3D"2">Any thought what I'm missing?=
  Any hint where to look for error info? </font><br><br><br><font size=3D"2=
">********************************************</font><br><font size=3D"2">(=
openbmc)[youhour@gfwa180 build]$ bitbake core-image-minimal</font><br><font=
 size=3D"2">NOTE: Bitbake server didn't start within 5 seconds, waiting for=
 90</font><br><font size=3D"2">Parsing recipes: 100% |#####################=
###########################################################################=
###########################| Time: 0:03:00</font><br><font size=3D"2">Parsi=
ng of 2520 .bb files complete (0 cached, 2520 parsed). 3713 targets, 358 sk=
ipped, 0 masked, 0 errors.</font><br><font size=3D"2">NOTE: Resolving any m=
issing task queue dependencies</font><br><font size=3D"2" color=3D"#FF0000"=
>ERROR: Nothing RPROVIDES 'dhcp' (but /esw/san5/youhour/obmc/obmc=5F2019091=
8a/openbmc/meta/recipes-core/images/core-image-minimal.bb RDEPENDS on or ot=
herwise requires it)</font><br><font size=3D"2">NOTE: Runtime target 'dhcp'=
 is unbuildable, removing...</font><br><font size=3D"2">Missing or unbuilda=
ble dependency chain was: ['dhcp']</font><br><font size=3D"2" color=3D"#FF0=
000">ERROR: Required build target 'core-image-minimal' has no buildable pro=
viders.</font><br><font size=3D"2" color=3D"#FF0000">Missing or unbuildable=
 dependency chain was: ['core-image-minimal', 'dhcp']</font><br><br><font s=
ize=3D"2">Summary: There were 2 ERROR messages shown, returning a non-zero =
exit code.</font><br><font size=3D"2">*************************************=
**************************************</font><br><br><br><font size=3D"2">T=
hanks in advance.<br><br>Best Regards,<br>Michael Y. Lim<br> <br>HW VPD Tem=
plate<br>Boston SFO<br><br><br>Office:     045/C-08<br>Tie Line:  363-7244<=
br>Phone:   (512) 286-7244<br>email:  youhour@us.ibm.com<br></font><BR>
</body></html>

--0__=8FBB0E13DFC7887F8f9e8a93df938690918c8FBB0E13DFC7887F--

