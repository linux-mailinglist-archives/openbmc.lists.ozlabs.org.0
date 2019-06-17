Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5059247A4B
	for <lists+openbmc@lfdr.de>; Mon, 17 Jun 2019 08:56:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45S27q1W1BzDqVv
	for <lists+openbmc@lfdr.de>; Mon, 17 Jun 2019 16:56:55 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45S27G26gYzDqSN
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jun 2019 16:56:25 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5H6r2XS185921
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jun 2019 02:56:21 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.81])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t63k6mvrt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jun 2019 02:56:20 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <sivas.srr@in.ibm.com>;
 Mon, 17 Jun 2019 06:56:20 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 17 Jun 2019 06:56:17 -0000
Received: from us1a3-mail65.a3.dal09.isc4sb.com ([10.142.3.169])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2019061706561670-182537 ;
 Mon, 17 Jun 2019 06:56:16 +0000 
In-Reply-To: 
Subject: Redfish: Not able to update / patch individual NTP server detail
From: "Sivas Srr" <sivas.srr@in.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Mon, 17 Jun 2019 06:56:15 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1619 | IBM Domino Build
 SCN1812108_20180501T0841_FP55 May 22, 2019 at 11:09
X-LLNOutbound: False
X-Disclaimed: 1775
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 19061706-7093-0000-0000-00000BB8E8A5
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40304; ST=0; TS=0; UL=0; ISC=; MB=0.002433
X-IBM-SpamModules-Versions: BY=3.00011277; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01219142; UDB=6.00641239; IPR=6.01000283; 
 BA=6.00006336; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00027341; XFM=3.00000015;
 UTC=2019-06-17 06:56:18
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-06-17 03:43:52 - 6.00010058
x-cbparentid: 19061706-7094-0000-0000-00008D9DF8CD
Message-Id: <OF6F1E1F6A.948DEAE0-ON0025841C.00258BF6-0025841C.00261C3E@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-17_05:, , signatures=0
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
elvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" >Hi @Ed Tanous</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Would like to get your opinion on the issue 3557 (<a href=
=3D"https://github.com/openbmc/openbmc/issues/3557" >https://github.com/ope=
nbmc/openbmc/issues/3557</a>) which</div>
<div dir=3D"ltr" >is related to not able to update individual NTP server de=
tail via Redfish.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Also can we not validated if both<span style=3D"color: rg=
b(36, 41, 46); font-family: -apple-system, system-ui, &quot;Segoe UI&quot;,=
 Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe U=
I Emoji&quot;, &quot;Segoe UI Symbol&quot;; font-size: 14px; font-style: no=
rmal; font-variant-ligatures: normal; font-variant-caps: normal; font-weigh=
t: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent:=
 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0=
px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); t=
ext-decoration-style: initial; text-decoration-color: initial; display: inl=
ine !important; float: none;" > NTP servers value are same. Not adding much=
 value to the functionality</span> /</div>
<div dir=3D"ltr" >end user.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><span style=3D"color: rgb(36, 41, 46); font-family: -appl=
e-system, system-ui, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif, &q=
uot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Sym=
bol&quot;; font-size: 14px; font-style: normal; font-variant-ligatures: nor=
mal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; o=
rphans: 2; text-align: start; text-indent: 0px; text-transform: none; white=
-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; background-color: rgb(255, 255, 255); text-decoration-style: initial; te=
xt-decoration-color: initial; display: inline !important; float: none;" >Ma=
y be user intended to change only one digit of primary server say 9.9.9.9 t=
o 9.9.9.8 to secondary server, but might have forgot to do that. BMC can in=
form about what he/she did in this case and get it corrected.</span></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Shall we discuss it&nbsp; in mail chain or during our com=
munity call which Broad Bishop hosts on every Monday.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Kindly provide your input, That helps. Thank you in advan=
ce Ed.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >With regards,</div>
<div dir=3D"ltr" >Sivas</div></div><BR>

