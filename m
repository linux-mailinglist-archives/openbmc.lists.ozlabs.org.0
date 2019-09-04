Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5C3A96C4
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 00:57:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NzjS1hwqzDqyf
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 08:57:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.246.212; helo=mail1.bemta23.messagelabs.com;
 envelope-from=dlin23@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.212])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NR730npqzDqkx
 for <openbmc@lists.ozlabs.org>; Wed,  4 Sep 2019 11:29:01 +1000 (AEST)
Received: from [67.219.246.102] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-b.us-east-1.aws.symcld.net id 5E/51-05674-9531F6D5;
 Wed, 04 Sep 2019 01:28:57 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkleJIrShJLcpLzFFi42LJePGQRzdSOD/
 WoGs1q8WLKYsYLU61vGBxYPKYdzLQ4/yMhYwBTFGsmXlJ+RUJrBkrP6oX3FGtuNr9j72B8aZC
 FyMnh5BAA5PEkXdZXYxcQPYrRolJjx6xQDj7GCX2dU1j62Lk4GATUJW4P40bpEFEIFriy+MeZ
 hBbWMBK4sjy56wQcXuJgxNeMkHYehLfTi9nAbFZBFQklqyZB1bPK2ApsW/5EzYQm1FAVuLJgm
 dg9cwC4hLnLrayg9gSAgISS/acZ4awRSVePv7HCmErSDTvec0CUa8ncWPqFDYIW1ti2cLXUPM
 FJU7OfMIygVFoFpKxs5C0zELSMgtJywJGllWMZklFmekZJbmJmTm6hgYGuoaGRrrGukamhnqJ
 VbpJeqXFuqmJxSW6QG55sV5xZW5yTopeXmrJJkZgTKQUMP/ewThn1hu9Q4ySHExKoryKzXmxQ
 nxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4SwXzY4UEi1LTUyvSMnOA8QmTluDgURLhTQJJ8xYXJO
 YWZ6ZDpE4xWnJMeDl3ETPHwaPzgOS7n4sXMQux5OXnpUqJ83YJATUIgDRklObBjYOlkEuMslL
 CvIwMDAxCPAWpRbmZJajyrxjFORiVhHnXgqzlycwrgdsKTBBAv4jwZvbmghxUkoiQkmpgCvzR
 f++BAkPnvl17e09HJja+SBa4tHxLYZlG0aoPZ+YFrUmSLU6QmqMXoLvYTprphtWWlzkvNFz+b
 bQsLTu6he3YkxdrXGvmSb2YbHd69qU3kj6HbMynX+Lc9pgxuejBi7wVq+5t/8CX3qNg+je2bd
 +id/5vHORFjmefM25rqln+8nAqT83TmHlT9gZGpOk8yVW089aVK5jHzPN0zm/b6ESPRscTScZ
 eSknHL37KFnisUnT29d+wvOSPBTqvlq+f2ebrwJ5uqFpwe5vC7tdcTf1rk/tNGTscIrvUNj/R
 ldb6rcf6ZmaYXKR/8CIvrcsvZR4enOCe+XDvspeTHmfGtciEHskKYlkt+TH1BNMhJZbijERDL
 eai4kQA5pNjjpwDAAA=
X-Env-Sender: dlin23@lenovo.com
X-Msg-Ref: server-50.tower-386.messagelabs.com!1567560536!492609!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10229 invoked from network); 4 Sep 2019 01:28:57 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.12)
 by server-50.tower-386.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 4 Sep 2019 01:28:57 -0000
Received: from HKGWPEMAIL02.lenovo.com (unknown [10.128.3.70])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 4D58EBA366866B07EC84;
 Tue,  3 Sep 2019 21:28:56 -0400 (EDT)
Received: from HKGWPEMAIL02.lenovo.com (10.128.3.70) by
 HKGWPEMAIL02.lenovo.com (10.128.3.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1591.10; Wed, 4 Sep 2019 09:28:54 +0800
Received: from HKGWPEMAIL02.lenovo.com ([fe80::7020:5ebb:e3eb:29ba]) by
 HKGWPEMAIL02.lenovo.com ([fe80::7020:5ebb:e3eb:29ba%12]) with mapi id
 15.01.1591.008; Wed, 4 Sep 2019 09:28:54 +0800
From: Derek Lin23 <dlin23@lenovo.com>
To: James Feist <james.feist@linux.intel.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: Question of pid-contorl on stepwise configuration
Thread-Topic: Question of pid-contorl on stepwise configuration
Thread-Index: AdViv4Uo72tADi5iR1GuG6RHj9F61Q==
Date: Wed, 4 Sep 2019 01:28:54 +0000
Message-ID: <301e59ff7dd742ac9463287d79c5991e@lenovo.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.128.115.1]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Sep 2019 08:56:45 +1000
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
> Sent: Wednesday, September 4, 2019 8:43 AM
> To: Derek Lin23 <dlin23@lenovo.com>; OpenBMC Maillist
> <openbmc@lists.ozlabs.org>
> Subject: [External] Re: Question of pid-contorl on stepwise configuration
>=20
> On 8/21/2019 4:36 AM, Derek Lin23 wrote:
> > Hi team:
> >
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 I have a question regarding stepwise confi=
guration on
> > pid-control.
> >
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 I have mine setup like below.
> >
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 {
> >
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "name": "Amb=
ient_Temp",
> >
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "type": "ste=
pwise",
> >
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "setpoint": =
0.0,
> >
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "inputs": ["=
Ambient_Temp"],
> >
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "pid": {
> >
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
"samplePeriod": 1.0,
> >
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
"positiveHysteresis": 0.0,
> >
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
"negativeHysteresis": 0.0,
> >
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
"isCeiling": false,
> >
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
"reading": {
> >
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 "0": 25,
> >
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 "1": 30,
> >
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 "2": 35
> >
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
},
> >
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
"output": {
> >
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 "0": 15,
> >
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 "1": 15,
> >
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 "2": 15
> >
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
> >
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> >
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> >
>=20
> I don't use the json configuration, so you'll have to do a bit of a compa=
rison of
> apples and oranges, but here is an example of a stepwise
> configuration:
> https://github.com/openbmc/entity-manager/blob/08a5b175eec81c53506709
> fda8a7c168748cc22d/configurations/R1000%20Chassis.json#L577
>=20
> Reading is the reading of the sensor, and output is the setpoint given to=
 the fan
> pid. Depending on how you configure your system this can either be a perc=
ent,
> or it can be a tach reading. When a sensor reaches a reading, the
> corresponding output is given to the fan controller as a setpoint. So it =
my
> example, when we reach a temp of 30 degrees, the setpoint of 60 is given =
to
> the fancontroller. This 60 is unitless and depends on how the fan control=
ler
> configuration is implemented how it affects the fans.
>=20
> -James

Hi James:

	I'll give it a try.=20

Thanks.=20
>=20
> >  =A0=A0=A0=A0=A0=A0=A0=A0=A0 And, I would like to know the meaning of e=
ach field, as far
> > as I understand from phosphor-pid-control, "setpoint" seems not used if
> > PID type is stepwise. Is that true? The "reading" field indicates the
> > temperature reading from the sensor "Ambient". The "output" field shoul=
d
> > indicate the duty % corresponding to the fans, or should output be RPMs=
?
> > That gives me when a reading of 25 degree(whatever the unit is), the
> > output duty of fans should set to 15%, or set to corresponding RPMs.
> >
> > Do I understand the fields correctly?
> >
> > Thank you,
> >
> > -----------------------------------------------------------------------=
-
> >
> > *Derek Lin*
> > Sr. BMC Engineer
> > 8F,66, San Chong Rd., Nankang Software Park, Taipei.
> > Lenovo Taiwan
> >
> >
> >
> > Phone+886281707411
> > Emaildlin23@lenovo.com <mailto:dlin23@lenovo.com>
> >
> >
> >
> > Lenovo.com <http://www.lenovo.com/>
> > Twitter <http://twitter.com/lenovo>=A0| Instagram
> > <https://instagram.com/lenovo>=A0| Facebook
> > <http://www.facebook.com/lenovo>=A0| Linkedin
> > <http://www.linkedin.com/company/lenovo>=A0| YouTube
> > <http://www.youtube.com/lenovovision>=A0| Privacy
> > <https://www.lenovo.com/gb/en/privacy-selector/>
> >
> >
> >
> > ImageLogo-DCG-Honeycomb
> >
> >
> >
