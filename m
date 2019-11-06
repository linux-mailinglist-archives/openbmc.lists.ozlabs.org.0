Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D498FF102E
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 08:26:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477J4g6mxHzF5bP
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 18:26:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=lenovo.com (client-ip=67.219.246.117;
 helo=mail1.bemta23.messagelabs.com; envelope-from=rli11@lenovo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477J3y73fjzF5b1
 for <openbmc@lists.ozlabs.org>; Wed,  6 Nov 2019 18:26:05 +1100 (AEDT)
Received: from [67.219.246.198] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-6.bemta.az-c.us-east-1.aws.symcld.net id 7A/C3-20095-A8572CD5;
 Wed, 06 Nov 2019 07:26:02 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRWlGSWpSXmKPExsWSLveKXber9FC
 swcMVnBYvpixitDg8tYHJ4lTLCxYHZo8Jiw4wesw7GehxfsZCxgDmKNbMvKT8igTWjFV/0gs+
 Cld8PPiNrYFxlUAXIxeHkEADk8Tle50sEM4rRonXl46ydzFyAjl7GSXmzgkGsdkElCRaXq1gB
 ykSEehllDjaM5Oxi5GDQ1jAReLLEkGQGhEBV4lJpw8zQ9hWEpe7/zGC2CwCKhKrVs1gBinnFb
 CUmP69EGLXNUaJN1tfs4DUcAo4S7Qs3g5WzyggK/FkwTMmEJtZQFzi3MVWsHskBAQkluw5zwx
 hi0q8fPyPFcJWkGjeAzGHWUBP4sbUKWwQtrbEsoWvwep5BQQlTs58wjKBUWQWkrGzkLTMQtIy
 C0nLAkaWVYxmSUWZ6RkluYmZObqGBga6hoZGumZA0lAvsUo3Wa+0WDc1sbhEF8gtL9YrrsxNz
 knRy0st2cQIjKyUArb8HYwNX9/qHWKU5GBSEuX1yjwYK8SXlJ9SmZFYnBFfVJqTWnyIUYaDQ0
 mC917xoVghwaLU9NSKtMwcYJTDpCU4eJREeJ+XAKV5iwsSc4sz0yFSpxiNOSa8nLuImePg0Xm
 LmIVY8vLzUqXEeb1BSgVASjNK8+AGwZLPJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvFog
 U3gy80rg9gGTCNAXIrw+j/eBnFKSiJCSamAyCyk57HhgQ5PgXFmttz3Tzlmv91hRt/CKmMvE0
 gPvti96t7ry5DOHujJtfi7hiUJnhXlzNaYXGdfLf5/OcvGOpWyOwsFDv9+V+zOvuM1/yGTG97
 sbD2wOlOSe5WSoU5ry9oTXA7MfZtF/+exWmN9P5L/28MjCO8zO3Xp33gdO9mWaGWIp8u+diPR
 nFpv68/Pdnx3YNH+1+F5TRwWOytVeAVf5l+6uPOB28KWVgoj/axXRrsPP1WbOLdzkWZGdKHT4
 Ma/+s7UfM813XLNRZJmidaG1Yd/dM1+k3mxe3DbPb+/ajHuXGPrMXLk35HJLBvPNeHangGX7X
 DGZJ5JzO6129afttIuZJzv14H+Gbq2PSizFGYmGWsxFxYkAsRkuirkDAAA=
X-Env-Sender: rli11@lenovo.com
X-Msg-Ref: server-14.tower-406.messagelabs.com!1573025159!65847!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19692 invoked from network); 6 Nov 2019 07:26:01 -0000
Received: from unknown (HELO apsmtp.lenovo.com) (103.30.234.7)
 by server-14.tower-406.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Nov 2019 07:26:01 -0000
Received: from HKGWPEMAIL02.lenovo.com (unknown [10.128.3.70])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 56CA1678323118FB1085;
 Wed,  6 Nov 2019 15:25:59 +0800 (CST)
Received: from HKGWPEMAIL04.lenovo.com (10.128.3.72) by
 HKGWPEMAIL02.lenovo.com (10.128.3.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1591.10; Wed, 6 Nov 2019 15:25:59 +0800
Received: from HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613]) by
 HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613%5]) with mapi id
 15.01.1591.008; Wed, 6 Nov 2019 15:25:36 +0800
From: Ivan Li11 <rli11@lenovo.com>
To: James Feist <james.feist@linux.intel.com>, Matt Spinler
 <mspinler@linux.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: [External] Power-on monitor for phosphor-hwmon question
Thread-Topic: [External] Power-on monitor for phosphor-hwmon question
Thread-Index: AQHViNvz9OdLXZ460kajgXlfSVMf8KdmSTSAgBeGTaA=
Date: Wed, 6 Nov 2019 07:25:36 +0000
Message-ID: <25d62ba90109494e97119222fd015d84@lenovo.com>
References: <c353f372a5ce45fdbe1172678d8c029d@lenovo.com>
 <82798e33e5a34f81ac30553c099ad964@lenovo.com>
 <24228a0e-1e29-d661-3cc1-585e9a0501a4@linux.ibm.com>
 <97ba4063-0066-4ba5-bd98-03f1b6aa63dd@linux.intel.com>
In-Reply-To: <97ba4063-0066-4ba5-bd98-03f1b6aa63dd@linux.intel.com>
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
> From: James Feist <james.feist@linux.intel.com>
> Sent: Tuesday, October 22, 2019 11:51 PM
> To: Matt Spinler <mspinler@linux.ibm.com>; Ivan Li11 <rli11@lenovo.com>;
> openbmc@lists.ozlabs.org
> Subject: Re: [External] Power-on monitor for phosphor-hwmon question
>=20
> On 10/22/19 6:23 AM, Matt Spinler wrote:
> >
> >
> > On 10/21/2019 6:02 AM, Ivan Li11 wrote:
> >>
> >> Hi Team,
> >>
> >> Does anyone have suggestion for this ?
> >>
> > Hi, you're right, it doesn't support that yet.=A0 We've had a few
> > internal discussions about how to handle that gracefully, though our
> > platforms don't use sel-logger, but nothing solid came out of them and
> > we don't have anything scheduled yet.
> >
> > It would be easy enough to have a watch on the PGOOD property, and
> > then do you what you want, like maybe turning off the thresholds.
> >
> > I heard that the d-bus sensors repository has some sort of support for
> > this, but since we don't use it I'm not sure what all that entails. I
> > think it may also force you to replace phosphor-inventor-manager with
> > entity-manager.
>=20
> It should force you to switch 100%, but you would at least have to run bo=
th.
>=20
> Here's what dbus-sensors does:
>=20
> https://github.com/openbmc/dbus-sensors/blob/432d1edf7ac86f69558273307
> a59e4b1cf86b8a6/src/Utils.cpp#L141
>=20
> Basically just a dbus-match that sets a "powerStatusOn" bool that can be
> queried. Depending on the sensor type thresholds don't get crossed if tha=
t bool
> is set. We also have a similar bool for bios post, as some sensors come u=
p later
> after power on.
>=20

I try to use dbus-sensors and set "powerStatusOn" bool, but still have inco=
rrect threshold logs during power on(S0) to power off(S5) state.=20
Could you help to comment on it ?

> >
> >> Thanks your great support in advance.
> >>
> >> *From:*openbmc <openbmc-bounces+rli11=3Dlenovo.com@lists.ozlabs.org>
> *On
> >> Behalf Of *Ivan Li11
> >> *Sent:* Friday, October 18, 2019 5:59 PM
> >> *To:* openbmc@lists.ozlabs.org
> >> *Subject:* [External] Power-on monitor for phosphor-hwmon question
> >>
> >> Hi Team,
> >>
> >> We found that there's no power-on monitor mechanism in
> phosphor-hwmon.
> >>
> >> https://github.com/openbmc/phosphor-hwmon
> >>
> >> And it will cause incorrect threshold logs to be added to journal log
> >> by 'sel-logger' when system is in power off(S5) state.
> >>
> >> Is there any plan to implement it? Or other repository we can refer to=
 ?
> >>
> >> Thanks,
> >>
> >> Ivan
> >>
> >
