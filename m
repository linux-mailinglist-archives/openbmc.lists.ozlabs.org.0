Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 233B41415AE
	for <lists+openbmc@lfdr.de>; Sat, 18 Jan 2020 04:18:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48036G72KzzDqyk
	for <lists+openbmc@lfdr.de>; Sat, 18 Jan 2020 14:18:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22e;
 helo=mail-oi1-x22e.google.com; envelope-from=ssraghavan76@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Fnz+BnDe; dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48035b4D42zDqyj
 for <openbmc@lists.ozlabs.org>; Sat, 18 Jan 2020 14:17:33 +1100 (AEDT)
Received: by mail-oi1-x22e.google.com with SMTP id l9so24038997oii.5
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2020 19:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=cBiVtPjohZr3I/jOwDq0TX+krzk0A8Mh8EdgasFgwZo=;
 b=Fnz+BnDeEr5zRR4w+eA99GrWgPqbBxEK0W+SQylCxazFp9RjEjddyPrsxHbBMPZ61r
 62xsN4NvSqdNx0GgG/pGNwf1N8JsZamKugRGDZgwO8g3eoxPy2FbVwEEUasW5Y5ukYng
 NhCRQIgcg2qs7TcujGa9Z6a+l9ytG98QvefuVufLYABa4LPqOLC0vNR9opCUaygWuIKJ
 YVY9HI4gsFchzOmVFQTQMfnfSPmoxclPH86CMu0vg3+6lr5SHYm20BN8aMj5+cdVJHxn
 YXW4sQluv5JrCperP5w4l3+IWhB2VV0xclz4F1mKv/7P2ixlf/9mvr11IfKmJkEeSH55
 494Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=cBiVtPjohZr3I/jOwDq0TX+krzk0A8Mh8EdgasFgwZo=;
 b=tl2qvIll7YWiRAaijEy9Dz3qEg1wlcrKzr9+0V2Zg6Ri9un1UUCcGWH0uS8XQiI5AY
 /incvyqLguz0lr82i8qtuecoSxtQVgTNVMwPPhAwfMh96pSnBxKPEwsRv1gZu8UF18ye
 zNs8dkEYkBRc44ktsjLbnEi0dx2MFZBFdTBziNnffVNPY0KaM4n2UjSIBHhPAo+zR5r8
 3mtc0fXhd4s6PeWXh2DAVY0/6efHVCOsOtBEXHhtt0krYKAko6fb7z2t+Fce1cxF18x8
 +mFl9phsB++0II4mVvwBX38yHL/X1+axag+UsSnZE78g2z86vkHZu28NCIQUEO/q3cEE
 xKeg==
X-Gm-Message-State: APjAAAWX6C0KaYo62wb5TVXiz74a2FunWKmXpuhWGMzu8/lP88OurAB7
 cgzWXX2rqC1EpSSXxdTLknPF/k7zpAwraMG3EIJaC61UBq8=
X-Google-Smtp-Source: APXvYqyLR7mQPB5N1w5VDW7hXeVtGfCfRfB4jVMd2ltVbJe6+uDL7JDYvRWiTqly1HWiYJINK5zxn5GQm5uoqpnpdcI=
X-Received: by 2002:a54:4117:: with SMTP id l23mr5692183oic.140.1579317450265; 
 Fri, 17 Jan 2020 19:17:30 -0800 (PST)
MIME-Version: 1.0
From: Srinivasa Raghavan <ssraghavan76@gmail.com>
Date: Sat, 18 Jan 2020 08:47:59 +0530
Message-ID: <CAENXB_QOy+7Gm=E+Qmvu+HscvkuGExFYMBBuesiLGFVWtXSjEQ@mail.gmail.com>
Subject: Support Multiple CPU, I/O modules( Redfish )
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000009c5902059c617f17"
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

--0000000000009c5902059c617f17
Content-Type: text/plain; charset="UTF-8"

Hi,

I am new to openbmc and happen to work on this to support multiple CPU, I/O
modules, etc using Redfish(bmcweb). Currently, I believe that the Redfish
hardcoded for only one system. Is it possible to support multiple H/W. My
requirement is as below

/redfish/v1/Systems/1     --> for CPU1
/redfish/v1/Systems/2     --> for CPU2
/redfish/v1/Systems/3     --> for CPU3
/redfish/v1/Systems/4     --> for CPU4

/redfish/v1/Systems/10    --> for I/O1
/redfish/v1/Systems/11    --> for I/O2

If Redfish supports multiple H/W's, I have changed the following sources to
to support multiple CPU, I/O modules,  Is this correct?
cpudimm.hpp
storage.hpp
systems.hpp.

Is there anything else need to change in the schema file to support
multiple H/W's. Thanks in Advance !!!

Regards,
Srinivasa Raghavan

--0000000000009c5902059c617f17
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I am new to openbmc and happen to w=
ork on this to support multiple CPU, I/O modules, etc using Redfish(bmcweb)=
. Currently, I believe that the Redfish hardcoded for only one system. Is i=
t possible to support multiple H/W. My requirement is as below</div><div><b=
r></div><div><span style=3D"font-size:11pt;font-family:Calibri,sans-serif;b=
ackground-image:initial;background-position:initial;background-size:initial=
;background-repeat:initial;background-origin:initial;background-clip:initia=
l;background-color:rgb(255,255,255)">/redfish/v1/Systems/1=C2=A0 =C2=A0 =C2=
=A0--&gt; for CPU1</span><br></div><div><div><span style=3D"font-size:11pt;=
font-family:Calibri,sans-serif;background-image:initial;background-position=
:initial;background-size:initial;background-repeat:initial;background-origi=
n:initial;background-clip:initial">/redfish/v1/Systems/2=C2=A0 =C2=A0 =C2=
=A0--&gt; for CPU2=C2=A0</span><br></div><div></div></div><div><div><span s=
tyle=3D"font-size:11pt;font-family:Calibri,sans-serif;background-image:init=
ial;background-position:initial;background-size:initial;background-repeat:i=
nitial;background-origin:initial;background-clip:initial">/redfish/v1/Syste=
ms/3=C2=A0

 =C2=A0 =C2=A0--&gt; for CPU3=C2=A0</span><br></div><div></div></div><div><=
div><span style=3D"font-size:11pt;font-family:Calibri,sans-serif;background=
-image:initial;background-position:initial;background-size:initial;backgrou=
nd-repeat:initial;background-origin:initial;background-clip:initial">/redfi=
sh/v1/Systems/4=C2=A0

 =C2=A0 =C2=A0--&gt; for CPU4=C2=A0</span><br></div><div></div></div><div><=
br></div><div><div><span style=3D"font-size:11pt;font-family:Calibri,sans-s=
erif;background-image:initial;background-position:initial;background-size:i=
nitial;background-repeat:initial;background-origin:initial;background-clip:=
initial">/redfish/v1/Systems/10=C2=A0 =C2=A0 --&gt; for I/O1

</span><br></div><div></div></div><div><div><span style=3D"font-size:11pt;f=
ont-family:Calibri,sans-serif;background-image:initial;background-position:=
initial;background-size:initial;background-repeat:initial;background-origin=
:initial;background-clip:initial">/redfish/v1/Systems/11

 =C2=A0 =C2=A0--&gt; for I/O2=C2=A0</span><br></div><div></div></div><div><=
br></div><div>If Redfish supports multiple H/W&#39;s, I have changed the fo=
llowing sources to to support multiple CPU, I/O modules,=C2=A0 Is this corr=
ect?</div><div>cpudimm.hpp</div><div>storage.hpp</div><div>systems.hpp.</di=
v><div><br></div><div>Is there anything else need to change in the schema f=
ile to support multiple=C2=A0H/W&#39;s. Thanks in Advance !!!</div><div><br=
></div><div>Regards,</div><div>Srinivasa Raghavan</div></div>

--0000000000009c5902059c617f17--
