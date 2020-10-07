Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A48FE285695
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 04:11:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5d9n03wszDqD5
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 13:11:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com;
 envelope-from=prvs=0549a6259d=jean-marie.verdun@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hpe.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256
 header.s=pps0720 header.b=RaNMuIkq; dkim-atps=neutral
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com
 [148.163.143.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5d8v6K4QzDqCq
 for <openbmc@lists.ozlabs.org>; Wed,  7 Oct 2020 13:10:35 +1100 (AEDT)
Received: from pps.filterd (m0150245.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09728jBT021674; Wed, 7 Oct 2020 02:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=pps0720;
 bh=gn5m25v0/M6wl2BQ8cMAvFJK+QehHXq7RrNspES96z0=;
 b=RaNMuIkq6g2rj5MrsNsLX+xF49gqDbiarByaMzS5PA1zHtp2bC/HC39iyoS2SkPYJcKr
 ofLMC5TbvZQpUfYmBRUZ3pttgKFVXJY3Iigj6QkrXOe1Ml4F0G1Y7gWe4LewLdm12l8B
 TlHUhoAl4NM2hKdbj6oXCdG6Nd4GhN1JshSV/vOxzrlFpt2V5KynZCMz771SaU7KpTv1
 FQCAf0Z9entkWDQu5951kVFfdImOR6QlvTWOY33ppukTp/0G8FWx28fTjLgYaOzpTn06
 3basmXvYY5wrwWQyhS3ORnVE3a3ZmtkHPvkUB/BUaTRdvWxwLNJa5Q6Fjqpq0ziXOJT1 ug== 
Received: from g2t2352.austin.hpe.com (g2t2352.austin.hpe.com [15.233.44.25])
 by mx0b-002e3701.pphosted.com with ESMTP id 33xjge6nss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 02:10:31 +0000
Received: from G1W8106.americas.hpqcorp.net (g1w8106.austin.hp.com
 [16.193.72.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g2t2352.austin.hpe.com (Postfix) with ESMTPS id 85DC29C;
 Wed,  7 Oct 2020 02:10:30 +0000 (UTC)
Received: from G9W8673.americas.hpqcorp.net (16.220.49.32) by
 G1W8106.americas.hpqcorp.net (16.193.72.61) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 7 Oct 2020 02:09:56 +0000
Received: from G9W9210.americas.hpqcorp.net (2002:10dc:429b::10dc:429b) by
 G9W8673.americas.hpqcorp.net (2002:10dc:3120::10dc:3120) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Wed, 7 Oct 2020 02:09:56 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (15.241.52.12) by
 G9W9210.americas.hpqcorp.net (16.220.66.155) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Wed, 7 Oct 2020 02:09:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmU1DVam3dGPTSBZ4tNGbHdx9ACmYAKKPxg6b5hbd2dci3eCN57o8NXvoeg+OQyGKpMiPOcwYxldUNNk611QA90lYcPnOVEiauHQjnrRhDcmkFE+4SH/imyiFbcuWhgHoJLIZ9WzYy3huuHepQ3TCqryLOanoF+0K72Qa1t/5Km49QpE1ggrf7zvuA6QFfw727L6O2WdjPO/ecLu3pfFra4lVdJjqpdLkPk9Jmrq4X9hnAKE3ZFwzOWbvhgXdazJ9zWlf5QLWkOrrxSfmEkKL7XgeFQuGQXGiM+WmUA4EYb3Hphj2aMoM4KJFC3a8t/T9yv7dSY71xQjWixKL2s20A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gn5m25v0/M6wl2BQ8cMAvFJK+QehHXq7RrNspES96z0=;
 b=aZxHtkMbR2YuOuL/72t69Sz9Rlm0kQ54hMqgtUl5bgN8PGsAiBOKF8DTR+QrBCa1ToIp6edOCYKJlxiUyfz9VqQURdY2ZoutSdlREkV2RAuaExrM05sOcqbAu1mbq003z8hnNyik1BC4Wn8XlrClu27ODcvE+TSszrrvKI/11TjEw5t4cvSqDC8r0g1+xhlhKC3To+W+uMNrAclhv/mV+x8i7dFglUxvAHaZXXvNzeAi/arOLOUgRCcr6EdUPbmmYgNaD6gI2+lJznRxJFX2mfPEij6infcok8R/ozl535eGuplHu4PDcJo+fwkrcGSGPlnXhIN2+mzo7C+epxirEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from AT5PR8401MB0641.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7423::13) by AT5PR8401MB1252.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:742b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Wed, 7 Oct
 2020 02:09:54 +0000
Received: from AT5PR8401MB0641.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::5cca:ec38:7520:111c]) by AT5PR8401MB0641.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::5cca:ec38:7520:111c%11]) with mapi id 15.20.3433.045; Wed, 7 Oct 2020
 02:09:54 +0000
From: "Verdun, Jean-Marie" <jean-marie.verdun@hpe.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: Injecting public key into openbmc image for CI integration
Thread-Topic: Injecting public key into openbmc image for CI integration
Thread-Index: AQHWnAhtZcyfngjJ4EqLHQuK9jyaxKmLY2cA//+NEwA=
Date: Wed, 7 Oct 2020 02:09:54 +0000
Message-ID: <458993F9-8F63-47BD-AE80-111956BF8847@hpe.com>
References: <FDDD3DE1-6228-4BFE-BAA2-96CC549D2CEB@hpe.com>
 <20201007020114.GI6152@heinlein>
In-Reply-To: <20201007020114.GI6152@heinlein>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.40.20081000
authentication-results: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=hpe.com;
x-originating-ip: [2601:646:8600:a:4c30:5992:dfc4:ad95]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 524f368b-da94-4cfb-7023-08d86a661539
x-ms-traffictypediagnostic: AT5PR8401MB1252:
x-microsoft-antispam-prvs: <AT5PR8401MB12524F381711242B2D804782A70A0@AT5PR8401MB1252.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sYC/auphg/t+5paxep8t1/XO2GlT0vHFqsum8nFMvyJDxnDXeJRw9ccHluy9G8P6XgRnzgRSruP9QKaZbfBKcbOr+nL/w/9s9A6MGqmi0jW/ltrKu/DhMuzvDYDevjHQBpezzbExFUzHZDzFM0Mhozb6P8bq+VjoZmkpwTCPJ6UwxyfsCc+w8a9nunlySkSZDDyUy//9jKkPDmADQgXPokTVcPj4TaY402ZLnCCI4TwXqP42Y6m2rXSmnsCeWdIcVPwktUea7abrMG9a6vzEt0jxu9eFMYvLrSsxnG4eDhlR1wttQLoSaNE3jAP2ehBsRKb8QyaoQ7oFwyBCTnhndA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AT5PR8401MB0641.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(346002)(366004)(39860400002)(136003)(376002)(396003)(478600001)(66946007)(4326008)(36756003)(71200400001)(316002)(6506007)(5660300002)(6486002)(6916009)(8676002)(186003)(6512007)(8936002)(86362001)(2616005)(66556008)(64756008)(66446008)(76116006)(66476007)(83380400001)(91956017)(33656002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 95qVyQubdqKjP/tcJQ7txVYAkBmA2uha2CWNmAICfSf79NOH/ieGmt9tNQOG1fWseY/Lp2+l/bLQj2yoCqN6SAMRLDR+2foBfNRYURLOptt4kPdi+R8TG1mC1xaMwJyx3+jIaKmcugkVwa6vUDjK1wLJvYXT2AxWNwK+aoTc/CXUeLWN8XGz+UcOzeywOXottNPMagWQXZV4Uw5ZsuWy+mQSfJzVOTicxz+lfinyOjVWeEbuP4Z5j/G5/HLbecaqUTRYnr7sNUYBmFYJoLIU7rCoyLGu8ftWKtnHeRtiNpbECAlEXWSgDGj4B+XfhHWfYZ0NwGsFjA1fennxEmvlGwbZIt+K5FyPlytcxCcBycId7W2VZLEghZx1K5StVBSzpbnFsLz5zxk++3srluRI19c5a2Pg1qFqw3nz4shJE8iZ0T3oQtM0gntX+tEDF1hGw2NJZjsRVhOkPJGvS0lQ69vn9t5yOd/nO7mR8KwKnEN5mByzSpOJwi8GO1h4LpWEER+MEFObNE6Xk2mYxzbwZjCq6Sy0pkd+4pKdiuKmREuW9rKsTsuqorvZO2gxlFmtOlUg7x/wLebzLrxDSRkQqZku3ziviTHZxYV+NN10QMkQy9XbKSmQOsqvYpSzlHn0Qkyg5MslUf/AOXwt2rM4EvkklKh4RxPzIhnPcernS7vNlOQm/QzuRMRoZsoIt8+tlpQXREydAqEHLGDRxkAXJA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F75A0BA492586469B43F9A31275527D@NAMPRD84.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AT5PR8401MB0641.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 524f368b-da94-4cfb-7023-08d86a661539
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2020 02:09:54.6660 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GIMwGsZdsn5+ZnJLQrb9Vfya0mRLNGlVOZxHaWuGIodnIUbd+SFLuVm+lHMwHpyHae9Cf5ECdfUeEyW5bEQKDxq1GLaFegMp/y7qofC71H0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AT5PR8401MB1252
X-OriginatorOrg: hpe.com
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-07_03:2020-10-06,
 2020-10-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 clxscore=1011 lowpriorityscore=0 phishscore=0 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010070011
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgUGF0cmljaywNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suIEkgd2lsbCBmb2xsb3cgeW91
ciByZWNvbW1lbmRhdGlvbnMuIEkgZGlkIGltcGxlbWVudGVkIG15IGluaXRpYWwgcmVjaXBlcyBi
eSB1c2luZyB0aGUgZXh0cmEgdXNlcnMgcGFyYW1zIHRvIGNyZWF0ZSB0aGUgdGVzdCB1c2VyLiBT
byBJIHdpbGwgaW50ZWdyYXRlIHRoYXQgaW50byBhIGJiY2xhc3MgYW5kIHByb3Bvc2UgYSBzb2x1
dGlvbiB0byB1cHN0cmVhbSB0aGlzIGNvZGUuDQoNCnZlam1hcmllDQoNCu+7v09uIDEwLzYvMjAs
IDc6MDEgUE0sICJQYXRyaWNrIFdpbGxpYW1zIiA8cGF0cmlja0BzdHdjeC54eXo+IHdyb3RlOg0K
DQogICAgT24gVHVlLCBPY3QgMDYsIDIwMjAgYXQgMDU6NDU6MDdQTSArMDAwMCwgVmVyZHVuLCBK
ZWFuLU1hcmllIHdyb3RlOg0KICAgIEhpIEpNLA0KDQogICAgPiBJIGxvb2tlZCBpbnRvIG9wZW5i
bWMgYW5kIGl0IGRvZXNu4oCZdCBzZWVtIHRoYXQgdGhlcmUgaXMgYW55IHN0YW5kYXJkIHJlY2lw
ZXMgdG8gY3JlYXRlIGEgdGVzdCB1c2VyIGFuZCBpbmplY3QgaW50byB0aGUgYWNjb3VudCBhIHB1
YmxpYyBrZXkuIERvZXMgSSBhbSB3cm9uZyA/IEkgd3JvdGUgYSB2ZXJ5IGJhc2ljIHJlY2lwZSB0
byBtYWtlIGl0IGhhcHBlbnMsIGFuZCB3YXMgd29uZGVyaW5nIGlmIGl0IGNvdWxkIGJlIHJlbGV2
YW50IHRvIHVwc3RyZWFtIGl0ID8NCg0KICAgIFlvY3RvIGFscmVhZHkgaGFzIHRoZSAnZXh0cmF1
c2VycycgYmJjbGFzcywgd2hpY2ggaXMgdHlwaWNhbGx5IGluaGVyaXRlZA0KICAgIGJ5IGFuIGlt
YWdlIGluIG9yZGVyIHRvIGFkZCBhZGRpdGlvbmFsIHVzZXJzLiAgV2hhdCB5b3UgYXJlIGFza2lu
ZyBmb3INCiAgICBpcyBzbGlnaHRseSBtb3JlIHRoYW4gdGhhdCBiZWNhdXNlIHlvdSBhbHNvIHdh
bnQgYW4gU1NIIHB1YmtleSwgYnV0IGl0DQogICAgZG9lc24ndCBzZWVtIHRvIHN1cHBvcnQgdGhh
dCBvdXQgb2YgdGhlIGJveCAoaXQgYXBwZWFycyBhcyBpZg0KICAgIEVYVFJBX1VTRVJTX1BBUkFN
UyBpcyBhIHZhcmlhYmxlIGNvbnRhaW5pbmcgYSBzaGVsbC1zbmlwcGV0LCBidXQgdGhlDQogICAg
YmJjbGFzcyBleHBsaWNpdGx5IHByb2hpYml0cyBhcmJpdHJhcnkgY29tbWFuZHMpLiAgSSB0aGlu
ayB5b3UgY291bGQgYWRkDQogICAgYSBuZXcgcGFja2FnZSB0byBhZGQgeW91ciBTU0gga2V5IHRo
b3VnaC4NCg0KICAgIFdoYXQgSSB3b3VsZCBzdWdnZXN0IHlvdSBkbyBpczoNCg0KICAgICAgICAt
IENyZWF0ZSBhIGJiY2xhc3MgdGhhdDoNCiAgICAgICAgICAgIDEuIGxldmVyYWdlcyBFWFRSQV9V
U0VSU19QQVJBTVMgdG8gYWRkIHlvdXIgdGVzdCB1c2VyLg0KICAgICAgICAgICAgMi4gYWRkcyBh
IHBhY2thZ2UgdG8gdGhlIGltYWdlIFJERVBFTkRTIHRvIGluY2x1ZGUgeW91ciB0ZXN0IHNzaCBr
ZXlzLg0KDQogICAgICAgIC0gU3VibWl0IHNhaWQgYmJjbGFzcyB1cHN0cmVhbSBoZXJlLg0KDQog
ICAgICAgIC0gV2hlbiB5b3UgYnVpbGQgeW91ciB0ZXN0IGltYWdlcywgYXBwZW5kIHRvIGNvbmYv
bG9jYWwuY29uZiBhbg0KICAgICAgICAgIElOSEVSSVQgKz0gInlvdXItdGVzdC1rZXkuYmJjbGFz
cyIuDQoNCiAgICBUaGlzIHdpbGwgZ2l2ZSBvdGhlcnMgYSBwYXR0ZXJuIHRvIGZvbGxvdyBmb3Ig
b3RoZXIgbmV0d29ya3MgLw0KICAgIGNvbmZpZ3VyYXRpb25zIChieSB1cHN0cmVhbWluZyBpdCkg
YW5kIGFsbG93IHlvdSB0byBidWlsZCBzcGVjaWFsIGltYWdlcw0KICAgIGZvciB0ZXN0IHRoYXQg
aW5jbHVkZSB3aGF0IHlvdSB3YW50IGFuZCBtb3N0bHkgbGV2ZXJhZ2UgZXhpc3RpbmcgWW9jdG8N
CiAgICBob29rcy4NCg0KICAgIC0tIA0KICAgIFBhdHJpY2sgV2lsbGlhbXMNCg0K
