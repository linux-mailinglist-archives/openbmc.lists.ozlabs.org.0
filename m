Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA0F173B86
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 16:36:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TYYT3Kr9zDrK4
	for <lists+openbmc@lfdr.de>; Sat, 29 Feb 2020 02:36:45 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TYXV3lYszDrHP
 for <openbmc@lists.ozlabs.org>; Sat, 29 Feb 2020 02:35:50 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01SFZWfB118109
 for <openbmc@lists.ozlabs.org>; Fri, 28 Feb 2020 10:35:47 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.93])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yepy2k8hb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 28 Feb 2020 10:35:46 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <lkammath@in.ibm.com>;
 Fri, 28 Feb 2020 15:35:46 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.39) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 28 Feb 2020 15:35:43 -0000
Received: from us1a3-mail34.a3.dal06.isc4sb.com ([10.146.6.29])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2020022815354127-599204 ;
 Fri, 28 Feb 2020 15:35:41 +0000 
In-Reply-To: 
Subject: [OpenBMC]: Unit test coverage analysis on openbmc repositories
From: "Lakshminarayana R Kammath" <lkammath@in.ibm.com>
To: openbmc@lists.ozlabs.org
Date: Fri, 28 Feb 2020 15:35:41 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1661 | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 1011
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 20022815-8889-0000-0000-0000020A904D
X-IBM-SpamModules-Scores: BY=0.276859; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.404685; ST=0; TS=0; UL=0; ISC=; MB=0.262340
X-IBM-SpamModules-Versions: BY=3.00012657; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000293; SDB=6.01340516; UDB=6.00714412; IPR=6.01122878; 
 MB=3.00031011; MTD=3.00000008; XFM=3.00000015; UTC=2020-02-28 15:35:45
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-02-28 12:11:07 - 6.00011059
x-cbparentid: 20022815-8890-0000-0000-00005F80A589
Message-Id: <OFBAC0E531.E7E68FE5-ON0025851C.0053A4C8-0025851C.0055AA1E@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-28_04:2020-02-28,
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" style=3D"font-family=
:Arial, Helvetica, sans-serif;font-size:10pt" ><div dir=3D"ltr" >Hi All,</d=
iv>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Recently we worked on pulling the UT coverage analysis fr=
om all the available OpenBMC repositories</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/openbmc-build-scrip=
ts/commit/229b76a95f87af60c976a0c0dfe84716c9ce5318" target=3D"=5Fblank" >ht=
tps://github.com/openbmc/openbmc-build-scripts/commit/229b76a95f87af60c976a=
0c0dfe84716c9ce5318</a></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >This script does following</div>
<ol dir=3D"ltr" >        <li>Clone the repo</li>        <li>Use the CI buil=
d environment to build code</li>        <li>Publish the result in the follo=
wing format</li></ol>
<div dir=3D"ltr" >Latest report:</div>
<div dir=3D"ltr" >*************************UNIT TEST COVERAGE REPORT*******=
******************</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/bmcweb.git" rel=3D"=
nofollow" target=3D"=5Fblank" >https://github.com/openbmc/bmcweb.git</a> NO=
</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/boost-dbus.git" rel=
=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/boost-dbus.gi=
t</a> ERROR</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/btbridge.git" rel=
=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/btbridge.git<=
/a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/dbus-sensors.git" r=
el=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/dbus-sensor=
s.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/entity-manager.git"=
 rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/entity-ma=
nager.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/fb-ipmi-oem.git" re=
l=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/fb-ipmi-oem.=
git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/google-ipmi-i2c.git=
" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/google-i=
pmi-i2c.git</a> ERROR</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/google-ipmi-sys.git=
" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/google-i=
pmi-sys.git</a> YES, UNIT TEST</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/gpioplus.git" rel=
=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/gpioplus.git<=
/a> YES, COVERAGE</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/hiomapd.git" rel=3D=
"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/hiomapd.git</a> =
YES, UNIT TEST</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/ibm-dbus-interfaces=
.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/ibm-=
dbus-interfaces.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/ibm-logging.git" re=
l=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/ibm-logging.=
git</a> YES, UNIT TEST</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/ibm-pldm-oem.git" r=
el=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/ibm-pldm-oe=
m.git</a> ERROR</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/inarp.git" rel=3D"n=
ofollow" target=3D"=5Fblank" >https://github.com/openbmc/inarp.git</a> ERRO=
R</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/intel-dbus-interfac=
es.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/in=
tel-dbus-interfaces.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/intel-ipmi-oem.git"=
 rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/intel-ipm=
i-oem.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/ipmbbridge.git" rel=
=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/ipmbbridge.gi=
t</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/ipmi-blob-tool.git"=
 rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/ipmi-blob=
-tool.git</a> YES, UNIT TEST</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/ipmi-fru-parser.git=
" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/ipmi-fru=
-parser.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/ipmitool.git" rel=
=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/ipmitool.git<=
/a> ERROR</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/jsnbd.git" rel=3D"n=
ofollow" target=3D"=5Fblank" >https://github.com/openbmc/jsnbd.git</a> ERRO=
R</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/kcsbridge.git" rel=
=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/kcsbridge.git=
</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/lenovo-ipmi-oem.git=
" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/lenovo-i=
pmi-oem.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/libmctp.git" rel=3D=
"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/libmctp.git</a> =
YES, UNIT TEST</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/librrdplus.git" rel=
=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/librrdplus.gi=
t</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/obmc-console.git" r=
el=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/obmc-consol=
e.git</a> YES, UNIT TEST</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/obmc-ikvm.git" rel=
=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/obmc-ikvm.git=
</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/openbmc.git" rel=3D=
"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/openbmc.git</a> =
NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/openbmc-tools.git" =
rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/openbmc-to=
ols.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/openbmc.github.io.g=
it" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/openbm=
c.github.io.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/openpower-dbus-inte=
rfaces.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbm=
c/openpower-dbus-interfaces.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/openpower-debug-col=
lector.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbm=
c/openpower-debug-collector.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/openpower-host-ipmi=
-flash.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbm=
c/openpower-host-ipmi-flash.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/openpower-host-ipmi=
-oem.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/=
openpower-host-ipmi-oem.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/openpower-hw-diags.=
git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/openp=
ower-hw-diags.git</a> YES, COVERAGE</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/openpower-inventory=
-upload.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openb=
mc/openpower-inventory-upload.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/openpower-libhei.gi=
t" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/openpow=
er-libhei.git</a> YES, COVERAGE</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/openpower-logging.g=
it" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/openpo=
wer-logging.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/openpower-occ-contr=
ol.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/op=
enpower-occ-control.git</a> YES, UNIT TEST</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/openpower-pnor-code=
-mgmt.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc=
/openpower-pnor-code-mgmt.git</a> YES, UNIT TEST</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/openpower-power-con=
trol.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/=
openpower-power-control.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/openpower-proc-cont=
rol.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/o=
penpower-proc-control.git</a> YES, UNIT TEST</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/openpower-sbe-inter=
face.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/=
openpower-sbe-interface.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/openpower-vpd-parse=
r.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/ope=
npower-vpd-parser.git</a> YES, UNIT TEST</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/pam-ipmi.git" rel=
=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/pam-ipmi.git<=
/a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-bmc-code-m=
gmt.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/p=
hosphor-bmc-code-mgmt.git</a> YES, UNIT TEST</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-buttons.gi=
t" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/phospho=
r-buttons.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-certificat=
e-manager.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/ope=
nbmc/phosphor-certificate-manager.git</a> YES, UNIT TEST</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-dbus-inter=
faces.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc=
/phosphor-dbus-interfaces.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-dbus-monit=
or.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/ph=
osphor-dbus-monitor.git</a> YES, UNIT TEST</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-debug-coll=
ector.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc=
/phosphor-debug-collector.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-ecc.git" r=
el=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/phosphor-ec=
c.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-event.git"=
 rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/phosphor-=
event.git</a> YES, UNIT TEST</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-fan-presen=
ce.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/ph=
osphor-fan-presence.git</a> YES, UNIT TEST</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-gpio-monit=
or.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/ph=
osphor-gpio-monitor.git</a> YES, COVERAGE</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-host-ipmid=
.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/phos=
phor-host-ipmid.git</a> ERROR</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-host-postd=
.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/phos=
phor-host-postd.git</a> YES, UNIT TEST</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-hostlogger=
.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/phos=
phor-hostlogger.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-hwmon.git"=
 rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/phosphor-=
hwmon.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-inventory-=
manager.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openb=
mc/phosphor-inventory-manager.git</a> YES, UNIT TEST</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-ipmi-blobs=
.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/phos=
phor-ipmi-blobs.git</a> YES, UNIT TEST</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-ipmi-blobs=
-binarystore.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/=
openbmc/phosphor-ipmi-blobs-binarystore.git</a> YES, UNIT TEST</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-ipmi-ethst=
ats.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/p=
hosphor-ipmi-ethstats.git</a> YES, UNIT TEST</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-ipmi-flash=
.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/phos=
phor-ipmi-flash.git</a> YES, UNIT TEST</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-led-manage=
r.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/pho=
sphor-led-manager.git</a> YES, UNIT TEST</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-led-sysfs.=
git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/phosp=
hor-led-sysfs.git</a> YES, UNIT TEST</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-logging.gi=
t" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/phospho=
r-logging.git</a> YES, UNIT TEST</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-mboxd.git"=
 rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/phosphor-=
mboxd.git</a> ERROR</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-misc.git" =
rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/phosphor-m=
isc.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-mrw-tools.=
git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/phosp=
hor-mrw-tools.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-net-ipmid.=
git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/phosp=
hor-net-ipmid.git</a> YES, UNIT TEST</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-networkd.g=
it" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/phosph=
or-networkd.git</a> YES, UNIT TEST</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-nvme.git" =
rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/phosphor-n=
vme.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-objmgr.git=
" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/phosphor=
-objmgr.git</a> YES, UNIT TEST</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-pcie-prese=
nce.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/p=
hosphor-pcie-presence.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-pid-contro=
l.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/pho=
sphor-pid-control.git</a> YES, UNIT TEST</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-post-code-=
manager.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openb=
mc/phosphor-post-code-manager.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-power.git"=
 rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/phosphor-=
power.git</a> YES, COVERAGE</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-power-cont=
rol.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/p=
hosphor-power-control.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-power-moni=
tor.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/p=
hosphor-power-monitor.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-psu-code-m=
gmt.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/p=
hosphor-psu-code-mgmt.git</a> YES, COVERAGE</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-rest-serve=
r.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/pho=
sphor-rest-server.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-sel-logger=
.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/phos=
phor-sel-logger.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-settingsd.=
git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/phosp=
hor-settingsd.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-snmp.git" =
rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/phosphor-s=
nmp.git</a> ERROR</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-state-mana=
ger.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/p=
hosphor-state-manager.git</a> YES, COVERAGE</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-time-manag=
er.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/ph=
osphor-time-manager.git</a> YES, UNIT TEST</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-u-boot-env=
-mgr.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/=
phosphor-u-boot-env-mgr.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-user-manag=
er.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/ph=
osphor-user-manager.git</a> YES, UNIT TEST</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-watchdog.g=
it" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/phosph=
or-watchdog.git</a> YES, COVERAGE</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/phosphor-webui.git"=
 rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/phosphor-=
webui.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/pldm.git" rel=3D"no=
follow" target=3D"=5Fblank" >https://github.com/openbmc/pldm.git</a> YES, C=
OVERAGE</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/pyphosphor.git" rel=
=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/pyphosphor.gi=
t</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/qualcomm-ipmi-oem.g=
it" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/qualco=
mm-ipmi-oem.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/qualcomm-misc.git" =
rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/qualcomm-m=
isc.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/quanta-ipmi-oem.git=
" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/quanta-i=
pmi-oem.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/rest-dbus.git" rel=
=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/rest-dbus.git=
</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/rrd-ipmi-blobs.git"=
 rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/rrd-ipmi-=
blobs.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/s2600wf-misc.git" r=
el=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/s2600wf-mis=
c.git</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/sdbusplus.git" rel=
=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/sdbusplus.git=
</a> YES, UNIT TEST</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/sdeventplus.git" re=
l=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/sdeventplus.=
git</a> YES, COVERAGE</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/skeleton.git" rel=
=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/skeleton.git<=
/a> ERROR</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/slpd-lite.git" rel=
=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/slpd-lite.git=
</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/smbios-mdr.git" rel=
=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/smbios-mdr.gi=
t</a> ERROR</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/stdplus.git" rel=3D=
"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/stdplus.git</a> =
YES, COVERAGE</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/telemetry.git" rel=
=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/telemetry.git=
</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/u-boot" rel=3D"nofo=
llow" target=3D"=5Fblank" >https://github.com/openbmc/u-boot</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/webui-vue.git" rel=
=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/webui-vue.git=
</a> NO</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/witherspoon-pfault-=
analysis.git" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/open=
bmc/witherspoon-pfault-analysis.git</a> YES, COVERAGE</div>
<div dir=3D"ltr" ><a href=3D"https://github.com/openbmc/x86-power-control.g=
it" rel=3D"nofollow" target=3D"=5Fblank" >https://github.com/openbmc/x86-po=
wer-control.git</a> NO</div>
<div dir=3D"ltr" >*************************UNIT TEST COVERAGE REPORT*******=
******************</div>
<div dir=3D"ltr" >SUMMARY:</div>
<div dir=3D"ltr" >TOTAL REPOSITORIES : 110</div>
<div dir=3D"ltr" >TESTED REPOSITORIES : 43</div>
<div dir=3D"ltr" >ERROR : 11</div>
<div dir=3D"ltr" >COVERAGE REPORT : 12</div>
<div dir=3D"ltr" >UNIT TEST REPORT : 31</div>
<div dir=3D"ltr" >NO REPORT : 56</div>
<div dir=3D"ltr" >*********************************************************=
******************</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><p>Following actions, we can draw from above</p>
<ol>        <li><strong>There are 12 repo's that have GCOV/LCOV plugged in<=
/strong> - We need to maintain which has good coverage and try to improve t=
hose which has less coverage</li>        <li><strong>There are 31 repo's th=
at have unit test cases added but no coverage analysis because they aren't =
plugged in yet to GCOV/LCOV</strong>&nbsp; - Is there a plan for plugging i=
n GCOV</li>        <li>There are 11 repo's which fail to compile and errors=
 out - Fix compilation issue. Some of these maybe not used currently?</li> =
       <li>There are 56 repo's for which there is no UT tests available&nbs=
p; - This is a major issue we need to tackle and improve upon</li></ol>
<div>Feedback's , views highly appreciated</div>
<div>&nbsp;</div></div>
<div dir=3D"ltr" ><div dir=3D"ltr" style=3D"font-family:Arial, Helvetica, s=
ans-serif;font-size:10pt" ><div dir=3D"ltr" style=3D"font-family:Arial, Hel=
vetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" style=3D"font-family=
:Arial, Helvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >Thanks &=
amp; Regards,<br>Lakshminarayana Kamath<br>--------------------------------=
------------------------------------------------------------------<br>Senio=
r Engineer,</div>
<div dir=3D"ltr" >IBM India Software Labs</div>
<div dir=3D"ltr" >Bangalore</div>
<div dir=3D"ltr" >github:lkammath<br>--------------------------------------=
-------------------------------------------------------------</div>
<div dir=3D"ltr" >&nbsp;</div></div></div></div></div></div></div><BR>

