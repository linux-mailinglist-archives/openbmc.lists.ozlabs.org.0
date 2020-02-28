Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7DF173F71
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 19:21:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TdD14Pq9zDrNm
	for <lists+openbmc@lfdr.de>; Sat, 29 Feb 2020 05:21:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=nipoy2y2; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TdCD4qmwzDr7D
 for <openbmc@lists.ozlabs.org>; Sat, 29 Feb 2020 05:21:11 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id p14so2121730pfn.4
 for <openbmc@lists.ozlabs.org>; Fri, 28 Feb 2020 10:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yyMO+OhpwfoIk5H1BIjuTuLhEF4phOzWOuFeuUDJrqQ=;
 b=nipoy2y2f2EIpP8+25IXDuwCt98aByR3L9oKBjRsVqgYnVVglz2BOgiq/AT5JRmqjW
 W3Kpmj474/YKlBYSyjKYbWvJ3AK0rxpw9yLurvBhUb6II61iIsZkGlxkswwHAczx5DBW
 vVZ8qHOME8Px7lVfnwp7Ttx5SGYKEe655dt8SFHQ3i8H4vGUB0YUa5QpJvMrArbq4iN3
 yRZRyU52wI8N5Dm2vGJRMgUBpI9tJ4TPYKSqskRtvcq/li86s8So/D4KP+TE0O8mI4sd
 fINIUn2Kwd1NNTzfXTtlcIfEl1pkRiOM+eqKgJNIC/b29cdrX1sN3QE3Oh2ysvP3AkrT
 VVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yyMO+OhpwfoIk5H1BIjuTuLhEF4phOzWOuFeuUDJrqQ=;
 b=ffZgAECXt+3MJ/S/b0sJzCg44Pa9jqTvyyi1y5Wywa5A8VxhFGaLa7HbQMJWlqDEcz
 er5kFRRdf8du7MfawG/vyhXVi6GbJa+zPe699ss+vj5uoBO/P4lNi/CSeKojdRmdEEOP
 SjtXPfLUVN4TLOqPc4lhc2fTqUcXj9u5CL84OvJcWmBb1sYNqVgsRJFZN6O1iiaH3Dw1
 6Pb25jhrg0VOFjugiIrA+vmvrE/uDw2KNZmrOsJXKJCZ9nuCzWNiNHG0/FT0tNrpdHxN
 RakXvOv7PXLj1GDW0ZS2pWo/fHGgkv8shNT4DgW51EUDr1H8+ZxqMN0rkurYo9Ws5zsm
 4Qpg==
X-Gm-Message-State: APjAAAXdTJKLRpbuaHKAle12gsXZwss6BAhFasFUJPojHZBDvFxTNNXn
 XhogT5k8hMdWkcNqQwYGlBn2Yo/sweSOmCpPbdvxZg==
X-Google-Smtp-Source: APXvYqzK6zREfUv+t3t994oZmwuydoxp+ZmSXfJWJLu596YpZqB3xuUD9eqAS3Jm/XnJ4gfWUazl+qADVLlOv3Wu+4E=
X-Received: by 2002:a62:1456:: with SMTP id 83mr5727389pfu.186.1582914067453; 
 Fri, 28 Feb 2020 10:21:07 -0800 (PST)
MIME-Version: 1.0
References: <OFBAC0E531.E7E68FE5-ON0025851C.0053A4C8-0025851C.0055AA1E@notes.na.collabserv.com>
In-Reply-To: <OFBAC0E531.E7E68FE5-ON0025851C.0053A4C8-0025851C.0055AA1E@notes.na.collabserv.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 28 Feb 2020 10:20:56 -0800
Message-ID: <CAO=notw9Gt2=meykgiff09finUnMtLNqnW1PLpwX4HESm4OXVA@mail.gmail.com>
Subject: Re: [OpenBMC]: Unit test coverage analysis on openbmc repositories
To: Lakshminarayana R Kammath <lkammath@in.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Feb 28, 2020 at 7:36 AM Lakshminarayana R Kammath
<lkammath@in.ibm.com> wrote:
>
> Hi All,
>
> Recently we worked on pulling the UT coverage analysis from all the available OpenBMC repositories
>
> https://github.com/openbmc/openbmc-build-scripts/commit/229b76a95f87af60c976a0c0dfe84716c9ce5318
>
> This script does following
>
> Clone the repo
> Use the CI build environment to build code
> Publish the result in the following format
>
> Latest report:
> *************************UNIT TEST COVERAGE REPORT*************************
> https://github.com/openbmc/bmcweb.git NO
> https://github.com/openbmc/boost-dbus.git ERROR
> https://github.com/openbmc/btbridge.git NO
> https://github.com/openbmc/dbus-sensors.git NO
> https://github.com/openbmc/entity-manager.git NO
> https://github.com/openbmc/fb-ipmi-oem.git NO
> https://github.com/openbmc/google-ipmi-i2c.git ERROR
> https://github.com/openbmc/google-ipmi-sys.git YES, UNIT TEST
> https://github.com/openbmc/gpioplus.git YES, COVERAGE
> https://github.com/openbmc/hiomapd.git YES, UNIT TEST
> https://github.com/openbmc/ibm-dbus-interfaces.git NO
> https://github.com/openbmc/ibm-logging.git YES, UNIT TEST
> https://github.com/openbmc/ibm-pldm-oem.git ERROR
> https://github.com/openbmc/inarp.git ERROR
> https://github.com/openbmc/intel-dbus-interfaces.git NO
> https://github.com/openbmc/intel-ipmi-oem.git NO
> https://github.com/openbmc/ipmbbridge.git NO
> https://github.com/openbmc/ipmi-blob-tool.git YES, UNIT TEST
> https://github.com/openbmc/ipmi-fru-parser.git NO
> https://github.com/openbmc/ipmitool.git ERROR
> https://github.com/openbmc/jsnbd.git ERROR
> https://github.com/openbmc/kcsbridge.git NO
> https://github.com/openbmc/lenovo-ipmi-oem.git NO
> https://github.com/openbmc/libmctp.git YES, UNIT TEST
> https://github.com/openbmc/librrdplus.git NO
> https://github.com/openbmc/obmc-console.git YES, UNIT TEST
> https://github.com/openbmc/obmc-ikvm.git NO
> https://github.com/openbmc/openbmc.git NO
> https://github.com/openbmc/openbmc-tools.git NO
> https://github.com/openbmc/openbmc.github.io.git NO
> https://github.com/openbmc/openpower-dbus-interfaces.git NO
> https://github.com/openbmc/openpower-debug-collector.git NO
> https://github.com/openbmc/openpower-host-ipmi-flash.git NO
> https://github.com/openbmc/openpower-host-ipmi-oem.git NO
> https://github.com/openbmc/openpower-hw-diags.git YES, COVERAGE
> https://github.com/openbmc/openpower-inventory-upload.git NO
> https://github.com/openbmc/openpower-libhei.git YES, COVERAGE
> https://github.com/openbmc/openpower-logging.git NO
> https://github.com/openbmc/openpower-occ-control.git YES, UNIT TEST
> https://github.com/openbmc/openpower-pnor-code-mgmt.git YES, UNIT TEST
> https://github.com/openbmc/openpower-power-control.git NO
> https://github.com/openbmc/openpower-proc-control.git YES, UNIT TEST
> https://github.com/openbmc/openpower-sbe-interface.git NO
> https://github.com/openbmc/openpower-vpd-parser.git YES, UNIT TEST
> https://github.com/openbmc/pam-ipmi.git NO
> https://github.com/openbmc/phosphor-bmc-code-mgmt.git YES, UNIT TEST
> https://github.com/openbmc/phosphor-buttons.git NO
> https://github.com/openbmc/phosphor-certificate-manager.git YES, UNIT TEST
> https://github.com/openbmc/phosphor-dbus-interfaces.git NO
> https://github.com/openbmc/phosphor-dbus-monitor.git YES, UNIT TEST
> https://github.com/openbmc/phosphor-debug-collector.git NO
> https://github.com/openbmc/phosphor-ecc.git NO
> https://github.com/openbmc/phosphor-event.git YES, UNIT TEST
> https://github.com/openbmc/phosphor-fan-presence.git YES, UNIT TEST
> https://github.com/openbmc/phosphor-gpio-monitor.git YES, COVERAGE
> https://github.com/openbmc/phosphor-host-ipmid.git ERROR
> https://github.com/openbmc/phosphor-host-postd.git YES, UNIT TEST
> https://github.com/openbmc/phosphor-hostlogger.git NO
> https://github.com/openbmc/phosphor-hwmon.git NO

^---- This one should be YES, UNIT TEST.

Thanks for working on identifying missing coverage.  I wanted to point
this out so you can take another swing at this, -- Thanks!

> https://github.com/openbmc/phosphor-inventory-manager.git YES, UNIT TEST
> https://github.com/openbmc/phosphor-ipmi-blobs.git YES, UNIT TEST
> https://github.com/openbmc/phosphor-ipmi-blobs-binarystore.git YES, UNIT TEST
> https://github.com/openbmc/phosphor-ipmi-ethstats.git YES, UNIT TEST
> https://github.com/openbmc/phosphor-ipmi-flash.git YES, UNIT TEST
> https://github.com/openbmc/phosphor-led-manager.git YES, UNIT TEST
> https://github.com/openbmc/phosphor-led-sysfs.git YES, UNIT TEST
> https://github.com/openbmc/phosphor-logging.git YES, UNIT TEST
> https://github.com/openbmc/phosphor-mboxd.git ERROR
> https://github.com/openbmc/phosphor-misc.git NO
> https://github.com/openbmc/phosphor-mrw-tools.git NO
> https://github.com/openbmc/phosphor-net-ipmid.git YES, UNIT TEST
> https://github.com/openbmc/phosphor-networkd.git YES, UNIT TEST
> https://github.com/openbmc/phosphor-nvme.git NO
> https://github.com/openbmc/phosphor-objmgr.git YES, UNIT TEST
> https://github.com/openbmc/phosphor-pcie-presence.git NO
> https://github.com/openbmc/phosphor-pid-control.git YES, UNIT TEST
> https://github.com/openbmc/phosphor-post-code-manager.git NO
> https://github.com/openbmc/phosphor-power.git YES, COVERAGE
> https://github.com/openbmc/phosphor-power-control.git NO
> https://github.com/openbmc/phosphor-power-monitor.git NO
> https://github.com/openbmc/phosphor-psu-code-mgmt.git YES, COVERAGE
> https://github.com/openbmc/phosphor-rest-server.git NO
> https://github.com/openbmc/phosphor-sel-logger.git NO
> https://github.com/openbmc/phosphor-settingsd.git NO
> https://github.com/openbmc/phosphor-snmp.git ERROR
> https://github.com/openbmc/phosphor-state-manager.git YES, COVERAGE
> https://github.com/openbmc/phosphor-time-manager.git YES, UNIT TEST
> https://github.com/openbmc/phosphor-u-boot-env-mgr.git NO
> https://github.com/openbmc/phosphor-user-manager.git YES, UNIT TEST
> https://github.com/openbmc/phosphor-watchdog.git YES, COVERAGE
> https://github.com/openbmc/phosphor-webui.git NO
> https://github.com/openbmc/pldm.git YES, COVERAGE
> https://github.com/openbmc/pyphosphor.git NO
> https://github.com/openbmc/qualcomm-ipmi-oem.git NO
> https://github.com/openbmc/qualcomm-misc.git NO
> https://github.com/openbmc/quanta-ipmi-oem.git NO
> https://github.com/openbmc/rest-dbus.git NO
> https://github.com/openbmc/rrd-ipmi-blobs.git NO
> https://github.com/openbmc/s2600wf-misc.git NO
> https://github.com/openbmc/sdbusplus.git YES, UNIT TEST
> https://github.com/openbmc/sdeventplus.git YES, COVERAGE
> https://github.com/openbmc/skeleton.git ERROR
> https://github.com/openbmc/slpd-lite.git NO
> https://github.com/openbmc/smbios-mdr.git ERROR
> https://github.com/openbmc/stdplus.git YES, COVERAGE
> https://github.com/openbmc/telemetry.git NO
> https://github.com/openbmc/u-boot NO
> https://github.com/openbmc/webui-vue.git NO
> https://github.com/openbmc/witherspoon-pfault-analysis.git YES, COVERAGE
> https://github.com/openbmc/x86-power-control.git NO
> *************************UNIT TEST COVERAGE REPORT*************************
> SUMMARY:
> TOTAL REPOSITORIES : 110
> TESTED REPOSITORIES : 43
> ERROR : 11
> COVERAGE REPORT : 12
> UNIT TEST REPORT : 31
> NO REPORT : 56
> ***************************************************************************
>
>
> Following actions, we can draw from above
>
> There are 12 repo's that have GCOV/LCOV plugged in - We need to maintain which has good coverage and try to improve those which has less coverage
> There are 31 repo's that have unit test cases added but no coverage analysis because they aren't plugged in yet to GCOV/LCOV  - Is there a plan for plugging in GCOV
> There are 11 repo's which fail to compile and errors out - Fix compilation issue. Some of these maybe not used currently?
> There are 56 repo's for which there is no UT tests available  - This is a major issue we need to tackle and improve upon
>
> Feedback's , views highly appreciated
>
> Thanks & Regards,
> Lakshminarayana Kamath
> --------------------------------------------------------------------------------------------------
> Senior Engineer,
> IBM India Software Labs
> Bangalore
> github:lkammath
> ---------------------------------------------------------------------------------------------------
>
>
