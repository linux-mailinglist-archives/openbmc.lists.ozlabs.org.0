Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD55710EC25
	for <lists+openbmc@lfdr.de>; Mon,  2 Dec 2019 16:16:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RTGX71XhzDq9H
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2019 02:16:20 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RTFs3zGbzDqNH
 for <openbmc@lists.ozlabs.org>; Tue,  3 Dec 2019 02:15:44 +1100 (AEDT)
Received: from [67.219.246.102] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-6.bemta.az-b.us-east-1.aws.symcld.net id BA/54-22122-D9A25ED5;
 Mon, 02 Dec 2019 15:15:41 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIKsWRWlGSWpSXmKPExsWS8eIhj+4crae
 xBvtWWlscntrAZHGq5QWLA5PHhEUHGD3Oz1jIGMAUxZqZl5RfkcCa0XFpJnvBA+GK1nsbGBsY
 uwW6GLk4hAQamCT6Pk1ihnBeMUq0L/3PAuHsZZRYcmIjWxcjJwebgJJEy6sV7CC2iECixOP/j
 YxdjBwcwgIuEl+WCEKEXSUmnT7MDBIWEbCSeNxpBGKyCKhI/H8gBlLBK2ApsfXNY1aI6fMZJS
 Y+eMsIkmAUkJV4suAZE4jNLCAuce5iK9gmCQEBiSV7zjND2KISLx//Y4WwFSSa97xmgajXk7g
 xdQobhK0tsWzha2aIZYISJ2c+YZnAKDwLydhZSFpmIWmZhaRlASPLKkazpKLM9IyS3MTMHF1D
 AwNdQ0MjXUNdQxNjvcQq3SS90mLd1MTiEl1DvcTyYr3iytzknBS9vNSSTYzAeEkpYOzfwfjt6
 1u9Q4ySHExKorx/Pz+JFeJLyk+pzEgszogvKs1JLT7EKMPBoSTB+1b1aayQYFFqempFWmYOMH
 Zh0hIcPEoivKs0gdK8xQWJucWZ6RCpU4zGHBNezl3EzHHw6LxFzEIsefl5qVLivCwgpQIgpRm
 leXCDYCnlEqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXiGQKTyZeSVw+4CpAugLEV7zlkcg
 p5QkIqSkGpgcs134Z+9ILtu93+T7Nz2vWPevfyqPnVpoojN3uevPuw1nMiaUMkRNL5ia2r7rR
 oz8un9hUZsbt3OJMhavNGZaErdp1fWHDtwLV+z1Xx+5de5r4ezwl8zzN17c+bjZ5FnZ181fyi
 +lpjZGlobz/W3L/rvKWXVjBp+Q8K1V7Tv7+go59b28p159W+R8LMjWzjbVUeGSzk2NfC1d/z1
 WdbeFJu5l/78yha3pZV981C3p7oWzzJd0bj2oEDv3mPP5y8cjHhQ0FZyzNaotn29tteFZ2R5P
 dbkrd3/VJHmZ9UT4FQXdeXRmmWTPrHeXj64O2B7I1tZZ/my1hI70Ge1L10Pv8e0WObljfd+pa
 x/rhQWUWIozEg21mIuKEwGtrlm5pAMAAA==
X-Env-Sender: rli11@lenovo.com
X-Msg-Ref: server-30.tower-386.messagelabs.com!1575299740!342594!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13570 invoked from network); 2 Dec 2019 15:15:40 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.12)
 by server-30.tower-386.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Dec 2019 15:15:40 -0000
Received: from HKGWPEMAIL01.lenovo.com (unknown [10.128.3.69])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 264EB8C557D83AA08E70;
 Mon,  2 Dec 2019 10:15:39 -0500 (EST)
Received: from HKGWPEMAIL04.lenovo.com (10.128.3.72) by
 HKGWPEMAIL01.lenovo.com (10.128.3.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1591.10; Mon, 2 Dec 2019 12:15:35 -0300
Received: from HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613]) by
 HKGWPEMAIL04.lenovo.com ([fe80::f1ef:1ffe:9927:6613%5]) with mapi id
 15.01.1591.008; Mon, 2 Dec 2019 23:15:21 +0800
From: Ivan Li11 <rli11@lenovo.com>
To: Matt Spinler <mspinler@linux.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: [External] Power-on monitor for phosphor-hwmon question
Thread-Topic: [External] Power-on monitor for phosphor-hwmon question
Thread-Index: AQHViNvz9OdLXZ460kajgXlfSVMf8KefRJjwgAfloOA=
Date: Mon, 2 Dec 2019 15:15:21 +0000
Message-ID: <e1d67f474f6b4be2b28a583a9c848741@lenovo.com>
References: <c353f372a5ce45fdbe1172678d8c029d@lenovo.com>
 <82798e33e5a34f81ac30553c099ad964@lenovo.com>
 <24228a0e-1e29-d661-3cc1-585e9a0501a4@linux.ibm.com> 
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
> From: Ivan Li11
> Sent: Wednesday, November 27, 2019 10:26 PM
> To: 'Matt Spinler' <mspinler@linux.ibm.com>; openbmc@lists.ozlabs.org
> Subject: RE: [External] Power-on monitor for phosphor-hwmon question
>=20
> > -----Original Message-----
> > From: Matt Spinler <mspinler@linux.ibm.com>
> > Sent: Tuesday, October 22, 2019 9:24 PM
> > To: Ivan Li11 <rli11@lenovo.com>; openbmc@lists.ozlabs.org
> > Subject: Re: [External] Power-on monitor for phosphor-hwmon question
> >
> >
> >
> > On 10/21/2019 6:02 AM, Ivan Li11 wrote:
> > >
> > > Hi Team,
> > >
> > > Does anyone have suggestion for this ?
> > >
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
> entity-manager.
> >
>=20
> Hi Matt,
> We can use dbus-match mechanism in phosphor-hwmon to turn on/off the
> thresholds just like what dbus-sensors repository does in the following l=
ink:
> https://github.com/openbmc/dbus-sensors/blob/432d1edf7ac86f69558273307
> a59e4b1cf86b8a6/src/Utils.cpp#L141
>=20
> If it's ok for you, I'll work on it and send patch for you review.
> Please help to comment on it.
>=20

Hi Matt,
Could you help to comment on this proposal. =20
Thanks your great support in advance.

> > > Thanks your great support in advance.
> > >
> > > *From:*openbmc <openbmc-bounces+rli11=3Dlenovo.com@lists.ozlabs.org>
> > *On
> > > Behalf Of *Ivan Li11
> > > *Sent:* Friday, October 18, 2019 5:59 PM
> > > *To:* openbmc@lists.ozlabs.org
> > > *Subject:* [External] Power-on monitor for phosphor-hwmon question
> > >
> > > Hi Team,
> > >
> > > We found that there's no power-on monitor mechanism in
> > phosphor-hwmon.
> > >
> > > https://github.com/openbmc/phosphor-hwmon
> > >
> > > And it will cause incorrect threshold logs to be added to journal
> > > log by 'sel-logger' when system is in power off(S5) state.
> > >
> > > Is there any plan to implement it? Or other repository we can refer t=
o ?
> > >
> > > Thanks,
> > >
> > > Ivan
> > >

