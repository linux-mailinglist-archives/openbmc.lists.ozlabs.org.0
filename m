Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 528C9BD78C
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 07:01:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dQrQ6GwSzDqhR
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 15:01:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.250.1; helo=mail1.bemta24.messagelabs.com;
 envelope-from=pyang4@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dQqV26PFzDqfr
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 15:00:36 +1000 (AEST)
Received: from [67.219.250.102] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-a.us-west-2.aws.symcld.net id 43/DE-26045-174FA8D5;
 Wed, 25 Sep 2019 05:00:33 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOKsWRWlGSWpSXmKPExsWSLveKTTf/S1e
 swZVT4haHd3hanGp5weLA5LF4z0smj/MzFjIGMEWxZuYl5VcksGb82D+RrWADc8Wx3XvYGhhf
 M3UxcnIICTQwSUx8FQphv2aUOHYvGcLexygx7aEOiM0moCIxZ+kOFhBbREBN4uzc48wgNrOAp
 cTmj5fYQWxhASOJwz17oWqMJT72TGSHsK0kpu+aAxTn4GARUJV4NdkfJMwL1Lr4/0NWiFXZEk
 3X7oOVcwrYSty//hLsNEYBMYnvp9YwQawSlzh3sRWsRkJAQGLJnvPMELaoxMvH/1ghbAWJ5j2
 vWSDqdSQW7P7EBmFrSyxb+JoZYq+gxMmZT1gmMIrOQjJ2FpKWWUhaZiFpWcDIsorRPKkoMz2j
 JDcxM0fX0MBA19DQSNfQ2EDX2EQvsUo3Ua+0WLc8tbhE10gvsbxYr7gyNzknRS8vtWQTIzC2U
 gqalHYwnpn1Ru8QoyQHk5Io76WFXbFCfEn5KZUZicUZ8UWlOanFhxhlODiUJHgrPgLlBItS01
 Mr0jJzgHEOk5bg4FES4eX6DJTmLS5IzC3OTIdInWI05pjwcu4iZo6DR+ctYhZiycvPS5US533
 /CahUAKQ0ozQPbhAs/VxilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMxrDLKQJzOvBG7fK6BT
 mIBOUXbuBDmlJBEhJdXAxPU1aP0aJeUyM4Hq3VsTg461rtnsnF3Ovj+g9zW/76PCp2pmocuKI
 jMTb8lpPzxzaHvorw+tuu6xbwI+/DVxX8wXu3ACH4P89uLSKb62V4+esqznmbns/NUd9kUaxV
 K7ZlzZveHo+433/Q9bT2jav7ilplIogL1/LduJTXsncCr3nTh71exvSirDIhH+R8pBV9bybfu
 r9dOqsLXNzbinoXXDj/D1gg+8pl7I/DqD+e5X+94eidxSRtarHK1dH3kUGLMtqp022ez2rwgO
 9yq3di3veG3FJGARLGXdYn02KDpFJWfxkTZDp6dKIg+fzHqzK5zrqdUNbWOGteseHrSonf76z
 8nQhz8CJjLOihRTYinOSDTUYi4qTgQAQGL2J7oDAAA=
X-Env-Sender: pyang4@lenovo.com
X-Msg-Ref: server-27.tower-326.messagelabs.com!1569387628!17103!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23502 invoked from network); 25 Sep 2019 05:00:31 -0000
Received: from unknown (HELO apsmtp.lenovo.com) (103.30.234.6)
 by server-27.tower-326.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Sep 2019 05:00:31 -0000
Received: from HKGWPEMAIL02.lenovo.com (unknown [10.128.3.70])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 2BD73E8170D3EF6FE83C;
 Wed, 25 Sep 2019 13:00:28 +0800 (CST)
Received: from HKGWPEMAIL04.lenovo.com (10.128.3.72) by
 HKGWPEMAIL02.lenovo.com (10.128.3.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1591.10; Wed, 25 Sep 2019 13:00:27 +0800
Received: from HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613]) by
 HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613%5]) with mapi id
 15.01.1591.008; Wed, 25 Sep 2019 13:00:27 +0800
From: Payne Yang <pyang4@lenovo.com>
To: "Tanous, Ed" <ed.tanous@intel.com>
Subject: RE: [External]  Re: Question for upstream
Thread-Topic: [External]  Re: Question for upstream
Thread-Index: AdVzS8dMMm/mx/KnSbqgbxHwkKZVJwABvzMtAAKqmhA=
Date: Wed, 25 Sep 2019 05:00:27 +0000
Message-ID: <4f41e599eba54f1cb2a85defacd42578@lenovo.com>
References: <6bb44c8941db46efb2e7e2a0da39d2db@lenovo.com>
 <4053AD86-2951-40CD-93D2-FEB381B7B14A@intel.com>
In-Reply-To: <4053AD86-2951-40CD-93D2-FEB381B7B14A@intel.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.128.115.1]
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tanous,

Got it.
By the way, I have to include a specific fpga library in this implementatio=
n.
Should I update it also ?

> -----Original Message-----
> From: Tanous, Ed <ed.tanous@intel.com>
> Sent: Wednesday, September 25, 2019 11:39 AM
> To: Payne Yang <pyang4@lenovo.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: [External] Re: Question for upstream
>=20
> Create a gerrit review on dbus-sensors with your implementation.
