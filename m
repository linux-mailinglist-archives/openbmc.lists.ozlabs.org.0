Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 213A010B146
	for <lists+openbmc@lfdr.de>; Wed, 27 Nov 2019 15:27:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NNQJ1JdKzDqwT
	for <lists+openbmc@lfdr.de>; Thu, 28 Nov 2019 01:27:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=lenovo.com (client-ip=67.219.246.6;
 helo=mail1.bemta23.messagelabs.com; envelope-from=rli11@lenovo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NNNm1XKWzDqtt
 for <openbmc@lists.ozlabs.org>; Thu, 28 Nov 2019 01:25:59 +1100 (AEDT)
Received: from [67.219.246.81] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-6.bemta.az-b.us-east-1.aws.symcld.net id E4/DB-22122-5778EDD5;
 Wed, 27 Nov 2019 14:25:57 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLKsWRWlGSWpSXmKPExsWS8eIhr25p+71
 Ygz3TOC0OT21gsjjV8oLFgcljwqIDjB7nZyxkDGCKYs3MS8qvSGDN2PVwEmPBaoGKT8v7WBsY
 9/J2MXJxCAk0MEmc/DGLDcJ5zSjx5t8a9i5GTiBnH6PEzs+VIDabgJJEy6sVYHERgUSJx/8bG
 bsYOTiEBVwkviwRhAi7Skw6fZgZwjaS+LfqJSuIzSKgKnHi0XxGEJtXwFJiwoNdjBC75jFK7P
 74gA0kwSngKDH5wSewZkYBWYknC54xgdjMAuIS5y62gu2VEBCQWLLnPDOELSrx8vE/VghbQaJ
 5z2sWiHo9iRtTp7BB2NoSyxa+ZoZYLChxcuYTlgmMIrOQjJ2FpGUWkpZZSFoWMLKsYjRNKspM
 zyjJTczM0TU0MNA1NDTSNdI1NNdLrNJN0ist1k1NLC7RNdRLLC/WK67MTc5J0ctLLdnECIyjl
 AImwR2M7R/e6h1ilORgUhLl9fO6FyvEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgnduC1BOsCg1Pb
 UiLTMHGNMwaQkOHiUR3oBWoDRvcUFibnFmOkTqFKMxx4SXcxcxcxw8Om8RsxBLXn5eqpQ471q
 QUgGQ0ozSPLhBsFRziVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwrwfIFJ7MvBK4fa+ATmEC
 OoVp5i2QU0oSEVJSDUzn7PI/HOb+L+P12sBwq4zNggm3jjn9X5JylMWpaMXJWINd98ys+7hqd
 B68qzLSv5o1yWSPlnVcVAXjab3Yn9f4f+zMsyzQi2j+cGD3ghd2mUfSj2xfsmbrKpmIOQ4XHL
 OPvvTyzK6TklzwqP2h7wal3X8cw2UeXgu4wsR0Y/La0A8T5F2NW4XmXDm8xOL8JIWtOjXTd6x
 d+Wafyyopq/Dp5zw2+u1sVeuZ0+ixgClWqj7q8JmSDyJlDjrPalXtYn7lpPk/+d+ely9xqThq
 nvos7q7EmXvaMsrfvZ0+P7F3YtfFgwe6ha8FHbpq0bO3W1mRJ+ir7Fq+6gRvs7W3Xj09dKJnu
 fFJ9jzLuxsfzn+oxFKckWioxVxUnAgADwYrm7ADAAA=
X-Env-Sender: rli11@lenovo.com
X-Msg-Ref: server-14.tower-396.messagelabs.com!1574864756!15442!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24548 invoked from network); 27 Nov 2019 14:25:57 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.13)
 by server-14.tower-396.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Nov 2019 14:25:57 -0000
Received: from HKGWPEMAIL04.lenovo.com (unknown [10.128.3.72])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 58DFD16B3267EC1524C6;
 Wed, 27 Nov 2019 09:25:56 -0500 (EST)
Received: from HKGWPEMAIL04.lenovo.com (10.128.3.72) by
 HKGWPEMAIL04.lenovo.com (10.128.3.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1591.10; Wed, 27 Nov 2019 22:25:30 +0800
Received: from HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613]) by
 HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613%5]) with mapi id
 15.01.1591.008; Wed, 27 Nov 2019 22:25:30 +0800
From: Ivan Li11 <rli11@lenovo.com>
To: Matt Spinler <mspinler@linux.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: [External] Power-on monitor for phosphor-hwmon question
Thread-Topic: [External] Power-on monitor for phosphor-hwmon question
Thread-Index: AQHViNvz9OdLXZ460kajgXlfSVMf8KefRJjw
Date: Wed, 27 Nov 2019 14:25:30 +0000
Message-ID: <4a5d0d467dd34a72a61397118b38c16a@lenovo.com>
References: <c353f372a5ce45fdbe1172678d8c029d@lenovo.com>
 <82798e33e5a34f81ac30553c099ad964@lenovo.com>
 <24228a0e-1e29-d661-3cc1-585e9a0501a4@linux.ibm.com>
In-Reply-To: <24228a0e-1e29-d661-3cc1-585e9a0501a4@linux.ibm.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.128.115.1]
Content-Type: text/plain; charset="iso-8859-1"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> -----Original Message-----
> From: Matt Spinler <mspinler@linux.ibm.com>
> Sent: Tuesday, October 22, 2019 9:24 PM
> To: Ivan Li11 <rli11@lenovo.com>; openbmc@lists.ozlabs.org
> Subject: Re: [External] Power-on monitor for phosphor-hwmon question
>=20
>=20
>=20
> On 10/21/2019 6:02 AM, Ivan Li11 wrote:
> >
> > Hi Team,
> >
> > Does anyone have suggestion for this ?
> >
> Hi, you're right, it doesn't support that yet.=A0 We've had a few interna=
l
> discussions about how to handle that gracefully, though our platforms don=
't
> use sel-logger, but nothing solid came out of them and we don't have anyt=
hing
> scheduled yet.
>=20
> It would be easy enough to have a watch on the PGOOD property, and then d=
o
> you what you want, like maybe turning off the thresholds.
>=20
> I heard that the d-bus sensors repository has some sort of support for th=
is, but
> since we don't use it I'm not sure what all that entails. I think it may =
also force
> you to replace phosphor-inventor-manager with entity-manager.
>=20

Hi Matt,
We can use dbus-match mechanism in phosphor-hwmon to turn on/off the thresh=
olds just like what dbus-sensors repository does in the following link:
https://github.com/openbmc/dbus-sensors/blob/432d1edf7ac86f69558273307a59e4=
b1cf86b8a6/src/Utils.cpp#L141

If it's ok for you, I'll work on it and send patch for you review.
Please help to comment on it.

> > Thanks your great support in advance.
> >
> > *From:*openbmc <openbmc-bounces+rli11=3Dlenovo.com@lists.ozlabs.org>
> *On
> > Behalf Of *Ivan Li11
> > *Sent:* Friday, October 18, 2019 5:59 PM
> > *To:* openbmc@lists.ozlabs.org
> > *Subject:* [External] Power-on monitor for phosphor-hwmon question
> >
> > Hi Team,
> >
> > We found that there's no power-on monitor mechanism in
> phosphor-hwmon.
> >
> > https://github.com/openbmc/phosphor-hwmon
> >
> > And it will cause incorrect threshold logs to be added to journal log
> > by 'sel-logger' when system is in power off(S5) state.
> >
> > Is there any plan to implement it? Or other repository we can refer to =
?
> >
> > Thanks,
> >
> > Ivan
> >

