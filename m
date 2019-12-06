Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A5ACC114FC9
	for <lists+openbmc@lfdr.de>; Fri,  6 Dec 2019 12:33:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Tr7Y0pwHzDqRG
	for <lists+openbmc@lfdr.de>; Fri,  6 Dec 2019 22:33:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.40.136;
 helo=mail-40136.protonmail.ch; envelope-from=rgrs@protonmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=protonmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.b="YJUuQBYo"; 
 dkim-atps=neutral
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Tr6f1XsczDqLS
 for <openbmc@lists.ozlabs.org>; Fri,  6 Dec 2019 22:32:38 +1100 (AEDT)
Date: Fri, 06 Dec 2019 11:32:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1575631952;
 bh=HfmW3ZuyZoksbHSFcJ5fmqhVIPgz50RIBSTKyotwZwE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=YJUuQBYomvw4ClJco4Mkfxy8CrJYzV7Xx2H9y82zkchz9WwocnPSUmYBFtZjnxcVf
 K8qykHBdkL5PtIpNymXzmP9lbAO76m9z6P0UIa69s9ToWjBuAgbeBesLUf1kGF7J6L
 qw/ew949hpdY9vohRLDzJA63BZ35imnFjagxht2M=
To: James Feist <james.feist@linux.intel.com>
From: rgrs <rgrs@protonmail.com>
Subject: Re: Faking Sensor Readings
Message-ID: <JIIzLFDdd2_yAem6ToyksGqeJ7ulaTOylaocMLH19rYqyv3fSzcEL2H9VDJW66iYQY8L8FwjgpZqPFj8rRD0JP52xsAHQ6kD4_ygDAjj0LE=@protonmail.com>
In-Reply-To: <2de3b2e2-9b02-a1c2-d310-f6e546e72c1e@linux.intel.com>
References: <QVdDJHlLW9JS_3uowBPTzSCb1dwpqJjml0ORFR_aQGpuKCve1l8Qwy4GF4X0_dgJmExy8sjJQD_VjnI-o4xwoYhivHJlSPBt42fc1cuDKjw=@protonmail.com>
 <0a4bb951-4f85-728a-8426-af629c870908@yadro.com>
 <234c1d26-7b59-0926-d6c2-6c49f75aab3f@linux.intel.com>
 <x5Z3U1jaa8Tf-HK1htUFoCqgAFdtIXGaDyEU7SKkgNkehJEtqaps9BvN2j_D5lsgjEgoTL81fZ8nJLitwFaqW2zRkFK8vXhbCrld3Ziy43o=@protonmail.com>
 <2de3b2e2-9b02-a1c2-d310-f6e546e72c1e@linux.intel.com>
Feedback-ID: N7x9TweAIUMPpfpzQuNzrCOD67M7xMEA9S-zwPBDoWaGjAvK1DkvyqGEcVQ17b2imFZOeXQ1Gawv906j51YTTw==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM autolearn=ham
 autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
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
Reply-To: rgrs <rgrs@protonmail.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Alexander Amelkin <a.amelkin@yadro.com>, "Thomaiyar,
 Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

I dont see any new service even after adding dbus-sensors.
Please can you point to any platform in upstream that I can refer to?

Thanks,
Raj

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Wednesday, December 4, 2019 10:40 PM, James Feist <james.feist@linux.int=
el.com> wrote:

> On 12/4/19 1:39 AM, rgrs wrote:
>
> > Hi James,
> > I tried busctl set-property, but the values didn't change.
> > Are the steps below correct?
> > (test with both 'field mode' enabled and disabled)
> > root@obmc:~# busctl introspect xyz.openbmc_project.Hwmon-2439434288.Hwm=
on1 /xyz/openbmc_project/sensors/temperature/INLET_TEMP xyz.openbmc_project=
.Sensor.Value --no-pager
> > NAME TYPE SIGNATURE RESULT/VALUE FLAGS
> > .MaxValue property x 0 emits-change writable
> > .MinValue property x 0 emits-change writable
> > .Scale property x -3 emits-change writable
> > .Unit property s "xyz.openbmc_project.Sensor.Value.Unit.=E2=80=A6 emits=
-change writable
>
> This looks like phosphor-hwmon, not dbus-sensors
> https://github.com/openbmc/dbus-sensors.
>
> > .Value property x 18500 emits-change writable
> > root@obmc:~# busctl --no-pager set-property xyz.openbmc_project.Hwmon-2=
439434288.Hwmon1 /xyz/openbmc_project/sensors/temperature/INLET_TEMP xyz.op=
enbmc_project.Sensor.Value Value x 50000
> > root@saber:~# busctl --no-pager get-property xyz.openbmc_project.Hwmon-=
2439434288.Hwmon1 /xyz/openbmc_project/sensors/temperature/INLET_TEMP xyz.o=
penbmc_project.Sensor.Value Value
> > x 18500
> > root@obmc:~#
> > Thanks,
> > Raj
> > =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Origina=
l Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=
=90
> > On Wednesday, December 4, 2019 1:34 AM, James Feist james.feist@linux.i=
ntel.com wrote:
> > > On 12/3/19 5:49 AM, Alexander Amelkin wrote:
> > >
> > > > 03.12.2019 15:06, rgrs wrote:
> > > >
> > > > > Hi,
> > > > > How do I fake sensor readings in OpenBMC?
> > > > > We're trying to fake temperature sensors and make sure fans ramp =
up/down
> > > > > accordingly.
> > > >
> > > > We ended up patching the kernel driver to fake the readings by requ=
est.
> > > > I'm not aware of any ready interface in OpenBMC for that.
> > >
> > > If you're using d-bus sensors, the sensor property is writable. It is
> > > also supported by patching the sensor value in redfish.
> > >
> > > > With best regards,
> > > > Alexander Amelkin
> > /james.feist@linux.intel.com


