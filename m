Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 925E8193617
	for <lists+openbmc@lfdr.de>; Thu, 26 Mar 2020 03:41:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nq4Q6JmMzDqYL
	for <lists+openbmc@lfdr.de>; Thu, 26 Mar 2020 13:41:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=0354312910=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=W9MrrxUS; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=HGkcMUqI; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nq3H1Cm8zDqN6
 for <openbmc@lists.ozlabs.org>; Thu, 26 Mar 2020 13:40:20 +1100 (AEDT)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02Q2e2E1025552; Wed, 25 Mar 2020 19:40:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=QUKaG2o0o9niqmNmwhtqK4CB9eI/EU5tizFUCCQqgts=;
 b=W9MrrxUS3t16Lo+/AMvysORkpy1sq6Z94T6ZDvZOnKk5Y3u7tpLv+UOw/Voy7tAeRKUF
 fbggPFFDnxwO4t9U8U8+C6a8gb+X5iOASYcYlj/nJYAfr/aBFbpCOe/VWK1N27qdSGBG
 shtoHvseNJPsiH/RUC4i7wOE629cJsHuhH4= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2yy3gye39c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 25 Mar 2020 19:40:16 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Wed, 25 Mar 2020 19:40:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R7hGg5km+G2lNg9dJqrULtH9vpeQtR3aX5LsreW1+D02Z/+LnllkHDresSueUpFzRIHuK5TP/5pLMXfwvzr65kUIhlIsLUNSeJXX2bRNPBqP4wMWTAgCm9J+M/Qd08tR/EwON9IPGd3JxA6hTo1xCMqySgd65di5NrbxqNvjFm4YF03lez8mRIc99BFsBV7/jVR2YVvBjmbmQ507NxBn+DS3QcNw+vGT6rD7mgtbiTIiHMC8ct1T+Obv3lLjYOOEohVMg7FfjRfAi3XRQZU/wgq3GmaLPr52hHKWu26tohFn2uGq1Xh5FvD05+ofdYDFN8bmH2KoBsg4BxTQl9dkvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUKaG2o0o9niqmNmwhtqK4CB9eI/EU5tizFUCCQqgts=;
 b=ZdKTj8XjDk84BJL88zCmn98ly+sms+HOao/+Yl3C/tYjm1yEJEPsktd0cilEzpn0Lf2724zFz51mpwVMuvAZZJZOc8PZun4PUvXxxe3bCviBaUXuNQIs5BWZUtILteNfWuJw7vTKVwxgGi4k2G6ehXXb1JtRNSdjG1buU+51t2mjb4XeB3X7f+VdS6VnGVTxcddeYRPz23QjfnIhTuWkBrZK0yy1sQkgwa937jJdtJ9D+PfTIcqUYrSVbgfklzfcYI4hBypT3pB72Y6QdpAu4lhQoPHYwYdhmmd7jBE9I6edxk5yt6Vlnp0Ww9vBXJs6BAhk8OHI7gDNHO6eXbeZlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUKaG2o0o9niqmNmwhtqK4CB9eI/EU5tizFUCCQqgts=;
 b=HGkcMUqIKn/qcVaP2uB3jw3aSZPjiygfpj6fd80qwss3Yh4Dp9cOwqA/RvnUDHsv9kxWhIw6IMc0KSySUHkuaFsUWIr/ggVDoO3EN8KMYdhS5DN+FmRygWIh8S3RgUoFOqD7VC2AgLqbixNPVtKkA4LPV/l65pPURxDFcED49vM=
Received: from MW3PR15MB3947.namprd15.prod.outlook.com (2603:10b6:303:49::9)
 by MW3PR15MB3755.namprd15.prod.outlook.com (2603:10b6:303:4c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.15; Thu, 26 Mar
 2020 02:40:15 +0000
Received: from MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936]) by MW3PR15MB3947.namprd15.prod.outlook.com
 ([fe80::acc7:ed14:3f77:9936%4]) with mapi id 15.20.2856.019; Thu, 26 Mar 2020
 02:40:15 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Max Lai/WYHQ/Wiwynn <Max_Lai@wiwynn.com>, "tomjose@linux.vnet.ibm.com"
 <tomjose@linux.vnet.ibm.com>
Subject: Re: Some questions about the handler of Add SEL Entry Command
Thread-Topic: Some questions about the handler of Add SEL Entry Command
Thread-Index: AdYCidN8vjFN1HoJSMqRwWkwqI3vpwAU2ASA
Date: Thu, 26 Mar 2020 02:40:14 +0000
Message-ID: <4C40A508-B1AE-497B-B181-D3E669B64A85@fb.com>
References: <HK2PR02MB3826E495C4A57F7F0F4C07B1EACE0@HK2PR02MB3826.apcprd02.prod.outlook.com>
In-Reply-To: <HK2PR02MB3826E495C4A57F7F0F4C07B1EACE0@HK2PR02MB3826.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c091:480::6996]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da1bf77f-e39f-4213-3c88-08d7d12f03ac
x-ms-traffictypediagnostic: MW3PR15MB3755:
x-microsoft-antispam-prvs: <MW3PR15MB37558A8ACD883C0211688843DDCF0@MW3PR15MB3755.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0354B4BED2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(346002)(366004)(136003)(39860400002)(36756003)(91956017)(64756008)(76116006)(5660300002)(66556008)(66446008)(66476007)(66946007)(316002)(54906003)(71200400001)(8676002)(86362001)(81156014)(6486002)(2616005)(4326008)(6506007)(53546011)(33656002)(110136005)(2906002)(186003)(8936002)(478600001)(6512007)(81166006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MW3PR15MB3755;
 H:MW3PR15MB3947.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bByAKl1yZIoQxBr6G8FHUgloDtp6fMvqPB2CD2SxLTL+q3VCC72FLNv3LYaXaYqkgPreOsiuLhJ8Ck/jeo7i7rmUfG5X162F1ADnK+GXbOEdrmdKiheQzhbEyAsZswH8SbCDxBleazMwpefGtTVrwnAIL75H6pvhSSzqb1SWaQVih+yWLQcme28QSeLzhpdSd/iSxyV87Zs5sfOpSn6SGYZuD75V9DUTuqqkQQJWsmXqS2XLgzJ+6lpeePd25F8ync/Q2aIjgLjUdv3GM4UZ2k9J183R57t0HEc+BMJfHg9OX8QwYaDa8EJvV3LCRDLXVUb0XPd6+KxbfBE9/1qPONWM1q8BaBA2oTQ/Do9OtCjVNHLQF2LgykS4KZOeUQgeuzdl7umndZzKS3nTyf1F8pEbR03XnojBhMEfM1hBqFcEUmRj3k0biCbI01ZqBRNm
x-ms-exchange-antispam-messagedata: Uz9IRleqmKKFyM5tBw3GIyX+rmiT0K2H4quhuHHCX79FeQc2k/Ag/TexIiByq8peQQnBHa7DD79//3OLHtK6s8074pc36Zjgmdde7gEpYjkmRx9UlslMVdtoZRAhHhcyWwcxRZke918MbBwQPJdoiZ3PjQb36OMXdvJTwONa3k4=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_4C40A508B1AE497BB181D3E669B64A85fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: da1bf77f-e39f-4213-3c88-08d7d12f03ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2020 02:40:14.9441 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s0iMqwxf1PMRB7BBtjQnE2PN5COrzlTKfb6ttuf4KGShpa/N4iFl1hX9g8t8aaoaW1Xp7tReWqGI9/Ie3VBBpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3755
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-25_13:2020-03-24,
 2020-03-25 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 bulkscore=0 adultscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1011 malwarescore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003260014
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "LF_OpenBMC.WYHQ.Wiwynn" <LF_OpenBMC.WYHQ.Wiwynn@Wiwynn.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_4C40A508B1AE497BB181D3E669B64A85fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBkb27igJl0IHRoaW5rIHRoaXMgY29tbWFuZCBpcyBldmVuIHN1cHBvcnRlZCBjb21wbGV0ZWx5
IGJ5IElQTUlELCBJIHRoaW5rIGl0IHdhcyBzdGFydGVkIHdpdGggb25seSBvbmUgdHlwZSBhbmQg
bmV2ZXIgZ290IHRvIGNvbXBsZXRpb24uDQoNCkZyb206IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNl
cyt2aWpheWtoZW1rYT1mYi5jb21AbGlzdHMub3psYWJzLm9yZz4gb24gYmVoYWxmIG9mIE1heCBM
YWkvV1lIUS9XaXd5bm4gPE1heF9MYWlAd2l3eW5uLmNvbT4NCkRhdGU6IFdlZG5lc2RheSwgTWFy
Y2ggMjUsIDIwMjAgYXQgNDowMyBQTQ0KVG86ICJ0b21qb3NlQGxpbnV4LnZuZXQuaWJtLmNvbSIg
PHRvbWpvc2VAbGludXgudm5ldC5pYm0uY29tPg0KQ2M6ICJvcGVuYm1jQGxpc3RzLm96bGFicy5v
cmciIDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+LCAiTEZfT3BlbkJNQy5XWUhRLldpd3lubiIg
PExGX09wZW5CTUMuV1lIUS5XaXd5bm5AV2l3eW5uLmNvbT4NClN1YmplY3Q6IFNvbWUgcXVlc3Rp
b25zIGFib3V0IHRoZSBoYW5kbGVyIG9mIEFkZCBTRUwgRW50cnkgQ29tbWFuZA0KDQpIaSBUb20s
DQoNCk91ciB2YWxpZGF0aW9uIHRlYW0gbWV0IGEgcHJvYmxlbSBpbiBwaG9zcGhvci1ob3N0LWlw
bWlkIChwaG9zcGhvci1pcG1pLWhvc3QpIHJlY2VudGx5LiBXZSB3YW50IHRvIHVzZSB0aGUgQWRk
IFNFTCBFbnRyeSBDb21tYW5kIGhhbmRsZWQgYnkgaXBtaVN0b3JhZ2VBZGRTRUwuIFdlIGxvb2sg
Zm9yd2FyZCB0byBnZXR0aW5nIGNvcnJlY3Qgc2VsIGxvZyB3aXRoIHBhcmFtZXRlciB3ZSBvZmZl
ci4gQnV0IFdlIGZvdW5kIHRoYXQgdGhlIGhhbmRsZXIgb25seSB1c2Ugc2Vuc29ydHlwZSB0byBj
cmVhdGUgbG9nIGVudHJ5IHdoZW4gcmVjb3JkVHlwZSBpcyBlcXVhbCB0byBwcm9jZWR1cmVUeXBl
KDB4REUpLiBXaHkgdGhlIG90aGVyIHBhcmFtZXRlciBpcyBpZ25vcmVkIHRvIGNyZWF0ZSBsb2cg
ZW50cnkgPyBJdCBzZWVtZWQgdGhhdCBpdCBkaWTigJl0IGZvbGxvdyB0aGUgaXBtaSBzcGVjLiBU
aGVyZSBhcmUgbW9yZSBxdWVzdGlvbnMuIFdoYXQgaXMgdGhlIGVTRUwgPyBJbiBmdW5jdGlvbiBj
cmVhdGVQcm9jZWR1cmVMb2dFbnRyeSgpLCB3aGF0IGluZm9ybWF0aW9uIHdhcyBzdG9yZWQgaW4g
dGhlIGVTRUxGaWxlICgvdG1wL2VzZWwpID8gQW5kIGhvdyB0byBjcmVhdGUgdGhlIGVTRUxGaWxl
ID8NCg0KUmVnYXJkcywNCk1heCBMYWkNCg0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCg0KVGhpcyBlbWFpbCBjb250YWlucyBjb25maWRlbnRpYWwgb3Ig
bGVnYWxseSBwcml2aWxlZ2VkIGluZm9ybWF0aW9uIGFuZCBpcyBmb3IgdGhlIHNvbGUgdXNlIG9m
IGl0cyBpbnRlbmRlZCByZWNpcGllbnQuDQoNCkFueSB1bmF1dGhvcml6ZWQgcmV2aWV3LCB1c2Us
IGNvcHlpbmcgb3IgZGlzdHJpYnV0aW9uIG9mIHRoaXMgZW1haWwgb3IgdGhlIGNvbnRlbnQgb2Yg
dGhpcyBlbWFpbCBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLg0KDQpJZiB5b3UgYXJlIG5vdCB0aGUg
aW50ZW5kZWQgcmVjaXBpZW50LCB5b3UgbWF5IHJlcGx5IHRvIHRoZSBzZW5kZXIgYW5kIHNob3Vs
ZCBkZWxldGUgdGhpcyBlLW1haWwgaW1tZWRpYXRlbHkuDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K

--_000_4C40A508B1AE497BB181D3E669B64A85fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <B08AD0A703C8FF4D91B26C1730B8ABE9@namprd15.prod.outlook.com>
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
b3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTIuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCnNwYW4uRW1haWxTdHlsZTIwDQoJe21zby1zdHlsZS10eXBlOnBlcnNv
bmFsLXJlcGx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndp
bmRvd3RleHQ7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7
DQoJZm9udC1zaXplOjEwLjBwdDt9DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7c2l6ZTo4LjVpbiAx
MS4waW47DQoJbWFyZ2luOjEuMGluIDEuMjVpbiAxLjBpbiAxLjI1aW47fQ0KZGl2LldvcmRTZWN0
aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9DQotLT48L3N0eWxlPg0KPC9oZWFkPg0KPGJvZHkg
bGFuZz0iRU4tVVMiIGxpbms9IiMwNTYzQzEiIHZsaW5rPSIjOTU0RjcyIj4NCjxkaXYgY2xhc3M9
IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1z
aXplOjExLjBwdCI+SSBkb27igJl0IHRoaW5rIHRoaXMgY29tbWFuZCBpcyBldmVuIHN1cHBvcnRl
ZCBjb21wbGV0ZWx5IGJ5IElQTUlELCBJIHRoaW5rIGl0IHdhcyBzdGFydGVkIHdpdGggb25seSBv
bmUgdHlwZSBhbmQgbmV2ZXIgZ290IHRvIGNvbXBsZXRpb24uPG86cD48L286cD48L3NwYW4+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxv
OnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxkaXYgc3R5bGU9ImJvcmRlcjpub25lO2JvcmRl
ci10b3A6c29saWQgI0I1QzRERiAxLjBwdDtwYWRkaW5nOjMuMHB0IDBpbiAwaW4gMGluIj4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxiPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjayI+RnJvbTogPC9z
cGFuPjwvYj48c3BhbiBzdHlsZT0iY29sb3I6YmxhY2siPm9wZW5ibWMgJmx0O29wZW5ibWMtYm91
bmNlcyYjNDM7dmlqYXlraGVta2E9ZmIuY29tQGxpc3RzLm96bGFicy5vcmcmZ3Q7IG9uIGJlaGFs
ZiBvZiBNYXggTGFpL1dZSFEvV2l3eW5uICZsdDtNYXhfTGFpQHdpd3lubi5jb20mZ3Q7PGJyPg0K
PGI+RGF0ZTogPC9iPldlZG5lc2RheSwgTWFyY2ggMjUsIDIwMjAgYXQgNDowMyBQTTxicj4NCjxi
PlRvOiA8L2I+JnF1b3Q7dG9tam9zZUBsaW51eC52bmV0LmlibS5jb20mcXVvdDsgJmx0O3RvbWpv
c2VAbGludXgudm5ldC5pYm0uY29tJmd0Ozxicj4NCjxiPkNjOiA8L2I+JnF1b3Q7b3BlbmJtY0Bs
aXN0cy5vemxhYnMub3JnJnF1b3Q7ICZsdDtvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcmZ3Q7LCAm
cXVvdDtMRl9PcGVuQk1DLldZSFEuV2l3eW5uJnF1b3Q7ICZsdDtMRl9PcGVuQk1DLldZSFEuV2l3
eW5uQFdpd3lubi5jb20mZ3Q7PGJyPg0KPGI+U3ViamVjdDogPC9iPlNvbWUgcXVlc3Rpb25zIGFi
b3V0IHRoZSBoYW5kbGVyIG9mIEFkZCBTRUwgRW50cnkgQ29tbWFuZDxvOnA+PC9vOnA+PC9zcGFu
PjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPkhpIFRvbSw8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPiZuYnNwOzxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PGI+T3Vy
IHZhbGlkYXRpb24gdGVhbSBtZXQgYSBwcm9ibGVtIGluIHBob3NwaG9yLWhvc3QtaXBtaWQgKHBo
b3NwaG9yLWlwbWktaG9zdCkgcmVjZW50bHkuIFdlIHdhbnQgdG8gdXNlIHRoZTwvYj4NCjxiPkFk
ZCBTRUwgRW50cnkgQ29tbWFuZCBoYW5kbGVkIGJ5IGlwbWlTdG9yYWdlQWRkU0VMLiBXZSBsb29r
IGZvcndhcmQgdG8gZ2V0dGluZyBjb3JyZWN0IHNlbCBsb2cgd2l0aCBwYXJhbWV0ZXIgd2Ugb2Zm
ZXIuIEJ1dCBXZSBmb3VuZCB0aGF0IHRoZSBoYW5kbGVyIG9ubHkgdXNlIHNlbnNvcnR5cGUgdG8g
Y3JlYXRlIGxvZyBlbnRyeSB3aGVuIHJlY29yZFR5cGUgaXMgZXF1YWwgdG8gcHJvY2VkdXJlVHlw
ZSgweERFKS4gV2h5IHRoZSBvdGhlciBwYXJhbWV0ZXINCiBpcyBpZ25vcmVkIHRvIGNyZWF0ZSBs
b2cgZW50cnkgPyBJdCBzZWVtZWQgdGhhdCBpdCBkaWTigJl0IGZvbGxvdyB0aGUgaXBtaSBzcGVj
LiBUaGVyZSBhcmUgbW9yZSBxdWVzdGlvbnMuIFdoYXQgaXMgdGhlIGVTRUwgPyBJbiBmdW5jdGlv
biBjcmVhdGVQcm9jZWR1cmVMb2dFbnRyeSgpLCB3aGF0IGluZm9ybWF0aW9uIHdhcyBzdG9yZWQg
aW4gdGhlIGVTRUxGaWxlICgvdG1wL2VzZWwpID8gQW5kIGhvdyB0byBjcmVhdGUgdGhlIGVTRUxG
aWxlID88L2I+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDs8bzpw
PjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlJlZ2FyZHMsPG86cD48L286cD48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5NYXggTGFpPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iY29sb3I6IzFGNDk3RCI+Jm5ic3A7PC9zcGFuPjxvOnA+
PC9vOnA+PC9wPg0KPHA+PGI+PHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNrIj4tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS08L3NwYW4+PC9iPjxvOnA+PC9vOnA+PC9w
Pg0KPHA+PGI+PHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNrIj5UaGlzIGVtYWlsIGNvbnRhaW5zIGNv
bmZpZGVudGlhbCBvciBsZWdhbGx5IHByaXZpbGVnZWQgaW5mb3JtYXRpb24gYW5kIGlzIGZvciB0
aGUgc29sZSB1c2Ugb2YgaXRzIGludGVuZGVkIHJlY2lwaWVudC4NCjwvc3Bhbj48L2I+PG86cD48
L286cD48L3A+DQo8cD48Yj48c3BhbiBzdHlsZT0iY29sb3I6YmxhY2siPkFueSB1bmF1dGhvcml6
ZWQgcmV2aWV3LCB1c2UsIGNvcHlpbmcgb3IgZGlzdHJpYnV0aW9uIG9mIHRoaXMgZW1haWwgb3Ig
dGhlIGNvbnRlbnQgb2YgdGhpcyBlbWFpbCBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLjwvc3Bhbj48
L2I+PG86cD48L286cD48L3A+DQo8cD48Yj48c3BhbiBzdHlsZT0iY29sb3I6YmxhY2siPklmIHlv
dSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHlvdSBtYXkgcmVwbHkgdG8gdGhlIHNl
bmRlciBhbmQgc2hvdWxkIGRlbGV0ZSB0aGlzIGUtbWFpbCBpbW1lZGlhdGVseS48L3NwYW4+PC9i
PjxvOnA+PC9vOnA+PC9wPg0KPHA+PGI+PHNwYW4gc3R5bGU9ImNvbG9yOmJsYWNrIj4tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS08L3NwYW4+PC9iPjxvOnA+PC9v
OnA+PC9wPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_4C40A508B1AE497BB181D3E669B64A85fbcom_--
