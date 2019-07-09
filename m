Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCE364F16
	for <lists+openbmc@lfdr.de>; Thu, 11 Jul 2019 01:10:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kZfF6Q7qzDqhD
	for <lists+openbmc@lfdr.de>; Thu, 11 Jul 2019 09:10:13 +1000 (AEST)
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
 header.b="a56FHAY4"; dkim-atps=neutral
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.158.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jz6N5wLNzDqWT
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jul 2019 09:28:59 +1000 (AEST)
Received: from pps.filterd (m0098778.ppops.net [127.0.0.1])
 by mx0b-00010702.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x69NQZB9016724
 for <openbmc@lists.ozlabs.org>; Tue, 9 Jul 2019 18:28:57 -0500
Received: from nam05-co1-obe.outbound.protection.outlook.com
 (mail-co1nam05lp2050.outbound.protection.outlook.com [104.47.48.50])
 by mx0b-00010702.pphosted.com with ESMTP id 2tjrm09gxn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 09 Jul 2019 18:28:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector1-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dosIaP9aHwPYU5iXNfWD5TEsQimoXmp5qycMcdsJD1k=;
 b=a56FHAY4Tiv6Y1oCZXbf+7yTk72Re29XpAi24WJ0iKXA3oWeSyCkjgpbEaEe7vlrV/d+0kXAcqeEJb/9nMVndjTfAr323eAIe0O6qpuXVm/7OUQirXVD3YzZ/jDJ0+/s6ujnp2ZIUCnFGKW97Mn7JzN18geISiQev1ctTIXNZhY=
Received: from DM5PR04MB0381.namprd04.prod.outlook.com (10.173.169.144) by
 DM5SPR01MB02.namprd04.prod.outlook.com (10.167.108.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Tue, 9 Jul 2019 23:28:54 +0000
Received: from DM5PR04MB0381.namprd04.prod.outlook.com
 ([fe80::3927:cd59:a4b8:5dad]) by DM5PR04MB0381.namprd04.prod.outlook.com
 ([fe80::3927:cd59:a4b8:5dad%3]) with mapi id 15.20.2052.010; Tue, 9 Jul 2019
 23:28:54 +0000
From: Joe Hershberger <joe.hershberger@ni.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Subject: Re: [U-Boot] [PATCH v2 3/4] net/ftgmac100: Add NC-SI mode support
Thread-Topic: [U-Boot] [PATCH v2 3/4] net/ftgmac100: Add NC-SI mode support
Thread-Index: AQHVNq4SM3+th/iL1kipNmQ4Y4NC5g==
Date: Tue, 9 Jul 2019 23:28:54 +0000
Message-ID: <CANr=Z=aP+jgjzgPBER20A8zdvOj4A=ETbi_tedSbNUSFhOioEw@mail.gmail.com>
References: <20190618013720.2823-1-sam@mendozajonas.com>
 <20190618013720.2823-4-sam@mendozajonas.com>
In-Reply-To: <20190618013720.2823-4-sam@mendozajonas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CH2PR05CA0020.namprd05.prod.outlook.com (2603:10b6:610::33)
 To DM5PR04MB0381.namprd04.prod.outlook.com
 (2603:10b6:3:9e::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-gm-message-state: APjAAAWfJqbsQlch8pDRDV6Gx3DdTAB8KXMgK8HOyZmm4/rS6lqWRm+Q
 kw08xp/3A49Ans5LvTYYkQoWQYRG4Ysf+JtLOGw=
x-google-smtp-source: APXvYqytae+ykgvYmj1TF4CMzINbz34afbElAUoQIn3hmHJIUjkWh0dYaU7OLnS0jVt1Vsl5fGDpeeNiazAq8RC9wdM=
x-received: by 2002:a5d:8759:: with SMTP id
 k25mr26504582iol.307.1562714933249; Tue, 09 Jul 2019 16:28:53 -0700 (PDT)
x-gmail-original-message-id: <CANr=Z=aP+jgjzgPBER20A8zdvOj4A=ETbi_tedSbNUSFhOioEw@mail.gmail.com>
x-originating-ip: [209.85.166.48]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b17bf78-0358-42fd-c7e5-08d704c53510
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5SPR01MB02; 
x-ms-traffictypediagnostic: DM5SPR01MB02:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5SPR01MB029CEC41CC29407A008109F6F10@DM5SPR01MB02.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(346002)(136003)(396003)(376002)(199004)(189003)(966005)(14444005)(2906002)(256004)(446003)(6862004)(14454004)(81156014)(476003)(81166006)(55446002)(99286004)(25786009)(26005)(95326003)(54906003)(305945005)(7736002)(71190400001)(66446008)(43066004)(316002)(5660300002)(52116002)(6246003)(76176011)(498394004)(68736007)(3846002)(6506007)(6486002)(186003)(486006)(71200400001)(66066001)(8676002)(66946007)(4326008)(6436002)(64756008)(66556008)(66476007)(6306002)(386003)(8936002)(61726006)(53936002)(53546011)(229853002)(9686003)(61266001)(6512007)(102836004)(478600001)(11346002)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5SPR01MB02;
 H:DM5PR04MB0381.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: ni.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bCTfUwnCUJZs4W2ZvMkgTXymrHaPsH75sVe3SNTqPMXBJiFFjwowaGVLG109ABbNI4bTcNaJ46A8ccVtw3aZSiRPNIQLvli3kkgzE5PIZamL4xA/lIq4Id1bzCrMDk0Q/iL+dGpfbLkBF30MYoLMtXYbtwfamYDcXwx2TGJxqKM3lheaF//Bgpx4N8G7qBJb2+FTA20lY5uK58H/n+BtsfKRiTn+AIInXsveJ4ri0iE76yKsZssPcluGlLzhs1TCD6UZfK3iNpWcQ0ZxNAshgE2TubBGkNPShmYY5H/61p5vidZiTGVV6vb+78Y+LLJ+TRKkK6Gu8+9OceXGi2itbDgTNd7/PKO182WnQEcao/ftMxkbxulyWZT1/VhlxUlbohemHeBx6s8nubr8sTFlfKUHMKk7NZZEGdDacseYHqM=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C2C0BD064DF8E41B2EE07E3DD07CC36@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b17bf78-0358-42fd-c7e5-08d704c53510
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 23:28:54.4237 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: joseph.hershberger@ni.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5SPR01MB02
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-09_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
 score=30
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907090280
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

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgODo0MyBQTSBTYW11ZWwgTWVuZG96YS1Kb25hcw0KPHNh
bUBtZW5kb3pham9uYXMuY29tPiB3cm90ZToNCj4NCj4gVXBkYXRlIHRoZSBmdGdtYWMxMDAgZHJp
dmVyIHRvIHN1cHBvcnQgTkMtU0kgaW5zdGVhZCBvZiBhbiBtZGlvIHBoeQ0KPiB3aGVyZSBhdmFp
bGFibGUuIFRoaXMgaXMgYSBjb21tb24gc2V0dXAgZm9yIEFzcGVlZCBBU1QyeDAwIHBsYXRmb3Jt
cy4NCj4NCj4gTkMtU0kgbW9kZSBpcyBkZXRlcm1pbmVkIGZyb20gdGhlIGRldmljZS10cmVlIGlm
IGVpdGhlciBwaHktbW9kZSBzZXRzIGl0DQo+IG9yIHRoZSB1c2UtbmNzaSBwcm9wZXJ0eSBleGlz
dHMuIElmIHNldCB0aGVuIG5vcm1hbCBtZGlvIHNldHVwIGlzDQo+IHNraXBwZWQgaW4gZmF2b3Vy
IG9mIHRoZSBOQy1TSSBwaHkuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBNZW5kb3phLUpv
bmFzIDxzYW1AbWVuZG96YWpvbmFzLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL25ldC9mdGdtYWMx
MDAuYyB8IDM5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQ0KPiAgMSBm
aWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9uZXQvZnRnbWFjMTAwLmMgYi9kcml2ZXJzL25ldC9mdGdtYWMxMDAu
Yw0KPiBpbmRleCA5MmMzOGE4MWJkLi5jMDEwMGU5MWM3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L25ldC9mdGdtYWMxMDAuYw0KPiArKysgYi9kcml2ZXJzL25ldC9mdGdtYWMxMDAuYw0KPiBAQCAt
MTgsNiArMTgsNyBAQA0KPiAgI2luY2x1ZGUgPHdhaXRfYml0Lmg+DQo+ICAjaW5jbHVkZSA8bGlu
dXgvaW8uaD4NCj4gICNpbmNsdWRlIDxsaW51eC9pb3BvbGwuaD4NCj4gKyNpbmNsdWRlIDxuZXQv
bmNzaS5oPg0KPg0KPiAgI2luY2x1ZGUgImZ0Z21hYzEwMC5oIg0KPg0KPiBAQCAtODEsNiArODIs
NyBAQCBzdHJ1Y3QgZnRnbWFjMTAwX2RhdGEgew0KPiAgICAgICAgIHN0cnVjdCBtaWlfZGV2ICpi
dXM7DQo+ICAgICAgICAgdTMyIHBoeV9tb2RlOw0KPiAgICAgICAgIHUzMiBtYXhfc3BlZWQ7DQo+
ICsgICAgICAgYm9vbCBuY3NpX21vZGU7DQo+DQo+ICAgICAgICAgc3RydWN0IGNsa19idWxrIGNs
a3M7DQo+DQo+IEBAIC0xODEsNyArMTgzLDcgQEAgc3RhdGljIGludCBmdGdtYWMxMDBfcGh5X2Fk
anVzdF9saW5rKHN0cnVjdCBmdGdtYWMxMDBfZGF0YSAqcHJpdikNCj4gICAgICAgICBzdHJ1Y3Qg
cGh5X2RldmljZSAqcGh5ZGV2ID0gcHJpdi0+cGh5ZGV2Ow0KPiAgICAgICAgIHUzMiBtYWNjcjsN
Cj4NCj4gLSAgICAgICBpZiAoIXBoeWRldi0+bGluaykgew0KPiArICAgICAgIGlmICghcGh5ZGV2
LT5saW5rICYmICFwcml2LT5uY3NpX21vZGUpIHsNCj4gICAgICAgICAgICAgICAgIGRldl9lcnIo
cGh5ZGV2LT5kZXYsICJObyBsaW5rXG4iKTsNCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRVJF
TU9URUlPOw0KPiAgICAgICAgIH0NCj4gQEAgLTIxNyw3ICsyMTksOCBAQCBzdGF0aWMgaW50IGZ0
Z21hYzEwMF9waHlfaW5pdChzdHJ1Y3QgdWRldmljZSAqZGV2KQ0KPiAgICAgICAgIGlmICghcGh5
ZGV2KQ0KPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7DQo+DQo+IC0gICAgICAgcGh5
ZGV2LT5zdXBwb3J0ZWQgJj0gUEhZX0dCSVRfRkVBVFVSRVM7DQo+ICsgICAgICAgaWYgKCFwcml2
LT5uY3NpX21vZGUpDQo+ICsgICAgICAgICAgICAgICBwaHlkZXYtPnN1cHBvcnRlZCAmPSBQSFlf
R0JJVF9GRUFUVVJFUzsNCj4gICAgICAgICBpZiAocHJpdi0+bWF4X3NwZWVkKSB7DQo+ICAgICAg
ICAgICAgICAgICByZXQgPSBwaHlfc2V0X3N1cHBvcnRlZChwaHlkZXYsIHByaXYtPm1heF9zcGVl
ZCk7DQo+ICAgICAgICAgICAgICAgICBpZiAocmV0KQ0KPiBAQCAtMjc1LDcgKzI3OCw4IEBAIHN0
YXRpYyB2b2lkIGZ0Z21hYzEwMF9zdG9wKHN0cnVjdCB1ZGV2aWNlICpkZXYpDQo+DQo+ICAgICAg
ICAgd3JpdGVsKDAsICZmdGdtYWMxMDAtPm1hY2NyKTsNCj4NCj4gLSAgICAgICBwaHlfc2h1dGRv
d24ocHJpdi0+cGh5ZGV2KTsNCj4gKyAgICAgICBpZiAoIXByaXYtPm5jc2lfbW9kZSkNCj4gKyAg
ICAgICAgICAgICAgIHBoeV9zaHV0ZG93bihwcml2LT5waHlkZXYpOw0KPiAgfQ0KPg0KPiAgc3Rh
dGljIGludCBmdGdtYWMxMDBfc3RhcnQoc3RydWN0IHVkZXZpY2UgKmRldikNCj4gQEAgLTUxMyw2
ICs1MTcsNyBAQCBzdGF0aWMgaW50IGZ0Z21hYzEwMF9vZmRhdGFfdG9fcGxhdGRhdGEoc3RydWN0
IHVkZXZpY2UgKmRldikNCj4gICAgICAgICBwZGF0YS0+aW9iYXNlID0gZGV2ZmR0X2dldF9hZGRy
KGRldik7DQo+ICAgICAgICAgcGRhdGEtPnBoeV9pbnRlcmZhY2UgPSAtMTsNCj4gICAgICAgICBw
aHlfbW9kZSA9IGRldl9yZWFkX3N0cmluZyhkZXYsICJwaHktbW9kZSIpOw0KPiArDQo+ICAgICAg
ICAgaWYgKHBoeV9tb2RlKQ0KPiAgICAgICAgICAgICAgICAgcGRhdGEtPnBoeV9pbnRlcmZhY2Ug
PSBwaHlfZ2V0X2ludGVyZmFjZV9ieV9uYW1lKHBoeV9tb2RlKTsNCj4gICAgICAgICBpZiAocGRh
dGEtPnBoeV9pbnRlcmZhY2UgPT0gLTEpIHsNCj4gQEAgLTUzNyw4ICs1NDIsMTMgQEAgc3RhdGlj
IGludCBmdGdtYWMxMDBfcHJvYmUoc3RydWN0IHVkZXZpY2UgKmRldikNCj4gIHsNCj4gICAgICAg
ICBzdHJ1Y3QgZXRoX3BkYXRhICpwZGF0YSA9IGRldl9nZXRfcGxhdGRhdGEoZGV2KTsNCj4gICAg
ICAgICBzdHJ1Y3QgZnRnbWFjMTAwX2RhdGEgKnByaXYgPSBkZXZfZ2V0X3ByaXYoZGV2KTsNCj4g
KyAgICAgICBjb25zdCBjaGFyICpwaHlfbW9kZTsNCj4gICAgICAgICBpbnQgcmV0Ow0KPg0KPiAr
ICAgICAgIHBoeV9tb2RlID0gZGV2X3JlYWRfc3RyaW5nKGRldiwgInBoeS1tb2RlIik7DQo+ICsg
ICAgICAgcHJpdi0+bmNzaV9tb2RlID0gZGV2X3JlYWRfYm9vbChkZXYsICJ1c2UtbmNzaSIpIHx8
DQo+ICsgICAgICAgICAgICAgICAocGh5X21vZGUgJiYgc3RyY21wKHBoeV9tb2RlLCAiTkMtU0ki
KSA9PSAwKTsNCj4gKw0KPiAgICAgICAgIHByaXYtPmlvYmFzZSA9IChzdHJ1Y3QgZnRnbWFjMTAw
ICopcGRhdGEtPmlvYmFzZTsNCj4gICAgICAgICBwcml2LT5waHlfbW9kZSA9IHBkYXRhLT5waHlf
aW50ZXJmYWNlOw0KPiAgICAgICAgIHByaXYtPm1heF9zcGVlZCA9IHBkYXRhLT5tYXhfc3BlZWQ7
DQo+IEBAIC01NDgsMTAgKzU1OCwxNSBAQCBzdGF0aWMgaW50IGZ0Z21hYzEwMF9wcm9iZShzdHJ1
Y3QgdWRldmljZSAqZGV2KQ0KPiAgICAgICAgIGlmIChyZXQpDQo+ICAgICAgICAgICAgICAgICBn
b3RvIG91dDsNCj4NCj4gLSAgICAgICByZXQgPSBmdGdtYWMxMDBfbWRpb19pbml0KGRldik7DQo+
IC0gICAgICAgaWYgKHJldCkgew0KPiAtICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJGYWls
ZWQgdG8gaW5pdGlhbGl6ZSBtZGlvYnVzOiAlZFxuIiwgcmV0KTsNCj4gLSAgICAgICAgICAgICAg
IGdvdG8gb3V0Ow0KPiArICAgICAgIGlmIChwcml2LT5uY3NpX21vZGUpIHsNCj4gKyAgICAgICAg
ICAgICAgIHByaW50ZigiJXMgLSBOQ1NJIGRldGVjdGVkXG4iLCBfX2Z1bmNfXyk7DQoNCk5DLVNJ
DQoNCj4gKyAgICAgICB9IGVsc2Ugew0KPiArICAgICAgICAgICAgICAgcmV0ID0gZnRnbWFjMTAw
X21kaW9faW5pdChkZXYpOw0KPiArICAgICAgICAgICAgICAgaWYgKHJldCkgew0KPiArICAgICAg
ICAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBpbml0aWFsaXplIG1kaW9i
dXM6ICVkXG4iLCByZXQpOw0KPiArICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsNCj4g
KyAgICAgICAgICAgICAgIH0NCj4gKw0KPiAgICAgICAgIH0NCj4NCj4gICAgICAgICByZXQgPSBm
dGdtYWMxMDBfcGh5X2luaXQoZGV2KTsNCj4gQEAgLTU3MSw5ICs1ODYsMTMgQEAgc3RhdGljIGlu
dCBmdGdtYWMxMDBfcmVtb3ZlKHN0cnVjdCB1ZGV2aWNlICpkZXYpDQo+ICB7DQo+ICAgICAgICAg
c3RydWN0IGZ0Z21hYzEwMF9kYXRhICpwcml2ID0gZGV2X2dldF9wcml2KGRldik7DQo+DQo+IC0g
ICAgICAgZnJlZShwcml2LT5waHlkZXYpOw0KPiAtICAgICAgIG1kaW9fdW5yZWdpc3Rlcihwcml2
LT5idXMpOw0KPiAtICAgICAgIG1kaW9fZnJlZShwcml2LT5idXMpOw0KDQpUaGlzIHNob3VsZCBi
ZSBiZWZvcmUgdGhlIHRlc3QgbGlrZSBpdCB3YXMgYW5kIGVsaW1pbmF0ZSB0aGUgZWxzZS4uLg0K
ZnJlZShwcml2LT5waHlkZXYpOw0KDQo+ICsgICAgICAgaWYgKCFwcml2LT5uY3NpX21vZGUpIHsN
Cj4gKyAgICAgICAgICAgICAgIGZyZWUocHJpdi0+cGh5ZGV2KTsNCj4gKyAgICAgICAgICAgICAg
IG1kaW9fdW5yZWdpc3Rlcihwcml2LT5idXMpOw0KPiArICAgICAgICAgICAgICAgbWRpb19mcmVl
KHByaXYtPmJ1cyk7DQo+ICsgICAgICAgfSBlbHNlIHsNCj4gKyAgICAgICAgICAgICAgIGZyZWUo
cHJpdi0+cGh5ZGV2KTsNCj4gKyAgICAgICB9DQo+ICAgICAgICAgY2xrX3JlbGVhc2VfYnVsaygm
cHJpdi0+Y2xrcyk7DQo+DQo+ICAgICAgICAgcmV0dXJuIDA7DQo+IC0tDQo+IDIuMjEuMA0KPg0K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBVLUJv
b3QgbWFpbGluZyBsaXN0DQo+IFUtQm9vdEBsaXN0cy5kZW54LmRlDQo+IGh0dHBzOi8vbGlzdHMu
ZGVueC5kZS9saXN0aW5mby91LWJvb3QNCg==
