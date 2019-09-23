Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBFAC8801
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 14:11:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jw3h3xwNzDqXd
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 22:11:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=in.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=alpankum@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cF2S6lMRzDqHn
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 16:35:54 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8N6VrQ5036653
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 02:35:51 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.82])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v6qb1tujs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 02:35:51 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <alpankum@in.ibm.com>;
 Mon, 23 Sep 2019 06:35:51 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 23 Sep 2019 06:35:47 -0000
Received: from us1a3-mail215.a3.dal06.isc4sb.com ([10.146.77.137])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2019092306354702-140279 ;
 Mon, 23 Sep 2019 06:35:47 +0000 
In-Reply-To: <000001d5706b$2d921e60$88b65b20$@linux.intel.com>
From: "Alpana Kumari1" <alpankum@in.ibm.com>
To: yong.b.li@linux.intel.com
Date: Mon, 23 Sep 2019 06:35:46 +0000
Sensitivity: 
References: <000001d5706b$2d921e60$88b65b20$@linux.intel.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1619 | IBM Domino Build
 SCN1812108_20180501T0841_FP57 August 05, 2019 at 12:42
X-LLNOutbound: False
X-Disclaimed: 18551
X-TNEFEvaluated: 1
Content-Type: text/html; charset=UTF-8
x-cbid: 19092306-9463-0000-0000-000000E5E642
X-IBM-SpamModules-Scores: BY=0.174326; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=; MB=0.141190
X-IBM-SpamModules-Versions: BY=3.00011825; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01265295; UDB=6.00669333; IPR=6.01047239; 
 MB=3.00028761; MTD=3.00000008; XFM=3.00000015; UTC=2019-09-23 06:35:50
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-09-23 04:35:03 - 6.00010440
x-cbparentid: 19092306-9464-0000-0000-000028B4FB00
Message-Id: <OF2C925502.61CFC61B-ON0025847E.0023D3A6-0025847E.00243BE6@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 2 URL's were un-rewritten
MIME-Version: 1.0
Subject: Re:  HostWatchdogTimer related changes
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-23_02:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Wed, 02 Oct 2019 22:06:34 +1000
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
Cc: openbmc@lists.ozlabs.org, ed.tanous@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" >Hi,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >yes, It was on hold for long time, and later it was decid=
ed&nbsp; not to&nbsp; make this change.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Closed now.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Thanks,</div>
<div dir=3D"ltr" >Alpana</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: "Yong Li" &lt;yong=
.b.li@linux.intel.com&gt;<br>To: &lt;alpankum@in.ibm.com&gt;<br>Cc: "Tanous=
, Ed" &lt;ed.tanous@intel.com&gt;, "'OpenBMC Maillist'" &lt;openbmc@lists.o=
zlabs.org&gt;<br>Subject: [EXTERNAL] HostWatchdogTimer related changes<br>D=
ate: Sat, Sep 21, 2019 4:26 PM<br>&nbsp;<br><!--Notes ACF
<meta http-equiv=3DContent-Type content=3D"text/html; charset=3Dutf8" >--><=
!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit" >
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
<div><p style=3D"margin: 0px;" >Hi,<o:p></o:p></p>
<p style=3D"margin: 0px;" ><o:p>&nbsp;</o:p></p>
<p style=3D"margin: 0px;" >I noticed there is a code review submitted my yo=
u:<o:p></o:p></p>
<p style=3D"margin: 0px;" ><a href=3D"https://gerrit.openbmc-project.xyz/#/=
c/openbmc/bmcweb/+/20308/" target=3D"_blank">https://gerrit.openbmc-project=
.xyz/#/c/openbmc/bmcweb/+/20308/</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o=
:p></o:p></p>
<p style=3D"margin: 0px;" ><o:p>&nbsp;</o:p></p>
<p style=3D"margin: 0px;" >I noticed there is no any update for several day=
s. I am working on the related feature too:<o:p></o:p></p>
<p style=3D"margin: 0px;" ><a href=3D"https://gerrit.openbmc-project.xyz/#/=
c/openbmc/bmcweb/+/24532/" target=3D"_blank">https://gerrit.openbmc-project=
.xyz/#/c/openbmc/bmcweb/+/24532/</a><o:p></o:p></p>
<p style=3D"margin: 0px;" ><o:p>&nbsp;</o:p></p>
<p style=3D"margin: 0px;" >Could you please check on them?<o:p></o:p></p>
<p style=3D"margin: 0px;" ><o:p>&nbsp;</o:p></p>
<p style=3D"margin: 0px;" >If there is any comments/questions, just let me =
know.<o:p></o:p></p>
<p style=3D"margin: 0px;" ><o:p>&nbsp;</o:p></p>
<p style=3D"margin: 0px;" >Thanks,<o:p></o:p></p>
<p style=3D"margin: 0px;" >Yong<o:p></o:p></p>
<p style=3D"margin: 0px;" ><o:p>&nbsp;</o:p></p></div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>

