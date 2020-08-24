Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBB824F17E
	for <lists+openbmc@lfdr.de>; Mon, 24 Aug 2020 05:22:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BZcqz2rB2zDqHr
	for <lists+openbmc@lfdr.de>; Mon, 24 Aug 2020 13:22:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=J46U+Z3B; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BZcq15mpyzDqHr
 for <openbmc@lists.ozlabs.org>; Mon, 24 Aug 2020 13:21:33 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07O3D7QK158564
 for <openbmc@lists.ozlabs.org>; Sun, 23 Aug 2020 23:21:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : mime-version : references : content-transfer-encoding :
 content-type : message-id : subject; s=pp1;
 bh=ngvnNaWjWuyBfQKhsKCn70rNlYGsIFaP7TgcfLrwN4o=;
 b=J46U+Z3BBEj0mr/EGzrOKipa6WYoF9rm3tiIrZgWDhbRhr4s/bSS2Rn/Rz624UKET+WH
 zistToec4KKTxmuVRSv9tQ8UcLeZxePapD7AXPzxq2UtN6N6vpFcyQ8a2Ug+uG8oy217
 cDfxCfE+vmGYb2C2G2OmDOilBCBOEDHbfMCWFtQ1qv9c71vLS51Buzr9AMbIZPug4d+x
 ISLkqQyOS2ZrJQk6KkECF1Z0xrYp+WafT4OMwlM4TjR8zEI63QQpU7l1ZCd+/pcrUtr2
 BS47v64y5QxoFopbrLolr2HLZcvdQp4m1Z50ekSH6TaKfUyc1Xzxd7ATgLXnDBkX8V68 8Q== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.119])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3345epg4n3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sun, 23 Aug 2020 23:21:30 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Mon, 24 Aug 2020 03:21:29 -0000
Received: from us1b3-smtp07.a3dr.sjc01.isc4sb.com (10.122.203.198)
 by smtp.notes.na.collabserv.com (10.122.182.123) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 24 Aug 2020 03:21:28 -0000
Received: from us1b3-mail228.a3dr.sjc03.isc4sb.com ([10.168.214.55])
 by us1b3-smtp07.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020082403212747-530728 ;
 Mon, 24 Aug 2020 03:21:27 +0000 
In-Reply-To: <9DB3C10D-AC72-4508-879A-1E15BB9E4E69@gmail.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Mike Jones <proclivis@gmail.com>
Date: Mon, 24 Aug 2020 03:21:26 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <9DB3C10D-AC72-4508-879A-1E15BB9E4E69@gmail.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 16631
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 20082403-3975-0000-0000-000002C42CFA
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.371236; ST=0; TS=0; UL=0; ISC=; MB=0.456565
X-IBM-SpamModules-Versions: BY=3.00013704; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01424488; UDB=6.00764527; IPR=6.01207216; 
 MB=3.00033671; MTD=3.00000008; XFM=3.00000015; UTC=2020-08-24 03:21:28
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-08-24 01:51:51 - 6.00011758
x-cbparentid: 20082403-3976-0000-0000-000040052F04
Message-Id: <OF0D96B592.C63EA11D-ON002585CE.0011F8B0-002585CE.0012716F@notes.na.collabserv.com>
Subject: Re:  Server Power On mystery
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-24_01:2020-08-21,
 2020-08-24 signatures=0
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2"><div>On August 21, 2020, Mike Jones wrote:</div>&gt;I am trying to u=
nderstand how the Server power button in the webui<br>&gt;works.<br>&gt;<br=
>&gt;As before, using raspberry pi, and I=E2=80=99ll leave project links at=
 the<br>&gt;end for anyone that wants to use them. Things work up to monito=
ring<br>&gt;voltages. Note the conf project has a phosphor branch for the f=
ull<br>&gt;monty.&gt;&gt;To reverse engineer, I setup: dbus-monitor =E2=80=
=94system &gt; someFile.log<br>&gt;<br>&gt;There is a message for systemd1.=
Manager; member=3DStartUnit and best I<br>&gt;can tell, somehow this gets r=
outed to systemd to start some service<br>&gt;or run some exe. I see this m=
entioned in the dbus transactions:<br>&gt;<br>&gt;"<a href=3D"mailto:obmc-h=
ost-start@0.target" target=3D"=5Fblank">obmc-host-start@0.target</a>=E2=80=
=9D<br>&gt;<br>&gt;And that is in /lib/systemd/system and depends<br>&gt;on=
&nbsp;<a href=3D"mailto:obmc-host-startmin@0.target" target=3D"=5Fblank">ob=
mc-host-startmin@0.target</a>, but that does not depend on any<br>&gt;servi=
ce. So that is a&nbsp;dead end. It also depends on a reboot attempts,<br>&g=
t;but I think that is not&nbsp;responsible for power on/off.<br>&gt;<br>&gt=
;Then there are chassis services, but I cannot find a link from<br>&gt;<a h=
ref=3D"mailto:obmc-host-start@0.target" target=3D"=5Fblank">obmc-host-start=
@0.target</a> to <a href=3D"mailto:objc-chassis-poweron@0.target" target=3D=
"=5Fblank">objc-chassis-poweron@0.target</a>.<br><div><br></div><div><br></=
div><div><br></div><div>&gt;</div>&gt;In this<br>&gt;doc:&nbsp;<a href=3D"h=
ttps://github.com/openbmc/docs/blob/master/architecture/openbmc" target=3D"=
=5Fblank">https://github.com/openbmc/docs/blob/master/architecture/openbmc<=
/a><br>&gt;-systemd.md<br>&gt;<br>&gt;It shows:<br>&gt;<br>&gt;<br>&gt;ls -=
1 /lib/systemd/system/obmc-chassis-poweron\@0.target.requires/<br>&gt;<a hr=
ef=3D"mailto:op-power-start@0.service" target=3D"=5Fblank">op-power-start@0=
.service</a> <a href=3D"mailto:op-wait-power-on@0.service" target=3D"=5Fbla=
nk">op-wait-power-on@0.service</a>&gt;&gt;But when I =E2=80=9Cls=E2=80=9D t=
hat path, the above dependencies are not there.<br>&gt;There is only a depe=
ndency on <a href=3D"mailto:phosphor-fan-presence-tach@0.service" target=3D=
"=5Fblank">phosphor-fan-presence-tach@0.service</a><br>&gt;<br>&gt;There is=
 some state service that lead to things with xzy paths, and I<br>&gt;eventu=
ally found /run/systemd/units. These have file names starting<br>&gt;with =
=E2=80=9Cinvocation=E2=80=9D in the names and link to GUID like nodes that =
don=E2=80=99t<br>&gt;=E2=80=9Ccat=E2=80=9D like a normal file. So I am not =
sure how those work. Is there<br>&gt;some kernel driver that works like sys=
fs so that these nodes are not<br>&gt;traditional files?<br>&gt;<br>&gt;Wha=
t I am trying to understand is two things:<br>&gt;<br>&gt;- Interaction wit=
h the power regulator<br>&gt;- Interaction with the host cpu<br>&gt;<br>&gt=
;So my hope is someone can connect the dots of the path from the dbus<br>&g=
t;to systemd through the targets to a service executable doing the work<br>=
&gt;so I can try to replace them with:<br>&gt;<br>&gt;- Something that turn=
s the regulators on/off, with pmbus in this<br>&gt;case.<br>&gt;- Something=
 that can behave like a host to keep the system happy like<br>&gt;a real sy=
stem.<br><div><br></div><div><div><br></div><div><div><br></div><div>Hi.&nb=
sp; There is some design documentation here</div><div><br></div><div><a hre=
f=3D"https://github.com/openbmc/docs/blob/master/designs/state-management-a=
nd-external-interfaces.md" target=3D"=5Fblank">https://github.com/openbmc/d=
ocs/blob/master/designs/state-management-and-external-interfaces.md</a></di=
v><div><br></div><div>and that links to phosphor-state-manager which has a =
lot of the units <br></div><div>that kick off power and state transitions.<=
/div><div><br></div><div><br></div><div>The op-power-start are for systems =
following the OpenPOWER reference <br></div><div>designs.&nbsp; The regulat=
ors are sequenced by an external microcontroller <br></div><div>based on th=
e state of a POWER=5FON gpio from the BMC and a return <br></div><div>PGOOD=
 to indicate the state.&nbsp; There are also other op- prefixed units that =
<br></div><div>initiate the host processor initialization (after the units =
check that fans are <br></div><div>running as you found).&nbsp; <br></div><=
/div><div><br></div><div>There is also a watchdog that is started when the =
host is started and <br></div><div>pinged and stopped via IPMI.</div><div><=
br></div><div>If you are prototyping for a x86 system, there are alternativ=
e <br></div><div>power implementations where the gpio toggles to represent =
a <br></div><div>main power button push and their start cpu sequences.&nbsp=
; I think <br></div><div>there are also arm systems but don't know what the=
y are using <br></div><div>for host interaction.</div><div><br></div><div>I=
 hope this advances your investigation and learning.</div><div><br></div><d=
iv>milton<br></div></div><div><br></div><div>&gt;</div>&gt;Mike<br>&gt;<br>=
&gt;My repos<br>&gt;=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94=E2=80=94<=
br>&gt;<br>&gt;<a href=3D"https://github.com/Proclivis/meta-pmbus-raspberry=
pi.git" target=3D"=5Fblank">https://github.com/Proclivis/meta-pmbus-raspber=
rypi.git</a><br>&gt;<a href=3D"https://github.com/Proclivis/meta-pmbus-phos=
phor.git" target=3D"=5Fblank">https://github.com/Proclivis/meta-pmbus-phosp=
hor.git</a><br>&gt;<a href=3D"https://github.com/Proclivis/conf-openbmc-adi=
.git" target=3D"=5Fblank">https://github.com/Proclivis/conf-openbmc-adi.git=
</a><br>&gt;<br>&gt;The monitor messages for StartUnit<br>&gt;=E2=80=94=E2=
=80=94=E2=80=94<br>&gt;<br>&gt;method call time=3D1598039669.247458 sender=
=3D:1.48 -&gt;<br>&gt;destination=3Dorg.freedesktop.systemd1 serial=3D33<br=
>&gt;path=3D/org/freedesktop/systemd1;<br>&gt;interface=3Dorg.freedesktop.s=
ystemd1.Manager; member=3DStartUnit<br>&gt;&nbsp;&nbsp; string "<a href=3D"=
mailto:obmc-host-start@0.target" target=3D"=5Fblank">obmc-host-start@0.targ=
et</a>"<br>&gt;&nbsp;&nbsp; string "replace"<br>&gt;method call time=3D1598=
039669.276170 sender=3D:1.3 -&gt;<br>&gt;destination=3Dorg.freedesktop.DBus=
 serial=3D775<br>&gt;path=3D/org/freedesktop/DBus; interface=3Dorg.freedesk=
top.DBus;<br>&gt;member=3DGetConnectionUnixUser<br>&gt;&nbsp;&nbsp; string =
":1.48"<br>&gt;method return time=3D1598039669.276234 sender=3Dorg.freedesk=
top.DBus -&gt;<br>&gt;destination=3D:1.3 serial=3D4294967295 reply=5Fserial=
=3D775<br>&gt;&nbsp;&nbsp; uint32 0<br>&gt;method call time=3D1598039669.28=
0376 sender=3D:1.3 -&gt;<br>&gt;destination=3Dorg.freedesktop.DBus serial=
=3D776<br>&gt;path=3D/org/freedesktop/DBus; interface=3Dorg.freedesktop.DBu=
s;<br>&gt;member=3DAddMatch<br>&gt;&nbsp;&nbsp; string<br>&gt;"type=3D'sign=
al',sender=3D'org.freedesktop.DBus',path=3D'/org/freedesktop/D<br>&gt;Bus',=
interface=3D'org.freedesktop.DBus',member=3D'NameOwnerChanged',arg0=3D<br>&=
gt;':1.48'"<br>&gt;method return time=3D1598039669.280661 sender=3Dorg.free=
desktop.DBus -&gt;<br>&gt;destination=3D:1.3 serial=3D4294967295 reply=5Fse=
rial=3D776<br>&gt;method call time=3D1598039669.280701 sender=3D:1.3 -&gt;<=
br>&gt;destination=3Dorg.freedesktop.DBus serial=3D777<br>&gt;path=3D/org/f=
reedesktop/DBus; interface=3Dorg.freedesktop.DBus;<br>&gt;member=3DGetNameO=
wner<br>&gt;&nbsp;&nbsp; string ":1.48"<br>&gt;method return time=3D1598039=
669.280738 sender=3Dorg.freedesktop.DBus -&gt;<br>&gt;destination=3D:1.3 se=
rial=3D4294967295 reply=5Fserial=3D777<br>&gt;&nbsp;&nbsp; string ":1.48"<b=
r>&gt;signal time=3D1598039669.280774 sender=3D:1.3 -&gt; destination=3D(nu=
ll<br>&gt;destination) serial=3D778 path=3D/org/freedesktop/systemd1;<br>&g=
t;interface=3Dorg.freedesktop.systemd1.Manager; member=3DUnitNew<br>&gt;&nb=
sp;&nbsp; string "<a href=3D"mailto:obmc-host-start@0.target" target=3D"=5F=
blank">obmc-host-start@0.target</a>"<br>&gt;&nbsp;&nbsp; object path<br>&gt=
;"/org/freedesktop/systemd1/unit/obmc=5F2dhost=5F2dstart=5F400=5F2etarget"<=
br>&gt;signal time=3D1598039669.280823 sender=3D:1.3 -&gt; destination=3D(n=
ull<br>&gt;destination) serial=3D779 path=3D/org/freedesktop/systemd1;<br>&=
gt;interface=3Dorg.freedesktop.systemd1.Manager; member=3DJobNew<br>&gt;&nb=
sp;&nbsp; uint32 1105<br>&gt;&nbsp;&nbsp; object path "/org/freedesktop/sys=
temd1/job/1105"<br>&gt;&nbsp;&nbsp; string "<a href=3D"mailto:obmc-host-sta=
rt@0.target" target=3D"=5Fblank">obmc-host-start@0.target</a>"<br>&gt;metho=
d return time=3D1598039669.280883 sender=3D:1.3 -&gt; destination=3D:1.48<b=
r>&gt;serial=3D780 reply=5Fserial=3D33<br>&gt;&nbsp;&nbsp; object path "/or=
g/freedesktop/systemd1/job/1105"<br>&gt;signal time=3D1598039669.281305 sen=
der=3D:1.48 -&gt; destination=3D(null<br>&gt;destination) serial=3D34 path=
=3D/xyz/openbmc=5Fproject/state/host0;<br>&gt;interface=3Dorg.freedesktop.D=
Bus.Properties; member=3DPropertiesChanged<br>&gt;&nbsp;&nbsp; string "xyz.=
openbmc=5Fproject.State.Host"<br>&gt;&nbsp;&nbsp; array [<br>&gt;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; dict entry(<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; string "RequestedHostTransition"<br>&gt;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; variant&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; string<br>&gt;"xyz.openbmc=5Fproject.State=
.Host.Transition.On"<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; )<br>&gt;&nbsp;&=
nbsp; ]<br>&gt;&nbsp;&nbsp; array [<br>&gt;&nbsp;&nbsp; ]</font><BR>

