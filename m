Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C65461B147
	for <lists+openbmc@lfdr.de>; Mon, 13 May 2019 09:40:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452Xlp5485zDqG0
	for <lists+openbmc@lfdr.de>; Mon, 13 May 2019 17:40:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com;
 envelope-from=chou.brad@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qrzW5jW+"; 
 dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452Xkk1wBlzDqDS
 for <openbmc@lists.ozlabs.org>; Mon, 13 May 2019 17:39:09 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id u17so6722629pfn.7
 for <openbmc@lists.ozlabs.org>; Mon, 13 May 2019 00:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:mime-version:subject:message-id:date:to;
 bh=dZZyQAHpjbfl1BHs9K+N8ACmyssNyXjOyMdPeMpwrX8=;
 b=qrzW5jW+QUtSYhwVtKSAFqif/WoKdTxjHSf3Ws0+JXoWboN7bcOvMa5xaAT39CzAI2
 apFSDt3HZYVIm9euNCrxREhcQ+n7ZZeDj9dXBCYEm7N//ebWSm/XKp5QZkf08C/jyei6
 4216xhyi1bhJC/vm+CT03alXMndvNVt6AgqOOBOfyKFGzb9STQJkmQWUX7d/Ad9pCPSF
 rQRp+pM5jOzrt8ihEapoJlWXWCjWSo/ftUWW9jD3fUY2A5l3kWHRBJSTjAYm97Nq4DNe
 e3mRlkzdUHSGxL4V3E5A1aTBZk8exgxyaderXPzIqhW8SZume/WpJhyACHRgy6YxPQGs
 LeyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:subject:message-id:date:to;
 bh=dZZyQAHpjbfl1BHs9K+N8ACmyssNyXjOyMdPeMpwrX8=;
 b=JmtpUaFhTGuGSdWXzW0aWT1Ep1clTwC96mzag+JYAcukKkJjCQyWMB6eRWPj7+MzEB
 hjR0TorwJpM7oBu2OMh7aUHjIIlairvo/ryheY2HlaJ4Ay1RZ1yQYBXTHGEpH+Q4s7WM
 zAa63JpcevlnnTcvBwZlZfU9nDPVa66yqt6tzb+3IBbjt9Kzv/QWhWIoUj1cuONwbld6
 +FbYDMWaDIAzCeJJqovbEFs92h4bh78C7AzblsWs6FS4kYLhTIUEbR+D6EYKpzKoZVWH
 unHZQx/8sPUWJ9NcyhxdYxc2d3/+BruQllCaXgVf5VOi8cqvzoajx7UdZuyIlvYgLmAY
 gIbA==
X-Gm-Message-State: APjAAAUkaN3jnXsO7KwKir6ZXh1X2EFDxRQRAOTCGdRTQrh6YAhdd189
 a1dzfQ/EX3PYz6eUAAzBlKPOEInq
X-Google-Smtp-Source: APXvYqwPMCsuNgpojycKP8yz/K6CmSmpPeht64bdb2jIH5WaEfFbPplXeywwCb/1BkwaxzfyfqyXww==
X-Received: by 2002:a65:5684:: with SMTP id v4mr29161609pgs.160.1557733143611; 
 Mon, 13 May 2019 00:39:03 -0700 (PDT)
Received: from [192.168.1.2] ([220.130.36.2])
 by smtp.gmail.com with ESMTPSA id y68sm16690732pfy.28.2019.05.13.00.39.01
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 May 2019 00:39:02 -0700 (PDT)
From: Brad Chou <chou.brad@gmail.com>
Content-Type: multipart/mixed;
 boundary="Apple-Mail=_CD56383E-96B9-44A8-B574-6A16EC889245"
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: obmc-phosphor-buttons build error
Message-Id: <B938334B-F725-41F9-BC25-9FE9DEA70BDD@gmail.com>
Date: Mon, 13 May 2019 15:38:58 +0800
To: openbmc@lists.ozlabs.org
X-Mailer: Apple Mail (2.3445.9.1)
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


--Apple-Mail=_CD56383E-96B9-44A8-B574-6A16EC889245
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi All,
I try to include obmc-phosphor-buttons into my image, but when compile =
it shows a lot of errors.
Can anyone help me to see what=E2=80=99s going wrong ?
Thanks.

obmc-phosphor-buttons_git.bb
SUMMARY =3D "OpenBMC Buttons"
DESCRIPTION =3D "OpenBMC All buttons"
PR =3D "r1"
PV =3D "1.0+git${SRCPV}"
LICENSE =3D "Apache-2.0"
LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4327"

S =3D "${WORKDIR}/git"
SRC_URI +=3D "git://github.com/openbmc/phosphor-buttons.git"
SRCREV =3D "391a21a1bb002a62ce336bfacdd8fdf888b7909a"

inherit cmake pkgconfig systemd

SYSTEMD_SERVICE_${PN} +=3D "xyz.openbmc_project.Chassis.Buttons.service"

DEPENDS +=3D " \
    systemd \
    sdbusplus \
    phosphor-dbus-interfaces \
    phosphor-logging \
    nlohmann-json \
    gpioplus \
    "


DEBUG: Executing shell function do_compile
NOTE: VERBOSE=3D1 cmake --build =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/build --target =
all -- -j 32
[1/9] =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot-na=
tive/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++  =
-DCHASSIS_STATE_OBJECT_NAME=3D\"/xyz/openbmc_project/state/chassis0\" =
-DGPIO_BASE_LABEL_NAME=3D\"1e780000.gpio\" =
-DHOST_STATE_OBJECT_NAME=3D\"/xyz/openbmc_project/state/host0\" =
-DID_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/ID0\" =
-DLONG_PRESS_TIME_MS=3D3000 =
-DPOWER_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/Power0\"=
 =
-DRESET_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/Reset0\"=
 =
-I/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-=
gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/inc -Iinc =
-march=3Darmv6 -marm -mtune=3Darm1176jz-s  =
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot  -O2 -pipe -g -feliminate-unused-debug-types =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1=3D/usr/src/debug/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1 =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot=3D =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot-native=3D  -fvisibility-inlines-hidden  -march=3Darmv6 =
-marm -mtune=3Darm1176jz-s  =
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot   -std=3Dgnu++1z -MD -MT =
CMakeFiles/button-handler.dir/src/button_handler_main.cpp.o -MF =
CMakeFiles/button-handler.dir/src/button_handler_main.cpp.o.d -o =
CMakeFiles/button-handler.dir/src/button_handler_main.cpp.o -c =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/src/button_ha=
ndler_main.cpp
[2/9] =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot-na=
tive/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++  =
-DCHASSIS_STATE_OBJECT_NAME=3D\"/xyz/openbmc_project/state/chassis0\" =
-DGPIO_BASE_LABEL_NAME=3D\"1e780000.gpio\" =
-DHOST_STATE_OBJECT_NAME=3D\"/xyz/openbmc_project/state/host0\" =
-DID_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/ID0\" =
-DLONG_PRESS_TIME_MS=3D3000 =
-DPOWER_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/Power0\"=
 =
-DRESET_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/Reset0\"=
 =
-I/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-=
gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/inc -Iinc =
-march=3Darmv6 -marm -mtune=3Darm1176jz-s  =
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot  -O2 -pipe -g -feliminate-unused-debug-types =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1=3D/usr/src/debug/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1 =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot=3D =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot-native=3D  -fvisibility-inlines-hidden  -march=3Darmv6 =
-marm -mtune=3Darm1176jz-s  =
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot   -std=3Dgnu++1z -MD -MT =
CMakeFiles/buttons.dir/src/power_button.cpp.o -MF =
CMakeFiles/buttons.dir/src/power_button.cpp.o.d -o =
CMakeFiles/buttons.dir/src/power_button.cpp.o -c =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/src/power_but=
ton.cpp
[3/9] =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot-na=
tive/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++  =
-DCHASSIS_STATE_OBJECT_NAME=3D\"/xyz/openbmc_project/state/chassis0\" =
-DGPIO_BASE_LABEL_NAME=3D\"1e780000.gpio\" =
-DHOST_STATE_OBJECT_NAME=3D\"/xyz/openbmc_project/state/host0\" =
-DID_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/ID0\" =
-DLONG_PRESS_TIME_MS=3D3000 =
-DPOWER_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/Power0\"=
 =
-DRESET_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/Reset0\"=
 =
-I/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-=
gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/inc -Iinc =
-march=3Darmv6 -marm -mtune=3Darm1176jz-s  =
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot  -O2 -pipe -g -feliminate-unused-debug-types =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1=3D/usr/src/debug/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1 =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot=3D =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot-native=3D  -fvisibility-inlines-hidden  -march=3Darmv6 =
-marm -mtune=3Darm1176jz-s  =
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot   -std=3Dgnu++1z -MD -MT =
CMakeFiles/buttons.dir/src/id_button.cpp.o -MF =
CMakeFiles/buttons.dir/src/id_button.cpp.o.d -o =
CMakeFiles/buttons.dir/src/id_button.cpp.o -c =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/src/id_button=
.cpp
[4/9] =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot-na=
tive/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++  =
-DCHASSIS_STATE_OBJECT_NAME=3D\"/xyz/openbmc_project/state/chassis0\" =
-DGPIO_BASE_LABEL_NAME=3D\"1e780000.gpio\" =
-DHOST_STATE_OBJECT_NAME=3D\"/xyz/openbmc_project/state/host0\" =
-DID_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/ID0\" =
-DLONG_PRESS_TIME_MS=3D3000 =
-DPOWER_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/Power0\"=
 =
-DRESET_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/Reset0\"=
 =
-I/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-=
gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/inc -Iinc =
-march=3Darmv6 -marm -mtune=3Darm1176jz-s  =
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot  -O2 -pipe -g -feliminate-unused-debug-types =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1=3D/usr/src/debug/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1 =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot=3D =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot-native=3D  -fvisibility-inlines-hidden  -march=3Darmv6 =
-marm -mtune=3Darm1176jz-s  =
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot   -std=3Dgnu++1z -MD -MT =
CMakeFiles/buttons.dir/src/reset_button.cpp.o -MF =
CMakeFiles/buttons.dir/src/reset_button.cpp.o.d -o =
CMakeFiles/buttons.dir/src/reset_button.cpp.o -c =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/src/reset_but=
ton.cpp
[5/9] =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot-na=
tive/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++  =
-DCHASSIS_STATE_OBJECT_NAME=3D\"/xyz/openbmc_project/state/chassis0\" =
-DGPIO_BASE_LABEL_NAME=3D\"1e780000.gpio\" =
-DHOST_STATE_OBJECT_NAME=3D\"/xyz/openbmc_project/state/host0\" =
-DID_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/ID0\" =
-DLONG_PRESS_TIME_MS=3D3000 =
-DPOWER_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/Power0\"=
 =
-DRESET_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/Reset0\"=
 =
-I/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-=
gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/inc -Iinc =
-march=3Darmv6 -marm -mtune=3Darm1176jz-s  =
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot  -O2 -pipe -g -feliminate-unused-debug-types =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1=3D/usr/src/debug/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1 =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot=3D =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot-native=3D  -fvisibility-inlines-hidden  -march=3Darmv6 =
-marm -mtune=3Darm1176jz-s  =
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot   -std=3Dgnu++1z -MD -MT CMakeFiles/buttons.dir/src/main.cpp.o =
-MF CMakeFiles/buttons.dir/src/main.cpp.o.d -o =
CMakeFiles/buttons.dir/src/main.cpp.o -c =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/src/main.cpp
[6/9] =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot-na=
tive/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++  =
-DCHASSIS_STATE_OBJECT_NAME=3D\"/xyz/openbmc_project/state/chassis0\" =
-DGPIO_BASE_LABEL_NAME=3D\"1e780000.gpio\" =
-DHOST_STATE_OBJECT_NAME=3D\"/xyz/openbmc_project/state/host0\" =
-DID_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/ID0\" =
-DLONG_PRESS_TIME_MS=3D3000 =
-DPOWER_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/Power0\"=
 =
-DRESET_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/Reset0\"=
 =
-I/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-=
gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/inc -Iinc =
-march=3Darmv6 -marm -mtune=3Darm1176jz-s  =
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot  -O2 -pipe -g -feliminate-unused-debug-types =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1=3D/usr/src/debug/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1 =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot=3D =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot-native=3D  -fvisibility-inlines-hidden  -march=3Darmv6 =
-marm -mtune=3Darm1176jz-s  =
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot   -std=3Dgnu++1z -MD -MT =
CMakeFiles/button-handler.dir/src/button_handler.cpp.o -MF =
CMakeFiles/button-handler.dir/src/button_handler.cpp.o.d -o =
CMakeFiles/button-handler.dir/src/button_handler.cpp.o -c =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/src/button_ha=
ndler.cpp
[7/9] : && =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot-na=
tive/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++  =
-march=3Darmv6 -marm -mtune=3Darm1176jz-s  =
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot  -O2 -pipe -g -feliminate-unused-debug-types =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1=3D/usr/src/debug/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1 =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot=3D =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot-native=3D  -fvisibility-inlines-hidden  -march=3Darmv6 =
-marm -mtune=3Darm1176jz-s  =
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot  -march=3Darmv6 -marm -mtune=3Darm1176jz-s  =
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot  -O2 -pipe -g -feliminate-unused-debug-types =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1=3D/usr/src/debug/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1 =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot=3D =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot-native=3D  -fvisibility-inlines-hidden  -march=3Darmv6 =
-marm -mtune=3Darm1176jz-s  =
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-O1 =
-Wl,--hash-style=3Dgnu -Wl,--as-needed  -rdynamic =
CMakeFiles/button-handler.dir/src/button_handler_main.cpp.o =
CMakeFiles/button-handler.dir/src/button_handler.cpp.o  -o =
button-handler  -lsdbusplus -lsystemd -lphosphor_dbus && :
FAILED: button-handler=20
: && =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot-na=
tive/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++  =
-march=3Darmv6 -marm -mtune=3Darm1176jz-s  =
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot  -O2 -pipe -g -feliminate-unused-debug-types =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1=3D/usr/src/debug/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1 =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot=3D =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot-native=3D  -fvisibility-inlines-hidden  -march=3Darmv6 =
-marm -mtune=3Darm1176jz-s  =
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot  -march=3Darmv6 -marm -mtune=3Darm1176jz-s  =
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot  -O2 -pipe -g -feliminate-unused-debug-types =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1=3D/usr/src/debug/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1 =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot=3D =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot-native=3D  -fvisibility-inlines-hidden  -march=3Darmv6 =
-marm -mtune=3Darm1176jz-s  =
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-O1 =
-Wl,--hash-style=3Dgnu -Wl,--as-needed  -rdynamic =
CMakeFiles/button-handler.dir/src/button_handler_main.cpp.o =
CMakeFiles/button-handler.dir/src/button_handler.cpp.o  -o =
button-handler  -lsdbusplus -lsystemd -lphosphor_dbus && :
CMakeFiles/button-handler.dir/src/button_handler.cpp.o: In function =
`void phosphor::logging::details::helper_log<std::tuple<char const*, =
phosphor::logging::level, char const*, char const*, char const*, =
unsigned long long, char const*, char const*>&, 0u, 1u, 2u, 3u, 4u, 5u, =
6u, 7u>(std::tuple<char const*, phosphor::logging::level, char const*, =
char const*, char const*, unsigned long long, char const*, char =
const*>&, std::integer_sequence<unsigned int, 0u, 1u, 2u, 3u, 4u, 5u, =
6u, 7u>) [clone .isra.44] [clone .constprop.171]':
/usr/include/phosphor-logging/log.hpp:104: undefined reference to =
`phosphor::logging::sdjournal_ptr'
CMakeFiles/button-handler.dir/src/button_handler.cpp.o: In function =
`phosphor::button::Handler::idPressed(sdbusplus::message::message&)':
/usr/include/sdbusplus/bus.hpp:259: undefined reference to =
`phosphor::logging::sdjournal_ptr'
CMakeFiles/button-handler.dir/src/button_handler.cpp.o: In function =
`void phosphor::logging::log<(phosphor::logging::level)6, char =
const*>(char const*)':
/usr/include/sdbusplus/server/transaction.hpp:143: undefined reference =
to `phosphor::logging::sdjournal_ptr'
collect2: error: ld returned 1 exit status
[8/9] =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot-na=
tive/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++  =
-DCHASSIS_STATE_OBJECT_NAME=3D\"/xyz/openbmc_project/state/chassis0\" =
-DGPIO_BASE_LABEL_NAME=3D\"1e780000.gpio\" =
-DHOST_STATE_OBJECT_NAME=3D\"/xyz/openbmc_project/state/host0\" =
-DID_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/ID0\" =
-DLONG_PRESS_TIME_MS=3D3000 =
-DPOWER_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/Power0\"=
 =
-DRESET_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/Reset0\"=
 =
-I/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-=
gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/inc -Iinc =
-march=3Darmv6 -marm -mtune=3Darm1176jz-s  =
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot  -O2 -pipe -g -feliminate-unused-debug-types =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1=3D/usr/src/debug/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1 =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot=3D =
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot-native=3D  -fvisibility-inlines-hidden  -march=3Darmv6 =
-marm -mtune=3Darm1176jz-s  =
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot   -std=3Dgnu++1z -MD -MT CMakeFiles/buttons.dir/src/gpio.cpp.o =
-MF CMakeFiles/buttons.dir/src/gpio.cpp.o.d -o =
CMakeFiles/buttons.dir/src/gpio.cpp.o -c =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/src/gpio.cpp
In file included from =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/c++/7.3.0/map:60:0,
                 from =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/sdbusplus/message/types.hpp:5,
                 from =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/sdbusplus/message/append.hpp:5,
                 from =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/sdbusplus/message.hpp:6,
                 from =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/sdbusplus/bus.hpp:7,
                 from =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/inc/gpio.hpp:=
18,
                 from =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/src/gpio.cpp:=
17:
=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/c++/7.3.0/bits/stl_tree.h: In member function =
'std::pair<std::_Rb_tree_node_base*, std::_Rb_tree_node_base*> =
std::_Rb_tree<_Key, _Val, _KeyOfValue, _Compare, =
_Alloc>::_M_get_insert_hint_unique_pos(std::_Rb_tree<_Key, _Val, =
_KeyOfValue, _Compare, _Alloc>::const_iterator, const key_type&) [with =
_Key =3D std::__cxx11::basic_string<char>; _Val =3D std::pair<const =
std::__cxx11::basic_string<char>, nlohmann::basic_json<> >; _KeyOfValue =
=3D std::_Select1st<std::pair<const std::__cxx11::basic_string<char>, =
nlohmann::basic_json<> > >; _Compare =3D std::less<void>; _Alloc =3D =
std::allocator<std::pair<const std::__cxx11::basic_string<char>, =
nlohmann::basic_json<> > >]':
=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/c++/7.3.0/bits/stl_tree.h:2130:5: note: parameter passing for =
argument of type 'std::_Rb_tree<std::__cxx11::basic_string<char>, =
std::pair<const std::__cxx11::basic_string<char>, nlohmann::basic_json<> =
>, std::_Select1st<std::pair<const std::__cxx11::basic_string<char>, =
nlohmann::basic_json<> > >, std::less<void>, =
std::allocator<std::pair<const std::__cxx11::basic_string<char>, =
nlohmann::basic_json<> > > >::const_iterator {aka =
std::_Rb_tree_const_iterator<std::pair<const =
std::__cxx11::basic_string<char>, nlohmann::basic_json<> > >}' changed =
in GCC 7.1
     _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/c++/7.3.0/vector:69:0,
                 from =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/sdbusplus/message/types.hpp:12,
                 from =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/sdbusplus/message/append.hpp:5,
                 from =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/sdbusplus/message.hpp:6,
                 from =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/sdbusplus/bus.hpp:7,
                 from =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/inc/gpio.hpp:=
18,
                 from =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/src/gpio.cpp:=
17:
=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/c++/7.3.0/bits/vector.tcc: In member function 'void =
std::vector<_Tp, _Alloc>::_M_realloc_insert(std::vector<_Tp, =
_Alloc>::iterator, _Args&& ...) [with _Args =3D =
{nlohmann::detail::value_t}; _Tp =3D nlohmann::basic_json<>; _Alloc =3D =
std::allocator<nlohmann::basic_json<> >]':
=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/c++/7.3.0/bits/vector.tcc:394:7: note: parameter passing for =
argument of type 'std::vector<nlohmann::basic_json<>, =
std::allocator<nlohmann::basic_json<> > >::iterator {aka =
__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*, =
std::vector<nlohmann::basic_json<>, =
std::allocator<nlohmann::basic_json<> > > >}' changed in GCC 7.1
       vector<_Tp, _Alloc>::
       ^~~~~~~~~~~~~~~~~~~
=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/c++/7.3.0/bits/vector.tcc: In member function =
'std::vector<_Tp, _Alloc>::reference std::vector<_Tp, =
_Alloc>::emplace_back(_Args&& ...) [with _Args =3D =
{nlohmann::detail::value_t}; _Tp =3D nlohmann::basic_json<>; _Alloc =3D =
std::allocator<nlohmann::basic_json<> >]':
=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/c++/7.3.0/bits/vector.tcc:105:21: note: parameter passing for =
argument of type '__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*, =
std::vector<nlohmann::basic_json<>, =
std::allocator<nlohmann::basic_json<> > > >' changed in GCC 7.1
    _M_realloc_insert(end(), std::forward<_Args>(__args)...);
    ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/c++/7.3.0/bits/vector.tcc: In member function 'void =
std::vector<_Tp, _Alloc>::_M_realloc_insert(std::vector<_Tp, =
_Alloc>::iterator, _Args&& ...) [with _Args =3D {std::nullptr_t}; _Tp =3D =
nlohmann::basic_json<>; _Alloc =3D std::allocator<nlohmann::basic_json<> =
>]':
=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/c++/7.3.0/bits/vector.tcc:394:7: note: parameter passing for =
argument of type 'std::vector<nlohmann::basic_json<>, =
std::allocator<nlohmann::basic_json<> > >::iterator {aka =
__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*, =
std::vector<nlohmann::basic_json<>, =
std::allocator<nlohmann::basic_json<> > > >}' changed in GCC 7.1
       vector<_Tp, _Alloc>::
       ^~~~~~~~~~~~~~~~~~~
=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/c++/7.3.0/bits/vector.tcc: In member function 'void =
std::vector<_Tp, _Alloc>::_M_realloc_insert(std::vector<_Tp, =
_Alloc>::iterator, _Args&& ...) [with _Args =3D =
{std::__cxx11::basic_string<char, std::char_traits<char>, =
std::allocator<char> >&}; _Tp =3D nlohmann::basic_json<>; _Alloc =3D =
std::allocator<nlohmann::basic_json<> >]':
=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/c++/7.3.0/bits/vector.tcc:394:7: note: parameter passing for =
argument of type 'std::vector<nlohmann::basic_json<>, =
std::allocator<nlohmann::basic_json<> > >::iterator {aka =
__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*, =
std::vector<nlohmann::basic_json<>, =
std::allocator<nlohmann::basic_json<> > > >}' changed in GCC 7.1
=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/c++/7.3.0/bits/vector.tcc:394:7: note: parameter passing for =
argument of type 'std::vector<nlohmann::basic_json<>, =
std::allocator<nlohmann::basic_json<> > >::iterator {aka =
__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*, =
std::vector<nlohmann::basic_json<>, =
std::allocator<nlohmann::basic_json<> > > >}' changed in GCC 7.1
=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/c++/7.3.0/bits/vector.tcc: In member function 'bool =
nlohmann::detail::parser<BasicJsonType>::sax_parse_internal(SAX*) [with =
SAX =3D nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<> >; =
BasicJsonType =3D nlohmann::basic_json<>]':
=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/c++/7.3.0/bits/vector.tcc:105:21: note: parameter passing for =
argument of type '__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*, =
std::vector<nlohmann::basic_json<>, =
std::allocator<nlohmann::basic_json<> > > >' changed in GCC 7.1
    _M_realloc_insert(end(), std::forward<_Args>(__args)...);
    ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/c++/7.3.0/bits/vector.tcc:105:21: note: parameter passing for =
argument of type '__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*, =
std::vector<nlohmann::basic_json<>, =
std::allocator<nlohmann::basic_json<> > > >' changed in GCC 7.1
    _M_realloc_insert(end(), std::forward<_Args>(__args)...);
    ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ninja: build stopped: subcommand failed.
WARNING: =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/temp/run.do_compi=
le.8464:1 exit 1 from 'VERBOSE=3D1 cmake --build =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/build --target =
all -- -j 32'
ERROR: Function failed: do_compile (log file is located at =
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/temp/log.do_compi=
le.8464)





--Apple-Mail=_CD56383E-96B9-44A8-B574-6A16EC889245
Content-Disposition: attachment;
	filename=log.do_compile.8464
Content-Type: application/octet-stream;
	x-unix-mode=0700;
	name="log.do_compile.8464"
Content-Transfer-Encoding: quoted-printable

DEBUG:=20Executing=20shell=20function=20do_compile=0ANOTE:=20VERBOSE=3D1=20=
cmake=20--build=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/build=20=
--target=20all=20--=20-j=2032=0A[1/9]=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot-na=
tive/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++=20=20=
-DCHASSIS_STATE_OBJECT_NAME=3D\"/xyz/openbmc_project/state/chassis0\"=20=
-DGPIO_BASE_LABEL_NAME=3D\"1e780000.gpio\"=20=
-DHOST_STATE_OBJECT_NAME=3D\"/xyz/openbmc_project/state/host0\"=20=
-DID_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/ID0\"=20=
-DLONG_PRESS_TIME_MS=3D3000=20=
-DPOWER_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/Power0\"=
=20=
-DRESET_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/Reset0\"=
=20=
-I/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-=
gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/inc=20=
-Iinc=20-march=3Darmv6=20-marm=20-mtune=3Darm1176jz-s=20=20=
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot=20=20-O2=20-pipe=20-g=20-feliminate-unused-debug-types=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1=3D/usr/src/debug/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot=3D=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot-native=3D=20=20-fvisibility-inlines-hidden=20=20=
-march=3Darmv6=20-marm=20-mtune=3Darm1176jz-s=20=20=
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot=20=20=20-std=3Dgnu++1z=20-MD=20-MT=20=
CMakeFiles/button-handler.dir/src/button_handler_main.cpp.o=20-MF=20=
CMakeFiles/button-handler.dir/src/button_handler_main.cpp.o.d=20-o=20=
CMakeFiles/button-handler.dir/src/button_handler_main.cpp.o=20-c=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/src/button_ha=
ndler_main.cpp=0A[2/9]=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot-na=
tive/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++=20=20=
-DCHASSIS_STATE_OBJECT_NAME=3D\"/xyz/openbmc_project/state/chassis0\"=20=
-DGPIO_BASE_LABEL_NAME=3D\"1e780000.gpio\"=20=
-DHOST_STATE_OBJECT_NAME=3D\"/xyz/openbmc_project/state/host0\"=20=
-DID_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/ID0\"=20=
-DLONG_PRESS_TIME_MS=3D3000=20=
-DPOWER_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/Power0\"=
=20=
-DRESET_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/Reset0\"=
=20=
-I/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-=
gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/inc=20=
-Iinc=20-march=3Darmv6=20-marm=20-mtune=3Darm1176jz-s=20=20=
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot=20=20-O2=20-pipe=20-g=20-feliminate-unused-debug-types=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1=3D/usr/src/debug/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot=3D=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot-native=3D=20=20-fvisibility-inlines-hidden=20=20=
-march=3Darmv6=20-marm=20-mtune=3Darm1176jz-s=20=20=
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot=20=20=20-std=3Dgnu++1z=20-MD=20-MT=20=
CMakeFiles/buttons.dir/src/power_button.cpp.o=20-MF=20=
CMakeFiles/buttons.dir/src/power_button.cpp.o.d=20-o=20=
CMakeFiles/buttons.dir/src/power_button.cpp.o=20-c=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/src/power_but=
ton.cpp=0A[3/9]=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot-na=
tive/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++=20=20=
-DCHASSIS_STATE_OBJECT_NAME=3D\"/xyz/openbmc_project/state/chassis0\"=20=
-DGPIO_BASE_LABEL_NAME=3D\"1e780000.gpio\"=20=
-DHOST_STATE_OBJECT_NAME=3D\"/xyz/openbmc_project/state/host0\"=20=
-DID_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/ID0\"=20=
-DLONG_PRESS_TIME_MS=3D3000=20=
-DPOWER_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/Power0\"=
=20=
-DRESET_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/Reset0\"=
=20=
-I/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-=
gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/inc=20=
-Iinc=20-march=3Darmv6=20-marm=20-mtune=3Darm1176jz-s=20=20=
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot=20=20-O2=20-pipe=20-g=20-feliminate-unused-debug-types=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1=3D/usr/src/debug/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot=3D=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot-native=3D=20=20-fvisibility-inlines-hidden=20=20=
-march=3Darmv6=20-marm=20-mtune=3Darm1176jz-s=20=20=
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot=20=20=20-std=3Dgnu++1z=20-MD=20-MT=20=
CMakeFiles/buttons.dir/src/id_button.cpp.o=20-MF=20=
CMakeFiles/buttons.dir/src/id_button.cpp.o.d=20-o=20=
CMakeFiles/buttons.dir/src/id_button.cpp.o=20-c=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/src/id_button=
.cpp=0A[4/9]=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot-na=
tive/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++=20=20=
-DCHASSIS_STATE_OBJECT_NAME=3D\"/xyz/openbmc_project/state/chassis0\"=20=
-DGPIO_BASE_LABEL_NAME=3D\"1e780000.gpio\"=20=
-DHOST_STATE_OBJECT_NAME=3D\"/xyz/openbmc_project/state/host0\"=20=
-DID_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/ID0\"=20=
-DLONG_PRESS_TIME_MS=3D3000=20=
-DPOWER_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/Power0\"=
=20=
-DRESET_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/Reset0\"=
=20=
-I/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-=
gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/inc=20=
-Iinc=20-march=3Darmv6=20-marm=20-mtune=3Darm1176jz-s=20=20=
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot=20=20-O2=20-pipe=20-g=20-feliminate-unused-debug-types=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1=3D/usr/src/debug/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot=3D=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot-native=3D=20=20-fvisibility-inlines-hidden=20=20=
-march=3Darmv6=20-marm=20-mtune=3Darm1176jz-s=20=20=
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot=20=20=20-std=3Dgnu++1z=20-MD=20-MT=20=
CMakeFiles/buttons.dir/src/reset_button.cpp.o=20-MF=20=
CMakeFiles/buttons.dir/src/reset_button.cpp.o.d=20-o=20=
CMakeFiles/buttons.dir/src/reset_button.cpp.o=20-c=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/src/reset_but=
ton.cpp=0A[5/9]=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot-na=
tive/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++=20=20=
-DCHASSIS_STATE_OBJECT_NAME=3D\"/xyz/openbmc_project/state/chassis0\"=20=
-DGPIO_BASE_LABEL_NAME=3D\"1e780000.gpio\"=20=
-DHOST_STATE_OBJECT_NAME=3D\"/xyz/openbmc_project/state/host0\"=20=
-DID_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/ID0\"=20=
-DLONG_PRESS_TIME_MS=3D3000=20=
-DPOWER_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/Power0\"=
=20=
-DRESET_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/Reset0\"=
=20=
-I/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-=
gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/inc=20=
-Iinc=20-march=3Darmv6=20-marm=20-mtune=3Darm1176jz-s=20=20=
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot=20=20-O2=20-pipe=20-g=20-feliminate-unused-debug-types=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1=3D/usr/src/debug/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot=3D=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot-native=3D=20=20-fvisibility-inlines-hidden=20=20=
-march=3Darmv6=20-marm=20-mtune=3Darm1176jz-s=20=20=
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot=20=20=20-std=3Dgnu++1z=20-MD=20-MT=20=
CMakeFiles/buttons.dir/src/main.cpp.o=20-MF=20=
CMakeFiles/buttons.dir/src/main.cpp.o.d=20-o=20=
CMakeFiles/buttons.dir/src/main.cpp.o=20-c=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/src/main.cpp=0A=
[6/9]=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot-na=
tive/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++=20=20=
-DCHASSIS_STATE_OBJECT_NAME=3D\"/xyz/openbmc_project/state/chassis0\"=20=
-DGPIO_BASE_LABEL_NAME=3D\"1e780000.gpio\"=20=
-DHOST_STATE_OBJECT_NAME=3D\"/xyz/openbmc_project/state/host0\"=20=
-DID_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/ID0\"=20=
-DLONG_PRESS_TIME_MS=3D3000=20=
-DPOWER_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/Power0\"=
=20=
-DRESET_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/Reset0\"=
=20=
-I/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-=
gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/inc=20=
-Iinc=20-march=3Darmv6=20-marm=20-mtune=3Darm1176jz-s=20=20=
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot=20=20-O2=20-pipe=20-g=20-feliminate-unused-debug-types=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1=3D/usr/src/debug/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot=3D=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot-native=3D=20=20-fvisibility-inlines-hidden=20=20=
-march=3Darmv6=20-marm=20-mtune=3Darm1176jz-s=20=20=
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot=20=20=20-std=3Dgnu++1z=20-MD=20-MT=20=
CMakeFiles/button-handler.dir/src/button_handler.cpp.o=20-MF=20=
CMakeFiles/button-handler.dir/src/button_handler.cpp.o.d=20-o=20=
CMakeFiles/button-handler.dir/src/button_handler.cpp.o=20-c=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/src/button_ha=
ndler.cpp=0A[7/9]=20:=20&&=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot-na=
tive/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++=20=20=
-march=3Darmv6=20-marm=20-mtune=3Darm1176jz-s=20=20=
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot=20=20-O2=20-pipe=20-g=20-feliminate-unused-debug-types=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1=3D/usr/src/debug/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot=3D=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot-native=3D=20=20-fvisibility-inlines-hidden=20=20=
-march=3Darmv6=20-marm=20-mtune=3Darm1176jz-s=20=20=
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot=20=20-march=3Darmv6=20-marm=20-mtune=3Darm1176jz-s=20=20=
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot=20=20-O2=20-pipe=20-g=20-feliminate-unused-debug-types=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1=3D/usr/src/debug/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot=3D=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot-native=3D=20=20-fvisibility-inlines-hidden=20=20=
-march=3Darmv6=20-marm=20-mtune=3Darm1176jz-s=20=20=
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot=20-Wl,-O1=20-Wl,--hash-style=3Dgnu=20-Wl,--as-needed=20-Wl,-O1=20=
-Wl,--hash-style=3Dgnu=20-Wl,--as-needed=20=20-rdynamic=20=
CMakeFiles/button-handler.dir/src/button_handler_main.cpp.o=20=
CMakeFiles/button-handler.dir/src/button_handler.cpp.o=20=20-o=20=
button-handler=20=20-lsdbusplus=20-lsystemd=20-lphosphor_dbus=20&&=20:=0A=
FAILED:=20button-handler=20=0A:=20&&=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot-na=
tive/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++=20=20=
-march=3Darmv6=20-marm=20-mtune=3Darm1176jz-s=20=20=
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot=20=20-O2=20-pipe=20-g=20-feliminate-unused-debug-types=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1=3D/usr/src/debug/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot=3D=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot-native=3D=20=20-fvisibility-inlines-hidden=20=20=
-march=3Darmv6=20-marm=20-mtune=3Darm1176jz-s=20=20=
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot=20=20-march=3Darmv6=20-marm=20-mtune=3Darm1176jz-s=20=20=
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot=20=20-O2=20-pipe=20-g=20-feliminate-unused-debug-types=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1=3D/usr/src/debug/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot=3D=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot-native=3D=20=20-fvisibility-inlines-hidden=20=20=
-march=3Darmv6=20-marm=20-mtune=3Darm1176jz-s=20=20=
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot=20-Wl,-O1=20-Wl,--hash-style=3Dgnu=20-Wl,--as-needed=20-Wl,-O1=20=
-Wl,--hash-style=3Dgnu=20-Wl,--as-needed=20=20-rdynamic=20=
CMakeFiles/button-handler.dir/src/button_handler_main.cpp.o=20=
CMakeFiles/button-handler.dir/src/button_handler.cpp.o=20=20-o=20=
button-handler=20=20-lsdbusplus=20-lsystemd=20-lphosphor_dbus=20&&=20:=0A=
CMakeFiles/button-handler.dir/src/button_handler.cpp.o:=20In=20function=20=
`void=20phosphor::logging::details::helper_log<std::tuple<char=20const*,=20=
phosphor::logging::level,=20char=20const*,=20char=20const*,=20char=20=
const*,=20unsigned=20long=20long,=20char=20const*,=20char=20const*>&,=20=
0u,=201u,=202u,=203u,=204u,=205u,=206u,=207u>(std::tuple<char=20const*,=20=
phosphor::logging::level,=20char=20const*,=20char=20const*,=20char=20=
const*,=20unsigned=20long=20long,=20char=20const*,=20char=20const*>&,=20=
std::integer_sequence<unsigned=20int,=200u,=201u,=202u,=203u,=204u,=20=
5u,=206u,=207u>)=20[clone=20.isra.44]=20[clone=20.constprop.171]':=0A=
/usr/include/phosphor-logging/log.hpp:104:=20undefined=20reference=20to=20=
`phosphor::logging::sdjournal_ptr'=0A=
CMakeFiles/button-handler.dir/src/button_handler.cpp.o:=20In=20function=20=
`phosphor::button::Handler::idPressed(sdbusplus::message::message&)':=0A=
/usr/include/sdbusplus/bus.hpp:259:=20undefined=20reference=20to=20=
`phosphor::logging::sdjournal_ptr'=0A=
CMakeFiles/button-handler.dir/src/button_handler.cpp.o:=20In=20function=20=
`void=20phosphor::logging::log<(phosphor::logging::level)6,=20char=20=
const*>(char=20const*)':=0A=
/usr/include/sdbusplus/server/transaction.hpp:143:=20undefined=20=
reference=20to=20`phosphor::logging::sdjournal_ptr'=0Acollect2:=20error:=20=
ld=20returned=201=20exit=20status=0A[8/9]=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot-na=
tive/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++=20=20=
-DCHASSIS_STATE_OBJECT_NAME=3D\"/xyz/openbmc_project/state/chassis0\"=20=
-DGPIO_BASE_LABEL_NAME=3D\"1e780000.gpio\"=20=
-DHOST_STATE_OBJECT_NAME=3D\"/xyz/openbmc_project/state/host0\"=20=
-DID_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/ID0\"=20=
-DLONG_PRESS_TIME_MS=3D3000=20=
-DPOWER_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/Power0\"=
=20=
-DRESET_DBUS_OBJECT_NAME=3D\"/xyz/openbmc_project/Chassis/Buttons/Reset0\"=
=20=
-I/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-=
gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/inc=20=
-Iinc=20-march=3Darmv6=20-marm=20-mtune=3Darm1176jz-s=20=20=
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot=20=20-O2=20-pipe=20-g=20-feliminate-unused-debug-types=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1=3D/usr/src/debug/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot=3D=20=
-fdebug-prefix-map=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/a=
rmv6-openbmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb=
-r1/recipe-sysroot-native=3D=20=20-fvisibility-inlines-hidden=20=20=
-march=3Darmv6=20-marm=20-mtune=3Darm1176jz-s=20=20=
--sysroot=3D/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-open=
bmc-linux-gnueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recip=
e-sysroot=20=20=20-std=3Dgnu++1z=20-MD=20-MT=20=
CMakeFiles/buttons.dir/src/gpio.cpp.o=20-MF=20=
CMakeFiles/buttons.dir/src/gpio.cpp.o.d=20-o=20=
CMakeFiles/buttons.dir/src/gpio.cpp.o=20-c=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/src/gpio.cpp=0A=
In=20file=20included=20from=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/c++/7.3.0/map:60:0,=0A=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20from=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/sdbusplus/message/types.hpp:5,=0A=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20from=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/sdbusplus/message/append.hpp:5,=0A=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20from=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/sdbusplus/message.hpp:6,=0A=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20from=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/sdbusplus/bus.hpp:7,=0A=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20from=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/inc/gpio.hpp:=
18,=0A=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20from=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/src/gpio.cpp:=
17:=0A=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/c++/7.3.0/bits/stl_tree.h:=20In=20member=20function=20=
'std::pair<std::_Rb_tree_node_base*,=20std::_Rb_tree_node_base*>=20=
std::_Rb_tree<_Key,=20_Val,=20_KeyOfValue,=20_Compare,=20=
_Alloc>::_M_get_insert_hint_unique_pos(std::_Rb_tree<_Key,=20_Val,=20=
_KeyOfValue,=20_Compare,=20_Alloc>::const_iterator,=20const=20key_type&)=20=
[with=20_Key=20=3D=20std::__cxx11::basic_string<char>;=20_Val=20=3D=20=
std::pair<const=20std::__cxx11::basic_string<char>,=20=
nlohmann::basic_json<>=20>;=20_KeyOfValue=20=3D=20=
std::_Select1st<std::pair<const=20std::__cxx11::basic_string<char>,=20=
nlohmann::basic_json<>=20>=20>;=20_Compare=20=3D=20std::less<void>;=20=
_Alloc=20=3D=20std::allocator<std::pair<const=20=
std::__cxx11::basic_string<char>,=20nlohmann::basic_json<>=20>=20>]':=0A=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/c++/7.3.0/bits/stl_tree.h:2130:5:=20note:=20parameter=20=
passing=20for=20argument=20of=20type=20=
'std::_Rb_tree<std::__cxx11::basic_string<char>,=20std::pair<const=20=
std::__cxx11::basic_string<char>,=20nlohmann::basic_json<>=20>,=20=
std::_Select1st<std::pair<const=20std::__cxx11::basic_string<char>,=20=
nlohmann::basic_json<>=20>=20>,=20std::less<void>,=20=
std::allocator<std::pair<const=20std::__cxx11::basic_string<char>,=20=
nlohmann::basic_json<>=20>=20>=20>::const_iterator=20{aka=20=
std::_Rb_tree_const_iterator<std::pair<const=20=
std::__cxx11::basic_string<char>,=20nlohmann::basic_json<>=20>=20>}'=20=
changed=20in=20GCC=207.1=0A=20=20=20=20=20_Rb_tree<_Key,=20_Val,=20=
_KeyOfValue,=20_Compare,=20_Alloc>::=0A=20=20=20=20=20=
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=0AIn=20file=20=
included=20from=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/c++/7.3.0/vector:69:0,=0A=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20from=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/sdbusplus/message/types.hpp:12,=0A=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20from=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/sdbusplus/message/append.hpp:5,=0A=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20from=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/sdbusplus/message.hpp:6,=0A=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20from=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/sdbusplus/bus.hpp:7,=0A=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20from=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/inc/gpio.hpp:=
18,=0A=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20from=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/git/src/gpio.cpp:=
17:=0A=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/c++/7.3.0/bits/vector.tcc:=20In=20member=20function=20'void=20=
std::vector<_Tp,=20_Alloc>::_M_realloc_insert(std::vector<_Tp,=20=
_Alloc>::iterator,=20_Args&&=20...)=20[with=20_Args=20=3D=20=
{nlohmann::detail::value_t};=20_Tp=20=3D=20nlohmann::basic_json<>;=20=
_Alloc=20=3D=20std::allocator<nlohmann::basic_json<>=20>]':=0A=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/c++/7.3.0/bits/vector.tcc:394:7:=20note:=20parameter=20passing=20=
for=20argument=20of=20type=20'std::vector<nlohmann::basic_json<>,=20=
std::allocator<nlohmann::basic_json<>=20>=20>::iterator=20{aka=20=
__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,=20=
std::vector<nlohmann::basic_json<>,=20=
std::allocator<nlohmann::basic_json<>=20>=20>=20>}'=20changed=20in=20GCC=20=
7.1=0A=20=20=20=20=20=20=20vector<_Tp,=20_Alloc>::=0A=20=20=20=20=20=20=20=
^~~~~~~~~~~~~~~~~~~=0A=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/c++/7.3.0/bits/vector.tcc:=20In=20member=20function=20=
'std::vector<_Tp,=20_Alloc>::reference=20std::vector<_Tp,=20=
_Alloc>::emplace_back(_Args&&=20...)=20[with=20_Args=20=3D=20=
{nlohmann::detail::value_t};=20_Tp=20=3D=20nlohmann::basic_json<>;=20=
_Alloc=20=3D=20std::allocator<nlohmann::basic_json<>=20>]':=0A=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/c++/7.3.0/bits/vector.tcc:105:21:=20note:=20parameter=20=
passing=20for=20argument=20of=20type=20=
'__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,=20=
std::vector<nlohmann::basic_json<>,=20=
std::allocator<nlohmann::basic_json<>=20>=20>=20>'=20changed=20in=20GCC=20=
7.1=0A=20=20=20=20_M_realloc_insert(end(),=20=
std::forward<_Args>(__args)...);=0A=20=20=20=20=
~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=0A=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/c++/7.3.0/bits/vector.tcc:=20In=20member=20function=20'void=20=
std::vector<_Tp,=20_Alloc>::_M_realloc_insert(std::vector<_Tp,=20=
_Alloc>::iterator,=20_Args&&=20...)=20[with=20_Args=20=3D=20=
{std::nullptr_t};=20_Tp=20=3D=20nlohmann::basic_json<>;=20_Alloc=20=3D=20=
std::allocator<nlohmann::basic_json<>=20>]':=0A=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/c++/7.3.0/bits/vector.tcc:394:7:=20note:=20parameter=20passing=20=
for=20argument=20of=20type=20'std::vector<nlohmann::basic_json<>,=20=
std::allocator<nlohmann::basic_json<>=20>=20>::iterator=20{aka=20=
__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,=20=
std::vector<nlohmann::basic_json<>,=20=
std::allocator<nlohmann::basic_json<>=20>=20>=20>}'=20changed=20in=20GCC=20=
7.1=0A=20=20=20=20=20=20=20vector<_Tp,=20_Alloc>::=0A=20=20=20=20=20=20=20=
^~~~~~~~~~~~~~~~~~~=0A=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/c++/7.3.0/bits/vector.tcc:=20In=20member=20function=20'void=20=
std::vector<_Tp,=20_Alloc>::_M_realloc_insert(std::vector<_Tp,=20=
_Alloc>::iterator,=20_Args&&=20...)=20[with=20_Args=20=3D=20=
{std::__cxx11::basic_string<char,=20std::char_traits<char>,=20=
std::allocator<char>=20>&};=20_Tp=20=3D=20nlohmann::basic_json<>;=20=
_Alloc=20=3D=20std::allocator<nlohmann::basic_json<>=20>]':=0A=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/c++/7.3.0/bits/vector.tcc:394:7:=20note:=20parameter=20passing=20=
for=20argument=20of=20type=20'std::vector<nlohmann::basic_json<>,=20=
std::allocator<nlohmann::basic_json<>=20>=20>::iterator=20{aka=20=
__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,=20=
std::vector<nlohmann::basic_json<>,=20=
std::allocator<nlohmann::basic_json<>=20>=20>=20>}'=20changed=20in=20GCC=20=
7.1=0A=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/c++/7.3.0/bits/vector.tcc:394:7:=20note:=20parameter=20passing=20=
for=20argument=20of=20type=20'std::vector<nlohmann::basic_json<>,=20=
std::allocator<nlohmann::basic_json<>=20>=20>::iterator=20{aka=20=
__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,=20=
std::vector<nlohmann::basic_json<>,=20=
std::allocator<nlohmann::basic_json<>=20>=20>=20>}'=20changed=20in=20GCC=20=
7.1=0A=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/c++/7.3.0/bits/vector.tcc:=20In=20member=20function=20'bool=20=
nlohmann::detail::parser<BasicJsonType>::sax_parse_internal(SAX*)=20=
[with=20SAX=20=3D=20=
nlohmann::detail::json_sax_dom_parser<nlohmann::basic_json<>=20>;=20=
BasicJsonType=20=3D=20nlohmann::basic_json<>]':=0A=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/c++/7.3.0/bits/vector.tcc:105:21:=20note:=20parameter=20=
passing=20for=20argument=20of=20type=20=
'__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,=20=
std::vector<nlohmann::basic_json<>,=20=
std::allocator<nlohmann::basic_json<>=20>=20>=20>'=20changed=20in=20GCC=20=
7.1=0A=20=20=20=20_M_realloc_insert(end(),=20=
std::forward<_Args>(__args)...);=0A=20=20=20=20=
~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=0A=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/recipe-sysroot/us=
r/include/c++/7.3.0/bits/vector.tcc:105:21:=20note:=20parameter=20=
passing=20for=20argument=20of=20type=20=
'__gnu_cxx::__normal_iterator<nlohmann::basic_json<>*,=20=
std::vector<nlohmann::basic_json<>,=20=
std::allocator<nlohmann::basic_json<>=20>=20>=20>'=20changed=20in=20GCC=20=
7.1=0A=20=20=20=20_M_realloc_insert(end(),=20=
std::forward<_Args>(__args)...);=0A=20=20=20=20=
~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=0Aninja:=20=
build=20stopped:=20subcommand=20failed.=0AWARNING:=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/temp/run.do_compi=
le.8464:1=20exit=201=20from=20'VERBOSE=3D1=20cmake=20--build=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/build=20=
--target=20all=20--=20-j=2032'=0AERROR:=20Function=20failed:=20=
do_compile=20(log=20file=20is=20located=20at=20=
/home/bradchou/Documents/mct_openbmc/build/tmp/work/armv6-openbmc-linux-gn=
ueabi/obmc-phosphor-buttons/1.0+gitAUTOINC+391a21a1bb-r1/temp/log.do_compi=
le.8464)=0A=

--Apple-Mail=_CD56383E-96B9-44A8-B574-6A16EC889245--
