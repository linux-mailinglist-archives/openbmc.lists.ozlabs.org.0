Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42463CB87C
	for <lists+openbmc@lfdr.de>; Fri,  4 Oct 2019 12:39:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46l5wJ2NYhzDqbg
	for <lists+openbmc@lfdr.de>; Fri,  4 Oct 2019 20:39:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=protonmail.com
 (client-ip=185.70.40.135; helo=mail-40135.protonmail.ch;
 envelope-from=rgrs@protonmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=protonmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.b="EgebLp3n"; 
 dkim-atps=neutral
Received: from mail-40135.protonmail.ch (mail-40135.protonmail.ch
 [185.70.40.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46l5ty0sR5zDqZQ
 for <openbmc@lists.ozlabs.org>; Fri,  4 Oct 2019 20:38:14 +1000 (AEST)
Date: Fri, 04 Oct 2019 10:38:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1570185487;
 bh=4A8H+KyEJFH0tVl6lG1Ru/6Ya9nGn28PBqsyTSvi3/Q=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=EgebLp3nNntqDMHCP5arfVNQOm35NIzJLd0qYcdpZK21fdwhDFrp4SR6pWk112H9s
 ee3JQ0O39kJ/uXI7APSuHfoXnW4hEXujW50YtRe57Eek5wZo/cHFdOWvN3G3BeFVXC
 vi8/ZV+Yj/Z4Kum7cNZlrVIflOnHNxPcVpr9tClI=
To: Matthew Barth <msbarth@linux.ibm.com>
From: rgrs <rgrs@protonmail.com>
Subject: Re: Fan PWM monitoring and control
Message-ID: <kr3Z2HykIpJcRsvei3VkghV727aAHcA4QcU4TlHMSTAtXKRGmbdMp_i3XoJqMWQg08tlt2Hj8VrR887BbdbJL4pW_Mjrgf6ZQW62gdlqCXA=@protonmail.com>
In-Reply-To: <d4bc705d-8900-e47f-1152-ed4131719d8d@linux.ibm.com>
References: <xsccJqqcmgguxAh42ykWadNuaYHHgIw0933Bk0tYCREDFQMFzoE43c9ULehB-J0Em4kobpg-P8xmKd5ukb9AdyIO9-JYrY8DrNAcVFkURyM=@protonmail.com>
 <LgdPnRYBfplNFAYHlgeIeqcfaFAY3YBlIY29oEdpPzlBlptZTxYA7eQDOAJL9IWz_b_GYz9PCAMxoudn2QA1ArWs1r74LSBcdkOdlXQ1Slk=@protonmail.com>
 <afa59982-3c5f-8939-bd05-88d1815a2c6f@linux.ibm.com>
 <gCqa3KLpxkaqddp6pnOMKmLCTSjvpuoQHlS5siDs3JCFv3NeXvKc4xul_Ri83w76neUFnIQhrxDDTuXQyTxHYt3hEPCVvmnWi2dHRSs5iKY=@protonmail.com>
 <50f3d08c-192f-acb9-ab5e-bb33919caf2b@linux.ibm.com>
 <lf0ii4u9DsgrAvxZDnYUOqF2u7t3KtPW5LDaZVTq7raeSKUbeVrIdIQlec-d6Ex_Q70t8nQlI_VfTbuIQh1FMrEPlurk0H9YNPXxqkKXQ-A=@protonmail.com>
 <8695ea1c-5fef-366d-a8b4-893fdd85eff3@linux.ibm.com>
 <ZLN_18f1vSxMDoAUYnI369dyjZFCsNqsRHx-byYYTrn0qH9FCIpVcKR5vMlgshaYPGN3jsf-LXDA3Z30zYzNqgmmCQS6L4NXjzMEzQlpjis=@protonmail.com>
 <d4bc705d-8900-e47f-1152-ed4131719d8d@linux.ibm.com>
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
Cc: Patrick Venture <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Matt,

Thanks for the reply.

> floor speed (the lowest the fans are allowed) based on the given average
> sensor values for the group of sensors

Is this all hwmon values? as in RPM : Average_temp_in_group

Thanks,
Raj

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Friday, October 4, 2019 2:29 AM, Matthew Barth <msbarth@linux.ibm.com> w=
rote:

> On 10/1/19 3:26 AM, rgrs wrote:
>
> > Hi Matt,
> > Please can you help me with mapping values in events.yaml?
> > (https://github.com/openbmc/phosphor-fan-presence/blob/master/control/e=
xample/events.yaml)
> > How are these values derived?
> > How do I make sure, that this is valid for my platform?
> > Please can you point to documentation regarding this, i am not able to =
find from github search.
>
> Unfortunately in this repo's development there was not alot of time
> given to get a fully functional and flexible solution in place for
> delivery on the system using this as its fan control solution.
> Documentation is limited to the example yaml files and the doxygen
> located within the source. Enhancing this documentation is on my list of
> todo's when I get the time.
>
> > actions:
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > - name: set_floor_from_average_sensor_value
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > map:
> >
> > =3D=3D=3D=3D=3D
> >
> > value:
> >
> > =3D=3D=3D=3D=3D=3D=3D
> >
> > - 27000: 3500
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > - 32000: 4600
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > - 37000: 5200
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > - 40000: 5800
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > type: std::map<int64_t, uint64_t>
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > - name: set_ceiling_from_average_sensor_value
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > map:
> >
> > =3D=3D=3D=3D=3D
> >
> > value:
> >
> > =3D=3D=3D=3D=3D=3D=3D
> >
> > - 25000: 7200
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > - 27000: 10500
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > type: std::map<int64_t, uint64_t>
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> These values are derived by performing thermal characterization. In this
> case, it was thermally determined that the values for setting the fan
> floor speed (the lowest the fans are allowed) based on the given average
> sensor values for the group of sensors defined on the event containing
> this action. Similarly, a fan ceiling speed is put in place based on the
> same group of sensors' average value so the fans are not allowed to
> increase above that speed.
>
> Validating thermal control parameters for any type of fan control needs
> characterization done against the system's components(Proc, dimms, pci
> cards, etc..) to enabled the correct fan control parameters.
>
> Matt
>
> > Thanks,
> > Raj
> > =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Origina=
l Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=
=90
> > On Thursday, September 26, 2019 8:19 PM, Matthew Barth msbarth@linux.ib=
m.com wrote:
> >
> > > On 9/25/19 1:45 AM, rgrs wrote:
> > >
> > > > Hi Matt,
> > > >
> > > > > Is the `pwm[#]_enable` sysfs file set to a '1' at any point after=
 the AC cycle (i.e. after a poweron?)?
> > > >
> > > > No
> > > >
> > > > > If you think the configs are set correctly, is the hwmon service =
for the pwm devices running after the AC cycle while at BMC standby?
> > > >
> > > > I'm not sure, I think phosphor-fan starts after chassis power-on.
> > >
> > > I was asking if the hwmon service is started at BMC standby. It sound=
s
> > > like it still may be config related but I'm not able to determine whe=
re
> > > it may be. If you believe that hwmon is not setting the pwm[#]_enable
> > > file correctly, please debug and provide a fix if that's the case, it=
'd
> > > be much appreciated!
> > > Matt
> > >
> > > > Thanks,
> > > > Raj
> > > > =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Ori=
ginal Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=
=E2=80=90
> > > > On Tuesday, September 24, 2019 8:25 PM, Matthew Barth msbarth@linux=
.ibm.com wrote:
> > > >
> > > > > On 9/23/19 11:25 PM, rgrs wrote:
> > > > >
> > > > > > Thanks Matt :) It works now.
> > > > > > I have one small issue on configuration of ADT7462.
> > > > > > After AC power cycle, it defaults to "automatic" fan control.
> > > > > > We need to change this "manual" so that phosphor-fan control re=
gister writes are not ignored by ADT7462.
> > > > > > I came across https://github.com/openbmc/docs/blob/master/senso=
r-architecture.md
> > > > > >
> > > > > > > ENABLE
> > > > > > > Will write a value to a pwmN_enable file on startup if presen=
t.
> > > > > > > ENABLE_fan1 =3D 2 #Write a 2 to pwm1_enable
> > > > > >
> > > > > > But this doesn't seem to work. We need it to be initialized to =
'1'.
> > > > > > (It always defaults to 2 after AC cycle)
> > > > >
> > > > > This sounds like the correct hwmon config to use to set it to a '=
1' upon
> > > > > hwmon starting after an AC cycle. First ensure your hwmon config =
has
> > > > > these `ENABLE_fan[#]` entries set to a corresponding `pwm[#]_enab=
le`
> > > > > file in sysfs.
> > > > > Is the `pwm[#]_enable` sysfs file set to a '1' at any point after=
 the AC
> > > > > cycle (i.e. after a poweron?)? If you think the configs are set
> > > > > correctly, is the hwmon service for the pwm devices running after=
 the AC
> > > > > cycle while at BMC standby?
> > > > >
> > > > > > Is host-power-on script a good place to "echo 1 > pwmN_enable"?
> > > > > > (planning to add a script to initialize before host power on)
> > > > > > Thanks,
> > > > > > Raj
> > > > > > =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=
=90 Original Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=
=90=E2=80=90
> > > > > > On Friday, September 20, 2019 9:49 PM, Matthew Barth msbarth@li=
nux.ibm.com wrote:
> > > > > >
> > > > > > > On 9/20/19 4:55 AM, rgrs wrote:
> > > > > > >
> > > > > > > > Hi Matt,
> > > > > > > > I'm able to control fan speed via busctl.
> > > > > > > > root@saber:/sys/class/hwmon/hwmon0# busctl set-property xyz=
.openbmc_project.Hwmon-2429843755.Hwmon1 /xyz/openbmc_project/sensors/fan_t=
ach/FAN0 xyz.openbmc_project.Control.FanPwm Target t '250'
> > > > > > > > root@saber:/sys/class/hwmon/hwmon0# cat fan*_input
> > > > > > > > 12498
> > > > > > > > 0
> > > > > > >
> > > > > > > Great! that's progress.
> > > > > > >
> > > > > > > > I need a way to verify if the sensor associations are worki=
ng properly that fans will ramp up when associated temperature sensor's val=
ue increases.
> > > > > > >
> > > > > > > Be sure that your fans.yaml contains the correct sensor name =
("FAN0",
> > > > > > > etc..) for each fan that contains the Target property on the =
FanPwm
> > > > > > > interface.
> > > > > > > You can use busctl to monitor the target pwm sensor changes b=
ased on
> > > > > > > what you configured within events.yaml for speed increases. T=
his would
> > > > > > > show that fan control is requesting updated targets to hwmon.=
 Then hwmon
> > > > > > > would write these values out to the pwm sysfs file for your f=
an
> > > > > > > controller device.
> > > > > > >
> > > > > > > > Thanks,
> > > > > > > > Raj
> > > > > > > > =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=
=E2=80=90 Original Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=
=E2=80=90=E2=80=90
> > > > > > > > On Friday, September 20, 2019 2:57 PM, rgrs rgrs@protonmail=
.com wrote:
> > > > > > > >
> > > > > > > > > Hi Matt,
> > > > > > > > >
> > > > > > > > > > > Not sure I follow what you mean by "no pwm writes", i=
s there an
> > > > > > > > >
> > > > > > > > > application writing to the fan sensor's pwm interface tar=
get property?
> > > > > > > > > I thought phoshor-fan control writes to pwm to increase f=
an speed based on temperature sensors mentioned in events.yaml
> > > > > > > > > (recipes-phosphor/fans/phosphor-fan-control-events-config=
/events.yaml)
> > > > > > > > > Is it not the case?
> > > > > > > > > Thanks,
> > > > > > > > > Raj
> > > > > > > > > =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=
=E2=80=90 Original Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=
=E2=80=90=E2=80=90
> > > > > > > > > On Thursday, September 19, 2019 8:26 PM, Matthew Barth ms=
barth@linux.ibm.com wrote:
> > > > > > > > >
> > > > > > > > > > On 9/19/19 5:16 AM, rgrs wrote:
> > > > > > > > > >
> > > > > > > > > > > Hi Patrick, Lei,
> > > > > > > > > > > Thank you, I made some changes according your comment=
s
> > > > > > > > > > >
> > > > > > > > > > > -   added Mutability::Read to fan yaml.
> > > > > > > > > > > -   I didn't see ipmi-sensor-inventory.yaml of romulu=
s having fan sensors, so removed them from IPMI.
> > > > > > > > > > >
> > > > > > > > > > > Now,"busctl monitor" displays Fan tach reads, no pwm =
writes.
> > > > > > > > > >
> > > > > > > > > > Not sure I follow what you mean by "no pwm writes", is =
there an
> > > > > > > > > > application writing to the fan sensor's pwm interface t=
arget property?
> > > > > > > > > >
> > > > > > > > > > > Is there any way to manually set PWM value and test t=
his?
> > > > > > > > > > > How do I verify PWM values are being written to ADT74=
62?
> > > > > > > > > >
> > > > > > > > > > If no other application are writing to the PWM sysfs en=
tries, you should
> > > > > > > > > > be able to `echo` a value to each fan's PWM sysfs file =
to alter the fan
> > > > > > > > > > speeds.
> > > > > > > > > >
> > > > > > > > > > > Another observation is Inventory.Item seems to have i=
nvalid(stale) entries.
> > > > > > > > > >
> > > > > > > > > > I believe inventory is persisted by default so that cou=
ld explain why
> > > > > > > > > > these entries are still showing up. These are persisted=
 under
> > > > > > > > > > `/var/lib/phosphor-inventory-manager/..`.
> > > > > > > > > >
> > > > > > > > > > > IPMI sensor names appear in inventory even after remo=
ving from IPMI sensor yaml files (exported JSON in attachment).
> > > > > > > > > > > Logs:
> > > > > > > > > > > busctl monitor | grep -i fan
> > > > > > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > > > > > Monitoring bus message stream.
> > > > > > > > > > > Sender=3D:1.45 Path=3D/xyz/openbmc_project/sensors/fa=
n_tach/FAN0 Interface=3Dorg.freedesktop.DBus.Properties Member=3DProperties=
Changed
> > > > > > > > > > > Sender=3D:1.45 Path=3D/xyz/openbmc_project/sensors/fa=
n_tach/FAN1 Interface=3Dorg.freedesktop.DBus.Properties Member=3DProperties=
Changed
> > > > > > > > > > > Sender=3D:1.45 Path=3D/xyz/openbmc_project/sensors/fa=
n_tach/FAN2 Interface=3Dorg.freedesktop.DBus.Properties Member=3DProperties=
Changed
> > > > > > > > > > > [...]
> > > > > > > > > > > Sender=3D:1.45 Path=3D/xyz/openbmc_project/sensors/fa=
n_tach/FAN1 Interface=3Dorg.freedesktop.DBus.Properties Member=3DProperties=
Changed
> > > > > > > > > > > Sender=3D:1.45 Path=3D/xyz/openbmc_project/sensors/fa=
n_tach/FAN3 Interface=3Dorg.freedesktop.DBus.Properties Member=3DProperties=
Changed
> > > > > > > > > > > ^C
> > > > > > > > > > > busctl get-property xyz.openbmc_project.Hwmon-2429843=
755.Hwmon1 /xyz/openbmc_project/sensors/fan_tach/FAN0 xyz.openbmc_project.C=
ontrol.FanPwm Target
> > > > > > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > > > > > t 0
> > > > > > > > > > > busctl set-property xyz.openbmc_project.Hwmon-2429843=
755.Hwmon1 /xyz/openbmc_project/sensors/fan_tach/FAN0 xyz.openbmc_project.C=
ontrol.FanPwm Target 8000
> > > > > > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > > > >
> > > > > > > > > > This is not a valid call to `busctl set-property...`, i=
ts missing the
> > > > > > > > > > property's signature type (refer to `busctl help`). Als=
o, a target PWM
> > > > > > > > > > of 8000 is invalid, PWM is 0 - 255.
> > > > > > > > > >
> > > > > > > > > > > Failed to create bus message: Invalid argument
> > > > > > > > > > > busctl introspect --no-pager xyz.openbmc_project.Hwmo=
n-2429843755.Hwmon1 /xyz/openbmc_project/sensors/fan_tach/FAN1
> > > > > > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > > > > > NAME TYPE SIGNATURE RESULT/VALUE FLAGS
> > > > > > > > > > > org.freedesktop.DBus.Introspectable interface - - -
> > > > > > > > > > > .Introspect method - s -
> > > > > > > > > > > org.freedesktop.DBus.Peer interface - - -
> > > > > > > > > > > .GetMachineId method - s -
> > > > > > > > > > > .Ping method - - -
> > > > > > > > > > > org.freedesktop.DBus.Properties interface - - -
> > > > > > > > > > > .Get method ss v -
> > > > > > > > > > > .GetAll method s a{sv} -
> > > > > > > > > > > .Set method ssv - -
> > > > > > > > > > > .PropertiesChanged signal sa{sv}as - -
> > > > > > > > > > > xyz.openbmc_project.Control.FanPwm interface - - -
> > > > > > > > > > > .Target property t 0 emits-change writable
> > > > > > > > > > > xyz.openbmc_project.Sensor.Value interface - - -
> > > > > > > > > > > .MaxValue property x 0 emits-change writable
> > > > > > > > > > > .MinValue property x 0 emits-change writable
> > > > > > > > > > > .Scale property x 0 emits-change writable
> > > > > > > > > > > .Unit property s "xyz.openbmc_project.Sensor.Value.Un=
it.=E2=80=A6 emits-change writable
> > > > > > > > > > > .Value property x 2983 emits-change writable
> > > > > > > > > > > xyz.openbmc_project.State.Decorator.OperationalStatus=
 interface - - -
> > > > > > > > > > > .Functional property b true emits-change writable
> > > > > > > > > > > Thanks,
> > > > > > > > > > > Raj
> > > > > > > > > > > =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=
=E2=80=90=E2=80=90 Original Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=
=E2=80=90=E2=80=90=E2=80=90
> > > > > > > > > > > On Wednesday, September 18, 2019 9:35 PM, Patrick Ven=
ture venture@google.com wrote:
> > > > > > > > > > >
> > > > > > > > > > > > On Wed, Sep 18, 2019 at 2:30 AM rgrs rgrs@protonmai=
l.com wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > > Hi Patrick, Matt,
> > > > > > > > > > > > > I tried instructions from this wiki: https://deve=
loper.ibm.com/linuxonpower/2019/01/07/how-to-port-openbmc/
> > > > > > > > > > > > > There is no GPIO to detect presence of fans, so t=
ach readings is used instead.
> > > > > > > > > > > > > Here's what I did while trying to enable Fan cont=
rol:
> > > > > > > > > > > > >
> > > > > > > > > > > > > 1.  Added Fan tach sensor in hwmon (adt7462.conf)=
 is in the form LABEL=3DFANx_RPM
> > > > > > > > > > > > > 2.  "ipmi-sensor-inventory.yaml" has below config=
:
> > > > > > > > > > > > >
> > > > > > > > > > > > > 60: &fan_tach
> > > > > > > > > > > > > sensorType: 0x04
> > > > > > > > > > > > > path: /xyz/openbmc_project/sensors/fan_tach/FAN0_=
RPM
> > > > > > > > > > > > > sensorReadingType: 0x01
> > > > > > > > > > > > > multiplierM: 100
> > > > > > > > > > > > > offsetB: 0
> > > > > > > > > > > > > bExp: 0
> > > > > > > > > > > > > unit: xyz.openbmc_project.Sensor.Value.Unit.RPMS
> > > > > > > > > > > > > scale: 0
> > > > > > > > > > > > > rExp: 0
> > > > > > > > > > > > > serviceInterface: org.freedesktop.DBus.Properties
> > > > > > > > > > > > > readingType: readingData
> > > > > > > > > > > > > interfaces:
> > > > > > > > > > > > > xyz.openbmc_project.Sensor.Value:
> > > > > > > > > > > > > Value:
> > > > > > > > > > > > > Offsets:
> > > > > > > > > > > > > 0xFF:
> > > > > > > > > > > > > type: int64_t
> > > > > > > > > > > > > and FAN PWM as
> > > > > > > > > > > > > 89: &fanpwm
> > > > > > > > > > > > > sensorType: 0x04
> > > > > > > > > > > > > path: /xyz/openbmc_project/sensors/fan_tach/FAN0_=
RPM
> > > > > > > > > > > > > sensorReadingType: 0x01
> > > > > > > > > > > > > multiplierM: 1
> > > > > > > > > > > > > offsetB: 0
> > > > > > > > > > > > > bExp: 0
> > > > > > > > > > > > > mutability: Mutability::Write
> > > > > > > > > > > >
> > > > > > > > > > > > You may need to add ::Read here too, I'm not sure a=
nymore, but you can
> > > > > > > > > > > > check the script that builds this:
> > > > > > > > > > > > https://github.com/openbmc/phosphor-host-ipmid/blob=
/master/scripts/writesensor.mako.cpp#L69
> > > > > > > > > > > > It'll default to read, but if you've only set write=
, I don't know.
> > > > > > > > > > > >
> > > > > > > > > > > > >          serviceInterface: org.freedesktop.DBus.P=
roperties
> > > > > > > > > > > > >          readingType: readingData
> > > > > > > > > > > > >          interfaces:
> > > > > > > > > > > > >              xyz.openbmc_project.Control.FanPwm:
> > > > > > > > > > > > >                  Target:
> > > > > > > > > > > > >                      Offsets:
> > > > > > > > > > > > >                          0xFF:
> > > > > > > > > > > > >                              type: uint64_t
> > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > 3.  I copied meta-romulus/recipes-phosphor/fans t=
o my platform and changed FAN names from "fanx" to "FANx_RPM" in yaml files=
.
> > > > > > > > > > > > >
> > > > > > > > > > > > > This is what get in busctl tree related to Fans:
> > > > > > > > > > > > > (I expected to see FanPwm entries in busctl and I=
'm not sure why there are multiple entries in inventory).
> > > > > > > > > > > > > Service xyz.openbmc_project.Hwmon-2429843755.Hwmo=
n1:
> > > > > > > > > > > > > `-/xyz`-/xyz/openbmc_project
> > > > > > > > > > > > > `-/xyz/openbmc_project/sensors |-/xyz/openbmc_pro=
ject/sensors/fan_tach | |-/xyz/openbmc_project/sensors/fan_tach/FAN0_RPM | =
|-/xyz/openbmc_project/sensors/fan_tach/FAN1_RPM | |-/xyz/openbmc_project/s=
ensors/fan_tach/FAN2_RPM |`-/xyz/openbmc_project/sensors/fan_tach/FAN3_RPM
> > > > > > > > > > > > > `-/xyz/openbmc_project/sensors/temperature`-/xyz/=
openbmc_project/sensors/temperature/BACKPLANE_TEMP
> > > > > > > > > > > >
> > > > > > > > > > > > You don't get a separate entry for the PWM from pho=
sphor-hwmon.
> > > > > > > > > > > > It's a separate interface on the same service and p=
ath.
> > > > > > > > > > > > I recommend you introspect on the path and see what=
 interfaces are
> > > > > > > > > > > > available (as well as adding "| read" above):
> > > > > > > > > > > > busctl introspect --no-pager
> > > > > > > > > > > > xyz.openbmc_project.Hwmon-2429843755.Hwmon1
> > > > > > > > > > > > /xyz/openbmc_project/sensors/fan_tach/FAN0_RPM
> > > > > > > > > > > >
> > > > > > > > > > > > > Service xyz.openbmc_project.Inventory.Manager:
> > > > > > > > > > > > > `-/xyz`-/xyz/openbmc_project
> > > > > > > > > > > > > `-/xyz/openbmc_project/inventory`-/xyz/openbmc_pr=
oject/inventory/system
> > > > > > > > > > > > > `-/xyz/openbmc_project/inventory/system/chassis`-=
/xyz/openbmc_project/inventory/system/chassis/motherboard
> > > > > > > > > > > > > |-/xyz/openbmc_project/inventory/system/chassis/m=
otherboard/FAN0
> > > > > > > > > > > > > | `-/xyz/openbmc_project/inventory/system/chassis=
/motherboard/FAN0/FAN0 |-/xyz/openbmc_project/inventory/system/chassis/moth=
erboard/FAN0_RPM |`-/xyz/openbmc_project/inventory/system/chassis/motherboa=
rd/FAN0_RPM/FAN0_RPM
> > > > > > > > > > > > > |-/xyz/openbmc_project/inventory/system/chassis/m=
otherboard/FAN1
> > > > > > > > > > > > > | `-/xyz/openbmc_project/inventory/system/chassis=
/motherboard/FAN1/FAN1 |-/xyz/openbmc_project/inventory/system/chassis/moth=
erboard/FAN1_RPM |`-/xyz/openbmc_project/inventory/system/chassis/motherboa=
rd/FAN1_RPM/FAN1_RPM
> > > > > > > > > > > > > |-/xyz/openbmc_project/inventory/system/chassis/m=
otherboard/FAN2
> > > > > > > > > > > > > | `-/xyz/openbmc_project/inventory/system/chassis=
/motherboard/FAN2/FAN2 |-/xyz/openbmc_project/inventory/system/chassis/moth=
erboard/FAN2_RPM |`-/xyz/openbmc_project/inventory/system/chassis/motherboa=
rd/FAN2_RPM/FAN2_RPM
> > > > > > > > > > > > > |-/xyz/openbmc_project/inventory/system/chassis/m=
otherboard/FAN3
> > > > > > > > > > > > > | `-/xyz/openbmc_project/inventory/system/chassis=
/motherboard/FAN3/FAN3 |-/xyz/openbmc_project/inventory/system/chassis/moth=
erboard/FAN3_RPM |`-/xyz/openbmc_project/inventory/system/chassis/motherboa=
rd/FAN3_RPM/FAN3_RPM
> > > > > > > > > > > > > |-/xyz/openbmc_project/inventory/system/chassis/m=
otherboard/fan0
> > > > > > > > > > > > > |-/xyz/openbmc_project/inventory/system/chassis/m=
otherboard/fan1
> > > > > > > > > > > > > |-/xyz/openbmc_project/inventory/system/chassis/m=
otherboard/fan2
> > > > > > > > > > > > > `-/xyz/openbmc_project/inventory/system/chassis/m=
otherboard/fan3
> > > > > > > > > > > > > Thanks,
> > > > > > > > > > > > > Raj
> > > > > > > > > > > > > =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=
=E2=80=90=E2=80=90 Original Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=
=E2=80=90=E2=80=90=E2=80=90
> > > > > > > > > > > > > On Tuesday, September 17, 2019 9:18 PM, Patrick V=
enture venture@google.com wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > > > On Tue, Sep 17, 2019 at 8:32 AM Matthew Barth m=
sbarth@linux.ibm.com wrote:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > > On 9/17/19 5:40 AM, rgrs wrote:
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Hi,
> > > > > > > > > > > > > > > > I need some help with phosphor hwmon relate=
d to fan sensors.
> > > > > > > > > > > > > > > > I'm trying to control Fans in a server moth=
erboard using ADT7462
> > > > > > > > > > > > > > > > controller. Hw mon porting is done and the =
sysfs interfaces are working
> > > > > > > > > > > > > > > > as expected.
> > > > > > > > > > > > > > > > While I am able to read RPM, i don't find p=
wm/target to control the fans
> > > > > > > > > > > > > > > > exposed as dbus objects.
> > > > > > > > > > > > > > > > Do you have the hwmon config set similar to=
 this to denote the fan
> > > > > > > > > > > > > > > > targets are of PWM type?
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > https://github.com/openbmc/openbmc/blob/maste=
r/meta-ibm/meta-romulus/recipes-phosphor/sensors/phosphor-hwmon/obmc/hwmon/=
ahb/apb/pwm-tacho-controller%401e786000.conf
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > busctl --no-page tree xyz.openbmc_project.F=
anSensor
> > > > > > > > > > > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > > > > > > > > > > Failed to introspect object / of service xy=
z.openbmc_project.FanSensor:
> > > > > > > > > > > > > > > > The name is not activatable
> > > > > > > > > > > > > > > > No objects discovered.
> > > > > > > > > > > > > > > > That does not look like a hwmon service nam=
e. If you are using
> > > > > > > > > > > > > > > > phosphor-objmgr, you can use `# mapper get-=
service /xyz/openbmc_project/sensors/fan_tach` otherwise you'll need to fin=
d the
> > > > > > > > > > > > > > > > hwmon service name associated with your fan=
 controller device.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > running`busctl tree --no-pager` will just list =
everything, and you
> > > > > > > > > > > > > > should see your fans in there. You can use the =
mapper too. I was
> > > > > > > > > > > > > > curious, are you using entity-manager/dbus-sens=
ors? When you mention
> > > > > > > > > > > > > > FanSensor as the service, that's what it sounds=
 like.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > I came across this post, I think it is simi=
lar to my issue.
> > > > > > > > > > > > > > > > (https://gerrit.openbmc-project.xyz/c/openb=
mc/phosphor-hwmon/+/8353)
> > > > > > > > > > > > > > > > Please someone point to latest documentatio=
n or reference Fan porting
> > > > > > > > > > > > > > > > from openBMC repo?
> > > > > > > > > > > > > > > > What are the exact fields in YAML that are =
used create FanPWM objects.
> > > > > > > > > > > > > > > > The Romulus machine should be a good refere=
nce for PWM based fan control
> > > > > > > > > > > > > > > > using phosphor-hwmon. It uses the
> > > > > > > > > > > > > > > > phosphor-fan-presence/[control|monitor] app=
s for controlling and
> > > > > > > > > > > > > > > > monitoring fans
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > https://github.com/openbmc/openbmc/tree/maste=
r/meta-ibm/meta-romulus
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > (I'm using Feb release in my sandbox,
> > > > > > > > > > > > > > > > https://github.com/openbmc/docs/blob/master=
/release/release-notes.md#26-feb-4-2019)
> > > > > > > > > > > > > > > > Thanks,
> > > > > > > > > > > > > > > > Raj
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Matt


