Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8571D062A
	for <lists+openbmc@lfdr.de>; Wed, 13 May 2020 07:05:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MN0s4nn6zDqcc
	for <lists+openbmc@lfdr.de>; Wed, 13 May 2020 15:05:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=manojeda@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MMzl4btZzDqd1
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 15:04:50 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04D51PoB110533
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 01:04:48 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.74])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3101m6vx58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 01:04:48 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <manojeda@in.ibm.com>;
 Wed, 13 May 2020 05:04:47 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 13 May 2020 05:04:44 -0000
Received: from us1a3-mail220.a3.dal06.isc4sb.com ([10.146.71.127])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2020051305044359-67605 ;
 Wed, 13 May 2020 05:04:43 +0000 
In-Reply-To: <e229e29c-e6a0-ae91-aa5c-2b13a4416faa@linux.ibm.com>
From: "Manojkiran Eda" <manojeda@in.ibm.com>
To: jrey@linux.ibm.com
Date: Wed, 13 May 2020 05:04:43 +0000
Sensitivity: 
MIME-Version: 1.0
References: <e229e29c-e6a0-ae91-aa5c-2b13a4416faa@linux.ibm.com>,
 <OFBBFB47E3.6EABAE1E-ON0025855A.00486BC9-0025855A.004946E0@LocalDomain>
 <OFC15F6E2A.E823991E-ON00258565.0018CF1F-00258565.00191B17@notes.na.collabserv.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1661 | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 41059
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 20051305-3165-0000-0000-000003748C1D
X-IBM-SpamModules-Scores: BY=0.281058; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=; MB=0.243001
X-IBM-SpamModules-Versions: BY=3.00013083; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000294; SDB=6.01375991; UDB=6.00735467; IPR=6.01158350; 
 MB=3.00032142; MTD=3.00000008; XFM=3.00000015; UTC=2020-05-13 05:04:47
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-05-13 02:30:36 - 6.00011355
x-cbparentid: 20051305-3166-0000-0000-000019D3B681
Message-Id: <OF6E82DE95.F0DBD406-ON00258567.00161A33-00258567.001BE5D7@notes.na.collabserv.com>
Subject: RE: SELinux UseCases
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-13_01:2020-05-11,
 2020-05-13 signatures=0
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
Cc: openbmc@lists.ozlabs.org, rnouse@google.com, ratagupt@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" >Hi Joseph,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >I may not be accurate here, But from what i have learnt -=
 Yes, this can be done using "Type Enforcement feature" in SELinux.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Type Enforcement essentially allows every file/object/pro=
cess in SELinux enabled system to be stored with a security context label a=
s an extended attribute.</div>
<div dir=3D"ltr" >And policies can be framed to allow access between variou=
s security context labelled objects.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Any access between security contexts - that does not have=
 an associated selinux policy will be denied by default.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Say for example, in this case :</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><font size=3D"2" face=3D"Default Monospace,Courier New,Co=
urier,monospace" >&gt; I would like to see SELinux limit who can write to f=
iles under the /etc<br>&gt; directory.&nbsp; For example, bmcweb implements=
 REST APIs add and modify<br>&gt; local users, control pam=5Ftally2 account=
 lockout parameters, etc.&nbsp; More<br>&gt; specifically, the phosphor-use=
r-manager daemon modifies files like<br>&gt; /etc/shadow and /etc/pam.d/com=
mon=5Fauth.&nbsp; Only this application should be<br>&gt; able to write to =
these file.&nbsp; Also, this daemon should not be to allowed<br>&gt; to wri=
te to any other config files.</font></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >1. A new security label needs to be defined, say <strong>=
user=5Fmanager=5Ft</strong>&nbsp; for <strong>phosphor-user-manager</strong=
> service and this context can be attached to the service through the SELin=
ux tag in the dbus-configuration xml file. so that when the user-manager se=
rvice executes it obtains a security context type of <strong>user=5Fmanager=
=5Ft</strong>.</div>
<div dir=3D"ltr" >2. As far as i know the files in the /<strong>etc</strong=
> would acquire a security context label of <strong>etc=5Ft </strong>by def=
ault during the auto relabelling process which happens at the first selinux=
 enabled boot of BMC.</div>
<div dir=3D"ltr" >3. Now we just need to write a selinux policy to allow ac=
cess between <strong>user=5Fmanager=5Ft </strong>type with <strong>etc=5Ft<=
/strong> type.</div>
<div dir=3D"ltr" >4. Any process,&nbsp; example <strong>bmcweb</strong> say=
 has <strong>webserver=5Ft</strong> (does not have the security context of =
<strong>user=5Fmanager=5Ft</strong>) would get an access denied if it tries=
 to write into the /<strong>etc</strong> files as there is no associated po=
licy.</div>
<div dir=3D"ltr" >5. We can even assign a security label for each file insi=
de the <strong>/etc</strong> and write an associated policy for it, so that=
 we can get a granular control over who can access which file under <strong=
>/etc</strong>.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Hope this answers your question.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Thanks,</div>
<div dir=3D"ltr" >Manoj</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" data-history-expanded=3D"1"=
 dir=3D"ltr" style=3D"border-left:solid #aaaaaa 2px; margin-left:5px; paddi=
ng-left:5px; direction:ltr; margin-right:0px" >----- Original message -----=
<br>From: Joseph Reynolds &lt;jrey@linux.ibm.com&gt;<br>Sent by: "openbmc" =
&lt;openbmc-bounces+manojeda=3Din.ibm.com@lists.ozlabs.org&gt;<br>To: Manoj=
kiran Eda &lt;manojeda@in.ibm.com&gt;, openbmc@lists.ozlabs.org, rnouse@goo=
gle.com<br>Cc: ratagupt@linux.vnet.ibm.com<br>Subject: [EXTERNAL] Re: SELin=
ux UseCases<br>Date: Tue, May 12, 2020 11:48 PM<br>&nbsp;
<div><font size=3D"2" face=3D"Default Monospace,Courier New,Courier,monospa=
ce" >On 5/10/20 11:34 PM, Manojkiran Eda wrote:<br>&gt; Hi All,<br>&gt; Thi=
s is a just a ping - to generate a discussion on the below<br>&gt; mentione=
d use-cases.<br>&gt; Appreciate any inputs/comments.<br><br>Thanks for putt=
ing this together.<br><br>I would like to see SELinux limit who can write t=
o files under the /etc<br>directory.&nbsp; For example, bmcweb implements R=
EST APIs add and modify<br>local users, control pam=5Ftally2 account lockou=
t parameters, etc.&nbsp; More<br>specifically, the phosphor-user-manager da=
emon modifies files like<br>/etc/shadow and /etc/pam.d/common=5Fauth.&nbsp;=
 Only this application should be<br>able to write to these file.&nbsp; Also=
, this daemon should not be to allowed<br>to write to any other config file=
s.<br><br>- Joseph<br><br>&gt; Thanks,<br>&gt; Manoj<br>&gt;<br>&gt; &nbsp;=
 &nbsp; ----- Original message -----<br>&gt; &nbsp; &nbsp; From: Manojkiran=
 Eda/India/IBM<br>&gt; &nbsp; &nbsp; To: openbmc@lists.ozlabs.org, rnouse@g=
oogle.com<br>&gt; &nbsp; &nbsp; Cc: ratagupt@linux.vnet.ibm.com<br>&gt; &nb=
sp; &nbsp; Subject: SELinux UseCases<br>&gt; &nbsp; &nbsp; Date: Thu, Apr 3=
0, 2020 6:50 PM<br>&gt; &nbsp; &nbsp; Hi All,<br>&gt; &nbsp; &nbsp; (My apo=
logies for the lengthy email.)<br>&gt; &nbsp; &nbsp; Below are few use-case=
s in BMC, which i feel inclusion of SELinux<br>&gt; &nbsp; &nbsp; would be =
a value add (there could be may more missing). Please<br>&gt; &nbsp; &nbsp;=
 feel free to drop-in your comments/feedback.<br>&gt;<br>...snip...</font><=
br>&nbsp;</div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>

