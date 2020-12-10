Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A943F2D5F51
	for <lists+openbmc@lfdr.de>; Thu, 10 Dec 2020 16:17:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsHbJ440mzDr1q
	for <lists+openbmc@lfdr.de>; Fri, 11 Dec 2020 02:17:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.100; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=MWcBjNON; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=MWcBjNON; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320100.outbound.protection.outlook.com [40.107.132.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsCcD0F45zDqNB
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2020 23:18:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZefpC7+D42kW5r01RV2eCR4hvBjSGv7vgBIXcxq7mE=;
 b=MWcBjNONIUepG0dr/BpxgkczOthJt/dt0kpanshXQxy6qdb/46my386P21MU69P4D0QiYn7W6ktWPtdFdbYu3kdupGW8AHi8N8tbVl1pgDkfUvHu3+tOarVcVJX5d4NZAJ2KDiqwTM1CIOinnvzP8/BRw0yeaqRxvLs9dXxuhtE=
Received: from SG2PR03CA0146.apcprd03.prod.outlook.com (2603:1096:4:c8::19) by
 SG2PR04MB2665.apcprd04.prod.outlook.com (2603:1096:4:64::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.14; Thu, 10 Dec 2020 12:17:52 +0000
Received: from SG2APC01FT041.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:c8:cafe::85) by SG2PR03CA0146.outlook.office365.com
 (2603:1096:4:c8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.5 via Frontend
 Transport; Thu, 10 Dec 2020 12:17:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.56)
 smtp.mailfrom=hcl.com; gmail.com; dkim=pass (signature was verified)
 header.d=HCL.COM;gmail.com; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.56 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.56; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.195.56) by
 SG2APC01FT041.mail.protection.outlook.com (10.152.251.61) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Thu, 10 Dec 2020 12:17:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OxY6HcWrIEmsBCH0eC9z/wArTxVqxzdaeg4aZxDs4RYpxcUlacgfT8eIpN4eJlnWAhoIEELLmvRD939CR0ZYSlnjzvmkzTfFGe6CLjOh9o3rPPfXQWTJ1LGc40RvZiSyQpU4YTMgORc0uyeyplneqcT3IyCOQwAc7Q/co5sUb7Q4VO6Kzxhhz7lVL7Ji84/zqA2Dzq4xKIyclt1238pBYphBvHRvh2gTMLHccVEYf4Vf22v/WxJhKbjyvY3+19mWwveGWfw57TQ4895gUBt1ZUr/N5hHk3s01G1enRNSdH+u0A6i7pnMAHhb2Kr4q5yaWM8V9AswMTxOVEMUt1dI3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZefpC7+D42kW5r01RV2eCR4hvBjSGv7vgBIXcxq7mE=;
 b=DaFxKygFCI3om+dXJEd+OAaEazhHycKAYbq328eiIeNBKty7/1wMcEXrVZ/I3ZERoy50Iz9oLKX0M7DFCEQou5hevKarQEP4gIP6LM7ML/NucsEIgZeQW0ZDvsbd4QBRDcTSzcEdUcSEv6p+lNqtnUTnwRytPLLy7vSEKCxLqjOgs2SLvScMbfhZCrzYy5nc6z+Z+SIVldLLaabIY4Q6yb03FTzK/OhfDQGvMi58TB7G9M2wQsOM85Vw9Cd27gWUlOXtl/QIJevKj1xki+9hQz+V3XpHnqoeiRRnW7IP4Qxz3oxIcyNn/wTNNiggbLWEjC+Mw10RqRzE/irafVbCiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZefpC7+D42kW5r01RV2eCR4hvBjSGv7vgBIXcxq7mE=;
 b=MWcBjNONIUepG0dr/BpxgkczOthJt/dt0kpanshXQxy6qdb/46my386P21MU69P4D0QiYn7W6ktWPtdFdbYu3kdupGW8AHi8N8tbVl1pgDkfUvHu3+tOarVcVJX5d4NZAJ2KDiqwTM1CIOinnvzP8/BRw0yeaqRxvLs9dXxuhtE=
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com (2603:1096:203:5d::15)
 by HK2PR04MB3844.apcprd04.prod.outlook.com (2603:1096:202:3d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Thu, 10 Dec
 2020 12:17:46 +0000
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::1199:48c0:a788:18ec]) by HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::1199:48c0:a788:18ec%5]) with mapi id 15.20.3632.026; Thu, 10 Dec 2020
 12:17:46 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>,
 "richard.marian.thomaiyar@linux.intel.com"
 <richard.marian.thomaiyar@linux.intel.com>, "sumanth.bhat@intel.com"
 <sumanth.bhat@intel.com>
Subject: RE: Add firmware implementation in pldm
Thread-Topic: Add firmware implementation in pldm
Thread-Index: AdbOPE3oPF0lIoFJQfKCQ2E6Pk/MoQACnEAAACQXiYA=
Date: Thu, 10 Dec 2020 12:17:46 +0000
Message-ID: <HK0PR04MB296465225FD6E6F7BFDD138AFDCB0@HK0PR04MB2964.apcprd04.prod.outlook.com>
References: <HK0PR04MB2964D0B4027D7B3AE80A3E9EFDCC0@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <CAM=TmwX79oj-KZ2mj1ENGcGnq37TCo-KijWENU3_3mWC2AtdAw@mail.gmail.com>
In-Reply-To: <CAM=TmwX79oj-KZ2mj1ENGcGnq37TCo-KijWENU3_3mWC2AtdAw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-hclclassification: HCL_Cla5s_1nt3rnal
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiMGFhMWQyZmEtMTA1Mi00ZWI5LThiMjAtY2Q5OTgyODNjMzAwIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzXzFudDNybmFsIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE4LjQuMTg0My4xMjMiLCJUcnVzdGVkTGFiZWxIYXNoIjoiV1dZTHEwdEJtZzBSdmhYb0F5SUg5Sm4rTlA4VXFDd1JBanhNYzRJcnl3d2tUTlwvKzEwMm01eUJ6b2pJNHdBYnEifQ==
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [2409:4072:6099:ce51:8de8:1baa:8965:80ce]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d684e746-7c86-478b-8041-08d89d059dc5
x-ms-traffictypediagnostic: HK2PR04MB3844:|SG2PR04MB2665:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <SG2PR04MB266513A9B912384F356CE7BBFDCB0@SG2PR04MB2665.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: DqBONNQHDmBgBRrCX/THr7nbrLnf8Ad+XCc+uMmKQs30XXX2QJfR6RPrzUOdBE6gHKv9fTAuH5xZ5DK76fvJyI3Nje9ncmirl1/BSUuSHPxmUBwTlQRSZHIep2keCYm+Z86tLrTwnC4VCMY+Sj9Ig1RbHAUuPSyubTmknOjGu3Ctg6JfSqucrvrw6ZVVd1MVNs04dXqzCFl8Gsmf333Tvm+9j7XTd8KAGy3HqccvZg9rPvb0r56ZXX3KUDyA8eCv1lUjmTVsC6wJgvOAl6YxWDmbEDx8IdTan+ilBmZP56GpY4+8vcFuhexh1zpG26+tQonQjkBZrC+D1pgQANPq1BoG1zpIQNIM2QgW59khxwfoFg7vKjSToiSMG+GS6jrJMUVJ67GAXkASskx0noZ7Ww==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HK0PR04MB2964.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(376002)(508600001)(8936002)(83380400001)(8676002)(64756008)(86362001)(66556008)(66476007)(66946007)(55016002)(9686003)(52536014)(5660300002)(76116006)(4326008)(66446008)(966005)(45080400002)(71200400001)(53546011)(6506007)(7696005)(110136005)(54906003)(186003)(33656002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?VUpSQUxhTzMrd2pLSVFHSTc2SzU3eitvKytIY2ZUd2w2amsvdHhRQUVyY2Jv?=
 =?utf-8?B?UU1IVmpPRVA1ZHJJa2U2OUNvN01reU03RTF4bWlWQk5wV3JMWUhaV3U3aE40?=
 =?utf-8?B?L3Z6SmpRcjRET0lNcXVCYkpVOUNVSU5OMWRrS1ZXWm1UQWU5LzBock1RMjd0?=
 =?utf-8?B?VkJkOW9CdjU3VVdnbERqdHpkajgyWEhLZWxoZWJoU2hiR1NCNkFtbitWdDA4?=
 =?utf-8?B?UnZIM1dNYUxZZitnengxeVhCaXpKZ3JkU1BCUUZHNE9xQ1A3TlVmaUIvWDRS?=
 =?utf-8?B?MkJJU3kzSnNNTGNZdUZsS2xsOXF0NnBWOW9oVXFnc08xeXlQQW51RnZHS0RN?=
 =?utf-8?B?MVZUSXJjNEZnUHI0Y0xYbVVZR0prcU1mUXk4N0V0dXJYZGJmRFg5NUVIS2FT?=
 =?utf-8?B?Sk9DaU5tY0VLeDk0ZmRldk5qYXFrUVZITUwvRUF0VE5UYjRERG5LY3RhSWNm?=
 =?utf-8?B?bUVTN2JENC9CTnRhb3VVZ3lWdHYzNW9kNFNVVXU5T2dsV0NVSTV6WFp5RkQz?=
 =?utf-8?B?REpockNhdzNJQWNaMU54amNyVlkyK3Fuak5MZVd1eFArT3VGRWh4SXZPSkRP?=
 =?utf-8?B?dGR5T2NzS0tESG0yZzYzSUh1T3VhQmVKSW12S1VSV1Q5N01Lc2VmcW1IVFdE?=
 =?utf-8?B?SzJPZ040UU9rQjFwdy8xdTJLMlJlVUZ4STFxdXV6TXljUlY2a2phK1VZeUVi?=
 =?utf-8?B?TGh3ME92TUFidU5TZmNBSDMwZG5tSUR6RnUyemR2NERFRkR2UktHSElUdGd2?=
 =?utf-8?B?RFN0d05YY0NIa0w2Y3NGVnJXS3hkYU94cnN2MXRkRHlIaVA1SXczNC9WOGRl?=
 =?utf-8?B?MG1yS1V4VS90cUdqUXVLWnFiNzNqUjhKKzUyZVlJT25LSXdUUUJxUk5TQVVa?=
 =?utf-8?B?S2JLUHBYaDhzcFdZdHlaUjZ6Wmxic0pUNlZQK1p6L3JjditjekNpN2wrcmlL?=
 =?utf-8?B?cHFsQk9hVjJ3Wm42RHVHS3UvdTJ3MFVFd0FDTndPQWdPZUk5QUt1YUlBMndD?=
 =?utf-8?B?bDRseXVoMjlIUDkrY21LTERFQlp0YVdNVGYwTFBJZElKekpvQmwxRGxOSG1P?=
 =?utf-8?B?ZGErNjRzT2g3VkQ3NW84T0xDeDJscitPbTlpbjI2NUF0VTczcEVSSkJ5WjNn?=
 =?utf-8?B?M1dhRTlSY2dwRWhPdFF4b1VkUmdpYWI0SWIwaGhDRENEQWRjb3pTL3BGa24x?=
 =?utf-8?B?YjhuS1hHQjJ0blpscHNobEpBSXY0Zkl1cnNWQ1psOEZBbERGdXpaZXAvOCtD?=
 =?utf-8?B?Qm1XRDVLQzVveGhmTUUwL05LVWhJdERibkREMTJpVXJNVFIwY3V4dHVMOEly?=
 =?utf-8?B?SkZxbmVRTTJVV3Y4c1VybDZiNm5zbkhhblpsK3o4a3VUNVNDQ1l0ODQzYTI3?=
 =?utf-8?Q?dgF0wTLuzpsQ96CXYCpAFex3oyiBwT94=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR04MB3844
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT041.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 45dfb6ef-cad8-4af5-ff7d-08d89d059a47
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LUk6uuiuobbkBTw5SGaountyb/jydBDfxHO9updV1M6nAzHW8BiLFznkxQIO6RmZ6WnHnoXqLeH13623zWeBaJ3gQsa2A0aGicvqdNpjVydPHMWmxj4/oHZK8SwecNh3AKLooVLbsp42AfFBRwfV/R9iDQkaV4sH8ThUFAGMrTC/AaKP9adTvMxXNbqYf1NQft+zeVpHG6AviGOfUU0s3IwVG0q0I2Lhzt34UYhsHIhwhHWuoOuWsgzyN5kk/q9MUqOmMI2gaBGi8xJqfapmivOdfBhNToWxhWbERl3G51lvHB+SK6ozinkxbolACIj0LX4q75lHZn3AIKeAhiqMSvjHrGtcQmNLJaU8o+2TemOtUJU4rtqN8vCiwel0cI4EnmZMMnS9Q7/UypmSWL8rxTQnRzaG8x8K0cL/qEnHDQFIF3Y7GbxGE+IjN5914dbzz6Ad8xedcwd4xGsrTaG7gEgVuEyO8SXnNameXNd4QiU=
X-Forefront-Antispam-Report: CIP:192.8.195.56; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(46966005)(45080400002)(86362001)(26005)(36906005)(8676002)(186003)(52536014)(5660300002)(47076004)(4326008)(336012)(356005)(508600001)(82310400003)(7696005)(81166007)(83380400001)(110136005)(53546011)(6506007)(966005)(8936002)(33656002)(54906003)(2906002)(70586007)(70206006)(9686003)(55016002);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 12:17:51.3511 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d684e746-7c86-478b-8041-08d89d059dc5
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.56];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT041.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2665
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Velumani
 T-ERS,HCLTech" <velumanit@hcl.com>, Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Q2xhc3NpZmljYXRpb246IEludGVybmFsDQoNCkhpIERlZXBhaywNCg0KICAgICAgICAgICBUaGFu
a3MgZm9yIHlvdXIgcmVzcG9uc2UuICBQbGVhc2UgZmluZCBiZWxvdyBteSByZXNwb25zZSBpbmxp
bmUuDQoNClRoYW5rcywNCkt1bWFyLg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJv
bTogRGVlcGFrIEtvZGloYWxsaSA8ZGVlcGFrLmtvZGloYWxsaS44M0BnbWFpbC5jb20+IA0KU2Vu
dDogV2VkbmVzZGF5LCBEZWNlbWJlciA5LCAyMDIwIDk6NDcgUE0NClRvOiBLdW1hciBUaGFuZ2F2
ZWwgPHRoYW5nYXZlbC5rQGhjbC5jb20+OyByaWNoYXJkLm1hcmlhbi50aG9tYWl5YXJAbGludXgu
aW50ZWwuY29tOyBzdW1hbnRoLmJoYXRAaW50ZWwuY29tDQpDYzogb3BlbmJtY0BsaXN0cy5vemxh
YnMub3JnOyBWZWx1bWFuaSBULUVSUyxIQ0xUZWNoIDx2ZWx1bWFuaXRAaGNsLmNvbT47IHNkYXNh
cmlAZmIuY29tOyBQYXRyaWNrIFdpbGxpYW1zIDxwYXRyaWNrdzNAZmIuY29tPjsgdG9tam9zZUBs
aW51eC52bmV0LmlibS5jb20NClN1YmplY3Q6IFJlOiBBZGQgZmlybXdhcmUgaW1wbGVtZW50YXRp
b24gaW4gcGxkbQ0KDQpbQ0FVVElPTjogVGhpcyBFbWFpbCBpcyBmcm9tIG91dHNpZGUgdGhlIE9y
Z2FuaXphdGlvbi4gVW5sZXNzIHlvdSB0cnVzdCB0aGUgc2VuZGVyLCBEb27igJl0IGNsaWNrIGxp
bmtzIG9yIG9wZW4gYXR0YWNobWVudHMgYXMgaXQgbWF5IGJlIGEgUGhpc2hpbmcgZW1haWwsIHdo
aWNoIGNhbiBzdGVhbCB5b3VyIEluZm9ybWF0aW9uIGFuZCBjb21wcm9taXNlIHlvdXIgQ29tcHV0
ZXIuXQ0KDQpIaSBLdW1hciwNCg0KDQpPbiBXZWQsIERlYyA5LCAyMDIwIGF0IDk6MjAgUE0gS3Vt
YXIgVGhhbmdhdmVsIDx0aGFuZ2F2ZWwua0BoY2wuY29tPiB3cm90ZToNCj4NCj4gQ2xhc3NpZmlj
YXRpb246IEludGVybmFsDQo+DQo+IEhpIEFsbCwNCj4NCj4NCj4NCj4gICAgICAgICAgV2UgcGxh
bm5pbmcgdG8gZG8gTklDIGZpcm13YXJlIHVwZGF0ZSBmb3Igb3VyIHN5c3RlbSBwbGRtIGJhc2Uu
DQoNCkdyZWF0IQ0KDQo+DQo+ICAgICAgICAgIFNvLCBXZSB3b3VsZCBsaWtlIHRvIGFkZCBpbXBs
ZW1lbnRhdGlvbiBzdXBwb3J0IGZvciBwbGRtIGJhc2UgZmlybXdhcmUgdXBkYXRlLiBUaGlzIHNo
b3VsZCBiZSBnZW5lcmljIGZvciBhbGwgdG8gdXNlIGZpcm13YXJlIHVwZGF0ZSBmb3IgYW55IGRl
dmljZXMuDQo+ICAgICAgICAgIERvIHdlIG5lZWQgdG8gY3JlYXRlIGZpbGVzIOKAnGZpcm13YXJl
dXBkYXRlLmNwcC8uaHBwIGZpbGVz4oCdIHVuZGVyIHBsZG0gZGVhbW9uIGFzIGdlbmVyaWMgdG8g
aGFuZGxlIGZpcm13YXJlIGJhc2UgcGxkbSBjb21tYW5kcz8NCg0KU2luY2UgdGhlcmUgaXMgYSBQ
TERNIGZpcm13YXJlIHVwZGF0ZSBzcGVjaWZpY2F0aW9uLCBhIGdlbmVyaWMgZGVzaWduIGFuZCBp
bXBsZW1lbnRhdGlvbiBpcyBhIGRlZmluaXRlIHBvc3NpYmlsaXR5Lg0KDQo+ICAgICAgICAgIEFs
c28sIHBsZWFzZSBzdWdnZXN0IHRvIHJlcG8gYWRkIHRoZSBCTUMgYXBwbGljYXRpb25zIHRvIHNl
bmQgYW5kIHJlY3YgdGhlIGNvbW1hbmQgaGFuZGxpbmcuDQo+DQo+ICAgICAgICAgIENvdWxkIFBs
ZWFzZSBwcm92aWRlIHlvdXIgY29tbWVudHMvc3VnZ2VzdGlvbnMgb24gdGhpcyBpbXBsZW1lbnRh
dGlvbi4NCg0KV2lsbCB5b3UgYmUgYWJsZSB0byB1cGRhdGUNCmh0dHBzOi8vYXBjMDEuc2FmZWxp
bmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmdpdGh1Yi5jb20l
MkZvcGVuYm1jJTJGZG9jcyUyRmJsb2IlMkZtYXN0ZXIlMkZkZXNpZ25zJTJGcGxkbS1zdGFjay5t
ZCZhbXA7ZGF0YT0wNCU3QzAxJTdDdGhhbmdhdmVsLmslNDBoY2wuY29tJTdDOGI3ZjQ5ZTE3NmI5
NDFjMmRlNDAwOGQ4OWM1ZGU5N2YlN0MxODlkZTczN2M5M2E0ZjVhOGI2ODZmNGNhOTk0MTkxMiU3
QzAlN0MwJTdDNjM3NDMxMjc0NDQ3NzczMzI3JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJ
am9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1u
MCUzRCU3QzEwMDAmYW1wO3NkYXRhPVhQaDFBdGY4bk16RUZqTDFsaHFUNEtuQ2RWU0RhYll0cGFr
MzkwOXZaOHclM0QmYW1wO3Jlc2VydmVkPTAgd2l0aCBhIGRlc2lnbiBzZWN0aW9uIG9uIGZpcm13
YXJlIHVwZGF0ZT8gU29tZSBvZiB0aGUgdGhpbmdzIEkgd291bGQgbGlrZSB0byByZXZpZXcgdmlh
IHRoaXMgZG9jIHVwZGF0ZToNCg0KICAgS3VtYXIgOiBTdXJlLiBJIHdpbGwgdXBkYXRlIHRoZSBk
b2N1bWVudC4gDQoNCi0gSG93IGRvZXMgdGhpcyBpbnRlZ3JhdGUgd2l0aCB0aGUgY3VycmVudCBP
cGVuQk1DIGZpcm13YXJlIHVwZGF0ZSBhcmNoaXRlY3R1cmUsIGFuZCBhbHNvIHdpdGggUmVkZmlz
aCB1cGRhdGUgc2VydmljZT8NCg0KICAgIEt1bWFyIDogICAgIE5lZWQgdG8gZXhwbG9yZS4gUGxl
YXNlIHByb3ZpZGUgeW91ciBzdWdnZXN0aW9ucyBvbiB0aGlzLg0KDQotIFdoYXQgd2lsbCBQTERN
IHJ1biBvbj8gUkJUIG9yIE1DVFA/IE1DVFAgb3ZlciB3aGF0IGJpbmRpbmc/DQoNCiAgICBLdW1h
ciA6IFBMRE0gcnVuIG9uIE5JQy1TSSB0cmFuc3BvcnQuICANCg0KLSBEbyB5b3UgYW50aWNpcGF0
ZSBjaGFuZ2VzIHRvIGxpYm1jdHA/DQoNCiAgIEt1bWFyIDogTm8uIFRoaXMgaXMgYmFzZWQgb24g
TklDLVNJIHRyYW5zcG9ydA0KDQotIEhvdyBkb2VzIHRoaXMgZml0IGludG8gdGhlIGV4aXN0aW5n
IGh0dHBzOi8vYXBjMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRw
cyUzQSUyRiUyRmdpdGh1Yi5jb20lMkZvcGVuYm1jJTJGcGxkbSZhbXA7ZGF0YT0wNCU3QzAxJTdD
dGhhbmdhdmVsLmslNDBoY2wuY29tJTdDOGI3ZjQ5ZTE3NmI5NDFjMmRlNDAwOGQ4OWM1ZGU5N2Yl
N0MxODlkZTczN2M5M2E0ZjVhOGI2ODZmNGNhOTk0MTkxMiU3QzAlN0MwJTdDNjM3NDMxMjc0NDQ3
NzczMzI3JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlq
b2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzEwMDAmYW1wO3NkYXRh
PWRNOGZKd0dyNWx6OURXWllDWG1xdUhmSHBCUUdFdmlPcEpCQ1A0T2R4U28lM0QmYW1wO3Jlc2Vy
dmVkPTANCmRlc2lnbj8gV2hhdCBuZXcgY29tcG9uZW50cyB3aWxsIHlvdSBiZSBhZGRpbmc/IFdp
bGwgbGlicGxkbSBhbmQgcGxkbWQgYmUgaW1wYWN0ZWQsIGFuZCBob3c/DQogICAgDQogICBLdW1h
cjogcGxkbWQgd2lsbCBiZSBpbXBhY3RlZCB0byBoYW5kbGUgZmlybXdhcmUgdXBkYXRlIGNvbW1h
bmRzIHJlcXVlc3QvcmVzcG9uc2UuIFdpbGwgaW52ZXN0aWdhdGUgaW4gZGV0YWlsIGFuZCB1cGRh
dGUgeW91IG9uIHRoaXMuIA0KDQotIFRoZSA1LjkgTGludXggS2VybmVsIGhhcyBzb21lIEFQSXMg
Zm9yIFBMRE0gYmFzZWQgZmlybXdhcmUgdXBkYXRlLg0KQ2FuIHdlIHVzZSB0aG9zZT8NCiANCiAg
S3VtYXIgOiBZZXMuIFdlIGNhbiB1c2UgdGhhdCBhbHNvLiANCg0KLSBIb3cgZG8gd2UgcGxhbiB0
byB0ZXN0IHRoaXM/IElzIGhhcmR3YXJlIGEgbXVzdD8gT3IgYXJlIHlvdSBwbGFubmluZyBvbiBt
b2NraW5nIGEgUExETSByZXNwb25kZXI/DQoNCiBLdW1hciA6IFdlIGhhdmUgaGFyZHdhcmUuIFNv
IHBsYW5uaW5nIHRvIHRlc3QgaW4gdGhlIGhhcmR3YXJlLiANCg0KSSB0aGluayBhIHF1aWNrIHJl
dmlldyBvZiBzdWNoIGEgZGVzaWduIGRvYyB3aWxsIGJlIGJlbmVmaWNpYWwgYmVmb3JlIGRlbHZp
bmcgaW50byBjb2RlLiBBbHNvLCBwbGVhc2Ugbm90ZSAtIFJpY2hhcmQgYW5kIFN1bWFudGggKGNv
cGllZA0KdGhlbSkgYXJlIHdvcmtpbmcgb24gc2ltaWxhciBzdHVmZiBhcyB3ZWxsLiBTbyB0aGVy
ZSBjb3VsZCBiZSBzY29wZSBmb3IgY29sbGFib3JhdGlvbiBhbmQgdG8gYXZvaWQgbGlrZWx5IGR1
cGxpY2F0ZSBlZmZvcnQuIFdlIGRvIHRhbGsgYWJvdXQgb25nb2luZyBQTERNIGFjdGl2aXRpZXMg
aW4gT3BlbkJNQyBpbiB0aGlzIG1lZXQgLSBodHRwczovL2FwYzAxLnNhZmVsaW5rcy5wcm90ZWN0
aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZnaXRodWIuY29tJTJGb3BlbmJtYyUy
Rm9wZW5ibWMlMkZ3aWtpJTJGT3BlbkJNQy1QTUNJLVdHJmFtcDtkYXRhPTA0JTdDMDElN0N0aGFu
Z2F2ZWwuayU0MGhjbC5jb20lN0M4YjdmNDllMTc2Yjk0MWMyZGU0MDA4ZDg5YzVkZTk3ZiU3QzE4
OWRlNzM3YzkzYTRmNWE4YjY4NmY0Y2E5OTQxOTEyJTdDMCU3QzAlN0M2Mzc0MzEyNzQ0NDc3NzMz
MjclN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYy
bHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9ckRU
c0N5N0p6YSUyRjZnOGpsN2EyQ3pLd3p2b1QwWEhIbkQ5R2RiMTE5N0FZJTNEJmFtcDtyZXNlcnZl
ZD0wLg0KDQpLdW1hciA6ICBTdXJlLiAgV2lsbCBqb2luIHRoZSBkaXNjdXNzaW9uLiANCg0KVGhh
bmtzLA0KRGVlcGFrDQoNCj4NCj4gVGhhbmtzLA0KPg0KPiBLdW1hci4NCj4NCj4gOjpESVNDTEFJ
TUVSOjoNCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gVGhlIGNvbnRlbnRz
IG9mIHRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudChzKSBhcmUgY29uZmlkZW50aWFsIGFu
ZCBpbnRlbmRlZCBmb3IgdGhlIG5hbWVkIHJlY2lwaWVudChzKSBvbmx5LiBFLW1haWwgdHJhbnNt
aXNzaW9uIGlzIG5vdCBndWFyYW50ZWVkIHRvIGJlIHNlY3VyZSBvciBlcnJvci1mcmVlIGFzIGlu
Zm9ybWF0aW9uIGNvdWxkIGJlIGludGVyY2VwdGVkLCBjb3JydXB0ZWQsIGxvc3QsIGRlc3Ryb3ll
ZCwgYXJyaXZlIGxhdGUgb3IgaW5jb21wbGV0ZSwgb3IgbWF5IGNvbnRhaW4gdmlydXNlcyBpbiB0
cmFuc21pc3Npb24uIFRoZSBlIG1haWwgYW5kIGl0cyBjb250ZW50cyAod2l0aCBvciB3aXRob3V0
IHJlZmVycmVkIGVycm9ycykgc2hhbGwgdGhlcmVmb3JlIG5vdCBhdHRhY2ggYW55IGxpYWJpbGl0
eSBvbiB0aGUgb3JpZ2luYXRvciBvciBIQ0wgb3IgaXRzIGFmZmlsaWF0ZXMuIFZpZXdzIG9yIG9w
aW5pb25zLCBpZiBhbnksIHByZXNlbnRlZCBpbiB0aGlzIGVtYWlsIGFyZSBzb2xlbHkgdGhvc2Ug
b2YgdGhlIGF1dGhvciBhbmQgbWF5IG5vdCBuZWNlc3NhcmlseSByZWZsZWN0IHRoZSB2aWV3cyBv
ciBvcGluaW9ucyBvZiBIQ0wgb3IgaXRzIGFmZmlsaWF0ZXMuIEFueSBmb3JtIG9mIHJlcHJvZHVj
dGlvbiwgZGlzc2VtaW5hdGlvbiwgY29weWluZywgZGlzY2xvc3VyZSwgbW9kaWZpY2F0aW9uLCBk
aXN0cmlidXRpb24gYW5kIC8gb3IgcHVibGljYXRpb24gb2YgdGhpcyBtZXNzYWdlIHdpdGhvdXQg
dGhlIHByaW9yIHdyaXR0ZW4gY29uc2VudCBvZiBhdXRob3JpemVkIHJlcHJlc2VudGF0aXZlIG9m
IEhDTCBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGVt
YWlsIGluIGVycm9yIHBsZWFzZSBkZWxldGUgaXQgYW5kIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVk
aWF0ZWx5LiBCZWZvcmUgb3BlbmluZyBhbnkgZW1haWwgYW5kL29yIGF0dGFjaG1lbnRzLCBwbGVh
c2UgY2hlY2sgdGhlbSBmb3IgdmlydXNlcyBhbmQgb3RoZXIgZGVmZWN0cy4NCj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCg==
