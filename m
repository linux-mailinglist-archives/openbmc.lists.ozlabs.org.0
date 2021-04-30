Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8711836FC55
	for <lists+openbmc@lfdr.de>; Fri, 30 Apr 2021 16:26:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWvnb3w2Fz2yxk
	for <lists+openbmc@lfdr.de>; Sat,  1 May 2021 00:26:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=CWrJLPiv;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=CWrJLPiv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.130; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=CWrJLPiv; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=CWrJLPiv; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320130.outbound.protection.outlook.com [40.107.132.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWvmd3vYqz301q
 for <openbmc@lists.ozlabs.org>; Sat,  1 May 2021 00:25:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jW1C7nPDDkyPaQeUpC4NTFOF2TztTAbeU72FuJpWP8=;
 b=CWrJLPivM1IH44CQqyu7OXn94FfRcyQVu8kUjZAH9q/F48razwOhAdDIz+6k5lzOeYgS4aZNZPXznVDuoxh8qE8esngJ55CKn5iau9dQTvwSLrJbtMpHLol6qM3raOdR88D8MJgWjasRC5ktpIN3X/GUucwZYmVLNzldWjImwsOs+AY8vs/1huPvjV80oZTyFOgGkfSPZ0VTGmKbrjjA7EB3oO7ZQtjSjQV4z/Ao68kOAXcH9rh+RxnXum5lwXr+DA6dQZ701lM/rb+dTP6zQqUa+6P1p8Tn4Kvo38yXbmA5ZZlzUGCcma/ZieHuVmrPtO2cP8EQ+7fCH2wVD8puAQ==
Received: from PS2P216CA0067.KORP216.PROD.OUTLOOK.COM (2603:1096:300:18::29)
 by SG2PR04MB2826.apcprd04.prod.outlook.com (2603:1096:4:25::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.26; Fri, 30 Apr
 2021 14:25:45 +0000
Received: from PU1APC01FT058.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:18:cafe::f8) by PS2P216CA0067.outlook.office365.com
 (2603:1096:300:18::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25 via Frontend
 Transport; Fri, 30 Apr 2021 14:25:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.52)
 smtp.mailfrom=hcl.com; stwcx.xyz; dkim=pass (signature was verified)
 header.d=HCL.COM;stwcx.xyz; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.52 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.52; helo=KOR01-PS2-obe.outbound.protection.outlook.com;
Received: from KOR01-PS2-obe.outbound.protection.outlook.com (192.8.245.52) by
 PU1APC01FT058.mail.protection.outlook.com (10.152.253.17) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Fri, 30 Apr 2021 14:25:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kmiAc+7OFbWYmkvTPn+HX/kv9M3iElhtzwRG2PMpssWv+XAqUCAJJaRDKKrCNCKm+YfXn9XjPV0OK+n3z2GQ1g7iXbNsjmpPTaXhcmJnJhwad/SL1zTddjMCu9Hf/+53oJxCvF550nKrdw+17lbT7lnkHpUkb8sZ+fL+O5io2cLAWTFasxNsXKVUOCfjzSvRwewBYTEIZxKX31Xyd+hDH7VtBALtgUxfTpBvNkRWAjJ66oHj5IWTktkfTqSJUa0N7c0oh4aAaaDbLb7FZ/M/hgO/NxAHY5otO3s0VzW5yABDKxO8F6y5QQDFGB1RT3x1pSOkkGTGA2HMqq/+bcrPFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jW1C7nPDDkyPaQeUpC4NTFOF2TztTAbeU72FuJpWP8=;
 b=KpqoMfL6rE9EM+JBNKzfg8PQ28qLRgoOt00OJEFZb+F0KX0JYyNEIWQ33/bZLloCqDLiXlL5X3X8XMT4iTrjSOqQvFyFqQ6GZIPmscy3F2ou8b+IIola89EZLA3TpfWjDfs0AwfUy+ziys3POdroDuyasVs0kcgaeqcKuGYbK5Oe5+LU/7RhdjJIkVBwi0A52HLRh+BGVh55TJ608GirGeMVJAr6rBIyHxWo9OT1YwqmmbFkoZt8nHim1iEnpOjYhuZtNXr5qBIp0oA+FK8eXBsApg/rLQnrpskmx0IHlc21H89kbealv+5gjw3X+MdbbhYhbflMP6jOsojj5k69cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jW1C7nPDDkyPaQeUpC4NTFOF2TztTAbeU72FuJpWP8=;
 b=CWrJLPivM1IH44CQqyu7OXn94FfRcyQVu8kUjZAH9q/F48razwOhAdDIz+6k5lzOeYgS4aZNZPXznVDuoxh8qE8esngJ55CKn5iau9dQTvwSLrJbtMpHLol6qM3raOdR88D8MJgWjasRC5ktpIN3X/GUucwZYmVLNzldWjImwsOs+AY8vs/1huPvjV80oZTyFOgGkfSPZ0VTGmKbrjjA7EB3oO7ZQtjSjQV4z/Ao68kOAXcH9rh+RxnXum5lwXr+DA6dQZ701lM/rb+dTP6zQqUa+6P1p8Tn4Kvo38yXbmA5ZZlzUGCcma/ZieHuVmrPtO2cP8EQ+7fCH2wVD8puAQ==
Received: from SL2PR04MB3097.apcprd04.prod.outlook.com (2603:1096:100:38::9)
 by SL2PR04MB3468.apcprd04.prod.outlook.com (2603:1096:100:30::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 30 Apr
 2021 14:25:42 +0000
Received: from SL2PR04MB3097.apcprd04.prod.outlook.com
 ([fe80::444c:5ba7:ce4f:b103]) by SL2PR04MB3097.apcprd04.prod.outlook.com
 ([fe80::444c:5ba7:ce4f:b103%3]) with mapi id 15.20.4065.027; Fri, 30 Apr 2021
 14:25:42 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: RE: Issue in displaying hardware name using Redfish
Thread-Topic: Issue in displaying hardware name using Redfish
Thread-Index: Adc9faE074rZmKWfSR+zByZ0gUXoggATN6+AAABbPeA=
Date: Fri, 30 Apr 2021 14:25:42 +0000
Message-ID: <SL2PR04MB3097C0CCB579F0B2C2DBA0BFE15E9@SL2PR04MB3097.apcprd04.prod.outlook.com>
References: <SG2PR04MB3093D4832CB9DFE036DAA41DE15E9@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <YIwPtU8g5PhkLC6k@heinlein>
In-Reply-To: <YIwPtU8g5PhkLC6k@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiYjY0ZTkxMzktNTVlNS00OThhLWE1NmYtNDg1Njg5YmMxMmI3IiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX0MwbmYxZGVudDFhbCJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6IktQVXZuWVd5TmRPMm9wYURUTWRReFN3Qk42aTk2KzkraXI4WEtrSWsrNVBlODkwaEtNYlFkRlNPNStwRWszVmcifQ==
x-hclclassification: HCL_Cla5s_C0nf1dent1al
Authentication-Results-Original: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [2409:4072:649f:2e7d:191e:6879:2074:5ad8]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a74791f8-9704-4ec0-6b90-08d90be3d7c9
x-ms-traffictypediagnostic: SL2PR04MB3468:|SG2PR04MB2826:
X-Microsoft-Antispam-PRVS: <SG2PR04MB2826D58839679C14C60F2B2FE15E9@SG2PR04MB2826.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: /D6QYEiaARsrvNe9WCANQO0GfMNbghiOUl1RO6VmAVDiUcuzuUzl/fQyVAbBrsEBIMuvrq/iRwGjsQnVlUvxsnUmHDAyjNizBKmHZ3LnztIlLLo/BhkxMtMT44iyBciJ8idd6GzhA8lEG7UddOJQHF8kGaxIK1P4FHtDFk30Skz2S936ty9BCq4bHFK6HSLja+yMDrp5KKPZeMYId4uU0LFv4wBGYtKTRdMOzclbOMqYnYgl1iApxmKybIhw/pN6i8l7YCiRncHWmyLCQ9cKP037+hd78PRCBq9ysps6HQQYyi0HrrfGrrYvmVtc3tFyo+nvR30JiTLQs6SDGLuRPNx5/+vhjrPTnKfGO2W//li6QLqGF5jtpmHKcgETCDwCdlPdYdnglywEfUZSdrdRmFKqb00b38BBYBcmtElv9j7pb9sMHCatn8xB7QdnjNw7dJPSe6KayS3leE2G1Jfa9bw2OjEw6g43rYnN+6ixXYsagNyXh/nIjlJVEpOZTyJCyUdKlHt593wVb66x5XrHvqzylEcThL1H2zd5CYd/wtmKJoUP7lB5JNLyTakXBibXsLhDm5CHVcedZMNBlIHUiI6zlQeuqag4iOhDie4BHnKZfgNsByeqX9VBfyPKHww4oxfALWyy0WKKUS+LUXXRBzw7EufrrLwy7GRLD3bkrdMRisLSZvGg5DpKS0nZpnXz
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SL2PR04MB3097.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(76116006)(66946007)(66446008)(64756008)(8676002)(316002)(4326008)(66476007)(9686003)(2906002)(7696005)(53546011)(966005)(83380400001)(186003)(8936002)(66556008)(86362001)(33656002)(52536014)(38100700002)(478600001)(5660300002)(71200400001)(122000001)(6506007)(6916009)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?qc125aTn4laiSLlMJ7srQlL4KHdR7TYjlMwvnaxraCP6pFwTnSw+12VtmAW7?=
 =?us-ascii?Q?wOjmUrplAA3Gki4k1V/062ieHQQrAkSW0nS7xL73LErO5vaHjcFWEt+HWrdm?=
 =?us-ascii?Q?QvkBbKwql0k8hLgkuFYLv1OHwdFp7+Yev+qWcXYL01w1iCNUyuE278s+S83W?=
 =?us-ascii?Q?vZo9W6weGgJ0THWZ777HPV7sq8GQUOT/lZJIPWZR1JaItHdMux+csTFYhQv0?=
 =?us-ascii?Q?lIcfEo2xUTi5gPEsfdE+DqOvY7Dm6TQdWvO/V9hSQnY35UefHKfZQmB3TFPX?=
 =?us-ascii?Q?WLaTBf63+kh/BMPg6cp1pSHrc7oiiLx0fhowzi6qRf/g80fcCqamySYh/RMk?=
 =?us-ascii?Q?RPJg2vMqv3tDt/qIovpGCOGUezL2Y9flp1nmzn4APnlCB7f1Hx5ek1jjB8ED?=
 =?us-ascii?Q?a1JUvz5l+85S0sZ2xfikOD04dfMGNI2H8W8bu/aMeVc3qBfYcI5zGwOPV13n?=
 =?us-ascii?Q?pLoZf1QAGHfvmIW00YIvK+Wtxj/Pv2U/qr9yOys0As+c/onz9CAScjh30655?=
 =?us-ascii?Q?EFigojBt4H4NtX7aVDW3uWCmYUectFa/tjH0LBJyrMmcrANc1gQxHDGjsmRl?=
 =?us-ascii?Q?CQ2D+KhP7FZyrk6wWLAsRluH8qeRev5P7PWZmOhPydmkoQRqTo1LC9POTVQn?=
 =?us-ascii?Q?UHeZRWpaldynToboKXtrWRBmTmgE91bNIrC9NaIJ7N1++6GoSk9oTZY8q3Go?=
 =?us-ascii?Q?LEODrx+vU/TDouOwGKRIZhrOY3kUz+KHtt5gpEE7Gqfzx24fqnBouOIPj3fU?=
 =?us-ascii?Q?MS81jWZznT82rQhbfUaMITrDKHFZiVfRfonWQQIP1X2ovV+AZ/nKmFmuf9o6?=
 =?us-ascii?Q?pNyFIcdgJMGXbv1w+oQiJAML8nOmmTyg2wk+Hx2KmqcbYodFNsKQkop4F2rx?=
 =?us-ascii?Q?VJmaO9Ng88kGCVHq+NZWcgKguAxOIUXmYvp0Lp5/gEcW62LPSdg60mBi5YwK?=
 =?us-ascii?Q?kVgq/GEWnAx794hEB1Ne69i3lWr6Y/oBG2fnEvI80egZZuINXrjeAIcxM2M8?=
 =?us-ascii?Q?yFcXiwHG8GimTZzs3bSbbkkeULkLFw11/CDNXuyRANBIlc6bLNQ0AVQwWSCn?=
 =?us-ascii?Q?ag5CLIUroQokljzLtr8x8+G9hjOC6h/RWnx9l6sIMlspyeNb/yVHsIRAbQWC?=
 =?us-ascii?Q?vVxA5H00IToHarqFby2vPKZrwhULb7PSTW3phiIGMVTMaCyqxNfbv+FRkrPb?=
 =?us-ascii?Q?/1yhrXF161BQQ2qzYj4cb1RyZN5tLnz7HBMXAbEEXf83+mbT1/NHYnpsMmjF?=
 =?us-ascii?Q?xioA/yIKAdZv695diKFjuhqn9zwyDp8gfiw3XJE4FhFWJlhHkHDuoPwAfLdp?=
 =?us-ascii?Q?1+7sku5JBwxeUY92fYGhEsNJH3ao2x6e/89aRi7NeJGDlsavNfO6BrRvdD9t?=
 =?us-ascii?Q?MX08QIfFEwgnSyi9IGiGTi3UkRqQ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR04MB3468
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT058.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 62c4144f-1303-41a4-5227-08d90be3d5ea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4T+rfzYedSrhFB/I1uqhtcoQqNZ7HfqNgJQx4GrsbY30je3ngOOF3JmKDuapU3wtIZ6vZ0+9XoJ2gpinZFWnT5ymgdzPzy2qCU/AZBogvtIq6l3K3wqmBH84zpdimCc6i2HKg/iibboDCYz8zHnpRx77G8y2iirvc4o5spQNYmQ6DvRMc/XAJDVcUGsGJV0LJkPPnHVz+t+VKtzmqeyzhVyhvTD2XjPPpaTiTSsAyA5DkgIFfvD9NGw4Fji9M873/Y/8ICswleOWrrhJl3UXpUgSyb+Kk7K2KXdeSCReF9MftdeJ4TEUdjx03P6kTDwMls0FcO7LqBeYuvwm7wFuXFf2EFO714hBkzzKLSk1dmaIj/5NiEgPKBL2BrhwbIiJYoTHSAl0HOlHZ7YTArTEzrpf4yxI7oRJ1580UoM4/PmPHvwoFN3h8dL/2XQFqzHxQX7dI8X0BtUwhdj6qWsGxrGI506FiWUTXBSFpGDftAROqoYC2n+6Q86ak5ZqhofxI0fymliVHx9QdvPlmECDWgmfaP1DWZuDajbcBYm5tB8BR7vRCUE166G9DVJlF13zCOjbAZldl+zl3z7frK60Wos/MtOIlR50c0ciybiWhwxqrGhRgW/8NiA/JF16+fkzsgijjirJEhNEIu6SJyEo3xq4+jrx0CydU81FZWY+CrROUEjvGztgx0oT5LmDA7hbQv8WE2xbM1uUHZ/I5y1x9VfVbIkmeepHvTgPxXNYM7mOIboAxza9on5dSMIiU9F1cqVu/g97r3820zLO77IkPbg1ZffFZz5BX0jYhKj/xls=
X-Forefront-Antispam-Report: CIP:192.8.245.52; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KOR01-PS2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(36840700001)(46966006)(36906005)(53546011)(55016002)(83380400001)(478600001)(70206006)(82310400003)(356005)(6506007)(81166007)(7696005)(8936002)(70586007)(34020700004)(186003)(52536014)(316002)(47076005)(5660300002)(82740400003)(36860700001)(336012)(86362001)(966005)(33656002)(9686003)(8676002)(2906002)(4326008)(26005)(6916009)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 14:25:44.8462 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a74791f8-9704-4ec0-6b90-08d90be3d7c9
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.52];
 Helo=[KOR01-PS2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT058.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2826
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

Classification: Confidential

Thanks Patrick, I will follow this issue in that sdbusplus.

-----Original Message-----
From: Patrick Williams <patrick@stwcx.xyz>
Sent: Friday, April 30, 2021 7:40 PM
To: Jayashree D <jayashree-d@hcl.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: Issue in displaying hardware name using Redfish

On Fri, Apr 30, 2021 at 07:14:19AM +0000, Jayashree D wrote:
> I am using Redfish commands to verify the details of sensor and hardware.
> But I am getting the hardware name as "TiogaPass\ufffdseboard" instead of=
 "TiogaPass_Baseboard".

There is a github issue open tracking this and Ed is working on it.

https://github.com/openbmc/sdbusplus/issues/60

--
Patrick Williams
::DISCLAIMER::
________________________________
The contents of this e-mail and any attachment(s) are confidential and inte=
nded for the named recipient(s) only. E-mail transmission is not guaranteed=
 to be secure or error-free as information could be intercepted, corrupted,=
 lost, destroyed, arrive late or incomplete, or may contain viruses in tran=
smission. The e mail and its contents (with or without referred errors) sha=
ll therefore not attach any liability on the originator or HCL or its affil=
iates. Views or opinions, if any, presented in this email are solely those =
of the author and may not necessarily reflect the views or opinions of HCL =
or its affiliates. Any form of reproduction, dissemination, copying, disclo=
sure, modification, distribution and / or publication of this message witho=
ut the prior written consent of authorized representative of HCL is strictl=
y prohibited. If you have received this email in error please delete it and=
 notify the sender immediately. Before opening any email and/or attachments=
, please check them for viruses and other defects.
________________________________
