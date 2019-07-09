Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 508C364F1C
	for <lists+openbmc@lfdr.de>; Thu, 11 Jul 2019 01:12:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kZhS3g1dzDqgN
	for <lists+openbmc@lfdr.de>; Thu, 11 Jul 2019 09:12:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ni.com
 (client-ip=148.163.156.75; helo=mx0b-00010702.pphosted.com;
 envelope-from=prvs=8093ea9614=joseph.hershberger@ni.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ni.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nio365.onmicrosoft.com header.i=@nio365.onmicrosoft.com
 header.b="Aw9mHETu"; dkim-atps=neutral
X-Greylist: delayed 4430 seconds by postgrey-1.36 at bilbo;
 Wed, 10 Jul 2019 10:47:45 AEST
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
 [148.163.156.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45k0sF49MQzDqWX
 for <openbmc@lists.ozlabs.org>; Wed, 10 Jul 2019 10:47:43 +1000 (AEST)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
 by mx0a-00010702.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x69NUktE030134
 for <openbmc@lists.ozlabs.org>; Tue, 9 Jul 2019 18:33:50 -0500
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2051.outbound.protection.outlook.com [104.47.38.51])
 by mx0a-00010702.pphosted.com with ESMTP id 2tn43g835f-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 09 Jul 2019 18:33:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MNjpW/i19qfA2O5xad6kLkCMIVH8wg/1ZqHLGG9EXXxKsCtWscXaXNZQakg840O8Gz4fjgV/XBdQJjy83GKBPexAMJNis8C+yMD98DpJ9j9fp/+abmocDQYvfAGoUgWkXge9ZioACBMPxiWEfjSI7HQsX9u2O510RwuqmdNDWUsQkeTDzUruarr5DrzynGkSNv2WbWd8SX/P7Gfyu3gM/71AtfGUzKn2iJ6ePlQ3oiLF185gDE6wOupnbgTNs3/LjL7dPf+a1+uFplvonkjNRPKNLhPN6inTaFv4Dao6108sWjZsM4LwwwJQEHCEs4bb/inTt0s1t/bdqbVzOuc+2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OHQdcZbSWGzPxdYSTEKSZQ7O1DXGdTtbihhoGH8keQ=;
 b=C2sktpWnDZvfd6172Pr0OT+A2pxrl8nf30LuQhGoLaQVnNr7UBnhBuzqkH/xevkrfGVQ0O5Tnt46vIaTDF3GEL5DQVLNIhpWzD+JyqCaLbypNi/nwdRSntZstrRzK0bJTiuQnZ4gdy3OSLsn3tijhvQidgwNMafs55iGKQ0R1nIK8X/IFER8xRo8uH3nqcTBqFP5jjc+nnlJK9EsGKLJt6+StGVhgS7wDEQuCwszFUpWN3+uVs796sVwhOJ+ushCh5OJhEElrDvaZunIqFBYC+9WgSlODLYOK2VDlupOq1OEjTRsoOa72yTscJPZMR5/cadxJ4Y35BdatGM/0Gbiqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=ni.com;dmarc=pass action=none header.from=ni.com;dkim=pass
 header.d=ni.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector1-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OHQdcZbSWGzPxdYSTEKSZQ7O1DXGdTtbihhoGH8keQ=;
 b=Aw9mHETuKT+1NYB1YZXzZLNJ3KM6td22nbVUcwoY8bk4/PaKhy9lrNmXfkaDfXWwrbnr+N6hzaFre+AIXDHcDf3FzYxVQkCJo+rRdg6mZ280cDbT4+H6KPXjsrv5Co5rhDFCNNsV5ubP8cNtRzFR57OwjyR+ZIa6capG1fjbfx4=
Received: from DM5PR04MB0381.namprd04.prod.outlook.com (10.173.169.144) by
 DM5PR04MB0938.namprd04.prod.outlook.com (10.174.191.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Tue, 9 Jul 2019 23:33:49 +0000
Received: from DM5PR04MB0381.namprd04.prod.outlook.com
 ([fe80::3927:cd59:a4b8:5dad]) by DM5PR04MB0381.namprd04.prod.outlook.com
 ([fe80::3927:cd59:a4b8:5dad%3]) with mapi id 15.20.2052.010; Tue, 9 Jul 2019
 23:33:49 +0000
From: Joe Hershberger <joe.hershberger@ni.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Subject: Re: [U-Boot] [PATCH v2 4/4] net: NC-SI setup and handling
Thread-Topic: [U-Boot] [PATCH v2 4/4] net: NC-SI setup and handling
Thread-Index: AQHVNq7BqJ1bnaTDV0maOojT2SxvNQ==
Date: Tue, 9 Jul 2019 23:33:47 +0000
Message-ID: <CANr=Z=YA64UbrDQV9SonmpFQwxEbEgVSDOPiE5++v1g8mCtBTQ@mail.gmail.com>
References: <20190618013720.2823-1-sam@mendozajonas.com>
 <20190618013720.2823-5-sam@mendozajonas.com>
In-Reply-To: <20190618013720.2823-5-sam@mendozajonas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CH2PR18CA0014.namprd18.prod.outlook.com
 (2603:10b6:610:4f::24) To DM5PR04MB0381.namprd04.prod.outlook.com
 (2603:10b6:3:9e::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-gm-message-state: APjAAAWymjB5voRN50zD+7o2CRNYuxuVfjKr3O7ZNqmp1daUlqsAQ64h
 IZCqmHUCJji7D9+ibG9f6PnjQGkSABa/s8jMvd8=
x-google-smtp-source: APXvYqz7Py7vtmO/Ir+Eo5tPmoE5LRZMHwKzK/b3wc9K5MEYdFtUoG800BdPIfKC376zzkr02FFlATacf2wiXjLN+bo=
x-received: by 2002:a5d:94d7:: with SMTP id
 y23mr28836323ior.296.1562715226241; Tue, 09 Jul 2019 16:33:46 -0700 (PDT)
x-gmail-original-message-id: <CANr=Z=YA64UbrDQV9SonmpFQwxEbEgVSDOPiE5++v1g8mCtBTQ@mail.gmail.com>
x-originating-ip: [209.85.166.52]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 103f83d8-e16d-4dff-2194-08d704c5e3fd
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5PR04MB0938; 
x-ms-traffictypediagnostic: DM5PR04MB0938:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR04MB0938116AF1F6AD35B16D48D2F6F10@DM5PR04MB0938.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(376002)(346002)(39860400002)(396003)(136003)(199004)(189003)(71200400001)(386003)(52116002)(6506007)(53546011)(99286004)(76176011)(61726006)(6436002)(71190400001)(229853002)(26005)(7736002)(6486002)(2906002)(53936002)(6246003)(66066001)(102836004)(305945005)(14454004)(446003)(61266001)(186003)(11346002)(966005)(8676002)(4326008)(66556008)(64756008)(66476007)(476003)(66446008)(6862004)(66946007)(486006)(498394004)(68736007)(81156014)(25786009)(6306002)(6512007)(9686003)(14444005)(43066004)(55446002)(5024004)(256004)(8936002)(5660300002)(3846002)(95326003)(6116002)(478600001)(54906003)(316002)(81166006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR04MB0938;
 H:DM5PR04MB0381.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: ni.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4dAFZoPCFFBWrQVIUDM0Ip7aHW2fkpox3gpvFhbPnMeqWmW2b7w1ctKXjQzHvMzgX3ep32LItH/t8nYAYm6Au1wrxFXQZCvmbVEGVk3VApwsqH/dCsIlEyJNaZMdft5S6wVFA62Ljwn5RDyEfmN4Nij/YNW/Unw1MJ+xGAy1/atAuT+dSgxVLsfgtCmv8QERQhWgJvHXM5pCcFDB66iROPJ8zr4+SxJcktErCQNjft12+x7aIUMNHsQWbVLO8tzHIfBLNohjI04eY8jAabmkpqJqj2MKkb8EvG1xMHXXUtReqGlCz2aueWkig/88iOZ8J86zRjBVX2VV8RTCR6LXffAjVr6lt/RtETp7TjkKTz2Az73WB4y0+zfS4tqGI8Rcu8GhOpqn7b0O42LSYEMh1ZQZEduUgnusmWQBzKmXgQU=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7918C12777E9C46A18969C381C3EF2C@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 103f83d8-e16d-4dff-2194-08d704c5e3fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 23:33:47.9462 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: joseph.hershberger@ni.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0938
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-09_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
 score=30
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907090281
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
bUBtZW5kb3pham9uYXMuY29tPiB3cm90ZToNCj4NCj4gQWRkIHRoZSBoYW5kbGluZyBvZiBOQy1T
SSBldGhlcm5ldCBmcmFtZXMsIGFuZCBhZGQgYSBjaGVjayBhdCB0aGUgc3RhcnQNCj4gb2YgbmV0
X2xvb3AoKSB0byBjb25maWd1cmUgTkMtU0kgYmVmb3JlIHN0YXJ0aW5nIG90aGVyIG5ldHdvcmsg
Y29tbWFuZHMuDQo+IFRoaXMgYWxzbyBhZGRzIGFuICJuY3NpIiBjb21tYW5kIHRvIG1hbnVhbGx5
IHN0YXJ0IE5DLVNJIGNvbmZpZ3VyYXRpb24uDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBN
ZW5kb3phLUpvbmFzIDxzYW1AbWVuZG96YWpvbmFzLmNvbT4NCj4gLS0tDQo+IHYyOiBVcGRhdGUg
bmNzaSBjb21tYW5kIGhlbHAgdGV4dA0KPg0KPiAgY21kL0tjb25maWcgICB8ICA4ICsrKysrKysr
DQo+ICBjbWQvbmV0LmMgICAgIHwgMTggKysrKysrKysrKysrKysrKysrDQo+ICBpbmNsdWRlL25l
dC5oIHwgIDIgKy0NCj4gIG5ldC9uZXQuYyAgICAgfCAyNyArKysrKysrKysrKysrKysrKysrKysr
KysrKy0NCj4gIDQgZmlsZXMgY2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkNCj4NCj4gZGlmZiAtLWdpdCBhL2NtZC9LY29uZmlnIGIvY21kL0tjb25maWcNCj4gaW5kZXgg
MGJhZGNiM2ZlMC4uOTg1MWIwNDk3MiAxMDA2NDQNCj4gLS0tIGEvY21kL0tjb25maWcNCj4gKysr
IGIvY21kL0tjb25maWcNCj4gQEAgLTEzMzIsNiArMTMzMiwxNCBAQCBjb25maWcgQ01EX0xJTktf
TE9DQUwNCj4gICAgICAgICBoZWxwDQo+ICAgICAgICAgICBBY3F1aXJlIGEgbmV0d29yayBJUCBh
ZGRyZXNzIHVzaW5nIHRoZSBsaW5rLWxvY2FsIHByb3RvY29sDQo+DQo+ICtjb25maWcgQ01EX05D
U0kNCj4gKyAgICAgICBib29sICJuY3NpIg0KPiArICAgICAgIGRlcGVuZHMgb24gUEhZX05DU0kN
Cj4gKyAgICAgICBoZWxwDQo+ICsgICAgICAgICBNYW51YWxseSBjb25maWd1cmUgdGhlIGF0dGFj
aGVkIE5JQyB2aWEgTkMtU0kuDQo+ICsgICAgICAgICBOb3JtYWxseSB0aGlzIGhhcHBlbnMgYXV0
b21hdGljYWxseSBiZWZvcmUgb3RoZXIgbmV0d29yaw0KPiArICAgICAgICAgb3BlcmF0aW9ucy4N
Cj4gKw0KPiAgZW5kaWYNCj4NCj4gIGNvbmZpZyBDTURfRVRIU1cNCj4gZGlmZiAtLWdpdCBhL2Nt
ZC9uZXQuYyBiL2NtZC9uZXQuYw0KPiBpbmRleCA4OTcyMWI4ZjhiLi43ZDJjMjFiYTRkIDEwMDY0
NA0KPiAtLS0gYS9jbWQvbmV0LmMNCj4gKysrIGIvY21kL25ldC5jDQo+IEBAIC00NTcsMyArNDU3
LDIxIEBAIFVfQk9PVF9DTUQoDQo+ICApOw0KPg0KPiAgI2VuZGlmICAvKiBDT05GSUdfQ01EX0xJ
TktfTE9DQUwgKi8NCj4gKw0KPiArI2lmIGRlZmluZWQoQ09ORklHX0NNRF9OQ1NJKQ0KPiArc3Rh
dGljIGludCBkb19uY3NpKGNtZF90YmxfdCAqY21kdHAsIGludCBmbGFnLCBpbnQgYXJnYywNCj4g
KyAgICAgICAgICAgICAgICAgIGNoYXIgKiBjb25zdCBhcmd2W10pDQo+ICt7DQo+ICsgICAgICAg
aWYgKG5ldF9sb29wKE5DU0kpIDwgMCkNCj4gKyAgICAgICAgICAgICAgIHJldHVybiBDTURfUkVU
X0ZBSUxVUkU7DQo+ICsNCj4gKyAgICAgICByZXR1cm4gQ01EX1JFVF9TVUNDRVNTOw0KPiArfQ0K
PiArDQo+ICtVX0JPT1RfQ01EKA0KPiArICAgICAgIG5jc2ksICAgMSwgICAgICAxLCAgICAgIGRv
X25jc2ksDQo+ICsgICAgICAgIkNvbmZpZ3VyZSBhdHRhY2hlZCBOSUMgdmlhIE5DLVNJIiwNCj4g
KyAgICAgICAiIg0KPiArKTsNCj4gKw0KPiArI2VuZGlmICAvKiBDT05GSUdfQ01EX05DU0kgKi8N
Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbmV0LmggYi9pbmNsdWRlL25ldC5oDQo+IGluZGV4IDIw
YzQ0OGVlNjAuLjkxODlmMGZiNTMgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvbmV0LmgNCj4gKysr
IGIvaW5jbHVkZS9uZXQuaA0KPiBAQCAtNTMxLDcgKzUzMSw3IEBAIGV4dGVybiBpbnQgICAgICAg
ICAgbmV0X3Jlc3RhcnRfd3JhcDsgICAgICAgLyogVHJpZWQgYWxsIG5ldHdvcmsgZGV2aWNlcyAq
Lw0KPg0KPiAgZW51bSBwcm90b190IHsNCj4gICAgICAgICBCT09UUCwgUkFSUCwgQVJQLCBURlRQ
R0VULCBESENQLCBQSU5HLCBETlMsIE5GUywgQ0RQLCBORVRDT05TLCBTTlRQLA0KPiAtICAgICAg
IFRGVFBTUlYsIFRGVFBQVVQsIExJTktMT0NBTCwgRkFTVEJPT1QsIFdPTA0KPiArICAgICAgIFRG
VFBTUlYsIFRGVFBQVVQsIExJTktMT0NBTCwgRkFTVEJPT1QsIFdPTCwgTkNTSQ0KPiAgfTsNCj4N
Cj4gIGV4dGVybiBjaGFyICAgIG5ldF9ib290X2ZpbGVfbmFtZVsxMDI0XTsvKiBCb290IEZpbGUg
bmFtZSAqLw0KPiBkaWZmIC0tZ2l0IGEvbmV0L25ldC5jIGIvbmV0L25ldC5jDQo+IGluZGV4IDU4
YjA0MTdjYmUuLmE1OTE2OWEwMzIgMTAwNjQ0DQo+IC0tLSBhL25ldC9uZXQuYw0KPiArKysgYi9u
ZXQvbmV0LmMNCj4gQEAgLTk1LDYgKzk1LDcgQEANCj4gICNpbmNsdWRlIDxuZXQuaD4NCj4gICNp
bmNsdWRlIDxuZXQvZmFzdGJvb3QuaD4NCj4gICNpbmNsdWRlIDxuZXQvdGZ0cC5oPg0KPiArI2lu
Y2x1ZGUgPG5ldC9uY3NpLmg+DQo+ICAjaWYgZGVmaW5lZChDT05GSUdfTEVEX1NUQVRVUykNCj4g
ICNpbmNsdWRlIDxtaWlwaHkuaD4NCj4gICNpbmNsdWRlIDxzdGF0dXNfbGVkLmg+DQo+IEBAIC00
MDcsNiArNDA4LDE2IEBAIGludCBuZXRfbG9vcChlbnVtIHByb3RvX3QgcHJvdG9jb2wpDQo+ICAg
ICAgICAgbmV0X3RyeV9jb3VudCA9IDE7DQo+ICAgICAgICAgZGVidWdfY29uZChERUJVR19JTlRf
U1RBVEUsICItLS0gbmV0X2xvb3AgRW50cnlcbiIpOw0KPg0KPiArI2lmZGVmIENPTkZJR19QSFlf
TkNTSQ0KPiArICAgICAgIGlmIChwcm90b2NvbCAhPSBOQ1NJICYmICFuY3NpX2FjdGl2ZSgpKSB7
DQo+ICsgICAgICAgICAgICAgICBwcmludGYoIiVzOiBjb25maWd1cmluZyBOQ1NJIGZpcnN0XG4i
LCBfX2Z1bmNfXyk7DQoNCk5DLVNJDQoNCj4gKyAgICAgICAgICAgICAgIGlmIChuZXRfbG9vcChO
Q1NJKSA8IDApDQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+ICsgICAg
ICAgICAgICAgICBldGhfaW5pdF9zdGF0ZV9vbmx5KCk7DQo+ICsgICAgICAgICAgICAgICBnb3Rv
IHJlc3RhcnQ7DQo+ICsgICAgICAgfQ0KPiArI2VuZGlmDQo+ICsNCj4gICAgICAgICBib290c3Rh
Z2VfbWFya19uYW1lKEJPT1RTVEFHRV9JRF9FVEhfU1RBUlQsICJldGhfc3RhcnQiKTsNCj4gICAg
ICAgICBuZXRfaW5pdCgpOw0KPiAgICAgICAgIGlmIChldGhfaXNfb25fZGVtYW5kX2luaXQoKSB8
fCBwcm90b2NvbCAhPSBORVRDT05TKSB7DQo+IEBAIC00MjAsNiArNDMxLDcgQEAgaW50IG5ldF9s
b29wKGVudW0gcHJvdG9fdCBwcm90b2NvbCkNCj4gICAgICAgICB9IGVsc2Ugew0KPiAgICAgICAg
ICAgICAgICAgZXRoX2luaXRfc3RhdGVfb25seSgpOw0KPiAgICAgICAgIH0NCj4gKw0KPiAgcmVz
dGFydDoNCj4gICNpZmRlZiBDT05GSUdfVVNCX0tFWUJPQVJEDQo+ICAgICAgICAgbmV0X2J1c3lf
ZmxhZyA9IDA7DQo+IEBAIC01MjYsNiArNTM4LDExIEBAIHJlc3RhcnQ6DQo+ICAgICAgICAgICAg
ICAgICBjYXNlIFdPTDoNCj4gICAgICAgICAgICAgICAgICAgICAgICAgd29sX3N0YXJ0KCk7DQo+
ICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiArI2VuZGlmDQo+ICsjaWYgZGVmaW5l
ZChDT05GSUdfQ01EX05DU0kpDQo+ICsgICAgICAgICAgICAgICBjYXNlIE5DU0k6DQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIG5jc2lfcHJvYmVfcGFja2FnZXMoKTsNCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgYnJlYWs7DQo+ICAjZW5kaWYNCj4gICAgICAgICAgICAgICAgIGRlZmF1bHQ6
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiBAQCAtNjM3LDcgKzY1NCw3IEBA
IHJlc3RhcnQ6DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW52X3NldF9oZXgo
ImZpbGVzaXplIiwgbmV0X2Jvb3RfZmlsZV9zaXplKTsNCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBlbnZfc2V0X2hleCgiZmlsZWFkZHIiLCBsb2FkX2FkZHIpOw0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICB9DQo+IC0gICAgICAgICAgICAgICAgICAgICAgIGlmIChwcm90b2Nv
bCAhPSBORVRDT05TKQ0KPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAocHJvdG9jb2wgIT0g
TkVUQ09OUyAmJiBwcm90b2NvbCAhPSBOQ1NJKQ0KDQpXaHkgaXMgdGhpcyB1c2luZyBldGhfaGFs
dF9zdGF0ZV9vbmx5KCk/IEl0IGlzIG5vdCB1c2luZyB0aGUNCmV0aF9pbml0X3N0YXRlX29ubHko
KS4NCg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGV0aF9oYWx0KCk7DQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIGVsc2UNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBldGhfaGFsdF9zdGF0ZV9vbmx5KCk7DQo+IEBAIC0xMzE4LDYgKzEzMzUsMTEgQEAgdm9p
ZCBuZXRfcHJvY2Vzc19yZWNlaXZlZF9wYWNrZXQodWNoYXIgKmluX3BhY2tldCwgaW50IGxlbikN
Cj4gICAgICAgICBjYXNlIFBST1RfV09MOg0KPiAgICAgICAgICAgICAgICAgd29sX3JlY2VpdmUo
aXAsIGxlbik7DQo+ICAgICAgICAgICAgICAgICBicmVhazsNCj4gKyNlbmRpZg0KPiArI2lmZGVm
IENPTkZJR19QSFlfTkNTSQ0KPiArICAgICAgIGNhc2UgUFJPVF9OQ1NJOg0KPiArICAgICAgICAg
ICAgICAgbmNzaV9yZWNlaXZlKGV0LCBpcCwgbGVuKTsNCj4gKyAgICAgICAgICAgICAgIGJyZWFr
Ow0KPiAgI2VuZGlmDQo+ICAgICAgICAgfQ0KPiAgfQ0KPiBAQCAtMTM3OSw2ICsxNDAxLDkgQEAg
Y29tbW9uOg0KPg0KPiAgI2lmZGVmIENPTkZJR19DTURfUkFSUA0KPiAgICAgICAgIGNhc2UgUkFS
UDoNCj4gKyNlbmRpZg0KPiArI2lmZGVmIENPTkZJR19DTURfTkNTSQ0KPiArICAgICAgIGNhc2Ug
TkNTSToNCj4gICNlbmRpZg0KPiAgICAgICAgIGNhc2UgQk9PVFA6DQo+ICAgICAgICAgY2FzZSBD
RFA6DQo+IC0tDQo+IDIuMjEuMA0KPg0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXw0KPiBVLUJvb3QgbWFpbGluZyBsaXN0DQo+IFUtQm9vdEBsaXN0cy5k
ZW54LmRlDQo+IGh0dHBzOi8vbGlzdHMuZGVueC5kZS9saXN0aW5mby91LWJvb3QNCg==
