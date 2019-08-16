Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A108FDBE
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 10:24:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468xFf3pNfzDrT0
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 18:24:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nokia-sbell.com
 (client-ip=116.246.26.71; helo=cnshjsmin03.alcatel-sbell.com.cn;
 envelope-from=hongjiang.jiang@nokia-sbell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=nokia-sbell.com
Received: from cnshjsmin03.alcatel-sbell.com.cn
 (cnshjsmin03.app.nokia-sbell.com [116.246.26.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468xDc6BSZzDrRt
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 18:23:54 +1000 (AEST)
X-AuditID: ac189297-82bff7000001426c-d8-5d566814fa05
Received: from CNSHPPEXCH1610.nsn-intra.net (Unknown_Domain [135.251.51.110])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by cnshjsmin03.alcatel-sbell.com.cn (Symantec Messaging Gateway) with SMTP id
 B0.5D.17004.418665D5; Fri, 16 Aug 2019 16:23:48 +0800 (HKT)
Received: from CNSHPPEXCH1608.nsn-intra.net (135.251.51.108) by
 CNSHPPEXCH1610.nsn-intra.net (135.251.51.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 16 Aug 2019 16:23:48 +0800
Received: from CNSHPPEXCH1608.nsn-intra.net ([135.251.51.108]) by
 CNSHPPEXCH1608.nsn-intra.net ([135.251.51.108]) with mapi id 15.01.1713.007;
 Fri, 16 Aug 2019 16:23:48 +0800
From: "Jiang, Hongjiang (NSB - CN/Hangzhou)" <hongjiang.jiang@nokia-sbell.com>
To: =?utf-8?B?RGF2aWQgTcO8bGxlciAoRUxTT0ZUIEFHKQ==?= <d.mueller@elsoft.ch>
Subject: RE: OpenBMC version 2.7 run in target S2600WF shows BMC not
 ready(xyz.openbmc_project.State.BMC.BMCState.NotReady)
Thread-Topic: OpenBMC version 2.7 run in target S2600WF shows BMC not
 ready(xyz.openbmc_project.State.BMC.BMCState.NotReady)
Thread-Index: AdVT3ZEukedA3dGJSGWK1wT9lcYZif//wJcA//931fA=
Date: Fri, 16 Aug 2019 08:23:48 +0000
Message-ID: <03edb9afa89345ec90f2b711ef0c3d73@nokia-sbell.com>
References: <e336595b3dbf4162a4bfb8a8880077d2@nokia-sbell.com>
 <38c0bc79-4ffe-c9c5-423c-b6a98f0dcd58@elsoft.ch>
In-Reply-To: <38c0bc79-4ffe-c9c5-423c-b6a98f0dcd58@elsoft.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [135.251.51.115]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeLIzCtJLcpLzFFi42Jp/22cpyuSERZrcOCVkcWCw83MFqdaXrA4
 MHk0bX3E7HF+xkLGAKYoLpuU1JzMstQifbsEroy/zdfYCy5wVaw4+5utgXENVxcjJ4eEgIlE
 w8EVbF2MXBxCAseZJG4t38sE4fxllPjcuZYZwtnEKLHpew8rSAubgJ/E46ungKo4OEQEvCTe
 L2AECTMLWEps/niJHcQWFqiVmPymC8wWEaiTaFvewAxhW0l8eXiIBcRmEVCVOPpwMROIzStg
 J7G/YQlYXEigUOLhuc1gvZwCthKTvy8Dm88oICbx/dQaJohd4hK3nsxngvhAQGLJnvPMELao
 xMvH/1hBTpMQUJLo2wB2JbOApsT6XfoQnYoSU7ofskNsFZQ4OfMJywRGsVlIhs5C6JiFpGMW
 ko4FjCyrGKWT84ozsopzM/MMjPXy8rMzE3WLk1JzcvSS83M3MQLjaI3EpOk7GI8d8D7EKMDB
 qMTDm5ETGivEmlhWXJl7iFGCg1lJhHfCxaBYId6UxMqq1KL8+KLSnNTiQ4zSHCxK4ry/W51i
 hQTSE0tSs1NTC1KLYLJMHJxSDYzRYY5v/A6HJ3PH+Fy1f9xa8ciiKWn65vkMkRuTC/mtn9fG
 LFIwWufAfpNxqrBlMX/5HKUetoQadV7niXXXuBIv318TZOfl1HjrYHyzxuOdisYL72jenSDV
 Wec8earq3f4fj2d8zjhhwdyioSOoXx27cM87zyPrQ+Irni+4e4j/O9OHgDsOHUosxRmJhlrM
 RcWJAJLxEUOfAgAA
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

SGksDQoNClRoYW5rcyBmb3IgeW91ciBpbmZvLiBJIHdpbGwgY2hlY2sgdGhpcyBwYWNrYWdlIGFu
ZCBzZWUgaWYgSSBjYW4gZG8gc29tZSBoYWNraW5n8J+Yig0KDQoNCkJlc3QgUmVnYXJkcywNCkpp
YW5nIEhvbmdqaWFuZw0KDQpOb2tpYQ0KDQoNCkppYW5nIEhvbmdqaWFuZw0KDQoNCg0KKzg2IDEz
NjY2NjY5NDAzDQoNCg0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBEYXZp
ZCBNw7xsbGVyIChFTFNPRlQgQUcpIDxkLm11ZWxsZXJAZWxzb2Z0LmNoPiANClNlbnQ6IEZyaWRh
eSwgQXVndXN0IDE2LCAyMDE5IDM6MDUgUE0NClRvOiBKaWFuZywgSG9uZ2ppYW5nIChOU0IgLSBD
Ti9IYW5nemhvdSkgPGhvbmdqaWFuZy5qaWFuZ0Bub2tpYS1zYmVsbC5jb20+DQpDYzogb3BlbmJt
Y0BsaXN0cy5vemxhYnMub3JnDQpTdWJqZWN0OiBSZTogT3BlbkJNQyB2ZXJzaW9uIDIuNyBydW4g
aW4gdGFyZ2V0IFMyNjAwV0Ygc2hvd3MgQk1DIG5vdCByZWFkeSh4eXoub3BlbmJtY19wcm9qZWN0
LlN0YXRlLkJNQy5CTUNTdGF0ZS5Ob3RSZWFkeSkNCg0KSGVsbG8NCg0KSmlhbmcsIEhvbmdqaWFu
ZyAoTlNCIC0gQ04vSGFuZ3pob3UpIHdyb3RlOg0KDQo+IEN1cnJlbnRseSBJIGNvbXBpbGVkIE9w
ZW5CTUMgdGFnIDIuNy0wIHdpdGggbWFjaGluZSB0YXJnZXQgUzI2MDBXRiggYXMgDQo+IEkgaGF2
ZSBvbmx5IHdvbGZwYXNzIHNlcnZlciBpbiBoYW5kKSwgYW5kIGZsYXNoIGl0IHRvIGEgcmVhbCBT
MjYwMFdGIHNlcnZlci4NCg0KQXMgZmFyIGFzIEkgY2FuIHNlZSBzdXBwb3J0IGZvciB0aGUgSW50
ZWwgczI2MDB3ZiBib2FyZCBpcyBjdXJyZW50bHkgYnJva2VuIGFzIGl0IHVzZXMgdGhlIChubyBs
b25nZXIgd29ya2luZykgeDg2LXBvd2VyLWNvbnRyb2wgcGFja2FnZS4NCg0KUGxlYXNlIHNlZSBo
dHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy94ODYtcG93ZXItY29udHJvbC9pc3N1ZXMvMSBmb3Ig
bW9yZSBkZXRhaWxzLg0KDQpEYXZlDQo=
