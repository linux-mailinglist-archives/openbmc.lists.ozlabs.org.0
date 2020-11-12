Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7912AFD67
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 02:56:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWl8D2hx5zDqxG
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 12:56:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=85857ee873=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=Y2yApJ4r; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=Z8gjupaT; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWl7G5GXZzDqZl
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2020 12:55:52 +1100 (AEDT)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AC1tPpo007317; Wed, 11 Nov 2020 17:55:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=jh9Hawst36u/u90Acr2xVCV2+0Td/1lEkn+W5Q1Xrq0=;
 b=Y2yApJ4rs3nWDzrTGvqzzfJoluMRijw4g8iDvlllBhueH9mavtwxU7WHAc+bF4T+YF7c
 33Lb8RVFGhAQmTjQmWXWkQoK6nKA0BMd1waYmKbCClJnOtAw8/WZL8dP9/dVVlKXesU9
 /szcUlxHMqSRXYY1t18aJg2bitLZTu3R+rQ= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 34qye8sesm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 11 Nov 2020 17:55:48 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 11 Nov 2020 17:55:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PH+B2qeelwDADKjCVX0daeGvi4PLM5lv5DWST2xEOjRv6wcwZqmDFL7t9nK1xbVMBu/xn1lAob0B6/XnjFAza+K/3MhCRyKKHI16jikF8S4+JecMCYr2r91ayqTtQbxBuJm5bnIJsuepWxYsuEclVsLc0y1FZ5ugZuSNJwtZNRB//frxsOFiaD36NjagUwYP/zdsulLcspnQHCuDttsi6lg6mAJ/GH4sk/aWbUL9R/r1Hx1gHujVS+OjojT7ByBe5LwlK80EUCU2Nd8CRgL/AcafubRWd+od5R+N3dRA9bJMS7T7lOEYn10U20Rt8GSY33Y90cl9nFT/AzzVDhZchQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jh9Hawst36u/u90Acr2xVCV2+0Td/1lEkn+W5Q1Xrq0=;
 b=YvB9eNv11C085GEdbhd8u1Ym6K9Al9rKSHBM/KA+8kc+bmXYgqf4BO4YfC1E4VWWSI2l6yAWZkSJTlsP468IqwwhYmHgK91ogFR7Oh8AI8+k5CISbxxEdGbtzu3JVw3WCCkUViLUFzcYqtwl/5hIeHIJRaHURC/OPFVOC16FvVi0jLS+R9UGCdxCA8DC4KIVhPhcwGrYA68KcjtVD8pNX0SmoN7EDhwDC/2Ie6F8/bX8Tt5J1IH6GwgRLPeXjlVaqfuvkWl6Ly5LP3rDVR+imOFcLNnNp9BDZkAADC8cbKoQ6yHa83lhKAlACFRXvY9BjO83wCjQLmehU3QdiCnh5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jh9Hawst36u/u90Acr2xVCV2+0Td/1lEkn+W5Q1Xrq0=;
 b=Z8gjupaT6HTuySLMqPEMB1Q7DrIYFtMjvIrHRzmpGAbW1+8V6zuwyslT/alkuby7b9KedwLLM04UzyXuEf0uA7PffiBY/VhLjI7OAlcYPCbtxDfWqTbkAGXJUGhjC8sVKlBet+hIawAeXRs8ZArr62U35OA2ouImtRIOLV5WrXo=
Received: from BY5PR15MB3537.namprd15.prod.outlook.com (2603:10b6:a03:1f5::20)
 by BYAPR15MB3111.namprd15.prod.outlook.com (2603:10b6:a03:b4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 12 Nov
 2020 01:55:45 +0000
Received: from BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::35ef:5d5d:6617:e58a]) by BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::35ef:5d5d:6617:e58a%6]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 01:55:40 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Yi-Fan Lee <Yi-Fan.Lee@fii-usa.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: phosphor-bmc-code-mgmt got "Remote peer disconnected" issue
Thread-Topic: phosphor-bmc-code-mgmt got "Remote peer disconnected" issue
Thread-Index: AQHWsLzPunibUsrAiUu0dqWT1AFcFqnDRkGA
Date: Thu, 12 Nov 2020 01:55:39 +0000
Message-ID: <61A2F921-5A9C-44D2-912D-036DF5362FED@fb.com>
References: <MWHPR0801MB3707BC66393F7A5D7D8FEE098F100@MWHPR0801MB3707.namprd08.prod.outlook.com>
In-Reply-To: <MWHPR0801MB3707BC66393F7A5D7D8FEE098F100@MWHPR0801MB3707.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fii-usa.com; dkim=none (message not signed)
 header.d=none;fii-usa.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:49ba]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14d4cb33-b7b9-47f8-5b7a-08d886ae0e98
x-ms-traffictypediagnostic: BYAPR15MB3111:
x-microsoft-antispam-prvs: <BYAPR15MB3111247A2A1D9EECE19F5D7FDDE70@BYAPR15MB3111.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EFbAZVbZfM+sDCxT9BEWoOPaIzlP8rL17EUg1wqtX5hqEt4u33pXr/WGIdb5KeS5V9hmsm3t4mvJj/rA3pRK7rDqLv92xtruSxrmmuO0y9AAKLAQz7TZIntL6ZdwmX08/sti00y9sKEdVdOy47oz2jX9CemvduU8XtzbD9vbY/9HyiuFoNtRbHSfZZRlNzLluoOKNFIGAJrVPIBtmC2nvb6L9hRHycQ8fU1ddb5WcBTAld8Kmc8paIlfVdz4aKaUXSEUDex/e5KcT439//tjn507KtvIWN+GWjKGAzvH3SHAFGtYYCqWd78C7C8zvtV1Joess9l4KJoCdbxbfy+5gA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3537.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(366004)(136003)(376002)(346002)(2906002)(110136005)(6486002)(66476007)(36756003)(5660300002)(64756008)(186003)(83380400001)(8936002)(66556008)(316002)(86362001)(66446008)(2616005)(6506007)(71200400001)(478600001)(66946007)(53546011)(33656002)(91956017)(6512007)(76116006)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: KFf146+TdPtuxwBwH6dYtZpaeyhQNc6Ie3cBvli4BtHuWcEfB1dVyZCI6g7g2nMmAacyQth4J+Dwla+JcFKCxpqsa7voZ1UBoP8OcA96nO1AhSKVLZqC48SXMgko9o/qtdiwOOR+N7Bq9q1RpuwrC/5U3Qh0gGZaZuulxOA8XeOhEij4+BVAlHX3aKdMG7/xrt9B3xZGrNbC5EwWdcNK+JIfZzXH+uzq4IkB+LtkK9lyksYiUa2D2zBgOKDNDagpEsOXmPm8qoCVtXd/xQOZv4lLA5Lg4o6Fe7vB910dDYLROWlwJ6yskaY/ZSVYj4oGQWAY4efig7hU8faxjvAnwGmvcFrWfJFqZks7CQG+Nc3VmiwCrS/pm59xGFYt6DztY2F5RQPOAkbI5hR0m4I6hRNmkNXDmsilRvkvEVJNIK1kHyWRXaDrwCiUR+BOAdmskFbfg4T0mlLHFBxSSqGyQTYcwJ1exBPCm09Eay7NjyXon7BYb/aQqnNq41HI2ApRtp0otZ+hC2UMbjs7/pSgO++xI1cL7f923D7UMSKOLlJ5Hz86byTab+yn4MM/iuP8VZPZJTDmVtsP4jaxIYQ8vHNHMRux8YAPfuxWDxTcuAFSWDW5k5yuVDpI/IfwM5sm/3bc0vXM2mz/+adfVMX1SZVvc/QoZpAQulcS4I0d77C8JCMaZzeRJdsxXfrzAMPH
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E21B7F660F496F4EB14C2CE7EB816025@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3537.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14d4cb33-b7b9-47f8-5b7a-08d886ae0e98
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2020 01:55:39.8843 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 56vjDi9/cRpt9RSiujvIJ67fHpekullNgdQEmKgGfvH9F8uoGcHE0CS+EuwfTNvY0cN+44eBlt2kWrdT3nXuaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3111
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-11_12:2020-11-10,
 2020-11-11 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 mlxlogscore=999 clxscore=1011 priorityscore=1501 mlxscore=0 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011120009
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

SGkgWWksDQpQbGVhc2UgZ2l2ZSBkZXRhaWxzIGFib3V0IGhvdyBhcmUgeW91IHVwZ3JhZGluZyBC
TUMsIEkgYW0gYXNzdW1pbmcgdGhhdCB5b3UgaGF2ZSBjb3BpZWQNCiBibWMgaW1hZ2UgYW5kIGxv
b2tlZCBhdCBzaGEgdmFsdWUgd2hpY2ggeW91IHVzZWQgZm9yIGFjdGl2YXRpb24uIE15IGd1ZXNz
IGlzIHlvdSBoYXZlDQp0cmllZCB0byB1c2UgZXhpc3RpbmcgYm1jIHZlcnNpb24gc2hhIHZhbHVl
Lg0KDQpSZWdhcmRzDQotVmlqYXkNCg0KRnJvbTogb3BlbmJtYyA8b3BlbmJtYy1ib3VuY2VzK3Zp
amF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMub3JnPiBvbiBiZWhhbGYgb2YgWWktRmFuIExl
ZSA8WWktRmFuLkxlZUBmaWktdXNhLmNvbT4NCkRhdGU6IFN1bmRheSwgTm92ZW1iZXIgMSwgMjAy
MCBhdCA2OjI2IFBNDQpUbzogIm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZyIgPG9wZW5ibWNAbGlz
dHMub3psYWJzLm9yZz4NClN1YmplY3Q6IHBob3NwaG9yLWJtYy1jb2RlLW1nbXQgZ290ICJSZW1v
dGUgcGVlciBkaXNjb25uZWN0ZWQiIGlzc3VlDQoNCkRlYXIgYWxsLA0KDQrCoMKgwqAgSSB0cnkg
dG8gYWRkIHVwZ3JhZGluZyBDUExEIGZpcm13YXJlIHdpdGggaW4gcGhvc3Bob3ItYm1jLWNvZGUt
bWdtdC4gSSBmb2xsb3cgdGhlIHdheSB0byB1cGdyYWRlIEJJT1MgLSB3aGljaCBtZWFucyBJIGNy
ZWF0ZSB0d28gZnVuY3Rpb25zIGZvciBoYW5kbGluZyBwcm9wZXJ0eSB2YWx1ZSBjaGFuZ2VzIG9u
IEQtQnVzICJ4eXoub3BlbmJtY19wcm9qZWN0LlNvZnR3YXJlLkJNQy5VcGRhdGVyIiBhbmQgdXBn
cmFkaW5nIENQTEQgZmlybXdhcmUuIFRoaXMgcGFydCB3b3JrcyBmaW5kLCBJIGNhbiBhY3R1YWxs
eSB1cGdyYWRlIENQTEQgZmlybXdhcmUuIEkgY2FuIHVwZ3JhZGUgQ1BMRCBmaXJtd2FyZSBtYW55
IHRpbWVzIEkgd2FudCB3aXRob3V0IHByb2JsZW1zLiBCdXQgSSBmb3VuZCBhbiBpc3N1ZSBhYm91
dCB1cGdyYWRpbmcgQk1DIGZpcm13YXJlOyBhZnRlciBJIHN1Y2Nlc3MgdXBncmFkaW5nIENQTEQg
ZmlybXdhcmUsIEkgYWx3YXlzIGdvdCBhbiBlcnJvciBpZiBJIHRyeSB0byB1cGdyYWRlIEJNQyBm
aXJtd2FyZS4gSSBhbHdheXMgZ290ICJSZW1vdGUgcGVlciBkaXNjb25uZWN0ZWQiIGVycm9yLg0K
DQrCoMKgwqAgTXkgZGVzaWduIGFib3V0IHVwZ3JhZGluZyBDUExEIGlzIGZvbGxvd2luZyB0aGUg
c3RlcHMgZm9yIHVwZ3JhZGluZyBCSU9TLiBJJ20gcXVpdGUgc3VycHJpc2VkIHRvIHNlZSB1cGdy
YWRpbmcgQk1DIHdpbGwgZmFpbGVkIGFmdGVyIEkgdXBncmFkaW5nIEJNQy4gRG9lcyBhbnlvbmUg
Y2FuIGdpdmUgbWUgc29tZSBoaW50cyBmb3IgdHJhY2luZyB0aGlzIGlzc3VlPyBJIGNhbiBwcm92
aWRlIG1vcmUgaW5mb3JtYXRpb24gaWYgeW91IG5lZWQuDQoNCkJlc3QgUmVnYXJkcw0KDQrCoMKg
wqAgWWktRmFuIExlZQ0KDQo=
