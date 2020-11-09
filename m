Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA662AFBB8
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 00:50:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWhLp4F4kzDqsv
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 10:50:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cjengel@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=STl9DNZp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CVMFy5sLnzDqYt
 for <openbmc@lists.ozlabs.org>; Tue, 10 Nov 2020 06:56:48 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A9Ji0jB061805
 for <openbmc@lists.ozlabs.org>; Mon, 9 Nov 2020 14:56:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : in-reply-to :
 from : to : cc : date : mime-version : references :
 content-transfer-encoding : content-type : message-id; s=pp1;
 bh=ukiRvrjrylHGEqv0D71mZJy//dCXyGoC1yanive3KIw=;
 b=STl9DNZpf7DvTR4FjdYmYRXie679SzldkCb01ZY/LrhV4qMKnevzl7+d8nevDx6aze1Z
 k9wm7hY3cQD/znkPcDDXJYdm99z//+VG2w3fgiAKgFtRDQQrNiO61KBWKTZH253KvXbZ
 MHrasoApPn/KbM5LwHwbKCcCEJsY1QYTXl6dymS8/L+xVt4oCQhwslW7s94y398SKHr1
 Cl3A3zB+f4pMVcY0qUNLl3KR3O0ZBqgTb9CM6H7o88Mbt7h+6HL7qHAPigPGWuIEEKtJ
 uBXpA2/yoEENsHxAQnML6dexAgWd383IfnSBPisSA73j5fq9sCW7/bXQDxV4tHvvkrfZ xQ== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.109])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34qc6889fq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 09 Nov 2020 14:56:44 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <cjengel@us.ibm.com>;
 Mon, 9 Nov 2020 19:56:44 -0000
Received: from us1b3-smtp02.a3dr.sjc01.isc4sb.com (10.122.7.175)
 by smtp.notes.na.collabserv.com (10.122.47.48) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 9 Nov 2020 19:56:41 -0000
Received: from us1b3-mail260.a3dr.sjc03.isc4sb.com ([10.160.11.55])
 by us1b3-smtp02.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020110919564148-711179 ;
 Mon, 9 Nov 2020 19:56:41 +0000 
Subject: Re: Secure boot/signed images and GPL code
In-Reply-To: <2fad4703-bb25-c94b-a91a-f618962fe176@linux.ibm.com>
From: "Christopher J Engel" <cjengel@us.ibm.com>
To: jrey@linux.ibm.com
Date: Mon, 9 Nov 2020 19:56:41 +0000
Sensitivity: 
MIME-Version: 1.0
References: <2fad4703-bb25-c94b-a91a-f618962fe176@linux.ibm.com>,
 <CAM=TmwWinuWjpNr+NeTXTmPv0wUCCzg5BUKhhR=Rp=mfmma_6Q@mail.gmail.com>
 <20201103205600.GA38269@patrickw3-mbp.lan.stwcx.xyz>
 <20201106171745.GA25199@mauery.jf.intel.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1661 | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-KeepSent: 642C63A8:1A9D0881-0025861B:006CCDA0;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 42495
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 20110919-1429-0000-0000-000002F96C71
X-IBM-SpamModules-Scores: BY=0.144399; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.386589; ST=0; TS=0; UL=0; ISC=; MB=0.087369
X-IBM-SpamModules-Versions: BY=3.00014160; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01461574; UDB=6.00786531; IPR=6.01244212; 
 MB=3.00034946; MTD=3.00000008; XFM=3.00000015; UTC=2020-11-09 19:56:42
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-11-09 18:13:54 - 6.00012045
x-cbparentid: 20110919-1430-0000-0000-000038C27163
Message-Id: <OF642C63A8.1A9D0881-ON0025861B.006CCDA0-0025861B.006D8F60@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-09_12:2020-11-05,
 2020-11-09 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
X-Mailman-Approved-At: Thu, 12 Nov 2020 10:48:56 +1100
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
Cc: openbmc@lists.ozlabs.org, vernon.mauery@linux.intel.com,
 deepak.kodihalli.83@gmail.com, joseph-reynolds@charter.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" >Unfortunately I hav=
e not had time to go back to my original proposal and address comments and =
make updates.&nbsp; The original proposal added the ability through physica=
l presence to perform a key transition of at least the keys used to validat=
e U-Boot and the linux kernel/fit.&nbsp; This was added for many reasons:</=
div>
<div dir=3D"ltr" >- Possible GPL v3 concerns as you guys have been discussi=
ng</div>
<div dir=3D"ltr" >- Lab/Development to allow developers to sign and test se=
cure boot with a set of development keys while keeping the production keys =
under tighter control</div>
<div dir=3D"ltr" >- Allowing customers to take control/ownership of the sys=
tems FW stack which is an important goal for us as we work towards open sou=
rce FW stacks.&nbsp; Patrick also listed a bunch of use cases that add to t=
he importance of this.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >As was discussed the AST2600 CRT is not as flexible due t=
o the OTP.&nbsp; We are still finalizing our plans around this but we will =
probably have to end up where we don't allow these to be changed on HW in t=
he field which means the U-Boot SPL will have to remain signed by IBM but w=
e will have flexibility in the remainder of the stack.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >We are still working to define what our final delivery wi=
ll be for our systems but for the most part our final goals still line up w=
ith my original proposal.</div>
<div dir=3D"ltr" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"fo=
nt-family:Arial, Helvetica, sans-serif;font-size:10pt" ><div class=3D"socma=
ildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, Helvetica, sans-seri=
f;font-size:10.5pt" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D=
"font-family:Arial, Helvetica, sans-serif;font-size:10.5pt" ><div dir=3D"lt=
r" >&nbsp;
<div><br>Chris Engel<br>Power Firmware Security Architect<br>IBM Rochester,=
 MN<br>(507)253-2306<br>internet: cjengel@us.ibm.com</div>
<div>&nbsp;</div>
<div>"Security is not a binary; it is a sliding scale of risk management" -=
 Josh Bressers</div></div></div></div></div></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: "Joseph Reynolds" =
&lt;jrey@linux.ibm.com&gt;<br>To: "Vernon Mauery" &lt;vernon.mauery@linux.i=
ntel.com&gt;, "Patrick Williams" &lt;patrick@stwcx.xyz&gt;<br>Cc: Christoph=
er J Engel/Rochester/IBM@IBMUS, openbmc@lists.ozlabs.org, "Deepak Kodihalli=
" &lt;deepak.kodihalli.83@gmail.com&gt;, joseph-reynolds@charter.net<br>Sub=
ject: Re: Secure boot/signed images and GPL code<br>Date: Fri, Nov 6, 2020 =
3:24 PM<br>&nbsp;
<div><font size=3D"2" face=3D"Default Monospace,Courier New,Courier,monospa=
ce" >On 11/6/20 11:19 AM, Vernon Mauery wrote:<br>&gt; On 03-Nov-2020 02:56=
 PM, Patrick Williams wrote:<br>&gt;&gt;<br>&gt;&gt; In the doc you pointed=
 to, I asked how key transition works, but the<br>&gt;&gt; doc hasn't been =
updated to better describe it yet[2].&nbsp; The initial<br>&gt;&gt; respons=
e makes it seem like the AST2600 OTP doesn't give a whole lot of<br>&gt;&gt=
; capabilities here, which is fairly concerning.&nbsp; I know there are som=
e<br>&gt;&gt; design proposals that use a secondary device to assist with<b=
r>&gt;&gt; secureboot[3,4,5] which might better handle key transition.<br>&=
gt;<br>&gt; You are right, the AST2600 OTP leaves something to be desired. =
If all<br>&gt; the key regions are not initially programmed, it is possible=
 to<br>&gt; program a new key, deprecate all the old keys, and take control=
 of the<br>&gt; system. But programming all the keys prevents transferring =
the system<br>&gt; from one owner to another (where the owner is the one pr=
oviding<br>&gt; firmware).<br>&gt;<br>&gt; Storing and provisioning keys is=
 hardest part of any crypto system. If<br>&gt; we have ideas on how to make=
 the AST2700 better, Aspeed has engineers<br>&gt; on this list and would pr=
obably like to hear any great ideas.<br><br>The OCP (Open Compute Project) =
Security Project has ongoing discussions<br>on similar topics including sec=
ure transfer of ownership, secure boot,<br>and secure recovery.<br><br>I do=
n't have more details because it's not my technical area.&nbsp; The wiki<br=
>has links to OCP Security goals, papers, and their meetings.<br><a href=3D=
"https://www.opencompute.org/wiki/Security" target=3D"=5Fblank" >https://ww=
w.opencompute.org/wiki/Security</a><br><br>- Joseph<br><br>&gt;<br>&gt; --V=
ernon<br>&gt;</font><br>&nbsp;</div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>

