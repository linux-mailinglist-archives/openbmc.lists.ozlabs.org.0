Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CFCBD8CC
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 09:11:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dTk663MnzDqdl
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 17:11:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=in.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sivas.srr@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dTj60rPPzDqVK
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 17:10:13 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8P76DTJ098917
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 03:10:10 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.109])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v80gne94u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 03:10:10 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <sivas.srr@in.ibm.com>;
 Wed, 25 Sep 2019 07:10:09 -0000
Received: from us1b3-smtp04.a3dr.sjc01.isc4sb.com (10.122.203.161)
 by smtp.notes.na.collabserv.com (10.122.47.48) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 25 Sep 2019 07:10:04 -0000
Received: from us1b3-mail65.a3dr.sjc01.isc4sb.com ([10.122.7.228])
 by us1b3-smtp04.a3dr.sjc01.isc4sb.com
 with ESMTP id 2019092507100386-150104 ;
 Wed, 25 Sep 2019 07:10:03 +0000 
In-Reply-To: <gcJgOuxYS4Cxh1DTuyIwbad8Dep30bKCasyE2I4YOJ8K4SZ-nuK9SWjh9Jaural_Eo3mSVWHiCGEk6QZZHUUAe3F9UhsQYTuXumP6_aitGE=@protonmail.com>
From: "Sivas Srr" <sivas.srr@in.ibm.com>
To: rgrs@protonmail.com
Date: Wed, 25 Sep 2019 07:10:04 +0000
Sensitivity: 
MIME-Version: 1.0
References: <gcJgOuxYS4Cxh1DTuyIwbad8Dep30bKCasyE2I4YOJ8K4SZ-nuK9SWjh9Jaural_Eo3mSVWHiCGEk6QZZHUUAe3F9UhsQYTuXumP6_aitGE=@protonmail.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1619 | IBM Domino Build
 SCN1812108_20180501T0841_FP57 August 05, 2019 at 12:42
X-KeepSent: E52CB78F:11769FB0-00258480:0026802E;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 53579
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 19092507-1429-0000-0000-00000057B28D
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.407427; ST=0; TS=0; UL=0; ISC=; MB=0.000832
X-IBM-SpamModules-Versions: BY=3.00011836; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01266245; UDB=6.00669908; IPR=6.01048210; 
 MB=3.00028799; MTD=3.00000008; XFM=3.00000015; UTC=2019-09-25 07:10:07
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-09-25 00:16:13 - 6.00010447
x-cbparentid: 19092507-1430-0000-0000-0000245DE2A5
Message-Id: <OFE52CB78F.11769FB0-ON00258480.0026802E-00258480.00275FD3@notes.na.collabserv.com>
Subject: Re:  How can I reset BMC to factory-defaults?
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-25_04:, , signatures=0
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

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" >Hi Raj,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >For factory reset,</div>
<div dir=3D"ltr" >you can issue following commands at OpenBMC prompt.</div>
<div dir=3D"ltr" >/sbin/fw=5Fsetenv rwreset true</div>
<div dir=3D"ltr" ><div style=3D"margin-bottom:0cm;margin-bottom:.0001pt;lin=
e-height:&amp;#xA;" >&nbsp;</div>
<div style=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-height:&amp;#xA;=
" >After the above command, Do BMC reboot. But you should have your serial =
connection with you.</div>
<div style=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-height:&amp;#xA;=
" >Because you will loose your BMC IP address settings as well.</div>
<div style=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-height:&amp;#xA;=
" >&nbsp;</div>
<div style=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-height:&amp;#xA;=
" >You can do factory reset from U-boot prompt as well.</div>
<div style=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-height:&amp;#xA;=
" ><div style=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-height:&amp;#=
xA;" >setenv rwreset true</div>
<div style=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-height:&amp;#xA;=
" >saveenv</div></div>
<div style=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-height:&amp;#xA;=
" >&nbsp;</div>
<div style=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-height:&amp;#xA;=
" >Then let it boot. Once it booted to BMC, you can confirm by checking you=
r BMC ip address etc.</div>
<div style=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-height:&amp;#xA;=
" >&nbsp;</div>
<div style=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-height:&amp;#xA;=
" >Wtih regards,</div>
<div style=3D"margin-bottom:0cm;margin-bottom:.0001pt;line-height:&amp;#xA;=
" >Sivas</div></div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: rgrs &lt;rgrs@prot=
onmail.com&gt;<br>Sent by: "openbmc" &lt;openbmc-bounces+sivas.srr=3Din.ibm=
.com@lists.ozlabs.org&gt;<br>To: "openbmc@lists.ozlabs.org" &lt;openbmc@lis=
ts.ozlabs.org&gt;<br>Cc:<br>Subject: [EXTERNAL] How can I reset BMC to fact=
ory-defaults?<br>Date: Wed, Sep 25, 2019 12:22 PM<br>&nbsp;<br><font size=
=3D"3" >Hi Everyone,</font><br><br><font size=3D"3" >I think my flash/files=
ystem is corrupt, I get new certs generated at every reboot of BMC.</font><=
br><font size=3D"3" >None of the settings are persistent. </font><br><br><f=
ont size=3D"3" >Is there a way to restore/recreate the partitions without u=
sing SPI programmer?</font><br><br><font size=3D"3" >Thanks,</font><br><fon=
t size=3D"3" >Raj</font></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>

