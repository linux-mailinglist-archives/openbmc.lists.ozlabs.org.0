Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 695B51ED38D
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 17:38:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cY3S1QRzzDqtZ
	for <lists+openbmc@lfdr.de>; Thu,  4 Jun 2020 01:38:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.130.108; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=dhanapals@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=Aa87uR1I; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=Aa87uR1I; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300108.outbound.protection.outlook.com [40.107.130.108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bkVN313nzDqQd
 for <openbmc@lists.ozlabs.org>; Tue,  2 Jun 2020 17:40:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oa974jRS4uvPadedyrBIYksduMYm6xNPupyR/Ihb1ac=;
 b=Aa87uR1INy3vuk5iMtHGELEDm6Dk3Msak/UclEn1HkufQzX0VS7ISDqNbILawCvgPWfIwrjrBARzbeDqG+zBRvL4JowdqGhojL9ETMgFy0/Qmlesz/FZmdAf3Zop2uPqFBA9FEWctt2kRSHnfNoilwbmKblgeQIFE578JdNGwNk=
Received: from PS2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:300:2d::34) by TY2PR04MB3325.apcprd04.prod.outlook.com
 (2603:1096:404:94::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Tue, 2 Jun
 2020 07:40:36 +0000
Received: from PU1APC01FT028.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:2d:cafe::d0) by PS2PR01CA0022.outlook.office365.com
 (2603:1096:300:2d::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.22 via Frontend
 Transport; Tue, 2 Jun 2020 07:40:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.56)
 smtp.mailfrom=hcl.com; lfprojects.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lfprojects.org; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.56 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.56; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.195.56) by
 PU1APC01FT028.mail.protection.outlook.com (10.152.252.229) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3045.17 via Frontend Transport; Tue, 2 Jun 2020 07:40:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FuRjRPbXR31sWgqFiHCv3RqSdRCNPBzsT8x1m8mivo+gnTVinyJC/5Caw+2XpwTH3JkvntS/oBwhtaxmEGUVF4qgO+PbG8pCv1vZIKmpbih0YM32U+go1MzoX1F5R+/yRHEE/8EVue/qlXwmleXRPuzY92LzCIOav6EsLnxApKW6Oo+tGCm+BsWDfepxJs6VUTPikJV16a0cnSMoNyMgFoiotTXCovR/nOO37rPMyakOHzgAYuHJRHj/7FuMsLFpiTcsP7HHhWvCcmwAk/6yE9l7KMLxVPr5XSB18FMkx0qF8C6RWBfGsVVdzc+QR6phpQRAKMJ0WCdB5ElR5WLfxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oa974jRS4uvPadedyrBIYksduMYm6xNPupyR/Ihb1ac=;
 b=GZ/tA51HyT6lTRXVQGWwz7Ng/ZKzGCMkOre/WqhIuHfKKhInxBHw35KL+UYwJ8sab82coN+7MXX2SR+4Dqn+YGfYTp2h+2UrWcMCcI9rA4suC3I6NKIxAoan3AKd8aXnShnzgaRDi/G5YICTb2+2ih5/4Czs2T3Wx9tZpuR4WFLOjCGepc8XxkqcIb/M8YnNVeVvlyqDONY0OEdOcys1RQN6+Y338Dr/nt0nZEoUu1KE48oE3jKkXt/+LA9jHrbbSHbn+85UX8HnRyThpPc7zKpwuQhQ6dXp6ai42Wf53uGD/5DrzzhWv7BU8vb8lWM7Sm4HrA/wtU1v2Z33echiyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oa974jRS4uvPadedyrBIYksduMYm6xNPupyR/Ihb1ac=;
 b=Aa87uR1INy3vuk5iMtHGELEDm6Dk3Msak/UclEn1HkufQzX0VS7ISDqNbILawCvgPWfIwrjrBARzbeDqG+zBRvL4JowdqGhojL9ETMgFy0/Qmlesz/FZmdAf3Zop2uPqFBA9FEWctt2kRSHnfNoilwbmKblgeQIFE578JdNGwNk=
Received: from SG2PR04MB3609.apcprd04.prod.outlook.com (2603:1096:4:a3::18) by
 SG2PR04MB2681.apcprd04.prod.outlook.com (2603:1096:4:64::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3045.19; Tue, 2 Jun 2020 07:40:30 +0000
Received: from SG2PR04MB3609.apcprd04.prod.outlook.com
 ([fe80::5065:49d7:5886:16a6]) by SG2PR04MB3609.apcprd04.prod.outlook.com
 ([fe80::5065:49d7:5886:16a6%7]) with mapi id 15.20.3045.024; Tue, 2 Jun 2020
 07:40:30 +0000
From: "Dhanapal Subramaniam, ERS,HCLTech" <dhanapals@hcl.com>
To: Mike Dolan <manager@lfprojects.org>, "bradleyb@us.ibm.com"
 <bradleyb@us.ibm.com>
Subject: RE: HCL CLA Update
Thread-Topic: HCL CLA Update
Thread-Index: AdWNrw3TPOT+OV1lTTSDG/+EH8//rwAjoO7AKaK3JAAAC44wAADuixlA
Date: Tue, 2 Jun 2020 07:40:30 +0000
Message-ID: <SG2PR04MB360931A017B23689E1DE64ECBE8B0@SG2PR04MB3609.apcprd04.prod.outlook.com>
References: <SG2PR04MB2876DAF2455DB54427EFFFD6FC660@SG2PR04MB2876.apcprd04.prod.outlook.com>
 <SG2PR04MB2876EC5F2B54A303926CFAC4FC630@SG2PR04MB2876.apcprd04.prod.outlook.com>
 <SG2PR04MB360909FD89E39097C5D1A99BBE8E0@SG2PR04MB3609.apcprd04.prod.outlook.com>
 <CALVHhecqoPau_fx4bRicgGSuZ1OcHT7E3XEx=dnZjXV1EW3VRA@mail.gmail.com>
In-Reply-To: <CALVHhecqoPau_fx4bRicgGSuZ1OcHT7E3XEx=dnZjXV1EW3VRA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiN2FlMDk5NzAtMmY5Yy00MDZhLTlkNmItNWIzMWRkNjFkNTRhIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoibnVsbCJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6Iko4Y2R2UG1yWXdGN3g3R01xRUNibmdyZFpUOUxFSm5WbzVvVlwvOGRCMW9IUVdLUm8xb1B1Yms2NFwvUG92SGE3aiJ9
x-hclclassification: null
Authentication-Results-Original: lfprojects.org; dkim=none (message not
 signed) header.d=none;lfprojects.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [182.65.39.222]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 74504331-e21c-4d6f-b291-08d806c83d40
x-ms-traffictypediagnostic: SG2PR04MB2681:|TY2PR04MB3325:
X-Microsoft-Antispam-PRVS: <TY2PR04MB3325A3E4593C2DC5CFDB7BFFBE8B0@TY2PR04MB3325.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;OLM:4502;
x-forefront-prvs: 0422860ED4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 2Of3hQ82jqYRXZPNOmxlaos6cNpwTN9cKam6959lfXeBpZO89qUx5OXbOXXophFFXSqY3EoY9Co8+ABQfSgru34UssHI/9JQQbUKxBscdq6tbERKZEawEZudctRvyzyZ8BTcLmsGHb1BLpmiO5xyn+zrrryClWSiN1TM/psH1Ay+49a5L9QFVcRr88zttS9M8CMogqdiEhhbocwSxps3A6/BTIXjJeDATydA9TMvzeESQS3kYT089tmlNKafULd2l7pQ/yi4EQNcty+HabYE0x9pbX58YbKKw6/vuJtG06Zph5n0M57p1WabOiCe3x+XiKTFsHqOt6HlSULBajHjy4evxXxTKa6Fu9YyvfgRxIgltzM/m4CgNc5edIbBYwkMQAdKVERMgyyWeOlpu/N98Q==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3609.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(8936002)(5660300002)(7116003)(3480700007)(66556008)(66476007)(33656002)(64756008)(66446008)(71200400001)(2906002)(66946007)(76116006)(110136005)(52536014)(316002)(54906003)(7696005)(86362001)(53546011)(15650500001)(478600001)(55016002)(9686003)(83380400001)(966005)(26005)(186003)(8676002)(6506007)(4326008)(166002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: rPZDSK9UWMip+UewXCBWm9nSdU/mED69QshcnN+XJJrhwFOm+ZR0JxjvEN/+kW1ucFnJFrlF25OiDHvSGUAyedQIgj2PhTT9i92R/bYyEUqluBzARTbX3OClhKmJs7OfFXgZZ1Rb95Vp2eYnI3PcKLj44waaxjyVcXTLDwJw465XCWPK1X/uiz3E37zVnmLNwKzc1R3mloMKoCqe/pQl2bfzb7BsRcNIc4nZ9lw5M+6q503YbTRRdp7L9n4FpQ96HfLDSUdtDIVGLt9V6Q4G6RJt0Tdki38kHUDdCtA+i0K/rjceqcUci/WfkqXCb58yI5qwCeph/lwvF26065jAZ2MitWHWa1u9rhUrEEDEWLZEH+uHqVdyMOrEADbBcmCLptY5V4B3P+h4XMZLjuY8PSNt7GaWGW+4twpbiq2eEevS7xEref9gQ4uofTTREjTZk6o/WeCDpQ7netfxnkfVbJtLg2OxJZ3EQ6XdrOUvkiFUdSKuzSwl/ZUQwYHVDaVz
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SG2PR04MB360931A017B23689E1DE64ECBE8B0SG2PR04MB3609apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2681
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT028.eop-APC01.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:192.8.195.56; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(46966005)(47076004)(82740400003)(356005)(86362001)(7696005)(316002)(110136005)(54906003)(82310400002)(478600001)(5660300002)(8936002)(52536014)(166002)(33656002)(4326008)(45080400002)(36906005)(8676002)(3480700007)(70206006)(70586007)(55016002)(83380400001)(966005)(336012)(9686003)(15650500001)(7116003)(6506007)(26005)(81166007)(186003)(2906002)(33964004)(53546011);
 DIR:OUT; SFP:1102; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9c278b7b-afec-4363-f4e8-08d806c839b3
X-Forefront-PRVS: 0422860ED4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wlq0RFbNleSxkCDL7dZv5+SNMGrfryDwmxHIGnN1eOm1zOYM3sMaDjj489ioy6Tsq8wEUCTOsoMBKZ8g7EOpxfb8qqyxiXzJ40JNZj9BbWa3Hx51rJnyuV9DPWw3sm7Sg8hb+sIKVDii4GK9jWiffNgUtzLx2+WBgLJziTxOT7tG2jDiFkyQmS3oQvnrVRIY71SvdB9rShX1JWq8qrSEMSvDCEa3PEo/Qixtnm0wSKiWKaNUo1ibyhYqfeGi3JmyG3yhVLbQ9YDt9FgQ5r9lp+4nkEbY0enIlsjtESripQaLG40896HzeUdYsDHAukWu6djr4B8BzD4p10dz5ARYq4TnnX8UXPdjJ8VEHCLETak98tApRrvDpxlKqzDH7q5H9GloEQ1cEmaqOEXHIDrlaE5IpLwdkZmnOntU0VS16njiTUZ2o8clQ63vfAnye8jmRkWQqKq+OmaPm1+qqLfUmTQiY6vC8rRg54ZRpZdKuAs=
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 07:40:35.7094 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74504331-e21c-4d6f-b291-08d806c83d40
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.56];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3325
X-Mailman-Approved-At: Thu, 04 Jun 2020 01:29:47 +1000
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "dhanapal.s@gmail.com" <dhanapal.s@gmail.com>,
 "manikandan.hcl.ers.epl@gmail.com" <manikandan.hcl.ers.epl@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_SG2PR04MB360931A017B23689E1DE64ECBE8B0SG2PR04MB3609apcp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

RGVhciBCcmFkLA0KQ2FuIHlvdSBwbGVhc2UgaGVscCBvbiBiZWxvdyByZXF1ZXN0Lg0KDQpUaGFu
a3MuDQoNClJlZ2FyZHMsDQpEaGFuYXBhbC5TDQoNCkZyb206IE1pa2UgRG9sYW4gPG1hbmFnZXJA
bGZwcm9qZWN0cy5vcmc+DQpTZW50OiBUaHVyc2RheSwgTWF5IDI4LCAyMDIwIDc6MTggUE0NClRv
OiBEaGFuYXBhbCBTdWJyYW1hbmlhbSwgRVJTLEhDTFRlY2ggPGRoYW5hcGFsc0BoY2wuY29tPjsg
YnJhZGxleWJAdXMuaWJtLmNvbQ0KQ2M6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzsgZGhhbmFw
YWwuc0BnbWFpbC5jb207IG1hbmlrYW5kYW4uaGNsLmVycy5lcGxAZ21haWwuY29tDQpTdWJqZWN0
OiBSZTogSENMIENMQSBVcGRhdGUNCg0KW0NBVVRJT046IFRoaXMgRW1haWwgaXMgZnJvbSBvdXRz
aWRlIHRoZSBPcmdhbml6YXRpb24uIFVubGVzcyB5b3UgdHJ1c3QgdGhlIHNlbmRlciwgRG9u4oCZ
dCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIGFzIGl0IG1heSBiZSBhIFBoaXNoaW5n
IGVtYWlsLCB3aGljaCBjYW4gc3RlYWwgeW91ciBJbmZvcm1hdGlvbiBhbmQgY29tcHJvbWlzZSB5
b3VyIENvbXB1dGVyLl0NCkFkZGluZyBCcmFkIGZyb20gdGhlIE9wZW5CTUMgcHJvamVjdCB3aG8g
bWFuYWdlcyB0aGUgYWNjZXNzIGxpc3QuDQoNClRoYW5rcywNCg0KTWlrZQ0KDQoNCk9uIFRodSwg
TWF5IDI4LCAyMDIwIGF0IDY6MDEgQU0gRGhhbmFwYWwgU3VicmFtYW5pYW0sIEVSUyxIQ0xUZWNo
IDxkaGFuYXBhbHNAaGNsLmNvbTxtYWlsdG86ZGhhbmFwYWxzQGhjbC5jb20+PiB3cm90ZToNCkRl
YXIgVGVhbSwNCkNhbiB5b3UgcGxlYXNlIGhlbHAgdG8gdXBsb2FkIGF0dGFjaGVkIENMQSBpbiBH
RHJpdmUuDQoNCg0KQWxzbyBwbGVhc2UgaGVscCB0byBhZGQNCkRoYW5hcGFsIFMgZGhhbmFwYWxz
QGhjbC5jb208bWFpbHRvOmRoYW5hcGFsc0BoY2wuY29tPiBpbiBiZWxvdyBncm91cA0KaHR0cHM6
Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei9hZG1pbi9ncm91cHMvNDIsbWVtYmVyczxodHRw
czovL2FwYzAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0El
MkYlMkZnZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5eiUyRmFkbWluJTJGZ3JvdXBzJTJGNDIlMkNt
ZW1iZXJzJmRhdGE9MDIlN0MwMSU3Q2RoYW5hcGFscyU0MGhjbC5jb20lN0M0Njc3NTJjYWRiZGM0
ZTVhOTYwMTA4ZDgwMzBkZDNiYSU3QzE4OWRlNzM3YzkzYTRmNWE4YjY4NmY0Y2E5OTQxOTEyJTdD
MCU3QzAlN0M2MzcyNjI3MDUzNzUyNDQ4MzAmc2RhdGE9Skg1bHFocmo0T0dxbkIzJTJCZzZZczJV
TXJ2bHM4NElZRWNmaGx0U0pUVGlBJTNEJnJlc2VydmVkPTA+DQoNCkZvbGxvd2luZyBtZW1iZXJz
IHRvDQpEaGFuYXBhbCBTdWJyYW1hbmlhbSwgZGhhbmFwYWxzQGhjbC5jb208bWFpbHRvOmRoYW5h
cGFsc0BoY2wuY29tPg0KS3VtYXIgVGhhbmdhdmVsLCAgdGhhbmdhdmVsLmtAaGNsLmNvbTxtYWls
dG86dGhhbmdhdmVsLmtAaGNsLmNvbT4NClRoaWxsYWl2YXNhbiBWZWVyYW5hdGhhbiwgIHRoaWxs
YWl2YXNhbi12QGhjbC5jb208bWFpbHRvOnRoaWxsYWl2YXNhbi12QGhjbC5jb20+DQpNYW5pa2Fu
ZGFuIEUsIG1hbmlrYW5kYW4uZUBoY2wuY29tPG1haWx0bzptYW5pa2FuZGFuLmVAaGNsLmNvbT4N
ClAuIFByaXlhdGhhcnNoYW4sICBwcml5YXRoYXJzaGFucEBoY2wuY29tPG1haWx0bzpwcml5YXRo
YXJzaGFucEBoY2wuY29tPg0KVmVsdW1hbmkgVC1FUlMsSENMVGVjaCwgIHZlbHVtYW5pdEBoY2wu
Y29tPG1haWx0bzp2ZWx1bWFuaXRAaGNsLmNvbT4NCkpheWFzaHJlZSBELCAgamF5YXNocmVlLWRA
aGNsLmNvbTxtYWlsdG86amF5YXNocmVlLWRAaGNsLmNvbT4NCklzd2FyeWEgUywgICAgaXN3YXJ5
YS1zaGFuQGhjbC5jb208bWFpbHRvOmlzd2FyeWEtc2hhbkBoY2wuY29tPg0KaHR0cHM6Ly9nZXJy
aXQub3BlbmJtYy1wcm9qZWN0Lnh5ei9hZG1pbi9ncm91cHMvNDMsbWVtYmVyczxodHRwczovL2Fw
YzAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZn
ZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5eiUyRmFkbWluJTJGZ3JvdXBzJTJGNDMlMkNtZW1iZXJz
JmRhdGE9MDIlN0MwMSU3Q2RoYW5hcGFscyU0MGhjbC5jb20lN0M0Njc3NTJjYWRiZGM0ZTVhOTYw
MTA4ZDgwMzBkZDNiYSU3QzE4OWRlNzM3YzkzYTRmNWE4YjY4NmY0Y2E5OTQxOTEyJTdDMCU3QzAl
N0M2MzcyNjI3MDUzNzUyNDQ4MzAmc2RhdGE9VzdJVGNOcTcwNnJzOVVCZElBa2xQbkx3WjJ5bkhB
T1VlbmFnbGdDaTk1byUzRCZyZXNlcnZlZD0wPg0KDQpEZWFyIE1hbmksDQpQbGVhc2UgaGVscCB0
byBmb3J3YXJkIGluY2FzZSBpZiB0aGlzIG1haWwgZGlkbuKAmXQgcmVhY2ggZ3JvdXAgc2luY2Ug
bXkgSENMIG1haWwgSUQgaGFzIHNvbWUgaXNzdWVzIGFuZCBJIGFtIHdvcmtpbmcgb24gdG8gZml4
Lg0KDQpSZWdhcmRzLA0KRGhhbmFwYWwuUw0KOjpESVNDTEFJTUVSOjoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQpUaGUgY29udGVudHMgb2YgdGhpcyBlLW1haWwgYW5kIGFueSBh
dHRhY2htZW50KHMpIGFyZSBjb25maWRlbnRpYWwgYW5kIGludGVuZGVkIGZvciB0aGUgbmFtZWQg
cmVjaXBpZW50KHMpIG9ubHkuIEUtbWFpbCB0cmFuc21pc3Npb24gaXMgbm90IGd1YXJhbnRlZWQg
dG8gYmUgc2VjdXJlIG9yIGVycm9yLWZyZWUgYXMgaW5mb3JtYXRpb24gY291bGQgYmUgaW50ZXJj
ZXB0ZWQsIGNvcnJ1cHRlZCwgbG9zdCwgZGVzdHJveWVkLCBhcnJpdmUgbGF0ZSBvciBpbmNvbXBs
ZXRlLCBvciBtYXkgY29udGFpbiB2aXJ1c2VzIGluIHRyYW5zbWlzc2lvbi4gVGhlIGUgbWFpbCBh
bmQgaXRzIGNvbnRlbnRzICh3aXRoIG9yIHdpdGhvdXQgcmVmZXJyZWQgZXJyb3JzKSBzaGFsbCB0
aGVyZWZvcmUgbm90IGF0dGFjaCBhbnkgbGlhYmlsaXR5IG9uIHRoZSBvcmlnaW5hdG9yIG9yIEhD
TCBvciBpdHMgYWZmaWxpYXRlcy4gVmlld3Mgb3Igb3BpbmlvbnMsIGlmIGFueSwgcHJlc2VudGVk
IGluIHRoaXMgZW1haWwgYXJlIHNvbGVseSB0aG9zZSBvZiB0aGUgYXV0aG9yIGFuZCBtYXkgbm90
IG5lY2Vzc2FyaWx5IHJlZmxlY3QgdGhlIHZpZXdzIG9yIG9waW5pb25zIG9mIEhDTCBvciBpdHMg
YWZmaWxpYXRlcy4gQW55IGZvcm0gb2YgcmVwcm9kdWN0aW9uLCBkaXNzZW1pbmF0aW9uLCBjb3B5
aW5nLCBkaXNjbG9zdXJlLCBtb2RpZmljYXRpb24sIGRpc3RyaWJ1dGlvbiBhbmQgLyBvciBwdWJs
aWNhdGlvbiBvZiB0aGlzIG1lc3NhZ2Ugd2l0aG91dCB0aGUgcHJpb3Igd3JpdHRlbiBjb25zZW50
IG9mIGF1dGhvcml6ZWQgcmVwcmVzZW50YXRpdmUgb2YgSENMIGlzIHN0cmljdGx5IHByb2hpYml0
ZWQuIElmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZW1haWwgaW4gZXJyb3IgcGxlYXNlIGRlbGV0
ZSBpdCBhbmQgbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkuIEJlZm9yZSBvcGVuaW5nIGFu
eSBlbWFpbCBhbmQvb3IgYXR0YWNobWVudHMsIHBsZWFzZSBjaGVjayB0aGVtIGZvciB2aXJ1c2Vz
IGFuZCBvdGhlciBkZWZlY3RzLg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCg==

--_000_SG2PR04MB360931A017B23689E1DE64ECBE8B0SG2PR04MB3609apcp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPCEtLVtp
ZiAhbXNvXT48c3R5bGU+dlw6KiB7YmVoYXZpb3I6dXJsKCNkZWZhdWx0I1ZNTCk7fQ0Kb1w6KiB7
YmVoYXZpb3I6dXJsKCNkZWZhdWx0I1ZNTCk7fQ0Kd1w6KiB7YmVoYXZpb3I6dXJsKCNkZWZhdWx0
I1ZNTCk7fQ0KLnNoYXBlIHtiZWhhdmlvcjp1cmwoI2RlZmF1bHQjVk1MKTt9DQo8L3N0eWxlPjwh
W2VuZGlmXS0tPjxzdHlsZT48IS0tDQovKiBGb250IERlZmluaXRpb25zICovDQpAZm9udC1mYWNl
DQoJe2ZvbnQtZmFtaWx5Ok1hbmdhbDsNCglwYW5vc2UtMTowIDAgNCAwIDAgMCAwIDAgMCAwO30N
CkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0
IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJ
cGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAyIDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWls
eToiTXlyaWFkIFBybyI7DQoJcGFub3NlLTE6MCAwIDAgMCAwIDAgMCAwIDAgMDt9DQovKiBTdHls
ZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3JtYWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1h
bA0KCXttYXJnaW46MGluOw0KCW1hcmdpbi1ib3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTIu
MHB0Ow0KCWZvbnQtZmFtaWx5OiJUaW1lcyBOZXcgUm9tYW4iLHNlcmlmO30NCmE6bGluaywgc3Bh
bi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOmJsdWU7DQoJ
dGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5r
Rm9sbG93ZWQNCgl7bXNvLXN0eWxlLXByaW9yaXR5Ojk5Ow0KCWNvbG9yOnB1cnBsZTsNCgl0ZXh0
LWRlY29yYXRpb246dW5kZXJsaW5lO30NCnANCgl7bXNvLXN0eWxlLXByaW9yaXR5Ojk5Ow0KCW1z
by1tYXJnaW4tdG9wLWFsdDphdXRvOw0KCW1hcmdpbi1yaWdodDowaW47DQoJbXNvLW1hcmdpbi1i
b3R0b20tYWx0OmF1dG87DQoJbWFyZ2luLWxlZnQ6MGluOw0KCWZvbnQtc2l6ZToxMi4wcHQ7DQoJ
Zm9udC1mYW1pbHk6IlRpbWVzIE5ldyBSb21hbiIsc2VyaWY7fQ0KcC5tc29ub3JtYWwwLCBsaS5t
c29ub3JtYWwwLCBkaXYubXNvbm9ybWFsMA0KCXttc28tc3R5bGUtbmFtZTptc29ub3JtYWw7DQoJ
bXNvLW1hcmdpbi10b3AtYWx0OmF1dG87DQoJbWFyZ2luLXJpZ2h0OjBpbjsNCgltc28tbWFyZ2lu
LWJvdHRvbS1hbHQ6YXV0bzsNCgltYXJnaW4tbGVmdDowaW47DQoJZm9udC1zaXplOjEyLjBwdDsN
Cglmb250LWZhbWlseToiVGltZXMgTmV3IFJvbWFuIixzZXJpZjt9DQpzcGFuLkVtYWlsU3R5bGUx
OQ0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1yZXBseTsNCglmb250LWZhbWlseToiQ2FsaWJy
aSIsc2Fucy1zZXJpZjsNCgljb2xvcjojMUY0OTdEO30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1z
dHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtc2l6ZToxMC4wcHQ7fQ0KQHBhZ2UgV29yZFNl
Y3Rpb24xDQoJe3NpemU6OC41aW4gMTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAx
LjBpbjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5
bGU+PCEtLVtpZiBndGUgbXNvIDldPjx4bWw+DQo8bzpzaGFwZWRlZmF1bHRzIHY6ZXh0PSJlZGl0
IiBzcGlkbWF4PSIxMDI2IiAvPg0KPC94bWw+PCFbZW5kaWZdLS0+PCEtLVtpZiBndGUgbXNvIDld
Pjx4bWw+DQo8bzpzaGFwZWxheW91dCB2OmV4dD0iZWRpdCI+DQo8bzppZG1hcCB2OmV4dD0iZWRp
dCIgZGF0YT0iMSIgLz4NCjwvbzpzaGFwZWxheW91dD48L3htbD48IVtlbmRpZl0tLT4NCjwvaGVh
ZD4NCjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSJibHVlIiB2bGluaz0icHVycGxlIj4NCjxkaXYg
Y2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0i
Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOiMxRjQ5N0Qi
PkRlYXIgQnJhZCw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48
c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmO2Nv
bG9yOiMxRjQ5N0QiPkNhbiB5b3UgcGxlYXNlIGhlbHAgb24gYmVsb3cgcmVxdWVzdC48bzpwPjwv
bzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1m
YW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOiMxRjQ5N0QiPjxvOnA+
Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxl
PSJmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6IzFGNDk3
RCI+VGhhbmtzLjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxz
cGFuIHN0eWxlPSJmb250LWZhbWlseTomcXVvdDtDYWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7Y29s
b3I6IzFGNDk3RCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPGRpdj4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZx
dW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjojMUY0OTdEIj5SZWdhcmRzLDxvOnA+
PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250
LXNpemU6MTEuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0NhbGlicmkmcXVvdDssc2Fucy1zZXJpZjtj
b2xvcjojMUY0OTdEIj5EaGFuYXBhbC5TPG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJy
aSZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOiMxRjQ5N0QiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFu
PjwvcD4NCjxkaXY+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItdG9wOnNvbGlkICNF
MUUxRTEgMS4wcHQ7cGFkZGluZzozLjBwdCAwaW4gMGluIDBpbiI+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48YSBuYW1lPSJfX19fX3JlcGx5c2VwYXJhdG9yIj48L2E+PGI+PHNwYW4gc3R5bGU9ImZv
bnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlm
Ij5Gcm9tOjwvc3Bhbj48L2I+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQ7Zm9udC1mYW1p
bHk6JnF1b3Q7Q2FsaWJyaSZxdW90OyxzYW5zLXNlcmlmIj4gTWlrZSBEb2xhbiAmbHQ7bWFuYWdl
ckBsZnByb2plY3RzLm9yZyZndDsNCjxicj4NCjxiPlNlbnQ6PC9iPiBUaHVyc2RheSwgTWF5IDI4
LCAyMDIwIDc6MTggUE08YnI+DQo8Yj5Ubzo8L2I+IERoYW5hcGFsIFN1YnJhbWFuaWFtLCBFUlMs
SENMVGVjaCAmbHQ7ZGhhbmFwYWxzQGhjbC5jb20mZ3Q7OyBicmFkbGV5YkB1cy5pYm0uY29tPGJy
Pg0KPGI+Q2M6PC9iPiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7IGRoYW5hcGFsLnNAZ21haWwu
Y29tOyBtYW5pa2FuZGFuLmhjbC5lcnMuZXBsQGdtYWlsLmNvbTxicj4NCjxiPlN1YmplY3Q6PC9i
PiBSZTogSENMIENMQSBVcGRhdGU8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjwvZGl2
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0
b20tYWx0OmF1dG87bGluZS1oZWlnaHQ6MTIuMHB0O2JhY2tncm91bmQ6I0ZGRUI5QyI+DQo8c3Bh
biBzdHlsZT0iZm9udC1zaXplOjEwLjBwdDtjb2xvcjpyZWQiPltDQVVUSU9OOiBUaGlzIEVtYWls
IGlzIGZyb20gb3V0c2lkZSB0aGUgT3JnYW5pemF0aW9uLiBVbmxlc3MgeW91IHRydXN0IHRoZSBz
ZW5kZXIsIERvbuKAmXQgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyBhcyBpdCBtYXkg
YmUgYSBQaGlzaGluZyBlbWFpbCwgd2hpY2ggY2FuIHN0ZWFsIHlvdXIgSW5mb3JtYXRpb24gYW5k
IGNvbXByb21pc2UgeW91ciBDb21wdXRlci5dPC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPGRpdj4N
CjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5BZGRpbmcgQnJhZCBmcm9tIHRoZSBPcGVuQk1D
IHByb2plY3Qgd2hvIG1hbmFnZXMgdGhlIGFjY2VzcyBsaXN0Lg0KPG86cD48L286cD48L3A+DQo8
ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4N
CjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5UaGFua3MsPG86cD48L286cD48L3A+DQo8L2Rp
dj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjwv
ZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPk1pa2U8bzpwPjwvbzpwPjwvcD4NCjwv
ZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0K
PC9kaXY+DQo8L2Rpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9w
Pg0KPGRpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5PbiBUaHUsIE1heSAyOCwgMjAy
MCBhdCA2OjAxIEFNIERoYW5hcGFsIFN1YnJhbWFuaWFtLCBFUlMsSENMVGVjaCAmbHQ7PGEgaHJl
Zj0ibWFpbHRvOmRoYW5hcGFsc0BoY2wuY29tIj5kaGFuYXBhbHNAaGNsLmNvbTwvYT4mZ3Q7IHdy
b3RlOjxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8YmxvY2txdW90ZSBzdHlsZT0iYm9yZGVyOm5v
bmU7Ym9yZGVyLWxlZnQ6c29saWQgI0NDQ0NDQyAxLjBwdDtwYWRkaW5nOjBpbiAwaW4gMGluIDYu
MHB0O21hcmdpbi1sZWZ0OjQuOHB0O21hcmdpbi1yaWdodDowaW4iPg0KPGRpdj4NCjxkaXY+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1h
cmdpbi1ib3R0b20tYWx0OmF1dG8iPjxzcGFuIHN0eWxlPSJjb2xvcjojMUY0OTdEIj5EZWFyIFRl
YW0sPC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1z
by1tYXJnaW4tdG9wLWFsdDphdXRvO21zby1tYXJnaW4tYm90dG9tLWFsdDphdXRvIj48c3BhbiBz
dHlsZT0iY29sb3I6IzFGNDk3RCI+Q2FuIHlvdSBwbGVhc2UgaGVscCB0byB1cGxvYWQgYXR0YWNo
ZWQgQ0xBIGluIEdEcml2ZS48L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0
OmF1dG8iPjxzcGFuIHN0eWxlPSJjb2xvcjojMUY0OTdEIj4mbmJzcDs8L3NwYW4+PG86cD48L286
cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1
dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG8iPjxzcGFuIHN0eWxlPSJjb2xvcjojMUY0OTdE
Ij4mbmJzcDs8L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHls
ZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG8iPjxz
cGFuIHN0eWxlPSJjb2xvcjojMUY0OTdEIj5BbHNvIHBsZWFzZSBoZWxwIHRvIGFkZDwvc3Bhbj48
bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtc28tbWFyZ2luLXRv
cC1hbHQ6YXV0bzttc28tbWFyZ2luLWJvdHRvbS1hbHQ6YXV0byI+PHNwYW4gc3R5bGU9ImNvbG9y
OiMxRjQ5N0QiPkRoYW5hcGFsIFMNCjxhIGhyZWY9Im1haWx0bzpkaGFuYXBhbHNAaGNsLmNvbSIg
dGFyZ2V0PSJfYmxhbmsiPmRoYW5hcGFsc0BoY2wuY29tPC9hPiBpbiBiZWxvdyBncm91cDwvc3Bh
bj48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtc28tbWFyZ2lu
LXRvcC1hbHQ6YXV0bzttc28tbWFyZ2luLWJvdHRvbS1hbHQ6YXV0byI+PHNwYW4gc3R5bGU9ImNv
bG9yOiMxRjQ5N0QiPjxhIGhyZWY9Imh0dHBzOi8vYXBjMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24u
b3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmdlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6
JTJGYWRtaW4lMkZncm91cHMlMkY0MiUyQ21lbWJlcnMmYW1wO2RhdGE9MDIlN0MwMSU3Q2RoYW5h
cGFscyU0MGhjbC5jb20lN0M0Njc3NTJjYWRiZGM0ZTVhOTYwMTA4ZDgwMzBkZDNiYSU3QzE4OWRl
NzM3YzkzYTRmNWE4YjY4NmY0Y2E5OTQxOTEyJTdDMCU3QzAlN0M2MzcyNjI3MDUzNzUyNDQ4MzAm
YW1wO3NkYXRhPUpINWxxaHJqNE9HcW5CMyUyQmc2WXMyVU1ydmxzODRJWUVjZmhsdFNKVFRpQSUz
RCZhbXA7cmVzZXJ2ZWQ9MCIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMt
cHJvamVjdC54eXovYWRtaW4vZ3JvdXBzLzQyLG1lbWJlcnM8L2E+PC9zcGFuPjxvOnA+PC9vOnA+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1zby1tYXJnaW4tdG9wLWFsdDphdXRv
O21zby1tYXJnaW4tYm90dG9tLWFsdDphdXRvIj48c3BhbiBzdHlsZT0iY29sb3I6IzFGNDk3RCI+
Jm5ic3A7PC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9
Im1zby1tYXJnaW4tdG9wLWFsdDphdXRvO21zby1tYXJnaW4tYm90dG9tLWFsdDphdXRvIj48c3Bh
biBzdHlsZT0iY29sb3I6IzFGNDk3RCI+Rm9sbG93aW5nIG1lbWJlcnMgdG8NCjwvc3Bhbj48bzpw
PjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtc28tbWFyZ2luLXRvcC1h
bHQ6YXV0bzttc28tbWFyZ2luLWJvdHRvbS1hbHQ6YXV0byI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6
ZToxMC4wcHQ7Zm9udC1mYW1pbHk6JnF1b3Q7TXlyaWFkIFBybyZxdW90OyxzZXJpZiI+RGhhbmFw
YWwgU3VicmFtYW5pYW0sDQo8YSBocmVmPSJtYWlsdG86ZGhhbmFwYWxzQGhjbC5jb20iIHRhcmdl
dD0iX2JsYW5rIj5kaGFuYXBhbHNAaGNsLmNvbTwvYT48L3NwYW4+PG86cD48L286cD48L3A+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1h
cmdpbi1ib3R0b20tYWx0OmF1dG8iPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTAuMHB0O2ZvbnQt
ZmFtaWx5OiZxdW90O015cmlhZCBQcm8mcXVvdDssc2VyaWYiPkt1bWFyIFRoYW5nYXZlbCwgJm5i
c3A7PGEgaHJlZj0ibWFpbHRvOnRoYW5nYXZlbC5rQGhjbC5jb20iIHRhcmdldD0iX2JsYW5rIj50
aGFuZ2F2ZWwua0BoY2wuY29tPC9hPjwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiIHN0eWxlPSJtc28tbWFyZ2luLXRvcC1hbHQ6YXV0bzttc28tbWFyZ2luLWJvdHRv
bS1hbHQ6YXV0byI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMC4wcHQ7Zm9udC1mYW1pbHk6JnF1
b3Q7TXlyaWFkIFBybyZxdW90OyxzZXJpZiI+VGhpbGxhaXZhc2FuIFZlZXJhbmF0aGFuLCAmbmJz
cDs8YSBocmVmPSJtYWlsdG86dGhpbGxhaXZhc2FuLXZAaGNsLmNvbSIgdGFyZ2V0PSJfYmxhbmsi
PnRoaWxsYWl2YXNhbi12QGhjbC5jb208L2E+PC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1zby1tYXJnaW4tdG9wLWFsdDphdXRvO21zby1tYXJnaW4t
Ym90dG9tLWFsdDphdXRvIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEwLjBwdDtmb250LWZhbWls
eTomcXVvdDtNeXJpYWQgUHJvJnF1b3Q7LHNlcmlmIj5NYW5pa2FuZGFuIEUsDQo8YSBocmVmPSJt
YWlsdG86bWFuaWthbmRhbi5lQGhjbC5jb20iIHRhcmdldD0iX2JsYW5rIj5tYW5pa2FuZGFuLmVA
aGNsLmNvbTwvYT48L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBz
dHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG8i
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTAuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O015cmlhZCBQ
cm8mcXVvdDssc2VyaWYiPlAuIFByaXlhdGhhcnNoYW4sJm5ic3A7DQo8YSBocmVmPSJtYWlsdG86
cHJpeWF0aGFyc2hhbnBAaGNsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnByaXlhdGhhcnNoYW5wQGhj
bC5jb208L2E+Jm5ic3A7DQo8L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0
OmF1dG8iPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTAuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O015
cmlhZCBQcm8mcXVvdDssc2VyaWYiPlZlbHVtYW5pIFQtRVJTLEhDTFRlY2gsJm5ic3A7DQo8YSBo
cmVmPSJtYWlsdG86dmVsdW1hbml0QGhjbC5jb20iIHRhcmdldD0iX2JsYW5rIj52ZWx1bWFuaXRA
aGNsLmNvbTwvYT4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgPC9zcGFuPg0KPG86cD48
L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0
OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG8iPjxzcGFuIHN0eWxlPSJmb250LXNpemU6
MTAuMHB0O2ZvbnQtZmFtaWx5OiZxdW90O015cmlhZCBQcm8mcXVvdDssc2VyaWYiPkpheWFzaHJl
ZSBELCZuYnNwOw0KPGEgaHJlZj0ibWFpbHRvOmpheWFzaHJlZS1kQGhjbC5jb20iIHRhcmdldD0i
X2JsYW5rIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdDtmb250LWZhbWlseTomcXVvdDtD
YWxpYnJpJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6d2luZG93dGV4dDt0ZXh0LWRlY29yYXRpb246
bm9uZSI+amF5YXNocmVlLWRAaGNsLmNvbTwvc3Bhbj48L2E+PC9zcGFuPjxvOnA+PC9vOnA+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1zby1tYXJnaW4tdG9wLWFsdDphdXRvO21z
by1tYXJnaW4tYm90dG9tLWFsdDphdXRvIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEwLjBwdDtm
b250LWZhbWlseTomcXVvdDtNeXJpYWQgUHJvJnF1b3Q7LHNlcmlmIj5Jc3dhcnlhIFMsJm5ic3A7
Jm5ic3A7Jm5ic3A7DQo8YSBocmVmPSJtYWlsdG86aXN3YXJ5YS1zaGFuQGhjbC5jb20iIHRhcmdl
dD0iX2JsYW5rIj5pc3dhcnlhLXNoYW5AaGNsLmNvbTwvYT48L3NwYW4+PG86cD48L286cD48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNv
LW1hcmdpbi1ib3R0b20tYWx0OmF1dG8iPjxzcGFuIHN0eWxlPSJjb2xvcjojMUY0OTdEIj48YSBo
cmVmPSJodHRwczovL2FwYzAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9
aHR0cHMlM0ElMkYlMkZnZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5eiUyRmFkbWluJTJGZ3JvdXBz
JTJGNDMlMkNtZW1iZXJzJmFtcDtkYXRhPTAyJTdDMDElN0NkaGFuYXBhbHMlNDBoY2wuY29tJTdD
NDY3NzUyY2FkYmRjNGU1YTk2MDEwOGQ4MDMwZGQzYmElN0MxODlkZTczN2M5M2E0ZjVhOGI2ODZm
NGNhOTk0MTkxMiU3QzAlN0MwJTdDNjM3MjYyNzA1Mzc1MjQ0ODMwJmFtcDtzZGF0YT1XN0lUY05x
NzA2cnM5VUJkSUFrbFBuTHdaMnluSEFPVWVuYWdsZ0NpOTVvJTNEJmFtcDtyZXNlcnZlZD0wIiB0
YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei9hZG1pbi9n
cm91cHMvNDMsbWVtYmVyczwvYT48L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0b20t
YWx0OmF1dG8iPjxzcGFuIHN0eWxlPSJjb2xvcjojMUY0OTdEIj4mbmJzcDs8L3NwYW4+PG86cD48
L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0
OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG8iPjxzcGFuIHN0eWxlPSJjb2xvcjojMUY0
OTdEIj5EZWFyIE1hbmksPC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCIgc3R5bGU9Im1zby1tYXJnaW4tdG9wLWFsdDphdXRvO21zby1tYXJnaW4tYm90dG9tLWFsdDph
dXRvIj48c3BhbiBzdHlsZT0iY29sb3I6IzFGNDk3RCI+UGxlYXNlIGhlbHAgdG8gZm9yd2FyZCBp
bmNhc2UgaWYgdGhpcyBtYWlsIGRpZG7igJl0IHJlYWNoIGdyb3VwIHNpbmNlIG15IEhDTCBtYWls
IElEIGhhcyBzb21lIGlzc3VlcyBhbmQgSSBhbSB3b3JraW5nIG9uIHRvIGZpeC48L3NwYW4+PG86
cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3At
YWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG8iPjxzcGFuIHN0eWxlPSJjb2xvcjoj
MUY0OTdEIj4mbmJzcDs8L3NwYW4+PG86cD48L286cD48L3A+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCIgc3R5bGU9Im1zby1tYXJnaW4tdG9wLWFsdDphdXRvO21zby1tYXJnaW4tYm90dG9t
LWFsdDphdXRvIj48c3BhbiBzdHlsZT0iY29sb3I6IzFGNDk3RCI+UmVnYXJkcyw8L3NwYW4+PG86
cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3At
YWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG8iPjxzcGFuIHN0eWxlPSJjb2xvcjoj
MUY0OTdEIj5EaGFuYXBhbC5TPC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8L2Rpdj4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6Ny41cHQ7Zm9udC1m
YW1pbHk6JnF1b3Q7QXJpYWwmcXVvdDssc2Fucy1zZXJpZjtjb2xvcjpncmF5Ij46OkRJU0NMQUlN
RVI6OjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxkaXYgY2xhc3M9Ik1zb05vcm1hbCIgYWxpZ249
ImNlbnRlciIgc3R5bGU9InRleHQtYWxpZ246Y2VudGVyIj48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjcuNXB0O2ZvbnQtZmFtaWx5OiZxdW90O0FyaWFsJnF1b3Q7LHNhbnMtc2VyaWY7Y29sb3I6Z3Jh
eSI+DQo8aHIgc2l6ZT0iMiIgd2lkdGg9IjEwMCUiIGFsaWduPSJjZW50ZXIiPg0KPC9zcGFuPjwv
ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTo3LjVwdDtm
b250LWZhbWlseTomcXVvdDtBcmlhbCZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOmdyYXkiPlRoZSBj
b250ZW50cyBvZiB0aGlzIGUtbWFpbCBhbmQgYW55IGF0dGFjaG1lbnQocykgYXJlIGNvbmZpZGVu
dGlhbCBhbmQgaW50ZW5kZWQgZm9yIHRoZSBuYW1lZCByZWNpcGllbnQocykgb25seS4gRS1tYWls
IHRyYW5zbWlzc2lvbiBpcyBub3QgZ3VhcmFudGVlZCB0byBiZSBzZWN1cmUNCiBvciBlcnJvci1m
cmVlIGFzIGluZm9ybWF0aW9uIGNvdWxkIGJlIGludGVyY2VwdGVkLCBjb3JydXB0ZWQsIGxvc3Qs
IGRlc3Ryb3llZCwgYXJyaXZlIGxhdGUgb3IgaW5jb21wbGV0ZSwgb3IgbWF5IGNvbnRhaW4gdmly
dXNlcyBpbiB0cmFuc21pc3Npb24uIFRoZSBlIG1haWwgYW5kIGl0cyBjb250ZW50cyAod2l0aCBv
ciB3aXRob3V0IHJlZmVycmVkIGVycm9ycykgc2hhbGwgdGhlcmVmb3JlIG5vdCBhdHRhY2ggYW55
IGxpYWJpbGl0eSBvbiB0aGUNCiBvcmlnaW5hdG9yIG9yIEhDTCBvciBpdHMgYWZmaWxpYXRlcy4g
Vmlld3Mgb3Igb3BpbmlvbnMsIGlmIGFueSwgcHJlc2VudGVkIGluIHRoaXMgZW1haWwgYXJlIHNv
bGVseSB0aG9zZSBvZiB0aGUgYXV0aG9yIGFuZCBtYXkgbm90IG5lY2Vzc2FyaWx5IHJlZmxlY3Qg
dGhlIHZpZXdzIG9yIG9waW5pb25zIG9mIEhDTCBvciBpdHMgYWZmaWxpYXRlcy4gQW55IGZvcm0g
b2YgcmVwcm9kdWN0aW9uLCBkaXNzZW1pbmF0aW9uLCBjb3B5aW5nLCBkaXNjbG9zdXJlLA0KIG1v
ZGlmaWNhdGlvbiwgZGlzdHJpYnV0aW9uIGFuZCAvIG9yIHB1YmxpY2F0aW9uIG9mIHRoaXMgbWVz
c2FnZSB3aXRob3V0IHRoZSBwcmlvciB3cml0dGVuIGNvbnNlbnQgb2YgYXV0aG9yaXplZCByZXBy
ZXNlbnRhdGl2ZSBvZiBIQ0wgaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4gSWYgeW91IGhhdmUgcmVj
ZWl2ZWQgdGhpcyBlbWFpbCBpbiBlcnJvciBwbGVhc2UgZGVsZXRlIGl0IGFuZCBub3RpZnkgdGhl
IHNlbmRlciBpbW1lZGlhdGVseS4gQmVmb3JlDQogb3BlbmluZyBhbnkgZW1haWwgYW5kL29yIGF0
dGFjaG1lbnRzLCBwbGVhc2UgY2hlY2sgdGhlbSBmb3IgdmlydXNlcyBhbmQgb3RoZXIgZGVmZWN0
cy48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8ZGl2IGNsYXNzPSJNc29Ob3JtYWwiIGFsaWduPSJj
ZW50ZXIiIHN0eWxlPSJ0ZXh0LWFsaWduOmNlbnRlciI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTo3
LjVwdDtmb250LWZhbWlseTomcXVvdDtBcmlhbCZxdW90OyxzYW5zLXNlcmlmO2NvbG9yOmdyYXki
Pg0KPGhyIHNpemU9IjIiIHdpZHRoPSIxMDAlIiBhbGlnbj0iY2VudGVyIj4NCjwvc3Bhbj48L2Rp
dj4NCjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPC9kaXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9ib2R5
Pg0KPC9odG1sPg0K

--_000_SG2PR04MB360931A017B23689E1DE64ECBE8B0SG2PR04MB3609apcp_--
