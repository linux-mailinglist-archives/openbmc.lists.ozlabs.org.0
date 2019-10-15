Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 271A2D8458
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 01:17:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tBCQ2ZD5zDqtW
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 10:17:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tB9S0GdZzDqyx
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 10:15:22 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from brads-mbp.dyn.fuzziesquirrel.com
 (Brads-MBP.dyn.fuzziesquirrel.com [192.168.253.31])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 5977A5C08B;
 Tue, 15 Oct 2019 19:15:19 -0400 (EDT)
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: The type of sensor value in redfish should be double or int64?
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <5e8c2ba2-5e82-f1e3-6524-46278c631553@intel.com>
Date: Tue, 15 Oct 2019 19:15:19 -0400
Message-Id: <6E7F040B-0DCA-480F-89A1-5CA197C1FCC4@fuzziesquirrel.com>
References: <CALzeG+8HyS2xuBAoe4LN0XCC1+eW7D8uQnG9MKK=KGFN7jodZw@mail.gmail.com>
 <CAO=notynD0EtN77y+UDqETUCo1BGixKFhaJJ3KfnQjVsv2=wTA@mail.gmail.com>
 <818E67A7-4D22-4E13-AD37-99E846E7E17B@fuzziesquirrel.com>
 <5e8c2ba2-5e82-f1e3-6524-46278c631553@intel.com>
To: Ed Tanous <ed.tanous@intel.com>
X-Mailer: Apple Mail (2.3445.104.11)
Content-Transfer-Encoding: quoted-printable
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
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, gmills@linux.vnet.ibm.com,
 James Feist <james.feist@linux.intel.com>, Carol Wang <karo33bug@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 6:19 PM, Ed Tanous <ed.tanous@intel.com> wrote:

> On 10/15/19 12:04 PM, Brad Bishop wrote:
>> Is it possible to get bmcweb supporting patch with double and int?  On
>> the surface this seems like the shortest path to enabling Carol.
>
> Unless phosphor-hwmon is patched to support settable sensors, I don't
> think there's a good reason to add support to bmcweb.

Ok.  A couple different questions then.

What does it mean to be settable?  phosphor-hwmon implements Sensor.Value=
 =20
and, (in violation of the interface documentation), doesn=E2=80=99t preve=
nt an =20
external application from writing to the properties in it.

I assumed the assertion that phosphor-hwmon doesn=E2=80=99t provide setta=
ble =20
sensors is because the value set by an external application doesn=E2=80=99=
t stick?  =20
The phosphor-hwmon application logic will write over it the next time it =
=20
polls the hwmon device.

So what does dbus-sensors do for hardware sensors?  Does the application =
=20
ignore the hardware state after being patched via Redfish?

> With that said,
> it's just software, it could certainly be done.  Someone would need to
> sort out how to manage the scale factor, as a Redfish PATCH request
> doesn't have a concept of scale, and operates on a float, so you'd have
> to do some software handholding to convert the value to something
> appropriate before it was scaled to the int64.
>
> With that said, all of this seems like a lot of work.

I don=E2=80=99t know of any alternatives that are less work.  If there ar=
e some, =20
I=E2=80=99d love to hear about them.  There were several years of OpenBMC=
 =20
development against the integer interface signature before double became =
a =20
problem - as Patrick mentioned - undoing all that will not be trivial.

>
> Just to clarify in case anyone isn't clear, the /xyz/* and /org/* type
> REST handlers do support SetProperty for int and double, and introspect=
s
> the daemon to determine which one should be used.  So far as I'm aware,
> the only thing non-functional is a Redfish patch of a sensor, as it's a
> bit more complex to do properly.

I had a look at the Sensor schema in the latest Resource and Schema guide=
 =20
and the sensor reading property is read only.  Why do we even allow it to=
 =20
be patched?

>
> -Ed

