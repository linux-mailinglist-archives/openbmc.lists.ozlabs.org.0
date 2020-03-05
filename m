Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4E3179D4C
	for <lists+openbmc@lfdr.de>; Thu,  5 Mar 2020 02:26:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XtPv3x2dzDqjG
	for <lists+openbmc@lfdr.de>; Thu,  5 Mar 2020 12:26:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XtP60yrczDqhN
 for <openbmc@lists.ozlabs.org>; Thu,  5 Mar 2020 12:26:00 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Mar 2020 17:25:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,516,1574150400"; d="scan'208";a="258999891"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga002.jf.intel.com with ESMTP; 04 Mar 2020 17:25:56 -0800
Subject: Re: [OpenBMC]: Unit test coverage analysis on openbmc repositories
To: Patrick Venture <venture@google.com>,
 Lakshminarayana R Kammath <lkammath@in.ibm.com>
References: <OFBAC0E531.E7E68FE5-ON0025851C.0053A4C8-0025851C.0055AA1E@notes.na.collabserv.com>
 <CAO=notw9Gt2=meykgiff09finUnMtLNqnW1PLpwX4HESm4OXVA@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <5fb1c6f6-effe-1415-9c5c-f5f6706d7957@linux.intel.com>
Date: Wed, 4 Mar 2020 17:25:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAO=notw9Gt2=meykgiff09finUnMtLNqnW1PLpwX4HESm4OXVA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 2/28/20 10:20 AM, Patrick Venture wrote:
> On Fri, Feb 28, 2020 at 7:36 AM Lakshminarayana R Kammath
> <lkammath@in.ibm.com> wrote:
>>
>> Hi All,
>>
>> Recently we worked on pulling the UT coverage analysis from all the available OpenBMC repositories
>>
>> https://github.com/openbmc/openbmc-build-scripts/commit/229b76a95f87af60c976a0c0dfe84716c9ce5318
>>
>> This script does following
>>
>> Clone the repo
>> Use the CI build environment to build code
>> Publish the result in the following format
>>
>> Latest report:
>> *************************UNIT TEST COVERAGE REPORT*************************
>> https://github.com/openbmc/bmcweb.git NO
>> https://github.com/openbmc/boost-dbus.git ERROR
>> https://github.com/openbmc/btbridge.git NO
>> https://github.com/openbmc/dbus-sensors.git NO
>> https://github.com/openbmc/entity-manager.git NO
This has some tests:

https://github.com/openbmc/entity-manager/blob/master/test/test_entity-manager.cpp

>> https://github.com/openbmc/fb-ipmi-oem.git NO
>> https://github.com/openbmc/google-ipmi-i2c.git ERROR
>> https://github.com/openbmc/google-ipmi-sys.git YES, UNIT TEST
>> https://github.com/openbmc/gpioplus.git YES, COVERAGE
>> https://github.com/openbmc/hiomapd.git YES, UNIT TEST
>> https://github.com/openbmc/ibm-dbus-interfaces.git NO
>> https://github.com/openbmc/ibm-logging.git YES, UNIT TEST
>> https://github.com/openbmc/ibm-pldm-oem.git ERROR
>> https://github.com/openbmc/inarp.git ERROR
>> https://github.com/openbmc/intel-dbus-interfaces.git NO
>> https://github.com/openbmc/intel-ipmi-oem.git NO
So does this:
https://github.com/openbmc/intel-ipmi-oem/blob/master/tests/test_sensorcommands.cpp

>> https://github.com/openbmc/ipmbbridge.git NO
>> https://github.com/openbmc/ipmi-blob-tool.git YES, UNIT TEST
>> https://github.com/openbmc/ipmi-fru-parser.git NO
>> https://github.com/openbmc/ipmitool.git ERROR
>> https://github.com/openbmc/jsnbd.git ERROR
>> https://github.com/openbmc/kcsbridge.git NO
>> https://github.com/openbmc/lenovo-ipmi-oem.git NO
>> https://github.com/openbmc/libmctp.git YES, UNIT TEST
>> https://github.com/openbmc/librrdplus.git NO
>> https://github.com/openbmc/obmc-console.git YES, UNIT TEST
>> https://github.com/openbmc/obmc-ikvm.git NO
>> https://github.com/openbmc/openbmc.git NO
>> https://github.com/openbmc/openbmc-tools.git NO
>> https://github.com/openbmc/openbmc.github.io.git NO
>> https://github.com/openbmc/openpower-dbus-interfaces.git NO
>> https://github.com/openbmc/openpower-debug-collector.git NO
>> https://github.com/openbmc/openpower-host-ipmi-flash.git NO
>> https://github.com/openbmc/openpower-host-ipmi-oem.git NO
>> https://github.com/openbmc/openpower-hw-diags.git YES, COVERAGE
>> https://github.com/openbmc/openpower-inventory-upload.git NO
>> https://github.com/openbmc/openpower-libhei.git YES, COVERAGE
>> https://github.com/openbmc/openpower-logging.git NO
>> https://github.com/openbmc/openpower-occ-control.git YES, UNIT TEST
>> https://github.com/openbmc/openpower-pnor-code-mgmt.git YES, UNIT TEST
>> https://github.com/openbmc/openpower-power-control.git NO
>> https://github.com/openbmc/openpower-proc-control.git YES, UNIT TEST
>> https://github.com/openbmc/openpower-sbe-interface.git NO
>> https://github.com/openbmc/openpower-vpd-parser.git YES, UNIT TEST
>> https://github.com/openbmc/pam-ipmi.git NO
>> https://github.com/openbmc/phosphor-bmc-code-mgmt.git YES, UNIT TEST
>> https://github.com/openbmc/phosphor-buttons.git NO
>> https://github.com/openbmc/phosphor-certificate-manager.git YES, UNIT TEST
>> https://github.com/openbmc/phosphor-dbus-interfaces.git NO
>> https://github.com/openbmc/phosphor-dbus-monitor.git YES, UNIT TEST
>> https://github.com/openbmc/phosphor-debug-collector.git NO
>> https://github.com/openbmc/phosphor-ecc.git NO
>> https://github.com/openbmc/phosphor-event.git YES, UNIT TEST
>> https://github.com/openbmc/phosphor-fan-presence.git YES, UNIT TEST
>> https://github.com/openbmc/phosphor-gpio-monitor.git YES, COVERAGE
>> https://github.com/openbmc/phosphor-host-ipmid.git ERROR
>> https://github.com/openbmc/phosphor-host-postd.git YES, UNIT TEST
>> https://github.com/openbmc/phosphor-hostlogger.git NO
>> https://github.com/openbmc/phosphor-hwmon.git NO
> 
> ^---- This one should be YES, UNIT TEST.
> 
> Thanks for working on identifying missing coverage.  I wanted to point
> this out so you can take another swing at this, -- Thanks!
> 
>> https://github.com/openbmc/phosphor-inventory-manager.git YES, UNIT TEST
>> https://github.com/openbmc/phosphor-ipmi-blobs.git YES, UNIT TEST
>> https://github.com/openbmc/phosphor-ipmi-blobs-binarystore.git YES, UNIT TEST
>> https://github.com/openbmc/phosphor-ipmi-ethstats.git YES, UNIT TEST
>> https://github.com/openbmc/phosphor-ipmi-flash.git YES, UNIT TEST
>> https://github.com/openbmc/phosphor-led-manager.git YES, UNIT TEST
>> https://github.com/openbmc/phosphor-led-sysfs.git YES, UNIT TEST
>> https://github.com/openbmc/phosphor-logging.git YES, UNIT TEST
>> https://github.com/openbmc/phosphor-mboxd.git ERROR
>> https://github.com/openbmc/phosphor-misc.git NO
>> https://github.com/openbmc/phosphor-mrw-tools.git NO
>> https://github.com/openbmc/phosphor-net-ipmid.git YES, UNIT TEST
>> https://github.com/openbmc/phosphor-networkd.git YES, UNIT TEST
>> https://github.com/openbmc/phosphor-nvme.git NO
>> https://github.com/openbmc/phosphor-objmgr.git YES, UNIT TEST
>> https://github.com/openbmc/phosphor-pcie-presence.git NO
>> https://github.com/openbmc/phosphor-pid-control.git YES, UNIT TEST
>> https://github.com/openbmc/phosphor-post-code-manager.git NO
>> https://github.com/openbmc/phosphor-power.git YES, COVERAGE
>> https://github.com/openbmc/phosphor-power-control.git NO
>> https://github.com/openbmc/phosphor-power-monitor.git NO
>> https://github.com/openbmc/phosphor-psu-code-mgmt.git YES, COVERAGE
>> https://github.com/openbmc/phosphor-rest-server.git NO
>> https://github.com/openbmc/phosphor-sel-logger.git NO
>> https://github.com/openbmc/phosphor-settingsd.git NO
>> https://github.com/openbmc/phosphor-snmp.git ERROR
>> https://github.com/openbmc/phosphor-state-manager.git YES, COVERAGE
>> https://github.com/openbmc/phosphor-time-manager.git YES, UNIT TEST
>> https://github.com/openbmc/phosphor-u-boot-env-mgr.git NO
>> https://github.com/openbmc/phosphor-user-manager.git YES, UNIT TEST
>> https://github.com/openbmc/phosphor-watchdog.git YES, COVERAGE
>> https://github.com/openbmc/phosphor-webui.git NO
>> https://github.com/openbmc/pldm.git YES, COVERAGE
>> https://github.com/openbmc/pyphosphor.git NO
>> https://github.com/openbmc/qualcomm-ipmi-oem.git NO
>> https://github.com/openbmc/qualcomm-misc.git NO
>> https://github.com/openbmc/quanta-ipmi-oem.git NO
>> https://github.com/openbmc/rest-dbus.git NO
>> https://github.com/openbmc/rrd-ipmi-blobs.git NO
>> https://github.com/openbmc/s2600wf-misc.git NO
>> https://github.com/openbmc/sdbusplus.git YES, UNIT TEST
>> https://github.com/openbmc/sdeventplus.git YES, COVERAGE
>> https://github.com/openbmc/skeleton.git ERROR
>> https://github.com/openbmc/slpd-lite.git NO
>> https://github.com/openbmc/smbios-mdr.git ERROR
>> https://github.com/openbmc/stdplus.git YES, COVERAGE
>> https://github.com/openbmc/telemetry.git NO
>> https://github.com/openbmc/u-boot NO
>> https://github.com/openbmc/webui-vue.git NO
>> https://github.com/openbmc/witherspoon-pfault-analysis.git YES, COVERAGE
>> https://github.com/openbmc/x86-power-control.git NO
>> *************************UNIT TEST COVERAGE REPORT*************************
>> SUMMARY:
>> TOTAL REPOSITORIES : 110
>> TESTED REPOSITORIES : 43
>> ERROR : 11
>> COVERAGE REPORT : 12
>> UNIT TEST REPORT : 31
>> NO REPORT : 56
>> ***************************************************************************
>>
>>
>> Following actions, we can draw from above
>>
>> There are 12 repo's that have GCOV/LCOV plugged in - We need to maintain which has good coverage and try to improve those which has less coverage
>> There are 31 repo's that have unit test cases added but no coverage analysis because they aren't plugged in yet to GCOV/LCOV  - Is there a plan for plugging in GCOV
>> There are 11 repo's which fail to compile and errors out - Fix compilation issue. Some of these maybe not used currently?
>> There are 56 repo's for which there is no UT tests available  - This is a major issue we need to tackle and improve upon
>>
>> Feedback's , views highly appreciated
>>
>> Thanks & Regards,
>> Lakshminarayana Kamath
>> --------------------------------------------------------------------------------------------------
>> Senior Engineer,
>> IBM India Software Labs
>> Bangalore
>> github:lkammath
>> ---------------------------------------------------------------------------------------------------
>>
>>
