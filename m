Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A7E64F1B
	for <lists+openbmc@lfdr.de>; Thu, 11 Jul 2019 01:11:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kZgV5CvfzDqV8
	for <lists+openbmc@lfdr.de>; Thu, 11 Jul 2019 09:11:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ni.com
 (client-ip=148.163.158.57; helo=mx0b-00010702.pphosted.com;
 envelope-from=prvs=8093ea9614=joseph.hershberger@ni.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ni.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nio365.onmicrosoft.com header.i=@nio365.onmicrosoft.com
 header.b="HgT/cupI"; dkim-atps=neutral
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.158.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jzdD6nNzzDqY6
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jul 2019 09:52:14 +1000 (AEST)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
 by mx0b-00010702.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x69NKfEj004297
 for <openbmc@lists.ozlabs.org>; Tue, 9 Jul 2019 18:22:42 -0500
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2050.outbound.protection.outlook.com [104.47.36.50])
 by mx0b-00010702.pphosted.com with ESMTP id 2tmvgks8sp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 09 Jul 2019 18:22:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector1-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvfH8/ROdAEk9MbQDjKjP+RtSqTPjQ9/3wgP3fbX9Jk=;
 b=HgT/cupIxQVszOcKhWIPt4N+S3wDdEX9gRlG+2xgWEVPZ59Tq4XiF41ruE0tjJjm5wN50hDr399iOAf55qZuNZhgS0PBh4n2ZpDC8gZ0VgzR+zJSxlnvtyUGLriuo23HDQYoTLDt3ef5xCJTihUAPZCN+mL5j6lRFALxmqX4X/s=
Received: from DM5PR04MB0381.namprd04.prod.outlook.com (10.173.169.144) by
 DM5PR04MB1098.namprd04.prod.outlook.com (10.174.242.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.17; Tue, 9 Jul 2019 23:22:41 +0000
Received: from DM5PR04MB0381.namprd04.prod.outlook.com
 ([fe80::3927:cd59:a4b8:5dad]) by DM5PR04MB0381.namprd04.prod.outlook.com
 ([fe80::3927:cd59:a4b8:5dad%3]) with mapi id 15.20.2052.010; Tue, 9 Jul 2019
 23:22:41 +0000
From: Joe Hershberger <joe.hershberger@ni.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Subject: Re: [U-Boot] [PATCH v2 1/4] phy: Add support for the NC-SI protocol
Thread-Topic: [U-Boot] [PATCH v2 1/4] phy: Add support for the NC-SI protocol
Thread-Index: AQHVNq0zLPtveytFyUu9ZAGIbZyrLw==
Date: Tue, 9 Jul 2019 23:22:40 +0000
Message-ID: <CANr=Z=b48z5mKe1FDLUtj5iYQ5BrSmdWmTrzX_4D3xNmrreL3Q@mail.gmail.com>
References: <20190618013720.2823-1-sam@mendozajonas.com>
 <20190618013720.2823-2-sam@mendozajonas.com>
In-Reply-To: <20190618013720.2823-2-sam@mendozajonas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CH2PR10CA0025.namprd10.prod.outlook.com
 (2603:10b6:610:4c::35) To DM5PR04MB0381.namprd04.prod.outlook.com
 (2603:10b6:3:9e::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-gm-message-state: APjAAAWUPKWll/NCPKzj7Ehqtm/kFOZd3MpVzYo1rLyT+qtZ3rugZbg8
 2brVAaez74ve5OdUAowpmyQC5OtODzVVOJyO0t0=
x-google-smtp-source: APXvYqw7FjRxiYyH6lQn6cLT+ToTfMos8T5nDWYlQNsyNS8TlZoq4zxP5aT/G6JbdBkL+6NpwxSpjQAh8FnindXCc5A=
x-received: by 2002:a02:c90d:: with SMTP id t13mr30267700jao.62.1562714559146; 
 Tue, 09 Jul 2019 16:22:39 -0700 (PDT)
x-gmail-original-message-id: <CANr=Z=b48z5mKe1FDLUtj5iYQ5BrSmdWmTrzX_4D3xNmrreL3Q@mail.gmail.com>
x-originating-ip: [209.85.166.47]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 455b44e7-402f-495b-5678-08d704c45648
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5PR04MB1098; 
x-ms-traffictypediagnostic: DM5PR04MB1098:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <DM5PR04MB10989283D780BE89F3D10158F6F10@DM5PR04MB1098.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(346002)(39860400002)(376002)(136003)(366004)(199004)(189003)(478600001)(316002)(102836004)(229853002)(53936002)(26005)(9686003)(8936002)(8676002)(966005)(66556008)(81166006)(66476007)(3846002)(6862004)(446003)(6486002)(6306002)(64756008)(66446008)(6436002)(498394004)(6512007)(5660300002)(66946007)(186003)(81156014)(486006)(76176011)(43066004)(66066001)(14454004)(6246003)(68736007)(99286004)(53546011)(386003)(95326003)(52116002)(71190400001)(6506007)(11346002)(476003)(61726006)(256004)(54906003)(25786009)(2906002)(305945005)(7736002)(61266001)(4326008)(55446002)(6116002)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR04MB1098;
 H:DM5PR04MB0381.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: ni.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /pM1ZCjzXbF3tFhmKGIFYriiWz4ymBRoylSLTGzQxhGs2LrqZ4V51IrId1S8Xbwasc61bIJLOtDMgJhvLbCaiNe8TznTOfdtsewsqYPYt5ULfmCFPfP+FCfjrWe61fyi3COrlPiXB/QIQ7ncr8A2s2GdMUm5pIWLgR+pv1RW5Rn0kiECASlZaw8wZ5tTY4WsXb92lTfkpn3uYnLJYkiiQghnvUFZr186zb4J0PB0yCZg+WIGITWIDND9jUc+PA1v1qas9uV1Rw2fKtR2ky6NIXDPjgjVbG4n46Uzk3DAsSLh8UyGBThAKzAY85WHhSMtIhDq0AxkDxjTJcuShvsH/VDTIDvpBh0YVKis2RkXV40TwWoWPLES6n+4QRhCBn0X/GT2TQRtfAejM8xD9styELy0RhaQhF66k89k+Vd8+PE=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3FB973007ACC2E4CA81BF524611FD075@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 455b44e7-402f-495b-5678-08d704c45648
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 23:22:40.8430 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: joseph.hershberger@ni.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB1098
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-09_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
 score=30
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907090279
X-Mailman-Approved-At: Thu, 11 Jul 2019 09:08:06 +1000
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
Reply-To: joe.hershberger@ni.com
Cc: u-boot <u-boot@lists.denx.de>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Joseph Hershberger <joseph.hershberger@ni.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgODozOSBQTSBTYW11ZWwgTWVuZG96YS1Kb25hcw0KPHNh
bUBtZW5kb3pham9uYXMuY29tPiB3cm90ZToNCj4NCj4gVGhpcyBpbnRyb2R1Y2VzIHN1cHBvcnQg
Zm9yIHRoZSBOQy1TSSBwcm90b2NvbCwgbW9kZWxsZWQgYXMgYSBwaHkgZHJpdmVyDQo+IGZvciBv
dGhlciBldGhlcm5ldCBkcml2ZXJzIHRvIGNvbnN1bWUuDQo+DQo+IE5DLVNJIChOZXR3b3JrIENv
bnRyb2xsZXIgU2lkZWJhbmQgSW50ZXJmYWNlKSBpcyBhIHByb3RvY29sIHRvIG1hbmFnZSBhDQo+
IHNpZGViYW5kIGNvbm5lY3Rpb24gdG8gYSBwcm9wZXIgbmV0d29yayBpbnRlcmZhY2UsIGZvciBl
eGFtcGxlIGEgQk1DDQo+IChCYXNlYm9hcmQgTWFuYWdlbWVudCBDb250cm9sbGVyKSBzaGFyaW5n
IHRoZSBOSUMgb2YgdGhlIGhvc3Qgc3lzdGVtLg0KPiBQcm9iaW5nIGFuZCBjb25maWd1cmF0aW9u
IG9jY3VycyBieSBjb21tdW5pY2F0aW5nIHdpdGggdGhlICJyZW1vdGUiIE5JQw0KPiB2aWEgTkMt
U0kgY29udHJvbCBmcmFtZXMgKEV0aGVybmV0IGhlYWRlciAweDg4ZjgpLg0KPg0KPiBUaGlzIGlt
cGxlbWVudGF0aW9uIGlzIHJvdWdobHkgYmFzZWQgb24gdGhlIHVwc3RyZWFtIExpbnV4DQo+IGlt
cGxlbWVudGF0aW9uWzBdLCB3aXRoIGEgcmVkdWNlZCBmZWF0dXJlIHNldCBhbmQgYW4gZW1waGFz
aXMgb24gZ2V0dGluZw0KPiBhIGxpbmsgdXAgYXMgZmFzdCBhcyBwb3NzaWJsZSByYXRoZXIgdGhh
biBwcm9iaW5nIHRoZSBmdWxsIHBvc3NpYmxlDQo+IHRvcG9sb2d5IG9mIHRoZSBidXMuDQo+IFRo
ZSBjdXJyZW50IHBoeSBtb2RlbCByZWxpZXMgb24gdGhlIG5ldHdvcmsgYmVpbmcgInVwIiwgc2Vu
ZGluZyBOQy1TSQ0KPiBjb21tYW5kIGZyYW1lcyB2aWEgbmV0X3NlbmRfcGFja2V0KCkgYW5kIHJl
Y2VpdmluZyB0aGVtIGZyb20gdGhlDQo+IG5ldF9sb29wKCkgbG9vcCAoYWRkZWQgaW4gYSBmb2xs
b3dpbmcgcGF0Y2gpLg0KPg0KPiBUaGUgbmNzaS1wa3QuaCBoZWFkZXJbMV0gaXMgY29waWVkIGZy
b20gdGhlIExpbnV4IGtlcm5lbCBmb3IgY29uc2lzdGVudA0KPiBmaWVsZCBkZWZpbml0aW9ucy4N
Cj4NCj4gWzBdOiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvdHJlZS9tYXN0ZXIv
bmV0L25jc2kNCj4gWzFdOiBodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi9t
YXN0ZXIvbmV0L25jc2kvbmNzaS1wa3QuaA0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgTWVu
ZG96YS1Kb25hcyA8c2FtQG1lbmRvemFqb25hcy5jb20+DQoNCkFja2VkLWJ5OiBKb2UgSGVyc2hi
ZXJnZXIgPGpvZS5oZXJzaGJlcmdlckBuaS5jb20+DQo=
