Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F51894C1
	for <lists+openbmc@lfdr.de>; Mon, 12 Aug 2019 00:57:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466DrD2scPzDqRp
	for <lists+openbmc@lfdr.de>; Mon, 12 Aug 2019 08:57:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=miltonm@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466DqL6HCRzDqZB
 for <openbmc@lists.ozlabs.org>; Mon, 12 Aug 2019 08:56:13 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7BMpddG002041
 for <openbmc@lists.ozlabs.org>; Sun, 11 Aug 2019 18:56:10 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.91])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uab8u0pyp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sun, 11 Aug 2019 18:56:09 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Sun, 11 Aug 2019 22:56:09 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Sun, 11 Aug 2019 22:55:58 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2019081122555865-484507 ;
 Sun, 11 Aug 2019 22:55:58 +0000 
In-Reply-To: <20190810095406.5509-1-wangzqbj@inspur.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: John Wang <wangzqbj@inspur.com>
Date: Sun, 11 Aug 2019 22:55:57 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <20190810095406.5509-1-wangzqbj@inspur.com>
X-Mailer: IBM iNotes ($HaikuForm 1054) | IBM Domino Build
 SCN1812108_20180501T0841_FP55 May 22, 2019 at 11:09
X-LLNOutbound: False
X-Disclaimed: 21851
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 19081122-2475-0000-0000-0000004A6100
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.150957
X-IBM-SpamModules-Versions: BY=3.00011583; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01245464; UDB=6.00657172; IPR=6.01026961; 
 MB=3.00028138; MTD=3.00000008; XFM=3.00000015; UTC=2019-08-11 22:56:06
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-08-11 22:01:25 - 6.00010274
x-cbparentid: 19081122-2476-0000-0000-00000071745F
Message-Id: <OFD41F14A3.C9368CBA-ON00258453.007B620B-00258453.007DF926@notes.na.collabserv.com>
Subject: Re: [PATCH v2 2/2] hwmon: pmbus: Add Inspur Power System power supply
 driver
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-11_11:, , signatures=0
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
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, linux-doc@vger.kernel.org,
 openbmc@lists.ozlabs.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
 duanzhijia01@inspur.com, linux@roeck-us.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Around 08/10/2019 04:55AM in some time zone, John Wang wrote:
>
>Add the driver to monitor Inspur Power System power supplies
>with hwmon over pmbus.
>
>This driver adds sysfs attributes for additional power supply data,
>including vendor, model, part=5Fnumber, serial number,
>firmware revision, hardware revision, and psu mode(active/standby).
>
>Signed-off-by: John Wang <wangzqbj@inspur.com>
>---
>v2:
>    - Fix typos in commit message
>    - Invert Christmas tree
>    - Configure device with sysfs attrs, not debugfs entries
>    - Fix errno in fw=5Fversion=5Fread, ENODATA to EPROTO
>    - Change the print format of fw-version
>    - Use sysfs=5Fstreq instead of strcmp("xxx" "\n", "xxx")
>    - Document sysfs attributes
>---
> Documentation/hwmon/inspur-ipsps1.rst |  79 +++++++++
> drivers/hwmon/pmbus/Kconfig           |   9 +
> drivers/hwmon/pmbus/Makefile          |   1 +
> drivers/hwmon/pmbus/inspur-ipsps.c    | 236
>++++++++++++++++++++++++++
> 4 files changed, 325 insertions(+)
> create mode 100644 Documentation/hwmon/inspur-ipsps1.rst
> create mode 100644 drivers/hwmon/pmbus/inspur-ipsps.c
>
>diff --git a/Documentation/hwmon/inspur-ipsps1.rst
>b/Documentation/hwmon/inspur-ipsps1.rst
....
>diff --git a/drivers/hwmon/pmbus/Kconfig>b/drivers/hwmon/pmbus/Kconfig
>index 30751eb9550a..c09357c26b10 100644
>--- a/drivers/hwmon/pmbus/Kconfig
>+++ b/drivers/hwmon/pmbus/Kconfig
>@@ -203,4 +203,13 @@ config SENSORS=5FZL6100
> 	  This driver can also be built as a module. If so, the module will
> 	  be called zl6100.
>=20
>+config SENSORS=5FINSPUR=5FIPSPS
>+	tristate "INSPUR Power System Power Supply"

The entries in this file are sorted alphabetically.

>diff --git a/drivers/hwmon/pmbus/Makefile>b/drivers/hwmon/pmbus/Makefile
>index 2219b9300316..fde2d10cd05c 100644
>--- a/drivers/hwmon/pmbus/Makefile
>+++ b/drivers/hwmon/pmbus/Makefile
>@@ -23,3 +23,4 @@ obj-$(CONFIG=5FSENSORS=5FTPS53679)	+=3D tps53679.o
> obj-$(CONFIG=5FSENSORS=5FUCD9000)	+=3D ucd9000.o
> obj-$(CONFIG=5FSENSORS=5FUCD9200)	+=3D ucd9200.o
> obj-$(CONFIG=5FSENSORS=5FZL6100)	+=3D zl6100.o
>+obj-$(CONFIG=5FSENSORS=5FINSPUR=5FIPSPS)	+=3D inspur-ipsps.o
>diff --git a/drivers/hwmon/pmbus/inspur-ipsps.c
>b/drivers/hwmon/pmbus/inspur-ipsps.c
>new file mode 100644
>index 000000000000..f6dd10a62aef
>--- /dev/null
>+++ b/drivers/hwmon/pmbus/inspur-ipsps.c
>@@ -0,0 +1,236 @@
>+// SPDX-License-Identifier: GPL-2.0-or-later
>+/*
>+ * Copyright 2019 Inspur Corp.
>+ */
>+
>+#include <linux/debugfs.h>
>+#include <linux/device.h>
>+#include <linux/fs.h>
>+#include <linux/i2c.h>
>+#include <linux/module.h>
>+#include <linux/pmbus.h>
>+#include <linux/hwmon-sysfs.h>
>+
>+#include "pmbus.h"
>+
>+#define IPSPS=5FREG=5FVENDOR=5FID	0x99
>+#define IPSPS=5FREG=5FMODEL		0x9A
>+#define IPSPS=5FREG=5FFW=5FVERSION	0x9B
>+#define IPSPS=5FREG=5FPN		0x9C
>+#define IPSPS=5FREG=5FSN		0x9E
>+#define IPSPS=5FREG=5FHW=5FVERSION	0xB0
>+#define IPSPS=5FREG=5FMODE		0xFC
>+
>+#define MODE=5FACTIVE		0x55
>+#define MODE=5FSTANDBY		0x0E
>+#define MODE=5FREDUNDANCY		0x00
>+
>+#define MODE=5FACTIVE=5FSTRING		"active"
>+#define MODE=5FSTANDBY=5FSTRING		"standby"
>+#define MODE=5FREDUNDANCY=5FSTRING		"redundancy"
>+
>+enum ipsps=5Findex {
>+	vendor,
>+	model,
>+	fw=5Fversion,
>+	part=5Fnumber,
>+	serial=5Fnumber,
>+	hw=5Fversion,
>+	mode,
>+	num=5Fregs,
>+};
>+
>+static const u8 ipsps=5Fregs[num=5Fregs] =3D {
>+	[vendor] =3D IPSPS=5FREG=5FVENDOR=5FID,
>+	[model] =3D IPSPS=5FREG=5FMODEL,
>+	[fw=5Fversion] =3D IPSPS=5FREG=5FFW=5FVERSION,
>+	[part=5Fnumber] =3D IPSPS=5FREG=5FPN,
>+	[serial=5Fnumber] =3D IPSPS=5FREG=5FSN,
>+	[hw=5Fversion] =3D IPSPS=5FREG=5FHW=5FVERSION,
>+	[mode] =3D IPSPS=5FREG=5FMODE,
>+};
>+
>+static ssize=5Ft ipsps=5Fstring=5Fshow(struct device *dev,
>+				 struct device=5Fattribute *devattr,
>+				 char *buf)
>+{
>+	u8 reg;
>+	int rc, i;
>+	char data[I2C=5FSMBUS=5FBLOCK=5FMAX + 1] =3D { 0 };

Shouldn't need to initialize this.

>+	struct i2c=5Fclient *client =3D to=5Fi2c=5Fclient(dev->parent);>+	struct=
 sensor=5Fdevice=5Fattribute *attr =3D to=5Fsensor=5Fdev=5Fattr(devattr);
>+
>+	reg =3D ipsps=5Fregs[attr->index];
>+	rc =3D i2c=5Fsmbus=5Fread=5Fblock=5Fdata(client, reg, data);
>+	if (rc < 0)
>+		return rc;
>+
>+	for (i =3D 0; i < rc; i++) {
>+		/* filled with printable characters, ending with # */
>+		if (data[i] =3D=3D '#')
>+			break;
>+	}

This seems to be p =3D memscan(data, '#', rc);

>+>+	data[i] =3D '\0';
>+
>+	return snprintf(buf, PAGE=5FSIZE, "%s\n", data);
>+}
>+
>+static ssize=5Ft ipsps=5Ffw=5Fversion=5Fshow(struct device *dev,
>+				     struct device=5Fattribute *devattr,
>+				     char *buf)
>+{
>+	u8 reg;
>+	int rc;
>+	u8 data[I2C=5FSMBUS=5FBLOCK=5FMAX] =3D { 0 };
>+	struct i2c=5Fclient *client =3D to=5Fi2c=5Fclient(dev->parent);
>+	struct sensor=5Fdevice=5Fattribute *attr =3D to=5Fsensor=5Fdev=5Fattr(de=
vattr);
>+
>+	reg =3D ipsps=5Fregs[attr->index];
>+	rc =3D i2c=5Fsmbus=5Fread=5Fblock=5Fdata(client, reg, data);
>+	if (rc < 0)
>+		return rc;
>+
>+	if (rc !=3D 6)
>+		return -EPROTO;
>+
>+	return snprintf(buf, PAGE=5FSIZE, "%u.%02u%u-%u.%02u\n",
>+			data[1], data[2]/* < 100 */, data[3]/*< 10*/,
>+			data[4], data[5]/* < 100 */);
>+}
>+
>+static ssize=5Ft ipsps=5Fmode=5Fshow(struct device *dev,
>+			       struct device=5Fattribute *devattr, char *buf)
>+{
>+	u8 reg;
>+	int rc;
>+	struct i2c=5Fclient *client =3D to=5Fi2c=5Fclient(dev->parent);
>+	struct sensor=5Fdevice=5Fattribute *attr =3D to=5Fsensor=5Fdev=5Fattr(de=
vattr);
>+
>+	reg =3D ipsps=5Fregs[attr->index];
>+	rc =3D i2c=5Fsmbus=5Fread=5Fbyte=5Fdata(client, reg);
>+	if (rc < 0)
>+		return rc;
>+
>+	switch (rc) {
>+	case MODE=5FACTIVE:
>+		return snprintf(buf, PAGE=5FSIZE, "[%s] %s %s\n",
>+				MODE=5FACTIVE=5FSTRING,
>+				MODE=5FSTANDBY=5FSTRING, MODE=5FREDUNDANCY=5FSTRING);
>+	case MODE=5FSTANDBY:
>+		return snprintf(buf, PAGE=5FSIZE, "%s [%s] %s\n",
>+				MODE=5FACTIVE=5FSTRING,
>+				MODE=5FSTANDBY=5FSTRING, MODE=5FREDUNDANCY=5FSTRING);
>+	case MODE=5FREDUNDANCY:
>+		return snprintf(buf, PAGE=5FSIZE, "%s %s [%s]\n",
>+				MODE=5FACTIVE=5FSTRING,
>+				MODE=5FSTANDBY=5FSTRING, MODE=5FREDUNDANCY=5FSTRING);
>+	default:
>+		return snprintf(buf, PAGE=5FSIZE, "unspecified\n");
>+	}
>+}
>+
>+static ssize=5Ft ipsps=5Fmode=5Fstore(struct device *dev,
>+				struct device=5Fattribute *devattr,
>+				const char *buf, size=5Ft count)
>+{
>+	u8 reg;
>+	int rc;
>+	struct i2c=5Fclient *client =3D to=5Fi2c=5Fclient(dev->parent);
>+	struct sensor=5Fdevice=5Fattribute *attr =3D to=5Fsensor=5Fdev=5Fattr(de=
vattr);
>+
>+	reg =3D ipsps=5Fregs[attr->index];
>+	if (sysfs=5Fstreq(MODE=5FSTANDBY=5FSTRING, buf)) {
>+		rc =3D i2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client, reg,
>+					       MODE=5FSTANDBY);
>+		if (rc < 0)
>+			return rc;
>+		return count;
>+	} else if (sysfs=5Fstreq(MODE=5FACTIVE=5FSTRING, buf)) {
>+		rc =3D i2c=5Fsmbus=5Fwrite=5Fbyte=5Fdata(client, reg,
>+					       MODE=5FACTIVE);
>+		if (rc < 0)
>+			return rc;
>+		return count;
>+	}
>+
>+	return -EINVAL;
>+}
>+
>+static SENSOR=5FDEVICE=5FATTR=5FRO(vendor, ipsps=5Fstring, vendor);
>+static SENSOR=5FDEVICE=5FATTR=5FRO(model, ipsps=5Fstring, model);
>+static SENSOR=5FDEVICE=5FATTR=5FRO(part=5Fnumber, ipsps=5Fstring,
>part=5Fnumber);
>+static SENSOR=5FDEVICE=5FATTR=5FRO(serial=5Fnumber, ipsps=5Fstring,
>serial=5Fnumber);
>+static SENSOR=5FDEVICE=5FATTR=5FRO(hw=5Fversion, ipsps=5Fstring, hw=5Fver=
sion);
>+static SENSOR=5FDEVICE=5FATTR=5FRO(fw=5Fversion, ipsps=5Ffw=5Fversion,
>fw=5Fversion);
>+static SENSOR=5FDEVICE=5FATTR=5FRW(mode, ipsps=5Fmode, mode);
>+
>+static struct attribute *enable=5Fattrs[] =3D {
>+	&sensor=5Fdev=5Fattr=5Fvendor.dev=5Fattr.attr,
>+	&sensor=5Fdev=5Fattr=5Fmodel.dev=5Fattr.attr,
>+	&sensor=5Fdev=5Fattr=5Fpart=5Fnumber.dev=5Fattr.attr,
>+	&sensor=5Fdev=5Fattr=5Fserial=5Fnumber.dev=5Fattr.attr,
>+	&sensor=5Fdev=5Fattr=5Fhw=5Fversion.dev=5Fattr.attr,
>+	&sensor=5Fdev=5Fattr=5Ffw=5Fversion.dev=5Fattr.attr,
>+	&sensor=5Fdev=5Fattr=5Fmode.dev=5Fattr.attr,
>+	NULL,
>+};
>+
>+static const struct attribute=5Fgroup enable=5Fgroup =3D {
>+	.attrs =3D enable=5Fattrs,
>+};
>+
>+static const struct attribute=5Fgroup *attribute=5Fgroups[] =3D {
>+	&enable=5Fgroup,
>+	NULL,
>+};

ATTRIBUTE=5FGROUPS(enable);

>+
>+static struct pmbus=5Fdriver=5Finfo ipsps=5Finfo =3D {
>+	.pages =3D 1,
>+	.func[0] =3D PMBUS=5FHAVE=5FVIN | PMBUS=5FHAVE=5FVOUT | PMBUS=5FHAVE=5FI=
OUT |
>+		PMBUS=5FHAVE=5FIIN | PMBUS=5FHAVE=5FPOUT | PMBUS=5FHAVE=5FPIN |
>+		PMBUS=5FHAVE=5FFAN12 | PMBUS=5FHAVE=5FTEMP | PMBUS=5FHAVE=5FTEMP2 |
>+		PMBUS=5FHAVE=5FTEMP3 | PMBUS=5FHAVE=5FSTATUS=5FVOUT |
>+		PMBUS=5FHAVE=5FSTATUS=5FIOUT | PMBUS=5FHAVE=5FSTATUS=5FINPUT |
>+		PMBUS=5FHAVE=5FSTATUS=5FTEMP | PMBUS=5FHAVE=5FSTATUS=5FFAN12,
>+	.groups =3D attribute=5Fgroups,
>+};
>+
>+static struct pmbus=5Fplatform=5Fdata ipsps=5Fpdata =3D {
>+	.flags =3D PMBUS=5FSKIP=5FSTATUS=5FCHECK,
>+};
>+
>+static int ipsps=5Fprobe(struct i2c=5Fclient *client,
>+		       const struct i2c=5Fdevice=5Fid *id)
>+{
>+	client->dev.platform=5Fdata =3D &ipsps=5Fpdata;
>+	return pmbus=5Fdo=5Fprobe(client, id, &ipsps=5Finfo);
>+}
>+
>+static const struct i2c=5Fdevice=5Fid ipsps=5Fid[] =3D {
>+	{ "inspur=5Fipsps1", 0 },
>+	{}
>+};
>+MODULE=5FDEVICE=5FTABLE(i2c, ipsps=5Fid);
>+
>+static const struct of=5Fdevice=5Fid ipsps=5Fof=5Fmatch[] =3D {
>+	{ .compatible =3D "inspur,ipsps1" },
>+	{}
>+};
>+MODULE=5FDEVICE=5FTABLE(of, ipsps=5Fof=5Fmatch);
>+
>+static struct i2c=5Fdriver ipsps=5Fdriver =3D {
>+	.driver =3D {
>+		.name =3D "inspur-ipsps",
>+		.of=5Fmatch=5Ftable =3D ipsps=5Fof=5Fmatch,
>+	},
>+	.probe =3D ipsps=5Fprobe,
>+	.remove =3D pmbus=5Fdo=5Fremove,
>+	.id=5Ftable =3D ipsps=5Fid,
>+};
>+
>+module=5Fi2c=5Fdriver(ipsps=5Fdriver);
>+
>+MODULE=5FAUTHOR("John Wang");
>+MODULE=5FDESCRIPTION("PMBus driver for Inspur Power System power
>supplies");
>+MODULE=5FLICENSE("GPL");
>--=20
>2.17.1
>
>

