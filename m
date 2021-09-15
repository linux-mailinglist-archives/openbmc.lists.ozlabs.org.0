Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC24040BF41
	for <lists+openbmc@lfdr.de>; Wed, 15 Sep 2021 07:16:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8T2k3mJgz2yPF
	for <lists+openbmc@lfdr.de>; Wed, 15 Sep 2021 15:16:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q9RBw4LQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=q9RBw4LQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8T2D5JVsz2xfD;
 Wed, 15 Sep 2021 15:15:48 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18F4902b015663;
 Wed, 15 Sep 2021 01:15:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : message-id : content-type : references :
 content-transfer-encoding : mime-version : subject; s=pp1;
 bh=Lwbb8UGYJDSEgVuH4lgjwxdPROtoRslUADg/Rdt9hRc=;
 b=q9RBw4LQ+xOgtSAHRR3CB1SdzvhZP+nW8YGC002+fa50JKTJ0i9jBMOfZJmvD2Ah0ERW
 aDTFmel/mKJTjCSojkXYHho3oLonGp0Hogo3RAXLKLGd36Z479P44TJY2ZUWQksKcfau
 uhiPszTgh4/Nofk/eoiEl9PUlAl2hjPDxh9vpZWFKHt/FmsJ3W6zCwDNDeUubAXbdSH9
 4PHbW7MgS3cgr1zSgwN5wCBOEPMRB3zo5hU+2G+VwLCKFLrBRi7MRguHoQviRYNqVUvu
 xNPZ6ZQkdRukKdRKzhF8AyXuAZQHswV5+8ptlMU4gkqk6gw5cM8h0d3QU6t4FNvZC3Cx QQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b36bfvr8f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 01:15:35 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18F58UZe015089;
 Wed, 15 Sep 2021 01:15:35 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b36bfvr84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 01:15:35 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18F5DM1R021953;
 Wed, 15 Sep 2021 05:15:34 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 3b0m3bke8a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 05:15:34 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18F5FX2C35914204
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Sep 2021 05:15:33 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B60B124058;
 Wed, 15 Sep 2021 05:15:33 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4AFCA124054;
 Wed, 15 Sep 2021 05:15:33 +0000 (GMT)
Received: from mww0331.wdc07m.mail.ibm.com (unknown [9.208.69.64])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 15 Sep 2021 05:15:33 +0000 (GMT)
In-Reply-To: <CACPK8Xd9MK6oZ=Ac85EkKn7vPvEfqjMKSk=73_R=_16US+6gHQ@mail.gmail.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: "Joel Stanley" <joel@jms.id.au>
Date: Wed, 15 Sep 2021 05:15:30 +0000
Message-ID: <OFC8E57D8E.A167EBF7-ON00258751.001786E9-00258751.001CE2C3@ibm.com>
Content-Type: text/plain; charset=UTF-8
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CACPK8Xd9MK6oZ=Ac85EkKn7vPvEfqjMKSk=73_R=_16US+6gHQ@mail.gmail.com>,
 <20210910195417.2838841-1-anoo@linux.ibm.com>
 <CACPK8XfjF+aiEMLocscMEOw8ebKoT2MK8djvv4voyFOBjumXRg@mail.gmail.com>
 <23EB5226-63A1-45AF-A50E-2A9D6DABFC08@linux.ibm.com>
X-Mailer: Lotus Domino Web Server Release 11.0.1FP2HF114   September 2, 2021
X-MIMETrack: Serialize by http on MWW0331/01/M/IBM at 09/15/2021 05:15:30,
 Serialize complete at 09/15/2021 05:15:30
X-Disclaimed: 2455
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VjdCal0I5C901PWruGh7ydri4LCmTTIO
X-Proofpoint-ORIG-GUID: bNebpK7CmIprl9wX74g_3Nw_I9P_MqZT
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
Subject: RE: [PATCH v2] ARM: dts: aspeed: rainier: Add N_MODE_VREF gpio
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 bulkscore=0 mlxscore=0 clxscore=1011 impostorscore=0
 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109140132
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
Cc: Matt Spinler <spinler@us.ibm.com>, Derek Howard <derekh@us.ibm.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Adriana Kobylak <anoo@us.ibm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Brandon
 Wyman <bjwyman@gmail.com>, Shawn McCarney <shawnmm@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On September 14, 2021, Joel Stanley wrote:
>On Tue, 14 Sept 2021 at 20:46, Adriana Kobylak <anoo@linux.ibm.com>
>wrote:
>> > On Sep 14, 2021, at 3:49 AM, Joel Stanley <joel@jms.id.au> wrote:
>> > On Fri, 10 Sept 2021 at 19:54, Adriana Kobylak
>> > <anoo@linux.ibm.com> wrote:
>> >>
>> >> From: Adriana Kobylak <anoo@us.ibm.com>
>> >>
>> >> The N_MODE_VREF gpio is designed to be used to specify how many
>> >> power
>> >> supplies the system should have (2 or 4).  If enough power
>> >> supplies fail
>> >> so that the system no longer has redundancy (no longer n+1), the
>> >> hardware will signal to the Onboard Chip Controller that the
>> >> system may
>> >> be oversubscribed, and performance may need to be reduced so the
>> >> system
>> >> can maintain it's powered on state. This gpio is on a 9552,
>> >> populate all
>> >> the gpios on that chip for completeness.
>> >>
>> >> Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
>> >> ---
>> >>
>> >> v2: Update commit message.
>> >>
>> >> arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 103
>+++++++++++++++++++
>> >> 1 file changed, 103 insertions(+)
>> >>
>> >> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> >> index 6fd3ddf97a21..d5eea86dc260 100644
>> >> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> >> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> >> @@ -1502,6 +1502,109 @@ eeprom@51 {
>> >>                reg =3D <0x51>;
>> >>        };
>> >>
>> >> +       pca_pres3: pca9552@60 {
>> >> +               compatible =3D "nxp,pca9552";
>> >> +               reg =3D <0x60>;
>> >> +               #address-cells =3D <1>;
>> >> +               #size-cells =3D <0>;
>> >> +               gpio-controller;
>> >> +               #gpio-cells =3D <2>;
>> >> +
>> >> +               gpio-line-names =3D
>> >> +                       "",
>> >> +                       "APSS_RESET_N",
>> >> +                       "", "", "", "",
>> >> +                       "P10_DCM0_PRES",
>> >> +                       "P10_DCM1_PRES",
>> >> +                       "", "",
>> >> +                       "N_MODE_CPU_N",
>> >> +                       "",
>> >> +                       "PRESENT_VRM_DCM0_N",
>> >> +                       "PRESENT_VRM_DCM1_N",
>> >> +                       "N_MODE_VREF",
>> >
>> > Should any (all?) of these names be documented?
>> >
>> >
>INVALID URI REMOVED
>mc_docs_blob_master_designs_device-2Dtree-2Dgpio-2Dnaming.md&d=3DDwIFaQ
>&c=3Djf_iaSHvJObTbx-siA1ZOg&r=3Dbvv7AJEECoRKBU02rcu4F5DWd-EwX8As2xrXeO9ZS
>o4&m=3DJzmffOJA0hX_vgi3n0P-A6l60imZToV7q1U2W2h6xt4&s=3D14_ACuQWMp-IFlhLQa
>ejLVBN8XVgDnn1_l6336-FBG8&e=3D=20
>>
>> Not sure. Seems the openbmc doc is documenting the gpios for
>> gpiochip0 only?

>AIUI the document is for GPIOs that are exposed to userspace.
>
>It doesn't matter where they're coming from. If they are going to be
>used by a libgpio application, they need to have names, and the names
>should be documented where possible.
>

I agree which gpiochip is just a board wiring consideration and has=20
no bearing on the documentation.

However, in the introductory sections in the document clearly says=20
the purpose is to establish naming for common (function) GPIOs, and
the justification is by using consistent names across machines code=20
will be able to be reused with little to no configuration.  In=20
addition it mentions "common" GPIOs must be added to the document in=20
the future.  So an evaluation should be made to the likelihood that=20
such code reuse can be anticipated.

Most of the names added in this patch are presence detect signals used
to cross check VPD is read into inventory.   I'd expect any such uses to
be configured in an inventory config file listing the name and where the
FRU appears in the Dbus or Redfish model.  I'd argue the names for any=20
such gpio would be beyond the present document scope.

The one mentioned in the changelog, N_MODE_VREF, is intended to=20
be relayed to the OCC, basically a power management controller in
common in POWER processor chips.  I can see an argument to list this,
but feel it would be in the OpenPOWER specific section unless the=20
activation method is exposed in some method that would be common=20
to other chipsets.

>...documented in the openbmc design
>doc, such as SLOT6_PRSNT_EN_RSVD, SLOT11_EXPANDER_PRSNT_N, etc.
>
>They should be fixed, if possible.

The scope is clearly use reusable names going forward.  The technical
debt from past naming can be brought down as new uses are added but
we are not renaming every GPIO in every existing platform, and we don't
have the review bandwidth to agree on common names should be added for
all existing signals.

milton
