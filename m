Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8BA26AD68
	for <lists+openbmc@lfdr.de>; Tue, 15 Sep 2020 21:21:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrY4x0KLlzDqPj
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 05:21:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=652724fd9d=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=OKR3C2SV; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=GwWDOa0z; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrY450s4WzDqMT
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 05:21:07 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 08FJJqFR003657;
 Tue, 15 Sep 2020 12:20:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=o1yuUJ+zAnAChJBbva5uyTHKh9iDJmGuqbXnVlMzQxg=;
 b=OKR3C2SVByPosthPJTwWaDQfSxRonfFJimHpkOlZ7QWm6buNHGlc5ygC2HEMix0AfvS+
 SL3Cir7X1g8HrEYez6k+ffksN7F8DGsaYaZp8y2MqPofjrfRt17rUYDMs7511FN/S2ho
 3jDpr1JZ9QrrzgdDHO9vllc0NyHVssqXzQA= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0089730.ppops.net with ESMTP id 33gsty237v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 15 Sep 2020 12:20:57 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 15 Sep 2020 12:20:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nrZaCHi/b7WBz5G0AShOpAp+K1QXZ+n54tKauYS2VNYW1unZo4bo/2q8tnTg+uIIfCl5hLIXCr7e89R7+FLFjOp1s5mru/RwguCovK7uWvpoUaq3ufUwS3KFaSaDpG1+tUJnMELmBg6Ii2IaPEFJtEc84OzWHs71OvdJlnA9eVOe6HFNv2Gp6v+N/9VCtRsviN4LaaQ92nD6XusI2HFKn/aLZl4goB9z27dxD8jagrcRVNAES4RySNpf6lsziBQeGZ6LFRc3vTNw97v5jdeC0SwB3MnOX/ENt0038L2CM+1kFeuaKO1myhzUC/RN6zyH7eiRIvytnYcZlB0QwYhZWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1yuUJ+zAnAChJBbva5uyTHKh9iDJmGuqbXnVlMzQxg=;
 b=WX7+NRdQqU9RXlTAqWU9eEnTs2q8f4Lt2f1r3wkO839EtZGdOneP2KBAY0oCSEapvMr4yhzb74yq4QLvU3e7SwEaJ/0s2fZxGmj4qmwSmqSwbxKPJVt+hz2c8YI3M5iUk89z80GTGPpypFV8U8ZN8cpvTubsDq/HWHFD/tNj8kaXSAj6L/0g5DvxUwed67OMTRJMsbAguyfzGOZ2LznD4sVRUZqqu3FKwlJLZA1E5Nx/pjKr69BOnvK/YGz6Dly5uQo2/mnZGBQ2fsQn3aUJ16iZm/kmnKjAO7dOlWHddapjDB5tO/eHtsz4hIEuIcGxN0wdxEO5m8NUCxkaYQQU2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1yuUJ+zAnAChJBbva5uyTHKh9iDJmGuqbXnVlMzQxg=;
 b=GwWDOa0zMIf+6V7W5IvABJjCK6EVzTT8n1+AgM2ZzRwCt8602544QSiUHWc0hDfMEIWeHfNfA/DSULLC0E8pbLSW6zjPsSFPOmWrVdAYdqcgvjZcibdU1LrxSMyzcPBE3W3tgYIIXoyPiiBLJF3sd7rQXEt8re0WpADbzHMCFNs=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2566.namprd15.prod.outlook.com (2603:10b6:a03:150::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Tue, 15 Sep
 2020 19:20:55 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::4d8e:7b5d:455b:3a97]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::4d8e:7b5d:455b:3a97%6]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 19:20:55 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Ed Tanous <ed@tanous.net>, Kumar Thangavel <thangavel.k@hcl.com>
Subject: Re: Read FRU of host through ipmi in Entity manager.
Thread-Topic: Read FRU of host through ipmi in Entity manager.
Thread-Index: AdaKtjzUbcfxCnsRS1m0flxOovD9XQABka8AACeJKwA=
Date: Tue, 15 Sep 2020 19:20:55 +0000
Message-ID: <3D149923-0A95-4CE6-82EF-8338677EF831@fb.com>
References: <HK0PR04MB2964FFC6D5EF008F106FFC13FD230@HK0PR04MB2964.apcprd04.prod.outlook.com>
 <CACWQX80fpcLGEjuvUnj4JpinY=SS6eXbHR0i6wdEtjNpMsAHMg@mail.gmail.com>
In-Reply-To: <CACWQX80fpcLGEjuvUnj4JpinY=SS6eXbHR0i6wdEtjNpMsAHMg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: tanous.net; dkim=none (message not signed)
 header.d=none;tanous.net; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:88de]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd5bf7ee-655d-4189-ac11-08d859ac7819
x-ms-traffictypediagnostic: BYAPR15MB2566:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB2566B6AD67843D9A8A77E735DD200@BYAPR15MB2566.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wa6iu3J7jxYlPCgsUeiY+Ei4aEO8fd9Z03hcwcDTDj5bdDc4EnYkZ2k07QFqtRCq3k7EW8d4ivSWJm6rxVsp/8opk30rKmR4g+cDJoUi1vvNnD6+uvcDKe4QSOlBhid5OvQ3sKQmLinIc6+Jpd2YZw5fsQ9pZH3eLoMO/GObkOm6AAO9Jn+ef6+RWG2sAPORlLTBKN9Bk+rJxVlYVfhDNlEWVyorcqPErY6w69Q1TggrJuvKEyPh1eVfntjntTbq0/PfW3kMwiJ2tPTvMXb89gOPvGwh1yIjdkFaM3LGLEIafi4KG/sWC0sYUbOBzp/r+iY01kMjEFUsrhSpz+OAI9Va4mwHRedb/jhgtVKSrD0mHIH3S5UxLlVGq6PEgVyvy8+5JSNG6lE3JLD/GHjI9g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(39860400002)(366004)(136003)(346002)(5660300002)(83380400001)(6486002)(110136005)(66556008)(64756008)(66446008)(8676002)(71200400001)(66476007)(2616005)(54906003)(966005)(6512007)(186003)(8936002)(36756003)(316002)(86362001)(2906002)(91956017)(4326008)(478600001)(33656002)(53546011)(6506007)(66946007)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Ht5HENFbKr7uhET+qQoa8Oz/ssHBgxeZzGzygPkpJfxQxEvRMm4aMztg9OXCedtCoGXnmQWbEDhuPOhceVERNdhmHecNDwylS8lu49Zn/x1wWtwtZh4+hu62TGbiDBRdMGFdW0mf4bKdXe9gHvvCZ/Vd/3lnVVyPp7DyEPv+vy/AvfTokRZIDfAbSTT2cXEP1P06jGR1LuZFXxsofP/hAdXgyItjE2wvoKmT6Wrq63/6ILVGk8ap3HxT8C0jAyEQwijx4PzIOAMxco19KFx9FQpLAc23UVJgfMzop9W0JXsnHkom3qsmTTDBba999/dRaq94i16CcL8kjYp1W6/DVnALeVXr1kjiF294OuB1IT3f7fJPzTS/2hS0hwqfqDG8jB1R68+cPY7mRSJjj5LbFIDq+19LpQkQzAXZFYzix+TL9BOZU0c4BfGVg7J27M7ZjkF7Wk3RaZrwgAe2eTLrCg1dGQHA2h7sH0aUjEJtxur7txoyUgFjvk6oI8okhMBABo4NhCfnhEMnt3qyY6FwFTrAIg6tKIwSi31lUWlFnzyyZSpPrnm5wzyTzzAL2DFxC2f/qBKZEyXfinOHpCGNl4TKKE2ytrvspBx0W23z505AW//50IiD7RczMvTkSfZz8AippcmkXuhB3lg/PBPtC+4ZfQ2JUm5BsL8exYR9P449vHdAs0pjrfgcFg2mUP8x
Content-Type: text/plain; charset="utf-8"
Content-ID: <76BA126768C1C04D804EF95E067D06C7@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5bf7ee-655d-4189-ac11-08d859ac7819
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2020 19:20:55.5661 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +fG97h8cZgMFWSKn2MfSxgpeKfFhDKaiOLPvW9PhBnadSFXfgGxBf4C/f/epLodqKtzEXWBHbdwbbNvQewwDyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2566
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-15_13:2020-09-15,
 2020-09-15 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 spamscore=0 clxscore=1011
 malwarescore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009150151
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>, Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCu+7v09uIDkvMTQvMjAsIDEwOjI5IEFNLCAiRWQgVGFub3VzIiA8ZWRAdGFub3VzLm5ldD4g
d3JvdGU6DQoNCiAgICBPbiBNb24sIFNlcCAxNCwgMjAyMCBhdCA5OjU3IEFNIEt1bWFyIFRoYW5n
YXZlbCA8dGhhbmdhdmVsLmtAaGNsLmNvbT4gd3JvdGU6DQogICAgPg0KICAgID4gQ2xhc3NpZmlj
YXRpb246IEhDTCBJbnRlcm5hbA0KICAgID4NCiAgICA+IEhpIEFsbCwNCiAgICA+DQogICAgPg0K
ICAgID4NCiAgICA+ICAgICAgICAgIFdlIGFyZSB3b3JraW5nIG9uIHRoZSBQbGF0Zm9ybSB3aGlj
aCBoYXMgbXVsdGkgaG9zdCBhbmQgdGhlIGhvc3QgYXJlIEZSVXMuICBUaGUgaG9zdCBhbmQgQk1D
IGNvbW11bmljYXRpb24gaXMgYmFzZWQgb24gSVBNQi4gV2UgaGF2ZSBlYWNoIGhvc3QgaXMgY29u
bmVjdGVkIGluIHNlcGFyYXRlIGlwbWIgYnVzLg0KICAgID4NCiAgICA+ICAgICAgICAgIEV4aXN0
aW5nIEVudGl0eSBtYW5hZ2VyIGhhcyB0aGUgRlJVIHJlYWQgaW5mbyBmcm9tIEVFUFJPTSAoSTJD
KWluIHRoZSBmb3JtIG9mIGJpbiBmaWxlLg0KICAgID4gICAgICAgICAgV2UgdW5kZXJzdGFuZCB0
aGF0IGVudGl0eSBtYW5hZ2VyIGRvZXMgbm90IHN1cHBvcnQgaXBtYiBiYXNlZCBob3N0IGZydS4N
Cg0KICAgIE1pbm9yIGFkanVzdG1lbnQuICBGcnVEZXZpY2UgaGFzIHRoaXMgY2FwYWJpbGl0eSwg
bm90IEVudGl0eSBNYW5hZ2VyLg0KDQogICAgPg0KICAgID4NCiAgICA+DQogICAgPiAgICAgICAg
ICBTbywgd2UgYXJlIHByb3Bvc2luZyB0aGUgZGVzaWduIHRvIHN1cHBvcnQgaXBtYiBiYXNlZCBG
UlUgaW4gZW50aXR5IG1hbmFnZXIuDQogICAgPiAgICAgICAgICBGcm9tIEVudGl0eSBtYW5hZ2Vy
LCB3ZSB3aWxsIHNlbmQgdGhlIGdlbmVyaWMgInJlYWQgaG9zdCBmcnUiIGNvbW1hbmQgcmVxdWVz
dCB0byBpcG1iYnJpZ2UgdG8gcmVhZCB0aGUgaG9zdCBGUlUuDQogICAgPg0KICAgID4gICAgICAg
ICAgVGhlbiwgc3RvcmUgdGhlIGhvc3QgZnJ1IGluZm8gaW4gdGhlIGJpbiBmaWxlIHRvIHByb2Nl
c3MgYW5kIGNyZWF0aW5nIGRidXMgb2JqZWN0cyBpbiB0aGUgZW50aXR5IG1hbmFnZXIuDQoNCiAg
ICBNaW5vciBhbWVuZG1lbnQgYWdhaW4uICBJJ2QgbXVjaCByYXRoZXIgdGhlIElQTUJTZW5zb3Ig
ZGFlbW9uIHNpbXBseQ0KICAgIGNyZWF0ZSB0aGUgc2FtZSBpbnRlcmZhY2UgdGhhdCBmcnUgZGV2
aWNlIGRvZXMsIHJhdGhlciB0aGFuIGFkZGluZw0KICAgIElQTUIgbG9naWMgdG8gRnJ1RGV2aWNl
LiAgSW4gdGhpcyB3YXksIHBsYXRmb3JtcyB0aGF0IGRvbid0IGhhdmUgSVBNQg0KICAgIGRvbid0
IG5lZWQgdG8gaW5jbHVkZSB0aGUgZmVhdHVyZSBhdCBhbGwuICBBbHNvLCBhbGwgdGhlIElPIGNh
biBiZQ0KICAgIG1hbmFnZWQgaW4gb25lIHBsYWNlLg0KICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9v
cGVuYm1jL2RidXMtc2Vuc29ycy9ibG9iL21hc3Rlci9zcmMvSXBtYlNlbnNvci5jcHANCiAgICBJ
ZGVhbGx5LCB5b3VyIElQTUIgZGV2aWNlIHdvdWxkIGFsc28gaGF2ZSBhbiBTRFIgdGhhdCBkZXRh
aWxzIHdoYXQNCiAgICBGUlVzIGFuZCBzZW5zb3JzIGV4aXN0LCBzbyB0aGF0IHRoZSBpbnZlbnRv
cnkgY2FuIGJlIHJlYWQgYW5kIHBvc3RlZA0KICAgIHRvIERCdXMgYXQgc3RhcnR1cC4gIElmIHRo
ZXkgZG9uJ3QgdGhlbiB3ZSBtaWdodCBuZWVkIGEgc3RhdGljIG1hcHBpbmcNCiAgICBmcm9tIGFu
IEVNIGNvbmZpZyBvbmNlIHRoZSBkZXZpY2Ugb24gdGhlIG90aGVyIGVuZCBpcyBkZXRlY3RlZCB2
aWEgZ2V0DQogICAgZGV2aWNlIElELg0KDQpJIGFncmVlIHdpdGggRWQgaGVyZSwgYWxsIGlwbWIg
cmVsYXRlZCBpbnRlcmZhY2VzIHNob3VsZCBiZSBpbXBsZW1lbnRlZCBoZXJlLg0KDQoNCiAgICA+
DQogICAgPg0KICAgID4NCiAgICA+ICAgICAgICAgIFBsZWFzZSBsZXQgdXMga25vdyB5b3VyIGNv
bW1lbnRzIG9uIHRoaXMuDQogICAgPg0KICAgID4NCiAgICA+DQogICAgPiBUaGFua3MsDQogICAg
Pg0KICAgID4gS3VtYXIuDQogICAgPg0KICAgID4NCiAgICA+DQogICAgPg0KICAgID4NCiAgICA+
DQogICAgPg0KICAgID4gOjpESVNDTEFJTUVSOjoNCiAgICA+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fDQogICAgPiBUaGUgY29udGVudHMgb2YgdGhpcyBlLW1haWwgYW5kIGFueSBh
dHRhY2htZW50KHMpIGFyZSBjb25maWRlbnRpYWwgYW5kIGludGVuZGVkIGZvciB0aGUgbmFtZWQg
cmVjaXBpZW50KHMpIG9ubHkuIEUtbWFpbCB0cmFuc21pc3Npb24gaXMgbm90IGd1YXJhbnRlZWQg
dG8gYmUgc2VjdXJlIG9yIGVycm9yLWZyZWUgYXMgaW5mb3JtYXRpb24gY291bGQgYmUgaW50ZXJj
ZXB0ZWQsIGNvcnJ1cHRlZCwgbG9zdCwgZGVzdHJveWVkLCBhcnJpdmUgbGF0ZSBvciBpbmNvbXBs
ZXRlLCBvciBtYXkgY29udGFpbiB2aXJ1c2VzIGluIHRyYW5zbWlzc2lvbi4gVGhlIGUgbWFpbCBh
bmQgaXRzIGNvbnRlbnRzICh3aXRoIG9yIHdpdGhvdXQgcmVmZXJyZWQgZXJyb3JzKSBzaGFsbCB0
aGVyZWZvcmUgbm90IGF0dGFjaCBhbnkgbGlhYmlsaXR5IG9uIHRoZSBvcmlnaW5hdG9yIG9yIEhD
TCBvciBpdHMgYWZmaWxpYXRlcy4gVmlld3Mgb3Igb3BpbmlvbnMsIGlmIGFueSwgcHJlc2VudGVk
IGluIHRoaXMgZW1haWwgYXJlIHNvbGVseSB0aG9zZSBvZiB0aGUgYXV0aG9yIGFuZCBtYXkgbm90
IG5lY2Vzc2FyaWx5IHJlZmxlY3QgdGhlIHZpZXdzIG9yIG9waW5pb25zIG9mIEhDTCBvciBpdHMg
YWZmaWxpYXRlcy4gQW55IGZvcm0gb2YgcmVwcm9kdWN0aW9uLCBkaXNzZW1pbmF0aW9uLCBjb3B5
aW5nLCBkaXNjbG9zdXJlLCBtb2RpZmljYXRpb24sIGRpc3RyaWJ1dGlvbiBhbmQgLyBvciBwdWJs
aWNhdGlvbiBvZiB0aGlzIG1lc3NhZ2Ugd2l0aG91dCB0aGUgcHJpb3Igd3JpdHRlbiBjb25zZW50
IG9mIGF1dGhvcml6ZWQgcmVwcmVzZW50YXRpdmUgb2YgSENMIGlzIHN0cmljdGx5IHByb2hpYml0
ZWQuIElmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZW1haWwgaW4gZXJyb3IgcGxlYXNlIGRlbGV0
ZSBpdCBhbmQgbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkuIEJlZm9yZSBvcGVuaW5nIGFu
eSBlbWFpbCBhbmQvb3IgYXR0YWNobWVudHMsIHBsZWFzZSBjaGVjayB0aGVtIGZvciB2aXJ1c2Vz
IGFuZCBvdGhlciBkZWZlY3RzLg0KICAgID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18NCg0K
