Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F8EE6B7A
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 04:32:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 471gJr5d1KzDqdW
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 14:32:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=lenovo.com (client-ip=67.219.246.212;
 helo=mail1.bemta23.messagelabs.com; envelope-from=liuyh21@lenovo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.212])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 471gJ16JWczDqZm
 for <openbmc@lists.ozlabs.org>; Mon, 28 Oct 2019 14:32:00 +1100 (AEDT)
Received: from [67.219.246.102] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-b.us-east-1.aws.symcld.net id AD/73-10730-D2166BD5;
 Mon, 28 Oct 2019 03:31:57 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKKsWRWlGSWpSXmKPExsWS8eIhj65O4rZ
 Yg1vdNhYz9j5gtlh68wqbxamWFywOzB63tzexeyzYVOpxfsZCxgDmKNbMvKT8igTWjO9n29kL
 tnFW/F15lrmB8Q17FyMnh5DAf0aJ9y+Duxi5gOyXjBI7X09hhXD2MErs3b0GyOHgYBPQlpi+P
 xWkQURAV+JacwsjSJhZIFli4oJKkLCwgIPE40eTmEDCIgKOEvv/8UNUW0mcWNvABmKzCKhKvJ
 jdwQpi8wpYSmxqeMYCcUKJxKtls5hAbE4BN4mGDUvATmMUkJWY9ug+WJxZQFxi7rRZYL0SAgI
 SS/acZ4awRSVePv4HFVeQmPF2C1S9jsSC3Z/YIGxtiWULXzND7BWUODnzCcsERtFZSMbOQtIy
 C0nLLCQtCxhZVjGaJhVlpmeU5CZm5ugaGhjoGhoa6RrpGprrJVbpJumVFuumJhaX6BrqJZYX6
 xVX5ibnpOjlpZZsYgTGWkoBk+AOxvYPb/UOMUpyMCmJ8j5M2RorxJeUn1KZkVicEV9UmpNafI
 hRhoNDSYI3I3ZbrJBgUWp6akVaZg4w7mHSEhw8SiK8BfFAad7igsTc4sx0iNQpRkuOCS/nLmL
 mOHh0HpA8uWrJImYhlrz8vFQpcd5/cUANAiANGaV5cONgqekSo6yUMC8jAwODEE9BalFuZgmq
 /CtGcQ5GJWFeIZC1PJl5JXBbXwEdxAR0ED/LZpCDShIRUlINTIGrfun7JMgX/N+vdITR8fH3d
 N9ZC1TvyDw1kHZzr5A75rjnZ+KEyjSv2ebneIU9Z/tmqCfN1pBqC+zTevy2SlF8icullWxXti
 /+G3ewofbPgeaN05L0Dl/r+p3w6XLqx5s/X2YESci3bfhz59EKl4jj36+6uB35yZM263LgiZS
 sNp4nO9595Q+Ti1pbK/l3VdRt/lP7lzNMzpT8WhMvy/z57NbpfV6x1yfqT2DfvCrHgVdlGi9H
 HxvbCudpu/wC5R0yGf6JMzzTW8CV9lO2YpKk15S19lt3tWbG22wpk38Qfy7twmfJV/2C/5xfl
 i/KZtnI/3V3hViE3c9ulf2hoZ0Gp2aEr4iwWSOzUeCylxJLcUaioRZzUXEiAEWUWKXIAwAA
X-Env-Sender: liuyh21@lenovo.com
X-Msg-Ref: server-15.tower-386.messagelabs.com!1572233516!129492!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18846 invoked from network); 28 Oct 2019 03:31:56 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.12)
 by server-15.tower-386.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Oct 2019 03:31:56 -0000
Received: from pekwpmail02.lenovo.com (unknown [10.96.93.80])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id BED9C94625D04D32FCB9;
 Sun, 27 Oct 2019 23:31:55 -0400 (EDT)
Received: from pekwpmail05.lenovo.com (10.96.93.83) by pekwpmail02.lenovo.com
 (10.96.93.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 28 Oct
 2019 11:31:47 +0800
Received: from pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf]) by
 pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf%7]) with mapi id
 15.01.1591.008; Mon, 28 Oct 2019 11:31:47 +0800
From: Yonghui YH21 Liu <liuyh21@lenovo.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: RE: [External]  Re: Lenvo IPMI OEM in openbmc Community
Thread-Topic: [External]  Re: Lenvo IPMI OEM in openbmc Community
Thread-Index: AdWEubyY9TnTQB25RuOFWcAeRb/jl///8IOA/+7j8TA=
Date: Mon, 28 Oct 2019 03:31:47 +0000
Message-ID: <8f534af6217744ee9c9fc00196156564@lenovo.com>
References: <34e9db59f8064625a90b4021de1e54dd@lenovo.com>
 <4FBBF668-7781-40EF-A469-ED3FD756ED36@fuzziesquirrel.com>
In-Reply-To: <4FBBF668-7781-40EF-A469-ED3FD756ED36@fuzziesquirrel.com>
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



> -----Original Message-----
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
> Sent: Thursday, October 17, 2019 10:13 PM
> To: Yonghui YH21 Liu <liuyh21@lenovo.com>
> Cc: openbmc@lists.ozlabs.org; Benjamin Fair <benjaminfair@google.com>
> Subject: [External] Re: Lenvo IPMI OEM in openbmc Community
>=20
> at 3:16 AM, Yonghui YH21 Liu <liuyh21@lenovo.com> wrote:
>=20
> > HI Brad,
> >          Now we are implementing some lenovo OEM commands based on
> below projects, could you help create lenovo-ipmi-oem repository for us?
> >          https://github.com/openbmc/openbmc/tree/master/meta-lenovo
> >
> > Thanks
>=20
> Is Lenovo OK with Apache-2.0?  I only ask because Lenovo deviated with th=
e
> license for its bitbake metadata.  The OpenBMC charter says that code mus=
t be
> Apache-2.0, with room for granting exceptions but I think it would be sim=
pler for
> everyone if Lenovo simply use Apache-2.0.  For the fine print, please hav=
e a
> look at the charter:
>=20
> https://www.openbmc.org/wp-content/uploads/sites/62/2018/03/charter_op
> enbmc_02142018.pdf
>=20
> specifically section 7.
 After internal check, it is OK with Apache-2.0.
 Thank your great support.
>=20
> thanks!
>=20
> -brad
