Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 268F4207DA0
	for <lists+openbmc@lfdr.de>; Wed, 24 Jun 2020 22:45:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sZs74ypjzDqXJ
	for <lists+openbmc@lfdr.de>; Thu, 25 Jun 2020 06:44:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com;
 envelope-from=prvs=044469ef25=jean-marie.verdun@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hpe.com
X-Greylist: delayed 1647 seconds by postgrey-1.36 at bilbo;
 Thu, 25 Jun 2020 06:44:16 AEST
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com
 [148.163.143.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sZrJ2SsWzDqMw
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jun 2020 06:44:14 +1000 (AEST)
Received: from pps.filterd (m0134423.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05OKEbSG031531
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jun 2020 20:16:43 GMT
Received: from g4t3427.houston.hpe.com (g4t3427.houston.hpe.com
 [15.241.140.73])
 by mx0b-002e3701.pphosted.com with ESMTP id 31va1h9mku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jun 2020 20:16:43 +0000
Received: from G1W8108.americas.hpqcorp.net (g1w8108.austin.hp.com
 [16.193.72.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g4t3427.houston.hpe.com (Postfix) with ESMTPS id EAF3957
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jun 2020 20:16:42 +0000 (UTC)
Received: from G9W8456.americas.hpqcorp.net (2002:10d8:a15f::10d8:a15f) by
 G1W8108.americas.hpqcorp.net (2002:10c1:483c::10c1:483c) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Wed, 24 Jun 2020 20:16:42 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (15.241.52.11) by
 G9W8456.americas.hpqcorp.net (16.216.161.95) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Wed, 24 Jun 2020 20:16:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVsqQ3TxcrgeYNjJ5yEVkHGSa1kEMKPhy0eSv1wJ8rJUmvkBbrIayNMIeZ8+fymfFoGGOxWLbwu7uEoL4ax/HErG9vi0ppxAkMtxVL73MB1RlMHIQ3ZLWcUttEZ+PWR3YvVGxxfKTry45b3p8yx6dNTou+clIhC/XjIktzGOJ5fGBZ57SxI5gOj3EkaU08J6EIArXwdSWgDjVGq/gdfPWKAWTZ3VzF6OcIVRGyC7Kbt5Faap7lkJkW8vRR8Fg9iGAqMK6qRKpddROVlXn1dyP4Rdd4J66+L3SMs9XIEucbs8rv0TGJuDRaY8wtwBmNkdrjItldp1K7rcU23jGtZ5Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7aSlQekxeyMYPPKmQbv6nirTO3EGmb6SsVmFNcW0S0=;
 b=bYCSh9J1vW6XmNCOj5Lpo07bwLSTZF8CPYA4HqfS/XpkLkuuYquZn0kDMp3kOlEwxt5mIk1NAFgZUXCWhtli6O+GL7PxUjwSfs9xvp87oR6MhIXyrFWGiWjRvSLmK/tBRISUH0/k1Vw/JSzzf2F7C2xCfjRjGHUVsJ0MVUpdJOPJgM8eJURa3snNKMWp4jAV3dgu4Fx7G4TcV5DfIfF0ZPdy2C/jCjjSSNqC/1SB/UcV9Ncwl+LkeWbE6gw7DQm/wmnCpZI7vywemtZ9+ljw8ypn5DvBqwKmTY+IsVs1CKv6MxOXvn6qQcWkkW/fEzu371wCx7ZztJKZJSYHBeW86Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from AT5PR8401MB0641.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7423::13) by AT5PR8401MB0868.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7426::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Wed, 24 Jun
 2020 20:16:40 +0000
Received: from AT5PR8401MB0641.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::f8f6:4c42:56e7:1387]) by AT5PR8401MB0641.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::f8f6:4c42:56e7:1387%12]) with mapi id 15.20.3131.021; Wed, 24 Jun
 2020 20:16:34 +0000
From: "Verdun, Jean-Marie" <jean-marie.verdun@hpe.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Expanding CI to live testing
Thread-Topic: Expanding CI to live testing
Thread-Index: AQHWSmRbu5SvVkFx3kqvJTpquFeoEw==
Date: Wed, 24 Jun 2020 20:16:34 +0000
Message-ID: <B50DC7EF-D1F7-4D7F-B502-DEA4EA2A6145@hpe.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.37.20051002
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=hpe.com;
x-originating-ip: [2601:582:4681:bb70:cd08:dbbb:f0c9:9ab4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1b5a26d7-dc40-4360-1da5-08d8187b7dfc
x-ms-traffictypediagnostic: AT5PR8401MB0868:
x-microsoft-antispam-prvs: <AT5PR8401MB0868AD6371C0B3586B6F4DBDA7950@AT5PR8401MB0868.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0444EB1997
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nhmGbPKo2jAUBdgrRbAI0l9t2h+pScolVbkIEcVeguGupPp1uTkwfKZCDYxNK6N3+bBncyajf/5XFkkNvTZIFLER5oH6TDf7GfSfX7i/+3lyxOcu44JmQAQYtA+4IUHegZgnGWjlu6zrIoUoZEEJOn9PAuWGG9CN4kwGGcOJZBdYK1Kepfl3otA0jGprV9WiGf6QS3qqV3IDEagxjvKVJqiRhlsrB7xAeMW3XuGydFxg0jrCEFD3NmUak4KnmbVw7q4+sJZjCox/ShwffgqCnHH76yAvQDBMgui6ipavMSnRGwVxcehMTxAbeESfSxPT4sAzX0SK2vwm6AyqW63QpekRG1OGokqGxnsed2DwigZnghpIpUiEZvZQ3uZieXTq71gqUB5etCEh/Ra+/Wa1mg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AT5PR8401MB0641.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(366004)(396003)(39860400002)(346002)(136003)(6506007)(6486002)(186003)(66946007)(76116006)(66446008)(64756008)(71200400001)(8676002)(66476007)(8936002)(66556008)(33656002)(9326002)(6916009)(6512007)(316002)(966005)(478600001)(2616005)(83380400001)(166002)(5660300002)(36756003)(66574015)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 4X+zuXs/f10GQYUvClZFK04i2OMa1KgCyH6bOcitcZc/VT3YD7P7fv9/FtIQk6ud7VSV0sFn5TmlCuqFlzvZ/Jn8quvfZyD40I7iaYkNIjp1ZW53c4fZafxOUqO5ByOnzOHAZKBb6MWp9PvFWnIFi7anWDM2isbBwBeD5lvQWj2DN3GaCLrSr7WQ4yyXKtUT+DDXi7nzb7xdAbNDmYCzQRt5aFy4BwjBQ90HPZXFmRP6YAPrPcpJrXLP2K4Oghvvx9R+S4kSa6QF4w+bf+2bCCtg9ZkUCroNFAhoSpiSIwn8m3QFyzd7W31n1MWf93JnMnSUii69P2aQSR2uTIxTEOKKzm4GN0XvxfMuC9UL7BU/ArKwEX179xsVi/qGGX5CpRjX3TQpRFhKIN3vrukSWiNXCaASlLtx4e6ZWiJZ1IJ/7hywtbC6k+DMzwV8mubpOrsO119fVFjyRGlRypw3MbzKAy0WvCVIRqEhVLfo9dBp086yV7dN1Xv7ksZGMffK2MkzI33gk5CTpaYrKfYsqberul89qeRQ4nwujsvfImuI1Li7QYCyN+WbGRqxYofn
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_B50DC7EFD1F74D7FB502DEA4EA2A6145hpecom_"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AT5PR8401MB0641.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b5a26d7-dc40-4360-1da5-08d8187b7dfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2020 20:16:34.5944 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DjsMBZHe6Uvh5BRec4YMiquc3wBUlOfx2ZONK3IcG5L6Qm6/XC2njT6WJDXAEkkB6BvMTqQQwoERXpRPiBk0LZGMA5EDSODmSLUgyy63A3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AT5PR8401MB0868
X-OriginatorOrg: hpe.com
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-24_16:2020-06-24,
 2020-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 cotscore=-2147483648
 spamscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006240130
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_B50DC7EFD1F74D7FB502DEA4EA2A6145hpecom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCkFzIHNvbWUgb2YgeW91IGFyZSBhd2FyZSBJIGFtIHdvcmtpbmcgb24gYSBDb250aW51
b3VzIEludGVncmF0aW9uIHN5c3RlbSB3aGljaCBhbGxvdyBkZXZlbG9wZXIgdG8gdGVzdCB0aGVp
ciBidWlsZCBvbiBhIHJlYWwgaGFyZHdhcmUuIEkgYnVpbHQgYSBwcm9vZiBvZiBjb25jZXB0IGJl
Zm9yZSB3ZSBoYWQgdG8gbG9ja2Rvd24gb3VyIEhvdXN0b24gQ2FtcHVzLiBUaGUgZ29vZCBuZXdz
IGlzIHRoYXQgaXQgc3RhcnRzIHRvIHdvcmssIGFuZCBJIGFtIHVzaW5nIGl0IGV4dGVuc2l2ZWx5
IHRvIHdvcmsgb24gbGludXhib290IChpdCBpcyBhdmFpbGFibGUgaGVyZTogaHR0cHM6Ly9vc2Zj
aS50ZWNoKS4gU28gd2hhdCBjYW4gSSBkbyA/DQoNClRocm91Z2ggdGhlIENJLCBJIGNhbiBsb2Fk
IHByZS1jb21waWxlZCBCTUMgLyBCSU9TIGltYWdlLCBhY2Nlc3MgdG8gdGhlIGNvbnNvbGUgKHNl
cmlhbCwgZHVyaW5nIHRoZSBzeXN0ZW0gYm9vdCksIGNvbnRyb2wgdGhlIHBvd2VyIG9mIHRoZSBz
ZXJ2ZXIgKGdlbmVyYXRpbmcgYSBjb2xkIGJvb3QsIGluIHRoZSBjYXNlIHRoZSBtYWNoaW5lIGJy
aWNrcyBkdWUgdG8gYmFkIGNvZGUpLCBhbmQgYWNjZXNzIHRvIHRoZSBCTUMgd2Vic2l0ZSB3aGVu
IGl0IGlzIGludGVncmF0ZWQuIEkgdHJpZWQgdG8gbWFrZSB0aGUgY29kZSBtb2R1bGFyIGFuZCB0
aGUgYXJjaGl0ZWN0dXJlIGlzIHRoZSBmb2xsb3dpbmcgb25lOg0KDQoNCiAgKiAgIEFuIGludGVy
bmV0IGdhdGV3YXkgc2VydmVyIHdoaWNoIGhhbmRsZXMgYWxsIGluY29taW5nIHRyYWZmaWMgYW5k
IHJvdXRlIGl0IHRvIHRoZSByZWxldmFudCBmb2xsb3cgdXAgc2VydmVycw0KICAqICAgMSB0byBO
IGNvbnRyb2xsZXIgbm9kZXMsIHdoaWNoIGFyZSBhdHRhY2hlZCB0byBhIHRlc3Qgc2VydmVyLiBU
aGUgY29udHJvbGxlciBub2RlIGhhbmRsZSByZW1vdGUgcG93ZXIgbWFuYWdlbWVudCwgYXMgd2Vs
bCBhcyBjb25zb2xlIGFjY2VzcywgYW5kIGZsYXNoIGVtdWxhdG9ycyB3aGljaCBhcmUgcGh5c2lj
YWxseSBjb25uZWN0ZWQgdG8gdGhlIFNQSSBidXMgb2YgdGhlIHRlc3QgbWFjaGluZS4NCiAgICAg
KiAgIEF0dGFjaGVkIHRvIGVhY2ggY29udHJvbGxlciBub2RlIHRoZXJlIGlzIGEgY29tcGlsZSBt
YWNoaW5lIHdoaWNoIGlzIHVzZWQgdG8gY29tcGlsZSBlaXRoZXIgbGludXhib290IG9yIE9wZW5C
TUMgKE9wZW5CTUMgaXMgdGhlIHJlYXNvbiBvZiB0aGlzIGVtYWlsKSwgaW4gdGhlIGNhc2UgdGhl
IHVzZXIgZG8gbm90IHJlY29tcGlsZSB0aGVtIGJ1dCBqdXN0IGRldmVsb3AgdGhlIGNvZGUuIFdo
ZW4gdGhlIGJ1aWx0IGlzIGRvbmUgaXQgaXMgdHJhbnNmZXJyZWQgdG8gdGhlIENUUkwgd2hpY2gg
aXMgbG9hZGluZyB0byB0aGUgbGl2ZSBtYWNoaW5lLiBUaGVyZSBpcyBhbHNvIDEgcHJlLWJ1aWx0
IGltYWdlIHdoaWNoIGNhbiBiZSB1c2VkIChpZiB5b3UgYXJlIGRldmVsb3Bpbmcgb25seSBsaW51
eGJvb3Qgb3Igb25seSBvcGVuYm1jLCB5b3Ugc3RpbGwgY2FuIHRlc3QgdGhlIHdob2xlIHN0YWNr
KQ0KDQpTbyB0aGUgbWluaW1hbCBzZXR1cCByZXF1aXJlcyA0IHNlcnZlcnMsIHdoaWNoIGNvdWxk
IGxvb2sgbGlrZSBhIGxvdCwgYnV0IHNvbWUgb2YgdGhlbSBjb3VsZCBiZSB2ZXJ5IGJhc2ljIChs
aWtlIHRoZSBjb250cm9sbGVyIG5vZGUgYW5kIHRoZSBnYXRld2F5KS4NCg0KTXkgbWFpbiBnb2Fs
IGlzIHRvIGJlIGFibGUgdG8gb2ZmZXIgZGV2ZWxvcG1lbnQgY2FwYWNpdHkgZnJvbSBhIGxhcHRv
cCwgYW5kIHRvIGFueSBmaXJtd2FyZSBkZXZlbG9wZXJzIHdoYXRldmVyIHRoZSBsb2NhdGlvbiBo
ZS9zaGUgd2lsbCBiZS4gSSBmb3VuZCBpdCBwcmV0dHkgdXNlZnVsIGR1cmluZyB0aGlzIHRvdWdo
IG1vbWVudCB0aGF0IHdlIGxpdmUgd2l0aCB0aGUgcGFuZGVtaWMuDQoNCk15IHNlY29uZGFyeSBn
b2FsIGlzIHRvIGF1dG9tYXRpemUgbGl2ZSB0ZXN0aW5nIG9uIHJlYWwgaGFyZHdhcmUgYW5kIHBy
b2JhYmx5IGludGVyZmFjZSB0aGUgQ1RSTCBwb29sIHRvIGEgUm9ib3Qgc2VydmVyICggaHR0cHM6
Ly9yb2JvdGZyYW1ld29yay5vcmcvICkuIFRoaXMgcGFydCBzdGlsbCBuZWVkIHRvIGJlIGRldmVs
b3BlZCwgYW5kIHRoZSBjdXJyZW50IEFQSSBoYXMgdGhlIGJhc2ljIGNvZGluZyB0byBzdXBwb3J0
IGl0LCBidXQgc2VyaW91c2x5IG5lZWQgcmVuYW1pbmcsIGFuZCBjb252ZW50aW9uIGJ1aWxkIHVw
Lg0KDQpFdmVyeXRoaW5nIGlzIHdyaXR0ZW4gaW4gR29sYW5nIChhIGxvdCBvZiBiYWQgc2hlbGwg
c2NyaXB0cyBhcmUgc3RpbGwgaGVyZSwgYnV0IEkgYW0gd29ya2luZyBhdCByZW1vdmluZyB0aGVt
IHdpdGggdGltZSBnb2luZyBvbikuDQoNCkkgYW0gY3VycmVudGx5IHVuZGVyIHRoZSBwcm9jZXNz
IHRvIGFkYXB0IGl0IHRvIE9wZW5CTUMuIFRoZSBzb3VyY2UgY29kZSBpcyBwdWJsaWMgKGh0dHBz
Oi8vZ2l0aHViLmNvbS9IZXdsZXR0UGFja2FyZC9vc2ZjaSkgLiBGZWVsIGZyZWUgdG8gZm9yayB0
aGF0IHRvb2wsIGFuZCBwaW5nIG1lIGlmIHlvdSBuZWVkIHRvIGtub3cgaG93IHRvIHNldHVwIHlv
dXIgb3duIENJLCB0aGlzIGlzIGFsc28gYSBnb29kIGVkdWNhdGlvbiB0b29sIHRvIGRlbW9uc3Ry
YXRlIHRoZSBlZmZpY2llbmN5IG9mIG91ciB3b3JrIHdpdGggbGl2ZSBzeXN0ZW0sIHRoYXQgeW91
IGNhbiB0ZXN0LiBJIGRvIGhhdmUgYSBjb3VwbGUgb2YgZW5kIHVzZXJzIHdoaWNoIGFyZSBkaXNj
b3ZlcmluZyBPcGVuIFNvdXJjZSBGaXJtd2FyZSB0aHJvdWdoIHRoYXQgdG9vbCBhbmQgbXkgZ3Vp
ZGFuY2UuDQoNClRoZSBkZW1vIGltYWdlIGlzIHVzaW5nIG91ciBzdGFuZGFyZCBsb2dpbi9wYXNz
d29yZCBzY2hlbWUuDQoNCk15IGN1cnJlbnQgY2hhbGxlbmdlIHdpdGggT3BlbkJNQyBpcyByZWxh
dGVkIHRvIGJ1aWxkIHRpbWUgYW5kIG5vdCBjb21wZXRlIHdpdGggdGhlIGV4aXN0aW5nIGluZnJh
c3R1Y3R1cmUgYnV0IG1vcmUgYmVpbmcgaW50ZWdyYXRlZCB0byBpdC4gSSB0cmllZCB0byB1bmRl
cnN0YW5kIGhvdyB3ZSB0ZXN0IG5ldyBwdWxsIHJlcXVlc3QgYW5kIGl0IGxvb2tzIGxpa2UgdGhh
dCB3ZSBhcmUgdXNpbmcgSmVua2lucy4gSSBoYXZlIG5vIGV4cGVyaWVuY2Ugd2l0aCBpdCwgYnV0
IHRoYXQgaXMgZmluZSAoSSB1c2VkIHRyYXZpc2NpIGFuZCBBcHB2ZXlvcmNpKS4NCg0KVGhlIGNv
bXBpbGUgbm9kZSBpbnRvIG15IGN1cnJlbnQgQ0ksIGNvdWxkIGJlIHJ1bm5pbmcgYSBqZW5raW5z
IGJ1aWxkIGluc3RhbmNlIChub3Qgc3VyZSBhYm91dCB0aGUgY29udmVudGlvbiksIHRoaXMgd2ls
bCByZXF1aXJlcyB0aGF0IEkgYnVpbGQgYWxzbyB0aGUgbGlua3hib290IHNpZGUgd2l0aCB0aGUg
c2FtZSB0b29sLiBJIGNhbiBwcm9iYWJseSBhZGFwdCB0aGF0LiBBcyBvZiBub3csIHRoZSBidWls
ZCBwcm9jZXNzIHJ1biBpbnRvIDIgZGlmZmVyZW50IGRvY2tlcnMgaW5zdGFuY2UsIHdoaWNoIGFy
ZSBwcmV0dHkgZWZmaWNpZW50LiBUaGUgZnJvbSBzY3JhdGNoIGJ1aWxkIGZvciBPcGVuQk1DIGxh
c3QgYWJvdXQgNDQgbWludXRlcyB3aGVuIEkgYnVpbGQgZXZlcnl0aGluZyBmcm9tIHNjcmF0Y2gg
KGluIG1lbW9yeSBmaWxlIHN5c3RlbSkuIFRoYXQgaXMgYSBsb25nIHRpbWUsIHdoaWNoIHdpbGwg
cmVxdWlyZSBlaXRoZXIgYSBiYXRjaCBzY2hlZHVsZXIsIG9yIHVzaW5nIEplbmtpbnMgYXMgaXQu
IEkgY2FuIGFjY2VsZXJhdGUgdGhhdCB1c2luZyBhIG5vbi1jbGVhbiBzdGF0ZSBjYWNoZSwgYnV0
IHRoaXMgaXMgbm90IHJlYWxseSBteSB0YXJnZXQgYXQgdGhlIHByZXNlbnQgdGltZS4gKGZlZWwg
ZnJlZSB0byBjb252aW5jZSBtZSBJIGFtIHN0dXBpZCwgYW5kIEkgc2hhbGwgdXNlIGl0ICEpDQoN
ClJpZ2h0IG5vdyBteSBwcm9jZXNzIGlzIHZlcnkgaW50ZXJhY3RpdmUsIHRoZSBlbmQgdXNlciBp
cyBnZXR0aW5nIGFjY2VzcyB0byAxIGN0cmwgbm9kZSAodGhyb3VnaCBhIHdlYnBhZ2UpLCBhbmQg
ZnJvbSB0aGVyZSBoZSBoYXMgMzAgbWludXRlcyBhbGxvY2F0aW9uIHRvIGVpdGhlciB1cGxvYWQg
YSBwcmUtZXhpc3RpbmcgYnVpbGQsIG9yIHNwZWNpZnkgaGlzL2hlciBnaXRodWIgcmVwbywgcGx1
cyBhIGJyYW5jaCwgdG8ga2ljayBhIGZ1bGwgYnVpbGQgb2YgbGludXhib290LiBUaGF0IGlzIG9r
IHdpdGggbGludXhib290IGFzIHRoZSBidWlsZCB0aW1lIGlzIGFib3V0IDQgbWludXRlcyBvciBs
ZXNzIChmcm9tIHNjcmF0Y2gpLiAgSXQgaXMgbm90IHdpdGggT3BlbkJNQy4NCg0KU28gSSBkbyBo
YXZlIGEgY291cGxlIG9mIHF1ZXN0aW9uczoNCg0KDQogICogICBEb2VzIHRoZSBKZW5raW5zIGJ1
aWxkIGNvdWxkIGJlIG1hZGUgaW50byBhIERvY2tlciBpbWFnZSBrbm93aW5nIHRoYXQgbXkgY29t
cGlsZSBub2RlIHJ1bnMgdW5kZXIgVWJ1bnR1IChJIGJlbGlldmUgMTguMDQpDQogICogICBDb3Vs
ZCB3ZSBmaW5kIGEgd2F5IHdoZW4gb3VyIEplbmtpbnMgY2x1c3RlciBidWlsZCBpcyBkb25lIHRv
IGV4dHJhY3QgdGhlIGJ1aWxkIHJlc3VsdCwgYXV0b21hdGl6ZSB0aGUgdHJhbnNmZXIgb2YgaXQg
dG8gcGVyaGFwcyBhbiBvYmplY3Qgc3RvcmFnZSBwb29sIHdpdGggYSB1bmlxdWUgVVVJRCBpZGVu
dGlmaWVyLiBUaGUgY2hhbGxlbmdlIHdpbGwgYmUgdG8gcmV0cmlldmUgdGhhdCBVVUlEIGludG8g
dGhlIGdlcnJpdCBwYWdlLCBvciB0aGUgSmVua2lucyBsb2cuDQogICogICBJZiB0aGUgYnVpbGQg
aXMgc3VjY2Vzc2Z1bCwgdGhlIGVuZCB1c2VyIGNvdWxkIHVzZSB0aGF0IHVuaXF1ZSBVVUlEIHRv
IHRlc3Qgb24gYSBsaXZlIHN5c3RlbS4gVGhlIG9zZmNpIHN5c3RlbSB3aWxsIHRoZW4gZXh0cmFj
dCBmcm9tIHRoZSBvYmplY3Qgc3RvcmFnZSBiYWNrZW5kIHRoZSBidWlsZCByZXN1bHRzIGFuZCBi
b290c3RyYXAgaXQgb24gdGhlIGZpcnN0IENUUkwgbm9kZSBhdmFpbGFibGUuDQogICogICBUaGVu
IGFuIGludGVyYWN0aXZlIHNlc3Npb24gY291bGQgc3RhcnQsIG9yIHRoZSByb2JvdCBmcmFtZXdv
cmsgc3lzdGVtIGNvdWxkIGhhdmUgYSBsb29rIHRvIHRoZSByZXN1bHRzIGFuZCBmZWVkYmFjayBq
ZW5raW5zLCBvciB0aGUgZW5kIHVzZXINCg0KSSB3b3VsZCBsaWtlIGluIGZhY3QgdG8gYXZvaWQg
dGhhdCB3ZSBjb21waWxlIHR3byB0aW1lcyB0aGUgc2FtZSB0aGluZywgdGhhdCBsb29rIGxpa2Ug
c3R1cGlkIHRvIG1lLg0KDQpSZWdhcmRpbmcgdGhlIG9iamVjdCBzdG9yYWdlIHBvb2wsIEkgbXVz
dCBhZG1pdCB0aGF0IEkgbGlrZSB0aGUgbWluaW8gcHJvamVjdCB3aGljaCBpcyBjb21wYXRpYmxl
IHdpdGggczMgc3RvcmFnZSBBUEkuIFNvIGlmIHRoYXQgaXMgc29tZXRoaW5nIHdoaWNoIHNlZW1z
IHJlYXNvbmFibGUgdG8geW91LCBJIGNhbiB3b3JrIG9uIGJ1aWxkaW5nIHVwIHRoYXQgYmFja2Vu
ZC4gV2UgY291bGQgZGVjaWRlIHRvIGtlZXAgYnVpbGQgZG9uZSBkdXJpbmcgdGhlIHBhc3QgMzAg
ZGF5cywgYW5kIHJlbW92ZSB0aGVtIGFmdGVyIHRoYXQgcGVyaW9kLg0KDQpMZXQgbWUga25vdyB5
b3VyIHRob3VnaHRzID8NCg0KSSBiZWxpZXZlIGlmIHdlIGhhdmUgYW4gaW50ZWdyYXRlZCBkZXZl
bG9wbWVudCBlbnZpcm9ubWVudCB3ZSBtaWdodCBiZSByZWR1Y2luZyB0aGUgbnVtYmVyIG9mIGZv
cmtzIG9mIHRoZSBwcm9qZWN0LCBhbmQgaG9wZWZ1bGx5IGhhdmUgcXVpY2tlciB1cHN0cmVhbSBy
ZXF1ZXN0LCByZWR1Y2luZyB0aGUgcGFpbiB0byBpbnRlZ3JhdGUgZWl0aGVyIG9sZCBjb2RlLCBv
ciBoYW5kbGluZyBtZXJnZSBjb25mbGljdHMuIFRoaXMgaXMgbm90IGZpeGluZyB0aGUg4oCcc2Vj
cmV04oCdIGFzcGVjdCB3ZSBtaWdodCBiZSBzdHJ1Z2dsaW5nIHdpdGggc29tZSBzeXN0ZW1zIHVu
ZGVyIGRlc2lnbiwgYnV0IHRoaXMgaXMgYW5vdGhlciBzdG9yeS4NCg0KdmVqbWFyaWUNCg==

--_000_B50DC7EFD1F74D7FB502DEA4EA2A6145hpecom_
Content-Type: text/html; charset="utf-8"
Content-ID: <CA75035E8C750B448CF147F564B9CC1D@NAMPRD84.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
V2luZ2RpbmdzOw0KCXBhbm9zZS0xOjUgMCAwIDAgMCAwIDAgMCAwIDA7fQ0KQGZvbnQtZmFjZQ0K
CXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2IDMg
MiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToyIDE1
IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3JtYWws
IGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCW1hcmdpbi1ib3R0
b206LjAwMDFwdDsNCglmb250LXNpemU6MTIuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixz
YW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXByaW9y
aXR5Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpw
Lk1zb0xpc3RQYXJhZ3JhcGgsIGxpLk1zb0xpc3RQYXJhZ3JhcGgsIGRpdi5Nc29MaXN0UGFyYWdy
YXBoDQoJe21zby1zdHlsZS1wcmlvcml0eTozNDsNCgltYXJnaW4tdG9wOjBpbjsNCgltYXJnaW4t
cmlnaHQ6MGluOw0KCW1hcmdpbi1ib3R0b206MGluOw0KCW1hcmdpbi1sZWZ0Oi41aW47DQoJbWFy
Z2luLWJvdHRvbTouMDAwMXB0Ow0KCWZvbnQtc2l6ZToxMi4wcHQ7DQoJZm9udC1mYW1pbHk6IkNh
bGlicmkiLHNhbnMtc2VyaWY7fQ0Kc3Bhbi5FbWFpbFN0eWxlMTcNCgl7bXNvLXN0eWxlLXR5cGU6
cGVyc29uYWwtY29tcG9zZTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsNCglj
b2xvcjp3aW5kb3d0ZXh0O30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9y
dC1vbmx5Ow0KCWZvbnQtc2l6ZToxMi4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMt
c2VyaWY7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4gMTEuMGluOw0KCW1hcmdp
bjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29y
ZFNlY3Rpb24xO30NCi8qIExpc3QgRGVmaW5pdGlvbnMgKi8NCkBsaXN0IGwwDQoJe21zby1saXN0
LWlkOjE3NTU4NTY4MzQ7DQoJbXNvLWxpc3QtdHlwZTpoeWJyaWQ7DQoJbXNvLWxpc3QtdGVtcGxh
dGUtaWRzOjE2ODAwOTM2MzYgMTI2MDY1ODc1MCA2NzY5ODY5MSA2NzY5ODY5MyA2NzY5ODY4OSA2
NzY5ODY5MSA2NzY5ODY5MyA2NzY5ODY4OSA2NzY5ODY5MSA2NzY5ODY5Mzt9DQpAbGlzdCBsMDps
ZXZlbDENCgl7bXNvLWxldmVsLXN0YXJ0LWF0OjA7DQoJbXNvLWxldmVsLW51bWJlci1mb3JtYXQ6
YnVsbGV0Ow0KCW1zby1sZXZlbC10ZXh0Oi07DQoJbXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJ
bXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjpsZWZ0Ow0KCXRleHQtaW5kZW50Oi0uMjVpbjsNCglm
b250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsNCgltc28tZmFyZWFzdC1mb250LWZhbWls
eTpDYWxpYnJpO30NCkBsaXN0IGwwOmxldmVsMg0KCXttc28tbGV2ZWwtbnVtYmVyLWZvcm1hdDpi
dWxsZXQ7DQoJbXNvLWxldmVsLXRleHQ6bzsNCgltc28tbGV2ZWwtdGFiLXN0b3A6bm9uZTsNCglt
c28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOmxlZnQ7DQoJdGV4dC1pbmRlbnQ6LS4yNWluOw0KCWZv
bnQtZmFtaWx5OiJDb3VyaWVyIE5ldyI7fQ0KQGxpc3QgbDA6bGV2ZWwzDQoJe21zby1sZXZlbC1u
dW1iZXItZm9ybWF0OmJ1bGxldDsNCgltc28tbGV2ZWwtdGV4dDrvgqc7DQoJbXNvLWxldmVsLXRh
Yi1zdG9wOm5vbmU7DQoJbXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjpsZWZ0Ow0KCXRleHQtaW5k
ZW50Oi0uMjVpbjsNCglmb250LWZhbWlseTpXaW5nZGluZ3M7fQ0KQGxpc3QgbDA6bGV2ZWw0DQoJ
e21zby1sZXZlbC1udW1iZXItZm9ybWF0OmJ1bGxldDsNCgltc28tbGV2ZWwtdGV4dDrvgrc7DQoJ
bXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJbXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjpsZWZ0
Ow0KCXRleHQtaW5kZW50Oi0uMjVpbjsNCglmb250LWZhbWlseTpTeW1ib2w7fQ0KQGxpc3QgbDA6
bGV2ZWw1DQoJe21zby1sZXZlbC1udW1iZXItZm9ybWF0OmJ1bGxldDsNCgltc28tbGV2ZWwtdGV4
dDpvOw0KCW1zby1sZXZlbC10YWItc3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1iZXItcG9zaXRp
b246bGVmdDsNCgl0ZXh0LWluZGVudDotLjI1aW47DQoJZm9udC1mYW1pbHk6IkNvdXJpZXIgTmV3
Ijt9DQpAbGlzdCBsMDpsZXZlbDYNCgl7bXNvLWxldmVsLW51bWJlci1mb3JtYXQ6YnVsbGV0Ow0K
CW1zby1sZXZlbC10ZXh0Ou+CpzsNCgltc28tbGV2ZWwtdGFiLXN0b3A6bm9uZTsNCgltc28tbGV2
ZWwtbnVtYmVyLXBvc2l0aW9uOmxlZnQ7DQoJdGV4dC1pbmRlbnQ6LS4yNWluOw0KCWZvbnQtZmFt
aWx5OldpbmdkaW5nczt9DQpAbGlzdCBsMDpsZXZlbDcNCgl7bXNvLWxldmVsLW51bWJlci1mb3Jt
YXQ6YnVsbGV0Ow0KCW1zby1sZXZlbC10ZXh0Ou+CtzsNCgltc28tbGV2ZWwtdGFiLXN0b3A6bm9u
ZTsNCgltc28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOmxlZnQ7DQoJdGV4dC1pbmRlbnQ6LS4yNWlu
Ow0KCWZvbnQtZmFtaWx5OlN5bWJvbDt9DQpAbGlzdCBsMDpsZXZlbDgNCgl7bXNvLWxldmVsLW51
bWJlci1mb3JtYXQ6YnVsbGV0Ow0KCW1zby1sZXZlbC10ZXh0Om87DQoJbXNvLWxldmVsLXRhYi1z
dG9wOm5vbmU7DQoJbXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjpsZWZ0Ow0KCXRleHQtaW5kZW50
Oi0uMjVpbjsNCglmb250LWZhbWlseToiQ291cmllciBOZXciO30NCkBsaXN0IGwwOmxldmVsOQ0K
CXttc28tbGV2ZWwtbnVtYmVyLWZvcm1hdDpidWxsZXQ7DQoJbXNvLWxldmVsLXRleHQ674KnOw0K
CW1zby1sZXZlbC10YWItc3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1iZXItcG9zaXRpb246bGVm
dDsNCgl0ZXh0LWluZGVudDotLjI1aW47DQoJZm9udC1mYW1pbHk6V2luZ2RpbmdzO30NCm9sDQoJ
e21hcmdpbi1ib3R0b206MGluO30NCnVsDQoJe21hcmdpbi1ib3R0b206MGluO30NCi0tPjwvc3R5
bGU+PCEtLVtpZiBndGUgbXNvIDldPjx4bWw+DQo8bzpzaGFwZWRlZmF1bHRzIHY6ZXh0PSJlZGl0
IiBzcGlkbWF4PSIxMDI2IiAvPg0KPC94bWw+PCFbZW5kaWZdLS0+PCEtLVtpZiBndGUgbXNvIDld
Pjx4bWw+DQo8bzpzaGFwZWxheW91dCB2OmV4dD0iZWRpdCI+DQo8bzppZG1hcCB2OmV4dD0iZWRp
dCIgZGF0YT0iMSIgLz4NCjwvbzpzaGFwZWxheW91dD48L3htbD48IVtlbmRpZl0tLT4NCjwvaGVh
ZD4NCjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSIjMDU2M0MxIiB2bGluaz0iIzk1NEY3MiI+DQo8
ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkhpLDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwv
bzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1z
aXplOjExLjBwdCI+QXMgc29tZSBvZiB5b3UgYXJlIGF3YXJlIEkgYW0gd29ya2luZyBvbiBhIENv
bnRpbnVvdXMgSW50ZWdyYXRpb24gc3lzdGVtIHdoaWNoIGFsbG93IGRldmVsb3BlciB0byB0ZXN0
IHRoZWlyIGJ1aWxkIG9uIGEgcmVhbCBoYXJkd2FyZS4gSSBidWlsdCBhIHByb29mIG9mIGNvbmNl
cHQgYmVmb3JlIHdlIGhhZCB0byBsb2NrZG93biBvdXIgSG91c3RvbiBDYW1wdXMuDQogVGhlIGdv
b2QgbmV3cyBpcyB0aGF0IGl0IHN0YXJ0cyB0byB3b3JrLCBhbmQgSSBhbSB1c2luZyBpdCBleHRl
bnNpdmVseSB0byB3b3JrIG9uIGxpbnV4Ym9vdCAoaXQgaXMgYXZhaWxhYmxlIGhlcmU6IGh0dHBz
Oi8vb3NmY2kudGVjaCkuIFNvIHdoYXQgY2FuIEkgZG8gPzxvOnA+PC9vOnA+PC9zcGFuPjwvcD4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpw
PiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOjExLjBwdCI+VGhyb3VnaCB0aGUgQ0ksIEkgY2FuIGxvYWQgcHJlLWNvbXBp
bGVkIEJNQyAvIEJJT1MgaW1hZ2UsIGFjY2VzcyB0byB0aGUgY29uc29sZSAoc2VyaWFsLCBkdXJp
bmcgdGhlIHN5c3RlbSBib290KSwgY29udHJvbCB0aGUgcG93ZXIgb2YgdGhlIHNlcnZlciAoZ2Vu
ZXJhdGluZyBhIGNvbGQgYm9vdCwgaW4gdGhlIGNhc2UgdGhlIG1hY2hpbmUgYnJpY2tzIGR1ZQ0K
IHRvIGJhZCBjb2RlKSwgYW5kIGFjY2VzcyB0byB0aGUgQk1DIHdlYnNpdGUgd2hlbiBpdCBpcyBp
bnRlZ3JhdGVkLiBJIHRyaWVkIHRvIG1ha2UgdGhlIGNvZGUgbW9kdWxhciBhbmQgdGhlIGFyY2hp
dGVjdHVyZSBpcyB0aGUgZm9sbG93aW5nIG9uZTo8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJz
cDs8L286cD48L3NwYW4+PC9wPg0KPHVsIHN0eWxlPSJtYXJnaW4tdG9wOjBpbiIgdHlwZT0iZGlz
YyI+DQo8bGkgY2xhc3M9Ik1zb0xpc3RQYXJhZ3JhcGgiIHN0eWxlPSJtYXJnaW4tbGVmdDowaW47
bXNvLWxpc3Q6bDAgbGV2ZWwxIGxmbzEiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5B
biBpbnRlcm5ldCBnYXRld2F5IHNlcnZlciB3aGljaCBoYW5kbGVzIGFsbCBpbmNvbWluZyB0cmFm
ZmljIGFuZCByb3V0ZSBpdCB0byB0aGUgcmVsZXZhbnQgZm9sbG93IHVwIHNlcnZlcnM8bzpwPjwv
bzpwPjwvc3Bhbj48L2xpPjxsaSBjbGFzcz0iTXNvTGlzdFBhcmFncmFwaCIgc3R5bGU9Im1hcmdp
bi1sZWZ0OjBpbjttc28tbGlzdDpsMCBsZXZlbDEgbGZvMSI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6
ZToxMS4wcHQiPjEgdG8gTiBjb250cm9sbGVyIG5vZGVzLCB3aGljaCBhcmUgYXR0YWNoZWQgdG8g
YSB0ZXN0IHNlcnZlci4gVGhlIGNvbnRyb2xsZXIgbm9kZSBoYW5kbGUgcmVtb3RlIHBvd2VyIG1h
bmFnZW1lbnQsIGFzIHdlbGwgYXMgY29uc29sZSBhY2Nlc3MsIGFuZCBmbGFzaA0KIGVtdWxhdG9y
cyB3aGljaCBhcmUgcGh5c2ljYWxseSBjb25uZWN0ZWQgdG8gdGhlIFNQSSBidXMgb2YgdGhlIHRl
c3QgbWFjaGluZS48bzpwPjwvbzpwPjwvc3Bhbj48L2xpPjx1bCBzdHlsZT0ibWFyZ2luLXRvcDow
aW4iIHR5cGU9ImNpcmNsZSI+DQo8bGkgY2xhc3M9Ik1zb0xpc3RQYXJhZ3JhcGgiIHN0eWxlPSJt
YXJnaW4tbGVmdDowaW47bXNvLWxpc3Q6bDAgbGV2ZWwyIGxmbzEiPjxzcGFuIHN0eWxlPSJmb250
LXNpemU6MTEuMHB0Ij5BdHRhY2hlZCB0byBlYWNoIGNvbnRyb2xsZXIgbm9kZSB0aGVyZSBpcyBh
IGNvbXBpbGUgbWFjaGluZSB3aGljaCBpcyB1c2VkIHRvIGNvbXBpbGUgZWl0aGVyIGxpbnV4Ym9v
dCBvciBPcGVuQk1DIChPcGVuQk1DIGlzIHRoZSByZWFzb24gb2YgdGhpcyBlbWFpbCksDQogaW4g
dGhlIGNhc2UgdGhlIHVzZXIgZG8gbm90IHJlY29tcGlsZSB0aGVtIGJ1dCBqdXN0IGRldmVsb3Ag
dGhlIGNvZGUuIFdoZW4gdGhlIGJ1aWx0IGlzIGRvbmUgaXQgaXMgdHJhbnNmZXJyZWQgdG8gdGhl
IENUUkwgd2hpY2ggaXMgbG9hZGluZyB0byB0aGUgbGl2ZSBtYWNoaW5lLiBUaGVyZSBpcyBhbHNv
IDEgcHJlLWJ1aWx0IGltYWdlIHdoaWNoIGNhbiBiZSB1c2VkIChpZiB5b3UgYXJlIGRldmVsb3Bp
bmcgb25seSBsaW51eGJvb3Qgb3Igb25seQ0KIG9wZW5ibWMsIHlvdSBzdGlsbCBjYW4gdGVzdCB0
aGUgd2hvbGUgc3RhY2spPG86cD48L286cD48L3NwYW4+PC9saT48L3VsPg0KPC91bD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNw
OzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjExLjBwdCI+U28gdGhlIG1pbmltYWwgc2V0dXAgcmVxdWlyZXMgNCBzZXJ2ZXJzLCB3
aGljaCBjb3VsZCBsb29rIGxpa2UgYSBsb3QsIGJ1dCBzb21lIG9mIHRoZW0gY291bGQgYmUgdmVy
eSBiYXNpYyAobGlrZSB0aGUgY29udHJvbGxlciBub2RlIGFuZCB0aGUgZ2F0ZXdheSkuPG86cD48
L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5NeSBtYWluIGdvYWwgaXMgdG8g
YmUgYWJsZSB0byBvZmZlciBkZXZlbG9wbWVudCBjYXBhY2l0eSBmcm9tIGEgbGFwdG9wLCBhbmQg
dG8gYW55IGZpcm13YXJlIGRldmVsb3BlcnMgd2hhdGV2ZXIgdGhlIGxvY2F0aW9uIGhlL3NoZSB3
aWxsIGJlLiBJIGZvdW5kIGl0IHByZXR0eSB1c2VmdWwgZHVyaW5nIHRoaXMgdG91Z2ggbW9tZW50
IHRoYXQgd2UgbGl2ZSB3aXRoDQogdGhlIHBhbmRlbWljLjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpw
PiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOjExLjBwdCI+TXkgc2Vjb25kYXJ5IGdvYWwgaXMgdG8gYXV0b21hdGl6ZSBs
aXZlIHRlc3Rpbmcgb24gcmVhbCBoYXJkd2FyZSBhbmQgcHJvYmFibHkgaW50ZXJmYWNlIHRoZSBD
VFJMIHBvb2wgdG8gYSBSb2JvdCBzZXJ2ZXIgKA0KPC9zcGFuPjxhIGhyZWY9Imh0dHBzOi8vcm9i
b3RmcmFtZXdvcmsub3JnLyI+aHR0cHM6Ly9yb2JvdGZyYW1ld29yay5vcmcvPC9hPiApLiBUaGlz
IHBhcnQgc3RpbGwgbmVlZCB0byBiZSBkZXZlbG9wZWQsIGFuZCB0aGUgY3VycmVudCBBUEkgaGFz
IHRoZSBiYXNpYyBjb2RpbmcgdG8gc3VwcG9ydCBpdCwgYnV0IHNlcmlvdXNseSBuZWVkIHJlbmFt
aW5nLCBhbmQgY29udmVudGlvbiBidWlsZCB1cC48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpw
Pjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjExLjBwdCI+RXZlcnl0aGluZyBpcyB3cml0dGVuIGluIEdvbGFuZyAoYSBsb3Qgb2YgYmFkIHNo
ZWxsIHNjcmlwdHMgYXJlIHN0aWxsIGhlcmUsIGJ1dCBJIGFtIHdvcmtpbmcgYXQgcmVtb3Zpbmcg
dGhlbSB3aXRoIHRpbWUgZ29pbmcgb24pLjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwv
bzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1z
aXplOjExLjBwdCI+SSBhbSBjdXJyZW50bHkgdW5kZXIgdGhlIHByb2Nlc3MgdG8gYWRhcHQgaXQg
dG8gT3BlbkJNQy4gVGhlIHNvdXJjZSBjb2RlIGlzIHB1YmxpYyAoaHR0cHM6Ly9naXRodWIuY29t
L0hld2xldHRQYWNrYXJkL29zZmNpKSAuIEZlZWwgZnJlZSB0byBmb3JrIHRoYXQgdG9vbCwgYW5k
IHBpbmcgbWUgaWYgeW91IG5lZWQgdG8ga25vdyBob3cgdG8gc2V0dXAgeW91cg0KIG93biBDSSwg
dGhpcyBpcyBhbHNvIGEgZ29vZCBlZHVjYXRpb24gdG9vbCB0byBkZW1vbnN0cmF0ZSB0aGUgZWZm
aWNpZW5jeSBvZiBvdXIgd29yayB3aXRoIGxpdmUgc3lzdGVtLCB0aGF0IHlvdSBjYW4gdGVzdC4g
SSBkbyBoYXZlIGEgY291cGxlIG9mIGVuZCB1c2VycyB3aGljaCBhcmUgZGlzY292ZXJpbmcgT3Bl
biBTb3VyY2UgRmlybXdhcmUgdGhyb3VnaCB0aGF0IHRvb2wgYW5kIG15IGd1aWRhbmNlLjxvOnA+
PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250
LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+VGhlIGRlbW8gaW1hZ2UgaXMg
dXNpbmcgb3VyIHN0YW5kYXJkIGxvZ2luL3Bhc3N3b3JkIHNjaGVtZS48bzpwPjwvbzpwPjwvc3Bh
bj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBw
dCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPk15IGN1cnJlbnQgY2hhbGxlbmdlIHdpdGggT3Bl
bkJNQyBpcyByZWxhdGVkIHRvIGJ1aWxkIHRpbWUgYW5kIG5vdCBjb21wZXRlIHdpdGggdGhlIGV4
aXN0aW5nIGluZnJhc3R1Y3R1cmUgYnV0IG1vcmUgYmVpbmcgaW50ZWdyYXRlZCB0byBpdC4gSSB0
cmllZCB0byB1bmRlcnN0YW5kIGhvdyB3ZSB0ZXN0IG5ldyBwdWxsIHJlcXVlc3QgYW5kIGl0IGxv
b2tzIGxpa2UNCiB0aGF0IHdlIGFyZSB1c2luZyBKZW5raW5zLiBJIGhhdmUgbm8gZXhwZXJpZW5j
ZSB3aXRoIGl0LCBidXQgdGhhdCBpcyBmaW5lIChJIHVzZWQgdHJhdmlzY2kgYW5kIEFwcHZleW9y
Y2kpLg0KPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4g
c3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5UaGUgY29t
cGlsZSBub2RlIGludG8gbXkgY3VycmVudCBDSSwgY291bGQgYmUgcnVubmluZyBhIGplbmtpbnMg
YnVpbGQgaW5zdGFuY2UgKG5vdCBzdXJlIGFib3V0IHRoZSBjb252ZW50aW9uKSwgdGhpcyB3aWxs
IHJlcXVpcmVzIHRoYXQgSSBidWlsZCBhbHNvIHRoZSBsaW5reGJvb3Qgc2lkZSB3aXRoIHRoZSBz
YW1lIHRvb2wuIEkgY2FuIHByb2JhYmx5IGFkYXB0DQogdGhhdC4gQXMgb2Ygbm93LCB0aGUgYnVp
bGQgcHJvY2VzcyBydW4gaW50byAyIGRpZmZlcmVudCBkb2NrZXJzIGluc3RhbmNlLCB3aGljaCBh
cmUgcHJldHR5IGVmZmljaWVudC4gVGhlIGZyb20gc2NyYXRjaCBidWlsZCBmb3IgT3BlbkJNQyBs
YXN0IGFib3V0IDQ0IG1pbnV0ZXMgd2hlbiBJIGJ1aWxkIGV2ZXJ5dGhpbmcgZnJvbSBzY3JhdGNo
IChpbiBtZW1vcnkgZmlsZSBzeXN0ZW0pLiBUaGF0IGlzIGEgbG9uZyB0aW1lLCB3aGljaCB3aWxs
IHJlcXVpcmUNCiBlaXRoZXIgYSBiYXRjaCBzY2hlZHVsZXIsIG9yIHVzaW5nIEplbmtpbnMgYXMg
aXQuIEkgY2FuIGFjY2VsZXJhdGUgdGhhdCB1c2luZyBhIG5vbi1jbGVhbiBzdGF0ZSBjYWNoZSwg
YnV0IHRoaXMgaXMgbm90IHJlYWxseSBteSB0YXJnZXQgYXQgdGhlIHByZXNlbnQgdGltZS4gKGZl
ZWwgZnJlZSB0byBjb252aW5jZSBtZSBJIGFtIHN0dXBpZCwgYW5kIEkgc2hhbGwgdXNlIGl0ICEp
PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9
ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5SaWdodCBub3cgbXkg
cHJvY2VzcyBpcyB2ZXJ5IGludGVyYWN0aXZlLCB0aGUgZW5kIHVzZXIgaXMgZ2V0dGluZyBhY2Nl
c3MgdG8gMSBjdHJsIG5vZGUgKHRocm91Z2ggYSB3ZWJwYWdlKSwgYW5kIGZyb20gdGhlcmUgaGUg
aGFzIDMwIG1pbnV0ZXMgYWxsb2NhdGlvbiB0byBlaXRoZXIgdXBsb2FkIGEgcHJlLWV4aXN0aW5n
IGJ1aWxkLCBvciBzcGVjaWZ5IGhpcy9oZXINCiBnaXRodWIgcmVwbywgcGx1cyBhIGJyYW5jaCwg
dG8ga2ljayBhIGZ1bGwgYnVpbGQgb2YgbGludXhib290LiBUaGF0IGlzIG9rIHdpdGggbGludXhi
b290IGFzIHRoZSBidWlsZCB0aW1lIGlzIGFib3V0IDQgbWludXRlcyBvciBsZXNzIChmcm9tIHNj
cmF0Y2gpLiAmbmJzcDtJdCBpcyBub3Qgd2l0aCBPcGVuQk1DLjxvOnA+PC9vOnA+PC9zcGFuPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48
bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBz
dHlsZT0iZm9udC1zaXplOjExLjBwdCI+U28gSSBkbyBoYXZlIGEgY291cGxlIG9mIHF1ZXN0aW9u
czo8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHVsIHN0
eWxlPSJtYXJnaW4tdG9wOjBpbiIgdHlwZT0iZGlzYyI+DQo8bGkgY2xhc3M9Ik1zb0xpc3RQYXJh
Z3JhcGgiIHN0eWxlPSJtYXJnaW4tbGVmdDowaW47bXNvLWxpc3Q6bDAgbGV2ZWwxIGxmbzEiPjxz
cGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5Eb2VzIHRoZSBKZW5raW5zIGJ1aWxkIGNvdWxk
IGJlIG1hZGUgaW50byBhIERvY2tlciBpbWFnZSBrbm93aW5nIHRoYXQgbXkgY29tcGlsZSBub2Rl
IHJ1bnMgdW5kZXIgVWJ1bnR1IChJIGJlbGlldmUgMTguMDQpPG86cD48L286cD48L3NwYW4+PC9s
aT48bGkgY2xhc3M9Ik1zb0xpc3RQYXJhZ3JhcGgiIHN0eWxlPSJtYXJnaW4tbGVmdDowaW47bXNv
LWxpc3Q6bDAgbGV2ZWwxIGxmbzEiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5Db3Vs
ZCB3ZSBmaW5kIGEgd2F5IHdoZW4gb3VyIEplbmtpbnMgY2x1c3RlciBidWlsZCBpcyBkb25lIHRv
IGV4dHJhY3QgdGhlIGJ1aWxkIHJlc3VsdCwgYXV0b21hdGl6ZSB0aGUgdHJhbnNmZXIgb2YgaXQg
dG8gcGVyaGFwcyBhbiBvYmplY3Qgc3RvcmFnZSBwb29sDQogd2l0aCBhIHVuaXF1ZSBVVUlEIGlk
ZW50aWZpZXIuIFRoZSBjaGFsbGVuZ2Ugd2lsbCBiZSB0byByZXRyaWV2ZSB0aGF0IFVVSUQgaW50
byB0aGUgZ2Vycml0IHBhZ2UsIG9yIHRoZSBKZW5raW5zIGxvZy48bzpwPjwvbzpwPjwvc3Bhbj48
L2xpPjxsaSBjbGFzcz0iTXNvTGlzdFBhcmFncmFwaCIgc3R5bGU9Im1hcmdpbi1sZWZ0OjBpbjtt
c28tbGlzdDpsMCBsZXZlbDEgbGZvMSI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPklm
IHRoZSBidWlsZCBpcyBzdWNjZXNzZnVsLCB0aGUgZW5kIHVzZXIgY291bGQgdXNlIHRoYXQgdW5p
cXVlIFVVSUQgdG8gdGVzdCBvbiBhIGxpdmUgc3lzdGVtLiBUaGUgb3NmY2kgc3lzdGVtIHdpbGwg
dGhlbiBleHRyYWN0IGZyb20gdGhlIG9iamVjdCBzdG9yYWdlDQogYmFja2VuZCB0aGUgYnVpbGQg
cmVzdWx0cyBhbmQgYm9vdHN0cmFwIGl0IG9uIHRoZSBmaXJzdCBDVFJMIG5vZGUgYXZhaWxhYmxl
LjxvOnA+PC9vOnA+PC9zcGFuPjwvbGk+PGxpIGNsYXNzPSJNc29MaXN0UGFyYWdyYXBoIiBzdHls
ZT0ibWFyZ2luLWxlZnQ6MGluO21zby1saXN0OmwwIGxldmVsMSBsZm8xIj48c3BhbiBzdHlsZT0i
Zm9udC1zaXplOjExLjBwdCI+VGhlbiBhbiBpbnRlcmFjdGl2ZSBzZXNzaW9uIGNvdWxkIHN0YXJ0
LCBvciB0aGUgcm9ib3QgZnJhbWV3b3JrIHN5c3RlbSBjb3VsZCBoYXZlIGEgbG9vayB0byB0aGUg
cmVzdWx0cyBhbmQgZmVlZGJhY2sgamVua2lucywgb3IgdGhlIGVuZCB1c2VyPG86cD48L286cD48
L3NwYW4+PC9saT48L3VsPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5JIHdvdWxkIGxpa2UgaW4gZmFj
dCB0byBhdm9pZCB0aGF0IHdlIGNvbXBpbGUgdHdvIHRpbWVzIHRoZSBzYW1lIHRoaW5nLCB0aGF0
IGxvb2sgbGlrZSBzdHVwaWQgdG8gbWUuDQo8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8
L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZToxMS4wcHQiPlJlZ2FyZGluZyB0aGUgb2JqZWN0IHN0b3JhZ2UgcG9vbCwgSSBtdXN0IGFk
bWl0IHRoYXQgSSBsaWtlIHRoZSBtaW5pbyBwcm9qZWN0IHdoaWNoIGlzIGNvbXBhdGlibGUgd2l0
aCBzMyBzdG9yYWdlIEFQSS4gU28gaWYgdGhhdCBpcyBzb21ldGhpbmcgd2hpY2ggc2VlbXMgcmVh
c29uYWJsZSB0byB5b3UsIEkgY2FuIHdvcmsgb24gYnVpbGRpbmcgdXAgdGhhdA0KIGJhY2tlbmQu
IFdlIGNvdWxkIGRlY2lkZSB0byBrZWVwIGJ1aWxkIGRvbmUgZHVyaW5nIHRoZSBwYXN0IDMwIGRh
eXMsIGFuZCByZW1vdmUgdGhlbSBhZnRlciB0aGF0IHBlcmlvZC48bzpwPjwvbzpwPjwvc3Bhbj48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+
PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4g
c3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkxldCBtZSBrbm93IHlvdXIgdGhvdWdodHMgPzxvOnA+
PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250
LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+SSBiZWxpZXZlIGlmIHdlIGhh
dmUgYW4gaW50ZWdyYXRlZCBkZXZlbG9wbWVudCBlbnZpcm9ubWVudCB3ZSBtaWdodCBiZSByZWR1
Y2luZyB0aGUgbnVtYmVyIG9mIGZvcmtzIG9mIHRoZSBwcm9qZWN0LCBhbmQgaG9wZWZ1bGx5IGhh
dmUgcXVpY2tlciB1cHN0cmVhbSByZXF1ZXN0LCByZWR1Y2luZyB0aGUgcGFpbiB0byBpbnRlZ3Jh
dGUgZWl0aGVyIG9sZCBjb2RlLA0KIG9yIGhhbmRsaW5nIG1lcmdlIGNvbmZsaWN0cy4gVGhpcyBp
cyBub3QgZml4aW5nIHRoZSDigJxzZWNyZXTigJ0gYXNwZWN0IHdlIG1pZ2h0IGJlIHN0cnVnZ2xp
bmcgd2l0aCBzb21lIHN5c3RlbXMgdW5kZXIgZGVzaWduLCBidXQgdGhpcyBpcyBhbm90aGVyIHN0
b3J5LjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0
eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+dmVqbWFyaWU8
bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_B50DC7EFD1F74D7FB502DEA4EA2A6145hpecom_--
