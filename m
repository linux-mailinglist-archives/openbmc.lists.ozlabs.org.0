Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F54A29DD82
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 01:39:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CM65n2fgKzDqXY
	for <lists+openbmc@lfdr.de>; Thu, 29 Oct 2020 11:39:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=85713010a6=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=DnfZ4rJo; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=LkppFfp1; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CM64y2XW0zDqTQ
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2020 11:38:47 +1100 (AEDT)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09T0Q11j004835; Wed, 28 Oct 2020 17:38:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=Bjgg4CwN59h0dXh33A2JsihXm234zTwdeCIl1V51Sn8=;
 b=DnfZ4rJobkxOIQtecg+nk5ShqFrL3l305jL4Pye+Q7BMp7JYUuE0RD4GNQj1Z7ugDL2A
 Xs64Spk+pJjcoHeCEl0Pwhp6KSPZsndUJTN7VSIQ4c6gtn/GojjTAWgYNuwMn5L0YY7L
 zhewQX3qUV59NGA0Hr+zx1S81zsAI7Dl0Vc= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 34exqpp8jt-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 28 Oct 2020 17:38:45 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.101) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 28 Oct 2020 17:38:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mroLXdio4GemIHbWsFdX3fx2Z+/VCBlc2rvzjA1Y5dIevLUTpU5l0htbIHofzNh+DK3M9e/fRvg+DY6LzaWt1JnGm5XWmzdMa8iMRhJD8IlelL0q2izkt4VZpjLNWzatUoD08T62kN4sFINmz9Nf5RsZ4DwBCchaWzuG0iDUn5UB/Z5bYKyyiRUKuCDLY1zVwi7bFTDi03pUOiWMct+xGF3M5SK/pZT5C4m3DcGskZMly67TtJ2Baq+Huvkxddg7OiC0Qc0Fd8hJANH7seKPGFH3juS+CZF9dwn0TI/ci/qxVqmzWcx6uV/OX/MjuPyDgandtfYK9D3AWfatADDqZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bjgg4CwN59h0dXh33A2JsihXm234zTwdeCIl1V51Sn8=;
 b=g6pbeTRJZAW96MhgLBNBkq0vt86zOqi6/t0B7fpbZmPq82wfRNiljCeNZCAbL5pQDDv+N3euMYFBZGyDFHKLnSrU+WU4HsyYVjp2wZEXaAIy4INKMSw23kIfbG7C58sXy0MFf0zAGF8XdnW1LQ7yrE5x1odsy8RuIMrd4kjs+nMjCNreahvj1Ea4swl6qM6HsT8d+HulU7GzNa3/A1TQ6RamBzr4g75SXllXN8v0BeOZb/pzVopdimMbl5ge/Sj8wkkKSz5ZmvwUQuiq254eY8hJLmkuN9bDHRxoOean8u3Fhiv0weW3mP2mvzbSvoqvMX/xJiUL+JwcJ1MOPAMoLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bjgg4CwN59h0dXh33A2JsihXm234zTwdeCIl1V51Sn8=;
 b=LkppFfp1x6nnMCpeFRqgLDPvpDXTbkN+gJsAcFtfBovPn8DVO/Pw3l/ltdA8nYvFF+NVcX5Ld0SBIxeZLLixJ94qwL/zJLEzEM/rVRspXr2oj7GWzvXlmXX01A4FmPXDJFUixLvrzaKkZQn08xSNEXhVRHBkcMx4t07QyjOxzw0=
Received: from BY5PR15MB3537.namprd15.prod.outlook.com (2603:10b6:a03:1f5::20)
 by BYAPR15MB2534.namprd15.prod.outlook.com (2603:10b6:a03:152::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Thu, 29 Oct
 2020 00:38:43 +0000
Received: from BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::5cb9:7809:838b:488a]) by BY5PR15MB3537.namprd15.prod.outlook.com
 ([fe80::5cb9:7809:838b:488a%5]) with mapi id 15.20.3477.029; Thu, 29 Oct 2020
 00:38:43 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Ed Tanous <ed@tanous.net>
Subject: Re: New fru bus interfaces
Thread-Topic: New fru bus interfaces
Thread-Index: AQHWrXLPkL8m5PCTZE2olcApxYVT16mtl8WA//+vsAA=
Date: Thu, 29 Oct 2020 00:38:43 +0000
Message-ID: <5D347AC9-E410-4F94-BC56-4F69C6DB2DCF@fb.com>
References: <4D8141F3-33DC-48F5-99BA-9099044E6A60@fb.com>
 <CACWQX825kGcNJ9PfsuDZk1Bghdv9SRuZiu7FF2Fz+yiDqp_9xw@mail.gmail.com>
In-Reply-To: <CACWQX825kGcNJ9PfsuDZk1Bghdv9SRuZiu7FF2Fz+yiDqp_9xw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: tanous.net; dkim=none (message not signed)
 header.d=none;tanous.net; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::4:43d4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8dd9697-7901-4d7a-0c69-08d87ba2fd30
x-ms-traffictypediagnostic: BYAPR15MB2534:
x-microsoft-antispam-prvs: <BYAPR15MB2534BAD92BD884380EFAE079DD140@BYAPR15MB2534.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FQfNIxCL0yutqsat/HdrQTJ0w8zUQqcGth9fOYe6EVqlEZLHwg+2gUCphfkv703BlASA74d/mfW5wiS4Sdo02otd1dq5we7NoIzkQ7YkF3zrGCi2SZTFBolNInb21QM/bJYyyHpisztIGalDXAPql0NZQ5otGFYQonP24ZUL6WTDBRtE8GAxRO4XyZcm9FuxhWRGKoKEW8Jq+/TT0uVH4izBi6HwqrQUvXZt460/eyWNTdXfCWFw30j/WjiJGsQZAjico19s6S02d7PGPnXjrFSnOnIDJCbyGCLFvwF10fbCF0fgL5j5AE8qzBxmSrr1dg17nUJP367zcVH3pSjgqnm2Wa0hPmE8Ej1GejzEkoOnQHhxELeRj21Cbb/Oo1lRkLbhdECQ6wc/yvWOavWchQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR15MB3537.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(346002)(376002)(136003)(39860400002)(71200400001)(2616005)(6916009)(558084003)(33656002)(186003)(4326008)(2906002)(36756003)(86362001)(478600001)(6512007)(66446008)(66476007)(66946007)(5660300002)(8676002)(66556008)(316002)(8936002)(6506007)(64756008)(966005)(76116006)(3480700007)(91956017)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: HrYhAPqYRkDmZbqoQUztWGO9IE/OlXXuyuVd4AyMTjNpeGYyPd1Gqw114mfTw7oeHBdO3SeLmHOf3O7f8DCist3h8V6F39p3cPvPEy2/Jyq/yClvPnGqNf842Ni/UYqppQeE9BKPK86mPNx3YzVq/AWxoxdw49oSK06PkZcpCoWQh3b0RtXv0Xec9kMvr5fZhpngAAHFyyw4zhfl6+FMLIjhrmLaBzs2RbQCfxDQ7UzDON7Gsb4ihzcgqpuWf3t0FXwQBOI0CSZYr4h8dlyq83LQxZQZgDw+fZRAtIwfLVNAmZsW0hL+ZC6f/1HIK/Ld+T1n/tcdwKk0adF0OZIMYHMdRlVxY5VsHTQnHD1yEtUKMCtYqvuMHvfpo2/xrjr5tYwvoKNrvpFPcOdDcPDRzULUgp1hHAOV0J+M29aiKxET9mH99EUJ0V5K3McffA+DVJ4qV5ub99Y7MMjSxhaFtMf6xxEl6GKY6QQF6rYlxxj5Nko/mdv91qCflA2o0i41Js0uI5PAlauJH/BWKApf2+tmEduxQd2UDByJ+3u3KF7qnnwsvKBcCJbZSDsDkVsYuoEezcekD33NGyLhbdcRdiomeSj7pSvnKxua0Qcjv85Fbm+9UdNszRxDOpQqWo7C9/dGjnhQA2Y1oG2o0FloSWUgzyFz7duvwq82qEsGjnyezUxRAAGHxIpZBCYcGZsN
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A8498F84322AE47AE5F0956199F9261@namprd15.prod.outlook.com>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3537.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8dd9697-7901-4d7a-0c69-08d87ba2fd30
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2020 00:38:43.3889 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JW6XCI1NQA2/Tg9yhSMs3dBt+rZxINWDqLUBAAz0BTuuByHLJ1ZaRC7KLc3dT83/RZucClZCOcoXjCFJl67AoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2534
X-OriginatorOrg: fb.com
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-28_09:2020-10-28,
 2020-10-28 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0 spamscore=0
 adultscore=0 impostorscore=0 mlxlogscore=680 suspectscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010290000
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

DQoNCiAgICBJcyB0aGF0IHJlbGF0ZWQgdG8gdGhpcyBjb21taXQ/DQoNCiAgICBodHRwczovL2dp
dGh1Yi5jb20vb3BlbmJtYy9lbnRpdHktbWFuYWdlci9jb21taXQvZDdiNjY1OTk0NGMzNTI3NjIy
ZDQ1NDUyNjUwOWEwYTg2OTdhZGEwZg0KDQpMZXQgbWUgY2hlY2sgd2l0aCBjb2RlLg0KICAgIA0K
DQo=
