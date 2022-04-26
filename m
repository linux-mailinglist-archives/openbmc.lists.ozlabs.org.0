Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC30750EE32
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 03:44:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnPnD50SMz3bd5
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 11:44:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=mWRvqyit;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ufispace.com (client-ip=2607:f8b0:4864:20::b30;
 helo=mail-yb1-xb30.google.com; envelope-from=jordan.chang@ufispace.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ufispace-com.20210112.gappssmtp.com
 header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=mWRvqyit; dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnPmm1HbXz2xZW
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 11:43:49 +1000 (AEST)
Received: by mail-yb1-xb30.google.com with SMTP id v59so17431035ybi.12
 for <openbmc@lists.ozlabs.org>; Mon, 25 Apr 2022 18:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ufispace-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Imo3cW622wqho5INhCPkz0pWwgmMZeHfMg6Pp2D6rd4=;
 b=mWRvqyitItH9+VgN0fIzc8efpzCzyDSL29fYy8QO+hTRn1+eZwp/8s/6d2yHqYzWRb
 hmdSAhlN6nk9DZxDQyqeqXcZN+jtQ4K+7izEoklh4xfS4EVROH8oL5044FG8AQn7iT0A
 MqLyiEsYmAWIwFSEHTi1L6RYqUXpmH6eYpdaCAceGp3AD2nrTWbykeoTvcA/XdfNiHqs
 QmYnI2t/v0xx/GxVWNGn9fCzet0vxJJdbsrgNvJP3Z8Kjes9pRpo7ELgqkNb3gTNSaO+
 XelTTjCceHb5b5D9jqIg3TSLEUPGnEx6b8NriBzJXjtRiyUrOg0AryU8YssZ+XWjUxXL
 uNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Imo3cW622wqho5INhCPkz0pWwgmMZeHfMg6Pp2D6rd4=;
 b=WClh8RdHpdd3yEzlQyijnTFMVlhCrPjitaOpXXFw/Ra248x2z6wNEr04L+Yp36Pau5
 Zai3HbppIeg6QxVI/6q4Qq+6/ldyN+zXqJK0CYDAJnR/FuYW7HHdybj3nKm2n5AKB+Mg
 N+gNz0JfuQ8W4VUpPMA13t196auGP8g+kysLCGoaHyrQxdGnnxSDxwYZarPAtWe5+hQh
 Xur0bRzIPtifBSSdFiVa7GgCALhwTE4olChYXo8BWgR/egZ9PIWArE/Y1B1YXg6y+uV/
 4fpdtvj87Zg8x0bsBBU8zNNYefV/EbT6/49ERONxOyn4OMcVkrW7MWaXLSqXiHFD3ry9
 Q7uw==
X-Gm-Message-State: AOAM5321qxQ6j3WzkxZT2T+plq2WeGeO2jo3IXbQBPTF4scRlqVFXoTW
 XgnRjQZ0euqaSN6jEE970BOOHama88Pvayl9k5NTGF7EY90tnWmgNF0bIg4OUjvjVejSTHrxkEZ
 1wZtg5XaX4WAzfw0c6NHHggyWBe/G
X-Google-Smtp-Source: ABdhPJwDtfuObyzr7G1XzuCv9MjybzJ9T8kGrb0yZS8Pq+bhPWjTJIUUVTBjUzQ0noXn1kFLqo6MFQikv7Tpbw+j24Y=
X-Received: by 2002:a25:b810:0:b0:644:f485:f842 with SMTP id
 v16-20020a25b810000000b00644f485f842mr18921160ybj.70.1650937426001; Mon, 25
 Apr 2022 18:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ3czeTVv-587VJbR2YuZz1jwOUKskzOzk=HRpmW040VL=ORrA@mail.gmail.com>
 <HK0PR03MB5090B027A3C479E7B01744F5CFF29@HK0PR03MB5090.apcprd03.prod.outlook.com>
 <HK0PR03MB5090A10C6ED510BC75022242CFFB9@HK0PR03MB5090.apcprd03.prod.outlook.com>
In-Reply-To: <HK0PR03MB5090A10C6ED510BC75022242CFFB9@HK0PR03MB5090.apcprd03.prod.outlook.com>
From: Jordan Chang <jordan.chang@ufispace.com>
Date: Tue, 26 Apr 2022 09:43:35 +0800
Message-ID: <CAJ3czeQYPLyf0WwkhGM9=q_yHtXKurJ546fv5NRg_C-cKs+LNw@mail.gmail.com>
Subject: Re: [phosphor-state-manager] Error reading HostFirmware condition,
 error: sd_bus_call: org.freedesktop.DBus.Error.ServiceUnknown
To: "CHLI30@nuvoton.com" <CHLI30@nuvoton.com>
Content-Type: multipart/alternative; boundary="000000000000d2d6cd05dd84d22d"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000d2d6cd05dd84d22d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tim,
Thank you for your reply. Actually, I am wondering how did
*xyz.openbmc_project.Control.Host* service get the HostFirmwareCondition.
How could I get the
HostFirmwareCondition via this service? Any comments or suggestions would
be appreciated.

Best regards,
Jordan

CHLI30@nuvoton.com <CHLI30@nuvoton.com> =E6=96=BC 2022=E5=B9=B44=E6=9C=8826=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=888:06=E5=AF=AB=E9=81=93=EF=BC=
=9A

> Hi Jordan,
>
> According your busctl test command that you can get
> CurrentFirmwareCondition property currently.
>
> Here, the service is xyz.openbmc_project.State.HostCondition.Gpio and pat=
h
> is /xyz/openbmc_project/Gpios/host0.
>
>
>
> root@siad:~# busctl get-property *xyz.openbmc_project.State.HostCondition=
.Gpio
> *  */xyz/openbmc_project/Gpios/host0*
> xyz.openbmc_project.Condition.HostFirmware  CurrentFirmwareCondition
>
> s "xyz.openbmc_project.Condition.HostFirmware.FirmwareCondition.Running"
>
>
>
> However, your error log seems using wrong service and path to get this
> CurrentFirmwareCondition property.
>
> Apr 18 08:19:24 siad phosphor-host-state-manager[366]: Ufi:
> *path=3D/xyz/openbmc_project/control/host0*
>
> Apr 18 08:19:24 siad phosphor-host-state-manager[366]: Ufi:
> *services=3Dxyz.openbmc_project.Control.Host*
>
> Apr 18 08:19:24 siad phosphor-host-state-manager[366]: Error reading
> HostFirmware condition, error: sd_bus_call:
> org.freedesktop.DBus.Error.ServiceUnknown: The name is not activatable,
> service: xyz.openbmc_project.Control.Host path:
> /xyz/openbmc_project/control/host0
>
>
>
> If you change path and services as your busctl test command that might be
> fixed your issue.
>
> Hopefully, I didn=E2=80=99t misunderstand your question. Thanks.
>
>
>
> Best regards,
>
> Tim
>
>
>
> *From:* openbmc <openbmc-bounces+chli30=3Dnuvoton.com@lists.ozlabs.org> *=
On
> Behalf Of *Jordan Chang
> *Sent:* Monday, April 18, 2022 6:31 PM
> *To:* openbmc@lists.ozlabs.org
> *Subject:* [phosphor-state-manager] Error reading HostFirmware condition,
> error: sd_bus_call: org.freedesktop.DBus.Error.ServiceUnknown
>
>
>
> Hi Sir/Madam,
> I am implementing the power control mechanisms for my platform, and
> encounter the problem in below:
> *phosphor-host-state-manager[341]: Error reading HostFirmware condition,
> error: sd_bus_call: org.freedesktop.DBus.Error.ServiceUnknown: The name i=
s
> not activatable, service: xyz.openbmc_project.Control.Host path:
> /xyz/openbmc_project/control/host0*
>
>
>
> I am using the host0-ready gpio pin to determine the HostFirmwareConditio=
n
> is running or not. However, the service
> *xyz.openbmc_project.State.Host.HostState* could not be established since
> the dbus call method of  *xyz.openbmc_project.Control.Host *returns an
> error. Therefore, I have printed some debug messages starting with Ufi to
> ensure the xyz.openbmc_project.State.HostCondition.Gpio service is involv=
ed
> in phosphor-host-state-manager. Not sure why the bus call function of *xy=
z.openbmc_project.Control.Host
> service* failed. Which packages or settings should I configure to enable
> this service?  Could someone give me some instructions or suggestions?
> Thank you!
>
>
> ```
>
> root@siad:~# obmcutil state
> CurrentBMCState     : xyz.openbmc_project.State.BMC.BMCState.NotReady
> CurrentPowerState   : xyz.openbmc_project.State.Chassis.PowerState.On
> Error finding '/xyz/openbmc_project/state/host0' service: Input/output
> error
>
>
>
>
> -------------------------------------------------------------------------=
--------------------------------------------------
>
> root@siad:~# busctl call  xyz.openbmc_project.ObjectMapper
>  /xyz/openbmc_project /object_mapper xyz.openbmc_project.ObjectMapper
> GetSubTree sias ""  0 1  "xyz.op enbmc_project.Condition.HostFirmware"
> a{sa{sas}} 2 "/xyz/openbmc_project/Gpios/host0" 1
> "xyz.openbmc_project.State.Hos tCondition.Gpio" 4
> "org.freedesktop.DBus.Introspectable" "org.freedesktop.DBus.P eer"
> "org.freedesktop.DBus.Properties" "xyz.openbmc_project.Condition.HostFirm=
wa
> re" "/xyz/openbmc_project/control/host0" 1
> "xyz.openbmc_project.Control.Host" 5  "org.freedesktop.DBus.Introspectabl=
e"
> "org.freedesktop.DBus.Peer" "org.freedeskt op.DBus.Properties"
> "xyz.openbmc_project.Condition.HostFirmware" "xyz.openbmc_pr
> oject.Control.Host"
>
>
>
>
> -------------------------------------------------------------------------=
--------------------------------------------------
>
> root@siad:~# busctl get-property
> xyz.openbmc_project.State.HostCondition.Gpio
> /xyz/openbmc_project/Gpios/host0
>  xyz.openbmc_project.Condition.HostFirmware  CurrentFirmwareCondition
> s "xyz.openbmc_project.Condition.HostFirmware.FirmwareCondition.Running"
>
>
>
>
> -------------------------------------------------------------------------=
--------------------------------------------------
>
> root@siad:~# journalctl | grep -i phosphor-host-state-manager
> Apr 18 08:19:13 siad phosphor-host-state-manager[341]: Check if host is
> running
> Apr 18 08:19:13 siad phosphor-host-state-manager[341]: Ufi:
> mapper1=3D/xyz/openbmc_project/Gpios/host0
> Apr 18 08:19:13 siad phosphor-host-state-manager[341]: Ufi:
> mapper1=3D/xyz/openbmc_project/control/host0
> Apr 18 08:19:13 siad phosphor-host-state-manager[341]: Ufi:
> mapper2=3Dxyz.openbmc_project.State.HostCondition.Gpio
> Apr 18 08:19:13 siad phosphor-host-state-manager[341]: Ufi:
> mapper2=3Dxyz.openbmc_project.Control.Host
> Apr 18 08:19:14 siad phosphor-host-state-manager[341]: terminate called
> after throwing an instance of 'sdbusplus::exception::SdBusError'
> Apr 18 08:19:14 siad phosphor-host-state-manager[341]:   what():
>  sd_bus_call: org.freedesktop.DBus.Error.ServiceUnknown: The name is not
> activatable
> Apr 18 08:19:13 siad phosphor-host-state-manager[341]: Ufi:
> path=3D/xyz/openbmc_project/control/host0
> Apr 18 08:19:13 siad phosphor-host-state-manager[341]: Ufi:
> services=3Dxyz.openbmc_project.Control.Host
> Apr 18 08:19:14 siad phosphor-host-state-manager[341]: Error reading
> HostFirmware condition, error: sd_bus_call:
> org.freedesktop.DBus.Error.ServiceUnknown: The name is not activatable,
> service: xyz.openbmc_project.Control.Host path:
> /xyz/openbmc_project/control/host0
> Apr 18 08:19:24 siad phosphor-host-state-manager[366]: Check if host is
> running
> Apr 18 08:19:24 siad phosphor-host-state-manager[366]: Ufi:
> mapper1=3D/xyz/openbmc_project/Gpios/host0
> Apr 18 08:19:24 siad phosphor-host-state-manager[366]: Ufi:
> mapper1=3D/xyz/openbmc_project/control/host0
> Apr 18 08:19:24 siad phosphor-host-state-manager[366]: Ufi:
> mapper2=3Dxyz.openbmc_project.State.HostCondition.Gpio
> Apr 18 08:19:24 siad phosphor-host-state-manager[366]: Ufi:
> mapper2=3Dxyz.openbmc_project.Control.Host
> Apr 18 08:19:24 siad phosphor-host-state-manager[366]: terminate called
> after throwing an instance of 'sdbusplus::exception::SdBusError'
> Apr 18 08:19:24 siad phosphor-host-state-manager[366]:   what():
>  sd_bus_call: org.freedesktop.DBus.Error.ServiceUnknown: The name is not
> activatable
> Apr 18 08:19:24 siad phosphor-host-state-manager[366]: Ufi:
> path=3D/xyz/openbmc_project/control/host0
> Apr 18 08:19:24 siad phosphor-host-state-manager[366]: Ufi:
> services=3Dxyz.openbmc_project.Control.Host
> Apr 18 08:19:24 siad phosphor-host-state-manager[366]: Error reading
> HostFirmware condition, error: sd_bus_call:
> org.freedesktop.DBus.Error.ServiceUnknown: The name is not activatable,
> service: xyz.openbmc_project.Control.Host path:
> /xyz/openbmc_project/control/host0
>
>
>
> ```
>
> Best regards,
> Jordan Chang
>
>
>
> ******************************
>
> This e-mail is confidential. If you are not the intended recipient, you
> must not disclose, distribute or use the information in it as this could =
be
> a breach of confidentiality.If you have received this message in error,
> please advise us immediately by return e-mail and delete the document. Th=
e
> address from which this message has been sent is strictly for business ma=
il
> only and the company reserves the right to monitor the contents of
> communications and take action where and when it is deemed necessary.
>
> Thank you for your co-operation.
> ------------------------------
> The privileged confidential information contained in this email is
> intended for use only by the addressees as indicated by the original send=
er
> of this email. If you are not the addressee indicated in this email or ar=
e
> not responsible for delivery of the email to such a person, please kindly
> reply to the sender indicating this fact and delete all copies of it from
> your computer and network server immediately. Your cooperation is highly
> appreciated. It is advised that any unauthorized use of confidential
> information of Nuvoton is strictly prohibited; and any information in thi=
s
> email irrelevant to the official business of Nuvoton shall be deemed as
> neither given nor endorsed by Nuvoton.
>

--=20
******************************
This e-mail is confidential. If you are not=20
the intended recipient, you must not disclose, distribute or use the=20
information in it as this could be a breach of confidentiality.If you have=
=20
received this message in error, please advise us immediately by return=20
e-mail and delete the document. The address from which this message has=20
been sent is strictly for business mail only and the company reserves the=
=20
right to monitor the contents of communications and take action where and=
=20
when it is deemed necessary.
Thank you for your co-operation.

--000000000000d2d6cd05dd84d22d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"color:rgb(80,0,80)">Hi Tim,=C2=A0</spa=
n></div><div><span style=3D"color:rgb(80,0,80)">Thank you for your reply. A=
ctually, I am wondering how did=C2=A0</span><font color=3D"#0000ff"><b>xyz.=
openbmc_project.Control.Host</b> </font><font color=3D"#000000">service get=
 the=C2=A0</font><span style=3D"color:rgb(80,0,80)">HostFirmwareCondition. =
How could I get the=C2=A0</span></div><div><font color=3D"#0000ff"><b></b><=
/font></div><span style=3D"color:rgb(80,0,80)"><div>HostFirmwareCondition v=
ia this service? Any comments or suggestions would be appreciated.</div></s=
pan><div><span style=3D"color:rgb(80,0,80)"><br></span></div><div><span sty=
le=3D"color:rgb(80,0,80)">Best regards,</span></div><div><span style=3D"col=
or:rgb(80,0,80)">Jordan</span></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr"><a href=3D"mailto:CHLI30@nuvoton.com">C=
HLI30@nuvoton.com</a> &lt;<a href=3D"mailto:CHLI30@nuvoton.com">CHLI30@nuvo=
ton.com</a>&gt; =E6=96=BC 2022=E5=B9=B44=E6=9C=8826=E6=97=A5 =E9=80=B1=E4=
=BA=8C =E4=B8=8A=E5=8D=888:06=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"ZH-TW">
<div class=3D"gmail-m_5717829814505486698WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">Hi Jordan,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">According your busctl test command that you =
can get CurrentFirmwareCondition property currently.<u></u><u></u></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">Here, the service is xyz.openbmc_project.Sta=
te.HostCondition.Gpio and path is /xyz/openbmc_project/Gpios/host0.<u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">root@siad:~# busctl get-property
<b>xyz.openbmc_project.State.HostCondition.Gpio </b>=C2=A0=C2=A0<b>/xyz/ope=
nbmc_project/Gpios/host0</b>=C2=A0 xyz.openbmc_project.Condition.HostFirmwa=
re=C2=A0 CurrentFirmwareCondition<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">s &quot;xyz.openbmc_project.Condition.HostFi=
rmware.FirmwareCondition.Running&quot;<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">However, your error log seems using wrong se=
rvice and path to get this CurrentFirmwareCondition property.<u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">Apr 18 08:19:24 siad phosphor-host-state-man=
ager[366]: Ufi:
<b>path=3D/xyz/openbmc_project/control/host0</b><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">Apr 18 08:19:24 siad phosphor-host-state-man=
ager[366]: Ufi:
<b>services=3Dxyz.openbmc_project.Control.Host</b><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">Apr 18 08:19:24 siad phosphor-host-state-man=
ager[366]: Error reading HostFirmware condition, error: sd_bus_call: org.fr=
eedesktop.DBus.Error.ServiceUnknown: The name
 is not activatable, service: xyz.openbmc_project.Control.Host path: /xyz/o=
penbmc_project/control/host0<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">If you change path and services as your busc=
tl test command that might be fixed your issue.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">Hopefully, I didn=E2=80=99t misunderstand yo=
ur question. Thanks.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">Best regards,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)">Tim<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif;color:rgb(31,73,125)"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11pt;font=
-family:Calibri,sans-serif">From:</span></b><span lang=3D"EN-US" style=3D"f=
ont-size:11pt;font-family:Calibri,sans-serif"> openbmc &lt;<a href=3D"mailt=
o:openbmc-bounces+chli30=3Dnuvoton.com@lists.ozlabs.org" target=3D"_blank">=
openbmc-bounces+chli30=3Dnuvoton.com@lists.ozlabs.org</a>&gt;
<b>On Behalf Of </b>Jordan Chang<br>
<b>Sent:</b> Monday, April 18, 2022 6:31 PM<br>
<b>To:</b> <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">op=
enbmc@lists.ozlabs.org</a><br>
<b>Subject:</b> [phosphor-state-manager] Error reading HostFirmware conditi=
on, error: sd_bus_call: org.freedesktop.DBus.Error.ServiceUnknown<u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Sir/Madam,<br>
I am implementing=C2=A0the power control mechanisms for my platform, and en=
counter the problem in below:<br>
<i>phosphor-host-state-manager[341]: Error reading HostFirmware condition, =
error: sd_bus_call: org.freedesktop.DBus.Error.ServiceUnknown: The name is =
not activatable, service: xyz.openbmc_project.Control.Host path: /xyz/openb=
mc_project/control/host0</i><u></u><u></u></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I am using the host0-ready gpio=
 pin to determine the HostFirmwareCondition is running or not.=C2=A0However=
, the service=C2=A0<i>xyz.openbmc_project.State.Host.HostState</i>=C2=A0cou=
ld not be established since the dbus call method of=C2=A0=C2=A0<i>xyz.openb=
mc_project.Control.Host
</i>returns an error. Therefore, I have printed some debug messages startin=
g with Ufi to ensure the=C2=A0xyz.openbmc_project.State.HostCondition.Gpio =
service is involved in phosphor-host-state-manager. Not sure why the bus ca=
ll function of
<i>xyz.openbmc_project.Control.Host service</i>=C2=A0failed. Which packages=
 or settings should I configure to enable this service?=C2=A0 Could someone=
 give me some instructions or suggestions? Thank you!<u></u><u></u></span><=
/p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><br>
```<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">root@siad:~# obmcutil state<br>
CurrentBMCState =C2=A0 =C2=A0 : xyz.openbmc_project.State.BMC.BMCState.NotR=
eady<br>
CurrentPowerState =C2=A0 : xyz.openbmc_project.State.Chassis.PowerState.On<=
br>
Error finding &#39;/xyz/openbmc_project/state/host0&#39; service: Input/out=
put error<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">-------------------------------=
---------------------------------------------------------------------------=
-----------------<u></u><u></u></span></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">root@siad:~# busctl call =C2=A0=
xyz.openbmc_project.ObjectMapper =C2=A0/xyz/openbmc_project /object_mapper =
xyz.openbmc_project.ObjectMapper GetSubTree sias &quot;&quot; =C2=A00 1 =C2=
=A0&quot;xyz.op enbmc_project.Condition.HostFirmware&quot;<br>
a{sa{sas}} 2 &quot;/xyz/openbmc_project/Gpios/host0&quot; 1 &quot;xyz.openb=
mc_project.State.Hos tCondition.Gpio&quot; 4 &quot;org.freedesktop.DBus.Int=
rospectable&quot; &quot;org.freedesktop.DBus.P eer&quot; &quot;org.freedesk=
top.DBus.Properties&quot; &quot;xyz.openbmc_project.Condition.HostFirmwa re=
&quot; &quot;/xyz/openbmc_project/control/host0&quot;
 1 &quot;xyz.openbmc_project.Control.Host&quot; 5 =C2=A0&quot;org.freedeskt=
op.DBus.Introspectable&quot; &quot;org.freedesktop.DBus.Peer&quot; &quot;or=
g.freedeskt op.DBus.Properties&quot; &quot;xyz.openbmc_project.Condition.Ho=
stFirmware&quot; &quot;xyz.openbmc_pr oject.Control.Host&quot;<u></u><u></u=
></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">-------------------------------=
---------------------------------------------------------------------------=
-----------------<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">root@siad:~# busctl get-propert=
y xyz.openbmc_project.State.HostCondition.Gpio =C2=A0 /xyz/openbmc_project/=
Gpios/host0 =C2=A0xyz.openbmc_project.Condition.HostFirmware =C2=A0CurrentF=
irmwareCondition<br>
s &quot;xyz.openbmc_project.Condition.HostFirmware.FirmwareCondition.Runnin=
g&quot;<u></u><u></u></span></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">-------------------------------=
---------------------------------------------------------------------------=
-----------------<u></u><u></u></span></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">root@siad:~# journalctl | grep =
-i phosphor-host-state-manager<br>
Apr 18 08:19:13 siad phosphor-host-state-manager[341]: Check if host is run=
ning<br>
Apr 18 08:19:13 siad phosphor-host-state-manager[341]: Ufi: mapper1=3D/xyz/=
openbmc_project/Gpios/host0<br>
Apr 18 08:19:13 siad phosphor-host-state-manager[341]: Ufi: mapper1=3D/xyz/=
openbmc_project/control/host0<br>
Apr 18 08:19:13 siad phosphor-host-state-manager[341]: Ufi: mapper2=3Dxyz.o=
penbmc_project.State.HostCondition.Gpio<br>
Apr 18 08:19:13 siad phosphor-host-state-manager[341]: Ufi: mapper2=3Dxyz.o=
penbmc_project.Control.Host<br>
Apr 18 08:19:14 siad phosphor-host-state-manager[341]: terminate called aft=
er throwing an instance of &#39;sdbusplus::exception::SdBusError&#39;<br>
Apr 18 08:19:14 siad phosphor-host-state-manager[341]: =C2=A0 what(): =C2=
=A0sd_bus_call: org.freedesktop.DBus.Error.ServiceUnknown: The name is not =
activatable<br>
Apr 18 08:19:13 siad phosphor-host-state-manager[341]: Ufi: path=3D/xyz/ope=
nbmc_project/control/host0<br>
Apr 18 08:19:13 siad phosphor-host-state-manager[341]: Ufi: services=3Dxyz.=
openbmc_project.Control.Host<br>
Apr 18 08:19:14 siad phosphor-host-state-manager[341]: Error reading HostFi=
rmware condition, error: sd_bus_call: org.freedesktop.DBus.Error.ServiceUnk=
nown: The name is not activatable, service: xyz.openbmc_project.Control.Hos=
t path: /xyz/openbmc_project/control/host0<br>
Apr 18 08:19:24 siad phosphor-host-state-manager[366]: Check if host is run=
ning<br>
Apr 18 08:19:24 siad phosphor-host-state-manager[366]: Ufi: mapper1=3D/xyz/=
openbmc_project/Gpios/host0<br>
Apr 18 08:19:24 siad phosphor-host-state-manager[366]: Ufi: mapper1=3D/xyz/=
openbmc_project/control/host0<br>
Apr 18 08:19:24 siad phosphor-host-state-manager[366]: Ufi: mapper2=3Dxyz.o=
penbmc_project.State.HostCondition.Gpio<br>
Apr 18 08:19:24 siad phosphor-host-state-manager[366]: Ufi: mapper2=3Dxyz.o=
penbmc_project.Control.Host<br>
Apr 18 08:19:24 siad phosphor-host-state-manager[366]: terminate called aft=
er throwing an instance of &#39;sdbusplus::exception::SdBusError&#39;<br>
Apr 18 08:19:24 siad phosphor-host-state-manager[366]: =C2=A0 what(): =C2=
=A0sd_bus_call: org.freedesktop.DBus.Error.ServiceUnknown: The name is not =
activatable<br>
Apr 18 08:19:24 siad phosphor-host-state-manager[366]: Ufi: path=3D/xyz/ope=
nbmc_project/control/host0<br>
Apr 18 08:19:24 siad phosphor-host-state-manager[366]: Ufi: services=3Dxyz.=
openbmc_project.Control.Host<br>
Apr 18 08:19:24 siad phosphor-host-state-manager[366]: Error reading HostFi=
rmware condition, error: sd_bus_call: org.freedesktop.DBus.Error.ServiceUnk=
nown: The name is not activatable, service: xyz.openbmc_project.Control.Hos=
t path: /xyz/openbmc_project/control/host0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">```<br>
<br>
Best regards,<br>
Jordan Chang<u></u><u></u></span></p>
</div>
</div>
</div>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10pt">******=
************************</span><span lang=3D"EN-US"><u></u><u></u></span></=
p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10pt">This e=
-mail is confidential. If you are not the intended recipient, you must not =
disclose, distribute or use the information in it as this could be a breach=
 of confidentiality.If you have received
 this message in error, please advise us immediately by return e-mail and d=
elete the document. The address from which this message has been sent is st=
rictly for business mail only and the company reserves the right to monitor=
 the contents of communications
 and take action where and when it is deemed necessary.</span><span lang=3D=
"EN-US"><u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10pt">Thank =
you for your co-operation.</span><span lang=3D"EN-US"><u></u><u></u></span>=
</p>
</div>
</div>
<hr align=3D"center" width=3D"100%">
<span style=3D"font-size:12pt;line-height:0.7;font-family:Arial;color:rgb(1=
28,128,128)">The privileged confidential information contained in this emai=
l is intended for use only by the addressees as indicated by the original s=
ender of this email. If you are not the
 addressee indicated in this email or are not responsible for delivery of t=
he email to such a person, please kindly reply to the sender indicating thi=
s fact and delete all copies of it from your computer and network server im=
mediately. Your cooperation is highly
 appreciated. It is advised that any unauthorized use of confidential infor=
mation of Nuvoton is strictly prohibited; and any information in this email=
 irrelevant to the official business of Nuvoton shall be deemed as neither =
given nor endorsed by Nuvoton.
</span>
</div>

</blockquote></div>

<br>
<div><font size=3D"2">******************************</font></div><div><font=
 size=3D"2">This e-mail is confidential. If you are not the intended recipi=
ent, you must not disclose, distribute or use the information in it as this=
 could be a breach of confidentiality.If you have received this message in =
error, please advise us immediately by return e-mail and delete the documen=
t. The address from which this message has been sent is strictly for busine=
ss mail only and the company reserves the right to monitor the contents of =
communications and take action where and when it is deemed necessary.</font=
></div><div><font size=3D"2">Thank you for your co-operation.</font></div>
--000000000000d2d6cd05dd84d22d--
