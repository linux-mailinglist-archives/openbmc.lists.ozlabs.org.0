Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1658131C93
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 00:56:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sC8633PdzDqS9
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 10:56:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=8274c753a8=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="K4PeHeB3"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="FgXGZ4hO"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sBqM03gmzDqKK
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2020 10:41:33 +1100 (AEDT)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 006NXfGX028922; Mon, 6 Jan 2020 15:41:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=hc4SfsWK8aRfum34QP8JX8ew6mkOIj0gasJ+muLD69g=;
 b=K4PeHeB3VeU6i5SFGcZKBzpP9yo/EChO0mBg2rw28B2ho+peJlIzpDS8eeMkwW4YgplQ
 1eerIQCCQw4OEwNdC7eOEB2xm+KpDb6ggCg2Pes5JzXqHnNzFhk0wfhwAG3O2hVUz3gK
 9Ccvt5Ho+Tu00c2ppB0cQ/Fkd2jPTZwQxLc= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2xasdpb5yx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2020 15:41:30 -0800
Received: from prn-hub03.TheFacebook.com (2620:10d:c081:35::127) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 6 Jan 2020 15:41:29 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Mon, 6 Jan 2020 15:41:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IsYDV5p/J7ZoA/nRVZumd34jjZqmbBkXNVT0Btg2G+P6keyxXhtUCcBNnOr8VPs9zN8tSVKgawKGP2VqAzBGn3kcaP1kwHNKjfVbRsh6/3JGFfUV3k5gP2nwOtCAvlzfPOyMLv5DfMI4921e3+rebRIhA2gPNWM/H8fSQhLjwpBcogcyeImXo1o5nEn+54+WInEn0CXITyxJV0Q4Jt0OiW5L7rBlEui13a+eBQ/pjifdT8y1T+FcW1CZkniz+QzfC04T7kU25cFaIwv4jTfPCHmTylTqi12NMv2xJvDCeI1YCquawLUjE3I//06nUAwk0vh6O5cw6F8ygzDVs80/9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hc4SfsWK8aRfum34QP8JX8ew6mkOIj0gasJ+muLD69g=;
 b=dln/WE+iicqPgXBodtUbBESuPelMUkE/9sqjDA42rXy+r913cq/gLzY6Fz6hMqvNn88fbXi63NMySOzEqwL8DAQpBGB27zDOtW1F76wuqh1KM61iLDHiPmjej/RBX1VqWgGvBkWKT8gJgV1DTXJVH4AfTiNekstmyEXvsbHZiqqVXtzabzh1y2MPdp4HcGbbWl4D0LiCw8ACwWHWbGirEdEg9y13SSIYp1noC5/9NiV0bUhrhdbXkvSOvSom7dvwt3CdSd0qei/F2w2hnxXJg6vkykotzj1NOk0H56ZU3bQSvS4rqwX0JY89sVqsxqbXRkjz7nQNqvnktS5zZ6ZT7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hc4SfsWK8aRfum34QP8JX8ew6mkOIj0gasJ+muLD69g=;
 b=FgXGZ4hOAuntY+DZVoBEerOX1G4sG7Quw3njGh8m9uJFp6kmoVawzv0S849Xviz1EOREH2hTHpu0P0WAR7vtXRnwlFxkVrXGSQibf79fhDTzlsVjIhKcF4VYdv6P/OHrEJ8EsA7x5UOhVIcmbTb04yPmcfk1MgOnA2KzHAIxz64=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1424.namprd15.prod.outlook.com (10.173.234.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.10; Mon, 6 Jan 2020 23:41:28 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2%8]) with mapi id 15.20.2602.015; Mon, 6 Jan 2020
 23:41:28 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: Pulling ipmb patch
Thread-Topic: Pulling ipmb patch
Thread-Index: AQHVteXlUA+yq0HfFUSSV9onCJICoqfeYIAA//+DOIA=
Date: Mon, 6 Jan 2020 23:41:28 +0000
Message-ID: <4C8D120D-AFF5-441C-A399-0A210A64721C@fb.com>
References: <C8678983-8901-4E16-94BB-6C6AF0959B62@fb.com>
 <CACPK8XfhySvWLCTAR54Z8cjW0ne0-W1WFifk4=pKL50J3bGU_Q@mail.gmail.com>
In-Reply-To: <CACPK8XfhySvWLCTAR54Z8cjW0ne0-W1WFifk4=pKL50J3bGU_Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:889a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da77fbd6-e1ea-4632-a410-08d79301f36c
x-ms-traffictypediagnostic: MWHPR15MB1424:
x-microsoft-antispam-prvs: <MWHPR15MB1424A0F429461348ACE361D3DD3C0@MWHPR15MB1424.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0274272F87
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(376002)(136003)(396003)(346002)(43544003)(199004)(189003)(66556008)(86362001)(7116003)(66476007)(66946007)(66446008)(71200400001)(64756008)(76116006)(5660300002)(316002)(966005)(186003)(8676002)(6916009)(2616005)(81166006)(81156014)(33656002)(6506007)(478600001)(8936002)(3480700007)(36756003)(4744005)(6486002)(2906002)(4326008)(6512007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1424;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7bJ87+7QWk3cewNzUPtyM8MfpcvnUfIuwJKMvcajbZiK0sfogeYY3yseR/+nx9hpJWey111S03umQnkEQTfsdooFp2zE50Ol7SZkR0HJcshbnideDgpgkLIhZnZUol2cMmM7CQLnS/7W4Xe+eaoM+gzUbtEXBDVgVvjBci5h06dxyS56YVuideXGCr1Yq65P0epy/C3rkonutZaM1KcMOyoXo841RFn0XO7uHs/PV1DhQEC11DDbeBCSjJwaDy1naic2vAICMSe1E+PUT6LS3MylYLHN7WbL3VZC/iTtKAGUzjbBc3pnME5TEuWuBdev3n07AaYFD0UQu/8Zy/kp1Ch/VBa/gQ1keQ5rK/2ifIO6L8RqAdl6GlERYHB6j+qVhIi9qZotjeWDFIQkNyfBDUQtbRI8SPLiRx6V45d74LSYrfJgO9TnxMYf8zWdZWqj8q/fR6eB5H4vhQTmh5JUujBmxX8qeNUwSWDTt3O9lTRKXZLo0LLW53jr5kznZS+4Y6JZwK3+Hcuz0oSNdRHnlKO+f1iSoUsBEGqBhct2GXE=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E88AEF6C0BE86948A026F3142C4D06D1@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: da77fbd6-e1ea-4632-a410-08d79301f36c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2020 23:41:28.2489 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b3aMJdK/KcZ1YRfOVxBxs3YWRqhwV5nIXJu9y9M8SiJ0kfL+un3nZJ3v75sskkFR/C36usIqebjQaVtxqJoe8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1424
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-06_08:2020-01-06,2020-01-06 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 adultscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001060190
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDEvNi8yMCwgMzowOCBQTSwgIkpvZWwgU3RhbmxleSIgPGpvZWxAam1zLmlkLmF1
PiB3cm90ZToNCg0KICAgIEhpIFZpamF5LA0KICAgIA0KICAgIFlvdSBzZW50IHRoaXMgbWFpbCB0
byB0aGUgd29ybmcgbGlzdC4gVGhlIGxpbnV4LWFzcGVlZCBsaXN0IGlzIHdoZXJlDQogICAgYXNw
ZWVkIHJlbGF0ZWQgcGF0Y2hlcyBmb3IgdGhlIG1haW5saW5lIGtlcm5lbCBzaG91bGQgZ28uIElu
c3RlYWQgdXNlDQogICAgdGhlIG9wZW5ibWMgbGlzdCBmb3IgdGhpcyBraW5kIG9mIGRpc2N1c3Np
b24uDQoNClNvcnJ5IEpvZWwsIEkgd2lsbCB0YWtlIGNhcmUgb2YgdGhpcyBuZXh0IHRpbWUuDQog
ICAgDQogICAgT24gV2VkLCAxOCBEZWMgMjAxOSBhdCAyMDo1OCwgVmlqYXkgS2hlbWthIDx2aWph
eWtoZW1rYUBmYi5jb20+IHdyb3RlOg0KICAgID4NCiAgICA+IENhbiB5b3UgcGxlYXNlIHB1bGwg
SVBNQiBwYXRjaGVzIGZyb20gQ29yZXkgZm9yTmV4dCB0cmVlIGFzIGJlbG93IGludG8gb3VyIExG
IGtlcm5lbC4NCiAgICANCiAgICBUaGVyZSBpcyBubyBzdWNoIHRoaW5nIGFzIGEgIkxGIGtlcm5l
bCIuIERvIHlvdSBtZWFuIHRoZSBvcGVuYm1jIGtlcm5lbD8NCg0KWWVzIEkgbWVhbnQgb3BlbmJt
YyBrZXJuZWwuDQogICAgDQogICAgPiBXZSBuZWVkIHRoaXMgZm9yIGlwbWJicmlkZ2UgYXBwbGlj
YXRpb24uDQogICAgPg0KICAgID4gaHR0cHM6Ly9naXRodWIuY29tL2NtaW55YXJkL2xpbnV4LWlw
bWkvY29tbWl0LzBkODYzM2JmNTMxMTE3N2M5YTI2ZDc1ZGFlYzY3N2NkODdlMzI2MWIjZGlmZi03
NzA4ODUzMjQ0ZTViZjhjZDEwZDIwNWVlMWY1ZGMyYw0KICAgID4gaHR0cHM6Ly9naXRodWIuY29t
L2NtaW55YXJkL2xpbnV4LWlwbWkvY29tbWl0LzA0MmYwNTdmZTJkY2YzODY4MmQ4NWQ5Zjg4ZGYw
MGQxYThkNDVkYmQNCiAgICA+IGh0dHBzOi8vZ2l0aHViLmNvbS9jbWlueWFyZC9saW51eC1pcG1p
L2NvbW1pdC8zODA2NjViZWNkZWViNGY0NTVjMjM1ODJiN2YzMmU2YjNjZWEyN2QyDQogICAgDQog
ICAgSSd2ZSBhcHBsaWVkIHRoZXNlIHRocmVlLiBXZWxsIGRvbmUgZm9yIHN1Ym1pdHRpbmcgdGhl
bSB1cHN0cmVhbSBmaXJzdC4NCg0KVGhhbmtzDQogICAgDQogICAgQ2hlZXJzLA0KICAgIA0KICAg
IEpvZWwNCiAgICANCg0K
