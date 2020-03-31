Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D84DE199FF9
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 22:33:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sLcq48twzDqyH
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 07:33:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=135935d244=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=G99yY66m; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=QWL8daoV; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sLbq44V1zDqw1
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 07:32:18 +1100 (AEDT)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02VKUpeJ012763; Tue, 31 Mar 2020 13:32:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=YJwP0Q985+mM0E7A0KfR7lNTFbf4dbmHV2PH9xnMn8Y=;
 b=G99yY66mF8Odj2etk+NrfG0Qz8T4advdPY30ZUoWXw9r99IcFNMuJ4eYhwl7PxAndqHC
 QddJmibyxUmE9LVaeY9shvAd/ItbkcdtTC23q0iRj9r3lkueLy4QB9w7C+SnkOYj7E1j
 HNGCUKcTrak9kfdovjJhzaZ1B5rTDmdhRF4= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 303d0j36w5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 31 Mar 2020 13:32:12 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Tue, 31 Mar 2020 13:32:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wv481I9Rf5pwXFhLMQqRODl6JOjNycq0IQ2z6ByftyKyTHIua+FTL4u6kDviHPrLdUseBFexUrDM0Xo0QU8iyxV0DPK0Kv6cKqAxIAzyH44drTqDyNNYH9UQmEZOvRyhSq9rA1poSZeM/z8PIL5Y2lbtNrCDxMrgIYgZasckQXrFurmqXPT99jyOmDAaTS9o5NGDKRIQlq5tLyWn9s8egfnOGupQfD8V8wiQq11meYSwF1r0c9GqWipG180eXNiWQcJ89bBBLjsL4WBghH3MVDwfcDMUP+Q9gzj2CSWrggNVTr2XXuZ7H9wDzxQpCYvscMNdrp0G7NJ/WIVpnp0YdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJwP0Q985+mM0E7A0KfR7lNTFbf4dbmHV2PH9xnMn8Y=;
 b=LH7jKE/Jjuh5dbQ09pBzRlTkC2u50gak+PE4Y9UFaOVA9QxxoUInCInesSQqy3Isk3IlnWBAJSSB2690it9FrQ3PyxnhWHWBYl+0nr/YpY/3JR0+ywvMlXoNvRrfzyUa5ihDHRmc/WVSrsflx8fQmSwHLhp5d8ECy9GpwGGh6QRg+r6nFpeBny+1QVPJSQAzowAK3B/rO9NIa8PilD1RX56X7b45boXl+JsZJ9i5slWeHMccGfZvHkm+ETewOuPGLP/9pVAaBLNM+UJZKV2LTJXSS2/F5K2vZPHk12yEcI8NDMxCiEAGrvJq2ecqnIrwg+16/qUKdwF74Hpj9SXKwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJwP0Q985+mM0E7A0KfR7lNTFbf4dbmHV2PH9xnMn8Y=;
 b=QWL8daoVP2cBqr1Bb80W9cK7VPtSaothvKgIF7aal5fZGifyPb7t0Z06kpTZ2yJ9tPZuqemHfFfLkPykankFHfhAVnCVMzWzCLmH2poLs0pu6BmXyxxauXjxgB/1N6LmhUdMXnz72Rd5RKT+NQ/QdfVjggtZT0O08nDMlZ87PcY=
Received: from MW3PR15MB3947.namprd15.prod.outlook.com (2603:10b6:303:49::9)
 by MW3PR15MB3900.namprd15.prod.outlook.com (2603:10b6:303:4f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Tue, 31 Mar
 2020 20:32:10 +0000
Received: from MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936]) by MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936%4]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 20:32:10 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Benjamin Fair <benjaminfair@google.com>
Subject: Re: Chassis sled cycle
Thread-Topic: Chassis sled cycle
Thread-Index: AQHWBs3CzC9IpdImME+X8ulcZoCifahi/JoA//+3WQA=
Date: Tue, 31 Mar 2020 20:32:10 +0000
Message-ID: <4EA88F1E-3B2E-45FC-8135-0A91A4CF84D8@fb.com>
References: <F69B446C-E70B-4B04-83A1-618A4F60E965@fb.com>
 <CADKL2t6nach67q57ca==uqHHEVCf=+F3PBOcQ1v0ZAazk6Yr+Q@mail.gmail.com>
In-Reply-To: <CADKL2t6nach67q57ca==uqHHEVCf=+F3PBOcQ1v0ZAazk6Yr+Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:51f6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 29f839ee-390b-44e1-0f12-08d7d5b296f4
x-ms-traffictypediagnostic: MW3PR15MB3900:
x-microsoft-antispam-prvs: <MW3PR15MB39008574F1E7CF5B53781CFFDDC80@MW3PR15MB3900.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR15MB3947.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(396003)(376002)(346002)(136003)(39860400002)(366004)(186003)(6916009)(7116003)(6486002)(81156014)(86362001)(316002)(81166006)(8936002)(36756003)(6512007)(4326008)(8676002)(71200400001)(6506007)(64756008)(66556008)(3480700007)(66446008)(76116006)(54906003)(5660300002)(2906002)(33656002)(966005)(66476007)(66946007)(478600001)(2616005);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4691nk/ps4uY6+qnNfMSAPSxt8LbroJZTk4HpT/guVS3m7IMCDw4p7ByOEG8yElJQAj/jD1JR5CDzt1jZQwbOYdJD5GMl8Yb3HtQqcKGNuBxccVaZ/tIRry4cIK+r+kTGTKzrx4JYeisid8Kno4DjJd7YvUcHqxaUqvwNfQGfXOO3if4+SRlCJKKv+pb/r+QaJHStVpaCi2acU9A+BE1DU+Vc/RDIfE0jtUKFhZaHmulCYx9MEErJdP/aVusiF5EEaf81qS3U3TpcjGczWhyZzAyFpn27vOPPOE5KbEwYBd8xy59k2dFsUDtfekQ9ipCuYPCuZqsmhInAKOfNIG6TtO6vc8rO6cbElbg8CGFPlmSuWNIM1MTkj8dmn2LVf1C6WVzmAei/PMEUIDZ8DjbT1OiK8OZxvCbu2m2k61AL7zE1dRpzRk4NQe2SE1BUE/t3ayYzDy8qtTwPiL9FmnaPc4nRGQTHFSnWZRx24sUsrPRLwQL6klMOeUIArA0Ym+AvwDtePL8XSrirqKH83jQ8w==
x-ms-exchange-antispam-messagedata: Do0S7iF6UTl822dgbE1y0x7D4di9wX0kFOYTCCPQ2/UsBUomnMsv0FJ9YbcDM4xftgHNJ0GMRrj+ASQkCU52ARlD/VZ0K4epdkSf7rqZQLLNxpgxZXrJUN+4KYN1Gg7zb2yPZHgaKiJk5rknv+eCIV9yzkp4TNNBfmQi8G+Ob2ywuGf/22fhy/RR9SPbtBU4
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <ACEA47E3AAB3B04180362E16EBF7A351@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f839ee-390b-44e1-0f12-08d7d5b296f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 20:32:10.8173 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bd3mANv1kbPVBgQ04NZkt5i0A2sq53/9QaeYKxF8/DLZT1HAosMy6RqazlUipUVH9RFtYRqhDNJ7f2Lte0edVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3900
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=999
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003310168
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
Cc: "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDMvMzEvMjAsIDEwOjUzIEFNLCAiQmVuamFtaW4gRmFpciIgPGJlbmphbWluZmFp
ckBnb29nbGUuY29tPiB3cm90ZToNCg0KICAgIE9uIE1vbiwgMzAgTWFyIDIwMjAgYXQgMTM6MDAs
IFZpamF5IEtoZW1rYSA8dmlqYXlraGVta2FAZmIuY29tPiB3cm90ZToNCiAgICA+DQogICAgPiBI
aSBKYXNvbiwNCiAgICA+DQogICAgPiBXZSBoYXZlIGEgcmVxdWlyZW1lbnQgb2YgQ2hhc3NpcyBz
bGVkIGN5Y2xlIGFuZCBpdCBjYW4gYmUgYWNoaWV2ZWQgYnkgc2VuZGluZyBhbiBpMmMgY29tbWFu
ZCB0byBob3Rzd2FwIGNvbnRyb2xsZXIuIElzIHRoZXJlIGFueSBwbGFuIHRvIGFkZCB0aGlzIGZl
YXR1cmUgaW4geDg2LXBvd2VyLWNvbnRyb2wuIEl0IHNob3VsZCB0YWtlIGkyYyBidXMgYWRkcmVz
cyBmcm9tIGNvbmZpZ3VyYXRpb24gZmlsZS4NCiAgICA+DQogICAgPg0KICAgID4NCiAgICA+IFJl
Z2FyZHMNCiAgICA+DQogICAgPiAtVmlqYXkNCiAgICANCiAgICBUaGlzIGZlYXR1cmUgaXMgaW1w
bGVtZW50ZWQgb24gc29tZSBzeXN0ZW1zIHVzaW5nIGFuIElQTUkgT0VNIGNvbW1hbmQ6DQogICAg
aHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvZ29vZ2xlLWlwbWktc3lzI2RlbGF5ZWRoYXJkcmVz
ZXQtLS1zdWJjb21tYW5kLTB4MDMNCiAgICANCiAgICBJdCBjdXJyZW50bHkganVzdCBhY3RpdmF0
ZXMgdGhlIHN5c3RlbWQgdGFyZ2V0DQogICAgZ2JtYy1wc3UtaGFyZHJlc2V0LnRhcmdldCBhbmQg
bGV0cyB5b3UgcmVnaXN0ZXIgc2VydmljZXMgdG8gZG8gdGhlDQogICAgYWN0dWFsIGhvdHN3YXAg
cmVzZXQgKHVzdWFsbHkgYnkgdG9nZ2xpbmcgYSBHUElPKS4gSGF2aW5nIGEgdW5pZmllZA0KICAg
IHNvbHV0aW9uIGluIHg4Ni1wb3dlci1jb250cm9sIGZvciB0aGlzIHdvdWxkIGJlIGdyZWF0IQ0K
DQpCZW4sIENhbiB5b3UgcGxlYXNlIHNoYXJlIGNvbnRlbnQgb2YNCiBodHRwczovL2dpdGh1Yi5j
b20vb3BlbmJtYy9nb29nbGUtaXBtaS1zeXMvYmxvYi9tYXN0ZXIvZ2JtYy1wc3UtaGFyZHJlc2V0
LnRhcmdldA0KYXMgbXkgYXNzdW1wdGlvbiBpcyBlYWNoIHBsYXRmb3JtIG5lZWRzIHRvIHByb3Zp
ZGUgdGhpcyBmaWxlIGJ1dCBJIGNvdWxkbid0IGZpbmQgYW55IHBsYXRmb3JtDQp1c2luZyB0aGlz
LiBJIG9ubHkgZm91bmQgcmVmZXJlbmNlIGluIG1ldGEtcXVhbnRhIHdoaWNoIGlzIGRlbGV0aW5n
IHRoaXMgZmlsZS4gU28gcGxlYXNlDQpwcm92aWRlIGEgcmVmZXJlbmNlIHRvIHRoaXMgZmlsZS4N
CiAgICANCg0K
