Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A0A7FFF92
	for <lists+openbmc@lfdr.de>; Fri,  1 Dec 2023 00:40:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=O3UqAYFY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShCNp0mhwz3cTf
	for <lists+openbmc@lfdr.de>; Fri,  1 Dec 2023 10:40:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=O3UqAYFY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::230; helo=mail-oi1-x230.google.com; envelope-from=chandramohan.harkude@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgRyr6TF1z3cmg
	for <openbmc@lists.ozlabs.org>; Thu, 30 Nov 2023 05:03:47 +1100 (AEDT)
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3b88c29a995so18783b6e.0
        for <openbmc@lists.ozlabs.org>; Wed, 29 Nov 2023 10:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701281022; x=1701885822; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zSHytyL9luqdTPJjnoiyK7MePybTPl0QqMLd7SncooQ=;
        b=O3UqAYFYh9T3WhINO6VwaUuB+EiUJL9yv1h3i6fSXNQFZH2hDtQIPn1cCJ0e0NIeQn
         JJ3HL0eNuWzzzPMvOOnNQUvdnAAKVi54e92dqJZoCXPhdOfEtn+Z4slw/4uQlN5G6Urf
         v5akVv9pybDLImECLWamn6GQWn7kNEUk8jTbfzg8bF3VqIEJlnfoInGDwgffhMcHlhWB
         e8wHUX5nDTgvaLhXIeoWQ9Mf9MbWucRP/hfslrIxwxaNDCU3wE2qrceDQSyQPR0XEj7s
         +CpW/pOEKJlumme+4u0YzERcH6AqqCtquC2hWFMGZjiwXD3ItgZ+TYSDdswclFUuoCwI
         KPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701281022; x=1701885822;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zSHytyL9luqdTPJjnoiyK7MePybTPl0QqMLd7SncooQ=;
        b=R/VkOLYaBEDxpBeTw5mhlxKg2SvUN5Ryfm5tV3P4PVfAN9fCes0AbLCg77sfi7+Bnp
         ub1jFnN607xrMjs82Ri7gS1KDqEosQjLrAd855eALYaLpWbU2ElI3seGs+JMTKGPdeyy
         aEUufnzn+ZYMfCJthRFLX62tDLCzrXpC/P3dg/6tZ3cGh4Fdo3BeKAX08bThPpoKt+Wn
         bi1SWtyLAbnHBlExZzEg+3iZ9wJzeQzxdZcUq1ZkH/otKkFj/l64TsEWLpkjaFpMyWUp
         ANoJgK0O3iVu8V/l1MVe+E1eae1up6XeNVHLO04S+KUQBNIW8uWYon+NIN/lnxwECpJE
         sw4w==
X-Gm-Message-State: AOJu0YzO9wRamBVAz+YLo5bPqLHqjunHvlyJMg8angOdIa6jNijV74V1
	R9sawclAflCyqTioRpjsUQiJFo9R1ow+lqkoFygaZloHbNY=
X-Google-Smtp-Source: AGHT+IErXEZxf5rEpsvIs17gV8gFAXRpmp28NpxArbK6EU4ZXE9KKO4g67AvbhVw3A+W38X15yXebcDkJdeVkpJMZV8=
X-Received: by 2002:a05:6808:2081:b0:3a8:7c67:7cd with SMTP id
 s1-20020a056808208100b003a87c6707cdmr23217910oiw.24.1701281022074; Wed, 29
 Nov 2023 10:03:42 -0800 (PST)
MIME-Version: 1.0
From: Chandramohan <chandramohan.harkude@gmail.com>
Date: Wed, 29 Nov 2023 23:33:30 +0530
Message-ID: <CAAtDDLbih38WXPBKk7aP+nuzKWdSU98g8PupeqW1wVJwSHpbKw@mail.gmail.com>
Subject: Suggestions required for sending the RF events in case of change
 happens on the backend-repos
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000fbe246060b4e5af9"
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

--000000000000fbe246060b4e5af9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

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

--000000000000fbe246060b4e5af9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><font face=3D"georgia, serif">H All,</font></div><div=
><font face=3D"georgia, serif"><br>I wanted to discuss various design appro=
aches for, sending RF events from various OpenBMC services for resource cre=
ate/delete/modify cases (but not limited to this), <br>Please find the deta=
ils below:<br><br>1) Addition of a new API in Phosphor Logging dedicated to=
 generating logs with RF-specific data on the D-bus:<br><br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Workflow: =C2=A0 =C2=A0 =C2=A0 <br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 - The caller initiates a call to this API, creating a log entry on the =
D-bus.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - The new API allows only RF specific=
 data to log using internal D-Bus API from phosphor-logging.<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 - bmcweb monitors the interface-added signal on the phosp=
hor-logging D-bus logs.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Transmit the RF ev=
ent associated with the logs relevant to RF.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 (New API details are provided at the end of email)<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Pros:=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Consolidation of all RF-specific =
components within the logging API rather than being scattered across other =
repositories.<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Cons:=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Introduction of an additional =
API in phosphor-logging for logging RF-related entries.<br><br>2) Utilizati=
on of Journal Log to record RF-specific details in the journal, following t=
he approach outlined in <a href=3D"https://github.com/openbmc/docs/blob/mas=
ter/architecture/redfish-logging-in-bmcweb.md">https://github.com/openbmc/d=
ocs/blob/master/architecture/redfish-logging-in-bmcweb.md</a>.<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 This methodology appears to be adhered to in upstream =
repositories, as evidenced by references such as:<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 <a href=3D"https://grok.openbmc.org/xref/openbmc/estoraged/src/estor=
aged.cpp?r=3Dff1b64f0#160">https://grok.openbmc.org/xref/openbmc/estoraged/=
src/estoraged.cpp?r=3Dff1b64f0#160</a><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a hr=
ef=3D"https://grok.openbmc.org/xref/openbmc/dbus-sensors/src/TachSensor.hpp=
?r=3D1f978631#105">https://grok.openbmc.org/xref/openbmc/dbus-sensors/src/T=
achSensor.hpp?r=3D1f978631#105</a><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=
=3D"https://grok.openbmc.org/xref/openbmc/telemetry/src/trigger_actions.cpp=
?r=3Dcff70c14#94">https://grok.openbmc.org/xref/openbmc/telemetry/src/trigg=
er_actions.cpp?r=3Dcff70c14#94</a><br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Workf=
low:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
 The caller logs RF-specific details directly from the openBMC repo=E2=80=
=99s.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - bmcweb (inotify) potentially monitor=
s logs containing RF-specific information (e.g., REDFISH_MESSAGE_ID).<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Transmit the RF event associated with the log=
s relevant to RF.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Cons: RF specific stuff scattered across the repos.<br><br>3)=
 Use &#39;Create&#39;=C2=A0 API from PDI <a href=3D"https://github.com/open=
bmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/openbmc_project/Logging/C=
reate.interface.yaml#L7">https://github.com/openbmc/phosphor-dbus-interface=
s/blob/master/yaml/xyz/openbmc_project/Logging/Create.interface.yaml#L7</a>=
 <br>=C2=A0 =C2=A0 =C2=A0 for generating=C2=A0 RF specific data on D-Bus fr=
om backend-repos.<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Workflow:<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 - The caller logs RF-specific details using &#39;Creat=
e&#39; API from the openBMC repos<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - bmcweb p=
otentially monitors logs containing RF-specific information (e.g., REDFISH_=
MESSAGE_ID REDFISH_MESSAGE_ARGS ).<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Transmi=
t the RF event associated with the logs relevant to RF.<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 <br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Cons: RF specific stuff scatt=
ered across the repos.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>4) Open to Sugges=
tions:<br>=C2=A0 =C2=A0 We remain open to alternative approaches for event =
transmission. If you have any suggestions or insights, please feel free to =
share with us.<br>Thank you for your attention to this matter.<br><br>Best =
Regards<br>Chandramohan Harkude.<br><br>API details in short.<br>Example us=
age of=C2=A0 new API &#39;</font><span style=3D"font-family:georgia,serif">=
generateLog&#39;=C2=A0</span><span style=3D"font-family:georgia,serif">=C2=
=A0from=C2=A0 phosphor-logging</span><span style=3D"font-family:georgia,ser=
if">=C2=A0library.</span></div><div><font face=3D"georgia, serif"><br>1)pho=
sphor-user-manager want to send an event when new user is created<br>=C2=A0=
 =C2=A0 Here propertyName and propertyValue is not required therefore dbusP=
ropertyValueList =C2=A0is empty <br>=C2=A0 =C2=A0 std::string dbusPropertyV=
alueList {};<br>=C2=A0 =C2=A0 std::string dbusObjectPath =3D &quot;/xyz/ope=
nbmc_project/user/testuser&quot;;<br>=C2=A0 =C2=A0 generateLog(connObject, =
MESSAGE_TYPE::RESOURCE_CREATED, Entry::Level::Informational, dbusPropertyVa=
lueList , dbusObjectPath);<br><br>2)phosphor-user-manager want to send an e=
vent when user is enabled<br>=C2=A0 =C2=A0 Here propertyName is &#39;UserEn=
abled&#39; and propertyValue is &#39;true&#39;<br>=C2=A0 =C2=A0 std::string=
 dbusPropertyValueList =C2=A0=3D &quot;UserEnabled&quot; + &#39;,&#39; + &q=
uot;true&quot;;<br>=C2=A0 =C2=A0 std::string dbusObjectPath =3D &quot;/xyz/=
openbmc_project/user/testuser&quot;;<br>=C2=A0 =C2=A0 generateLog(</font>

<span style=3D"font-family:georgia,serif">connObject</span><font face=3D"ge=
orgia, serif">, MESSAGE_TYPE::PROPERTY_VALUE_MODIFIED,Entry::Level::Alert, =
dbusPropertyValueList ,dbusObjectPath);<br>=C2=A0 =C2=A0 <br>The API &#39;g=
enerateLog&#39; creates entry on the D-Bus using internal D-Bus API from ph=
osphor-logging.<br><br>Note : connObject is boost::asio::connection type</f=
ont><br></div></div>

--000000000000fbe246060b4e5af9--
