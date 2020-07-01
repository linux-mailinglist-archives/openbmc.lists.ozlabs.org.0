Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2362111E6
	for <lists+openbmc@lfdr.de>; Wed,  1 Jul 2020 19:27:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xp7Y4Z77zDqtQ
	for <lists+openbmc@lfdr.de>; Thu,  2 Jul 2020 03:27:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=44514f4c1f=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=Mk41UaAT; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=aax6CBeM; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xp6d3Xs7zDqWX
 for <openbmc@lists.ozlabs.org>; Thu,  2 Jul 2020 03:26:06 +1000 (AEST)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 061HN2Ue022029; Wed, 1 Jul 2020 10:26:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=KC5UiytLzfxnZwxIsvM7FAhA2aQejbYDOX83mTAld1o=;
 b=Mk41UaATJMcW13svzbs6msRhJmGcBqjqkG6nCh84IRbsNUCGleYl8Wo3l0Bzloxk4qXo
 vnYk0AS3ZtFVLXMoQHEVzO8eFyArkgtoGhq8Ynx4YbQfjTcOzivpOg11zdVOZF7Vvqzo
 dQ9dS32oGHMycM0YVMLLJwHaX2zvdxwGaKo= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 31x3xh2xva-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 01 Jul 2020 10:26:00 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 1 Jul 2020 10:25:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iA2/2Md82ffOYMJPlGw+irCnu26si+Rw9nsudtHGKrNfU5C1uiDmnJ+KVVDZSYOiLQ5B7x13Jn6Faxjn2sOjo9WWw9r6vOmz3xjtvJE28RIhewKaTXUCY9zhr3QIxsCO8S8J4Kdu6jjhxhPdYPjhTcAPiPrwOGt5OlLy31//6dP4sRIEZmdYn85XbcN+jslDqzO+nw+11Wd5qM76oRfJbbXabn90UzN8pekM7aH2ddSVPUMD5aUIqoWAUCdwPvHxZznAqVzAy2p73ttSp0Y4qyIJYF53/x4ygo3W2GUNhw0xndytKbLiCrnm4nxBXc2MrFn7duSXUe6f3738eVIzjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KC5UiytLzfxnZwxIsvM7FAhA2aQejbYDOX83mTAld1o=;
 b=l1IE5eiEQEntckH+hplBPSdafqpsQzAeG1qGVUUrp3wyfpylDJliL+FWynLsqoW7x45hb5wK5PgDdooMIv7FZBlX1pHbR3+TljKyJCKc1tvMtdJzWw21qypB3LeyAHlyL8wRcI8h9gG1YMQiI8QqV2sPhXS9Xsco+pyaccApmS+Wphq5kpasmcyqQ4AacBxtHI7vPeNq//cVAjllCrH4N7gC2/CRCl6L0eCXd7s4t45DgOj9gc/0VV8RyN6Hles/tR3sInjnkAwJWUakrlqT3JZA2u5SEHGffsqGXTXRgYDa9drbOmy+PTth9wmQbz9r2RSTXIttPDkvAQoZhlANNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KC5UiytLzfxnZwxIsvM7FAhA2aQejbYDOX83mTAld1o=;
 b=aax6CBeMNLO6Xd3bZ1Dhsd5Q7Z9r7EGQo5QGJzypepFGu6c2d8sveNjoLD9c8R4UQvuhC3vF8t3VFzch6HaxzbY4wuktjfpxchtN9gvo1Y4pUmatopJDbGTFlhtFKTEpwDYSYEUfzqjVuZqoKASe2QpyoMCtqvo49mPjTQRneJw=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB3365.namprd15.prod.outlook.com (2603:10b6:a03:111::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Wed, 1 Jul
 2020 17:25:59 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::34b8:e690:6dfc:8faf]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::34b8:e690:6dfc:8faf%4]) with mapi id 15.20.3153.020; Wed, 1 Jul 2020
 17:25:59 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>, Milton Miller II
 <miltonm@us.ibm.com>, Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: OpenBMC health statistics
Thread-Topic: OpenBMC health statistics
Thread-Index: AdZOLPWDDv1xqlasSdaTVfH5fJhasAAEUDIAAAHHnRD//6WEgIAB7yUAgAAQWwCAAUJogP//se8A
Date: Wed, 1 Jul 2020 17:25:58 +0000
Message-ID: <6199281B-9865-475F-97B4-F560B8B59496@fb.com>
References: <02d91b6a-c2ba-0239-a62e-a680f97bb009@linux.ibm.com>
 <f4e49a09aca2431e921866d1b6cbbe6c@intel.com>
 <0a8a5506-0305-12aa-91c5-6c61d359a808@gmail.com>
 <MWHPR11MB13899C8D065A07EE2A2F31BCF16E0@MWHPR11MB1389.namprd11.prod.outlook.com>
 <79C50A42-5BBB-40C0-8578-6659CA3DE1E1@fb.com>
 <OF5EABA8F0.4EA96F13-ON00258597.006CE4F4-00258597.006D1458@notes.na.collabserv.com>
 <CY4PR1101MB2311892FC6029422D65938B6866C0@CY4PR1101MB2311.namprd11.prod.outlook.com>
In-Reply-To: <CY4PR1101MB2311892FC6029422D65938B6866C0@CY4PR1101MB2311.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2601:647:4b00:fd70:18e2:66b5:5e3d:3d1a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8495ead5-37a0-4b97-a2ad-08d81de3d1fc
x-ms-traffictypediagnostic: BYAPR15MB3365:
x-microsoft-antispam-prvs: <BYAPR15MB3365A55E07A42AF277675C67DD6C0@BYAPR15MB3365.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Lh9jMxaC70rBkDlQTTOiqXecsOGq1Jc5F3X3ewFvTrYYi+CwP22wgkDR7F6eQcZFBAA/qVd8O6u632N5typjRmwQfyMYwuxx0pxxIeEKaquts2ebea5uLAcxVatcY0eMjfmnz28TRrrcShfHh93nCFpPt7yRWslevCZoRBWqwjoFpCUzudWQKk/Scwh3aVi6USeywbZ3B6LXAm/dDRqTMeho1Lxmqf69k+UlpkJiWAfh4Lxvi11nBs74QMgRV/Y6LydINxY8M2pI8ezwl7MNNv9WLorOYUXn2QjG1yzZrNNA3d7WduEhSFMSKZNKZSmP0IMvCx+N2k/pB127EAmUUx55+lFRM+59PfGlg9HvyRwdrxtupPCG89owerEWSFg6ZolM8tXpVWgJ/+1NE9ulTw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(366004)(376002)(39860400002)(346002)(396003)(2906002)(316002)(8936002)(66946007)(8676002)(4326008)(66446008)(66556008)(64756008)(66476007)(53546011)(7116003)(6506007)(54906003)(76116006)(110136005)(33656002)(71200400001)(3480700007)(6486002)(6512007)(86362001)(36756003)(186003)(83380400001)(2616005)(966005)(478600001)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 8/101yFzmYwH8VyzLg4/fOmKi1d1ueutC2IGLCvm+DO58gLC5ygaPXIgZm2hVi44slr8cfxxMKYB6HQkBfVnFgCGdB7fIC2TpW/JIkAOMsZKqkJAZDVqhb8j32aZJ83alpQdyaZIcqicw7VnAB0W0Y79dnPRqF1Xk1vLhC1sBVtbvww/fjT1oUcI8aMyvZeGH2/0N4h8REAuIvHod3aXqCjHsI9iuuzWaG0q4SGLlc2Pr5RQAup89ycRSXiSBoqakTKP+m4LOVFHfYxK8c9nS6qvnA3bKFe1BLMbDL7j5x5Vd4ZVnQHlb8C43dBFv+Qk9CaMb8buwxJOrjE2iqiTPKwuHmCaViENLAmCUCr0g8Ppa8dy68I/neJwAbyMrlVxOX8c8gQKb5yAERnNhB2DLR6jt0nuVqt6pJRGnXnELG3cCvZCaZ2meJbyqKom+ob9qxJ839rnlQo6rH9nOtt095FWqdQVw1TAhAgIaVLn9rHoHQsui0Q7tb7Myp99UReHpQdd9/3WU/wT7/mWfd612JDph0+Zen5wE1sMW2QmSDIE/mlovc1qpWwckC2alto1
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <D859CD9289CF1841962C52CBC1E4787A@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8495ead5-37a0-4b97-a2ad-08d81de3d1fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 17:25:58.9382 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 49JPVqQJE+df/nz2ZmnKT5nHT2vUrgEkqY4WYxPOmv6do/FS/cv8nyMTdkFeSOeIuINQyENLkEq0OSbIxNbyJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3365
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-01_09:2020-07-01,
 2020-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 adultscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 bulkscore=0 priorityscore=1501 mlxscore=0 impostorscore=0 spamscore=0
 clxscore=1011 cotscore=-2147483648 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007010123
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
Cc: "Khetan, Sharad" <sharad.khetan@intel.com>,
 krtaylor <kurt.r.taylor@gmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SSBkb24ndCBzZWUgYW55IGlzc3VlcyB3aXRoIGhhdmluZyB0aGlzIHVuZGVyIGRldmVsb3BtZW50
cywgaXQgd291bGQgYmUgZ29vZCBpZiB5b3UgY2FuIGNyZWF0ZSANCmEgIkhvd1RvIiBmb2xkZXIg
dW5kZXIgZGV2ZWxvcG1lbnRzIGFuZCBjb3B5IHRoZXJlLg0KDQrvu79PbiA3LzEvMjAsIDg6MDUg
QU0sICJNYXR1c3pjemFrLCBQaW90ciIgPHBpb3RyLm1hdHVzemN6YWtAaW50ZWwuY29tPiB3cm90
ZToNCg0KICAgIFRoYW5rIHlvdSBmb3IgdGhlIG1lYW5pbmdmdWwgZGlzY3Vzc2lvbi4gVGhpcyAg
ZG9jdW1lbnQgaXMgbW9yZSByZWxldmFudCBmb3IgdGhlIGRldmVsb3BlcnMsIGJlY2F1c2UgaXQg
Y29udGFpbnMgaW5mb3JtYXRpb24gYWJvdXQgaG93IHRvIGltcGxlbWVudCBCTUMgaGVhbHRoIHN0
YXRpc3RpY3MgdG8gYmUgY29tcGxpYW50IHdpdGggdGhlIE9wZW5CTUMgc2Vuc29yIGFuZCB0ZWxl
bWV0cnkgYXJjaGl0ZWN0dXJlLiBTbyBwcm9iYWJseSwgdGhlIGJlc3QgcGxhY2UgdG8gcHV0IGl0
LCB3b3VsZCBiZSB0aGUgZGV2ZWxvcG1lbnQgZm9sZGVyLiBEbyB5b3UgYWdyZWU/IA0KDQogICAg
UGlvdHIgTWF0dXN6Y3phaw0KICAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KICAgIEludGVsIFRlY2hub2xvZ3kg
UG9sYW5kIHNwLiB6IG8uby4gDQogICAgdWwuIFNsb3dhY2tpZWdvIDE3MywgODAtMjk4IEdkYW5z
aw0KICAgIEtSUyAxMDE4ODINCiAgICBOSVAgOTU3LTA3LTUyLTMxNg0KDQogICAgLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCiAgICBGcm9tOiBNaWx0b24gTWlsbGVyIElJIDxtaWx0b25tQHVz
LmlibS5jb20+IA0KICAgIFNlbnQ6IFR1ZXNkYXksIEp1bmUgMzAsIDIwMjAgOTo1MSBQTQ0KICAg
IFRvOiBKb3NlcGggUmV5bm9sZHMgPGpyZXlAbGludXguaWJtLmNvbT4NCiAgICBDYzogVmlqYXkg
S2hlbWthIDx2aWpheWtoZW1rYUBmYi5jb20+OyBLaGV0YW4sIFNoYXJhZCA8c2hhcmFkLmtoZXRh
bkBpbnRlbC5jb20+OyBrcnRheWxvciA8a3VydC5yLnRheWxvckBnbWFpbC5jb20+OyBNYXR1c3pj
emFrLCBQaW90ciA8cGlvdHIubWF0dXN6Y3pha0BpbnRlbC5jb20+OyBvcGVuYm1jQGxpc3RzLm96
bGFicy5vcmcNCiAgICBTdWJqZWN0OiBSRTogT3BlbkJNQyBoZWFsdGggc3RhdGlzdGljcw0KDQog
ICAgT24gMDYvMzAvMjAyMCBhcm91bmQgMDE6NTRQTSBpbiBzb21lIHRpbWV6b25lLCBKb3NlcGgg
UmV5bm9sZHMgd3JvdGU6DQogICAgPk9uIDYvMjkvMjAgMzoyMCBQTSwgVmlqYXkgS2hlbWthIHdy
b3RlOg0KICAgID4+IFdlIGNhbiBoYXZlIGEgZm9sZGVyICJob3cgdG8iIHVuZGVyIGd1aWRlbGlu
ZXMgYW5kIHRoaXMgZG9jdW1lbnQNCiAgICA+c2hvdWxkIGZpdCB0aGVyZS4NCiAgICA+DQogICAg
PlRoYXQgbWFrZXMgc2Vuc2UgdG8gbWUuICBJIHdhbnQgZG9jdW1lbnQgc3R1ZmYgZm9yIGJvdGgg
c3lzdGVtIA0KICAgID5pbnRlZ3JhdG9ycyAod2hvIHB1dCB0b2dldGhlciBmaXJtd2FyZSBpbWFn
ZXMpIGFuZCBzeXN0ZW0gDQogICAgPmFkbWluaXN0cmF0b3JzICh3aG8gcGVyZm9ybSBCTUMgaW5p
dGlhbCBjb25maWd1cmF0aW9ucywgb3ZlcnNlZSBCTUMgDQogICAgPm9wZXJhdGlvbiwgZXRjLiku
DQogICAgPldlIGFsc28gbmVlZCBhIHBsYWNlIGZvciBkb2N1bWVudGF0aW9uIGZvciB0aGluZ3Mg
bGlrZSBob3cgdG8gdXNlIA0KICAgID5CTUNXZWIncyBtVExTIGZlYXR1cmUgd2hpY2ggY3V0cyBh
Y3Jvc3Mgc3lzdGVtIGludGVncmF0aW9uIGFuZCANCiAgICA+YWRtaW5pc3RyYXRpb24uDQoNCiAg
ICBTcGVha2luZyBvZiB3aGljaCwgd2UgYWRkZWQgdGhlIGRvY3VtZW50IGJ1dCBkaWRuJ3QgbGlu
ayB0byBpdCBpbiBlaXRoZXIgdGhlIHRvcCBsZXZlbCBvciB0aGUgdXNlciBndWlkZSBzZWN0aW9u
IHNvIHlvdSBoYXZlIHRvIHN0dW1ibGUgYWNyb3NzIGl0Lg0KDQogICAgaHR0cHM6Ly9naXRodWIu
Y29tL29wZW5ibWMvZG9jcy9ibG9iL21hc3Rlci9zZWN1cml0eS9UTFMtY29uZmlndXJhdGlvbi5t
ZA0KDQogICAgTWF5YmUgaGVyZT8gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvZG9jcy8jb3Bl
bmJtYy11c2FnZQ0KDQogICAgPiBEZXRhaWxzOg0KICAgID5odHRwczovL3VybGRlZmVuc2UucHJv
b2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX2dpdGh1Yi5jb21faWJtLTINCiAgICA+RG9w
ZW5ibWNfZGV2X2lzc3Vlc18xNTMxJmQ9RHdJRGFRJmM9amZfaWFTSHZKT2JUYngtc2lBMVpPZyZy
PWJ2djdBSkVFDQogICAgPkNvUktCVTAycmN1NEY1RFdkLUV3WDhBczJ4clhlTzlaU280Jm09WENM
OGVJOTU0ZjRlcXVGNW1qbm84MGs5UnRRcE5Ccg0KICAgID5rRm9XcnR0TEhVRjgmcz1melBCQzJf
elNnSEZGMEt1Xzg3UVhQQmxsNUNZcUM5TFRETzlCRFZDdkxRJmU9DQogICAgPg0KICAgID4tIEpv
c2VwaA0KDQogICAgbWlsdG9uDQoNCg0K
