Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D27EE725CE
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 06:19:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45thtY1NGbzDq8v
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 14:19:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=210739c354=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="bDLNTZmz"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="rir4xFCW"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tQKT6YB4zDqPM;
 Wed, 24 Jul 2019 03:22:52 +1000 (AEST)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6NHJGDd002398; Tue, 23 Jul 2019 10:22:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=dIr65NYnJ55BDXjoX1xT9/BgsD40nYUS+kxLZa5Ilro=;
 b=bDLNTZmzsEYK1iW7BWoyZ6qvmJQXruhhhO4qfPOU0JgpRr29NTe/dDiIWUZahiu9ymux
 srUXDo+8w5QooTPNZZQeW/a7l2OjNFbFIVg/BKX/hBe0AWJ759GpBwGPi2j2Exvqaa7q
 7r25r4wXaGK+KqGs8eMFm91a0ou9NZouuDs= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2tx61gr55t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 23 Jul 2019 10:22:38 -0700
Received: from ash-exhub103.TheFacebook.com (2620:10d:c0a8:82::c) by
 ash-exhub103.TheFacebook.com (2620:10d:c0a8:82::c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 23 Jul 2019 10:22:37 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 23 Jul 2019 10:22:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTw76LkmpeYc4yjud3BRvym3WAMQRicaWhNmUc9/0cSEZ6HwHJUaP+MHU8jVKyo0gx2KtH3PgyiYR1AMLp53ZriKUdfLnW0BFMhypl1JxTsNboB60OkQwEPlGBuPFOtixNUkX9lbSibjxjo69r8BQgD3ZudkpfDCtHzdYjdPXJg442lMO78DXTv67YGEa0Rgbx3cyOPFbOv4/2iDrb4SnhSKopye2yA2xFbYAF4v2Smi84BPAmB/p8baQmDR11ohXvOUWvbTUH2kBxIS6fPFdKJt0YFgGqwvuDzXU1zKj7xBnUEsOZAzMLT1e/HSiWknwcJqKO6+Q0xr47pf7yd1pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIr65NYnJ55BDXjoX1xT9/BgsD40nYUS+kxLZa5Ilro=;
 b=jk4D9Ue9C4XLxjpwr0+xy5ulDKstC4op5BonELxDKauGwe9M6Xt3uH3ci9BcpnuqD9c2vx4VCP8Ldps2pPRDspoqFFt6c0QNonVQbkMpyRy+mOVDo7FRXHTKmmgg9tOJQGObHNpcoxVKsF0hXzFCMFjQkptnojWkElIM61avfHvezOzrRnUmny5KkEuL0W3iBQKxQCi9L7gHpVr7Kz+WblabnNxoPjzWbtHSTAuW1+SChs+kXUojDWvu2fUoax3S4UsyVpUMJ2qOLXF00fnO3uGBDzTtO8Z+rplw4dGr01zlpES0adrq4uF9xm0sUqRjcj8E8TKAvMBab2RGyz27ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=fb.com;dmarc=pass action=none header.from=fb.com;dkim=pass
 header.d=fb.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIr65NYnJ55BDXjoX1xT9/BgsD40nYUS+kxLZa5Ilro=;
 b=rir4xFCWCwNrsa/kUM/pPAgvSKR+A9HS+1G9cKuwtCQ3svszeppjlRVkq4i3GUoG5J+ZwGCtF2BFcymy2ZPS77wsXSAE8JwrMrAb28zSUvbVKqn/0eYTJXd3ofFQbdEmI0cgdFv1yK4xNfpFQVE9nUpCiL+PbayWTMc1gBAP60U=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1399.namprd15.prod.outlook.com (10.172.161.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Tue, 23 Jul 2019 17:22:36 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::fce3:df83:1cbf:e65e]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::fce3:df83:1cbf:e65e%12]) with mapi id 15.20.2094.013; Tue, 23 Jul
 2019 17:22:36 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, "Rob
 Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Joel
 Stanley" <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: tiogapass: Add Riser card
Thread-Topic: [PATCH 2/2] ARM: dts: aspeed: tiogapass: Add Riser card
Thread-Index: AQHVQMVnZ4V646TGWUWzuAY8l6/hJabX/4yA
Date: Tue, 23 Jul 2019 17:22:36 +0000
Message-ID: <C9C6AC86-B353-4CDA-8B63-50587F48DF44@fb.com>
References: <20190722192451.1947348-1-vijaykhemka@fb.com>
 <20190722192451.1947348-3-vijaykhemka@fb.com>
In-Reply-To: <20190722192451.1947348-3-vijaykhemka@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:8724]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54e8104f-355e-466a-8cde-08d70f925b36
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY4PR15MB1399; 
x-ms-traffictypediagnostic: CY4PR15MB1399:
x-microsoft-antispam-prvs: <CY4PR15MB1399FBCB80D97751393BF711DDC70@CY4PR15MB1399.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(39860400002)(346002)(376002)(396003)(366004)(189003)(199004)(305945005)(316002)(446003)(4326008)(8676002)(81166006)(66476007)(99286004)(186003)(81156014)(64756008)(11346002)(14454004)(46003)(6246003)(7416002)(66946007)(110136005)(66556008)(66446008)(54906003)(71190400001)(229853002)(71200400001)(91956017)(476003)(7736002)(256004)(5660300002)(86362001)(36756003)(76116006)(2501003)(6116002)(486006)(53936002)(6512007)(2906002)(8936002)(6486002)(6436002)(33656002)(25786009)(6506007)(478600001)(2616005)(76176011)(68736007)(2201001)(102836004)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1399;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bDCbTMKBFYHK5RKVO7yNZHEv1pd8v9m/ETdEJTN/v0uCbHIlngcidJ7Foyt3gnIfrAVqJlQRZnNz11YYz+FLIIVHA37GZKx8eeeqRKiOImU2vB1Go4cJN7fxlge5gz/jpFKXCHJVx434aDjuM4H0eBLqnbtwLjJEoo2qbpiKdwLkQwwXZRhQhYhkfTBsiqZGdNinYUeVSt9r0StOfL8pS2ijDywypi/PTF6sevdWavDO82x1+X6cPkSQDvjgHpAMQ+cnbGzmRIdJejw/7AFzGpT3bRfglcoieBMngRwr81NnP6BZY5kV05fXdJgc8N9D23jfjqHwTvCXmjd0/ZcDScbN/gTlB4wt1RAKCvOLt7bIxyATAq0K9DbxT2NLg3hdtXV1BIMIBt0/61LvHfyAyQi9kUoFr8lQ9ZdyVB8+nC8=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8445B907535FB04D9AD197743F1E2206@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 54e8104f-355e-466a-8cde-08d70f925b36
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 17:22:36.4148 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vijaykhemka@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1399
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-23_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907230174
X-FB-Internal: deliver
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
Cc: "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

VGVhbSwNClRoaXMgcGF0Y2ggYWxzbyBuZWVkcyByZXZpZXcuIEkgc2VwYXJhdGVkIGZpcnN0IHBh
dGNoIHdpdGggdjIgYW5kIHRoYXQgd2FzIGFja2VkLiBQbGVhc2UgcmV2aWV3IHRoaXMgYXMgd2Vs
bC4NCg0KUmVnYXJkcw0KLVZpamF5DQoNCu+7v09uIDcvMjIvMTksIDEyOjQxIFBNLCAiVmlqYXkg
S2hlbWthIiA8dmlqYXlraGVta2FAZmIuY29tPiB3cm90ZToNCg0KICAgIEFkZGVkIGkyYyBtdXgg
Zm9yIHJpc2VyIGNhcmQgYW5kIG11bHRpcGxlIGF2YSBjYXJkIGFuZCBpdHMgc2Vuc29yDQogICAg
Y29tcG9uZW50cyBmb3IgRmFjZWJvb2sgVGlvZ2FwYXNzIHBsYXRmb3JtDQogICAgDQogICAgU2ln
bmVkLW9mZi1ieTogVmlqYXkgS2hlbWthIDx2aWpheWtoZW1rYUBmYi5jb20+DQogICAgLS0tDQog
ICAgIC4uLi9kdHMvYXNwZWVkLWJtYy1mYWNlYm9vay10aW9nYXBhc3MuZHRzICAgICB8IDIzMCAr
KysrKysrKysrKysrKysrKysNCiAgICAgMSBmaWxlIGNoYW5nZWQsIDIzMCBpbnNlcnRpb25zKCsp
DQogICAgDQogICAgZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMtZmFj
ZWJvb2stdGlvZ2FwYXNzLmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMtZmFjZWJv
b2stdGlvZ2FwYXNzLmR0cw0KICAgIGluZGV4IGI3NzgzODMzYTU4Yy4uOGQwYmNiM2NkNDE5IDEw
MDY0NA0KICAgIC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMtZmFjZWJvb2stdGlv
Z2FwYXNzLmR0cw0KICAgICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMtZmFjZWJv
b2stdGlvZ2FwYXNzLmR0cw0KICAgIEBAIC0xMiw2ICsxMiwyNyBAQA0KICAgICAJYWxpYXNlcyB7
DQogICAgIAkJc2VyaWFsMCA9ICZ1YXJ0MTsNCiAgICAgCQlzZXJpYWw0ID0gJnVhcnQ1Ow0KICAg
ICsNCiAgICArCQkvKg0KICAgICsJCSAqIEhhcmRjb2RlIHRoZSBidXMgbnVtYmVyIG9mIGkyYyBz
d2l0Y2hlcycgY2hhbm5lbHMgdG8NCiAgICArCQkgKiBhdm9pZCBicmVha2luZyB0aGUgbGVnYWN5
IGFwcGxpY2F0aW9ucy4NCiAgICArCQkgKi8NCiAgICArCQlpMmMxNiA9ICZpbXV4MTY7DQogICAg
KwkJaTJjMTcgPSAmaW11eDE3Ow0KICAgICsJCWkyYzE4ID0gJmltdXgxODsNCiAgICArCQlpMmMx
OSA9ICZpbXV4MTk7DQogICAgKwkJaTJjMjAgPSAmaW11eDIwOw0KICAgICsJCWkyYzIxID0gJmlt
dXgyMTsNCiAgICArCQlpMmMyMiA9ICZpbXV4MjI7DQogICAgKwkJaTJjMjMgPSAmaW11eDIzOw0K
ICAgICsJCWkyYzI0ID0gJmltdXgyNDsNCiAgICArCQlpMmMyNSA9ICZpbXV4MjU7DQogICAgKwkJ
aTJjMjYgPSAmaW11eDI2Ow0KICAgICsJCWkyYzI3ID0gJmltdXgyNzsNCiAgICArCQlpMmMyOCA9
ICZpbXV4Mjg7DQogICAgKwkJaTJjMjkgPSAmaW11eDI5Ow0KICAgICsJCWkyYzMwID0gJmltdXgz
MDsNCiAgICArCQlpMmMzMSA9ICZpbXV4MzE7DQogICAgIAl9Ow0KICAgICAJY2hvc2VuIHsNCiAg
ICAgCQlzdGRvdXQtcGF0aCA9ICZ1YXJ0NTsNCiAgICBAQCAtMTI0LDYgKzE0NSwyMTUgQEANCiAg
ICAgJmkyYzEgew0KICAgICAJc3RhdHVzID0gIm9rYXkiOw0KICAgICAJLy9YMjQgUmlzZXINCiAg
ICArCWkyYy1zd2l0Y2hANzEgew0KICAgICsJCWNvbXBhdGlibGUgPSAibnhwLHBjYTk1NDQiOw0K
ICAgICsJCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KICAgICsJCSNzaXplLWNlbGxzID0gPDA+Ow0K
ICAgICsJCXJlZyA9IDwweDcxPjsNCiAgICArDQogICAgKwkJaW11eDE2OiBpMmNAMCB7DQogICAg
KwkJCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KICAgICsJCQkjc2l6ZS1jZWxscyA9IDwwPjsNCiAg
ICArCQkJcmVnID0gPDA+Ow0KICAgICsNCiAgICArCQkJaW5hMjE5QDQ1IHsNCiAgICArCQkJCWNv
bXBhdGlibGUgPSAidGksaW5hMjE5IjsNCiAgICArCQkJCXJlZyA9IDwweDQ1PjsNCiAgICArCQkJ
fTsNCiAgICArDQogICAgKwkJCXRtcDc1QDQ4IHsNCiAgICArCQkJCWNvbXBhdGlibGUgPSAidGks
dG1wNzUiOw0KICAgICsJCQkJcmVnID0gPDB4NDg+Ow0KICAgICsJCQl9Ow0KICAgICsNCiAgICAr
CQkJdG1wNDIxQDQ5IHsNCiAgICArCQkJCWNvbXBhdGlibGUgPSAidGksdG1wNzUiOw0KICAgICsJ
CQkJcmVnID0gPDB4NDk+Ow0KICAgICsJCQl9Ow0KICAgICsNCiAgICArCQkJZWVwcm9tQDUwIHsN
CiAgICArCQkJCWNvbXBhdGlibGUgPSAiYXRtZWwsMjRjNjQiOw0KICAgICsJCQkJcmVnID0gPDB4
NTA+Ow0KICAgICsJCQkJcGFnZXNpemUgPSA8MzI+Ow0KICAgICsJCQl9Ow0KICAgICsNCiAgICAr
CQkJaTJjLXN3aXRjaEA3MyB7DQogICAgKwkJCQljb21wYXRpYmxlID0gIm54cCxwY2E5NTQ2IjsN
CiAgICArCQkJCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KICAgICsJCQkJI3NpemUtY2VsbHMgPSA8
MD47DQogICAgKwkJCQlyZWcgPSA8MHg3Mz47DQogICAgKw0KICAgICsJCQkJaW11eDIwOiBpMmNA
MCB7DQogICAgKwkJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47DQogICAgKwkJCQkJI3NpemUtY2Vs
bHMgPSA8MD47DQogICAgKwkJCQkJcmVnID0gPDA+Ow0KICAgICsJCQkJfTsNCiAgICArDQogICAg
KwkJCQlpbXV4MjE6IGkyY0AxIHsNCiAgICArCQkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsNCiAg
ICArCQkJCQkjc2l6ZS1jZWxscyA9IDwwPjsNCiAgICArCQkJCQlyZWcgPSA8MT47DQogICAgKwkJ
CQl9Ow0KICAgICsNCiAgICArCQkJCWltdXgyMjogaTJjQDIgew0KICAgICsJCQkJCSNhZGRyZXNz
LWNlbGxzID0gPDE+Ow0KICAgICsJCQkJCSNzaXplLWNlbGxzID0gPDA+Ow0KICAgICsJCQkJCXJl
ZyA9IDwyPjsNCiAgICArCQkJCX07DQogICAgKw0KICAgICsJCQkJaW11eDIzOiBpMmNAMyB7DQog
ICAgKwkJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47DQogICAgKwkJCQkJI3NpemUtY2VsbHMgPSA8
MD47DQogICAgKwkJCQkJcmVnID0gPDM+Ow0KICAgICsJCQkJfTsNCiAgICArDQogICAgKwkJCX07
DQogICAgKw0KICAgICsJCX07DQogICAgKw0KICAgICsJCWltdXgxNzogaTJjQDEgew0KICAgICsJ
CQkjYWRkcmVzcy1jZWxscyA9IDwxPjsNCiAgICArCQkJI3NpemUtY2VsbHMgPSA8MD47DQogICAg
KwkJCXJlZyA9IDwxPjsNCiAgICArDQogICAgKwkJCWluYTIxOUA0NSB7DQogICAgKwkJCQljb21w
YXRpYmxlID0gInRpLGluYTIxOSI7DQogICAgKwkJCQlyZWcgPSA8MHg0NT47DQogICAgKwkJCX07
DQogICAgKw0KICAgICsJCQl0bXA0MjFANDggew0KICAgICsJCQkJY29tcGF0aWJsZSA9ICJ0aSx0
bXA3NSI7DQogICAgKwkJCQlyZWcgPSA8MHg0OD47DQogICAgKwkJCX07DQogICAgKw0KICAgICsJ
CQl0bXA0MjFANDkgew0KICAgICsJCQkJY29tcGF0aWJsZSA9ICJ0aSx0bXA3NSI7DQogICAgKwkJ
CQlyZWcgPSA8MHg0OT47DQogICAgKwkJCX07DQogICAgKw0KICAgICsJCQllZXByb21ANTAgew0K
ICAgICsJCQkJY29tcGF0aWJsZSA9ICJhdG1lbCwyNGM2NCI7DQogICAgKwkJCQlyZWcgPSA8MHg1
MD47DQogICAgKwkJCQlwYWdlc2l6ZSA9IDwzMj47DQogICAgKwkJCX07DQogICAgKw0KICAgICsJ
CQlpMmMtc3dpdGNoQDczIHsNCiAgICArCQkJCWNvbXBhdGlibGUgPSAibnhwLHBjYTk1NDYiOw0K
ICAgICsJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47DQogICAgKwkJCQkjc2l6ZS1jZWxscyA9IDww
PjsNCiAgICArCQkJCXJlZyA9IDwweDczPjsNCiAgICArDQogICAgKwkJCQlpbXV4MjQ6IGkyY0Aw
IHsNCiAgICArCQkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsNCiAgICArCQkJCQkjc2l6ZS1jZWxs
cyA9IDwwPjsNCiAgICArCQkJCQlyZWcgPSA8MD47DQogICAgKwkJCQl9Ow0KICAgICsNCiAgICAr
CQkJCWltdXgyNTogaTJjQDEgew0KICAgICsJCQkJCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KICAg
ICsJCQkJCSNzaXplLWNlbGxzID0gPDA+Ow0KICAgICsJCQkJCXJlZyA9IDwxPjsNCiAgICArCQkJ
CX07DQogICAgKw0KICAgICsJCQkJaW11eDI2OiBpMmNAMiB7DQogICAgKwkJCQkJI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47DQogICAgKwkJCQkJI3NpemUtY2VsbHMgPSA8MD47DQogICAgKwkJCQkJcmVn
ID0gPDI+Ow0KICAgICsJCQkJfTsNCiAgICArDQogICAgKwkJCQlpbXV4Mjc6IGkyY0AzIHsNCiAg
ICArCQkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsNCiAgICArCQkJCQkjc2l6ZS1jZWxscyA9IDww
PjsNCiAgICArCQkJCQlyZWcgPSA8Mz47DQogICAgKwkJCQl9Ow0KICAgICsNCiAgICArCQkJfTsN
CiAgICArDQogICAgKwkJfTsNCiAgICArDQogICAgKwkJaW11eDE4OiBpMmNAMiB7DQogICAgKwkJ
CSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KICAgICsJCQkjc2l6ZS1jZWxscyA9IDwwPjsNCiAgICAr
CQkJcmVnID0gPDI+Ow0KICAgICsNCiAgICArCQkJaW5hMjE5QDQ1IHsNCiAgICArCQkJCWNvbXBh
dGlibGUgPSAidGksaW5hMjE5IjsNCiAgICArCQkJCXJlZyA9IDwweDQ1PjsNCiAgICArCQkJfTsN
CiAgICArDQogICAgKwkJCXRtcDQyMUA0OCB7DQogICAgKwkJCQljb21wYXRpYmxlID0gInRpLHRt
cDc1IjsNCiAgICArCQkJCXJlZyA9IDwweDQ4PjsNCiAgICArCQkJfTsNCiAgICArDQogICAgKwkJ
CXRtcDQyMUA0OSB7DQogICAgKwkJCQljb21wYXRpYmxlID0gInRpLHRtcDc1IjsNCiAgICArCQkJ
CXJlZyA9IDwweDQ5PjsNCiAgICArCQkJfTsNCiAgICArDQogICAgKwkJCWVlcHJvbUA1MCB7DQog
ICAgKwkJCQljb21wYXRpYmxlID0gImF0bWVsLDI0YzY0IjsNCiAgICArCQkJCXJlZyA9IDwweDUw
PjsNCiAgICArCQkJCXBhZ2VzaXplID0gPDMyPjsNCiAgICArCQkJfTsNCiAgICArDQogICAgKwkJ
CWkyYy1zd2l0Y2hANzMgew0KICAgICsJCQkJY29tcGF0aWJsZSA9ICJueHAscGNhOTU0NiI7DQog
ICAgKwkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsNCiAgICArCQkJCSNzaXplLWNlbGxzID0gPDA+
Ow0KICAgICsJCQkJcmVnID0gPDB4NzM+Ow0KICAgICsNCiAgICArCQkJCWltdXgyODogaTJjQDAg
ew0KICAgICsJCQkJCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KICAgICsJCQkJCSNzaXplLWNlbGxz
ID0gPDA+Ow0KICAgICsJCQkJCXJlZyA9IDwwPjsNCiAgICArCQkJCX07DQogICAgKw0KICAgICsJ
CQkJaW11eDI5OiBpMmNAMSB7DQogICAgKwkJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47DQogICAg
KwkJCQkJI3NpemUtY2VsbHMgPSA8MD47DQogICAgKwkJCQkJcmVnID0gPDE+Ow0KICAgICsJCQkJ
fTsNCiAgICArDQogICAgKwkJCQlpbXV4MzA6IGkyY0AyIHsNCiAgICArCQkJCQkjYWRkcmVzcy1j
ZWxscyA9IDwxPjsNCiAgICArCQkJCQkjc2l6ZS1jZWxscyA9IDwwPjsNCiAgICArCQkJCQlyZWcg
PSA8Mj47DQogICAgKwkJCQl9Ow0KICAgICsNCiAgICArCQkJCWltdXgzMTogaTJjQDMgew0KICAg
ICsJCQkJCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KICAgICsJCQkJCSNzaXplLWNlbGxzID0gPDA+
Ow0KICAgICsJCQkJCXJlZyA9IDwzPjsNCiAgICArCQkJCX07DQogICAgKw0KICAgICsJCQl9Ow0K
ICAgICsNCiAgICArCQl9Ow0KICAgICsNCiAgICArCQlpbXV4MTk6IGkyY0AzIHsNCiAgICArCQkJ
I2FkZHJlc3MtY2VsbHMgPSA8MT47DQogICAgKwkJCSNzaXplLWNlbGxzID0gPDA+Ow0KICAgICsJ
CQlyZWcgPSA8Mz47DQogICAgKw0KICAgICsJCQlpMmMtc3dpdGNoQDQwIHsNCiAgICArCQkJCWNv
bXBhdGlibGUgPSAidGksaW5hMjE5IjsNCiAgICArCQkJCXJlZyA9IDwweDQwPjsNCiAgICArCQkJ
fTsNCiAgICArDQogICAgKwkJCWkyYy1zd2l0Y2hANDEgew0KICAgICsJCQkJY29tcGF0aWJsZSA9
ICJ0aSxpbmEyMTkiOw0KICAgICsJCQkJcmVnID0gPDB4NDE+Ow0KICAgICsJCQl9Ow0KICAgICsN
CiAgICArCQkJaTJjLXN3aXRjaEA0NSB7DQogICAgKwkJCQljb21wYXRpYmxlID0gInRpLGluYTIx
OSI7DQogICAgKwkJCQlyZWcgPSA8MHg0NT47DQogICAgKwkJCX07DQogICAgKw0KICAgICsJCX07
DQogICAgKw0KICAgICsJfTsNCiAgICAgfTsNCiAgICAgDQogICAgICZpMmMyIHsNCiAgICAtLSAN
CiAgICAyLjE3LjENCiAgICANCiAgICANCg0K
