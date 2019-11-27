Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A8210A9D4
	for <lists+openbmc@lfdr.de>; Wed, 27 Nov 2019 06:09:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47N82h0XcgzDqkW
	for <lists+openbmc@lfdr.de>; Wed, 27 Nov 2019 16:09:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=devenrao@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47N81y18sRzDqhD
 for <openbmc@lists.ozlabs.org>; Wed, 27 Nov 2019 16:08:53 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAR574OT191812
 for <openbmc@lists.ozlabs.org>; Wed, 27 Nov 2019 00:08:50 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.90])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2whh5dtmmw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 27 Nov 2019 00:08:50 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <devenrao@in.ibm.com>;
 Wed, 27 Nov 2019 05:08:49 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 27 Nov 2019 05:08:46 -0000
Received: from us1a3-mail121.a3.dal06.isc4sb.com ([10.146.45.16])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2019112705084621-64307 ;
 Wed, 27 Nov 2019 05:08:46 +0000 
In-Reply-To: <CAMpjGno21Fff20TqWS1jaW3x5_HDF4D+pTqz=coSgh8YwRzq3w@mail.gmail.com>
From: "Devender Rao" <devenrao@in.ibm.com>
To: ckimchan17@gmail.com
Date: Wed, 27 Nov 2019 05:08:45 +0000
Sensitivity: 
MIME-Version: 1.0
References: <CAMpjGno21Fff20TqWS1jaW3x5_HDF4D+pTqz=coSgh8YwRzq3w@mail.gmail.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1661 | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 16799
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 19112705-3649-0000-0000-0000017600B4
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=; MB=0.000000
X-IBM-SpamModules-Versions: BY=3.00012174; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01295997; UDB=6.00687828; IPR=6.01078245; 
 MB=3.00029731; MTD=3.00000008; XFM=3.00000015; UTC=2019-11-27 05:08:48
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-11-27 04:02:12 - 6.00010698
x-cbparentid: 19112705-3650-0000-0000-000016825E5F
Message-Id: <OF0E392E90.A95260BC-ON002584BF.001C34AB-002584BF.001C44A9@notes.na.collabserv.com>
Subject: Re:  phosphor logging
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_08:2019-11-26,2019-11-26 signatures=0
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
elvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" ><em sandbox=3D"allo=
w-forms allow-same-origin allow-scripts allow-popups" style=3D"font-style: =
italic; color: rgb(41, 41, 41); font-family: &quot;Helvetica Neue&quot;, He=
lvetica, Roboto, Arial; font-size: 15px; font-variant-ligatures: normal; fo=
nt-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans:=
 2; text-align: left; text-indent: 0px; text-transform: none; white-space: =
normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; backg=
round-color: rgb(255, 255, 255); text-decoration-style: initial; text-decor=
ation-color: initial;" >try "journalctl -o json-pretty &gt; /tmp/logfile" a=
nd in the log file search for "</em><span style=3D"color: rgb(206, 145, 120=
); font-family: &quot;Droid Sans Mono&quot;, monospace, monospace, &quot;Dr=
oid Sans Fallback&quot;; font-size: 14px; font-style: normal; font-variant-=
ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spac=
ing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: pre; widows: 2; word-spacing: 0px; -webkit-text-strok=
e-width: 0px; background-color: rgb(30, 30, 30); text-decoration-style: ini=
tial; text-decoration-color: initial; display: inline !important; float: no=
ne;" >HASSIS=5FREQUESTED=5FPOWER=5FSTATE"</span></div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: Jeff Chan &lt;ckim=
chan17@gmail.com&gt;<br>Sent by: "openbmc" &lt;openbmc-bounces+devenrao=3Di=
n.ibm.com@lists.ozlabs.org&gt;<br>To: openbmc@lists.ozlabs.org<br>Cc:<br>Su=
bject: [EXTERNAL] phosphor logging<br>Date: Wed, Nov 27, 2019 8:11 AM<br>&n=
bsp;
<div dir=3D"ltr" ><div>Dear openbmc developer,</div>
<div>&nbsp;</div>
<div>I'm debugging chassis power on issue, and found that I can't use journ=
alctl to display debug information, for example:</div>
<div>&nbsp;</div>
<div>in chassis=5Fstate=5Fmanager.cpp</div>
<div><div style=3D"color:rgb(212,212,212);background-color:rgb(30,30,30);fo=
nt-family:&quot;Droid Sans Mono&quot;,&quot;monospace&quot;,monospace,&quot=
;Droid Sans Fallback&quot;;font-weight:normal;font-size:14px;line-height:19=
px;white-space:pre" ><div><span style=3D"color:rgb(78,201,176)" >Chassis</s=
pan><span style=3D"color:rgb(212,212,212)" >::</span><span style=3D"color:r=
gb(78,201,176)" >Transition</span><span style=3D"color:rgb(212,212,212)" > =
</span><span style=3D"color:rgb(78,201,176)" >Chassis</span><span style=3D"=
color:rgb(212,212,212)" >::</span><span style=3D"color:rgb(220,220,170)" >r=
equestedPowerTransition</span><span style=3D"color:rgb(212,212,212)" >(</sp=
an><span style=3D"color:rgb(78,201,176)" >Transition</span><span style=3D"c=
olor:rgb(212,212,212)" > </span><span style=3D"color:rgb(156,220,254)" >val=
ue</span><span style=3D"color:rgb(212,212,212)" >)</span></div>
<div><span style=3D"color:rgb(212,212,212)" >{</span></div>&nbsp;

<div><span style=3D"color:rgb(220,220,170)" >log</span><span style=3D"color=
:rgb(212,212,212)" >&lt;</span><span style=3D"color:rgb(78,201,176)" >level=
</span><span style=3D"color:rgb(212,212,212)" >::</span><span style=3D"colo=
r:rgb(78,201,176)" >INFO</span><span style=3D"color:rgb(212,212,212)" >&gt;=
(</span><span style=3D"color:rgb(206,145,120)" >"Change to Chassis Requeste=
d Power State"</span><span style=3D"color:rgb(212,212,212)" >,</span></div>
<div><span style=3D"color:rgb(220,220,170)" >entry</span><span style=3D"col=
or:rgb(212,212,212)" >(</span><span style=3D"color:rgb(206,145,120)" >"CHAS=
SIS=5FREQUESTED=5FPOWER=5FSTATE=3D%s"</span><span style=3D"color:rgb(212,21=
2,212)" >,</span></div>
<div><span style=3D"color:rgb(220,220,170)" >convertForMessage</span><span =
style=3D"color:rgb(212,212,212)" >(value).</span><span style=3D"color:rgb(2=
20,220,170)" >c=5Fstr</span><span style=3D"color:rgb(212,212,212)" >()));</=
span></div>
<div><span style=3D"color:rgb(220,220,170)" >executeTransition</span><span =
style=3D"color:rgb(212,212,212)" >(value);</span></div>
<div><span style=3D"color:rgb(197,134,192)" >return</span><span style=3D"co=
lor:rgb(212,212,212)" > </span><span style=3D"color:rgb(78,201,176)" >serve=
r</span><span style=3D"color:rgb(212,212,212)" >::</span><span style=3D"col=
or:rgb(78,201,176)" >Chassis</span><span style=3D"color:rgb(212,212,212)" >=
::</span><span style=3D"color:rgb(220,220,170)" >requestedPowerTransition</=
span><span style=3D"color:rgb(212,212,212)" >(value);</span></div>
<div><span style=3D"color:rgb(212,212,212)" >}</span></div></div></div>
<div>&nbsp;</div>
<div>but journalctl only display <span style=3D"color:rgb(206,145,120)" >"C=
hange to Chassis Requested Power State"</span>, the "CHASSIS=5FREQUESTED=5F=
POWER=5FSTATE=3D%s" part is missed, can someone tell me how to get it back?=
 I tried google but can't find the answer.</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>And that will be great if someone can guide me how to port and debug p=
ower control, I tried "obmutil chassison" in debug console but doesn't work=
. I can't find detailed document about porting.</div>
<div>&nbsp;</div>
<div>Thank you!</div>
<div>&nbsp;</div>
<div>Jeff</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div></div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>

