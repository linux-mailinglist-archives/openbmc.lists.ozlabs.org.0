Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7233E4ED3C3
	for <lists+openbmc@lfdr.de>; Thu, 31 Mar 2022 08:09:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTXvP3PMmz2yPL
	for <lists+openbmc@lfdr.de>; Thu, 31 Mar 2022 17:09:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=WJpnJHVb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.148.236;
 helo=mx0a-00268f01.pphosted.com;
 envelope-from=prvs=708982c78f=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=WJpnJHVb; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTXtx4G9tz2x9X
 for <openbmc@lists.ozlabs.org>; Thu, 31 Mar 2022 17:09:09 +1100 (AEDT)
Received: from pps.filterd (m0165118.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22V4VfIn031310;
 Thu, 31 Mar 2022 06:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=5SzygrKVLjZUVq2O7UpjZiub2jL/JYJIodS9YfFbmZ4=;
 b=WJpnJHVb68LDZp57pgu85ABTC0LCRQ/nDQo71J4YAe4Jx7SAIXq/QRqGMqU+ku8brSdT
 tQVzCZWmPoOO76U5i/ouFoJUw7nJcO2eUuGYaKBqdEEQ9WUXqDpqa/xYN3TMzBvnUCCT
 XFpmGO/8yMbvj+H7WY1jZPGaZlXSExKINLhC5XD6+FOeVE2ms1jdiEPBBmg0CdIDxZYO
 qgZ7UYc7vvcoM7R2PT/wE7rJPN1aop2UNkLNleLXrA2u8/LRQCenH5zDSHD2S4JahfGA
 PpWS/ZHmJe24+oFSDMSVjuHaUHcLQJ1dNtbPSe/Bzi36JSiOSLzPtG+BWJS0aIh53gfx 0g== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
 by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3f4u12sys4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Mar 2022 06:08:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZcAQzwTKJvW04gQpXLSyM9xSoPNs/GY/Ec2zHD6eT9KKVNwNXNJwzAE5+cg4yyGuecPow78vVEkkYhDsUmVej6wecxt5wtVvEyNo5s5bwlC45wSX6+sb6W4qoBczcayRkEHe9TQlaHby/c3Vjb1PYOpBJiAGyMhKqiFVFe6Lz6N1eRAUWfs2Z1RQalnKF5v1tyaUhDkjnli0O6Z5sMlGF4bmYpUEOrdzWELW/MrPO9vdCGyFVThbp54FZ2XkWAXjlnMoifl2f6yVuRe4ss6Hyp5FySG82+/HQz9UtqxryyGkQA0uoUrKeLr93wK4K4tCQy3A/Co1qZKQC8RX6RxHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5SzygrKVLjZUVq2O7UpjZiub2jL/JYJIodS9YfFbmZ4=;
 b=AJgiM8WrN5p0vsKH4PgBTSX1ldhMxJL7XfzkBRp97+tbW38YTsDuUpDk6wfmO4jm6SQcBj9/f6VPg4IeWpVKMgCzAAGlcvYN5pvJXH01++327lhaySiZkJn/dGzeFwA+4MGEtMGj6WmQkEI9X04yYupCwpqqiOWMe9oSsJ5ql5SV3hi6oSmvkt9kOSY97M7j6v6t30LT9G84WT+T38zpw2DcQ/4vbKWPI2SVZVT4qUH73AE2ok6OIyPYb/AlGz88wUDAPNe/IDedUMObURt2Z85m25e1qwHsBzxRoiatZfyldIoy1+hUe9ky4z13UXJQXNiBio2Kv7Qk83vZbTS6OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM6PR04MB4521.namprd04.prod.outlook.com (2603:10b6:5:26::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Thu, 31 Mar
 2022 06:08:45 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::6dd0:3d61:f3fb:43d2]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::6dd0:3d61:f3fb:43d2%5]) with mapi id 15.20.5123.019; Thu, 31 Mar 2022
 06:08:45 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: romed8hm3: Fix GPIOB0 name
Thread-Topic: [PATCH 2/2] ARM: dts: aspeed: romed8hm3: Fix GPIOB0 name
Thread-Index: AQHYRMXHlUu2oaprC0emyEqBQXdKmg==
Date: Thu, 31 Mar 2022 06:08:45 +0000
Message-ID: <20220331060844.GE24501@packtop>
References: <20220331022425.28606-1-zev@bewilderbeest.net>
 <20220331022425.28606-2-zev@bewilderbeest.net>
 <CACPK8XeeFDSN8L89BPkV+UfGTYNiULyUPBTYso7Z7e+VEdgc4A@mail.gmail.com>
In-Reply-To: <CACPK8XeeFDSN8L89BPkV+UfGTYNiULyUPBTYso7Z7e+VEdgc4A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28661c18-d52d-4a34-2c2c-08da12dcea28
x-ms-traffictypediagnostic: DM6PR04MB4521:EE_
x-microsoft-antispam-prvs: <DM6PR04MB4521DD670F1D042AE1678CE5C3E19@DM6PR04MB4521.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: smQMDxlCJQZmNfgyO/gRiDhBLbBeeVlQBy4pcWFXBYbZhWgnZvoku7IDQpT9b+U2M4zjg6W/kwjIfcZX/ubg4i/qVpMw0EsXTfYKx+s3Kn23q+P/AQPoszZpPch6UNm2Ybk5C0RLcBlDGCtkVyVQsf4cWtqM4OOMWBQz6/rm+9+4IPZfJBWncVBaQZ6AJm3B4AdKgwdjYWQLA9c2gjSXET5pm3JBe5bbiDEVNpaTCZB8ElBeIjKSp4O4oChEbWQ7SHZAlAoA8Mn1CPtW7HMyndmeS8IkArwNM7sdglHaoGeDiHDv9qvtzlM9b2c1oQ4EKKYV7u4+elzdgkZVjClTbwRX0lL+GgGC9m2YO3zOtrJ7XLnbSm5fbchaqneScmBuHVQNvhzXntdhB4BnSHugIKiBXUjm2UxblWggVUX5ZBb6nRYVkkuvdbxEIwHhUWYNolWyBBf9fPTCquLT6Tp9o/jq428a4RTYK8ndZ3FS7KP/JOI9U165rFonakei8AULBacez4C8MBPXlSIv62GhTVCUhaboIDFIqTDz8VEA/BV+BvjwTHffBbPv3qQeSKFnzGudarlETxkD3CEzrfu2CKexWLV/iNXnvP4cUhVPtz+Ejat2rRUs8WC2kGkWxVaN+c2T1lHh1D9dncjRuyYFYecGtj7mAT5Ug/bVrZX+z6q26yV9Tk3D5IW8d6soF9ONkkgpT9qDoip3MUivUFuhQQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(4636009)(366004)(86362001)(1076003)(26005)(5660300002)(8676002)(2906002)(38100700002)(122000001)(38070700005)(7416002)(4744005)(186003)(33716001)(4326008)(316002)(66476007)(6506007)(6486002)(6916009)(9686003)(71200400001)(6512007)(8936002)(33656002)(66446008)(508600001)(91956017)(54906003)(66556008)(76116006)(66946007)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oZcRgQ1XMFEVbwn+uRj8DaSQc8cJt/7q1PYZHyc3nDMthKjikMLajQjGq1Ac?=
 =?us-ascii?Q?TQtfX7Zjkkf7R+ZBZtC9TtHG/jM8CZhZArC8cjdrQEWatwFNq263+QScwzDw?=
 =?us-ascii?Q?z0iZPTQIWc67AsY8uy56aORxXlqRf/hrpiEw00yI77pbZNmcrdToTSpBlWD/?=
 =?us-ascii?Q?wy9tvpjEyNEqoLBb6hGq9DX53XkMBg+sJV3QQqTZnGEogU6xEEoWAuD1ujBp?=
 =?us-ascii?Q?PYbScbpHnePtDrNRzjEjnoTUyn6zT+nyHsTSoUFy3TzK2xqKbXsIMCopiKK3?=
 =?us-ascii?Q?aw620NiOcpSyhxZokbpVPFlcdav7xp3vKWC5bckmFf6XczYBq4cL7gX0XO5q?=
 =?us-ascii?Q?UfbtOCZU0EEGiCvnloZd12lyVsZXHZU0awXIVMk/PT2KjYDh5+8yHQvxutNX?=
 =?us-ascii?Q?Dbo6GVlJTjdJnCQ49sSkZhhN/9WD1mWlJxRGArzPYsh6E18OvBK4onm3rseX?=
 =?us-ascii?Q?tOtdeISl+wepyMEUEhjUNV/BDkI0yv37zQgBKezo9tnqLLFnVmy8dN0npBde?=
 =?us-ascii?Q?1nfHHZDCu/sbGPpwPahP6WeFV9g5hCmxMxIJHxsapZRygPwwxHYr3B4ovzDA?=
 =?us-ascii?Q?pFFvHvqygbz40n/5R/dRwFEslrg3x+C8YB0yQVq2hkjOlCBMNKYCjV13o8JS?=
 =?us-ascii?Q?F0LMvWaUQgpK9FvknE4MCla22wZfig6F4FkJZcwUhHSTCgCcfDQK9scyBNUp?=
 =?us-ascii?Q?LukUv9FJmKQhj3FYw0ekdLK9eQojWY/qJcgu6IdRcdekk3eEDa4vskSJWN4D?=
 =?us-ascii?Q?+18X9zuVDsL074yHspR8CGr3J5yq/kqBsW71QIicavDBklg4clv6E8mpJeee?=
 =?us-ascii?Q?0jJ2IR77wnIV/Wz+LIihRpfMsHwJeCOyHKyroKeG8WSulujZOn6L4k1YzYSG?=
 =?us-ascii?Q?k+JAQzekiF/SER8Ft4vZnDvDi+ueoIj3Ss04ek+vsOZjRyeUBdonGKyd6Pgu?=
 =?us-ascii?Q?O6OfTCfQZZJYX8Umn1j6y2TWJyq/4Qqq5ncp1uZWtZCJ5tUhFkTeg7sEQErq?=
 =?us-ascii?Q?RPzYT/HZnllEO01+UpmgkxZdVHsMH++REfxsTs+i9tIz3yk7LUjIX6x5x/mP?=
 =?us-ascii?Q?CjtFuwavvRStm85r5hF+99S/OOMcRyOSIb4FiM92Q6rqiOMBADECOZvpREEP?=
 =?us-ascii?Q?UXynvcxdRDl7ctcYhSwENElOQgFk3sKmR8Bg2dG8C7fPpx3xgEDrvmcCYjQR?=
 =?us-ascii?Q?t4tHCQ97tNUj9hOfAyWPv+lf7EM9lYr9mtfkexOlXhot3wL8jxEWlOH98Soy?=
 =?us-ascii?Q?ZtnL7O1Q/qUIOLFPXHRv0MGOrl8VIkR2/bovhT6Y5jpVOJCzk5DfdnMOE/Rh?=
 =?us-ascii?Q?VscIMREub/io13wtAS4Q0QkXh5wEtJT4goTh3XNNcLuZpyKjcUYCijhJr2h1?=
 =?us-ascii?Q?kW0Md8PfGfY0gcF0t1y5qxlhu2TD8LJLnNlwH9wsbOC5UZi+5NjvMV045E+N?=
 =?us-ascii?Q?4TL/FjtHlzzQgeVrOEvqFAv/LLoW6okF0bPPMp4+2Qsko7y2TSCKdT+ljipt?=
 =?us-ascii?Q?rFWWsU5+sSm17Z5wd9ZT81i7edYKFVoswSfnYvl8b2jje28IoRaGHnkmQPDe?=
 =?us-ascii?Q?9PYQnaDYbpRcYW+DD7IavF9fC+E8RUCAYldMKxQCY7wKl5Xg0g2434hopnyk?=
 =?us-ascii?Q?o+sfw8HJcZzimpi1lA7clflcxFxEJa6zbm4kTuMpG1+dQE+J1w0EQC+R79vT?=
 =?us-ascii?Q?kuR+vjrMCqeFQ/vskHQQTx0ksEWZSHsFkzpO78ol8PckE49bxROMZlOhYM/x?=
 =?us-ascii?Q?bSWbDNRXFb2g4W98tfZoLPAZXBMUAl8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E39F349BBCBA214D8E545B7BBD52B908@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28661c18-d52d-4a34-2c2c-08da12dcea28
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2022 06:08:45.6172 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hia+8GoKWQ8rRF4DLlVrzkoNcDFK8/1NWJANTzpMH/A6eUZmc3bH7ti1RTonKHake7YLuQ/jhrVr/4mRYNcyQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4521
X-Proofpoint-GUID: KArcqPQ8HRcU6DNZqSTuPdBSkKTuKnK_
X-Proofpoint-ORIG-GUID: KArcqPQ8HRcU6DNZqSTuPdBSkKTuKnK_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-31_02,2022-03-30_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=675 suspectscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1011 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203310036
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
Cc: devicetree <devicetree@vger.kernel.org>, Zev Weiss <zev@bewilderbeest.net>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Mar 30, 2022 at 10:35:47PM PDT, Joel Stanley wrote:
>On Thu, 31 Mar 2022 at 02:24, Zev Weiss <zev@bewilderbeest.net> wrote:
>>
>> This GPIO was mislabeled as DDR_MEM_TEMP in the schematic; after a
>> correction from ASRock Rack its name now reflects its actual
>> functionality (POST_COMPLETE_N).
>
>Those are quite different functions :)
>

Yes, rather -- that little tidbit resolved quite a bit of
head-scratching that had been going on...

>>
>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>
>Fixes: a9a3d60b937a ("ARM: dts: aspeed: Add ASRock ROMED8HM3 BMC")

Ah yes, I'll try to remember to include those to start with.

>Reviewed-by: Joel Stanley <joel@jms.id.au>
>
>I'll send some fixes in after -rc1.
>

Thanks!

Zev
