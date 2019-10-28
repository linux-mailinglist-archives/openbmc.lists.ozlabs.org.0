Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B65E7335
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 15:03:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 471xJS3HyHzDrCt
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 01:03:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=lenovo.com (client-ip=67.219.250.118;
 helo=mail1.bemta24.messagelabs.com; envelope-from=liuyh21@lenovo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 471xD726f9zDrDD
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 00:59:33 +1100 (AEDT)
Received: from [67.219.250.198] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-7.bemta.az-b.us-west-2.aws.symcld.net id 9C/57-08044-144F6BD5;
 Mon, 28 Oct 2019 13:59:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPKsWRWlGSWpSXmKPExsWS8eIhj67Dl22
 xBtN/mVrM2PuA2WLpzStsFqdaXrA4MHvc3t7E7rFgU6nH+RkLGQOYo1gz85LyKxJYM56+ti1o
 Yq5Y9uYyWwPjaaYuRk4OIYEGJom7XYpdjFxA9mtGiXkzHzBDOHsYJWb0vmHsYuTgYBPQlpi+P
 xWkQURAV+JacwtYmFkgWWLigkqQsLCAg8TjR5OYQMIiAo4S+//xQ1S7SSzrm8QOYrMIqEq8mb
 SYHaSEV8BSYssXc4hF9xgl9i1rZgGJcwLVz1ylDlLOKCArMe3RfbArmQXEJeZOm8UKYksICEg
 s2XOeGcIWlXj5+B9UXEFixtstUPU6Egt2f2KDsLUlli18DVbPKyAocXLmE5YJjKKzkIydhaRl
 FpKWWUhaFjCyrGI0TyrKTM8oyU3MzNE1NDDQNTQ00jU0NtU1sdBLrNJN0ist1i1PLS7RNdJLL
 C/WK67MTc5J0ctLLdnECIy1lIJ2gx2MrV/f6h1ilORgUhLlDX24LVaILyk/pTIjsTgjvqg0J7
 X4EKMMB4eSBO+WT0A5waLU9NSKtMwcYNzDpCU4eJREeJ+ApHmLCxJzizPTIVKnGI05Jrycu4i
 Z4+DReYuYhVjy8vNSpcR5j4CUCoCUZpTmwQ2CpaNLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkY
 lYR5/4NM4cnMK4Hb9wroFCagU/hZNoOcUpKIkJJqYFrC/2Npk8aVSl+TtNVxxsZzDmYfO9P2V
 8NK+ldawPe5O85P0L+u/Zl3Tole+mqBxr372Zaa+Kk805/vvDQkeZ5Yj29A4aGIvjeffY2+sE
 luW7RJRCJ3z7KO+oB65sJ03kNKE1wCqoMfr54UMPvsJrFsqW7NYztSBMQkxV8/4FWKyNz4wE9
 HYGmA6lSDSOkIM7mvktIq67///nR+1elj36MXr96/8dzk431ecWsnxQRkzNDKsDv85ka48+yH
 +s+cN3VnC72uzWBI9Z1zpv56XMk+YRF2iSs/TAxqVKvnmE/ovLCt+WB7Pc8FPw8pwQ0bnaZmJ
 3rsX3RzkqPg7qpOq4R//Sx3+b5eSLCfc/TXKSWW4oxEQy3mouJEANIpHZ3CAwAA
X-Env-Sender: liuyh21@lenovo.com
X-Msg-Ref: server-18.tower-346.messagelabs.com!1572271167!7495!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19256 invoked from network); 28 Oct 2019 13:59:28 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.12)
 by server-18.tower-346.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Oct 2019 13:59:28 -0000
Received: from pekwpmail08.lenovo.com (unknown [10.96.81.160])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 9B5088AFCA3F4C8A4A5C;
 Mon, 28 Oct 2019 09:59:26 -0400 (EDT)
Received: from pekwpmail05.lenovo.com (10.96.81.230) by pekwpmail08.lenovo.com
 (10.96.81.160) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 28 Oct
 2019 21:59:24 +0800
Received: from pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf]) by
 pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf%7]) with mapi id
 15.01.1591.008; Mon, 28 Oct 2019 21:59:24 +0800
From: Yonghui YH21 Liu <liuyh21@lenovo.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: RE: [External]  Re: Lenvo IPMI OEM in openbmc Community
Thread-Topic: [External]  Re: Lenvo IPMI OEM in openbmc Community
Thread-Index: AdWEubyY9TnTQB25RuOFWcAeRb/jl///8IOA/+7j8TCAIlyjAP//dNNA
Date: Mon, 28 Oct 2019 13:59:24 +0000
Message-ID: <182c2c3d39a0453cb153108f63264c81@lenovo.com>
References: <34e9db59f8064625a90b4021de1e54dd@lenovo.com>
 <4FBBF668-7781-40EF-A469-ED3FD756ED36@fuzziesquirrel.com>
 <8f534af6217744ee9c9fc00196156564@lenovo.com>
 <FCBC9D56-73CC-486A-85B8-8623A72BB932@fuzziesquirrel.com>
In-Reply-To: <FCBC9D56-73CC-486A-85B8-8623A72BB932@fuzziesquirrel.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.96.12.251]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Brad,
	Thank your great support!

> -----Original Message-----
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
> Sent: Monday, October 28, 2019 9:41 PM
> To: Yonghui YH21 Liu <liuyh21@lenovo.com>
> Cc: openbmc@lists.ozlabs.org; Benjamin Fair <benjaminfair@google.com>
> Subject: Re: [External] Re: Lenvo IPMI OEM in openbmc Community
>=20
> lenovo-ipmi-oem created.
>=20
> thx - brad
