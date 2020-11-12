Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F06772AFF82
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 06:57:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWrV44gltzDqxX
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 16:57:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jet.li@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Q0pHPiRf; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWrT96ySgzDqwm
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2020 16:56:41 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AC5V7Zr195446
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2020 00:56:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : subject :
 from : to : cc : date : references : mime-version :
 content-transfer-encoding : content-type : message-id; s=pp1;
 bh=bjBeGbcfuB6NwnaM9oSHBie81voRT4WK3YGUnOtPfIw=;
 b=Q0pHPiRf93WxiPQinZ4YSAhP0Q85fsZJbqzGZg3eP0owu0xmfaMpKATL02M8LenK01oM
 EhGGWSAbe3bSCgYZ58HmMf1DH4GrIoI1/exBBsgxlL7sm9wFIMFu/eZDJ0E785/IqeOH
 Fd3P4/JAfhWyA3rx2pjL+pM8f15rlofvdpPRejjmuspYeR4Yx14StWrSKbL1iMTyXM6Q
 f/4WdKMB+ttmFr9Mj7EukvED45306aZpEC57oLR6hfAlWgZ2c2GBMe5FNapGGSaKwthb
 R9G2QP0h0BuuDJO9cHqatLMMxiqJxrT/oWfCdumrHVqtAYfBDJNpeMUnwoKeASmAF5UQ Rw== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.114])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34rnpae14s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2020 00:56:39 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <Jet.Li@ibm.com>;
 Thu, 12 Nov 2020 05:56:38 -0000
Received: from us1b3-smtp03.a3dr.sjc01.isc4sb.com (10.122.7.173)
 by smtp.notes.na.collabserv.com (10.122.47.58) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 12 Nov 2020 05:56:36 -0000
Received: from us1b3-mail137.a3dr.sjc03.isc4sb.com ([10.160.11.211])
 by us1b3-smtp03.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020111205563531-63633 ;
 Thu, 12 Nov 2020 05:56:35 +0000 
In-Reply-To: 
Subject: support NVMe drive health monitoring
From: "Jet Li" <Jet.Li@ibm.com>
To: ed@tanous.net, rashmi.r.v@linux.intel.com
Date: Thu, 12 Nov 2020 05:56:34 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 17652-1661 | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-KeepSent: 51173777:BBAB38E9-0025861E:0014BEED;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 43875
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 20111205-1639-0000-0000-000002FF9429
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40304; ST=0; TS=0; UL=0; ISC=; MB=0.255205
X-IBM-SpamModules-Versions: BY=3.00014172; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01462734; UDB=6.00787221; IPR=6.01245370; 
 MB=3.00034984; MTD=3.00000008; XFM=3.00000015; UTC=2020-11-12 05:56:36
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-11-11 23:36:13 - 6.00012052
x-cbparentid: 20111205-1640-0000-0000-0000C7D09803
Message-Id: <OF51173777.BBAB38E9-ON0025861E.0014BEED-0025861E.0020A56A@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-11_12:2020-11-10,
 2020-11-11 signatures=0
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
Cc: andrew@aj.id.au, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10pt" ><div class=3D"socmaildefaultfont" dir=
=3D"ltr" style=3D"font-family:Arial, Helvetica, sans-serif;font-size:10pt" =
><div dir=3D"ltr" ><p class=3D"p1" >Hi Ed, Rashmi,<br style=3D"outline: non=
e; color: rgb(18, 18, 18); font-family: &quot;Default Monospace&quot;, &quo=
t;Courier New&quot;, Courier, monospace; font-size: small; font-style: norm=
al; font-variant-ligatures: normal; font-variant-caps: normal; font-weight:=
 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0=
px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); tex=
t-decoration-style: initial; text-decoration-color: initial;" ><br>IBM are =
working on supporting NVMe drive health monitoring for some new system desi=
gns and have been posting some patches to dbus-sensors (e.g. [1]).<br style=
=3D"outline: none; color: rgb(18, 18, 18); font-family: &quot;Default Monos=
pace&quot;, &quot;Courier New&quot;, Courier, monospace; font-size: small; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; w=
ord-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255=
, 255, 255); text-decoration-style: initial; text-decoration-color: initial=
;" ><br>[1] <a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/dbus-se=
nsors/+/38058/" >https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/=
+/38058/</a><br style=3D"outline: none; color: rgb(18, 18, 18); font-family=
: &quot;Default Monospace&quot;, &quot;Courier New&quot;, Courier, monospac=
e; font-size: small; font-style: normal; font-variant-ligatures: normal; fo=
nt-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans:=
 2; text-align: start; text-indent: 0px; text-transform: none; white-space:=
 normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; back=
ground-color: rgb(255, 255, 255); text-decoration-style: initial; text-deco=
ration-color: initial;" ><br>As some background our high level requirements=
 are that we need to:<br style=3D"outline: none; color: rgb(18, 18, 18); fo=
nt-family: &quot;Default Monospace&quot;, &quot;Courier New&quot;, Courier,=
 monospace; font-size: small; font-style: normal; font-variant-ligatures: n=
ormal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal;=
 orphans: 2; text-align: start; text-indent: 0px; text-transform: none; whi=
te-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: =
0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; =
text-decoration-color: initial;" ><br>1. Monitor NVMe drive health to suppl=
y data for fan management and error logging<br>2. Support arbitrary drive c=
onfigurations in the platform(s), which are plugged into removable IO cards=
<br style=3D"outline: none; color: rgb(18, 18, 18); font-family: &quot;Defa=
ult Monospace&quot;, &quot;Courier New&quot;, Courier, monospace; font-size=
: small; font-style: normal; font-variant-ligatures: normal; font-variant-c=
aps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-ali=
gn: start; text-indent: 0px; text-transform: none; white-space: normal; wid=
ows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color=
: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color=
: initial;" ><br>As you're no doubt aware, NVMe drive state is exposed via =
two interfaces:<br style=3D"outline: none; color: rgb(18, 18, 18); font-fam=
ily: &quot;Default Monospace&quot;, &quot;Courier New&quot;, Courier, monos=
pace; font-size: small; font-style: normal; font-variant-ligatures: normal;=
 font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orpha=
ns: 2; text-align: start; text-indent: 0px; text-transform: none; white-spa=
ce: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; b=
ackground-color: rgb(255, 255, 255); text-decoration-style: initial; text-d=
ecoration-color: initial;" ><br>3. A Basic Management Command over SMBus<br=
>4. NVMe-MI over MCTP, via the SMBus MCTP binding<br style=3D"outline: none=
; color: rgb(18, 18, 18); font-family: &quot;Default Monospace&quot;, &quot=
;Courier New&quot;, Courier, monospace; font-size: small; font-style: norma=
l; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: =
400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0p=
x; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px;=
 -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text=
-decoration-style: initial; text-decoration-color: initial;" ><br>And in Op=
enBMC there are two corresponding NVMe monitoring implementations:<br style=
=3D"outline: none; color: rgb(18, 18, 18); font-family: &quot;Default Monos=
pace&quot;, &quot;Courier New&quot;, Courier, monospace; font-size: small; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; w=
ord-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255=
, 255, 255); text-decoration-style: initial; text-decoration-color: initial=
;" ><br>5. phosphor-nvme: Basic Management Command, static configuration<br=
>6. dbus-sensors: NVMe-MI over MCTP, dynamic configuration<br style=3D"outl=
ine: none; color: rgb(18, 18, 18); font-family: &quot;Default Monospace&quo=
t;, &quot;Courier New&quot;, Courier, monospace; font-size: small; font-sty=
le: normal; font-variant-ligatures: normal; font-variant-caps: normal; font=
-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-i=
ndent: 0px; text-transform: none; white-space: normal; widows: 2; word-spac=
ing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 2=
55); text-decoration-style: initial; text-decoration-color: initial;" ><br>=
IBM are migrating our BMC designs towards entity-manager and dbus-sensors, =
and our newer system designs would benefit from dbus-sensor's dynamic confi=
guration via entity-manager (we have reservations about the drive presence =
GPIO configuration in the phosphor-nvme with respect to our system designs)=
.<br>Zooming out briefly we're looking to, where possible, use upstream cod=
e and avoid the use of forks. However, as dbus-sensors uses NVMe-MI over MC=
TP via libmctp, we have some concerns:<br style=3D"outline: none; color: rg=
b(18, 18, 18); font-family: &quot;Default Monospace&quot;, &quot;Courier Ne=
w&quot;, Courier, monospace; font-size: small; font-style: normal; font-var=
iant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter=
-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-tra=
nsform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-te=
xt-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration=
-style: initial; text-decoration-color: initial;" ><br>7. Upstream libmctp =
(openbmc/libmctp) currently implements just two bindings<br>&nbsp; &nbsp; a=
. Serial (DSP0253)<br>&nbsp; &nbsp; b. ASTLPC (Vendor-specific binding)<br>=
8. Intel have forked libmctp (intel-bmc/libmctp) and implemented a further =
two bindings<br>&nbsp; &nbsp; a. SMBus (DSP0237)<br>&nbsp; &nbsp; b. PCIe V=
DM (DSP0238)<br>9. Both the SMBus and PCIe VDM binding implementations in i=
ntel-bmc/libmctp require kernel patches that only exist in Intel's OpenBMC =
tree<br style=3D"outline: none; color: rgb(18, 18, 18); font-family: &quot;=
Default Monospace&quot;, &quot;Courier New&quot;, Courier, monospace; font-=
size: small; font-style: normal; font-variant-ligatures: normal; font-varia=
nt-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text=
-align: start; text-indent: 0px; text-transform: none; white-space: normal;=
 widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-c=
olor: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-c=
olor: initial;" ><br>Finally, for the moment, the data provided by the NVMe=
 Basic Management Command meets IBM's current requirements, and we're using=
 drives that support the Basic Management Command.<br style=3D"outline: non=
e; color: rgb(18, 18, 18); font-family: &quot;Default Monospace&quot;, &quo=
t;Courier New&quot;, Courier, monospace; font-size: small; font-style: norm=
al; font-variant-ligatures: normal; font-variant-caps: normal; font-weight:=
 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0=
px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); tex=
t-decoration-style: initial; text-decoration-color: initial;" ><br>So the d=
irection we chose is to use entity-manager and dbus-sensors for NVMe drive =
monitoring, and<br>implement support for the Basic Management Command over =
SMBus in the NVMeSensor application. To get there, as far as I have determi=
ned, we should do the following:<br style=3D"outline: none; color: rgb(18, =
18, 18); font-family: &quot;Default Monospace&quot;, &quot;Courier New&quot=
;, Courier, monospace; font-size: small; font-style: normal; font-variant-l=
igatures: normal; font-variant-caps: normal; font-weight: 400; letter-spaci=
ng: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-str=
oke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style=
: initial; text-decoration-color: initial;" ><br>10. Make optional the depe=
ndency of NVMeSensor on the forked libmctp<br>11. Add a compile-time flag t=
o {en,dis}able the MCTP NVMe-MI backend<br>12. Add a compile-time flag to {=
en,dis}able the Basic Management Command backend<br>13. Patch intel-bmc/ope=
nbmc to configure NVMeSensor with MCTP NVMe-MI enabled<br>14. Change the de=
fault build configuration of NVMeSensor use the Basic Management Command<br=
>15. Enable out-of-tree builds of NVMeSensor by default<br>16. Add NVMeSens=
or unit tests<br>17. Enable CI for dbus-sensors where we can / is necessary=
<br style=3D"outline: none; color: rgb(18, 18, 18); font-family: &quot;Defa=
ult Monospace&quot;, &quot;Courier New&quot;, Courier, monospace; font-size=
: small; font-style: normal; font-variant-ligatures: normal; font-variant-c=
aps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-ali=
gn: start; text-indent: 0px; text-transform: none; white-space: normal; wid=
ows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color=
: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color=
: initial;" ><br style=3D"outline: none; color: rgb(18, 18, 18); font-famil=
y: &quot;Default Monospace&quot;, &quot;Courier New&quot;, Courier, monospa=
ce; font-size: small; font-style: normal; font-variant-ligatures: normal; f=
ont-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans=
: 2; text-align: start; text-indent: 0px; text-transform: none; white-space=
: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; bac=
kground-color: rgb(255, 255, 255); text-decoration-style: initial; text-dec=
oration-color: initial;" ><br style=3D"outline: none; color: rgb(18, 18, 18=
); font-family: &quot;Default Monospace&quot;, &quot;Courier New&quot;, Cou=
rier, monospace; font-size: small; font-style: normal; font-variant-ligatur=
es: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: no=
rmal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none=
; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-wi=
dth: 0px; background-color: rgb(255, 255, 255); text-decoration-style: init=
ial; text-decoration-color: initial;" >Regards,<br style=3D"outline: none; =
color: rgb(18, 18, 18); font-family: &quot;Default Monospace&quot;, &quot;C=
ourier New&quot;, Courier, monospace; font-size: small; font-style: normal;=
 font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 40=
0; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px;=
 text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -=
webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-d=
ecoration-style: initial; text-decoration-color: initial;" >Jet</p></div></=
div></div><BR>

