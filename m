Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA752BFE14
	for <lists+openbmc@lfdr.de>; Mon, 23 Nov 2020 02:55:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CfVbf0G3wzDqP6
	for <lists+openbmc@lfdr.de>; Mon, 23 Nov 2020 12:55:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.131.129;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=luke_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310129.outbound.protection.outlook.com [40.107.131.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CfVZj203pzDqMr
 for <openbmc@lists.ozlabs.org>; Mon, 23 Nov 2020 12:54:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+7BkB9YXy2ZYW2/4y/UPDK/JTGa2PS2qPoSiLtuZkcvH2rO9GBb18XLgdhsr3uJxcTk03vdtRaXoQxaQKffeZSRmSsze8iA9+wFz27ARGMCGaUx0HU9xY/qIY4nMNfeFb31VQonM4r9LfTvevO03SdvfkAdm8sRA8PDdUAKJ+0vOFUJoMqhRmNTxPUvgvH0TtRmYR6H0VRw9XqJFg6+OdlBltX+ZCvxTQ+KpJ8T4mljfx9cLwnNiEzjBN4zOWsmLas77h6XWitkaIm5jf+wJQbI8VCEFA2rVTg8dSDNhSNjR2zAdr7OZ9bLmpyt58cSO9TXBvvbHilrjJ2WHDtjrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88EZ3KZ24SxuRjmRF3lxfI9MEI+jtLccfCVLd/AgCYQ=;
 b=ERqYiMb+678xIq2NrC7p4lE60KuFPopBy1JFuea/mAuBHOBLiefAIfqrByxhEs31ZuXoQJpGGK9FJSBLr6DZoHaqnyzFFxUVnhd3k0384IhSEMzsK0hfGYLLHxs2CXRfeKJay7a1kEwAsxsvMqXRavOsOwq9pK65HClbGt5rwmJlQFIAB9ZZZdzywuwALqMKcEYP4ktF6FAhDSLFluSgYGgdrHeBYASOEEZBzr06gogf+rQfcrwMM7Fo31RP2J0vHQboocyJT1E0fapOcEIBK+qhsm3++20JJKCy76GJ4CI9etg9lNEL1Pr6ttGF22HYJMjpLX+0EdRr67Fj5jaEgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK0PR06MB2321.apcprd06.prod.outlook.com (2603:1096:203:49::11)
 by HK2PR06MB3602.apcprd06.prod.outlook.com (2603:1096:202:3f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 01:54:29 +0000
Received: from HK0PR06MB2321.apcprd06.prod.outlook.com
 ([fe80::b968:65ff:eb99:fdb2]) by HK0PR06MB2321.apcprd06.prod.outlook.com
 ([fe80::b968:65ff:eb99:fdb2%5]) with mapi id 15.20.3564.032; Mon, 23 Nov 2020
 01:54:29 +0000
From: Luke Chen <luke_chen@aspeedtech.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: RE: Signed CLA from ASPEED
Thread-Topic: Signed CLA from ASPEED
Thread-Index: AdSF/BDVNQADm2VBRuejwbddN04pKwA3582AhHB0Q0AAHDUugABtOb4A
Date: Mon, 23 Nov 2020 01:54:29 +0000
Message-ID: <HK0PR06MB2321278EFE40C9B9B23EDE26E1FC0@HK0PR06MB2321.apcprd06.prod.outlook.com>
References: <623110cb8acb4bbc99c43c47b37f5457@TWMBX01.aspeed.com>
 <9C742B6B-8604-4EC1-9AE8-98844ACB557D@fuzziesquirrel.com>
 <HK0PR06MB23218108A08BC07208A93909E1FF0@HK0PR06MB2321.apcprd06.prod.outlook.com>
 <ac2ecf150ba6cc5cca5140913c787fd7b6f40313.camel@fuzziesquirrel.com>
In-Reply-To: <ac2ecf150ba6cc5cca5140913c787fd7b6f40313.camel@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fuzziesquirrel.com; dkim=none (message not signed)
 header.d=none;fuzziesquirrel.com; dmarc=none action=none
 header.from=aspeedtech.com;
x-originating-ip: [118.99.190.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6f4e344e-bad4-4bc9-761b-08d88f52b722
x-ms-traffictypediagnostic: HK2PR06MB3602:
x-microsoft-antispam-prvs: <HK2PR06MB36025C434388C487A50E1BCDE1FC0@HK2PR06MB3602.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Rd51C40Qqu3GRmunmNcwFipk62MkuqkkGs85I36T/bYUAk8rNPQNTD+v2+PbgotwjrN4Z+t+RS/QKjElYhHKoobKouzjkYfCwqJJOx78fIus/kJzXgcIp+SyhkkuvkjSP/bI5p8ddeZhmkTr87qzctnoeu0bKlFjwVQSfdQ/UMviEqE/H6EmrslhVdQOBBIY7ReME5ri7giEiVnXGZ4oeebKP+zXYQj7SLtyoqoUNDIeDauYzkg4NH3dOt0axNu3aliOI9Q7c7s2wIERWNiFRXnnK2Q0mlkIuMOuLeyqwb9bw+MVvr1pgA1lw9PCA89ZeOej8nNh3SwXHW6wcAnKaA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB2321.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(366004)(39830400003)(376002)(396003)(6916009)(71200400001)(64756008)(66446008)(7696005)(66556008)(316002)(55016002)(4326008)(3480700007)(5660300002)(76116006)(66476007)(66946007)(86362001)(52536014)(2906002)(478600001)(54906003)(83380400001)(8676002)(9686003)(4001150100001)(26005)(4744005)(33656002)(186003)(8936002)(6506007)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: pDsm91wJv+PitZFB+hBnmEjYVaiZjDWk5HUmiAhBBium0Vw3un1GZjMRo/SgVXjkwWTg0egJqJ6ifMwtV7LJlUEosx2hjFXss6AYj4oVjJX3B3zIYruyS/EU34+T0i4VnXEAO5WAYf1YVOLK/TlmD6IPrg50L+yG6fRbQ7dfBhZakrEUvpgOnIHvm50dcKnbX2R+ZzA0X0GYZAUxTmzRaWA8CvWyopvexjhr3xebgRiJlmdaLOUMxay4fdlQPVGrkvU+0XHKRQXp9QJVbWyoqHDg6PKEmxxJJN1psNPc77+8UlxrcmgfqT8vvLbrAtl0c6e4QJEnkX8W9POALAdtWo+cBNtf7ZTl4iU5HjT052sCRluTdU+/4YXPEYcgJOyhdC/cLP+H3icJ7daM+G8rMS6xts2UTLV5kmxFrmbXB789bFLxDQ9euORElu9Pglgc9CpWSgV3Rvswxnso71fMLVf/aya/mab63Ed5wS36uS1yf/cRJzbbqdcDQSssdELl1TpScHEfzusceQpgugCCic1MwLYWtvlv7Nz2Y66qbbRTKYeXd4/jlSh2wYcwdfKnMnFuIkgFLb3zhXYzly7sBWLkJnP5BzpcdseC8lMExStqQCdjT2n0x2YBn3vRPVMMzpiVvFzkySms+cIPfiZ2/w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2321.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f4e344e-bad4-4bc9-761b-08d88f52b722
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2020 01:54:29.3625 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YJZ5y3z2/7V+7R8KvnHe5QyMV/A7cYtXiVDJAbGMk24FWHoFsA5MlA1H+WXwCjyhEL9iHNX5TpxTks8ItjMu23TRmLxqauhDyPWQwSIPxE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3602
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
Cc: "manager@lfprojects.org" <manager@lfprojects.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQnJhZA0KDQpUaGFua3MgZm9yIHlvdXIgaGVscC4NCg0KDQpCZXN0IHdpc2hlcw0KDQpMdWtl
IENoZW4NCihPKSA6ICs4ODYtMy01NzUxMTg1DQooTSkgOiArODg2LTkzNS01OTItODkyDQo0Riwg
Tm8uMSxTZWMuIDMsR29uZ2RhbyA1dGggUm9hZCwgRWFzdCBEaXN0LiwNCkhzaW5jaHUgQ2l0eSwg
MzAwNjksVGFpd2FuLFIuTy5DLg0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9t
OiBCcmFkIEJpc2hvcCA8YnJhZGxleWJAZnV6emllc3F1aXJyZWwuY29tPiANClNlbnQ6IFNhdHVy
ZGF5LCBOb3ZlbWJlciAyMSwgMjAyMCA1OjQ3IEFNDQpUbzogTHVrZSBDaGVuIDxsdWtlX2NoZW5A
YXNwZWVkdGVjaC5jb20+DQpDYzogbWFuYWdlckBsZnByb2plY3RzLm9yZzsgb3BlbmJtY0BsaXN0
cy5vemxhYnMub3JnDQpTdWJqZWN0OiBSZTogU2lnbmVkIENMQSBmcm9tIEFTUEVFRA0KDQpPbiBG
cmksIDIwMjAtMTEtMjAgYXQgMDg6MjEgKzAwMDAsIEx1a2UgQ2hlbiB3cm90ZToNCj4gSGkgQnJh
ZA0KPiBJIHdvdWxkIGxpa2UgdG8gdXBkYXRlIENDTEEuDQoNCkhpIEx1a2UgLSB1cGRhdGVkIEND
TEEgaGFzIGJlZW4gZmlsZWQuDQoNCnRoeCAtIGJyYWQNCg==
