Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C44DB984
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 00:09:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vNcj0cx1zDqf2
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 09:09:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=51932c9067=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="mixsccXY"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="UBOX3Up5"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vNc36ds5zDqdg
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 09:09:06 +1100 (AEDT)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id x9HM4GoA028774;
 Thu, 17 Oct 2019 15:09:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=QaEZpzO3JwciIlWjjkrmVBhqctpxUTMCTI7gOQ6/Eu0=;
 b=mixsccXYh/6BuNEvtecQN/482kd6aDM5YRh046Y75y6QGqiyqrOOr549Ebav9an+ayyT
 iRO6IlYsB96MFdtCFvmmKsLmt59lzuBmLK5jcmIA7QROaaBxXIv3WK1TKPmFOnc6nGvS
 kHcR/kldYY2+cIvM/ocGOPHOOJ7t738M2lU= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0089730.ppops.net with ESMTP id 2vp3uk7tpb-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 17 Oct 2019 15:09:02 -0700
Received: from ash-exhub204.TheFacebook.com (2620:10d:c0a8:83::4) by
 ash-exhub103.TheFacebook.com (2620:10d:c0a8:82::c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 17 Oct 2019 15:09:00 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.100) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 17 Oct 2019 15:09:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVrB1IBB52Mc/2y0x8Zdjsau8o3INxYrPjaMaylkdm9l+yLoS1qSWlLqnuCI1rvB2qMx7/snYybMT5jhIgbCIJMXopc0gHi11VcZZm2KGin8544ehVEcSM6KVEoqDpPmDFZCvcDojejrcTsv5e9coht0RrnHV4sIindqTcKbaQoIc2HhqVF5ABjDm3ReonMR3wcbFpW8gEai/DcB/Y2nZbAv1XKeZlo+92OSDm2haudR8Zr9nz0rxhS/PbaDizQ2Jck8gY1juB+UPsRIBb/5AZ//my0RxedNR+V49iKOWnSw97MIEX39xmM508L6dBn6BFVFtWK/PNwO+xdAJCvgaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaEZpzO3JwciIlWjjkrmVBhqctpxUTMCTI7gOQ6/Eu0=;
 b=I1fu1hK/i4scvROBsWW1lPYHhWNK7Cafo0mXWBRDAWjR4Twhlzy1Y+QddSbNUnsnULxN4SoBumJ6GVBRrOO7QrV5Z6T7tHboBfE/DOtBywm+1H25ziW6wsN3fIRNejNt08Ij16bMun82C2QMgMox1MxV5Uhfj9sPxDdrCCmnozZWxXXk4BD98gypMwvc6Scg/Et0Pvi9Jr8GLlrVNfTGRlAgVVB/fexozqNNxXJ8p8U6N0RrbGuezgzDgD7e/iTIsfBa4lNWQNdTSs5j0+jSFDLDJv2uRIt/B10CTi7W2AH0w6oCp1xbqqO7Rrwe4MElvAbYwL+jDcOyRmg/Em50TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaEZpzO3JwciIlWjjkrmVBhqctpxUTMCTI7gOQ6/Eu0=;
 b=UBOX3Up5I9aEh67omoUJXdETncox5r8S+/mei+0gS1qFYSNNaeCZDK+wIOUl9/FQzuiuWgZW5PzGPiQ0wk/22ew0XspK0hm6xoMK1c0qAde/BozcYlS+LJ4/np59b5ChwxnJY3BjptVnggXSEfBI89A1MJRC1MZdE849mlMe3t4=
Received: from BY5PR15MB3636.namprd15.prod.outlook.com (52.133.252.91) by
 BY5PR15MB3572.namprd15.prod.outlook.com (52.133.255.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 17 Oct 2019 22:08:59 +0000
Received: from BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::7887:4f9c:70df:285c]) by BY5PR15MB3636.namprd15.prod.outlook.com
 ([fe80::7887:4f9c:70df:285c%4]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 22:08:59 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Michael Richardson <mcr@sandelman.ca>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: Re: x86-power-control
Thread-Topic: x86-power-control
Thread-Index: AQHVhIgk7/7PtKOKbUeMJf/8spu+0qdemVoAgABXLwA=
Date: Thu, 17 Oct 2019 22:08:59 +0000
Message-ID: <E127E69E-4BA1-49B8-9F6D-CA6A9D90C0FA@fb.com>
References: <EA590716-271A-4F5C-9B36-80260B7F35B6@fb.com>
 <21807.1571306216@dooku.sandelman.ca>
In-Reply-To: <21807.1571306216@dooku.sandelman.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:f653]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9864623-08cf-47f7-d470-08d7534e9c65
x-ms-traffictypediagnostic: BY5PR15MB3572:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BY5PR15MB3572E2F54472B88A8E534044DD6D0@BY5PR15MB3572.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(39860400002)(396003)(366004)(346002)(189003)(199004)(110136005)(6246003)(2906002)(6436002)(486006)(316002)(11346002)(966005)(6116002)(33656002)(446003)(229853002)(7736002)(2616005)(256004)(305945005)(71190400001)(71200400001)(14454004)(478600001)(25786009)(46003)(6486002)(476003)(6306002)(186003)(99286004)(6512007)(5660300002)(6506007)(36756003)(76176011)(102836004)(81166006)(8676002)(76116006)(66946007)(81156014)(66476007)(66446008)(66556008)(86362001)(64756008)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR15MB3572;
 H:BY5PR15MB3636.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d7W0jHi+1WB1BmHgjR0C62i/y+xgT3tDO+RGN4J0W3l3axvCXixKI73+xa+sq1Zd3+V2QXBNb5Z/LSDLHd6MB2YclsZhVlsG6bCoxSWFMoCYYmI5EqtU7Kde6mcTdSIikQslQZmeHxQiEb1DrQu4MLp/sZZDk7kNMGGYlt+RZlNv99Gmp1r7Nrrj6VSTq1CgwXEH6JaFOAjyS+cu7qBG6A7dXRIlqdd7ziUJYyHuEl5PrQfFmGFBLmFx59GWxrhsit1dHyfFrHOKfIxmy9RouXuRgpdL0jFQjAmhxlQEeWwFnNpDi9d22Jem2jCCPoh7bfj4nDbCGaUq/q8xnG+R/iyFJnpI1lBiu4o3qL0dpcOv1U5PQgvVGOo2vAUkjo80Gen7fC+5WitapWWKkJ7dji5NItGgzcdyHClJRfv7S4PyNQv0TgMasmTaZ7yJuT4fo1Ex5bcmOcJ4JsnNMTlHIA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C38D684208BBF14E9A3E5D94A37E366D@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c9864623-08cf-47f7-d470-08d7534e9c65
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 22:08:59.0579 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k1h6Syjjk8zgEQAaWvqzTEFHPdsYNBIbQUhXDTI+PK6x3FUbDwuJCvWtfucwiPDg1ox7EQFdBx8zdEE8xzuX/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3572
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-17_06:2019-10-17,2019-10-17 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 impostorscore=0
 mlxlogscore=579 mlxscore=0 phishscore=0 suspectscore=0 malwarescore=0
 adultscore=0 clxscore=1011 bulkscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910170194
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

DQoNCu+7v09uIDEwLzE3LzE5LCAyOjU3IEFNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgTWljaGFl
bCBSaWNoYXJkc29uIiA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5v
emxhYnMub3JnIG9uIGJlaGFsZiBvZiBtY3JAc2FuZGVsbWFuLmNhPiB3cm90ZToNCg0KICAgIA0K
ICAgIFZpamF5IEtoZW1rYSA8dmlqYXlraGVta2FAZmIuY29tPiB3cm90ZToNCiAgICAgICAgPiAx
LiAgTmFtZSBvZiBHUElPIGxpbmUsIHRoaXMgc2hvdWxkIGJlIGNvbmZpZ3VyYWJsZSBhbmQgc2hv
dWxkIGFsc28NCiAgICAgICAgPiBzdXBwb3J0IEdQSU8gbnVtYmVyIGlmIHVzZXIgZG9lc27igJl0
IHdhbnQgdG8gZGVmaW5lIGxpbmUgbmFtZSBpbiBEVFMuDQogICAgDQogICAgV2h5IGluIGEgdGFy
Z2V0IHN5c3RlbSB3b3VsZG4ndCBuYW1pbmcgaXQgaW4gRFRTIGJlIHRoZSBtb3N0IHJlbGlhYmxl
IGFuZA0KICAgIG1vc3QgZWFzaWx5IGFjY2Vzc2libGUgbWVjaGFuaXNtPyAgSSBjYW4gc2VlIHRo
YXQgaW4gZGV2ZWxvcG1lbnQgYmVpbmcgYWJsZSB0byBkZWZpbmUNCiAgICB0aGluZ3MgaGVscHMs
IGJ1dCBpdCBpcyBub3QgbGlrZSB0aGUgcHJvZHVjdGlvbiBzeXN0ZW1zIHdvdWxkIGhhdmUgd2ly
ZS13cmFwDQogICAgd2hlcmUgdGhlIEdQSU8gcGluIG1pZ2h0IGNoYW5nZS4NCg0KSSBhbSBub3Qg
cnVsaW5nIG91dCBEVFMgZGVmaW5pdGlvbiBidXQga2VlcGluZyB0aGF0IGFzIG9wdGlvbmFsLiBN
YW55IHBsYXRmb3JtIGRvZXNuJ3QgDQp3YW50IHRvIGNoYW5nZSBrZXJuZWwgYW5kIHdhbnQgdG8g
a2VlcCBkdHMgbWluaW1hbCBhcyB3ZWxsIGNvbW1vbiBhY3Jvc3MgbXVsdGlwbGUNCnBsYXRmb3Jt
LiBTbyBwcm92aWRpbmcgdGhpcyBvcHRpb24gd2lsbCBoZWxwIGRldmVsb3Blci4NCiAgICANCiAg
ICAgICAgPiAyLiAgQWxsIGRlbGF5IHRpbWUgYXMgaXQgdmFyaWVzIGZvciB1cyBwZXIgcGxhdGZv
cm0gbGlrZQ0KICAgICAgICA+IHBvd2VyUHVsc2VUaW1lTXMgaXMgMSBzZWMgaW5zdGVhZCBvZiAy
MDAgbXMgYW5kIHBvd2VyUHVsc2VUaW1lTXMgaXMgNg0KICAgICAgICA+IHNlYyBpbnN0ZWFkIG9m
IDE1IHNlYyBhbmQgdGhlc2UgdmFyaWVzIGZvciBkaWZmZXJlbnQgRkIgcGxhdGZvcm1zLg0KICAg
IA0KICAgICAgICA+IDMuICBHUElPIGxpbmVzIHRvIGJlIG1vbml0b3JlZCwgbm90IGV2ZXJ5b25l
IG5lZWRzIFNJT19TNSBtb25pdG9yaW5nIG9yIE5NSV9PVVQgZXRjLg0KICAgICAgICA+IDQuICBF
bmFibGUvZGlzYWJsZSBwYXNzdGhyb3VnaA0KICAgIA0KICAgICAgICA+IFBsZWFzZSBzdWdnZXN0
IHdoYXQgaXMgdGhlIGJlc3Qgd2F5IHRvIG1ha2UgdGhlc2UgY2hhbmdlcy4gSSBhbSByZWFkeQ0K
ICAgICAgICA+IHRvIHdvcmsgb24gdGhpcyB0byBtYWtlIHJlcXVpcmVkIGNoYW5nZS4gV2UgY2Fu
IGhhdmUgdGhlc2UgY29uZmlnDQogICAgICAgID4gb3B0aW9uIGRlZmluZWQgaW4gZW50aXR5IG1h
bmFnZXIgb3Igd2UgY2FuIGFjY2VwdCBhIG5ldyBqc29uIGZpbGUgZm9yDQogICAgICAgID4gdGhp
cyBjb25maWd1cmF0aW9uLg0KICAgIA0KICAgIEkgdGFrZSBpdCB0aGF0IHRoaXMgaXNuJ3QgYSBj
b25maWd1cmF0aW9uIHRoYXQgc2hvdWxkIGJlIHZpc2libGUgdG8NCiAgICBvcGVyYXRvcnMsIGp1
c3QgdG8gaW50ZWdyYXRvcnMuDQpZZXMsIHlvdSBhcmUgcmlnaHQuDQogICAgDQogICAgLS0NCiAg
ICBdICAgICAgICAgICAgICAgTmV2ZXIgdGVsbCBtZSB0aGUgb2RkcyEgICAgICAgICAgICAgICAg
IHwgaXB2NiBtZXNoIG5ldHdvcmtzIFsNCiAgICBdICAgTWljaGFlbCBSaWNoYXJkc29uLCBTYW5k
ZWxtYW4gU29mdHdhcmUgV29ya3MgICAgICAgIHwgbmV0d29yayBhcmNoaXRlY3QgIFsNCiAgICBd
ICAgICBtY3JAc2FuZGVsbWFuLmNhICBodHRwOi8vd3d3LnNhbmRlbG1hbi5jYS8gICAgICAgIHwg
ICBydWJ5IG9uIHJhaWxzICAgIFsNCiAgICANCiAgICANCg0K
