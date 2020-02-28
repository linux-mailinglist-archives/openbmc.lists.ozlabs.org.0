Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5130173CE8
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 17:31:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TZmD4S8DzDrP1
	for <lists+openbmc@lfdr.de>; Sat, 29 Feb 2020 03:31:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=in.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=lkammath@in.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=in.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TZlR6kZMzDrHm
 for <openbmc@lists.ozlabs.org>; Sat, 29 Feb 2020 03:30:27 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01SGMVcf093944
 for <openbmc@lists.ozlabs.org>; Fri, 28 Feb 2020 11:30:25 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.66])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yepwjckxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 28 Feb 2020 11:30:24 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <lkammath@in.ibm.com>;
 Fri, 28 Feb 2020 16:30:24 -0000
Received: from us1a3-smtp07.a3.dal06.isc4sb.com (10.146.103.14)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 28 Feb 2020 16:30:19 -0000
Received: from us1a3-mail34.a3.dal06.isc4sb.com ([10.146.6.29])
 by us1a3-smtp07.a3.dal06.isc4sb.com
 with ESMTP id 2020022816301883-620805 ;
 Fri, 28 Feb 2020 16:30:18 +0000 
In-Reply-To: <1B448D94-3C6C-42D5-991B-A6AFD720F999@fuzziesquirrel.com>
From: "Lakshminarayana R Kammath" <lkammath@in.ibm.com>
To: bradleyb@fuzziesquirrel.com
Date: Fri, 28 Feb 2020 16:30:19 +0000
Sensitivity: 
References: <1B448D94-3C6C-42D5-991B-A6AFD720F999@fuzziesquirrel.com>,
 <OFBAC0E531.E7E68FE5-ON0025851C.0053A4C8-0025851C.0055AA1E@notes.na.collabserv.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1661 | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 49595
X-TNEFEvaluated: 1
Content-Type: text/html; charset=UTF-8
x-cbid: 20022816-4409-0000-0000-00000216F33C
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.397557; ST=0; TS=0; UL=0; ISC=; MB=0.046568
X-IBM-SpamModules-Versions: BY=3.00012657; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000293; SDB=6.01340534; UDB=6.00714412; IPR=6.01122897; 
 MB=3.00031011; MTD=3.00000008; XFM=3.00000015; UTC=2020-02-28 16:30:23
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-02-28 12:51:55 - 6.00011059
x-cbparentid: 20022816-4410-0000-0000-00003E700A9A
Message-Id: <OF34BD4883.6AE8E4F8-ON0025851C.005A7EA7-0025851C.005AAACB@notes.na.collabserv.com>
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
Subject: RE: [OpenBMC]: Unit test coverage analysis on openbmc repositories
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-28_05:2020-02-28,
 2020-02-28 signatures=0
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
elvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" >sure Brad!</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >If Some one can confirm the list of repo's that can be ig=
nored we can put them to blacklist</div>
<div dir=3D"ltr" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"fo=
nt-family:Arial, Helvetica, sans-serif;font-size:10pt" ><div class=3D"socma=
ildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, Helvetica, sans-seri=
f;font-size:10.5pt" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D=
"font-family:Arial, Helvetica, sans-serif;font-size:10.5pt" ><div dir=3D"lt=
r" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Thanks &amp; Regards,<br>Lakshminarayana Kamath</div></di=
v></div></div></div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: Brad Bishop &lt;br=
adleyb@fuzziesquirrel.com&gt;<br>To: Lakshminarayana R Kammath &lt;lkammath=
@in.ibm.com&gt;<br>Cc: openbmc@lists.ozlabs.org<br>Subject: [EXTERNAL] Re: =
[OpenBMC]: Unit test coverage analysis on openbmc repositories<br>Date: Fri=
, Feb 28, 2020 9:48 PM<br>&nbsp;
<div><font size=3D"2" face=3D"Default Monospace,Courier New,Courier,monospa=
ce" >at 10:35 AM, Lakshminarayana R Kammath &lt;lkammath@in.ibm.com&gt; wro=
te:<br><br>&gt; Hi All,<br>&gt;<br>&gt; Recently we worked on pulling the U=
T coverage analysis from all the &nbsp;<br>&gt; available OpenBMC repositor=
ies<br>&gt;<br>&gt; <a href=3D"https://github.com/openbmc/openbmc-build-scr=
ipts/commit/229b76a95f87af60c976a0c0dfe84716c9ce5318" target=3D"_blank">htt=
ps://github.com/openbmc/openbmc-build-scripts/commit/229b76a95f87af60c976a0=
c0dfe84716c9ce5318</a>&nbsp;<br>&gt;<br>&gt; This script does following<br>=
&gt; =E2=80=A2 Clone the repo<br>&gt; =E2=80=A2 Use the CI build environmen=
t to build code<br>&gt; =E2=80=A2 Publish the result in the following forma=
t<br>&gt; Latest report:<br>&gt; *************************UNIT TEST COVERAG=
E REPORT*************************<br>&gt; <a href=3D"https://github.com/ope=
nbmc/bmcweb.git" target=3D"_blank">https://github.com/openbmc/bmcweb.git</a=
>&nbsp;&nbsp;NO<br>&gt; <a href=3D"https://github.com/openbmc/boost-dbus.gi=
t" target=3D"_blank">https://github.com/openbmc/boost-dbus.git</a>&nbsp;&nb=
sp;ERROR<br>&gt; <a href=3D"https://github.com/openbmc/btbridge.git" target=
=3D"_blank">https://github.com/openbmc/btbridge.git</a>&nbsp;&nbsp;NO<br>&g=
t; <a href=3D"https://github.com/openbmc/dbus-sensors.git" target=3D"_blank=
">https://github.com/openbmc/dbus-sensors.git</a>&nbsp;&nbsp;NO<br>&gt; <a =
href=3D"https://github.com/openbmc/entity-manager.git" target=3D"_blank">ht=
tps://github.com/openbmc/entity-manager.git</a>&nbsp;&nbsp;NO<br>&gt; <a hr=
ef=3D"https://github.com/openbmc/fb-ipmi-oem.git" target=3D"_blank">https:/=
/github.com/openbmc/fb-ipmi-oem.git</a>&nbsp;&nbsp;NO<br>&gt; <a href=3D"ht=
tps://github.com/openbmc/google-ipmi-i2c.git" target=3D"_blank">https://git=
hub.com/openbmc/google-ipmi-i2c.git</a>&nbsp;&nbsp;ERROR<br>&gt; <a href=3D=
"https://github.com/openbmc/google-ipmi-sys.git" target=3D"_blank">https://=
github.com/openbmc/google-ipmi-sys.git</a>&nbsp;&nbsp;YES, UNIT TEST<br>&gt=
; <a href=3D"https://github.com/openbmc/gpioplus.git" target=3D"_blank">htt=
ps://github.com/openbmc/gpioplus.git</a>&nbsp;&nbsp;YES, COVERAGE<br>&gt; <=
a href=3D"https://github.com/openbmc/hiomapd.git" target=3D"_blank">https:/=
/github.com/openbmc/hiomapd.git</a>&nbsp;&nbsp;YES, UNIT TEST<br>&gt; <a hr=
ef=3D"https://github.com/openbmc/ibm-dbus-interfaces.git" target=3D"_blank"=
>https://github.com/openbmc/ibm-dbus-interfaces.git</a>&nbsp;&nbsp;NO<br>&g=
t; <a href=3D"https://github.com/openbmc/ibm-logging.git" target=3D"_blank"=
>https://github.com/openbmc/ibm-logging.git</a>&nbsp;&nbsp;YES, UNIT TEST<b=
r>&gt; <a href=3D"https://github.com/openbmc/ibm-pldm-oem.git" target=3D"_b=
lank">https://github.com/openbmc/ibm-pldm-oem.git</a>&nbsp;&nbsp;ERROR<br>&=
gt; <a href=3D"https://github.com/openbmc/inarp.git" target=3D"_blank">http=
s://github.com/openbmc/inarp.git</a>&nbsp;&nbsp;ERROR<br>&gt; <a href=3D"ht=
tps://github.com/openbmc/intel-dbus-interfaces.git" target=3D"_blank">https=
://github.com/openbmc/intel-dbus-interfaces.git</a>&nbsp;&nbsp;NO<br>&gt; <=
a href=3D"https://github.com/openbmc/intel-ipmi-oem.git" target=3D"_blank">=
https://github.com/openbmc/intel-ipmi-oem.git</a>&nbsp;&nbsp;NO<br>&gt; <a =
href=3D"https://github.com/openbmc/ipmbbridge.git" target=3D"_blank">https:=
//github.com/openbmc/ipmbbridge.git</a>&nbsp;&nbsp;NO<br>&gt; <a href=3D"ht=
tps://github.com/openbmc/ipmi-blob-tool.git" target=3D"_blank">https://gith=
ub.com/openbmc/ipmi-blob-tool.git</a>&nbsp;&nbsp;YES, UNIT TEST<br>&gt; <a =
href=3D"https://github.com/openbmc/ipmi-fru-parser.git" target=3D"_blank">h=
ttps://github.com/openbmc/ipmi-fru-parser.git</a>&nbsp;&nbsp;NO<br>&gt; <a =
href=3D"https://github.com/openbmc/ipmitool.git" target=3D"_blank">https://=
github.com/openbmc/ipmitool.git</a>&nbsp;&nbsp;ERROR<br>&gt; <a href=3D"htt=
ps://github.com/openbmc/jsnbd.git" target=3D"_blank">https://github.com/ope=
nbmc/jsnbd.git</a>&nbsp;&nbsp;ERROR<br>&gt; <a href=3D"https://github.com/o=
penbmc/kcsbridge.git" target=3D"_blank">https://github.com/openbmc/kcsbridg=
e.git</a>&nbsp;&nbsp;NO<br>&gt; <a href=3D"https://github.com/openbmc/lenov=
o-ipmi-oem.git" target=3D"_blank">https://github.com/openbmc/lenovo-ipmi-oe=
m.git</a>&nbsp;&nbsp;NO<br>&gt; <a href=3D"https://github.com/openbmc/libmc=
tp.git" target=3D"_blank">https://github.com/openbmc/libmctp.git</a>&nbsp;&=
nbsp;YES, UNIT TEST<br>&gt; <a href=3D"https://github.com/openbmc/librrdplu=
s.git" target=3D"_blank">https://github.com/openbmc/librrdplus.git</a>&nbsp=
;&nbsp;NO<br>&gt; <a href=3D"https://github.com/openbmc/obmc-console.git" t=
arget=3D"_blank">https://github.com/openbmc/obmc-console.git</a>&nbsp;&nbsp=
;YES, UNIT TEST<br>&gt; <a href=3D"https://github.com/openbmc/obmc-ikvm.git=
" target=3D"_blank">https://github.com/openbmc/obmc-ikvm.git</a>&nbsp;&nbsp=
;NO<br>&gt; <a href=3D"https://github.com/openbmc/openbmc.git" target=3D"_b=
lank">https://github.com/openbmc/openbmc.git</a>&nbsp;&nbsp;NO<br>&gt; <a h=
ref=3D"https://github.com/openbmc/openbmc-tools.git" target=3D"_blank">http=
s://github.com/openbmc/openbmc-tools.git</a>&nbsp;&nbsp;NO<br>&gt; <a href=
=3D"https://github.com/openbmc/openbmc.github.io.git" target=3D"_blank">htt=
ps://github.com/openbmc/openbmc.github.io.git</a>&nbsp;&nbsp;NO<br>&gt; <a =
href=3D"https://github.com/openbmc/openpower-dbus-interfaces.git" target=3D=
"_blank">https://github.com/openbmc/openpower-dbus-interfaces.git</a>&nbsp;=
&nbsp;NO<br>&gt; <a href=3D"https://github.com/openbmc/openpower-debug-coll=
ector.git" target=3D"_blank">https://github.com/openbmc/openpower-debug-col=
lector.git</a>&nbsp;&nbsp;NO<br>&gt; <a href=3D"https://github.com/openbmc/=
openpower-host-ipmi-flash.git" target=3D"_blank">https://github.com/openbmc=
/openpower-host-ipmi-flash.git</a>&nbsp;&nbsp;NO<br>&gt; <a href=3D"https:/=
/github.com/openbmc/openpower-host-ipmi-oem.git" target=3D"_blank">https://=
github.com/openbmc/openpower-host-ipmi-oem.git</a>&nbsp;&nbsp;NO<br>&gt; <a=
 href=3D"https://github.com/openbmc/openpower-hw-diags.git" target=3D"_blan=
k">https://github.com/openbmc/openpower-hw-diags.git</a>&nbsp;&nbsp;YES, CO=
VERAGE<br>&gt; <a href=3D"https://github.com/openbmc/openpower-inventory-up=
load.git" target=3D"_blank">https://github.com/openbmc/openpower-inventory-=
upload.git</a>&nbsp;&nbsp;NO<br>&gt; <a href=3D"https://github.com/openbmc/=
openpower-libhei.git" target=3D"_blank">https://github.com/openbmc/openpowe=
r-libhei.git</a>&nbsp;&nbsp;YES, COVERAGE<br>&gt; <a href=3D"https://github=
.com/openbmc/openpower-logging.git" target=3D"_blank">https://github.com/op=
enbmc/openpower-logging.git</a>&nbsp;&nbsp;NO<br>&gt; <a href=3D"https://gi=
thub.com/openbmc/openpower-occ-control.git" target=3D"_blank">https://githu=
b.com/openbmc/openpower-occ-control.git</a>&nbsp;&nbsp;YES, UNIT TEST<br>&g=
t; <a href=3D"https://github.com/openbmc/openpower-pnor-code-mgmt.git" targ=
et=3D"_blank">https://github.com/openbmc/openpower-pnor-code-mgmt.git</a>&n=
bsp;&nbsp;YES, UNIT TEST<br>&gt; <a href=3D"https://github.com/openbmc/open=
power-power-control.git" target=3D"_blank">https://github.com/openbmc/openp=
ower-power-control.git</a>&nbsp;&nbsp;NO<br>&gt; <a href=3D"https://github.=
com/openbmc/openpower-proc-control.git" target=3D"_blank">https://github.co=
m/openbmc/openpower-proc-control.git</a>&nbsp;&nbsp;YES, UNIT TEST<br>&gt; =
<a href=3D"https://github.com/openbmc/openpower-sbe-interface.git" target=
=3D"_blank">https://github.com/openbmc/openpower-sbe-interface.git</a>&nbsp=
;&nbsp;NO<br>&gt; <a href=3D"https://github.com/openbmc/openpower-vpd-parse=
r.git" target=3D"_blank">https://github.com/openbmc/openpower-vpd-parser.gi=
t</a>&nbsp;&nbsp;YES, UNIT TEST<br>&gt; <a href=3D"https://github.com/openb=
mc/pam-ipmi.git" target=3D"_blank">https://github.com/openbmc/pam-ipmi.git<=
/a>&nbsp;&nbsp;NO<br>&gt; <a href=3D"https://github.com/openbmc/phosphor-bm=
c-code-mgmt.git" target=3D"_blank">https://github.com/openbmc/phosphor-bmc-=
code-mgmt.git</a>&nbsp;&nbsp;YES, UNIT TEST<br>&gt; <a href=3D"https://gith=
ub.com/openbmc/phosphor-buttons.git" target=3D"_blank">https://github.com/o=
penbmc/phosphor-buttons.git</a>&nbsp;&nbsp;NO<br>&gt; <a href=3D"https://gi=
thub.com/openbmc/phosphor-certificate-manager.git" target=3D"_blank">https:=
//github.com/openbmc/phosphor-certificate-manager.git</a>&nbsp;&nbsp;YES, U=
NIT TEST<br>&gt; <a href=3D"https://github.com/openbmc/phosphor-dbus-interf=
aces.git" target=3D"_blank">https://github.com/openbmc/phosphor-dbus-interf=
aces.git</a>&nbsp;&nbsp;NO<br>&gt; <a href=3D"https://github.com/openbmc/ph=
osphor-dbus-monitor.git" target=3D"_blank">https://github.com/openbmc/phosp=
hor-dbus-monitor.git</a>&nbsp;&nbsp;YES, UNIT TEST<br>&gt; <a href=3D"https=
://github.com/openbmc/phosphor-debug-collector.git" target=3D"_blank">https=
://github.com/openbmc/phosphor-debug-collector.git</a>&nbsp;&nbsp;NO<br>&gt=
; <a href=3D"https://github.com/openbmc/phosphor-ecc.git" target=3D"_blank"=
>https://github.com/openbmc/phosphor-ecc.git</a>&nbsp;&nbsp;NO<br>&gt; <a h=
ref=3D"https://github.com/openbmc/phosphor-event.git" target=3D"_blank">htt=
ps://github.com/openbmc/phosphor-event.git</a>&nbsp;&nbsp;YES, UNIT TEST<br=
>&gt; <a href=3D"https://github.com/openbmc/phosphor-fan-presence.git" targ=
et=3D"_blank">https://github.com/openbmc/phosphor-fan-presence.git</a>&nbsp=
;&nbsp;YES, UNIT TEST<br>&gt; <a href=3D"https://github.com/openbmc/phospho=
r-gpio-monitor.git" target=3D"_blank">https://github.com/openbmc/phosphor-g=
pio-monitor.git</a>&nbsp;&nbsp;YES, COVERAGE<br>&gt; <a href=3D"https://git=
hub.com/openbmc/phosphor-host-ipmid.git" target=3D"_blank">https://github.c=
om/openbmc/phosphor-host-ipmid.git</a>&nbsp;&nbsp;ERROR<br>&gt; <a href=3D"=
https://github.com/openbmc/phosphor-host-postd.git" target=3D"_blank">https=
://github.com/openbmc/phosphor-host-postd.git</a>&nbsp;&nbsp;YES, UNIT TEST=
<br>&gt; <a href=3D"https://github.com/openbmc/phosphor-hostlogger.git" tar=
get=3D"_blank">https://github.com/openbmc/phosphor-hostlogger.git</a>&nbsp;=
&nbsp;NO<br>&gt; <a href=3D"https://github.com/openbmc/phosphor-hwmon.git" =
target=3D"_blank">https://github.com/openbmc/phosphor-hwmon.git</a>&nbsp;&n=
bsp;NO<br>&gt; <a href=3D"https://github.com/openbmc/phosphor-inventory-man=
ager.git" target=3D"_blank">https://github.com/openbmc/phosphor-inventory-m=
anager.git</a>&nbsp;&nbsp;YES, UNIT TEST<br>&gt; <a href=3D"https://github.=
com/openbmc/phosphor-ipmi-blobs.git" target=3D"_blank">https://github.com/o=
penbmc/phosphor-ipmi-blobs.git</a>&nbsp;&nbsp;YES, UNIT TEST<br>&gt; <a hre=
f=3D"https://github.com/openbmc/phosphor-ipmi-blobs-binarystore.git" target=
=3D"_blank">https://github.com/openbmc/phosphor-ipmi-blobs-binarystore.git<=
/a>&nbsp;&nbsp;YES, UNIT &nbsp;<br>&gt; TEST<br>&gt; <a href=3D"https://git=
hub.com/openbmc/phosphor-ipmi-ethstats.git" target=3D"_blank">https://githu=
b.com/openbmc/phosphor-ipmi-ethstats.git</a>&nbsp;&nbsp;YES, UNIT TEST<br>&=
gt; <a href=3D"https://github.com/openbmc/phosphor-ipmi-flash.git" target=
=3D"_blank">https://github.com/openbmc/phosphor-ipmi-flash.git</a>&nbsp;&nb=
sp;YES, UNIT TEST<br>&gt; <a href=3D"https://github.com/openbmc/phosphor-le=
d-manager.git" target=3D"_blank">https://github.com/openbmc/phosphor-led-ma=
nager.git</a>&nbsp;&nbsp;YES, UNIT TEST<br>&gt; <a href=3D"https://github.c=
om/openbmc/phosphor-led-sysfs.git" target=3D"_blank">https://github.com/ope=
nbmc/phosphor-led-sysfs.git</a>&nbsp;&nbsp;YES, UNIT TEST<br>&gt; <a href=
=3D"https://github.com/openbmc/phosphor-logging.git" target=3D"_blank">http=
s://github.com/openbmc/phosphor-logging.git</a>&nbsp;&nbsp;YES, UNIT TEST<b=
r>&gt; <a href=3D"https://github.com/openbmc/phosphor-mboxd.git" target=3D"=
_blank">https://github.com/openbmc/phosphor-mboxd.git</a>&nbsp;&nbsp;ERROR<=
br>&gt; <a href=3D"https://github.com/openbmc/phosphor-misc.git" target=3D"=
_blank">https://github.com/openbmc/phosphor-misc.git</a>&nbsp;&nbsp;NO<br>&=
gt; <a href=3D"https://github.com/openbmc/phosphor-mrw-tools.git" target=3D=
"_blank">https://github.com/openbmc/phosphor-mrw-tools.git</a>&nbsp;&nbsp;N=
O<br>&gt; <a href=3D"https://github.com/openbmc/phosphor-net-ipmid.git" tar=
get=3D"_blank">https://github.com/openbmc/phosphor-net-ipmid.git</a>&nbsp;&=
nbsp;YES, UNIT TEST<br>&gt; <a href=3D"https://github.com/openbmc/phosphor-=
networkd.git" target=3D"_blank">https://github.com/openbmc/phosphor-network=
d.git</a>&nbsp;&nbsp;YES, UNIT TEST<br>&gt; <a href=3D"https://github.com/o=
penbmc/phosphor-nvme.git" target=3D"_blank">https://github.com/openbmc/phos=
phor-nvme.git</a>&nbsp;&nbsp;NO<br>&gt; <a href=3D"https://github.com/openb=
mc/phosphor-objmgr.git" target=3D"_blank">https://github.com/openbmc/phosph=
or-objmgr.git</a>&nbsp;&nbsp;YES, UNIT TEST<br>&gt; <a href=3D"https://gith=
ub.com/openbmc/phosphor-pcie-presence.git" target=3D"_blank">https://github=
.com/openbmc/phosphor-pcie-presence.git</a>&nbsp;&nbsp;NO<br>&gt; <a href=
=3D"https://github.com/openbmc/phosphor-pid-control.git" target=3D"_blank">=
https://github.com/openbmc/phosphor-pid-control.git</a>&nbsp;&nbsp;YES, UNI=
T TEST<br>&gt; <a href=3D"https://github.com/openbmc/phosphor-post-code-man=
ager.git" target=3D"_blank">https://github.com/openbmc/phosphor-post-code-m=
anager.git</a>&nbsp;&nbsp;NO<br>&gt; <a href=3D"https://github.com/openbmc/=
phosphor-power.git" target=3D"_blank">https://github.com/openbmc/phosphor-p=
ower.git</a>&nbsp;&nbsp;YES, COVERAGE<br>&gt; <a href=3D"https://github.com=
/openbmc/phosphor-power-control.git" target=3D"_blank">https://github.com/o=
penbmc/phosphor-power-control.git</a>&nbsp;&nbsp;NO<br>&gt; <a href=3D"http=
s://github.com/openbmc/phosphor-power-monitor.git" target=3D"_blank">https:=
//github.com/openbmc/phosphor-power-monitor.git</a>&nbsp;&nbsp;NO<br>&gt; <=
a href=3D"https://github.com/openbmc/phosphor-psu-code-mgmt.git" target=3D"=
_blank">https://github.com/openbmc/phosphor-psu-code-mgmt.git</a>&nbsp;&nbs=
p;YES, COVERAGE<br>&gt; <a href=3D"https://github.com/openbmc/phosphor-rest=
-server.git" target=3D"_blank">https://github.com/openbmc/phosphor-rest-ser=
ver.git</a>&nbsp;&nbsp;NO<br>&gt; <a href=3D"https://github.com/openbmc/pho=
sphor-sel-logger.git" target=3D"_blank">https://github.com/openbmc/phosphor=
-sel-logger.git</a>&nbsp;&nbsp;NO<br>&gt; <a href=3D"https://github.com/ope=
nbmc/phosphor-settingsd.git" target=3D"_blank">https://github.com/openbmc/p=
hosphor-settingsd.git</a>&nbsp;&nbsp;NO<br>&gt; <a href=3D"https://github.c=
om/openbmc/phosphor-snmp.git" target=3D"_blank">https://github.com/openbmc/=
phosphor-snmp.git</a>&nbsp;&nbsp;ERROR<br>&gt; <a href=3D"https://github.co=
m/openbmc/phosphor-state-manager.git" target=3D"_blank">https://github.com/=
openbmc/phosphor-state-manager.git</a>&nbsp;&nbsp;YES, COVERAGE<br>&gt; <a =
href=3D"https://github.com/openbmc/phosphor-time-manager.git" target=3D"_bl=
ank">https://github.com/openbmc/phosphor-time-manager.git</a>&nbsp;&nbsp;YE=
S, UNIT TEST<br>&gt; <a href=3D"https://github.com/openbmc/phosphor-u-boot-=
env-mgr.git" target=3D"_blank">https://github.com/openbmc/phosphor-u-boot-e=
nv-mgr.git</a>&nbsp;&nbsp;NO<br>&gt; <a href=3D"https://github.com/openbmc/=
phosphor-user-manager.git" target=3D"_blank">https://github.com/openbmc/pho=
sphor-user-manager.git</a>&nbsp;&nbsp;YES, UNIT TEST<br>&gt; <a href=3D"htt=
ps://github.com/openbmc/phosphor-watchdog.git" target=3D"_blank">https://gi=
thub.com/openbmc/phosphor-watchdog.git</a>&nbsp;&nbsp;YES, COVERAGE<br>&gt;=
 <a href=3D"https://github.com/openbmc/phosphor-webui.git" target=3D"_blank=
">https://github.com/openbmc/phosphor-webui.git</a>&nbsp;&nbsp;NO<br>&gt; <=
a href=3D"https://github.com/openbmc/pldm.git" target=3D"_blank">https://gi=
thub.com/openbmc/pldm.git</a>&nbsp;&nbsp;YES, COVERAGE<br>&gt; <a href=3D"h=
ttps://github.com/openbmc/pyphosphor.git" target=3D"_blank">https://github.=
com/openbmc/pyphosphor.git</a>&nbsp;&nbsp;NO<br>&gt; <a href=3D"https://git=
hub.com/openbmc/qualcomm-ipmi-oem.git" target=3D"_blank">https://github.com=
/openbmc/qualcomm-ipmi-oem.git</a>&nbsp;&nbsp;NO<br>&gt; <a href=3D"https:/=
/github.com/openbmc/qualcomm-misc.git" target=3D"_blank">https://github.com=
/openbmc/qualcomm-misc.git</a>&nbsp;&nbsp;NO<br>&gt; <a href=3D"https://git=
hub.com/openbmc/quanta-ipmi-oem.git" target=3D"_blank">https://github.com/o=
penbmc/quanta-ipmi-oem.git</a>&nbsp;&nbsp;NO<br>&gt; <a href=3D"https://git=
hub.com/openbmc/rest-dbus.git" target=3D"_blank">https://github.com/openbmc=
/rest-dbus.git</a>&nbsp;&nbsp;NO<br>&gt; <a href=3D"https://github.com/open=
bmc/rrd-ipmi-blobs.git" target=3D"_blank">https://github.com/openbmc/rrd-ip=
mi-blobs.git</a>&nbsp;&nbsp;NO<br>&gt; <a href=3D"https://github.com/openbm=
c/s2600wf-misc.git" target=3D"_blank">https://github.com/openbmc/s2600wf-mi=
sc.git</a>&nbsp;&nbsp;NO<br>&gt; <a href=3D"https://github.com/openbmc/sdbu=
splus.git" target=3D"_blank">https://github.com/openbmc/sdbusplus.git</a>&n=
bsp;&nbsp;YES, UNIT TEST<br>&gt; <a href=3D"https://github.com/openbmc/sdev=
entplus.git" target=3D"_blank">https://github.com/openbmc/sdeventplus.git</=
a>&nbsp;&nbsp;YES, COVERAGE<br>&gt; <a href=3D"https://github.com/openbmc/s=
keleton.git" target=3D"_blank">https://github.com/openbmc/skeleton.git</a>&=
nbsp;&nbsp;ERROR<br>&gt; <a href=3D"https://github.com/openbmc/slpd-lite.gi=
t" target=3D"_blank">https://github.com/openbmc/slpd-lite.git</a>&nbsp;&nbs=
p;NO<br>&gt; <a href=3D"https://github.com/openbmc/smbios-mdr.git" target=
=3D"_blank">https://github.com/openbmc/smbios-mdr.git</a>&nbsp;&nbsp;ERROR<=
br>&gt; <a href=3D"https://github.com/openbmc/stdplus.git" target=3D"_blank=
">https://github.com/openbmc/stdplus.git</a>&nbsp;&nbsp;YES, COVERAGE<br>&g=
t; <a href=3D"https://github.com/openbmc/telemetry.git" target=3D"_blank">h=
ttps://github.com/openbmc/telemetry.git</a>&nbsp;&nbsp;NO<br>&gt; <a href=
=3D"https://github.com/openbmc/u-boot" target=3D"_blank">https://github.com=
/openbmc/u-boot</a>&nbsp;&nbsp;NO<br>&gt; <a href=3D"https://github.com/ope=
nbmc/webui-vue.git" target=3D"_blank">https://github.com/openbmc/webui-vue.=
git</a>&nbsp;&nbsp;NO<br>&gt; <a href=3D"https://github.com/openbmc/withers=
poon-pfault-analysis.git" target=3D"_blank">https://github.com/openbmc/with=
erspoon-pfault-analysis.git</a>&nbsp;&nbsp;YES, COVERAGE<br>&gt; <a href=3D=
"https://github.com/openbmc/x86-power-control.git" target=3D"_blank">https:=
//github.com/openbmc/x86-power-control.git</a>&nbsp;&nbsp;NO<br>&gt; ******=
*******************UNIT TEST COVERAGE REPORT*************************<br>&g=
t; SUMMARY:<br>&gt; TOTAL REPOSITORIES : 110<br>&gt; TESTED REPOSITORIES : =
43<br>&gt; ERROR : 11<br>&gt; COVERAGE REPORT : 12<br>&gt; UNIT TEST REPORT=
 : 31<br>&gt; NO REPORT : 56<br>&gt; **************************************=
*************************************<br><br>Very nice Lakshmi!<br><br>Some=
 of the repos have been archived. &nbsp;Can the script be updated to check =
&nbsp;<br>for that and skip it if so?<br><br>boost-dbus, inarp are a couple=
 - there are likely more.</font><br>&nbsp;</div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>

