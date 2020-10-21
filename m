Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE80294669
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 04:09:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGDSQ2ySHzDqgV
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 13:08:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=75634afb07=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=rcYvz5Dr; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=TyCRIurL; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGDRX2h5LzDqNn
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2020 13:07:59 +1100 (AEDT)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09L26X4q022811
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2020 19:07:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=l6iw9vS+nbK5k62Z5N5W3zW5fTjZzrgfsV9T0e0Jnhg=;
 b=rcYvz5DrXeyZG2cb9ljx1qUTvvcop64hQ6YB4sBA9SGa0vtKnTnMxJqkNrjz1KCu60/d
 ITzWC4EnbqD4f+f6XtzKCmt4+9xXQr1XxS65Re/UXBMSQcD3EbxnGfRfCrccGuRwsr/s
 t+LCJMGiUYtTLhJ5PEvdbtptRRFFSUpOgic= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 34a01e3uuk-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2020 19:07:56 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 20 Oct 2020 19:07:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kuh5RnSirsy6wovIa+kllflO9kVaLy8P+g1qs9oeqW3Gy5XIYXYFeg4XNvdPCDWV8dqAss/jmw+U/7SRK9TufcxtxO7/TCwPEJEOz9ff8I/Uxopu9kQmeXVAuy1BnfkBtWVKAdplJnD+xDOEu/LrYBuCakPnIk6oT8vVWgfBYk5GxmGIpup8ojrKCs/6IkCXqUVZ6cyFwvlVa3uF5FRTONg0ktprpZ1zdxlOOfQdlWXQUJmwARC0MHcOvwE3nuzfaspAFOEhP/Ah/53mM773kVOEALXPXMilTu8ZRvHX0/ouSR0lwpb2ZSbVpGEh5SBeqQT4czgm8MVCD1RJBx469w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6iw9vS+nbK5k62Z5N5W3zW5fTjZzrgfsV9T0e0Jnhg=;
 b=SDXR20Rixyl9rsdGNXApsl2ERca9KcGNYN2Ypj6WnisQ+HTsow8sCpltMHIjnZBaLKNgU3z6AKNEU8i7qlcGveOhY+VvBpdQpqmbq9vNZC+SuAZBC9s307QKrC+3Iw90meSS7xgrO5ek3Agi0M2R5RoF/qj5FWXaW7Ya7Me6YDoXi8Z35eKd6UvdpCc9KvGhm9+oSWmuQHaGOy/v2t91JnnwV09cWDN/E9AEhr2mvHejtP7KVgRmqr1k9FnzuXkiVc3N5uBRcxvXSlA9Q0Q3IgWt3doHuG6ZxxKpZ2iwSkULWn7/A+1byoCo5oHE+ND82W2ozKCKRaRE4Xn1vH0O/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6iw9vS+nbK5k62Z5N5W3zW5fTjZzrgfsV9T0e0Jnhg=;
 b=TyCRIurLtZqssdBJfD6Tp5psDouxA7DJL8EZGpTQDa6qMFSAXgMjF0Cn+5rvDqL0KZrBcyz2hPnSn4o/f+yMKvT3FofWaugsXnQ/HF0g+edI332WK15ghvjxwEQl9E9JjvZfQWJrAsxan/cqSMDOEcpQm63NcaP+25pDTb+SDSU=
Received: from BYAPR15MB3223.namprd15.prod.outlook.com (2603:10b6:a03:110::28)
 by BYAPR15MB2437.namprd15.prod.outlook.com (2603:10b6:a02:8d::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22; Wed, 21 Oct
 2020 02:07:53 +0000
Received: from BYAPR15MB3223.namprd15.prod.outlook.com
 ([fe80::4c42:553b:2d2c:46a8]) by BYAPR15MB3223.namprd15.prod.outlook.com
 ([fe80::4c42:553b:2d2c:46a8%7]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 02:07:53 +0000
From: Sai Dasari <sdasari@fb.com>
To: Openbmc <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Learning Series
Thread-Topic: OpenBMC Learning Series
Thread-Index: AQHWdlCwHJzSAeOuJEOCEV5BbMCQvKlDLckAgAcppQCACtqLAIAB68aAgAkVIACAAcIFgIAIoUwAgAuQE4CACw4fgIAK7bAAgApn6wCACrH/AA==
Date: Wed, 21 Oct 2020 02:07:53 +0000
Message-ID: <091D0CE7-1D69-448E-8C82-C2EBA1DABF27@fb.com>
References: <C24D4BAF-B185-4640-BFEF-D391E51A0A35@fb.com>
 <452FDC0B-2E4F-4AD9-97E6-DE9B2333D99B@fb.com>
 <8EE0F70D-78CB-4CDB-A51C-53FC33A2AC87@fb.com>
 <EFFBC9D1-BA53-4C61-8BC2-7F52320245F7@fb.com>
 <51C18C28-4894-4BEF-AAA6-BACE5B934B5C@fb.com>
 <AFA8029B-BBBC-41A5-9F66-671D41D0E624@fb.com>
 <D4F1F4FA-E1E2-425C-B685-D0BAE3D5E596@fb.com>
 <A6D2354C-DD02-4BCB-AAE2-2F6B16784DBD@fb.com>
 <A5439E11-28B2-4476-9A9E-D8A8CA525A32@fb.com>
 <179181C3-A497-4D36-8A73-F22DA7FF4D8B@fb.com>
 <9EDCD78E-A095-48AA-93BC-BF73AD8BD533@fb.com>
 <B765ACF5-8DD7-4995-8D62-8634F5A80243@fb.com>
In-Reply-To: <B765ACF5-8DD7-4995-8D62-8634F5A80243@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.41.20091302
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:3111]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61f81fc7-32ac-4e50-6639-08d875661ecf
x-ms-traffictypediagnostic: BYAPR15MB2437:
x-microsoft-antispam-prvs: <BYAPR15MB2437C707A562BB90D2FCCCEACE1C0@BYAPR15MB2437.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y+UuH1UdB523Sz8vyAHNixxQjAPibSNlwLIxMD4lWvIgEXENVxVuygy252iVmV3Xvw0IilpesFtU3r6Wb9e1IO3D3+bx+0SKmKr2yp9a7MXC+fdR+MgoZdNJJobYiKbYpP8P0jkGjGgrAi4cyy8CiD8hDA62AcLy2sbB8r5gJLFnOQljLS+dLi4eChs1kh98OB3wR+Nzw8iizzsFhNK14IwfliZhWbmei5v0oMc24NOz19Tobg9yR1R8YJHA7JBup+MMgftQgFSW8qRqa3YgYsNp5o9Rwy4KzSio7o5h3aaQPcWBY1yxV+y+IgCQAF3FjUfgMIY4O9OFLrHzTRnWb/MqKZ13JoQLcuXbsth2SqS6Qnv/+O9bNmk8m6tI4XPGMH/FoStfn7a4nRJxPn0G4Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3223.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(346002)(136003)(39860400002)(366004)(6486002)(3480700007)(186003)(478600001)(316002)(2906002)(6506007)(99936003)(6512007)(66556008)(64756008)(66446008)(6916009)(66946007)(76116006)(91956017)(33656002)(66476007)(66616009)(71200400001)(4744005)(5660300002)(966005)(86362001)(36756003)(2616005)(83380400001)(7116003)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: r+zJyTtqcfpydQ8mQHmkgz1xeeuOvt0aad9K0ZWZIjSnsItC8BDvaG4K4/jByq7bsOqpmV6hLPo+w+ic8cgHYor1ZCD90JYbwsW9Q3Kg8ZsEjPkg/eT7BDDzRAD9Rv6IZqBR63el8pxHJwPLSe9p87hyfog0krQhpmXu4YQSEejUYqrFadYCATGgSHRDsaKO7b+t1avoQkq71MWaX4il0FASbZ9n4RlIumZ23BNzG47BJieUqzl5DaT/tiYT1it04+qA89bcwbbjRkgsSA6fJ6jYlqz3Q1htFHFLfuyWYgAhIPT7aSV8XCE9N1MSvxKokCgq7oEGyV/gJ1Hizw5f99FGn2MuPPsKmZ6k4aPz2jQokZGzctFUFXq1kYA94g62BE0SIb3tYWpmf1RLLC+C0/WmFbqy2Itong/QnG5WFbSuGlc2F+9VkE5EiWO9KfYq0ZtRJzwPp+3ylgX9c9B+EuvZo4QywSj1/ninwkC7Ded7kxlRu3psB5vKTKeKJfn48npa2tp2G/uhEWkCZhS1gViQB0RsYUGC6O/5Z74cySAzKkGRmDDgB/FrdoYHybeQm2GvQmtswgXpCn9bFoZAQlIU0QwP5fLg3DJbrGVQhMRY0fuLGy3YpdxUF/Usup7/9i1xeo/1UqZXUj7H2FhG+GwdydZeYSW3fVH5Hi1B6fmHaN/23bSJZY1bDmAm61Ji
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
 boundary="_004_091D0CE71D69448E8C82C2EBA1DABF27fbcom_"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3223.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f81fc7-32ac-4e50-6639-08d875661ecf
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2020 02:07:53.4029 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZGpT6Ik2Us7tIqp9qWGtfA+YTpOFtGgPY9wC8HIbTyVoi4RhI8Rbl9i9lYrsXh/7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2437
X-OriginatorOrg: fb.com
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_02:2020-10-20,
 2020-10-21 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 malwarescore=0 mlxscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1011 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010210017
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

--_004_091D0CE71D69448E8C82C2EBA1DABF27fbcom_
Content-Type: multipart/alternative;
	boundary="_000_091D0CE71D69448E8C82C2EBA1DABF27fbcom_"

--_000_091D0CE71D69448E8C82C2EBA1DABF27fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UXVpY2sgcmVtaW5kZXIgYWJvdXQgdGhpcyB3ZWVr4oCZcyBsZWFybmluZyBzZXNzaW9uIOKAnElQ
TUkgU3Vic3lzdGVt4oCdIGZyb20gU2FyYXZhbmFuIFBhbGFuaXNhbXkgb24gVGh1cnNkYXlAMTBB
TSAoSVNUKS4gRm9sbG93aW5nIGFyZSB0aGUgc2Vzc2lvbiBkZXRhaWxzIGFuZCBhbHNvIGF0dGFj
aGVkIG1lZXRpbmcgaW52aXRlLg0KDQpUb3BpYzogT3BlbkJNQzogSVBNSSBTdWJzeXN0ZW0NClRp
bWU6IE9jdCAyMiwgMjAyMCAxMDowMCBBTSBJbmRpYQ0KDQpKb2luIFpvb20gTWVldGluZw0KaHR0
cHM6Ly91czAyd2ViLnpvb20udXMvai85Mzk2ODgwNDc2P3B3ZD1hMmd5WWtWcFJqaEJaRXRoUVVR
emNFRjJRalJYVVQwOQ0KDQpNZWV0aW5nIElEOiA5MzkgNjg4IDA0NzYNClBhc3Njb2RlOiBvcGVu
Ym1jDQpPbmUgdGFwIG1vYmlsZQ0KKzE2Njk5MDA5MTI4LCw5Mzk2ODgwNDc2IywsLCwsLDAjLCw4
NTkyNTE1IyBVUyAoU2FuIEpvc2UpDQorMTI1MzIxNTg3ODIsLDkzOTY4ODA0NzYjLCwsLCwsMCMs
LDg1OTI1MTUjIFVTIChUYWNvbWEpDQoNCkRpYWwgYnkgeW91ciBsb2NhdGlvbg0KICAgICAgICAr
MSA2NjkgOTAwIDkxMjggVVMgKFNhbiBKb3NlKQ0KICAgICAgICArMSAyNTMgMjE1IDg3ODIgVVMg
KFRhY29tYSkNCiAgICAgICAgKzEgMzQ2IDI0OCA3Nzk5IFVTIChIb3VzdG9uKQ0KICAgICAgICAr
MSAzMDEgNzE1IDg1OTIgVVMgKEdlcm1hbnRvd24pDQogICAgICAgICsxIDMxMiA2MjYgNjc5OSBV
UyAoQ2hpY2FnbykNCiAgICAgICAgKzEgNjQ2IDU1OCA4NjU2IFVTIChOZXcgWW9yaykNCk1lZXRp
bmcgSUQ6IDkzOSA2ODggMDQ3Ng0KUGFzc2NvZGU6IDg1OTI1MTUNCkZpbmQgeW91ciBsb2NhbCBu
dW1iZXI6IGh0dHBzOi8vdXMwMndlYi56b29tLnVzL3Uva2RkZlNwQWtFag0K

--_000_091D0CE71D69448E8C82C2EBA1DABF27fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <79B7F7EFE569874DB44C627FCEFFC689@namprd15.prod.outlook.com>
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
ZToxMS4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0Kc3Bhbi5FbWFp
bFN0eWxlMTkNCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwtcmVwbHk7DQoJZm9udC1mYW1pbHk6
IkNhbGlicmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6d2luZG93dGV4dDt9DQouTXNvQ2hwRGVmYXVs
dA0KCXttc28tc3R5bGUtdHlwZTpleHBvcnQtb25seTsNCglmb250LXNpemU6MTAuMHB0O30NCkBw
YWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46MS4waW4gMS4w
aW4gMS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9
DQotLT48L3N0eWxlPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0iRU4tVVMiIGxpbms9IiMwNTYzQzEi
IHZsaW5rPSIjOTU0RjcyIiBzdHlsZT0id29yZC13cmFwOmJyZWFrLXdvcmQiPg0KPGRpdiBjbGFz
cz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlF1aWNrIHJlbWluZGVyIGFi
b3V0IHRoaXMgd2Vla+KAmXMgbGVhcm5pbmcgc2Vzc2lvbiDigJxJUE1JIFN1YnN5c3RlbeKAnSBm
cm9tIFNhcmF2YW5hbiBQYWxhbmlzYW15IG9uIFRodXJzZGF5QDEwQU0gKDxiPklTVDwvYj4pLiBG
b2xsb3dpbmcgYXJlIHRoZSBzZXNzaW9uIGRldGFpbHMgYW5kIGFsc28gYXR0YWNoZWQgbWVldGlu
ZyBpbnZpdGUuPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDs8bzpw
PjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxiPlRvcGljOiBPcGVuQk1DOiBJUE1J
IFN1YnN5c3RlbTxvOnA+PC9vOnA+PC9iPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxiPlRp
bWU6IE9jdCAyMiwgMjAyMCAxMDowMCBBTSBJbmRpYTxvOnA+PC9vOnA+PC9iPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+Sm9pbiBab29tIE1lZXRpbmc8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
Pmh0dHBzOi8vdXMwMndlYi56b29tLnVzL2ovOTM5Njg4MDQ3Nj9wd2Q9YTJneVlrVnBSamhCWkV0
aFFVUXpjRUYyUWpSWFVUMDk8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxv
OnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+TWVldGluZyBJRDogOTM5
IDY4OCAwNDc2PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5QYXNzY29kZTog
b3BlbmJtYzxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+T25lIHRhcCBtb2Jp
bGU8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPisxNjY5OTAwOTEyOCwsOTM5
Njg4MDQ3NiMsLCwsLCwwIywsODU5MjUxNSMgVVMgKFNhbiBKb3NlKTxvOnA+PC9vOnA+PC9wPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+KzEyNTMyMTU4NzgyLCw5Mzk2ODgwNDc2IywsLCwsLDAjLCw4
NTkyNTE1IyBVUyAoVGFjb21hKTxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PG86cD4mbmJzcDs8L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5EaWFsIGJ5IHlvdXIg
bG9jYXRpb248bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyArMSA2NjkgOTAwIDkxMjggVVMgKFNhbiBK
b3NlKTxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7ICsxIDI1MyAyMTUgODc4MiBVUyAoVGFjb21hKTxv
OnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7ICsxIDM0NiAyNDggNzc5OSBVUyAoSG91c3Rvbik8bzpwPjwv
bzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyArMSAzMDEgNzE1IDg1OTIgVVMgKEdlcm1hbnRvd24pPG86cD48L286
cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsgKzEgMzEyIDYyNiA2Nzk5IFVTIChDaGljYWdvKTxvOnA+PC9vOnA+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7ICsxIDY0NiA1NTggODY1NiBVUyAoTmV3IFlvcmspPG86cD48L286cD48L3A+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj5NZWV0aW5nIElEOiA5MzkgNjg4IDA0NzY8bzpwPjwvbzpwPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlBhc3Njb2RlOiA4NTkyNTE1PG86cD48L286cD48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5GaW5kIHlvdXIgbG9jYWwgbnVtYmVyOiBodHRwczovL3Vz
MDJ3ZWIuem9vbS51cy91L2tkZGZTcEFrRWo8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPC9ib2R5
Pg0KPC9odG1sPg0K

--_000_091D0CE71D69448E8C82C2EBA1DABF27fbcom_--

--_004_091D0CE71D69448E8C82C2EBA1DABF27fbcom_
Content-Type: text/calendar; name="meeting-IPMI.ics"
Content-Description: meeting-IPMI.ics
Content-Disposition: attachment; filename="meeting-IPMI.ics"; size=1558;
	creation-date="Wed, 21 Oct 2020 02:07:52 GMT";
	modification-date="Wed, 21 Oct 2020 02:07:52 GMT"
Content-ID: <C7966C80890AEF4BB5347B7F12F5CDA9@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vem9vbS51cy8vaUNhbGVuZGFyIEV2ZW50Ly9FTg0K
VkVSU0lPTjoyLjANCkNBTFNDQUxFOkdSRUdPUklBTg0KTUVUSE9EOlBVQkxJU0gNCkNMQVNTOlBV
QkxJQw0KQkVHSU46VlRJTUVaT05FDQpUWklEOkFzaWEvS29sa2F0YQ0KVFpVUkw6aHR0cDovL3R6
dXJsLm9yZy96b25laW5mby1vdXRsb29rL0FzaWEvS29sa2F0YQ0KWC1MSUMtTE9DQVRJT046QXNp
YS9Lb2xrYXRhDQpCRUdJTjpTVEFOREFSRA0KVFpPRkZTRVRGUk9NOiswNTMwDQpUWk9GRlNFVFRP
OiswNTMwDQpUWk5BTUU6SVNUDQpEVFNUQVJUOjE5NzAwMTAxVDAwMDAwMA0KRU5EOlNUQU5EQVJE
DQpFTkQ6VlRJTUVaT05FDQpCRUdJTjpWRVZFTlQNCkRUU1RBTVA6MjAyMDEwMjFUMDIwNDQ3Wg0K
RFRTVEFSVDtUWklEPUFzaWEvS29sa2F0YToyMDIwMTAyMlQxMDAwMDANCkRURU5EO1RaSUQ9QXNp
YS9Lb2xrYXRhOjIwMjAxMDIyVDExMDAwMA0KU1VNTUFSWTpPcGVuQk1DOiBJUE1JIFN1YnN5c3Rl
bQ0KVUlEOjIwMjAxMDIxVDAyMDQ0N1otOTM5Njg4MDQ3NkBmZTgwOjA6MDowOjRmZDoxM2ZmOmZl
YzE6NWFhMWVuczMNClRaSUQ6QXNpYS9Lb2xrYXRhDQpERVNDUklQVElPTjpTYWkgRGFzYXJpIGlz
IGludml0aW5nIHlvdSB0byBhIHNjaGVkdWxlZCBab29tIG1lZXRpbmcuXG5cbkpvDQogaW4gWm9v
bSBNZWV0aW5nXG5odHRwczovL3VzMDJ3ZWIuem9vbS51cy9qLzkzOTY4ODA0NzY/cHdkPWEyZ3lZ
a1ZwUmpoQlpFDQogdGhRVVF6Y0VGMlFqUlhVVDA5XG5cbk1lZXRpbmcgSUQ6IDkzOSA2ODggMDQ3
NlxuUGFzc2NvZGU6IG9wZW5ibWNcbk9uZSB0DQogYXAgbW9iaWxlXG4rMTY2OTkwMDkxMjhcLFws
OTM5Njg4MDQ3NiNcLFwsXCxcLFwsXCwwI1wsXCw4NTkyNTE1IyBVUyAoU2FuDQogIEpvc2UpXG4r
MTI1MzIxNTg3ODJcLFwsOTM5Njg4MDQ3NiNcLFwsXCxcLFwsXCwwI1wsXCw4NTkyNTE1IyBVUyAo
VGFjb21hDQogKVxuXG5EaWFsIGJ5IHlvdXIgbG9jYXRpb25cbiAgICAgICAgKzEgNjY5IDkwMCA5
MTI4IFVTIChTYW4gSm9zZSlcbiAgICAgDQogICAgKzEgMjUzIDIxNSA4NzgyIFVTIChUYWNvbWEp
XG4gICAgICAgICsxIDM0NiAyNDggNzc5OSBVUyAoSG91c3RvbilcbiAgDQogICAgICAgKzEgMzAx
IDcxNSA4NTkyIFVTIChHZXJtYW50b3duKVxuICAgICAgICArMSAzMTIgNjI2IDY3OTkgVVMgKENo
aWNhDQogZ28pXG4gICAgICAgICsxIDY0NiA1NTggODY1NiBVUyAoTmV3IFlvcmspXG5NZWV0aW5n
IElEOiA5MzkgNjg4IDA0NzZcblBhDQogc3Njb2RlOiA4NTkyNTE1XG5GaW5kIHlvdXIgbG9jYWwg
bnVtYmVyOiBodHRwczovL3VzMDJ3ZWIuem9vbS51cy91L2tkZGZTDQogcEFrRWpcblxuDQpMT0NB
VElPTjpodHRwczovL3VzMDJ3ZWIuem9vbS51cy9qLzkzOTY4ODA0NzY/cHdkPWEyZ3lZa1ZwUmpo
QlpFdGhRVVF6Y0VGDQogMlFqUlhVVDA5DQpCRUdJTjpWQUxBUk0NClRSSUdHRVI6LVBUMTBNDQpB
Q1RJT046RElTUExBWQ0KREVTQ1JJUFRJT046UmVtaW5kZXINCkVORDpWQUxBUk0NCkVORDpWRVZF
TlQNCkVORDpWQ0FMRU5EQVINCg==

--_004_091D0CE71D69448E8C82C2EBA1DABF27fbcom_--
