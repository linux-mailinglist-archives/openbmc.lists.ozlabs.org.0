Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E62DC275416
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 11:10:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxC8H3mmlzDqbD
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 19:10:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com;
 envelope-from=prvs=0534dd7316=matt.muggeridge2@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hpe.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256
 header.s=pps0720 header.b=VipzhunA; dkim-atps=neutral
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com
 [148.163.143.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwdQT4BQ0zDqTN
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 20:51:08 +1000 (AEST)
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08MAkV4j024278; Tue, 22 Sep 2020 10:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps0720;
 bh=8vS+WgzQtjWG8Hsuvi7E0M3avqfNvTrQIY6zmLB2k54=;
 b=VipzhunATb9sYsnTyFatiAosY0F+9qXY7ief6rJT1rdpbZWfJREkEnaNAUtQuwPUWhPH
 fcqXE3OYp9+4rda0nJZGKRFuueB5UkJA9Yj2myMWs00OZ3wAN7t5/zfroRGdQowyhYSB
 PDIeZtTkFC9OS8R0iIGD0YUL8NcXbbswHsm3881s5zEAGupfObX1l42SJDKJOueDlZp9
 H4fjo8LT4GW2+aPZPf3/yHduXqH6bPkjbGWtPwzeQLOXYw53cWN8HVKEwUug/t5L0q9D
 XUaYvYzRkdy5FacORPGHtEOlti0cCUHH78DDIAs9Yh44F2sAXI5U4V/ncOhYifOLLIeM MA== 
Received: from g4t3427.houston.hpe.com (g4t3427.houston.hpe.com
 [15.241.140.73])
 by mx0b-002e3701.pphosted.com with ESMTP id 33q53tv3dq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Sep 2020 10:51:00 +0000
Received: from G4W9121.americas.hpqcorp.net (exchangepmrr1.us.hpecorp.net
 [16.210.21.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g4t3427.houston.hpe.com (Postfix) with ESMTPS id 5D8B15C;
 Tue, 22 Sep 2020 10:50:59 +0000 (UTC)
Received: from G2W6309.americas.hpqcorp.net (2002:10c5:4033::10c5:4033) by
 G4W9121.americas.hpqcorp.net (2002:10d2:1510::10d2:1510) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Tue, 22 Sep 2020 10:50:59 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (15.241.52.13) by
 G2W6309.americas.hpqcorp.net (16.197.64.51) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Tue, 22 Sep 2020 10:50:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GAvvygzTd5zrS4fEZxxyVZz+imWgLtyMIkZI4zKWREjnhxXgQN2lij+s8g2TIs9lbJrs3UN2gk32dxs2twskjJmVMAKBYoGo6JV+JQPauQtUhkPcW7jVsEJJjHUOcqq0N3fUkMeiTZfHkSFQ62KYsA9SDv9MVA5wQALm6IXAt+tbsBECFBLdyA6Ydn7lWOurHkSwiFLh8fRwp7Ks2rMr4byOZdhhBViH8yn/UKzHZ8UG2+ndAZgmER6woNFhACI4uvqCnWXmldMnIIC3Z2vzHnd+uYpJwL+6LUAGC8kKNsglvlsrMyPHkmGG8D6dS7sjmkFfSHpgDPXVInEhTWPyLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLGQrd8EiRiPUZZmiVAOKDbR3nxlKbG70oL7k73MHX8=;
 b=hNQJVRQEu6uTo8Y0xZT3/UdFsnTeqxnJFga4Jpz98uvmJyiDiSlYc7KaDZUTnkcy6SpJIO6Q4++kU6185bfJHQCeiFmcNEc1fnk5qTNsVYVKNKtmrEagWrfyFDx7O0QhevfDCDdNrQ9bXrWWClBTyznQ3M/I1nN+8Fm/b+b2+Y54aOHD6LpGllQqQ2J3xX1pg4QHL/VZwvy4YyLBVgy3F2o/mO4wvHVuuwrKSDOQ7z/2QlfMCAjkGP5dkzFetE5X9xb3bP0NpbGFxVB3EYuKwN5O8aB26dgqj+tXYawinuTx1fZCwm8iLhOWeaoI6uyrG/ucshSBdjrH/gfGPI5sRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:742a::14) by AT5PR8401MB0978.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7425::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Tue, 22 Sep
 2020 10:50:58 +0000
Received: from AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::5594:258e:ba5d:ff9c]) by AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::5594:258e:ba5d:ff9c%7]) with mapi id 15.20.3391.027; Tue, 22 Sep 2020
 10:50:58 +0000
From: "Muggeridge, Matt" <matt.muggeridge2@hpe.com>
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: RE: Mailing list archive on lore.kernel.org/openbmc
Thread-Topic: Mailing list archive on lore.kernel.org/openbmc
Thread-Index: AQHWkKXzah9GfYwwg0O0XgOGNWLUhql0eqlQ
Date: Tue, 22 Sep 2020 10:50:57 +0000
Message-ID: <AT5PR8401MB12198063D4A815B9D7545807D83B0@AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM>
References: <AT5PR8401MB12193C196089B8572EE50F05D82D0@AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM>
 <5b0e1534-379a-837c-89be-53ef74049fc8@linux.vnet.ibm.com>
 <d6f36d91-5456-c40f-68a6-bd6998fda69d@linux.ibm.com>
 <AT5PR8401MB121967BF331D182D97CA4089D8290@AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM>
 <a900b4df-0fc7-4763-9b4e-3ab5d4d6e309@www.fastmail.com>
 <CACPK8XczcDAiuTK7FhazysaN=Sotd5BEJSdJ5wAEUOK_h_5wMA@mail.gmail.com>
 <CACPK8XdWozzt=n2tpyqnncTSGSjRxnNpnb_Sa_z4rjS2A=NNEw@mail.gmail.com>
In-Reply-To: <CACPK8XdWozzt=n2tpyqnncTSGSjRxnNpnb_Sa_z4rjS2A=NNEw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=hpe.com;
x-originating-ip: [60.226.196.81]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9d80d7e5-5009-402f-dcf1-08d85ee56376
x-ms-traffictypediagnostic: AT5PR8401MB0978:
x-microsoft-antispam-prvs: <AT5PR8401MB0978177D3D282B5FEF658453D83B0@AT5PR8401MB0978.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8Ekp6HyUg/F/tWm0E0oES38gw1douTIaG7GmhPldgUHx3pP0XEpgzL4nB4PWwyqvyTI1+1Bp4ttUPww7hE22a6zIOU8mk/KFowzjk9yovhVhJXMGIxbVLou6N6ov1tU/a6JLqkzsGNUPUFOG3KLx9iLOflhZuYPX+1dpF2l2nBDXOz3JUkHZxPqke1OMXFCjt/8h3/M1A+rX8Vemo8DT1RnvTeSH6Z0gXc/7yBcbyUEDmobdSOctTKFTSezQS1RBwsgBvv4oIGjtMQiPHksnzzPyqYn+aOGZlcC87SHCbkXQ3N4ORzqX+xZQiYDq8cegBYRyNPCCeg+vDDnWMMWk9S3YVS7ZrJ0pSa5ghsi3f5Gc5PQNiLW1jR2kiM/WhMJ40DbZI2D5wOm7kEdwFd+zLUIl/Wt3H9TH8tUbPs9ix9QCtIZglBikwbIu6KmDbMMzXy8oFi1ji6Qm0FFTTaYwT28Hqk1V1+JfAPap+p/xHrieRPPW8gm0s1zrgLh95x2g
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(346002)(376002)(39860400002)(136003)(396003)(86362001)(66446008)(64756008)(66556008)(66476007)(4326008)(110136005)(966005)(54906003)(53546011)(8936002)(7696005)(8676002)(186003)(26005)(33656002)(6506007)(55016002)(2906002)(9686003)(52536014)(478600001)(83380400001)(76116006)(316002)(71200400001)(5660300002)(66946007)(130980200001)(223123001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: d+YFuistVWiQ8N6S7y8fHHj/yLgym9E2qvKqzUhZZ560U6dtg3r6LvcTwV+iUlS0sCrD0UL7KD/7fBDN0P3uWLvvZmd22fEw6FZcnNwbDuwn7XZnJxJhfKG95adPx9tnDSKSO6BFJ1nlwY9Ap+SrNbEXgnEbR5kRkwI6SC37yl+5s8P58pQ8GLw0nbqvN4e1KikZ5shk0ZZk5AmqyVhjKS//Y+Cuf3c5RxeGgzI0Xfg+Z3V5mJL/GWyhsn17GgmnJUOZe47FnIHQMO6xvxzIdbNtCUvzX3fgp5oMGX8erXExYR7cc3lvubUkuVzzgC14fkvjKz3MtBkzJrdj+w2LqFkLDaBQjqFsJ+9N5/i69KTCe/2AbN79KzfL72ORVe5zVgistf5JMvlhblvokj+aBOYo5yRzn8VNYRnCjtqIJmmW0pmygleRJKdacMjWR8nutjpQOyovD0JaxM1jL//jKVCfo4VCfgCONCWDMxXf38qfwXGgkS388ScfjIKe+Aw3VcDlb2+E5djgt42EJsNN2AByanaA715CqM4eQWP4F670bc8/UHHtYxQvYvg8ojRzPGWAvK4Q//jL8GGKnUPzwWP7VLFHxcT7wFIzBVOBplicUvVcHdQPOR7WjnjH/0+qGab0/qgEgdVK/i9kPKc2Fg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AT5PR8401MB1219.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d80d7e5-5009-402f-dcf1-08d85ee56376
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2020 10:50:57.9932 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lt8s0Mgqdzm3wdjbN1vLGDdsTvVw80HI60isByip0XmLFfx4fmasKDY42PgL8yGBGGlXZUq4o0eiWZEjjQKXe0wogKBPLx4NzqGYQC9PmKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AT5PR8401MB0978
X-OriginatorOrg: hpe.com
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-22_09:2020-09-21,
 2020-09-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009220089
X-Mailman-Approved-At: Wed, 23 Sep 2020 19:10:08 +1000
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Gunnar Mills <gmills@linux.vnet.ibm.com>,
 Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

VGhhbmsgeW91LCBKb2VsIGFuZCBvdGhlcnMgaW52b2x2ZWQuICBJbmRlZWQsIHRoZSBzZWFyY2hl
cyB0aGF0IHByZXZpb3VzbHkgcmV0dXJuZWQgbm8gcmVzdWx0cyBhcmUgbm93IGZpbmRpbmcgYWxs
IHRoZSBwb3N0cy4NCg0KUmVhbGx5IG5pY2Ugd29yayENCg0KTWF0dC4NCg0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1Pg0K
PiBTZW50OiBUdWVzZGF5LCAyMiBTZXB0ZW1iZXIgMjAyMCA0OjAyIFBNDQo+IFRvOiBPcGVuQk1D
IE1haWxsaXN0IDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQo+IENjOiBNdWdnZXJpZGdlLCBN
YXR0IDxtYXR0Lm11Z2dlcmlkZ2UyQGhwZS5jb20+OyBKb3NlcGggUmV5bm9sZHMNCj4gPGpyZXlA
bGludXguaWJtLmNvbT47IEd1bm5hciBNaWxscyA8Z21pbGxzQGxpbnV4LnZuZXQuaWJtLmNvbT47
IEFuZHJldw0KPiBKZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+DQo+IFN1YmplY3Q6IE1haWxpbmcg
bGlzdCBhcmNoaXZlIG9uIGxvcmUua2VybmVsLm9yZy9vcGVuYm1jDQo+IA0KPiBPbiBGcmksIDEx
IFNlcCAyMDIwIGF0IDAzOjQ3LCBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1PiB3cm90ZToN
Cj4gPiA+IE1heWJlIHdlIHNob3VsZCBzZXQgdXAgYSBwdWJsaWMtaW5ib3ggaW5zdGFuY2U/DQo+
ID4gPg0KPiA+ID4gSU5WQUxJRCBVUkkgUkVNT1ZFRC4NCj4gPiA+DQo+IG9yZ19SRUFETUUuaHRt
bCZkPUR3SUJhUSZjPUM1Yjh6UlFPMW1pR21CZVZaMkxGV2cmcj1YaG02NDdjDQo+IEpEZXFVRVRj
Yw0KPiA+ID4NCj4gVjJ5dkJSQ2VOSlhCdHo2MTRNeEp6TVI5UFprJm09M3hQMmI4eWkyblA2SWZi
anRSOUIzQ1FkMTNXNmdMVmp4DQo+IFJJZl9WDQo+ID4gPiBWS1lZYyZzPWxWNVV2bHFTb3JFNkRV
NWhSNjQzeVh5d292R1IzemNBRVZLYkdOdTZqaVUmZT0NCj4gPiA+DQo+ID4gPiBsb3JlLm9wZW5i
bWMub3JnPw0KPiA+DQo+ID4gSSB3YXMgdGhpbmtpbmcgYWJvdXQgdGhpcyB0aGUgb3RoZXIgZGF5
LiBHaXZlbiBxZW11IGlzIGhvc3RlZCBvbg0KPiA+IGxvcmUua2VybmVsLm9yZywgSSB0aGluayB3
ZSBjb3VsZCBkbyB0aGUgc2FtZS4NCj4gPg0KPiA+IEknbGwgY29udGFjdCB0aGUgbG9yZS1tYW4g
YWJvdXQgaXQuDQo+IA0KPiBXZSBub3cgaGF2ZSB0aGUgb3BlbmJtYyBsaXN0IGFyY2hpdmVkIGF0
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29wZW5ibWMuDQo+IFRoaXMgY29udGFpbnMgYWxsIG9m
IHRoZSBoaXN0b3J5LCBhbmQgd2lsbCByZWNlaXZlIGFsbCBmdXR1cmUgZW1haWwuDQo+IA0KPiBI
YXZlIGEgcmVhZCBhYm91dCBsb3JlIHRvIGxlYXJuIGFib3V0IHRoZSBmZWF0dXJlcyBpdCBvZmZl
cnMuIE1vc3QNCj4gaW1wb3J0YW50bHksIGl0IGhhcyBhIHN1cGVyIGZhc3Qgd2ViIGludGVyZmFj
ZSBmb3Igc2VhcmNoaW5nLg0KPiANCj4gIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvbG9yZS5odG1s
DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBKb2VsDQo=
