Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6864A5250
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 23:25:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnjLx4RXNz3bW9
	for <lists+openbmc@lfdr.de>; Tue,  1 Feb 2022 09:25:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eEYs+Uej;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::234;
 helo=mail-oi1-x234.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=eEYs+Uej; dkim-atps=neutral
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnjLX6rshz2ypK
 for <openbmc@lists.ozlabs.org>; Tue,  1 Feb 2022 09:25:22 +1100 (AEDT)
Received: by mail-oi1-x234.google.com with SMTP id r27so7460654oiw.4
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jan 2022 14:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:from:mime-version:subject:message-id:date
 :cc:to; bh=16s2D4SBgKrIsXU19l0NNypk7a55uBD8NyzXw0gEbCM=;
 b=eEYs+UejWxs+m/dD2qfvytkzlmIRuRNiqQK6Ai2Thw94e9tyv2y9yMZsrTvt7KGhFN
 DijxV4pAQQpr800iSxmUS+DIz9Sx8ymXbhNTWdL6OFFMvJXLLvD5BBb/jxMXgA/yhrtP
 /N769qJTpyAilZPjyeF18c7iaRPFnfNEmEj9wu4hnfy7/xRaL3ZRvOscszFW6a+ExrIh
 PJfFIYFmYkflF72DvSwFIKAJlCfbgnGh2E2HzU6+104ClwVswFrFILTJChBDnYgY/Stx
 YSsa0JzGjrISjLWphUQBqN9BcE5uGdh3+NUOYF9IQiJAVNvQ9oYoapLZPKhSPmWlb9AH
 qSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:message-id:date:cc:to;
 bh=16s2D4SBgKrIsXU19l0NNypk7a55uBD8NyzXw0gEbCM=;
 b=lgED4MjrSPdWcfHnSpNAVoFlF5pNFyJsjyQYc6VIj3NQ8uoj3+GAKdi+BK+X46X5PN
 q4MhX0q3tDITyR5hLhRFJXwer7sw3rotAm2KL8ojOaiZJMsh29Rty2hI9evUMdfLMIN1
 B4dtkNAdx6p8jfAVIpupDSEjkH0Cd/omyFNjdgrtfQaTZdp9kRO+B9RQDR6/PX4B94Cx
 yN520LAqYbHbZxeI6hNvw31TcwHms4hVRBOwVNAE2fQXjfELSYp/sg1YJVKXPhCMt4pt
 ljFsa4AErq7u/iB5a0qvmeUaDGWVfhxDdK1FsKjuNBCl/FNLNphHB0fyXWeTBtMq4+kD
 hvZw==
X-Gm-Message-State: AOAM530KNL+e6dKrj3r99fGksvFrnt5rkiY1OdptT/RGlpR9C5ke5m2+
 UuKulYesgKxIXiIzkGINAQniB9U/8XIqLg==
X-Google-Smtp-Source: ABdhPJz9ayi56oyhCNFG9Yg+DrdPWf4gCYxtu0EMQHGlZl88hXtLgbhLGFZ66NqeuDVwdwtrz1wd+g==
X-Received: by 2002:a05:6808:bcb:: with SMTP id
 o11mr19752472oik.2.1643667917990; 
 Mon, 31 Jan 2022 14:25:17 -0800 (PST)
Received: from smtpclient.apple ([2600:100e:b060:df6a:5903:76ab:af9a:5b27])
 by smtp.gmail.com with ESMTPSA id p5sm9718493oou.39.2022.01.31.14.25.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 14:25:17 -0800 (PST)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-40DBACA6-AF50-45F9-84DC-3A5B0927B2E2
Content-Transfer-Encoding: 7bit
From: Mike <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: No dbus objects for phosphor-regulators
Message-Id: <FC1C96F9-CA9C-45B8-9FF5-26CF04109852@gmail.com>
Date: Mon, 31 Jan 2022 15:25:16 -0700
To: Shawn McCarney <shawnmm@linux.ibm.com>
X-Mailer: iPad Mail (19C56)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail-40DBACA6-AF50-45F9-84DC-3A5B0927B2E2
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFJason,

Sent from my iPhone

> On Jan 26, 2022, at 3:43 PM, Shawn McCarney <shawnmm@linux.ibm.com> wrote:=

> =EF=BB=BF
> Hi Mike,
>=20
>> I made a config file below, and verified that it is on the target and loa=
ds without error.
> Just to make sure I understand what you are saying, on the BMC your 'confi=
g.json' file is installed in the /usr/share/phosphor-regulators directory
>=20
Correct

> And when you run 'journalctl -u phosphor-regulators.service', you see a jo=
urnal message stating that the phosphor-regulators application has loaded yo=
ur JSON file successfully?  And no error messages?
>=20

Correct

>> When the target boots, using a I2C spy tool, the 0xDD command is being re=
ad periodically, suggesting that this service is processing the read command=
, and a query show the service is up.
> Sensor reading should begin when the chassis is powered on and stop when t=
he chassis is powered off.  That is because some regulators don't have power=
 at standby or report invalid sensor readings.
>=20

I am using the SDK, so I have not worked on chassis power, so I don=E2=80=99=
t know if it is powered or not, but this gives me a good hint about the prob=
lem. Even so, the read command in config.json is getting polled. The other c=
onfig item to modify the voltage did not occur.

Given I am using an Aspeed EVK, is there an example for how to turn on a cha=
ssis with a GPIO, or a dbus operation, or an automatic turn on at boot?
> Does the 'journalctl | grep -i Regulators' show that the service files are=
 being executed that enable and disable regulator sensor monitoring?
>=20
No, only the daemon starting.
>> Using dbus-monitor =E2=80=93system, I do not see any transactions that pl=
ace these sensor read values on dbus, nor does the normal probing the chassi=
s and inventory show values.
> Since you are reading a vout sensor for the rail named "vdd", the resultin=
g D-Bus object path for the sensor should be
>=20
>   /xyz/openbmc_project/sensors/voltage/vdd_vout
>=20
> See https://github.com/openbmc/phosphor-power/blob/master/phosphor-regulat=
ors/docs/config_file/pmbus_read_sensor.md#d-bus-sensor for more details.
>=20
> Does that object path exist on D-Bus after you've powered on the chassis a=
nd sensor monitoring has been enabled?
>=20
It does not exist.

> You can see all the properties of the D-Bus sensor using the command
>=20
>   busctl introspect xyz.openbmc_project.Power.Regulators /xyz/openbmc_proj=
ect/sensors/voltage/vdd_vout
>=20
> You can see all regulator sensor object paths via the command:
>=20
>   busctl tree xyz.openbmc_project.Power.Regulators
>=20
> The phosphor-regulators application reads sensors once per second.  Howeve=
r, it only updates D-Bus if the new sensor value has changed more than a hys=
teresis amount.  This is to avoid generating a bunch of D-Bus traffic for mi=
nor value changes.
>=20
> You can see the hysteresis values here: https://github.com/openbmc/phospho=
r-power/blob/master/phosphor-regulators/src/dbus_sensor.cpp#L66
>=20
>> What else do I need to so that there are dbus objects?
> For bmcweb and Redfish to work, you need associations between the D-Bus se=
nsor and two D-Bus inventory objects:
>=20
> * The FRU that contains the regulator.  This is the replaceable hardware i=
tem where the regulator is located.  Some regulators are FRUs by themselves (=
replaceable).  Some are located on larger FRUs like a motherboard.  This is u=
sed to get presence, health info, and if applicable VPD.
>=20
Ah, it did not occurs to me that a mother board as FRU is wapping regulators=
 inside an FRU. Seems obvious now.
> * The chassis that contains the regulator.  This is required by Redfish si=
nce it groups sensors by chassis.
>=20
Ok

> The phosphor-regulators application creates those associations automatical=
ly based on information in your JSON file.  The "fru" property of the regula=
tor "device" provides the first inventory object path.  The "inventory_path"=
 property of the "chassis" provides the second inventory path.  Both of thos=
e are relative to the "/xyz/openbmc_project/inventory" root path.
>=20
> Do the "fru" and "inventory_path" properties in your JSON file match the c=
orrect inventory object paths on your system?
>=20
I have a psu.json with fruConfigs, and this has

=E2=80=9CPsuDevices=E2=80=9D: {
  =E2=80=9C/xyz/openbmc-project/inventory/system/chassis/motherboard/powersu=
pply0=E2=80=9D : =E2=80=9C/sys/bus/i2c/devices/11-004f=E2=80=9D,
}

Which is the same i2c address as used by phosphor-regulators.

And a power-supply-monitor-0.conf to match.
>> Note I have not done anything to intentionally use open_power. My goal is=
 to only use phosphor-regulators to expose some telemetry that hwmon does no=
t support.
> That's fine.  This application does not have any dependencies on open_powe=
r.
>=20
> Let me know if you need more info.
>=20
> Shawn
>=20
Mike


--Apple-Mail-40DBACA6-AF50-45F9-84DC-3A5B0927B2E2
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr">=EF=BB=BF<meta http-equiv=3D=
"content-type" content=3D"text/html; charset=3Dutf-8">Jason,<br><br><div dir=
=3D"ltr">Sent from my iPhone</div><div dir=3D"ltr"><br><blockquote type=3D"c=
ite">On Jan 26, 2022, at 3:43 PM, Shawn McCarney &lt;shawnmm@linux.ibm.com&g=
t; wrote:<br><br></blockquote></div><blockquote type=3D"cite"><div dir=3D"lt=
r">=EF=BB=BF
 =20
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"=
>
 =20
 =20
    <p>Hi Mike,</p>
    <o:p></o:p>
    <blockquote type=3D"cite" cite=3D"mid:8C9640C9-6E1B-4495-BA55-258DA15487=
99@gmail.com">I made a
      config file below, and verified that it is on the target and loads
      without error.<o:p></o:p></blockquote>
    <p>Just to make sure I understand what you are saying, on the BMC
      your 'config.json' file is installed in the
      /usr/share/phosphor-regulators directory<br></p></div></blockquote><di=
v>Correct</div><br><blockquote type=3D"cite"><div dir=3D"ltr"><p>
    </p>
    <p>And when you run 'journalctl -u phosphor-regulators.service', you
      see a journal message stating that the phosphor-regulators
      application has loaded your JSON file successfully?&nbsp; And no error=

      messages?<br></p></div></blockquote><div><br></div><div>Correct</div><=
br><blockquote type=3D"cite"><div dir=3D"ltr"><p>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:8C9640C9-6E1B-4495-BA55-258DA15487=
99@gmail.com">
      <p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto;
        margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;">Whe=
n
        the target boots, using a I2C spy tool, the 0xDD command is
        being read periodically, suggesting that this service is
        processing the read command, and a query show the service is up.</p>=

    </blockquote>
    <p>Sensor reading should begin when the chassis is powered on and
      stop when the chassis is powered off.&nbsp; That is because some
      regulators don't have power at standby or report invalid sensor
      readings.</p></div></blockquote><div><br></div><div>I am using the SDK=
, so I have not worked on chassis power, so I don=E2=80=99t know if it is po=
wered or not, but this gives me a good hint about the problem. Even so, the r=
ead command in config.json is getting polled. The other config item to modif=
y the voltage did not occur.</div><div dir=3D"ltr"><br></div>Given I am usin=
g an Aspeed EVK, is there an example for how to turn on a chassis with a GPI=
O, or a dbus operation, or an automatic turn on at boot?<br><blockquote type=
=3D"cite"><div dir=3D"ltr">
    <p>Does the 'journalctl | grep -i Regulators' show that the service
      files are being executed that enable and disable regulator sensor
      monitoring?<br></p></div></blockquote><div>No, only the daemon startin=
g.</div><blockquote type=3D"cite"><div dir=3D"ltr"><p>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:8C9640C9-6E1B-4495-BA55-258DA15487=
99@gmail.com">
      <p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto;
        margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;">Usi=
ng
        dbus-monitor =E2=80=93system, I do not see any transactions that pla=
ce
        these sensor read values on dbus, nor does the normal probing
        the chassis and inventory show values.</p>
    </blockquote>
    <p>Since you are reading a vout sensor for the rail named "vdd", the
      resulting D-Bus object path for the sensor should be<br>
    </p>
    <p>&nbsp; /xyz/openbmc_project/sensors/voltage/vdd_vout</p>
    <p>See
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/openbmc/phosph=
or-power/blob/master/phosphor-regulators/docs/config_file/pmbus_read_sensor.=
md#d-bus-sensor">https://github.com/openbmc/phosphor-power/blob/master/phosp=
hor-regulators/docs/config_file/pmbus_read_sensor.md#d-bus-sensor</a>
      for more details.<br>
    </p>
    <p>Does that object path exist on D-Bus after you've powered on the
      chassis and sensor monitoring has been enabled?<br></p></div></blockqu=
ote><div dir=3D"ltr">It does not exist.</div><br><blockquote type=3D"cite"><=
div dir=3D"ltr"><p>
    </p>
    <p>You can see all the properties of the D-Bus sensor using the
      command</p>
    <p>&nbsp; busctl introspect xyz.openbmc_project.Power.Regulators
      /xyz/openbmc_project/sensors/voltage/vdd_vout</p>
    <p>You can see all regulator sensor object paths via the command:</p>
    <p>&nbsp; busctl tree xyz.openbmc_project.Power.Regulators<br>
    </p>
    <p>The phosphor-regulators application reads sensors once per
      second.&nbsp; However, it only updates D-Bus if the new sensor value
      has changed more than a hysteresis amount.&nbsp; This is to avoid
      generating a bunch of D-Bus traffic for minor value changes.</p>
    <p>You can see the hysteresis values here:
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/openbmc/phosph=
or-power/blob/master/phosphor-regulators/src/dbus_sensor.cpp#L66">https://gi=
thub.com/openbmc/phosphor-power/blob/master/phosphor-regulators/src/dbus_sen=
sor.cpp#L66</a><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:8C9640C9-6E1B-4495-BA55-258DA15487=
99@gmail.com">
      <p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto;
        margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;"><o:=
p></o:p></p>
      What else do I need to so that there are dbus objects?<o:p></o:p></blo=
ckquote>
    <p>For bmcweb and Redfish to work, you need associations between the
      D-Bus sensor and two D-Bus inventory objects:<br>
    </p>
    <p>* The FRU that contains the regulator.&nbsp; This is the replaceable
      hardware item where the regulator is located.&nbsp; Some regulators ar=
e
      FRUs by themselves (replaceable).&nbsp; Some are located on larger FRU=
s
      like a motherboard.&nbsp; This is used to get presence, health info,
      and if applicable VPD.<br></p></div></blockquote><div dir=3D"ltr">Ah, i=
t did not occurs to me that a mother board as FRU is wapping regulators insi=
de an FRU. Seems obvious now.</div><blockquote type=3D"cite"><div dir=3D"ltr=
"><p>
    </p>
    <p>* The chassis that contains the regulator.&nbsp; This is required by
      Redfish since it groups sensors by chassis.</p></div></blockquote>Ok</=
div><div dir=3D"ltr"><br><blockquote type=3D"cite"><div dir=3D"ltr"><p>
    </p>
    <p>The phosphor-regulators application creates those associations
      automatically based on information in your JSON file.&nbsp; The "fru"
      property of the regulator "device" provides the first inventory
      object path.&nbsp; The "inventory_path" property of the "chassis"
      provides the second inventory path.&nbsp; Both of those are relative t=
o
      the "/xyz/openbmc_project/inventory" root path.</p>
    <p>Do the "fru" and "inventory_path" properties in your JSON file
      match the correct inventory object paths on your system?<o:p></o:p><br=
></p></div></blockquote><div dir=3D"ltr">I have a psu.json with fruConfigs, a=
nd this has</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">=E2=80=9CPsuDev=
ices=E2=80=9D: {</div><div dir=3D"ltr">&nbsp; =E2=80=9C/xyz/openbmc-project/=
inventory/system/chassis/motherboard/powersupply0=E2=80=9D : =E2=80=9C/sys/b=
us/i2c/devices/11-004f=E2=80=9D,</div><div dir=3D"ltr">}</div><div dir=3D"lt=
r"><br></div><div dir=3D"ltr">Which is the same i2c address as used by phosp=
hor-regulators.</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">And a power=
-supply-monitor-0.conf to match.</div><blockquote type=3D"cite"><div dir=3D"=
ltr"><p>
      <o:p></o:p></p>
    <blockquote type=3D"cite" cite=3D"mid:8C9640C9-6E1B-4495-BA55-258DA15487=
99@gmail.com">
      <p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust: auto;
        margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;">Not=
e
        I have not done anything to intentionally use open_power. My
        goal is to only use phosphor-regulators to expose some telemetry
        that hwmon does not support.</p>
    </blockquote>
    <p>That's fine.&nbsp; This application does not have any dependencies on=

      open_power.</p>
    <p>Let me know if you need more info.</p>
    <p>Shawn<br>
    </p>
 =20
</div></blockquote>Mike</div><div dir=3D"ltr"><br></div></body></html>=

--Apple-Mail-40DBACA6-AF50-45F9-84DC-3A5B0927B2E2--
