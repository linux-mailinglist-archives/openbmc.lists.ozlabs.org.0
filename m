Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 153E27FFF97
	for <lists+openbmc@lfdr.de>; Fri,  1 Dec 2023 00:41:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=E/cZtoqx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShCPr1v2Gz3cV6
	for <lists+openbmc@lfdr.de>; Fri,  1 Dec 2023 10:41:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=E/cZtoqx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a35; helo=mail-vk1-xa35.google.com; envelope-from=chandramohan.harkude@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgwPD0VQ7z3c56
	for <openbmc@lists.ozlabs.org>; Thu, 30 Nov 2023 23:24:46 +1100 (AEDT)
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-4b28354a249so306430e0c.2
        for <openbmc@lists.ozlabs.org>; Thu, 30 Nov 2023 04:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701347082; x=1701951882; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=coShRj7TVVogtqqulmQmwvGx28AX61qbKHdaGAM/Eao=;
        b=E/cZtoqxX8t8vi+yRZgCL8rfgz0jjQJUghSgzgpNva5ntIR52aEWudRa2yquTxdCUd
         bHoMiKRE/1OBgfay6inMzqXoUZCF9h6rW6WEcTnRir9to8fD5seO7SWiq2gjkud9WqMh
         AaAAvbzUm7XzUy9mhU9JBQYhefOQH/mE4lUQGhdXUFrOjAQ+F3OIY4BhDPVOA/qyfWUU
         4ZmCpJnjc/D5824usiXPdMZ1pfngRd3pShFCytaqhU4muK2PfG55NRO1f0nd3qr4qaBo
         JVTXjFMsvoG9KYs62icr32VK4TfskjNacrBNeOXTnNDctjSrKQl6WWGs/jWjyUdyvWtR
         Wrcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701347082; x=1701951882;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=coShRj7TVVogtqqulmQmwvGx28AX61qbKHdaGAM/Eao=;
        b=GzSBKdGOroGud1hBWWnESR4qQF4J7UuwY839AdktQfYd+WnzsYZXpcwGhX90xqdU7H
         rMhjQKR4uwgeT1rLNnPfrcvoeXCYftkPv81cW3GZsinT2AXWsQTlDAxkfVmw71PA0b5O
         WGCw8sPCnb46VLG8bRzp0AQTSxNA3xLD7wSi17jhK9Pt5v5rjsCK++8pRCS5cNDqVdJC
         5mU04POJiccfJ/t4pG+vNixx/Y5P2MXWi/gEVQ/Mms0vph7Kq4cT4HYvlcgBnf60vajW
         p1gQkSmM8GZUqQnSx/7IV4+YfxzpMSZEztrtQC3jIt8Dc3aArpveISVP3lqpKRPAl7zC
         S2lQ==
X-Gm-Message-State: AOJu0Yxeqr/nn9HjkLUSJ6AZQVNXTErsirl8JqMs/MqchVrUHcUICxY9
	3OjcQHvG4oc+DatOOhI8yqvuEIQ3g5nwsH/kPjsgeAHXtZc=
X-Google-Smtp-Source: AGHT+IGvw+14wEt6w0YhkKAUJxpYJfI8zxA8tUTosipAFdVIcwp1HrfPAei7kfAGo5sXcxQku2ZrZZEWHgiWS/2xwK4=
X-Received: by 2002:a1f:c881:0:b0:4b2:7dd5:de89 with SMTP id
 y123-20020a1fc881000000b004b27dd5de89mr8061910vkf.3.1701347081819; Thu, 30
 Nov 2023 04:24:41 -0800 (PST)
MIME-Version: 1.0
From: Chandramohan <chandramohan.harkude@gmail.com>
Date: Thu, 30 Nov 2023 17:54:30 +0530
Message-ID: <CAAtDDLbuHhY5iX1Hu-hMZOh8p2FLjn6wkWia+1RfY-0=m0UgRw@mail.gmail.com>
Subject: Suggestions required for sending the RF events in case of change
 happens on the backend-repos
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000739e73060b5dbc07"
X-Mailman-Approved-At: Fri, 01 Dec 2023 10:39:58 +1100
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

--000000000000739e73060b5dbc07
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(Sending again, as  previous one didn't show up in the list )

H All,

I wanted to discuss various design approaches for, sending RF events from
various OpenBMC services for resource create/delete/modify cases (but not
limited to this),
Please find the details below:

1) Addition of a new API in Phosphor Logging dedicated to generating logs
with RF-specific data on the D-bus:

        Workflow:
        - The caller initiates a call to this API, creating a log entry on
the D-bus.
        - The new API allows only RF specific data to log using internal
D-Bus API from phosphor-logging.
        - bmcweb monitors the interface-added signal on the
phosphor-logging D-bus logs.
        - Transmit the RF event associated with the logs relevant to RF.
        (New API details are provided at the end of email)

        Pros:
        Consolidation of all RF-specific components within the logging API
rather than being scattered across other repositories.

        Cons:
        Introduction of an additional API in phosphor-logging for logging
RF-related entries.

2) Utilization of Journal Log to record RF-specific details in the journal,
following the approach outlined in
https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in=
-bmcweb.md
.
        This methodology appears to be adhered to in upstream repositories,
as evidenced by references such as:

https://grok.openbmc.org/xref/openbmc/estoraged/src/estoraged.cpp?r=3Dff1b6=
4f0#160

https://grok.openbmc.org/xref/openbmc/dbus-sensors/src/TachSensor.hpp?r=3D1=
f978631#105

https://grok.openbmc.org/xref/openbmc/telemetry/src/trigger_actions.cpp?r=
=3Dcff70c14#94

        Workflow:

        - The caller logs RF-specific details directly from the openBMC
repo=E2=80=99s.
        - bmcweb (inotify) potentially monitors logs containing RF-specific
information (e.g., REDFISH_MESSAGE_ID).
        - Transmit the RF event associated with the logs relevant to RF.

        Cons: RF specific stuff scattered across the repos.

3) Use 'Create'  API from PDI
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/op=
enbmc_project/Logging/Create.interface.yaml#L7
      for generating  RF specific data on D-Bus from backend-repos.

        Workflow:
        - The caller logs RF-specific details using 'Create' API from the
openBMC repos
        - bmcweb potentially monitors logs containing RF-specific
information (e.g., REDFISH_MESSAGE_ID REDFISH_MESSAGE_ARGS ).
        - Transmit the RF event associated with the logs relevant to RF.

        Cons: RF specific stuff scattered across the repos.

4) Open to Suggestions:
    We remain open to alternative approaches for event transmission. If you
have any suggestions or insights, please feel free to share with us.
Thank you for your attention to this matter.

Best Regards
Chandramohan Harkude.

API details in short.
Example usage of  new API 'generateLog'  from  phosphor-logging library.

1)phosphor-user-manager want to send an event when new user is created
    Here propertyName and propertyValue is not required therefore
dbusPropertyValueList  is empty
    std::string dbusPropertyValueList {};
    std::string dbusObjectPath =3D "/xyz/openbmc_project/user/testuser";
    generateLog(connObject, MESSAGE_TYPE::RESOURCE_CREATED,
Entry::Level::Informational, dbusPropertyValueList , dbusObjectPath);

2)phosphor-user-manager want to send an event when user is enabled
    Here propertyName is 'UserEnabled' and propertyValue is 'true'
    std::string dbusPropertyValueList  =3D "UserEnabled" + ',' + "true";
    std::string dbusObjectPath =3D "/xyz/openbmc_project/user/testuser";
    generateLog( connObject,
MESSAGE_TYPE::PROPERTY_VALUE_MODIFIED,Entry::Level::Alert,
dbusPropertyValueList ,dbusObjectPath);

The API 'generateLog' creates entry on the D-Bus using internal D-Bus API
from phosphor-logging.

Note : connObject is boost::asio::connection type

--000000000000739e73060b5dbc07
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail-gs" style=3D"margin:0px;padding:0px 0p=
x 20px;width:initial;min-width:0px;font-family:&quot;Google Sans&quot;,Robo=
to,RobotoDraft,Helvetica,Arial,sans-serif;font-size:medium"><div class=3D"g=
mail-"><div id=3D"gmail-:2m2" class=3D"gmail-ii gmail-gt" style=3D"directio=
n:ltr;margin:8px 0px 0px;padding:0px;font-size:0.875rem;overflow-x:hidden">=
<div id=3D"gmail-:2m1" class=3D"gmail-a3s gmail-aiL" style=3D"font-variant-=
numeric:normal;font-variant-east-asian:normal;font-variant-alternates:norma=
l;font-kerning:auto;font-feature-settings:normal;font-stretch:normal;font-s=
ize:small;line-height:1.5;font-family:Arial,Helvetica,sans-serif;overflow:a=
uto hidden;direction:initial"><div dir=3D"ltr"><div><font face=3D"georgia, =
serif">(Sending again, as=C2=A0</font>

<span class=3D"gmail-ui-provider gmail-a gmail-b gmail-c gmail-d gmail-e gm=
ail-f gmail-g gmail-h gmail-i gmail-j gmail-k gmail-l gmail-m gmail-n gmail=
-o gmail-p gmail-q gmail-r gmail-s gmail-t gmail-u gmail-v gmail-w gmail-x =
gmail-y gmail-z gmail-ab gmail-ac gmail-ae gmail-af gmail-ag gmail-ah gmail=
-ai gmail-aj gmail-ak" dir=3D"ltr">previous one didn&#39;t show up in the l=
ist</span>=C2=A0<font face=3D"georgia, serif">)</font><br></div><div><font =
face=3D"georgia, serif"><br></font></div><div><font face=3D"georgia, serif"=
>H All,</font></div><div><font face=3D"georgia, serif"><br>I wanted to disc=
uss various design approaches for, sending RF events from various OpenBMC s=
ervices for resource create/delete/modify cases (but not limited to this),<=
br>Please find the details below:<br><br>1) Addition of a new API in Phosph=
or Logging dedicated to generating logs with RF-specific data on the D-bus:=
<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Workflow: =C2=A0 =C2=A0 =C2=A0<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 - The caller initiates a call to this API, creatin=
g a log entry on the D-bus.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - The new API al=
lows only RF specific data to log using internal D-Bus API from phosphor-lo=
gging.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - bmcweb monitors the interface-added=
 signal on the phosphor-logging D-bus logs.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
- Transmit the RF event associated with the logs relevant to RF.<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 (New API details are provided at the end of email)<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Pros:=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Consolidatio=
n of all RF-specific components within the logging API rather than being sc=
attered across other repositories.<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Cons:=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Introduct=
ion of an additional API in phosphor-logging for logging RF-related entries=
.<br><br>2) Utilization of Journal Log to record RF-specific details in the=
 journal, following the approach outlined in=C2=A0<a href=3D"https://github=
.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md" ta=
rget=3D"_blank">https://github.com/openbmc/docs/blob/master/architecture/re=
dfish-logging-in-bmcweb.md</a>.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 This methodo=
logy appears to be adhered to in upstream repositories, as evidenced by ref=
erences such as:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0<a href=3D"https://gro=
k.openbmc.org/xref/openbmc/estoraged/src/estoraged.cpp?r=3Dff1b64f0#160" ta=
rget=3D"_blank">https://grok.openbmc.org/xref/openbmc/estoraged/src/estorag=
ed.cpp?r=3Dff1b64f0#160</a><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0<a href=3D"=
https://grok.openbmc.org/xref/openbmc/dbus-sensors/src/TachSensor.hpp?r=3D1=
f978631#105" target=3D"_blank">https://grok.openbmc.org/xref/openbmc/dbus-s=
ensors/src/TachSensor.hpp?r=3D1f978631#105</a><br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0=C2=A0<a href=3D"https://grok.openbmc.org/xref/openbmc/telemetry/src/tri=
gger_actions.cpp?r=3Dcff70c14#94" target=3D"_blank">https://grok.openbmc.or=
g/xref/openbmc/telemetry/src/trigger_actions.cpp?r=3Dcff70c14#94</a><br><br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Workflow:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - The caller logs RF-specific details di=
rectly from the openBMC repo=E2=80=99s.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - bm=
cweb (inotify) potentially monitors logs containing RF-specific information=
 (e.g., REDFISH_MESSAGE_ID).<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Transmit the =
RF event associated with the logs relevant to RF.<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Cons: RF specific stuff scatte=
red across the repos.<br><br>3) Use &#39;Create&#39;=C2=A0 API from PDI=C2=
=A0<a href=3D"https://github.com/openbmc/phosphor-dbus-interfaces/blob/mast=
er/yaml/xyz/openbmc_project/Logging/Create.interface.yaml#L7" target=3D"_bl=
ank">https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/x=
yz/openbmc_project/Logging/Create.interface.yaml#L7</a><br>=C2=A0 =C2=A0 =
=C2=A0 for generating=C2=A0 RF specific data on D-Bus from backend-repos.<b=
r><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Workflow:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
- The caller logs RF-specific details using &#39;Create&#39; API from the o=
penBMC repos<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - bmcweb potentially monitors l=
ogs containing RF-specific information (e.g., REDFISH_MESSAGE_ID REDFISH_ME=
SSAGE_ARGS ).<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Transmit the RF event associ=
ated with the logs relevant to RF.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 Cons: RF specific stuff scattered across the repos.<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>4) Open to Suggestions:<br>=C2=A0 =C2=A0 W=
e remain open to alternative approaches for event transmission. If you have=
 any suggestions or insights, please feel free to share with us.<br>Thank y=
ou for your attention to this matter.<br><br>Best Regards<br>Chandramohan H=
arkude.<br><br>API details in short.<br>Example usage of=C2=A0 new API &#39=
;</font><span style=3D"font-family:georgia,serif">generateLog&#39;=C2=A0</s=
pan><span style=3D"font-family:georgia,serif">=C2=A0from=C2=A0 phosphor-log=
ging</span><span style=3D"font-family:georgia,serif">=C2=A0library.</span><=
/div><div><font face=3D"georgia, serif"><br>1)phosphor-user-manager want to=
 send an event when new user is created<br>=C2=A0 =C2=A0 Here propertyName =
and propertyValue is not required therefore dbusPropertyValueList =C2=A0is =
empty<br>=C2=A0 =C2=A0 std::string dbusPropertyValueList {};<br>=C2=A0 =C2=
=A0 std::string dbusObjectPath =3D &quot;/xyz/openbmc_project/user/testuser=
&quot;;<br>=C2=A0 =C2=A0 generateLog(connObject, MESSAGE_TYPE::RESOURCE_CRE=
ATED, Entry::Level::Informational, dbusPropertyValueList , dbusObjectPath);=
<br><br>2)phosphor-user-manager want to send an event when user is enabled<=
br>=C2=A0 =C2=A0 Here propertyName is &#39;UserEnabled&#39; and propertyVal=
ue is &#39;true&#39;<br>=C2=A0 =C2=A0 std::string dbusPropertyValueList =C2=
=A0=3D &quot;UserEnabled&quot; + &#39;,&#39; + &quot;true&quot;;<br>=C2=A0 =
=C2=A0 std::string dbusObjectPath =3D &quot;/xyz/openbmc_project/user/testu=
ser&quot;;<br>=C2=A0 =C2=A0 generateLog(</font>=C2=A0<span style=3D"font-fa=
mily:georgia,serif">connObject</span><font face=3D"georgia, serif">, MESSAG=
E_TYPE::PROPERTY_VALUE_MODIFIED,Entry::Level::Alert, dbusPropertyValueList =
,dbusObjectPath);<br>=C2=A0 =C2=A0<br>The API &#39;generateLog&#39; creates=
 entry on the D-Bus using internal D-Bus API from phosphor-logging.<br><br>=
Note : connObject is boost::asio::connection type</font></div></div></div><=
/div></div></div></div>

--000000000000739e73060b5dbc07--
