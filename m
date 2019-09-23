Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 35639C8812
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 14:15:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jw7s23qszDqNH
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 22:15:21 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cGGr1ddNzDqH6
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 17:31:47 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8N7RsUb019637
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 03:31:45 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.114])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v6qedm8gs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 03:31:44 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <alpankum@in.ibm.com>;
 Mon, 23 Sep 2019 07:31:44 -0000
Received: from us1b3-smtp03.a3dr.sjc01.isc4sb.com (10.122.7.173)
 by smtp.notes.na.collabserv.com (10.122.47.58) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 23 Sep 2019 07:31:41 -0000
Received: from us1b3-mail213.a3dr.sjc03.isc4sb.com ([10.168.5.53])
 by us1b3-smtp03.a3dr.sjc01.isc4sb.com
 with ESMTP id 2019092307314153-185002 ;
 Mon, 23 Sep 2019 07:31:41 +0000 
In-Reply-To: <000401d571dc$af8e2590$0eaa70b0$@linux.intel.com>
From: "Alpana Kumari1" <alpankum@in.ibm.com>
To: yong.b.li@linux.intel.com
Date: Mon, 23 Sep 2019 07:31:40 +0000
Sensitivity: 
References: <000401d571dc$af8e2590$0eaa70b0$@linux.intel.com>,
 <000001d5706b$2d921e60$88b65b20$@linux.intel.com>
 <OF2C925502.61CFC61B-ON0025847E.0023D3A6-0025847E.00243BE6@notes.na.collabserv.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1619 | IBM Domino Build
 SCN1812108_20180501T0841_FP57 August 05, 2019 at 12:42
X-KeepSent: E885D3E0:61402ED5-0025847E:00293620;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 61363
X-TNEFEvaluated: 1
Content-Type: text/html; charset=UTF-8
x-cbid: 19092307-1639-0000-0000-00000072A443
X-IBM-SpamModules-Scores: BY=0.171295; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.360817; ST=0; TS=0; UL=0; ISC=; MB=0.005921
X-IBM-SpamModules-Versions: BY=3.00011825; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01265314; UDB=6.00669344; IPR=6.01047257; 
 MB=3.00028761; MTD=3.00000008; XFM=3.00000015; UTC=2019-09-23 07:31:44
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-09-23 04:41:10 - 6.00010440
x-cbparentid: 19092307-1640-0000-0000-000000B5ACD2
Message-Id: <OFE885D3E0.61402ED5-ON0025847E.00293620-0025847E.00295A2B@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 2 URL's were un-rewritten
MIME-Version: 1.0
Subject: RE: HostWatchdogTimer related changes
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
<div dir=3D"ltr" >please check&nbsp; <span class=3D"style-scope gr-account-=
label" ><span class=3D"text  style-scope gr-account-label" ><span class=3D"=
name style-scope gr-account-label" >Vishwanatha Subbanna</span></span></spa=
n>'s&nbsp; comment on Patch set 8 here-</div>
<div dir=3D"ltr" ><a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/b=
mcweb/+/19751">https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/19751<=
/a></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Thanks,</div>
<div dir=3D"ltr" >Alpana</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: "Yong Li" &lt;yong=
.b.li@linux.intel.com&gt;<br>To: "'Alpana Kumari1'" &lt;alpankum@in.ibm.com=
&gt;<br>Cc: &lt;ed.tanous@intel.com&gt;, &lt;openbmc@lists.ozlabs.org&gt;<b=
r>Subject: [EXTERNAL] RE: HostWatchdogTimer related changes<br>Date: Mon, S=
ep 23, 2019 12:31 PM<br>&nbsp;<br><!--Notes ACF
<meta http-equiv=3DContent-Type content=3D"text/html; charset=3Dutf8" >--><=
!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit" >
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
<div><p style=3D"margin: 0px;" >Hi Alpana,<o:p></o:p></p>
<p style=3D"margin: 0px;" ><o:p>&nbsp;</o:p></p>
<p style=3D"margin: 0px;" >Thanks for your update! Just curious why =E2=80=
=9Cnot to make this change=E2=80=9D?&nbsp; I think it is useful to add it i=
nto redfish.<o:p></o:p></p>
<p style=3D"margin: 0px;" ><o:p>&nbsp;</o:p></p>
<p style=3D"margin: 0px;" >Thanks,<o:p></o:p></p>
<p style=3D"margin: 0px;" >Yong<o:p></o:p></p>
<p style=3D"margin: 0px;" ><a name=3D"_____replyseparator" target=3D"_blank=
" ></a><b>From:</b> Alpana Kumari1 &lt;alpankum@in.ibm.com&gt;<br><b>Sent:<=
/b> Monday, September 23, 2019 2:36 PM<br><b>To:</b> yong.b.li@linux.intel.=
com<br><b>Cc:</b> ed.tanous@intel.com; openbmc@lists.ozlabs.org<br><b>Subje=
ct:</b> Re: HostWatchdogTimer related changes<o:p></o:p></p>
<p style=3D"margin: 0px;" ><o:p>&nbsp;</o:p></p>
<div><div><p style=3D"margin: 0px;" ><span style=3D"font-size:10.0pt;font-f=
amily:&quot;Arial&quot;,sans-serif" >Hi,<o:p></o:p></span></p></div>
<div><p style=3D"margin: 0px;" ><span style=3D"font-size:10.0pt;font-family=
:&quot;Arial&quot;,sans-serif" >&nbsp;<o:p></o:p></span></p></div>
<div><p style=3D"margin: 0px;" ><span style=3D"font-size:10.0pt;font-family=
:&quot;Arial&quot;,sans-serif" >yes, It was on hold for long time, and late=
r it was decided&nbsp; not to&nbsp; make this change.<o:p></o:p></span></p>=
</div>
<div><p style=3D"margin: 0px;" ><span style=3D"font-size:10.0pt;font-family=
:&quot;Arial&quot;,sans-serif" >&nbsp;<o:p></o:p></span></p></div>
<div><p style=3D"margin: 0px;" ><span style=3D"font-size:10.0pt;font-family=
:&quot;Arial&quot;,sans-serif" >Closed now.<o:p></o:p></span></p></div>
<div><p style=3D"margin: 0px;" ><span style=3D"font-size:10.0pt;font-family=
:&quot;Arial&quot;,sans-serif" >&nbsp;<o:p></o:p></span></p></div>
<div><p style=3D"margin: 0px;" ><span style=3D"font-size:10.0pt;font-family=
:&quot;Arial&quot;,sans-serif" >&nbsp;<o:p></o:p></span></p></div>
<div><p style=3D"margin: 0px;" ><span style=3D"font-size:10.0pt;font-family=
:&quot;Arial&quot;,sans-serif" >Thanks,<o:p></o:p></span></p></div>
<div><p style=3D"margin: 0px;" ><span style=3D"font-size:10.0pt;font-family=
:&quot;Arial&quot;,sans-serif" >Alpana<o:p></o:p></span></p></div>
<div><p style=3D"margin: 0px;" ><span style=3D"font-size:10.0pt;font-family=
:&quot;Arial&quot;,sans-serif" >&nbsp;<o:p></o:p></span></p></div>
<blockquote style=3D"border:none;border-left:solid #AAAAAA 1.5pt;padding:0i=
n 0in 0in 4.0pt;margin-left:3.75pt;margin-top:5.0pt;margin-right:0in;margin=
-bottom:5.0pt" ><p style=3D"margin: 0px;" ><span style=3D"font-size:10.0pt;=
font-family:&quot;Arial&quot;,sans-serif" >----- Original message -----<br>=
From: "Yong Li" &lt;<a href=3D"mailto:yong.b.li@linux.intel.com" target=3D"=
_blank">yong.b.li@linux.intel.com</a>&gt;<br>To: &lt;<a href=3D"mailto:alpa=
nkum@in.ibm.com" target=3D"_blank">alpankum@in.ibm.com</a>&gt;<br>Cc: "Tano=
us, Ed" &lt;<a href=3D"mailto:ed.tanous@intel.com" target=3D"_blank">ed.tan=
ous@intel.com</a>&gt;, "'OpenBMC Maillist'" &lt;<a href=3D"mailto:openbmc@l=
ists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>Subj=
ect: [EXTERNAL] HostWatchdogTimer related changes<br>Date: Sat, Sep 21, 201=
9 4:26 PM<br>&nbsp;<o:p></o:p></span></p>
<div><p style=3D"margin:0in;margin-bottom:.0001pt" ><span style=3D"font-siz=
e:10.0pt;font-family:&quot;Arial&quot;,sans-serif" >Hi,<o:p></o:p></span></=
p>
<p style=3D"margin:0in;margin-bottom:.0001pt" ><span style=3D"font-size:10.=
0pt;font-family:&quot;Arial&quot;,sans-serif" >&nbsp;<o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt" ><span style=3D"font-size:10.=
0pt;font-family:&quot;Arial&quot;,sans-serif" >I noticed there is a code re=
view submitted my you:<o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt" ><span style=3D"font-size:10.=
0pt;font-family:&quot;Arial&quot;,sans-serif" ><a href=3D"https://gerrit.op=
enbmc-project.xyz/#/c/openbmc/bmcweb/+/20308/" target=3D"_blank">https://ge=
rrit.openbmc-project.xyz/#/c/openbmc/bmcweb/+/20308/</a>&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; <o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt" ><span style=3D"font-size:10.=
0pt;font-family:&quot;Arial&quot;,sans-serif" >&nbsp;<o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt" ><span style=3D"font-size:10.=
0pt;font-family:&quot;Arial&quot;,sans-serif" >I noticed there is no any up=
date for several days. I am working on the related feature too:<o:p></o:p><=
/span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt" ><span style=3D"font-size:10.=
0pt;font-family:&quot;Arial&quot;,sans-serif" ><a href=3D"https://gerrit.op=
enbmc-project.xyz/#/c/openbmc/bmcweb/+/24532/" target=3D"_blank">https://ge=
rrit.openbmc-project.xyz/#/c/openbmc/bmcweb/+/24532/</a><o:p></o:p></span><=
/p>
<p style=3D"margin:0in;margin-bottom:.0001pt" ><span style=3D"font-size:10.=
0pt;font-family:&quot;Arial&quot;,sans-serif" >&nbsp;<o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt" ><span style=3D"font-size:10.=
0pt;font-family:&quot;Arial&quot;,sans-serif" >Could you please check on th=
em?<o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt" ><span style=3D"font-size:10.=
0pt;font-family:&quot;Arial&quot;,sans-serif" >&nbsp;<o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt" ><span style=3D"font-size:10.=
0pt;font-family:&quot;Arial&quot;,sans-serif" >If there is any comments/que=
stions, just let me know.<o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt" ><span style=3D"font-size:10.=
0pt;font-family:&quot;Arial&quot;,sans-serif" >&nbsp;<o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt" ><span style=3D"font-size:10.=
0pt;font-family:&quot;Arial&quot;,sans-serif" >Thanks,<o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt" ><span style=3D"font-size:10.=
0pt;font-family:&quot;Arial&quot;,sans-serif" >Yong<o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt" ><span style=3D"font-size:10.=
0pt;font-family:&quot;Arial&quot;,sans-serif" >&nbsp;<o:p></o:p></span></p>=
</div></blockquote>
<div><p style=3D"margin: 0px;" ><span style=3D"font-size:10.0pt;font-family=
:&quot;Arial&quot;,sans-serif" >&nbsp;<o:p></o:p></span></p></div></div>
<p style=3D"margin: 0px;" ><o:p>&nbsp;</o:p></p></div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>

