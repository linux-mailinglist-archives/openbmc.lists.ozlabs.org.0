Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC173EF4FD
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 23:30:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gq41t5tWxz3bXh
	for <lists+openbmc@lfdr.de>; Wed, 18 Aug 2021 07:30:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=BdTIOSZV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com;
 envelope-from=prvs=0863fb86b7=mike.garrett@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256
 header.s=pps0720 header.b=BdTIOSZV; dkim-atps=neutral
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gq41K6n72z30Hn
 for <openbmc@lists.ozlabs.org>; Wed, 18 Aug 2021 07:29:39 +1000 (AEST)
Received: from pps.filterd (m0134422.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17HLSclg030388; Tue, 17 Aug 2021 21:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps0720;
 bh=LClmBKjet+XNY7qbce2AOqWzbfaMufiIk6Sy15emf3A=;
 b=BdTIOSZV3YPfxmCefcXuVoMYm1DyQgzYgAsesHTlc/l63Ke9ixr//Af720GjDWDmd3bO
 zf7Z+nAl89Lg6hngj5wPwahPFSSrp0/XkhG4aWVj6yviW42LapBmWg5BnW/Idjy3yI36
 ApwwrPEmZhm07IHoUkAiK85hQI93ztXElSGGilK/RbxER+7S/11yEJQGFPsdM1WJbb6F
 Sz6o7tA8BC30tkaDr44qh9OQFRJ0E7nkRZjHbIUsuWHBxBmtMZV2iqSpSi+WhBLSmQIe
 zeG6DxONUkCxfl1hufhSQXwpPZkFY34imtJix7II1+SSMC6EQVGf6d0uRn4fCjLUHOxn nw== 
Received: from g2t2354.austin.hpe.com (g2t2354.austin.hpe.com [15.233.44.27])
 by mx0b-002e3701.pphosted.com with ESMTP id 3ag8b7q139-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Aug 2021 21:29:34 +0000
Received: from G4W9121.americas.hpqcorp.net (exchangepmrr1.us.hpecorp.net
 [16.210.21.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g2t2354.austin.hpe.com (Postfix) with ESMTPS id 095519D;
 Tue, 17 Aug 2021 21:29:34 +0000 (UTC)
Received: from G4W9120.americas.hpqcorp.net (2002:10d2:150f::10d2:150f) by
 G4W9121.americas.hpqcorp.net (2002:10d2:1510::10d2:1510) with Microsoft SMTP
 Server (TLS) id 15.0.1497.18; Tue, 17 Aug 2021 21:29:33 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (15.241.52.10) by
 G4W9120.americas.hpqcorp.net (16.210.21.15) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.18 via Frontend Transport; Tue, 17 Aug 2021 21:29:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z8DUaW+/M5KzmJ7VA02xF2PnazfzJP4/eUa1wWVd/yHsihOREix/qeoUx6xMWnR1ISwtERsps0AqIf7Ae63Vn/nG6q+cn+wp1mhey9bLIuOMqj6kDawfaEgrVKCVaOEHMEWC5UxTEEU+L/qzFqLnzilkpmWbJCfGiAlLYreume+B7hDHKu+PvmXF5ZYADcdr1r44XiLK5j0h0wNGH2tN/MquL6cIdr592Nilgq12s5hzYemvMW0SANFPVQiDcpumCeiwG1k1RnxWN1p/jD3zHrYYlH0TJGWtonMycN10v5Vju+Y7Wgmj4q4i8VGLh5CPh8Nf4UeUSNAjzyPGxLkw9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uYcLA2zFVxiHmVib0WW0E6E1v36HsmFYzHlxM6dK/Ig=;
 b=TpW3GHc2bJQsmABcqicFcRWlGhh+cX4oZaec/pAHJO5vrHsGJ00BvijHxWq8LvXhURta4QGok5RACY5u1CnfF6PMxk1BrdNsHi7iUhNkbvcw3wxwzZmKbZZq77KVkJ5jNS4yjyZag8wxJNSGsvd7aYClNTEeh1nyB3iEox/BwNNbIW/P+jAQljCMn86f/LqtfRjOYTj3gJ0YpuzjUgltTMCrsu62OEsET/fERMFlX3XStgtBbG1lcO0lqBDgRbmMV4sVhbwwx/gZ+rkI3Whlr146np0PlrmQ0EJfB607S0aq0DOzAzySPeeWAzc6ieRsaVFx6VaAXQpRv4VDvNQXJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:760b::12) by DF4PR8401MB0794.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7607::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Tue, 17 Aug
 2021 21:29:32 +0000
Received: from DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::157:d9fc:2a87:4617]) by DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::157:d9fc:2a87:4617%3]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 21:29:32 +0000
From: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>
To: Artem Senichev <artemsen@gmail.com>
Subject: RE: Leveraging and extending smbios-mdr
Thread-Topic: Leveraging and extending smbios-mdr
Thread-Index: AdeC/WhwjpQBMCPLTtGJQffALNU7dwBUMs8AA9fyc5A=
Date: Tue, 17 Aug 2021 21:29:32 +0000
Message-ID: <DF4PR8401MB0634FB1810144BBDB9C42E158FFE9@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
References: <DF4PR8401MB0634147E668CC84648DC883A8FE99@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
 <20210729074904.u5lnr33pvayp2r6z@gmail.com>
In-Reply-To: <20210729074904.u5lnr33pvayp2r6z@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=hpe.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d50eb750-af4c-4f78-3a5c-08d961c61a88
x-ms-traffictypediagnostic: DF4PR8401MB0794:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DF4PR8401MB07940291F300A37DAA0854B58FFE9@DF4PR8401MB0794.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AyHqkp59LfPQlcBwOWdNpwM/pkad0QyvRaELWPrfjAhxJXKpml6PB7tet0mHhT/IHIhfjKUCBB+XeFAZmBtzHrEb2ooDwk19OZJAhtM11jXwhWDqmZxIf2r6JB3bGd4Cz1DzK/1SqoZ/VyNT7+C7WKyxGtjQRd1hEHfWkLrVMdKOcrusQCkl6RghCOSb1vSpgpMTDTctXQP2yQpcoCHWrNpt1mIJQsSuuVfUN8rIZdmwiySOJKYou3oCqnydCv14/FcZIzBmE1kOhcFKNBlTfAFySaentj4apRi1WIOUq51lP2ss1B0PXn6YrJMoU92B6LRrCx4JJKKqfk3p9++4qlAtTjGDuFxhByY46h/+AhtR9bpius+kzddNuC8NjnD3M1k77+2vGP/83CYcCSQuB8+zDGyeGa3K2//KI7eBXJpqNFAEhCqb3grRqCwPe47m7wLDSAr6zzwAm6lhnuuu7BqAYkisqpvEaG4k363ayEEV2P0hIVAEbVoC2/698qmF8Yvun86Ja3Apn2yU07OM8gWrQ5CG9+EDBmO2D6DfdjgQ8AuwtJd+uzpFEyAm3nbDRRjfM/dwFgrUWXNIkUyCDb8ORb2+AizhFRbjH9g+AV/PBzFe+SIiqrn4Jc+Noq3Wu/P8KxFlnIlnMjNhvG6LehXL9o3QecCIGDKEpR8egoi9a0fsyrAN6mttKNAMaBVlH+dXCEJOEbZkS5mjaV2CsLbZ389jI5BdoY2w2il3A6FeurE1q6bLjd/oY4R48DTZWuKQAU626L4y7T44gyIUDBZT1uqhExeNlLzDWEvVfrR960fMZoNK4APQ5kQBxI0nhjjOXQoSeVKk7R6GC2yzfA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(33656002)(8676002)(55016002)(316002)(54906003)(86362001)(122000001)(26005)(186003)(38100700002)(7696005)(53546011)(83380400001)(8936002)(508600001)(55236004)(9686003)(38070700005)(4326008)(52536014)(2906002)(6506007)(5660300002)(6916009)(66446008)(66556008)(66476007)(76116006)(66946007)(71200400001)(966005)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7/Ds2BldmwAlIsvD5uYZSUJin365FCGHZeCpF10qGac324Tiur2Z1dvMI96M?=
 =?us-ascii?Q?RpLKTM7t2Ync9IoGUmk9lqXQwFZt2uu0ckC+KorpZrb+tlmdgqBkHBsbn0cF?=
 =?us-ascii?Q?4k/QWjFFzcXsQt97f8RMWOvb5P+ih5gNCy4Xazzol+MH4/sMT0paq7D9tg8T?=
 =?us-ascii?Q?lds0YnkeGFB39l0Fl9SVyBSpNDKnXMaNVvry50yYxOrn/5FT2/wF+cqUtgX5?=
 =?us-ascii?Q?0CtaHYq2cMqKrcECc3eYZpQUH6d2XvEuHMX+rVzqGJ8GYZvmERYbD7FL3bbs?=
 =?us-ascii?Q?G602v8nYaYzeKCdswHwBHnnt4c+Jf0ZUT6WyOEzCrcgSZ5Mm6U+3iwnC+e/n?=
 =?us-ascii?Q?XDD0es51RktALBR7xTO6jeIRceKzBV4V1Nl+OG8f/zb7L69wSzEL1UqWahvG?=
 =?us-ascii?Q?gYLDfjbZxufkLuk3ByToR9VAed8M7eD9JnZ1eb8ZAaAZFKiYasCBZWS5h6Xz?=
 =?us-ascii?Q?+T50Ei1AGTuOJ8hjsfNQsqmPzJy6ZF8ZB7npAiDccuC2YXTLrwvHgdEfOvkc?=
 =?us-ascii?Q?4pIvvGZwcaWPrYHvKAfCt332U0a5rb2VbFzNk9oa9jsH8pezQK91SAZjzkVy?=
 =?us-ascii?Q?fXjb4GmIHIPW4lKafVg5xj3W1UgwprZ5DXblw7O0yJKWVtwhwVZivUvIxqxF?=
 =?us-ascii?Q?9lJFLm1fm/5uKgQNUA7jIiNLrTM0xEu8hnBz/tZBTs0z9OjkHFJNG8dXtywP?=
 =?us-ascii?Q?nQ6AwV8ZP2BbYTR5qaUXQ0zPsRU3bnCCTK2Cir4RMD+wEzBLC80YK434VOFh?=
 =?us-ascii?Q?53HG1ZKO9BQzsSioVLkcFfuHlrFd7gTP+TiPUpEDXRIiLh+biJhg4/eYUHBC?=
 =?us-ascii?Q?IMA5b++DJSd+eqntv6QoKnxeKhdB6HzYo7HKAp8aufaCQiCwHQaC0SmqNLji?=
 =?us-ascii?Q?sfu+ADqLnjDNU+/rKbdTK2DdJ66GW4Mp6VbzSVN7J9UjnPOvx3XTbQnGBhS9?=
 =?us-ascii?Q?k4XJ1hC9sMDCjGtTbjZTzIm0LxV01zM15hveY/tNp82f3LSzRGDQXJDfcJZa?=
 =?us-ascii?Q?p8HNEL1jgogVIKSAg6VKFC13AUXDXSf4LRQ0wVmuWrQxGPnWJLmVzoUF46q5?=
 =?us-ascii?Q?PRlyJZJ/eMq+J54m+KUgsrCB3aGUdtB2uX4aCAxf1mJp4NqctgdoFpYZD01a?=
 =?us-ascii?Q?sIl2OBnE1+BdfFYqzsEARGolbtbDNnp0pBnUCw6M8PESCyZ29kQMCiktAohw?=
 =?us-ascii?Q?t9200qZs1nOXhq8rtvLO9PvSh85lsxl+3HHWniMuApeYHPwcbBx8/OCPiBdP?=
 =?us-ascii?Q?sB1919g2nzZC6HNfid5UjGBgF1n1Rm8zoC6BzCb2knmUDgqe+/6To4y9onIu?=
 =?us-ascii?Q?4s6HXW0ofn3Tn7a/Z1ggRgHl?=
Content-Type: text/plain; charset="us-ascii"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d50eb750-af4c-4f78-3a5c-08d961c61a88
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2021 21:29:32.4400 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WXXw2sUW9xoioSEyLKl+nT/qS/OesGthnERmzQZefW8Z90buCCx8jItB0Pu2tDm3oA2s0EkRVlFY9002544nsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DF4PR8401MB0794
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: sTtFe6Pw0Im6hZgDcXmpDsW82CXl_g-K
X-Proofpoint-GUID: sTtFe6Pw0Im6hZgDcXmpDsW82CXl_g-K
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 1 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-17_08:2021-08-17,
 2021-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 mlxscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108170134
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Pedrana,
 Nick" <allan.nic.pedrana@hpe.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Actually I'm talking about https://github.com/openbmc/smbios-mdr

It looks like this daemon tries to take in a data file at startup only (/va=
r/lib/smbios/smbios/smbios2).  I'm wondering if there's a provision in the =
design to refresh the data file if appears or is updated later.  This file =
(at least in my experience) has to be created by an interaction with the BI=
OS during boot.  So it would be very reasonable for the BMC to boot before =
the host and there to be no file available yet.  Also, if something is upda=
ted on the host, a reboot may refresh this file.  So I think there are a co=
uple of reasons why it would be good for this repo to react to data file up=
dates.

If it doesn't exist and folks think it's a good idea, we can look at creati=
ng that capability, but I want to make sure it doesn't already exist.

Mike

> -----Original Message-----
> From: Artem Senichev <artemsen@gmail.com>
> Sent: Thursday, July 29, 2021 2:49 AM
> To: Garrett, Mike (HPE Server Firmware) <mike.garrett@hpe.com>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>; Pedrana, Nick
> <allan.nic.pedrana@hpe.com>
> Subject: Re: Leveraging and extending smbios-mdr
>=20
> On Tue, Jul 27, 2021 at 03:47:04PM +0000, Garrett, Mike (HPE Server
> Firmware) wrote:
> > Hello Artem and all,
> >
> > We are integrating smbios-mdr into our build.  Our SMBIOS info is
> downloaded and built as a file in the filesystem using proprietary means =
(our
> CHIF - channel interface).  Our hope is that we can simply point the smbi=
os-
> mdr service at it and light up new information about the platform in dbus,
> Redfish, and the GUI.
> >
> > However, I can't find much in the way of documentation about smbios-
> mdr.
>=20
> If we are talking about the MDR2 project (https://github.com/Intel-
> BMC/mdrv2),
> there is no documentation, but I don't think we really need it.
> It is just a SMBIOS dump parser for some table types (CPU, DIMM).
> The table format is fully documented in the SMBIOS specification:
> https://www.dmtf.org/standards/smbios
> !NpxR!xpRhPV3JWN6U7DS7nROiFT5h3CNwyuFM9FLOZhUK0yNczSR8w5MX7
> iq1WAqwQuc$
>=20
> > I'm especially interested in how to extend the functionality past just =
CPUs
> and DIMMs into things like OEM records supplied by the BIOS.
>=20
> What about phosphor-inventory-manager?
>=20
> > Seems like the possibilities are:
> >
> > 1. Smbios-mdr has a generic dbus API and we write an independent
> > service to query it for this info and publish to dbus 2. We create a
> > generic extension mechanism for smbios-mdr for vendors to add OEM
> support and push to dbus directly from smbios-mdr (like w/ CPUs/DIMMs) 3.
> We fork smbios-mdr and extend it (not preferred).
> >
> > I'd like to hear how best to leverage this recipe.
>=20
> --
> Regards,
> Artem Senichev
> Software Engineer, YADRO.
