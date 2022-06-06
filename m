Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC7953EF27
	for <lists+openbmc@lfdr.de>; Mon,  6 Jun 2022 22:10:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LH4N96Tbyz3bkg
	for <lists+openbmc@lfdr.de>; Tue,  7 Jun 2022 06:10:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=ZSLux7+r;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=equinix.com (client-ip=148.163.159.192; helo=mx0b-00268f01.pphosted.com; envelope-from=prvs=91568dad4e=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=ZSLux7+r;
	dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com [148.163.159.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LH4Mj0Ysqz2xfP
	for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2022 06:09:36 +1000 (AEST)
Received: from pps.filterd (m0165121.ppops.net [127.0.0.1])
	by mx0b-00268f01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 256FWdVh010507;
	Mon, 6 Jun 2022 20:09:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=6oOMzOvkUBn7taSaEcAJlnVAtrEhXVmldlFPSo0DTog=;
 b=ZSLux7+riyHMjHOKLPLyqTiWr4W8NIevAM5CcY41Qugp6eEs7BJGdMA47P9coRMvSWe9
 /lGtzAqV8QBiZKHnE4OihKvlT78ZzSuuEmGViBTElkGbcd7U0LVPP32fTAHuhFhq9xcn
 FCtyzVkPUsplfLl0J4vKT6KeyA7rhL9E9u0IxnLqkaFtyXH9yMIvy9D0gq4jNh/cq3jA
 KwGlNP0dnTqXAT93/LrIcCvb/kkvwYbG3bDOs+V5c1O6Yo/8RFXIt6vcjTcf5YtpUzb7
 a+NkAN4oMjMmpjRssn8xr29tfIPb4jAQRIsnKtidlXtvpLSHcw8MQBaV316H+4cnKvo7 uQ== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
	by mx0b-00268f01.pphosted.com (PPS) with ESMTPS id 3ghmagrw1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jun 2022 20:09:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrLtFo4rlISepR7ER31xisiwc9iKXv/N8gP7gBkQjf92sQiWac/ka3uziBTdPRzqhhkjkR6RFgOcBiAfK5YDZabQ5i3T39aLiM7wJlHrpfKm59uxwYmxH10MXZ/XmP/6M5noaumK4E9QSVPcvyT4B1CuvWDGtOisPxuogUNQjPsTOvdgFk9gM1j4rd+y/ku1RCm+XcYnlmsRdj0xDBIwih3X+mHz331Z+LIoAxaTcHTGlUDMRE/nnCt7nn/ToIZyNk/iCFgZmZaSR53RgANVPif0hzYMoB9ZxwKeE/LMbxifrgN8cVMleTC27yLllmTstYMjX03BsLI/zFVMxgID8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6oOMzOvkUBn7taSaEcAJlnVAtrEhXVmldlFPSo0DTog=;
 b=bbDSfKU+8I6GOOJr1GFtpFWx6PdLCVS/o9UYoVkTa6R4qq5nD3IK5B2MbI/Dzclz53pb8SjY5TYDDOniRPh7AufgzZc8xZg/2FSuymgSg4lm049G6HxIj77NLyC0e0nM+rFbZoedOaG10esLjBd+jW68+7nU8N3CSIaQwWjI+t1mSaKPi88vNrfw5AzKQOhuFJ7ex0yid39zxrydmgQCe1nPIeAbBgOz2JoQDN5fhqwtO/eTtz4qNtjq7/k3QbIbPA8Rtc+YW+y5aoeY8AoYUh3n7CvHqiT3/mUQpuXbIgM2oxrpXjXtnS39ii09/LpA5xLL6iF5p/tItorSR1sKiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by SA2PR04MB7706.namprd04.prod.outlook.com (2603:10b6:806:140::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Mon, 6 Jun
 2022 20:09:30 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::3cb6:207c:de36:12f5]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::3cb6:207c:de36:12f5%6]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 20:09:30 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2 1/2] ARM: dts: Rename
 Rainier to P10 BMC
Thread-Topic: [PATCH u-boot v2019.04-aspeed-openbmc v2 1/2] ARM: dts: Rename
 Rainier to P10 BMC
Thread-Index: AQHYeeFUemEowrcRLkOX2Koz+arlTw==
Date: Mon, 6 Jun 2022 20:09:30 +0000
Message-ID: <20220606200930.GP11809@packtop>
References: <20220606000434.1399583-1-joel@jms.id.au>
 <20220606000434.1399583-2-joel@jms.id.au>
In-Reply-To: <20220606000434.1399583-2-joel@jms.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8abb8dee-9d17-4a43-9bdf-08da47f87769
x-ms-traffictypediagnostic: SA2PR04MB7706:EE_
x-microsoft-antispam-prvs:  <SA2PR04MB7706647C39160A0CFDFFB7EFC3A29@SA2PR04MB7706.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ar4LMHvVYGJugWi1DIH0MF7m+Xf5bPm3BM5xTt2eEN8F5KwMYIf2O6C0djbAr2nIZ7Cao/+Ssnu37CHczd87Knl4ewa/olH9jfW9xKjvP0U654uslcMH46mG2R8Dk8wsdqvFtv48V50neJ4PWQtDlWLEbxwEby6AxVN5MF20tt8QHxuj5ISuEtyFrYptxi/iN4U4UkLCcIhnnG6gMs34Ks2iWkoNsGoAW7Yl3u0eXujAaNImB92c72tfzx6CsV9tA1eJ2JCGcFCfkLXrt0WBWq/h+D5XtQaLdpPuh07j5luAWFUkLR8pTUSTy/UwZxdHhacxfdjuRMbvP4pJoNsmq1MClBRLYGF4WL3u6e0NZdqD1JFchoFdzwhZ0onZylN/YRaPZWwDOXRKQAbWGGD7g3DkTd7J81sJ+Q6O07IRGTwDFCrlnGbx6uxEeH0iY1UUqfqBw/VF2MZ6w73JTMMNcI8GNYi2g0s3MRQbiW67Yi7J3pJi/uY37Qlv9mN1IIpR6dWIEyLrGn2umUGLv3blsmY7OoY2LUpoMXyGlZWOJdjM0E/pnnaxXPApZ9GLfBXdcgjM+/3O87CYGn5JRB52BuszEpsIZxBO8gIdw6MdgANAR1lrd2PDRT9xFJGqnUhDWvPU8hQ6yV34JKRtk1Do+m40x/Y1EMIykJ2jdLfOSfm5W7oSjvdcNBouPdBO0hNIUvxiSZv2xbsMtNK60N3Rjzz6HzYtq7Nb9LVb10kxyLMC6mheD0U9uOzMua6kXrcA
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8007.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(5660300002)(33716001)(2906002)(66446008)(66556008)(8676002)(508600001)(186003)(8936002)(316002)(26005)(38070700005)(122000001)(83380400001)(1076003)(6512007)(6916009)(9686003)(54906003)(4744005)(66946007)(66476007)(64756008)(71200400001)(33656002)(38100700002)(6506007)(6486002)(91956017)(86362001)(4326008)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?H24rIm46PT1kheKawm9+GTD3uG3WA+ty2WoDcpIP7yJa5pwfpoPQeX2S7BDh?=
 =?us-ascii?Q?nYjFozzLZJ0sGnM9R95wKuy88dN1Sr/ifmo7ZMHhu66XjuXnQT/d5Iu6IGO+?=
 =?us-ascii?Q?VTctckK+SUr9YUvcKHUGbciaPA5QZT9S++f0fkj+nuRmuimVJNvabCJQ+dn7?=
 =?us-ascii?Q?VEbWaAMnnuFdvFwDnIiP8MDBfkQosZAM3h0Jufc2rTk98mG0GlM6ikRhzz3w?=
 =?us-ascii?Q?64vCXvGj2fCwfpsm27lhlw8hm0mlHGJtPsYejE1o5ESDQk2jwU9gqzyLabVS?=
 =?us-ascii?Q?tT09zz0qNo6/kMbHP2F+k6+N/zL9Z0dT3WVm2VWPJRzVsrt+QvheeH++zBda?=
 =?us-ascii?Q?1Hi6SDA4iKUoVX0SoWwLx/i0tnRYWef7qONxDd6oWYgSjz2v/DbjohWoAXvG?=
 =?us-ascii?Q?m5T3eGarUy858bY5UeiqtGQFm4XZ6NWkW3ZoEOfcj1CvbEQiv16+l+zjurH9?=
 =?us-ascii?Q?ISus5qd8UDW5bcs9y4hO3XRY0/sWcQXG/gW46VCVWivJcGf63UTXKO7BCvdv?=
 =?us-ascii?Q?FAv3kNKuTtyqkTw7HP+MutrtZclxwjcTasaSug9RRC4GCM6gQAwjQqBQ/YLo?=
 =?us-ascii?Q?L13lhe60ISYdPUdvRAhbvd66DPOW1h3+I1qMDxzK4/p/IZGOOvI3WYaW4WZL?=
 =?us-ascii?Q?iJxqHq/EZLnQ1WvZ4SLsgYYjrcWOubArmgnuPZkTDtiobUkVTlPrQFv4rNhB?=
 =?us-ascii?Q?jWIV6C9hwVuah+dXHbr+MdUyKVFlO96HOTryupF+1pIMFI1TLZE1eJJ/EgU/?=
 =?us-ascii?Q?h/I6Vhotym5vCejhnrXFWAW/uvyRGrqnNBgg/oAeNqpXFc9h5+m1jVDQralT?=
 =?us-ascii?Q?FbSBcsxhsV7CxZ8tGhtmWDM5DQ9zmMtQ6BuSYBXJVNgw0tY76lCxWAM9Hj6p?=
 =?us-ascii?Q?NQB7+iR3/mWqTz3aHo5qIgtUZpRlAr47Q+Kyh2TIrPqs9+5pnvwOg6hAM6xt?=
 =?us-ascii?Q?60XBL9qDIPhCkjTkaBdIkgQ6GRBfk2CmIa/cKH7i8mhmtQczGh+aWjWPbH2G?=
 =?us-ascii?Q?v7h/4jVkaaJ5R17fX/QBgIbbJ77cQf14fewyKTbxcn/SW2YA5k/QeoW3gVne?=
 =?us-ascii?Q?iAmyBG8XPdGs3Ao8rRi95NWTmKiKLZriWR8IRYuNkaDBnoCrtYOIADI9GWqK?=
 =?us-ascii?Q?VfxxAGwfitYIGrFbKxWlEmOeLR05a4pGOOYpVGCwjTNfVL6myZkXto4OyaE6?=
 =?us-ascii?Q?hPEif6m9Wi3LzjtI9VkKb2nxVcRxCpTRB7cv7jchE2/YzT1nmquPUfFpFkkK?=
 =?us-ascii?Q?SJBSxHZ5b79Y/NiNK02Kb1DJ9HnbSacI8kB1HlnU9ujuoC21cFRSieM59BwV?=
 =?us-ascii?Q?NbbIRp6XOeDomgMDH6443mejE7oxomAHqIo+1qIAOOzbVC9RdPy6GmWBzvyS?=
 =?us-ascii?Q?PwpUB9gr5glVaBgqIuXUgkk7G2iT/YqjZFLtv1Ekc5CUxRWG3QvozSjtfUDb?=
 =?us-ascii?Q?wGIJahcfzaoMGe9q74+/KcGc7p6BtbBFr3D1BDMsqA4EyuVFLKOWqUAacR6O?=
 =?us-ascii?Q?7MFJkUwbNN602h4kfTu504z6lfCu/zMtp17rKehy0SJnF0ycRsodVtkqRDll?=
 =?us-ascii?Q?RMnhSw1ko08Fu/7kK9EDJUdP6xoPDLk/OTsaiQoShJUuixW6RA7RlEeJZNpI?=
 =?us-ascii?Q?JZe+HmCMBVhdbDtBc1qmfeTcyc12Ss3PFQVGTmPjE9sZMCUcLTR3XyS1CgHh?=
 =?us-ascii?Q?jrSY0YbEsj4hbDZ+bxG4wCfpSFuDG+KkUr9Xj9RJH64duJh0wbKCiSrMkdYW?=
 =?us-ascii?Q?iT3csG4/pLNjNol3TIFJjZVP3Ct95WQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8B4F3FEC0B0E2342A5F4648025A36CC4@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8abb8dee-9d17-4a43-9bdf-08da47f87769
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2022 20:09:30.7061
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BEudUU0QaBGaHbsoIixAb7AEkN/tMaivIJW7pAbxohGIaSSRGT3rtSUj7jBFD1TuZtM1QIkqhuTedXR8fyNh+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR04MB7706
X-Proofpoint-GUID: ygWZIop-qnBuMlQEXzsfX0XMv4-w9Qz6
X-Proofpoint-ORIG-GUID: ygWZIop-qnBuMlQEXzsfX0XMv4-w9Qz6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-06_06,2022-06-03_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 mlxlogscore=862 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206060080
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "eajames@linux.ibm.com" <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Jun 05, 2022 at 05:04:33PM PDT, Joel Stanley wrote:
>The Rainier device tree is used for all IBM P10 BMCs, which includes
>both Rainier and Everest.
>
>Signed-off-by: Joel Stanley <joel@jms.id.au>
>--
>v2: Preserve sort order in makefile
>
> arch/arm/dts/Makefile                                    | 2 +-
> arch/arm/dts/{ast2600-rainier.dts =3D> ast2600-p10bmc.dts} | 4 ++--
> 2 files changed, 3 insertions(+), 3 deletions(-)
> rename arch/arm/dts/{ast2600-rainier.dts =3D> ast2600-p10bmc.dts} (93%)
>

Reviewed-by: Zev Weiss <zweiss@equinix.com>
