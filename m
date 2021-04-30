Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5E3370047
	for <lists+openbmc@lfdr.de>; Fri, 30 Apr 2021 20:15:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FX0sb4Lq6z300c
	for <lists+openbmc@lfdr.de>; Sat,  1 May 2021 04:15:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=cWu5ucJZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52a;
 helo=mail-ed1-x52a.google.com; envelope-from=ratankgupta31@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cWu5ucJZ; dkim-atps=neutral
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FX0sL4G9Vz2xxg
 for <openbmc@lists.ozlabs.org>; Sat,  1 May 2021 04:15:16 +1000 (AEST)
Received: by mail-ed1-x52a.google.com with SMTP id n25so11572004edr.5
 for <openbmc@lists.ozlabs.org>; Fri, 30 Apr 2021 11:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/Um5z+j3AxlSDsEx0dRV9Ztj0sCHkUYOOd65wdXVh+4=;
 b=cWu5ucJZLyCjg46CruUC4K50w76fRYw48L4xaIgJMpZ5FRJWw+zEFAtH5hj0O6OvuS
 D0brnaNVSOqXl846yH0dvZ43oYEyCaXt2OB3KL9lsPuGRqdPgU+TmqfEecKxNspSm1wC
 OsRgStlW32unI3PQarJeKqR9fpFNqkoOsPfVPUp1e9RwcKkIGhBZlSTASciSKoxdKLLx
 IwjQ3tZ6nr6xJsn8mVNJQ0cKsPpoxJeNQ1jLLtmPSgVarOcuJWbAIODIcHIH5FOhraWh
 XRMEAh402dEutWyO748H+45wO16/VKEL+4mPCfS3P/msY8cNPuIuO9tYNs4zo3sVOlSI
 Y8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/Um5z+j3AxlSDsEx0dRV9Ztj0sCHkUYOOd65wdXVh+4=;
 b=jyh+1RJJKQ8togINxGc7GCobPCpU6tsgobweRNwQnxeWtVa3ggtAOyAMZk0kQaSkXa
 y8HxS7K74uTonAqG2dRo3ki5qCBaThYwrhaBAeB9UEEe6HGkeaumNFgaivVua0npbukF
 Esuc7OQrclstQgsPDoU6awuDAQ06/pHy/lmWL+T85E9zvYESmA0ofjHfgYvDuOIurpSn
 zkjqYKsl2MA/00hVv3KyuplOVRu/8QGKmnpbXpy/parHrdVYZ3W/UWLS0C8YipFQuTwx
 VZSXvTtYZSXyIzlVn0B1sscCjIlFvRjxV7ws05Br+6Tv5/1UMWocP1pb9ThEIyiXbuPc
 EbEg==
X-Gm-Message-State: AOAM531cyH0ogHHasxulFrtG/sDUaHHwubct/WG0C+vYQYZEmG+on/Gb
 fQnAYlP7cLkAdFUoXxnpguLhsEDXSR0pmhadNGj/plI1vD4=
X-Google-Smtp-Source: ABdhPJzT/PMXr2GNT72yklYaRBsCPMkMZr8LX70imj1CXAs9ulRCTWzLSxUGyWy1GpjVLPi08og31olqFmZ2rmG8RF0=
X-Received: by 2002:aa7:cc15:: with SMTP id q21mr7805977edt.140.1619806511582; 
 Fri, 30 Apr 2021 11:15:11 -0700 (PDT)
MIME-Version: 1.0
From: Ratan Gupta <ratankgupta31@gmail.com>
Date: Fri, 30 Apr 2021 23:45:00 +0530
Message-ID: <CAMhqiMoFAHcUk0nO_xoOubcZqF_dPDFweqsttTULRJK38o1Ung@mail.gmail.com>
Subject: D-bus model proposal for pay for access features
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000ba519c05c134972b"
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

--000000000000ba519c05c134972b
Content-Type: text/plain; charset="UTF-8"

Hi All,

I would like to introduce a dbus model proposal around pay for access
features.Normally IBM system ships with more hardware than was
purchased, which can be unlocked later.

Features could be 1) AIX enabled/disabled
2) How many processors are enabled
3) How much memory is enabled

*Proposed Model:*

The model consists of following main entities:1 - licenses - these
objects represents the features.  There will be a license represnting
feature(one is to one relation ship) and these objects have state -
active, inactive, unknown, etc.
These objects could implement the Delete interface for when a client
wishes to disable the license/feature.

2 - manager - the manager object (distinct from freedesktop object
manager) provides a method
interface to create new license objects.

*Alternate Dbus Model:*

1 - Licenses: these objects represent an agreement.  These objects have an
association to one or more features, and these objects have state -
active,inactive, unknown, etc.
These objects could implement the Delete interface for when a client
wishes to disable the license.

2 - Features: these objects describe the features available.
Feature objects would be static and implementation/platform defined.
A BMC or host firmware update
could potentially add or remove the available features exposed as dbus
objects.  At the moment the
only feature attribute I can think of is a name and the feature status.

3 Manager - the manager object (distinct from freedesktop object manager)
provides a method interface to create new license objects.

The difference between two models areIn the alternate Dbus model we
are keeping the feature Dbus object and the License have an associated
features
In the proposed model we are only keeping the license D-bus object
which represent the feature.

Flow would be as below with the proposed model -1/ Manager object
would be having interface like upload (License activation key)
2/ On IBM systems we send this key to the host firmware which
activates the features
3/ Host Firmware sends the activated feature list to the BMC
4/ BMC creates the licenses for the activated features

I suspect an implementation of the above flow is highly IBM specific,
but I hope some of you have some feedback that might enable some
collaboration.
If not - where should we put this application?

Ratan

--000000000000ba519c05c134972b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre class=3D"gmail-c-mrkdwn__pre" style=3D"box-sizing:inh=
erit;margin:4px 0px;padding:8px;font-size:12px;line-height:1.50001;font-var=
iant-ligatures:none;white-space:pre-wrap;word-break:normal;font-family:Mona=
co,Menlo,Consolas,&quot;Courier New&quot;,monospace;border-radius:4px;color=
:rgb(29,28,29);font-style:normal;font-variant-caps:normal;font-weight:400;l=
etter-spacing:normal;text-align:left;text-indent:0px;text-transform:none;wo=
rd-spacing:0px;text-decoration-style:initial;text-decoration-color:initial"=
>Hi All,<br><br><span class=3D"gmail-c-mrkdwn__br" style=3D"box-sizing:inhe=
rit;display:block;height:unset"></span>I would like to introduce a dbus mod=
el proposal around pay for access features.<span class=3D"gmail-c-mrkdwn__b=
r" style=3D"box-sizing:inherit;display:block;height:unset"></span>Normally =
IBM system ships with more hardware than was purchased, which can be unlock=
ed later.<br><br style=3D"box-sizing:inherit">Features could be <span class=
=3D"gmail-c-mrkdwn__br" style=3D"box-sizing:inherit;display:block;height:un=
set"></span>1) AIX enabled/disabled  <br style=3D"box-sizing:inherit">2) Ho=
w many processors are enabled<br style=3D"box-sizing:inherit">3) How much m=
emory is enabled<br><br><span class=3D"gmail-c-mrkdwn__br" style=3D"box-siz=
ing:inherit;display:block;height:unset"></span><b>Proposed Model:</b><br><b=
r><span class=3D"gmail-c-mrkdwn__br" style=3D"box-sizing:inherit;display:bl=
ock;height:unset"></span>The model consists of following main entities:<spa=
n class=3D"gmail-c-mrkdwn__br" style=3D"box-sizing:inherit;display:block;he=
ight:unset"></span>1 - licenses - these objects represents the features.  T=
here will be a license represnting <br>feature(one is to one relation ship)=
 and these objects have state - active, inactive, unknown, etc.<br style=3D=
"box-sizing:inherit">These objects could implement the Delete interface for=
 when a client wishes to disable the license/feature.<br><br><span class=3D=
"gmail-c-mrkdwn__br" style=3D"box-sizing:inherit;display:block;height:unset=
"></span><span class=3D"gmail-c-mrkdwn__br" style=3D"box-sizing:inherit;dis=
play:block;height:unset"></span>2 - manager - the manager object (distinct =
from freedesktop object manager) provides a method<br>interface to create n=
ew license objects.<br><br><span class=3D"gmail-c-mrkdwn__br" style=3D"box-=
sizing:inherit;display:block;height:unset"></span><b>Alternate Dbus Model:<=
/b><br><br><span class=3D"gmail-c-mrkdwn__br" style=3D"box-sizing:inherit;d=
isplay:block;height:unset"></span>1 - Licenses: these objects represent an =
agreement.  These objects have an<br style=3D"box-sizing:inherit">associati=
on to one or more features, and these objects have state - active,inactive,=
 unknown, etc.<br>These objects could implement the Delete interface for wh=
en a client wishes to disable the license.<br><br><span class=3D"gmail-c-mr=
kdwn__br" style=3D"box-sizing:inherit;display:block;height:unset"></span>2 =
- Features: these objects describe the features available.<br style=3D"box-=
sizing:inherit">Feature objects would be static and implementation/platform=
 defined.  A BMC or host firmware update <br>could potentially add or remov=
e the available features exposed as dbus objects.  At the moment the <br>on=
ly feature attribute I can think of is a name and the feature status.<br><b=
r><span class=3D"gmail-c-mrkdwn__br" style=3D"box-sizing:inherit;display:bl=
ock;height:unset"></span>3 Manager - the manager object (distinct from free=
desktop object manager)<br style=3D"box-sizing:inherit">provides a method i=
nterface to create new license objects.<br><br><span class=3D"gmail-c-mrkdw=
n__br" style=3D"box-sizing:inherit;display:block;height:unset"></span><span=
 class=3D"gmail-c-mrkdwn__br" style=3D"box-sizing:inherit;display:block;hei=
ght:unset"></span>The difference between two models are<span class=3D"gmail=
-c-mrkdwn__br" style=3D"box-sizing:inherit;display:block;height:unset"></sp=
an>In the alternate Dbus model we are keeping the feature Dbus object and t=
he License have an associated features<br style=3D"box-sizing:inherit">In t=
he proposed model we are only keeping the license D-bus object which repres=
ent the feature.<br><br><span class=3D"gmail-c-mrkdwn__br" style=3D"box-siz=
ing:inherit;display:block;height:unset"></span><span class=3D"gmail-c-mrkdw=
n__br" style=3D"box-sizing:inherit;display:block;height:unset"></span>Flow =
would be as below with the proposed model -<span class=3D"gmail-c-mrkdwn__b=
r" style=3D"box-sizing:inherit;display:block;height:unset"></span>1/ Manage=
r object would be having interface like upload (License activation key)<br =
style=3D"box-sizing:inherit">2/ On IBM systems we send this key to the host=
 firmware which activates the features<br style=3D"box-sizing:inherit">3/ H=
ost Firmware sends the activated feature list to the BMC<br style=3D"box-si=
zing:inherit">4/ BMC creates the licenses for the activated features<br><br=
><span class=3D"gmail-c-mrkdwn__br" style=3D"box-sizing:inherit;display:blo=
ck;height:unset"></span><span class=3D"gmail-c-mrkdwn__br" style=3D"box-siz=
ing:inherit;display:block;height:unset"></span>I suspect an implementation =
of the above flow is highly IBM specific, <br style=3D"box-sizing:inherit">=
but I hope some of you have some feedback that might enable some collaborat=
ion.  <br style=3D"box-sizing:inherit">If not - where should we put this ap=
plication?<br></pre><pre class=3D"gmail-c-mrkdwn__pre" style=3D"box-sizing:=
inherit;margin:4px 0px;padding:8px;font-size:12px;line-height:1.50001;font-=
variant-ligatures:none;white-space:pre-wrap;word-break:normal;font-family:M=
onaco,Menlo,Consolas,&quot;Courier New&quot;,monospace;border-radius:4px;co=
lor:rgb(29,28,29);font-style:normal;font-variant-caps:normal;font-weight:40=
0;letter-spacing:normal;text-align:left;text-indent:0px;text-transform:none=
;word-spacing:0px;text-decoration-style:initial;text-decoration-color:initi=
al">Ratan<br></pre></div>

--000000000000ba519c05c134972b--
