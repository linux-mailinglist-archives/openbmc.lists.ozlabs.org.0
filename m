Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0CB39222B
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 23:37:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fr46V6Wstz2ykJ
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 07:37:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=dWr7kU8G;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=wltu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=dWr7kU8G; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fr46D4Gvgz2xfm
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 07:37:06 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id 6so2063808pgk.5
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 14:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=WVae8XAQCOaTHhNHoXZJ623krxRQODrezKfepRQOaZ0=;
 b=dWr7kU8G0BqpBuR46fko9kXxG4V2cnTAtQykfB9yElFovjZuPHrAG6RUHdwyPvuAVJ
 R7OX/ooQSEj7FqZz1llND0GKlyS13ttIVUlIDlT+OesgWekphtCLaM5A5ZBdA2hkjYUC
 Pb516LJ/L9EDVw9deb/JITfF9y1DfCtmMvW7NttQEiQc8qlrMWO4pnRtY1TFT8gIKPgH
 rXcOJ+sw4xEBIK3LWN11VxoGIJ09Gk5P+BgiQsrXy/6INOJBSOtN+NxVUl3njfsF0C1n
 CFX1WcdjHtGe7aJFDNF7zktZm9x21umKd69Uj1LP+WfgehFaBDRNyGCGXABADQj14JiR
 /8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=WVae8XAQCOaTHhNHoXZJ623krxRQODrezKfepRQOaZ0=;
 b=rjpQADOXg25SeDXQbBULJs0gftALb6e6iq8vhil/g+i6l+7SkxQNLDaBsAKZjHoT91
 JUEp6WlN9gY88FxgMFi/CUEnyqxHX+ZgBZq2B9aAtRSs88tSZoTomiubmnQyWdT/AVKY
 sE2arobEkQ7Yxl9MjQ4rP74KWglovkj3W0dqZIc2P8zM718ZrIRB3DLzFfzKx8mAQcvP
 oGhu2FK5ttsG5HXg59UTkBeIFsafCewc6FV3lPoNikmDXOvm8iFhlVv624d9nC2nIJTC
 TsY56BTWtzWyjCeh/CUV5D8CUIPKRYPUacBwu/hC+5o0NTd+yUwcbaYGhu/o/92fjOuM
 hMdw==
X-Gm-Message-State: AOAM5302Nv20csYCYWqgG1Y7kUYWByHt5AS5+oeLYSkPvvoxnFzUpQCn
 Qh4Rq5fmMzT0ELhEe3cmrTuLwa7R7ORF1Y9GGKEkVqBqjRsGgA==
X-Google-Smtp-Source: ABdhPJx98spCzMGObxQO8F6jIT7mg/oDVRXNdXqO2O+18gYWJc1bkDVSujb4RPIZikZvPKDTno+KcmtTSNmIdO9rDCU=
X-Received: by 2002:a62:f24b:0:b029:2dc:9098:c14c with SMTP id
 y11-20020a62f24b0000b02902dc9098c14cmr463736pfl.19.1622065023813; Wed, 26 May
 2021 14:37:03 -0700 (PDT)
MIME-Version: 1.0
From: Willy Tu <wltu@google.com>
Date: Wed, 26 May 2021 14:36:52 -0700
Message-ID: <CAHwn2XnHGqBLS7W_AUsaAqpeybp_ZrPFDFqG=W_Tht32eip5Tg@mail.gmail.com>
Subject: [bmcweb] Extending bmcweb support on Storage/Drive
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000008c8f6105c34271e5"
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
Cc: Ed Tanous <edtanous@google.com>, Rui Zhang <ruizhan@google.com>,
 Nan Zhou <nanzhou@google.com>, Derek Chan <dchanman@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000008c8f6105c34271e5
Content-Type: text/plain; charset="UTF-8"

Hi all,

Main discussion:
https://lore.kernel.org/openbmc/CAHwn2XknKWyv6Bsq48tkvA52rHKZRFoEJgUuZUmMj6uZb584JQ@mail.gmail.com/
(a
bit outdated)

This will be a sub-thread about Storage/Drive resources and new properties
that I want to add to bmcweb.

Related thread: device level logging service
<https://lore.kernel.org/openbmc/CAHwn2XnqABuyc3uMQDs+YgwYJL+yKLwCYn1myOVdZ=gkhw3L-A@mail.gmail.com/>

I am thinking of adding a number of support for Storage/Drive in bmcweb and
just want some feedback from the community,

The potential changes includes
- Multi-Storage Resource Support
- Drive Software
- New Drive Property Support
  - State Conditions
 - PhysicalLocation
 - Reset Action

-----

Storage:

Adding support for multiple Storages instead of just hardcoded to `1`. This
allows us to represent one Storage per plugin and organize the
resources differently.

We could potentially use
`xyz.openbmc_project.Inventory.Item.StorageController` to create the
storages and everything Drive under it will be linked.

----

Drive Software:

It will use SoftwareInventory and will just need to be able to add
RelatedItem back to a Drive based on the D-bue Association interface.

----

Drive Properties:

 - State Conditions:
Add log services related to the drive as discussed in device level logging
<https://lore.kernel.org/openbmc/CAHwn2XnqABuyc3uMQDs+YgwYJL+yKLwCYn1myOVdZ=gkhw3L-A@mail.gmail.com/>
to
add debug information.

- PhysicalLocation
Use ` Inventory.Decorator.LocationCode` directly

-  Reset Action
Add reset/powercycle support to Drive resource. Based on
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/43155
.

---

Please let me know if there are any questions and suggestions on the
proposed changes.

Best,

Willy Tu

--0000000000008c8f6105c34271e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>Main discussion:=C2=A0<a href=
=3D"https://lore.kernel.org/openbmc/CAHwn2XknKWyv6Bsq48tkvA52rHKZRFoEJgUuZU=
mMj6uZb584JQ@mail.gmail.com/" target=3D"_blank">https://lore.kernel.org/ope=
nbmc/CAHwn2XknKWyv6Bsq48tkvA52rHKZRFoEJgUuZUmMj6uZb584JQ@mail.gmail.com/</a=
>=C2=A0(a bit outdated)</div><div><br></div><div>This will be a sub-thread =
about Storage/Drive resources and new properties that I want to add to bmcw=
eb.</div><div><br></div><div>Related thread:=C2=A0<a href=3D"https://lore.k=
ernel.org/openbmc/CAHwn2XnqABuyc3uMQDs+YgwYJL+yKLwCYn1myOVdZ=3Dgkhw3L-A@mai=
l.gmail.com/">device level logging service</a></div><div><br></div><div>I a=
m thinking of adding a number of support for Storage/Drive in bmcweb=C2=A0a=
nd just want some feedback from the community,</div><div><br></div><div>The=
 potential=C2=A0changes includes</div><div>- Multi-Storage Resource Support=
</div><div>- Drive Software</div><div>- New Drive Property Support</div><di=
v>=C2=A0 - State Conditions</div>=C2=A0- PhysicalLocation<br>=C2=A0- Reset =
Action=C2=A0<div><br><div><div>-----</div><div><br></div><div>Storage:</div=
><div><br></div><div>Adding support for multiple Storages instead of just h=
ardcoded to `1`. This allows us to represent one Storage per plugin and org=
anize the resources=C2=A0differently.=C2=A0</div><div><br></div><div>We cou=
ld potentially=C2=A0use `xyz.openbmc_project.Inventory.Item.StorageControll=
er` to create the storages and everything Drive under it will be linked.</d=
iv><div><br></div><div>----</div><div><br></div><div>Drive Software:</div><=
div><br></div><div>It will use SoftwareInventory and will just need to be a=
ble to add RelatedItem back to a Drive based on the D-bue Association inter=
face.</div><div><br></div><div>----</div><div><br></div><div>Drive Properti=
es:</div><div><br></div><div>=C2=A0- State Conditions:<br></div><div>Add lo=
g services related to the drive as discussed in=C2=A0<a href=3D"https://lor=
e.kernel.org/openbmc/CAHwn2XnqABuyc3uMQDs+YgwYJL+yKLwCYn1myOVdZ=3Dgkhw3L-A@=
mail.gmail.com/">device level logging</a>=C2=A0to add debug information.</d=
iv><div><br></div><div>-=C2=A0PhysicalLocation</div><div>Use `=C2=A0Invento=
ry.Decorator.LocationCode` directly</div><div><br></div><div>-=C2=A0 Reset =
Action=C2=A0</div><div>Add reset/powercycle=C2=A0support to Drive resource.=
 Based on=C2=A0<a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/phos=
phor-dbus-interfaces/+/43155">https://gerrit.openbmc-project.xyz/c/openbmc/=
phosphor-dbus-interfaces/+/43155</a>.</div><div><br></div><div>---</div><di=
v><br></div><div>Please let me know if there are any questions and suggesti=
ons on the proposed=C2=A0changes.</div><div><br></div><div>Best,</div><div>=
<br></div><div>Willy Tu</div><div><br></div><div><br></div><div><br></div><=
div><br></div><div><br></div></div></div></div>

--0000000000008c8f6105c34271e5--
