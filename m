Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C658554564
	for <lists+openbmc@lfdr.de>; Wed, 22 Jun 2022 12:51:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSgCs6WZfz3btT
	for <lists+openbmc@lfdr.de>; Wed, 22 Jun 2022 20:51:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KFOCBbbo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com; envelope-from=raviteja28031990@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KFOCBbbo;
	dkim-atps=neutral
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSgCV1mHTz2yMk
	for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2022 20:50:44 +1000 (AEST)
Received: by mail-io1-xd2a.google.com with SMTP id s17so10841242iob.7
        for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2022 03:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=bGHlAbbnWwIPNYSUQJ0AILCcdYqs3d3Q3lCKh+v2cTc=;
        b=KFOCBbboS5E6KZqYV8oU+RjPIHibNtBc/PreTnrb4iEMoIpbfk48NWcPG1ZX0dBrb9
         66p27knFL8Uy1vj71oKZ5HaptqZqyzjKUsZLDCoDecF8UDtpL5InKe8KHJrLw1xDrx7f
         p4plx5m7LhEgijuX6B9vK5UW36fjeqCT8sDir3DOZHfCZmKhVDeynQvXSxAPnYP8k8DK
         xE6979ttnQy9s4AG5tvHGnJPRygQM5sm/i/llPCU1uM+DMp4+3wvTrigfChavPfGXCZe
         ifZBck2SMHe/kRKNPf6Wf09rM98BHYruAfUY2fxjETxVPIQ0UdRp2mEOPEI2Vt2jwKYI
         yv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=bGHlAbbnWwIPNYSUQJ0AILCcdYqs3d3Q3lCKh+v2cTc=;
        b=eftT6z8pwhnWGi2KvIhkRZPssy7Al5m3kAMUTT9Lt9LqbZx/gRMZdEo3aGzyYxKXPa
         Fz19d7y/bRyfrFniH1iz7o489btl7A+vewX0yFJv73a7ShtuOhKf9gf5CtYXOuIURpjo
         lS51XzIQVYTtsGWMGePRhWAw9jzSCJqpI0o9KYb33p1ChuzWJTWuncWfRnpcPd/YqpZR
         dv5bKudlptXfkjl+zqMn89E89kiclQ5V+nog+MkzFUCWYdl/oUu9Rg05q51HEyLufiU8
         +kuNCD0KR/mzufAuM/xfcyepmTwf8aRScgi7G5ZbN7eAbv8ddiIk7TMd2n5CMFhVQrsr
         gW5g==
X-Gm-Message-State: AJIora+0u8y6Aq88XCnVrN8dXAP+7qf6sFqLF5d3Nywgy8YIaZPmJz9O
	2Yy9qKD9m2cb0SCSXFajciEwcgLxgZQDQnE8KYxRkVd78j4=
X-Google-Smtp-Source: AGRyM1sKwTgRufpz9DDlCRS9144hCyK5eKTnyf8/l71tl0cpC083jauF7Z6RTHItu6wsBASLeItGTluTOkAGYMOw4YI=
X-Received: by 2002:a05:6602:160b:b0:669:d8c0:4be6 with SMTP id
 x11-20020a056602160b00b00669d8c04be6mr1551264iow.43.1655895040885; Wed, 22
 Jun 2022 03:50:40 -0700 (PDT)
MIME-Version: 1.0
From: raviteja bailapudi <raviteja28031990@gmail.com>
Date: Wed, 22 Jun 2022 16:20:29 +0530
Message-ID: <CAM4DKZkkKx_MPVv_R7WqOhnKA+hRYWU4GK=DqbqqSVj_CtMtMg@mail.gmail.com>
Subject: OpenBMC Network Route Management: Metric and Static Route config support
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000b2865005e2071bc0"
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

--000000000000b2865005e2071bc0
Content-Type: text/plain; charset="UTF-8"

Hi Team

We have hit network routing issues while using Static IPv4 addresses on
both eth0 and eth1,  as both default gateways at the interfaces were of the
same metric value. To solve this problem we are planning to provide an
interface for admins to set the metric value for the gateway while setting
up the Static IPv4 network on BMC.


To enable users to connect from outside-subnet clients, we also need to
support static routes on BMC.


I have started a thread in redfish forum as well

https://redfishforum.com/thread/683/network-routing-table-management-support


Please share your views on the same.



Regards,

Raviteja

--000000000000b2865005e2071bc0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Team<div><br></div><div><p style=3D"margin:0px;font-str=
etch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica N=
eue&quot;">We have hit network routing issues while using Static IPv4 addre=
sses on both eth0 and eth1,=C2=A0 as both default gateways at the interface=
s were of the same metric value. To solve this problem we are planning to p=
rovide an interface for admins to set the metric value for the gateway whil=
e setting up the Static IPv4 network on BMC.</p><p style=3D"margin:0px;font=
-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helveti=
ca Neue&quot;"><br></p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;">To enable users=C2=A0to connect f=
rom outside-subnet clients, we also need to support static routes on BMC.</=
p><p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:nor=
mal;font-family:&quot;Helvetica Neue&quot;"><br></p><p style=3D"margin:0px;=
font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Hel=
vetica Neue&quot;">I have started a thread in redfish forum as well</p><p s=
tyle=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:normal;fo=
nt-family:&quot;Helvetica Neue&quot;;color:rgb(220,161,13)"><a href=3D"http=
s://redfishforum.com/thread/683/network-routing-table-management-support">h=
ttps://redfishforum.com/thread/683/network-routing-table-management-support=
</a></p></div><div><p style=3D"margin:0px;font-stretch:normal;font-size:13p=
x;line-height:normal;font-family:&quot;Helvetica Neue&quot;"><br></p><p sty=
le=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font=
-family:&quot;Helvetica Neue&quot;">Please share your views on the same.</p=
><p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norm=
al;font-family:&quot;Helvetica Neue&quot;"><br></p><p style=3D"margin:0px;f=
ont-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helv=
etica Neue&quot;"><br></p><p style=3D"margin:0px;font-stretch:normal;font-s=
ize:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;">Regards=
,</p><p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:=
normal;font-family:&quot;Helvetica Neue&quot;">Raviteja<br></p></div></div>

--000000000000b2865005e2071bc0--
