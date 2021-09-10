Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C7B406626
	for <lists+openbmc@lfdr.de>; Fri, 10 Sep 2021 05:30:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5Lx5212tz2yMx
	for <lists+openbmc@lfdr.de>; Fri, 10 Sep 2021 13:30:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=L/7tRk82;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=088761d2b9=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=L/7tRk82; 
 dkim-atps=neutral
X-Greylist: delayed 3919 seconds by postgrey-1.36 at boromir;
 Fri, 10 Sep 2021 13:30:07 AEST
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5Lwb13C7z2xtv
 for <openbmc@lists.ozlabs.org>; Fri, 10 Sep 2021 13:30:05 +1000 (AEST)
Received: from pps.filterd (m0165121.ppops.net [127.0.0.1])
 by mx0b-00268f01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 189MpLqK023046; 
 Fri, 10 Sep 2021 02:24:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=pps202002;
 bh=81So5IZrr8J0cN4pYT8m36Uj/lw7X2i5F+Ynkecv7f0=;
 b=L/7tRk82pHHEI21xNAphiJxPicBShpF0GK2mGHz0UlfqyQ7zuu+8UVrhvyfkX2j8Bv6G
 DxMSTDzEmGPClV1zFOQqwbC1IMd+QErnDZdTTXgCpNIV4dygLfOxHaMiVE7mduBsF5bI
 7tKwmjpksJC9tkgtn3SkUyjMEbfOaB+Jl68ZOuClBawTTnF4NyqvIum6mbRnAUblm5s2
 ujtSf2U4m0dPRKc2/3iSMIB5TSY2NMvoUWBsxiPFmu3Rt7l1zbWQGwUsPJrnL7U/ty/V
 IMGpvzAW5MOgWppvt8PmGVbA9eD4h7ln+90imZ++d+IDm5zevyLGJhbOStX1B1Qeogy6 sw== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by mx0b-00268f01.pphosted.com with ESMTP id 3ayue48h6y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Sep 2021 02:24:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h15oi7w7oTouXOEk7cF0TAA5K4pip+6i8ngIeMxPNtpEvPrQU1PW5MtGw/9HzICS9fvNEKh+vJMEMafqzXayiZ/ulpl34k42sHPLvvbthZWOEGZFsX/FdUpOGa0081xJMuOBy01GCG7TbvwPUp2NthLuSQ9etNYVn0+dHOiZ4n0TEMtgSUgA6yKn3WlSTPIYXqfkh5w03r7OTkO7jbEH5ap3ktU1ooMKnFKzVetm/HZFwWHv2zxziTDI75EZ+HAsNoKpK/f55hp5zM2fEU19AF6o72R8FFVD2zQ77sCnAeJx54SFzPCXwOnpeYCPPRm+CbwUeFu/3qArmE8q5CzsmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=81So5IZrr8J0cN4pYT8m36Uj/lw7X2i5F+Ynkecv7f0=;
 b=M7FihTcD5iV/gsDdH4ibj1BQxyNNmgCdkJ04IrsGf7inQYhkE2K0sXS1TLeD+36jnuYoQOnjNeYmZ80hhxcA0Zkmq+7XGlbgTBau2Mua5I1ovgwXqm9JoXcTnqLkD8hU3FvO5qXLC+9Oy+aIXc6rfHN8HjVTMOvHSQShtg2WO0LMr3fSjOvlZjx7edqxBgujzz5f+E9w0e2hTE6RUuLf0RRHvCGpkAWtspeoh9FyUjBZMoP7nFffsHE/RW/UUIUtHm4uzqT3XsUchnvWbp08tzMQ/phQcFGh3ozdrnlzzNzFhGD8YU6kN6E/NHXxHV3F3QGm8ZOFaK9Gv/z3++b+rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM8PR04MB7768.namprd04.prod.outlook.com (2603:10b6:8:37::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Fri, 10 Sep
 2021 02:24:33 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::8049:f2d5:9bed:efa0]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::8049:f2d5:9bed:efa0%5]) with mapi id 15.20.4478.027; Fri, 10 Sep 2021
 02:24:33 +0000
From: Zev Weiss <zweiss@equinix.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [PATCH RFC] Specifying default-disabled devices
Thread-Topic: [PATCH RFC] Specifying default-disabled devices
Thread-Index: AQHXper+D9PnEz1iMkeU55armpNb3w==
Date: Fri, 10 Sep 2021 02:24:33 +0000
Message-ID: <20210910022433.GD17315@packtop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=equinix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04e67e5a-eefc-4aaa-dfc5-08d9740220d9
x-ms-traffictypediagnostic: DM8PR04MB7768:
x-microsoft-antispam-prvs: <DM8PR04MB776888740EFA3A9412B59989C3D69@DM8PR04MB7768.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uXTplvEY1pNFFx3vx8gYe5T/xCQfzQNgNbiAqfqh0eLRZjnKgGEacL4+RF5OI2VFXFiDAO97iBFJ+La824m73HV8W7dzeYmcbBlhINTfqqbxQq1EGqOUOEr7obDncuQNeER2a6nunVR86HL0XpnUhDN+/7Xhg0ZMvBA9FGfDnl/kRBA4pxrHLnOUTTFWrrJXvmyCczP5EKMDrgeKs8XUZR1n0TEAYBtQLjHmYo0VbYy59lxUlW8krXayCyCOduzgH+THRuESjRPWmshbh4uIa7O7rQ6zZWK+Oh4OydSMAYdx7VfcDAD3RdwtIOre/4NlDPOWo+dnj1ufAG1QGK9rGgc86XmPnCO0FOIHhAT2ABbh0iv4ApoDv0PGmEy0/T7baYL5/gK79P8kgzw9l25ikmLL+WC+4mSPRk47YARD6H3iKT+WnP7SywPc7drH2W9PcGj0rTqlix8gAqRNoUqWo0VjYM/uMuXXw7uId0blIMCsYqja8mpqlVKvVz3OLqjwuBEId3t3Qd9Vpk/G9sdJbI1DpLlgK4LD/mH95HMFneauotv1TqgiloKOXVKIqKDBilUgdkiwLUKqJlvx8rUEXx1KCy4uU1Dg8Uh+1BaXxJTVMn8I5Fzu0ny+fVJvIJrQaiSxqoSnb4s8crOdkcd82Z9Z7vH03yGZQTSYBoFIZmFK7j4Q1Djoux9bjMd9Cd+tv4aDJfd70ThMfMUy0h7oln0thwRAiyu3181WZHdE1dx8ZZPLUSUkglrqI4B460npNoMmxe49nmdbqG2fQ7Nh76zhm2VYpuEEbFV6jGNRTSU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(86362001)(8676002)(38100700002)(186003)(33656002)(8936002)(122000001)(26005)(33716001)(6506007)(54906003)(66476007)(64756008)(6916009)(5660300002)(966005)(66446008)(66556008)(6512007)(9686003)(478600001)(1076003)(6486002)(76116006)(91956017)(2906002)(83380400001)(71200400001)(66946007)(316002)(38070700005)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?d9bXIn54hgNaBQmjI8FbxHEhEXhuvQbjbYnZSvoNBY7MQITc59ieW5OhTprF?=
 =?us-ascii?Q?72TFZi+yytKUy2OY+L+FEAdLxkoSKTRBNKNvQJ2Ve+mn0iw0eAhSjl93RL6R?=
 =?us-ascii?Q?FkCPhM9O4yadAGwO1YnE1FxjVX43bFUQdUYLFouvRoBuN8PR0VWaTWE56Z7q?=
 =?us-ascii?Q?stZlbOl/D96gjN8f8WvGB+xpx/uU9oOK+OgXRhegaU/Zoa7XVzznOo+iK8C3?=
 =?us-ascii?Q?RnhVylEGh3qZ0hBlP0Ev2c472k4I/oOrIulq/HqR/vCSyb/mKsXxtj9G8AjD?=
 =?us-ascii?Q?I5XxsyMUYF89CHJ0TW9O6S37PxDW61O7leuHagcpxf8n7t0UnRtx4IKhOWHP?=
 =?us-ascii?Q?lkwqsPkPhQf5QwpgWmgZub0mpDKEfAr0fPivnD2cKT1z6UIWt0wiDSAU2T/2?=
 =?us-ascii?Q?MIFm7/IuSsIHjl1/vKSsnhwM2U6zxh8uSafjDrbvaUD6nj3/rnpJ1Q8eM012?=
 =?us-ascii?Q?EQ34yzYug0rWZHBrWfVpT2Uqlkp4tZLWd7Q4aQ4JgmJKOF6UOy/wue0HxO3n?=
 =?us-ascii?Q?SoaPvi+XcZtDIBLkbE5qqU6mAPxNs51GQXfdxsBdQCw5DnkSDuZruxqO+nLV?=
 =?us-ascii?Q?SMpnt/NAG2aQAC8+Yeq4ZD2boRzkDGliCbeuvFsCPqUy6yQidpsezKVh0kFf?=
 =?us-ascii?Q?lhb4Uy7Xxa9zTmcTQLIB6hB/9zyBqq/adE3bgxKeHiu9R/Eo/BRrz+PqNM3C?=
 =?us-ascii?Q?q6ih01EwCaYQQ8JtUuZQ1qxLhF8LxbkkLH3CVJXI7JEbQAzUbHlvECb6UnYX?=
 =?us-ascii?Q?rcGOMqx3+XYgKOvB0RBi4miIEQKyULrkdKyWkBoHQ38rsRky3bF3x1oqsOLO?=
 =?us-ascii?Q?O/O4NcLhfdaauCkSFQOVhXuK6eSYLi++yjOIC9bsH28otEqclCEdN0XDwCjb?=
 =?us-ascii?Q?TQ5j+ZVyp/0hAeMcHSzIirDmF0UBpFAaTXTcHMfwa+ZFDeDx9UGB/smnwT9O?=
 =?us-ascii?Q?0hDOAzAPKhFFQIgziKwxfsZS7ykXrkUrc4+NR+wbbYcfkeS+kFEe3QqCv56k?=
 =?us-ascii?Q?jmvHV39ah/SocCPL1mVejOegqn1XFMhuV8tU8YyuQmp4vqwGVwwa8orow/cZ?=
 =?us-ascii?Q?hDf/MTmw+cpjdjdb6En4Eg5pd4yk/kdvu4SGUs+BSpEZsgnO7MBl7gsEFH/7?=
 =?us-ascii?Q?2PE7/xHD5D5I0XOqKlCOVO3NiyvjWTS/3RkFjimC00L4nFZ7ORRsCLXU3mSe?=
 =?us-ascii?Q?NM41q6To0dm5OVDZT7TSRwMGVZNtIuPRBYeY/HWujKSojS4WJiYeyo7hllcy?=
 =?us-ascii?Q?K4e4qcrXYJAeRhApJ5GUymCQrNrnS7lfw7tmL6o6NgAb+l4IAJMAnss87lQS?=
 =?us-ascii?Q?x1qucMFLBUflDXBdJU+wi9tn?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9DB22F49C21D3746BB4EEFEA3F852991@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e67e5a-eefc-4aaa-dfc5-08d9740220d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 02:24:33.8177 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OVtDGJ+bT3Y03riPbb1i/dTPXWCs7fQTge9sFZP8zQqm/jUOkX5xq0U7TTNKQoi0/O9nlcZYzHJFfhUKFSk3xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB7768
X-Proofpoint-GUID: TnMIKI8cFWbMQxnn6qcs7-H5cQXXwPU5
X-Proofpoint-ORIG-GUID: TnMIKI8cFWbMQxnn6qcs7-H5cQXXwPU5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-09_09,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109100012
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi all,

I'd like to hear people's thoughts on how to approach specifying that a dev=
ice
is present, but should be left alone by default.  The specific example I ha=
ve
at hand is that of the host firmware (BIOS) SPI flash -- it's attached to a=
 SPI
controller on my BMC, but actually accessing it via that interface requires=
 a
bit of a dance involving three GPIOs and exchanging some IPMI commands with=
 the
ME, so if I have it defined in my dts, the mtd driver's probe routine durin=
g
the BMC's boot sequence just spews errors into dmesg and fails (I can then
manually bind it later via sysfs after fiddling with GPIOs and IPMI from
userspace).  This "works" in its clumsy way in this specific case, but I'd =
like
to try to upstream a cleaner (and hopefully reasonably general) solution.

What I've had patched into my local fork for a while is a 'noautobind' kern=
el
command-line argument that lists devices to skip automatic probing on, and =
then
just a simple check in driver_probe_device() against that list (bypassed if
called from a sysfs 'bind' write).  (Patch for dev-5.10 inline below, thoug=
h it
doesn't currently apply to mainline.)

The other alternative I've considered (though not actually implemented thus
far) is to start using the "reserved" status value defined in the device-tr=
ee
spec (section 2.3.4, [0]) to mean this -- from the wording in the spec it s=
eems
like a not-terribly-unreasonable interpretation, and the existing kernel &
u-boot fdt code don't seem to make any use of it as far as I can see (thoug=
h I
don't know what might be out there in device-tree implementations floating
around in other projects).

Anyone have any particular thoughts?  The 'noautobind' approach is a pretty
small, simple patch, and I'd guess a 'status =3D "reserved"' patch probably
wouldn't be much bigger, but I figured it might be worth it to solicit opin=
ions
from OpenBMC people before potentially ruffling driver-core/device-tree
feathers on upstream lists.


Thanks,
Zev

[0] https://github.com/devicetree-org/devicetree-specification/releases/dow=
nload/v0.3/devicetree-specification-v0.3.pdf

---
 drivers/base/base.h |  2 +-
 drivers/base/bus.c  |  2 +-
 drivers/base/dd.c   | 33 +++++++++++++++++++++++++++------
 3 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index 52b3d7b75c27..98bd131dacfc 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -152,7 +152,7 @@ extern int driver_add_groups(struct device_driver *drv,
 			     const struct attribute_group **groups);
 extern void driver_remove_groups(struct device_driver *drv,
 				 const struct attribute_group **groups);
-int device_driver_attach(struct device_driver *drv, struct device *dev);
+int device_driver_attach(struct device_driver *drv, struct device *dev, bo=
ol explicit);
 void device_driver_detach(struct device *dev);
=20
 extern char *make_class_name(const char *name, struct kobject *kobj);
diff --git a/drivers/base/bus.c b/drivers/base/bus.c
index 36d0c654ea61..4a672a7051e5 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -211,7 +211,7 @@ static ssize_t bind_store(struct device_driver *drv, co=
nst char *buf,
=20
 	dev =3D bus_find_device_by_name(bus, NULL, buf);
 	if (dev && dev->driver =3D=3D NULL && driver_match_device(drv, dev)) {
-		err =3D device_driver_attach(drv, dev);
+		err =3D device_driver_attach(drv, dev, true);
=20
 		if (err > 0) {
 			/* success */
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index e2cf3b29123e..bf723a30bbaf 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -62,6 +62,10 @@ static bool initcalls_done;
 #define ASYNC_DRV_NAMES_MAX_LEN	256
 static char async_probe_drv_names[ASYNC_DRV_NAMES_MAX_LEN];
=20
+/* Saved copy of noautobind kernel cmdline arg */
+#define NOAUTOBIND_DEVS_MAX_LEN 256
+static char noautobind_dev_names[NOAUTOBIND_DEVS_MAX_LEN];
+
 /*
  * In some cases, like suspend to RAM or hibernation, It might be reasonab=
le
  * to prohibit probing of devices as it could be unsafe.
@@ -713,6 +717,7 @@ EXPORT_SYMBOL_GPL(wait_for_device_probe);
  * driver_probe_device - attempt to bind device & driver together
  * @drv: driver to bind a device to
  * @dev: device to try to bind to the driver
+ * @explicit: whether or not this is an explicit bind request from userspa=
ce
  *
  * This function returns -ENODEV if the device is not registered,
  * 1 if the device is bound successfully and 0 otherwise.
@@ -722,13 +727,18 @@ EXPORT_SYMBOL_GPL(wait_for_device_probe);
  *
  * If the device has a parent, runtime-resume the parent before driver pro=
bing.
  */
-static int driver_probe_device(struct device_driver *drv, struct device *d=
ev)
+static int driver_probe_device(struct device_driver *drv, struct device *d=
ev, bool explicit)
 {
 	int ret =3D 0;
=20
 	if (!device_is_registered(dev))
 		return -ENODEV;
=20
+	if (!explicit && parse_option_str(noautobind_dev_names, dev_name(dev))) {
+		dev_info(dev, "skipping %s probe of noautobind device\n", drv->name);
+		return -EPROBE_DEFER;
+	}
+
 	pr_debug("bus: '%s': %s: matched device %s with driver %s\n",
 		 drv->bus->name, __func__, dev_name(dev), drv->name);
=20
@@ -766,6 +776,16 @@ static int __init save_async_options(char *buf)
 }
 __setup("driver_async_probe=3D", save_async_options);
=20
+static int __init save_noautobind_options(char *buf)
+{
+	if (strlen(buf) >=3D NOAUTOBIND_DEVS_MAX_LEN)
+		pr_warn("'noautobind' device name list too long!\n");
+
+	strlcpy(noautobind_dev_names, buf, NOAUTOBIND_DEVS_MAX_LEN);
+	return 0;
+}
+__setup("noautobind=3D", save_noautobind_options);
+
 bool driver_allows_async_probing(struct device_driver *drv)
 {
 	switch (drv->probe_type) {
@@ -846,7 +866,7 @@ static int __device_attach_driver(struct device_driver =
*drv, void *_data)
 	if (data->check_async && async_allowed !=3D data->want_async)
 		return 0;
=20
-	return driver_probe_device(drv, dev);
+	return driver_probe_device(drv, dev, false);
 }
=20
 static void __device_attach_async_helper(void *_dev, async_cookie_t cookie=
)
@@ -1000,11 +1020,12 @@ static void __device_driver_unlock(struct device *d=
ev, struct device *parent)
  * device_driver_attach - attach a specific driver to a specific device
  * @drv: Driver to attach
  * @dev: Device to attach it to
+ * @explicit: whether or not this is an explicit bind request from userspa=
ce
  *
  * Manually attach driver to a device. Will acquire both @dev lock and
  * @dev->parent lock if needed.
  */
-int device_driver_attach(struct device_driver *drv, struct device *dev)
+int device_driver_attach(struct device_driver *drv, struct device *dev, bo=
ol explicit)
 {
 	int ret =3D 0;
=20
@@ -1015,7 +1036,7 @@ int device_driver_attach(struct device_driver *drv, s=
truct device *dev)
 	 * bound a driver before us just skip the driver probe call.
 	 */
 	if (!dev->p->dead && !dev->driver)
-		ret =3D driver_probe_device(drv, dev);
+		ret =3D driver_probe_device(drv, dev, explicit);
=20
 	__device_driver_unlock(dev, dev->parent);
=20
@@ -1037,7 +1058,7 @@ static void __driver_attach_async_helper(void *_dev, =
async_cookie_t cookie)
 	 * bound a driver before us just skip the driver probe call.
 	 */
 	if (!dev->p->dead && !dev->driver)
-		ret =3D driver_probe_device(drv, dev);
+		ret =3D driver_probe_device(drv, dev, false);
=20
 	__device_driver_unlock(dev, dev->parent);
=20
@@ -1092,7 +1113,7 @@ static int __driver_attach(struct device *dev, void *=
data)
 		return 0;
 	}
=20
-	device_driver_attach(drv, dev);
+	device_driver_attach(drv, dev, false);
=20
 	return 0;
 }
--=20
2.33.0

