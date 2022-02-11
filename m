Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B815A4B2941
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 16:43:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwHvD2JGXz2x9D
	for <lists+openbmc@lfdr.de>; Sat, 12 Feb 2022 02:43:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qovH8WZG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c32;
 helo=mail-oo1-xc32.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qovH8WZG; dkim-atps=neutral
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwHtr6Tpmz2x9R
 for <openbmc@lists.ozlabs.org>; Sat, 12 Feb 2022 02:42:42 +1100 (AEDT)
Received: by mail-oo1-xc32.google.com with SMTP id
 c7-20020a4ad207000000b002e7ab4185d2so10746710oos.6
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 07:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=DdwtRxttqlCc5SWbIW/H4agXUpPyMJ6mPKkMf7k7lgg=;
 b=qovH8WZGtIK75b3lAg1sapIE+yjtFWEVEp8JGXFMXaproj3g/XtKlMSxylJapTJe++
 UUx+A/Gt2R/8QSKRLR9F2CrPYaKCrhFgFZBi9qrVp8i5EjcRWktnCiZf6SrN60rmOuRS
 eutCPAaVi6sS/PBGAqmLLUEjJnQRGHkjsh2axTUkpf7vrv2nePaIDDRLYt3HMAZnWGa+
 enbfaIXSyq7tb8aygA2YRYEC8UIjUz2ItsRh/1HFoK4HcJx/9srYDX93FmNa8yFMCLs4
 7L6NlgqDmOUBgB3+mkL1zDI6cNQavtN7vOg7Ob1cuPcrcYx5TM+pzg6qlmWoeYeKP75r
 Z12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=DdwtRxttqlCc5SWbIW/H4agXUpPyMJ6mPKkMf7k7lgg=;
 b=5beu69jQipRNwTDlVVIzZpR7A5WME6LM5luR3lz2/GVlLTjqp0Uvhu7ygX+/q673GM
 pIshCPXJQX6metpWLs7X2paj8W+YqPayQWW4yjtuBTSnTKnnM3BEqiBMRY3p8i/svN8M
 XkXQnYwSJ6hEgPqv1OCVP3HwB77LUY77TZQ7JjrtRObQU4U3WPhaGWou3yMmTq7VFgi/
 2QTFaTVeLMz42mooZrWJQ3kgmK8OriSyfLPQBPilmrZiFnQAH9NgVY28hkajdgdpxCfw
 V3hRsGHG1BJSfrujsqGueEACqZCQ6NPHKr7lNlEp11e2yYwxdz/IGlvT+V6VRrrGzq6A
 legg==
X-Gm-Message-State: AOAM533b+cmgWhQV3THgkY58ZfAv0iaP8SXa3IfjOPZM89IL8IUiFBDX
 T21BX4CvDEhTpDzQaBi/DcX/ViX2jQMfPA==
X-Google-Smtp-Source: ABdhPJw49WHheG2Ei15P6lJXwEBtpWQXUk04IWydxdX7MZtkaE3GcQWrh7wWCcBQ2TQdV5f3D0ktEg==
X-Received: by 2002:a05:6870:4513:: with SMTP id
 e19mr364582oao.328.1644594159578; 
 Fri, 11 Feb 2022 07:42:39 -0800 (PST)
Received: from smtpclient.apple ([37.19.221.33])
 by smtp.gmail.com with ESMTPSA id bh7sm6116339oib.6.2022.02.11.07.42.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 11 Feb 2022 07:42:39 -0800 (PST)
From: Mike Jones <proclivis@gmail.com>
Message-Id: <DCAD9B4C-D047-40A0-B4AD-1D21C0CF6197@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_5A15258E-FB50-4A32-9F1E-280B7D0FFD0E"
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: No dbus objects for phosphor-regulators
Date: Fri, 11 Feb 2022 08:42:37 -0700
In-Reply-To: <1858988f-100f-b3b4-c599-80cddaa7247a@linux.ibm.com>
To: Shawn McCarney <shawnmm@linux.ibm.com>
References: <9aaceaed-1a8a-6a13-d650-8f4678d267d4@linux.ibm.com>
 <6D1561E1-59FC-4126-9271-A7C8BFDB0B11@gmail.com>
 <1858988f-100f-b3b4-c599-80cddaa7247a@linux.ibm.com>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
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


--Apple-Mail=_5A15258E-FB50-4A32-9F1E-280B7D0FFD0E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Shawn,

I was mainly surprised because a conversation I had with Guenter, if I =
remember correctly, suggested that /dev/i2c calls from user space work =
with hwmon, because hwmon does not lock the i2c except when using it.

So I assumed that in this case, it was the polling of hwmon that was =
just keeping it locked enough to conflict with phosphor-regulators and =
then it gives up.

I could just not use hwmon at all use phosphor-regulators for all =
telemetry, but this seemed like more work.

Also, I will need to figure out how to connect phosphor-regulators =
telemetry to Redfish and the WebUI. Are there examples of how to do =
that?

Mike

> On Feb 11, 2022, at 8:32 AM, Shawn McCarney <shawnmm@linux.ibm.com> =
wrote:
>=20
> On 2/9/2022 4:30 PM, Mike Jones wrote:
>> The journal shows an I2C error: Device or resource busy.
>>=20
>> Does hwmon lock out phosphor-regulators if it uses the same address?
>>=20
> phosphor-regulators currently communicates directly with voltage =
regulators using i2c-dev; it does not use device drivers.
>=20
> The reason is that most regulator drivers provide either no or very =
limited ability to configure regulators.  For the systems I work on, we =
need to do extensive regulator configuration to fine tune things (output =
voltage, pgood min/max, timing, etc.)  Redundant phase fault detection =
is also pretty device-specific and on involves communicating with =
multiple devices.
>=20
> I have not tested using phosphor-regulators when a driver is bound to =
the regulator, but I suspect you may be right.  I assume hwmon is using =
read sensor data from a driver, and the driver being bound is stopping =
the phosphor-regulators read from succeeding.
>=20
> Thanks,
>=20
> Shawn
>=20


--Apple-Mail=_5A15258E-FB50-4A32-9F1E-280B7D0FFD0E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"">Shawn,<div class=3D""><br class=3D""></div><div class=3D"">I =
was mainly surprised because a conversation I had with Guenter, if I =
remember correctly, suggested that /dev/i2c calls from user space work =
with hwmon, because hwmon does not lock the i2c except when using =
it.</div><div class=3D""><br class=3D""></div><div class=3D"">So I =
assumed that in this case, it was the polling of hwmon that was just =
keeping it locked enough to conflict with phosphor-regulators and then =
it gives up.</div><div class=3D""><br class=3D""></div><div class=3D"">I =
could just not use hwmon at all use phosphor-regulators for all =
telemetry, but this seemed like more work.</div><div class=3D""><br =
class=3D""></div><div class=3D"">Also, I will need to figure out how to =
connect phosphor-regulators telemetry to Redfish and the WebUI. Are =
there examples of how to do that?</div><div class=3D""><br =
class=3D""></div><div class=3D"">Mike<br class=3D""><div =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Feb 11, 2022, at 8:32 AM, Shawn McCarney &lt;<a =
href=3D"mailto:shawnmm@linux.ibm.com" =
class=3D"">shawnmm@linux.ibm.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D"">
 =20
    <meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3DUTF-8" class=3D"">
 =20
  <div class=3D"">
    On 2/9/2022 4:30 PM, Mike Jones wrote:<br class=3D"">
    <blockquote type=3D"cite" =
cite=3D"mid:6D1561E1-59FC-4126-9271-A7C8BFDB0B11@gmail.com" class=3D"">
     =20
      <meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3DUTF-8" class=3D"">
     =20
      The journal shows an I2C error: Device or resource busy.
      <div class=3D""><br class=3D"">
      </div>
      <div class=3D"">Does hwmon lock out phosphor-regulators if it uses =
the same
        address?<br class=3D"">
        <br class=3D"">
      </div>
    </blockquote><p class=3D"">phosphor-regulators currently =
communicates directly with voltage
      regulators using i2c-dev; it does not use device drivers.</p><p =
class=3D"">The reason is that most regulator drivers provide either no =
or
      very limited ability to configure regulators.&nbsp; For the =
systems I
      work on, we need to do extensive regulator configuration to fine
      tune things (output voltage, pgood min/max, timing, etc.)&nbsp;
      Redundant phase fault detection is also pretty device-specific and
      on involves communicating with multiple devices.<br class=3D"">
    </p><p class=3D"">I have not tested using phosphor-regulators when a =
driver is
      bound to the regulator, but I suspect you may be right.&nbsp; I =
assume
      hwmon is using read sensor data from a driver, and the driver
      being bound is stopping the phosphor-regulators read from
      succeeding.<br class=3D"">
      <br class=3D"">
      Thanks,</p><p class=3D"">Shawn<br class=3D"">
    </p>
  </div>

</div></blockquote></div><br class=3D""></div></div></body></html>=

--Apple-Mail=_5A15258E-FB50-4A32-9F1E-280B7D0FFD0E--
