Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B102F2946D0
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 05:04:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGFhC5ZsWzDqgM
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 14:04:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=7563812393=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=CvqKx6mS; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=V2k7IwYL; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGFgQ1GvRzDqKD
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2020 14:03:27 +1100 (AEDT)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09L33LXO006863; Tue, 20 Oct 2020 20:03:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=ysbrR2T8191bMWhMZfn/w4HacpjcMmYJ5MYWlHq5dWc=;
 b=CvqKx6mSdPGfKDEh53vtSfXy24xjO0kgkzBVye9She9KbH2Q4QED1lK6stBhMeW4d81M
 Cc6yNJbgbcrXKNEE1IbaecfC8L9p/vqLxm+/hLLmqGnKtx8o/GKE6XFRh3NRWsOBEyG6
 sbfkGwgEG3u7ClB+BL5jXvQG737SZhU+/CU= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 34a1n8kfsk-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 20 Oct 2020 20:03:25 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 20 Oct 2020 20:03:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJRQ290nrsSTfYMcKmmyFJDpnvlJn4BxZFlLOOEdA6Jeqz7t6cmKp9DZFpb3X0H0sOBGaSnRWJKvlbh1qQ7iBYqrwraUJelAX5tGBzyQADgN0VeTNKoxMmnsDgYgsnlR4I7DLk2kwvaeI1moMlj5JjQEvMEhasLw17ugo3c0Mr4v5YqzkittGVbRJCTL8A3DsA5fFNIgPwqQI13sBZ+EReWXAE/xh7yBVO/dLwI4OpQ8nFf1EEthJAAwxrp3CFIRKu8S9Bh0J8yJUKmkhgR0iPwTgi9xPAkrJoIAP9ta7TgU5zXh7gHpmEEZGAvxoJqHmxM8U54wvKf9IqMjAu4Z5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ysbrR2T8191bMWhMZfn/w4HacpjcMmYJ5MYWlHq5dWc=;
 b=XM/r5o4gN4aP/XTbgjVWJS4V0rOTsvn2A0UjiM4dIjwzBvu9O8CKE00DuOHQI39EXQoAgz/b5lntHEknhDQkH1jYkHs7spOK8gORcqcRCfZWdk9pukW5Har7S0wTb7TEkaksP8Ym87sTVFW9/Fa7QbAe7UGbAvpNJMxdLhHAIS9xEISOeUsC9389O/00mFzDkhTHvCxqmM2Z1y1tIWkUHucV0/IATyG7atB4VTSqTs4WQTEQIP/7AHP28zDjpQjN72XnRmBigPGH+02GjxRFP4BkN9yUXaIVZOQXiYhoDagY7eCnwJ0lV9oC/R7jplAEEpav19YTHFENwISExYhNOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ysbrR2T8191bMWhMZfn/w4HacpjcMmYJ5MYWlHq5dWc=;
 b=V2k7IwYLzn2S442h8qvIGhK35e7EMNss/bAdjU+EwwlNkxqaXcvbbrAta2Rx8nuax0obTEFm+7lt3uqXlcM0lbtfE8ney9yhv32L0B+DInEGyrlR+VSrcO7yBW/GhFeG/UM7gbiljuoNDJYDbHvAN1v4DYX98wBXh9YDzkeq8pM=
Received: from BY5PR15MB3537.namprd15.prod.outlook.com (2603:10b6:a03:1f5::20)
 by BYAPR15MB2485.namprd15.prod.outlook.com (2603:10b6:a02:85::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.23; Wed, 21 Oct
 2020 03:03:13 +0000
Received: from BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::5cb9:7809:838b:488a]) by BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::5cb9:7809:838b:488a%5]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 03:03:13 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Neil Bradley <Neil_Bradley@phoenix.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: Re: Tioga Pass OEM 0x30/0x38 commands
Thread-Topic: Tioga Pass OEM 0x30/0x38 commands
Thread-Index: AdanIx1RPqBBK5fVQxeI3zX+aS9ndP//8dkA
Date: Wed, 21 Oct 2020 03:03:13 +0000
Message-ID: <4A672CE3-550F-49E6-BBAB-F0EC97DBD2F6@fb.com>
References: <1b7930bda58f48a3ad7a5a7c18a707e0@SCL-EXCHMB-13.phoenix.com>
In-Reply-To: <1b7930bda58f48a3ad7a5a7c18a707e0@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: phoenix.com; dkim=none (message not signed)
 header.d=none;phoenix.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:745f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e8bce6a-98ab-4bce-c550-08d8756dd998
x-ms-traffictypediagnostic: BYAPR15MB2485:
x-microsoft-antispam-prvs: <BYAPR15MB2485840DC788E0A02E30EAAADD1C0@BYAPR15MB2485.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: azXgseAscL+nyFiCDx6ZjRSBhnQ5viIwtp4p03ZAus/iEmfPnZ3TPg3nJx2h/tYbH/sAA6UmsBausLvQTYRwU8Ky1QrZ1r+jn+sMMBOEcKADtrLIeNRD38Wl0xVcq1FCd/tsCMStbg3+fvh3sPIyIRjkjvrTQoTKZpT7cE9UQpx3zJbZagjrAtqhiSK51lBW14g7IVkdFeapCQoZCZWSNTi5gDtFSe7whxx4C61eRf8SOn1YwDIsOceyv5739yOYluVJe12MtWTmi1sj+zliFQEta7VAB0Lykmb0yZnLTiiSSN/mQQuUcOJQj9D9rUdbetq6PJ9lRtSQJ946N0Fq6g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3537.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(39860400002)(136003)(376002)(366004)(6486002)(2616005)(2906002)(5660300002)(71200400001)(8936002)(110136005)(4744005)(316002)(33656002)(186003)(8676002)(91956017)(478600001)(86362001)(6512007)(36756003)(76116006)(66476007)(6506007)(66946007)(53546011)(64756008)(66446008)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: ZrnFi5EQYXJhHyj26vMUZE1rcO0Ujf8j93HdLnvJyAie9OsaxdbnvpPSKwrRYTW83Q+1sC3XhSx7YcktWf2Vmk7ELAgimB+5BjyKUljP5lPysK6v/DJcoqFucNVl/AFaE+oGCT5WFETGQ/pqnN+qzlOxjuF/GhH1lMWzbnwnJoKSoiGDKYPwEBDhWnhQGFPQ98f//jhQCOOB4sVnsSGRKc+1gPtj99iRgYW2xhh7lga2sE3nThZyDu1RvZ+bTPN/UILpTVoPelimtOhp0NpUG8PUXUhTedsVYi7Y0XmFCcZF89Rv+wpB2PTqhfd7TqyiqVgpPh48yEfVVlDloLWVh0VqK4W7X0FCW6EEX7+hcMFwjtEB8jkEYWo2Zo3sxaw9lqaQ9mvsdELK+z2AlfSuZpt6YWUb9ZX5p9OjHq8EVLvQWdh2fLgGhhRGrdqFc76Au2xiMqWlZ/1n2EuVLFcCN4VV8z5Bpla7S88bOj8qjfBishDuC80tAUPFr4afTqwuOAdejFwzyPyg3T9AEtOmLJaudgPxJGYSdXwdlN6qxirW9MMHvlFCdVjHXsEq63eT8Pt+HoXlfFBhKBS9EdimBaPU+mHT2AKyZd3oaTKRionoct76ZS1GqoryLT5xGEUdwAvDfVdXVCBIj4iqaKKY8vQL0v/lzNg3vAQltvDi2i2BZsSTIDrhv8qRvjVRlZUE
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_4A672CE3550F49E6BBABF0EC97DBD2F6fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3537.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e8bce6a-98ab-4bce-c550-08d8756dd998
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2020 03:03:13.4358 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YGdoutJz39xcjNPbqAMsPW5XU8x8D9g/YHYXJabNSR1sCOGhvesMRXf6oz2CmIFaN3kB8kDcO5xsPH6fCZCzDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2485
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_02:2020-10-20,
 2020-10-21 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxlogscore=999
 spamscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 phishscore=0 adultscore=0 clxscore=1011 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010210026
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

--_000_4A672CE3550F49E6BBABF0EC97DBD2F6fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T0VNIGNvbW1hbmRzIGFyZSBpbXBsZW1lbnRlZCBpbiByZXBvIGZiLWlwbWktb2VtLCBjYW4geW91
IHBsZWFzZSBwb2ludCBtZSB0byBjb21tYW5kIHdoaWNoIGFyZSBub3QgaW1wbGVtZW50ZWQuDQoN
ClJlZ2FyZHMNCi1WaWpheQ0KDQpGcm9tOiBvcGVuYm1jIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlr
aGVta2E9ZmIuY29tQGxpc3RzLm96bGFicy5vcmc+IG9uIGJlaGFsZiBvZiBOZWlsIEJyYWRsZXkg
PE5laWxfQnJhZGxleUBwaG9lbml4LmNvbT4NCkRhdGU6IFR1ZXNkYXksIE9jdG9iZXIgMjAsIDIw
MjAgYXQgMTo1NyBQTQ0KVG86IE9wZW5CTUMgTWFpbGxpc3QgPG9wZW5ibWNAbGlzdHMub3psYWJz
Lm9yZz4NClN1YmplY3Q6IFRpb2dhIFBhc3MgT0VNIDB4MzAvMHgzOCBjb21tYW5kcw0KDQpHcmVl
dGluZ3MgZmVsbG93IE9wZW5CTUNlcnMg4oCTDQoNCkkgd2FzIGxvb2tpbmcgdGhyb3VnaCB0aGUg
VGlvZ2EgUGFzcyAoVFApIHByb2R1Y3Qgc3BlY2lmaWNhdGlvbiBhbmQgc2VlIHRoZXJl4oCZcyBh
IHRhYmxlIG9mIE9FTSBjb21tYW5kcyAoMHgzMC8weDM4KSB0aGF0LCBhZnRlciB0ZXN0aW5nIHdp
dGggdGhlIFRQIEJNQyBvbiB0aGUgbGF0ZXN0IE9wZW5CTUMgdHJlZSwgaGF2ZSBmb3VuZCB0aGV5
IGFyZSBub3QgdGhlcmUuIERvZXMgYW55b25lIGtub3cgd2hlcmUgKG9yIGlmKSB0aGVzZSBjb21t
YW5kcyBhcmUgaW1wbGVtZW50ZWQsIGFuZCB3aGVyZSB0aGV54oCZcmUgbG9jYXRlZD8NCg0KQWRk
aXRpb25hbGx5LCBpdCBzZWVtcyBsaWtlIHNvbWUgb2YgdGhlIGNvbW1hbmRzIGFyZSBzZW1pLWR1
cGxpY2F0ZWQgZnVuY3Rpb25hbGl0eS13aXNlIHdpdGggcHVzaGluZyB0aGUgZW50aXJlIFNNQklP
UyB0YWJsZSBkb3duIHRvIHRoZSBCTUMsIHdoaWNoIHdlIGFyZSBkb2luZyBmb3Igb25lIG9mIG91
ciBjdXN0b21lcnMuDQoNClRoYW5rcyENCg0KLS0+TmVpbA0K

--_000_4A672CE3550F49E6BBABF0EC97DBD2F6fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <D0B9E8EBF32DDB4BA5929043DD55DA5F@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseTpXaW5nZGluZ3M7DQoJcGFub3NlLTE6NSAwIDAgMCAwIDAgMCAwIDAg
MDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OiJDYW1icmlhIE1hdGgiOw0KCXBhbm9zZS0x
OjIgNCA1IDMgNSA0IDYgMyAyIDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseTpDYWxpYnJp
Ow0KCXBhbm9zZS0xOjIgMTUgNSAyIDIgMiA0IDMgMiA0O30NCi8qIFN0eWxlIERlZmluaXRpb25z
ICovDQpwLk1zb05vcm1hbCwgbGkuTXNvTm9ybWFsLCBkaXYuTXNvTm9ybWFsDQoJe21hcmdpbjow
aW47DQoJZm9udC1zaXplOjExLjBwdDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJp
Zjt9DQpzcGFuLkVtYWlsU3R5bGUxOQ0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1yZXBseTsN
Cglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsNCgljb2xvcjp3aW5kb3d0ZXh0O30N
Ci5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtc2l6
ZToxMC4wcHQ7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4gMTEuMGluOw0KCW1h
cmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6
V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIg
bGluaz0iIzA1NjNDMSIgdmxpbms9IiM5NTRGNzIiIHN0eWxlPSJ3b3JkLXdyYXA6YnJlYWstd29y
ZCI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+T0VN
IGNvbW1hbmRzIGFyZSBpbXBsZW1lbnRlZCBpbiByZXBvIGZiLWlwbWktb2VtLCBjYW4geW91IHBs
ZWFzZSBwb2ludCBtZSB0byBjb21tYW5kIHdoaWNoIGFyZSBub3QgaW1wbGVtZW50ZWQuPG86cD48
L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPlJlZ2FyZHM8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPi1WaWpheTxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4m
bmJzcDs8L286cD48L3A+DQo8ZGl2IHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItdG9wOnNvbGlk
ICNCNUM0REYgMS4wcHQ7cGFkZGluZzozLjBwdCAwaW4gMGluIDBpbiI+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj48Yj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+RnJv
bTogPC9zcGFuPjwvYj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+
b3BlbmJtYyAmbHQ7b3BlbmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxh
YnMub3JnJmd0OyBvbiBiZWhhbGYgb2YgTmVpbCBCcmFkbGV5ICZsdDtOZWlsX0JyYWRsZXlAcGhv
ZW5peC5jb20mZ3Q7PGJyPg0KPGI+RGF0ZTogPC9iPlR1ZXNkYXksIE9jdG9iZXIgMjAsIDIwMjAg
YXQgMTo1NyBQTTxicj4NCjxiPlRvOiA8L2I+T3BlbkJNQyBNYWlsbGlzdCAmbHQ7b3BlbmJtY0Bs
aXN0cy5vemxhYnMub3JnJmd0Ozxicj4NCjxiPlN1YmplY3Q6IDwvYj5UaW9nYSBQYXNzIE9FTSAw
eDMwLzB4MzggY29tbWFuZHM8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjwvZGl2Pg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+R3JlZXRpbmdzIGZlbGxvdyBPcGVuQk1DZXJzIOKAkzxvOnA+PC9vOnA+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7PG86cD48L286cD48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj5JIHdhcyBsb29raW5nIHRocm91Z2ggdGhlIFRpb2dhIFBhc3MgKFRQKSBw
cm9kdWN0IHNwZWNpZmljYXRpb24gYW5kIHNlZSB0aGVyZeKAmXMgYSB0YWJsZSBvZiBPRU0gY29t
bWFuZHMgKDB4MzAvMHgzOCkgdGhhdCwgYWZ0ZXIgdGVzdGluZyB3aXRoIHRoZSBUUCBCTUMgb24g
dGhlIGxhdGVzdCBPcGVuQk1DIHRyZWUsIGhhdmUgZm91bmQgdGhleSBhcmUgbm90IHRoZXJlLiBE
b2VzIGFueW9uZSBrbm93IHdoZXJlIChvcg0KIGlmKSB0aGVzZSBjb21tYW5kcyBhcmUgaW1wbGVt
ZW50ZWQsIGFuZCB3aGVyZSB0aGV54oCZcmUgbG9jYXRlZD88bzpwPjwvbzpwPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPiZuYnNwOzxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+QWRkaXRpb25hbGx5LCBpdCBzZWVtcyBsaWtlIHNvbWUgb2YgdGhlIGNvbW1hbmRzIGFyZSBz
ZW1pLWR1cGxpY2F0ZWQgZnVuY3Rpb25hbGl0eS13aXNlIHdpdGggcHVzaGluZyB0aGUgZW50aXJl
IFNNQklPUyB0YWJsZSBkb3duIHRvIHRoZSBCTUMsIHdoaWNoIHdlIGFyZSBkb2luZyBmb3Igb25l
IG9mIG91ciBjdXN0b21lcnMuPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4m
bmJzcDs8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlRoYW5rcyE8bzpwPjwv
bzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZuYnNwOzxvOnA+PC9vOnA+PC9wPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OldpbmdkaW5ncyI+w6A8
L3NwYW4+TmVpbDxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_4A672CE3550F49E6BBABF0EC97DBD2F6fbcom_--
