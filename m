Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C051B3F6AD2
	for <lists+openbmc@lfdr.de>; Tue, 24 Aug 2021 23:06:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvM914wMfz2yPX
	for <lists+openbmc@lfdr.de>; Wed, 25 Aug 2021 07:06:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=biyWPl3w;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::62d;
 helo=mail-pl1-x62d.google.com; envelope-from=wltu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=biyWPl3w; dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GvM8Z36Jkz2xSH
 for <openbmc@lists.ozlabs.org>; Wed, 25 Aug 2021 07:05:48 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id u15so12983147plg.13
 for <openbmc@lists.ozlabs.org>; Tue, 24 Aug 2021 14:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=GFjwgexY0D8WZnS30Kdvmz9caOBrbRU7W3w2WzsywkY=;
 b=biyWPl3wR1Ism6TLwg/aKKuRbaeI9WD57KHdiwuJ3D52RpQ67KkdA2YtasK1MRxpAR
 VoFc45NBoJLNkk4lY2xF5Pl4fFlBDtw6ikBgNnc+1iosuh1oTwQXTHxv9jYGhjrJEdZb
 ovaYyUyTWl4SuDcIzQtf52DkbRHdsS5i2TikUQHCOVweQDVx7cv5NElpg1uzhGgwvbB/
 F5xyqOr5l1a3Dv+hEvwDB9zWf6gR+gzJ5teuISfpUEpr+v75ElcL4ow74JX9jULrcrC7
 OSYlFh6s+vfmSqew0CRim7D61A8Z0KP5wq/OkOLOnR0id8tls1Un/siOijmuJ1+uSmT1
 olgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=GFjwgexY0D8WZnS30Kdvmz9caOBrbRU7W3w2WzsywkY=;
 b=WjItdc7E+0rlCWqsmjSEkHApBOL29Fm7noggqufgXVwymqqnvtykqCYQxVb4mnDVo2
 4zw39DdVdDiMMo06T/Uc+glT0mNZIkIODi1d8Cihm+kao1a/yEiUYEblIloheugWgWJ+
 cUVa0jDVKYxArFQIyXd+I5sDpAmTtaQUQB0FHm66hyZXm8mIbu52rVk+hYCbFJptGWUQ
 BMY42Y2wnAd0bU1Or4gQurLcsYgxomATUOCjrB+kA1GOVYbEei6hESU6Ar4CmJ3SjiXU
 i23PT7lrzMyWE/azo4NVRoXexoIG/BOTEmRm+NSFyliK7VS2IDTwpc1jDs8DoC9Jvzpx
 PMYw==
X-Gm-Message-State: AOAM531ysJpkoC0sGc4ZDUywLmFoE+C9gES1C4RLmIo4YoQAWVIo4Lh6
 2ll4RzVDlIlwxB3blUUvMtJvhR/FtegtcFxbsSR4BK+dg8xZCQ==
X-Google-Smtp-Source: ABdhPJwSvlBEFZyVQlzd7r7vvZnjLQbDvYXHor7ID8aSjkXC9kiMhaVfU8HipTEyquQ1AjDELNjgeO8qt5g/wwxt32o=
X-Received: by 2002:a17:902:8f97:b0:12f:fff9:bad4 with SMTP id
 z23-20020a1709028f9700b0012ffff9bad4mr24824456plo.65.1629839142718; Tue, 24
 Aug 2021 14:05:42 -0700 (PDT)
MIME-Version: 1.0
From: Willy Tu <wltu@google.com>
Date: Tue, 24 Aug 2021 14:05:32 -0700
Message-ID: <CAHwn2XmX=03J9jCgdV+xGV2qN+HmT0tDbZtKc0mk90fH3Y0VGA@mail.gmail.com>
Subject: [bmcweb] Update to Chassis Type and Chassis Action in Redfish
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000025030205ca547fa6"
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

--00000000000025030205ca547fa6
Content-Type: text/plain; charset="UTF-8"

Hi All,

## This is a announcement to update the ChassisType if you need Chassis
Action.

I have https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/45396 that
updated the usage of ChassisType and Chassis Reset Action.

The change basically remove ChaiisReset action from chassis resources that
is not a "RackMount". This is done to add more control over what resource
have access to the reset action.

With this change, it will removed the Chassis Reset Action if you have
updated your ChassisType to anything else other than 'RackMount`. This
change have no effect if you are using `Item.Board` to create Chassis
resource or
that you didn't update the ChassisType for `Item.Chassis` (Default will be
set to RackMount to match previous behavior).

The ChassisType can be found in
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/openbmc_project/Inventory/Item/Chassis.interface.yaml

Please let me know if you have any questions or concerns on this change.

Best,

Willy Tu

--00000000000025030205ca547fa6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div>## This is a announcement to up=
date the ChassisType if you need Chassis Action.<br></div><div><br></div><d=
iv>I have=C2=A0<a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/bmcw=
eb/+/45396">https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/45396</a>=
=C2=A0that updated the usage=C2=A0of ChassisType and Chassis Reset Action.<=
/div><div><br></div><div>The change basically remove ChaiisReset action fro=
m chassis resources that is not a &quot;RackMount&quot;. This is done to ad=
d more control over what resource have access to the reset action.</div><di=
v><br></div><div>With this change, it will removed the Chassis Reset Action=
 if you have updated your ChassisType to anything else other than &#39;Rack=
Mount`. This change have no effect if you are using `Item.Board` to create =
Chassis resource or</div><div>that you didn&#39;t update the ChassisType fo=
r `Item.Chassis` (Default will be set to RackMount to match previous behavi=
or).</div><div><br></div><div>The ChassisType can be found in=C2=A0<a href=
=3D"https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xy=
z/openbmc_project/Inventory/Item/Chassis.interface.yaml">https://github.com=
/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/openbmc_project/Inve=
ntory/Item/Chassis.interface.yaml</a></div><div><br></div><div>Please let m=
e know if you have any questions or concerns on this change.</div><div><br>=
</div><div>Best,</div><div><br></div><div>Willy Tu</div><div><br></div></di=
v>

--00000000000025030205ca547fa6--
