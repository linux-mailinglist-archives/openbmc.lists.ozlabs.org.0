Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 871B74B0045
	for <lists+openbmc@lfdr.de>; Wed,  9 Feb 2022 23:30:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvF2L13GZz3bPM
	for <lists+openbmc@lfdr.de>; Thu, 10 Feb 2022 09:30:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WHwENzjz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::232;
 helo=mail-oi1-x232.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=WHwENzjz; dkim-atps=neutral
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvF1t55Rfz2yLK
 for <openbmc@lists.ozlabs.org>; Thu, 10 Feb 2022 09:30:08 +1100 (AEDT)
Received: by mail-oi1-x232.google.com with SMTP id r27so4080063oiw.4
 for <openbmc@lists.ozlabs.org>; Wed, 09 Feb 2022 14:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=4NFAeFncs237KxPLPg0ntFRivPTL8/uR1HW7y2krhZ0=;
 b=WHwENzjzNEFQ3vOqD6uVTUCNP07sdZ1lX1bCEYfS1mhH+uAazdDL+ty1/PH9z2se0x
 2HWbFs4yt7KyOD0UrGFrkhCdQZKink00jqy5DIlj4ukQiiujSFhM6HCNESVq/okBnTrm
 l5KclWHLP0w8EtD/0gknxhLENb2SNrgIKZNlRM8HZSo90mWpIL6JDjiTBpsgX0jW6rTL
 XoNplqVEwxGNlPbrW+aAbz5uW3AYKm4GoXTizWvBbXbWat8XP4NGyDzYPrhOQOicCPZy
 +X5CDvXXi3BNqlX677/K0D13iPoQJYAFylc6pzlIio3MnxfvQua+/Q7+F6jFCtOHm8pX
 yPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=4NFAeFncs237KxPLPg0ntFRivPTL8/uR1HW7y2krhZ0=;
 b=GwYlT9mBGmdNq7EDnH0og/Ejc6qxoxS2rJ8zhD0hDDqYwHLE2jQ+zywNrCJtAhzvHF
 kEtEP20YoT4iri2oOSWpXpYICr2gGT6qelIxSaOZDJNUAiMEir4dfwytsy+ulElXDAFI
 WbUSkeXrg5JN9mgeNnDo1mwFrSBY4Z8ga4fO1GG0xCNVfy7HtVOJ/w79K1dUCY27fDDV
 KtNUu1dwydHj31BSOwZb1kjbGqlMC+83T0ZUaep5eXfjkzcGxKO/P/xBhYNrkglTbo3T
 /hkPMg0fpMUH9boHJBu90VRRVFnW28qlylHhb6VEtUlrrDZBiqAxulTVUgNLa2V6U3x+
 ui/g==
X-Gm-Message-State: AOAM533wU17SigZ7VlphMFJ6/syshSoiHOxGx8LMVQUOAAxVgWIWkeTU
 9QsCBqhhFe2j80J4ygQEC9HlHX/K6C/ozw==
X-Google-Smtp-Source: ABdhPJwRRpSQMrYIixboQoxT+4xoYIsG0zN2LQZNWFCvRhe3I+3UA9Vro1ET8FHRycuyiiDybLFMIA==
X-Received: by 2002:a05:6808:159d:: with SMTP id
 t29mr1983920oiw.271.1644445805111; 
 Wed, 09 Feb 2022 14:30:05 -0800 (PST)
Received: from smtpclient.apple ([2600:100e:b034:e017:8b9:7079:c0c1:de57])
 by smtp.gmail.com with ESMTPSA id j6sm2949648oil.36.2022.02.09.14.30.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 14:30:04 -0800 (PST)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-3490A66B-E2D0-4799-8A7D-87AEA4DDBC53
Content-Transfer-Encoding: 7bit
From: Mike Jones <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: No dbus objects for phosphor-regulators
Date: Wed, 9 Feb 2022 15:30:03 -0700
Message-Id: <6D1561E1-59FC-4126-9271-A7C8BFDB0B11@gmail.com>
References: <9aaceaed-1a8a-6a13-d650-8f4678d267d4@linux.ibm.com>
In-Reply-To: <9aaceaed-1a8a-6a13-d650-8f4678d267d4@linux.ibm.com>
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


--Apple-Mail-3490A66B-E2D0-4799-8A7D-87AEA4DDBC53
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

The journal shows an I2C error: Device or resource busy.

Does hwmon lock out phosphor-regulators if it uses the same address?

Sent from my iPad

> On Feb 1, 2022, at 10:38 AM, Shawn McCarney <shawnmm@linux.ibm.com> wrote:=

>=20
> =EF=BB=BF=20
>>>> When the target boots, using a I2C spy tool, the 0xDD command is being r=
ead periodically, suggesting that this service is processing the read comman=
d, and a query show the service is up.
>>> Sensor reading should begin when the chassis is powered on and stop when=
 the chassis is powered off.  That is because some regulators don't have pow=
er at standby or report invalid sensor readings.
>>>=20
>>=20
>> I am using the SDK, so I have not worked on chassis power, so I don=E2=80=
=99t know if it is powered or not, but this gives me a good hint about the p=
roblem. Even so, the read command in config.json is getting polled. The othe=
r config item to modify the voltage did not occur.
> It sounds like at least part of the problem might be the systemd service f=
iles not running.  The regulators service files are located in https://githu=
b.com/openbmc/phosphor-power/tree/master/services.
>=20
> * phosphor-regulators.service:  This one launches the regulators app.  Thi=
s must be happening since you are a getting journal message about it loading=
 the JSON config file.
>=20
> * phosphor-regulators-config.service:  This is what causes the configurati=
on entries to be executed in the JSON file.  This should happen early in the=
 process of powering on the chassis before the regulators have received powe=
r (been enabled).
>=20
> * phosphor-regulators-monitor-enable.service:  This enables sensor and pha=
se fault monitoring.  This should happen during the chassis power on after t=
he regulators have received power (been enabled).
>=20
> * phosphor-regulators-monitor-disable.service:  This disables sensor and p=
hase fault monitoring.  This should happen early when the chassis is being p=
owered off.
>=20
> Sounds like maybe the last 3 service files are being run?  You can tell fo=
r sure by looking in the journal (e.g. 'journalctl | grep -i regulator').  T=
he Wants/Before/After dependencies in the files determine when they are run.=
  Perhaps the systemd targets they are dependent on aren't running on your s=
ystem?
>=20
> You can manually cause the regulators application to perform configuration=
 and sensor monitoring using the 'regsctl' program.  Look at the service fil=
es to see the proper regsctl command to use.  This is an implementation deta=
il and could change in the future, but it may help with debugging right now.=

>=20
> Regarding the fact the 0xDD is being read, is it possibly being read by an=
other application like hwmon?
>=20
> Note that the phosphor-regulators application does direct I2C reads and wr=
ites using the i2c-dev subsystem.  This is the same code path as i2cget/i2cs=
et.  This means it should not be used in conjunction with a device driver on=
 the regulator.  Otherwise there may be interleaved I2C commands going to th=
e device, which can be problematic.
>=20
>>=20
>> Given I am using an Aspeed EVK, is there an example for how to turn on a c=
hassis with a GPIO, or a dbus operation, or an automatic turn on at boot?
>>=20
> Sorry, I'm not very familiar with that.  Others on this list could help mo=
re with that as a separate question thread.  I use the 'obmcutil chassison' c=
ommand.  Since that is a script, you could check out what it is doing and se=
e if that would help.
>=20
>>=20
>>> The phosphor-regulators application creates those associations automatic=
ally based on information in your JSON file.  The "fru" property of the regu=
lator "device" provides the first inventory object path.  The "inventory_pat=
h" property of the "chassis" provides the second inventory path.  Both of th=
ose are relative to the "/xyz/openbmc_project/inventory" root path.
>>>=20
>>> Do the "fru" and "inventory_path" properties in your JSON file match the=
 correct inventory object paths on your system?
>>>=20
>> I have a psu.json with fruConfigs, and this has
>>=20
>> =E2=80=9CPsuDevices=E2=80=9D: {
>>   =E2=80=9C/xyz/openbmc-project/inventory/system/chassis/motherboard/powe=
rsupply0=E2=80=9D : =E2=80=9C/sys/bus/i2c/devices/11-004f=E2=80=9D,
>> }
>>=20
>> Which is the same i2c address as used by phosphor-regulators.
>>=20
>> And a power-supply-monitor-0.conf to match.
>>=20
> It sounds like you are using a power supply application from the same repo=
sitory.  That is no problem, but they are completely separate applications t=
hat do no share any data/functionality.  So I don't think the work you've do=
ne with the PSU app would impact the regulators app.
>=20
> It may be a typo above, but a voltage regulator would not normally be at t=
he same I2C address as a power supply.  The term 'power supply' in that repo=
 means the device that converts AC/DC wall power to 12V DC to the system (e.=
g. the big brick).  The term 'voltage regulator' means the devices that step=
 12V DC from the power supply down to the levels needed by system components=
 (like 3.3V, 1.1V, etc.).

--Apple-Mail-3490A66B-E2D0-4799-8A7D-87AEA4DDBC53
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">The journal shows an I2C error: Device or r=
esource busy.<div><br></div><div>Does hwmon lock out phosphor-regulators if i=
t uses the same address?<br><br><div dir=3D"ltr">Sent from my iPad</div><div=
 dir=3D"ltr"><br><blockquote type=3D"cite">On Feb 1, 2022, at 10:38 AM, Shaw=
n McCarney &lt;shawnmm@linux.ibm.com&gt; wrote:<br><br></blockquote></div><b=
lockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF
 =20
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"=
>
 =20
 =20
    <br>
    <blockquote type=3D"cite" cite=3D"mid:FC1C96F9-CA9C-45B8-9FF5-26CF041098=
52@gmail.com">
      <div dir=3D"ltr">
        <blockquote type=3D"cite">
          <div dir=3D"ltr">
            <p> </p>
            <blockquote type=3D"cite" cite=3D"mid:8C9640C9-6E1B-4495-BA55-25=
8DA1548799@gmail.com">
              <p class=3D"MsoNormal" style=3D"-webkit-text-size-adjust:
                auto; margin: 0in; font-size: 11pt; font-family:
                Calibri, sans-serif;">When the target boots, using a I2C
                spy tool, the 0xDD command is being read periodically,
                suggesting that this service is processing the read
                command, and a query show the service is up.</p>
            </blockquote>
            <p>Sensor reading should begin when the chassis is powered
              on and stop when the chassis is powered off.&nbsp; That is
              because some regulators don't have power at standby or
              report invalid sensor readings.</p>
          </div>
        </blockquote>
        <div><br>
        </div>
        <div>I am using the SDK, so I have not worked on chassis power,
          so I don=E2=80=99t know if it is powered or not, but this gives me=
 a
          good hint about the problem. Even so, the read command in
          config.json is getting polled. The other config item to modify
          the voltage did not occur.</div>
      </div>
    </blockquote>
    <p>It sounds like at least part of the problem might be the systemd
      service files not running.&nbsp; The regulators service files are
      located in
      <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/openbmc/=
phosphor-power/tree/master/services">https://github.com/openbmc/phosphor-pow=
er/tree/master/services</a>.</p>
    <p>* phosphor-regulators.service:&nbsp; This one launches the regulators=

      app.&nbsp; This must be happening since you are a getting journal
      message about it loading the JSON config file.</p>
    <p>* phosphor-regulators-config.service:&nbsp; This is what causes the
      configuration entries to be executed in the JSON file.&nbsp; This
      should happen early in the process of powering on the chassis
      before the regulators have received power (been enabled).<br>
    </p>
    <p>* phosphor-regulators-monitor-enable.service:&nbsp; This enables
      sensor and phase fault monitoring.&nbsp; This should happen during the=

      chassis power on after the regulators have received power (been
      enabled).</p>
    <p>* phosphor-regulators-monitor-disable.service:&nbsp; This disables
      sensor and phase fault monitoring.&nbsp; This should happen early when=

      the chassis is being powered off.</p>
    <p>Sounds like maybe the last 3 service files are being run?&nbsp; You
      can tell for sure by looking in the journal (e.g. 'journalctl |
      grep -i regulator').&nbsp; The Wants/Before/After dependencies in the
      files determine when they are run.&nbsp; Perhaps the systemd targets
      they are dependent on aren't running on your system?</p>
    <p>You can manually cause the regulators application to perform
      configuration and sensor monitoring using the 'regsctl' program.&nbsp;=

      Look at the service files to see the proper regsctl command to
      use.&nbsp; This is an implementation detail and could change in the
      future, but it may help with debugging right now.</p>
    <p>Regarding the fact the 0xDD is being read, is it possibly being
      read by another application like hwmon?</p>
    <p>Note that the phosphor-regulators application does direct I2C
      reads and writes using the i2c-dev subsystem.&nbsp; This is the same
      code path as i2cget/i2cset.&nbsp; This means it should not be used in
      conjunction with a device driver on the regulator.&nbsp; Otherwise
      there may be interleaved I2C commands going to the device, which
      can be problematic.<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:FC1C96F9-CA9C-45B8-9FF5-26CF041098=
52@gmail.com">
      <div dir=3D"ltr">
        <div dir=3D"ltr"><br>
        </div>
        Given I am using an Aspeed EVK, is there an example for how to
        turn on a chassis with a GPIO, or a dbus operation, or an
        automatic turn on at boot?<br>
        <br>
      </div>
    </blockquote>
    <p>Sorry, I'm not very familiar with that.&nbsp; Others on this list
      could help more with that as a separate question thread.&nbsp; I use
      the 'obmcutil chassison' command.&nbsp; Since that is a script, you
      could check out what it is doing and see if that would help.<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:FC1C96F9-CA9C-45B8-9FF5-26CF041098=
52@gmail.com">
      <div dir=3D"ltr"><br>
        <blockquote type=3D"cite">
          <div dir=3D"ltr">
            <p> </p>
            <p>The phosphor-regulators application creates those
              associations automatically based on information in your
              JSON file.&nbsp; The "fru" property of the regulator "device"
              provides the first inventory object path.&nbsp; The
              "inventory_path" property of the "chassis" provides the
              second inventory path.&nbsp; Both of those are relative to the=

              "/xyz/openbmc_project/inventory" root path.</p>
            <p>Do the "fru" and "inventory_path" properties in your JSON
              file match the correct inventory object paths on your
              system?<o:p></o:p><br>
            </p>
          </div>
        </blockquote>
        <div dir=3D"ltr">I have a psu.json with fruConfigs, and this has</di=
v>
        <div dir=3D"ltr"><br>
        </div>
        <div dir=3D"ltr">=E2=80=9CPsuDevices=E2=80=9D: {</div>
        <div dir=3D"ltr">&nbsp;
          =E2=80=9C/xyz/openbmc-project/inventory/system/chassis/motherboard=
/powersupply0=E2=80=9D
          : =E2=80=9C/sys/bus/i2c/devices/11-004f=E2=80=9D,</div>
        <div dir=3D"ltr">}</div>
        <div dir=3D"ltr"><br>
        </div>
        <div dir=3D"ltr">Which is the same i2c address as used by
          phosphor-regulators.</div>
        <div dir=3D"ltr"><br>
        </div>
        <div dir=3D"ltr">And a power-supply-monitor-0.conf to match.<br>
          <br>
        </div>
      </div>
    </blockquote>
    <p>It sounds like you are using a power supply application from the
      same repository.&nbsp; That is no problem, but they are completely
      separate applications that do no share any data/functionality.&nbsp; S=
o
      I don't think the work you've done with the PSU app would impact
      the regulators app.</p>
    <p>It may be a typo above, but a voltage regulator would not
      normally be at the same I2C address as a power supply.&nbsp; The term
      'power supply' in that repo means the device that converts AC/DC
      wall power to 12V DC to the system (e.g. the big brick).&nbsp; The ter=
m
      'voltage regulator' means the devices that step 12V DC from the
      power supply down to the levels needed by system components (like
      3.3V, 1.1V, etc.).</p>
 =20

</div></blockquote></div></body></html>=

--Apple-Mail-3490A66B-E2D0-4799-8A7D-87AEA4DDBC53--
