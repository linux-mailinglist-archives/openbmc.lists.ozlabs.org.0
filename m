Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B50DB173CBA
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 17:19:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TZVR6HwnzDrDN
	for <lists+openbmc@lfdr.de>; Sat, 29 Feb 2020 03:19:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TZTj6HKTzDrBk
 for <openbmc@lists.ozlabs.org>; Sat, 29 Feb 2020 03:18:32 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=utf-8;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [OpenBMC]: Unit test coverage analysis on openbmc repositories
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
X-Priority: 3 (Normal)
In-Reply-To: <OFBAC0E531.E7E68FE5-ON0025851C.0053A4C8-0025851C.0055AA1E@notes.na.collabserv.com>
Date: Fri, 28 Feb 2020 11:18:28 -0500
Message-Id: <1B448D94-3C6C-42D5-991B-A6AFD720F999@fuzziesquirrel.com>
References: <OFBAC0E531.E7E68FE5-ON0025851C.0053A4C8-0025851C.0055AA1E@notes.na.collabserv.com>
To: Lakshminarayana R Kammath <lkammath@in.ibm.com>
Content-Transfer-Encoding: quoted-printable
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 10:35 AM, Lakshminarayana R Kammath <lkammath@in.ibm.com> wrote:

> Hi All,
>
> Recently we worked on pulling the UT coverage analysis from all the =20
> available OpenBMC repositories
>
> https://github.com/openbmc/openbmc-build-scripts/commit/229b76a95f87af6=
0c976a0c0dfe84716c9ce5318
>
> This script does following
> 	=E2=80=A2 Clone the repo
> 	=E2=80=A2 Use the CI build environment to build code
> 	=E2=80=A2 Publish the result in the following format
> Latest report:
> *************************UNIT TEST COVERAGE REPORT*********************=
****
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
> https://github.com/openbmc/phosphor-certificate-manager.git YES, UNIT T=
EST
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
> https://github.com/openbmc/phosphor-inventory-manager.git YES, UNIT TES=
T
> https://github.com/openbmc/phosphor-ipmi-blobs.git YES, UNIT TEST
> https://github.com/openbmc/phosphor-ipmi-blobs-binarystore.git YES, UNI=
T =20
> TEST
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
> https://github.com/openbmc/witherspoon-pfault-analysis.git YES, COVERAG=
E
> https://github.com/openbmc/x86-power-control.git NO
> *************************UNIT TEST COVERAGE REPORT*********************=
****
> SUMMARY:
> TOTAL REPOSITORIES : 110
> TESTED REPOSITORIES : 43
> ERROR : 11
> COVERAGE REPORT : 12
> UNIT TEST REPORT : 31
> NO REPORT : 56
> ***********************************************************************=
****

Very nice Lakshmi!

Some of the repos have been archived.  Can the script be updated to check=
 =20
for that and skip it if so?

boost-dbus, inarp are a couple - there are likely more.
