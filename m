Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4839F5726E6
	for <lists+openbmc@lfdr.de>; Tue, 12 Jul 2022 22:03:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjBWq1fqWz3c3r
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 06:03:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=XZMJ9oIj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=nanzhou@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=XZMJ9oIj;
	dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LjBWN4grRz2ywl
	for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 06:02:55 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id bp15so5973052ejb.6
        for <openbmc@lists.ozlabs.org>; Tue, 12 Jul 2022 13:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DU+26FSLmDqHR/sfLwWXX29iCddQe7+OLlaEo3tQTFI=;
        b=XZMJ9oIjY9DQdzJfVI7rnUpo3Xbjcf0EvwrtKs0sPzowbdzBrkob9/HJ6fAfQWfcFS
         qBMjmlmMqOHSntPGaSYkYVFx8FkYy76lbzTBfo2EaLfI8hy8AgXDcdAuX06N2SQBpD7g
         cgU7f1huD97TykHNUO0M/7rf9m35BG7LpfT5JxSTgRiQqz0WH8gI9PkDklZmqqYtO2cH
         BvNA68jr7bjgtEtz9zRJouAxgn4Ecd5R4BaxSCF8nNMGML8dXtd/hoqIlLiyCOQbU+1n
         UnT1UnxOtEz8f+NCxHAZFKNcPCuIFefD8ycwhverPg0QzFvsOVJF2F/92Z+xyfkgBXgx
         XMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DU+26FSLmDqHR/sfLwWXX29iCddQe7+OLlaEo3tQTFI=;
        b=YKk3aSDYyfl3/csuE94rxHCLsA5B3XRZk167m7XpE7a4ruVHahJUJSeDzrHYZOvNw0
         uE93x7JVmcsBlWwamk06mWODBP/RaFjUslq8YMbsuhW65I5d6YryVsFk1QNcjuSYZ2R5
         Gzy/F5EAE/mhSY/UhlciW4a/cJVXa8zwGUsvbZZHNp9E6YMKkiDxc9i4rzMx1AjbFF1K
         QrcKIH5JdtgjXEl9w2T0GfGnJDIDnTwezVhpJjKG1nMydspDP5lhP7kI6jpkzVfd3Ddp
         4eyCpuJU0DozO72ccPUzAHQd1vX3ETyeEGclgxsKUJzXrCIGPhluNa9oWA33J2WZdsRN
         dI3Q==
X-Gm-Message-State: AJIora8ZBiThAvvT6FsPmAdgHJyzDKDGv5O/CyzMJp9/Z5imFIhkYQ+V
	FHcFZyTJ1wWJ70Cl7kB/d7Uc+L4oTuCEvkBv9t8n7g==
X-Google-Smtp-Source: AGRyM1sntZ4kDE5k+4IKJ+mtmmR53/tF5Bysw7YbmFuPBoneLAtu5G9l+lpnmXhOUANCROCQoWbvWI7M7LDY59aTlws=
X-Received: by 2002:a17:907:60cc:b0:72b:40a8:a5b with SMTP id
 hv12-20020a17090760cc00b0072b40a80a5bmr17182244ejc.379.1657656168985; Tue, 12
 Jul 2022 13:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2-KxBmFwVmF4cr+_eTFrwdz9-he--PPfRvW=cN6oNGf4KA_A@mail.gmail.com>
In-Reply-To: <CAH2-KxBmFwVmF4cr+_eTFrwdz9-he--PPfRvW=cN6oNGf4KA_A@mail.gmail.com>
From: Nan Zhou <nanzhou@google.com>
Date: Tue, 12 Jul 2022 13:02:37 -0700
Message-ID: <CAOLfGj6DWfmhxzSQx9PaU1awppsExrgJodFu8JrSgkbQZbnStA@mail.gmail.com>
Subject: Re: DBus ObjectManager Interface usages within the project
To: Ed Tanous <edtanous@google.com>
Content-Type: multipart/alternative; boundary="0000000000001d24c605e3a127d0"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000001d24c605e3a127d0
Content-Type: text/plain; charset="UTF-8"

Thanks Ed for bringing this up and writing a great summary.

I can provide some background information about how this was brought up and
how requiring ObjectManager (OM) can improve performance.

On Google hardware with more than 200 sensors, we found that fetching a
single sensor in the Redfish route is extremely slow (~0.6 seconds). On
the other hand ipmi sdr list gives a fair performance (returns all sensors
in seconds). We then root caused it and found that the BMCWeb sensor code
is inefficient. We introduced the query parameter into BMCWeb, and
submitted https://gerrit.openbmc.org/c/openbmc/bmcweb/+/52418 which
integrates OM's GetManagedObjects
<https://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-objectmanager>
with Redfish Expand
<https://redfish.dmtf.org/schemas/DSP0266_1.15.0.html#the-expand-query-parameter>
query parameters. With it, we got 40+ times speed up when enumerating 200+
sensors.

```
Before this change,
time wget -qO-
'http://localhost/redfish/v1/Chassis/xxx/Sensors?$expand=.($levels=1)'
> /tmp/log_slow.json

real 0m33.786s
user 0m0.000s
sys 0m0.000s

After this change
time wget -qO-
'http://localhost/redfish/v1/Chassis/xxx/Sensors?$expand=.($levels=1)'
> /tmp/log_fast.json

real 0m0.769s
user 0m0.010s
sys 0m0.010s
```

We found the same pattern (use OM for bulk query) can be applied to most
inventory resources (Processors, DIMMS, etc), where similar performance
improvements can be achieved.

Ed brought up this issue that OM is optional as of today in inventories and
sensors during the code review of
https://gerrit.openbmc.org/c/openbmc/bmcweb/+/53824. The path of the OM is
also inconsistent.

Please let us know what you think.

Best
Nan

On Tue, Jul 12, 2022 at 11:48 AM Ed Tanous <edtanous@google.com> wrote:

> We've had a couple cases in the project where patches have needed to be
> slowed down because of inconsistencies in our use of object manager, so
> IMO, the time has come to make our usage of ObjectManager consistent,
> documented, and drop support for the (not upstream) daemons that don't
> follow the rules.  As part of this, we will port forward all the upstream
> daemons to be consistent, and do our best to avoid bugs, but this email is
> intended to inform those that have non-upstream daemons about the change so
> they can resolve their implementations.
>
> The basics:
> ObjectManager DBus interface will now be required for any daemon
> implementing a Sensor.Value interface or Inventory.Item interface.
>
> Daemons producing sensors will be required to place their ObjectManager at
> /xyz/openbmc_project/sensors
> Daemons producing inventory items will be required to place their
> ObjectManager at /xyz/openbmc_project/inventory.
>
> Both of these interfaces will be required to be published before claiming
> a well known name on dbus, to allow for the possibility of caching
> implementations at some point in future.
>
> Functionally, this gets a little complicated because the
> sdbusplus::asio::object_manager bindings in their default invocation create
> an ObjectManager at the root object /, so we need to execute this in a few
> steps.
>
> 0. Send this email out, outlining the problem, and warn the community that
> if this is an assumption you make in your downstream daemons, those
> assumptions will need to change.  Get consensus from maintainers.
> 1. Update the phosphor-dbus-interfaces documentation for both Sensor.Value
> and Inventory.Item to call out the required-ness of ObjectManager, and the
> explicit dbus path where it's required to be placed.
> 2. Identify all the asio daemons that need changes, and publish changes
> that move the object_manager to the appropriate path.  This is mostly going
> to be a tree-wide grep for sdbusplus::asio::object_server, and look for
> daemonst that don't make use of the add_manager() API.  Anyone directly
> calling the Sensor or Invertory ObjectManager interfaces will need to port
> to the new paths, but luckily, this isn't a very common operation, and I
> beleive bmcweb and phosphor-ipmid-host might be the only direct users.  In
> bmcweb, there is actually a convoluted piece of code that uses the mapper
> to sort out the location that the ObjectManager exists at so Redfish
> sensors should remain consistent, and we don't yet have code that relies on
> ObjectManager for Inventory items.  I believe phosphor-ipmi-host has a
> similar piece of code that should protect us in this case, but I defer to
> those maintainers.
>
> A starter list of daemons that need updating is:
> All daemons in dbus-sensors
> peci-pcie
> entity-manager
> libpeci
> phosphor-u-boot-env-manager
> pfr-manager
> smbios-mdr
> s2600-misc
> dbus-sensors
>
>
> 4. Change the defaults of sdbusplus::asio::object_server to not init an
> ObjectManager interface at the root path /.
>
> 5. Unwind the various complexities of searching for ObjectManager
> interfaces, and rely on the assumptions above that should net us some
> speedups in at least the sensors API, completely avoiding an extra mapper
> call.
>
> 6. Get system owners to retest their platforms, with the tree changes in,
> and fix any bugs we may have accidentally caused.
>
> This was discussed pretty heavily on discord in the #development topic,
> and some of the nitty gritty details on why this is needed is available
> there, as well as I'm happy to discuss here.  This is one of those nasty
> spaghetti-code things that we've lived with for a while;  Hopefully if we
> can get this behind us, we can get some good real world performance
> improvements.
>
> Thoughts?
>
> -Ed
>

--0000000000001d24c605e3a127d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Ed for bringing this up and writing a great summary=
.<div><br></div><div>I can provide some background information about how th=
is was brought up and how requiring ObjectManager (OM) can improve performa=
nce.</div><div><br></div><div>On Google hardware with more than 200 sensors=
, we found that fetching a single sensor in the Redfish route is extremely =
slow (~0.6 seconds). On the=C2=A0other hand ipmi sdr list gives a fair perf=
ormance=C2=A0(returns all sensors in seconds). We then root caused it and f=
ound that the BMCWeb sensor code is inefficient. We introduced the query pa=
rameter into BMCWeb, and submitted=C2=A0<a href=3D"https://gerrit.openbmc.o=
rg/c/openbmc/bmcweb/+/52418">https://gerrit.openbmc.org/c/openbmc/bmcweb/+/=
52418</a>=C2=A0which integrates OM&#39;s <a href=3D"https://dbus.freedeskto=
p.org/doc/dbus-specification.html#standard-interfaces-objectmanager">GetMan=
agedObjects</a> with <a href=3D"https://redfish.dmtf.org/schemas/DSP0266_1.=
15.0.html#the-expand-query-parameter">Redfish Expand</a> query parameters. =
With it, we got 40+ times speed up=C2=A0when=C2=A0enumerating 200+ sensors.=
</div><div><br></div><div>```</div><div>Before this change,<br>time wget -q=
O-<br>&#39;<a href=3D"http://localhost/redfish/v1/Chassis/xxx/Sensors?$expa=
nd=3D.($levels=3D1)">http://localhost/redfish/v1/Chassis/xxx/Sensors?$expan=
d=3D.($levels=3D1)</a>&#39;<br>&gt; /tmp/log_slow.json<br><br>real	0m33.786=
s<br>user	0m0.000s<br>sys	0m0.000s<br><br>After this change<br>time wget -q=
O-<br>&#39;<a href=3D"http://localhost/redfish/v1/Chassis/xxx/Sensors?$expa=
nd=3D.($levels=3D1)">http://localhost/redfish/v1/Chassis/xxx/Sensors?$expan=
d=3D.($levels=3D1)</a>&#39;<br>&gt; /tmp/log_fast.json<br><br>real	0m0.769s=
<br>user	0m0.010s<br>sys	0m0.010s<br></div><div>```</div><div><br></div><di=
v>We found the same pattern (use OM for bulk query) can be applied to most =
inventory resources (Processors, DIMMS, etc), where similar performance imp=
rovements can be achieved.</div><div><br></div><div>Ed brought up this issu=
e that OM is optional as of today in inventories and sensors during the cod=
e review of <a href=3D"https://gerrit.openbmc.org/c/openbmc/bmcweb/+/53824"=
>https://gerrit.openbmc.org/c/openbmc/bmcweb/+/53824</a>. The path of the O=
M is also inconsistent.</div><div><br></div><div>Please let us know what yo=
u think.</div><div><br></div><div>Best</div><div>Nan</div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 12, 2=
022 at 11:48 AM Ed Tanous &lt;<a href=3D"mailto:edtanous@google.com">edtano=
us@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr">We&#39;ve had a couple cases in the project w=
here patches have needed to be slowed down because of inconsistencies in ou=
r use of object manager, so IMO, the time has come to make our usage of Obj=
ectManager consistent, documented, and drop support for the (not upstream) =
daemons that don&#39;t follow the rules.=C2=A0 As part of this, we will por=
t forward all the upstream daemons to be consistent, and do our best to avo=
id bugs, but this email is intended to inform those that have non-upstream =
daemons about the change so they can resolve their implementations.<br><br>=
The basics:<br>ObjectManager DBus interface will now be required for any da=
emon implementing a Sensor.Value interface or Inventory.Item interface.<br>=
<br>Daemons producing sensors will be required to place their ObjectManager=
 at /xyz/openbmc_project/sensors<br>Daemons producing inventory items will =
be required to place their ObjectManager at /xyz/openbmc_project/inventory.=
<br><br>Both of these interfaces will be required to be published before cl=
aiming a well known name on dbus, to allow for the possibility of caching i=
mplementations at some point in future.<br><br>Functionally, this gets a li=
ttle complicated because the sdbusplus::asio::object_manager bindings in th=
eir default invocation create an ObjectManager at the root object /, so we =
need to execute this in a few steps. <br><br>0. Send this email out, outlin=
ing the problem, and warn the community that if this is an assumption you m=
ake in your downstream daemons, those assumptions will need to change.=C2=
=A0 Get consensus from maintainers.<br>1. Update the phosphor-dbus-interfac=
es documentation for both Sensor.Value and Inventory.Item to call out the r=
equired-ness of ObjectManager, and the explicit dbus path where it&#39;s re=
quired to be placed.<br>2. Identify all the asio daemons that need changes,=
 and publish changes that move the object_manager to the appropriate path.=
=C2=A0 This is mostly going to be a tree-wide grep for sdbusplus::asio::obj=
ect_server, and look for daemonst that don&#39;t make use of the add_manage=
r() API.=C2=A0 Anyone directly calling the Sensor or Invertory ObjectManage=
r interfaces will need to port to the new paths, but luckily, this isn&#39;=
t a very common operation, and I beleive bmcweb and phosphor-ipmid-host mig=
ht be the only direct users.=C2=A0 In bmcweb, there is actually a convolute=
d piece of code that uses the mapper to sort out the location that the Obje=
ctManager exists at so Redfish sensors should remain consistent, and we don=
&#39;t yet have code that relies on ObjectManager for Inventory items.=C2=
=A0 I believe phosphor-ipmi-host has a similar piece of code that should pr=
otect us in this case, but I defer to those maintainers.<br><br>A starter l=
ist of daemons that need updating is:<br>All daemons in dbus-sensors<br>pec=
i-pcie<br>entity-manager<br>libpeci<div>phosphor-u-boot-env-manager</div><d=
iv>pfr-manager</div><div>smbios-mdr<br>s2600-misc<br>dbus-sensors</div><div=
><br><br>4. Change the defaults of sdbusplus::asio::object_server to not in=
it an ObjectManager interface at the root path /.<br><br>5. Unwind the vari=
ous complexities of searching for ObjectManager interfaces, and rely on the=
 assumptions above that should net us some speedups in at least the sensors=
 API, completely avoiding an extra mapper call.<br><br>6. Get system owners=
 to retest their platforms, with the tree changes in, and fix any bugs we m=
ay have accidentally caused.<br><br>This was discussed pretty heavily on di=
scord in the #development topic, and some of the nitty gritty details on wh=
y this is needed is available there, as well as I&#39;m happy to discuss he=
re.=C2=A0 This is one of those nasty spaghetti-code things that we&#39;ve l=
ived with for a while; =C2=A0Hopefully if we can get this behind us, we can=
 get some good real world performance improvements.<br></div><div><br></div=
><div>Thoughts?</div><div><br></div><div>-Ed</div></div>
</blockquote></div>

--0000000000001d24c605e3a127d0--
