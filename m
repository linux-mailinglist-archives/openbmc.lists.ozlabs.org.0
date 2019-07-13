Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BA46775D
	for <lists+openbmc@lfdr.de>; Sat, 13 Jul 2019 02:52:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lrqF3llczDr0D
	for <lists+openbmc@lfdr.de>; Sat, 13 Jul 2019 10:52:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=2097b6c345=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="dT/fUbbX"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="j5hMAuWK"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lrpS6v3FzDqys
 for <openbmc@lists.ozlabs.org>; Sat, 13 Jul 2019 10:51:39 +1000 (AEST)
Received: from pps.filterd (m0001255.ppops.net [127.0.0.1])
 by mx0b-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6D0m3H7021216; Fri, 12 Jul 2019 17:51:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=uYFPOecCnHcglKD0n8JHIjL9jaxhrG1UDUmxapAtctw=;
 b=dT/fUbbXE9U5WHxr6GWN1OToAEYg4DdA/OLJqY11IBYemsCfSOo124lWroeLvwxuQrHe
 CiJB0/7DiwFUAL+gBywDFw2IvxpZ+H4tiGde2r5WTE05MPK2E/7czjTQtku2IrlXYuhZ
 jPCCW0eFgJ7/vfgqvgPF4xXsvpyxMmexB4k= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0b-00082601.pphosted.com with ESMTP id 2tpu9ta375-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 12 Jul 2019 17:51:33 -0700
Received: from ash-exhub204.TheFacebook.com (2620:10d:c0a8:83::4) by
 ash-exhub203.TheFacebook.com (2620:10d:c0a8:83::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 12 Jul 2019 17:51:32 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.100) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 12 Jul 2019 17:51:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uYFPOecCnHcglKD0n8JHIjL9jaxhrG1UDUmxapAtctw=;
 b=j5hMAuWK+khAug1ChGM5b7giWLGVIDZO3J2rwZrQvUoLwcnxjRJTYUavtbeaAsxEyPe1Ui6hAvuaMKQ/DXiqDISjvYmvtMvsxQQOcCetqleDLWR5aMWGxICCOr1KKEuO9iaBDvEaEQP+v4ImkLRQRmkzEIWG0X3pdvUmQ2WPbz0=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.17) by
 MWHPR15MB1645.namprd15.prod.outlook.com (10.175.135.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Sat, 13 Jul 2019 00:51:31 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::4129:4e4d:8cfb:7d5e]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::4129:4e4d:8cfb:7d5e%4]) with mapi id 15.20.2052.020; Sat, 13 Jul 2019
 00:51:31 +0000
From: Tao Ren <taoren@fb.com>
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Moving kernel to Linux 5.2
Thread-Topic: Moving kernel to Linux 5.2
Thread-Index: AQHVNwRhvcHfrTZBp0WwQ3mVC5Ndi6bHvC2A
Date: Sat, 13 Jul 2019 00:51:31 +0000
Message-ID: <509f66b3-1749-2dcd-6375-7b95abba46ce@fb.com>
References: <CACPK8XfLruW7RN+6G=eAjuY_pKPRbTVBs8aueJs==6QzmhDY2w@mail.gmail.com>
In-Reply-To: <CACPK8XfLruW7RN+6G=eAjuY_pKPRbTVBs8aueJs==6QzmhDY2w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR0201CA0043.namprd02.prod.outlook.com
 (2603:10b6:301:73::20) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:22::17)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:180::1:985f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2e460fc-a4df-4a32-3251-08d7072c3eb6
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1645; 
x-ms-traffictypediagnostic: MWHPR15MB1645:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <MWHPR15MB16452DC440BD72B4EDA7B73EB2CD0@MWHPR15MB1645.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:71;
x-forefront-prvs: 00979FCB3A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(346002)(366004)(39860400002)(396003)(376002)(136003)(189003)(199004)(6506007)(81166006)(81156014)(102836004)(8676002)(46003)(486006)(86362001)(476003)(71200400001)(64126003)(14454004)(53546011)(68736007)(25786009)(52116002)(99286004)(386003)(2616005)(11346002)(64756008)(478600001)(66946007)(71190400001)(2906002)(5660300002)(6306002)(6486002)(6436002)(110136005)(229853002)(65956001)(8936002)(6116002)(65826007)(66556008)(66446008)(966005)(76176011)(316002)(36756003)(7736002)(256004)(305945005)(66476007)(186003)(31696002)(6512007)(6246003)(53936002)(58126008)(31686004)(446003)(65806001)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1645;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ww/Qkm9fJceBvk8h+txSPsIrvDZb3zPWMocI0Tth5KU15mND6du4c2Bqnub2koIxlPSot0h/QiM+AJH9z2VbcK0UeDuPcWlUw0h286IZZ+IMSmkdlQ2o6DwtXJh7CS+FKRvbh7eTjBqlSW+Z9C6m48W1oVAvbYywfUeNurPRLTvOTbO4SAA+k2N9FCRO+4U/ql03iSe4IQ2FxlAiSbeakbV96Zf1nQ22p7VIGH2mAD9FHCA4pzl+iIXe5OtNiFuveIMkYtuH59xl01PBqfZ7zbAxG/kKnEfCv3Zkf/+fpL8pUqkM7gDieIkyO77DJWfd/Zqr/yH+dxHWAIFAQ/glhWiUimEsP2ffkfyUeyBlTaj31ClXfDZH9wYELvsS7suJtEF/9KekJb3FHXFPWIbcQGaVA4dAtIZ/HAhB4yFRxTg=
Content-Type: text/plain; charset="utf-8"
Content-ID: <74CDF40C4E41F348A68F2B84955B8230@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e460fc-a4df-4a32-3251-08d7072c3eb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2019 00:51:31.1140 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: taoren@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1645
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-12_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907130005
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gNy8xMC8xOSAyOjQ2IEFNLCBKb2VsIFN0YW5sZXkgd3JvdGU6DQo+IEl0J3MgdGhhdCB0aW1l
IGFnYWluLiBJJ3ZlIHB1c2hlZCBhIGRldi01LjIgYnJhbmNoIHRvIG9wZW5ibWMvbGludXgNCj4g
dGhhdCBjb250YWlucyB0aGUgcGF0Y2hlcyBmcm9tIGRldi01LjEgcmViYXNlZCBvbiB0b3Agb2Yg
djUuMi4NCj4gDQo+IFRoZSBidW1wIGlzIGluIHRoaXMgY29tbWl0Og0KPiANCj4gIGh0dHBzOi8v
dXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0zQV9fZ2Vycml0Lm9wZW5i
bWMtMkRwcm9qZWN0Lnh5el9jX29wZW5ibWNfbWV0YS0yRGFzcGVlZF8tMkJfMjMzNDQmZD1Ed0lC
YVEmYz01VkQwUlR0TmxUaDN5Y2Q0MWIzTVV3JnI9aVlFbFQ3SEM3N3BSWjNieVZ2VzhuZyZtPUZZ
QVBjcWNGaHBGX1dlY1I1a1huVG9tWmZPdng3VlRLQldRWmtPdzkySTAmcz1QSVktbWN4cXVXdWxL
YTNyNmdsTk9La3hwUm9MVmJSSmI5cHVPaUFENThnJmU9IA0KPiANCj4gTm90ZSB0aGF0IHRoZXJl
J3MgYSBzeXN0ZW1kLW5ldHdvcmsgYnVnIGV4cG9zZWQgYnkgdGhpcyBjaGFuZ2Ugc28geW91DQo+
IHdpbGwgbmVlZCB0aGlzIGNvbW1pdCB0byBkbyBhbnkgdGVzdGluZyAob3Igd29yayBhcm91bmQg
dGhlIGlzc3VlIGJ5DQo+IG1hbnVhbGx5IGJyaW5naW5nIHVwIHRoZSBkZXZpY2UpOg0KPiANCj4g
IGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0zQV9fZ2Vy
cml0Lm9wZW5ibWMtMkRwcm9qZWN0Lnh5el9jX29wZW5ibWNfbWV0YS0yRHBob3NwaG9yXy0yQl8y
MzQxMiZkPUR3SUJhUSZjPTVWRDBSVHRObFRoM3ljZDQxYjNNVXcmcj1pWUVsVDdIQzc3cFJaM2J5
VnZXOG5nJm09RllBUGNxY0ZocEZfV2VjUjVrWG5Ub21aZk92eDdWVEtCV1Faa093OTJJMCZzPU1h
eVl2QkJpMUNEZTRSR0Y5TE9IUC0zbG1Ha2xvUWlNRjNQQ1pZRl8wblEmZT0gDQo+IA0KPiBQbGVh
c2UgdGVzdCwgKzEgYW5kIHJlcG9ydCB5b3VyIHJlc3VsdHMuDQoNCisxLiBCb290ZWQgdXAgbGlu
dXgtNS4yIG9uIEZhY2Vib29rIENNTSBBU1QyNTAwIEJNQyBhbmQgZXZlcnl0aGluZyBsb29rcyBu
b3JtYWwuDQoNCkJUVywgSSBtZXQgMiBiaXRiYWtlIGZhaWx1cmVzIHdoaWxlIGJha2luZyBsaW51
eC1hc3BlZWQtNS4yLiBCZWxvdyBhcmUgbXkgd29ya2Fyb3VuZHMsIGp1c3QgaW4gY2FzZSBvdGhl
cnMgaGl0IHRoZSBzaW1pbGFyIHByb2JsZW06DQoNCjEpIHNjcmlwdHMvbWttYWtlZmlsZSBmYWls
cyB3aXRoICJyZWFscGF0aDogY29tbWFuZCBub3QgZm91bmQiDQoNCkknbSBzdXNwZWN0aW5nIGl0
J3MgY2F1c2VkIGJ5ICRQQVRIIGVudmlyb25tZW50IHZhcmlhYmxlIHVzZWQgYnkgbXkgImJpdGJh
a2UiIGJlY2F1c2UgInJlYWxwYXRoIiBpcyBpbnN0YWxsZWQgb24gbXkgbWFjaGluZS4NCk15IHdv
cmthcm91bmQgaXMgcmVwbGFjaW5nIHJlYWxwYXRoIHdpdGggL2Jpbi9yZWFscGF0aCBpbiBzY3Jp
cHRzL21rbWFrZWZpbGUuDQoNCjIpICJiaXRiYWtlIiByZXBvcnRzIFFBIElzc3VlOiBtb2R1bGVz
LmJ1aWx0aW4ubW9kaW5mbyBpbnN0YWxsZWQgYnV0IG5vdCBzaGlwcGVkLg0KDQpJdCdzIGJlY2F1
c2UgSSdtIHN0aWxsIHVzaW5nIG9sZCB2ZXJzaW9uIHlvY3RvIChyb2NrbykuIEkgbWFudWFsbHkg
YXBwbGllZCBiZWxvdyBwYXRjaCB0byB3b3JrYXJvdW5kIHRoZSBpc3N1ZToNCmh0dHBzOi8vcGF0
Y2h3b3JrLm9wZW5lbWJlZGRlZC5vcmcvcGF0Y2gvMTYyMTg2Lw0KDQoNCkNoZWVycywNCg0KVGFv
DQo=
