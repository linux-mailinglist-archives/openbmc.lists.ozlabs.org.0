Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F36A231670
	for <lists+openbmc@lfdr.de>; Wed, 29 Jul 2020 01:51:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGYNL6KjJzDr1G
	for <lists+openbmc@lfdr.de>; Wed, 29 Jul 2020 09:51:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGYML4fSFzDqxs
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2020 09:50:21 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06SNWGbX177860
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2020 19:50:18 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.119])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32jj2jperf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2020 19:50:18 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 28 Jul 2020 23:50:18 -0000
Received: from us1b3-smtp01.a3dr.sjc01.isc4sb.com (10.122.7.174)
 by smtp.notes.na.collabserv.com (10.122.182.123) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 28 Jul 2020 23:50:15 -0000
Received: from us1b3-mail228.a3dr.sjc03.isc4sb.com ([10.168.214.55])
 by us1b3-smtp01.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020072823501494-932903 ;
 Tue, 28 Jul 2020 23:50:14 +0000 
In-Reply-To: <5F352E7C-5A22-4921-889B-D2C7B8995E84@gmail.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Mike Jones <proclivis@gmail.com>
Date: Tue, 28 Jul 2020 23:50:15 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <5F352E7C-5A22-4921-889B-D2C7B8995E84@gmail.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 11835
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20072823-3975-0000-0000-000002A9749D
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.424974; ST=0; TS=0; UL=0; ISC=; MB=0.002500
X-IBM-SpamModules-Versions: BY=3.00013554; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01412522; UDB=6.00757133; IPR=6.01194788; 
 MB=3.00033238; MTD=3.00000008; XFM=3.00000015; UTC=2020-07-28 23:50:16
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-07-28 22:52:23 - 6.00011656
x-cbparentid: 20072823-3976-0000-0000-00003FCB85FF
Message-Id: <OF21C1B448.C6D8AAD7-ON002585B3.008019F0-002585B3.0082F1A7@notes.na.collabserv.com>
Subject: Re:  How do I add a PMBus sensor that will show up in webui Sensors?
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_17:2020-07-28,
 2020-07-28 signatures=0
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On July 28, 2020 aroud 05:53PM in some timezone, Mike Jones wrote:

>I need help configuring a sensor. The goal is for a PMBus Voltage
>Regulator to display sensor information, like load current, in the
>webui under Health/Sensors.

Hi Mike, welcome to OpenBMC.

>
>Some background:
>
>- Rasp Pi 4
>- meta-phosphor=20
>- bmcweb/webui working and can log in
>- pmbus/ltc2978.c driver working
>- hwmon working
>
>In this case, we have this path:
>
>/sys/bus/i2c/devices/i2c-1
>
>Which has a new=5Fdevice file. I can add my sensor with:
>
>echo ltc3880 0x30 > new=5Fdevice

The other way is to add this device to your device tree=20
via a dts fragment.  This way the kernel will look for=20
the device because you told it to expect it there. =20
Probably something like

&i2c-1 {
  regulator {
     reg  =3D <30>
     compatible =3D <"adi,lltc3880", "lltc,ltc3880">;
  };
};

Assuming your vendor is analog devices (see=20
vendor-prefixes.yaml and=20
Documentation/devicetree/bindings/vendor-prefixes.yaml)
and your i2c controller has label i2c-1: assigned to
its bus-1 node.

>
>This populates all the files with telemetry data here:
>
>/sys/bus/i2c/devices/i2c01/1-0030/hwmon/hwmon1
>
>Such as in1=5Finput, in2=5Finput, in3=5Finput, which are VIN, VOUT0, VOUT1.
>
>I assume there has to be a file that maps the path to inN=5Finput to a
>d-bus object, some way to register the sensor with the chassis or
>similar concept, and some file with the label and warns, and other
>things you can do with it.
>
>From a yocto recipe point of view, it would also have to do the
>equivalent of the =E2=80=9Cecho=E2=80=9D into the new=5Fdevice so that /sy=
s/=E2=80=A6 gets
>populated. Perhaps part of some systemd based service.
>
>I have looked at meta-ibm and see a tree under omjc/hwmon/ahb=E2=80=A6
>i2c-bus@200=E2=80=A6
>
>I do not know what these numbers are referring to. Perhaps these are
>paths in the sys tree for an ahb type architecture? And what is the
>number before .conf?

Yes the hwmon daemon finds its configuration based on a partial=20
trailing match of the sysfs path to the hwmon device.  It has to=20
account that the actual hwmon instance numbers are not fixed but=20
usually we lock the i2c bus numbering down by specifing an alias=20
in the device tree to the bus controller which we know the device=20
path in sysfs.

i2c01
This part is your i2c bus controller path

/1-0030/
This says the i2c device with address 30 on i2c bus 1, which can
be selected by the alias label to the bus device (possibly elsewhere=20
in the device tree or more likely dtsi for the SOC).



>
>Then I see phosphor-hwmon=5F%.bbappend with more configuration in
>there.
>

This is where the phosphor-hwmon program learns that it should export=20
sensors on the hwmon device.   The % is a wildcard for the recipe that
will be extended.  In the file system in the file name gets expanded=20
via %I to become the device instance variable by systemd / udevd.

>Can someone explain how this recipe system works? The architecture
>doc was more than confusing. Perhaps just sketch out what I need to
>do for this case, and what files it will generate, so I can build and
>go look at the generated files, etc.
>
>Or perhaps there is a completely different approach?
>
>Mike


I think you found a lot of it.  There is our documntation repository
https://github.com/openbmc/docs/ and under development tutorials is
Adding a new system which starts down this path at

https://github.com/openbmc/docs/blob/master/development/add-new-system.md#h=
wmon-sensors

I've only watched others adjust their configurations I don't have a=20
system to play with myself.

If you find documentation missing please propose a patch for what you=20
learned.

milton

