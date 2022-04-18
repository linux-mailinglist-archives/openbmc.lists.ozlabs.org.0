Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6755060DC
	for <lists+openbmc@lfdr.de>; Tue, 19 Apr 2022 02:20:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kj4FV2y2Yz2yMP
	for <lists+openbmc@lfdr.de>; Tue, 19 Apr 2022 10:20:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=1R29CeB/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ufispace.com (client-ip=2607:f8b0:4864:20::b29;
 helo=mail-yb1-xb29.google.com; envelope-from=jordan.chang@ufispace.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ufispace-com.20210112.gappssmtp.com
 header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=1R29CeB/; dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Khjs611tSz2yNn
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2022 20:31:19 +1000 (AEST)
Received: by mail-yb1-xb29.google.com with SMTP id v77so24784491ybi.12
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2022 03:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ufispace-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=x8/sbwiFtnrMawvBaUTzNs7zgO8Rgd5W1Lbh8ta6H1s=;
 b=1R29CeB/0r54mp859RZ8kJ1VyJI6COHj2PD+eRdkAd6jrtV7cEBCAg2+LJKBaiwu9w
 7eg95JANW42Du71wI19qoTQP5+MgXjEwLoXvBohGovJJrl7BLWkbQnOQU60PQrSdjw7N
 0wXz8VKG/68zelh3KWjvJnZrEv1ypU56doqwp3DwfbXzR1iTU/O4mKCLXfLrUTJkarA6
 tJGxsX4aRQODOf8Zb1TMadMhdFOWBrlhcDeURewz8/t3Hv8IDM+HAY8V2/agzFgfuiYJ
 YQdkl8CWdBKen7hhGTZn+rUnuGxfP7TU6ifOp2X2nVIDyy1P/UNiYIFiUrYh4+G7vQtv
 Mx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=x8/sbwiFtnrMawvBaUTzNs7zgO8Rgd5W1Lbh8ta6H1s=;
 b=1LBpTYkbyMND9cwZd95F1Tzs4hujBXZr6wM7t1qF5Z5qONyybJvvY0+kdvEX/aG7dy
 /CtyThw1BZDJcjs0AhnnykIjOf8a1a/J+lOcreI69YrPH3KuNIVLCMLv+WDhZ2FjWhz8
 ELHQLJBlfQt4uThNpEcIwOJuPgWfGty9NSwx+b4Ln3AWfbEea43s63sci0a+ETFgOVPX
 Xo+6KAheDnc+70ZVmXKoMba320bw9+fI9Ogpspzai/yeoVHXJJG24WszX60pcYdfzfZ4
 Kcfm/1fdmSEJ2UuFwOaSzIW7Osq9oA24EfVbFiKBECYgWv+femCv1FjgTbo7qKurh57q
 7pkg==
X-Gm-Message-State: AOAM5314dP5uLWHk5vh1+mJ0M56mKheChAT5x1OpPahU9lJdwin+p4Zx
 FPtW1I+1EIj0VGFXIM9Mkh8moVAFlBM60MegohQa/StZZ3ACW3Wdu62cESd9Ls8JI7E7VZFkshd
 WemQaWAyOJxEkwHFRA5cRE+dbQZEdOtt4UdA5
X-Google-Smtp-Source: ABdhPJwOsNfeV55h716NWo1FkkOTsHB7CcB+S5sKRSst8XdWPn04yjCDZ6iRbsy1++w39cB+39Hv72a2i7wa47lEocY=
X-Received: by 2002:a25:bf88:0:b0:633:93e9:b2fc with SMTP id
 l8-20020a25bf88000000b0063393e9b2fcmr8750252ybk.202.1650277875344; Mon, 18
 Apr 2022 03:31:15 -0700 (PDT)
MIME-Version: 1.0
From: Jordan Chang <jordan.chang@ufispace.com>
Date: Mon, 18 Apr 2022 18:31:04 +0800
Message-ID: <CAJ3czeTVv-587VJbR2YuZz1jwOUKskzOzk=HRpmW040VL=ORrA@mail.gmail.com>
Subject: [phosphor-state-manager] Error reading HostFirmware condition, error:
 sd_bus_call: org.freedesktop.DBus.Error.ServiceUnknown
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000008a802e05dceb4283"
X-Mailman-Approved-At: Tue, 19 Apr 2022 10:19:56 +1000
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000008a802e05dceb4283
Content-Type: text/plain; charset="UTF-8"

Hi Sir/Madam,
I am implementing the power control mechanisms for my platform, and
encounter the problem in below:
*phosphor-host-state-manager[341]: Error reading HostFirmware condition,
error: sd_bus_call: org.freedesktop.DBus.Error.ServiceUnknown: The name is
not activatable, service: xyz.openbmc_project.Control.Host path:
/xyz/openbmc_project/control/host0*

I am using the host0-ready gpio pin to determine the HostFirmwareCondition
is running or not. However, the service
*xyz.openbmc_project.State.Host.HostState* could not be established since
the dbus call method of  *xyz.openbmc_project.Control.Host *returns an
error. Therefore, I have printed some debug messages starting with Ufi to
ensure the xyz.openbmc_project.State.HostCondition.Gpio service is involved
in phosphor-host-state-manager. Not sure why the bus call function of
*xyz.openbmc_project.Control.Host
service* failed. Which packages or settings should I configure to enable
this service?  Could someone give me some instructions or suggestions?
Thank you!

```
root@siad:~# obmcutil state
CurrentBMCState     : xyz.openbmc_project.State.BMC.BMCState.NotReady
CurrentPowerState   : xyz.openbmc_project.State.Chassis.PowerState.On
Error finding '/xyz/openbmc_project/state/host0' service: Input/output error

---------------------------------------------------------------------------------------------------------------------------
root@siad:~# busctl call  xyz.openbmc_project.ObjectMapper
 /xyz/openbmc_project /object_mapper xyz.openbmc_project.ObjectMapper
GetSubTree sias ""  0 1  "xyz.op enbmc_project.Condition.HostFirmware"
a{sa{sas}} 2 "/xyz/openbmc_project/Gpios/host0" 1
"xyz.openbmc_project.State.Hos tCondition.Gpio" 4
"org.freedesktop.DBus.Introspectable" "org.freedesktop.DBus.P eer"
"org.freedesktop.DBus.Properties" "xyz.openbmc_project.Condition.HostFirmwa
re" "/xyz/openbmc_project/control/host0" 1
"xyz.openbmc_project.Control.Host" 5  "org.freedesktop.DBus.Introspectable"
"org.freedesktop.DBus.Peer" "org.freedeskt op.DBus.Properties"
"xyz.openbmc_project.Condition.HostFirmware" "xyz.openbmc_pr
oject.Control.Host"

---------------------------------------------------------------------------------------------------------------------------
root@siad:~# busctl get-property
xyz.openbmc_project.State.HostCondition.Gpio
/xyz/openbmc_project/Gpios/host0
 xyz.openbmc_project.Condition.HostFirmware  CurrentFirmwareCondition
s "xyz.openbmc_project.Condition.HostFirmware.FirmwareCondition.Running"

---------------------------------------------------------------------------------------------------------------------------
root@siad:~# journalctl | grep -i phosphor-host-state-manager
Apr 18 08:19:13 siad phosphor-host-state-manager[341]: Check if host is
running
Apr 18 08:19:13 siad phosphor-host-state-manager[341]: Ufi:
mapper1=/xyz/openbmc_project/Gpios/host0
Apr 18 08:19:13 siad phosphor-host-state-manager[341]: Ufi:
mapper1=/xyz/openbmc_project/control/host0
Apr 18 08:19:13 siad phosphor-host-state-manager[341]: Ufi:
mapper2=xyz.openbmc_project.State.HostCondition.Gpio
Apr 18 08:19:13 siad phosphor-host-state-manager[341]: Ufi:
mapper2=xyz.openbmc_project.Control.Host
Apr 18 08:19:14 siad phosphor-host-state-manager[341]: terminate called
after throwing an instance of 'sdbusplus::exception::SdBusError'
Apr 18 08:19:14 siad phosphor-host-state-manager[341]:   what():
 sd_bus_call: org.freedesktop.DBus.Error.ServiceUnknown: The name is not
activatable
Apr 18 08:19:13 siad phosphor-host-state-manager[341]: Ufi:
path=/xyz/openbmc_project/control/host0
Apr 18 08:19:13 siad phosphor-host-state-manager[341]: Ufi:
services=xyz.openbmc_project.Control.Host
Apr 18 08:19:14 siad phosphor-host-state-manager[341]: Error reading
HostFirmware condition, error: sd_bus_call:
org.freedesktop.DBus.Error.ServiceUnknown: The name is not activatable,
service: xyz.openbmc_project.Control.Host path:
/xyz/openbmc_project/control/host0
Apr 18 08:19:24 siad phosphor-host-state-manager[366]: Check if host is
running
Apr 18 08:19:24 siad phosphor-host-state-manager[366]: Ufi:
mapper1=/xyz/openbmc_project/Gpios/host0
Apr 18 08:19:24 siad phosphor-host-state-manager[366]: Ufi:
mapper1=/xyz/openbmc_project/control/host0
Apr 18 08:19:24 siad phosphor-host-state-manager[366]: Ufi:
mapper2=xyz.openbmc_project.State.HostCondition.Gpio
Apr 18 08:19:24 siad phosphor-host-state-manager[366]: Ufi:
mapper2=xyz.openbmc_project.Control.Host
Apr 18 08:19:24 siad phosphor-host-state-manager[366]: terminate called
after throwing an instance of 'sdbusplus::exception::SdBusError'
Apr 18 08:19:24 siad phosphor-host-state-manager[366]:   what():
 sd_bus_call: org.freedesktop.DBus.Error.ServiceUnknown: The name is not
activatable
Apr 18 08:19:24 siad phosphor-host-state-manager[366]: Ufi:
path=/xyz/openbmc_project/control/host0
Apr 18 08:19:24 siad phosphor-host-state-manager[366]: Ufi:
services=xyz.openbmc_project.Control.Host
Apr 18 08:19:24 siad phosphor-host-state-manager[366]: Error reading
HostFirmware condition, error: sd_bus_call:
org.freedesktop.DBus.Error.ServiceUnknown: The name is not activatable,
service: xyz.openbmc_project.Control.Host path:
/xyz/openbmc_project/control/host0

```

Best regards,
Jordan Chang

-- 
******************************
This e-mail is confidential. If you are not 
the intended recipient, you must not disclose, distribute or use the 
information in it as this could be a breach of confidentiality.If you have 
received this message in error, please advise us immediately by return 
e-mail and delete the document. The address from which this message has 
been sent is strictly for business mail only and the company reserves the 
right to monitor the contents of communications and take action where and 
when it is deemed necessary.
Thank you for your co-operation.

--0000000000008a802e05dceb4283
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Sir/Madam,<br>I am implementing=C2=A0the power control =
mechanisms for my platform, and encounter the problem in below:<br><i>phosp=
hor-host-state-manager[341]: Error reading HostFirmware condition, error: s=
d_bus_call: org.freedesktop.DBus.Error.ServiceUnknown: The name is not acti=
vatable, service: xyz.openbmc_project.Control.Host path: /xyz/openbmc_proje=
ct/control/host0</i><div><br></div><div>I am using the host0-ready gpio pin=
 to determine the HostFirmwareCondition is running or not.=C2=A0However, th=
e service=C2=A0<i>xyz.openbmc_project.State.Host.HostState</i>=C2=A0could n=
ot be established since the dbus call method of=C2=A0=C2=A0<i>xyz.openbmc_p=
roject.Control.Host </i>returns an error. Therefore, I have printed some de=
bug messages starting with Ufi to ensure the=C2=A0xyz.openbmc_project.State=
.HostCondition.Gpio service is involved in phosphor-host-state-manager. Not=
 sure why the bus call function of <i>xyz.openbmc_project.Control.Host serv=
ice</i>=C2=A0failed. Which packages or settings should I configure to enabl=
e this service?=C2=A0 Could someone give me some instructions or suggestion=
s? Thank you!<div><br>```</div><div>root@siad:~# obmcutil state<br>CurrentB=
MCState =C2=A0 =C2=A0 : xyz.openbmc_project.State.BMC.BMCState.NotReady<br>=
CurrentPowerState =C2=A0 : xyz.openbmc_project.State.Chassis.PowerState.On<=
br>Error finding &#39;/xyz/openbmc_project/state/host0&#39; service: Input/=
output error</div><div><br></div><div>-------------------------------------=
---------------------------------------------------------------------------=
-----------</div><div><div>root@siad:~# busctl call =C2=A0xyz.openbmc_proje=
ct.ObjectMapper =C2=A0/xyz/openbmc_project /object_mapper xyz.openbmc_proje=
ct.ObjectMapper GetSubTree sias &quot;&quot; =C2=A00 1 =C2=A0&quot;xyz.op e=
nbmc_project.Condition.HostFirmware&quot;<br>a{sa{sas}} 2 &quot;/xyz/openbm=
c_project/Gpios/host0&quot; 1 &quot;xyz.openbmc_project.State.Hos tConditio=
n.Gpio&quot; 4 &quot;org.freedesktop.DBus.Introspectable&quot; &quot;org.fr=
eedesktop.DBus.P eer&quot; &quot;org.freedesktop.DBus.Properties&quot; &quo=
t;xyz.openbmc_project.Condition.HostFirmwa re&quot; &quot;/xyz/openbmc_proj=
ect/control/host0&quot; 1 &quot;xyz.openbmc_project.Control.Host&quot; 5 =
=C2=A0&quot;org.freedesktop.DBus.Introspectable&quot; &quot;org.freedesktop=
.DBus.Peer&quot; &quot;org.freedeskt op.DBus.Properties&quot; &quot;xyz.ope=
nbmc_project.Condition.HostFirmware&quot; &quot;xyz.openbmc_pr oject.Contro=
l.Host&quot;</div><div><br></div><div>-------------------------------------=
---------------------------------------------------------------------------=
-----------</div><div>root@siad:~# busctl get-property xyz.openbmc_project.=
State.HostCondition.Gpio =C2=A0 /xyz/openbmc_project/Gpios/host0 =C2=A0xyz.=
openbmc_project.Condition.HostFirmware =C2=A0CurrentFirmwareCondition<br>s =
&quot;xyz.openbmc_project.Condition.HostFirmware.FirmwareCondition.Running&=
quot;</div></div><div><br></div><div>--------------------------------------=
---------------------------------------------------------------------------=
----------<br></div><div><div>root@siad:~# journalctl | grep -i phosphor-ho=
st-state-manager<br>Apr 18 08:19:13 siad phosphor-host-state-manager[341]: =
Check if host is running<br>Apr 18 08:19:13 siad phosphor-host-state-manage=
r[341]: Ufi: mapper1=3D/xyz/openbmc_project/Gpios/host0<br>Apr 18 08:19:13 =
siad phosphor-host-state-manager[341]: Ufi: mapper1=3D/xyz/openbmc_project/=
control/host0<br>Apr 18 08:19:13 siad phosphor-host-state-manager[341]: Ufi=
: mapper2=3Dxyz.openbmc_project.State.HostCondition.Gpio<br>Apr 18 08:19:13=
 siad phosphor-host-state-manager[341]: Ufi: mapper2=3Dxyz.openbmc_project.=
Control.Host<br>Apr 18 08:19:14 siad phosphor-host-state-manager[341]: term=
inate called after throwing an instance of &#39;sdbusplus::exception::SdBus=
Error&#39;<br>Apr 18 08:19:14 siad phosphor-host-state-manager[341]: =C2=A0=
 what(): =C2=A0sd_bus_call: org.freedesktop.DBus.Error.ServiceUnknown: The =
name is not activatable<br>Apr 18 08:19:13 siad phosphor-host-state-manager=
[341]: Ufi: path=3D/xyz/openbmc_project/control/host0<br>Apr 18 08:19:13 si=
ad phosphor-host-state-manager[341]: Ufi: services=3Dxyz.openbmc_project.Co=
ntrol.Host<br>Apr 18 08:19:14 siad phosphor-host-state-manager[341]: Error =
reading HostFirmware condition, error: sd_bus_call: org.freedesktop.DBus.Er=
ror.ServiceUnknown: The name is not activatable, service: xyz.openbmc_proje=
ct.Control.Host path: /xyz/openbmc_project/control/host0<br>Apr 18 08:19:24=
 siad phosphor-host-state-manager[366]: Check if host is running<br>Apr 18 =
08:19:24 siad phosphor-host-state-manager[366]: Ufi: mapper1=3D/xyz/openbmc=
_project/Gpios/host0<br>Apr 18 08:19:24 siad phosphor-host-state-manager[36=
6]: Ufi: mapper1=3D/xyz/openbmc_project/control/host0<br>Apr 18 08:19:24 si=
ad phosphor-host-state-manager[366]: Ufi: mapper2=3Dxyz.openbmc_project.Sta=
te.HostCondition.Gpio<br>Apr 18 08:19:24 siad phosphor-host-state-manager[3=
66]: Ufi: mapper2=3Dxyz.openbmc_project.Control.Host<br>Apr 18 08:19:24 sia=
d phosphor-host-state-manager[366]: terminate called after throwing an inst=
ance of &#39;sdbusplus::exception::SdBusError&#39;<br>Apr 18 08:19:24 siad =
phosphor-host-state-manager[366]: =C2=A0 what(): =C2=A0sd_bus_call: org.fre=
edesktop.DBus.Error.ServiceUnknown: The name is not activatable<br>Apr 18 0=
8:19:24 siad phosphor-host-state-manager[366]: Ufi: path=3D/xyz/openbmc_pro=
ject/control/host0<br>Apr 18 08:19:24 siad phosphor-host-state-manager[366]=
: Ufi: services=3Dxyz.openbmc_project.Control.Host<br>Apr 18 08:19:24 siad =
phosphor-host-state-manager[366]: Error reading HostFirmware condition, err=
or: sd_bus_call: org.freedesktop.DBus.Error.ServiceUnknown: The name is not=
 activatable, service: xyz.openbmc_project.Control.Host path: /xyz/openbmc_=
project/control/host0</div><div><br></div><div><div>```<br><br>Best regards=
,<br>Jordan Chang</div></div></div></div></div>

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
--0000000000008a802e05dceb4283--
