Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E1B756B05
	for <lists+openbmc@lfdr.de>; Mon, 17 Jul 2023 19:54:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=TTUojyYS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4V884Qbbz2ygj
	for <lists+openbmc@lfdr.de>; Tue, 18 Jul 2023 03:54:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=TTUojyYS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4V7X4dfwz2yGd
	for <openbmc@lists.ozlabs.org>; Tue, 18 Jul 2023 03:53:42 +1000 (AEST)
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-403b36a4226so24348351cf.0
        for <openbmc@lists.ozlabs.org>; Mon, 17 Jul 2023 10:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689616419; x=1692208419;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FbH1oPPaUg4p/W9by4CJVcyo0uUgBMScqHqpVlR336E=;
        b=TTUojyYSwCzy7dqMCCydi7IW69Q/Z54J7xNk4kPMPsW3qoohb4cc7myJLgoS6rBEQ7
         kWxhw5vgFkhNZEQCrvNDaB+m62FP3Ixb+BquoPKKWbQ5WneFIZ6m2IQvESuPlGAJWh3M
         XBs+BWS27dDTkpCo8kRYLqs/BuBwI3dh2MEMdjQ7zhzYjmBE1TGZsfsnkw4+Mv7GKn/Q
         1uIFwm6hVQG4EmJRklP3YH28tFAtYEYpYRNMTicM++iW6ohmsM2KWNXgWmaQYhX15J3o
         JEjx6+RCsu/pmbxxMMLAg4lZCQSCwRYzprmbf0wFgim3jeYbfpXru99SqZINUejgioY8
         3hlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689616419; x=1692208419;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FbH1oPPaUg4p/W9by4CJVcyo0uUgBMScqHqpVlR336E=;
        b=eyK/P1BRrRFFstp6usjIVZB2pMdwizgmI0xJzbqQj30SxP27ztEwz4cS8pwK350jyT
         oyC+3ueq0dcYKtVoGctQcVaUsnGyN8c/IypK9p+ZJqgAukX0oW8d7+N9WecrKPdVzFrd
         Cg0I4HHHKOcExl2pePNgEqRrdB+V9UlYCgN0M3CkIdbRyFeDIngE13PY9Jb3rBei/SBA
         qNA2kKYOjdLSbnzlc2D7gNXt/QLGVEQopCvyA2FIxXOIgUqo2DQTU3mrHp+vQ87roRke
         BpbBpRlPJ/TRq4iNxsN1YQzVId8c3cQYEUhr19oe/47Xv7BeeMbHVs39GZ4PtNow2TtF
         WVYQ==
X-Gm-Message-State: ABy/qLYpIY7VK0UpRUMS4ZqXl3V5Bj0+vfuT5qYU4ulzQC0r+6SMsmy1
	UHX7bNVTOLvhrB9t3Xohz/qEYqcG8Gs=
X-Google-Smtp-Source: APBJJlE/lB6xL8EqcnN8+K19q5GQ8+eZ75e7Ts45Vko3uP3xDtbKk6apXcjIb4CTucAtrGf54HH7Rw==
X-Received: by 2002:a05:622a:345:b0:403:bb70:6e4d with SMTP id r5-20020a05622a034500b00403bb706e4dmr13274768qtw.0.1689616418554;
        Mon, 17 Jul 2023 10:53:38 -0700 (PDT)
Received: from smtpclient.apple ([67.254.249.247])
        by smtp.gmail.com with ESMTPSA id f12-20020ac8134c000000b00403e80cad67sm27064qtj.41.2023.07.17.10.53.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jul 2023 10:53:38 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Message-Id: <182085B9-822B-419C-A3B6-7FC10214D60D@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_58CF8E1B-D6D3-48D6-BE29-61E648E3478A"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: Re: Polling Host state
Date: Mon, 17 Jul 2023 13:53:35 -0400
In-Reply-To: <2a926d1f-2f3b-6608-d32c-7d56f7440e25@inventron.com.tr>
To: Zehra Ozdemir <zehra.ozdemir@inventron.com.tr>
References: <2a926d1f-2f3b-6608-d32c-7d56f7440e25@inventron.com.tr>
X-Mailer: Apple Mail (2.3696.120.41.1.3)
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
Cc: openbmc@lists.ozlabs.org, "M. Erhan Yigitbasi" <erhan.yigitbasi@inventron.com.tr>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_58CF8E1B-D6D3-48D6-BE29-61E648E3478A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Jul 14, 2023, at 12:01 PM, Zehra Ozdemir =
<zehra.ozdemir@inventron.com.tr> wrote:
>=20
> Hello to all,
>=20
> When we try to shutdown the host over its operationg system, we saw =
that host-state-manager does not detect the pin signal and does not =
change the CurrentHostState property of xyz.openbmc_project.State.Host =
dbus interface. As far as we have looked through the source code of =
state manager, we have not been able to find a polling method for host =
state. There is just only one method called by scanGpioPin in =
host_condition_main.cpp which controls host pin signal by using =
gpio-line in dtb to write host's situation to CurrentFirmwareCondition =
value of xyz.openbmc_project.State.HostCondition.Gpio dbus interface. =
However, there is no polling to change host state for this =
CurrentFirmwareCondition value,  that can be triggered without using =
bmcweb or buttons .
>=20
> Also there is obmc-op-control-power project to for polling pgood pin =
which is defined in  gpio_defs.json to  controls the pgood property of =
org.openbmc.control.Power interface for chassis-state-manager. If host =
is off, pgood is also 0. So we patched this project in poll_pgood method =
by using sd_bus methods of libsystemd-dev. When poll_pgood method =
detects pgood value as off, we control the the current state value of =
the host and if they are not parallel with each other, we set the host =
state and it seems to work correctly.
>=20
> Could you please give us some information about if there is any proper =
implementation which we missed to detect host state by polling host pin =
signal or not?
>=20
Hi Zehera,

phosphor-state-manager is just a wrapper around systemd targets. So It =
will say the chassis is off when it sees the =
obmc-chassis-poweroff@.target complete. It will set the host state to =
off when it sees the obmc-host-stop@.target complete. So what you have =
to do is put the systemd service needed for your system to power off in =
those targets, have them do whatever special logic your system needs, =
and then when the complete, the associated systemd targets will =
complete.

On some systems, PLDM is used to coordinate power off with the host. As =
you noted there=E2=80=99s also the GPIO driven host-condition =
(https://github.com/openbmc/phosphor-state-manager/tree/master/host_condit=
ion_gpio =
<https://github.com/openbmc/phosphor-state-manager/tree/master/host_condit=
ion_gpio>) but that=E2=80=99s more for the BMC reset logic, to know if =
the host is running when the BMC comes back from a reset.

I did a youtube overview of systemd and openbmc up at =
https://www.youtube.com/watch?v=3DJGUyCIAsYGU =
<https://www.youtube.com/watch?v=3DJGUyCIAsYGU> which may help clarify =
some of these questions.

x86-power-control is an alternative to phosphor-state-manager which =
depending on your system may work better (but I have minimal experience =
there).

Andrew=

--Apple-Mail=_58CF8E1B-D6D3-48D6-BE29-61E648E3478A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
line-break: after-white-space;" class=3D""><br class=3D""><br =
class=3D""><blockquote type=3D"cite" class=3D"">On Jul 14, 2023, at =
12:01 PM, Zehra Ozdemir &lt;<a =
href=3D"mailto:zehra.ozdemir@inventron.com.tr" =
class=3D"">zehra.ozdemir@inventron.com.tr</a>&gt; wrote:<br class=3D""><br=
 class=3D"">Hello to all,<br class=3D""><br class=3D"">When we try to =
shutdown the host over its operationg system, we saw that =
host-state-manager does not detect the pin signal and does not change =
the CurrentHostState property of xyz.openbmc_project.State.Host dbus =
interface. As&nbsp;far as we have looked through the source code of =
state manager, we have not been able to find a polling method for host =
state. There is just only one method called by scanGpioPin in =
host_condition_main.cpp which controls host pin&nbsp;signal by using =
gpio-line in dtb to write host's situation to CurrentFirmwareCondition =
value of xyz.openbmc_project.State.HostCondition.Gpio dbus interface. =
However, there is no polling to change host state for =
this&nbsp;CurrentFirmwareCondition value, &nbsp;that can be triggered =
without using bmcweb or buttons .<br class=3D""><br class=3D"">Also =
there is obmc-op-control-power project to for polling pgood pin which is =
defined in &nbsp;gpio_defs.json to &nbsp;controls the pgood property of =
org.openbmc.control.Power interface for chassis-state-manager. If host =
is off, pgood is also 0.&nbsp;So we patched this project in poll_pgood =
method by using sd_bus methods of libsystemd-dev. When poll_pgood method =
detects pgood value as off, we control the the current state value of =
the host and if they are not parallel with&nbsp;each other, we set the =
host state and it seems to work correctly.<br class=3D""><br =
class=3D"">Could you please give us some information about if there is =
any proper implementation which we missed to detect host state by =
polling host pin signal or not?<br class=3D""><br =
class=3D""></blockquote>Hi Zehera,<div class=3D""><br class=3D""><div =
class=3D""><div class=3D"">phosphor-state-manager is just a wrapper =
around systemd targets. So It will say the chassis is off when it sees =
the obmc-chassis-poweroff@.target complete. It will set the host state =
to off when it sees the obmc-host-stop@.target complete. So what you =
have to do is put the systemd service needed for your system to power =
off in those targets, have them do whatever special logic your system =
needs, and then when the complete, the associated systemd targets will =
complete.</div><div class=3D""><br class=3D""></div><div class=3D"">On =
some systems, PLDM is used to coordinate power off with the host. As you =
noted there=E2=80=99s also the GPIO driven host-condition (<a =
href=3D"https://github.com/openbmc/phosphor-state-manager/tree/master/host=
_condition_gpio" =
class=3D"">https://github.com/openbmc/phosphor-state-manager/tree/master/h=
ost_condition_gpio</a>) but that=E2=80=99s more for the BMC reset logic, =
to know if the host is running when the BMC comes back from a =
reset.</div><div class=3D""><br class=3D""></div><div class=3D"">I did a =
youtube overview of systemd and openbmc up at&nbsp;<a =
href=3D"https://www.youtube.com/watch?v=3DJGUyCIAsYGU" =
class=3D"">https://www.youtube.com/watch?v=3DJGUyCIAsYGU</a>&nbsp;which =
may help clarify some of these questions.</div><div class=3D""><br =
class=3D""></div><div class=3D"">x86-power-control is an alternative to =
phosphor-state-manager which depending on your system may work better =
(but I have minimal experience there).</div><div class=3D""><br =
class=3D""></div><div class=3D"">Andrew</div></div></div></body></html>=

--Apple-Mail=_58CF8E1B-D6D3-48D6-BE29-61E648E3478A--
