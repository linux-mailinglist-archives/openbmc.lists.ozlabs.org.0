Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC4529C9D2
	for <lists+openbmc@lfdr.de>; Tue, 27 Oct 2020 21:12:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLNDB5CsRzDqNp
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 07:12:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=75697c318a=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=c/ZYT3rS; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=A4jZAr8/; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLNCJ63W1zDqJl
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 07:11:53 +1100 (AEDT)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09RK8mig013379; Tue, 27 Oct 2020 13:11:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=ks+i0yPqlUhT24Utp6QrQq6xSK1eW19f+NRrdjMZl08=;
 b=c/ZYT3rS+zdBkSrT2VoXzMlUnRDYD5II8o3hPFWd962+1l2b7Mng36bYF+pxDneoUlB7
 F8Q1VcELovMMG5AOOk/6bXOWMg2hTLKamkX1nz/snOVOt+lyf4AwpCSdKW/xKNjor7wb
 ilwbONkqEn0S6F9vOIxhy72xt0d6qNLAQUM= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 34egnf3gsh-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 27 Oct 2020 13:11:48 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 27 Oct 2020 13:11:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cM9FGE2IgSUDPb3NGBjp7ACSd36MUwJxEsgeUeN0vcBtmUARXmDr+2FEEj1+n76Bhf2GbxTY56F9wQWmjbRc9q62xd7rfhqSxFZkB3tNOUpmhYVkRC3veLLyXseShyNgykKs6ufcNwp69qMYs4PsYgWAztakU+zthP4cfcH7Sa9mv9aIHiARVulTzfZevvCxdodP5w/8gRmWWmWGu57ThT9EKuFJgcsk0yW2L46WgbzZri0ixteCX1DnFfb9Rr152bqaVcKpLu4VBDSqCtYPnCKcLlEROlO5MlLTs5p28qUZxhPo0nhJyaKIho1mRjwNnqqupJrXwXYkTyLGNbGK2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ks+i0yPqlUhT24Utp6QrQq6xSK1eW19f+NRrdjMZl08=;
 b=AX5aCiPmT5kwzfD7lz0ns6nw3F4jSjNE8JNuTYPFt9zkZ5/KVqQbXOFk0OpahR2bpXJll7MECq09dnCLKXlb8WTjtcKse0keKpIUZdv3kYMpUh4FBiNiDpphL2jjFckt8nWJ0Vtd2VXCVPAzaqrkF789cuKDtcdl5PEjNOK+aEF1PulNKpG7/VKGVGk6CxKM5SKG5lm58yUB46+bWHh8mDc6U6VNbiAF7Ckj2xazVF5J1AyplxAKgy1RypFBVQBt9NarFDmob666+Oxx6RU7Fv7VAS6Ne+1PpslRe5Y31IJhRMOv4RU79uzWdTd7G1t/zIGlL+p6e9+rbs3jaXuWIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ks+i0yPqlUhT24Utp6QrQq6xSK1eW19f+NRrdjMZl08=;
 b=A4jZAr8/e3+CtWdyTSaxKEV0qsl4bhY26bGW2YD+JkFqGFFG6vp65GbBllLqqshjThLIp2RjCkI4YDROYfle0KYdPCTZj0jg/t9X+zMjIyrQ+4g6DkLS+fa/+IB0OFPUNbappnuy+n/RkW3HaeNK1sYfUf7EYC5OKdwQi2PYmGU=
Received: from BY5PR15MB3537.namprd15.prod.outlook.com (2603:10b6:a03:1f5::20)
 by BYAPR15MB3431.namprd15.prod.outlook.com (2603:10b6:a03:108::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Tue, 27 Oct
 2020 20:11:42 +0000
Received: from BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::5cb9:7809:838b:488a]) by BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::5cb9:7809:838b:488a%5]) with mapi id 15.20.3477.028; Tue, 27 Oct 2020
 20:11:42 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Ed Tanous <edtanous@google.com>
Subject: Re: VR control from the BMC
Thread-Topic: VR control from the BMC
Thread-Index: AQHWq+xTxDVRfAPZGUKkYbtarGjar6mrWF6AgAB5l4D//5ufAA==
Date: Tue, 27 Oct 2020 20:11:42 +0000
Message-ID: <03C3FC4D-083C-4949-9661-35CF6E7561D3@fb.com>
References: <CAH2-KxCDtq4TDhcENWB65neeqq2QW2TDTV4e7mudaram5EcWGg@mail.gmail.com>
 <E5370099-203B-4CA4-AD0E-671CD2303CE7@fb.com>
 <CAH2-KxDbgY8kozOotA+qjzAP0cqTcK9Ooys9b05Szv4MRk8wrA@mail.gmail.com>
In-Reply-To: <CAH2-KxDbgY8kozOotA+qjzAP0cqTcK9Ooys9b05Szv4MRk8wrA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::4:62b2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f72385cc-734c-4029-cf36-08d87ab48578
x-ms-traffictypediagnostic: BYAPR15MB3431:
x-microsoft-antispam-prvs: <BYAPR15MB34315BFED8946CDBCE9C945BDD160@BYAPR15MB3431.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: owdWhJms9+5RADDQUbHNssVWNXdaiHa+k7BZvRRpgK9pO0FnA1w20e0uG5GJZHEaO6icRyTr53s//fQwM7101NY4OPt/z2er8yiBODvHF1IopZznKo286ium3CVvjSG7XgLV7DRcp1rjdrpHgmcsvuXFqEzNa+3fvzIdB8kGSVTiAwWPoiGA2eHur9mt13d9tKLycvYYMd2cBGUQG5bztD/BmB99efxQwjxmpNDtmEq/sQteE3AAcZ083kEICKR/8+nMj6SszWCVxjBtEM9LC9kxReJDtjctvmUWYk5UjfCfpto7fwQz96xSEUzx7M20opI7lo+zAzmE5gq3gjT8FQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3537.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(366004)(136003)(376002)(396003)(2906002)(316002)(83380400001)(478600001)(6916009)(33656002)(71200400001)(558084003)(6506007)(36756003)(5660300002)(6512007)(86362001)(66476007)(186003)(8936002)(66446008)(76116006)(6486002)(4326008)(66946007)(64756008)(8676002)(2616005)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: wC5Jfcw6wM9E0SdJhzpdEV4dHyclNntHbU72tGKNf02kddlV/fJzZd+2jOnafRm2QjdGiGNrF6ekkXuWiHgcNNDCojqlmipqafrmIXuKErMhwiRrCB0LlfsyXtrHzg6/FjwvkCpr0slx7DoAi5xbN8Wxs1tWf100VT9a+7mKOz5gGnDPWh5xrRG/RZoMrJL9WOqYlJLbvNcfZDa5liZ05gLNFCTRCZb3rB8eOLrzK02JpDCho8+Zm/SLIhRpS72/62j0r1laE8jYYaK7K3pm9ZwEZKYyELpKrQUtTdBQP3mTxEUiBAkabe9m46PVUyzH0ZA6luZHBhRtfKDmQ5RzsBWpZ6SpkB6jAKnYwyhQM5rtZR18lCou83X8egcpisgqukP9jI29Dr9WOcMdJl6Llppmt0/8cYKRoEYC0+uD7QT9Kx8GWGskGgJCxL73ygP6HpkgmnI/2+oDf8b91K+sMjOGGeVgswQxI3W3zXRrozP4maquUXJI4gDRQetBXaYO55GfuTZmUH6o79klqj7sYQvSgSzJSReOAiQHz2tVWqBV6b3j9NwgNt6hIRwIeds0/dLOtR2LaOWIjR5yq1pRcn8QL/Ozmu5Z29fGHKdiUUBSOWGblN73ftT39DYOsLAHY31A5ug3hjIV0vNA+L//VdJE/FWhhlwUiHqnV1glIX409gdAzcby0aC6Ue28LsZW
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <B66DEE8DEF59F1488A18D505F8092BB2@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3537.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f72385cc-734c-4029-cf36-08d87ab48578
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2020 20:11:42.4324 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KCklOZzXQ68IUfP0FfJ8PASWiD0RZawfaGPfvvrnAEQrDEyzqM8DGFz6ZFCfht1u3vhRDTst6IRqWy4t3WoR3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3431
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-27_15:2020-10-26,
 2020-10-27 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=766
 mlxscore=0 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2010270116
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

DQogICAgSSBkb24ndCBoYXZlIHRoZSBuZWVkIHRvIHVwZ3JhZGUgVlIgZmlybXdhcmUgb3V0IG9m
IGJhbmQgdG9kYXksIGJ1dCBpZg0KICAgIHlvdSdyZSBpbnRlcmVzdGVkIGluIGhlbHBpbmcgZGVm
aW5lIGludGVyZmFjZXMgdGhhdCB3b3VsZCB3b3JrIGZvcg0KICAgIGZpcm13YXJlIHVwZ3JhZGUg
b3IgbWFrZSBpdCBlYXN5IHRvIGFkZCBpbiB0aGUgZnV0dXJlLCBJJ2QgYXBwcmVjaWF0ZQ0KICAg
IHRoZSBoZWxwLg0KDQpJIHdpbGwgY2VydGFpbmx5IGxvb2sgaW50byB0aGlzIGFzIHRoaXMgaXMg
bG93ZXIgaW4gbXkgcHJpb3JpdHkgdGFza3MuDQoNCg==
