Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A527D1787E6
	for <lists+openbmc@lfdr.de>; Wed,  4 Mar 2020 03:00:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XHBk5PbMzDqSw
	for <lists+openbmc@lfdr.de>; Wed,  4 Mar 2020 12:59:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32b;
 helo=mail-wm1-x32b.google.com; envelope-from=lak3645@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DmLnmUnN; dkim-atps=neutral
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TZGP6dwKzDqf3
 for <openbmc@lists.ozlabs.org>; Sat, 29 Feb 2020 03:08:40 +1100 (AEDT)
Received: by mail-wm1-x32b.google.com with SMTP id f15so3737969wml.3
 for <openbmc@lists.ozlabs.org>; Fri, 28 Feb 2020 08:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/bBNWr5sgsXCE7v7Sh+GMAp+8PxZiwqonz9wqDakPh0=;
 b=DmLnmUnNJxMBanwY58FjrtFNgpLn492JdwSRmTpV1sv2kKgBFzG0YEkvg26as0gc5n
 CZHRjfAG0h45E9c3TxZK/tEE7Br0m8uKDhnM3M5EW8eBJRUgTnwHDu1bLNMFS4huRwSm
 /ZsMFSLhmRJJO02sy8dEWgwFC2qCFS0TzbdV0Uoa2cBFN+EJUzr5IlMZTlKhPfpDYgKx
 63nrDaLS3Plip9H6UqasGMflb1GWUBF+uW3IpXwr9uldkYDhEy0UjMHqkLmaQQYHtbrQ
 rLVt68WQ+ESYshUmXjdzWGR4lzdRlssPgNuBXQ7NbauQkPBRzmygwz2JEDwboEs2W44B
 wQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/bBNWr5sgsXCE7v7Sh+GMAp+8PxZiwqonz9wqDakPh0=;
 b=gFhAAzWXKdRb6Qz2ZplcN+geayTWCf7VmNE+/bxTLEGokxKyqusULh9sA7Gn7i2a8y
 8kJMtuZ3bn4tH/kQzbjjmB46q85PflcvLMXx/ab8eDlW+5JSX9E95XcQYpfDxgMaz+fj
 /hBsV+geP9mV9GDQlRsJsglsx+OEtClRP5pdFWGg8jeHhUpoUdog3ZRx8kT7A3xjH9Kh
 C7sDGC3G2+S/9IXiW4Ei9Q9OubA0qWAuP+skJPpVKbV43cNLDy+Hv8BQu8NGWUaOxcjg
 6KvbvVFkzl7aIGvQaxybbTTnz1a8PXjChdwgxV5FERVc/oxLSk9sK0HHsRx6fhkwVvym
 qFeA==
X-Gm-Message-State: APjAAAVcq4iTovmGVguFcWPWXrmWWYhSfX9brwn0esogeWtVzqavMu0r
 5PJOytn89lDr/UYwJanhIRlZDBaGhTfUGAozOr+9C3fk
X-Google-Smtp-Source: APXvYqyZr5ANarqwR/baOmhLZOpeX2vs2AiY9JJH8/a0nvq8SPggsNdSPn60ROGtltKgSo7cptxvTMKXyXovHvfI/PY=
X-Received: by 2002:a7b:cb97:: with SMTP id m23mr5242809wmi.37.1582906115809; 
 Fri, 28 Feb 2020 08:08:35 -0800 (PST)
MIME-Version: 1.0
From: lakshminarayan kamath <lak3645@gmail.com>
Date: Fri, 28 Feb 2020 21:38:23 +0530
Message-ID: <CAGDHrFh+QN0Exmay6SB0aVgwMYnz32NdD8-KiYFimLzCJiP9PA@mail.gmail.com>
Subject: [OpenBMC]: Unit test coverage analysis on openbmc repositories
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000bee820059fa50c74"
X-Mailman-Approved-At: Wed, 04 Mar 2020 12:57:19 +1100
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

--000000000000bee820059fa50c74
Content-Type: text/plain; charset="UTF-8"

Hi All,

Somehow my earlier mail did not get displayed properly

Recently we worked on pulling the UT coverage analysis from all the
available OpenBMC repositories

https://github.com/openbmc/openbmc-build-scripts/commit/229b76a95f87af60c976a0c0dfe84716c9ce5318

This script does following

   1. Clone the repo
   2. Use the CI build environment to build code
   3. Publish the result in the following format

Latest report:
*************************UNIT TEST COVERAGE REPORT*************************
https://github.com/openbmc/bmcweb.git NO
https://github.com/openbmc/boost-dbus.git ERROR
https://github.com/openbmc/btbridge.git NO
https://github.com/openbmc/dbus-sensors.git NO
https://github.com/openbmc/entity-manager.git NO
https://github.com/openbmc/fb-ipmi-oem.git NO
https://github.com/openbmc/google-ipmi-i2c.git ERROR
https://github.com/openbmc/google-ipmi-sys.git YES, UNIT TEST
https://github.com/openbmc/gpioplus.git YES, COVERAGE
https://github.com/openbmc/hiomapd.git YES, UNIT TEST
https://github.com/openbmc/ibm-dbus-interfaces.git NO
https://github.com/openbmc/ibm-logging.git YES, UNIT TEST
https://github.com/openbmc/ibm-pldm-oem.git ERROR
https://github.com/openbmc/inarp.git ERROR
https://github.com/openbmc/intel-dbus-interfaces.git NO
https://github.com/openbmc/intel-ipmi-oem.git NO
https://github.com/openbmc/ipmbbridge.git NO
https://github.com/openbmc/ipmi-blob-tool.git YES, UNIT TEST
https://github.com/openbmc/ipmi-fru-parser.git NO
https://github.com/openbmc/ipmitool.git ERROR
https://github.com/openbmc/jsnbd.git ERROR
https://github.com/openbmc/kcsbridge.git NO
https://github.com/openbmc/lenovo-ipmi-oem.git NO
https://github.com/openbmc/libmctp.git YES, UNIT TEST
https://github.com/openbmc/librrdplus.git NO
https://github.com/openbmc/obmc-console.git YES, UNIT TEST
https://github.com/openbmc/obmc-ikvm.git NO
https://github.com/openbmc/openbmc.git NO
https://github.com/openbmc/openbmc-tools.git NO
https://github.com/openbmc/openbmc.github.io.git NO
https://github.com/openbmc/openpower-dbus-interfaces.git NO
https://github.com/openbmc/openpower-debug-collector.git NO
https://github.com/openbmc/openpower-host-ipmi-flash.git NO
https://github.com/openbmc/openpower-host-ipmi-oem.git NO
https://github.com/openbmc/openpower-hw-diags.git YES, COVERAGE
https://github.com/openbmc/openpower-inventory-upload.git NO
https://github.com/openbmc/openpower-libhei.git YES, COVERAGE
https://github.com/openbmc/openpower-logging.git NO
https://github.com/openbmc/openpower-occ-control.git YES, UNIT TEST
https://github.com/openbmc/openpower-pnor-code-mgmt.git YES, UNIT TEST
https://github.com/openbmc/openpower-power-control.git NO
https://github.com/openbmc/openpower-proc-control.git YES, UNIT TEST
https://github.com/openbmc/openpower-sbe-interface.git NO
https://github.com/openbmc/openpower-vpd-parser.git YES, UNIT TEST
https://github.com/openbmc/pam-ipmi.git NO
https://github.com/openbmc/phosphor-bmc-code-mgmt.git YES, UNIT TEST
https://github.com/openbmc/phosphor-buttons.git NO
https://github.com/openbmc/phosphor-certificate-manager.git YES, UNIT TEST
https://github.com/openbmc/phosphor-dbus-interfaces.git NO
https://github.com/openbmc/phosphor-dbus-monitor.git YES, UNIT TEST
https://github.com/openbmc/phosphor-debug-collector.git NO
https://github.com/openbmc/phosphor-ecc.git NO
https://github.com/openbmc/phosphor-event.git YES, UNIT TEST
https://github.com/openbmc/phosphor-fan-presence.git YES, UNIT TEST
https://github.com/openbmc/phosphor-gpio-monitor.git YES, COVERAGE
https://github.com/openbmc/phosphor-host-ipmid.git ERROR
https://github.com/openbmc/phosphor-host-postd.git YES, UNIT TEST
https://github.com/openbmc/phosphor-hostlogger.git NO
https://github.com/openbmc/phosphor-hwmon.git NO
https://github.com/openbmc/phosphor-inventory-manager.git YES, UNIT TEST
https://github.com/openbmc/phosphor-ipmi-blobs.git YES, UNIT TEST
https://github.com/openbmc/phosphor-ipmi-blobs-binarystore.git YES, UNIT
TEST
https://github.com/openbmc/phosphor-ipmi-ethstats.git YES, UNIT TEST
https://github.com/openbmc/phosphor-ipmi-flash.git YES, UNIT TEST
https://github.com/openbmc/phosphor-led-manager.git YES, UNIT TEST
https://github.com/openbmc/phosphor-led-sysfs.git YES, UNIT TEST
https://github.com/openbmc/phosphor-logging.git YES, UNIT TEST
https://github.com/openbmc/phosphor-mboxd.git ERROR
https://github.com/openbmc/phosphor-misc.git NO
https://github.com/openbmc/phosphor-mrw-tools.git NO
https://github.com/openbmc/phosphor-net-ipmid.git YES, UNIT TEST
https://github.com/openbmc/phosphor-networkd.git YES, UNIT TEST
https://github.com/openbmc/phosphor-nvme.git NO
https://github.com/openbmc/phosphor-objmgr.git YES, UNIT TEST
https://github.com/openbmc/phosphor-pcie-presence.git NO
https://github.com/openbmc/phosphor-pid-control.git YES, UNIT TEST
https://github.com/openbmc/phosphor-post-code-manager.git NO
https://github.com/openbmc/phosphor-power.git YES, COVERAGE
https://github.com/openbmc/phosphor-power-control.git NO
https://github.com/openbmc/phosphor-power-monitor.git NO
https://github.com/openbmc/phosphor-psu-code-mgmt.git YES, COVERAGE
https://github.com/openbmc/phosphor-rest-server.git NO
https://github.com/openbmc/phosphor-sel-logger.git NO
https://github.com/openbmc/phosphor-settingsd.git NO
https://github.com/openbmc/phosphor-snmp.git ERROR
https://github.com/openbmc/phosphor-state-manager.git YES, COVERAGE
https://github.com/openbmc/phosphor-time-manager.git YES, UNIT TEST
https://github.com/openbmc/phosphor-u-boot-env-mgr.git NO
https://github.com/openbmc/phosphor-user-manager.git YES, UNIT TEST
https://github.com/openbmc/phosphor-watchdog.git YES, COVERAGE
https://github.com/openbmc/phosphor-webui.git NO
https://github.com/openbmc/pldm.git YES, COVERAGE
https://github.com/openbmc/pyphosphor.git NO
https://github.com/openbmc/qualcomm-ipmi-oem.git NO
https://github.com/openbmc/qualcomm-misc.git NO
https://github.com/openbmc/quanta-ipmi-oem.git NO
https://github.com/openbmc/rest-dbus.git NO
https://github.com/openbmc/rrd-ipmi-blobs.git NO
https://github.com/openbmc/s2600wf-misc.git NO
https://github.com/openbmc/sdbusplus.git YES, UNIT TEST
https://github.com/openbmc/sdeventplus.git YES, COVERAGE
https://github.com/openbmc/skeleton.git ERROR
https://github.com/openbmc/slpd-lite.git NO
https://github.com/openbmc/smbios-mdr.git ERROR
https://github.com/openbmc/stdplus.git YES, COVERAGE
https://github.com/openbmc/telemetry.git NO
https://github.com/openbmc/u-boot NO
https://github.com/openbmc/webui-vue.git NO
https://github.com/openbmc/witherspoon-pfault-analysis.git YES, COVERAGE
https://github.com/openbmc/x86-power-control.git NO
*************************UNIT TEST COVERAGE REPORT*************************
SUMMARY:
TOTAL REPOSITORIES : 110
TESTED REPOSITORIES : 43
ERROR : 11
COVERAGE REPORT : 12
UNIT TEST REPORT : 31
NO REPORT : 56
***************************************************************************


Following actions, we can draw from above

   1. *There are 12 repo's that have GCOV/LCOV plugged in* - We need to
   maintain which has good coverage and try to improve those which has less
   coverage
   2. *There are 31 repo's that have unit test cases added but no coverage
   analysis because they aren't plugged in yet to GCOV/LCOV*  - Is there a
   plan for plugging in GCOV
   3. *There are 11 repo's which fail to compile and errors out* - Fix
   compilation issue. Some of these maybe not used currently?
   4. *There are 56 repo's for which there is no UT tests availabl*e  -
   This is a major issue we need to tackle and improve upon

Feedback's, views highly appreciated

Thanks & Regards,
Lakshminarayana Kamath
--------------------------------------------------------------------------------------------------
Senior Engineer,
IBM India Software Labs
Bangalore
github:lkammath
---------------------------------------------------------------------------------------------------

--000000000000bee820059fa50c74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi All,</div><div dir=3D"ltr"><br></div><=
div>Somehow my earlier mail did not get displayed properly<br></div>

<div dir=3D"ltr">=C2=A0</div>

<div dir=3D"ltr">Recently we worked on pulling the UT coverage analysis fro=
m all the available OpenBMC repositories</div>

<div dir=3D"ltr">=C2=A0</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/openbmc-build-script=
s/commit/229b76a95f87af60c976a0c0dfe84716c9ce5318" target=3D"_blank" rel=3D=
"noopener">https://github.com/openbmc/openbmc-build-scripts/commit/229b76a9=
5f87af60c976a0c0dfe84716c9ce5318</a></div>

<div dir=3D"ltr">=C2=A0</div>

<div dir=3D"ltr">This script does following</div>

<ol dir=3D"ltr"><li>Clone the repo</li><li>Use the CI build environment to =
build code</li><li>Publish the result in the following format</li></ol>

<div dir=3D"ltr">Latest report:</div>

<div dir=3D"ltr">*************************UNIT TEST COVERAGE REPORT********=
*****************</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/bmcweb.git" rel=3D"n=
oopener" target=3D"_blank">https://github.com/openbmc/bmcweb.git</a> NO</di=
v>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/boost-dbus.git" rel=
=3D"noopener" target=3D"_blank">https://github.com/openbmc/boost-dbus.git</=
a> ERROR</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/btbridge.git" rel=3D=
"noopener" target=3D"_blank">https://github.com/openbmc/btbridge.git</a> NO=
</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/dbus-sensors.git" re=
l=3D"noopener" target=3D"_blank">https://github.com/openbmc/dbus-sensors.gi=
t</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/entity-manager.git" =
rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/entity-manage=
r.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/fb-ipmi-oem.git" rel=
=3D"noopener" target=3D"_blank">https://github.com/openbmc/fb-ipmi-oem.git<=
/a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/google-ipmi-i2c.git"=
 rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/google-ipmi-=
i2c.git</a> ERROR</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/google-ipmi-sys.git"=
 rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/google-ipmi-=
sys.git</a> YES, UNIT TEST</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/gpioplus.git" rel=3D=
"noopener" target=3D"_blank">https://github.com/openbmc/gpioplus.git</a> YE=
S, COVERAGE</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/hiomapd.git" rel=3D"=
noopener" target=3D"_blank">https://github.com/openbmc/hiomapd.git</a> YES,=
 UNIT TEST</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/ibm-dbus-interfaces.=
git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/ibm-dbus=
-interfaces.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/ibm-logging.git" rel=
=3D"noopener" target=3D"_blank">https://github.com/openbmc/ibm-logging.git<=
/a> YES, UNIT TEST</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/ibm-pldm-oem.git" re=
l=3D"noopener" target=3D"_blank">https://github.com/openbmc/ibm-pldm-oem.gi=
t</a> ERROR</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/inarp.git" rel=3D"no=
opener" target=3D"_blank">https://github.com/openbmc/inarp.git</a> ERROR</d=
iv>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/intel-dbus-interface=
s.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/intel-=
dbus-interfaces.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/intel-ipmi-oem.git" =
rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/intel-ipmi-oe=
m.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/ipmbbridge.git" rel=
=3D"noopener" target=3D"_blank">https://github.com/openbmc/ipmbbridge.git</=
a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/ipmi-blob-tool.git" =
rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/ipmi-blob-too=
l.git</a> YES, UNIT TEST</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/ipmi-fru-parser.git"=
 rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/ipmi-fru-par=
ser.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/ipmitool.git" rel=3D=
"noopener" target=3D"_blank">https://github.com/openbmc/ipmitool.git</a> ER=
ROR</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/jsnbd.git" rel=3D"no=
opener" target=3D"_blank">https://github.com/openbmc/jsnbd.git</a> ERROR</d=
iv>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/kcsbridge.git" rel=
=3D"noopener" target=3D"_blank">https://github.com/openbmc/kcsbridge.git</a=
> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/lenovo-ipmi-oem.git"=
 rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/lenovo-ipmi-=
oem.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/libmctp.git" rel=3D"=
noopener" target=3D"_blank">https://github.com/openbmc/libmctp.git</a> YES,=
 UNIT TEST</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/librrdplus.git" rel=
=3D"noopener" target=3D"_blank">https://github.com/openbmc/librrdplus.git</=
a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/obmc-console.git" re=
l=3D"noopener" target=3D"_blank">https://github.com/openbmc/obmc-console.gi=
t</a> YES, UNIT TEST</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/obmc-ikvm.git" rel=
=3D"noopener" target=3D"_blank">https://github.com/openbmc/obmc-ikvm.git</a=
> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/openbmc.git" rel=3D"=
noopener" target=3D"_blank">https://github.com/openbmc/openbmc.git</a> NO</=
div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/openbmc-tools.git" r=
el=3D"noopener" target=3D"_blank">https://github.com/openbmc/openbmc-tools.=
git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/openbmc.github.io.gi=
t" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/openbmc.gi=
thub.io.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/openpower-dbus-inter=
faces.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/op=
enpower-dbus-interfaces.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/openpower-debug-coll=
ector.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/op=
enpower-debug-collector.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/openpower-host-ipmi-=
flash.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/op=
enpower-host-ipmi-flash.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/openpower-host-ipmi-=
oem.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/open=
power-host-ipmi-oem.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/openpower-hw-diags.g=
it" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/openpower=
-hw-diags.git</a> YES, COVERAGE</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/openpower-inventory-=
upload.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/o=
penpower-inventory-upload.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/openpower-libhei.git=
" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/openpower-l=
ibhei.git</a> YES, COVERAGE</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/openpower-logging.gi=
t" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/openpower-=
logging.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/openpower-occ-contro=
l.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/openpo=
wer-occ-control.git</a> YES, UNIT TEST</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/openpower-pnor-code-=
mgmt.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/ope=
npower-pnor-code-mgmt.git</a> YES, UNIT TEST</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/openpower-power-cont=
rol.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/open=
power-power-control.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/openpower-proc-contr=
ol.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/openp=
ower-proc-control.git</a> YES, UNIT TEST</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/openpower-sbe-interf=
ace.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/open=
power-sbe-interface.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/openpower-vpd-parser=
.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/openpow=
er-vpd-parser.git</a> YES, UNIT TEST</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/pam-ipmi.git" rel=3D=
"noopener" target=3D"_blank">https://github.com/openbmc/pam-ipmi.git</a> NO=
</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-bmc-code-mg=
mt.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosp=
hor-bmc-code-mgmt.git</a> YES, UNIT TEST</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-buttons.git=
" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosphor-bu=
ttons.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-certificate=
-manager.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc=
/phosphor-certificate-manager.git</a> YES, UNIT TEST</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-dbus-interf=
aces.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/pho=
sphor-dbus-interfaces.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-dbus-monito=
r.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosph=
or-dbus-monitor.git</a> YES, UNIT TEST</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-debug-colle=
ctor.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/pho=
sphor-debug-collector.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-ecc.git" re=
l=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosphor-ecc.gi=
t</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-event.git" =
rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosphor-even=
t.git</a> YES, UNIT TEST</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-fan-presenc=
e.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosph=
or-fan-presence.git</a> YES, UNIT TEST</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-gpio-monito=
r.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosph=
or-gpio-monitor.git</a> YES, COVERAGE</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-host-ipmid.=
git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosphor=
-host-ipmid.git</a> ERROR</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-host-postd.=
git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosphor=
-host-postd.git</a> YES, UNIT TEST</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-hostlogger.=
git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosphor=
-hostlogger.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-hwmon.git" =
rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosphor-hwmo=
n.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-inventory-m=
anager.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/p=
hosphor-inventory-manager.git</a> YES, UNIT TEST</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-ipmi-blobs.=
git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosphor=
-ipmi-blobs.git</a> YES, UNIT TEST</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-ipmi-blobs-=
binarystore.git" rel=3D"noopener" target=3D"_blank">https://github.com/open=
bmc/phosphor-ipmi-blobs-binarystore.git</a> YES, UNIT TEST</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-ipmi-ethsta=
ts.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosp=
hor-ipmi-ethstats.git</a> YES, UNIT TEST</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-ipmi-flash.=
git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosphor=
-ipmi-flash.git</a> YES, UNIT TEST</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-led-manager=
.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phospho=
r-led-manager.git</a> YES, UNIT TEST</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-led-sysfs.g=
it" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosphor-=
led-sysfs.git</a> YES, UNIT TEST</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-logging.git=
" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosphor-lo=
gging.git</a> YES, UNIT TEST</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-mboxd.git" =
rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosphor-mbox=
d.git</a> ERROR</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-misc.git" r=
el=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosphor-misc.=
git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-mrw-tools.g=
it" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosphor-=
mrw-tools.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-net-ipmid.g=
it" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosphor-=
net-ipmid.git</a> YES, UNIT TEST</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-networkd.gi=
t" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosphor-n=
etworkd.git</a> YES, UNIT TEST</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-nvme.git" r=
el=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosphor-nvme.=
git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-objmgr.git"=
 rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosphor-obj=
mgr.git</a> YES, UNIT TEST</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-pcie-presen=
ce.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosp=
hor-pcie-presence.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-pid-control=
.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phospho=
r-pid-control.git</a> YES, UNIT TEST</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-post-code-m=
anager.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/p=
hosphor-post-code-manager.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-power.git" =
rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosphor-powe=
r.git</a> YES, COVERAGE</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-power-contr=
ol.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosp=
hor-power-control.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-power-monit=
or.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosp=
hor-power-monitor.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-psu-code-mg=
mt.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosp=
hor-psu-code-mgmt.git</a> YES, COVERAGE</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-rest-server=
.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phospho=
r-rest-server.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-sel-logger.=
git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosphor=
-sel-logger.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-settingsd.g=
it" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosphor-=
settingsd.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-snmp.git" r=
el=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosphor-snmp.=
git</a> ERROR</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-state-manag=
er.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosp=
hor-state-manager.git</a> YES, COVERAGE</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-time-manage=
r.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosph=
or-time-manager.git</a> YES, UNIT TEST</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-u-boot-env-=
mgr.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phos=
phor-u-boot-env-mgr.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-user-manage=
r.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosph=
or-user-manager.git</a> YES, UNIT TEST</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-watchdog.gi=
t" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosphor-w=
atchdog.git</a> YES, COVERAGE</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/phosphor-webui.git" =
rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/phosphor-webu=
i.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/pldm.git" rel=3D"noo=
pener" target=3D"_blank">https://github.com/openbmc/pldm.git</a> YES, COVER=
AGE</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/pyphosphor.git" rel=
=3D"noopener" target=3D"_blank">https://github.com/openbmc/pyphosphor.git</=
a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/qualcomm-ipmi-oem.gi=
t" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/qualcomm-i=
pmi-oem.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/qualcomm-misc.git" r=
el=3D"noopener" target=3D"_blank">https://github.com/openbmc/qualcomm-misc.=
git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/quanta-ipmi-oem.git"=
 rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/quanta-ipmi-=
oem.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/rest-dbus.git" rel=
=3D"noopener" target=3D"_blank">https://github.com/openbmc/rest-dbus.git</a=
> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/rrd-ipmi-blobs.git" =
rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/rrd-ipmi-blob=
s.git</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/s2600wf-misc.git" re=
l=3D"noopener" target=3D"_blank">https://github.com/openbmc/s2600wf-misc.gi=
t</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/sdbusplus.git" rel=
=3D"noopener" target=3D"_blank">https://github.com/openbmc/sdbusplus.git</a=
> YES, UNIT TEST</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/sdeventplus.git" rel=
=3D"noopener" target=3D"_blank">https://github.com/openbmc/sdeventplus.git<=
/a> YES, COVERAGE</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/skeleton.git" rel=3D=
"noopener" target=3D"_blank">https://github.com/openbmc/skeleton.git</a> ER=
ROR</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/slpd-lite.git" rel=
=3D"noopener" target=3D"_blank">https://github.com/openbmc/slpd-lite.git</a=
> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/smbios-mdr.git" rel=
=3D"noopener" target=3D"_blank">https://github.com/openbmc/smbios-mdr.git</=
a> ERROR</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/stdplus.git" rel=3D"=
noopener" target=3D"_blank">https://github.com/openbmc/stdplus.git</a> YES,=
 COVERAGE</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/telemetry.git" rel=
=3D"noopener" target=3D"_blank">https://github.com/openbmc/telemetry.git</a=
> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/u-boot" rel=3D"noope=
ner" target=3D"_blank">https://github.com/openbmc/u-boot</a> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/webui-vue.git" rel=
=3D"noopener" target=3D"_blank">https://github.com/openbmc/webui-vue.git</a=
> NO</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/witherspoon-pfault-a=
nalysis.git" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/=
witherspoon-pfault-analysis.git</a> YES, COVERAGE</div>

<div dir=3D"ltr"><a href=3D"https://github.com/openbmc/x86-power-control.gi=
t" rel=3D"noopener" target=3D"_blank">https://github.com/openbmc/x86-power-=
control.git</a> NO</div>

<div dir=3D"ltr">*************************UNIT TEST COVERAGE REPORT********=
*****************</div>

<div dir=3D"ltr">SUMMARY:</div>

<div dir=3D"ltr">TOTAL REPOSITORIES : 110</div>

<div dir=3D"ltr">TESTED REPOSITORIES : 43</div>

<div dir=3D"ltr">ERROR : 11</div>

<div dir=3D"ltr">COVERAGE REPORT : 12</div>

<div dir=3D"ltr">UNIT TEST REPORT : 31</div>

<div dir=3D"ltr">NO REPORT : 56</div>

<div dir=3D"ltr">**********************************************************=
*****************</div>

<div dir=3D"ltr">=C2=A0</div>

<div dir=3D"ltr">
<p>Following actions, we can draw from above</p>

<ol><li><strong>There are 12 repo&#39;s that have GCOV/LCOV plugged in</str=
ong> - We need to maintain which has good coverage and try to improve those=
 which has less coverage</li><li><strong>There are 31 repo&#39;s that have =
unit test cases added but no coverage analysis because they aren&#39;t plug=
ged in yet to GCOV/LCOV</strong>=C2=A0 - Is there a plan for plugging in GC=
OV</li><li><b>There are 11 repo&#39;s which fail to compile and errors out<=
/b> - Fix compilation issue. Some of these maybe not used currently?</li><l=
i><b>There are 56 repo&#39;s for which there is no UT tests availabl</b>e=
=C2=A0 - This is a major issue we need to tackle and improve upon</li></ol>

<div>Feedback&#39;s, views highly appreciated</div>

<div>=C2=A0</div>
</div>

<div dir=3D"ltr">
<div dir=3D"ltr" style=3D"font-family:Arial,Helvetica,sans-serif;font-size:=
10pt">
<div dir=3D"ltr" style=3D"font-family:Arial,Helvetica,sans-serif;font-size:=
10.5pt">
<div dir=3D"ltr" style=3D"font-family:Arial,Helvetica,sans-serif;font-size:=
10.5pt">
<div dir=3D"ltr">Thanks &amp; Regards,<br>
Lakshminarayana Kamath<br>
---------------------------------------------------------------------------=
-----------------------<br>
Senior Engineer,</div>

<div dir=3D"ltr">IBM India Software Labs</div>

<div dir=3D"ltr">Bangalore</div>

<div dir=3D"ltr">github:lkammath<br>
---------------------------------------------------------------------------=
------------------------</div></div></div></div></div></div>

--000000000000bee820059fa50c74--
