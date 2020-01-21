Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC901444B6
	for <lists+openbmc@lfdr.de>; Tue, 21 Jan 2020 20:00:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482HtV05Z5zDqRk
	for <lists+openbmc@lfdr.de>; Wed, 22 Jan 2020 06:00:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=8289fa29e8=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=C8EIUa6f; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=FdjZvuIq; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482Hsj1z6WzDqFp
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jan 2020 06:00:08 +1100 (AEDT)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00LIwHBD001730; Tue, 21 Jan 2020 10:59:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=2/A2NxrS2KoJ5Vbv7A1IzsyspM7OJIj5SEOL0EJa5QQ=;
 b=C8EIUa6fwr1X1z65QWo0Dcqjug/CEbyexIziXQN5ANvXM1HlMSkgCTYh82VQgEcWXVYg
 c1r83cKbkQV+3ESYihX4hCWEGp7/KAhrxbFWyapSwXpqwOdfvPYH2RCgq40uKXLJcIJL
 RgIYE+RgEndAyKG5LOBHXH49CFX97u3GXOQ= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2xnwtjtgqp-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 21 Jan 2020 10:59:56 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Tue, 21 Jan 2020 10:59:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=enDXNHH76iWPfBqhJqkB7rLh/4mZQglPcUyizBbS/FF9uQ5EaoNlMyB69iNYpOkKoKKDdQDJMyldBa5bDXjfk55Jm+UKfhFfuUOyCcgIyuuKkV7HG4uUsGjhRmd/pgCHdqLjsV369sUMCCQm7yhsLkQnFePD0cw8s2+GDI1gbS+DvuM7cQR28Q1DN6jto9InQpN9r6/GcTRodoHT6KpQQdTA0lVHXEwq9AowwXV+Byv1ecdwJWKJkgS/s6GK6/HdHlG2qOwt3R5G11/xKm5pBw5NlbQaTh11+6QezI3q3j9yHBlcvBAJFbE8LMAXPzOLn1D4q0dnvQaj4rSEu58w7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/A2NxrS2KoJ5Vbv7A1IzsyspM7OJIj5SEOL0EJa5QQ=;
 b=FAXU+GzjqscjG1oOuVW6H/s0LoivnF6n6Nv0pD3L3tJMytXF699LEVedSeGqa/HSrZPAEf9vLIs0dblsHGtV/kq57/6OlvOH+6Om1/ck0FIHOJAtPXFivxZd9qC5I/hEb9kiNiiEJ4MVAw5BHOMc1J5h24v1dfRgevnudlG1eXZnZsQZO/CaggihpIvFwz8Kz8L5g4B+ODJZs+7UeHnfUup0/+jC+NoIO6yB3ORo+uvnH71CB2td3POM/upcMtaBN31i3qCMWUd0rzkGovFvyNKaAKikVROCN76V63NvV0keVXPXrXg6FcvOi1ZnxamZAzaxAWMBUe0G76PPskXMGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/A2NxrS2KoJ5Vbv7A1IzsyspM7OJIj5SEOL0EJa5QQ=;
 b=FdjZvuIqlZbEx+eq8q++zvHQuxP2rBtfo5BxH7OagjSeMCo/cuGzcwg7x8h/5mhcUopDhS0uXBBT78LIp2bs7botxtybHWOdYy4/JG4KI7jlLO/SoQ/0EbqrchB1AI88e9RD0HbcLMa5cqdOPe4amI7H3+KMGrntx5oZjaZ8wFo=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1807.namprd15.prod.outlook.com (10.174.255.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.23; Tue, 21 Jan 2020 18:59:47 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::cdbf:b63c:437:4dd2%8]) with mapi id 15.20.2644.027; Tue, 21 Jan 2020
 18:59:47 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Andrew Jeffery
 <andrew@aj.id.au>, Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>,
 "tomjoseph@in.ibm.com" <tomjoseph@in.ibm.com>, "iwona.winiarska@intel.com"
 <iwona.winiarska@intel.com>, "piotr.matuszczak@intel.com"
 <piotr.matuszczak@intel.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "sumanth.bhat@linux.intel.com" <sumanth.bhat@linux.intel.com>,
 "Mihm, James" <James.Mihm@Intel.com>
Subject: Re: Reg OpenBMC PMCI Workgroup
Thread-Topic: Reg OpenBMC PMCI Workgroup
Thread-Index: AQHV0GyftsUrDakmLESunOS9vPudDaf08vCA
Date: Tue, 21 Jan 2020 18:59:47 +0000
Message-ID: <13B92308-8346-4B8F-9A1C-139A0B11A762@fb.com>
References: <67e599e4-0b45-aa01-1e27-d49c52873646@linux.intel.com>
In-Reply-To: <67e599e4-0b45-aa01-1e27-d49c52873646@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:8d24]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 022c8b65-e023-4cdb-7155-08d79ea415fc
x-ms-traffictypediagnostic: MWHPR15MB1807:|MWHPR15MB1807:
x-ld-processed: 8ae927fe-1255-47a7-a2af-5f3a069daaa2,ExtAddr
x-microsoft-antispam-prvs: <MWHPR15MB1807A33786AD63EF824009E2DD0D0@MWHPR15MB1807.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0289B6431E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(346002)(396003)(136003)(39860400002)(199004)(189003)(316002)(33656002)(110136005)(2616005)(81156014)(2906002)(8676002)(8936002)(6506007)(9326002)(53546011)(36756003)(3480700007)(81166006)(478600001)(66476007)(186003)(7416002)(64756008)(76116006)(66556008)(6512007)(66446008)(6486002)(71200400001)(86362001)(5660300002)(66946007)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1807;
 H:MWHPR15MB1597.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pdox2gA3JVeKFN4fci5CGrtaTaT/kF+hAQ7JAWnBn3C9Y+Ras7vfYJIm5GH8cZ+LLOn3jpxvZuO/JGe/BWZ20WIX/+ZW5ZE6PJ++V2NsKlao+ZphVJ48akpD0aQEOORIv79j1cAA0Xphn9cyy+KxJY+o+m+RpF1tWGMHXo3pSgISRUA0uxcZFlT11sVzlGiSzWluxfyy/ryVdSgEGxFAqZPfrVjWAIEkyGfyAPnv+tttBKMpNzDohaTAODZkyPFlyVOTt1wsjkO+2C4kf/7otpz3D1ZV03bwGmRMkkgMI7Nqh177xMICB+IKNi/nkMrbqSOwWQLbPV+2xUVZCo9iEEK0jAH3GU/OlojTYl3JIg6MyAZ7/RP/LHeM2Qbk+FaFVUqzKKNOvwFc5hdGxqg2PQB1Dt984pr381NV5sXRB6xLJMsTrzrnd0awzRazdmlb9OBrjcvDqyqVSJ9XNMxhxMICgRjon3HKvQ5yMekrKLeK417TsW5Ow3d8SNQU6NDA
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_13B9230883464B8F9A1C139A0B11A762fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 022c8b65-e023-4cdb-7155-08d79ea415fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2020 18:59:47.5216 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EplOVfoGd/V2cfmmVJxPyUQ2gINEVKd2Rrj0HtqID+B5Gnq1PSBD9ma2U6xosp2hzRiL5MuoMyUEk1vKN3P4Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1807
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.634
 definitions=2020-01-21_06:2020-01-21,
 2020-01-21 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 impostorscore=0 spamscore=0 mlxlogscore=999 clxscore=1011
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001210141
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

--_000_13B9230883464B8F9A1C139A0B11A762fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCkkgd291bGQgbG92ZSB0byBiZSBwYXJ0IG9mIHRoaXMgZ3JvdXAgYnV0IEkg
YW0gaW4gUFNUIHNvIG5vbmUgb2YgdGhvc2UgdGltZSB3b3VsZCB3b3JrLg0KDQpSZWdhcmRzDQot
VmlqYXkNCg0KRnJvbTogb3BlbmJtYyA8b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNv
bUBsaXN0cy5vemxhYnMub3JnPiBvbiBiZWhhbGYgb2YgIlRob21haXlhciwgUmljaGFyZCBNYXJp
YW4iIDxyaWNoYXJkLm1hcmlhbi50aG9tYWl5YXJAbGludXguaW50ZWwuY29tPg0KRGF0ZTogVHVl
c2RheSwgSmFudWFyeSAyMSwgMjAyMCBhdCA3OjA4IEFNDQpUbzogT3BlbkJNQyBNYWlsbGlzdCA8
b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPiwgQW5kcmV3IEplZmZlcnkgPGFuZHJld0Bhai5pZC5h
dT4sIERlZXBhayBLb2RpaGFsbGkgPGRrb2RpaGFsQGxpbnV4LnZuZXQuaWJtLmNvbT4sICJ0b21q
b3NlcGhAaW4uaWJtLmNvbSIgPHRvbWpvc2VwaEBpbi5pYm0uY29tPiwgIml3b25hLndpbmlhcnNr
YUBpbnRlbC5jb20iIDxpd29uYS53aW5pYXJza2FAaW50ZWwuY29tPiwgInBpb3RyLm1hdHVzemN6
YWtAaW50ZWwuY29tIiA8cGlvdHIubWF0dXN6Y3pha0BpbnRlbC5jb20+LCBCcmFkIEJpc2hvcCA8
YnJhZGxleWJAZnV6emllc3F1aXJyZWwuY29tPiwgInN1bWFudGguYmhhdEBsaW51eC5pbnRlbC5j
b20iIDxzdW1hbnRoLmJoYXRAbGludXguaW50ZWwuY29tPiwgIk1paG0sIEphbWVzIiA8SmFtZXMu
TWlobUBJbnRlbC5jb20+DQpTdWJqZWN0OiBSZWcgT3BlbkJNQyBQTUNJIFdvcmtncm91cA0KDQpB
bGwsDQpJbiBvcmRlciB0byBjby1vcmRpbmF0ZSB0aGUgUE1DSSBpbXBsZW1lbnRhdGlvbiBpbiBP
cGVuQk1DIChNQ1RQLCBQTERNLCBTUERNIGV0Yy4pLCB0aG91Z2h0IG9mIGhhdmluZyBPcGVuQk1D
IFBNQ0kgd29ya2dyb3VwLiBXb3JrZ3JvdXBzIG1haW4gb2JqZWN0aXZlIHdpbGwgYmUgdG8gZGlz
Y3VzcyBQTUNJIHJlbGF0ZWQgZGVzaWduLCBhbmQgdG8gc3BlZWQgdXAgdGhlIGltcGxlbWVudGF0
aW9uIGluIGEgY29sbGFib3JhdGl2ZSBtYW5uZXIgd2l0aCB0aGUgY29tbXVuaXR5LiBUaGlzIGhh
cyBhbHJlYWR5IGJlZW4gZGlzY3Vzc2VkIGluIElSQywgYW5kIGZldyBwZW9wbGUgYWxyZWFkeSBz
aG93ZWQgaW50ZXJlc3QgaW4gaGF2aW5nIGEgd2Vla2x5IC8gYmktd2Vla2x5IGNhbGwgZm9yIHRo
ZSBzYW1lLg0KTGV0IG1lIGtub3cgaWYgeW91IGFyZSBpbnRlcmVzdGVkIGluIGpvaW5pbmcgYW5k
IGNvbnRyaWJ1dGluZyB0aGUgc2FtZSwgYW5kIHdoYXQgdGltZSB3aWxsIGJlIGNvbnZlbmllbnQg
Zm9yIHlvdS4gRmluZGluZyB0aW1lIGNvbnZlbmllbnQgZm9yIGFsbCB0aW1lIHpvbmXigJlzIHdp
bGwgYmUgZGlmZmljdWx0IGJ1dCB3aWxsIHRyeSB0byBzZWUuIFNvIGZhciBwZW9wbGUgZnJvbSBC
YW5nYWxvcmUsIEF1c3RyYWxpYSAmIFBvbGFuZCBoYXZlIHNob3duIGludGVyZXN0IC8gYWxyZWFk
eSBjb250cmlidXRpbmcsIGFuZCBoZW5jZSBsaXN0ZWQgb3V0IHRpbWVzIGNvbnZlbmllbnQgZm9y
IHRoZW0uIFBsZWFzZSByZXBseSB0byBtZSB5b3VyIGNvbnZlbmllbnQgdGltZSwgaWYgYmVsb3cg
bWVudGlvbmVkIHRpbWUgZG9lc27igJl0IHN1aXQuIChCYXNlZCBvbiB0aGUgcmVwbHksIHdpbGwg
dHJ5IHRvIHNlbGVjdCkuDQpPcHRpb24xIDogTW9uZGF5IC0gIDMgUE0gdG8gNCBQTSBJU1QgKDEw
OjMwIHRvIDExOjMwIEFNIFBvbGFuZCAvIDg6MzAgdG8gOTozMCBQTSBBQ1QpLg0KT3B0aW9uMjog
VHVlc2RheSAgKFNhbWUgYXMgYWJvdmUpDQpPcHRpb24gMzogTW9uZGF5IC0gQW4gaG91ciBlYXJs
aWVyLiAoMiBQTSB0byAzIFBNIElTVCAoOTozMCB0byAxMDozMCBBTSBQb2xhbmQgLyA3OjMwIHRv
IDg6MzAgUE0gQUNUKS4NCk9wdGlvbiA0OiBUdWVzZGF5IOKAkyBzYW1lIHRpbWUgYXMgb3B0aW9u
IDMNCg0KUmVnYXJkcywNClJpY2hhcmQNCg==

--_000_13B9230883464B8F9A1C139A0B11A762fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <4A7938EFBF1E5D41ABD44C2FD474C54A@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3Jt
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCW1hcmdpbi1i
b3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXBy
aW9yaXR5Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9
DQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0eWxlLXByaW9y
aXR5Ojk5Ow0KCWNvbG9yOiM5NTRGNzI7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpw
Lm1zb25vcm1hbDAsIGxpLm1zb25vcm1hbDAsIGRpdi5tc29ub3JtYWwwDQoJe21zby1zdHlsZS1u
YW1lOm1zb25vcm1hbDsNCgltc28tbWFyZ2luLXRvcC1hbHQ6YXV0bzsNCgltYXJnaW4tcmlnaHQ6
MGluOw0KCW1zby1tYXJnaW4tYm90dG9tLWFsdDphdXRvOw0KCW1hcmdpbi1sZWZ0OjBpbjsNCglm
b250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCnNw
YW4uRW1haWxTdHlsZTE5DQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFsLXJlcGx5Ow0KCWZvbnQt
ZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0KLk1zb0No
cERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1zaXplOjEwLjBw
dDt9DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7c2l6ZTo4LjVpbiAxMS4waW47DQoJbWFyZ2luOjEu
MGluIDEuMGluIDEuMGluIDEuMGluO30NCmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2Vj
dGlvbjE7fQ0KLS0+PC9zdHlsZT4NCjwvaGVhZD4NCjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSIj
MDU2M0MxIiB2bGluaz0iIzk1NEY3MiI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+SGkgUmljaGFyZCw8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPkkgd291bGQgbG92ZSB0byBiZSBwYXJ0IG9mIHRoaXMgZ3JvdXAgYnV0IEkgYW0g
aW4gUFNUIHNvIG5vbmUgb2YgdGhvc2UgdGltZSB3b3VsZCB3b3JrLjxvOnA+PC9vOnA+PC9wPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj5SZWdhcmRzPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4tVmlq
YXk8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+
PC9wPg0KPGRpdiBzdHlsZT0iYm9yZGVyOm5vbmU7Ym9yZGVyLXRvcDpzb2xpZCAjQjVDNERGIDEu
MHB0O3BhZGRpbmc6My4wcHQgMGluIDBpbiAwaW4iPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PGI+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPkZyb206IDwvc3Bhbj48
L2I+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPm9wZW5ibWMgJmx0
O29wZW5ibWMtYm91bmNlcyYjNDM7dmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFicy5vcmcm
Z3Q7IG9uIGJlaGFsZiBvZiAmcXVvdDtUaG9tYWl5YXIsIFJpY2hhcmQgTWFyaWFuJnF1b3Q7ICZs
dDtyaWNoYXJkLm1hcmlhbi50aG9tYWl5YXJAbGludXguaW50ZWwuY29tJmd0Ozxicj4NCjxiPkRh
dGU6IDwvYj5UdWVzZGF5LCBKYW51YXJ5IDIxLCAyMDIwIGF0IDc6MDggQU08YnI+DQo8Yj5Ubzog
PC9iPk9wZW5CTUMgTWFpbGxpc3QgJmx0O29wZW5ibWNAbGlzdHMub3psYWJzLm9yZyZndDssIEFu
ZHJldyBKZWZmZXJ5ICZsdDthbmRyZXdAYWouaWQuYXUmZ3Q7LCBEZWVwYWsgS29kaWhhbGxpICZs
dDtka29kaWhhbEBsaW51eC52bmV0LmlibS5jb20mZ3Q7LCAmcXVvdDt0b21qb3NlcGhAaW4uaWJt
LmNvbSZxdW90OyAmbHQ7dG9tam9zZXBoQGluLmlibS5jb20mZ3Q7LCAmcXVvdDtpd29uYS53aW5p
YXJza2FAaW50ZWwuY29tJnF1b3Q7ICZsdDtpd29uYS53aW5pYXJza2FAaW50ZWwuY29tJmd0Oywg
JnF1b3Q7cGlvdHIubWF0dXN6Y3pha0BpbnRlbC5jb20mcXVvdDsNCiAmbHQ7cGlvdHIubWF0dXN6
Y3pha0BpbnRlbC5jb20mZ3Q7LCBCcmFkIEJpc2hvcCAmbHQ7YnJhZGxleWJAZnV6emllc3F1aXJy
ZWwuY29tJmd0OywgJnF1b3Q7c3VtYW50aC5iaGF0QGxpbnV4LmludGVsLmNvbSZxdW90OyAmbHQ7
c3VtYW50aC5iaGF0QGxpbnV4LmludGVsLmNvbSZndDssICZxdW90O01paG0sIEphbWVzJnF1b3Q7
ICZsdDtKYW1lcy5NaWhtQEludGVsLmNvbSZndDs8YnI+DQo8Yj5TdWJqZWN0OiA8L2I+UmVnIE9w
ZW5CTUMgUE1DSSBXb3JrZ3JvdXA8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjwvZGl2Pg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1zby1tYXJnaW4tdG9wLWFsdDphdXRvO21zby1tYXJn
aW4tYm90dG9tLWFsdDphdXRvIj5BbGwsDQo8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiIHN0eWxlPSJtc28tbWFyZ2luLXRvcC1hbHQ6YXV0bzttc28tbWFyZ2luLWJvdHRvbS1h
bHQ6YXV0byI+SW4gb3JkZXIgdG8gY28tb3JkaW5hdGUgdGhlIFBNQ0kgaW1wbGVtZW50YXRpb24g
aW4gT3BlbkJNQyAoTUNUUCwgUExETSwgU1BETSBldGMuKSwgdGhvdWdodCBvZiBoYXZpbmcgT3Bl
bkJNQyBQTUNJIHdvcmtncm91cC4gV29ya2dyb3VwcyBtYWluIG9iamVjdGl2ZSB3aWxsIGJlIHRv
IGRpc2N1c3MgUE1DSSByZWxhdGVkDQogZGVzaWduLCBhbmQgdG8gc3BlZWQgdXAgdGhlIGltcGxl
bWVudGF0aW9uIGluIGEgY29sbGFib3JhdGl2ZSBtYW5uZXIgd2l0aCB0aGUgY29tbXVuaXR5LiBU
aGlzIGhhcyBhbHJlYWR5IGJlZW4gZGlzY3Vzc2VkIGluIElSQywgYW5kIGZldyBwZW9wbGUgYWxy
ZWFkeSBzaG93ZWQgaW50ZXJlc3QgaW4gaGF2aW5nIGEgd2Vla2x5IC8gYmktd2Vla2x5IGNhbGwg
Zm9yIHRoZSBzYW1lLg0KPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHls
ZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG8iPkxl
dCBtZSBrbm93IGlmIHlvdSBhcmUgaW50ZXJlc3RlZCBpbiBqb2luaW5nIGFuZCBjb250cmlidXRp
bmcgdGhlIHNhbWUsIGFuZCB3aGF0IHRpbWUgd2lsbCBiZSBjb252ZW5pZW50IGZvciB5b3UuIEZp
bmRpbmcgdGltZSBjb252ZW5pZW50IGZvciBhbGwgdGltZSB6b25l4oCZcyB3aWxsIGJlIGRpZmZp
Y3VsdCBidXQNCiB3aWxsIHRyeSB0byBzZWUuIFNvIGZhciBwZW9wbGUgZnJvbSBCYW5nYWxvcmUs
IEF1c3RyYWxpYSAmYW1wOyBQb2xhbmQgaGF2ZSBzaG93biBpbnRlcmVzdCAvIGFscmVhZHkgY29u
dHJpYnV0aW5nLCBhbmQgaGVuY2UgbGlzdGVkIG91dCB0aW1lcyBjb252ZW5pZW50IGZvciB0aGVt
LiBQbGVhc2UgcmVwbHkgdG8gbWUgeW91ciBjb252ZW5pZW50IHRpbWUsIGlmIGJlbG93IG1lbnRp
b25lZCB0aW1lIGRvZXNu4oCZdCBzdWl0LiAoQmFzZWQgb24gdGhlIHJlcGx5LA0KIHdpbGwgdHJ5
IHRvIHNlbGVjdCkuIDxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9
Im1zby1tYXJnaW4tdG9wLWFsdDphdXRvO21zby1tYXJnaW4tYm90dG9tLWFsdDphdXRvIj5PcHRp
b24xIDogTW9uZGF5IC0mbmJzcDsgMyBQTSB0byA0IFBNIElTVCAoMTA6MzAgdG8gMTE6MzAgQU0g
UG9sYW5kIC8gODozMCB0byA5OjMwIFBNIEFDVCkuPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0
b20tYWx0OmF1dG8iPk9wdGlvbjI6IFR1ZXNkYXkmbmJzcDsgKFNhbWUgYXMgYWJvdmUpPG86cD48
L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0
OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG8iPk9wdGlvbiAzOiBNb25kYXkgLSBBbiBo
b3VyIGVhcmxpZXIuICgyIFBNIHRvIDMgUE0gSVNUICg5OjMwIHRvIDEwOjMwIEFNIFBvbGFuZCAv
IDc6MzAgdG8gODozMCBQTSBBQ1QpLjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCIgc3R5bGU9Im1zby1tYXJnaW4tdG9wLWFsdDphdXRvO21zby1tYXJnaW4tYm90dG9tLWFsdDph
dXRvIj5PcHRpb24gNDogVHVlc2RheSDigJMgc2FtZSB0aW1lIGFzIG9wdGlvbiAzPG86cD48L286
cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1
dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG8iPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1zby1tYXJnaW4tdG9wLWFsdDphdXRvO21zby1tYXJn
aW4tYm90dG9tLWFsdDphdXRvIj5SZWdhcmRzLDxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCIgc3R5bGU9Im1zby1tYXJnaW4tdG9wLWFsdDphdXRvO21zby1tYXJnaW4tYm90dG9t
LWFsdDphdXRvIj5SaWNoYXJkPG86cD48L286cD48L3A+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRt
bD4NCg==

--_000_13B9230883464B8F9A1C139A0B11A762fbcom_--
