Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C73C34A69B7
	for <lists+openbmc@lfdr.de>; Wed,  2 Feb 2022 02:50:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpPrF4R9Xz3bWG
	for <lists+openbmc@lfdr.de>; Wed,  2 Feb 2022 12:50:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=oFKE//ai;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com;
 envelope-from=prvs=00311bfbd9=matt.muggeridge2@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256
 header.s=pps0720 header.b=oFKE//ai; dkim-atps=neutral
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com
 [148.163.143.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpGNQ5WCLz30hm
 for <openbmc@lists.ozlabs.org>; Wed,  2 Feb 2022 07:13:50 +1100 (AEDT)
Received: from pps.filterd (m0150244.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 211JeCHQ021588;
 Tue, 1 Feb 2022 20:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps0720;
 bh=BMHSuqVeFCB37bjzpWeeTwhMyiLjSCocQKsBlm34Kg4=;
 b=oFKE//aifuuuxeOEwDVVsXzpADbK/MrlvI7YZzfehEV0+NOfeDVnGZolXcPH27ztaXUW
 QLMfMq94s9wMdxvSrq1IlBg4uhvSQ++froQ1OXQiKfhhqZP48NfsGFlofsU2eL42v8bA
 jcnK2DfaOWz5F23x31lDaP1pvyz1GGim2biwDhgf7dBJWkqZP7+nbHHbKYS3AZX1g+MN
 Gek2/YmYQ24Ltxp9/zIojJEyntrWIeeYyR5p79tr6nmwIOtp0MMh6h7o6nWiBP8kW+q2
 VOuvUGDBy3I16sbG5ZU1E6o5GM1MVkNvhz05jAbtLFilIiIyAQ9XCvwG199StyUN8nJN Dw== 
Received: from g2t2354.austin.hpe.com (g2t2354.austin.hpe.com [15.233.44.27])
 by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3dy9fb9227-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 20:13:46 +0000
Received: from G9W9210.americas.hpqcorp.net (g9w9210.houston.hpecorp.net
 [16.220.66.155])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g2t2354.austin.hpe.com (Postfix) with ESMTPS id E296BAC;
 Tue,  1 Feb 2022 20:13:45 +0000 (UTC)
Received: from G4W10204.americas.hpqcorp.net (2002:10cf:5210::10cf:5210) by
 G9W9210.americas.hpqcorp.net (2002:10dc:429b::10dc:429b) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23; Tue, 1 Feb 2022 20:13:45 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (15.241.52.12) by
 G4W10204.americas.hpqcorp.net (16.207.82.16) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.23 via Frontend Transport; Tue, 1 Feb 2022 20:13:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l1bpPshYlrO7oyaqpkM5t/F2qJXuRjinbYDhtXIcR847ps/lg9O7X3GnWziM+d7od/UPgf2t3YYcejpoRqJqAnE9HfdvFaDTkcMwucD++NfwS9N3Mw/ly7IypEPZysj+8RFg9sSWuR5poLSOKMdXwJro027JeVmDJiLMzBhgIROAtr6XT1opMnvatDsU3Vmh8/gUciioOSm2v5Rmmpf9dZ1GnT5bmlZGaug9FMioEjKZYjbNx12njJp7oanXvfT8ZsXm0etnVZspxDCjRp2Haj9gOiS09hLqV64B3ywNz3x1gxGmvIRyOfE4YDW2/nHpxoCK71HV0FHWJPfQWcexug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bq4H0OAhqZ0z/aNXgobTPEWANqOxZtcwWL9YKZ/qnuc=;
 b=MXEzwFCPy4NAZddFlW0/5T0IRG3SHncl4Sv1ZE7rlVg+yBS5NtTNmophHYpjkgTIFmysNmdC4OkKFe+yKTR/zSXexL7EQxxi6eCwZ+u3MyRRrPfWLwNoO2cAJkq0yxovfCkMhJf/4IUFD0CqzTJKPCxoOhozgBVsYchzyXZTdY7/tPwwHwyez2/OTZx4IzlarPxit2TlBucQA0S/W4F+llelh1kDnisznsBWc8DxLXcey3rhTbamYkZvbQ3NobcS5+iPF7D5sX7xBf57b/ouAqsbnTfB6WVk7IEMwtlQ3exSf2MWU/c0lUhqw7CRmDTwEkUZg6InGwJeaSC4Moy5SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4e::15) by
 PH7PR84MB1792.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:156::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.22; Tue, 1 Feb
 2022 20:13:44 +0000
Received: from DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::85e9:f9c7:b56f:cdb4]) by DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::85e9:f9c7:b56f:cdb4%4]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 20:13:44 +0000
From: "Muggeridge, Matt" <matt.muggeridge2@hpe.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: RE: OpenBMC v2.10/Hardknott status please
Thread-Topic: OpenBMC v2.10/Hardknott status please
Thread-Index: AdgWXbcymuo4TS1MSrmNNiFwvQzB+QAUvz0AAAo9HJAABvZVgAACP/pAACQ64oAABSpCwA==
Date: Tue, 1 Feb 2022 20:13:44 +0000
Message-ID: <DM4PR84MB1855B1748C5A8923186C9DB4D8269@DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM>
References: <DM4PR84MB1855478F75965FD5275971E6D8259@DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM>
 <Yff1OKHtWj+xN7HN@heinlein>
 <DM4PR84MB1855BB4EEAB345B6A0FDB8E2D8259@DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM>
 <Yfhop9g2lX+DZ5iN@heinlein>
 <DM4PR84MB1855EFA80B04010BEE80ED3CD8269@DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM>
 <Yflq4zasxDJrQXgw@heinlein>
In-Reply-To: <Yflq4zasxDJrQXgw@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec7a599b-43f7-44e1-62c4-08d9e5bf58e2
x-ms-traffictypediagnostic: PH7PR84MB1792:EE_
x-microsoft-antispam-prvs: <PH7PR84MB179228E2B7C5384549A9CD06D8269@PH7PR84MB1792.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9D8HqTPtxM5dZQ5b2S35aBURP7Ufp8MdiqsB/LPVXS3OF0RozuryFrRs9xFbthduxWmnWn5aJUmsgmuvyJSCDTrirEHrOC4Cz/yqi68sn3C0fqn8LvLT60bJRri+TXHFzZHR0k53wuWore7prcfj20jNAjgc8n1650h1hekpp2XDyQoCJLp8X9S768c0obL74rqgdKhK/Te8rWKvFRoXFMBeB/XIYw0apKmXqsgSEIvuh8gMHnt7OfKkgN7iQBv3bxMo16KYmoPMb/V3GAe4dTLK31Bg1/M6FYgyHpt83qcDvWrmxIwqlLDvfNIH889jCwKYaiGGPlL2K8RDfnqFhAP3pHXhsqOt56diX74vCPA+lNc/MeVnU5kpRcKpceexz0g2/uNkzhm4u6i8GQ7S9hzHnN3JL6sTazLrMskTxUSVwQCp2OY+o1H9BPzqgeiHyjcbp968QFn0qEHdkQQnJjnFiW3pY2C9Y1z737yM9kpYjQLegFb2H2kUuZy67uplhIqbfXT807nvIxu0NhEGFVSL9TLYadChXXOedEPfJWC/qgzhwIX+/sMdBad2GcF81LJAXNLLXMPgXCU4+eEWvZbavy6qRRDdMgOZHaW5PSxYkfpMOVLVMJnMYcngJI2suEhyIiD8Fs7ebza1sodpoj4XP7Y3y+uhMiYFtppCmmu9thNzEat4xKCZFWxomjPxs9SenoJ/LIt/ZX7CeISxoOep2MNNk1fmE0O9ogfbhWMjYdduFclIUU0F0InYSU9xN0JBVuQIjvpF9QFUQuqRz6QmqWFKAVpnmHR9ShhKDhCLaHiQSFfCye+6Urrd0XlpeuSult7UMrJkYx2+ImvgTg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(82960400001)(38070700005)(66476007)(6916009)(38100700002)(508600001)(66556008)(76116006)(86362001)(316002)(122000001)(966005)(66946007)(64756008)(55016003)(8676002)(4326008)(8936002)(71200400001)(66446008)(7696005)(2906002)(5660300002)(6506007)(33656002)(53546011)(52536014)(83380400001)(9686003)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VEDhCpAKPNjIRzAKHruONwl1eHIn2/mAlai+NhdBCUTZSGb7H31j2rBM+riK?=
 =?us-ascii?Q?Kw7NyIKp5y72KBkEne4YZW+8j8ZgfwidEJP7QuNd+iU1qBglEkqwDqNaktu2?=
 =?us-ascii?Q?x4PJMU4CYhD8bBuv5ERa8ojp7W9/cWpVf9J/9NQa4/8lb7pIuXpy0IS6+jII?=
 =?us-ascii?Q?ABTZBciOVPjOLp8X0hETl53KF9AIa3a49WNz5Xan1F7EITn3LpSmKwdV5DCY?=
 =?us-ascii?Q?cg0cRXJMdeVji6mvjLhRX1z4T4yC4xtx0rEEKCeQxdZujW83AkkfrHOGpdtq?=
 =?us-ascii?Q?FvpQsc1DVPYFPX7N8reSSS0rvbRSAWeYDHlnej5y7njsoTMpQ5BKlddPr6rB?=
 =?us-ascii?Q?M4BuVv3Jwh5xRP9aV6vBmdbeo59vl4JLZXqotZ1o38TT+YSbLdCBkPNTsNcL?=
 =?us-ascii?Q?fAe+KFmlS+OqXQsTqLSOV/wZogb5vma2OW4uxf+RDF6MelxJLLfHrX7vQR3C?=
 =?us-ascii?Q?Lgk5/VGJzrllbPJJSxr+cR/+MHzhhnqoM/j8NRKjS9IGHx5BqO/hcLhzDFzx?=
 =?us-ascii?Q?acj95vmw4HMKzRBnv4N9kppzJ/vrv0e8Fd4w2dKGI5cX0dAnSx4hGI5w2Mtl?=
 =?us-ascii?Q?pB+KXDX3jYmNYFApm+Xt0kT6cZjDV9N//lOoyCL6Pftx0fs9Z9obsufj+alK?=
 =?us-ascii?Q?Trubu9iW+1TKZzzDVlOoYJ74npfiojoyfRYMtEc9IY83mtmMkB73DjhdgudK?=
 =?us-ascii?Q?hBT/ERN8kXuaWzkJfkIn9lBUtdqk9m94SVy6wG2aKzobX2UM986P+TM7z5At?=
 =?us-ascii?Q?lKDleipmQu6nJHlqkfOew25DNzjU3rPGVOl/H8cz1R3+vGgUyNL/8fF882pq?=
 =?us-ascii?Q?AV1T4dLUMWuN9pDcD+kGU6NGVEAi6V5VDFI8xyRw66x6QfncpulorahmIUoA?=
 =?us-ascii?Q?FE/odbobmzsLAIAuzkGBZOJjGuUe9Uu5FmgtxgkRyXCDjVdRn0TJ39MEv/7o?=
 =?us-ascii?Q?FZy+oZ/6nNUeGOfGsGXbSc4QSvSsXteYz74LJLfG7JYenajVTB7/iFR8x0bG?=
 =?us-ascii?Q?V/6mORmScMFejSRlLn8RyqmR4/MrUiNsfkgnNHnqdjxI9tVoirKvcSCuS/U9?=
 =?us-ascii?Q?W0AYIcPXaDXfmlHasY0PGb14/n4j5Zx/JkSrfvn8AIXDM6alwD+n7vsT+HIS?=
 =?us-ascii?Q?i8/rEJbZHIdGs1UeKOcCb8vex/6uSToMdSoloiW3/PfduuyCI6gQKo7mHjWX?=
 =?us-ascii?Q?mcGt69ZIQcC6HhtmS6SCkFjcTI+ahcGxtf+Qzz1tLoFQN4CnW65m+z9zaJNm?=
 =?us-ascii?Q?maLk5ZpFJJM45Mc5XJQX6MS99TKjf9W05lKkuJMzNLwViBZnMtbQONlYsaRH?=
 =?us-ascii?Q?kxXo/ueHAAUFJeRGQidMEtqxcUbUTI644b0cXTx4mJKtMg888nhCG27W+4Fb?=
 =?us-ascii?Q?O2hpofgJZHi5e4zi0HXHVfpLKFJy0QhqNwh+FV3swIFMoOyroS8Y3cozy/ZG?=
 =?us-ascii?Q?LmfGJ1XGoAAw9MFIfxBBkQkLSnZs7AKXfH50whBWXxr4cBBBXYcmuLSJpw+/?=
 =?us-ascii?Q?itQhJoQ85QX4vr+CK1UsrHZhCFw4rDmLNIIHgo4tb/LFSxxFZMVliMic/Qoc?=
 =?us-ascii?Q?RSoCMmc3h/ztdo98ujvv5nWEj9zCqKfoBeiabx4TLtBxGx811V1nEtgqRaVc?=
 =?us-ascii?Q?VRkj4cOWjRepYXbwjgk9pW8zEiV90QX8jGg4NIPkUkyVo48SpxNtkZB4uGQB?=
 =?us-ascii?Q?Of5DGmtJuLGh1KmlW4w0z0U+H3+qsBTgD8oez/f9Mmr/jZqSR0/qUyefOOs9?=
 =?us-ascii?Q?Fzs610r7vQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ec7a599b-43f7-44e1-62c4-08d9e5bf58e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2022 20:13:44.0975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y7VgB0d/64OjwAw/9aiq74b4CrOxaB0xNpflOyfAXThbd4DTUNEC20NMC+eJPMdGkAxoJDwO+/DtxLYMd5MIBT681HhhCTOFGVuQ1t4ZgS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR84MB1792
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: 6kis53WZF0FJ6FbdLGTqxr722YgaMDD-
X-Proofpoint-ORIG-GUID: 6kis53WZF0FJ6FbdLGTqxr722YgaMDD-
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-01_09,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=977 mlxscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202010113
X-Mailman-Approved-At: Wed, 02 Feb 2022 12:48:36 +1100
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



> -----Original Message-----
> From: Patrick Williams <patrick@stwcx.xyz>
> Sent: Wednesday, 2 February 2022 3:16 AM
> To: Muggeridge, Matt <matt.muggeridge2@hpe.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: OpenBMC v2.10/Hardknott status please
>=20
> On Tue, Feb 01, 2022 at 12:40:38AM +0000, Muggeridge, Matt wrote:
> > > > - The 5.15 kernel is in OpenBMC/master, which I guess will be
> > > > branched as kirkstone sometime from June (based on historically
> > > > OpenBMC releases branch ~3mo after Yocto release).
> > >
> > > FWIW, our honister branch, which should become 2.11 if we ever make
> > > that tag, is also using the 5.15 kernel.
> > >
> >
> > That is interesting!  How do I determine which version of the kernel is
> included in which version of OpenBMC?
> >
> > I had been checking the poky.conf file for PREFERRED_VERSION, but for
> > honister that shows as 5.14. (e.g. see
> > https://github.com/openbmc/openbmc/blob/honister/poky/meta-poky/conf/d
> > istro/poky.conf#L22)
>=20
> Uh, I guess I didn't even think to check how you decided that we were usi=
ng
> 5.10 for our 2.10 branch.  I don't think anyone in OpenBMC uses the
> default/vanilla kernel tree from upstream Yocto/poky, which is what you're
> looking at there.
>=20
> You'll want to look at the meta-aspeed or meta-nuvoton depending on your
> hardware.
>=20
> - 2.9 aspeed is on 5.10.36:
>     -
> https://github.com/openbmc/openbmc/blob/d767d3fb1ba70f03e0e212c24f414
> 04f1248f660/meta-aspeed/recipes-kernel/linux/linux-aspeed_git.bb#L2
> - 2.10 aspeed is on 5.15.5:
>     -
> https://github.com/openbmc/openbmc/blob/415294223a164a804e31e39c9004
> 3d15e9b153de/meta-aspeed/recipes-kernel/linux/linux-aspeed_git.bb#L2
> - 2.11/master aspeed is on 5.15.18:
>     -
> https://github.com/openbmc/openbmc/blob/9a2a1dade6b355dafe6e72cfb2673
> 2ca5e12587f/meta-aspeed/recipes-kernel/linux/linux-aspeed_git.bb#L2
>=20
> Nuvoton might be slightly different.  Surprisingly they are on the 5.14 b=
ranch in
> master.  I currently only use Aspeed hardware so that's what I pay attent=
ion to.
>=20
> Since you have a HPE email address, I assume you don't even care about
> Aspeed or Nuvoton but really care about your own GXP hardware, so none of
> this is even relevant to you.  You're going to have to get your drivers
> upstreamed and then backported into one of our kernel trees.  I don't thi=
nk Joel
> is maintaining the 5.10.x tree, so if for some reason you really want to =
backport
> onto that you're probably going to have to have a discussion with him abo=
ut
> how to do maintenance.  The simplest path is going to be to be on 5.15 li=
ke
> Aspeed / master is.
>=20

Thanks again Patrick.  Good info!  Agreed that 5.15 is highly desirable.

> --
> Patrick Williams
