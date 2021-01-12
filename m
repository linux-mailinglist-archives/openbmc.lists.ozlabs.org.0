Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CA32F37DB
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 19:04:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFdkd653rzDrQg
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 05:04:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=eLDde/02; dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFdjc10dLzDr4F
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 05:03:31 +1100 (AEDT)
Received: by mail-yb1-xb33.google.com with SMTP id b64so2966823ybg.7
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 10:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zDI0MbIgVUI8vvM74y78Vs1gLAQ5upjXK8Mq++5gpa0=;
 b=eLDde/02qAzpCp5EzFAGy9Q2RgPr/D+0Zh6yIiRGCUIKPwwJBhUMR/p0ppxvCFqMLo
 IwTI7ZFNxwvQSBZapzOkcjq1SqJayHffFQS3IA0iPCbW51REeEQD4ozpBSiqq94Vpgn5
 8WjEOQyqbIdAjT4PFld0XGqmyhuz9tEgudBN2VoarEYCk5f520GT7VVgIKOjGr48IVha
 8uavWItjDGDoUCZttYsAYGJTuIgV/RQJXD5PvVRdJ2mT6ZubDt0w0LgphwnS57+V5q83
 Fmj/eCsfqBiz/jWD6PJ4N23v67ooq7T3M+1l6FPI7OcvVmESMTT7k9Wgi4WY303MPJIL
 jltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zDI0MbIgVUI8vvM74y78Vs1gLAQ5upjXK8Mq++5gpa0=;
 b=Yc4TOGwAi/uwAjHBw4a7ziv/vn1S3MKo5JlmeuC5jJ1tpuZF8aAg4YeZcclx+GAIno
 gSMhmFGg/Ks/XIubsP2d/hAbhBkQR8ydxAnHWzW1CKbri2PRyX/Y0f9bzkv07tC7dzLC
 bsBSQ1d4pv3oV1WD6WNtlp30qr9H52FIs8yAGZOvX+L1JRNWvrD03uNarjclvcU29XyE
 lkdCnruERTLj0ZHNpJNSr9t+XFfwbPnK7KZLyG3gdCLRM9sPe53kdITItT52NSVEZQZd
 s/M5+IlP5BvLSi45bTrdW0EPjq/5niKlGNAOxKT9Gi8PmdOvAjL3OsYHG2U/2hwCOOTU
 xieg==
X-Gm-Message-State: AOAM530yLUCcAWl3bAo0S2ZNPgUq4h26QLTpDHYNf/hD3jklPJFlWAzt
 Mnjr8Tjh0VYUQe/zPsf/RdVLuUU2DkfKyNlKHx3b9A==
X-Google-Smtp-Source: ABdhPJzTBHzFMLgXuIBhrcDSHlXbScFt3G37H60zdPdeyqJ2tuIJycjRRlNmVyqoUnuXbzvvNK4lA4WUrcM99iwt0Xs=
X-Received: by 2002:a25:3f41:: with SMTP id m62mr758924yba.209.1610474606717; 
 Tue, 12 Jan 2021 10:03:26 -0800 (PST)
MIME-Version: 1.0
References: <aec974a0-d983-0a41-d5b3-3574432bc2eb@linux.intel.com>
In-Reply-To: <aec974a0-d983-0a41-d5b3-3574432bc2eb@linux.intel.com>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 12 Jan 2021 10:03:15 -0800
Message-ID: <CACWQX82qCM1r_oFNVrMMdp0TTZCYBQPMnvZcX_3dcRj0jbxZ_g@mail.gmail.com>
Subject: Re: phosphor-debug-collector build issues
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jan 12, 2021 at 9:31 AM Bills, Jason M
<jason.m.bills@linux.intel.com> wrote:
>
> Hi All,
>
> Is anyone else seeing build errors in phosphor-debug-collector?
>


Not sure if this is the same, but it looks like the IBM oem properties
within libpldmresponder don't build?

FAILED: libpldmresponder/1b80d8d@@pldmresponder@sha/.._oem_ibm_libpldmresponder_file_io_type_dump.cpp.o
c++ -Ilibpldmresponder/1b80d8d@@pldmresponder@sha -Ilibpldmresponder
-I../libpldmresponder -Ilibpldm -I../libpldm -I. -I.. -I../oem/ibm
-I../libpldm/requester -I/usr/local/include -fdiagnostics-color=always
-pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wnon-virtual-dtor
-Wextra -Wpedantic -Werror -std=c++17 -g -Wno-psabi -DOEM_IBM -fPIC
-MD -MQ 'libpldmresponder/1b80d8d@@pldmresponder@sha/.._oem_ibm_libpldmresponder_file_io_type_dump.cpp.o'
-MF 'libpldmresponder/1b80d8d@@pldmresponder@sha/.._oem_ibm_libpldmresponder_file_io_type_dump.cpp.o.d'
-o 'libpldmresponder/1b80d8d@@pldmresponder@sha/.._oem_ibm_libpldmresponder_file_io_type_dump.cpp.o'
-c ../oem/ibm/libpldmresponder/file_io_type_dump.cpp
../oem/ibm/libpldmresponder/file_io_type_dump.cpp: In member function
'virtual int pldm::responder::DumpHandler::newFileAvailable(uint64_t)':
../oem/ibm/libpldmresponder/file_io_type_dump.cpp:86:60: error:
'convertForMessage' is not a member of
'sdbusplus::xyz::openbmc_project::Dump::server'
   86 |
sdbusplus::xyz::openbmc_project::Dump::server::convertForMessage(
      |
^~~~~~~~~~~~~~~~~

https://jenkins.openbmc.org/job/ci-repository/10835/consoleText

Does anyone have any idea what needs reverted?

If not, I can go dig in and do the bisect.

> When I build in Yocto, I get this error:
>
> | In file included from
> ../../../../../../workspace/sources/phosphor-debug-collector/dump_manager_main.cpp:6:
> |
> ../../../../../../workspace/sources/phosphor-debug-collector/dump_manager_bmc.hpp:98:9:
> error: 'sdbusplus::message::object_path
> phosphor::dump::bmc::Manager::createDump(std::map<std::__cxx11::basic_string<char>,
> std::__cxx11::basic_string<char> >)' marked 'override', but does not
> override
> |    98 |         createDump(std::map<std::string, std::string> params)
> override;
> |       |         ^~~~~~~~~~
> | In file included from
> /home/jmbills/openbmc-openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-debug-collector/1.0+git999-r1/recipe-sysroot/usr/include/c++/10.2.0/memory:83,
> |                  from
> /home/jmbills/openbmc-openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-debug-collector/1.0+git999-r1/recipe-sysroot/usr/include/sdbusplus/message.hpp:11,
> |                  from
> /home/jmbills/openbmc-openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-debug-collector/1.0+git999-r1/recipe-sysroot/usr/include/sdbusplus/bus.hpp:7,
> |                  from
> /home/jmbills/openbmc-openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-debug-collector/1.0+git999-r1/recipe-sysroot/usr/include/sdbusplus/server.hpp:3,
> |                  from
> /home/jmbills/openbmc-openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-debug-collector/1.0+git999-r1/recipe-sysroot/usr/include/xyz/openbmc_project/Common/Progress/server.hpp:5,
> |                  from
> ../../../../../../workspace/sources/phosphor-debug-collector/dump_entry.hpp:3,
> |                  from
> ../../../../../../workspace/sources/phosphor-debug-collector/dump_manager.hpp:3,
> |                  from
> ../../../../../../workspace/sources/phosphor-debug-collector/dump-extensions.hpp:1,
> |                  from
> ../../../../../../workspace/sources/phosphor-debug-collector/dump_manager_main.cpp:3:
> |
> /home/jmbills/openbmc-openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-debug-collector/1.0+git999-r1/recipe-sysroot/usr/include/c++/10.2.0/bits/unique_ptr.h:
> In instantiation of 'typename std::_MakeUniq<_Tp>::__single_object
> std::make_unique(_Args&& ...) [with _Tp = phosphor::dump::bmc::Manager;
> _Args = {sdbusplus::bus::bus&, std::unique_ptr<sd_event,
> phosphor::dump::EventDeleter>&, const char (&)[30], const char (&)[36],
> const char (&)[40]}; typename std::_MakeUniq<_Tp>::__single_object =
> std::unique_ptr<phosphor::dump::bmc::Manager>]':
> |
> ../../../../../../workspace/sources/phosphor-debug-collector/dump_manager_main.cpp:68:30:
>    required from here
> |
> /home/jmbills/openbmc-openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-debug-collector/1.0+git999-r1/recipe-sysroot/usr/include/c++/10.2.0/bits/unique_ptr.h:962:30:
> error: invalid new-expression of abstract class type
> 'phosphor::dump::bmc::Manager'
> |   962 |     { return unique_ptr<_Tp>(new
> _Tp(std::forward<_Args>(__args)...)); }
> |       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> | In file included from
> ../../../../../../workspace/sources/phosphor-debug-collector/dump_manager_main.cpp:6:
> |
> ../../../../../../workspace/sources/phosphor-debug-collector/dump_manager_bmc.hpp:48:7:
> note:   because the following virtual functions are pure within
> 'phosphor::dump::bmc::Manager':
> |    48 | class Manager : virtual public CreateIface,
> |       |       ^~~~~~~
> | In file included from
> ../../../../../../workspace/sources/phosphor-debug-collector/dump_manager_bmc.hpp:9,
> |                  from
> ../../../../../../workspace/sources/phosphor-debug-collector/dump_manager_main.cpp:6:
> |
> /home/jmbills/openbmc-openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-debug-collector/1.0+git999-r1/recipe-sysroot/usr/include/xyz/openbmc_project/Dump/Create/server.hpp:55:26:
> note:     'virtual uint32_t
> sdbusplus::xyz::openbmc_project::Dump::server::Create::createDump()'
> |    55 |         virtual uint32_t createDump(
> |       |                          ^~~~~~~~~~
>
>
> When I build using openbmc-build-scripts/run-unit-test-docker.sh, I get
> this error:
>
> FAILED:
> libpldmresponder/1b80d8d@@pldmresponder@sha/.._oem_ibm_libpldmresponder_file_io_type_dump.cpp.o
> c++ -Ilibpldmresponder/1b80d8d@@pldmresponder@sha -Ilibpldmresponder
> -I../libpldmresponder -Ilibpldm -I../libpldm -I. -I.. -I../oem/ibm
> -I../libpldm/requester -I/usr/local/include -fdiagnostics-color=always
> -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wnon-virtual-dtor
> -Wextra -Wpedantic -Werror -std=c++17 -g -Wno-psabi -DOEM_IBM -fPIC -MD
> -MQ
> 'libpldmresponder/1b80d8d@@pldmresponder@sha/.._oem_ibm_libpldmresponder_file_io_type_dump.cpp.o'
> -MF
> 'libpldmresponder/1b80d8d@@pldmresponder@sha/.._oem_ibm_libpldmresponder_file_io_type_dump.cpp.o.d'
> -o
> 'libpldmresponder/1b80d8d@@pldmresponder@sha/.._oem_ibm_libpldmresponder_file_io_type_dump.cpp.o'
> -c ../oem/ibm/libpldmresponder/file_io_type_dump.cpp
> ../oem/ibm/libpldmresponder/file_io_type_dump.cpp: In member function
> 'virtual int pldm::responder::DumpHandler::newFileAvailable(uint64_t)':
> ../oem/ibm/libpldmresponder/file_io_type_dump.cpp:86:60: error:
> 'convertForMessage' is not a member of
> 'sdbusplus::xyz::openbmc_project::Dump::server'
>     86 |
> sdbusplus::xyz::openbmc_project::Dump::server::convertForMessage(
>        |
> ^~~~~~~~~~~~~~~~~
> ../oem/ibm/libpldmresponder/file_io_type_dump.cpp:86:60: note: suggested
> alternatives:
> In file included from /usr/local/include/sdbusplus/server.hpp:14,
>                   from ../common/utils.hpp:12,
>                   from ../oem/ibm/libpldmresponder/file_io.hpp:9,
>                   from ../oem/ibm/libpldmresponder/file_io_by_type.hpp:3,
>                   from ../oem/ibm/libpldmresponder/file_io_type_dump.hpp:3,
>                   from ../oem/ibm/libpldmresponder/file_io_type_dump.cpp:1:
> /usr/local/include/sdbusplus/server/bindings.hpp:21:5: note:
> 'sdbusplus::server::binding::details::convertForMessage'
>     21 | T&& convertForMessage(T&& t)
>        |     ^~~~~~~~~~~~~~~~~
> In file included from ../common/utils.hpp:13,
>                   from ../oem/ibm/libpldmresponder/file_io.hpp:9,
>                   from ../oem/ibm/libpldmresponder/file_io_by_type.hpp:3,
>                   from ../oem/ibm/libpldmresponder/file_io_type_dump.hpp:3,
>                   from ../oem/ibm/libpldmresponder/file_io_type_dump.cpp:1:
> /usr/local/include/xyz/openbmc_project/Logging/Entry/server.hpp:268:20:
> note:
> 'sdbusplus::xyz::openbmc_project::Logging::server::convertForMessage'
>    268 | inline std::string convertForMessage(Entry::Level e)
>        |                    ^~~~~~~~~~~~~~~~~
> ../oem/ibm/libpldmresponder/file_io_type_dump.cpp:87:26: error:
> 'sdbusplus::xyz::openbmc_project::Dump::server::NewDump::DumpType' has
> not been declared
>     87 |                 NewDump::DumpType::System),
>        |                          ^~~~~~~~
> [23/63] Compiling C++ object
> 'libpldmresponder/1b80d8d@@pldmresponder@sha/.._oem_ibm_libpldmresponder_platform_oem_ibm.cpp.o'
> [24/63] Compiling C++ object
> 'libpldmresponder/1b80d8d@@pldmresponder@sha/.._oem_ibm_libpldmresponder_file_io_by_type.cpp.o'
> [25/63] Compiling C++ object
> 'libpldmresponder/1b80d8d@@pldmresponder@sha/bios_integer_attribute.cpp.o'
> [26/63] Compiling C++ object
> 'libpldmresponder/1b80d8d@@pldmresponder@sha/pdr.cpp.o'
> [27/63] Compiling C++ object
> 'libpldmresponder/1b80d8d@@pldmresponder@sha/bios_string_attribute.cpp.o'
> [28/63] Compiling C++ object
> 'libpldmresponder/1b80d8d@@pldmresponder@sha/.._oem_ibm_libpldmresponder_file_io.cpp.o'
> [29/63] Compiling C++ object
> 'libpldmresponder/1b80d8d@@pldmresponder@sha/bios_attribute.cpp.o'
> [30/63] Compiling C++ object
> 'libpldmresponder/1b80d8d@@pldmresponder@sha/.._oem_ibm_libpldmresponder_file_io_type_pel.cpp.o'
> [31/63] Compiling C++ object
> 'libpldmresponder/1b80d8d@@pldmresponder@sha/.._oem_ibm_libpldmresponder_file_table.cpp.o'
> [32/63] Compiling C++ object
> 'libpldmresponder/1b80d8d@@pldmresponder@sha/bios.cpp.o'
> [33/63] Compiling C++ object
> 'softoff/59fd39a@@pldm-softpoweroff@exe/softoff.cpp.o'
> [34/63] Compiling C++ object
> 'libpldmresponder/1b80d8d@@pldmresponder@sha/pdr_utils.cpp.o'
> [35/63] Compiling C++ object
> 'libpldmresponder/1b80d8d@@pldmresponder@sha/bios_enum_attribute.cpp.o'
> [36/63] Compiling C++ object
> 'libpldmresponder/1b80d8d@@pldmresponder@sha/fru_parser.cpp.o'
> [37/63] Compiling C++ object
> 'libpldmresponder/1b80d8d@@pldmresponder@sha/event_parser.cpp.o'
> [38/63] Compiling C++ object
> 'utilities/abe2c41@@set-state-effecter@exe/requester_set_state_effecter.cpp.o'
> [39/63] Compiling C++ object
> 'utilities/abe2c41@@set-state-effecter-async@exe/requester_set_state_effecter_async.cpp.o'
> [40/63] Compiling C++ object
> 'libpldmresponder/1b80d8d@@pldmresponder@sha/.._host-bmc_dbus_to_event_handler.cpp.o'
> [41/63] Compiling C++ object
> 'pldmtool/ddccc44@@pldmtool@exe/pldm_cmd_helper.cpp.o'
> [42/63] Compiling C++ object 'pldmutils@sha/common_utils.cpp.o'
> [43/63] Compiling C++ object
> 'pldmd@exe/host-bmc_dbus_to_host_effecters.cpp.o'
> [44/63] Compiling C++ object
> 'libpldmresponder/1b80d8d@@pldmresponder@sha/fru.cpp.o'
> [45/63] Compiling C++ object 'pldmd@exe/pldmd_pldmd.cpp.o'
> [46/63] Compiling C++ object 'pldmtool/ddccc44@@pldmtool@exe/pldmtool.cpp.o'
> [47/63] Compiling C++ object
> 'libpldmresponder/1b80d8d@@pldmresponder@sha/.._host-bmc_host_pdr_handler.cpp.o'
> [48/63] Compiling C++ object
> 'libpldmresponder/1b80d8d@@pldmresponder@sha/platform.cpp.o'
> [49/63] Compiling C++ object
> 'pldmtool/ddccc44@@pldmtool@exe/oem_ibm_pldm_oem_ibm.cpp.o'
> [50/63] Compiling C++ object
> 'pldmtool/ddccc44@@pldmtool@exe/pldm_fru_cmd.cpp.o'
> [51/63] Compiling C++ object
> 'pldmtool/ddccc44@@pldmtool@exe/pldm_platform_cmd.cpp.o'
> [52/63] Compiling C++ object
> 'pldmtool/ddccc44@@pldmtool@exe/pldm_base_cmd.cpp.o'
> [53/63] Compiling C++ object
> 'libpldmresponder/1b80d8d@@pldmresponder@sha/bios_config.cpp.o'
> [54/63] Compiling C++ object
> 'pldmtool/ddccc44@@pldmtool@exe/pldm_bios_cmd.cpp.o'
> ninja: build stopped: subcommand failed.
> The command '/bin/sh -c curl -L
> https://github.com/openbmc/pldm/archive/8fc3edbc65b164eb8c90155b935c91e0e714c461.tar.gz
> | tar -xz && cd pldm-* && meson build --wrap-mode=nodownload
> -Dprefix=/usr/local -Dtests=disabled && ninja -C build && ninja -C build
> install' returned a non-zero code: 1
> ++ cleanup
> ++ local status=1
> ++ [[ -n /tmp/tmp.LkIqDi6uPu ]]
> ++ rm -f /tmp/tmp.LkIqDi6uPu
> ++ trap - EXIT ERR
> ++ exit 1
>
> Anyone have any ideas?
>
> Thanks!
> -Jason
