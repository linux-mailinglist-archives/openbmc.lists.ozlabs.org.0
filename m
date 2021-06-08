Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BC939EB4C
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 03:23:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzXYG0Rd0z3023
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 11:22:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=VhY1VL3G;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=wltu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=VhY1VL3G; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzXXx3k94z2yWN
 for <openbmc@lists.ozlabs.org>; Tue,  8 Jun 2021 11:22:39 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id
 k22-20020a17090aef16b0290163512accedso900430pjz.0
 for <openbmc@lists.ozlabs.org>; Mon, 07 Jun 2021 18:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=DoCqT57PWogse9MEhitLfrLcui5pryRHTkU2T4zomfc=;
 b=VhY1VL3GhRKi73XB9hfRPx+w8yOwUn8NHC/yFMX/TNATb9iFCJTVijztWq9pqjwCmO
 282TOPJDReOWswGV+ZeT4R7elldgov2cdbP9N4vA48GS6Qbr5szC63xJWv0uz+GKFREn
 EZ50FuGbXLcVNQHYW5cpOYoDKKzKgHBipneSFdJzN2C/zNU8Eq7ZnXGqYCtDRP0iuuQk
 XfrykoWhdm8XltYOOWQXRLKXbQmBkvYcGKmreELyiduTSFfvGAjBiho41cSz54dp2e2q
 /SYytvq3VSx4wqQ6HRpU8+3mIN/tP8Y6wG8UxH4w+6fs2tKTGSM+wZnjfrrBJUBvt4jm
 P4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=DoCqT57PWogse9MEhitLfrLcui5pryRHTkU2T4zomfc=;
 b=jMvEmgZDD2ocXygff5kty5rCO4c6ay7fV/Bb5hEQZw+tmPJmL80qElceBOjjkpupUp
 BkQvKT/T22EuKyGz75eqwnTKfOEPYKt4pMmUAUgiaEBAydZjIBETRkx8FucyraFudQtS
 8MkYOxRuLS+0l7/bZDQT05taNAc5r3+9Wbp5viHa2Atj4UmgVKJPunWiXssZtqAyQOep
 pCYAeNx16Wk24tGxnr+PrU6UCs4FNCZm1Lh4HvcKP5d1alZbTmRyF/8qCMEM/8Ja6Dhp
 yY36y5IIlI4MOxU/YU+Nk3zwuNN1oDUsLPLVuO8aP9PRX4hyxvNDNkhLUMevhTjOLAie
 PKbw==
X-Gm-Message-State: AOAM532sUOGF5Y6Aro4dBGqkeoN+5ygxqaQ0kAd527jOmRtbwot1opQg
 fYAD76V2oqse3f9tys05Okj/Gm1vo1OyVVaqjiypiiOjhZ91Qg==
X-Google-Smtp-Source: ABdhPJzPLUOYwYTx1pr1WJVqtw8fbM4Cdah5Vds2VZuZsfHj3yPNmdkjsv59gXBEDML+8kq7MBHN+kDGFgMMjjtmjOw=
X-Received: by 2002:a17:90a:cf12:: with SMTP id
 h18mr22561670pju.131.1623115355072; 
 Mon, 07 Jun 2021 18:22:35 -0700 (PDT)
MIME-Version: 1.0
From: Willy Tu <wltu@google.com>
Date: Mon, 7 Jun 2021 18:22:23 -0700
Message-ID: <CAHwn2Xkn5h2SJYHDriSgs2HYDv2WDMHqwOmaR5XAHaFFZjCLAg@mail.gmail.com>
Subject: [Bmcweb/Redfish] Chassis Physical Connectivity Support on bmcweb
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000002b991c05c436fe98"
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
Cc: Jie Yang <jjy@google.com>, Ed Tanous <edtanous@google.com>,
 Derek Chan <dchanman@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000002b991c05c436fe98
Content-Type: text/plain; charset="UTF-8"

Hi all,

I am thinking about adding better support for Physical Connectivity between
Boards/Chassises in bmcweb. Since Inventory.Board is treated as a chassis,
I want to have a way to better connect the different boards with the
existing ContainedBy/Contains.

I was thinking of using xyz.openbmc_project.Association to do it. Since it
is a list with fixed order, we can use the first chassis it finds
for ContainedBy and the rest for Contains. For the root Chassis, it will
have itself as the first Chassis and then just not include it.

Is this something we can work with? or do we need something more
complicated to support chassis relationship?

----

Another question that is kind of related.
I am also thinking about using Physical Location for each Chassis.
It is already using `xyz.openbmc_project.Inventory.Decorator.LocationCode`
as the ServiceLabel
https://github.com/openbmc/bmcweb/blob/90e97e1d26b78d899a543831a8051dacbbdde71a/redfish-core/lib/chassis.hpp#L295-L331

With that in mind, I am wondering how LocationCode is configured with
EntityManager? Since the number of FRUs is dynamic, there is no way to tell
which location the FRU is connected to without a mapping. I am wondering
how that can be done with Entity Manager.

I was thinking of doing something like getEntityName
<https://github.com/openbmc/google-ipmi-sys/blob/3b1b427c1fa4bcddcab1fc003410e5fa5d7a8334/handler.cpp#L235>
in
IPMI OEM handler which utilizes a json file for the mapping from entity
instance to location. This is a simple way of doing it within
EntityManager, but I am not sure if we want to do it this way.

Maybe something related?
https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/42971

Best,

Willy Tu

--0000000000002b991c05c436fe98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"color:rgb(32,33,36);font-family:Roboto=
,sans-serif;font-size:14px;white-space:pre-wrap;background-color:rgba(241,2=
43,244,0.75)">Hi all,<br></span></div><div><span style=3D"color:rgb(32,33,3=
6);font-family:Roboto,sans-serif;font-size:14px;white-space:pre-wrap;backgr=
ound-color:rgba(241,243,244,0.75)"><br></span></div><div><span style=3D"col=
or:rgb(32,33,36);font-family:Roboto,sans-serif;font-size:14px;white-space:p=
re-wrap;background-color:rgba(241,243,244,0.75)">I am thinking about adding=
 better support for Physical Connectivity between Boards/Chassises in bmcwe=
b. Since Inventory.Board is treated as a chassis, I want to have a way to b=
etter connect the different boards with the existing ContainedBy/Contains.<=
/span></div><div><span style=3D"color:rgb(32,33,36);font-family:Roboto,sans=
-serif;font-size:14px;white-space:pre-wrap;background-color:rgba(241,243,24=
4,0.75)"><br></span></div><div><span style=3D"color:rgb(32,33,36);font-fami=
ly:Roboto,sans-serif;font-size:14px;white-space:pre-wrap;background-color:r=
gba(241,243,244,0.75)">I was thinking of using </span>xyz.openbmc_project.A=
ssociation to do it. Since it is a list with fixed order, we can use the fi=
rst chassis it finds for=C2=A0ContainedBy and the rest for Contains. For th=
e root Chassis, it will have itself as the first Chassis and then just not =
include it.</div><div><br></div><div>Is this something we can work with? or=
 do we need something more complicated to support chassis relationship?</di=
v><div><span style=3D"color:rgb(32,33,36);font-family:Roboto,sans-serif;fon=
t-size:14px;white-space:pre-wrap;background-color:rgba(241,243,244,0.75)"><=
br></span></div><div><span style=3D"color:rgb(32,33,36);font-family:Roboto,=
sans-serif;font-size:14px;white-space:pre-wrap;background-color:rgba(241,24=
3,244,0.75)">----</span></div><div><span style=3D"color:rgb(32,33,36);font-=
family:Roboto,sans-serif;font-size:14px;white-space:pre-wrap;background-col=
or:rgba(241,243,244,0.75)"><br></span></div><div><span style=3D"color:rgb(3=
2,33,36);font-family:Roboto,sans-serif;font-size:14px;white-space:pre-wrap;=
background-color:rgba(241,243,244,0.75)">Another question that is kind of r=
elated.</span></div><span style=3D"color:rgb(32,33,36);font-family:Roboto,s=
ans-serif;font-size:14px;white-space:pre-wrap;background-color:rgba(241,243=
,244,0.75)"><div>I am also thinking about using Physical Location for each =
Chassis.</div>It is already using `xyz.openbmc_project.Inventory.Decorator.=
LocationCode` as the ServiceLabel <a href=3D"https://github.com/openbmc/bmc=
web/blob/90e97e1d26b78d899a543831a8051dacbbdde71a/redfish-core/lib/chassis.=
hpp#L295-L331">https://github.com/openbmc/bmcweb/blob/90e97e1d26b78d899a543=
831a8051dacbbdde71a/redfish-core/lib/chassis.hpp#L295-L331</a></span><br><d=
iv><span style=3D"color:rgb(32,33,36);font-family:Roboto,sans-serif;font-si=
ze:14px;white-space:pre-wrap;background-color:rgba(241,243,244,0.75)"><br><=
/span></div><div><span style=3D"color:rgb(32,33,36);font-family:Roboto,sans=
-serif;font-size:14px;white-space:pre-wrap;background-color:rgba(241,243,24=
4,0.75)">With that in mind, I am wondering how </span>LocationCode is confi=
gured with EntityManager? Since the number of FRUs is dynamic, there is no =
way to tell which location the FRU is connected to without a mapping. I am =
wondering how that can be done with Entity Manager.</div><div><br></div><di=
v>I was thinking of doing something=C2=A0like=C2=A0<a href=3D"https://githu=
b.com/openbmc/google-ipmi-sys/blob/3b1b427c1fa4bcddcab1fc003410e5fa5d7a8334=
/handler.cpp#L235">getEntityName</a>=C2=A0in IPMI OEM handler which utilize=
s a json file for the mapping from entity instance to location. This is a s=
imple way of doing it within EntityManager, but I am not sure if we want to=
 do it this way.</div><div><br></div><div>Maybe something related?</div><di=
v><span style=3D"color:rgb(32,33,36);font-family:Roboto,sans-serif;font-siz=
e:14px;white-space:pre-wrap;background-color:rgba(241,243,244,0.75)"><a hre=
f=3D"https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/42971">h=
ttps://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/42971</a><br><=
/span></div><div><br></div><div>Best,</div><div><br></div><div>Willy Tu</di=
v></div>

--0000000000002b991c05c436fe98--
