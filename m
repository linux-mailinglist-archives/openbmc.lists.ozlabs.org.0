Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD262B4464
	for <lists+openbmc@lfdr.de>; Mon, 16 Nov 2020 14:07:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZTrm3jVhzDqJ5
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 00:07:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.130.135; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org;
 dkim=temperror header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=dCAoaG02; 
 dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=dCAoaG02; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300135.outbound.protection.outlook.com [40.107.130.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZTpc3f9nzDqHw
 for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2020 00:05:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSswzCLsIJB4bMuZimIOQyf9l5pUCPTVPrAKg6aYfvk=;
 b=dCAoaG021tNhRBzRppVOmvZU+GnRyi7gZtXl0ZH7XyGsv3WJPh1ikM+LuEtuEMsAynXLm5z540WoU9+3t+6HYK+yrloNbFxQwvUbIv3dRXVgpEt4riFr+8h0yvi0RjzmkOXG7Pnm/+AwY4AYxJMN945z38kVNhp5qlIMoiapWSE=
Received: from SG2PR01CA0110.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::14) by TY2PR04MB3552.apcprd04.prod.outlook.com
 (2603:1096:404:100::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Mon, 16 Nov
 2020 13:05:46 +0000
Received: from HK2APC01FT046.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:40:cafe::a6) by SG2PR01CA0110.outlook.office365.com
 (2603:1096:4:40::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend
 Transport; Mon, 16 Nov 2020 13:05:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.53)
 smtp.mailfrom=hcl.com; tanous.net; dkim=pass (signature was verified)
 header.d=HCL.COM;tanous.net; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.53; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.245.53) by
 HK2APC01FT046.mail.protection.outlook.com (10.152.249.180) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Mon, 16 Nov 2020 13:05:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HLsBjoxDC0WxIePOM8JCXsMh7sbG7sP5cmrE2/Gl+9u6ZVb+K6GXIzRD77AJjn1hAZMzqpjkzeTWoElTK0Dy6twEFA3U6H1o0Fn6LOsgdg1b8zdKdb6EsbJ+7A834rMLSMWLtVXs5NbIHMxg2BUyaCUxz2KxP6mGLuPW67UO2xD4zzrdpb382N7Im/dL4ln82l/jiKE1CDwsS9xS6LJok3vuiAI+mmi3mxdujIL5TBVzYLaQaa2FtdvkEIhUg+afbIe6AFlInPgUznxnIMyFOItAGhJO4pXJCjqg6ps2AjmLCEjtpzbSL/fGfqe91oUnyyWG4RKnKS085eMpUnehTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSswzCLsIJB4bMuZimIOQyf9l5pUCPTVPrAKg6aYfvk=;
 b=QokC5xC9skr8y3saGJ1qCix7ye8UTQofJQKobdKedcJBWtCur5K2fB+++cPMflHhnybGuY6Xp0DVgESaVEv6mn9PejrOyNLRpSbbAd5viIcdEzRcZAAbxhCg2PF2c+aYfPuxcBdk4F4VVN3DlVt4HoBpRXAzwNEWMddIZ2JrpAFSH4BItLhiWo1SHee8bv+gwvnhR5IC6kWzMoQUEHXWtLCYOexL2WGX9O9McwQseWmj4WiSlIEBo87AqXqPdxdJSFcxpsmkEjQZ10Vfo0vKGD1oHLXzc7YtV2h2qvJnbH/AHDVcrSNXI1jWJpqFs6Q0NAPTmhk7DaHAV54DhSDGQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSswzCLsIJB4bMuZimIOQyf9l5pUCPTVPrAKg6aYfvk=;
 b=dCAoaG021tNhRBzRppVOmvZU+GnRyi7gZtXl0ZH7XyGsv3WJPh1ikM+LuEtuEMsAynXLm5z540WoU9+3t+6HYK+yrloNbFxQwvUbIv3dRXVgpEt4riFr+8h0yvi0RjzmkOXG7Pnm/+AwY4AYxJMN945z38kVNhp5qlIMoiapWSE=
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com (2603:1096:203:5d::15)
 by HK2PR0401MB2164.apcprd04.prod.outlook.com (2603:1096:202:8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Mon, 16 Nov
 2020 13:05:38 +0000
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::e52f:5fdf:e09d:fa29]) by HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::e52f:5fdf:e09d:fa29%7]) with mapi id 15.20.3564.025; Mon, 16 Nov 2020
 13:05:38 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: Ed Tanous <ed@tanous.net>
Subject: RE: Fault handling(Threshold exceeds/low) in Fan and NIC sensors
Thread-Topic: Fault handling(Threshold exceeds/low) in Fan and NIC sensors
Thread-Index: Ada5zVYwkmx4kfozTTWK3HwWcCL1fAAMGkIAAIEd6OA=
Date: Mon, 16 Nov 2020 13:05:38 +0000
Message-ID: <HK0PR04MB2964EA39F0F9AD7ED1A03535FDE30@HK0PR04MB2964.apcprd04.prod.outlook.com>
References: <HK0PR04MB2964AA77874471609F0B25BEFDE60@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <CACWQX81k6M6acw0VL3aYA_uqpNsEUjZ3DhiAQp_mXLbGJU87=g@mail.gmail.com>
In-Reply-To: <CACWQX81k6M6acw0VL3aYA_uqpNsEUjZ3DhiAQp_mXLbGJU87=g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-hclclassification: HCL_Cla5s_1nt3rnal
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiYmExNGUyMTYtYmRmZC00ZTQ2LTg2MWMtOWY2M2NhYTRlYWQwIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzXzFudDNybmFsIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE4LjQuMTg0My4xMjMiLCJUcnVzdGVkTGFiZWxIYXNoIjoieENFM1pkUFBMM1ZqNkF0NEFvMmpkeW00cHByYXZxRDN2QkFYZWd1OENwb2hhNjB3N255MGwxWERYNkVkUEFcL24ifQ==
Authentication-Results-Original: tanous.net; dkim=none (message not signed)
 header.d=none;tanous.net; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [157.46.127.100]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 899f0e60-195b-4e91-8fe4-08d88a30545e
x-ms-traffictypediagnostic: HK2PR0401MB2164:|TY2PR04MB3552:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <TY2PR04MB3552FA1A9866C31954EB4751FDE30@TY2PR04MB3552.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Ngu/WPUZUYNdH0ZXrCCNrU7j83l+i5vHcQh9VJgWyDB82v0TUshJscV6/tQ0PpKw0NIV74kwivkqWS73cN9XnSVKhriyf9CU/y0FUDro0uw9XM/dlrNAq4fRJY7GEDSqUDKonDj9io1DBDdMoPM7Deau7JAw7/2ALg6u1jfenHBlG3Mno8XT7d3Iv9bsb7W5YWUyeIcOcaQStJ3Dq/enTNHQ5f5xhv3ImIazBOafasxxCae6lZW8dOCRvqUiJOco358SND6E7f9qsICqmDG4bwQFuXRa6/+Om/DAC5aRYCUn3TXq4WQ8rZ8lgfz6eoLlmllx4LfvtIOmyXWnrZ5/6A==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HK0PR04MB2964.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(55016002)(4326008)(54906003)(316002)(9686003)(71200400001)(478600001)(6916009)(2906002)(8936002)(83380400001)(33656002)(186003)(64756008)(26005)(8676002)(7696005)(53546011)(6506007)(5660300002)(86362001)(52536014)(66446008)(66476007)(66946007)(66556008)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: NfkoewQIc7TKu3R0uAHcPbwdBzbX31aYswldvfNZWKGS2PCoY3oCoO5LgskEkp8Y5HjSl49NiCUR0ddKKQwv1iNzOEh63oLWG5cztjbNbvfWqRwJ6jgJbsbvYIZIe7IyzqWnaLWfaOhLnoAihjffVYMBgEkWFC4mprgAn8KIxPOtE21kWSbJFyNUW43wOtrpYveblEmFbdZoum+bZR5fBDW2Ww4rbv6p6Tc9LpwFlfWmaL2eBeqNb3D4a5a/dfbYi0Laf9DAtLaIo+ZOZQmvk0qNi51M9CHAWhKcRFdElFbIRPvO3e8jMB35TKBejNRytoJhY0ipcEaWL5NZx+Jpn9ap4vtX66rcW+UcRCCIJ2jRxE10/LDXhAY5rH6ru9LMaOZp19WlIBK+xtlixN/z1/oHIi1GaTIHsr/S1N9ODYps8JHeqYSnB0300JDuT0eSTwb0QBqUMTgck+ZnTXTbn6sWXl8/dDTckPb5imgeG1B4AfmYmUkv7bkng6OGWZVIQHg5FGmGhdRWq/vAsPSb+l+fPSkjsW0/SaqTpDv7jK5xA9MQzmOH/T7UQ1qYMkySzNOk8q3SM0FKfnDDBKuNh5lWmA3nXJHU5HGhPdo06uktcaxT1fm5lSYUR3P1zRoizW5+myKiW1hiIkTEz2QoAw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0401MB2164
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT046.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0e26371d-7654-42a0-ea8b-08d88a30508d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: al3SkEby5TukZ3Omg+/Olomwt5jxRBFQyPnCIvnvGESeoIlyXkIdqoocJlq+1MVvc7A92EG1o5bSNTaKVGPY8nHqTJnCeAx5OCyrb4I46s7xsJjAKTTn343TXEOmgiUGVQ8IC0gTyC+ersZHMjEy37cU5gtV/HmudDkmSyV2BB+6Sp1QcC0GrzPcW8/gRgBX7tJCJESIzfvl/TqTk+ivAon1rrU2voy/1ltRQ5zibYToKgW5Bc7tXZZNcJpIo8TtBrRcqaD7bkqCDzJ1VNX/4JV9U2DC0Vd4D02y3A056csr3DRT6qN30Kl4U688AemhRRLcC80SacVCsSFSqfBI2/s9ImFkhIkSSNit0S9SJ9KYhwtx8Pg9rZIl19kiMjvDyOaxC6E4/ZM4gomAah7rZw==
X-Forefront-Antispam-Report: CIP:192.8.245.53; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966005)(6506007)(81166007)(82740400003)(316002)(4326008)(478600001)(356005)(54906003)(82310400003)(6916009)(8936002)(36906005)(8676002)(7696005)(83380400001)(33656002)(47076004)(26005)(5660300002)(52536014)(70206006)(86362001)(70586007)(9686003)(186003)(2906002)(55016002)(336012)(53546011);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 13:05:44.3255 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 899f0e60-195b-4e91-8fe4-08d88a30545e
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.53];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT046.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3552
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
Cc: Zhikui Ren <zhikui.ren@intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Patrick Venture <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, "Velumani
 T-ERS,HCLTech" <velumanit@hcl.com>, Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Q2xhc3NpZmljYXRpb246IEludGVybmFsDQoNCkhpIEVkLA0KDQogICAgICAgIEluIHNob3J0LCBP
dXIgcmVxdWlyZW1lbnQgaXMgdG8gdGFrZSB0aGUgYWN0aW9ucyB3aGVuIHRoZSBmYW4gZmFpbHMu
IFRoYXQgYWN0aW9uIGlzIHBsYXRmb3JtIHNwZWNpZmljLg0KDQogICAgICAgIEZhbiBmYWlsdXJl
IDogIFRoaXMgaXMgYmFzZWQgb24gRmFuIHNlbnNvcnMuIElmIGZhbiBzZW5zb3IncyB0YWNoIHZh
bHVlcyBpcyBsZXNzIHRoYW4gMzMlLCB3aWxsIGNvbnNpZGVyIGFzIGEgZmFuIGZhaWx1cmUuIFNv
IHdpbGwgdGFrZSB0aGUgYWN0aW9ucyB0byByZWR1Y2UgdGhlIGhlYXQgcHJvZHVjdGlvbiBpbiB0
aGUgc3lzdGVtLg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTbyB0aGF0LCAgaG9z
dHMsIE5JQyBhbmQgb3RoZXIgcG93ZXIgY29uc3VtaW5nIG1vZHVsZXMuDQoNCiAgICAgICAgRGJ1
cy1zZW5zb3IncyBhbHJlYWR5IGhhbmRsZXMgdGhlIHRocmVzaG9sZCBtYXNraW5nLiBXZSBqdXN0
IHVzZSB0aGF0IHRocmVzaG9sZCBtYXNraW5nIHRvIHRha2UgdGhlIHBsYXRmb3JtIHNwZWNpZmlj
IGFjdGlvbnMuDQoNCiAgICAgICAgUGxlYXNlIGxldCB1cyBrbm93IGlmIGFueSBjbGFyaWZpY2F0
aW9ucyBuZWVkZWQuDQoNClRoYW5rcywNCkt1bWFyLg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KRnJvbTogRWQgVGFub3VzIDxlZEB0YW5vdXMubmV0Pg0KU2VudDogU2F0dXJkYXksIE5v
dmVtYmVyIDE0LCAyMDIwIDI6MTQgQU0NClRvOiBLdW1hciBUaGFuZ2F2ZWwgPHRoYW5nYXZlbC5r
QGhjbC5jb20+DQpDYzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBWZWx1bWFuaSBULUVSUyxI
Q0xUZWNoIDx2ZWx1bWFuaXRAaGNsLmNvbT47IHNkYXNhcmlAZmIuY29tOyBQYXRyaWNrIFdpbGxp
YW1zIDxwYXRyaWNrdzNAZmIuY29tPjsgUGF0cmljayBWZW50dXJlIDx2ZW50dXJlQGdvb2dsZS5j
b20+OyBKYWUgSHl1biBZb28gPGphZS5oeXVuLnlvb0BsaW51eC5pbnRlbC5jb20+OyBWZXJub24g
TWF1ZXJ5IDx2ZXJub24ubWF1ZXJ5QGxpbnV4LmludGVsLmNvbT47IFpoaWt1aSBSZW4gPHpoaWt1
aS5yZW5AaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IEZhdWx0IGhhbmRsaW5nKFRocmVzaG9sZCBl
eGNlZWRzL2xvdykgaW4gRmFuIGFuZCBOSUMgc2Vuc29ycw0KDQpbQ0FVVElPTjogVGhpcyBFbWFp
bCBpcyBmcm9tIG91dHNpZGUgdGhlIE9yZ2FuaXphdGlvbi4gVW5sZXNzIHlvdSB0cnVzdCB0aGUg
c2VuZGVyLCBEb27igJl0IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgYXMgaXQgbWF5
IGJlIGEgUGhpc2hpbmcgZW1haWwsIHdoaWNoIGNhbiBzdGVhbCB5b3VyIEluZm9ybWF0aW9uIGFu
ZCBjb21wcm9taXNlIHlvdXIgQ29tcHV0ZXIuXQ0KDQpPbiBGcmksIE5vdiAxMywgMjAyMCBhdCA4
OjMxIEFNIEt1bWFyIFRoYW5nYXZlbCA8dGhhbmdhdmVsLmtAaGNsLmNvbT4gd3JvdGU6DQo+DQo+
ICAgICAgICAgIENvdWxkIHlvdSBwbGVhc2UgcHJvdmlkZSB5b3VyIHN1Z2dlc3Rpb25zIG9uIHRo
aXMuDQoNCkknbSBoYXZpbmcgYSBsaXR0bGUgdHJvdWJsZSBmb2xsb3dpbmcgeW91ciBlbWFpbC4g
IERidXMtc2Vuc29ycyBoYXMgdGhlIGFiaWxpdHkgdG8gbWFzayB0aHJlc2hvbGRzIHdoZXJlIGFw
cHJvcHJpYXRlLCB0aGUgcGxhdGZvcm0gc3BlY2lmaWNzIG9mIHdoaWNoIGFyZSBhbHJlYWR5IGNh
cHR1cmVkIGluIHRoZSBjb25maWcgZmlsZSBkZWZpbml0aW9uLg0KSWYgdGhlcmUncyBzb21lIGNv
bmZpZ3VyYWJsZSBtYXNraW5nIG5lZWRlZCB0aGF0J3MgbmV3LCB3ZSBjYW4gY2VydGFpbmx5IGFk
ZCBpdCwgYnV0IEknZCByZWNvbW1lbmQgbG9va2luZyBhdCB0aGUgZXhpc3RpbmcgdGhyZXNob2xk
IG1hc2tpbmcgYmVmb3JlIGFkZGluZyBhbnl0aGluZyBuZXcgdG8gc2VlIGlmIHdoYXQncyB0aGVy
ZSBtZWV0cyB5b3VyIG5lZWRzLiAgSWYgeW91IGhhdmUgc29tZSBjb25jcmV0ZSB0aGluZ3MgeW91
J2QgbGlrZSB0byBzZWUgYWRkZWQsIEknbSBoYXBweSB0byB0YWxrIGluIG1vcmUgZGV0YWlsLCBq
dXN0IGF0IHRoaXMgcG9pbnQsIEkgaGF2ZSBubyBpZGVhIHdoYXQgeW91J3JlIGxvb2tpbmcgdG8g
c29sdmUsIHNvIHlvdSBtaWdodCB3YW50IHRvIGJlIHNsaWdodGx5IG1vcmUgc3BlY2lmaWMsIGFu
ZCByZWZlcmVuY2UgdGhlIGV4aXN0aW5nIHRocmVzaG9sZCBldmVuIG1hc2tpbmcgaW4geW91ciBw
cm9wb3NlZCBjaGFuZ2VzLg0KDQpDaGVlcnMsDQoNCi1FZA0KOjpESVNDTEFJTUVSOjoNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fDQpUaGUgY29udGVudHMgb2YgdGhpcyBlLW1haWwg
YW5kIGFueSBhdHRhY2htZW50KHMpIGFyZSBjb25maWRlbnRpYWwgYW5kIGludGVuZGVkIGZvciB0
aGUgbmFtZWQgcmVjaXBpZW50KHMpIG9ubHkuIEUtbWFpbCB0cmFuc21pc3Npb24gaXMgbm90IGd1
YXJhbnRlZWQgdG8gYmUgc2VjdXJlIG9yIGVycm9yLWZyZWUgYXMgaW5mb3JtYXRpb24gY291bGQg
YmUgaW50ZXJjZXB0ZWQsIGNvcnJ1cHRlZCwgbG9zdCwgZGVzdHJveWVkLCBhcnJpdmUgbGF0ZSBv
ciBpbmNvbXBsZXRlLCBvciBtYXkgY29udGFpbiB2aXJ1c2VzIGluIHRyYW5zbWlzc2lvbi4gVGhl
IGUgbWFpbCBhbmQgaXRzIGNvbnRlbnRzICh3aXRoIG9yIHdpdGhvdXQgcmVmZXJyZWQgZXJyb3Jz
KSBzaGFsbCB0aGVyZWZvcmUgbm90IGF0dGFjaCBhbnkgbGlhYmlsaXR5IG9uIHRoZSBvcmlnaW5h
dG9yIG9yIEhDTCBvciBpdHMgYWZmaWxpYXRlcy4gVmlld3Mgb3Igb3BpbmlvbnMsIGlmIGFueSwg
cHJlc2VudGVkIGluIHRoaXMgZW1haWwgYXJlIHNvbGVseSB0aG9zZSBvZiB0aGUgYXV0aG9yIGFu
ZCBtYXkgbm90IG5lY2Vzc2FyaWx5IHJlZmxlY3QgdGhlIHZpZXdzIG9yIG9waW5pb25zIG9mIEhD
TCBvciBpdHMgYWZmaWxpYXRlcy4gQW55IGZvcm0gb2YgcmVwcm9kdWN0aW9uLCBkaXNzZW1pbmF0
aW9uLCBjb3B5aW5nLCBkaXNjbG9zdXJlLCBtb2RpZmljYXRpb24sIGRpc3RyaWJ1dGlvbiBhbmQg
LyBvciBwdWJsaWNhdGlvbiBvZiB0aGlzIG1lc3NhZ2Ugd2l0aG91dCB0aGUgcHJpb3Igd3JpdHRl
biBjb25zZW50IG9mIGF1dGhvcml6ZWQgcmVwcmVzZW50YXRpdmUgb2YgSENMIGlzIHN0cmljdGx5
IHByb2hpYml0ZWQuIElmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZW1haWwgaW4gZXJyb3IgcGxl
YXNlIGRlbGV0ZSBpdCBhbmQgbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkuIEJlZm9yZSBv
cGVuaW5nIGFueSBlbWFpbCBhbmQvb3IgYXR0YWNobWVudHMsIHBsZWFzZSBjaGVjayB0aGVtIGZv
ciB2aXJ1c2VzIGFuZCBvdGhlciBkZWZlY3RzLg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18NCg==
