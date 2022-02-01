Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F11934A69B4
	for <lists+openbmc@lfdr.de>; Wed,  2 Feb 2022 02:49:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpPpy5JS4z30Bc
	for <lists+openbmc@lfdr.de>; Wed,  2 Feb 2022 12:48:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=LRseFvpp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com;
 envelope-from=prvs=00311bfbd9=matt.muggeridge2@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256
 header.s=pps0720 header.b=LRseFvpp; dkim-atps=neutral
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnmLn1XPRz2xsq
 for <openbmc@lists.ozlabs.org>; Tue,  1 Feb 2022 11:40:44 +1100 (AEDT)
Received: from pps.filterd (m0150242.ppops.net [127.0.0.1])
 by mx0a-002e3701.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20VK26pX012450;
 Tue, 1 Feb 2022 00:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps0720;
 bh=FAVK5NO35CVbOuoO0wiy30Hf1siuE7h4wrsQ+VKFUAU=;
 b=LRseFvpphz/TF+ZRn/5m4UX2ByO9YSrSNCKKyTNo6dBVoOAppZAZCMM1XYXt5xTeL3u5
 8BXT+XUvDijeA2wuLO8bo7LWvSW7y4cgIKuvlHr0P6/kf+nb/o6/UuYKqbkp1I62Y0Ap
 ZsVhtyc6j3JRpoiplF8PEAcXXhpzyLjcZeua+ifltajPkV135BcMAK2j0qUyRUK1un1M
 ZFInPTt579UiDyH/1Kdsl4GGAPkMEwomCLFWNap5BfYVpdgaz+HBu8MivkyjLIL31oSm
 YDJDumnqc/B2AYN6JycK523Bt++SlBG9WCygT9N7jQmitL2vM90Asf99GbUsg6FiGu/O cw== 
Received: from g2t2352.austin.hpe.com (g2t2352.austin.hpe.com [15.233.44.25])
 by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 3dxjt53cqe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 00:40:41 +0000
Received: from G2W6310.americas.hpqcorp.net (g2w6310.austin.hp.com
 [16.197.64.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g2t2352.austin.hpe.com (Postfix) with ESMTPS id C1CCDA1;
 Tue,  1 Feb 2022 00:40:39 +0000 (UTC)
Received: from G1W8108.americas.hpqcorp.net (2002:10c1:483c::10c1:483c) by
 G2W6310.americas.hpqcorp.net (2002:10c5:4034::10c5:4034) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23; Tue, 1 Feb 2022 00:40:39 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (15.241.52.13) by
 G1W8108.americas.hpqcorp.net (16.193.72.60) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.23 via Frontend Transport; Tue, 1 Feb 2022 00:40:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JiCeJTbt8JhQxz1HP2DO9O8NiV07eja8iqO1F1bo/nBIGSQKss/vB+INIdNL/X1RU1Gv/YAj/C4jpm/LP814PDEodjBkhWcXsL7S8Sm7rpqrJ0WRlgXVWZdEimfNOczG4t41J5T61w2KRYkpvu3VmvvtrqZKGOkgPbxD8J+PiobUcZR4OTF7V82yt527p75SeeqlGx933vBOQA/HqyoporIjVuJdYpody93fWNfFc1NXE120+/Q6ZTwzeM1ipM4+N3shk+ozWZBJLB3EFP3jQZdesS0LF8T3gFP3HDptGmODOMWnsZEH93cnhQdpecBh8tkkcPUsV3zrosVeDsJqrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAVK5NO35CVbOuoO0wiy30Hf1siuE7h4wrsQ+VKFUAU=;
 b=f+OzEAqqSMVAGYFYyr4p3zIE/vnJUaubtWcR9WZfj3Wk0KFZJCrPBNXxV3ZIJtSg35/cEnvQVusN9ERr6rAqD0TccJnxS+0p6wR1U7h5275Eo+3LD36j21bws3dweQr59Q7HibxyB9qkN52oGOVXMp3AAF0VE0/Rya5vfZxAwIL5fS8SHhoxbpFXa3RFqgBVCa9Ke6hKhzPPm5qV+u13Bo9o0j0SPLj3BxJ+NLFncpfAJwQB2dtid/ZZRbFfq40afg1bGKQEQJAJFevlMoEhcsX/UYDrKbQuRYaHppwayX/B9EmDuqtI67hKF732kyccLy9chYcCkYL9Wk4vKRvN9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4e::15) by
 MW5PR84MB2252.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1ca::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Tue, 1 Feb
 2022 00:40:38 +0000
Received: from DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::85e9:f9c7:b56f:cdb4]) by DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::85e9:f9c7:b56f:cdb4%4]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 00:40:38 +0000
From: "Muggeridge, Matt" <matt.muggeridge2@hpe.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: RE: OpenBMC v2.10/Hardknott status please
Thread-Topic: OpenBMC v2.10/Hardknott status please
Thread-Index: AdgWXbcymuo4TS1MSrmNNiFwvQzB+QAUvz0AAAo9HJAABvZVgAACP/pA
Date: Tue, 1 Feb 2022 00:40:38 +0000
Message-ID: <DM4PR84MB1855EFA80B04010BEE80ED3CD8269@DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM>
References: <DM4PR84MB1855478F75965FD5275971E6D8259@DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM>
 <Yff1OKHtWj+xN7HN@heinlein>
 <DM4PR84MB1855BB4EEAB345B6A0FDB8E2D8259@DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM>
 <Yfhop9g2lX+DZ5iN@heinlein>
In-Reply-To: <Yfhop9g2lX+DZ5iN@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 747c42d9-a2c5-46ae-8a77-08d9e51b7784
x-ms-traffictypediagnostic: MW5PR84MB2252:EE_
x-microsoft-antispam-prvs: <MW5PR84MB22524130C724371E267689CDD8269@MW5PR84MB2252.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gLqdT4rcaZHaeFv/2SzW/H0wjz3vIKcKMx6IGUIky5HouQhCIoOuFZNgKUg7mMUrdXLCmacpTc//nswz4PB8iSKdQmo+UKKYwG0S/8x+Y6THxqRaTtR0nykkHU9/RyA96wvz5cUhlnHlpdLU9VOmmwTMH1tuXjsZcfFe7SXOyYpJMBjZB2v7ZcyKjGmuDocgrcugajEW2+agMf/O2HdkkLZ1AkVLFEZ82cUAZmLl9AKJjeu/U1nAjvebn/zQ+LEg1aauslK6nHxA4OHg7fnQp9GRUVqT/iZEhHyN8m7XauPp51YG8LtwZHD4kZkPj0P7MoOf07HrF/2dveDwCyiaBkdtVRCGdQMvGNVnlt5umqTq8RwGqbLBgtCo/WV2NM3d5SZbeB5N3L6yUCJ+vfz0taAcv1onA+Y2VR9O+AUHLsPerT6bn42h8eMGxfgW/ZeI17poEf3X2yB9jQWO21t2QFg6pqgr/ZAJzd+wyd0/t3ZO6wZSkyHJB7ORTAOJe8XmdpOTB/H2b65+4Y9jXacvQhZd2ts0xdWsC/b1QFzOB/W5J77sF9cAodj0mo+efeIkxoH+/jlnbdQS+AWfwPI/sWv6IJ9QErYlX64AZQH3jq7rao74oTsNQt+rtiLjA05khNSqT/3zYxPnO0m/FMRpxo0vH54N7mj4LbiVF52eucBO7/9EG8oeobHdrJp7HsaaiK9JgToMq2ydH4Ifkc5dMq/gY4MAkLhXKEGWWtFHQjMQA9jiTCmQa9f7L9gB5YrO0zti2pHeW+54GjX7dCzaYrGBac6BYNNwiPav583GzeI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(82960400001)(186003)(122000001)(71200400001)(6916009)(966005)(4744005)(316002)(38100700002)(508600001)(5660300002)(55016003)(33656002)(52536014)(38070700005)(53546011)(86362001)(7696005)(9686003)(2906002)(6506007)(83380400001)(76116006)(8936002)(8676002)(4326008)(66446008)(64756008)(66946007)(66476007)(66556008)(20210929001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wNbudG6D/soZoddy3yYK/8wnQPqRfAmUrdMFMLIo9XzXKTjcq8+O2p0IBbL2?=
 =?us-ascii?Q?7tXXxEqwLJc/DCBskD/4EwXbylfeRk0f3pqZqi5eh9+QUbISI9mSJTlCvCJY?=
 =?us-ascii?Q?MZRZcEUr/KrT9dMnIe/Y+N6rIXTWYObJqf/EAGd6ObXUIzdwwPHZok9mlcc2?=
 =?us-ascii?Q?BzeFeHqq8o79ciyk+4+GAfY1QLZ2cftouOzL8Jn2DShm3EaA7VwxoDEz+rjP?=
 =?us-ascii?Q?NKPehq66W5G/49C8/JYwKmGHC3R5PbFD3/7hibKivCy01N98IsgZwlXGOYZn?=
 =?us-ascii?Q?C71lgh1S0ju0ybVCULVvT0sqOhs4A/tnnMPG/AQRCEl2Bq5uadF6mZDG69MT?=
 =?us-ascii?Q?HHx/K9LC4Wr96bpxpYanFf6fJLoOzdNTx6arpZSOWxy49uTlAriFVHGq5Hj/?=
 =?us-ascii?Q?aNHsk5RRvGBIjDZZ+BBhk9xgFi0Q4oMK/sYdh3qO76+KD9diWUfcNa5K0Gh3?=
 =?us-ascii?Q?4VP3BJVwfUR1F8uMpmutRGH5Xg2paGlrl8uGnZ9cu4wXyCi5WjyIFtUxnxER?=
 =?us-ascii?Q?P9Yq9mrGBsiGoSTPDLyJ1eOZeYE5/KvsfybmYJWYyGNfeC+CasCWxURZItZC?=
 =?us-ascii?Q?LuxZVicQ8jgicA2dgNh/24zRvLSTZG6IyDhukqC4SEUkMzapTSAtdsl/49o5?=
 =?us-ascii?Q?mXyO6aajfaw6yr+9ZIQeklLll9njCw7oxV5vy1MexwppHnZdVbBCMPieDJ6B?=
 =?us-ascii?Q?YFJeAXymg7MeicQ5kctTfWf006/XZ81i+n6LSQmzhI48PWe9070yUeiFqFr5?=
 =?us-ascii?Q?VEbJd4PVeXAvFQ76nZgYLx0yp7hOh586WVGSzKesrA8tR4NXEv2UzYG6qLAZ?=
 =?us-ascii?Q?onHYDNpD8eWM2VoS2rW9sDwaAlHvsmVa5TK3MiCwIl+M81uWuFqky/ktg9Kx?=
 =?us-ascii?Q?Zgldy46oBB5zjc2eGTLOhl7NzTDE+rH34wJHCJ5syMN4eLAQ8UYpceDLWT39?=
 =?us-ascii?Q?13EGxFiGl11eYDia9C5pGm4rl8ZS1iq9etzvOSYEWrcXP2dQHHIMZfI2tj1H?=
 =?us-ascii?Q?QaOqNIwzQoGvWrT96hl4ZWeNGfaQjQ4moRumjn/bQadESLPEtE2uWvuNqSD/?=
 =?us-ascii?Q?/JrvZnBohi7APWfl7k8BxQg+rDqzv9+raAZHYB5fFFAdi9AjgPGS085GzHGB?=
 =?us-ascii?Q?AU+vd//OrpnZyVzElvLm/YONVojQfajyOMVuWLXFHaD0TYnzWFu5nDXlsahS?=
 =?us-ascii?Q?45apKkQUEHAcgFNkJ8OdvBz6Epbf1LOyq5GSfq9APJLvfyOnzjFjlpkBTwDu?=
 =?us-ascii?Q?kHvMeggJFyXsSIRh/qcTX4JMmSu3cG4p1ftgVBChh5dIHP34gpBB5VYLVKdr?=
 =?us-ascii?Q?vij6PT06+p9i7hAjNYHjP/TdwtxqaP4C+kp5OOVHByUUtPXogkUfGbZ/gUbH?=
 =?us-ascii?Q?4bEbMW22qDWpg0sadhPivI9f46Sw4d3hbRBmIN0euDa05XHNFVhYqT1aOkbb?=
 =?us-ascii?Q?/+s20Btgm9j/5SHtS4Zs4CEwUoeOP2N7FpTdIqKfeHWQRlsy84andSvWrPFn?=
 =?us-ascii?Q?t85dn3fNuf3iR4iVKHKlYStXaq+bHdXRX2l5VLi/o/esOblZVUaQyRSlsdWS?=
 =?us-ascii?Q?FGeeshwrrUabVgdSNGcQdT3YpjqmHGjI3AF1zja4y69gS/jxoyUcInlgICpu?=
 =?us-ascii?Q?HqIUfQhfiZN+Gmomgilfskdoqey5+fYAtTFgDWp4iivI87poE01KHFn5oSTU?=
 =?us-ascii?Q?Dokn1WisKDJWZMw8Jihbv/vPowSlSXiPJOK0h/xEyUj+G03x394VY29FeLub?=
 =?us-ascii?Q?HT666x4dyg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 747c42d9-a2c5-46ae-8a77-08d9e51b7784
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2022 00:40:38.0439 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1FOSHVRi+BBA2g/U44P6mv0nXWiwsqVio2ZD4sx0WZrpKegheizZTtn6ega6LH8/y60r7vhXHq2MdQLlkp+atzo4gjQ9/F5t4OUoA9s6RXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR84MB2252
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: dOSVN_elCcDUSzmgKyroVeY4XWr6aK9f
X-Proofpoint-ORIG-GUID: dOSVN_elCcDUSzmgKyroVeY4XWr6aK9f
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_07,2022-01-31_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=815
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202010001
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
> Sent: Tuesday, 1 February 2022 8:55 AM
> To: Muggeridge, Matt <matt.muggeridge2@hpe.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: OpenBMC v2.10/Hardknott status please
>=20
> On Mon, Jan 31, 2022 at 09:01:31PM +0000, Muggeridge, Matt wrote:
>=20
> > - The 5.15 kernel is in OpenBMC/master, which I guess will be branched
> > as kirkstone sometime from June (based on historically OpenBMC
> > releases branch ~3mo after Yocto release).
>=20
> FWIW, our honister branch, which should become 2.11 if we ever make that
> tag, is also using the 5.15 kernel.
>=20

That is interesting!  How do I determine which version of the kernel is inc=
luded in which version of OpenBMC?

I had been checking the poky.conf file for PREFERRED_VERSION, but for honis=
ter that shows as 5.14. (e.g. see https://github.com/openbmc/openbmc/blob/h=
onister/poky/meta-poky/conf/distro/poky.conf#L22)

> --
> Patrick Williams
