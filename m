Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E27FD2432B4
	for <lists+openbmc@lfdr.de>; Thu, 13 Aug 2020 05:23:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRsNS0SFVzDqbl
	for <lists+openbmc@lfdr.de>; Thu, 13 Aug 2020 13:23:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=derick.montague@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gGFH9Yn8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRsMb017ZzDqYM
 for <openbmc@lists.ozlabs.org>; Thu, 13 Aug 2020 13:22:49 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D36skr137426
 for <openbmc@lists.ozlabs.org>; Wed, 12 Aug 2020 23:22:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : references : content-type : message-id :
 content-transfer-encoding : mime-version : subject; s=pp1;
 bh=8MgsqhHL2xmWd763YyPJIZX65qqUHUlKXpZuET8Lj70=;
 b=gGFH9Yn8a56QJdkKsJDdjMmMIkdrPs1+wiBzRPnSrGsCQrLd8Wwl5B3s3rPuA2+nY5Mo
 6rcz0NcJvJ4rpvx10UvXYBfHRJ8iyLKDjVKVnCvODxV/I321TEUVloE48gE3LDyfagZm
 pK/ioMJPA5P7Ta5s0dnLXiZgMLNRMUY+W1DyeKM7EnFFrhLlL6i/zDvM7k63tNASwyzj
 8h7xUqjYOzshHIjK8u7MJ36+qi/VYn74vmu9ds7MIM+9NusVshCUdcCGJLMZizg1b84N
 UNsUf2RsbfNZ85w3BSR84VkIsQhvqAgy5ba2Dl+BKscgkA1+JboPcI2dX/IBME0lgSZh cw== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.111])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32v7uuputv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 12 Aug 2020 23:22:46 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Derick.Montague@ibm.com>;
 Thu, 13 Aug 2020 03:22:45 -0000
Received: from us1b3-smtp01.a3dr.sjc01.isc4sb.com (10.122.7.174)
 by smtp.notes.na.collabserv.com (10.122.47.52) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 13 Aug 2020 03:22:40 -0000
Received: from us1b3-mail158.a3dr.sjc03.isc4sb.com ([10.160.174.218])
 by us1b3-smtp01.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020081303224009-10113 ;
 Thu, 13 Aug 2020 03:22:40 +0000 
In-Reply-To: <7f021423.2ebfc5.173d765e0a1.Coremail.rxsun@zd-tech.com.cn>
From: "Derick Montague" <Derick.Montague@ibm.com>
To: rxsun@zd-tech.com.cn
Date: Thu, 13 Aug 2020 03:22:39 +0000
Sensitivity: 
References: <7f021423.2ebfc5.173d765e0a1.Coremail.rxsun@zd-tech.com.cn>,
 <46248870.1c8dc3.170a87ecdc0.Coremail.rxsun@zd-tech.com.cn><OF66F85A09.1A6A1395-ON00258528.003FC677-00258528.00404CA3@notes.na.collabserv.com><5F30F967.1080806@zd-tech.com.cn>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1661 | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-KeepSent: 33DEDB56:731DC065-002585C3:0012451B;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 19011
X-TNEFEvaluated: 1
Content-Type: text/html; charset=UTF-8
x-cbid: 20081303-3633-0000-0000-000002B28926
X-IBM-SpamModules-Scores: BY=0.281445; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.407427; ST=0; TS=0; UL=0; ISC=; MB=0.073349
X-IBM-SpamModules-Versions: BY=3.00013640; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01419377; UDB=6.00761422; IPR=6.01201995; 
 MB=3.00033500; MTD=3.00000008; XFM=3.00000015; UTC=2020-08-13 03:22:44
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-08-13 00:33:24 - 6.00011717
x-cbparentid: 20081303-3634-0000-0000-0000F8D28EF9
Message-Id: <OF33DEDB56.731DC065-ON002585C3.0012451B-002585C3.00128DD8@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 1 URL was un-rewritten
MIME-Version: 1.0
Subject: RE:  Re: Network Settings GUI
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_02:2020-08-11,
 2020-08-13 signatures=0
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
Cc: openbmc@lists.ozlabs.org, derick.montague@gmail.com, xzcheng@zd-tech.com.cn,
 ratagupt@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Tahoma, =
Geneva, sans-serif;font-size:10pt" ><div dir=3D"ltr" >Hello ruxia, sun!</di=
v>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >We have started work on the webui-vue GUI that will expec=
t to be a replacement for phosphor-webui. The IPv6 functionality is not rea=
dy for the webui-vue GUI because we are transitioning from the REST API to =
Redfish. If you are interested in adding the functionality to phosphor-webu=
i, I can look for the design that was originally completed for the previous=
 layout. Is that something you are interested in?</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"fo=
nt-family:Arial, Helvetica, sans-serif;font-size:10pt" ><div class=3D"socma=
ildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, Helvetica, sans-seri=
f;font-size:10pt" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"f=
ont-family:Arial, Helvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" >=
<div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><di=
v dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div d=
ir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div dir=
=3D"ltr" ><div dir=3D"ltr" ><div dir=3D"ltr" ><div><div dir=3D"ltr" ><div><=
span style=3D"font-family:Tahoma,Geneva,sans-serif;" >Thank you!</span></di=
v>
<div>&nbsp;</div>
<div><span style=3D"font-family:Tahoma,Geneva,sans-serif;" ><strong><span s=
tyle=3D"font-size:10pt;" >Derick Montague</span></strong><br>FED Lead | Ope=
nBMC Design Team Lead<br>IBM Cognitive Systems User Experience</span></div>=
</div></div></div></div></div></div></div></div></div></div></div></div></d=
iv></div></div></div></div></div></div></div></div></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: "rxsun"&lt;rxsun@z=
d-tech.com.cn&gt;<br>To: "Derick Montague"&lt;Derick.Montague@ibm.com&gt;<b=
r>Cc: "derick.montague"&lt;derick.montague@gmail.com&gt;, "openbmc"&lt;open=
bmc@lists.ozlabs.org&gt;, "ratagupt"&lt;ratagupt@linux.vnet.ibm.com&gt;, "=
=E6=88=90=E4=BF=AE=E6=B2=BB"&lt;xzcheng@zd-tech.com.cn&gt;<br>Subject: [EXT=
ERNAL] Re: Re: Network Settings GUI<br>Date: Mon, Aug 10, 2020 3:04 AM<br>&=
nbsp;<br><!--Notes ACF
<META content=3D"text/html; charset=3Dutf8" http-equiv=3DContent-Type>--> <=
!-- flashmail style begin --> <!-- flashmail style end -->
<div>Hi Derick,</div>
<blockquote id=3D"ntes-flashmail-quote" style=3D"FONT-SIZE: 10pt; FONT-FAMI=
LY: Verdana; PADDING-LEFT: 0px; MARGIN-LEFT: 0px" ><div><div style=3D"FONT-=
SIZE: 12pt; FONT-FAMILY: =E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91; TEXT-INDENT:=
 2em" >My&nbsp;team has confirmed that the Openbmc backend has supported IP=
V6 on version v28, I am going to implement the ipv6 configuration in webui =
(with angularJS),would you please tell me the&nbsp; UX prototype design of =
webui for IPV6 is ok? I have signed the&nbsp; Cooperation and&nbsp; Contrib=
ution License Agreement.<br>BTW:How to proposal my code to webui project =
=EF=BC=8Cwould you like to tell me detail?</div>
<div style=3D"FONT-SIZE: 12pt; FONT-FAMILY: =E5=BE=AE=E8=BD=AF=E9=9B=85=E9=
=BB=91; TEXT-INDENT: 2em" >&nbsp;</div>
<div style=3D"FONT-SIZE: 12pt; FONT-FAMILY: =E5=BE=AE=E8=BD=AF=E9=9B=85=E9=
=BB=91; TEXT-INDENT: 2em" ><span style=3D"FONT-SIZE: 12pt" >Best Reguards,<=
/span></div>
<div style=3D"FONT-SIZE: 12pt; FONT-FAMILY: =E5=BE=AE=E8=BD=AF=E9=9B=85=E9=
=BB=91; TEXT-INDENT: 2em" ><span style=3D"FONT-SIZE: 12pt" >ruixia,sun</spa=
n></div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Verdana; COLOR: #c0c0c0" align=
=3D"left" >2020-08-10
<hr id=3D"SignNameHR" style=3D"BORDER-TOP: #c0c0c0 1px solid; HEIGHT: 1px; =
BORDER-RIGHT: 0px; WIDTH: 122px; BORDER-BOTTOM: 0px; BORDER-LEFT: 0px" alig=
n=3D"left" > <span id=3D"_FlashSignName" >rxsun</span></div>
<hr style=3D"BORDER-TOP: #c0c0c0 1px solid; HEIGHT: 1px; BORDER-RIGHT: 0px;=
 BORDER-BOTTOM: 0px; BORDER-LEFT: 0px" ><blockquote id=3D"ntes-flashmail-qu=
ote" style=3D"FONT-SIZE: 10pt; FONT-FAMILY: Verdana; PADDING-LEFT: 0px; MAR=
GIN-LEFT: 0px" ><div><strong>=E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9A</strong>"=
Derick Montague" &lt;Derick.Montague@ibm.com&gt;</div>
<div><strong>=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4=EF=BC=9A</strong>2020-03-=
11&nbsp;19:42</div>
<div><strong>=E4=B8=BB=E9=A2=98=EF=BC=9A</strong>Re: Network Settings GUI</=
div>
<div><strong>=E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9A</strong>"rxsun"&lt;rxsun@=
zd-tech.com.cn&gt;</div>
<div><strong>=E6=8A=84=E9=80=81=EF=BC=9A</strong>"derick.montague"&lt;deric=
k.montague@gmail.com&gt;,"openbmc"&lt;openbmc@lists.ozlabs.org&gt;,"ratagup=
t"&lt;ratagupt@linux.vnet.ibm.com&gt;</div>
<div>&nbsp;</div>
<div><div>Hi&nbsp;Ruxia,&nbsp;</div>
<div>&nbsp;</div>
<div>&gt;&nbsp;Sorry&nbsp;for&nbsp;late&nbsp;reply.&nbsp;I&nbsp;had&nbsp;re=
ad&nbsp;&nbsp;<a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/phosp=
hor-webui/+/24317%C2%A0%C2%A0,%C2%A0%C2%A0I%C2%A0saw%C2%A0the%C2%A0calling%=
C2%A0of%C2%A0redfish%C2%A0%C2%A0in%C2%A0api-ulti.js%C2%A0.%C2%A0I%C2%A0wond=
er%C2%A0if%C2%A0the%C2%A0ipv6%C2%A0has%C2%A0been%C2%A0done%C2%A0in%C2%A0thi=
s%C2%A0BMC%C2%A0system.%C2%A0%C2%A0Would%C2%A0you%C2%A0like%C2%A0to%C2%A0te=
ll%C2%A0me%C2%A0the%C2%A0ipv6%C2%A0support%C2%A0schedule%C2%A0of%C2%A0%C2%A=
0bmc%C2%A0OS?" target=3D"_blank">https://gerrit.openbmc-project.xyz/c/openb=
mc/phosphor-webui/+/24317&nbsp;&nbsp;,&nbsp;&nbsp;I&nbsp;saw&nbsp;the&nbsp;=
calling&nbsp;of&nbsp;redfish&nbsp;&nbsp;in&nbsp;api-ulti.js&nbsp;.&nbsp;I&n=
bsp;wonder&nbsp;if&nbsp;the&nbsp;ipv6&nbsp;has&nbsp;been&nbsp;done&nbsp;in&=
nbsp;this&nbsp;BMC&nbsp;system.&nbsp;&nbsp;Would&nbsp;you&nbsp;like&nbsp;to=
&nbsp;tell&nbsp;me&nbsp;the&nbsp;ipv6&nbsp;support&nbsp;schedule&nbsp;of&nb=
sp;&nbsp;bmc&nbsp;OS?&nbsp;</a></div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;&nbsp;</div>
<div>Jandra&nbsp;is&nbsp;no&nbsp;longer&nbsp;working&nbsp;on&nbsp;this&nbsp=
;project&nbsp;and&nbsp;the&nbsp;IBM&nbsp;design&nbsp;team&nbsp;is&nbsp;work=
ing&nbsp;on&nbsp;a&nbsp;new&nbsp;version&nbsp;of&nbsp;the&nbsp;GUI&nbsp;wri=
tten&nbsp;in&nbsp;Vue.js.&nbsp;We&nbsp;are&nbsp;just&nbsp;starting&nbsp;to&=
nbsp;talk&nbsp;about&nbsp;IPv6&nbsp;again&nbsp;and&nbsp;I&nbsp;do&nbsp;thin=
k&nbsp;it&nbsp;may&nbsp;be&nbsp;ready.&nbsp;I&nbsp;see&nbsp;that&nbsp;Ratan=
&nbsp;is&nbsp;on&nbsp;this&nbsp;mail&nbsp;thread&nbsp;and&nbsp;he&nbsp;shou=
ld&nbsp;be&nbsp;able&nbsp;to&nbsp;specify&nbsp;for&nbsp;sure&nbsp;if&nbsp;t=
he&nbsp;backend&nbsp;supporting&nbsp;IPv6&nbsp;is&nbsp;ready.&nbsp;</div>
<div>&nbsp;</div>
<div>Thanks,&nbsp;</div>
<div>Derick&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;&nbsp;</div>
<div>&nbsp;&nbsp;</div>
<div>&nbsp;&nbsp;</div>
<div>&nbsp;</div></div></blockquote></div></blockquote></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>

