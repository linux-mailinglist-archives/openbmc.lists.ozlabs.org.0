Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C00AD53F28B
	for <lists+openbmc@lfdr.de>; Tue,  7 Jun 2022 01:29:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LH8pr47yBz3bg4
	for <lists+openbmc@lfdr.de>; Tue,  7 Jun 2022 09:29:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=h1ERhPKT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=equinix.com (client-ip=148.163.159.192; helo=mx0b-00268f01.pphosted.com; envelope-from=prvs=91568dad4e=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=h1ERhPKT;
	dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com [148.163.159.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LH8pK6J89z2xnN
	for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2022 09:29:21 +1000 (AEST)
Received: from pps.filterd (m0105197.ppops.net [127.0.0.1])
	by mx0a-00268f01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 256GvkpI002048;
	Mon, 6 Jun 2022 23:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=VeTN8oIcxruW3MpjhXVmKGT5RsqSo3jSSy0nvdX0pfU=;
 b=h1ERhPKTxttOSCdq4fdvNWXlKn0SbxLGZPM4Pnh5T108yYGW2JJbQaXEmcpAtffm8ItM
 X3umqTtm8Knva6BnDtblVQZ1kja6qY153ZL5X/Qv5zjykbqL5gB0iCl/IKpr/V3MUf4d
 0A2J0UKh87P7nY971IOWBZZvJ5P1hnR37kVKat/P544RJy0lm8CEcAYbyzEoEqANpRfP
 NreaS0oSWArQ1inDfHRT2UmF8DcdzBTtsNBvLwv5cyBdKMX5+CeBY3U0mzXDbSLDP+s1
 Z+/6OH2VTspzeetYQuyl4TqGTHiA+C7JcN0z0E7ipkG+lKrQw/M8IjrCwukkAmErT0cN RQ== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3ghh3g9yy6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jun 2022 23:29:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SyJK6RMgLhjumxCn3TIHSU/VNhpxsNWUUIjauIskk8F6W+pMsfWP7tDpCzrIhMPb1sZGInffu9klTupw9wR4yPQS63AKa5xemb8IsO22BN6gbUXfDCnQJXxdIBOvHV/yQnWAPjaEE1cJIblMaca6DV3ISAmFHsH56zPw3wkrHfYwGis1dL2/gaPq4WUE4oliRcgk6xa9h3Hm7CxTm/1io3X+2WYXJhjgycMX0Ly+E2Ji47fa7wLyHyh3XwvCpmVuxbwhqnwL5n0eH7eh9D1FYR9E2bN4fdbAXfaCddlUY9enJqj7k/dmSKsR1QMVGd8c+uLBLEuQ4q0bpK21JriV1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VeTN8oIcxruW3MpjhXVmKGT5RsqSo3jSSy0nvdX0pfU=;
 b=hRX7WKdh/qN79sqxp6k8oKi1RPLyvASK9Sl5vfOHtEZnIUJfsXM/HsYBFVJR5qAlRgQP/UnbMCeiZe0zum9eMhmraXfH2pyout76fn2NdbKEDFvS66uDaj2xoFLPk5MYuAd25Rqj1KHf4c3pGLHG8CJrTAXuVIdju3JTR9eAnSrhrGyvDguFWsgDxLNJ0MZisMpyvgHaMGpVS0fkRC+2q6Veq5ih78JbzFi5qes9D1UcrpBJ1mI1eq7sKyHGVS1SxAkwo7aNQZP7E6QUNFOdUcOaP6pX56wc/jNm3cERvBDYSgOgqZ2jCAkXeSac3dCxQ2LKbOWIqD9IQdHzn/KeBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by BN7PR04MB4179.namprd04.prod.outlook.com (2603:10b6:406:fa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.15; Mon, 6 Jun
 2022 23:29:13 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::3cb6:207c:de36:12f5]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::3cb6:207c:de36:12f5%6]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 23:29:12 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v3 2/2] ARM: dts: ast2600:
 Fix indentation
Thread-Topic: [PATCH u-boot v2019.04-aspeed-openbmc v3 2/2] ARM: dts: ast2600:
 Fix indentation
Thread-Index: AQHYef06aFGZNtQN1UaNMItl1bZODg==
Date: Mon, 6 Jun 2022 23:29:12 +0000
Message-ID: <20220606232912.GQ11809@packtop>
References: <20220606230901.1641522-1-joel@jms.id.au>
 <20220606230901.1641522-3-joel@jms.id.au>
In-Reply-To: <20220606230901.1641522-3-joel@jms.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b36d630-cf3c-49d5-afaa-08da48145d61
x-ms-traffictypediagnostic: BN7PR04MB4179:EE_
x-microsoft-antispam-prvs:  <BN7PR04MB4179E08A4E6386F78C718B68C3A29@BN7PR04MB4179.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  IQEDe8FTxx16iJs7gE9zE4MrpFhlcZ7veoCELCDD9FZ2FKvl+pn5JObRGO0GAsrdTL2zILmTjoI2cHb2UKmaNGcNlgurZBZnjNw5P1yYOymbeFV+j6xt7habLwmhHQ1YbYyDaN1FfWnigFa2rbHEqu5FHo0T42iKyOQFbAOLP5Og919FC90WYBf589Q3vHgshbO/j+5c9vcul1t/Cy1mHkEn6s5bYMBJayBImK/eB+12liCBefyj2y8qEvW3ayAh1VvLKRCDrCArJ7zfqxURKSTP/dAWEKNLhM4XnQsUYNiMEuCmsoLMimJFqTwSpDspNgX7ETaOKrdMaqRW9s0E2u82rGdBc3Htac7Len9sHJUU/M9S/zpcH2XbgVMKXrIYRlNyXhB2sywLlXgenk8WQuAAa7l48TkXGzi/RPFhscvSagxKKC86hlzTQUKD2Sjv4eQQ8Ltk/+Au6E5D8mMf9YmKRwUm9SvBWrbmGn7rHueK6o/7ugB2sd6V64v7TJUygP2uRgcZM7RNk0FfjP8CPvUh/T8RAZGfe52FlSP0dwa3gihhtvotsVMKSi5ejZXgarpVcLhEkkT8M+z1H3rmZSjKLBcoRxVaOVAQi+alIvITTdqAHDFVhevRtOa6vpyQNcOFEDTm/cWbf4CqBk3Tvi15KFX6VnbESgSrq84f8WOuRKIMwAa5m+pCYb1x6plzV4GolFDzz8nR4f4Nk1OXYA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8007.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(83380400001)(186003)(66446008)(66476007)(64756008)(1076003)(54906003)(66946007)(91956017)(66556008)(76116006)(8676002)(316002)(6916009)(2906002)(6506007)(6512007)(9686003)(26005)(508600001)(4744005)(33716001)(8936002)(71200400001)(5660300002)(6486002)(4326008)(38100700002)(86362001)(38070700005)(122000001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?Aki/5DS0h1HULcfEdHIIdwD/D/B6SIuxfak453fCnK5iZtUy42mOR90II728?=
 =?us-ascii?Q?knIVj7kMUZxdnyRrhKhJJhf77vQ7n/CdQxS/cLJBB5t2y2AF0na2Bsl3L2qn?=
 =?us-ascii?Q?mAKx4GUkDZRUdQZrVqaSXBgJf+F0uzh8Y0LRRCtO5mUHuHq/dg6b2jy3bUuD?=
 =?us-ascii?Q?fiQwYmloHh3TTGQhnIClytF4s8TZ5NV5XCqhPpasx6Hz+kgokFzdZM//AkoD?=
 =?us-ascii?Q?CgDns3mIbfyupTklcZ9EkZYBm0x+eQJSbbkdysCVCP4NHrGV3o/q01G82Tyu?=
 =?us-ascii?Q?Celk5gE6XxFXjg0G0otKrnsPRqPvHzRFVKLWkMpgHJ5xS5oO21cYQpq9UDcY?=
 =?us-ascii?Q?1opW59c2YCyz3sGpbsBGICemH4yZV2lzQkgQuEB2ZyEnr7/ESAGVukuh/SiH?=
 =?us-ascii?Q?Fh9iwhJRIz78h2RzGDHXrvZ723aoIMMDdHOcpAWs7HE9yxWXr8j233zhgcx1?=
 =?us-ascii?Q?qpYQwtsD/hdbmSBgY3NSkHq8lSDTY9IHezrH5/exf5aPjSF5DD3AlN6aUiQb?=
 =?us-ascii?Q?X0nm2ikyNny/lhTGg2+l5iLSM47bgTMrX5hUXd52xvMTXDdiLnkQsrgtrXAY?=
 =?us-ascii?Q?qabReLgNyZ/RkK3VLwFBVGYgFW+0JOyBqvpbEfjZPnwUEemNeg+ifsvooTp0?=
 =?us-ascii?Q?uBJ1B+4bX7ROLAlMtQaAGFSlyn5bz1bLcTnxDvgokvQb/ayASy2Hy59PiXcY?=
 =?us-ascii?Q?1PQRo7eb5c4BN4L7YRa3EO+lpXMMMZZu+HMGIBlDdMdEiznxmsmKw1mWMbuo?=
 =?us-ascii?Q?vXaGeV42bNB6/UjYQW8OsFZ5kxUlPI4N4o5zwKSyfSFzL0hLoj0yl/fv6U/M?=
 =?us-ascii?Q?v/ZGdDifv//U98xkdETCLhkhPLGga37BSPPegPEIKs7wP8V/XIuECc5ga7BZ?=
 =?us-ascii?Q?lBwrTU7pw20r1MhpEYSFXFdePhiG+PDICiAMeYGYXx1B4U/dWaOOyB7NquVt?=
 =?us-ascii?Q?KLhRBIxceswXTMf1K8tALEsn+N9Eo9qFUvpd0SIrJn0n6P35GZH/eXgvbR5W?=
 =?us-ascii?Q?lj/NPCLa/6Wvawhgjn0u0d00sQu/UEh79KbHgt3/9UXGOgwES2KcnbTOUqvt?=
 =?us-ascii?Q?U1MGKdGlAwkQfKz2DxHToDpHZS/azk9OpyCzlE8qiQkKkZ9UUeJyWDtRjHIn?=
 =?us-ascii?Q?WWSlYjdrp/9dOctB0jumqZzFXnDXyzGVbBfdzvc2+NXORVWHIoEV1TQOLBy5?=
 =?us-ascii?Q?k7a0nYJ23bieAJjjKkzyqwJXcZetFTO+Jw5e0z4j74cOqb0gS/7PmzeDiNJm?=
 =?us-ascii?Q?CRV9p/Hxa1SeVCZvTIHB5XTk6oZ5ch+39iT/9l/+p7sMbugtfY8yr4pVaNJ9?=
 =?us-ascii?Q?IcT388Le5DUwgAkbgicrmWV28Ga7flGpWnhBeVXPrKfB8pi43wMcyr55Ku6i?=
 =?us-ascii?Q?Wmdt0SYTA8DNx1/pQ12Q1AEIEFRuVz6LtiQ3UShqIYCJewm2XXjx5E8X+TPv?=
 =?us-ascii?Q?rnqOYlAPuesuS0scj+Y9Z9uZ/JA2roevi30zLZFb748CMJDIyPOkkfCcmVGw?=
 =?us-ascii?Q?EljRKtB2v61bspCB2z5u6Eth70zgg7W469Qe32FMOqltS8X6JiifTwISSaiW?=
 =?us-ascii?Q?YLMBXWHxl7MVy4zf9kj7S7nftDzLJ33i9zgemwu7SRBXygwk7uJXT9p0FS+l?=
 =?us-ascii?Q?df89NU2p6OfB1xURvR+2WTfAyw+VcXEAkfGaUUHhMPuRspEGHKOVtjmO4Eyo?=
 =?us-ascii?Q?OYumw/X9xkg3fsYJyYS9BK7vxZcVvauMT8l4KQmA1G7bgmHguqCUjJSTejxk?=
 =?us-ascii?Q?2E+/H79cMLHt43EeapQJhk2Z36sk8kg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F4DB08D60ED60C488D948322D3C87B18@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b36d630-cf3c-49d5-afaa-08da48145d61
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2022 23:29:12.9105
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A6Umx/c1ZAKYCJEhVYrzet6yJ+IFahpiZ4UC9wD1GN7+cP25kMmcvaPRUmMA9YqSks2gPuskTNtv2LWNmPPWsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR04MB4179
X-Proofpoint-GUID: YsEAlWPa_qGIOpCkjltAf90Q2Ts0WId7
X-Proofpoint-ORIG-GUID: YsEAlWPa_qGIOpCkjltAf90Q2Ts0WId7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-06_07,2022-06-03_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=660 phishscore=0 spamscore=0
 impostorscore=0 mlxscore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2204290000 definitions=main-2206060091
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

On Mon, Jun 06, 2022 at 04:09:01PM PDT, Joel Stanley wrote:
>These lines were mistakenly added with space indentation instead of
>tabs.
>
>Fixes: ba6ce6626286 ("aspeed: Add machine names")
>Reported-by: Zev Weiss <zweiss@equinix.com>
>Reviewed-by: Eddie James <eajames@linux.ibm.com>
>Signed-off-by: Joel Stanley <joel@jms.id.au>
>---
>v3: Also fix ast2400-evb, ast2500-evb, ast2600a0-evb and ast2600a1-evb
>
> arch/arm/dts/ast2400-evb.dts    | 4 ++--
> arch/arm/dts/ast2500-evb.dts    | 4 ++--
> arch/arm/dts/ast2600-evb.dts    | 4 ++--
> arch/arm/dts/ast2600-fpga.dts   | 4 ++--
> arch/arm/dts/ast2600-ncsi.dts   | 4 ++--
> arch/arm/dts/ast2600-p10bmc.dts | 4 ++--
> arch/arm/dts/ast2600-tacoma.dts | 4 ++--
> arch/arm/dts/ast2600a0-evb.dts  | 4 ++--
> arch/arm/dts/ast2600a1-evb.dts  | 4 ++--
> 9 files changed, 18 insertions(+), 18 deletions(-)
>

Reviewed-by: Zev Weiss <zweiss@equinix.com>
