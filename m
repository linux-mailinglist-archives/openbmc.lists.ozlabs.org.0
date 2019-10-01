Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6451C2ED1
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2019 10:27:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jC7T2gk5zDqSF
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2019 18:27:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=protonmail.com
 (client-ip=185.70.40.135; helo=mail-40135.protonmail.ch;
 envelope-from=rgrs@protonmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=protonmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.b="UY2UQu57"; 
 dkim-atps=neutral
Received: from mail-40135.protonmail.ch (mail-40135.protonmail.ch
 [185.70.40.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jC6j08DqzDqRK
 for <openbmc@lists.ozlabs.org>; Tue,  1 Oct 2019 18:26:49 +1000 (AEST)
Date: Tue, 01 Oct 2019 08:26:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1569918402;
 bh=K8QyvojGtf47PGCVSq47KCaVTgJcBhPz5BnL+DRnups=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=UY2UQu57KimmN/CTAMM1xCOp9pQ4OqQjuyIvSw8HDa3v9m79Q5ntylBSrqjFj2pGD
 gXso7ArCNFNprdYcr5VcaQnqrKEkCgrSQc1A03HuQHhHX/8rV0l9obg5VNXwgDLLTa
 JOzm40SMqs7ADgAlYkm/zCXt6Wt90gIzJXMf3sEY=
To: Matthew Barth <msbarth@linux.ibm.com>
From: rgrs <rgrs@protonmail.com>
Subject: Re: Fan PWM monitoring and control
Message-ID: <ZLN_18f1vSxMDoAUYnI369dyjZFCsNqsRHx-byYYTrn0qH9FCIpVcKR5vMlgshaYPGN3jsf-LXDA3Z30zYzNqgmmCQS6L4NXjzMEzQlpjis=@protonmail.com>
In-Reply-To: <8695ea1c-5fef-366d-a8b4-893fdd85eff3@linux.ibm.com>
References: <xsccJqqcmgguxAh42ykWadNuaYHHgIw0933Bk0tYCREDFQMFzoE43c9ULehB-J0Em4kobpg-P8xmKd5ukb9AdyIO9-JYrY8DrNAcVFkURyM=@protonmail.com>
 <b8234b9b-1409-33dc-930f-21b8aab590e2@linux.ibm.com>
 <DPtOWfYe4jWodafub9fy5O2kam1xxcqYVW-AwwODBWTmNr0VBvHQulRT6eAywSOxzlmbCuHhLW9vJ_alhSn-fuDwyh_KvJdUYz4AqWcThTE=@protonmail.com>
 <LgdPnRYBfplNFAYHlgeIeqcfaFAY3YBlIY29oEdpPzlBlptZTxYA7eQDOAJL9IWz_b_GYz9PCAMxoudn2QA1ArWs1r74LSBcdkOdlXQ1Slk=@protonmail.com>
 <afa59982-3c5f-8939-bd05-88d1815a2c6f@linux.ibm.com>
 <gCqa3KLpxkaqddp6pnOMKmLCTSjvpuoQHlS5siDs3JCFv3NeXvKc4xul_Ri83w76neUFnIQhrxDDTuXQyTxHYt3hEPCVvmnWi2dHRSs5iKY=@protonmail.com>
 <50f3d08c-192f-acb9-ab5e-bb33919caf2b@linux.ibm.com>
 <lf0ii4u9DsgrAvxZDnYUOqF2u7t3KtPW5LDaZVTq7raeSKUbeVrIdIQlec-d6Ex_Q70t8nQlI_VfTbuIQh1FMrEPlurk0H9YNPXxqkKXQ-A=@protonmail.com>
 <8695ea1c-5fef-366d-a8b4-893fdd85eff3@linux.ibm.com>
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

Please can you help me with mapping values in events.yaml?
(https://github.com/openbmc/phosphor-fan-presence/blob/master/control/examp=
le/events.yaml)

How are these values derived?
How do I make sure, that this is valid for my platform?
Please can you point to documentation regarding this, i am not able to find=
 from github search.

#      actions:
#          - name: set_floor_from_average_sensor_value
#            map:
#                value:
#                    - 27000: 3500
#                    - 32000: 4600
#                    - 37000: 5200
#                    - 40000: 5800
#                type: std::map<int64_t, uint64_t>
#          - name: set_ceiling_from_average_sensor_value
#            map:
#                value:
#                    - 25000: 7200
#                    - 27000: 10500
#                type: std::map<int64_t, uint64_t>




Thanks,
Raj

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Thursday, September 26, 2019 8:19 PM, Matthew Barth <msbarth@linux.ibm.c=
om> wrote:

> On 9/25/19 1:45 AM, rgrs wrote:
>
> > Hi Matt,
> >
> > > Is the `pwm[#]_enable` sysfs file set to a '1' at any point after the=
 AC cycle (i.e. after a poweron?)?
> >
> > No
> >
> > > If you think the configs are set correctly, is the hwmon service for =
the pwm devices running after the AC cycle while at BMC standby?
> >
> > I'm not sure, I think phosphor-fan starts after chassis power-on.
>
> I was asking if the hwmon service is started at BMC standby. It sounds
> like it still may be config related but I'm not able to determine where
> it may be. If you believe that hwmon is not setting the pwm[#]_enable
> file correctly, please debug and provide a fix if that's the case, it'd
> be much appreciated!
>
> Matt
>
> > Thanks,
> > Raj
> > =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Origina=
l Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=
=90
> > On Tuesday, September 24, 2019 8:25 PM, Matthew Barth msbarth@linux.ibm=
.com wrote:
> >
> > > On 9/23/19 11:25 PM, rgrs wrote:
> > >
> > > > Thanks Matt :) It works now.
> > > > I have one small issue on configuration of ADT7462.
> > > > After AC power cycle, it defaults to "automatic" fan control.
> > > > We need to change this "manual" so that phosphor-fan control regist=
er writes are not ignored by ADT7462.
> > > > I came across https://github.com/openbmc/docs/blob/master/sensor-ar=
chitecture.md
> > > >
> > > > > ENABLE
> > > > > Will write a value to a pwmN_enable file on startup if present.
> > > > > ENABLE_fan1 =3D 2 #Write a 2 to pwm1_enable
> > > >
> > > > But this doesn't seem to work. We need it to be initialized to '1'.
> > > > (It always defaults to 2 after AC cycle)
> > >
> > > This sounds like the correct hwmon config to use to set it to a '1' u=
pon
> > > hwmon starting after an AC cycle. First ensure your hwmon config has
> > > these `ENABLE_fan[#]` entries set to a corresponding `pwm[#]_enable`
> > > file in sysfs.
> > > Is the `pwm[#]_enable` sysfs file set to a '1' at any point after the=
 AC
> > > cycle (i.e. after a poweron?)? If you think the configs are set
> > > correctly, is the hwmon service for the pwm devices running after the=
 AC
> > > cycle while at BMC standby?
> > >
> > > > Is host-power-on script a good place to "echo 1 > pwmN_enable"?
> > > > (planning to add a script to initialize before host power on)
> > > > Thanks,
> > > > Raj
> > > > =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Ori=
ginal Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=
=E2=80=90
> > > > On Friday, September 20, 2019 9:49 PM, Matthew Barth msbarth@linux.=
ibm.com wrote:
> > > >
> > > > > On 9/20/19 4:55 AM, rgrs wrote:
> > > > >
> > > > > > Hi Matt,
> > > > > > I'm able to control fan speed via busctl.
> > > > > > root@saber:/sys/class/hwmon/hwmon0# busctl set-property xyz.ope=
nbmc_project.Hwmon-2429843755.Hwmon1 /xyz/openbmc_project/sensors/fan_tach/=
FAN0 xyz.openbmc_project.Control.FanPwm Target t '250'
> > > > > > root@saber:/sys/class/hwmon/hwmon0# cat fan*_input
> > > > > > 12498
> > > > > > 0
> > > > >
> > > > > Great! that's progress.
> > > > >
> > > > > > I need a way to verify if the sensor associations are working p=
roperly that fans will ramp up when associated temperature sensor's value i=
ncreases.
> > > > >
> > > > > Be sure that your fans.yaml contains the correct sensor name ("FA=
N0",
> > > > > etc..) for each fan that contains the Target property on the FanP=
wm
> > > > > interface.
> > > > > You can use busctl to monitor the target pwm sensor changes based=
 on
> > > > > what you configured within events.yaml for speed increases. This =
would
> > > > > show that fan control is requesting updated targets to hwmon. The=
n hwmon
> > > > > would write these values out to the pwm sysfs file for your fan
> > > > > controller device.
> > > > >
> > > > > > Thanks,
> > > > > > Raj
> > > > > > =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=
=90 Original Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=
=90=E2=80=90
> > > > > > On Friday, September 20, 2019 2:57 PM, rgrs rgrs@protonmail.com=
 wrote:
> > > > > >
> > > > > > > Hi Matt,
> > > > > > >
> > > > > > > > > Not sure I follow what you mean by "no pwm writes", is th=
ere an
> > > > > > >
> > > > > > > application writing to the fan sensor's pwm interface target =
property?
> > > > > > > I thought phoshor-fan control writes to pwm to increase fan s=
peed based on temperature sensors mentioned in events.yaml
> > > > > > > (recipes-phosphor/fans/phosphor-fan-control-events-config/eve=
nts.yaml)
> > > > > > > Is it not the case?
> > > > > > > Thanks,
> > > > > > > Raj
> > > > > > > =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=
=E2=80=90 Original Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=
=E2=80=90=E2=80=90
> > > > > > > On Thursday, September 19, 2019 8:26 PM, Matthew Barth msbart=
h@linux.ibm.com wrote:
> > > > > > >
> > > > > > > > On 9/19/19 5:16 AM, rgrs wrote:
> > > > > > > >
> > > > > > > > > Hi Patrick, Lei,
> > > > > > > > > Thank you, I made some changes according your comments
> > > > > > > > >
> > > > > > > > > -   added Mutability::Read to fan yaml.
> > > > > > > > > -   I didn't see ipmi-sensor-inventory.yaml of romulus ha=
ving fan sensors, so removed them from IPMI.
> > > > > > > > >
> > > > > > > > > Now,"busctl monitor" displays Fan tach reads, no pwm writ=
es.
> > > > > > > >
> > > > > > > > Not sure I follow what you mean by "no pwm writes", is ther=
e an
> > > > > > > > application writing to the fan sensor's pwm interface targe=
t property?
> > > > > > > >
> > > > > > > > > Is there any way to manually set PWM value and test this?
> > > > > > > > > How do I verify PWM values are being written to ADT7462?
> > > > > > > >
> > > > > > > > If no other application are writing to the PWM sysfs entrie=
s, you should
> > > > > > > > be able to `echo` a value to each fan's PWM sysfs file to a=
lter the fan
> > > > > > > > speeds.
> > > > > > > >
> > > > > > > > > Another observation is Inventory.Item seems to have inval=
id(stale) entries.
> > > > > > > >
> > > > > > > > I believe inventory is persisted by default so that could e=
xplain why
> > > > > > > > these entries are still showing up. These are persisted und=
er
> > > > > > > > `/var/lib/phosphor-inventory-manager/..`.
> > > > > > > >
> > > > > > > > > IPMI sensor names appear in inventory even after removing=
 from IPMI sensor yaml files (exported JSON in attachment).
> > > > > > > > > Logs:
> > > > > > > > > busctl monitor | grep -i fan
> > > > > > > > >
> > > > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > > >
> > > > > > > > > Monitoring bus message stream.
> > > > > > > > > Sender=3D:1.45 Path=3D/xyz/openbmc_project/sensors/fan_ta=
ch/FAN0 Interface=3Dorg.freedesktop.DBus.Properties Member=3DPropertiesChan=
ged
> > > > > > > > > Sender=3D:1.45 Path=3D/xyz/openbmc_project/sensors/fan_ta=
ch/FAN1 Interface=3Dorg.freedesktop.DBus.Properties Member=3DPropertiesChan=
ged
> > > > > > > > > Sender=3D:1.45 Path=3D/xyz/openbmc_project/sensors/fan_ta=
ch/FAN2 Interface=3Dorg.freedesktop.DBus.Properties Member=3DPropertiesChan=
ged
> > > > > > > > > [...]
> > > > > > > > > Sender=3D:1.45 Path=3D/xyz/openbmc_project/sensors/fan_ta=
ch/FAN1 Interface=3Dorg.freedesktop.DBus.Properties Member=3DPropertiesChan=
ged
> > > > > > > > > Sender=3D:1.45 Path=3D/xyz/openbmc_project/sensors/fan_ta=
ch/FAN3 Interface=3Dorg.freedesktop.DBus.Properties Member=3DPropertiesChan=
ged
> > > > > > > > > ^C
> > > > > > > > > busctl get-property xyz.openbmc_project.Hwmon-2429843755.=
Hwmon1 /xyz/openbmc_project/sensors/fan_tach/FAN0 xyz.openbmc_project.Contr=
ol.FanPwm Target
> > > > > > > > >
> > > > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
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
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > > >
> > > > > > > > > t 0
> > > > > > > > > busctl set-property xyz.openbmc_project.Hwmon-2429843755.=
Hwmon1 /xyz/openbmc_project/sensors/fan_tach/FAN0 xyz.openbmc_project.Contr=
ol.FanPwm Target 8000
> > > > > > > > >
> > > > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > >
> > > > > > > > This is not a valid call to `busctl set-property...`, its m=
issing the
> > > > > > > > property's signature type (refer to `busctl help`). Also, a=
 target PWM
> > > > > > > > of 8000 is invalid, PWM is 0 - 255.
> > > > > > > >
> > > > > > > > > Failed to create bus message: Invalid argument
> > > > > > > > > busctl introspect --no-pager xyz.openbmc_project.Hwmon-24=
29843755.Hwmon1 /xyz/openbmc_project/sensors/fan_tach/FAN1
> > > > > > > > >
> > > > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > > >
> > > > > > > > > NAME TYPE SIGNATURE RESULT/VALUE FLAGS
> > > > > > > > > org.freedesktop.DBus.Introspectable interface - - -
> > > > > > > > > .Introspect method - s -
> > > > > > > > > org.freedesktop.DBus.Peer interface - - -
> > > > > > > > > .GetMachineId method - s -
> > > > > > > > > .Ping method - - -
> > > > > > > > > org.freedesktop.DBus.Properties interface - - -
> > > > > > > > > .Get method ss v -
> > > > > > > > > .GetAll method s a{sv} -
> > > > > > > > > .Set method ssv - -
> > > > > > > > > .PropertiesChanged signal sa{sv}as - -
> > > > > > > > > xyz.openbmc_project.Control.FanPwm interface - - -
> > > > > > > > > .Target property t 0 emits-change writable
> > > > > > > > > xyz.openbmc_project.Sensor.Value interface - - -
> > > > > > > > > .MaxValue property x 0 emits-change writable
> > > > > > > > > .MinValue property x 0 emits-change writable
> > > > > > > > > .Scale property x 0 emits-change writable
> > > > > > > > > .Unit property s "xyz.openbmc_project.Sensor.Value.Unit.=
=E2=80=A6 emits-change writable
> > > > > > > > > .Value property x 2983 emits-change writable
> > > > > > > > > xyz.openbmc_project.State.Decorator.OperationalStatus int=
erface - - -
> > > > > > > > > .Functional property b true emits-change writable
> > > > > > > > > Thanks,
> > > > > > > > > Raj
> > > > > > > > > =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=
=E2=80=90 Original Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=
=E2=80=90=E2=80=90
> > > > > > > > > On Wednesday, September 18, 2019 9:35 PM, Patrick Venture=
 venture@google.com wrote:
> > > > > > > > >
> > > > > > > > > > On Wed, Sep 18, 2019 at 2:30 AM rgrs rgrs@protonmail.co=
m wrote:
> > > > > > > > > >
> > > > > > > > > > > Hi Patrick, Matt,
> > > > > > > > > > > I tried instructions from this wiki: https://develope=
r.ibm.com/linuxonpower/2019/01/07/how-to-port-openbmc/
> > > > > > > > > > > There is no GPIO to detect presence of fans, so tach =
readings is used instead.
> > > > > > > > > > > Here's what I did while trying to enable Fan control:
> > > > > > > > > > >
> > > > > > > > > > > 1.  Added Fan tach sensor in hwmon (adt7462.conf) is =
in the form LABEL=3DFANx_RPM
> > > > > > > > > > > 2.  "ipmi-sensor-inventory.yaml" has below config:
> > > > > > > > > > >
> > > > > > > > > > > 60: &fan_tach
> > > > > > > > > > > sensorType: 0x04
> > > > > > > > > > > path: /xyz/openbmc_project/sensors/fan_tach/FAN0_RPM
> > > > > > > > > > > sensorReadingType: 0x01
> > > > > > > > > > > multiplierM: 100
> > > > > > > > > > > offsetB: 0
> > > > > > > > > > > bExp: 0
> > > > > > > > > > > unit: xyz.openbmc_project.Sensor.Value.Unit.RPMS
> > > > > > > > > > > scale: 0
> > > > > > > > > > > rExp: 0
> > > > > > > > > > > serviceInterface: org.freedesktop.DBus.Properties
> > > > > > > > > > > readingType: readingData
> > > > > > > > > > > interfaces:
> > > > > > > > > > > xyz.openbmc_project.Sensor.Value:
> > > > > > > > > > > Value:
> > > > > > > > > > > Offsets:
> > > > > > > > > > > 0xFF:
> > > > > > > > > > > type: int64_t
> > > > > > > > > > > and FAN PWM as
> > > > > > > > > > > 89: &fanpwm
> > > > > > > > > > > sensorType: 0x04
> > > > > > > > > > > path: /xyz/openbmc_project/sensors/fan_tach/FAN0_RPM
> > > > > > > > > > > sensorReadingType: 0x01
> > > > > > > > > > > multiplierM: 1
> > > > > > > > > > > offsetB: 0
> > > > > > > > > > > bExp: 0
> > > > > > > > > > > mutability: Mutability::Write
> > > > > > > > > >
> > > > > > > > > > You may need to add ::Read here too, I'm not sure anymo=
re, but you can
> > > > > > > > > > check the script that builds this:
> > > > > > > > > > https://github.com/openbmc/phosphor-host-ipmid/blob/mas=
ter/scripts/writesensor.mako.cpp#L69
> > > > > > > > > > It'll default to read, but if you've only set write, I =
don't know.
> > > > > > > > > >
> > > > > > > > > > >         serviceInterface: org.freedesktop.DBus.Proper=
ties
> > > > > > > > > > >         readingType: readingData
> > > > > > > > > > >         interfaces:
> > > > > > > > > > >             xyz.openbmc_project.Control.FanPwm:
> > > > > > > > > > >                 Target:
> > > > > > > > > > >                     Offsets:
> > > > > > > > > > >                         0xFF:
> > > > > > > > > > >                             type: uint64_t
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > 3.  I copied meta-romulus/recipes-phosphor/fans to my=
 platform and changed FAN names from "fanx" to "FANx_RPM" in yaml files.
> > > > > > > > > > >
> > > > > > > > > > > This is what get in busctl tree related to Fans:
> > > > > > > > > > > (I expected to see FanPwm entries in busctl and I'm n=
ot sure why there are multiple entries in inventory).
> > > > > > > > > > > Service xyz.openbmc_project.Hwmon-2429843755.Hwmon1:
> > > > > > > > > > > `-/xyz`-/xyz/openbmc_project
> > > > > > > > > > > `-/xyz/openbmc_project/sensors |-/xyz/openbmc_project=
/sensors/fan_tach | |-/xyz/openbmc_project/sensors/fan_tach/FAN0_RPM | |-/x=
yz/openbmc_project/sensors/fan_tach/FAN1_RPM | |-/xyz/openbmc_project/senso=
rs/fan_tach/FAN2_RPM |`-/xyz/openbmc_project/sensors/fan_tach/FAN3_RPM
> > > > > > > > > > > `-/xyz/openbmc_project/sensors/temperature`-/xyz/open=
bmc_project/sensors/temperature/BACKPLANE_TEMP
> > > > > > > > > >
> > > > > > > > > > You don't get a separate entry for the PWM from phospho=
r-hwmon.
> > > > > > > > > > It's a separate interface on the same service and path.
> > > > > > > > > > I recommend you introspect on the path and see what int=
erfaces are
> > > > > > > > > > available (as well as adding "| read" above):
> > > > > > > > > > busctl introspect --no-pager
> > > > > > > > > > xyz.openbmc_project.Hwmon-2429843755.Hwmon1
> > > > > > > > > > /xyz/openbmc_project/sensors/fan_tach/FAN0_RPM
> > > > > > > > > >
> > > > > > > > > > > Service xyz.openbmc_project.Inventory.Manager:
> > > > > > > > > > > `-/xyz`-/xyz/openbmc_project
> > > > > > > > > > > `-/xyz/openbmc_project/inventory`-/xyz/openbmc_projec=
t/inventory/system
> > > > > > > > > > > `-/xyz/openbmc_project/inventory/system/chassis`-/xyz=
/openbmc_project/inventory/system/chassis/motherboard
> > > > > > > > > > > |-/xyz/openbmc_project/inventory/system/chassis/mothe=
rboard/FAN0
> > > > > > > > > > > | `-/xyz/openbmc_project/inventory/system/chassis/mot=
herboard/FAN0/FAN0 |-/xyz/openbmc_project/inventory/system/chassis/motherbo=
ard/FAN0_RPM |`-/xyz/openbmc_project/inventory/system/chassis/motherboard/F=
AN0_RPM/FAN0_RPM
> > > > > > > > > > > |-/xyz/openbmc_project/inventory/system/chassis/mothe=
rboard/FAN1
> > > > > > > > > > > | `-/xyz/openbmc_project/inventory/system/chassis/mot=
herboard/FAN1/FAN1 |-/xyz/openbmc_project/inventory/system/chassis/motherbo=
ard/FAN1_RPM |`-/xyz/openbmc_project/inventory/system/chassis/motherboard/F=
AN1_RPM/FAN1_RPM
> > > > > > > > > > > |-/xyz/openbmc_project/inventory/system/chassis/mothe=
rboard/FAN2
> > > > > > > > > > > | `-/xyz/openbmc_project/inventory/system/chassis/mot=
herboard/FAN2/FAN2 |-/xyz/openbmc_project/inventory/system/chassis/motherbo=
ard/FAN2_RPM |`-/xyz/openbmc_project/inventory/system/chassis/motherboard/F=
AN2_RPM/FAN2_RPM
> > > > > > > > > > > |-/xyz/openbmc_project/inventory/system/chassis/mothe=
rboard/FAN3
> > > > > > > > > > > | `-/xyz/openbmc_project/inventory/system/chassis/mot=
herboard/FAN3/FAN3 |-/xyz/openbmc_project/inventory/system/chassis/motherbo=
ard/FAN3_RPM |`-/xyz/openbmc_project/inventory/system/chassis/motherboard/F=
AN3_RPM/FAN3_RPM
> > > > > > > > > > > |-/xyz/openbmc_project/inventory/system/chassis/mothe=
rboard/fan0
> > > > > > > > > > > |-/xyz/openbmc_project/inventory/system/chassis/mothe=
rboard/fan1
> > > > > > > > > > > |-/xyz/openbmc_project/inventory/system/chassis/mothe=
rboard/fan2
> > > > > > > > > > > `-/xyz/openbmc_project/inventory/system/chassis/mothe=
rboard/fan3
> > > > > > > > > > > Thanks,
> > > > > > > > > > > Raj
> > > > > > > > > > > =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=
=E2=80=90=E2=80=90 Original Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=
=E2=80=90=E2=80=90=E2=80=90
> > > > > > > > > > > On Tuesday, September 17, 2019 9:18 PM, Patrick Ventu=
re venture@google.com wrote:
> > > > > > > > > > >
> > > > > > > > > > > > On Tue, Sep 17, 2019 at 8:32 AM Matthew Barth msbar=
th@linux.ibm.com wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > > On 9/17/19 5:40 AM, rgrs wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > > > Hi,
> > > > > > > > > > > > > > I need some help with phosphor hwmon related to=
 fan sensors.
> > > > > > > > > > > > > > I'm trying to control Fans in a server motherbo=
ard using ADT7462
> > > > > > > > > > > > > > controller. Hw mon porting is done and the sysf=
s interfaces are working
> > > > > > > > > > > > > > as expected.
> > > > > > > > > > > > > > While I am able to read RPM, i don't find pwm/t=
arget to control the fans
> > > > > > > > > > > > > > exposed as dbus objects.
> > > > > > > > > > > > > > Do you have the hwmon config set similar to thi=
s to denote the fan
> > > > > > > > > > > > > > targets are of PWM type?
> > > > > > > > > > > > >
> > > > > > > > > > > > > https://github.com/openbmc/openbmc/blob/master/me=
ta-ibm/meta-romulus/recipes-phosphor/sensors/phosphor-hwmon/obmc/hwmon/ahb/=
apb/pwm-tacho-controller%401e786000.conf
> > > > > > > > > > > > >
> > > > > > > > > > > > > > busctl --no-page tree xyz.openbmc_project.FanSe=
nsor
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Failed to introspect object / of service xyz.op=
enbmc_project.FanSensor:
> > > > > > > > > > > > > > The name is not activatable
> > > > > > > > > > > > > > No objects discovered.
> > > > > > > > > > > > > > That does not look like a hwmon service name. I=
f you are using
> > > > > > > > > > > > > > phosphor-objmgr, you can use `# mapper get-serv=
ice /xyz/openbmc_project/sensors/fan_tach` otherwise you'll need to find th=
e
> > > > > > > > > > > > > > hwmon service name associated with your fan con=
troller device.
> > > > > > > > > > > >
> > > > > > > > > > > > running`busctl tree --no-pager` will just list ever=
ything, and you
> > > > > > > > > > > > should see your fans in there. You can use the mapp=
er too. I was
> > > > > > > > > > > > curious, are you using entity-manager/dbus-sensors?=
 When you mention
> > > > > > > > > > > > FanSensor as the service, that's what it sounds lik=
e.
> > > > > > > > > > > >
> > > > > > > > > > > > > > I came across this post, I think it is similar =
to my issue.
> > > > > > > > > > > > > > (https://gerrit.openbmc-project.xyz/c/openbmc/p=
hosphor-hwmon/+/8353)
> > > > > > > > > > > > > > Please someone point to latest documentation or=
 reference Fan porting
> > > > > > > > > > > > > > from openBMC repo?
> > > > > > > > > > > > > > What are the exact fields in YAML that are used=
 create FanPWM objects.
> > > > > > > > > > > > > > The Romulus machine should be a good reference =
for PWM based fan control
> > > > > > > > > > > > > > using phosphor-hwmon. It uses the
> > > > > > > > > > > > > > phosphor-fan-presence/[control|monitor] apps fo=
r controlling and
> > > > > > > > > > > > > > monitoring fans
> > > > > > > > > > > > >
> > > > > > > > > > > > > https://github.com/openbmc/openbmc/tree/master/me=
ta-ibm/meta-romulus
> > > > > > > > > > > > >
> > > > > > > > > > > > > > (I'm using Feb release in my sandbox,
> > > > > > > > > > > > > > https://github.com/openbmc/docs/blob/master/rel=
ease/release-notes.md#26-feb-4-2019)
> > > > > > > > > > > > > > Thanks,
> > > > > > > > > > > > > > Raj
> > > > > > > > > > > > >
> > > > > > > > > > > > > Matt


