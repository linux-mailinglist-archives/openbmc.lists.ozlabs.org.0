Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E98077C5B21
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 20:20:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=adw/P2H1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S5LfC6K6Pz3cdV
	for <lists+openbmc@lfdr.de>; Thu, 12 Oct 2023 05:20:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=adw/P2H1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=equinix.com (client-ip=148.163.148.236; helo=mx0a-00268f01.pphosted.com; envelope-from=prvs=56483bf19b=zweiss@equinix.com; receiver=lists.ozlabs.org)
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com [148.163.148.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S5Ldb6tmCz3bZ1
	for <openbmc@lists.ozlabs.org>; Thu, 12 Oct 2023 05:19:30 +1100 (AEDT)
Received: from pps.filterd (m0165119.ppops.net [127.0.0.1])
	by mx0a-00268f01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39BHmT7i012900;
	Wed, 11 Oct 2023 18:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=SZ6Hpu6QgjBMqJG08JQbRpaGPhiO85+hte9B8HpAPm0=;
 b=adw/P2H1R3Gl130zTw1LEz71h0fr6TFGHpDhq+UELCMaJ5bgwNE+MtUGESyHG4Lvw6q+
 9GcuSEY7NKZdVdAl2GkrTa5F3XmqoU66NHxtNeT/5JZfAl0pDoq3OzawfdfV4DWGaVBw
 fnJCHxq9Qh1Vw664IWaYCl4Yd2Y3Y5u2s5J5p3/XOQDOJrMBtD8Un9sM5/mvb+GbvuBO
 XcbYeOHh/GFhm0nNTEhRoIIhBStT7hGw3/FcmOOkw/Riq8LSyaYFAUr/ZHrsDkWII+Al
 f9YY/MCEcw6fwfk4e2ZwnXtW1PzgTME31EZqkZi3CmN93VASyhfyrObd7VHI274axJqI bg== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
	by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3tnvrthc86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 18:19:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YE+YxPLArN/rSchOzP493r4UI05Nu81rsDyERzPGLu6g42z3V6HcMizwCv3IOPqFLghzzb8y/rxo8mjsbF3JWqTPIHW/rJxd9XCk7xBe0p9c3Y5NUSGmnwE5sOIGR5oQGmP5P8ePpqOKqkAtXh2U8YhhFs4uteGFOrNEram7jlRF18yYBFGnKx/AtJPawdcHT391xTsEk1LftfdFJoa0J4U/84mImgQYz3M3wvvb74Tq5mnEZDE5piOple6BgS78emZU7m7Jb6exFhXowh0x9PZLrxADsEYOoCxsMbgxy7PuyvGHVu73ZKE1JBu1hC4jANs1iDe6ucKjdBHh1paPvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SZ6Hpu6QgjBMqJG08JQbRpaGPhiO85+hte9B8HpAPm0=;
 b=aQdiuD9R+YyvVjdmWJMR15ny6UL4H0g5VEuO/jsH5npTYCHqiy3rYuidxIcx2LjlrKihJbmPqgSJeD4cO/QDgErfZq5ZnuUJWVMhmHs+tsrH27zWKC/lcFNcf2kVNw40VSO9pVCK6B60FvW2leCiT5esCulnvqr7IdjDOO3BYda6N1pvymgRKlPrFjNh67Marm/x7rAucYUev/b+t73WwHltlbyea7IKGBFwbLCrlpNJdp/tyibhBdxb1fU3i5eNwgf6DG7Vgq+vv4RIVNkyxJQZc7Ldeww+CSNcmbNl1J7b+wE8RbLPbZ5BWJeKaGqg35j+JuSP0RXNalrYUBWkgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from CO6PR04MB7843.namprd04.prod.outlook.com (2603:10b6:5:35f::22)
 by BN8PR04MB6403.namprd04.prod.outlook.com (2603:10b6:408:dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.17; Wed, 11 Oct
 2023 18:19:09 +0000
Received: from CO6PR04MB7843.namprd04.prod.outlook.com
 ([fe80::97ed:a6ad:42f1:9559]) by CO6PR04MB7843.namprd04.prod.outlook.com
 ([fe80::97ed:a6ad:42f1:9559%4]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 18:19:09 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 2/2] watchdog: aspeed: Add support for aspeed,reset-mask
 DT property
Thread-Topic: [PATCH 2/2] watchdog: aspeed: Add support for aspeed,reset-mask
 DT property
Thread-Index: AQHZ/G9tblq8T/MA3E+QMMjvccu1TA==
Date: Wed, 11 Oct 2023 18:19:09 +0000
Message-ID: <20231011181909.GK19997@packtop>
References: <20230922104231.1434-4-zev@bewilderbeest.net>
 <20230922104231.1434-6-zev@bewilderbeest.net>
 <CACPK8Xe5UEDt+ko_FtF-fi1TZDNZeZMtzaU_ZBxt6CO+UHJEpg@mail.gmail.com>
In-Reply-To:  <CACPK8Xe5UEDt+ko_FtF-fi1TZDNZeZMtzaU_ZBxt6CO+UHJEpg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR04MB7843:EE_|BN8PR04MB6403:EE_
x-ms-office365-filtering-correlation-id: 7cd06e8c-cf98-4ddc-4960-08dbca869041
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  zeRuC/gRQ6RhsK60KTzeLpR+eKcl4fp0nUBBKuV+BwGXpzbY8ZNsjPugzNG2uKBDtbixh9nnFEnvpPp+R9tHHrQ5eLQ3XaMUggHSFmhy3F8qvAZDAAHyZN2DC/eLFdOxcAKGcJBRu2COyIWqiI89qBc9pNfywm936yyGnRgurWIevq2SxBO6PFgLrUQfg/Z2OGZsqcPQDs3QlelI08YQ2CY0V5S9fgsXXzYqXDXaqsNp6XFQH7ntsdI42GRiAVjz8vkLkl02aNQirlHX3KoJZD9+7YLQXKtEedCpiOxxVxd38TzEwY0rjE/7YRHbZ1p9IxtlLKitZjEXA3BT43sm9t3vMfiSRG+Cyilb99NWeyQcC7MEhyOg9arPWcC7paZbtB4AUJwTy4Edf5vdfZPHaV1l2nEwPbOjVRUGo8C7MrVTq/KDYZfx24Pmlm2M3IrozzF/sCQfMD4tXCGgtqobIVzPZo7mug7YZMAyFbn5iIct6x69JHz5/6ABNcJIn+nJHddIY7KYWXzEInNPVbM8XJ43gI7sN5OA+ILdtMIfWIhXwX1cv6VCqDDM0+BArfyYbHYDWgsez/4R3uXV/SgckXaqVkfU04nuo3F5Dpxn1TacTtbujh0lxoTm980xllwW
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR04MB7843.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(376002)(136003)(396003)(39860400002)(346002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(91956017)(478600001)(6486002)(71200400001)(86362001)(33716001)(6512007)(9686003)(6506007)(33656002)(1076003)(38100700002)(41300700001)(5660300002)(64756008)(66946007)(66556008)(66476007)(66446008)(54906003)(76116006)(316002)(6916009)(7416002)(38070700005)(8936002)(8676002)(4326008)(2906002)(122000001)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?te7qA/NoNntL6ZEmWBw7Yo6uwG6QCLESm+UKcdpdJUaEv4QO1wPdOlzqIP?=
 =?iso-8859-1?Q?knqLOX+ATPP7/fn4tR/9MZd2bwz7nvkbldaC9uJXxfYrPhcu0yWNE9cqSm?=
 =?iso-8859-1?Q?LCPRQNIqLkbp81hM6upOEj7ylyaj9fz6gspz6oMOAFut1ed/0XnHJMT2Qp?=
 =?iso-8859-1?Q?LeZrxcG94NxniJ6uscyLzNnAb0x7ou36rLcGLWQwAXP+fIJSpeV35RFwtX?=
 =?iso-8859-1?Q?BCDNRYwgUW2T2Kvd1H4DnS2FBYk+bQ8Gbhrh9DsGhdTpHwa6WMLmPXCWUM?=
 =?iso-8859-1?Q?5IiZZYNWKjjaK32lSYQs1ewYmCWAttTIrdyHKDWZVtqx6xYTo8a57cPXsH?=
 =?iso-8859-1?Q?nRfMxmhGcLJVocGnbPw5NQsCT7zvZ6DlgBZLAioqdiaBuiYVeVlHVP1PKJ?=
 =?iso-8859-1?Q?Ut8DjLmLU5XujycbmE9kDP9vQa/zyC+QqdEFiHpVnBAzyFD9EJC96ZxNDX?=
 =?iso-8859-1?Q?kUR6cNNnfG4ZPBX8snTTSPaKto0JlzIjfQtsizZveUJDNTDpY7ugYvnq/4?=
 =?iso-8859-1?Q?BhXtZbBkKyt9bG1cHyJCm2eyr8UugUpeSh48nYNQq+H0UbkpuOyMLqqWm4?=
 =?iso-8859-1?Q?6+1cL7x78AYXuS7vKpdCY9fsRxAHh/lVgLgsNCc8s98aBKkkqigDdNV1wF?=
 =?iso-8859-1?Q?TvjAbeaaUs5jyjWLpQtnMeVzV8MN0CbuT8FuFaksbsrookmrlT7xvWHpUo?=
 =?iso-8859-1?Q?3b579Zo/wKtSK5bZVTLEVKwwyfcg+O527STlWyhOXc3s7FOizyuWmP/QQG?=
 =?iso-8859-1?Q?A4Xjr2wlcSG+G1r1Tp4xFBq3Im/x6J2nMUKsTxY9Mn8+n0aBMBIvUOA4jX?=
 =?iso-8859-1?Q?xqWFLmUBnZC2ULiJQ7h5+NeV5YE5ZGIJ01QWmsChU1W2CE9WzKgGfq9+TF?=
 =?iso-8859-1?Q?zzlq4FobaKuVTp0JZVAKwVvk/X1gL9DXOqg31X6duryc/3nUgIdwa+zf6m?=
 =?iso-8859-1?Q?FmsC9LD8YbpW6DNcobdRLACiWT4uPjziZHZDPjX7ZfIxsOibHiOfphB/zs?=
 =?iso-8859-1?Q?jy/T+7QkDse/hKQOm2AKFhAlA525inpmtkZgWLrxHZIFMwfXdgGZMQNpTQ?=
 =?iso-8859-1?Q?JpyFOwOpoir1y7rCaUbKuo3QiidyN30l+wu5hxIOJWIbX6WTSwVAvwJoWk?=
 =?iso-8859-1?Q?1QF1CB16wLHZDt2HJVCX1eD3FxmHoq7WeGLKAjgDxLGoleM8sCBD4nCwUg?=
 =?iso-8859-1?Q?/qdG/H6/DxlU79HnKeah/b4KyKYENW1En4hQTECVZvbJdolhv+kjYM9Zui?=
 =?iso-8859-1?Q?Yvxm7MyxN0UrHQPexmAo9TiXAewkv0nlSbkQqOXJy/QkDjMCpM0V803k7e?=
 =?iso-8859-1?Q?77DqdeQ+6bRj8mcEDjHdt2h5u6ZLq8dsthv7M/L3isOemnPtHRRqtjksW6?=
 =?iso-8859-1?Q?UphVXE9m7fAVCyQrxjpw21Z/dDdwA5hrTjlb/+zRbG7wey6SZJCsaLtp1t?=
 =?iso-8859-1?Q?IVTIuw5tOpVK5vQtwPKsFFin6VSkDDPFXycPEE7zti85WU45amUcCy2PVX?=
 =?iso-8859-1?Q?ibxaAV4KztOP3TMRtOuvC0SrhHR8PMs2b0azfuPk7vyvSrojPzc0itOwTL?=
 =?iso-8859-1?Q?Vti2SaAtJSlTr+7H38GQ4F3Ayyh+osDF+5i+UiildsymnJ4NAt/wW/FRKr?=
 =?iso-8859-1?Q?7tII3d8EsIu6nDxip489Ggde5sggIOCfpYQmdAQMOe4jtntYF9cTLGa6vp?=
 =?iso-8859-1?Q?ZGJWXjvtDwUneUPufujQdtPfez97tdgDwbxpqKFG?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <4B1E4126DF5C2F488234585D53C85FD6@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?iso-8859-1?Q?RwaqcCmUxJY80Y6NvcfFLgESZEshxFAaIeZ6ewUyAB7qA5ldixofz8bTdz?=
 =?iso-8859-1?Q?6iyfGF5jCgqz+3LP3X31aeufdkGXkFRHO5akFxd0L/DVxebEKMzoIvqRKm?=
 =?iso-8859-1?Q?LPFV483fP6h1AlLNaTEVhDBWgfqVmFiP6+siIgvV6twmEh1JpvZzwEe143?=
 =?iso-8859-1?Q?mP9Fkl9xkqsfNd4fNK4QD3td58mLoifSNKW2l8D1hJxzx/hUnfxsifHdZd?=
 =?iso-8859-1?Q?g32G9y6KnnHL5ehC/YfMRU+1EHEPI25NZ/OQYAcFMIVqbfkGtJOv1i7EOb?=
 =?iso-8859-1?Q?IFoz4z5s/R+7gZC9RGwBxM8455nYo1fMUgNAzm6Ss1RdtTdU0A+ukJrdJb?=
 =?iso-8859-1?Q?Y6qf+Jx81UQGdzX+0trH6KBodq3nqHacwCRL5cjxnDotG4Bs5JMlP23EGd?=
 =?iso-8859-1?Q?hIeY4Vd5qJ+v7azt2a3oo/q/xgauYHMJB3yW08NaiyCu4OYb/yR4UhMk9O?=
 =?iso-8859-1?Q?WWrUgl8sCUfg7GufZbwYU0ex5oa7I/UamV7EvkoExqjeMc6dCH3wmvLq1r?=
 =?iso-8859-1?Q?z3ZwOCtTuCAmdpd78MUqC0jxZntcj0DvZcVVx/O25PTYWBkp2hH5FoMJ5m?=
 =?iso-8859-1?Q?osJp2dPNSNomAihw7FQwRXYBj1ttNXuRY9Wc7A+asSXv5Wk/n76Xe5c7PZ?=
 =?iso-8859-1?Q?MLTCpY09cX6ntAvXRWnt7yDaHYX22XHQ3vdKVif9Bl1e7OHwVu4kO0CtYV?=
 =?iso-8859-1?Q?ebLLEnl9VMZjHB9+F4Ut4D9yqvGhRRDOAVy5bE9vkZrv0rVVb/NXDeSc9s?=
 =?iso-8859-1?Q?yo8QQhPxKVMwU6FWVm8QqbcbDDxuA3eWTkw7qaZYoqV6a/PxT22lVSrd6Z?=
 =?iso-8859-1?Q?sJniNegz1jyH5HSexyJ26RlvFYHI9/H7ishbE6uYrXT9+legd8KPRWYI2S?=
 =?iso-8859-1?Q?tVTfUO9jv4jQz7NY/0/kJVJc3Jv5MXG8K72WU2ewUHCpJKNlXJpm0JTT9k?=
 =?iso-8859-1?Q?rDcf0w7UO+hsSMr9YkkLflj9GHF7wqQP+zl6bcnsMgAoXECvqzHAthK72I?=
 =?iso-8859-1?Q?RHE79SroDqOIlIu+QgeokWQrduUR80WgrIRWNG5NjkKkoUZTYpAXNOcEfh?=
 =?iso-8859-1?Q?uKLBxJFltOIAGu8z3Ksc4gxTAjxHQrT5eZskgowjKba6V0Rsct/F72x5AL?=
 =?iso-8859-1?Q?HXwlhrFj9I5MPMfkgpytQf7BtZFrxZsWDkZBeAVoaqHfZDq1J065O3isO1?=
 =?iso-8859-1?Q?gEwDKtF2VQZcjSKQgodP+oLXpJRj22LbFSR32Sc+CgTs0T0/HDIrZU3pFH?=
 =?iso-8859-1?Q?UE/ZLIjg95C6ESbSlkQHVC8k/WVb2IFMQQX4c/juo=3D?=
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7843.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd06e8c-cf98-4ddc-4960-08dbca869041
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2023 18:19:09.7260
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: izTeQjzXUEh7z3uoPeY8iPmkUSDdxlof6TG4A/MAgKqGlmwHKcHFDFCph5TwRm0CjP1T5xtW4sqgBzrxC5ipmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR04MB6403
X-Proofpoint-GUID: sCC6Y99ZjTM5Q6u46bjS4JP1y0zFJyoX
X-Proofpoint-ORIG-GUID: sCC6Y99ZjTM5Q6u46bjS4JP1y0zFJyoX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_12,2023-10-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 clxscore=1011 priorityscore=1501 bulkscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310110162
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
Cc: Zev Weiss <zev@bewilderbeest.net>, "Milton D. Miller II" <mdmii@outlook.com>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Eddie James <eajames@linux.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?iso-8859-1?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>, Guenter Roeck <linux@roeck-us.net>, Ivan Mikhaylov <i.mikhaylov@yadro.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 11, 2023 at 02:26:32AM PDT, Joel Stanley wrote:
>On Fri, 22 Sept 2023 at 20:12, Zev Weiss <zev@bewilderbeest.net> wrote:
>>
>> This property allows the device-tree to specify how the Aspeed
>> watchdog timer's reset mask register(s) should be set, so that
>> peripherals can be individually exempted from (or opted in to) being
>> reset when the watchdog timer expires.
>>
>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>
>Reviewed-by: Joel Stanley <joel@jms.id.au>
>
>A note below.
>
>> ---
>>  drivers/watchdog/aspeed_wdt.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt=
.c
>> index b72a858bbac7..b4773a6aaf8c 100644
>> --- a/drivers/watchdog/aspeed_wdt.c
>> +++ b/drivers/watchdog/aspeed_wdt.c
>> @@ -79,6 +79,8 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
>>  #define   WDT_TIMEOUT_STATUS_BOOT_SECONDARY    BIT(1)
>>  #define WDT_CLEAR_TIMEOUT_STATUS       0x14
>>  #define   WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION    BIT(0)
>> +#define WDT_RESET_MASK1                0x1c
>> +#define WDT_RESET_MASK2                0x20
>>
>>  /*
>>   * WDT_RESET_WIDTH controls the characteristics of the external pulse (=
if
>> @@ -402,6 +404,8 @@ static int aspeed_wdt_probe(struct platform_device *=
pdev)
>>
>>         if ((of_device_is_compatible(np, "aspeed,ast2500-wdt")) ||
>>                 (of_device_is_compatible(np, "aspeed,ast2600-wdt"))) {
>> +               u32 reset_mask[2];
>> +               size_t nrstmask =3D of_device_is_compatible(np, "aspeed,=
ast2600-wdt") ? 2 : 1;
>>                 u32 reg =3D readl(wdt->base + WDT_RESET_WIDTH);
>>
>>                 reg &=3D wdt->cfg->ext_pulse_width_mask;
>> @@ -419,6 +423,13 @@ static int aspeed_wdt_probe(struct platform_device =
*pdev)
>>                         reg |=3D WDT_OPEN_DRAIN_MAGIC;
>>
>>                 writel(reg, wdt->base + WDT_RESET_WIDTH);
>> +
>> +               ret =3D of_property_read_u32_array(np, "aspeed,reset-mas=
k", reset_mask, nrstmask);
>> +               if (!ret) {
>> +                       writel(reset_mask[0], wdt->base + WDT_RESET_MASK=
1);
>> +                       if (nrstmask > 1)
>> +                               writel(reset_mask[1], wdt->base + WDT_RE=
SET_MASK2);
>> +               }
>
>This will do funky things if someone is careless enough to put the
>property in an ast2400 device tree.
>
>The ast2700 has four reset mask registers. Not really your problem at
>this point, but we might need to move to a per-soc callback in the
>platform data or similar.
>

This chunk is within an 'if' block that only runs on ast2500 & ast2600,
so it should be safely ignored on anything else.

>>         }
>>
>>         if (!of_property_read_u32(np, "aspeed,ext-pulse-duration", &dura=
tion)) {
>> --
>> 2.40.0.5.gf6e3b97ba6d2.dirty
>>=
