Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F9936AC02
	for <lists+openbmc@lfdr.de>; Mon, 26 Apr 2021 08:02:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FTDnQ0x68z301j
	for <lists+openbmc@lfdr.de>; Mon, 26 Apr 2021 16:02:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Qdx/r+1X;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vishwa@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Qdx/r+1X; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FTDn84KVdz2xYk
 for <openbmc@lists.ozlabs.org>; Mon, 26 Apr 2021 16:02:03 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13Q5YaFL016569; Mon, 26 Apr 2021 02:01:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=1bUc9J2+TPoeQksFmvepQU/AT4LnErrlYvf/VEBr1JY=;
 b=Qdx/r+1XJqfcydBLSOkzib8q94HXO/SV/LlKN1iD+gzCkCHwqyHGhha8u9ZutSD3Bogx
 esfuq5+VMEXQtaf/B+eUy+hPJ1y2jKW4ZiLXR8mWkgNYzJ6odRyko9drsI8uwp+OPyp7
 5eV/BhqpgqD8YEq4Aj9+kI7ma3vpMuqxX51n3/bK3hveh/0GDKr1b7BDMS2OY4LjNay3
 C1ON06YMTef27kNPbLulnoSqCcV3iMpPkKj1kBI3mNb2swNQfDy5Qe9m9m+5zvUq/B4q
 QxUThpRNuI/c1jE0iLUbOqDRR5c6Wag/vYYsfhuI+Rt1iOyCsnS3+NJzOCLhxVGnnlTQ UA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 385q718tgk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Apr 2021 02:01:55 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13Q5ZWER019576;
 Mon, 26 Apr 2021 02:01:54 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 385q718tfj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Apr 2021 02:01:54 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13Q5wOOT025624;
 Mon, 26 Apr 2021 06:01:52 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 384gjxr9hh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Apr 2021 06:01:52 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13Q61ofS38535664
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Apr 2021 06:01:50 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24D5942045;
 Mon, 26 Apr 2021 06:01:50 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B25E42047;
 Mon, 26 Apr 2021 06:01:48 +0000 (GMT)
Received: from [9.85.103.120] (unknown [9.85.103.120])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 26 Apr 2021 06:01:48 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH linux dev-5.10 06/35] ARM: dts: aspeed: rainier: Add leds
 that are off PCA9552
From: vishwanatha subbanna <vishwa@linux.vnet.ibm.com>
In-Reply-To: <CACPK8Xf8iY5LOXgJLvBS0okokG-QNQJ3idPvmcF9eMaRQSBGzQ@mail.gmail.com>
Date: Mon, 26 Apr 2021 11:29:42 +0530
Message-Id: <4A5014B9-6152-41E0-B928-31C9380185EA@linux.vnet.ibm.com>
References: <20210308225419.46530-1-eajames@linux.ibm.com>
 <20210308225419.46530-7-eajames@linux.ibm.com>
 <CACPK8Xc9XqM3UtpF0xywFwfj8anXWE1-TvbHCQskogrBBF_ZCQ@mail.gmail.com>
 <OF39939D76.45BF746F-ON00258696.0001FF38-00258696.0001FF3E@notes.na.collabserv.com>
 <CACPK8XfBu5_2xs_Eu=OtShNFQnAQ+Tc1Q1qM7Qgcaggd-yLumQ@mail.gmail.com>
 <6ACEC474-8CFD-4BA9-B8FF-CCD41007AA67@linux.vnet.ibm.com>
 <CACPK8Xf8iY5LOXgJLvBS0okokG-QNQJ3idPvmcF9eMaRQSBGzQ@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Fzp8JvVlOrHXkif-mcQuryVvkzcQWJ3V
X-Proofpoint-ORIG-GUID: HaImb19sXoCiwZ7lTIpgSSSmwBka6hBF
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-25_11:2021-04-23,
 2021-04-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 lowpriorityscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104260040
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Joel,

With the experiments that I have done, I can not express LEDs with PCA955X_=
TYPE_LED predominantly because LEDs won=E2=80=99t
retain states after the BMC reboot. I cooked a patch and tried but it does =
not work. I did an experiment where
I put the patch and then did a reboot and saw that the LEDs were [OFF] in t=
he very early stage of probe itself.

From a9fe9e956c624c15a455b88cc05262358519a541 Mon Sep 17 00:00:00 2001
From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
Date: Fri, 23 Apr 2021 06:57:56 -0500
Subject: [PATCH 1/2] leds: pca955x: Add support for default-state

Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
---
 drivers/leds/leds-pca955x.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index bf7ead4..987415b 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -130,6 +130,7 @@ struct pca955x_led {
 	char			name[32];
 	u32			type;
 	const char		*default_trigger;
+	const char		*default_state;
 };
=20
 struct pca955x_platform_data {
@@ -408,6 +409,8 @@ static int pca955x_gpio_direction_output(struct gpio_ch=
ip *gc,
 		fwnode_property_read_u32(child, "type", &pdata->leds[reg].type);
 		fwnode_property_read_string(child, "linux,default-trigger",
 					&pdata->leds[reg].default_trigger);
+		fwnode_property_read_string(child, "default-state",
+					&pdata->leds[reg].default_state);
 	}
=20
 	pdata->num_leds =3D chip->bits;
@@ -520,8 +523,13 @@ static int pca955x_probe(struct i2c_client *client,
 			if (err)
 				return err;
=20
-			/* Turn off LED */
-			err =3D pca955x_led_set(&pca955x_led->led_cdev, LED_OFF);
+			/* If the default-state is "keep", don't change states */
+			if (strcmp(pdata->leds[i].default_state, "keep")) {
+				if (!strcmp(pdata->leds[i].default_state, "on"))
+					err =3D pca955x_led_set(&pca955x_led->led_cdev, LED_ON);
+				else
+					err =3D pca955x_led_set(&pca955x_led->led_cdev, LED_OFF);
+			}
 			if (err)
 				return err;
 		}
=E2=80=94=20
1.8.3.1


For `leds-gpio`, Andrew had put a patch, but I don=E2=80=99t see how that c=
an be mapped to PCA955X. https://github.com/torvalds/linux/commit/f5808ac15=
8f2b16b686a3d3c0879c5d6048aba14

Jacek,=20

Please could you help me here ?.. I need to express LEDs as PCA955X_TYPE_LE=
D and also retain states post BMC reboot.

Thank you,
!! Vishwa !!

> On 25-Mar-2021, at 5:13 AM, Joel Stanley <joel@jms.id.au> wrote:
>=20
> On Fri, 12 Mar 2021 at 07:05, vishwanatha subbanna
> <vishwa@linux.vnet.ibm.com> wrote:
>>=20
>>=20
>>=20
>> On 12-Mar-2021, at 6:00 AM, Joel Stanley <joel@jms.id.au> wrote:
>>=20
>> On Fri, 12 Mar 2021 at 00:21, Milton Miller II <miltonm@us.ibm.com> wrot=
e:
>>=20
>>=20
>>=20
>>=20
>> -----"openbmc" <openbmc-bounces+miltonm=3Dus.ibm.com@lists.ozlabs.org> w=
rote: -----
>>=20
>> To: Eddie James <eajames@linux.ibm.com>
>> From: Joel Stanley
>> Sent by: "openbmc"
>> Date: 03/11/2021 06:09PM
>> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
>> Subject: [EXTERNAL] Re: [PATCH linux dev-5.10 06/35] ARM: dts:
>> aspeed: rainier: Add leds that are off PCA9552
>>=20
>> On Mon, 8 Mar 2021 at 22:54, Eddie James <eajames@linux.ibm.com>
>> wrote:
>>=20
>>=20
>> From: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
>>=20
>> These LEDs are on the fans and are connected via a
>> pca9551 i2c expander
>>=20
>>=20
>> This change doesn't make sense. The pca9551 is an i2c LED expander,
>> so
>> we don't need to expose the pins as GPIOs and then attach a gpio-leds
>> driver to them. We should instead simply configure the pca955x driver
>> to drive the LEDs as LEDs.
>>=20
>>=20
>> I'll refresh your memory on why we have been doing this in our
>> devie trees and then let you consider if this is desired or not.
>>=20
>> The led system insistes on creating a compact map (no holes) (as
>> does the reset subsystem).
>>=20
>> However, this means the relative led number for a pin changes
>> as the prior pins change from gpio to led configuration.
>>=20
>> For example if pins 2 and 7 are leds, they become leds 0 and 1.
>> Changing pin 5 to also be an led means that pin 7 is now led 2
>> not led 1 on the led subsystem.
>>=20
>>=20
>> Thanks for the rationale reminder.
>>=20
>> Are these led numbers important to userspace, or does the renumbering
>> affect device tree changes only?
>>=20
>>=20
>>=20
>> Here are my technical needs.
>> - I need these LEDs associated with names and this __must not__ change
>> - I need those LEDs represented as `/sys/class/leds/<$name>`
>>=20
>> What can I do :
>> - use `leds-gpio` like how it=E2=80=99s done today
>>=20
>> OR
>>=20
>> - Use =E2=80=9Clabel=E2=80=9D in PCA955X_TYPE_LED
>>   - However, putting this label, it results in `/sys/class/leds/pca955x:=
<$label>`. As opposed to `/sys/class/leds/<$label>`.
>>=20
>> Is there a way where I can get `/sys/class/leds/<$label>` ?. I did not g=
et this from the documentation. Seeing pca955x on 100 entries seems a noise
>=20
> The prefix has been present in the driver since it was introduced in
> 2008. Is there any reason we can't have userspace ignore the pca955x
> prefix?
>=20
> Cheers,
>=20
> Joel

