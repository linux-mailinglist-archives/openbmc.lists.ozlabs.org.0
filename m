Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E33B5572369
	for <lists+openbmc@lfdr.de>; Tue, 12 Jul 2022 20:49:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lj8tB5lrhz3c54
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 04:49:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Wa5lYrF0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=edtanous@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Wa5lYrF0;
	dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lj8sq1H6xz3c1l
	for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 04:48:45 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id l124so8223104pfl.8
        for <openbmc@lists.ozlabs.org>; Tue, 12 Jul 2022 11:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=JSBrOpzNBx35MzqKuAcvRzsJZ9fblEWCQQtnkhKkqTc=;
        b=Wa5lYrF0WaVPWi9Z/7ouVWIxQI+/EpR2aKT2m2vq0N4eNMytsXw8DdIf5DqjENKRBL
         jgeFhxlmhBhEaBiZYqnWoWx28/BB3X6WAslm4uBo9dcA0e2ELZhW3I4vnnoUEtwiCZVU
         m/GqwTThYfEd6qKYKmLKtM/FO1BckylqG4KXtloMpVHwzdrsf3mWUhEtX94uL5bCsUcN
         IQLVl+qlxxkREyDSfYpcXPSagQ3fNRnHbs2fehA+rreE8ypm8Bhe5S4trvC8q3ThIGJE
         gHftXJ6qswFsS4xR1isjGs7wqC9Bc91qXR4lHsERQeu+FBjh0wDPwcU6DKpgzHSxbjjr
         T0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=JSBrOpzNBx35MzqKuAcvRzsJZ9fblEWCQQtnkhKkqTc=;
        b=lz8kK5oSJbQlOCWOspXDswUSusQqwH29S+V2x4f073Jc5e4HmkzxL7YPJvhQ57gPh3
         asUxql0BxnIEsxAtdNhuIbUP9A/lzbTBSJuUxHyaKLOwG21h6rlA6wrocZSowBoHIFM8
         lOrH1IZL97nYQWK+ccG5GwDV/bbEwvyUtbBrgRinKnMKr9MQ0/2pvM2CGnrdtKFChDxE
         KrRy1cz/Kc6cuC3O7EJwMQYwalZ0YePSQXwTMivGNSF1f/AlDDsFL5vewPKOmJzRvwfA
         MMAJSnXvC+FYn6jI10r/0FdHcbl0ieGR09WUzCsAYVDB1Wx/HNXrU7r+13nYVkbnXR1b
         Hd1Q==
X-Gm-Message-State: AJIora9xFXaH3hMAb4vQfRTALHCxrnkEt7+iwuZClCCxbu0FgvuI3pFN
	4O7tPndrjv9ZV70u7A+DLePEOI6BHrWyIpBGs8viyilLW2cMjg==
X-Google-Smtp-Source: AGRyM1tNNtlkGfVm4uKTCgL1ZBBBaWgc7hdwxBwSslzRzotzMvpXTyKpvkWOQo3zg1Hf950m6RzDqEMcpHMby838ttI=
X-Received: by 2002:a63:e64f:0:b0:40d:e79f:8b73 with SMTP id
 p15-20020a63e64f000000b0040de79f8b73mr21451494pgj.243.1657651723445; Tue, 12
 Jul 2022 11:48:43 -0700 (PDT)
MIME-Version: 1.0
From: Ed Tanous <edtanous@google.com>
Date: Tue, 12 Jul 2022 11:48:31 -0700
Message-ID: <CAH2-KxBmFwVmF4cr+_eTFrwdz9-he--PPfRvW=cN6oNGf4KA_A@mail.gmail.com>
Subject: DBus ObjectManager Interface usages within the project
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000023c2e905e3a01e11"
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, Nan Zhou <nanzhou@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000023c2e905e3a01e11
Content-Type: text/plain; charset="UTF-8"

We've had a couple cases in the project where patches have needed to be
slowed down because of inconsistencies in our use of object manager, so
IMO, the time has come to make our usage of ObjectManager consistent,
documented, and drop support for the (not upstream) daemons that don't
follow the rules.  As part of this, we will port forward all the upstream
daemons to be consistent, and do our best to avoid bugs, but this email is
intended to inform those that have non-upstream daemons about the change so
they can resolve their implementations.

The basics:
ObjectManager DBus interface will now be required for any daemon
implementing a Sensor.Value interface or Inventory.Item interface.

Daemons producing sensors will be required to place their ObjectManager at
/xyz/openbmc_project/sensors
Daemons producing inventory items will be required to place their
ObjectManager at /xyz/openbmc_project/inventory.

Both of these interfaces will be required to be published before claiming a
well known name on dbus, to allow for the possibility of caching
implementations at some point in future.

Functionally, this gets a little complicated because the
sdbusplus::asio::object_manager bindings in their default invocation create
an ObjectManager at the root object /, so we need to execute this in a few
steps.

0. Send this email out, outlining the problem, and warn the community that
if this is an assumption you make in your downstream daemons, those
assumptions will need to change.  Get consensus from maintainers.
1. Update the phosphor-dbus-interfaces documentation for both Sensor.Value
and Inventory.Item to call out the required-ness of ObjectManager, and the
explicit dbus path where it's required to be placed.
2. Identify all the asio daemons that need changes, and publish changes
that move the object_manager to the appropriate path.  This is mostly going
to be a tree-wide grep for sdbusplus::asio::object_server, and look for
daemonst that don't make use of the add_manager() API.  Anyone directly
calling the Sensor or Invertory ObjectManager interfaces will need to port
to the new paths, but luckily, this isn't a very common operation, and I
beleive bmcweb and phosphor-ipmid-host might be the only direct users.  In
bmcweb, there is actually a convoluted piece of code that uses the mapper
to sort out the location that the ObjectManager exists at so Redfish
sensors should remain consistent, and we don't yet have code that relies on
ObjectManager for Inventory items.  I believe phosphor-ipmi-host has a
similar piece of code that should protect us in this case, but I defer to
those maintainers.

A starter list of daemons that need updating is:
All daemons in dbus-sensors
peci-pcie
entity-manager
libpeci
phosphor-u-boot-env-manager
pfr-manager
smbios-mdr
s2600-misc
dbus-sensors


4. Change the defaults of sdbusplus::asio::object_server to not init an
ObjectManager interface at the root path /.

5. Unwind the various complexities of searching for ObjectManager
interfaces, and rely on the assumptions above that should net us some
speedups in at least the sensors API, completely avoiding an extra mapper
call.

6. Get system owners to retest their platforms, with the tree changes in,
and fix any bugs we may have accidentally caused.

This was discussed pretty heavily on discord in the #development topic, and
some of the nitty gritty details on why this is needed is available there,
as well as I'm happy to discuss here.  This is one of those nasty
spaghetti-code things that we've lived with for a while;  Hopefully if we
can get this behind us, we can get some good real world performance
improvements.

Thoughts?

-Ed

--00000000000023c2e905e3a01e11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">We&#39;ve had a couple cases in the project where patches =
have needed to be slowed down because of inconsistencies in our use of obje=
ct manager, so IMO, the time has come to make our usage of ObjectManager co=
nsistent, documented, and drop support for the (not upstream) daemons that =
don&#39;t follow the rules.=C2=A0 As part of this, we will port forward all=
 the upstream daemons to be consistent, and do our best to avoid bugs, but =
this email is intended to inform those that have non-upstream daemons about=
 the change so they can resolve their implementations.<br><br>The basics:<b=
r>ObjectManager DBus interface will now be required for any daemon implemen=
ting a Sensor.Value interface or Inventory.Item interface.<br><br>Daemons p=
roducing sensors will be required to place their ObjectManager at /xyz/open=
bmc_project/sensors<br>Daemons producing inventory items will be required t=
o place their ObjectManager at /xyz/openbmc_project/inventory.<br><br>Both =
of these interfaces will be required to be published before claiming a well=
 known name on dbus, to allow for the possibility of caching implementation=
s at some point in future.<br><br>Functionally, this gets a little complica=
ted because the sdbusplus::asio::object_manager bindings in their default i=
nvocation create an ObjectManager at the root object /, so we need to execu=
te this in a few steps. <br><br>0. Send this email out, outlining the probl=
em, and warn the community that if this is an assumption you make in your d=
ownstream daemons, those assumptions will need to change.=C2=A0 Get consens=
us from maintainers.<br>1. Update the phosphor-dbus-interfaces documentatio=
n for both Sensor.Value and Inventory.Item to call out the required-ness of=
 ObjectManager, and the explicit dbus path where it&#39;s required to be pl=
aced.<br>2. Identify all the asio daemons that need changes, and publish ch=
anges that move the object_manager to the appropriate path.=C2=A0 This is m=
ostly going to be a tree-wide grep for sdbusplus::asio::object_server, and =
look for daemonst that don&#39;t make use of the add_manager() API.=C2=A0 A=
nyone directly calling the Sensor or Invertory ObjectManager interfaces wil=
l need to port to the new paths, but luckily, this isn&#39;t a very common =
operation, and I beleive bmcweb and phosphor-ipmid-host might be the only d=
irect users.=C2=A0 In bmcweb, there is actually a convoluted piece of code =
that uses the mapper to sort out the location that the ObjectManager exists=
 at so Redfish sensors should remain consistent, and we don&#39;t yet have =
code that relies on ObjectManager for Inventory items.=C2=A0 I believe phos=
phor-ipmi-host has a similar piece of code that should protect us in this c=
ase, but I defer to those maintainers.<br><br>A starter list of daemons tha=
t need updating is:<br>All daemons in dbus-sensors<br>peci-pcie<br>entity-m=
anager<br>libpeci<div>phosphor-u-boot-env-manager</div><div>pfr-manager</di=
v><div>smbios-mdr<br>s2600-misc<br>dbus-sensors</div><div><br><br>4. Change=
 the defaults of sdbusplus::asio::object_server to not init an ObjectManage=
r interface at the root path /.<br><br>5. Unwind the various complexities o=
f searching for ObjectManager interfaces, and rely on the assumptions above=
 that should net us some speedups in at least the sensors API, completely a=
voiding an extra mapper call.<br><br>6. Get system owners to retest their p=
latforms, with the tree changes in, and fix any bugs we may have accidental=
ly caused.<br><br>This was discussed pretty heavily on discord in the #deve=
lopment topic, and some of the nitty gritty details on why this is needed i=
s available there, as well as I&#39;m happy to discuss here.=C2=A0 This is =
one of those nasty spaghetti-code things that we&#39;ve lived with for a wh=
ile; =C2=A0Hopefully if we can get this behind us, we can get some good rea=
l world performance improvements.<br></div><div><br></div><div>Thoughts?</d=
iv><div><br></div><div>-Ed</div></div>

--00000000000023c2e905e3a01e11--
