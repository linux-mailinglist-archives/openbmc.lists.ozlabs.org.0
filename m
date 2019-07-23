Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E627C72573
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 05:41:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45th3808JbzDqKh
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 13:41:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=hyvedesignsolutions.com (client-ip=198.235.15.15;
 helo=smtp1.synnex.com; envelope-from=bradc@hyvedesignsolutions.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=hyvedesignsolutions.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=synnexcorp.onmicrosoft.com
 header.i=@synnexcorp.onmicrosoft.com header.b="PxORCpMg"; 
 dkim-atps=neutral
X-Greylist: delayed 908 seconds by postgrey-1.36 at bilbo;
 Tue, 23 Jul 2019 16:17:21 AEST
Received: from smtp1.synnex.com (SMTP1.synnex.com [198.235.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45t7YY0Vy9zDqRd
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2019 16:17:20 +1000 (AEST)
Received: from GSC-EXCH6.synnex.org ([10.84.32.34])
 by smtp1.synnex.com  with ESMTP id x6N622VJ017769-x6N622VL017769
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=CAFAIL);
 Tue, 23 Jul 2019 02:02:02 -0400
Received: from GSC-EXCH5.synnex.org (10.84.32.33) by GSC-EXCH6.synnex.org
 (10.84.32.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 23 Jul
 2019 02:02:02 -0400
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (104.47.45.58) by
 gsc-exch5.synnex.org (10.84.32.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 23 Jul 2019 02:02:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CWylUzO/t98rTxRpGtjh9aOk37mxSvoBgLNCqoFia9wyhjU2vYjk57O/SM1QoBVcwfGEmaNtvM9iLIrBXOsUXnu8/PaifTEzlQjvQPfN0Ezc5BllbrdQwzMFNK0l/ssAeZIowdHuPsVp3UHhuEa9HCcANoharL0hEDImIU+B3qKo2Mga2eX1PIRdVgywrzd+gTxDOAOEMHNnVIlDKNybdtvRFanb9+DUi1C8L7x6o4jB1wsQCydREfJneYq/xSZwZ889CDQVHOotjGrhOzXm4i9/d8N6zM4QIeySpX8kVbHyZ9MRZ316Jy/NRhF4dfbzpKnXDQA2ECyWOYGL2169bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3AkLv7VvS1IflqTf62wRKH7fhiM79y4bsmzkRm/C7KQ=;
 b=MYXjinsOzrBYbpfnIoXlEFMzZ9dqjYZKbPC9nfgAwKaTPGoLfQ0HfTphcpoFCRr2v+wyXLf/gViRLb8aGTNqJ2IVkIU4WOAxIpP73/P5bwMF+Daf2da4yawse03BEoAf6NxAD6hMUfSuesugFU8bt7fkJ5Wuj5camscuKGbd8oh6JidCSMltmhFqp237FWLKHeRsqC0wF2JPklcAEZjEELnf4Qet0yhmELsEYf/1qYVvn19KOK6HP6CVual0q1yQmvjXUrBXKj/TQwx4QT4kmNk0kqra0kzDg0D4hGK6kmulFc5kWXSn7BTbnCpU08e3u+PdCg2iuX+DcjiHbXcTeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=hyvedesignsolutions.com;dmarc=pass action=none
 header.from=hyvedesignsolutions.com;dkim=pass
 header.d=hyvedesignsolutions.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synnexcorp.onmicrosoft.com; s=selector2-synnexcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3AkLv7VvS1IflqTf62wRKH7fhiM79y4bsmzkRm/C7KQ=;
 b=PxORCpMg7Cv7WwMsaTKzVfsKPvBCgGdcGuhDeyv2Ilf+VQyW4o+0HN+C8vCwNSCNvJUVRJxZXHnhyNL/pOBnj3xJ9Z3VXj8q8mAnZtFGzxTUL2K7NdHWkv43CFTH/xWdOGfiPyjS5aD+Q5I1kulhaCvjE9aN6+FwSqUEDe0yvmQ=
Received: from CH2PR04MB6933.namprd04.prod.outlook.com (20.180.14.75) by
 CH2PR04MB6999.namprd04.prod.outlook.com (20.180.12.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Tue, 23 Jul 2019 06:01:59 +0000
Received: from CH2PR04MB6933.namprd04.prod.outlook.com
 ([fe80::3c4f:3a1b:7c38:1b82]) by CH2PR04MB6933.namprd04.prod.outlook.com
 ([fe80::3c4f:3a1b:7c38:1b82%3]) with mapi id 15.20.2094.017; Tue, 23 Jul 2019
 06:01:59 +0000
From: Brad Chou <bradc@hyvedesignsolutions.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, Thaj <tajudheenk@gmail.com>
Subject: RE: Multi-node support
Thread-Topic: Multi-node support
Thread-Index: AQHVQLTeH3QS3DzlhkGZdnR++q3lMabW8vwAgAAImwCAALqNIA==
Date: Tue, 23 Jul 2019 06:01:59 +0000
Message-ID: <CH2PR04MB6933AF1808D01E700C4EFD75B9C70@CH2PR04MB6933.namprd04.prod.outlook.com>
References: <CAH2KKebkJUxfEQbjcySkGWEteWjCem8EDKwVahAPnw-0-DfPJw@mail.gmail.com>
 <20190722172656.hkjfluvusnnhtzkx@thinkpad>
 <CAH2KKeb8akcV6D_0x3612BeEepRpesTzLiZAk=ASCJwRv-_M9A@mail.gmail.com>
 <5854893E-06B6-4EBA-818D-4AE2EB7F61EF@fuzziesquirrel.com>
In-Reply-To: <5854893E-06B6-4EBA-818D-4AE2EB7F61EF@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=bradc@hyvedesignsolutions.com; 
x-originating-ip: [61.222.103.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82577513-cf93-4ea1-114d-08d70f33465e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CH2PR04MB6999; 
x-ms-traffictypediagnostic: CH2PR04MB6999:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CH2PR04MB699968AD2C430C5808AA4426B9C70@CH2PR04MB6999.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(199004)(189003)(13464003)(8676002)(478600001)(6436002)(6116002)(86362001)(486006)(110136005)(99286004)(3846002)(76176011)(68736007)(4326008)(33656002)(7696005)(66066001)(14454004)(316002)(2906002)(55016002)(25786009)(9686003)(229853002)(6306002)(256004)(26005)(6246003)(53936002)(14444005)(52536014)(966005)(5660300002)(102836004)(476003)(64756008)(66446008)(66476007)(66556008)(76116006)(8936002)(446003)(3480700005)(305945005)(7736002)(11346002)(74316002)(81156014)(81166006)(66946007)(6506007)(71200400001)(53546011)(71190400001)(4744005)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR04MB6999;
 H:CH2PR04MB6933.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: hyvedesignsolutions.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UJk54E/9aIE2XrlKIafNoF5lzPAh/CpsHZ5yJBQacP3YFd+8JVshizqdfsdo11rV581qI9tI8KMMXUSVYGxi4mHdg2Cc9g5MG3008J9yTUdjik/UM9WRmP7jTVbH9ooKHkB2sV/w7Si3iBwrsGOG5ySuOzTByniHQU3xVADLU8SRemsah2WWNHAgLnZUw0wCATjWPciFf88rTi0TTAKDsLjxkPnJZo97sKSfzDC+A1PEkVXrzLcNANn2FJBI/UT9iYYMZenCKbHlkxJ4NMkYs/BJu4CLPKhT+dFt4pgunppu8z3AEuLT8qnuJU3VaBNnOiliHfeemKiSqwOZnCdBhclLyXy3afbc99I7w0ZcA8fWDubm/H7+YP8NP72HwaF+NWat/7cVoSZlwVgrSbZfOqIp/mDpa9dKfdCm0aYtXcs=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 82577513-cf93-4ea1-114d-08d70f33465e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 06:01:59.2701 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 972a0e27-c355-4fd7-9225-9266c8f332ac
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bradc@synnex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6999
X-OriginatorOrg: hyvedesignsolutions.com
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGVsbG8gQnJhZCwNCk1heSBJIGtub3cgd2h5IElQTUkvSVBNQiBpcyBub3QgcHJlZmVycmVkIGJ5
IElCTSA/DQpBbnkgY29uY2VybiBhYm91dCBpdCA/DQoNClRoYW5rcy4NCg0KLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCkZyb206IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNlcyticmFkYz1oeXZl
ZGVzaWduc29sdXRpb25zLmNvbUBsaXN0cy5vemxhYnMub3JnPiBPbiBCZWhhbGYgT2YgQnJhZCBC
aXNob3ANClNlbnQ6IFR1ZXNkYXksIEp1bHkgMjMsIDIwMTkgMjo1MiBBTQ0KVG86IFRoYWogPHRh
anVkaGVlbmtAZ21haWwuY29tPg0KQ2M6IG9wZW5ibWMgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9y
Zz4NClN1YmplY3Q6IFJlOiBNdWx0aS1ub2RlIHN1cHBvcnQNCg0KW0V4dGVybmFsIEUtbWFpbF0g
DQoNCg0KYXQgMjoyMCBQTSwgVGhhaiA8dGFqdWRoZWVua0BnbWFpbC5jb20+IHdyb3RlOg0KDQo+
IEluIHRoaXMgY2FzZSB3ZSBtYXkgbmVlZCBNQyB0byBNQyBjb21tdW5pY2F0aW9uIGludGVyZmFj
ZSANCj4gKE1hc3Rlci9TbGF2ZSkgZm9yIEJNQyBtYW5hZ2VtZW50Lg0KDQpUaGVyZSBpcyBJUE1C
IHN1cHBvcnQgaWYgeW91IHdhbnRlZCB0byB1c2UgSVBNSSBmb3IgdGhpczoNCg0KaHR0cHM6Ly9n
aXRodWIuY29tL29wZW5ibWMvaXBtYmJyaWRnZQ0KDQpNQyA8LT4gTUMgaW4gT3BlbkJNQyBpcyBz
b21ldGhpbmcgSUJNIHdpbGwgZGV2b3RlIHJlc291cmNlcyB0byBldmVudHVhbGx5LiAgIA0KQnV0
IG5vdCBpbiB0aGUgbmVhciBmdXR1cmUuICBXZeKAmWQgcHJvYmFibHkgYmUgbG9va2luZyBhdCBz
b21ldGhpbmcgb3RoZXIgdGhhbiBJUE1JL0lQTUIgZm9yIHRoYXQuICBIb3cgZG8geW91IHRoaW5r
IGl0IHNob3VsZCB3b3JrPw0KDQp0aHggLSBicmFkDQoNCg==
