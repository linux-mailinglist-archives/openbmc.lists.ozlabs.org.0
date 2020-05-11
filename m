Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E5F1CE16F
	for <lists+openbmc@lfdr.de>; Mon, 11 May 2020 19:18:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LSLb0qcjzDr3r
	for <lists+openbmc@lfdr.de>; Tue, 12 May 2020 03:17:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=2400c88cc1=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=Nh/NXCKM; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=emqyuQCp; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LSKB1nzGzDqcl
 for <openbmc@lists.ozlabs.org>; Tue, 12 May 2020 03:16:37 +1000 (AEST)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04BH1JRm014909; Mon, 11 May 2020 10:16:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=Fgoz790+ctw2i9RrybbIoJkdFhWhICGkQ7GF12lTT2E=;
 b=Nh/NXCKMMOS7/w5VVQiwRzMD0Dz2bBH/XeY3A7vU/TYz/PDNhJ8rf+0qkeA5h2b9ZQar
 cNwC4e7acY/Y0jcYKLvq6tHdjY1mUve3pQjoByiJihQKRyTc2Z2fegymMHlo1mLk+i9w
 t99WIEH8776382mGsRc5wg6e8M3PAWvZy08= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 30xc7dy790-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 11 May 2020 10:16:32 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.172) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Mon, 11 May 2020 10:16:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCooNNYyxKLH3Npj1Vi9zXdjaK7AgO33h+jXI/t8diEri+jZvK+NknoZMAMv8vCBvJNa61ZL7LY0cvr3R3TxEJhm3311Ey7q3yNB4as9SHU/IZ0AqHRd8sgq1AgQxGVDjKQpLUbMJlqFCBkfDH8qyH4lU75S5e0wWT9h6E4SaTjjxesmy32D1FDYbP8qhuhLO+zKcfKdIg48qS14WHM7rXTWSAP2tjFYdNPPG+VenolBw6g/RNAAw+n2PdgpEsXoSd7OJdPtQRSNLKof9WCsAJ2goMc0y4kg7v9GQN+rbZU+s70UARG38yxbLkk1bWBfkEKiIvf9n6pQx85sOQKzVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fgoz790+ctw2i9RrybbIoJkdFhWhICGkQ7GF12lTT2E=;
 b=ffNhJDa7VIijAfkzS0nA+p7pPw+tPx4KD9okskyCapRDyZ9nzsOSSE0UWDlF4MCKKKEPhjjAWLHGScbD7qlgVrZcty1FdrRYszBPBJdxH6o6/M72pM2ZHvKp0vYpDfQxZ5/ATdKn+qKbrZT48WLSv5ktDDIFgWJiM563pX9fj6zAZuYxraYXWxhRbFrv2HuGvx02394+ZRdBXopp/YXgR+9dZuq5egMAwLunqgCLVi2v6MkTrLSl3kAZFIwOhB4RrIXl6PX0JNzEPJUYBUAtsck/91cukdkK5fytfj/9QxaCltVcH4xnJVTVCIkGGUzHBNPgPQ/SXK1uI8ZFtV/A/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fgoz790+ctw2i9RrybbIoJkdFhWhICGkQ7GF12lTT2E=;
 b=emqyuQCpB7mrfEgiXtWqV2D+EVM4aNl40hm++d+jKzfpyw8tcOG0LZ21oZoUluQeLuyhpQwyz8k82ddZd8gyUTxPWFwZJYyCZvPOesZqSi1dVPZcYoNGKP14jfazd9o803FxiaYZiHsFLx4Jp0AX6cSu+mg3SWFOb2VdHjNy4dk=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2453.namprd15.prod.outlook.com (2603:10b6:a02:8d::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.33; Mon, 11 May
 2020 17:16:30 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::e43b:5f8d:799:39a4%3]) with mapi id 15.20.2979.033; Mon, 11 May 2020
 17:16:29 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: phosphor-health-monitor repo
Thread-Topic: phosphor-health-monitor repo
Thread-Index: AQHWJA4sk8meb7nphECQ9HJxRwpJWKii4egA///QdIA=
Date: Mon, 11 May 2020 17:16:29 +0000
Message-ID: <1386E24A-9EEE-4EB9-906C-4E42B8748E14@fb.com>
References: <13E6D0A2-69B1-4F89-92FA-F0A234682B28@fb.com>
 <20200511130640.GE10214@heinlein>
In-Reply-To: <20200511130640.GE10214@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2601:647:4b00:fd70:18e2:66b5:5e3d:3d1a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7bcb7161-b860-413b-7ddd-08d7f5cf0bb9
x-ms-traffictypediagnostic: BYAPR15MB2453:
x-microsoft-antispam-prvs: <BYAPR15MB24539FD41BE9533B5838B5BBDDA10@BYAPR15MB2453.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 04004D94E2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A6BC1JWz+GPz4q4zbu2SmT87jye66A1Kr5WFh8+7mPtSD1CNG3LKOr22Q6NzckJrMlf+9m0yXTBFmGF2gJzguHjCvNadg7N4KlpSfcz3NobcypoGKKG8JvdudfkP8JiALKHNoUG37kgOfV6ne3eOfa2ZrZ9u67jTILdzHfTXyXqNxBrSaXtvxfGUn9szuBBEhzlPXWQhYMz+ZiuGiYbMPkBdw6NizM5btJOGEQqEG0eTpGChHjbpd4jNOQRVXsR9lereUJ9EHTbBhcUMoH7Rd6RxfsIjtRQ+EPs8agRwZcKjngqSyb9fdkYvdHV3+EigxOO/lyExv06QXRJMPMKIN1wolwFkMzqu8ZLkNys/ufXHPnjSyGKdjhz2YYljJRkELfh9X4FMOn5NmGKoiEpSuCHhfeYkAyXtCoGnjw/cvRrcZKElOjp4mzo4QNzMmi3tz7x40bAgVAF7Pozwb1tEVL9XeYm9hxr+BMYi6b4zy81GR+USi4btOJ1LSwG7eUkdRzWpG4jzrsukF+vwlGasA96JyY/uS5GwShm7KMbUHgRXBuQySAqoRLwWppfG/iQXAlJmmrMuC8zAf8eIlo8FDwQG91ODmchcdRwGKC9nDsQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(366004)(136003)(346002)(376002)(396003)(33430700001)(5660300002)(6486002)(2906002)(6506007)(478600001)(4744005)(966005)(2616005)(3480700007)(53546011)(86362001)(33440700001)(76116006)(36756003)(4326008)(66556008)(66476007)(66446008)(186003)(33656002)(8676002)(8936002)(6512007)(6916009)(316002)(66946007)(71200400001)(64756008)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: pTU2OEL0fhzAZJcwHT1zXprAQmN47Oo8chVJVTCtTYVDGV8IfNvN6kqGvPU02EGYy2p6U54MgI1TmI/NEqTDJYvgo0HS4kjF2EcibD8dKmoOBx9Yb2M3vJ/khVDD7UbiNjEjagQmjj6ghfmwrub91cilQb9OQZfOouMXth2CX5QxDKCCB4zL5FHywkQDMcGTW7spE3/6zoCOVJCrnDovQLfztYCWiPQWXMmJtJ8536bWrSdP4XgToWhDKyx3jrHOxULkeu1Alb5XOYgbJ6K7CR344cTE09pYEkUgmV9umnabzznsXJQxbdLpxsTN+efVsE96xouMPo4xaR3JzkLvovJ7S8fyGD0CkweAgZps6mIUWF7Pq/4JnHj+ZnxsT4RgQsE+RFKAw2wqlwNuVk9TxJCdB08pxe/qNb0fiEcb4i0oOkcg/Rnf5cUkO+bClY5VrhMJWVV3SOjgqyYDgEifgoknwo3QiaTP5hWifK90V//XRBwRiYBEe+PBYw43KZfwU22MG/Xle0bfksu8aYnXg80o7iO74GXWu2L9RWKbRILaHrUQfciGLLrNwNU7mI2X
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE554458388FC947AB8AB4D368F9DD5D@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bcb7161-b860-413b-7ddd-08d7f5cf0bb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2020 17:16:29.8336 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7qJtDTJA9D3y4vt9P6j67CTMNjKv9Vrxffy5ri7ODXzA1fKLge8qnd4RZ0ybrdSGDF8P3RHoYybT6QrUqUK9Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2453
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-11_08:2020-05-11,
 2020-05-11 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 clxscore=1011
 mlxlogscore=496 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005110135
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gNS8xMS8yMCwgNjowNiBBTSwgIlBhdHJpY2sgV2lsbGlhbXMiIDxwYXRyaWNrQHN0d2N4Lnh5
ej4gd3JvdGU6DQoNCiAgICBPbiBUaHUsIE1heSAwNywgMjAyMCBhdCAwMToyMzo1NEFNICswMDAw
LCBWaWpheSBLaGVta2Egd3JvdGU6DQogICAgPiBIaSBCcmFkLA0KICAgID4gQ2FuIHlvdSBwbGVh
c2UgY3JlYXRlIGEgbmV3IHJlcG8gZm9yIHBob3NwaG9yLWhlYWx0aC1tb25pdG9yLg0KICAgID4g
DQogICAgPiBSZWdhcmRzDQogICAgPiAtVmlqYXkNCiAgICANCiAgICBGb3IgY2xhcmlmaWNhdGlv
biwgdGhpcyByZXBvc2l0b3J5IHNlZW1zIHRvIGJlIGFuIGltcGxlbWVudGF0aW9uIG9mIHRoaXMN
CiAgICBwcm9wb3NlZCBkZXNpZ24gWzFdLCBjb3JyZWN0Pw0KWWVzIFBhdHJpY2sNCiAgICANCiAg
ICAxLiBodHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6L2Mvb3BlbmJtYy9kb2NzLysv
MzE5NTcgDQogICAgDQogICAgLS0gDQogICAgUGF0cmljayBXaWxsaWFtcw0KICAgIA0KDQo=
