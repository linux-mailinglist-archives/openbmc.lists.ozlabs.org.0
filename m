Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAD41C3DA5
	for <lists+openbmc@lfdr.de>; Mon,  4 May 2020 16:55:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49G5W413D1zDqXg
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 00:55:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e32;
 helo=mail-vs1-xe32.google.com; envelope-from=sunithaharish04@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iM3/h3AN; dkim-atps=neutral
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49G5SD3JZtzDqSB
 for <openbmc@lists.ozlabs.org>; Tue,  5 May 2020 00:52:35 +1000 (AEST)
Received: by mail-vs1-xe32.google.com with SMTP id y185so11278183vsy.8
 for <openbmc@lists.ozlabs.org>; Mon, 04 May 2020 07:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Si4u1G8Df82Ju84ZlEbt+nLi7dOzt/JTTkj2OZma3co=;
 b=iM3/h3ANn6u7/z1H6IWdiyCVOeib5HWnf/aVoxNjUkfoFMC1e4+W0cKMu9ZFUoyyB1
 FC8VT2OAnx5P15ERWaF4EqUYnQp8kD5VK4HOJMGIZURtu1k2IEn8ygePl/z291xffrdB
 GP9f5HtYzraJ1uyy0MWSCvRahA9TenrDBSHlGsP1u5TCUsxE8sM2pkqrijJRa6TFeRrd
 TVbPoSM6DpClNlAqdeNUsGTwZ2qsaX+N3J/toFO2j2O5c+bmBtxM0o8+AJxW2G0AYsuV
 59g6yJRmIUyDXxvPqqK8U2BJYIETf/ZjVBIe0EYamG02xDMPJNZ1oSUHBvZ5lbDPXJNx
 axEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Si4u1G8Df82Ju84ZlEbt+nLi7dOzt/JTTkj2OZma3co=;
 b=jXnKRNSzfOfBT8AJB3M2r0AVTduWoM+LVZypSpkCyPG1N8pkzZFJMRbt18/w5lv6ks
 vJ9OXFAsqlJdP8fKbv8rpBOShg9MOFup0/ejkecTa6+OBxMzcrO697Ftvmho837k97R4
 jkiNmSIq16MzKKv28fshrG969Jxiu7j+xhmyqCjOhI2fDaeH/CQk0xe0Lyq8kp8WnW9A
 KZsKqkT8larmQqhk3lgFTgSUeKtIEHXXOv8r3K96+UB19MYcapbixaeazMuaKoPS1VnF
 CA1U7YSuWurECWLYMlXJqnM11We2Dv+fkEqmlLg84gQ8snidBfKKYxurU7vGkQ+ojEjs
 Y3PA==
X-Gm-Message-State: AGi0Pubz0pqg/KKNR0XSUacLPxpx0Lv/ihxlt0sje1UgoES+logu1RbM
 BkUf0GmduR1MS5ILjyp36IxqFT2u+LHrqy9dlPo=
X-Google-Smtp-Source: APiQypKT1pepry6rTBTf7FcJiTHRjdklf4keZVHKLnu4D9Luja9SeZy1XZptaJ+GA/6eMckcs9VFWh8pNK8+0W+dH7E=
X-Received: by 2002:a67:407:: with SMTP id 7mr11080579vse.95.1588603950834;
 Mon, 04 May 2020 07:52:30 -0700 (PDT)
MIME-Version: 1.0
From: Sunitha Harish <sunithaharish04@gmail.com>
Date: Mon, 4 May 2020 20:22:18 +0530
Message-ID: <CADeuMvXQfS01sdwpiM+POkaqdVesj64XGDqPWAPreo_TPbuV8A@mail.gmail.com>
Subject: Storing host data on the BMC
To: patrick@stwcx.xyz, dkodihal@in.ibm.com, suryakanth.sekar@linux.intel.com, 
 openbmc <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000002da98c05a4d3ae69"
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

--0000000000002da98c05a4d3ae69
Content-Type: text/plain; charset="UTF-8"

Hi,

We have some user defined host settings which we are presently keeping it
in phosphor-settings-manager and the associated pldm bios attributes are
there in the pldm BIOS table. Few properties in the object hosted by the
phosphor-settings-manager are read-only for out of band but through in-band
it can be changed.

For example; the IP origin (static/dhcp) in the below commit.
https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-ibm/+/30205/

UseCase: The redfish client will set the hypervisor IP address via bmcweb.
This will be taken to the hypervisor via pldm. Once the system is powered
on, the hypervisor will apply the IP address to its Ethernet Interface.
Properties like IPAddress, SubnetMask, Gateway are having one to one
mapping in the PLDM BIOS attr table and Dbus object properties, Now concern
here is on the Origin property which PLDM reads as sensor from Hypervisor.

We have two views on this scenario.
View 1: These are not suitable to be stored in the existing
phopsphor-settings-manager since these are not the writable out-of-band
user settings.
View 2: These sensors can be part of this settings table, can be considered
as a read-only attribute for the out-of-band access. These can be writable
to the host.

I understand that there are some efforts going on by Intel to come up with
internal Bios settings table but this problem is agnostic to whether we
keep the data in settings Dbus object or in the new app which is array of
key-value pairs.

Below are the two solutions which i can think of:
-------------------------------------------------------------
1. Let there be an attribute in the existing BIOS attribute table (Settings
Storage), which will be settable from the hypervisor through PLDM, however
pldm reads it as a sensor.This setting will be read-only for the
out-of-band clients(redfish). This approach is something similar to the
redfish schema, where we implement the writable & read-only attributes in
the same schema/resource. Redfish also has the origin as a settings but
they made it as a read-only attribute. This helps in bringing the related
attributes together under same object.

2. Let create a new table/object for mapping of pldm sensors ; the Sensors
Storage table which will contain only those attributes which are mapped to
the pldm sensors. This sensor table can be set by the pldm, and other
interested components can read this to get the required attribute values.
If we do this, then openBMC would be having two tables 1) Settings Storage
for Bios settings 2) Sensors Storage for pldm sensors. It is kind of
bringing the pldm complexities to the external application. Also
complexities involved in bringing the related attributes together from two
different tables.

Please let me know your views on these.  What could be the better long term
solution for this?
It would be great if you can propose any other way of handling this.

Thanks & regards,
Sunitha

--0000000000002da98c05a4d3ae69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<br><br>We have some user defined host=
 settings which we are presently keeping it in phosphor-settings-manager an=
d the associated pldm bios attributes are there in the pldm BIOS table. Few=
 properties in the object hosted by the phosphor-settings-manager are read-=
only for out of band but through in-band it can be changed.<br><br>For exam=
ple; the IP origin (static/dhcp) in the below commit.<br>	<a href=3D"https:=
//gerrit.openbmc-project.xyz/#/c/openbmc/meta-ibm/+/30205/">https://gerrit.=
openbmc-project.xyz/#/c/openbmc/meta-ibm/+/30205/</a><br><br>UseCase: The r=
edfish client will set the hypervisor IP address via bmcweb. This will be t=
aken to the hypervisor via pldm. Once the system is powered on, the hypervi=
sor will apply the IP address to its Ethernet Interface. Properties like IP=
Address, SubnetMask, Gateway are having one to one mapping in the PLDM BIOS=
 attr table and Dbus object properties, Now concern here is on the Origin p=
roperty which PLDM reads as sensor from Hypervisor.<br><br>We have two view=
s on this scenario.<br>View 1: These are not suitable to be stored in the e=
xisting phopsphor-settings-manager since these are not the writable out-of-=
band user settings. <br>View 2: These sensors can be part of this settings =
table, can be considered as a read-only attribute for the out-of-band acces=
s. These can be writable to the host. <br><br>I understand that there are s=
ome efforts going on by Intel to come up with internal Bios settings table =
but this problem is agnostic to whether we keep the data in settings Dbus o=
bject or in the new app which is array of key-value pairs.<br><br>Below are=
 the two solutions which i can think of:<br>-------------------------------=
------------------------------<br>1. Let there be an attribute in the exist=
ing BIOS attribute table (Settings Storage), which will be settable from th=
e hypervisor through PLDM, however pldm reads it as a sensor.This setting w=
ill be read-only for the out-of-band clients(redfish). This approach is som=
ething similar to the redfish schema, where we implement the writable &amp;=
 read-only attributes in the same schema/resource. Redfish also has the ori=
gin as a settings but they made it as a read-only attribute. This helps in =
bringing the related attributes together under same object.<br><br>2. Let c=
reate a new table/object for mapping of pldm sensors ; the Sensors Storage =
table which will contain only those attributes which are mapped to the pldm=
 sensors. This sensor table can be set by the pldm, and other interested co=
mponents can read this to get the required attribute values. If we do this,=
 then openBMC would be having two tables 1) Settings Storage for Bios setti=
ngs 2) Sensors Storage for pldm sensors. It is kind of bringing the pldm co=
mplexities to the external application. Also complexities involved in bring=
ing the related attributes together from two different tables.<br><br>Pleas=
e let me know your views on these.=C2=A0 What could be the better long term=
 solution for this? =C2=A0<br>It would be great if you can propose any othe=
r way of handling this.<br><br>Thanks &amp; regards,<br>Sunitha</div><div d=
ir=3D"ltr"><br></div></div>

--0000000000002da98c05a4d3ae69--
