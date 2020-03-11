Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A34F1181546
	for <lists+openbmc@lfdr.de>; Wed, 11 Mar 2020 10:50:08 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cnHt67RfzDqPj
	for <lists+openbmc@lfdr.de>; Wed, 11 Mar 2020 20:50:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=devenrao@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cnGz0MkNzDqC3
 for <openbmc@lists.ozlabs.org>; Wed, 11 Mar 2020 20:49:08 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02B9iCIG044626
 for <openbmc@lists.ozlabs.org>; Wed, 11 Mar 2020 05:49:06 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.75])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ypw1bjeag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 11 Mar 2020 05:49:06 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <devenrao@in.ibm.com>;
 Wed, 11 Mar 2020 09:49:05 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.123) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 11 Mar 2020 09:49:02 -0000
Received: from us1a3-mail121.a3.dal06.isc4sb.com ([10.146.45.16])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2020031109490253-251643 ;
 Wed, 11 Mar 2020 09:49:02 +0000 
In-Reply-To: 
Subject: Uploading authority certificate with expiry date beyond 2038
From: "Devender Rao" <devenrao@in.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Wed, 11 Mar 2020 09:49:02 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1661 | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 31983
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 20031109-6875-0000-0000-000002066620
X-IBM-SpamModules-Scores: BY=0.283702; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.434296; ST=0; TS=0; UL=0; ISC=; MB=0.090638
X-IBM-SpamModules-Versions: BY=3.00012727; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000293; SDB=6.01346055; UDB=6.00717714; IPR=6.01128467; 
 MB=3.00031174; MTD=3.00000008; XFM=3.00000015; UTC=2020-03-11 09:49:03
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-03-11 07:28:05 - 6.00011105
x-cbparentid: 20031109-6876-0000-0000-0000031F69D5
Message-Id: <OF332527D2.5730A8E1-ON00258528.00318A0D-00258528.0035ED8F@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-11_02:2020-03-10,
 2020-03-11 signatures=0
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

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10pt" ><div class=3D"socmaildefaultfont" dir=
=3D"ltr" style=3D"font-family:Arial, Helvetica, sans-serif;font-size:10pt" =
><div dir=3D"ltr" ><span style=3D"font-size:12pt;" >Hi,</span></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><span style=3D"font-size:12pt;" ><span style=3D"color: rg=
b(29, 28, 29); font-family: Slack-Lato, appleLogo, sans-serif; font-style: =
normal; font-variant-ligatures: common-ligatures; font-variant-caps: normal=
; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: =
0px; text-transform: none; white-space: pre-wrap; word-spacing: 0px; -webki=
t-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decora=
tion-style: initial; text-decoration-color: initial; display: inline !impor=
tant; float: none;" >I am having an issue where the user uploads a certific=
ate with validity period</span> <span style=3D"color: rgb(29, 28, 29); font=
-family: Slack-Lato, appleLogo, sans-serif; font-style: normal; font-varian=
t-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; text-align: left; text-indent: 0px; text-transform=
: none; white-space: pre-wrap; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial=
; text-decoration-color: initial; display: inline !important; float: none;"=
 >of 25 years which turns out to be year 2045. But the expiry date value wr=
aps around</span> <span style=3D"color: rgb(29, 28, 29); font-family: Slack=
-Lato, appleLogo, sans-serif; font-style: normal; font-variant-ligatures: c=
ommon-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacin=
g: normal; text-align: left; text-indent: 0px; text-transform: none; white-=
space: pre-wrap; word-spacing: 0px; -webkit-text-stroke-width: 0px; backgro=
und-color: rgb(255, 255, 255); text-decoration-style: initial; text-decorat=
ion-color: initial; display: inline !important; float: none;" >due to overf=
low and the final time generated is year 1908.</span><span style=3D"color: =
rgb(29, 28, 29); font-family: Slack-Lato, appleLogo, sans-serif; font-style=
: normal; font-variant-ligatures: common-ligatures; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; text-align: left; text-indent=
: 0px; text-transform: none; white-space: pre-wrap; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-deco=
ration-style: initial; text-decoration-color: initial; display: inline !imp=
ortant; float: none;" > Time value is represented as number of seconds sinc=
e the start of the Unix epoch.</span> <span style=3D"color: rgb(29, 28, 29)=
; font-family: Slack-Lato, appleLogo, sans-serif; font-style: normal; font-=
variant-ligatures: common-ligatures; font-variant-caps: normal; font-weight=
: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-tra=
nsform: none; white-space: pre-wrap; word-spacing: 0px; -webkit-text-stroke=
-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: i=
nitial; text-decoration-color: initial; display: inline !important; float: =
none;" > This happens when certificates are listed in GUI by fetching the p=
roperties using Redfish (</span></span><a aria-describedby=3D"slack-kit-too=
ltip" class=3D"c-link" delay=3D"150" href=3D"https://github.com/openbmc/bmc=
web/blob/master/redfish-core/lib/certificate=5Fservice.hpp#L659" rel=3D"noo=
pener noreferrer" style=3D"box-sizing: inherit; color: rgba(var(--sk=5Fhigh=
light,18,100,163),1); text-decoration: none; font-family: Slack-Lato, apple=
Logo, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatur=
es: common-ligatures; font-variant-caps: normal; font-weight: 400; letter-s=
pacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transf=
orm: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-tex=
t-stroke-width: 0px; background-color: rgb(248, 248, 248);" target=3D"=5Fbl=
ank" >https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/certif=
icate=5Fservice.hpp#L659</a>)<br><br><span style=3D"font-size:12pt;" ><span=
 style=3D"color: rgb(29, 28, 29); font-family: Slack-Lato, appleLogo, sans-=
serif; font-style: normal; font-variant-ligatures: common-ligatures; font-v=
ariant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: =
left; text-indent: 0px; text-transform: none; white-space: pre-wrap; word-s=
pacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255=
, 255); text-decoration-style: initial; text-decoration-color: initial; dis=
play: inline !important; float: none;" >As time=5Ft data structure is defin=
ed as int32 it can hold up to a maximum value</span> <span style=3D"color: =
rgb(29, 28, 29); font-family: Slack-Lato, appleLogo, sans-serif; font-style=
: normal; font-variant-ligatures: common-ligatures; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; text-align: left; text-indent=
: 0px; text-transform: none; white-space: pre-wrap; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-deco=
ration-style: initial; text-decoration-color: initial; display: inline !imp=
ortant; float: none;" >of 2147483647 which covers certificate validity up t=
o 2038.</span></span></div>
<div dir=3D"ltr" ><br><span style=3D"font-size:12pt;" ><span style=3D"color=
: rgb(29, 28, 29); font-family: Slack-Lato, appleLogo, sans-serif; font-sty=
le: normal; font-variant-ligatures: common-ligatures; font-variant-caps: no=
rmal; font-weight: 400; letter-spacing: normal; text-align: left; text-inde=
nt: 0px; text-transform: none; white-space: pre-wrap; word-spacing: 0px; -w=
ebkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-de=
coration-style: initial; text-decoration-color: initial; display: inline !i=
mportant; float: none;" >Any certificate which is uploaded with expiry year=
 greater than 2038, the</span> <span style=3D"color: rgb(29, 28, 29); font-=
family: Slack-Lato, appleLogo, sans-serif; font-style: normal; font-variant=
-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: left; text-indent: 0px; text-transform:=
 none; white-space: pre-wrap; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial;=
 text-decoration-color: initial; display: inline !important; float: none;" =
>seconds value in time=5Ft wraps around and will generate a negative value,=
 which</span> <span style=3D"color: rgb(29, 28, 29); font-family: Slack-Lat=
o, appleLogo, sans-serif; font-style: normal; font-variant-ligatures: commo=
n-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: n=
ormal; text-align: left; text-indent: 0px; text-transform: none; white-spac=
e: pre-wrap; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-=
color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-=
color: initial; display: inline !important; float: none;" >when used expiry=
 date value will be less than 1970.</span></span></div>
<div dir=3D"ltr" ><br><span style=3D"font-size:12pt;" ><span style=3D"color=
: rgb(29, 28, 29); font-family: Slack-Lato, appleLogo, sans-serif; font-sty=
le: normal; font-variant-ligatures: common-ligatures; font-variant-caps: no=
rmal; font-weight: 400; letter-spacing: normal; text-align: left; text-inde=
nt: 0px; text-transform: none; white-space: pre-wrap; word-spacing: 0px; -w=
ebkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-de=
coration-style: initial; text-decoration-color: initial; display: inline !i=
mportant; float: none;" >Example:</span></span></div>
<div dir=3D"ltr" ><div><em><span style=3D"font-size:12pt;" >Mar 10 15:03:49=
 w5 bmcweb[170]: bmcweb not after 2366947077<br>Mar 10 15:03:49 w5 bmcweb[1=
70]: bmcweb not after 1908-11-26T22:49:41+00:00</span></em></div>
<div>&nbsp;</div></div>
<div dir=3D"ltr" ><span style=3D"font-size:12pt;" ><span style=3D"color: rg=
b(29, 28, 29); font-family: Slack-Lato, appleLogo, sans-serif; font-style: =
normal; font-variant-ligatures: common-ligatures; font-variant-caps: normal=
; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: =
0px; text-transform: none; white-space: pre-wrap; word-spacing: 0px; -webki=
t-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decora=
tion-style: initial; text-decoration-color: initial; display: inline !impor=
tant; float: none;" >Probable solutions</span></span></div>
<div dir=3D"ltr" ><span style=3D"font-size:12pt;" >1) Do nothing as the cha=
nces of uploading a certificate with expiry date &gt; 18 chances never happ=
en<br style=3D"box-sizing: inherit; color: rgb(29, 28, 29); font-family: Sl=
ack-Lato, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-=
variant-ligatures: common-ligatures; font-variant-caps: normal; font-weight=
: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0=
px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0=
px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); t=
ext-decoration-style: initial; text-decoration-color: initial;" ><span styl=
e=3D"color: rgb(29, 28, 29); font-family: Slack-Lato, appleLogo, sans-serif=
; font-style: normal; font-variant-ligatures: common-ligatures; font-varian=
t-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left;=
 text-indent: 0px; text-transform: none; white-space: pre-wrap; word-spacin=
g: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255=
); text-decoration-style: initial; text-decoration-color: initial; display:=
 inline !important; float: none;" >2) R</span><span style=3D"color: rgb(29,=
 28, 29); font-family: Slack-Lato, appleLogo, sans-serif; font-style: norma=
l; font-variant-ligatures: common-ligatures; font-variant-caps: normal; fon=
t-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; =
text-transform: none; white-space: pre-wrap; word-spacing: 0px; -webkit-tex=
t-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-=
style: initial; text-decoration-color: initial; display: inline !important;=
 float: none;" >eturn error to the caller if the expirty</span> <span style=
=3D"color: rgb(29, 28, 29); font-family: Slack-Lato, appleLogo, sans-serif;=
 font-style: normal; font-variant-ligatures: common-ligatures; font-variant=
-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; =
text-indent: 0px; text-transform: none; white-space: pre-wrap; word-spacing=
: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255)=
; text-decoration-style: initial; text-decoration-color: initial; display: =
inline !important; float: none;" >date is greater than 2038.<br><br>Would l=
ike community feedback on this</span></span></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><div dir=3D"ltr" ><span style=3D"font-size:12pt;" ><a ari=
a-describedby=3D"slack-kit-tooltip" class=3D"c-link" delay=3D"150" href=3D"=
https://stackoverflow.com/questions/6408914/what-is-year-2038-problem-how-t=
o-find-out-if-the-existing-code-has-that-problem" rel=3D"noopener noreferre=
r" style=3D"box-sizing: inherit; color: rgba(var(--sk=5Fhighlight,18,100,16=
3),1); text-decoration: none; font-family: Slack-Lato, appleLogo, sans-seri=
f; font-size: 15px; font-style: normal; font-variant-ligatures: common-liga=
tures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal;=
 orphans: 2; text-align: left; text-indent: 0px; text-transform: none; whit=
e-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; background-color: rgb(255, 255, 255);" target=3D"=5Fblank" >https://s=
tackoverflow.com/questions/6408914/what-is-year-2038-problem-how-to-find-ou=
t-if-the-existing-code-has-that-problem</a></span></div>
<div><span style=3D"font-size:12pt;" ><a href=3D"https://github.com/openbmc=
/phosphor-certificate-manager/issues/14" >https://github.com/openbmc/phosph=
or-certificate-manager/issues/14<br><br>Regards</a></span></div>
<div><span style=3D"font-size:12pt;" >Devender</span></div></div></div></di=
v><BR>

