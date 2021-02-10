Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7235A316ABE
	for <lists+openbmc@lfdr.de>; Wed, 10 Feb 2021 17:09:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbPp90BX0zDwZP
	for <lists+openbmc@lfdr.de>; Thu, 11 Feb 2021 03:09:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbPn16kwMzDvrC
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2021 03:08:04 +1100 (AEDT)
IronPort-SDR: mTODe754zRzMGEs1bVPEsTFfRlZXwx5tZoRJMiACNTqdbei803bRwLkKUYi1XsqMWcAvYlU73o
 3HFxn/34dZmQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="169774274"
X-IronPort-AV: E=Sophos;i="5.81,168,1610438400"; d="scan'208";a="169774274"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 08:07:59 -0800
IronPort-SDR: EMjDNRAIcReWPdMU1b2eOWlk6FGvOVieVWTyyAvC9OHJvIoKtsF2ldY4tu5FPIV0HGqyYz5ef1
 rGaznhySVRKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,168,1610438400"; d="scan'208";a="578456993"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga005.jf.intel.com with ESMTP; 10 Feb 2021 08:07:58 -0800
Received: from [10.209.46.5] (jmbills-MOBL.amr.corp.intel.com [10.209.46.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 6F5605808AB
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2021 08:07:58 -0800 (PST)
Subject: Re: peci-pcie CI issues
To: openbmc@lists.ozlabs.org
References: <6c2c44435e704f6eee95b7e35cbc39ccfae32b62.camel@yadro.com>
 <EC305987-22B3-40D2-86A6-4FF95B395956@stwcx.xyz>
 <CACWQX82quUYK+r0BkDqT0ZABXgRPj797Wwr8Joov05w8tCLwuA@mail.gmail.com>
 <27dbc305c6c53c338b5eefec68fbcda38ff44672.camel@yadro.com>
 <YCPPbAlAUHtn+Vv1@heinlein>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <b71222f2-c0dc-cc30-afb8-c3a8669279f8@linux.intel.com>
Date: Wed, 10 Feb 2021 08:07:57 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <YCPPbAlAUHtn+Vv1@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 2/10/2021 4:19 AM, Patrick Williams wrote:
> On Wed, Feb 10, 2021 at 01:04:41PM +0300, Andrei Kartashev wrote:
>> As far as I can see, boost was updated to 1.75.0, but looks like it
>> didn't help, CI still failed to build peci-pcie:
>> https://jenkins.openbmc.org/job/ci-repository/12229/console
>>
> 
> Hi Andrei,
> 
> Repository-level CI isn't done with bitbake but under a docker build we
> have set up.  Jason put up a patch yesterday to update that to use Boost
> 1.75[1].  Once that is merged then the `ci-repository` job will use the
> desired Boost version.
> 
> 1. https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-build-scripts/+/40426
> 

It looks like there is a new failure after the boost 1.75 update.  Does 
anyone know what this error means?  I also see this error on another 
repo: https://jenkins.openbmc.org/job/ci-repository/12253/.

   CXX 
xyz/openbmc_project/Logging/Internal/Manager/phosphor_log_manager-server.o
In file included from /usr/include/c++/10/memory:83,
                  from /usr/local/include/sdbusplus/message.hpp:11,
                  from /usr/local/include/sdbusplus/bus.hpp:7,
                  from /usr/local/include/sdbusplus/server.hpp:3,
                  from 
/usr/local/include/xyz/openbmc_project/Logging/ErrorBlocksTransition/server.hpp:5,
                  from elog_block.hpp:5,
                  from log_manager.hpp:3,
                  from log_manager.cpp:3:
/usr/include/c++/10/bits/unique_ptr.h: In instantiation of 'typename 
std::_MakeUniq<_Tp>::__single_object std::make_unique(_Args&& ...) [with 
_Tp = phosphor::logging::Entry; _Args = {sdbusplus::bus::bus&, 
std::__cxx11::basic_string<char, std::char_traits<char>, 
std::allocator<char> >&, unsigned int&, long int&, 
sdbusplus::xyz::openbmc_project::Logging::server::Entry::Level&, 
std::__cxx11::basic_string<char, std::char_traits<char>, 
std::allocator<char> >, std::vector<std::__cxx11::basic_string<char, 
std::char_traits<char>, std::allocator<char> >, 
std::allocator<std::__cxx11::basic_string<char, std::char_traits<char>, 
std::allocator<char> > > >, 
std::vector<std::tuple<std::__cxx11::basic_string<char, 
std::char_traits<char>, std::allocator<char> >, 
std::__cxx11::basic_string<char, std::char_traits<char>, 
std::allocator<char> >, std::__cxx11::basic_string<char, 
std::char_traits<char>, std::allocator<char> > >, 
std::allocator<std::tuple<std::__cxx11::basic_string<char, 
std::char_traits<char>, std::allocator<char> >, 
std::__cxx11::basic_string<char, std::char_traits<char>, 
std::allocator<char> >, std::__cxx11::basic_string<char, 
std::char_traits<char>, std::allocator<char> > > > >, const 
std::__cxx11::basic_string<char, std::char_traits<char>, 
std::allocator<char> >&, phosphor::logging::internal::Manager&}; 
typename std::_MakeUniq<_Tp>::__single_object = 
std::unique_ptr<phosphor::logging::Entry>]':
log_manager.cpp:235:74:   required from here
/usr/include/c++/10/bits/unique_ptr.h:962:30: error: invalid 
new-expression of abstract class type 'phosphor::logging::Entry'
   962 |     { return unique_ptr<_Tp>(new 
_Tp(std::forward<_Args>(__args)...)); }
       | 
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from log_manager.hpp:4,
                  from log_manager.cpp:3:
elog_entry.hpp:38:7: note:   because the following virtual functions are 
pure within 'phosphor::logging::Entry':
    38 | class Entry : public EntryIfaces
       |       ^~~~~
In file included from elog_entry.hpp:3,
                  from log_manager.hpp:4,
                  from log_manager.cpp:3:
/usr/local/include/xyz/openbmc_project/Logging/Entry/server.hpp:92:45: 
note:     'virtual sdbusplus::message::unix_fd 
sdbusplus::xyz::openbmc_project::Logging::server::Entry::getEntry()'
    92 |         virtual sdbusplus::message::unix_fd getEntry(
       |                                             ^~~~~~~~
In file included from /usr/include/c++/10/memory:83,
                  from /usr/local/include/sdbusplus/message.hpp:11,
                  from /usr/local/include/sdbusplus/bus.hpp:7,
                  from /usr/local/include/sdbusplus/server.hpp:3,
                  from 
/usr/local/include/xyz/openbmc_project/Logging/ErrorBlocksTransition/server.hpp:5,
                  from elog_block.hpp:5,
                  from log_manager.hpp:3,
                  from log_manager.cpp:3:
/usr/include/c++/10/bits/unique_ptr.h: In instantiation of 'typename 
std::_MakeUniq<_Tp>::__single_object std::make_unique(_Args&& ...) [with 
_Tp = phosphor::logging::Entry; _Args = {sdbusplus::bus::bus&, 
std::__cxx11::basic_string<char, std::char_traits<char>, 
std::allocator<char> >, long int&, 
phosphor::logging::internal::Manager&}; typename 
std::_MakeUniq<_Tp>::__single_object = 
std::unique_ptr<phosphor::logging::Entry>]':
log_manager.cpp:571:68:   required from here
/usr/include/c++/10/bits/unique_ptr.h:962:30: error: invalid 
new-expression of abstract class type 'phosphor::logging::Entry'
   962 |     { return unique_ptr<_Tp>(new 
_Tp(std::forward<_Args>(__args)...)); }
       | 
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   CXXLD    libphosphor_logging.la
   CXXLD    logging-test
   CXXLD    callout-test
make[2]: Leaving directory 
'/phosphor-logging-b50c705c3bb3738673f98cd371b408a5b48e629a'
make[2]: *** [Makefile:1631: phosphor_log_manager-log_manager.o] Error 1
make[1]: *** [Makefile:2013: all-recursive] Error 1
make[1]: Leaving directory 
'/phosphor-logging-b50c705c3bb3738673f98cd371b408a5b48e629a'
make: *** [Makefile:910: all] Error 2
The command '/bin/sh -c curl -L 
https://github.com/openbmc/phosphor-logging/archive/b50c705c3bb3738673f98cd371b408a5b48e629a.tar.gz 
| tar -xz && cd phosphor-logging-* && ./bootstrap.sh && ./configure 
--prefix=/usr/local --enable-metadata-processing 
YAML_DIR=/usr/local/share/phosphor-dbus-yaml/yaml && make -j80 && make 
install' returned a non-zero code: 2

Thanks,
-Jason
