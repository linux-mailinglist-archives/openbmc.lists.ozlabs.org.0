Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBE3274986
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 21:53:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwsSc1qHczDqWY
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 05:53:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=6534d30414=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=Qss0Hpfd; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=CNJFfAVc; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwsRs5w3RzDqVb
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 05:53:11 +1000 (AEST)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08MJr36q008989; Tue, 22 Sep 2020 12:53:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=NlZVIpDtvC7XzgNKqVTz6bBboEwX/y49LFKsFrQ83jQ=;
 b=Qss0HpfdX/jJdaItVUYK2TgJKWVGhRypNiEknZToIcqq0kOUXndkfOD3cVALw/DdyLTf
 UhFmrZS5v4ncADDdmELdI8JikKnQppIOtFZIya9/wm7GtVJFwtdZWxDv7ob9p4iRjrZ/
 OXQtm5s8VFNFqLzsHAGyAgpVJzd2tCGh3VA= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 33p1tjvy91-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 22 Sep 2020 12:53:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 22 Sep 2020 12:53:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZaT9tTcV9HrgJ78yn33d93g6nqTr/OuibidcdVmMsxFD6mtmgDzuLvMEPmaQCTwWSoKEkNzumMzhzdrbpS2HxMYAXGSDCqu8gWick5bsPrNQz0G/HuJvJLzFfPIXUNPLKyz5tIka9h0CHqrbw9R71vF/LyTX8X4qA/+ECqNidQOxDHVpLRjfz/1dnG0iH+noA5h3+1hcWB03fnb2wOyf1hR5Y2ZDJZC8BnhkuyQERgkri7ilpn6Vh1CgU0+7ayslQ6rH4Hkmoj+tjaKrZoroejM66kA5Qjl+Sy3IsRJVfLcdM4qnjDQRS/Z83AcI2Z3WBYqOi/VOqralOBAfUJ34A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NlZVIpDtvC7XzgNKqVTz6bBboEwX/y49LFKsFrQ83jQ=;
 b=OijcxsA1E1g/Ckwsze5TSRBTVsFGZT+PVnmRudlL6PnBYE6eQqBQe+VI0QhyRb2zQWgVRmQU8oISBWNBFmcQidedhu6ZudsBohPjf+lR1ABv7Esr8DS9Qrku/8Y6Rv/49GJdP1L199lmBV2P6Ht2wNlpv8mqBk7GdCIvqK4TfSQ+o2dVOLFpx3sNkJxzUNEQOAgGlVIsKqotdHstN0jkPPySfVMPhnB3MEeQ94XDl59Ke8f6tpSgjjfHmpz91Z7VE8WXy4RacO4xxvfqisjpkIRgrIXRODF4chM3JLaBSRcbZW+s3GpyEiBL8XQjnrPHpp6/HGWcyfzRGc4fzNcoqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NlZVIpDtvC7XzgNKqVTz6bBboEwX/y49LFKsFrQ83jQ=;
 b=CNJFfAVcyUWEd5TrKvdeUne38/0jcWcjBE9498c4OhpJwbZ2s99WFt1+RDijEKFdYGYlx9uBYdJ8o+SdqEVOj4Oxjgxcw/mlis8UdMRVYkxWt+yR0kRl8BXLzkffxa28d23TUlq5M4BEN5qylKyJVhaLotgiVq2yuGeJnQyFdhg=
Received: from BYAPR15MB2374.namprd15.prod.outlook.com (2603:10b6:a02:8b::16)
 by BYAPR15MB2407.namprd15.prod.outlook.com (2603:10b6:a02:8d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Tue, 22 Sep
 2020 19:52:58 +0000
Received: from BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4]) by BYAPR15MB2374.namprd15.prod.outlook.com
 ([fe80::88bb:d933:db33:4df4%7]) with mapi id 15.20.3391.027; Tue, 22 Sep 2020
 19:52:58 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Ed Tanous <ed@tanous.net>, Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: interest in a minimal image recipe
Thread-Topic: interest in a minimal image recipe
Thread-Index: AQHWi58zEOwKc47hCUe0SSUl2C7L4altUs8AgAXC9gCAADGrAIABX+cA
Date: Tue, 22 Sep 2020 19:52:57 +0000
Message-ID: <C329EE81-E907-40E6-B455-443D380024AB@fb.com>
References: <20200915202832.rq3os62pdj7mzaco@thinkpad.fuzziesquirrel.com>
 <CACWQX80tELWA-EW0A8-DnJGFmJyMxDC04YTq4B+--bRaoV8rOQ@mail.gmail.com>
 <20200921125540.4d6amvus3wt57igg@thinkpad.fuzziesquirrel.com>
 <CACWQX82i4k+PADJkOjDQEeUAQJtve+pySLRQVcqR7XayG5cJCw@mail.gmail.com>
In-Reply-To: <CACWQX82i4k+PADJkOjDQEeUAQJtve+pySLRQVcqR7XayG5cJCw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: tanous.net; dkim=none (message not signed)
 header.d=none;tanous.net; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:a5f3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5471c4f5-dd0d-4e6a-02a9-08d85f311add
x-ms-traffictypediagnostic: BYAPR15MB2407:
x-microsoft-antispam-prvs: <BYAPR15MB240761AECD137EA0D2D72980DD3B0@BYAPR15MB2407.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cGVlZBvspiYP6foUPoDWAIbt7psrmnSVpoSbUrcTVYacE6t81VJVyDpvR7i5ribdjhNCe0nTmiyXBGRCdZoywvruSG+JtvPxynopSJdTFVcHGrxGLJU0GrPasm06tB3aLJUPql2Rt5VOaMf2mxodECm0/6rsq5SkSfDY2mg8qaN1pC2YUQhAuWrkvhjWHGnn4Ah5bfzCOyAE7b+86gAud/+Xm+TxB7ABbSUHJxJOsrjlo/l0gQy+J1tJNb5tdyikvC+U/OlFH2YMBXHy6rA40BxcsPHeHYYazIvVmKl7E8YoJN7S2EFgt3cIWFh/JLyjWtmv3gw2ekgnICBLexksvQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2374.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(136003)(39860400002)(396003)(366004)(71200400001)(66946007)(86362001)(36756003)(83380400001)(4326008)(186003)(6506007)(8936002)(2906002)(8676002)(2616005)(316002)(6486002)(91956017)(64756008)(4744005)(110136005)(66476007)(6512007)(33656002)(66446008)(66556008)(5660300002)(478600001)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: OlbMpjLqTjZYx00JjhsLXIgkUQzW8w/yFv2wl1a0cQR3QClxmBgnm5YgIoTESHKNu4PvVzXeYGGidSNoztOhLdv/DJ75BHapTZR7NHQtVasJv8MX3IVaB4bwtMpB/w3uhH25PjvZ5xCQwiDAOmW221PeqFXoI0Fo/cvJ6SVwj2WXJgA/RB7qLkJChG+Y2AqqoLSdirERla2wj9ceONmi1Xwq8rUdfI2UDviPkOueR5tpsyeEHEmNDYEtNMI+RRZ9SyhvL8VnploZTS8G3/ZUMMmyN8UyAeCt9GR3ZE6A3xV9ezCMzoJriT4s65lepyrrIecpqfRdz0i6sjSN3P7VBoTen7B5yviIkRmXrcUYfZzGNgTvhq/KYhPGhD8wm3ccHcfA/7kGPcLOIwNbfoyEBNiBs3/gXbji/l+g1nT/xtlrNS9x/rRGCm9l0vhx91KsJqB/RVZ1AU39ARPXL0ujTfl75BWoN6eBsN1cydQEgl/Z5boknYqHGGC/LxLDlzydErJ3mcJI/5K2VaKXrjdtHHOGQrog9xqZaKbezE9YNeO21tszVG5t1b6nV+I7dT8BV1PxkWfqEcBArYsQuCfCcdwrva/aA27pNWaQe8/goAYp2T7L+hZFT5Sk1wDwQCYpIltPZP+ODfKF82cvU4JYtB+08ZxxYuGehJyU5H0Z5as48eAWGfq1TTsStVagNOwu
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E840999C5A529B4F9DB1610C828CA783@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2374.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5471c4f5-dd0d-4e6a-02a9-08d85f311add
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2020 19:52:57.9944 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dWWwL1c+M53ADnORmSJ6bAqsFRd5/v9UWlH0RiBjHDJZ+JSjivNFOjm7Z8HdSftP2nGe8gdnnH29qa6o6kYdaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2407
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-22_17:2020-09-21,
 2020-09-22 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxscore=0
 mlxlogscore=944 clxscore=1015 priorityscore=1501 adultscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009220154
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

SSByZWFsbHkgbGlrZSB0aGlzIGlkZWEgb2YgaGF2aW5nIG1pbmltdW0gZmVhdHVyZSBpbWFnZSwg
d2UgaGF2ZSB0byBtYWtlDQpzdXJlIHdoYXRldmVyIG1pbmltYWwgaW1hZ2UgaXQgYnVpbGRzIGl0
IHNob3VsZCBib290IHRvIGxpbnV4IGxvZ2luIA0KcHJvbXB0Lg0KDQpJbiBteSBvcGluaW9uLCB3
ZSBzaG91bGQgZ28gd2l0aCBtaW5pbWFsIGltYWdlIHBhdGNoIHdoaWNoIHdpbGwgaGF2ZQ0KdWJv
b3QsIGtlcm5lbCBhbmQgYmFzaWMgbWluaW11bSBkaXN0cm8gZmVhdHVyZSAod2hpY2ggYXJlIG11
c3QpLiBUaGVuDQp3ZSBjYW4gZGVmaW5lIG90aGVyIGZlYXR1cmVzIGluIGhpZXJhcmNoeSB3aXRo
IG11bHRpcGxlIGF2YWlsYWJsZQ0Kb3B0aW9ucyBpbmNsdWRpbmcgZGVwZW5kZW5jaWVzLiBXZSBz
aG91bGQgYWxzbyBhZGQgYSBkb2N1bWVudGF0aW9uIHByb3ZpZGluZw0KZGV0YWlscyBhYm91dCBl
YWNoIGZlYXR1cmVzIGFuZCBpdHMgZGVwZW5kZW5jaWVzLiBFdmVyeSBmZWF0dXJlcyBzaG91bGQN
CmhhdmUgY29tcGlsZSB0aW1lIGRlcGVuZGVuY3kgZmxhZyB3aGljaCBuZWVkcyB0byBiZSBkZWZp
bmVkIGlmIG11bHRpcGxlDQpvcHRpb25zIGF2YWlsYWJsZSBmb3IgZGVwZW5kZW5jaWVzIG9yIGl0
IHNob3VsZCBzZWxlY3QgaXRzIGRlcGVuZGVudA0KZmVhdHVyZSB3aXRoIG9ubHkgb25lIG9wdGlv
bnMgYXZhaWxhYmxlLiBUaGlzIHdheSB3ZSBjYW4gcnVsZSBvdXQgb2Ygc29tZW9uZQ0KY29tcGxh
aW5pbmcgdGhhdCBJIGFkZGVkIHRoaXMgZmVhdHVyZSBhbmQgaXQgaXMgbm90IHdvcmtpbmcuDQoN
CkFsbCBmZWF0dXJlcyBzZWxlY3Rpb24gaGFzIHRvIGJlIHByb3ZpZGVkIHdpdGggYnJpZWYgZG9j
dW1lbnRhdGlvbiBmb3INCmFsbG93aW5nIHVzZXJzIHRvIGNob29zZSByZXF1aXJlZCBmZWF0dXJl
IGZvciB0aGVpciBwbGF0Zm9ybS4NCg0K
