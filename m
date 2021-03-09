Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A194C3323CE
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 12:19:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dvt4w04xDz3cHS
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 22:18:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=lCFBf98u;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=lCFBf98u;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.97; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=lCFBf98u; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=lCFBf98u; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320097.outbound.protection.outlook.com [40.107.132.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dvt4b5MqRz30J0
 for <openbmc@lists.ozlabs.org>; Tue,  9 Mar 2021 22:18:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7pkS/L541vi2BCXnq5MtJ9h3r0BsRPqM9LvnLqJr04M=;
 b=lCFBf98umjxoMY/AFMOYihGgA2U2v3rjIWotV+a/zbbblQRVYCcF6F9kBhAycH3wJJupDE8UfulHBRMPqA5JYYWv01OuYkKKnZB4UhhwKrmdMDb/MrNll3t9r+r14RuV572dosdFFWaoOli7WZYjXHZWEp1MJWwtorLQAmV4s6LEKH0MXDkO3DFYMYG2qimC/xNYgjdIZInGcJhq1wbGeGJ7JJ7B6ofuQD5P0Fl2jX2NA+batP5oYeYfgsuuqwy7KtlE6385pUR2HNnUP8aK/DeUiVcr4ZH29oVeLoiGPZdTtsMIG1hinA4rOJyxnSMKGUJ7pfE0v3dcvWbsT5/+aQ==
Received: from HK2P15301CA0010.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::20)
 by HK0PR04MB3138.apcprd04.prod.outlook.com (2603:1096:203:3f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Tue, 9 Mar
 2021 11:18:25 +0000
Received: from HK2APC01FT041.eop-APC01.prod.protection.outlook.com
 (2603:1096:202:1:cafe::cd) by HK2P15301CA0010.outlook.office365.com
 (2603:1096:202:1::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.3 via Frontend
 Transport; Tue, 9 Mar 2021 11:18:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.51)
 smtp.mailfrom=hcl.com; tanous.net; dkim=pass (signature was verified)
 header.d=HCL.COM;tanous.net; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.51 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.51; helo=KOR01-SL2-obe.outbound.protection.outlook.com;
Received: from KOR01-SL2-obe.outbound.protection.outlook.com (192.8.245.51) by
 HK2APC01FT041.mail.protection.outlook.com (10.152.249.47) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.19 via Frontend Transport; Tue, 9 Mar 2021 11:18:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLdadtsScN/R4ZAYdxfLUPm6hjOicBSxTdKIXBzBLHGHltoAccMpsJpetbYsh7+URU4jmWbmht1oqROmrIsEyo86seTty8MEc3r+7fflS5GcOgz348zCFZ8HHg4h+7OI3eODOoh1fuFQXx8yGCAYPlJMZr0B7Ia5ePU+cQG+CMftWD/a07Q4hHjzvIDdVyarCrErWXW5DB6njiKdu501C9py4emSoNZrGLKVAfOQ2+ZxujZIMV2/okogm1iiHvhTh+CdVJsNcw6a4Tf8Jf+FkPN82lJGc/OZFcCy0ke/ZIkU2W5kIQreocnb5z4JJMX/6WGRtksRizS2Xt08+p4zkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7pkS/L541vi2BCXnq5MtJ9h3r0BsRPqM9LvnLqJr04M=;
 b=g4HGlEANlG8TY6fwSuoLnw7hMBeSpP7HHsYh2DAowtk2gxKqfnESOUnmmE3q4gXsiZCQfYI8ff61hwILE6V0AE8eHSLV75JAJzfV7oUgeeVEDgirZ5DtTFUy0wSmRNFKfIThxW1e4mUxomxNG3rtgZoKYWxTtIf61mv0om+xFloRRF9NVQV4GaC6BZqxNBuC9hoyeWfsFsfInRGIvkm00Uour68N2IxR9wqz/6a0CtqzpcnNNeZg1m0ydjhNacDciUNml/6YjmC2VJMxKv6HX/X6tY5NVQenYWdKm5sW7kcLkpsjuoi1Y5v2rZ62FWLD3m/yeqtjR9L/h4N+Zc5HTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7pkS/L541vi2BCXnq5MtJ9h3r0BsRPqM9LvnLqJr04M=;
 b=lCFBf98umjxoMY/AFMOYihGgA2U2v3rjIWotV+a/zbbblQRVYCcF6F9kBhAycH3wJJupDE8UfulHBRMPqA5JYYWv01OuYkKKnZB4UhhwKrmdMDb/MrNll3t9r+r14RuV572dosdFFWaoOli7WZYjXHZWEp1MJWwtorLQAmV4s6LEKH0MXDkO3DFYMYG2qimC/xNYgjdIZInGcJhq1wbGeGJ7JJ7B6ofuQD5P0Fl2jX2NA+batP5oYeYfgsuuqwy7KtlE6385pUR2HNnUP8aK/DeUiVcr4ZH29oVeLoiGPZdTtsMIG1hinA4rOJyxnSMKGUJ7pfE0v3dcvWbsT5/+aQ==
Received: from SL2PR04MB3097.apcprd04.prod.outlook.com (2603:1096:100:38::9)
 by SL2PR04MB3067.apcprd04.prod.outlook.com (2603:1096:100:2f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Tue, 9 Mar
 2021 11:18:19 +0000
Received: from SL2PR04MB3097.apcprd04.prod.outlook.com
 ([fe80::1585:3ec:7583:9b2f]) by SL2PR04MB3097.apcprd04.prod.outlook.com
 ([fe80::1585:3ec:7583:9b2f%3]) with mapi id 15.20.3890.039; Tue, 9 Mar 2021
 11:18:19 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: Ed Tanous <ed@tanous.net>
Subject: RE: Negative value returns for sensor in tiogapass
Thread-Topic: Negative value returns for sensor in tiogapass
Thread-Index: AdcMHNUlzX6I6Je8Q2WRGNkpWs0ATgAP1CQAAeFPK8AAFO7oAAAoI65Q
Date: Tue, 9 Mar 2021 11:18:19 +0000
Message-ID: <SL2PR04MB30975F3703CAFEFBC1328025E1929@SL2PR04MB3097.apcprd04.prod.outlook.com>
References: <SG2PR04MB30939CC20F08C50A7031DBA5E19D9@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <CAH2-KxA4tQvaxzFcAWYhYrq9WeCLrLTRdknZW66XUBzOipoFrg@mail.gmail.com>
 <SG2PR04MB3093F7CA1D6801FDF9D6C5BAE1939@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <CACWQX80yb9PiT5S=rg_xOBiqJgETwRHekN=dE18rtxKKPuWfPA@mail.gmail.com>
In-Reply-To: <CACWQX80yb9PiT5S=rg_xOBiqJgETwRHekN=dE18rtxKKPuWfPA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiNDBjMGNmYWUtMTI5NS00MDBmLWFmYjYtMWQwMDQzMTU2ZjEyIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX1B1YmwxYyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6Ilh2XC9TN3IxNndXdHloMzhaNW9oWWVFd0R4enlSdEhrc0Q4anFtS24wSlNWc1lISFh0Um1iOERNTGgwRW5Qb1pvIn0=
x-hclclassification: HCL_Cla5s_Publ1c
Authentication-Results-Original: tanous.net; dkim=none (message not signed)
 header.d=none;tanous.net; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [157.51.58.143]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 6840a1fd-e0a1-4d6e-db73-08d8e2ed0e6b
x-ms-traffictypediagnostic: SL2PR04MB3067:|HK0PR04MB3138:
X-Microsoft-Antispam-PRVS: <HK0PR04MB31385C94321839B8D7B673F7E1929@HK0PR04MB3138.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 2Lwn8bIfzY6+yRTDpfCFy3QdMYtF1pegdTLMOnfLwyC3ulFNHeoFNVdCxWrNdZ/YFN4/VhYUVoWLi6HOSvilj5NZyhTtAdE/QqM7AfNPh+vjPPVQqfBekeketMZu7HH3p0bdV4jn3BZBpXszqyeGNdxX4MR+ObgM374uX0COooz1EpCjdEWFa3W8KJEHYQoJ6YASp7YB2jUEWFf2tvEotrzMjQUThiddrcWJr4J51Dy/F0LQ2X48Ju/mYlbFqA1GeVC0KgQrnq/DoKRuLZuZZmcMAj3kb2uhIkAh3ycmtt172GjStXjEflmhbn8/7uBsI/9CSXjnTrFgeR1DgzkyD768AZOvzEg0jdLTX176ti8zcdaK7S05IqlL5QUMKlSedLWVRJqdf86QXKmNwh3XwX/2ZWPTaZr0S68EbWRTa1e9R+BZy9u5nV8Dn5BjbXwPcRPxlDK2Zej1CsxnAOBuYyehy0ZE3pcgDICAjF9bIgtsgurPHA2GrY5uZHwiAKn/D/urDSZfyEkznnGIyOJrUwL5hMuqVsBonS9GChkeiuP8d1rcj8JSMu3P4iGJqdpUJ26BxJ+1W1DB1ieNLoS1TdMMcFuuURw7jWGkNWPUHa4=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SL2PR04MB3097.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(55016002)(45080400002)(33656002)(66556008)(2906002)(53546011)(6916009)(26005)(8936002)(5660300002)(478600001)(186003)(52536014)(4326008)(316002)(86362001)(83380400001)(8676002)(6506007)(71200400001)(9686003)(66476007)(966005)(54906003)(7696005)(64756008)(66446008)(66946007)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?fq0KD+S1F++d8J25jjyYBmCtVroidvxJYBUCiDibUyT4iWeZ4H0aYnrchqgT?=
 =?us-ascii?Q?F85s0AGK//adRht57G31SAbZ2DxLkIpC4Tk7aG/rlDKMk/GNveHM+eF9scxo?=
 =?us-ascii?Q?p6q+EH4ms5P4vHR47Dc/5vvMnD5c/Gbr2ETwJrp9+CVRFTRuZlPD2OscKeit?=
 =?us-ascii?Q?pvxj8PE7gDRioJrVlRNda7+xm4MhoykbVpjVgu0aZhNG+iBcLAISVA3/Wegk?=
 =?us-ascii?Q?GMIt0Dp1Cab/rhlwI66RXb/Nxm150Q9jy4Yj46kNZPM79Wsj2LPdPtrlOnbe?=
 =?us-ascii?Q?smMKRIk3z6l54Sqr0OSgZ6RZccR2ZhhHGyrjCcu3sR7UXpi6a6Qo36/xrnkH?=
 =?us-ascii?Q?PHztvw59+jWvWxExlmkU/ppoNjAbWhC2xs9vEaRqHmClG4anw2mAYXWFWTJx?=
 =?us-ascii?Q?MSOrJUgkUTbcR/OYfgQXeNVyEDpconsLDawjZrnPkVx5iomU6SHHR9HznSi5?=
 =?us-ascii?Q?e5iytODlaZR9NmnLx1nwy7t53Rqf8EXy631ki9j/kBPbQSCbkEx1cNAiz/pk?=
 =?us-ascii?Q?8gz8hutE1p1kUT8feRqAf7f6czMW3YCwXnlkg6X7g+BOddHyop1uF9wSRoHV?=
 =?us-ascii?Q?aaxmp723YtrxwYOsZ4CbpqhNdJy3akJe2Xfd0O7nswpExIjsfZTSlzp99RUv?=
 =?us-ascii?Q?OnqYJUnZx6LlMFUl1R/nUaG7d+8iKtpztbj1yEjriNbhau0vIwKhvEOOQohd?=
 =?us-ascii?Q?qg/aCT+w3gj9hHUas2QX4KzDyhwC8kl8Q3L60BS146SOE7SM5qDtw+dj5dI2?=
 =?us-ascii?Q?iA5Wq/pzd12Nof4ULMhJ2JZTfJk+SL1BshMCH0+dUtTq6Zj/XjyjSwQrEqzi?=
 =?us-ascii?Q?Q2ukIW8tMtRL7YiSuN3uUWMKs5nIF7ZlIkkMzxfkxtJVxyz8rJzgo3hcdClo?=
 =?us-ascii?Q?ufFHOLzpAarAvgA6H/Yroj3NjMUHP7iPACwpA6WzqQuRXQaCLFt3dVBdwqpf?=
 =?us-ascii?Q?Bvo8MZRNFL3d4Ql/XGTt4UvPWlrc6hcXXvYQJVypTsHu+PqTJcKM0WhE5HfG?=
 =?us-ascii?Q?AD+ItY9UT+R1q3p7r7qnHxHlwnEE4390cC8y1P+HEiOxK5X4sbEsUJFW3iJK?=
 =?us-ascii?Q?6EoTLSlIk6ZKXN2puhI4UnThpfL6oW0MPqqqqQ+CxvKK05PtQMAxBMvJPqUJ?=
 =?us-ascii?Q?MNpRNnSUcieMdkc3BxKP9KkSnA9pHs0jLQiDEUUAaKB6JB0P5QRw734Y56yR?=
 =?us-ascii?Q?mKBT+YFeE0p0MVslQgBHWH95w7MzWTWoF+nBdTl7G1w3KsNpM9vuMqcLRG/6?=
 =?us-ascii?Q?qfHEmWbDebnQOXGx1PBrLnRMR20lUNapR+YSk7dKd/cZvhnEl0xDSk8XNPAC?=
 =?us-ascii?Q?wQY=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR04MB3067
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT041.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 79212bfb-35b4-409f-4021-08d8e2ed0b35
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FuN+nXV/nKKk1gzPXNxaNZI+/J54lYDdotiCArG2ZPJmG/2tyuIBVUZAxx0GQBN7OWd76+18Ma+iC+/Da/7bWZXrUh2O43t1A83dgaWs7V0Qe4VL9VB/f02pVwTenGO6BefKVsYpeQN/Fp+xqQCMUTimcwQi+06EwGBDPn5OKVvsJocanmZfpVU5Cw6LA5Ym0TChNnivMj3Bf8TvCbV9Ey4JRKisdCFEc7+e16VAwjqeFzJOCNBI/9OZvpiD2NmEmmSDzZgVtXMEbGYa6ABepOlVLHwdl8mJSpxtl6iZ7sXqXkA/rruRye9HvDUExRZpwHsGhOdXz8+uBQGqn0I77on5gvgXqGtlsvyoXkVSNkLFBtgPHeyO7zd4AH9AsxTf4bCbvVfN6vRy/tutvBT3juEujxJOZzOHViisS6Maj4xUG13ACSFQObLPeEdWWwJxSXaJf3EDz2NtneKDngv233rY5XY/x8akHsOPH+ScjFODF+MgouWc9FxkXfQvqgrWdqWGX+Y6H5rikdg+ztwqka8szu0Z2TW+2tEBJMkQwofj/MJQ8M3vd3BMCeOGRkXzo+jFGMBmZb70qfY2HC1x/v6NQ5hl9RWezb+qWd6CtMTfQYySS8hdk/Vv160sIwYb6OdWPKF1B3cPoXRDCTwVmX+s9ZyptucT0P+YHwNHmQJzBGFZTmJFPJXqkyxtF29z29bKpNOaZh5lfBORoNWpd0gQcEXJTP/8O5xSP5L0ytSLhWWeOKR7xkjaAwhiPrpVEHtHzS29wblvnGm/+gm3O5/dbQmvKXNCxVbj8KZt4lw=
X-Forefront-Antispam-Report: CIP:192.8.245.51; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KOR01-SL2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(46966006)(36840700001)(36906005)(186003)(36860700001)(54906003)(70206006)(316002)(6916009)(4326008)(336012)(6506007)(53546011)(70586007)(7696005)(52536014)(26005)(34020700004)(86362001)(8676002)(9686003)(47076005)(82310400003)(5660300002)(82740400003)(8936002)(83380400001)(45080400002)(966005)(478600001)(55016002)(356005)(81166007)(33656002)(2906002)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 11:18:24.4104 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6840a1fd-e0a1-4d6e-db73-08d8e2ed0e6b
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.51];
 Helo=[KOR01-SL2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT041.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB3138
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
Cc: Ed Tanous <edtanous@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Classification: Public

Thanks Ed, I'll check it out.

-----Original Message-----
From: Ed Tanous <ed@tanous.net>=20
Sent: Monday, March 8, 2021 9:37 PM
To: Jayashree D <jayashree-d@hcl.com>
Cc: Ed Tanous <edtanous@google.com>; openbmc@lists.ozlabs.org
Subject: Re: Negative value returns for sensor in tiogapass

[CAUTION: This Email is from outside the Organization. Unless you trust the=
 sender, Don't click links or open attachments as it may be a Phishing emai=
l, which can steal your Information and compromise your Computer.]

On Sun, Mar 7, 2021 at 10:17 PM Jayashree D <jayashree-d@hcl.com> wrote:
>
> Classification: Public
>
> Hi Ed,
>
> In the below link, PXE1410CVR and ADM1278HSC are using the same reading f=
ormat.
> I am not able to find any information on PXE1410CVR. If there is any spec=
 available, could you please share it.
> It will be helpful to analyze both the specs and fix the problem.

I don't have any specs available for those.  I would assume they follow the=
 pmbus spec though, you might start there.

>
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith
> ub.com%2Fopenbmc%2Fdbus-sensors%2Fblob%2Fmaster%2Fsrc%2FIpmbSensor.cpp
> %23L144&amp;data=3D04%7C01%7Cjayashree-d%40hcl.com%7C8676d30f4d3a4dda1e0
> e08d8e24c4957%7C189de737c93a4f5a8b686f4ca9941912%7C0%7C0%7C63750816456
> 8775248%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC
> JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D5lhuUdfI%2BG75C8I1HDAaEH
> VP46%2Bz1r3nJV0ek3CiiR4%3D&amp;reserved=3D0
>
> Regards,
> Jayashree
>
>
> -----Original Message-----
> From: Ed Tanous <edtanous@google.com>
> Sent: Friday, February 26, 2021 9:57 PM
> To: Jayashree D <jayashree-d@hcl.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: Negative value returns for sensor in tiogapass
>
> [CAUTION: This Email is from outside the Organization. Unless you=20
> trust the sender, Don't click links or open attachments as it may be a=20
> Phishing email, which can steal your Information and compromise your=20
> Computer.]
>
> On Fri, Feb 26, 2021 at 12:55 AM Jayashree D <jayashree-d@hcl.com> wrote:
> >
> > Classification: Public
> >
> > Hi Team,
> >
> >
> >
> > Recently, I have tested sensors for tiogapass, in which one sensor retu=
rns negative value.
> >
> > After analysing the code in the dbus-sensors repo, I found the followin=
g issue.
> >
> >
> >
> > dbus-sensors/IpmbSensor.cpp at master * openbmc/dbus-sensors
> > (github.com)
> >
> >
> >
> > From the above link, We need only below line in the code to process the=
 HSC sensors value for tiogapass.
> >
> >
> >
> > int16_t value =3D ((data[4] << 8) | data[3]);
> >
> >
> >
> > Since the below logic is added, the values get shifted and getting nega=
tive values as output.
> >
> >
> >
> > constexpr const size_t shift =3D 16 - 11; // 11bit into 16bit
> >
> > value <<=3D shift;
> >
> > value >>=3D shift;
> >
> >
> >
> > Could you please suggest any idea to resolve this issue.
>
> I haven't looked at this in detail, but we should follow whatever the spe=
c says here.  If whomever wrote this originally put in the wrong math (whic=
h seems likely, given they were implementing 4 types and probably only usin=
g one) then we should just get it fixed and do what the spec says.
>
> >
> >
> >
> > Regards,
> >
> > Jayashree
> >
> >
> >
> > ::DISCLAIMER::
> > ________________________________
> > The contents of this e-mail and any attachment(s) are confidential and =
intended for the named recipient(s) only. E-mail transmission is not guaran=
teed to be secure or error-free as information could be intercepted, corrup=
ted, lost, destroyed, arrive late or incomplete, or may contain viruses in =
transmission. The e mail and its contents (with or without referred errors)=
 shall therefore not attach any liability on the originator or HCL or its a=
ffiliates. Views or opinions, if any, presented in this email are solely th=
ose of the author and may not necessarily reflect the views or opinions of =
HCL or its affiliates. Any form of reproduction, dissemination, copying, di=
sclosure, modification, distribution and / or publication of this message w=
ithout the prior written consent of authorized representative of HCL is str=
ictly prohibited. If you have received this email in error please delete it=
 and notify the sender immediately. Before opening any email and/or attachm=
ents, please check them for viruses and other defects.
> > ________________________________
