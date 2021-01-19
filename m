Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D27812FB5C1
	for <lists+openbmc@lfdr.de>; Tue, 19 Jan 2021 12:45:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DKn0K45LHzDr1m
	for <lists+openbmc@lfdr.de>; Tue, 19 Jan 2021 22:45:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32e;
 helo=mail-ot1-x32e.google.com; envelope-from=ojayanth@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=f+2Y2EsC; dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DKmxz0jydzDqyg
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jan 2021 22:43:31 +1100 (AEDT)
Received: by mail-ot1-x32e.google.com with SMTP id 36so7938930otp.2
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jan 2021 03:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ej0CeL7HrcMqYOraIQru5/t+svxAm4F3tplezjdKm7I=;
 b=f+2Y2EsClktUJEoymnlGW5/q2L9h2QEb7nwxnCFtAWamsEZTVKXAyqtTAChV0gQGRo
 ZCTZ+18ydLph65XtBNdM/FTi1jb5AEkSg9aJTU87GeolXJ7JlpTupXbMz/MMvnHcaS2G
 jTl0yGSz6mStSk/0eGww5xLlHuGzwe17MzB1TDt4PDw3L41aE8/Ks8a7co+1W47ndvMx
 dM9nerk4y4kazTuNBl4rp9PPC3LSpofoEjLThXN2EuEPzaKGgUOTdhdHNdMBw/5io3Zp
 q3Rt2oQgIP37nCgo/OQTI6GTvkRvaoXn2b/fm4qC4Q02dII7OEpUGtt+c5Py8wQnIJny
 a1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ej0CeL7HrcMqYOraIQru5/t+svxAm4F3tplezjdKm7I=;
 b=fQOzSb8d4IrNsyUZnU70Su4uhAyPPRDUgndrkBGqzy2mL3o1dys3jrEM1aJOCkqgSZ
 FmL4T2xpqU4EQAo7kUMPsW+ITEjiZl5z2NtdpXvqjB8R7/HhSkYPRGTyWLzZJ11gWADu
 N8Vljx062XAMqhB14ie5IdRx3zrKUOxV5bMtvWxBI7IJD7b8qhbS6CajLqyGDEg7S9GX
 V7kiPMQf8wY1alUAlGR/c8vkuS1YKXpfKbvYrMCK5y+AEs4cMC9XOyRTmBYhVXwrsTjM
 dxv3uikqT0VyF9jrbTGFh+ZlLSOhUY9ZipkaHoMqlfcqUMQs0i8Zu1ZmUxdBgeNNNtDg
 RJgQ==
X-Gm-Message-State: AOAM533zjjaMZl/PYWX3Tva76Dir2je3TWmcOeIBhu/rxicyfR0vctvt
 LxY3TYlWV+qxiHXtltFJk6O/7FDcdACqUZHWsrAuzrj/8uM=
X-Google-Smtp-Source: ABdhPJwPVpPtqz6xw4wcwvHrw2d0LQdQN4BWN+P2LyrIOkLe7cpzTFO0Iv6uAedg6DoE/NaYko5jYSZAOEKwM1jwpiE=
X-Received: by 2002:a9d:6c90:: with SMTP id c16mr286913otr.177.1611056607218; 
 Tue, 19 Jan 2021 03:43:27 -0800 (PST)
MIME-Version: 1.0
References: <aec974a0-d983-0a41-d5b3-3574432bc2eb@linux.intel.com>
 <d4194958-4d1a-f88f-817c-0138dadef46a@linux.intel.com>
In-Reply-To: <d4194958-4d1a-f88f-817c-0138dadef46a@linux.intel.com>
From: Jayanth Othayoth <ojayanth@gmail.com>
Date: Tue, 19 Jan 2021 17:13:15 +0530
Message-ID: <CACkAXSqqsXveezwPjOR1OVFwNBPWLvqZwLRLFV1TVjOpux126A@mail.gmail.com>
Subject: Re: phosphor-debug-collector build issues
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Content-Type: multipart/alternative; boundary="000000000000c9517905b93f588f"
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

--000000000000c9517905b93f588f
Content-Type: text/plain; charset="UTF-8"

Recently one of the d-bus interface  got changed in the
phosphor-dbug-collector side . Looks like phosphor-dbus-interface version
bump is missing here , which causing this build failure.

Commit details:

https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/37355
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-debug-collector/+/37802

On Fri, Jan 15, 2021 at 2:51 AM Bills, Jason M <
jason.m.bills@linux.intel.com> wrote:

>
>
> On 1/12/2021 9:29 AM, Bills, Jason M wrote:
> > Hi All,
> >
> > Is anyone else seeing build errors in phosphor-debug-collector?
> >
> > When I build in Yocto, I get this error:
> >
> > | In file included from
> >
> ../../../../../../workspace/sources/phosphor-debug-collector/dump_manager_main.cpp:6:
>
> >
> > |
> >
> ../../../../../../workspace/sources/phosphor-debug-collector/dump_manager_bmc.hpp:98:9:
>
> > error: 'sdbusplus::message::object_path
> >
> phosphor::dump::bmc::Manager::createDump(std::map<std::__cxx11::basic_string<char>,
>
> > std::__cxx11::basic_string<char> >)' marked 'override', but does not
> > override
> > |    98 |         createDump(std::map<std::string, std::string> params)
> > override;
> > |       |         ^~~~~~~~~~
> > | In file included from
> >
> /home/jmbills/openbmc-openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-debug-collector/1.0+git999-r1/recipe-sysroot/usr/include/c++/10.2.0/memory:83,
>
> >
> > |                  from
> >
> /home/jmbills/openbmc-openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-debug-collector/1.0+git999-r1/recipe-sysroot/usr/include/sdbusplus/message.hpp:11,
>
> >
> > |                  from
> >
> /home/jmbills/openbmc-openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-debug-collector/1.0+git999-r1/recipe-sysroot/usr/include/sdbusplus/bus.hpp:7,
>
> >
> > |                  from
> >
> /home/jmbills/openbmc-openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-debug-collector/1.0+git999-r1/recipe-sysroot/usr/include/sdbusplus/server.hpp:3,
>
> >
> > |                  from
> >
> /home/jmbills/openbmc-openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-debug-collector/1.0+git999-r1/recipe-sysroot/usr/include/xyz/openbmc_project/Common/Progress/server.hpp:5,
>
> >
> > |                  from
> >
> ../../../../../../workspace/sources/phosphor-debug-collector/dump_entry.hpp:3,
>
> >
> > |                  from
> >
> ../../../../../../workspace/sources/phosphor-debug-collector/dump_manager.hpp:3,
>
> >
> > |                  from
> >
> ../../../../../../workspace/sources/phosphor-debug-collector/dump-extensions.hpp:1,
>
> >
> > |                  from
> >
> ../../../../../../workspace/sources/phosphor-debug-collector/dump_manager_main.cpp:3:
>
> >
> > |
> >
> /home/jmbills/openbmc-openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-debug-collector/1.0+git999-r1/recipe-sysroot/usr/include/c++/10.2.0/bits/unique_ptr.h:
>
> > In instantiation of 'typename std::_MakeUniq<_Tp>::__single_object
> > std::make_unique(_Args&& ...) [with _Tp = phosphor::dump::bmc::Manager;
> > _Args = {sdbusplus::bus::bus&, std::unique_ptr<sd_event,
> > phosphor::dump::EventDeleter>&, const char (&)[30], const char (&)[36],
> > const char (&)[40]}; typename std::_MakeUniq<_Tp>::__single_object =
> > std::unique_ptr<phosphor::dump::bmc::Manager>]':
> > |
> >
> ../../../../../../workspace/sources/phosphor-debug-collector/dump_manager_main.cpp:68:30:
>
> >    required from here
> > |
> >
> /home/jmbills/openbmc-openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-debug-collector/1.0+git999-r1/recipe-sysroot/usr/include/c++/10.2.0/bits/unique_ptr.h:962:30:
>
> > error: invalid new-expression of abstract class type
> > 'phosphor::dump::bmc::Manager'
> > |   962 |     { return unique_ptr<_Tp>(new
> > _Tp(std::forward<_Args>(__args)...)); }
> > |       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > | In file included from
> >
> ../../../../../../workspace/sources/phosphor-debug-collector/dump_manager_main.cpp:6:
>
> >
> > |
> >
> ../../../../../../workspace/sources/phosphor-debug-collector/dump_manager_bmc.hpp:48:7:
>
> > note:   because the following virtual functions are pure within
> > 'phosphor::dump::bmc::Manager':
> > |    48 | class Manager : virtual public CreateIface,
> > |       |       ^~~~~~~
> > | In file included from
> >
> ../../../../../../workspace/sources/phosphor-debug-collector/dump_manager_bmc.hpp:9,
>
> >
> > |                  from
> >
> ../../../../../../workspace/sources/phosphor-debug-collector/dump_manager_main.cpp:6:
>
> >
> > |
> >
> /home/jmbills/openbmc-openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-debug-collector/1.0+git999-r1/recipe-sysroot/usr/include/xyz/openbmc_project/Dump/Create/server.hpp:55:26:
>
> > note:     'virtual uint32_t
> > sdbusplus::xyz::openbmc_project::Dump::server::Create::createDump()'
> > |    55 |         virtual uint32_t createDump(
> > |       |                          ^~~~~~~~~~
> >
>
> It looks like a change was pushed (perhaps
>
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-debug-collector/+/39162)
>
> that fixes openbmc-build-scripts/run-unit-test-docker.sh.  However, I
> still see the above override failure when building with Yocto.
>
> Does anyone else see this error or have any ideas?.
>
> Thanks,
> -Jason
> >
> > When I build using openbmc-build-scripts/run-unit-test-docker.sh, I get
> > this error:
> >
> > FAILED:
> > libpldmresponder/1b80d8d@@pldmresponder@sha/.._oem_ibm_libpldmresponder_file_io_type_dump.cpp.o
>
> >
> > c++ -Ilibpldmresponder/1b80d8d@@pldmresponder@sha -Ilibpldmresponder
> > -I../libpldmresponder -Ilibpldm -I../libpldm -I. -I.. -I../oem/ibm
> > -I../libpldm/requester -I/usr/local/include -fdiagnostics-color=always
> > -pipe -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wnon-virtual-dtor
> > -Wextra -Wpedantic -Werror -std=c++17 -g -Wno-psabi -DOEM_IBM -fPIC -MD
> > -MQ
> > 'libpldmresponder/1b80d8d@@pldmresponder@sha/.._oem_ibm_libpldmresponder_file_io_type_dump.cpp.o'
>
> > -MF
> > 'libpldmresponder/1b80d8d@@pldmresponder@sha/.._oem_ibm_libpldmresponder_file_io_type_dump.cpp.o.d'
>
> > -o
> > 'libpldmresponder/1b80d8d@@pldmresponder@sha/.._oem_ibm_libpldmresponder_file_io_type_dump.cpp.o'
>
> > -c ../oem/ibm/libpldmresponder/file_io_type_dump.cpp
> > ../oem/ibm/libpldmresponder/file_io_type_dump.cpp: In member function
> > 'virtual int pldm::responder::DumpHandler::newFileAvailable(uint64_t)':
> > ../oem/ibm/libpldmresponder/file_io_type_dump.cpp:86:60: error:
> > 'convertForMessage' is not a member of
> > 'sdbusplus::xyz::openbmc_project::Dump::server'
> >     86 |
> sdbusplus::xyz::openbmc_project::Dump::server::convertForMessage(
> >        | ^~~~~~~~~~~~~~~~~
> > ../oem/ibm/libpldmresponder/file_io_type_dump.cpp:86:60: note: suggested
> > alternatives:
> > In file included from /usr/local/include/sdbusplus/server.hpp:14,
> >                   from ../common/utils.hpp:12,
> >                   from ../oem/ibm/libpldmresponder/file_io.hpp:9,
> >                   from ../oem/ibm/libpldmresponder/file_io_by_type.hpp:3,
> >                   from
> ../oem/ibm/libpldmresponder/file_io_type_dump.hpp:3,
> >                   from
> ../oem/ibm/libpldmresponder/file_io_type_dump.cpp:1:
> > /usr/local/include/sdbusplus/server/bindings.hpp:21:5: note:
> > 'sdbusplus::server::binding::details::convertForMessage'
> >     21 | T&& convertForMessage(T&& t)
> >        |     ^~~~~~~~~~~~~~~~~
> > In file included from ../common/utils.hpp:13,
> >                   from ../oem/ibm/libpldmresponder/file_io.hpp:9,
> >                   from ../oem/ibm/libpldmresponder/file_io_by_type.hpp:3,
> >                   from
> ../oem/ibm/libpldmresponder/file_io_type_dump.hpp:3,
> >                   from
> ../oem/ibm/libpldmresponder/file_io_type_dump.cpp:1:
> > /usr/local/include/xyz/openbmc_project/Logging/Entry/server.hpp:268:20:
> > note:
> 'sdbusplus::xyz::openbmc_project::Logging::server::convertForMessage'
> >    268 | inline std::string convertForMessage(Entry::Level e)
> >        |                    ^~~~~~~~~~~~~~~~~
> > ../oem/ibm/libpldmresponder/file_io_type_dump.cpp:87:26: error:
> > 'sdbusplus::xyz::openbmc_project::Dump::server::NewDump::DumpType' has
> > not been declared
> >     87 |                 NewDump::DumpType::System),
> >        |                          ^~~~~~~~
> > [23/63] Compiling C++ object
> > 'libpldmresponder/1b80d8d@@pldmresponder@sha/.._oem_ibm_libpldmresponder_platform_oem_ibm.cpp.o'
>
> >
> > [24/63] Compiling C++ object
> > 'libpldmresponder/1b80d8d@@pldmresponder@sha/.._oem_ibm_libpldmresponder_file_io_by_type.cpp.o'
>
> >
> > [25/63] Compiling C++ object
> > 'libpldmresponder/1b80d8d@@pldmresponder@sha
> /bios_integer_attribute.cpp.o'
> > [26/63] Compiling C++ object
> > 'libpldmresponder/1b80d8d@@pldmresponder@sha/pdr.cpp.o'
> > [27/63] Compiling C++ object
> > 'libpldmresponder/1b80d8d@@pldmresponder@sha
> /bios_string_attribute.cpp.o'
> > [28/63] Compiling C++ object
> > 'libpldmresponder/1b80d8d@@pldmresponder@sha/.._oem_ibm_libpldmresponder_file_io.cpp.o'
>
> >
> > [29/63] Compiling C++ object
> > 'libpldmresponder/1b80d8d@@pldmresponder@sha/bios_attribute.cpp.o'
> > [30/63] Compiling C++ object
> > 'libpldmresponder/1b80d8d@@pldmresponder@sha/.._oem_ibm_libpldmresponder_file_io_type_pel.cpp.o'
>
> >
> > [31/63] Compiling C++ object
> > 'libpldmresponder/1b80d8d@@pldmresponder@sha/.._oem_ibm_libpldmresponder_file_table.cpp.o'
>
> >
> > [32/63] Compiling C++ object
> > 'libpldmresponder/1b80d8d@@pldmresponder@sha/bios.cpp.o'
> > [33/63] Compiling C++ object
> > 'softoff/59fd39a@@pldm-softpoweroff@exe/softoff.cpp.o'
> > [34/63] Compiling C++ object
> > 'libpldmresponder/1b80d8d@@pldmresponder@sha/pdr_utils.cpp.o'
> > [35/63] Compiling C++ object
> > 'libpldmresponder/1b80d8d@@pldmresponder@sha/bios_enum_attribute.cpp.o'
> > [36/63] Compiling C++ object
> > 'libpldmresponder/1b80d8d@@pldmresponder@sha/fru_parser.cpp.o'
> > [37/63] Compiling C++ object
> > 'libpldmresponder/1b80d8d@@pldmresponder@sha/event_parser.cpp.o'
> > [38/63] Compiling C++ object
> > 'utilities/abe2c41@@set-state-effecter@exe/requester_set_state_effecter.cpp.o'
>
> >
> > [39/63] Compiling C++ object
> > 'utilities/abe2c41@@set-state-effecter-async@exe/requester_set_state_effecter_async.cpp.o'
>
> >
> > [40/63] Compiling C++ object
> > 'libpldmresponder/1b80d8d@@pldmresponder@sha/.._host-bmc_dbus_to_event_handler.cpp.o'
>
> >
> > [41/63] Compiling C++ object
> > 'pldmtool/ddccc44@@pldmtool@exe/pldm_cmd_helper.cpp.o'
> > [42/63] Compiling C++ object 'pldmutils@sha/common_utils.cpp.o'
> > [43/63] Compiling C++ object
> > 'pldmd@exe/host-bmc_dbus_to_host_effecters.cpp.o'
> > [44/63] Compiling C++ object
> > 'libpldmresponder/1b80d8d@@pldmresponder@sha/fru.cpp.o'
> > [45/63] Compiling C++ object 'pldmd@exe/pldmd_pldmd.cpp.o'
> > [46/63] Compiling C++ object
> > 'pldmtool/ddccc44@@pldmtool@exe/pldmtool.cpp.o'
> > [47/63] Compiling C++ object
> > 'libpldmresponder/1b80d8d@@pldmresponder@sha/.._host-bmc_host_pdr_handler.cpp.o'
>
> >
> > [48/63] Compiling C++ object
> > 'libpldmresponder/1b80d8d@@pldmresponder@sha/platform.cpp.o'
> > [49/63] Compiling C++ object
> > 'pldmtool/ddccc44@@pldmtool@exe/oem_ibm_pldm_oem_ibm.cpp.o'
> > [50/63] Compiling C++ object
> > 'pldmtool/ddccc44@@pldmtool@exe/pldm_fru_cmd.cpp.o'
> > [51/63] Compiling C++ object
> > 'pldmtool/ddccc44@@pldmtool@exe/pldm_platform_cmd.cpp.o'
> > [52/63] Compiling C++ object
> > 'pldmtool/ddccc44@@pldmtool@exe/pldm_base_cmd.cpp.o'
> > [53/63] Compiling C++ object
> > 'libpldmresponder/1b80d8d@@pldmresponder@sha/bios_config.cpp.o'
> > [54/63] Compiling C++ object
> > 'pldmtool/ddccc44@@pldmtool@exe/pldm_bios_cmd.cpp.o'
> > ninja: build stopped: subcommand failed.
> > The command '/bin/sh -c curl -L
> >
> https://github.com/openbmc/pldm/archive/8fc3edbc65b164eb8c90155b935c91e0e714c461.tar.gz
> > | tar -xz && cd pldm-* && meson build --wrap-mode=nodownload
> > -Dprefix=/usr/local -Dtests=disabled && ninja -C build && ninja -C build
> > install' returned a non-zero code: 1
> > ++ cleanup
> > ++ local status=1
> > ++ [[ -n /tmp/tmp.LkIqDi6uPu ]]
> > ++ rm -f /tmp/tmp.LkIqDi6uPu
> > ++ trap - EXIT ERR
> > ++ exit 1
> >
> > Anyone have any ideas?
> >
> > Thanks!
> > -Jason
>

--000000000000c9517905b93f588f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Recently one of the d-bus interface=C2=A0 got changed=
 in the phosphor-dbug-collector side . Looks like phosphor-dbus-interface v=
ersion bump is missing here , which causing this build failure.</div><div><=
br></div><div>Commit details:</div><div><br></div><div><a target=3D"_blank"=
 class=3D"gmail-c-link" href=3D"https://gerrit.openbmc-project.xyz/c/openbm=
c/phosphor-dbus-interfaces/+/37355" rel=3D"noopener noreferrer" style=3D"bo=
x-sizing:inherit;text-decoration:underline;font-family:Slack-Lato,appleLogo=
,sans-serif;font-size:15px;font-style:normal;font-variant-ligatures:common-=
ligatures;font-variant-caps:normal;font-weight:400;letter-spacing:normal;te=
xt-align:left;text-indent:0px;text-transform:none;white-space:normal;word-s=
pacing:0px;background-color:rgb(248,248,248)">https://gerrit.openbmc-projec=
t.xyz/c/openbmc/phosphor-dbus-interfaces/+/37355</a></div><div><a target=3D=
"_blank" class=3D"gmail-c-link" href=3D"https://gerrit.openbmc-project.xyz/=
c/openbmc/phosphor-debug-collector/+/37802" rel=3D"noopener noreferrer" sty=
le=3D"box-sizing:inherit;text-decoration:underline;font-family:Slack-Lato,a=
ppleLogo,sans-serif;font-size:15px;font-style:normal;font-variant-ligatures=
:common-ligatures;font-variant-caps:normal;font-weight:400;letter-spacing:n=
ormal;text-align:left;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;background-color:rgb(248,248,248)">https://gerrit.openbm=
c-project.xyz/c/openbmc/phosphor-debug-collector/+/37802</a></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, J=
an 15, 2021 at 2:51 AM Bills, Jason M &lt;<a href=3D"mailto:jason.m.bills@l=
inux.intel.com">jason.m.bills@linux.intel.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 1/12/2021 9:29 AM, Bills, Jason M wrote:<br>
&gt; Hi All,<br>
&gt; <br>
&gt; Is anyone else seeing build errors in phosphor-debug-collector?<br>
&gt; <br>
&gt; When I build in Yocto, I get this error:<br>
&gt; <br>
&gt; | In file included from <br>
&gt; ../../../../../../workspace/sources/phosphor-debug-collector/dump_mana=
ger_main.cpp:6: <br>
&gt; <br>
&gt; | <br>
&gt; ../../../../../../workspace/sources/phosphor-debug-collector/dump_mana=
ger_bmc.hpp:98:9: <br>
&gt; error: &#39;sdbusplus::message::object_path <br>
&gt; phosphor::dump::bmc::Manager::createDump(std::map&lt;std::__cxx11::bas=
ic_string&lt;char&gt;, <br>
&gt; std::__cxx11::basic_string&lt;char&gt; &gt;)&#39; marked &#39;override=
&#39;, but does not <br>
&gt; override<br>
&gt; |=C2=A0=C2=A0=C2=A0 98 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 createDump(std::map&lt;std::string, std::string&gt; params) <br>
&gt; override;<br>
&gt; |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~<br>
&gt; | In file included from <br>
&gt; /home/jmbills/openbmc-openbmc/build/tmp/work/arm1176jzs-openbmc-linux-=
gnueabi/phosphor-debug-collector/1.0+git999-r1/recipe-sysroot/usr/include/c=
++/10.2.0/memory:83, <br>
&gt; <br>
&gt; |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from <br>
&gt; /home/jmbills/openbmc-openbmc/build/tmp/work/arm1176jzs-openbmc-linux-=
gnueabi/phosphor-debug-collector/1.0+git999-r1/recipe-sysroot/usr/include/s=
dbusplus/message.hpp:11, <br>
&gt; <br>
&gt; |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from <br>
&gt; /home/jmbills/openbmc-openbmc/build/tmp/work/arm1176jzs-openbmc-linux-=
gnueabi/phosphor-debug-collector/1.0+git999-r1/recipe-sysroot/usr/include/s=
dbusplus/bus.hpp:7, <br>
&gt; <br>
&gt; |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from <br>
&gt; /home/jmbills/openbmc-openbmc/build/tmp/work/arm1176jzs-openbmc-linux-=
gnueabi/phosphor-debug-collector/1.0+git999-r1/recipe-sysroot/usr/include/s=
dbusplus/server.hpp:3, <br>
&gt; <br>
&gt; |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from <br>
&gt; /home/jmbills/openbmc-openbmc/build/tmp/work/arm1176jzs-openbmc-linux-=
gnueabi/phosphor-debug-collector/1.0+git999-r1/recipe-sysroot/usr/include/x=
yz/openbmc_project/Common/Progress/server.hpp:5, <br>
&gt; <br>
&gt; |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from <br>
&gt; ../../../../../../workspace/sources/phosphor-debug-collector/dump_entr=
y.hpp:3, <br>
&gt; <br>
&gt; |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from <br>
&gt; ../../../../../../workspace/sources/phosphor-debug-collector/dump_mana=
ger.hpp:3, <br>
&gt; <br>
&gt; |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from <br>
&gt; ../../../../../../workspace/sources/phosphor-debug-collector/dump-exte=
nsions.hpp:1, <br>
&gt; <br>
&gt; |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from <br>
&gt; ../../../../../../workspace/sources/phosphor-debug-collector/dump_mana=
ger_main.cpp:3: <br>
&gt; <br>
&gt; | <br>
&gt; /home/jmbills/openbmc-openbmc/build/tmp/work/arm1176jzs-openbmc-linux-=
gnueabi/phosphor-debug-collector/1.0+git999-r1/recipe-sysroot/usr/include/c=
++/10.2.0/bits/unique_ptr.h: <br>
&gt; In instantiation of &#39;typename std::_MakeUniq&lt;_Tp&gt;::__single_=
object <br>
&gt; std::make_unique(_Args&amp;&amp; ...) [with _Tp =3D phosphor::dump::bm=
c::Manager; <br>
&gt; _Args =3D {sdbusplus::bus::bus&amp;, std::unique_ptr&lt;sd_event, <br>
&gt; phosphor::dump::EventDeleter&gt;&amp;, const char (&amp;)[30], const c=
har (&amp;)[36], <br>
&gt; const char (&amp;)[40]}; typename std::_MakeUniq&lt;_Tp&gt;::__single_=
object =3D <br>
&gt; std::unique_ptr&lt;phosphor::dump::bmc::Manager&gt;]&#39;:<br>
&gt; | <br>
&gt; ../../../../../../workspace/sources/phosphor-debug-collector/dump_mana=
ger_main.cpp:68:30: <br>
&gt;=C2=A0 =C2=A0 required from here<br>
&gt; | <br>
&gt; /home/jmbills/openbmc-openbmc/build/tmp/work/arm1176jzs-openbmc-linux-=
gnueabi/phosphor-debug-collector/1.0+git999-r1/recipe-sysroot/usr/include/c=
++/10.2.0/bits/unique_ptr.h:962:30: <br>
&gt; error: invalid new-expression of abstract class type <br>
&gt; &#39;phosphor::dump::bmc::Manager&#39;<br>
&gt; |=C2=A0=C2=A0 962 |=C2=A0=C2=A0=C2=A0=C2=A0 { return unique_ptr&lt;_Tp=
&gt;(new <br>
&gt; _Tp(std::forward&lt;_Args&gt;(__args)...)); }<br>
&gt; |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~<br>
&gt; | In file included from <br>
&gt; ../../../../../../workspace/sources/phosphor-debug-collector/dump_mana=
ger_main.cpp:6: <br>
&gt; <br>
&gt; | <br>
&gt; ../../../../../../workspace/sources/phosphor-debug-collector/dump_mana=
ger_bmc.hpp:48:7: <br>
&gt; note:=C2=A0=C2=A0 because the following virtual functions are pure wit=
hin <br>
&gt; &#39;phosphor::dump::bmc::Manager&#39;:<br>
&gt; |=C2=A0=C2=A0=C2=A0 48 | class Manager : virtual public CreateIface,<b=
r>
&gt; |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ^~~~~~~<br>
&gt; | In file included from <br>
&gt; ../../../../../../workspace/sources/phosphor-debug-collector/dump_mana=
ger_bmc.hpp:9, <br>
&gt; <br>
&gt; |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from <br>
&gt; ../../../../../../workspace/sources/phosphor-debug-collector/dump_mana=
ger_main.cpp:6: <br>
&gt; <br>
&gt; | <br>
&gt; /home/jmbills/openbmc-openbmc/build/tmp/work/arm1176jzs-openbmc-linux-=
gnueabi/phosphor-debug-collector/1.0+git999-r1/recipe-sysroot/usr/include/x=
yz/openbmc_project/Dump/Create/server.hpp:55:26: <br>
&gt; note:=C2=A0=C2=A0=C2=A0=C2=A0 &#39;virtual uint32_t <br>
&gt; sdbusplus::xyz::openbmc_project::Dump::server::Create::createDump()&#3=
9;<br>
&gt; |=C2=A0=C2=A0=C2=A0 55 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 virtual uint32_t createDump(<br>
&gt; |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~<br>
&gt; <br>
<br>
It looks like a change was pushed (perhaps <br>
<a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-debug-coll=
ector/+/39162" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc-=
project.xyz/c/openbmc/phosphor-debug-collector/+/39162</a>) <br>
that fixes openbmc-build-scripts/run-unit-test-docker.sh.=C2=A0 However, I =
<br>
still see the above override failure when building with Yocto.<br>
<br>
Does anyone else see this error or have any ideas?.<br>
<br>
Thanks,<br>
-Jason<br>
&gt; <br>
&gt; When I build using openbmc-build-scripts/run-unit-test-docker.sh, I ge=
t <br>
&gt; this error:<br>
&gt; <br>
&gt; FAILED: <br>
&gt; libpldmresponder/1b80d8d@@pldmresponder@sha/.._oem_ibm_libpldmresponde=
r_file_io_type_dump.cpp.o <br>
&gt; <br>
&gt; c++ -Ilibpldmresponder/1b80d8d@@pldmresponder@sha -Ilibpldmresponder <=
br>
&gt; -I../libpldmresponder -Ilibpldm -I../libpldm -I. -I.. -I../oem/ibm <br=
>
&gt; -I../libpldm/requester -I/usr/local/include -fdiagnostics-color=3Dalwa=
ys <br>
&gt; -pipe -D_FILE_OFFSET_BITS=3D64 -Wall -Winvalid-pch -Wnon-virtual-dtor =
<br>
&gt; -Wextra -Wpedantic -Werror -std=3Dc++17 -g -Wno-psabi -DOEM_IBM -fPIC =
-MD <br>
&gt; -MQ <br>
&gt; &#39;libpldmresponder/1b80d8d@@pldmresponder@sha/.._oem_ibm_libpldmres=
ponder_file_io_type_dump.cpp.o&#39; <br>
&gt; -MF <br>
&gt; &#39;libpldmresponder/1b80d8d@@pldmresponder@sha/.._oem_ibm_libpldmres=
ponder_file_io_type_dump.cpp.o.d&#39; <br>
&gt; -o <br>
&gt; &#39;libpldmresponder/1b80d8d@@pldmresponder@sha/.._oem_ibm_libpldmres=
ponder_file_io_type_dump.cpp.o&#39; <br>
&gt; -c ../oem/ibm/libpldmresponder/file_io_type_dump.cpp<br>
&gt; ../oem/ibm/libpldmresponder/file_io_type_dump.cpp: In member function =
<br>
&gt; &#39;virtual int pldm::responder::DumpHandler::newFileAvailable(uint64=
_t)&#39;:<br>
&gt; ../oem/ibm/libpldmresponder/file_io_type_dump.cpp:86:60: error: <br>
&gt; &#39;convertForMessage&#39; is not a member of <br>
&gt; &#39;sdbusplus::xyz::openbmc_project::Dump::server&#39;<br>
&gt;=C2=A0 =C2=A0=C2=A0 86 | sdbusplus::xyz::openbmc_project::Dump::server:=
:convertForMessage(<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ^~~~~~~~~~~~~~~~~<br>
&gt; ../oem/ibm/libpldmresponder/file_io_type_dump.cpp:86:60: note: suggest=
ed <br>
&gt; alternatives:<br>
&gt; In file included from /usr/local/include/sdbusplus/server.hpp:14,<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from ../common/utils.hpp:12,<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from ../oem/ibm/libpldmresponder/file_io.=
hpp:9,<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from ../oem/ibm/libpldmresponder/file_io_=
by_type.hpp:3,<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from ../oem/ibm/libpldmresponder/file_io_=
type_dump.hpp:3,<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from ../oem/ibm/libpldmresponder/file_io_=
type_dump.cpp:1:<br>
&gt; /usr/local/include/sdbusplus/server/bindings.hpp:21:5: note: <br>
&gt; &#39;sdbusplus::server::binding::details::convertForMessage&#39;<br>
&gt;=C2=A0 =C2=A0=C2=A0 21 | T&amp;&amp; convertForMessage(T&amp;&amp; t)<b=
r>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~=
~~~~~~~~~~<br>
&gt; In file included from ../common/utils.hpp:13,<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from ../oem/ibm/libpldmresponder/file_io.=
hpp:9,<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from ../oem/ibm/libpldmresponder/file_io_=
by_type.hpp:3,<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from ../oem/ibm/libpldmresponder/file_io_=
type_dump.hpp:3,<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from ../oem/ibm/libpldmresponder/file_io_=
type_dump.cpp:1:<br>
&gt; /usr/local/include/xyz/openbmc_project/Logging/Entry/server.hpp:268:20=
: <br>
&gt; note: &#39;sdbusplus::xyz::openbmc_project::Logging::server::convertFo=
rMessage&#39;<br>
&gt;=C2=A0 =C2=A0 268 | inline std::string convertForMessage(Entry::Level e=
)<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ^~~~~~~~~~~~~~~~~<br>
&gt; ../oem/ibm/libpldmresponder/file_io_type_dump.cpp:87:26: error: <br>
&gt; &#39;sdbusplus::xyz::openbmc_project::Dump::server::NewDump::DumpType&=
#39; has <br>
&gt; not been declared<br>
&gt;=C2=A0 =C2=A0=C2=A0 87 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NewDump::DumpType::Syst=
em),<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~<br>
&gt; [23/63] Compiling C++ object <br>
&gt; &#39;libpldmresponder/1b80d8d@@pldmresponder@sha/.._oem_ibm_libpldmres=
ponder_platform_oem_ibm.cpp.o&#39; <br>
&gt; <br>
&gt; [24/63] Compiling C++ object <br>
&gt; &#39;libpldmresponder/1b80d8d@@pldmresponder@sha/.._oem_ibm_libpldmres=
ponder_file_io_by_type.cpp.o&#39; <br>
&gt; <br>
&gt; [25/63] Compiling C++ object <br>
&gt; &#39;libpldmresponder/1b80d8d@@pldmresponder@sha/bios_integer_attribut=
e.cpp.o&#39;<br>
&gt; [26/63] Compiling C++ object <br>
&gt; &#39;libpldmresponder/1b80d8d@@pldmresponder@sha/pdr.cpp.o&#39;<br>
&gt; [27/63] Compiling C++ object <br>
&gt; &#39;libpldmresponder/1b80d8d@@pldmresponder@sha/bios_string_attribute=
.cpp.o&#39;<br>
&gt; [28/63] Compiling C++ object <br>
&gt; &#39;libpldmresponder/1b80d8d@@pldmresponder@sha/.._oem_ibm_libpldmres=
ponder_file_io.cpp.o&#39; <br>
&gt; <br>
&gt; [29/63] Compiling C++ object <br>
&gt; &#39;libpldmresponder/1b80d8d@@pldmresponder@sha/bios_attribute.cpp.o&=
#39;<br>
&gt; [30/63] Compiling C++ object <br>
&gt; &#39;libpldmresponder/1b80d8d@@pldmresponder@sha/.._oem_ibm_libpldmres=
ponder_file_io_type_pel.cpp.o&#39; <br>
&gt; <br>
&gt; [31/63] Compiling C++ object <br>
&gt; &#39;libpldmresponder/1b80d8d@@pldmresponder@sha/.._oem_ibm_libpldmres=
ponder_file_table.cpp.o&#39; <br>
&gt; <br>
&gt; [32/63] Compiling C++ object <br>
&gt; &#39;libpldmresponder/1b80d8d@@pldmresponder@sha/bios.cpp.o&#39;<br>
&gt; [33/63] Compiling C++ object <br>
&gt; &#39;softoff/59fd39a@@pldm-softpoweroff@exe/softoff.cpp.o&#39;<br>
&gt; [34/63] Compiling C++ object <br>
&gt; &#39;libpldmresponder/1b80d8d@@pldmresponder@sha/pdr_utils.cpp.o&#39;<=
br>
&gt; [35/63] Compiling C++ object <br>
&gt; &#39;libpldmresponder/1b80d8d@@pldmresponder@sha/bios_enum_attribute.c=
pp.o&#39;<br>
&gt; [36/63] Compiling C++ object <br>
&gt; &#39;libpldmresponder/1b80d8d@@pldmresponder@sha/fru_parser.cpp.o&#39;=
<br>
&gt; [37/63] Compiling C++ object <br>
&gt; &#39;libpldmresponder/1b80d8d@@pldmresponder@sha/event_parser.cpp.o&#3=
9;<br>
&gt; [38/63] Compiling C++ object <br>
&gt; &#39;utilities/abe2c41@@set-state-effecter@exe/requester_set_state_eff=
ecter.cpp.o&#39; <br>
&gt; <br>
&gt; [39/63] Compiling C++ object <br>
&gt; &#39;utilities/abe2c41@@set-state-effecter-async@exe/requester_set_sta=
te_effecter_async.cpp.o&#39; <br>
&gt; <br>
&gt; [40/63] Compiling C++ object <br>
&gt; &#39;libpldmresponder/1b80d8d@@pldmresponder@sha/.._host-bmc_dbus_to_e=
vent_handler.cpp.o&#39; <br>
&gt; <br>
&gt; [41/63] Compiling C++ object <br>
&gt; &#39;pldmtool/ddccc44@@pldmtool@exe/pldm_cmd_helper.cpp.o&#39;<br>
&gt; [42/63] Compiling C++ object &#39;pldmutils@sha/common_utils.cpp.o&#39=
;<br>
&gt; [43/63] Compiling C++ object <br>
&gt; &#39;pldmd@exe/host-bmc_dbus_to_host_effecters.cpp.o&#39;<br>
&gt; [44/63] Compiling C++ object <br>
&gt; &#39;libpldmresponder/1b80d8d@@pldmresponder@sha/fru.cpp.o&#39;<br>
&gt; [45/63] Compiling C++ object &#39;pldmd@exe/pldmd_pldmd.cpp.o&#39;<br>
&gt; [46/63] Compiling C++ object <br>
&gt; &#39;pldmtool/ddccc44@@pldmtool@exe/pldmtool.cpp.o&#39;<br>
&gt; [47/63] Compiling C++ object <br>
&gt; &#39;libpldmresponder/1b80d8d@@pldmresponder@sha/.._host-bmc_host_pdr_=
handler.cpp.o&#39; <br>
&gt; <br>
&gt; [48/63] Compiling C++ object <br>
&gt; &#39;libpldmresponder/1b80d8d@@pldmresponder@sha/platform.cpp.o&#39;<b=
r>
&gt; [49/63] Compiling C++ object <br>
&gt; &#39;pldmtool/ddccc44@@pldmtool@exe/oem_ibm_pldm_oem_ibm.cpp.o&#39;<br=
>
&gt; [50/63] Compiling C++ object <br>
&gt; &#39;pldmtool/ddccc44@@pldmtool@exe/pldm_fru_cmd.cpp.o&#39;<br>
&gt; [51/63] Compiling C++ object <br>
&gt; &#39;pldmtool/ddccc44@@pldmtool@exe/pldm_platform_cmd.cpp.o&#39;<br>
&gt; [52/63] Compiling C++ object <br>
&gt; &#39;pldmtool/ddccc44@@pldmtool@exe/pldm_base_cmd.cpp.o&#39;<br>
&gt; [53/63] Compiling C++ object <br>
&gt; &#39;libpldmresponder/1b80d8d@@pldmresponder@sha/bios_config.cpp.o&#39=
;<br>
&gt; [54/63] Compiling C++ object <br>
&gt; &#39;pldmtool/ddccc44@@pldmtool@exe/pldm_bios_cmd.cpp.o&#39;<br>
&gt; ninja: build stopped: subcommand failed.<br>
&gt; The command &#39;/bin/sh -c curl -L <br>
&gt; <a href=3D"https://github.com/openbmc/pldm/archive/8fc3edbc65b164eb8c9=
0155b935c91e0e714c461.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/openbmc/pldm/archive/8fc3edbc65b164eb8c90155b935c91e0e714c461.ta=
r.gz</a> <br>
&gt; | tar -xz &amp;&amp; cd pldm-* &amp;&amp; meson build --wrap-mode=3Dno=
download <br>
&gt; -Dprefix=3D/usr/local -Dtests=3Ddisabled &amp;&amp; ninja -C build &am=
p;&amp; ninja -C build <br>
&gt; install&#39; returned a non-zero code: 1<br>
&gt; ++ cleanup<br>
&gt; ++ local status=3D1<br>
&gt; ++ [[ -n /tmp/tmp.LkIqDi6uPu ]]<br>
&gt; ++ rm -f /tmp/tmp.LkIqDi6uPu<br>
&gt; ++ trap - EXIT ERR<br>
&gt; ++ exit 1<br>
&gt; <br>
&gt; Anyone have any ideas?<br>
&gt; <br>
&gt; Thanks!<br>
&gt; -Jason<br>
</blockquote></div>

--000000000000c9517905b93f588f--
