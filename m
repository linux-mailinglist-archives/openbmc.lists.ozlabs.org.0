Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B0F134540
	for <lists+openbmc@lfdr.de>; Wed,  8 Jan 2020 15:44:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tBpX2cP6zDqTD
	for <lists+openbmc@lfdr.de>; Thu,  9 Jan 2020 01:44:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tBnZ5GzVzDqTC
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jan 2020 01:43:29 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 008EgibN077318
 for <openbmc@lists.ozlabs.org>; Wed, 8 Jan 2020 09:43:26 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xde0nq09c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 08 Jan 2020 09:43:26 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 8 Jan 2020 14:43:26 -0000
Received: from us1b3-smtp01.a3dr.sjc01.isc4sb.com (10.122.7.174)
 by smtp.notes.na.collabserv.com (10.122.47.39) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 8 Jan 2020 14:43:20 -0000
Received: from us1b3-mail228.a3dr.sjc03.isc4sb.com ([10.168.214.55])
 by us1b3-smtp01.a3dr.sjc01.isc4sb.com
 with ESMTP id 2020010814432003-505243 ;
 Wed, 8 Jan 2020 14:43:20 +0000 
In-Reply-To: <CAA_a9xKmRHHx=vXvwTaO+0PRtFjLWQUAL1WnJH8XGBBzvExt2A@mail.gmail.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Alex Qiu <xqiu@google.com>
Date: Wed, 8 Jan 2020 14:43:20 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CAA_a9xKmRHHx=vXvwTaO+0PRtFjLWQUAL1WnJH8XGBBzvExt2A@mail.gmail.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP62 November 04, 2019 at 09:47
X-LLNOutbound: False
X-Disclaimed: 29455
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20010814-6283-0000-0000-000000AF5BAF
X-IBM-SpamModules-Scores: BY=0.035879; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.002740
X-IBM-SpamModules-Versions: BY=3.00012351; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000292; SDB=6.01316172; UDB=6.00699893; IPR=6.01098500; 
 MB=3.00030229; MTD=3.00000008; XFM=3.00000015; UTC=2020-01-08 14:43:24
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-01-08 12:43:46 - 6.00010860
x-cbparentid: 20010814-6284-0000-0000-0000004B64CA
Message-Id: <OF100509F8.6ECF782D-ON002584E9.004AC321-002584E9.0050DF26@notes.na.collabserv.com>
Subject: Re:  Configuring device with I2C mux
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-08_03:2020-01-08,
 2020-01-08 signatures=0
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Kais Belgaied <belgaied@google.com>, Devjit Gopalpur <devjitg@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

About 01/07/2020 07:14PM in some timezone, Alex Qiu wrote:
>Hi folks,
>
>We have a JSON file configuring I2C devices of a PCIe card which has
>an 8-channel I2C mux for entity-manager. After we properly configure
>the mux of the card, we get 8 new I2C buses in sysfs; however, we
>don't find an arithmetic way to describe the relationship between the
>new buses and their parent buses.
>
>For example, we have a mux on physical BMC I2C bus i2c-8 spawning a
>couple of child buses including i2c-24 and i2c-26, which are the
>buses for each PCIe card. The mux on i2c-24 PCIe card spawned 8 buses
>from i2c-70 to i2c-77, and the mux on i2c-26 PCIe card spawned ones
>from i2c-62 to i2c-69. We have I2C devices on i2c-76 and i2c-68 needs
>to be configured together with the PCIe card on i2c-24 and i2c-26
>separately.
>
>How do we implement this in the JSON file? If that's not possible to
>do it in JSON merely, what's the suggested approach to implement this
>feature? Device tree? Implement code in entity-manager to walk
>through the I2C sysfs?


I would expect the i2c buses provied by the mux to appear in sysfs
under the hierarchy of the parent bus.  Explore the sysfs directory
structure, I'm making this up, but I've now peeked at i2c-mux.c and
have a better chance getting reality.


/sys/bus/i2c/devices/i2c-8 -> /sys/devices/platform/ahb-432000/i2c-8

/sys/bus/i2c/devices/i2c-24 -> /sys/devices/platform/ahb-432000/i2c-8/i2c-24
/sys/bus/i2c/devices/i2c-24 -> /sys/devices/platform/ahb-432000/i2c-8/i2c-25
/sys/bus/i2c/devices/i2c-24 -> /sys/devices/platform/ahb-432000/i2c-8/i2c-26

/sys/bus/i2c/devices/i2c-62 -> /sys/devices/platform/ahb-432000/i2c-8/i2c-2=
6/i2c-62
/sys/bus/i2c/devices/i2c-63 -> /sys/devices/platform/ahb-432000/i2c-8/i2c-2=
6/i2c-63
/sys/bus/i2c/devices/i2c-64 -> /sys/devices/platform/ahb-432000/i2c-8/i2c-2=
6/i2c-64
/sys/bus/i2c/devices/i2c-65 -> /sys/devices/platform/ahb-432000/i2c-8/i2c-2=
6/i2c-65
/sys/bus/i2c/devices/i2c-66 -> /sys/devices/platform/ahb-432000/i2c-8/i2c-2=
6/i2c-66
/sys/bus/i2c/devices/i2c-67 -> /sys/devices/platform/ahb-432000/i2c-8/i2c-2=
6/i2c-67
/sys/bus/i2c/devices/i2c-68 -> /sys/devices/platform/ahb-432000/i2c-8/i2c-2=
6/i2c-68
/sys/bus/i2c/devices/i2c-69 -> /sys/devices/platform/ahb-432000/i2c-8/i2c-2=
6/i2c-69
/sys/bus/i2c/devices/i2c-70 -> /sys/devices/platform/ahb-432000/i2c-8/i2c-2=
4/i2c-70
/sys/bus/i2c/devices/i2c-71 -> /sys/devices/platform/ahb-432000/i2c-8/i2c-2=
4/i2c-71
/sys/bus/i2c/devices/i2c-72 -> /sys/devices/platform/ahb-432000/i2c-8/i2c-2=
4/i2c-72
/sys/bus/i2c/devices/i2c-73 -> /sys/devices/platform/ahb-432000/i2c-8/i2c-2=
4/i2c-73
/sys/bus/i2c/devices/i2c-74 -> /sys/devices/platform/ahb-432000/i2c-8/i2c-2=
4/i2c-74
/sys/bus/i2c/devices/i2c-75 -> /sys/devices/platform/ahb-432000/i2c-8/i2c-2=
4/i2c-75
/sys/bus/i2c/devices/i2c-76 -> /sys/devices/platform/ahb-432000/i2c-8/i2c-2=
4/i2c-76
/sys/bus/i2c/devices/i2c-77 -> /sys/devices/platform/ahb-432000/i2c-8/i2c-2=
4/i2c-77

/sys/bus/i2c/devices/i2c-24/mux=5Fdevice -> /sys/devices/platform/ahb-43200=
0/i2c-8/8-52
/sys/bus/i2c/devices/i2c-25/mux=5Fdevice -> /sys/devices/platform/ahb-43200=
0/i2c-8/8-52
/sys/bus/i2c/devices/i2c-26/mux=5Fdevice -> /sys/devices/platform/ahb-43200=
0/i2c-8/8-52

/sys/bus/i2c/devices/8-52/channel-0 -> /sys/devices/platform/ahb-432000/i2c=
-8/i2c-24
/sys/bus/i2c/devices/8-52/channel-1 -> /sys/devices/platform/ahb-432000/i2c=
-8/i2c-25
/sys/bus/i2c/devices/8-52/channel-2 -> /sys/devices/platform/ahb-432000/i2c=
-8/i2c-26

/sys/bus/i2c/devices/24-52/channel-0 -> /sys/devices/platform/ahb-432000/i2=
c-8/i2c-24/i2c-62
/sys/bus/i2c/devices/24-52/channel-1 -> /sys/devices/platform/ahb-432000/i2=
c-8/i2c-24/i2c-63
/sys/bus/i2c/devices/24-52/channel-2 -> /sys/devices/platform/ahb-432000/i2=
c-8/i2c-24/i2c-64
/sys/bus/i2c/devices/24-52/channel-3 -> /sys/devices/platform/ahb-432000/i2=
c-8/i2c-24/i2c-65
/sys/bus/i2c/devices/24-52/channel-4 -> /sys/devices/platform/ahb-432000/i2=
c-8/i2c-24/i2c-66
/sys/bus/i2c/devices/24-52/channel-5 -> /sys/devices/platform/ahb-432000/i2=
c-8/i2c-24/i2c-67
/sys/bus/i2c/devices/24-52/channel-6 -> /sys/devices/platform/ahb-432000/i2=
c-8/i2c-24/i2c-68
/sys/bus/i2c/devices/24-52/channel-7 -> /sys/devices/platform/ahb-432000/i2=
c-8/i2c-24/i2c-69
/sys/bus/i2c/devices/26-52/channel-0 -> /sys/devices/platform/ahb-432000/i2=
c-8/i2c-26/i2c-70
/sys/bus/i2c/devices/26-52/channel-1 -> /sys/devices/platform/ahb-432000/i2=
c-8/i2c-26/i2c-71
/sys/bus/i2c/devices/26-52/channel-2 -> /sys/devices/platform/ahb-432000/i2=
c-8/i2c-26/i2c-72
/sys/bus/i2c/devices/26-52/channel-3 -> /sys/devices/platform/ahb-432000/i2=
c-8/i2c-26/i2c-73
/sys/bus/i2c/devices/26-52/channel-4 -> /sys/devices/platform/ahb-432000/i2=
c-8/i2c-26/i2c-74
/sys/bus/i2c/devices/26-52/channel-5 -> /sys/devices/platform/ahb-432000/i2=
c-8/i2c-26/i2c-75
/sys/bus/i2c/devices/26-52/channel-6 -> /sys/devices/platform/ahb-432000/i2=
c-8/i2c-26/i2c-76
/sys/bus/i2c/devices/26-52/channel-7 -> /sys/devices/platform/ahb-432000/i2=
c-8/i2c-26/i2c-77

The child bus will have a symlink "mux=5Fdevice" pointing to the mux.
The mux device node will have n symlinks "channel-1" where 1 is=20
the channel id.

Hmm, there is no apparent code to put a "mux=5Fchannel" attribute in=20
the adapter node.  The adapter name attribute does include the channel=20
id, but its long descriptive text.  Regardless, you should be able to=20
find the buses from the mux channel-3 symlinks.

Note: I haven't looked at the JSON to see how much it will change once=20
your find the bus.  I'm guessing you will have to generate it by taking=20
a template and substituting the bus numbers you find to make the slots
common, alhtough you could just go from the 8-52/channel-3 symlink to
the adapter bus (the device name will still have the bus number in it).

I hope this helps you,

milton

