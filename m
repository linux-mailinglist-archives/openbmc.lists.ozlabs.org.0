Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0312498F2
	for <lists+openbmc@lfdr.de>; Wed, 19 Aug 2020 11:00:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWhZq3W8szDqXm
	for <lists+openbmc@lfdr.de>; Wed, 19 Aug 2020 19:00:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=hcl.com (client-ip=2a01:111:f400:febe::731;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=YEpJH5cJ; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=YEpJH5cJ; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-pu1apc01on0731.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febe::731])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWhYp632JzDqXm
 for <openbmc@lists.ozlabs.org>; Wed, 19 Aug 2020 18:59:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHoihKi3kVh2hwUUiNAc2eT6r9e2T5VdNPZIGVvtZ74=;
 b=YEpJH5cJLHqzVSk3dgV9J09SHjnxvxdsU3NRmqAIM4d8W6WyqJzF5S3lFp4uebQxUT/WEY8+TkhJGlnCWDUTLoS90LMAHxwLYD9TSySDKAJwXbPtKfikJrvvNBRI61ybnhM/LNzbVpm1Z0PEx+z+2yh7oefledvAKOhDRXl4iuE=
Received: from PS2P216CA0059.KORP216.PROD.OUTLOOK.COM (2603:1096:300:18::21)
 by PSBPR04MB3928.apcprd04.prod.outlook.com (2603:1096:301:6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Wed, 19 Aug
 2020 08:59:41 +0000
Received: from PU1APC01FT057.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:18:cafe::9b) by PS2P216CA0059.outlook.office365.com
 (2603:1096:300:18::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Wed, 19 Aug 2020 08:59:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.57)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=permerror action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.57; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.195.57) by
 PU1APC01FT057.mail.protection.outlook.com (10.152.253.7) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Wed, 19 Aug 2020 08:59:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EBkK5tLBsudl1oaaD1PNPTXpbLJ+TwiBVrLfWgX6YoggJM01IkLPLnT1OoWLsufq06gcpOs2lb1aLTd85Xlb2KeuEftSc9LlLEoAfZs8UCMK1P7m7ltt3TEyrPmibExTUGSwMSp0OZSo0Eq9R42915PAJyiqNvm6bO0xC007kHM19THf0NCOLhLyf9WZVvBLRwZaFMlfsWUDikWg3PTioPAgvVfOulm1pVQvRwOxm6hTYWdTs/TP143mt8rh2GAmgoFBU0tMuM271y0A1/xUX+rd+daeANWVuH3ickt76O9IRFVlc9bny7tMV+gpWDxCoz3hbyE6P2rtKdxHB9YziA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHoihKi3kVh2hwUUiNAc2eT6r9e2T5VdNPZIGVvtZ74=;
 b=UMi06bSesi0VlGRZfhQiVBjDwTDmz6qMBu7nkzA1QQ181D1a0B0V81BYTPBRlhKRcqahs4XapDjFq9dKhuPg78/7bhynAXISDh1NCG3+I+B5ca9V6vFWWhhxmH9UDUFjvPz/rRi3fvNtSoIc/AGGXfhyX4LEkNRTEOsuwPSVUEmszrec0wwQZpUTq9nueEMr5Gxb5q9Vr9Bp2NkNeyBVsl1tBpV/wVZSo6IoX0TbYtiiUSRMSD4m6sU0HDefVE5oyQ5DCczfoa6bg/2moaAKxYMvm748NxSBFFM1YUIoB9WARCu7ulOQx+VTprjDS8e3jkHm+SD4S0mi1tgG2k9iBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHoihKi3kVh2hwUUiNAc2eT6r9e2T5VdNPZIGVvtZ74=;
 b=YEpJH5cJLHqzVSk3dgV9J09SHjnxvxdsU3NRmqAIM4d8W6WyqJzF5S3lFp4uebQxUT/WEY8+TkhJGlnCWDUTLoS90LMAHxwLYD9TSySDKAJwXbPtKfikJrvvNBRI61ybnhM/LNzbVpm1Z0PEx+z+2yh7oefledvAKOhDRXl4iuE=
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR0401MB2013.apcprd04.prod.outlook.com (2603:1096:3:5::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.18; Wed, 19 Aug 2020 08:59:33 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b93f:17bd:c016:eec7]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b93f:17bd:c016:eec7%4]) with mapi id 15.20.3283.028; Wed, 19 Aug 2020
 08:59:33 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Redfish Commands for network interface parameters
Thread-Topic: Redfish Commands for network interface parameters
Thread-Index: AdZxUCuWMycQjbbUSxavLGOXmL+ApgEqIm/Q
Date: Wed, 19 Aug 2020 08:59:33 +0000
Message-ID: <SG2PR04MB30933ED4048FE7820EC3E90EE15D0@SG2PR04MB3093.apcprd04.prod.outlook.com>
References: <SG2PR04MB30936853C79F6D04513ABEF0E1430@SG2PR04MB3093.apcprd04.prod.outlook.com>
In-Reply-To: <SG2PR04MB30936853C79F6D04513ABEF0E1430@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiMWQ0MjkxOWMtMGNjZi00YTAyLTk0MTctMTU5YmIxZjMzMmM4IiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoibnVsbCJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6IlJPdTRrMHhmbkRJWGNTb09Zd3F6c25UMHBCMjNUS0xSb1NtQlpmMCtrVFFock5xRklTSGFHYVwvaGFKdUpIUm1PIn0=
x-hclclassification: null
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [157.50.9.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 559ca9cc-79f0-40a0-3bc4-08d8441e34b7
x-ms-traffictypediagnostic: SG2PR0401MB2013:|PSBPR04MB3928:
X-Microsoft-Antispam-PRVS: <PSBPR04MB3928701AEEBB060994ACA580E15D0@PSBPR04MB3928.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: KPzcQvDnTSXAp7c1NB8hMgjLdgCJlbNmn/sV2VL5VNmLmrBTNhYKavSwLZk36fsq4vNIE3QocxvvwSqCzJeY8MzXSRX0I6Slc1VxByOgOKsscHN2hCpHCP5CuL1TtNS8rqbvQtjHH+hdiMZCdm6nwGy/8tNglagZ6hMgtmoviz5IE8+bMdxLPN3aJtWYMi2p4pGcQv215fdUbZ28jYKCwOpDPdf8c1XfqEZ0UuVB1Yr3YrCe8fluNCvmhkLbCix5Y1bWSk0oRhhF58hvBoBesandlpzeh8ZlYtFR7oq0NR5mrXmFtt7Xqy/zT5wXG9B8qRq2KkUUjfzVbdJ9/0dUug==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(39860400002)(366004)(396003)(33656002)(2906002)(64756008)(66946007)(66476007)(76116006)(7696005)(66446008)(5660300002)(26005)(83380400001)(66556008)(478600001)(8676002)(52536014)(4326008)(316002)(54906003)(53546011)(8936002)(71200400001)(6506007)(6916009)(55016002)(9326002)(9686003)(186003)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: S/mTh2xwtRW2q8C8fJulGr3qYUX/W98u8f/xq1KCNF/xprbXrZ22f7NkZSgDPMqazPbXgiTqiE9/S4rbSzYETDnhQQcIwWG0iKzmsQKlN5lKAFqW/UEqIRFAsnMhjIrkJPEVkd0SDoUUkbtFMbUKvUTRRAFFAHTGzSrJYIT+4lqhaCSlOo+1WdHmawFmRG0X5P/0TXSdsZENpvelkCppOif+P7TK9pknWvF2BQJoc/EKi6Mjd5aHNWo5axg0SdcjUIgGrm13k9bwa61/UFUzy4fkT2tU2+QjLh/Am4OA1QGrUsjCXTy/B58wyLBou5L05zRszuuE00nNl00C0XnKhZMNpDHE8qkUzhadcwAdsbN7H1jBx0nv6AMATYAbivBlmG1ymL/P3ulHcVgdXzdsJyWaOj0aHnNNgGv5djUwhPRAnWBAHQ5R25TDAGVwIdKY0kQfc0lC70h3jIsH5jxu02QP8kHhK5cGpEYSrQXK18zialgw7O0B9vpS1SwKYudnqYw/du2aedO8ZyXo6VLSWkqzqx/9Nu/Kge57mnF8O3JPzbIOPpPiJO9O5BnabgZOjmFLKjaakr7pajVS4qBemnmMIJvRnMycm/EnvnxS1l8Xy/sY5ISSK9l1mC65tmbCy/vHJH4Qd3laGyxlV8PuPA==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SG2PR04MB30933ED4048FE7820EC3E90EE15D0SG2PR04MB3093apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR0401MB2013
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT057.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: aac5f006-0853-477b-9cce-08d8441e3105
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zvQH0v/daFe9j11rA79LUV+gWG+gYftSHaaiUGJnhlW2dTMDgGXwTr9SAs+zy4pY95jgF3e0QZcfUb7It5CD/avj6+najnmvNNIvgZb7kUaVG78vOWpmjPBOzWnpsW/00ZeW4hnqnS1lIXWQkLyIwGCKfwVF3KxYK03SyGLQVw7/9rHACiUORr6wwJ9ncW0q23U62rTx5RqgQGWVBkZvcAx3ae5/NjN1OGglrSHBbY32ad3NuFPeoddveq93H1+4SPhn+TibFCYgi6xW6i3C0HoO0ER933gYPW7619ocPNycJm71WJd9TNaXVngAchpY2EsPrre418yfmtvrsaiPmeDxiG+znJyy7CtZsXrjN/3Sxk3U2R2+WasYa03xDJyl2n5V2RcIkiUnaG+SjredQg==
X-Forefront-Antispam-Report: CIP:192.8.195.57; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(46966005)(86362001)(356005)(70206006)(70586007)(81166007)(7696005)(82310400002)(5660300002)(6916009)(9326002)(2906002)(33964004)(47076004)(8936002)(82740400003)(33656002)(83380400001)(8676002)(4326008)(52536014)(478600001)(36906005)(26005)(9686003)(54906003)(186003)(6506007)(55016002)(53546011)(336012)(316002);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2020 08:59:38.5012 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 559ca9cc-79f0-40a0-3bc4-08d8441e34b7
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.57];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT057.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSBPR04MB3928
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
Cc: "wak@google.com" <wak@google.com>,
 "ratagupt@linux.vnet.ibm.com" <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_SG2PR04MB30933ED4048FE7820EC3E90EE15D0SG2PR04MB3093apcp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQWxsLA0KDQpJIGFtIGludGVyZXN0ZWQgdG8ga25vdywgaG93IHRvIGdldCB0aGUgbmV0d29y
ayBwYXJhbWV0ZXJzIGxpa2UgcGFja2V0IGNvdW50ZXJzIGFuZCBvdGhlciBpbnRlcmZhY2VzIHBh
cmFtZXRlciB1c2luZyByZWRmaXNoIGludGVyZmFjZT8gQ291bGQgeW91IHBsZWFzZSBsZXQgbWUg
a25vdy4NCg0KVGhhbmtzICYgUmVnYXJkcywNCkpheWFzaHJlZQ0KDQoNCg0KRnJvbTogSmF5YXNo
cmVlIEQNClNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgMTMsIDIwMjAgMjozOCBQTQ0KVG86IG9wZW5i
bWNAbGlzdHMub3psYWJzLm9yZw0KQ2M6IHJhdGFndXB0QGxpbnV4LnZuZXQuaWJtLmNvbTsgd2Fr
QGdvb2dsZS5jb20NClN1YmplY3Q6IFJlZGZpc2ggQ29tbWFuZHMgZm9yIG5ldHdvcmsgaW50ZXJm
YWNlIHBhcmFtZXRlcnMNCg0KSGkgQWxsLA0KDQpJIGFtIGludGVyZXN0ZWQgdG8ga25vdywgaG93
IHRvIGdldCB0aGUgbmV0d29yayBwYXJhbWV0ZXJzIGxpa2UgcGFja2V0IGNvdW50ZXJzIGFuZCBv
dGhlciBpbnRlcmZhY2VzIHBhcmFtZXRlciB1c2luZyByZWRmaXNoIGludGVyZmFjZT8gQ291bGQg
eW91IHBsZWFzZSBsZXQgbWUga25vdy4NCg0KVGhhbmtzICYgUmVnYXJkcywNCkpheWFzaHJlZQ0K
OjpESVNDTEFJTUVSOjoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpUaGUgY29u
dGVudHMgb2YgdGhpcyBlLW1haWwgYW5kIGFueSBhdHRhY2htZW50KHMpIGFyZSBjb25maWRlbnRp
YWwgYW5kIGludGVuZGVkIGZvciB0aGUgbmFtZWQgcmVjaXBpZW50KHMpIG9ubHkuIEUtbWFpbCB0
cmFuc21pc3Npb24gaXMgbm90IGd1YXJhbnRlZWQgdG8gYmUgc2VjdXJlIG9yIGVycm9yLWZyZWUg
YXMgaW5mb3JtYXRpb24gY291bGQgYmUgaW50ZXJjZXB0ZWQsIGNvcnJ1cHRlZCwgbG9zdCwgZGVz
dHJveWVkLCBhcnJpdmUgbGF0ZSBvciBpbmNvbXBsZXRlLCBvciBtYXkgY29udGFpbiB2aXJ1c2Vz
IGluIHRyYW5zbWlzc2lvbi4gVGhlIGUgbWFpbCBhbmQgaXRzIGNvbnRlbnRzICh3aXRoIG9yIHdp
dGhvdXQgcmVmZXJyZWQgZXJyb3JzKSBzaGFsbCB0aGVyZWZvcmUgbm90IGF0dGFjaCBhbnkgbGlh
YmlsaXR5IG9uIHRoZSBvcmlnaW5hdG9yIG9yIEhDTCBvciBpdHMgYWZmaWxpYXRlcy4gVmlld3Mg
b3Igb3BpbmlvbnMsIGlmIGFueSwgcHJlc2VudGVkIGluIHRoaXMgZW1haWwgYXJlIHNvbGVseSB0
aG9zZSBvZiB0aGUgYXV0aG9yIGFuZCBtYXkgbm90IG5lY2Vzc2FyaWx5IHJlZmxlY3QgdGhlIHZp
ZXdzIG9yIG9waW5pb25zIG9mIEhDTCBvciBpdHMgYWZmaWxpYXRlcy4gQW55IGZvcm0gb2YgcmVw
cm9kdWN0aW9uLCBkaXNzZW1pbmF0aW9uLCBjb3B5aW5nLCBkaXNjbG9zdXJlLCBtb2RpZmljYXRp
b24sIGRpc3RyaWJ1dGlvbiBhbmQgLyBvciBwdWJsaWNhdGlvbiBvZiB0aGlzIG1lc3NhZ2Ugd2l0
aG91dCB0aGUgcHJpb3Igd3JpdHRlbiBjb25zZW50IG9mIGF1dGhvcml6ZWQgcmVwcmVzZW50YXRp
dmUgb2YgSENMIGlzIHN0cmljdGx5IHByb2hpYml0ZWQuIElmIHlvdSBoYXZlIHJlY2VpdmVkIHRo
aXMgZW1haWwgaW4gZXJyb3IgcGxlYXNlIGRlbGV0ZSBpdCBhbmQgbm90aWZ5IHRoZSBzZW5kZXIg
aW1tZWRpYXRlbHkuIEJlZm9yZSBvcGVuaW5nIGFueSBlbWFpbCBhbmQvb3IgYXR0YWNobWVudHMs
IHBsZWFzZSBjaGVjayB0aGVtIGZvciB2aXJ1c2VzIGFuZCBvdGhlciBkZWZlY3RzLg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18NCg==

--_000_SG2PR04MB30933ED4048FE7820EC3E90EE15D0SG2PR04MB3093apcp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAy
IDQ7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMgKi8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWws
IGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBpbjsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJ
Zm9udC1zaXplOjExLjBwdDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQph
OmxpbmssIHNwYW4uTXNvSHlwZXJsaW5rDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xv
cjojMDU2M0MxOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0KYTp2aXNpdGVkLCBzcGFu
Lk1zb0h5cGVybGlua0ZvbGxvd2VkDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjoj
OTU0RjcyOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0KcC5tc29ub3JtYWwwLCBsaS5t
c29ub3JtYWwwLCBkaXYubXNvbm9ybWFsMA0KCXttc28tc3R5bGUtbmFtZTptc29ub3JtYWw7DQoJ
bXNvLW1hcmdpbi10b3AtYWx0OmF1dG87DQoJbWFyZ2luLXJpZ2h0OjBpbjsNCgltc28tbWFyZ2lu
LWJvdHRvbS1hbHQ6YXV0bzsNCgltYXJnaW4tbGVmdDowaW47DQoJZm9udC1zaXplOjEyLjBwdDsN
Cglmb250LWZhbWlseToiVGltZXMgTmV3IFJvbWFuIixzZXJpZjt9DQpzcGFuLkVtYWlsU3R5bGUx
OA0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fu
cy1zZXJpZjsNCgljb2xvcjp3aW5kb3d0ZXh0O30NCnNwYW4uRW1haWxTdHlsZTE5DQoJe21zby1z
dHlsZS10eXBlOnBlcnNvbmFsLXJlcGx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNl
cmlmOw0KCWNvbG9yOiMxRjQ5N0Q7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6
ZXhwb3J0LW9ubHk7DQoJZm9udC1zaXplOjEwLjBwdDt9DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7
c2l6ZTo4LjVpbiAxMS4waW47DQoJbWFyZ2luOjEuMGluIDEuMGluIDEuMGluIDEuMGluO30NCmRp
di5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT48IS0tW2lm
IGd0ZSBtc28gOV0+PHhtbD4NCjxvOnNoYXBlZGVmYXVsdHMgdjpleHQ9ImVkaXQiIHNwaWRtYXg9
IjEwMjYiIC8+DQo8L3htbD48IVtlbmRpZl0tLT48IS0tW2lmIGd0ZSBtc28gOV0+PHhtbD4NCjxv
OnNoYXBlbGF5b3V0IHY6ZXh0PSJlZGl0Ij4NCjxvOmlkbWFwIHY6ZXh0PSJlZGl0IiBkYXRhPSIx
IiAvPg0KPC9vOnNoYXBlbGF5b3V0PjwveG1sPjwhW2VuZGlmXS0tPg0KPC9oZWFkPg0KPGJvZHkg
bGFuZz0iRU4tVVMiIGxpbms9IiMwNTYzQzEiIHZsaW5rPSIjOTU0RjcyIj4NCjxkaXYgY2xhc3M9
IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5IaSBBbGwsPG86cD48L286cD48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiPkkgYW0gaW50ZXJlc3RlZCB0byBrbm93LCBob3cgdG8gZ2V0IHRoZSBuZXR3
b3JrIHBhcmFtZXRlcnMgbGlrZSBwYWNrZXQgY291bnRlcnMgYW5kIG90aGVyIGludGVyZmFjZXMg
cGFyYW1ldGVyIHVzaW5nIHJlZGZpc2ggaW50ZXJmYWNlPyBDb3VsZCB5b3UgcGxlYXNlIGxldCBt
ZSBrbm93LjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8
L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5UaGFua3MgJmFtcDsgUmVnYXJkcyw8bzpw
PjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkpheWFzaHJlZTxvOnA+PC9vOnA+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImNvbG9yOiMxRjQ5N0QiPjxicj4N
Cjxicj4NCjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFu
IHN0eWxlPSJjb2xvcjojMUY0OTdEIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8ZGl2
Pg0KPGRpdiBzdHlsZT0iYm9yZGVyOm5vbmU7Ym9yZGVyLXRvcDpzb2xpZCAjRTFFMUUxIDEuMHB0
O3BhZGRpbmc6My4wcHQgMGluIDBpbiAwaW4iPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PGEgbmFt
ZT0iX19fX19yZXBseXNlcGFyYXRvciI+PC9hPjxiPkZyb206PC9iPiBKYXlhc2hyZWUgRCA8YnI+
DQo8Yj5TZW50OjwvYj4gVGh1cnNkYXksIEF1Z3VzdCAxMywgMjAyMCAyOjM4IFBNPGJyPg0KPGI+
VG86PC9iPiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc8YnI+DQo8Yj5DYzo8L2I+IHJhdGFndXB0
QGxpbnV4LnZuZXQuaWJtLmNvbTsgd2FrQGdvb2dsZS5jb208YnI+DQo8Yj5TdWJqZWN0OjwvYj4g
UmVkZmlzaCBDb21tYW5kcyBmb3IgbmV0d29yayBpbnRlcmZhY2UgcGFyYW1ldGVyczxvOnA+PC9v
OnA+PC9wPg0KPC9kaXY+DQo8L2Rpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7
PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+SGkgQWxsLDxvOnA+PC9vOnA+PC9wPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj5JIGFtIGludGVyZXN0ZWQgdG8ga25vdywgaG93IHRvIGdldCB0aGUgbmV0d29yayBw
YXJhbWV0ZXJzIGxpa2UgcGFja2V0IGNvdW50ZXJzIGFuZCBvdGhlciBpbnRlcmZhY2VzIHBhcmFt
ZXRlciB1c2luZyByZWRmaXNoIGludGVyZmFjZT8gQ291bGQgeW91IHBsZWFzZSBsZXQgbWUga25v
dy48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+VGhhbmtzICZhbXA7IFJlZ2FyZHMsPG86cD48L286
cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5KYXlhc2hyZWU8bzpwPjwvbzpwPjwvcD4NCjwv
ZGl2Pg0KPGZvbnQgZmFjZT0iQXJpYWwiIGNvbG9yPSJHcmF5IiBzaXplPSIxIj46OkRJU0NMQUlN
RVI6Ojxicj4NCjxocj4NClRoZSBjb250ZW50cyBvZiB0aGlzIGUtbWFpbCBhbmQgYW55IGF0dGFj
aG1lbnQocykgYXJlIGNvbmZpZGVudGlhbCBhbmQgaW50ZW5kZWQgZm9yIHRoZSBuYW1lZCByZWNp
cGllbnQocykgb25seS4gRS1tYWlsIHRyYW5zbWlzc2lvbiBpcyBub3QgZ3VhcmFudGVlZCB0byBi
ZSBzZWN1cmUgb3IgZXJyb3ItZnJlZSBhcyBpbmZvcm1hdGlvbiBjb3VsZCBiZSBpbnRlcmNlcHRl
ZCwgY29ycnVwdGVkLCBsb3N0LCBkZXN0cm95ZWQsIGFycml2ZSBsYXRlIG9yDQogaW5jb21wbGV0
ZSwgb3IgbWF5IGNvbnRhaW4gdmlydXNlcyBpbiB0cmFuc21pc3Npb24uIFRoZSBlIG1haWwgYW5k
IGl0cyBjb250ZW50cyAod2l0aCBvciB3aXRob3V0IHJlZmVycmVkIGVycm9ycykgc2hhbGwgdGhl
cmVmb3JlIG5vdCBhdHRhY2ggYW55IGxpYWJpbGl0eSBvbiB0aGUgb3JpZ2luYXRvciBvciBIQ0wg
b3IgaXRzIGFmZmlsaWF0ZXMuIFZpZXdzIG9yIG9waW5pb25zLCBpZiBhbnksIHByZXNlbnRlZCBp
biB0aGlzIGVtYWlsIGFyZSBzb2xlbHkNCiB0aG9zZSBvZiB0aGUgYXV0aG9yIGFuZCBtYXkgbm90
IG5lY2Vzc2FyaWx5IHJlZmxlY3QgdGhlIHZpZXdzIG9yIG9waW5pb25zIG9mIEhDTCBvciBpdHMg
YWZmaWxpYXRlcy4gQW55IGZvcm0gb2YgcmVwcm9kdWN0aW9uLCBkaXNzZW1pbmF0aW9uLCBjb3B5
aW5nLCBkaXNjbG9zdXJlLCBtb2RpZmljYXRpb24sIGRpc3RyaWJ1dGlvbiBhbmQgLyBvciBwdWJs
aWNhdGlvbiBvZiB0aGlzIG1lc3NhZ2Ugd2l0aG91dCB0aGUgcHJpb3Igd3JpdHRlbiBjb25zZW50
DQogb2YgYXV0aG9yaXplZCByZXByZXNlbnRhdGl2ZSBvZiBIQ0wgaXMgc3RyaWN0bHkgcHJvaGli
aXRlZC4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlbWFpbCBpbiBlcnJvciBwbGVhc2UgZGVs
ZXRlIGl0IGFuZCBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseS4gQmVmb3JlIG9wZW5pbmcg
YW55IGVtYWlsIGFuZC9vciBhdHRhY2htZW50cywgcGxlYXNlIGNoZWNrIHRoZW0gZm9yIHZpcnVz
ZXMgYW5kIG90aGVyIGRlZmVjdHMuPGJyPg0KPGhyPg0KPC9mb250Pg0KPC9ib2R5Pg0KPC9odG1s
Pg0K

--_000_SG2PR04MB30933ED4048FE7820EC3E90EE15D0SG2PR04MB3093apcp_--
