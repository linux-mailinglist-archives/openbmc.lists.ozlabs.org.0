Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 691E14027FE
	for <lists+openbmc@lfdr.de>; Tue,  7 Sep 2021 13:46:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H3k4R2Bz1z2yJx
	for <lists+openbmc@lfdr.de>; Tue,  7 Sep 2021 21:46:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=hjKRwoVp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex.com (client-ip=185.132.180.100;
 helo=mx07-002d6701.pphosted.com;
 envelope-from=prvs=38843d7cda=chris.chen3@flex.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256
 header.s=dkim header.b=hjKRwoVp; dkim-atps=neutral
Received: from mx07-002d6701.pphosted.com (mx07-002d6701.pphosted.com
 [185.132.180.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H3k3t33PQz2xYC
 for <openbmc@lists.ozlabs.org>; Tue,  7 Sep 2021 21:45:44 +1000 (AEST)
Received: from pps.filterd (m0211474.ppops.net [127.0.0.1])
 by mx08-002d6701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 187Bg04W000452; Tue, 7 Sep 2021 11:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=dkim; bh=jwbvdh6iJi7OhYV9xhJUypEsFppIFP2cOl+8LiMfvXk=;
 b=hjKRwoVpGTnU89AltbF4RQ7dvgf7CrfuUFJGrBZmET2AaKLcjqOtXXx789IgISXiMrn4
 zVw8if3LBPo/74BZq3MnJfjkvWJjivsxOIFoDqM4D40zDzmh8IuiW9xbrobQcxCRzm2m
 gxH89S1dwSCg6FYJC3lD5/z6pjip0n5waxvB0ZtgZhCnVuDQ8BXSL7wJ7rhKwo34FAVH
 B9NzqefhQR/qvmfhTHMq7LGMYnDWKAREk1b7ZfGPTQMYu3RO9RS6OmC/d+bmCaOrcG1D
 KDG7sb6qAzkxysjbtOFIl7+BxkYnJWTt6wzxg3nCP/WLUB/MuLfeBnFChTOE0JAV0GsS eA== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by mx08-002d6701.pphosted.com with ESMTP id 3aw90tywwa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 11:45:40 +0000
Received: from BN9PR03CA0785.namprd03.prod.outlook.com (2603:10b6:408:13f::10)
 by CO2PR0801MB2184.namprd08.prod.outlook.com (2603:10b6:102:13::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Tue, 7 Sep
 2021 11:45:37 +0000
Received: from BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::3f) by BN9PR03CA0785.outlook.office365.com
 (2603:10b6:408:13f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21 via Frontend
 Transport; Tue, 7 Sep 2021 11:45:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.19)
 smtp.mailfrom=flex.com; yadro.com; dkim=none (message not signed)
 header.d=none;yadro.com; dmarc=fail action=oreject header.from=flex.com;
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.19 as permitted sender) receiver=protection.outlook.com; 
 client-ip=144.49.247.19; helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.19) by
 BN8NAM11FT047.mail.protection.outlook.com (10.13.177.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 11:45:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YB17xUw9c6LUHPXGlAYJPzvSuJlA1Fhxs1svj+gX1f9FpZwKLUxPWiHtnSY1eLHG9Brg+pstZ7Psv7CZy70HS3QYAG1yuyC9gVC4Iyi96BDIBqeriUN2liJ9S3HWi8Mo0h/haZVytwR9TNDnjsoTaVATAvo3Qm+EvSEUTqIPOWMWoJjElegTnnxPSB6X61LNdGVW247BTxZrjIBilAabJUl4z8rMp+9+HbmOGTvgjHuHWIY8W5BtvIXLYwrb9iianFc6EgYBrNDkgHyb4Ctc1NDOk4BuYR/X149ekVEbniZ/uJUAOGuD5zwFL7WPGC4F7HMMFlzH3zrKS8KN7P6dAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwbvdh6iJi7OhYV9xhJUypEsFppIFP2cOl+8LiMfvXk=;
 b=Gr5R51hwX0kgqulVN2hxP7YsN8wVCW7Dyw3GXHvZkyvgKvLwlmDobN+/f8cXNDYQZBZeDjydnlKJzPutPLamrLH9wwXn3RLVBYfpASAZ8BjZZYaMTorJ5HmG2yKI1yyjV+lPZVC7wYkZyLa3sRpvL2fZDbRsv0Jy2cLQRRLP07TMluBdbbCBhw3usSrD+9PQsMXWyooynNM9V0CGrjDSk21yAZaCp0bvcW1nqahd4o6XthgqFzmIBH37WNleHDzXSB+fEsuwI9pRuBIHzr1Ps7JDt4d2S2gwBYMbb/GBzqxPCcyLIw4EyfoDGsts379IzdLrMsEqoE5SoVOHpSK9LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from DM6PR08MB5514.namprd08.prod.outlook.com (2603:10b6:5:10a::33)
 by DM6PR08MB4745.namprd08.prod.outlook.com (2603:10b6:5:4c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.23; Tue, 7 Sep
 2021 11:45:35 +0000
Received: from DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::f5ad:4d37:9d66:b9ac]) by DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::f5ad:4d37:9d66:b9ac%3]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 11:45:35 +0000
From: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
To: Andrei Kartashev <a.kartashev@yadro.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: =?big5?B?pl7C0Dogpl7C0DogW3Bob3NwaG9yLWhvc3QtaXBtaWRdIFF1ZXN0aW9ucyBhYm91?=
 =?big5?Q?t_IPMI_(OEM)_command_development?=
Thread-Topic: =?big5?B?pl7C0DogW3Bob3NwaG9yLWhvc3QtaXBtaWRdIFF1ZXN0aW9ucyBhYm91dCBJUE1J?=
 =?big5?Q?_(OEM)_command_development?=
Thread-Index: AQHXn55HfvXlhYxihUiF8XEtvcIIK6uWwmNJgAAOsACAAO1euoAAmL8TgAAhgxo=
Date: Tue, 7 Sep 2021 11:45:35 +0000
Message-ID: <DM6PR08MB55143613FB0DC63B25DD9395DCD39@DM6PR08MB5514.namprd08.prod.outlook.com>
References: <DM6PR08MB5514D818A3029FA77BFB523BDCCE9@DM6PR08MB5514.namprd08.prod.outlook.com>
 <DM6PR08MB55145854126B411F1A9AFE29DCD29@DM6PR08MB5514.namprd08.prod.outlook.com>
 <6605257f36d729f8e4c57387209cb0df1b4a1ffd.camel@yadro.com>
 <DM6PR08MB5514F694AEC078DF0E0A4E9BDCD39@DM6PR08MB5514.namprd08.prod.outlook.com>
 <DM6PR08MB5514D3E2103969E07D4F0AC7DCD39@DM6PR08MB5514.namprd08.prod.outlook.com>
In-Reply-To: <DM6PR08MB5514D3E2103969E07D4F0AC7DCD39@DM6PR08MB5514.namprd08.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 8493c5ea-777a-d739-524e-9e25c74886d3
Authentication-Results-Original: yadro.com; dkim=none (message not signed)
 header.d=none;yadro.com; dmarc=none action=none header.from=flex.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b80d6b6e-4006-4582-cca7-08d971f502b4
x-ms-traffictypediagnostic: DM6PR08MB4745:|CO2PR0801MB2184:
X-Microsoft-Antispam-PRVS: <CO2PR0801MB21841E9C87698151EA0AD553DCD39@CO2PR0801MB2184.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: /l3wHcE8uOI8/QiBWMi3mm0s+H6mo5h722gSDuMbdLP34amw+V9yirNyh1a7H+lEM03RPBV7wSGzw5Vzyjv6SpEjQju0wTiL7AoPGql3SsMqqFeav14UgAioExbH77MYmjS7hYyAs2IGYFicu9JYkWl+ECchyMbxpTOs2jC8EiyI30r3J/2lX9le3o2BqWAJ//41zcezLdJjoSYoFDQgtal1XpGDi2/SzyxquKtdxT+QY6R2wHHrK4qacbtLgA48g8dzjZZuJ98NazqTJhdGk/fUgAdTznpt/9HNDjCOfgvYMZcRcYnU96kBoIIbUNWyb30I7nfZaTLA8VYEN4kPMULO+CsZTzH240th/3JYVZkfQDVvYP94He83C/d/NM1c36iFE77XUhuEUZEIm87D6+Sm/9d4hk9SB1vt7voADSsbhCVrwXHXPutE0gM65Xj9OxPrZmCZQjp4gjlwaNS4oDivhDoRgE2Sdiu1jaeVAbpnv4ts7eDnQmmtjRKXcSQB3oXGyDwp4y8pOFmct/jlmuStYT+TTf3SXz6NKZwHRlo+iPM9yjTxlNQ1aVGpkaGnsX5zEQaNzQXmn4D/0jnN/sIRytL/9LyE8OlQoto/JCce+oN5pxZtjn9SQ1iOkshx2SnxCXGpQ/J2jGqOiueG94DeJYQtcQuj5O0eWXqEYP2iVH56Fnm68s90NI/ky4sgpFqq5fIMtDi0OHKh5aJpt+wiiTqmZHS3QI3Kpqm48IbQWIKrboVfqM6Ddnh1FHKDy3MEaR5lTX73y4Ph5tGaDsKqIm8hSALswQY5bTnBljI/sDFJrxd0ahTv+BR3v9zvgn4tiL03Q/OGOTVxwEa3LouMUhH5MDAlNQkzO30zGNJ0UYRf72FCDePVCsXkX2Cn/OGfR+bF9fFLiailVmgxZQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR08MB5514.namprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(366004)(66946007)(186003)(316002)(18265965003)(66476007)(66446008)(66556008)(966005)(64756008)(224303003)(110136005)(86362001)(2940100002)(508600001)(122000001)(2906002)(38070700005)(38100700002)(76116006)(19627405001)(33656002)(55016002)(52536014)(9686003)(6506007)(71200400001)(5660300002)(7696005)(83380400001)(91956017)(166002)(8936002)(21314003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DM6PR08MB55143613FB0DC63B25DD9395DCD39DM6PR08MB5514namp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB4745
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 12aaa858-9e69-40f3-e3ed-08d971f501b2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IUC8tKAuArF1ja+vVtwIJbgX4HD3lH53vyAcuhsDUAyj+ZMfOzMmNGTJltk4VhbiwNyavDX379H6DyGFnW9vaQ9CTGuGzoXeHxVG8lSu+tdzLfHteaVrNN3IQjIvoaX+KoZy27DQRw4OZRBhmLxJDM3tz+UOIA7HvUQ7aB/0FIlUy5PcCcjw0NwMj9VJ6ZzQv9IiTIwqTu/8I83TtjvJBmikUYp5bLilX1iDpLLK3+KWAkxKUG0CC3tDed5/sNwXqSm5d6Og2jcYkLNKb2KQHNcYCP4CP91RIFIQmpey+tiQ6BqaoUwwOMBU+2xSObnZkYhYMRJjoVAX5GOqPJlYYy8jFV8aAamO8en6TgYn5Hs1hEZRM6l14Xw0s7D1HcsFEtp/qcOIHPmDlDZeol0e8pQMmeAySiM5vw5KCGzW/pSMz6e21xqGrfyU4+skUJ3yHyx5vukzXSPH3HYtMWqXjLtDtn95fMckM6QhWBuokimIhtcylYErijdILJlWMUkceEfPAdcgD5auyeb7IWZLZ0F4cyMKZmif1RpGmuVbT1TurEgKXnktf8UiGNQ7Fj+kn6apA9sEIKMSG18ch8rrzHiYkdT2F/+jnlyJN/Gm71Qmc0IhK/DJkItXs1ySB1IJYSW97FD7KnL1gc6hHtfcaLn4AY+4+cguxmdIN2VhlWEqwiWhufadcfM2EWYWIPo4KNRKspEGlEqcGo7AhGPI1R8fphnMfOCunGMtouzVdyxSawH94ek4QtWiQs7ilfGByrVYeCfAPJjpJkGYMH6WMc7MZWZY7AYWyKucU/AHbufYbwYW0ZFNYdg5g+oZ8IaTpmd0vIBFK9mGnVvMkRV3dfPfM0wXALGO/CchCtmP3+Q/cmOPwg8Rbhe5lhoiYiA7PWscs3xVS1GMbDcLhux8XZa2JQk+50II8LzGy3JM6MU=
X-Forefront-Antispam-Report: CIP:144.49.247.19; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.ds.dlp.protect.symantec.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(39860400002)(396003)(346002)(376002)(136003)(36840700001)(46966006)(316002)(47076005)(5660300002)(83380400001)(52536014)(356005)(33656002)(70586007)(81166007)(7696005)(86362001)(36860700001)(82310400003)(110136005)(82740400003)(18265965003)(8936002)(166002)(19627405001)(70206006)(224303003)(4186021)(478600001)(966005)(30864003)(186003)(2940100002)(2906002)(55016002)(9686003)(26005)(6506007)(336012)(21314003)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 11:45:37.4176 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b80d6b6e-4006-4582-cca7-08d971f502b4
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e; Ip=[144.49.247.19];
 Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR0801MB2184
X-Proofpoint-GUID: R0JGbSFd0vpwoaOV35OCH2CqMMkWIBXB
X-Proofpoint-ORIG-GUID: R0JGbSFd0vpwoaOV35OCH2CqMMkWIBXB
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-07_03:2021-09-07,
 2021-09-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109070077
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_DM6PR08MB55143613FB0DC63B25DD9395DCD39DM6PR08MB5514namp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgQW5kcmVpLA0KDQpJIHRoaW5rIEkgaGF2ZSBmaWd1cmVkIG91dCB0aGUgcm9vdCBjYXVzZSB0
aGF0J3MgSSBkaWRuJ3QgYWRkIHRoZSBjb21tYW5kIGluIHRoZSBpcG1pLXdoaXRlbGlzdC5jb25m
IHdpdGhpbiB0aGUgaW50ZWwtaXBtaS1vZW0uIFRoYW5rIHlvdSBhbGwgdGhlIHNhbWUuDQoNClJl
Z2FyZHMsDQpDaHJpcyBDaGVuDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQqx
SKXzqsw6IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNlcytjaHJpcy5jaGVuMz1mbGV4LmNvbUBsaXN0
cy5vemxhYnMub3JnPiClTqrtIENocmlzIENoZW4gKFRQSSkgPENocmlzLkNoZW4zQGZsZXguY29t
Pg0KsUil86TptME6IDIwMjGmfjmk6zek6SCkVaTIIDA1OjUyDQqmrKXzqsw6IEFuZHJlaSBLYXJ0
YXNoZXYgPGEua2FydGFzaGV2QHlhZHJvLmNvbT47IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZyA8
b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KpUSmrjogpl7C0Dogpl7C0DogW3Bob3NwaG9yLWhv
c3QtaXBtaWRdIFF1ZXN0aW9ucyBhYm91dCBJUE1JIChPRU0pIGNvbW1hbmQgZGV2ZWxvcG1lbnQN
Cg0KSGkgQW5kcmVpLA0KDQpPbmUgbW9yZSB0aGluZyB3b3VsZCBsaWtlIHRvIGNvbnN1bHQgeW91
IGlzIEkgaGF2ZSB0cmllZCB0byBhZGQgb3VyIG93biB4eHgtaXBtaS1vZW0sIGJ1dCBnb3QgdGhl
ICJJbnN1ZmZpY2llbnQgcHJpdmlsZWdlIGxldmVsIiBmZWVkYmFjayBhZnRlciBleGVjdXRpbmcg
YW4gb2VtIGNvbW1hbmQuIEhvd2V2ZXIsIGl0IHdvdWxkIGJlIHN1Y2Nlc3NmdWwgaW4gY2FzZSBJ
IHJlbW92ZWQgaW50ZWwtaXBtaS1vZW0uIERvIHlvdSBoYXZlIGV4cGVyaWVuY2Ugd2l0aCB0aGlz
PyBJZiB5ZXMsIG1heSBJIGtub3cgaG93IHRvIGZpeCBpdD8NCg0KSSBjdXJyZW50bHkgd291bGQg
bGlrZSB0byBrZWVwIGxldmVyYWdpbmcgdGhlIGludGVsLWlwbWktb2VtIHVudGlsIEkgaW50ZWdy
YXRlIHRoZSBjb21tYW5kcyBJIG5lZWRlZCBpbnRvIG91ciBvd24geHh4LWlwbWktb2VtLg0KDQoN
ClRoYW5rIHlvdS4NCg0KUmVnYXJkcywNCkNocmlzIENoZW4NCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCrFIpfOqzDogb3BlbmJtYyA8b3BlbmJtYy1ib3VuY2VzK2NocmlzLmNo
ZW4zPWZsZXguY29tQGxpc3RzLm96bGFicy5vcmc+IKVOqu0gQ2hyaXMgQ2hlbiAoVFBJKSA8Q2hy
aXMuQ2hlbjNAZmxleC5jb20+DQqxSKXzpOm0wTogMjAyMaZ+OaTrN6TpIKRXpMggMDg6MzUNCqas
pfOqzDogQW5kcmVpIEthcnRhc2hldiA8YS5rYXJ0YXNoZXZAeWFkcm8uY29tPjsgb3BlbmJtY0Bs
aXN0cy5vemxhYnMub3JnIDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQqlRKauOiCmXsLQOiCm
XsLQOiBbcGhvc3Bob3ItaG9zdC1pcG1pZF0gUXVlc3Rpb25zIGFib3V0IElQTUkgKE9FTSkgY29t
bWFuZCBkZXZlbG9wbWVudA0KDQpIaSBBbnJkcmVpLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgaGVs
cGZ1bCBjb21tZW50cy4NCg0KUmVnYXJkcywNCkNocmlzIENoZW4NCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18NCrFIpfOqzDogQW5kcmVpIEthcnRhc2hldiA8YS5rYXJ0YXNoZXZA
eWFkcm8uY29tPg0KsUil86TptME6IDIwMjGmfjmk6zak6SCkVaTIIDA2OjE1DQqmrKXzqsw6IENo
cmlzIENoZW4gKFRQSSkgPENocmlzLkNoZW4zQGZsZXguY29tPjsgb3BlbmJtY0BsaXN0cy5vemxh
YnMub3JnIDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQqlRKauOiBSZTogpl7C0DogW3Bob3Nw
aG9yLWhvc3QtaXBtaWRdIFF1ZXN0aW9ucyBhYm91dCBJUE1JIChPRU0pIGNvbW1hbmQgZGV2ZWxv
cG1lbnQNCg0KSGVsbG8sDQoNCkkgZG9uJ3QgcmVwcmVzZW50IEludGVsLCBidXQgaGF2ZSBzb21l
IGNvbnNpZGVyYXRpb25zIGFib3V0IHRoaXMgdG9waWM6DQoxKSBUcnkgdG8gbm90IHJldXNlIGlu
dGVsLWlwbWktb2VtLiBNdWNoIGJldHRlciBzb2x1dGlvbiB3b3VsZCBiZSB0bw0KY3JlYXRlIHlv
dXIgb3duIHh4eC1pcG1pLW9lbSBwYWNrYWdlIGFuZCBpbXBsZW1lbnQgb25seSBtZXRob2RzIHlv
dQ0KcmVhbGx5IG5lZWQuDQoyKSBCZXR0ZXIgd2F5IHdvdWxkIGJlIHRvIGltcGxlbWVudCByZXF1
aXJlZCBsb2dpYyBpbiBwaG9zcGhvci1ob3N0LQ0KaXBtaWQgYW5kIHN1Ym1pdCBjaGFuZ2VzIHRo
ZXJlLiBJIGRpZG4ndCBpbnZlc3RpZ2F0ZSB0aGlzIHlldCBzaW5jZSB3ZQ0KYWxzbyBwdWxsIGlu
dGVsLWlwbWktb2VtIHRvIG91ciBwcm9qZWN0LCBidXQgSSBiZWxpZXZlLCBpdCBzaG91bGQgbm90
DQpiZSB0b28gZGlmZmljdWx0LiBEb24ndCByZXBlYXQgb3VyIG1pc3Rha2VzICkuDQozKSBUaGVy
ZSBpcyBwcmlvcml0eSBhcmd1bWVudCB3aGljaCB5b3UgY2FuIHVzZSB0byBkZXRlcm1pbmUgaGFu
ZGxlcg0KY2FsbCBvcmRlci4NCjQpIE1vc3QgZnVuY3Rpb25zIHRoZXJlIGFyZSBzcGVjaWZpYyBm
b3IgSW50ZWwgc2VydmVycywgc28gdGhlIHVzZWxlc3MNCmV2ZW4gaXMgeW91IHVzZSBJbnRlbCBD
UFVzIGJ1dCB5b3VyIG93biBwbGF0Zm9ybS4NCjUpIFVzZSAiam91cm5hbGN0bCAtdCBpcG1pZCAt
byBwcmV0dHktanNvbiIgb3Igc29tZXRoaW5nIGxpa2UgdGhpcy4gQnV0DQpub3cgaXQgaXMgcmVj
b21tZW5kZWQgdG8gdXNlIG5ldyBzeW50YXg6DQpodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19f
aHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3ItbG9nZ2luZy9ibG9iL21hc3Rlci9k
b2NzL3N0cnVjdHVyZWQtbG9nZ2luZy5tZF9fOyEhSFNudGxDZyFHNjFYY1Z4VXI4SGxpOEhxSWxl
YlZZamkzdFRQWHNuMzNXNW95by1GbFU4ZmJtNlpkNjZTMEg2Y3NlcnU2QmN3JA0KDQoNCk9uIE1v
biwgMjAyMS0wOS0wNiBhdCAwOTo0MCArMDAwMCwgQ2hyaXMgQ2hlbiAoVFBJKSB3cm90ZToNCj4g
SGkgYWxsLA0KPg0KPiBJIGd1ZXNzIHRoaXMgbWFpbCB3YXMgZ290IG92ZXJ3aGVsbWVkIGJ5IGJ1
bmNoZXMgb2YgZW1haWxzLCBzbyBwbGVhc2UNCj4gbGV0IG1lIHJlc2VuZCBpdCBhbmQgaG9wZSBz
b21lb25lIGNvdWxkIGhlbHAgbWUuIEFub3RoZXIsIEkgYWRkIG9uZQ0KPiBtb3JlIHF1ZXN0aW9u
IG1hcmtlZCAjNSBiZWxvdy4NCj4NCj4gVGhhbmsgeW91Lg0KPg0KPiBSZWdhcmRzLA0KPiBDaHJp
cyBDaGVuDQo+DQo+ILFIpfOqzDogb3BlbmJtYyA8b3BlbmJtYy1ib3VuY2VzK2NocmlzLmNoZW4z
PWZsZXguY29tQGxpc3RzLm96bGFicy5vcmc+IKVOqu0NCj4gQ2hyaXMgQ2hlbiAoVFBJKSA8Q2hy
aXMuQ2hlbjNAZmxleC5jb20+DQo+ILFIpfOk6bTBOiAyMDIxpn45pOsypOkgpFWkyCAwNjozNA0K
PiCmrKXzqsw6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZyA8b3BlbmJtY0BsaXN0cy5vemxhYnMu
b3JnPg0KPiClRKauOiBbcGhvc3Bob3ItaG9zdC1pcG1pZF0gUXVlc3Rpb25zIGFib3V0IElQTUkg
KE9FTSkgY29tbWFuZA0KPiBkZXZlbG9wbWVudA0KPiBIaSBhbGwsDQo+DQo+IEkgaGF2ZSBzdHVk
aWVkICJwaG9zcGhvci1ob3N0LWlwbWlkIiBwYWNrYWdlIGZvciBhIGNvdXBsZSBvZiB3ZWVrcyBh
bmQNCj4gZ290IHVuZGVyc3RhbmRpbmcgdGhhdCBpdCBoYXMgaW1wbGVtZW50ZWQgc29tZSBtYW5k
YXRvcnkgYW5kIG9wdGlvbmFsDQo+IGNvbW1hbmRzIGFscmVhZHkuIEFuZCBJIGFsc28ga25ldyB0
aGF0IEknbSBhYmxlIHRvIGxldmVyYWdlICJpbnRlbC0NCj4gaXBtaS1vZW0iIHBhY2thZ2UgdG8g
Z2V0IG1vcmUgY29tbWFuZCBoYW5kbGVycy4gQnV0IHRoZXJlJ3JlIHNvbWUNCj4gcXVlc3Rpb25z
IHJhaXNlZCBpbiBteSBtaW5kLCBJIGhvcGUgc29tZW9uZSBjb3VsZCBnaXZlIG1lIHNvbWUNCj4g
c3VnZ2VzdGlvbnMuDQo+ICAgIDEuIFdoYXQncyB0aGUgbm9ybWFsIGRldmVsb3BtZW50IHByb2Nl
ZHVyZSBpbiBjYXNlIEkgd2FudCB0byBtYWtlDQo+IG91ciBvd24gT0VNIGNvbW1hbmRzPyBJIG1l
YW4gZG8geW91IGd1eXMgZW5jb3VyYWdlIG1lIHRvIGNyZWF0ZSBhIG5ldw0KPiAieHh4LWlwbWkt
b2VtIiBwYWNrYWdlIG9yIHRvIGxldmVyYWdlICJpbnRlbC1pcG1pLW9lbSIgYW5kIHRoZW4gYWRk
IG91cg0KPiBvd24gY29tbWFuZHMgaW4gaXQ/DQo+ICAgIDIuIEkgZm9yIG5vdyBhZGRlZCAiaW50
ZWwtaXBtaS1vZW0iIHBhY2thZ2Ugb25seSBmb3IgdXNpbmcgaXRzDQo+ICI8Q2hhc3Npcz46PFNl
dCBGcm9udCBQYW5lbCBFbmFibGVzPiIgY29tbWFuZCBiZWNhdXNlIEkgZmlndXJlZCBvdXQgdGhl
DQo+IHNhbWUgY29tbWFuZCBpbiB0aGUgInBob3NwaG9yLWhvc3QtaXBtaWQiIGlzIG5vdCBhYmxl
IHRvIG1hdGNoIHRoZSBkLQ0KPiBidXMgaW50ZXJmYWNlIGluIHRoZSAieDg2LXBvd2VyLWNvbnRy
b2wiLiBJJ20gbm90IHN1cmUgaWYgSSB3aWxsIG5lZWQNCj4gb3RoZXIgY29tbWFuZHMgaW4gdGhl
ICJpbnRlbC1pcG1pLW9lbSIsIGJ1dCB3aGF0IGlmIEkgZG9uJ3QgbmVlZCBvdGhlcg0KPiBjb21t
YW5kcywgaG93IHRvIHJlbW92ZSB0aGVtPyB0byB1c2UgdGhlIHdoaXRlbGlzdCBtZWNoYW5pc20/
DQo+ICAgIDMuIElzIGl0IG9rYXkgdG8gYWRkIG1vcmUgdGhhbiAxIHh4eC1pcG1pLW9tZSBwYWNr
YWdlcz8gSWYgeWVzLCBob3cNCj4gdG8gbWFuYWdlIHRoZSB3aGl0ZWxpc3QgYmV0d2VlbiB0aGVz
ZSAyIE9FTSBwYWNrYWdlcz8NCj4gICAgNC4gQW0gSSBhYmxlIHRvIHVzZSAiaW50ZWwtaXBtaS1v
ZW0iIG9uIGEgcGxhdGZvcm0gdGhhdCBpcyB1c2luZyBBTUQNCj4gQ1BVPw0KPiAgICA1LiBIb3cg
dG8gcHJpbnQgdGhlICJlbnRyeSgiU0VOREVSPSVzIiwgc2VuZGVyLmNfc3RyKCkpIiBwYXJ0cz8g
SQ0KPiBtZWFuIEkgZm9yIG5vdyBjYW4gcHJpbnQgb3V0ICJTZXQgdXAgaXBtaSBjb250ZXh0IiBz
dHJpbmcgYWZ0ZXINCj4gZm9sbG93aW5nIHRoZSBpbnN0cnVjdGlvbiBsaXN0ZWQgaW4NCj4gImh0
dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVu
Ym1jL3dpa2kvRGVidWdnaW5nLU9wZW5CTUMqZW5hYmxpbmctYXBwbGljYXRpb24tZGVidWdfXztJ
dyEhSFNudGxDZyFHNjFYY1Z4VXI4SGxpOEhxSWxlYlZZamkzdFRQWHNuMzNXNW95by1GbFU4ZmJt
NlpkNjZTMEg2Y3NWWnRIWU0yJA0KPiAiLCBidXQgSSBkb24ndCBzZWUgIlNFTkRFUj0iIHdoZW4g
SSBleGVjdXRlZCAiam91cm5hbGN0bCAtdCBpcG1pZCINCj4gY29tbWFuZC4NCj4gICAgNi4gICAg
MS4gbG9nPGxldmVsOjpERUJVRz4oIlNldCB1cCBpcG1pDQo+IGNvbnRleHQiLGVudHJ5KCJTRU5E
RVI9JXMiLHNlbmRlci5jX3N0cigpKSwNCj4gZW50cnkoIk5FVEZOPTB4JVgiLCBuZXRGbiksZW50
cnkoIkxVTj0weCVYIiwgbHVuKSwNCj4gZW50cnkoIkNNRD0weCVYIiwgY21kKSxlbnRyeSgiQ0hB
Tk5FTD0ldSIsIGNoYW5uZWwpLA0KPiAgIGVudHJ5KCJVU0VSSUQ9JXUiLCB1c2VySWQpLA0KPiBl
bnRyeSgiU0VTU0lPTklEPTB4JVgiLCBzZXNzaW9uSWQpLA0KPiBlbnRyeSgiUFJJVklMRUdFPSV1
IixzdGF0aWNfY2FzdDx1aW50OF90Pihwcml2aWxlZ2UpKSwNCj4gICAgIGVudHJ5KCJSUVNBPSV4
IiwgcnFTQSkpOw0KPiBUaGFuayB5b3UuDQo+DQo+IFJlZ2FyZHMsDQo+IENocmlzIENoZW4NCj4g
TGVnYWwgRGlzY2xhaW1lciA6DQo+IFRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBt
ZXNzYWdlIG1heSBiZSBwcml2aWxlZ2VkIGFuZA0KPiBjb25maWRlbnRpYWwuDQo+IEl0IGlzIGlu
dGVuZGVkIHRvIGJlIHJlYWQgb25seSBieSB0aGUgaW5kaXZpZHVhbCBvciBlbnRpdHkgdG8gd2hv
bSBpdA0KPiBpcyBhZGRyZXNzZWQNCj4gb3IgYnkgdGhlaXIgZGVzaWduZWUuIElmIHRoZSByZWFk
ZXIgb2YgdGhpcyBtZXNzYWdlIGlzIG5vdCB0aGUgaW50ZW5kZWQNCj4gcmVjaXBpZW50LA0KPiBp
cyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIG1lc3NhZ2Ug
aW4gZXJyb3IsDQo+IHBsZWFzZSBpbW1lZGlhdGVseSBub3RpZnkgdGhlIHNlbmRlciBhbmQgZGVs
ZXRlIG9yIGRlc3Ryb3kgYW55IGNvcHkgb2YNCj4gdGhpcyBtZXNzYWdlIQ0KDQotLQ0KQmVzdCBy
ZWdhcmRzLA0KQW5kcmVpIEthcnRhc2hldg0KDQoNCg==

--_000_DM6PR08MB55143613FB0DC63B25DD9395DCD39DM6PR08MB5514namp_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Andrei,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I think I have figured out the root cause that's I didn't add the command i=
n the ipmi-whitelist.conf within the intel-ipmi-oem.&nbsp;Thank you all the=
 same.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Chris Chen</div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>=B1H=A5=F3=AA=CC:</b> openbmc &=
lt;openbmc-bounces+chris.chen3=3Dflex.com@lists.ozlabs.org&gt; =A5N=AA=ED C=
hris Chen (TPI) &lt;Chris.Chen3@flex.com&gt;<br>
<b>=B1H=A5=F3=A4=E9=B4=C1:</b> 2021=A6~9=A4=EB7=A4=E9 =A4U=A4=C8 05:52<br>
<b>=A6=AC=A5=F3=AA=CC:</b> Andrei Kartashev &lt;a.kartashev@yadro.com&gt;; =
openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>=A5D=A6=AE:</b> =A6^=C2=D0: =A6^=C2=D0: [phosphor-host-ipmid] Questions =
about IPMI (OEM) command development</font>
<div>&nbsp;</div>
</div>
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Hi Andrei,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
One more thing would like to consult you is I have tried to add our own xxx=
-ipmi-oem, but got the &quot;Insufficient privilege level&quot; feedback af=
ter executing an oem command. However, it would be successful in case I rem=
oved intel-ipmi-oem. Do you have experience
 with this? If yes, may I know how to fix it?<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
I currently would like to keep leveraging the intel-ipmi-oem until I integr=
ate the commands I needed into our own xxx-ipmi-oem.<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thank you.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Regards,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Chris Chen</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>=B1H=A5=F3=AA=CC:</b> openbmc=
 &lt;openbmc-bounces+chris.chen3=3Dflex.com@lists.ozlabs.org&gt; =A5N=AA=ED=
 Chris Chen (TPI) &lt;Chris.Chen3@flex.com&gt;<br>
<b>=B1H=A5=F3=A4=E9=B4=C1:</b> 2021=A6~9=A4=EB7=A4=E9 =A4W=A4=C8 08:35<br>
<b>=A6=AC=A5=F3=AA=CC:</b> Andrei Kartashev &lt;a.kartashev@yadro.com&gt;; =
openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>=A5D=A6=AE:</b> =A6^=C2=D0: =A6^=C2=D0: [phosphor-host-ipmid] Questions =
about IPMI (OEM) command development</font>
<div>&nbsp;</div>
</div>
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Hi Anrdrei,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thank you for your helpful comments.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Regards,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Chris Chen&nbsp;</div>
<div>
<div id=3D"x_x_appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif=
" color=3D"#000000" style=3D"font-size:11pt"><b>=B1H=A5=F3=AA=CC:</b> Andre=
i Kartashev &lt;a.kartashev@yadro.com&gt;<br>
<b>=B1H=A5=F3=A4=E9=B4=C1:</b> 2021=A6~9=A4=EB6=A4=E9 =A4U=A4=C8 06:15<br>
<b>=A6=AC=A5=F3=AA=CC:</b> Chris Chen (TPI) &lt;Chris.Chen3@flex.com&gt;; o=
penbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>=A5D=A6=AE:</b> Re: =A6^=C2=D0: [phosphor-host-ipmid] Questions about IP=
MI (OEM) command development</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_x_BodyFragment"><font size=3D"2"><span style=3D"font-size:1=
1pt">
<div class=3D"x_x_PlainText">Hello,<br>
<br>
I don't represent Intel, but have some considerations about this topic:<br>
1) Try to not reuse intel-ipmi-oem. Much better solution would be to<br>
create your own xxx-ipmi-oem package and implement only methods you<br>
really need.<br>
2) Better way would be to implement required logic in phosphor-host-<br>
ipmid and submit changes there. I didn't investigate this yet since we<br>
also pull intel-ipmi-oem to our project, but I believe, it should not<br>
be too difficult. Don't repeat our mistakes ).<br>
3) There is priority argument which you can use to determine handler<br>
call order.<br>
4) Most functions there are specific for Intel servers, so the useless<br>
even is you use Intel CPUs but your own platform.<br>
5) Use &quot;journalctl -t ipmid -o pretty-json&quot; or something like thi=
s. But<br>
now it is recommended to use new syntax:<br>
<a href=3D"https://urldefense.com/v3/__https://github.com/openbmc/phosphor-=
logging/blob/master/docs/structured-logging.md__;!!HSntlCg!G61XcVxUr8Hli8Hq=
IlebVYji3tTPXsn33W5oyo-FlU8fbm6Zd66S0H6cseru6Bcw$">https://urldefense.com/v=
3/__https://github.com/openbmc/phosphor-logging/blob/master/docs/structured=
-logging.md__;!!HSntlCg!G61XcVxUr8Hli8HqIlebVYji3tTPXsn33W5oyo-FlU8fbm6Zd66=
S0H6cseru6Bcw$</a>
<br>
<br>
<br>
On Mon, 2021-09-06 at 09:40 +0000, Chris Chen (TPI) wrote:<br>
&gt; Hi all,<br>
&gt; <br>
&gt; I guess this mail was got overwhelmed by bunches of emails, so please<=
br>
&gt; let me resend it and hope someone could help me. Another, I add one<br=
>
&gt; more question marked #5 below.<br>
&gt; <br>
&gt; Thank you.<br>
&gt; <br>
&gt; Regards,<br>
&gt; Chris Chen<br>
&gt; <br>
&gt; =B1H=A5=F3=AA=CC: openbmc &lt;openbmc-bounces+chris.chen3=3Dflex.com@l=
ists.ozlabs.org&gt; =A5N=AA=ED<br>
&gt; Chris Chen (TPI) &lt;Chris.Chen3@flex.com&gt;<br>
&gt; =B1H=A5=F3=A4=E9=B4=C1: 2021=A6~9=A4=EB2=A4=E9 =A4U=A4=C8 06:34<br>
&gt; =A6=AC=A5=F3=AA=CC: openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.=
org&gt;<br>
&gt; =A5D=A6=AE: [phosphor-host-ipmid] Questions about IPMI (OEM) command<b=
r>
&gt; development&nbsp;<br>
&gt; Hi all,<br>
&gt; <br>
&gt; I have studied &quot;phosphor-host-ipmid&quot; package for a couple of=
 weeks and<br>
&gt; got understanding that it has implemented some mandatory and optional<=
br>
&gt; commands already. And I also knew that I'm able to leverage &quot;inte=
l-<br>
&gt; ipmi-oem&quot; package to get more command handlers. But there're some=
<br>
&gt; questions raised in my mind, I hope someone could give me some<br>
&gt; suggestions.<br>
&gt; &nbsp;&nbsp;&nbsp;1. What's the normal development procedure in case I=
 want to make<br>
&gt; our own OEM commands? I mean do you guys encourage me to create a new<=
br>
&gt; &quot;xxx-ipmi-oem&quot; package or to leverage &quot;intel-ipmi-oem&q=
uot; and then add our<br>
&gt; own commands in it?<br>
&gt; &nbsp;&nbsp;&nbsp;2. I for now added &quot;intel-ipmi-oem&quot; packag=
e only for using its<br>
&gt; &quot;&lt;Chassis&gt;:&lt;Set Front Panel Enables&gt;&quot; command be=
cause I figured out the<br>
&gt; same command in the&nbsp;&quot;phosphor-host-ipmid&quot; is not able t=
o match the d-<br>
&gt; bus interface in the &quot;x86-power-control&quot;. I'm not sure if I =
will need<br>
&gt; other commands in the &quot;intel-ipmi-oem&quot;, but what if I don't =
need other<br>
&gt; commands, how to remove them? to use the whitelist mechanism?<br>
&gt; &nbsp;&nbsp;&nbsp;3. Is it okay to add more than 1 xxx-ipmi-ome packag=
es? If yes, how<br>
&gt; to manage the whitelist between these 2 OEM packages?<br>
&gt; &nbsp;&nbsp;&nbsp;4. Am I able to use&nbsp;&quot;intel-ipmi-oem&quot; =
on a platform that is using AMD<br>
&gt; CPU?<br>
&gt; &nbsp;&nbsp;&nbsp;5. How to print the &quot;entry(&quot;SENDER=3D%s&qu=
ot;, sender.c_str())&quot; parts? I<br>
&gt; mean I for now can print out &quot;Set up ipmi context&quot; string af=
ter<br>
&gt; following the instruction listed in<br>
&gt; &quot;<a href=3D""></a>https://urldefense.com/v3/__https://github.com/=
openbmc/openbmc/wiki/Debugging-OpenBMC*enabling-application-debug__;Iw!!HSn=
tlCg!G61XcVxUr8Hli8HqIlebVYji3tTPXsn33W5oyo-FlU8fbm6Zd66S0H6csVZtHYM2$
<br>
&gt; &quot;, but I don't see &quot;SENDER=3D&quot; when I executed &quot;jo=
urnalctl -t ipmid&quot;<br>
&gt; command.<br>
&gt; &nbsp;&nbsp;&nbsp;6.&nbsp;&nbsp;&nbsp; 1. log&lt;level::DEBUG&gt;(&quo=
t;Set up ipmi<br>
&gt; context&quot;,entry(&quot;SENDER=3D%s&quot;,sender.c_str()),&nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
&gt; entry(&quot;NETFN=3D0x%X&quot;, netFn),entry(&quot;LUN=3D0x%X&quot;, l=
un),&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;<br>
&gt; entry(&quot;CMD=3D0x%X&quot;, cmd),entry(&quot;CHANNEL=3D%u&quot;, cha=
nnel),&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
<br>
&gt; &nbsp; entry(&quot;USERID=3D%u&quot;, userId),&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
&gt; entry(&quot;SESSIONID=3D0x%X&quot;, sessionId),&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
&gt; entry(&quot;PRIVILEGE=3D%u&quot;,static_cast&lt;uint8_t&gt;(privilege)=
),&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
&gt; &nbsp; &nbsp; entry(&quot;RQSA=3D%x&quot;, rqSA));<br>
&gt; Thank you.<br>
&gt; <br>
&gt; Regards,<br>
&gt; Chris Chen<br>
&gt; Legal Disclaimer :<br>
&gt; The information contained in this message may be privileged and<br>
&gt; confidential. <br>
&gt; It is intended to be read only by the individual or entity to whom it<=
br>
&gt; is addressed<br>
&gt; or by their designee. If the reader of this message is not the intende=
d<br>
&gt; recipient,<br>
&gt; is strictly prohibited. If you have received this message in error, <b=
r>
&gt; please immediately notify the sender and delete or destroy any copy of=
<br>
&gt; this message!<br>
<br>
-- <br>
Best regards,<br>
Andrei Kartashev<br>
<br>
<br>
</div>
</span></font></div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_DM6PR08MB55143613FB0DC63B25DD9395DCD39DM6PR08MB5514namp_--
