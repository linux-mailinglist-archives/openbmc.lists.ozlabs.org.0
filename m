Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2676F27EFDC
	for <lists+openbmc@lfdr.de>; Wed, 30 Sep 2020 19:01:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C1jGC4YBjzDqWZ
	for <lists+openbmc@lfdr.de>; Thu,  1 Oct 2020 03:01:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=7542478bc9=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=HtMD7Sfv; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=CfGhoEGM; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C1jF12PrgzDqTb
 for <openbmc@lists.ozlabs.org>; Thu,  1 Oct 2020 03:00:32 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 08UGu1J3004888
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 10:00:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=yt1vHMNHYkcWQqryCRMqTKnxQB8M3hfTBpYzS++x3QI=;
 b=HtMD7SfvWFgahwC2NzU211Znipn8zHG9f1lK3+QDM8KXdkZ6lGf86+dITMvMn36QPjYk
 KNA/4WlUlJC/abeW5UScQ0DWvpdz4cSbONGXMscRDj8FVg39thTGtoIMz7tWx8N9Gkhq
 NJheEBjpyqaRmzRdSkJpiCWsTtcbUJi+rqw= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0089730.ppops.net with ESMTP id 33t14ympq2-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 10:00:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 30 Sep 2020 10:00:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NK+p/OTQ64PkQN9LXS7L8tSch7Bqc6N0SlDYfRTc+NFeKQUGzW4Js2VFg6Icq/yh1Hqr6i/IDF5CR+LL3zmq4BofKFc/eSBxX3z+Ep2pmiSULtJujRQ1tbIwQV1SeFGOr5mzCxvWUuOs4q4D5wSAt6r114BdgqG4QfMoyNh4MDaPqqSVAbz2fnILu/DTe0YM694LMyWeBY0hvj6YO1R967TIBIk7rPyetpTK92PPwnd3mtjqaEeOj953pJiQlYiBypyGNTtQKiosCwUZV9lVkwxjqP75DQG3hhJkQ23Y7yg51Yx+whDfIfzterwynuK8yVu8KwOKOMOKD+xkVbeM9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yt1vHMNHYkcWQqryCRMqTKnxQB8M3hfTBpYzS++x3QI=;
 b=G78xi+9g8ahLZ9nAPENDv44xJlYBE74MtYyf3Clg4/rg6SmTT+5ydq4/cLMq3lSHUeXUgrqBvoThycgzm1jDHs9pNKtrU3Iv+AWWN/AWoqbWFpJ6aPxedQtQuGbs68jtbZcI2mwk2rOK5D0JOjQEAjngH34jNg4EGRPUFOdftc4IGzUlzEQ6xq6aTjrd/JwVim5mowt3oJfK0WXkrTQESJ/64W2dX3GPrNO1mmfxJGAJ8S98CKpaiP34fy13TlSudpiYINOL/4+esH3aW0SecPuAxrCiDsrHbZkAZGvU/MM36CLaES8SIs7PVCIdoYDvu22wXKVKRsDJlyonvzomMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yt1vHMNHYkcWQqryCRMqTKnxQB8M3hfTBpYzS++x3QI=;
 b=CfGhoEGMFhXtk368EmlOTym3NzDzaKIVpAflGFMJxJjiSAGSdL7kdqCGTJ+dWyGZtqfxVT6CS3bS4eoku0cxfz9EL5koVYy3+hBW9/4lMkzu+R9rQvNJWPNVLcsDrq9tuvc0Ew2VHY/xs50Awp5U491c8LjozmTQelvKvpWQLgQ=
Received: from MN2PR15MB3231.namprd15.prod.outlook.com (2603:10b6:208:a1::22)
 by MN2PR15MB3183.namprd15.prod.outlook.com (2603:10b6:208:a5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Wed, 30 Sep
 2020 17:00:22 +0000
Received: from MN2PR15MB3231.namprd15.prod.outlook.com
 ([fe80::b09d:a49e:ecaa:1925]) by MN2PR15MB3231.namprd15.prod.outlook.com
 ([fe80::b09d:a49e:ecaa:1925%3]) with mapi id 15.20.3433.034; Wed, 30 Sep 2020
 17:00:22 +0000
From: Sai Dasari <sdasari@fb.com>
To: Openbmc <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Learning Series
Thread-Topic: OpenBMC Learning Series
Thread-Index: AQHWdlCwHJzSAeOuJEOCEV5BbMCQvKlDLckAgAcppQCACtqLAIAB68aAgAkVIACAAcIFgIAIoUwAgAuQE4CACw4fgA==
Date: Wed, 30 Sep 2020 17:00:22 +0000
Message-ID: <179181C3-A497-4D36-8A73-F22DA7FF4D8B@fb.com>
References: <C24D4BAF-B185-4640-BFEF-D391E51A0A35@fb.com>
 <452FDC0B-2E4F-4AD9-97E6-DE9B2333D99B@fb.com>
 <8EE0F70D-78CB-4CDB-A51C-53FC33A2AC87@fb.com>
 <EFFBC9D1-BA53-4C61-8BC2-7F52320245F7@fb.com>
 <51C18C28-4894-4BEF-AAA6-BACE5B934B5C@fb.com>
 <AFA8029B-BBBC-41A5-9F66-671D41D0E624@fb.com>
 <D4F1F4FA-E1E2-425C-B685-D0BAE3D5E596@fb.com>
 <A6D2354C-DD02-4BCB-AAE2-2F6B16784DBD@fb.com>
 <A5439E11-28B2-4476-9A9E-D8A8CA525A32@fb.com>
In-Reply-To: <A5439E11-28B2-4476-9A9E-D8A8CA525A32@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.41.20091302
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=fb.com;
x-originating-ip: [67.160.197.76]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6ff6b0e-98e7-4a39-4b44-08d8656251f3
x-ms-traffictypediagnostic: MN2PR15MB3183:
x-microsoft-antispam-prvs: <MN2PR15MB3183ED3BAF159A8AEF2E6E10CE330@MN2PR15MB3183.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:785;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5/HMnjcKc8JpMbVRVTjqUzGZQlMLpIvqLMh237z07nwjYiJ5j/ack96owr+BmHpjoEVRJ97vGsQEewgH34UVXKZMAzwiheHqVdK8+e+Mgxe3edWOMGs+cxYOrxDX7glvxzi93rEXo6834kV14RMYfMzYjNNxs2zyHzxPSaC25+NA/Wo/OFrOy9pVHUyc4sm6iSd+yvM2JeGxOmaaG4mpEa/zx5aNZntnluqeuRAjIVy5O+ZYWEgjtnckDUvwt3dvTSF50vNHeSEFMaEWfDRNVAnOjEISjA5hbmGWcpKku1zoBtoLV/Pzo9k/m7335TF9/S4Ak37oRhK8caenpLtFcKL/1w9hc23LaGbZAjGtez390d5MGQvcbJQ2jI2RE5+pFN5g8w4vOcgaXE6P0QbmwA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR15MB3231.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(136003)(396003)(346002)(39860400002)(6916009)(966005)(33656002)(66576008)(91956017)(76116006)(66556008)(64756008)(66446008)(2906002)(66476007)(66946007)(99936003)(8676002)(3480700007)(8936002)(71200400001)(316002)(478600001)(6486002)(36756003)(166002)(83080400001)(86362001)(6506007)(2616005)(5660300002)(6512007)(186003)(83380400001)(7116003)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: JKM16aPRfvOY1ksxVq4ny7Xd3aIfC3kEDvT/fUoZ8Jhu8bExf7M04w1wbbOJKXyxeubBuBSEQtv1y6A8pDPA3oR/sq9/cZqjaqlKortZnzX11FpAk1Ij2PwXH+sIjqIhGwe60ffWq3l9zncnMHY8AjGX9uMKSktfyKVsFQ74YyRnlqr6rYBnBmTPeY+XISRgYnDJD7pJmleiBzAxP+yvZozggkUSdYhFyqPeZ8aMNQXapgvd+3L9UJb9RzjrCORcsx5yeqp2Qk/dt4jzZkXp3+hUNzPDty8cGFlEM6rePH72z+YXR0SZQYQZBBAoSWcZb1pNbRNybh1v7zpdOmOs1qkxXghUSBO9KFF1PCaiVER0piuJ/7XhXImaClOw0feMyQcwJg4ykH4q9ZtIXXOonC3vnk8LVfvW+WsDt9Z2e11BbYlBV1BWaETokKN5Ju9FMrWW9BnMJPrcGRiRoeHE714W+wwi9gLDNRJm2Pgeods/shxhDnZxRYSXjYuA1kel/KvVLdRRIKj8VFrmAyRzrEKZqwvAhowJNpevYAywj2JikbhJ4YW/+EGk8Wly6n62lVCQKmxpbqhIuUyGuSlh2BqBEXjaKD3F8YLBsHZJubTGjSj2Mi1hXRZ4p52G1OTwZ+v+J+LEq6cy2X7b4uLUwA==
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
 boundary="_005_179181C3A4974D368A73F22DA7FF4D8Bfbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR15MB3231.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6ff6b0e-98e7-4a39-4b44-08d8656251f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2020 17:00:22.7685 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h6zyb5bLjX+OXJ3xeBxVmStb3HSABdV2BE8tmlyi6j+gJW8Pf8PMQaXfV0w3PO67
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR15MB3183
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-30_09:2020-09-30,
 2020-09-30 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 spamscore=0 adultscore=0 bulkscore=0 mlxscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009300133
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

--_005_179181C3A4974D368A73F22DA7FF4D8Bfbcom_
Content-Type: multipart/alternative;
	boundary="_000_179181C3A4974D368A73F22DA7FF4D8Bfbcom_"

--_000_179181C3A4974D368A73F22DA7FF4D8Bfbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UXVpY2sgUmVtaW5kZXIgYWJvdXQgdGhpcyB3ZWVr4oCZcyB0d28gbGVhcm5pbmcgc2Vzc2lvbnMg
MSkgVGVzdGluZyBBdXRvbWF0aW9uIGJ5IEdlb3JnZSBLZWlzaGluZyAoMTBBTSBJU1QpIDIpIFJl
ZGZpc2ggYnkgR3VubmFyIE1pbGxzKDEwQU0gUERUKS4gUGxlYXNlIGZpbmQgYXR0YWNoZWQgY2Fs
ZW5kYXIgaW52aXRlcyBhbmQgbWVldGluZyBpbmZvIGJlbG93Lg0KDQpGWUksIGZvciBvZmZsaW5l
IGF1ZGllbmNlLCB0aGVzZSBzZXNzaW9ucyBhcmUgcmVjb3JkZWQgYW5kIGNhbiBiZSBmb3VuZCBh
dCBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jL3dpa2kvUHJlc2VudGF0aW9ucyNv
cGVuYm1jLWxlYXJuaW5nLXNlcmllczIwMjANCg0KDQpUb3BpYyMxOiBUZXN0aW5nIEF1dG9tYXRp
b24gaW4gT3BlbkJNQw0KVGltZTogT2N0IDEsIDIwMjAgMTA6MDAgQU0gTXVtYmFpLCBLb2xrYXRh
LCBOZXcgRGVsaGkNCg0KDQpUb3BpYyMyIDogT3BlbkJNQzogUmVkZmlzaA0KVGltZTogT2N0IDEs
IDIwMjAgMTA6MDAgQU0gUGFjaWZpYyBUaW1lIChVUyBhbmQgQ2FuYWRhKQ0KDQpKb2luIFpvb20g
TWVldGluZw0KaHR0cHM6Ly91czAyd2ViLnpvb20udXMvai85Mzk2ODgwNDc2P3B3ZD1hMmd5WWtW
cFJqaEJaRXRoUVVRemNFRjJRalJYVVQwOQ0KDQpNZWV0aW5nIElEOiA5MzkgNjg4IDA0NzYNClBh
c3Njb2RlOiBvcGVuYm1jDQpPbmUgdGFwIG1vYmlsZQ0KKzE2Njk5MDA5MTI4LCw5Mzk2ODgwNDc2
IywsLCwsLDAjLCw4NTkyNTE1IyBVUyAoU2FuIEpvc2UpDQorMTI1MzIxNTg3ODIsLDkzOTY4ODA0
NzYjLCwsLCwsMCMsLDg1OTI1MTUjIFVTIChUYWNvbWEpDQoNCkRpYWwgYnkgeW91ciBsb2NhdGlv
bg0KICAgICAgICArMSA2NjkgOTAwIDkxMjggVVMgKFNhbiBKb3NlKQ0KICAgICAgICArMSAyNTMg
MjE1IDg3ODIgVVMgKFRhY29tYSkNCiAgICAgICAgKzEgMzQ2IDI0OCA3Nzk5IFVTIChIb3VzdG9u
KQ0KICAgICAgICArMSAzMDEgNzE1IDg1OTIgVVMgKEdlcm1hbnRvd24pDQogICAgICAgICsxIDMx
MiA2MjYgNjc5OSBVUyAoQ2hpY2FnbykNCiAgICAgICAgKzEgNjQ2IDU1OCA4NjU2IFVTIChOZXcg
WW9yaykNCk1lZXRpbmcgSUQ6IDkzOSA2ODggMDQ3Ng0KUGFzc2NvZGU6IDg1OTI1MTUNCkZpbmQg
eW91ciBsb2NhbCBudW1iZXI6IGh0dHBzOi8vdXMwMndlYi56b29tLnVzL3Uva2RkZlNwQWtFag0K

--_000_179181C3A4974D368A73F22DA7FF4D8Bfbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <8750989AB13DB74F98FF81F2364F9E3C@namprd15.prod.outlook.com>
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
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCWZvbnQtc2l6
ZToxMS4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KYTpsaW5rLCBz
cGFuLk1zb0h5cGVybGluaw0KCXttc28tc3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6IzA1NjND
MTsNCgl0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO30NCnNwYW4uRW1haWxTdHlsZTIwDQoJe21z
by1zdHlsZS10eXBlOnBlcnNvbmFsLXJlcGx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5z
LXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxl
LXR5cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1zaXplOjEwLjBwdDt9DQpAcGFnZSBXb3JkU2VjdGlv
bjENCgl7c2l6ZTo4LjVpbiAxMS4waW47DQoJbWFyZ2luOjEuMGluIDEuMGluIDEuMGluIDEuMGlu
O30NCmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT4N
CjwvaGVhZD4NCjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSIjMDU2M0MxIiB2bGluaz0icHVycGxl
IiBzdHlsZT0id29yZC13cmFwOmJyZWFrLXdvcmQiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24x
Ij4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlF1aWNrIFJlbWluZGVyIGFib3V0IHRoaXMgd2Vla+KA
mXMgdHdvIGxlYXJuaW5nIHNlc3Npb25zIDEpIFRlc3RpbmcgQXV0b21hdGlvbiBieSBHZW9yZ2Ug
S2Vpc2hpbmcgKDEwQU0gSVNUKSAyKSBSZWRmaXNoIGJ5IEd1bm5hciBNaWxscygxMEFNIFBEVCku
IFBsZWFzZSBmaW5kIGF0dGFjaGVkIGNhbGVuZGFyIGludml0ZXMgYW5kIG1lZXRpbmcgaW5mbyBi
ZWxvdy48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9v
OnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+RllJLCBmb3Igb2ZmbGluZSBhdWRpZW5jZSwg
dGhlc2Ugc2Vzc2lvbnMgYXJlIHJlY29yZGVkIGFuZCBjYW4gYmUgZm91bmQgYXQNCjxhIGhyZWY9
Imh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMvd2lraS9QcmVzZW50YXRpb25zI29w
ZW5ibWMtbGVhcm5pbmctc2VyaWVzMjAyMCI+DQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9v
cGVuYm1jL3dpa2kvUHJlc2VudGF0aW9ucyNvcGVuYm1jLWxlYXJuaW5nLXNlcmllczIwMjA8L2E+
PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+VG9waWMjMTogVGVzdGluZyBBdXRvbWF0aW9uIGluIE9wZW5CTUM8bzpwPjwv
bzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlRpbWU6IE9jdCAxLCAyMDIwIDEwOjAwIEFN
IE11bWJhaSwgS29sa2F0YSwgTmV3IERlbGhpPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+
Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+VG9waWMjMiA6IE9wZW5CTUM6
IFJlZGZpc2g8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlRpbWU6IE9jdCAx
LCAyMDIwIDEwOjAwIEFNIFBhY2lmaWMgVGltZSAoVVMgYW5kIENhbmFkYSk8bzpwPjwvbzpwPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+Sm9pbiBab29tIE1lZXRpbmc8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPmh0dHBzOi8vdXMwMndlYi56b29tLnVzL2ovOTM5Njg4MDQ3Nj9wd2Q9YTJneVlr
VnBSamhCWkV0aFFVUXpjRUYyUWpSWFVUMDk8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+TWVldGlu
ZyBJRDogOTM5IDY4OCAwNDc2PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5Q
YXNzY29kZTogb3BlbmJtYzxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+T25l
IHRhcCBtb2JpbGU8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPisxNjY5OTAw
OTEyOCwsOTM5Njg4MDQ3NiMsLCwsLCwwIywsODU5MjUxNSMgVVMgKFNhbiBKb3NlKTxvOnA+PC9v
OnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+KzEyNTMyMTU4NzgyLCw5Mzk2ODgwNDc2Iyws
LCwsLDAjLCw4NTkyNTE1IyBVUyAoVGFjb21hKTxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5EaWFs
IGJ5IHlvdXIgbG9jYXRpb248bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyArMSA2NjkgOTAwIDkxMjgg
VVMgKFNhbiBKb3NlKTxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7ICsxIDI1MyAyMTUgODc4MiBVUyAo
VGFjb21hKTxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7ICsxIDM0NiAyNDggNzc5OSBVUyAoSG91c3Rv
bik8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyArMSAzMDEgNzE1IDg1OTIgVVMgKEdlcm1hbnRvd24p
PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgKzEgMzEyIDYyNiA2Nzk5IFVTIChDaGljYWdvKTxvOnA+
PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7ICsxIDY0NiA1NTggODY1NiBVUyAoTmV3IFlvcmspPG86cD48L286
cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5NZWV0aW5nIElEOiA5MzkgNjg4IDA0NzY8bzpw
PjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlBhc3Njb2RlOiA4NTkyNTE1PG86cD48
L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5GaW5kIHlvdXIgbG9jYWwgbnVtYmVyOiBo
dHRwczovL3VzMDJ3ZWIuem9vbS51cy91L2tkZGZTcEFrRWo8bzpwPjwvbzpwPjwvcD4NCjwvZGl2
Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_179181C3A4974D368A73F22DA7FF4D8Bfbcom_--

--_005_179181C3A4974D368A73F22DA7FF4D8Bfbcom_
Content-Type: text/calendar; name="meeting-Automation.ics"
Content-Description: meeting-Automation.ics
Content-Disposition: attachment; filename="meeting-Automation.ics"; size=1564;
	creation-date="Wed, 30 Sep 2020 17:00:22 GMT";
	modification-date="Wed, 30 Sep 2020 17:00:22 GMT"
Content-ID: <ABA9F2B0DA59494F80F31D216E7087E2@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vem9vbS51cy8vaUNhbGVuZGFyIEV2ZW50Ly9FTg0K
VkVSU0lPTjoyLjANCkNBTFNDQUxFOkdSRUdPUklBTg0KTUVUSE9EOlBVQkxJU0gNCkNMQVNTOlBV
QkxJQw0KQkVHSU46VlRJTUVaT05FDQpUWklEOkFzaWEvS29sa2F0YQ0KVFpVUkw6aHR0cDovL3R6
dXJsLm9yZy96b25laW5mby1vdXRsb29rL0FzaWEvS29sa2F0YQ0KWC1MSUMtTE9DQVRJT046QXNp
YS9Lb2xrYXRhDQpCRUdJTjpTVEFOREFSRA0KVFpPRkZTRVRGUk9NOiswNTMwDQpUWk9GRlNFVFRP
OiswNTMwDQpUWk5BTUU6SVNUDQpEVFNUQVJUOjE5NzAwMTAxVDAwMDAwMA0KRU5EOlNUQU5EQVJE
DQpFTkQ6VlRJTUVaT05FDQpCRUdJTjpWRVZFTlQNCkRUU1RBTVA6MjAyMDA5MzBUMTY1MzI3Wg0K
RFRTVEFSVDtUWklEPUFzaWEvS29sa2F0YToyMDIwMTAwMVQxMDAwMDANCkRURU5EO1RaSUQ9QXNp
YS9Lb2xrYXRhOjIwMjAxMDAxVDExMDAwMA0KU1VNTUFSWTpUZXN0aW5nIEF1dG9tYXRpb24gaW4g
T3BlbkJNQw0KVUlEOjIwMjAwOTMwVDE2NTMyN1otOTM5Njg4MDQ3NkBmZTgwOjA6MDowOjQ2MDo0
N2ZmOmZlN2U6Y2FhZmVuczMNClRaSUQ6QXNpYS9Lb2xrYXRhDQpERVNDUklQVElPTjpTYWkgRGFz
YXJpIGlzIGludml0aW5nIHlvdSB0byBhIHNjaGVkdWxlZCBab29tIG1lZXRpbmcuXG5cbkpvDQog
aW4gWm9vbSBNZWV0aW5nXG5odHRwczovL3VzMDJ3ZWIuem9vbS51cy9qLzkzOTY4ODA0NzY/cHdk
PWEyZ3lZa1ZwUmpoQlpFDQogdGhRVVF6Y0VGMlFqUlhVVDA5XG5cbk1lZXRpbmcgSUQ6IDkzOSA2
ODggMDQ3NlxuUGFzc2NvZGU6IG9wZW5ibWNcbk9uZSB0DQogYXAgbW9iaWxlXG4rMTY2OTkwMDkx
MjhcLFwsOTM5Njg4MDQ3NiNcLFwsXCxcLFwsXCwwI1wsXCw4NTkyNTE1IyBVUyAoU2FuDQogIEpv
c2UpXG4rMTI1MzIxNTg3ODJcLFwsOTM5Njg4MDQ3NiNcLFwsXCxcLFwsXCwwI1wsXCw4NTkyNTE1
IyBVUyAoVGFjb21hDQogKVxuXG5EaWFsIGJ5IHlvdXIgbG9jYXRpb25cbiAgICAgICAgKzEgNjY5
IDkwMCA5MTI4IFVTIChTYW4gSm9zZSlcbiAgICAgDQogICAgKzEgMjUzIDIxNSA4NzgyIFVTIChU
YWNvbWEpXG4gICAgICAgICsxIDM0NiAyNDggNzc5OSBVUyAoSG91c3RvbilcbiAgDQogICAgICAg
KzEgMzAxIDcxNSA4NTkyIFVTIChHZXJtYW50b3duKVxuICAgICAgICArMSAzMTIgNjI2IDY3OTkg
VVMgKENoaWNhDQogZ28pXG4gICAgICAgICsxIDY0NiA1NTggODY1NiBVUyAoTmV3IFlvcmspXG5N
ZWV0aW5nIElEOiA5MzkgNjg4IDA0NzZcblBhDQogc3Njb2RlOiA4NTkyNTE1XG5GaW5kIHlvdXIg
bG9jYWwgbnVtYmVyOiBodHRwczovL3VzMDJ3ZWIuem9vbS51cy91L2tkZGZTDQogcEFrRWpcblxu
DQpMT0NBVElPTjpodHRwczovL3VzMDJ3ZWIuem9vbS51cy9qLzkzOTY4ODA0NzY/cHdkPWEyZ3lZ
a1ZwUmpoQlpFdGhRVVF6Y0VGDQogMlFqUlhVVDA5DQpCRUdJTjpWQUxBUk0NClRSSUdHRVI6LVBU
MTBNDQpBQ1RJT046RElTUExBWQ0KREVTQ1JJUFRJT046UmVtaW5kZXINCkVORDpWQUxBUk0NCkVO
RDpWRVZFTlQNCkVORDpWQ0FMRU5EQVINCg==

--_005_179181C3A4974D368A73F22DA7FF4D8Bfbcom_
Content-Type: text/calendar; name="meeting-Redfish.ics"
Content-Description: meeting-Redfish.ics
Content-Disposition: attachment; filename="meeting-Redfish.ics"; size=1777;
	creation-date="Wed, 30 Sep 2020 17:00:22 GMT";
	modification-date="Wed, 30 Sep 2020 17:00:22 GMT"
Content-ID: <6C041CB4FDBE254D9F42F05E8F6881C8@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vem9vbS51cy8vaUNhbGVuZGFyIEV2ZW50Ly9FTg0K
VkVSU0lPTjoyLjANCkNBTFNDQUxFOkdSRUdPUklBTg0KTUVUSE9EOlBVQkxJU0gNCkNMQVNTOlBV
QkxJQw0KQkVHSU46VlRJTUVaT05FDQpUWklEOkFtZXJpY2EvTG9zX0FuZ2VsZXMNClRaVVJMOmh0
dHA6Ly90enVybC5vcmcvem9uZWluZm8tb3V0bG9vay9BbWVyaWNhL0xvc19BbmdlbGVzDQpYLUxJ
Qy1MT0NBVElPTjpBbWVyaWNhL0xvc19BbmdlbGVzDQpCRUdJTjpEQVlMSUdIVA0KVFpPRkZTRVRG
Uk9NOi0wODAwDQpUWk9GRlNFVFRPOi0wNzAwDQpUWk5BTUU6UERUDQpEVFNUQVJUOjE5NzAwMzA4
VDAyMDAwMA0KUlJVTEU6RlJFUT1ZRUFSTFk7QllNT05USD0zO0JZREFZPTJTVQ0KRU5EOkRBWUxJ
R0hUDQpCRUdJTjpTVEFOREFSRA0KVFpPRkZTRVRGUk9NOi0wNzAwDQpUWk9GRlNFVFRPOi0wODAw
DQpUWk5BTUU6UFNUDQpEVFNUQVJUOjE5NzAxMTAxVDAyMDAwMA0KUlJVTEU6RlJFUT1ZRUFSTFk7
QllNT05USD0xMTtCWURBWT0xU1UNCkVORDpTVEFOREFSRA0KRU5EOlZUSU1FWk9ORQ0KQkVHSU46
VkVWRU5UDQpEVFNUQU1QOjIwMjAwOTMwVDE2NTU1MFoNCkRUU1RBUlQ7VFpJRD1BbWVyaWNhL0xv
c19BbmdlbGVzOjIwMjAxMDAxVDEwMDAwMA0KRFRFTkQ7VFpJRD1BbWVyaWNhL0xvc19BbmdlbGVz
OjIwMjAxMDAxVDExMDAwMA0KU1VNTUFSWTpPcGVuQk1DOiBSZWRmaXNoDQpVSUQ6MjAyMDA5MzBU
MTY1NTUwWi05Mzk2ODgwNDc2QGZlODA6MDowOjA6NDg5OjFmZmY6ZmVhMjo2YjMxZW5zMw0KVFpJ
RDpBbWVyaWNhL0xvc19BbmdlbGVzDQpERVNDUklQVElPTjpTYWkgRGFzYXJpIGlzIGludml0aW5n
IHlvdSB0byBhIHNjaGVkdWxlZCBab29tIG1lZXRpbmcuXG5cbkpvDQogaW4gWm9vbSBNZWV0aW5n
XG5odHRwczovL3VzMDJ3ZWIuem9vbS51cy9qLzkzOTY4ODA0NzY/cHdkPWEyZ3lZa1ZwUmpoQlpF
DQogdGhRVVF6Y0VGMlFqUlhVVDA5XG5cbk1lZXRpbmcgSUQ6IDkzOSA2ODggMDQ3NlxuUGFzc2Nv
ZGU6IG9wZW5ibWNcbk9uZSB0DQogYXAgbW9iaWxlXG4rMTY2OTkwMDkxMjhcLFwsOTM5Njg4MDQ3
NiNcLFwsXCxcLFwsXCwwI1wsXCw4NTkyNTE1IyBVUyAoU2FuDQogIEpvc2UpXG4rMTI1MzIxNTg3
ODJcLFwsOTM5Njg4MDQ3NiNcLFwsXCxcLFwsXCwwI1wsXCw4NTkyNTE1IyBVUyAoVGFjb21hDQog
KVxuXG5EaWFsIGJ5IHlvdXIgbG9jYXRpb25cbiAgICAgICAgKzEgNjY5IDkwMCA5MTI4IFVTIChT
YW4gSm9zZSlcbiAgICAgDQogICAgKzEgMjUzIDIxNSA4NzgyIFVTIChUYWNvbWEpXG4gICAgICAg
ICsxIDM0NiAyNDggNzc5OSBVUyAoSG91c3RvbilcbiAgDQogICAgICAgKzEgMzAxIDcxNSA4NTky
IFVTIChHZXJtYW50b3duKVxuICAgICAgICArMSAzMTIgNjI2IDY3OTkgVVMgKENoaWNhDQogZ28p
XG4gICAgICAgICsxIDY0NiA1NTggODY1NiBVUyAoTmV3IFlvcmspXG5NZWV0aW5nIElEOiA5Mzkg
Njg4IDA0NzZcblBhDQogc3Njb2RlOiA4NTkyNTE1XG5GaW5kIHlvdXIgbG9jYWwgbnVtYmVyOiBo
dHRwczovL3VzMDJ3ZWIuem9vbS51cy91L2tkZGZTDQogcEFrRWpcblxuDQpMT0NBVElPTjpodHRw
czovL3VzMDJ3ZWIuem9vbS51cy9qLzkzOTY4ODA0NzY/cHdkPWEyZ3lZa1ZwUmpoQlpFdGhRVVF6
Y0VGDQogMlFqUlhVVDA5DQpCRUdJTjpWQUxBUk0NClRSSUdHRVI6LVBUMTBNDQpBQ1RJT046RElT
UExBWQ0KREVTQ1JJUFRJT046UmVtaW5kZXINCkVORDpWQUxBUk0NCkVORDpWRVZFTlQNCkVORDpW
Q0FMRU5EQVINCg==

--_005_179181C3A4974D368A73F22DA7FF4D8Bfbcom_--
