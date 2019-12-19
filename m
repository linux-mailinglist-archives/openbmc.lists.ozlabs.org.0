Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D28F2125D5F
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2019 10:13:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dmQY24pVzDqpd
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2019 20:13:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32a;
 helo=mail-ot1-x32a.google.com; envelope-from=akashgj91@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="B2IQRawj"; 
 dkim-atps=neutral
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dmPx3DqwzDqFZ
 for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2019 20:13:25 +1100 (AEDT)
Received: by mail-ot1-x32a.google.com with SMTP id 59so6365900otp.12
 for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2019 01:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=7cLZis7/GrobjwNIfv8XIoXbwMDIdLR6+N/irMSHd5I=;
 b=B2IQRawjnciDKUC1/kYSySCB5Ysr8cvKb3w56juFMF1eQO0hnknsXRjvi4+r+h6BBg
 1+AqD7mshXCUzG1rgBPT6iqFl3gIJXt8GftEO5neq2FzuLETj+mPrE7Vh/uFbZ1Tl8yO
 971FeHgz/l8dL3q0yR8x1dOCIKtdVMl6ndEfYjCMfdr2abuIDhnXa6UU2eX1Vq7U3ZFB
 Chr20aVeLYyzy1U3ssijRrPQWfzFz3oGg0HfLuZqy2BL37iiYZumTTOT1uOwM/3Bk3cT
 TEpbewBvdmZuKy8eX5TNbJ5XZByoLvD6fKT27DN26EcSXAk03cS46v+i1UMWSCtB56rw
 SlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=7cLZis7/GrobjwNIfv8XIoXbwMDIdLR6+N/irMSHd5I=;
 b=JUvu3tEXamq9wE7fQafMiQHwTi/+Y0y2k3rdDm3BpN0ap2qmq8LoJDtUHsY7djYs12
 EoIhHW1edp1m2FrbdSJFjcxvE3gDORhcHqNCMhyQaDI2JT6lJV3vmfrZcda5htjK2D6R
 UuODyRCP2RbQOcUbh9aPsoz48jqax1BpbnzaE0Yawc3rqJQqFhJBuMsMrbGZk57Qt/ZR
 TZA5OVrhqIkY9GMNNFq+j4XHV5iwxlPg6eUnUldJNSqM71cVmOQTmaxDNg2zd0cOvglO
 DvEJp9TouAHnuOSrytQmrn+/BSbF+gcFniLZDuIl7xNmvFZxlYyVk86ScaG/5BuIaqeq
 8Tcg==
X-Gm-Message-State: APjAAAV5Ek11n160TFquHbflfEycYoJmYSy+gZfIf/pzuowhLVc3El8E
 fiEhg8v2kLMwEyn6M565OFgys7q9ee7Kp5x/vueeQ9uW4xw=
X-Google-Smtp-Source: APXvYqxjT3An6FZ9bNdwcfOAs6BbxSsy0w22eouN3RBWBwxad6SQYIJOxop7GD6oczMCnuTm23DhwupHwcr+/XzIeg0=
X-Received: by 2002:a05:6830:1c8a:: with SMTP id
 v10mr7438921otf.115.1576746801819; 
 Thu, 19 Dec 2019 01:13:21 -0800 (PST)
MIME-Version: 1.0
From: AKASH G J <akashgj91@gmail.com>
Date: Thu, 19 Dec 2019 14:42:06 +0530
Message-ID: <CAE33tLFu8BVN0s0sf3AT9e9dkBEqhZ2xqMSotpCMwbO0Jia-iA@mail.gmail.com>
Subject: Exposing sensors to IPMI over dbus
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000005f56d059a0af95d"
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

--00000000000005f56d059a0af95d
Content-Type: text/plain; charset="UTF-8"

Hi all,
I am using OpenBMC firmware for server board having Aspeed AST-2500.

Followed
https://github.com/openbmc/entity-manager/blob/master/docs/my_first_sensors.md
for populating sensor value to dbus. Entity manager configuration file is
given below.
{
    "Exposes": [
        {
            "Address": "0x4f",
            "Bus": 5,
            "Name": "cpu0_vrd_temp",
            "Thresholds": [
                {
                    "Direction": "greater than",
                    "Name": "upper critical",
                    "Severity": 1,
                    "Value": 80
                }
            ],
            "Type": "TMP75"
        }
    ],
    "Name": "Rudra Baseboard",
    "Probe": "xyz.openbmc_project.FruDevice({'PRODUCT_PRODUCT_NAME':
'RUDRA'})",
    "Type": "Board",
    "xyz.openbmc_project.Inventory.Decorator.Asset": {
        "Manufacturer": "$BOARD_MANUFACTURER",
        "Model": "$BOARD_PRODUCT_NAME",
        "PartNumber": "$BOARD_PART_NUMBER",
        "SerialNumber": "$BOARD_SERIAL_NUMBER"
    }
}

Wrote sample FRU information on eeprom with the following content. Used dd
command for writing to eeprom.

root@s2600wf:/sys/bus/i2c/devices/3-0056# cat eeprom
Product:
  MANUFACTURER  "ABC"
  PART_NUMBER   "12345"
  PRODUCT_NAME  "SAMPLENAME"
  SERIAL_NUMBER "12312490840"

The dbus tree not showing /xyz/openbmc_project/FruDevice/SAMPLENAME

root@s2600wf:~# busctl tree --no-pager xyz.openbmc_project.FruDevice
`-/xyz
  `-/xyz/openbmc_project
    `-/xyz/openbmc_project/FruDevice

In journalctl log the following messages are printed.

systemd[1]: Started Hwmon Temp Sensor.
hwmontempsensor[120]: Error communicating to entity manager
hwmontempsensor[120]: error communicating to entity manager

Look like FruDevice daemon is not parsing the contents of eeprom and
publish them to dbus.

Is there any thing missing in configuration? Please help to resolve the
problem.



Thanks,

Akash

--00000000000005f56d059a0af95d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div>I am using OpenBMC firmware for ser=
ver board having Aspeed AST-2500.</div><div><br></div><div>Followed <a href=
=3D"https://github.com/openbmc/entity-manager/blob/master/docs/my_first_sen=
sors.md">https://github.com/openbmc/entity-manager/blob/master/docs/my_firs=
t_sensors.md</a> for populating sensor value to dbus. Entity manager config=
uration file is given below. <br>{<br>=C2=A0 =C2=A0 &quot;Exposes&quot;: [<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;Address&quot;: &quot;0x4f&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;Bus&quot;: 5,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;Name&quot;: &quot;cpu0_vrd_temp&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &quot;Thresholds&quot;: [<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Direction&quot;: &quot;greater than&q=
uot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;Name&quot;: &quot;upper critical&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Severity&quot;: 1,<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;Value&quot;: 80<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Type&quot;: &quot;TMP75&quot;<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 ],<br>=C2=A0 =C2=A0 &quot;Name&quot;: =
&quot;Rudra Baseboard&quot;,<br>=C2=A0 =C2=A0 &quot;Probe&quot;: &quot;xyz.=
openbmc_project.FruDevice({&#39;PRODUCT_PRODUCT_NAME&#39;: &#39;RUDRA&#39;}=
)&quot;,<br>=C2=A0 =C2=A0 &quot;Type&quot;: &quot;Board&quot;,<br>=C2=A0 =
=C2=A0 &quot;xyz.openbmc_project.Inventory.Decorator.Asset&quot;: {<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Manufacturer&quot;: &quot;$BOARD_MANUFACTURE=
R&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Model&quot;: &quot;$BOARD_PRO=
DUCT_NAME&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;PartNumber&quot;: &qu=
ot;$BOARD_PART_NUMBER&quot;,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;SerialNum=
ber&quot;: &quot;$BOARD_SERIAL_NUMBER&quot;<br>=C2=A0 =C2=A0 }<br>}<br><br>=
Wrote sample FRU information on eeprom with the following content. Used dd =
command for writing to eeprom.<br><br>root@s2600wf:/sys/bus/i2c/devices/3-0=
056# cat eeprom <br>Product:<br>=C2=A0 MANUFACTURER =C2=A0&quot;ABC&quot;<b=
r>=C2=A0 PART_NUMBER =C2=A0 &quot;12345&quot;<br>=C2=A0 PRODUCT_NAME =C2=A0=
&quot;SAMPLENAME&quot;<br>=C2=A0 SERIAL_NUMBER &quot;12312490840&quot;<br><=
br>The dbus tree not showing /xyz/openbmc_project/FruDevice/SAMPLENAME<br><=
br>root@s2600wf:~# busctl tree --no-pager xyz.openbmc_project.FruDevice<br>=
`-/xyz<br>=C2=A0 `-/xyz/openbmc_project<br>=C2=A0 =C2=A0 `-/xyz/openbmc_pro=
ject/FruDevice<br><br>In journalctl log the following messages are printed.=
<br><br>systemd[1]: Started Hwmon Temp Sensor.<br>hwmontempsensor[120]: Err=
or communicating to entity manager<br>hwmontempsensor[120]: error communica=
ting to entity manager<br><br>Look like FruDevice daemon is not parsing the=
 contents of eeprom and publish them to dbus.<br><br>Is there any thing mis=
sing in configuration? Please help to resolve the problem.</div><div><br></=
div><div><br></div><div><br></div><div>Thanks,</div><div><br></div><div>Aka=
sh<br></div><div><br></div></div>

--00000000000005f56d059a0af95d--
