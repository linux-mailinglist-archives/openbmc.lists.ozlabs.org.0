Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B2211A694
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2019 10:15:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Xrqy0by6zDqcS
	for <lists+openbmc@lfdr.de>; Wed, 11 Dec 2019 20:15:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.40.138;
 helo=mail-40138.protonmail.ch; envelope-from=rgrs@protonmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=protonmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.b="xNvcHdIb"; 
 dkim-atps=neutral
Received: from mail-40138.protonmail.ch (mail-40138.protonmail.ch
 [185.70.40.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Xrpr13zHzDqcS
 for <openbmc@lists.ozlabs.org>; Wed, 11 Dec 2019 20:14:24 +1100 (AEDT)
Date: Wed, 11 Dec 2019 09:14:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1576055658;
 bh=rqY8RAcmsyg6VXR/VbTZOoES0Fy2iEZmewZ8hhLCS1M=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=xNvcHdIbd/sVCQyBp2pmZrkO+f206I48pxQ9Gu+1T6tHzDcrqHxHLmTsBn+N/HpoO
 wg+1yX8p1Wa2hDm/Ry2glWmPImgKcRxpZvzCYF1Hbf0++Gev1fbh1A/9/5vuUq6NmX
 OJHEF9zuxaHfsdMIXmoKT9zl+f0FrRFG74VM+5tM=
To: James Feist <james.feist@linux.intel.com>
From: rgrs <rgrs@protonmail.com>
Subject: Re: Faking Sensor Readings
Message-ID: <iSeeVedIu2fcqVt4W4TlDAQNHMjfTxE0NUAs68nlqossQmqy5OdbHgn9YHO1kh88ZpFMHO6bpGL7ki2hS9mQgw2d7Dk2WQFH-o6jOH6e1g4=@protonmail.com>
In-Reply-To: <e59e36d1-74fc-5f44-a472-26fdfb127af2@linux.intel.com>
References: <QVdDJHlLW9JS_3uowBPTzSCb1dwpqJjml0ORFR_aQGpuKCve1l8Qwy4GF4X0_dgJmExy8sjJQD_VjnI-o4xwoYhivHJlSPBt42fc1cuDKjw=@protonmail.com>
 <0a4bb951-4f85-728a-8426-af629c870908@yadro.com>
 <234c1d26-7b59-0926-d6c2-6c49f75aab3f@linux.intel.com>
 <x5Z3U1jaa8Tf-HK1htUFoCqgAFdtIXGaDyEU7SKkgNkehJEtqaps9BvN2j_D5lsgjEgoTL81fZ8nJLitwFaqW2zRkFK8vXhbCrld3Ziy43o=@protonmail.com>
 <2de3b2e2-9b02-a1c2-d310-f6e546e72c1e@linux.intel.com>
 <JIIzLFDdd2_yAem6ToyksGqeJ7ulaTOylaocMLH19rYqyv3fSzcEL2H9VDJW66iYQY8L8FwjgpZqPFj8rRD0JP52xsAHQ6kD4_ygDAjj0LE=@protonmail.com>
 <e59e36d1-74fc-5f44-a472-26fdfb127af2@linux.intel.com>
Feedback-ID: N7x9TweAIUMPpfpzQuNzrCOD67M7xMEA9S-zwPBDoWaGjAvK1DkvyqGEcVQ17b2imFZOeXQ1Gawv906j51YTTw==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.2
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

Hi James,

I don't see any results for the grep command.

Our platform was built referencing Witherspoon IIRC.

Below links were used during porting,

https://github.com/openbmc/docs/blob/master/development/add-new-system.md

https://developer.ibm.com/linuxonpower/2019/01/07/how-to-port-openbmc/

I don't see "entity manager" being used in above links. Is it something spe=
cific to Intel servers?

If I were to port a new board today, which is the reference platform or gui=
de to refer?

Thx,
Raj




=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Monday, December 9, 2019 11:58 PM, James Feist <james.feist@linux.intel.=
com> wrote:

> On 12/6/19 3:32 AM, rgrs wrote:
>
> > Hi,
> > I dont see any new service even after adding dbus-sensors.
> > Please can you point to any platform in upstream that I can refer to?
>
> https://github.com/openbmc/meta-intel/blob/daa333d956ad9391abcbb85468d9bc=
9f26ee1190/meta-common/recipes-intel/packagegroups/packagegroup-intel-apps.=
bb#L43
>
> https://github.com/openbmc/meta-facebook/blob/master/meta-tiogapass/recip=
es-fbtp/packagegroups/packagegroup-fb-apps.bb
>
> If you do a ps do you see any of the sensor daemons running?
>
> root@intel-obmc:~# ps | grep -i sensor
> 332 root 6008 S /usr/bin/adcsensor
> 333 root 6356 S /usr/bin/cpusensor
> 334 root 5784 S /usr/bin/exitairtempsensor
> 335 root 5696 S /usr/bin/fansensor
> 336 root 5608 S /usr/bin/hwmontempsensor
> 337 root 5660 S intrusionsensor
> 339 root 5716 S /usr/bin/ipmbsensor
> 340 root 5512 S /usr/bin/mcutempsensor
> 341 root 5868 S /usr/bin/psusensor
> 588 root 2776 S grep -i sensor
> root@intel-obmc:~#
>
> If so then you'll need to add entity-manager configurations like these:
>
> https://github.com/openbmc/entity-manager/blob/7d807754cc9153b04b59980446=
4edd9654d7a81e/configurations/WFT Baseboard.json#L2023
>
> Thanks
>
> James
>
> > Thanks,
> > Raj
> > =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Origina=
l Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=
=90
> > On Wednesday, December 4, 2019 10:40 PM, James Feist james.feist@linux.=
intel.com wrote:
> >
> > > On 12/4/19 1:39 AM, rgrs wrote:
> > >
> > > > Hi James,
> > > > I tried busctl set-property, but the values didn't change.
> > > > Are the steps below correct?
> > > > (test with both 'field mode' enabled and disabled)
> > > > root@obmc:~# busctl introspect xyz.openbmc_project.Hwmon-2439434288=
.Hwmon1 /xyz/openbmc_project/sensors/temperature/INLET_TEMP xyz.openbmc_pro=
ject.Sensor.Value --no-pager
> > > > NAME TYPE SIGNATURE RESULT/VALUE FLAGS
> > > > .MaxValue property x 0 emits-change writable
> > > > .MinValue property x 0 emits-change writable
> > > > .Scale property x -3 emits-change writable
> > > > .Unit property s "xyz.openbmc_project.Sensor.Value.Unit.=E2=80=
=A6 emits-change writable
> > >
> > > This looks like phosphor-hwmon, not dbus-sensors
> > > https://github.com/openbmc/dbus-sensors.
> > >
> > > > .Value property x 18500 emits-change writable
> > > > root@obmc:~# busctl --no-pager set-property xyz.openbmc_project.Hwm=
on-2439434288.Hwmon1 /xyz/openbmc_project/sensors/temperature/INLET_TEMP xy=
z.openbmc_project.Sensor.Value Value x 50000
> > > > root@saber:~# busctl --no-pager get-property xyz.openbmc_project.Hw=
mon-2439434288.Hwmon1 /xyz/openbmc_project/sensors/temperature/INLET_TEMP x=
yz.openbmc_project.Sensor.Value Value
> > > > x 18500
> > > > root@obmc:~#
> > > > Thanks,
> > > > Raj
> > > > =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Ori=
ginal Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=
=E2=80=90
> > > > On Wednesday, December 4, 2019 1:34 AM, James Feist james.feist@lin=
ux.intel.com wrote:
> > > >
> > > > > On 12/3/19 5:49 AM, Alexander Amelkin wrote:
> > > > >
> > > > > > 03.12.2019 15:06, rgrs wrote:
> > > > > >
> > > > > > > Hi,
> > > > > > > How do I fake sensor readings in OpenBMC?
> > > > > > > We're trying to fake temperature sensors and make sure fans r=
amp up/down
> > > > > > > accordingly.
> > > > > >
> > > > > > We ended up patching the kernel driver to fake the readings by =
request.
> > > > > > I'm not aware of any ready interface in OpenBMC for that.
> > > > >
> > > > > If you're using d-bus sensors, the sensor property is writable. I=
t is
> > > > > also supported by patching the sensor value in redfish.
> > > > >
> > > > > > With best regards,
> > > > > > Alexander Amelkin
> > > > > > /james.feist@linux.intel.com


