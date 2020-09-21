Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C94D12730D5
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 19:28:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwBHg2rwzzDqZB
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 03:28:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.129.120; helo=kor01-sl2-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=JcXOJzu0; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=JcXOJzu0; 
 dkim-atps=neutral
Received: from KOR01-SL2-obe.outbound.protection.outlook.com
 (mail-eopbgr1290120.outbound.protection.outlook.com [40.107.129.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bw9K93z2SzDqWn
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 02:44:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dr2o7UDIt4yce30lV+FkJCAvgEoLJ96lIooDBKQdv3s=;
 b=JcXOJzu0WC1iAv4a+1+TjbAHo5zl5HCt3nuG7quAv3lycOaI0/1cr2VwCjmXSRPLOCVZ7f4i1Y/JfHe67nGsQ2ef/Ixs2YGdKZQmrT86CjEUt8af5e0a2+V8MUCdR2gF44/PYAyd4Xh7tRoBWJQiha4547UAZqlTs1Yu1voG0IE=
Received: from SG2PR02CA0115.apcprd02.prod.outlook.com (2603:1096:4:92::31) by
 PS2PR04MB3751.apcprd04.prod.outlook.com (2603:1096:300:65::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.17; Mon, 21 Sep 2020 16:44:45 +0000
Received: from SG2APC01FT013.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:92:cafe::ae) by SG2PR02CA0115.outlook.office365.com
 (2603:1096:4:92::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend
 Transport; Mon, 21 Sep 2020 16:44:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.52)
 smtp.mailfrom=hcl.com; fb.com; dkim=pass (signature was verified)
 header.d=HCL.COM;fb.com; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.52 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.52; helo=APC01-HK2-obe.outbound.protection.outlook.com;
Received: from APC01-HK2-obe.outbound.protection.outlook.com (192.8.245.52) by
 SG2APC01FT013.mail.protection.outlook.com (10.152.250.186) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.15 via Frontend Transport; Mon, 21 Sep 2020 16:44:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TmzX76GKER1clhwA8WCJx4OVGQV7tsNdc0r+Y2QN+uY/kcl4RoQaRO+UQE/zOD6szdrYYlRou4MtV+KbCR5t3wj5JHPYzyf3MMEpAu8jhZ6AW8IrCjPinvR8ROSbjP+j/5WyCzSjym4DCbY89IEktmNSPPi4VMs9m4xZDmh04H2I4CEKQwLcqEb8DQlmS2YqdXQ2wXYwEQ7M+ysm9Ml0BOz6ukVTZ4MmZhpOUkzYEV7eExVCx1h873kNZQLdznVX20+7MoXO3utvktgtrexH1tyhM9+eX3Gp/zDO5OjfFu9I3Lq++WwHCs/B0fI8jfSq8jsZz8qmfWEWAuTCmzGblQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dr2o7UDIt4yce30lV+FkJCAvgEoLJ96lIooDBKQdv3s=;
 b=jj0f8lR5jsAljij9YBILnczG835q/cAJEE+9HYAt1tGdD6UljB5dcklIXU6PDI6VeA/zGFSmg2MzdQDv9y4raR9feMR6qq1GADnDbmBeferxDpqmRBEIYciHUwJmYZl6VC3DKeFMqqvcVlN071xbPH8bxsPXFh1brWSzuIAU81LzB6cAVlbjOXSb0e4JlAa/E/MBr0eCwEBPlGjgTNrKgENCXLwoGh+Pa1gl4l9lCmwnj6wcmttb6Sq/VxHSa35uaRE56KqOedjFfglogX4K1rqM/wdToCd10ArxgM6ZXdeEApUasi+Nzu28Yc5VQhzjTU+DNS4x8i2ule51dhq/pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dr2o7UDIt4yce30lV+FkJCAvgEoLJ96lIooDBKQdv3s=;
 b=JcXOJzu0WC1iAv4a+1+TjbAHo5zl5HCt3nuG7quAv3lycOaI0/1cr2VwCjmXSRPLOCVZ7f4i1Y/JfHe67nGsQ2ef/Ixs2YGdKZQmrT86CjEUt8af5e0a2+V8MUCdR2gF44/PYAyd4Xh7tRoBWJQiha4547UAZqlTs1Yu1voG0IE=
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com (2603:1096:203:5d::15)
 by HK2PR04MB3732.apcprd04.prod.outlook.com (2603:1096:202:36::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Mon, 21 Sep
 2020 16:44:41 +0000
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::89f5:e366:be7b:b4f0]) by HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::89f5:e366:be7b:b4f0%3]) with mapi id 15.20.3391.024; Mon, 21 Sep 2020
 16:44:41 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: Vijay Khemka <vijaykhemka@fb.com>, Ed Tanous <ed@tanous.net>
Subject: RE: Read FRU of host through ipmi in Entity manager.
Thread-Topic: Read FRU of host through ipmi in Entity manager.
Thread-Index: AdaKtjzUbcfxCnsRS1m0flxOovD9XQABka8AACeJKwABMecIAA==
Date: Mon, 21 Sep 2020 16:44:40 +0000
Message-ID: <HK0PR04MB29649824A0F904C61F35152AFD3A0@HK0PR04MB2964.apcprd04.prod.outlook.com>
References: <HK0PR04MB2964FFC6D5EF008F106FFC13FD230@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <CACWQX80fpcLGEjuvUnj4JpinY=SS6eXbHR0i6wdEtjNpMsAHMg@mail.gmail.com>
 <3D149923-0A95-4CE6-82EF-8338677EF831@fb.com>
In-Reply-To: <3D149923-0A95-4CE6-82EF-8338677EF831@fb.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-hclclassification: HCL_Cla5s_1nt3rnal
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiZmUyODk2YjYtNGE4NC00NzY0LTk2MmItZTdkNjBiNDUwNTUyIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzXzFudDNybmFsIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE4LjQuMTg0My4xMjMiLCJUcnVzdGVkTGFiZWxIYXNoIjoiUDJKWnlROVR0YTJLNUNadTV4MVFQbDRNaHVEeTNEVEtsWXJaR3g0cGhkajRlTk5yUkxOcjZMbVRHQzd0bFZLWCJ9
Authentication-Results-Original: fb.com; dkim=none (message not signed)
 header.d=none;fb.com; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [157.46.79.240]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: dce1f98e-cdb8-4bb5-1b04-08d85e4da475
x-ms-traffictypediagnostic: HK2PR04MB3732:|PS2PR04MB3751:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <PS2PR04MB375134D3CAEE115F1C8C512CFD3A0@PS2PR04MB3751.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: ZonW5KYRsp1Y5K6VBu2NxcHCUCwGM4esTyJOpSeWszUhyOd4Nu/9ECsB/rhUV8hXprXSP3bLbJD1mYyH8NSta6x1eziZnZmf2v1MJfvKbmCaxU68QqGfWaafUl6j3pJi9D+ET9iZLIihC4Zl/FjruSB4UtKj7gCB2BC2twwLb/7oPIC833NYr9a3VRzCF3B6ls5K00yhNAcfDtl6yssF+hOa44w+OrNR1YWD/UVG9QfcfPpLUnrUHHxfpnESHdaIPrMhP2ACx7/skHH0K2zy5fe+N9JOY+InP3gk+LVsic+zmuNLFzukFY3Mp0v7YQia1Tm+2KHmhWE1sf7v4EgY8PPdI7QnnurJamojPvGpdt+bPvdIWeEN01dA+UL74V9l6R11eaXZLsQbCjvuYfc0aA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HK0PR04MB2964.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(33656002)(316002)(966005)(8676002)(45080400002)(71200400001)(66946007)(6506007)(478600001)(76116006)(55016002)(26005)(186003)(53546011)(8936002)(4326008)(7696005)(9686003)(110136005)(5660300002)(2906002)(86362001)(66446008)(66556008)(66476007)(64756008)(52536014)(54906003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: v2KVTjIRRd5JDiXT+6IIIDPzVIeGt+aohigHYx8py8UWcJipmbJ2bYavDLrKD1mQVzVdTgvTyU2MNKpNld7YNVT4U6TIzBHdfBznYmGgR4aUUzmsfrMOLlqGBcxjXy7dd4QqzxfVLAfwl7RsvvKbu5RRuH9a9kpRWqmLomwX5FlNZZ5YHmPFYCRKA7D6F0tlIn9i3DtnUznipZvEj9H6SBncnx8maFA4oEQJSNRBw0qSTVNFyOKzoFk8n9jFfUzkgIGl0zwjtTiqDEvhCCLEp/rpHsnGgOWAlyGnYP0/ptaT4Ihhx3BaQU9pNIuJctE5/m3c42S7Fra8VhmVZuKR6HuTR2SmK1f5XvwlPmJsipYpYzZ6OPzazCNODIA2GvDds8R1w1S+sQsOc1En/DCLh9pGHfVXThmW0hWtP5OptAqPBV8V+AKRNxrmVDGnrK+NEARD8XqZFI1tmilf+pYRdp0GSAWoAagHa0UNtNg3dnF9PGC6bV3E5CqfUjyIGDXy6OWFHLiC4w3pmiNhazcwW3+mkZWvM9CMiL2/OBYqiqnrc6UCP5h2s131WhDF5kM6KzUD2J6CwwvZzFcwGWYSG8V/yZCk9Rvbk0waksSAfQt+6bWHqD7WWoisGYxFWB2vl4Cl9sT0tbN86SDuUGZc4w==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR04MB3732
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT013.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 613394e9-4ef4-474e-d50f-08d85e4da2f0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iZTnTcLa/DeEuIHIpFAu6Sv2onhNa9/T6zuvqLI3YBoPl2ePgzbUbmtrTFokoaYb38WCuiOZ3c/LY1xAKl2RYuRcW+lTIMfoOiu0YI4OPbI55QHfuIDHhHhkod1wflwxv7wrJU51gdH9DMQOUncA3NYrJerrx1ao9nXojI6C+iGOj7xzuqGM82K3ydFK8ovMqtaFur0PwiodhgVQuERXyG3GYnVWEJBr02Wug6cEaIkAzIXYjMIK7dUezLSSsz9UNBngyXEr5LveEUEf1O8KqXyLwf455Xh1wuw6vYow7ThicMxn3oOAVwehNHKkvAy5L9hSTijbYu/KorG8zUHYxllseE3GjEA+rBAk9RQdMsuvUG9+gLYUu1ejTY3MTlAq/nkvn9S0YXvYANO+nhRFRLSuAxLnZlea4QGUxQYK/H29PlrZ0OrXadBj7dLVbUYdKrSq4keYB5ZiNeW2MIME86q0ZYZ51hjZYfjkr7Vd33SbtMh6/CqIIE/c65G0FSh3
X-Forefront-Antispam-Report: CIP:192.8.245.52; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-HK2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(396003)(376002)(46966005)(34020700004)(55016002)(86362001)(356005)(7696005)(81166007)(83380400001)(47076004)(70206006)(82740400003)(54906003)(36906005)(8676002)(26005)(70586007)(45080400002)(82310400003)(966005)(336012)(5660300002)(478600001)(316002)(9686003)(52536014)(2906002)(33656002)(53546011)(6506007)(110136005)(4326008)(8936002)(186003);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2020 16:44:43.3737 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dce1f98e-cdb8-4bb5-1b04-08d85e4da475
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.52];
 Helo=[APC01-HK2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT013.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR04MB3751
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>, Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Q2xhc3NpZmljYXRpb246IEhDTCBJbnRlcm5hbA0KDQpIaSBBbGwsDQoNCiAgICAgICAgICAgIFRo
YW5rcyBmb3IgeW91ciBjb21tZW50cyBhbmQgc3VnZ2VzdGlvbnMuDQoNCiAgICAgICAgICAgIEFz
IHN1Z2dlc3RlZCwgd2UgYXJlIHBsYW5uaW5nIHRvIGltcGxlbWVudCBhIG5ldyBwcm9jZXNzL3Nl
cnZpY2UgbGlrZSAgeHl6Lm9wZW5ibWNfcHJvamVjdC5JUE1CLkZydURldmljZSBpbiBlbnRpdHkg
bWFuYWdlciBtb2R1bGUgdG8gc3VwcG9ydCBIb3N0IEZSVSB0aHJvdWdoIGlwbWIgcmF0aGVyIHRo
YW4gdXNpbmcgZGJ1cy1zZW5zb3JzL2lwbWJzZW5zb3JzIGZpbGUuDQoNCiAgICAgICAgICAgIEZv
bGxvd2luZyBhcmUgdGhlIGFkdmFudGFnZXMsIGlmIGhvc3QgRlJVIGhhbmRsaW5nIGluIGVudGl0
eSBtYW5hZ2VyIHJlcG8uDQoNCiAgICAgICAgICAgIDEuIEFsbCB0aGUgRlJVIGluZm9ybWF0aW9u
IGlzIGhhbmRsaW5nIGluIHRoZSBzYW1lIHJlcG8uDQogICAgICAgICAgICAyLiBFbnRpdHkgbWFu
YWdlciBQcm9iZSBjYW4gd29yay4NCiAgICAgICAgICAgIDMuIEFsbCB0aGUgRlJVIEZ1bmN0aW9u
cyBhcmUgaW4gdGhlIHNhbWUgcmVwby4gV2UgY2FuIHRyeSB0byByZXVzZSBtb3N0IG9mIHRoZSBm
dW5jdGlvbnMuDQogICAgICAgICAgICA0LiBBZGRpbmcgRnJ1IG9iamVjdCB0byBkYnVzIGhhbmRs
aW5nIGFyZSBkb25lLg0KICAgICAgICAgICAgNS4gQWxsIEZSVSB2YWxpZGF0aW9ucyBhcmUgZG9u
ZSBoZXJlIGxpa2UgRm9ybWF0IGZydSwgdXBkYXRlIGZydSBwcm9wZXJ0eSwgdmFsaWRhdGUgaGVh
ZGVyLCBGcnUgQXJlYUxlbiBhbmQgY2hlY2tzdW0uIFdlIGNhbiB0cnkgdG8gcmV1c2UgdGhvc2Ug
dmFsaWRhdGlvbnMuDQogICAgICAgICAgICANCiAgICAgICAgICAgIEZvciBzY2FubmluZyB0aGUg
L2Rldi9pcG1pLSogbm9kZXMsIHdlIGFyZSB0aGlua2luZyB0byB1c2UgaXBtYi1jaGFubmVscy5q
c29uIGNvZmlnIGVudHJpZXMgaW4gZW50aXR5IG1hbmFnZXIgcmVwbyBzaW5jZSB0aGlzIGNvbmZp
ZyBmaWxlIGhhcyB2YWxpZCBzbGF2ZSBwYXRoIGFuZCBidXMgYWRkcmVzcy4gDQoNCiAgICAgICAg
ICAgIFBsZWFzZSBzaGFyZSB5b3VyIGNvbW1lbnRzIGlmIGFueS4gDQoNClRoYW5rcywNCkt1bWFy
Lg0KDQoNCiAgICAgICAgICANCiAgICAgICAgICAgICANCg0KDQoNCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQpGcm9tOiBWaWpheSBLaGVta2EgPHZpamF5a2hlbWthQGZiLmNvbT4gDQpTZW50
OiBXZWRuZXNkYXksIFNlcHRlbWJlciAxNiwgMjAyMCAxMjo1MSBBTQ0KVG86IEVkIFRhbm91cyA8
ZWRAdGFub3VzLm5ldD47IEt1bWFyIFRoYW5nYXZlbCA8dGhhbmdhdmVsLmtAaGNsLmNvbT4NCkNj
OiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7IEphZSBIeXVuIFlvbyA8amFlLmh5dW4ueW9vQGxp
bnV4LmludGVsLmNvbT47IFZlcm5vbiBNYXVlcnkgPHZlcm5vbi5tYXVlcnlAbGludXguaW50ZWwu
Y29tPjsgSmFtZXMgRmVpc3QgPGphbWVzLmZlaXN0QGxpbnV4LmludGVsLmNvbT47IFZlbHVtYW5p
IFQtRVJTLEhDTFRlY2ggPHZlbHVtYW5pdEBoY2wuY29tPjsgUGF0cmljayBXaWxsaWFtcyA8cGF0
cmlja3czQGZiLmNvbT4NClN1YmplY3Q6IFJlOiBSZWFkIEZSVSBvZiBob3N0IHRocm91Z2ggaXBt
aSBpbiBFbnRpdHkgbWFuYWdlci4NCg0KW0NBVVRJT046IFRoaXMgRW1haWwgaXMgZnJvbSBvdXRz
aWRlIHRoZSBPcmdhbml6YXRpb24uIFVubGVzcyB5b3UgdHJ1c3QgdGhlIHNlbmRlciwgRG9u4oCZ
dCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIGFzIGl0IG1heSBiZSBhIFBoaXNoaW5n
IGVtYWlsLCB3aGljaCBjYW4gc3RlYWwgeW91ciBJbmZvcm1hdGlvbiBhbmQgY29tcHJvbWlzZSB5
b3VyIENvbXB1dGVyLl0NCg0K77u/T24gOS8xNC8yMCwgMTA6MjkgQU0sICJFZCBUYW5vdXMiIDxl
ZEB0YW5vdXMubmV0PiB3cm90ZToNCg0KICAgIE9uIE1vbiwgU2VwIDE0LCAyMDIwIGF0IDk6NTcg
QU0gS3VtYXIgVGhhbmdhdmVsIDx0aGFuZ2F2ZWwua0BoY2wuY29tPiB3cm90ZToNCiAgICA+DQog
ICAgPiBDbGFzc2lmaWNhdGlvbjogSENMIEludGVybmFsDQogICAgPg0KICAgID4gSGkgQWxsLA0K
ICAgID4NCiAgICA+DQogICAgPg0KICAgID4gICAgICAgICAgV2UgYXJlIHdvcmtpbmcgb24gdGhl
IFBsYXRmb3JtIHdoaWNoIGhhcyBtdWx0aSBob3N0IGFuZCB0aGUgaG9zdCBhcmUgRlJVcy4gIFRo
ZSBob3N0IGFuZCBCTUMgY29tbXVuaWNhdGlvbiBpcyBiYXNlZCBvbiBJUE1CLiBXZSBoYXZlIGVh
Y2ggaG9zdCBpcyBjb25uZWN0ZWQgaW4gc2VwYXJhdGUgaXBtYiBidXMuDQogICAgPg0KICAgID4g
ICAgICAgICAgRXhpc3RpbmcgRW50aXR5IG1hbmFnZXIgaGFzIHRoZSBGUlUgcmVhZCBpbmZvIGZy
b20gRUVQUk9NIChJMkMpaW4gdGhlIGZvcm0gb2YgYmluIGZpbGUuDQogICAgPiAgICAgICAgICBX
ZSB1bmRlcnN0YW5kIHRoYXQgZW50aXR5IG1hbmFnZXIgZG9lcyBub3Qgc3VwcG9ydCBpcG1iIGJh
c2VkIGhvc3QgZnJ1Lg0KDQogICAgTWlub3IgYWRqdXN0bWVudC4gIEZydURldmljZSBoYXMgdGhp
cyBjYXBhYmlsaXR5LCBub3QgRW50aXR5IE1hbmFnZXIuDQoNCiAgICA+DQogICAgPg0KICAgID4N
CiAgICA+ICAgICAgICAgIFNvLCB3ZSBhcmUgcHJvcG9zaW5nIHRoZSBkZXNpZ24gdG8gc3VwcG9y
dCBpcG1iIGJhc2VkIEZSVSBpbiBlbnRpdHkgbWFuYWdlci4NCiAgICA+ICAgICAgICAgIEZyb20g
RW50aXR5IG1hbmFnZXIsIHdlIHdpbGwgc2VuZCB0aGUgZ2VuZXJpYyAicmVhZCBob3N0IGZydSIg
Y29tbWFuZCByZXF1ZXN0IHRvIGlwbWJicmlnZSB0byByZWFkIHRoZSBob3N0IEZSVS4NCiAgICA+
DQogICAgPiAgICAgICAgICBUaGVuLCBzdG9yZSB0aGUgaG9zdCBmcnUgaW5mbyBpbiB0aGUgYmlu
IGZpbGUgdG8gcHJvY2VzcyBhbmQgY3JlYXRpbmcgZGJ1cyBvYmplY3RzIGluIHRoZSBlbnRpdHkg
bWFuYWdlci4NCg0KICAgIE1pbm9yIGFtZW5kbWVudCBhZ2Fpbi4gIEknZCBtdWNoIHJhdGhlciB0
aGUgSVBNQlNlbnNvciBkYWVtb24gc2ltcGx5DQogICAgY3JlYXRlIHRoZSBzYW1lIGludGVyZmFj
ZSB0aGF0IGZydSBkZXZpY2UgZG9lcywgcmF0aGVyIHRoYW4gYWRkaW5nDQogICAgSVBNQiBsb2dp
YyB0byBGcnVEZXZpY2UuICBJbiB0aGlzIHdheSwgcGxhdGZvcm1zIHRoYXQgZG9uJ3QgaGF2ZSBJ
UE1CDQogICAgZG9uJ3QgbmVlZCB0byBpbmNsdWRlIHRoZSBmZWF0dXJlIGF0IGFsbC4gIEFsc28s
IGFsbCB0aGUgSU8gY2FuIGJlDQogICAgbWFuYWdlZCBpbiBvbmUgcGxhY2UuDQogICAgaHR0cHM6
Ly9hcGMwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJG
JTJGZ2l0aHViLmNvbSUyRm9wZW5ibWMlMkZkYnVzLXNlbnNvcnMlMkZibG9iJTJGbWFzdGVyJTJG
c3JjJTJGSXBtYlNlbnNvci5jcHAmYW1wO2RhdGE9MDIlN0MwMSU3Q3RoYW5nYXZlbC5rJTQwaGNs
LmNvbSU3QzJkNzZlMWZlOTljZDQ5YTkyNzRjMDhkODU5YWM3YWZiJTdDMTg5ZGU3MzdjOTNhNGY1
YThiNjg2ZjRjYTk5NDE5MTIlN0MwJTdDMCU3QzYzNzM1Nzk0NDYzMDQ2ODA1NyZhbXA7c2RhdGE9
aTJ5bXdxWTRBTjBZZU1TTWJKUmVnQnk5JTJCcncxYWdpQlh4aWJGWllNUDljJTNEJmFtcDtyZXNl
cnZlZD0wDQogICAgSWRlYWxseSwgeW91ciBJUE1CIGRldmljZSB3b3VsZCBhbHNvIGhhdmUgYW4g
U0RSIHRoYXQgZGV0YWlscyB3aGF0DQogICAgRlJVcyBhbmQgc2Vuc29ycyBleGlzdCwgc28gdGhh
dCB0aGUgaW52ZW50b3J5IGNhbiBiZSByZWFkIGFuZCBwb3N0ZWQNCiAgICB0byBEQnVzIGF0IHN0
YXJ0dXAuICBJZiB0aGV5IGRvbid0IHRoZW4gd2UgbWlnaHQgbmVlZCBhIHN0YXRpYyBtYXBwaW5n
DQogICAgZnJvbSBhbiBFTSBjb25maWcgb25jZSB0aGUgZGV2aWNlIG9uIHRoZSBvdGhlciBlbmQg
aXMgZGV0ZWN0ZWQgdmlhIGdldA0KICAgIGRldmljZSBJRC4NCg0KSSBhZ3JlZSB3aXRoIEVkIGhl
cmUsIGFsbCBpcG1iIHJlbGF0ZWQgaW50ZXJmYWNlcyBzaG91bGQgYmUgaW1wbGVtZW50ZWQgaGVy
ZS4NCg0KDQogICAgPg0KICAgID4NCiAgICA+DQogICAgPiAgICAgICAgICBQbGVhc2UgbGV0IHVz
IGtub3cgeW91ciBjb21tZW50cyBvbiB0aGlzLg0KICAgID4NCiAgICA+DQogICAgPg0KICAgID4g
VGhhbmtzLA0KICAgID4NCiAgICA+IEt1bWFyLg0KICAgID4NCiAgICA+DQogICAgPg0KICAgID4N
CiAgICA+DQogICAgPg0KICAgID4NCiAgICA+IDo6RElTQ0xBSU1FUjo6DQogICAgPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KICAgID4gVGhlIGNvbnRlbnRzIG9mIHRoaXMgZS1t
YWlsIGFuZCBhbnkgYXR0YWNobWVudChzKSBhcmUgY29uZmlkZW50aWFsIGFuZCBpbnRlbmRlZCBm
b3IgdGhlIG5hbWVkIHJlY2lwaWVudChzKSBvbmx5LiBFLW1haWwgdHJhbnNtaXNzaW9uIGlzIG5v
dCBndWFyYW50ZWVkIHRvIGJlIHNlY3VyZSBvciBlcnJvci1mcmVlIGFzIGluZm9ybWF0aW9uIGNv
dWxkIGJlIGludGVyY2VwdGVkLCBjb3JydXB0ZWQsIGxvc3QsIGRlc3Ryb3llZCwgYXJyaXZlIGxh
dGUgb3IgaW5jb21wbGV0ZSwgb3IgbWF5IGNvbnRhaW4gdmlydXNlcyBpbiB0cmFuc21pc3Npb24u
IFRoZSBlIG1haWwgYW5kIGl0cyBjb250ZW50cyAod2l0aCBvciB3aXRob3V0IHJlZmVycmVkIGVy
cm9ycykgc2hhbGwgdGhlcmVmb3JlIG5vdCBhdHRhY2ggYW55IGxpYWJpbGl0eSBvbiB0aGUgb3Jp
Z2luYXRvciBvciBIQ0wgb3IgaXRzIGFmZmlsaWF0ZXMuIFZpZXdzIG9yIG9waW5pb25zLCBpZiBh
bnksIHByZXNlbnRlZCBpbiB0aGlzIGVtYWlsIGFyZSBzb2xlbHkgdGhvc2Ugb2YgdGhlIGF1dGhv
ciBhbmQgbWF5IG5vdCBuZWNlc3NhcmlseSByZWZsZWN0IHRoZSB2aWV3cyBvciBvcGluaW9ucyBv
ZiBIQ0wgb3IgaXRzIGFmZmlsaWF0ZXMuIEFueSBmb3JtIG9mIHJlcHJvZHVjdGlvbiwgZGlzc2Vt
aW5hdGlvbiwgY29weWluZywgZGlzY2xvc3VyZSwgbW9kaWZpY2F0aW9uLCBkaXN0cmlidXRpb24g
YW5kIC8gb3IgcHVibGljYXRpb24gb2YgdGhpcyBtZXNzYWdlIHdpdGhvdXQgdGhlIHByaW9yIHdy
aXR0ZW4gY29uc2VudCBvZiBhdXRob3JpemVkIHJlcHJlc2VudGF0aXZlIG9mIEhDTCBpcyBzdHJp
Y3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGVtYWlsIGluIGVycm9y
IHBsZWFzZSBkZWxldGUgaXQgYW5kIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5LiBCZWZv
cmUgb3BlbmluZyBhbnkgZW1haWwgYW5kL29yIGF0dGFjaG1lbnRzLCBwbGVhc2UgY2hlY2sgdGhl
bSBmb3IgdmlydXNlcyBhbmQgb3RoZXIgZGVmZWN0cy4NCiAgICA+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fDQoNCg==
