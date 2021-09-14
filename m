Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6A740B96B
	for <lists+openbmc@lfdr.de>; Tue, 14 Sep 2021 22:47:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8FlC5CQsz2yPT
	for <lists+openbmc@lfdr.de>; Wed, 15 Sep 2021 06:47:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pCg5W+X7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pCg5W+X7; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8Fkf2YR2z2yJ1;
 Wed, 15 Sep 2021 06:46:33 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18EKUUHd034773;
 Tue, 14 Sep 2021 16:46:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=jfau7N1/bvxLvrBBW22CTzOG62QNwlPRoUcvLRd5PnE=;
 b=pCg5W+X73zqYebJ1bk88Kbxuc8WEdjWsl6GOtFrqObs3tQt1OVAF41P+tO55osv0it/3
 lE0N73xphr8hF9W6eWfl/k/A66vB8RDz058AorGOtol6Yq2T4AV9CKy5nbK7wouKS3BN
 br916LCVGcOXKrcuSkaXbeyeiQicz/xKTxoV1L4BtnzRjfynGetZ46XXN/T1gI7SoAmf
 gL8B64k0ekjoyib5mmOIUe4Ivde0YWSaIYB3IFiM0A81jj6MWugBRJ5RKlgKHqu+ko3q
 2JFXicAX9MtmXAEnsMIdldh44F7K+EJZLibJxSpgFy6LzGkcQda965PZQVZSmpNy/XkT Uw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b32u28922-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Sep 2021 16:46:24 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18EKZIBm022602;
 Tue, 14 Sep 2021 16:46:23 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b32u2891r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Sep 2021 16:46:23 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18EKg3EH009864;
 Tue, 14 Sep 2021 20:46:22 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04dal.us.ibm.com with ESMTP id 3b0m3b21yv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Sep 2021 20:46:22 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18EKkKet30474708
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Sep 2021 20:46:20 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A59C78069;
 Tue, 14 Sep 2021 20:46:20 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 697727805C;
 Tue, 14 Sep 2021 20:46:19 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.160.54.83])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 14 Sep 2021 20:46:19 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v2] ARM: dts: aspeed: rainier: Add N_MODE_VREF gpio
From: Adriana Kobylak <anoo@linux.ibm.com>
In-Reply-To: <CACPK8XfjF+aiEMLocscMEOw8ebKoT2MK8djvv4voyFOBjumXRg@mail.gmail.com>
Date: Tue, 14 Sep 2021 15:44:06 -0500
Message-Id: <23EB5226-63A1-45AF-A50E-2A9D6DABFC08@linux.ibm.com>
References: <20210910195417.2838841-1-anoo@linux.ibm.com>
 <CACPK8XfjF+aiEMLocscMEOw8ebKoT2MK8djvv4voyFOBjumXRg@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eX9e3dyr4e7iG9RdGxEOmQ0VDWWLZlcR
X-Proofpoint-ORIG-GUID: cjNZPeq1AmmwVJFKoAH1z60MEsUQN5Nw
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-11_02,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109030001 definitions=main-2109140109
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Adriana Kobylak <anoo@us.ibm.com>,
 Brandon Wyman <bjwyman@gmail.com>, shawnmm@us.ibm.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Sep 14, 2021, at 3:49 AM, Joel Stanley <joel@jms.id.au> wrote:
>=20
> On Fri, 10 Sept 2021 at 19:54, Adriana Kobylak <anoo@linux.ibm.com> wrote:
>>=20
>> From: Adriana Kobylak <anoo@us.ibm.com>
>>=20
>> The N_MODE_VREF gpio is designed to be used to specify how many power
>> supplies the system should have (2 or 4).  If enough power supplies fail
>> so that the system no longer has redundancy (no longer n+1), the
>> hardware will signal to the Onboard Chip Controller that the system may
>> be oversubscribed, and performance may need to be reduced so the system
>> can maintain it's powered on state. This gpio is on a 9552, populate all
>> the gpios on that chip for completeness.
>>=20
>> Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
>> ---
>>=20
>> v2: Update commit message.
>>=20
>> arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 103 +++++++++++++++++++
>> 1 file changed, 103 insertions(+)
>>=20
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boo=
t/dts/aspeed-bmc-ibm-rainier.dts
>> index 6fd3ddf97a21..d5eea86dc260 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>> @@ -1502,6 +1502,109 @@ eeprom@51 {
>>                reg =3D <0x51>;
>>        };
>>=20
>> +       pca_pres3: pca9552@60 {
>> +               compatible =3D "nxp,pca9552";
>> +               reg =3D <0x60>;
>> +               #address-cells =3D <1>;
>> +               #size-cells =3D <0>;
>> +               gpio-controller;
>> +               #gpio-cells =3D <2>;
>> +
>> +               gpio-line-names =3D
>> +                       "",
>> +                       "APSS_RESET_N",
>> +                       "", "", "", "",
>> +                       "P10_DCM0_PRES",
>> +                       "P10_DCM1_PRES",
>> +                       "", "",
>> +                       "N_MODE_CPU_N",
>> +                       "",
>> +                       "PRESENT_VRM_DCM0_N",
>> +                       "PRESENT_VRM_DCM1_N",
>> +                       "N_MODE_VREF",
>=20
> Should any (all?) of these names be documented?
>=20
> https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-nami=
ng.md

Not sure. Seems the openbmc doc is documenting the gpios for gpiochip0 only=
? The gpio names for 9552 in this patch come from the System Workbook, and =
doesn=E2=80=99t seem the gpios from the existing 9552 that also come from t=
he System Workbook are documented in the openbmc design doc, such as SLOT6_=
PRSNT_EN_RSVD, SLOT11_EXPANDER_PRSNT_N, etc.

>=20
>=20
>> +                       "";
>> +
>> +               gpio@0 {
>> +                       reg =3D <0>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@1 {
>> +                       reg =3D <1>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@2 {
>> +                       reg =3D <2>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@3 {
>> +                       reg =3D <3>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@4 {
>> +                       reg =3D <4>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@5 {
>> +                       reg =3D <5>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@6 {
>> +                       reg =3D <6>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@7 {
>> +                       reg =3D <7>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@8 {
>> +                       reg =3D <8>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@9 {
>> +                       reg =3D <9>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@10 {
>> +                       reg =3D <10>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@11 {
>> +                       reg =3D <11>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@12 {
>> +                       reg =3D <12>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@13 {
>> +                       reg =3D <13>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@14 {
>> +                       reg =3D <14>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +
>> +               gpio@15 {
>> +                       reg =3D <15>;
>> +                       type =3D <PCA955X_TYPE_GPIO>;
>> +               };
>> +       };
>> +
>>        pca_pres2: pca9552@61 {
>>                compatible =3D "nxp,pca9552";
>>                reg =3D <0x61>;
>> --
>> 2.25.1
>>=20

