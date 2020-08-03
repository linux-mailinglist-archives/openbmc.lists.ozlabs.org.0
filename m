Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0972C23AABD
	for <lists+openbmc@lfdr.de>; Mon,  3 Aug 2020 18:46:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BL3gV2c83zDqTP
	for <lists+openbmc@lfdr.de>; Tue,  4 Aug 2020 02:46:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.130.105; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=velumanit@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=SeC7yU0v; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=SeC7yU0v; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300105.outbound.protection.outlook.com [40.107.130.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BL3fH5lWczDqRL
 for <openbmc@lists.ozlabs.org>; Tue,  4 Aug 2020 02:45:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNUlKZrc0qkqBOS8hIp+nhRJ0o53BBganis4KdCi1Qw=;
 b=SeC7yU0vPVglPrYsyBhfxe02YLUHrjKR6tH9hbcDaTQyDRj6jCY1re+4Hwr+f3xQM8xxsNvN2WaVl2wVytOYzXxcRZpY6hQnb+7vJ8HBZHcaKY8Q22wHv4ahGMGc8MBYS0ZGpEAfRtP2MEPl3GrMGizqVdFVzNF2JzRfMsY1l6o=
Received: from HK0PR01CA0066.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::30) by HK0PR04MB2481.apcprd04.prod.outlook.com
 (2603:1096:203:4d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.19; Mon, 3 Aug
 2020 16:45:15 +0000
Received: from HK2APC01FT055.eop-APC01.prod.protection.outlook.com
 (2603:1096:203:a6:cafe::8f) by HK0PR01CA0066.outlook.office365.com
 (2603:1096:203:a6::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend
 Transport; Mon, 3 Aug 2020 16:45:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.53)
 smtp.mailfrom=hcl.com; tanous.net; dkim=pass (signature was verified)
 header.d=HCL.COM; tanous.net; dmarc=permerror action=none header.from=hcl.com; 
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.53; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.245.53) by
 HK2APC01FT055.mail.protection.outlook.com (10.152.249.48) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Mon, 3 Aug 2020 16:45:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/+epELT3orD+2LgihQ01+NVtRux1r5mRuJYH4kJTTPaFAFqtXz1a322C/ChgHtjb3THwIs95B/9nH2ycrQVqOTmu3P2quiMyypceDrCEEm4q7MnPMh1NFWGkUNkxff2fN5IaxzqItp7gld59AVQggEbCcXOwWRe3RVoG6HBoxqQA7vQT9a922kxI21pTMNl3wEzL/704t3mKQ3n9e7y29jlk/OxagQNF9q5DdNg+/LZhQhkmvZju+bGa+GaLt/8HF1qODu/eFNE4yFsZ/jGdDAPXMkTSf6b3Lvhvr4Za3aoivtcVaPSbqRgQwV3aTXDuRPT6v05Bhq4TM6TGP1kPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNUlKZrc0qkqBOS8hIp+nhRJ0o53BBganis4KdCi1Qw=;
 b=RiETv9HP4bDlVwR3L/PXvGlV/s6ydzV1TRqf3uzwMHLvyrQj8Axc0jcZgFzw5foCq7r1GDK7KqmJlav4ImKnNCnIbzit4K8yCEwLjKpkS7ooT3lvrfZXJnkA6OY0+yKLGh21v+aqqhvRYAAhKloOc9ejeSOCvEyAps09+MbMein9YFViMhhDlOGd1lZ6/cTEE8zR9nhya7S20fnbSE9pQ5kY6sibEvdf07rNelCjR5JXRCR3wVplCP5smykp0DVsgHjTsL2bTN5vEo1/RmRZVTa8fTqERBB7cq3W04SRM6GAasfN3Ks8ooHKw+8TZgnBbHQe/zQ2fSD3ELw9rUunUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNUlKZrc0qkqBOS8hIp+nhRJ0o53BBganis4KdCi1Qw=;
 b=SeC7yU0vPVglPrYsyBhfxe02YLUHrjKR6tH9hbcDaTQyDRj6jCY1re+4Hwr+f3xQM8xxsNvN2WaVl2wVytOYzXxcRZpY6hQnb+7vJ8HBZHcaKY8Q22wHv4ahGMGc8MBYS0ZGpEAfRtP2MEPl3GrMGizqVdFVzNF2JzRfMsY1l6o=
Received: from HK0PR04MB3153.apcprd04.prod.outlook.com (2603:1096:203:80::9)
 by HK0PR04MB2449.apcprd04.prod.outlook.com (2603:1096:203:44::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Mon, 3 Aug
 2020 16:45:07 +0000
Received: from HK0PR04MB3153.apcprd04.prod.outlook.com
 ([fe80::41c7:ca16:98b6:9f1a]) by HK0PR04MB3153.apcprd04.prod.outlook.com
 ([fe80::41c7:ca16:98b6:9f1a%7]) with mapi id 15.20.3239.021; Mon, 3 Aug 2020
 16:45:07 +0000
From: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
To: Ed Tanous <ed@tanous.net>
Subject: RE: x86-power-control - slot AC cycle
Thread-Topic: x86-power-control - slot AC cycle
Thread-Index: AdZk/4O+ACg3KsIESPq1JaZkBQJ4HwAUCauAARlC3MA=
Date: Mon, 3 Aug 2020 16:45:07 +0000
Message-ID: <HK0PR04MB3153FE2CFB446AD6612FA127A74D0@HK0PR04MB3153.apcprd04.prod.outlook.com>
References: <HK0PR04MB3153FFBD73CC1A4F35D88886A7730@HK0PR04MB3153.apcprd04.prod.outlook.com>
 <CACWQX82P0wr22kJ2fw6WDZz9zEELzPWJqOaRu1wP-E2B81dD=w@mail.gmail.com>
In-Reply-To: <CACWQX82P0wr22kJ2fw6WDZz9zEELzPWJqOaRu1wP-E2B81dD=w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiOTIxZThkM2MtNTc4Yy00MTI5LThlNzMtNjc4MDliODIwMmY4IiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoibnVsbCJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6IjV3V0xPTW9NbmY4bThidllTXC9iK2JVWlNRcUNhN2RhOTRzelVvQ05rRmZLVTRzUUhUNENxcjdEOE11VEpLYnZnIn0=
x-hclclassification: null
Authentication-Results-Original: tanous.net; dkim=none (message not signed)
 header.d=none;tanous.net; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [122.174.180.60]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d3de16aa-094e-4c29-5b6b-08d837cc97ad
x-ms-traffictypediagnostic: HK0PR04MB2449:|HK0PR04MB2481:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HK0PR04MB2481D21D0BCF8D179180012AA74D0@HK0PR04MB2481.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 3VUfQKgve6Do7FbJCgFmPibS4L+zz/hk55YWpQBswyVgB9NKrYaerGhmCa0cuTkeTthr9vulMJKlyWce1OkpiV+Powy79d1GsO6/kJRwpbOUFw50Akk4Xt9cIoHqqxe1Iu0VPBA4py192MGtSEwYW0qFPWzumHf4y64YGsdaP9cMe/1l2r0QC5TCeh+oxVNO1/XeZ4YK1uqekZKZA087mk0JG+yTciTM4nHW8hUaCyVz+hMCPjaXqxPRXzJjBcLhC6uEDcnhc7YgFTcuj22aA5T0KSAmOX0a+dItC3WlbSsUTJeK5YmQ4l2VfLbkhgJVQ/G0SXSbGsioprozK7CFhw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HK0PR04MB3153.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(4326008)(9686003)(55016002)(76116006)(26005)(2906002)(186003)(478600001)(316002)(52536014)(71200400001)(6916009)(83380400001)(86362001)(8936002)(7696005)(33656002)(66946007)(66476007)(66556008)(6506007)(53546011)(54906003)(5660300002)(64756008)(66446008)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: PuDle0Sd5fsMfmNrj6LtgkwqglzWuxRaewTR/EmeDYL0xz3xvvP15J3/eI4HsvGnix4TeZQtCYEuzAIbkZbLyZRoEjxer8jIpqttMBmDmHozhgOJ7+TQhyCFUQ22DN6SBxZ7qkkfq/9qMHDHYZCFNfWHzNY0AemFkaesmy7WiLKcVIzER/+HOfFIZ+vTBmLdfb/U4clepFn10aYhtasEMbvarM5wbQBVfVFaB6mUgZfWAzpNFTrTffE0H6CrI/OdLUFTUEtAlTyjCAzj9md+d0FhGkCVpsaNQwzOiVFeC0fIWUbR4gI12YaxvkbRAYU/vxqdfgfn5zSwHyYyASd0oPh3webUGd2cJgkrpDRCpLtJUAMoGwpDJLeaKvxwCSX9oFbO8+wZPnu2sWMB5BS+T0zgeyvfm0n6UMeTOZ3JWTIzxskarKBji5IupA6yxUkOKPP9Vumlut3Hg047Au9MDB/yJYfuMr+vfg2CT7QE6IPzGxuBjZIh9Izg/AyMVw0S71AG3M7LV7PN6yMf3yuJDSfpQDNGrFoQFX74sI8wNfSm5A9bUxIQwPYejCyBKAo/AM5E4XbOSypB433Tqjs4Q6mRZkWSBhc+5XqnMc40IGd4mJfKL57HKtZ8oeOibqvKgmB1x0rkwS8AbrapOJpxOg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2449
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT055.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: db58e9cc-da7b-4890-9cdf-08d837cc9468
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 43eFHWo09L6KRdy7vWSgFTfcSCUCLlvsNSkA3ylpFIpPncG0Cna3Jui8TKYASoTgB4tBCPfKF2oGoiBIDPL6okdsTItsHzwacseo+qG+bCQTHsf0HFC6LU2tXAVXUXAiYOSRHLsaint07b/9zHQeZtfs4DzljZLXwwuVpBqQodJHM2xYt8+HGROMPTT+eCK5oghsosRXDZ6gpAkPUVhnny4r1eHMTlPgeNudA5FbaJ4khv5Ufq8OMRYPvoYrQM8+4Knh6baUuy7S2mkqmlyXryP+X9A/xxf2lZCa+kWWdVoz+8TjVkmy9v67kkh/hjw6YIgUNn2WQHt59/67wVNTBGfO6Q8lccgYkgkP/qNOxjp69+zmHglNk+Fydnh15LsCiA0i6sqsoNBq+oMVPf5Ilw==
X-Forefront-Antispam-Report: CIP:192.8.245.53; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(46966005)(478600001)(316002)(26005)(356005)(7696005)(53546011)(82310400002)(86362001)(5660300002)(54906003)(83380400001)(47076004)(6506007)(186003)(82740400003)(81166007)(70206006)(70586007)(2906002)(6916009)(55016002)(33656002)(4326008)(52536014)(9686003)(8936002)(336012)(36906005)(8676002);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2020 16:45:12.4594 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3de16aa-094e-4c29-5b6b-08d837cc97ad
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.53];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT055.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2481
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
Cc: Jason Bills <jason.m.bills@intel.com>,
 Kuiying Wang <kuiying.wang@intel.com>, James Feist <james.feist@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "P. Priyatharshan" <PriyatharshanP@hcl.com>, Vijay Khemka <vijaykhemka@fb.com>,
 Kumar Thangavel <thangavel.k@hcl.com>, Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

VGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb25zLiBXZSBwbGFuIHRvIGltcGxlbWVudCB0aGUgc2xv
dCBBQyBjeWNsZSBmb3IgYSBzaW5nbGUgY2hhc3NpcyBzeXN0ZW0gd2l0aCA0IHNsb3RzLiBXZSB3
aWxsIHVzZSB0aGUgY29tcGlsZSB0aW1lIGZsYWdzIGFuZCBpbXBsZW1lbnQgdGhpcyBmZWF0dXJl
Lg0KDQpSZWdhcmRzLA0KVmVsdQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTog
RWQgVGFub3VzIDxlZEB0YW5vdXMubmV0PiANClNlbnQ6IFdlZG5lc2RheSwgSnVseSAyOSwgMjAy
MCA3OjU2IEFNDQpUbzogVmVsdW1hbmkgVC1FUlMsSENMVGVjaCA8dmVsdW1hbml0QGhjbC5jb20+
DQpDYzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBKYXNvbiBCaWxscyA8amFzb24ubS5iaWxs
c0BpbnRlbC5jb20+OyBQLiBQcml5YXRoYXJzaGFuIDxQcml5YXRoYXJzaGFuUEBoY2wuY29tPjsg
SmFtZXMgRmVpc3QgPGphbWVzLmZlaXN0QGludGVsLmNvbT47IEt1aXlpbmcgV2FuZyA8a3VpeWlu
Zy53YW5nQGludGVsLmNvbT47IFBhdHJpY2sgV2lsbGlhbXMgPHBhdHJpY2t3M0BmYi5jb20+OyBL
dW1hciBUaGFuZ2F2ZWwgPHRoYW5nYXZlbC5rQGhjbC5jb20+OyBWaWpheSBLaGVta2EgPHZpamF5
a2hlbWthQGZiLmNvbT4NClN1YmplY3Q6IFJlOiB4ODYtcG93ZXItY29udHJvbCAtIHNsb3QgQUMg
Y3ljbGUNCg0KW0NBVVRJT046IFRoaXMgRW1haWwgaXMgZnJvbSBvdXRzaWRlIHRoZSBPcmdhbml6
YXRpb24uIFVubGVzcyB5b3UgdHJ1c3QgdGhlIHNlbmRlciwgRG9u4oCZdCBjbGljayBsaW5rcyBv
ciBvcGVuIGF0dGFjaG1lbnRzIGFzIGl0IG1heSBiZSBhIFBoaXNoaW5nIGVtYWlsLCB3aGljaCBj
YW4gc3RlYWwgeW91ciBJbmZvcm1hdGlvbiBhbmQgY29tcHJvbWlzZSB5b3VyIENvbXB1dGVyLl0N
Cg0KT24gVHVlLCBKdWwgMjgsIDIwMjAgYXQgMTA6MTEgQU0gVmVsdW1hbmkgVC1FUlMsSENMVGVj
aCA8dmVsdW1hbml0QGhjbC5jb20+IHdyb3RlOg0KPg0KPg0KPiBXZSBhcmUgdXNpbmcgYSB4ODYt
cG93ZXItY29udHJvbCBmb3IgaG9zdCBwb3dlciBjb250cm9sIGluIGEgbXVsdGkgaG9zdCBzeXN0
ZW0uIFdlIGhhdmUgdGhlIGhvc3QgYXMgRlJVIGFuZCBpdCBjYW4gYmUgcGx1Z2dlZCBpbiB0byBh
IHNsb3QuIFRoZSBzbG90IGhhcyBhbiBvcHRpb24gdG8gY29udHJvbCBzbG90IHBvd2VyIGFuZCB0
aGlzIGNhbiBiZSB1c2VkIGZvciBhIEFDIGN5Y2xlLg0KPg0KPiBXZSBwcm9wb3NlIHRvIGFkZCB0
aGUgc2xvdCBwb3dlciBjb250cm9sIGluIHRoZSB4ODYtcG93ZXItY29udHJvbCwgVGhlIHNsb3Qg
cG93ZXIgY29udHJvbCBjYW4gYmUgY29uZmlndXJlZCBpbiBqc29uIGFuZCB0aGUgc2FtZSBjYW4g
YmUgaW1wbGVtZW50ZWQgcmVhZGluZyB0aGUganNvbiBjb25maWcuIFdlIGNhbiBlbnN1cmUgdGhl
IGV4aXN0aW5nIGZ1bmN0aW9uYWxpdHkgcmVtYWlucyB1bmNobmdlZCBhbmQgZG9lcyBub3QgYWZm
ZWN0IHRoZSBvdGhlciBwbGF0Zm9ybXMuDQo+DQo+DQo+DQo+IFRoZSBjb25maWcgZmlsZSBjYW4g
aGF2ZSBhIGdwaW8gZW50cnkgd2l0aCB0aGUgbmV3IGtleSDigJxTbG90X1Bvd2Vy4oCdLiBPbmx5
IGlmIHRoaXMgZW50cnkgaXMgcHJlc2VudCB0aGVuIHRoZSBzbG90IHBvd2VyIHdpbGwgYmUgaGFu
ZGxlZCwgT3RoZXJ3aXNlIHRoZSBleGlzdGluZyBmdW5jdGlvbmFsaXR5IHJlbWFpbnMgdGhlIHNh
bWUuIFBsZWFzZSBwcm92aWRlIHlvdXIgY29tbWVudHMvc3VnZ2VzdGlvbnMgZm9yIHRoaXMgcHJv
cG9zZWQgYXBwcm9hY2guDQoNCk9uZSBhbWVuZG1lbnQsIGlmIHlvdSdyZSBzZXR0aW5nIHRoaXMg
dXAgZm9yIGEgc2luZ2xlIGNoYXNzaXMgdHlwZSwgcGxlYXNlIG1ha2UgdGhpcyBhIGNvbXBpbGUg
dGltZSBzdHJ1Y3R1cmUgcmF0aGVyIHRoYW4gYSBjb25maWcgZmlsZSByZWFkIGZyb20gZGlzay4g
IEl0J3MgbXVjaCBlYXNpZXIgdG8gbWFuYWdlIGluIHRoZSBsb25nIHJ1biwgYXMgaXQgcHVzaGVz
IHJ1bnRpbWUgZXJyb3JzIHRvIGNvbXBpbGUgdGltZSwgYW5kIG1lYW5zIHRoYXQgd2UncmUgbGVz
cyBsaWtlbHkgdG8gYnJlYWsgaXQuICBBbHNvLCBpdCBzZW5kcyBhIGNsZWFyIG1lc3NhZ2UgdGhh
dCB3ZSBzaG91bGRuJ3QgYmUgY2hhbmdpbmcgdGhlIGNvbmZpZ3VyYXRpb24gYXQgcnVudGltZS4N
Cg0KSWYgeW91J3JlIHVzaW5nIHNvbWV0aGluZyBsaWtlIGVudGl0eS1tYW5hZ2VyLCBhbmQgeW91
IGRvIHdhbnQgdG8gc3VwcG9ydCBtb3JlIHRoYW4gb25lIGNoYXNzaXMsIHlvdSBwcm9iYWJseSB3
YW50IHRvIGRlZmluZSBzb21lIGtpbmQgb2YgImJhY2twbGFuZSIgZW50aXR5IHRoYXQgb3ducyB0
aGUgcG93ZXIgY29uZmlndXJhdGlvbiwgc28geW91IGNhbiBoYXZlIG11bHRpcGxlIHNsb3QgZGVm
aW5pdGlvbnMgY29uZmlndXJlZCBhdCBydW50aW1lIGluIHRoZSBzYW1lIGJ1aWxkLCB3aGljaCBt
aWdodCBub3QgYmUgYSBwcm9ibGVtIGZvciB5b3VyIHN5c3RlbSwgYnV0IGNhbiBiZSBhIHByb2Js
ZW0gZm9yIHN5c3RlbXMgd2l0aCBtdWx0aXBsZSBDaGFzc2lzIG9wdGlvbnMuDQoNCklkZWFsbHkg
eW91IHdvdWxkIGFsc28gYWRkIGEgbmV3ICJub2RlIiBzbG90IGRlZmluaXRpb24gdHlwZSwgc2lt
aWxhciB0byBob3cgd2UgZGVmaW5lIE0uMiBzbG90cyBhbmQgUENJZSBzbG90cyB0byBtYWtlIGRl
YnVnZ2luZyBlYXNpZXIuDQoNCg0KPg0KPiA6OkRJU0NMQUlNRVI6Og0KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXw0KPiBUaGUgY29udGVudHMgb2YgdGhpcyBlLW1haWwgYW5kIGFu
eSBhdHRhY2htZW50KHMpIGFyZSBjb25maWRlbnRpYWwgYW5kIGludGVuZGVkIGZvciB0aGUgbmFt
ZWQgcmVjaXBpZW50KHMpIG9ubHkuIEUtbWFpbCB0cmFuc21pc3Npb24gaXMgbm90IGd1YXJhbnRl
ZWQgdG8gYmUgc2VjdXJlIG9yIGVycm9yLWZyZWUgYXMgaW5mb3JtYXRpb24gY291bGQgYmUgaW50
ZXJjZXB0ZWQsIGNvcnJ1cHRlZCwgbG9zdCwgZGVzdHJveWVkLCBhcnJpdmUgbGF0ZSBvciBpbmNv
bXBsZXRlLCBvciBtYXkgY29udGFpbiB2aXJ1c2VzIGluIHRyYW5zbWlzc2lvbi4gVGhlIGUgbWFp
bCBhbmQgaXRzIGNvbnRlbnRzICh3aXRoIG9yIHdpdGhvdXQgcmVmZXJyZWQgZXJyb3JzKSBzaGFs
bCB0aGVyZWZvcmUgbm90IGF0dGFjaCBhbnkgbGlhYmlsaXR5IG9uIHRoZSBvcmlnaW5hdG9yIG9y
IEhDTCBvciBpdHMgYWZmaWxpYXRlcy4gVmlld3Mgb3Igb3BpbmlvbnMsIGlmIGFueSwgcHJlc2Vu
dGVkIGluIHRoaXMgZW1haWwgYXJlIHNvbGVseSB0aG9zZSBvZiB0aGUgYXV0aG9yIGFuZCBtYXkg
bm90IG5lY2Vzc2FyaWx5IHJlZmxlY3QgdGhlIHZpZXdzIG9yIG9waW5pb25zIG9mIEhDTCBvciBp
dHMgYWZmaWxpYXRlcy4gQW55IGZvcm0gb2YgcmVwcm9kdWN0aW9uLCBkaXNzZW1pbmF0aW9uLCBj
b3B5aW5nLCBkaXNjbG9zdXJlLCBtb2RpZmljYXRpb24sIGRpc3RyaWJ1dGlvbiBhbmQgLyBvciBw
dWJsaWNhdGlvbiBvZiB0aGlzIG1lc3NhZ2Ugd2l0aG91dCB0aGUgcHJpb3Igd3JpdHRlbiBjb25z
ZW50IG9mIGF1dGhvcml6ZWQgcmVwcmVzZW50YXRpdmUgb2YgSENMIGlzIHN0cmljdGx5IHByb2hp
Yml0ZWQuIElmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZW1haWwgaW4gZXJyb3IgcGxlYXNlIGRl
bGV0ZSBpdCBhbmQgbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkuIEJlZm9yZSBvcGVuaW5n
IGFueSBlbWFpbCBhbmQvb3IgYXR0YWNobWVudHMsIHBsZWFzZSBjaGVjayB0aGVtIGZvciB2aXJ1
c2VzIGFuZCBvdGhlciBkZWZlY3RzLg0KDQoNClNlbmRpbmcgInRoaXMgZW1haWwgaXMgY29uZmlk
ZW50aWFsIiB0byBhIHB1YmxpYyBtYWlsaW5nIGxpc3QgbWFrZXMgbWUgdGhpbmsgaSBnb3QgaXQg
aW4gZXJyb3IuICBJJ20gYWxzbyBub3QgYSAibmFtZWQgcmVjaXBpZW50Ii4gWW91IG1pZ2h0IHdh
bnQgdG8gY29uc2lkZXIgcmVtb3ZpbmcgaXQgaW4gdGhlIGZ1dHVyZSwgdW5sZXNzIHlvdSByZWFs
bHkgY29uc2lkZXJlZCB0aGlzIHRvIGJlIGNvbmZpZGVudGlhbC4NCg==
