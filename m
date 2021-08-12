Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B885A3EA9D3
	for <lists+openbmc@lfdr.de>; Thu, 12 Aug 2021 19:57:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlvXw54J3z3bX6
	for <lists+openbmc@lfdr.de>; Fri, 13 Aug 2021 03:57:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=o3bELViv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com;
 envelope-from=prvs=0858893a05=mike.garrett@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256
 header.s=pps0720 header.b=o3bELViv; dkim-atps=neutral
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlvXN0sfjz307l
 for <openbmc@lists.ozlabs.org>; Fri, 13 Aug 2021 03:57:06 +1000 (AEST)
Received: from pps.filterd (m0150241.ppops.net [127.0.0.1])
 by mx0a-002e3701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17CHsXf4024888; Thu, 12 Aug 2021 17:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps0720;
 bh=9UzNLF4O7WfNSZKLRzLzeKjcr1TwNuCMiKX5dfjNfDg=;
 b=o3bELVivKmxTNF34ueXN2T2ZxG1CSMhFfjzWcXDKgUTwcR599wpBBeYWgS3n2O3cJgpg
 0EOMThyZYGNjQPb7lUXvP5zthNEf1PvI/BdsWAT2X8iai2To81lA503FLGYEZUY+AOcK
 ehzTGn6FqyKo9YrbRP1eDM1wR+iZNkkIu1AIZ7JHTjAfIvbl2vaOxK7iIbikadVEwnIx
 OxMFJasnnCjHWkpunuDthi+LfD5Z94dVL4ZYEh7jVWX2D2XgW1yqeutbhFjbMfwLvGRK
 QoqG9Br5BuHXhZjmaExp0wu/qxCOmcTBkzrg3fvS1+y4b+Oo+xPXBDH0/7u8lFblmUq0 Ww== 
Received: from g9t5008.houston.hpe.com (g9t5008.houston.hpe.com [15.241.48.72])
 by mx0a-002e3701.pphosted.com with ESMTP id 3ad7eb0h60-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Aug 2021 17:57:01 +0000
Received: from G4W9121.americas.hpqcorp.net (g4w9121.houston.hp.com
 [16.210.21.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g9t5008.houston.hpe.com (Postfix) with ESMTPS id 2249366;
 Thu, 12 Aug 2021 17:57:01 +0000 (UTC)
Received: from G9W8454.americas.hpqcorp.net (2002:10d8:a104::10d8:a104) by
 G4W9121.americas.hpqcorp.net (2002:10d2:1510::10d2:1510) with Microsoft SMTP
 Server (TLS) id 15.0.1497.18; Thu, 12 Aug 2021 17:57:00 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.241.52.10) by
 G9W8454.americas.hpqcorp.net (16.216.161.4) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.18 via Frontend Transport; Thu, 12 Aug 2021 17:57:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ImwIQyrvCsuAZX1sR2Y0WqzQKF/+dvbZ+wvCG6iqXzILZf29jncjIkgkoZnK+vTKgc84zy0S2cqxKFcPmtYgs5XABmUjSpvRSu0UPQPvDwvBvgodI3bErfVoUMIn+6ZiAXk8F9MNMmgC7GnYY4sZqIYpBxZh+WXgcm5DUxF/TY8O7k30AOGPT7tGOK/litztcTLsFC3y8ox5PlWja5p4gwNH/Mx2c1x/1CeVTiOaoquEYE8AbclXElwhvbcaivrkruCVt7L4QR1XJUeXPXiT3NIX/29ZZMcCkSXRG5/KPz32O3iZ+I242IiYmFLGR71PVCDIcuqfLHN+vvXaKOGbug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9UzNLF4O7WfNSZKLRzLzeKjcr1TwNuCMiKX5dfjNfDg=;
 b=nwMNv0jAC0POwIHU2FVFxOtmaGvL3N+exzMcXorQp0iis7SAS7ZXq/i8mUr/z0DvdDOFqJqYhSfIuVdDFevwxAbUTdvRC3f8vXVsyQpYctDMNRK9F2I3cgzoR7j5+bY4QUPbrslRhxso8X0duFJlngXOnbVDmnpgEEAEh7IOK7PmHNAWsmRngey8HkyNkIIUcLieBjY4fr0AjI148/iT9tNTRAoZSisdx5fwH/7bi8BfBzrckjQKTelPc5cRb9RykJqeeLeEeNrEjJ/o6qex+WQ1s8y3uZHq5BOFNw82GUPaWb6o7dFLlITiDmkf0J8PwSWsoBcCFJFLty3eHpFonA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:760b::12) by DF4PR8401MB1178.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7611::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Thu, 12 Aug
 2021 17:56:59 +0000
Received: from DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::157:d9fc:2a87:4617]) by DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::157:d9fc:2a87:4617%3]) with mapi id 15.20.4394.026; Thu, 12 Aug 2021
 17:56:59 +0000
From: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>
To: Patrick Williams <patrick@stwcx.xyz>, Ali Ahmed <ama213000@gmail.com>
Subject: RE: Turning off the D-Bus REST API by default
Thread-Topic: Turning off the D-Bus REST API by default
Thread-Index: AQHXj4o4XeLveMX0R0elLbHC+tBEcatwJ4dw
Date: Thu, 12 Aug 2021 17:56:59 +0000
Message-ID: <DF4PR8401MB0634D0AC75CD6A1AC5602C188FF99@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
References: <CAKJqRLVQYxzFEUOe=jF93dVvR86JJWk_uO9KnVLriJ+jDdkDVA@mail.gmail.com>
 <YRU2f8s4T+fBGrE9@heinlein>
In-Reply-To: <YRU2f8s4T+fBGrE9@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=hpe.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 64e33ea0-0c77-4536-0b1c-08d95dba9514
x-ms-traffictypediagnostic: DF4PR8401MB1178:
x-microsoft-antispam-prvs: <DF4PR8401MB11781D334631322B1A195D718FF99@DF4PR8401MB1178.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1284;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aBM2MzK120pGQP0ZVXsaTUhPS+t09cU+Q1qggSvRuXnFJWeYmeczsr5VGYByQzby00Ml0bQhu66oY/DEfDAc008S+spTd6MftHUcHrE5kUeE8W79YIbmQsNvd2GiiWTNdBRUvKLjyZv7UmSeHCR3p/pcHSkbJU+PLZVf3zdZ4R0tBAoiSn99MvL5dWDfedBPsk5rzqwsd607uGULDHDkintMWkbsIn4fS8Ip7AEmq9gZrjTbrPgCovWpTx/dRYEhGXALqcAEPrdX5RKcNRtPl3okiBnz22XGTTM6o3Bju82JrS4IA2zDAbyYSoCAwAbDll6d0yHnw6qmMOAiH5kYgNrLdQbof6EUL7mDuej7H/t1BCFPnQrDzh1atjKjScJ3AzK6PHGvwH5LAKwEIx6Nv9GIYTYgCWr+OxGL1EDfWcLbbLsrrqbecYoJ2iSyoFE71Q+An/4u7MfyAjRN2UlalEsNHPOXUnVe6iqlqEqAOzi6nE++EvETaR4+bb/ma8gqN/HZaWKvKTJF+mA6NpJRq8Kj1lI1d5wMrfbB2Z+6G9NSpLvPkhQ37bgEp2tLY0H6X+FdiLqsoHdU2yQygJOD91yJGXGoRt0oxj/KSNmfndtxUWIqP++HqqlUAUgsKTW5v+U+Ci0niCJ9ofrWp/wmFgK7N/lrZK/X+l0cTVURSj9BAZ9ItOZwBNx/Gh7fIogUukcvryAloL8+3w8tWRnxaZQd0ujtt8yVe5RUvnJsv4EUeYXZ4FuGCAF/eS5r/ds9HvAK3cmKD2vLy8iiqI/taLaibTDg8CeqasuD+seswAg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(136003)(366004)(346002)(376002)(52536014)(966005)(66556008)(26005)(33656002)(186003)(71200400001)(66476007)(76116006)(6506007)(66446008)(5660300002)(478600001)(55236004)(64756008)(53546011)(38070700005)(110136005)(8676002)(66946007)(4326008)(83380400001)(2906002)(7696005)(122000001)(38100700002)(9686003)(86362001)(316002)(55016002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PlMSnhWjLmRupgjAFJS/NfqwNW3hac+hR5l3u6km3q/KxpoVaoe73wIPSr44?=
 =?us-ascii?Q?eCg8FhH8MzuuRG5xFDCJpOfdpvFNpddHxHFQ4IN6mdwuyL3pK9GdjIOQGdQy?=
 =?us-ascii?Q?ll8Spm+MlCRyGsdlzu4SZUbrFFnUKKj59CHuUDKz8U+4Rnp80Yf6ZxxfoLNq?=
 =?us-ascii?Q?BOMv8JhDgXcQGRNi7IUOKbOvvx7wxXMqjaFrstgLSJIWQdaZIpnrHPBKSGYs?=
 =?us-ascii?Q?w/RWk9dWYChwsYylB6wPX/2LCMbMeEApYuI2bnBJuwxi8fN3qEFJ8dPAvvB4?=
 =?us-ascii?Q?+oXMB6gR5wUacvyz90S80yppsAOy7yYWw76PS3/jX35iKMTIrJZ+WoKKEazD?=
 =?us-ascii?Q?4lyBxweoN+oJg9a3BqI+K2Eru4aEvG+nsrhRajMvoo0sa0ZdA3FNIuvuwd+2?=
 =?us-ascii?Q?DpT2ZczClh8CloVSXMK20r6gRDsBgst+TucHAmxinpVzMSxkPJABcmMN6G+S?=
 =?us-ascii?Q?7D5WOFCgueKxIOE0auzbd+eSzKN9eXYZLEpULNkMsn+EVmwE5/8OfX5h7NQd?=
 =?us-ascii?Q?Z/0kfRVfhIRGojlwmMZJ2qa61mn/v3O48OVd/ghEuaKCvRb4+n5h0DN9lEHV?=
 =?us-ascii?Q?gEO5FBgfY0EWHOmeVvniDk9v08jKLo9K2spjaFeVgpAzprl24x2+LnqCfEbf?=
 =?us-ascii?Q?zzuVIT2+jrGx+dwJTsvywAv/GmCMummfEhOYmaGyeUC4xoN0GW91++0cl4k+?=
 =?us-ascii?Q?uEbyCmGYa00oxe3G1lTDJQAoK/GeL/Mbjo5Ay2djIlqmobTBfZ9IN8Nlh7Sz?=
 =?us-ascii?Q?6PUKITF3yazSHWjGRd3uJ2cdDoyoLGzGYT74Br2n9R4FqSviwF5KTopmQg0d?=
 =?us-ascii?Q?jkMM3cZCvfx8ku5gOsq888mG/g0b3juBYrhPeawsyP3PtByM49gVX0c99e0e?=
 =?us-ascii?Q?DSz0EbJJjMZmCLsS/VOaKSk5ECxfohfpvcguyxBzDT1rxbzZ7Oi0tKikb+Xk?=
 =?us-ascii?Q?fle47xjXccZscO56wGttjPKOac/QEIF2j/Trrq25lhCz+dMpSmclKZ42B6X3?=
 =?us-ascii?Q?2vaWZLJiEpQdlu7VR5ayJhH4hZ0Ivkjix/uB115qHYGK/k/j6PMNf5VuQOX8?=
 =?us-ascii?Q?uTPposV3vbTO66/2+c72w3TrMAtNDw0gbXR/MrLkcQel+/4F9BeSndVHj4CC?=
 =?us-ascii?Q?lWDS/wR9yjWBqvC0eRSKKs0MVJ7omqmIHAxxMJWRUNq1bLzn0gHEAqc1ruCM?=
 =?us-ascii?Q?Aggm7TKVO6rVMaOmLVSM9ly6y0Cp58awDFSAf9SaGb2iitrb4bZLY75YBFUo?=
 =?us-ascii?Q?h3lY5DBT7OaLCua06csDfz31F6/vzeGzwwNeVAwI+3zk5fXseSMqVEJejTDY?=
 =?us-ascii?Q?rET20jpz3JDD8vxn2R4FRfJv?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e33ea0-0c77-4536-0b1c-08d95dba9514
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2021 17:56:59.4185 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pkoIbtJp2cr3AOg4Hg+99rOQ3IEoaOFdkqv4xNgeuA6BG8tAS18YsQLpQ1s5R96kRxL+XWXk8iRv+1TPjeq5ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DF4PR8401MB1178
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: 1wG-x2vTgO3cb8r5CFeF6Lk-M8Lu53Or
X-Proofpoint-GUID: 1wG-x2vTgO3cb8r5CFeF6Lk-M8Lu53Or
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-12_05:2021-08-12,
 2021-08-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1011 phishscore=0
 impostorscore=0 mlxlogscore=923 adultscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108120116
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks Patrick - I plan to update the HPE machine very soon with several of=
 these fixes.

Mike

> -----Original Message-----
> From: openbmc <openbmc-
> bounces+mike.garrett=3Dhpe.com@lists.ozlabs.org> On Behalf Of Patrick
> Williams
> Sent: Thursday, August 12, 2021 9:56 AM
> To: Ali Ahmed <ama213000@gmail.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: Turning off the D-Bus REST API by default
>=20
> On Thu, Aug 12, 2021 at 09:10:01AM -0500, Ali Ahmed wrote:
> > I know there was some previous discussion on this.
> > https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/29344 is
> making
> > the default setting for D-BUS REST API disabled. The D-Bus REST allows
> > authenticated users access to privileged information that may be above
> > their permission level.
> >
> > After this commit to use phosphor-webui or D-Bus REST, you will need
> > to set -Drest=3Denabled in your bbappend. Note: webui-vue uses Redfish
> > and will not be impacted. Let me know if you have any concerns.
> >
> > -Ali Ahmed
>=20
> The following machines/meta-layers seem to still be relying on phosphor-
> webui.
> Is anyone signed up to either switch these to webui-vue or do the
> bbappend?
>=20
> ```
> meta-hpe/meta-common/recipes-phosphor/packagegroups/packagegroup-
> hpe-apps.bb:        phosphor-webui \
> meta-hpe/meta-common/recipes-phosphor/packagegroups/packagegroup-
> obmc-apps.bbappend:                           phosphor-webui \
> meta-ibm/meta-palmetto/recipes-phosphor/packagegroups/packagegroup-
> obmc-apps.bbappend:RDEPENDS:${PN}-inventory:append:palmetto =3D "
> openpower-occ-control phosphor-webui"
> meta-ibm/meta-romulus/recipes-phosphor/packagegroups/packagegroup-
> obmc-apps.bbappend:RDEPENDS:${PN}-extras:append:romulus =3D "
> phosphor-webui phosphor-image-signing"
> meta-ibm/recipes-phosphor/packagegroups/packagegroup-obmc-
> apps.bbappend:RDEPENDS:${PN}-extras:append:ibm-ac-server =3D "
> ${POWER_SERVICE_PACKAGES_AC_SERVER} witherspoon-power-supply-
> sync phosphor-webui"
> meta-ibm/recipes-phosphor/packagegroups/packagegroup-obmc-
> apps.bbappend:RDEPENDS:${PN}-extras:append:mihawk =3D " phosphor-
> webui phosphor-image-signing wistron-ipmi-oem
> ${POWER_SERVICE_PACKAGES_AC_SERVER}"
> meta-ibm/recipes-phosphor/packagegroups/packagegroup-obmc-
> apps.bbappend:RDEPENDS:${PN}-extras:remove:witherspoon-tacoma =3D
> "obmc-ikvm liberation-fonts uart-render-controller phosphor-webui"
> meta-inspur/meta-on5263m5/recipes-inspur/packagegroups/packagegroup-
> inspur-apps.bb:        phosphor-webui \
> meta-intel-openbmc/meta-common/recipes-
> intel/packagegroups/packagegroup-intel-apps.bb:        phosphor-webui \
> meta-lenovo/meta-common/recipes-lenovo/packagegroups/packagegroup-
> lenovo-apps.bb:        phosphor-webui \
> meta-quanta/meta-olympus-nuvoton/recipes-olympus-
> nuvoton/packagegroups/packagegroup-olympus-nuvoton-apps.bb:
> phosphor-webui \
> meta-supermicro/meta-common/recipes-
> supermicro/packagegroups/packagegroup-supermicro-apps.bb:
> phosphor-webui \
> ```
>=20
> Romulus and Palmetto at least are ones we utilize in CI.
>=20
> Is whatever hardware testing we do on Witherspoon now moved over to the
> Redfish APIs?  Everything in openbmc-test-automation.
>=20
> --
> Patrick Williams
