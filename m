Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEB513600B
	for <lists+openbmc@lfdr.de>; Thu,  9 Jan 2020 19:18:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tvVt53s2zDqc6
	for <lists+openbmc@lfdr.de>; Fri, 10 Jan 2020 05:18:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=8277eb337b=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=auR1+yZE; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=M7E8dhQc; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tvV93YjzzDqYB
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jan 2020 05:17:28 +1100 (AEDT)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 009I9gGa015020; Thu, 9 Jan 2020 10:17:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=qPoE1mjsEk3+Y8OvgB7sdNvXTZyy4s3TtDkM+k5URG8=;
 b=auR1+yZEkf+xMCLl1ZLfCkFBQbKk47/XARDlm0cGNGa2K93od4rKGPfB1+4Cv8Hac5rN
 rBNKYf5Xhl3/F+O0xsxNnCIWARi6q7H1//YtB960D5NlsltxK7DhVZe4e64AreD/Eh3/
 HzA8UikwlNQc5nhfXU1ztzp1F3pZXTr8HyE= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2xcy1vvj2h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 09 Jan 2020 10:17:19 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.102) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 9 Jan 2020 10:17:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3gmd5fT8ecDvzEbz8qBjn39pqP1029gKvttGLmxjw9FnqEDHJ8/oS1qvKrzOcu0H4qjXSYjFPpGrP7HbeTOKz5bQgEWI5x1zkXL0xNi+WL3P7ZT6GZqlvEnkK9Sky4yL8nD+r+ysSiXGfMil0s/H92ac2XV9aLiXjtsTdK4G5ap21IPHQazpgRmJMjdH+OezmnbfY1zuU4NLlv0ky7G1OoGbt80Xfvhnm6WxybENsN+rU0/sKzKaDDTnUyIOWeBSSQFBb1A6OeeQEu2DHd62CopkmHE/E8c2DcePW/pYqQdF/pSDmNXyL6MY8+3f9Nza88nG8bPeAxYaRPm3qHo2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPoE1mjsEk3+Y8OvgB7sdNvXTZyy4s3TtDkM+k5URG8=;
 b=Rwny8eRRwbj7bY1trHxjVJy8a+kBLsJKL+YM8oZXEQcF205eNVxEXhpNfYEkscyKZTuNq2zv0sS8YlY4TSwr/Ug7+uDnawDWqHxtYH3vSb6fOUl3aDXyP7Z8KMuXS6X4XGixAiKMYUUvKOGum/ckZY0O7D3Hqfn+YbQLPhSp7wTqhyHOZKjYIKiAgb05ZX0DDzT0lOSYExxHZ+obYEmxzdhy0xGgJLYMEMXpDEEcOCB5VnEW0aGs5VJzajFtoF017fnoDD0KoneQdiH7KB9O0JU3GidODYHPKD7PI0l+Kwo+6A85rqx3hGMKSJpRtqOM+OJrFhbi8HIaeg5HSiUCMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPoE1mjsEk3+Y8OvgB7sdNvXTZyy4s3TtDkM+k5URG8=;
 b=M7E8dhQcMgNr2nxzkI2O3a98ReBHASWepILg0sT8RRdJaDpakPutyhRD3DDhzbGqdYxP33yftqR4PlrPoJPKkB5Y4M8rIXKbrrPO2Yp62L2weLqVz80Y60i6v9DCP5tbD4RNR21/x4EeitFBEgDzQxCEpG9WM0M+wJ23iyklvI0=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1853.namprd15.prod.outlook.com (10.174.255.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Thu, 9 Jan 2020 18:17:04 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2%8]) with mapi id 15.20.2623.011; Thu, 9 Jan 2020
 18:17:04 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Andrew Jeffery <andrew@aj.id.au>, Sharad Khetan <sharad.khetan@intel.com>, 
 rgrs <rgrs@protonmail.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: MCTP over PCI on AST2500
Thread-Topic: MCTP over PCI on AST2500
Thread-Index: AQHVn2VJNP7At+t4ekie9daSxgPplKeTGawAgACHvoCAAroxAIAtjP6AgB34y4CAAIuwgA==
Date: Thu, 9 Jan 2020 18:17:03 +0000
Message-ID: <DEDED966-177F-472A-B9EE-677A3114743A@fb.com>
References: <gqnvvFdbRiXJzS3sVr0pSSo8kD6KjPbFMgg8CV1tsi0cKt0zT5mrnSTfBB1cpiOt-MVrXNzlg95DqgWZ3AxD8zOyEbFYRykqjP-DxEW4Mww=@protonmail.com>
 <037D4669-D49C-4DF8-B49B-4F3BD97451AE@fb.com>
 <865C376D1B77624AAA570EFEF73CE52F9E08757B@fmsmsx118.amr.corp.intel.com>
 <3502e928-40c5-41d9-9ff1-5aa199e0e31b@www.fastmail.com>
 <865C376D1B77624AAA570EFEF73CE52F9E0E4E3E@fmsmsx118.amr.corp.intel.com>
 <8a1fc80f-9d25-4c38-bdcd-df05c4194fe7@www.fastmail.com>
In-Reply-To: <8a1fc80f-9d25-4c38-bdcd-df05c4194fe7@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:79ae]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 649d8a58-d48e-414a-6308-08d7953020ff
x-ms-traffictypediagnostic: MWHPR15MB1853:
x-microsoft-antispam-prvs: <MWHPR15MB185347057BD85501CAF3CA77DD390@MWHPR15MB1853.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02778BF158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(346002)(136003)(376002)(396003)(189003)(199004)(6506007)(4744005)(6512007)(8936002)(4326008)(71200400001)(186003)(5660300002)(316002)(66946007)(8676002)(64756008)(6486002)(66556008)(33656002)(54906003)(478600001)(36756003)(110136005)(66476007)(66446008)(86362001)(2906002)(2616005)(81166006)(81156014)(76116006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1853;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NsFXR8lejm8C15Nc3Zw8xmJCe7KiIBrVqvgIxD8qT0jFhpfNWTDF4gkMT5IF8FxIJu+G6cAZp2ELN5hUEFtkiIjSSkGZi9UIsjVE+LQNGXpeI3tLqGxfFngefGOQp5J4OcAA122mjkSjUtQY4P4mGpfiPIxFJjB7rxKvk/HJNcrIKmNbJatZ60DoSTetzvh/wiurrsYZk4a4utx4gFthS+F8wrHPCV4001v+BvYt/M1lA1gY65v/gzQ3tvadBWEBGE1Iwp++iSd5NL+bCtba0Ff0XWdmSF3W2qo06kRHCIBx9Db9I4gg32AgVbHINeSpXt8iEqnScw1zGQqyPG0e6fJ733wJppm8WfIBKW8u209qEfxfespky1kxza2WaMHURLdbVOUhTaZRS9dSAse1vSA9x9N4KKdqIRKpYnwbbO/IvlINrBClt/m4MwESm/uu
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB7B3517E9B79244987453B2DFE15FD6@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 649d8a58-d48e-414a-6308-08d7953020ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2020 18:17:03.9331 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3A56QGtJAIoQMCWaKyOka4GDXo+vYM/habxR9C3gFjU8F/Y1m0Xc8MdyN5ZYQ2wS48+6iJg1YEApUIujBaNa1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1853
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-09_03:2020-01-09,
 2020-01-09 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1011
 impostorscore=0 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 mlxlogscore=335
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001090150
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

VGhpcyB3aWxsIGJlIG11Y2ggYmV0dGVyIGlmIGltcGxlbWVudGVkIGluIGtlcm5lbC4gDQoNCi1W
aWpheQ0K77u/T24gMS84LzIwLCA1OjU1IFBNLCAiQW5kcmV3IEplZmZlcnkiIDxhbmRyZXdAYWou
aWQuYXU+IHdyb3RlOg0KDQogICAgDQogICAgDQogICAgT24gU2F0LCAyMSBEZWMgMjAxOSwgYXQg
MTA6NDUsIEtoZXRhbiwgU2hhcmFkIHdyb3RlOg0KICAgID4gSGkgQW5kcmV3LA0KICAgID4gU29y
cnkgZm9yIGxhdGUgcmVzcG9uc2UuDQogICAgPiBUaGUgcGxhbiBpcyB0byBoYXZlIE1DVFAgaW4g
dXNlciBzcGFjZS4gDQogICAgPiANCiAgICANCiAgICBIb3cgYXJlIHlvdSBoYW5kbGluZyB0aGlz
IHRoZW4/IG1tYXAoKSdpbmcgdGhlIEJBUiBmcm9tIHN5c2ZzPw0KICAgIA0KICAgIEkgcGxhbiB0
byBnZXQgYmFjayB0byBpbXBsZW1lbnRpbmcgaW4ta2VybmVsIHNvY2tldC1iYXNlZCBNQ1RQIHNo
b3J0bHkuDQogICAgVW5mb3J0dW5hdGVseSBpdCBzbGlwcGVkIGJhY2sgYSBsaXR0bGUgaW4gbXkg
cHJpb3JpdHkgbGlzdCBsYXRlIGxhc3QgeWVhci4gSSdkIGJlDQogICAgaW50ZXJlc3RlZCBpbiB5
b3VyIGZlZWRiYWNrIG9uIHRoZSBwcm9wb3NhbCB3aGVuIEkgZ2V0IHNvbWV0aGluZyB3cml0dGVu
DQogICAgZG93bi4NCiAgICANCiAgICBBbmRyZXcNCiAgICANCg0K
