Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EED316B11
	for <lists+openbmc@lfdr.de>; Wed, 10 Feb 2021 17:24:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbQ7K6q1tzDwhb
	for <lists+openbmc@lfdr.de>; Thu, 11 Feb 2021 03:23:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=ve36fkwK; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbQ6520KFzDwcr
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2021 03:22:52 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id D65B84127D;
 Wed, 10 Feb 2021 16:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1612974166; x=1614788567; bh=pRCYMP8T6LpjBOGQQqeXs5T+V
 qtUup5wf7npXGviQS0=; b=ve36fkwKjgOxCAhUK4sgPtNLPB2D040Npiz+gGauK
 6cQY7V6d+RHOESlqSgSRn+QUof9/JPFNh2EImhdWDofP+IAP1CDmpyfFP0IQl02L
 vNh1FPLHQ++UC9wbGnl48FaZ1G4gs4jed/h49LiKNLQUQB6+dRb8pAFiieKhC3Cc
 BA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5qqVxgmFpB7H; Wed, 10 Feb 2021 19:22:46 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id E53F9411FB;
 Wed, 10 Feb 2021 19:22:45 +0300 (MSK)
Received: from [10.199.0.64] (10.199.0.64) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 10
 Feb 2021 19:22:45 +0300
Message-ID: <bd5b3fc428578b8cea195a250866e368ccce3be0.camel@yadro.com>
Subject: Re: peci-pcie CI issues
From: Andrei Kartashev <a.kartashev@yadro.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 <openbmc@lists.ozlabs.org>
Date: Wed, 10 Feb 2021 19:22:44 +0300
In-Reply-To: <b71222f2-c0dc-cc30-afb8-c3a8669279f8@linux.intel.com>
References: <6c2c44435e704f6eee95b7e35cbc39ccfae32b62.camel@yadro.com>
 <EC305987-22B3-40D2-86A6-4FF95B395956@stwcx.xyz>
 <CACWQX82quUYK+r0BkDqT0ZABXgRPj797Wwr8Joov05w8tCLwuA@mail.gmail.com>
 <27dbc305c6c53c338b5eefec68fbcda38ff44672.camel@yadro.com>
 <YCPPbAlAUHtn+Vv1@heinlein>
 <b71222f2-c0dc-cc30-afb8-c3a8669279f8@linux.intel.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.64]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
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

I guess, it relates to this patchset:
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-logging/+/40361

On Wed, 2021-02-10 at 08:07 -0800, Bills, Jason M wrote:
> 
> On 2/10/2021 4:19 AM, Patrick Williams wrote:
> > On Wed, Feb 10, 2021 at 01:04:41PM +0300, Andrei Kartashev wrote:
> > > As far as I can see, boost was updated to 1.75.0, but looks like
> > > it
> > > didn't help, CI still failed to build peci-pcie:
> > > https://jenkins.openbmc.org/job/ci-repository/12229/console
> > > 
> > 
> > Hi Andrei,
> > 
> > Repository-level CI isn't done with bitbake but under a docker
> > build we
> > have set up.  Jason put up a patch yesterday to update that to use
> > Boost
> > 1.75[1].  Once that is merged then the `ci-repository` job will use
> > the
> > desired Boost version.
> > 
> > 1. 
> > https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-build-scripts/+/40426
> > 
> 
> It looks like there is a new failure after the boost 1.75
> update.  Does 
> anyone know what this error means?  I also see this error on another 
> repo: https://jenkins.openbmc.org/job/ci-repository/12253/.
> 
>    CXX 
> xyz/openbmc_project/Logging/Internal/Manager/phosphor_log_manager-
> server.o
> In file included from /usr/include/c++/10/memory:83,
>                   from /usr/local/include/sdbusplus/message.hpp:11,
>                   from /usr/local/include/sdbusplus/bus.hpp:7,
>                   from /usr/local/include/sdbusplus/server.hpp:3,
>                   from 
> /usr/local/include/xyz/openbmc_project/Logging/ErrorBlocksTransition/
> server.hpp:5,
>                   from elog_block.hpp:5,
>                   from log_manager.hpp:3,
>                   from log_manager.cpp:3:
> /usr/include/c++/10/bits/unique_ptr.h: In instantiation of 'typename 
> std::_MakeUniq<_Tp>::__single_object std::make_unique(_Args&& ...)
> [with 
> _Tp = phosphor::logging::Entry; _Args = {sdbusplus::bus::bus&, 
> std::__cxx11::basic_string<char, std::char_traits<char>, 
> std::allocator<char> >&, unsigned int&, long int&, 
> sdbusplus::xyz::openbmc_project::Logging::server::Entry::Level&, 
> std::__cxx11::basic_string<char, std::char_traits<char>, 
> std::allocator<char> >, std::vector<std::__cxx11::basic_string<char, 
> std::char_traits<char>, std::allocator<char> >, 
> std::allocator<std::__cxx11::basic_string<char,
> std::char_traits<char>, 
> std::allocator<char> > > >, 
> std::vector<std::tuple<std::__cxx11::basic_string<char, 
> std::char_traits<char>, std::allocator<char> >, 
> std::__cxx11::basic_string<char, std::char_traits<char>, 
> std::allocator<char> >, std::__cxx11::basic_string<char, 
> std::char_traits<char>, std::allocator<char> > >, 
> std::allocator<std::tuple<std::__cxx11::basic_string<char, 
> std::char_traits<char>, std::allocator<char> >, 
> std::__cxx11::basic_string<char, std::char_traits<char>, 
> std::allocator<char> >, std::__cxx11::basic_string<char, 
> std::char_traits<char>, std::allocator<char> > > > >, const 
> std::__cxx11::basic_string<char, std::char_traits<char>, 
> std::allocator<char> >&, phosphor::logging::internal::Manager&}; 
> typename std::_MakeUniq<_Tp>::__single_object = 
> std::unique_ptr<phosphor::logging::Entry>]':
> log_manager.cpp:235:74:   required from here
> /usr/include/c++/10/bits/unique_ptr.h:962:30: error: invalid 
> new-expression of abstract class type 'phosphor::logging::Entry'
>    962 |     { return unique_ptr<_Tp>(new 
> _Tp(std::forward<_Args>(__args)...)); }
>        | 
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from log_manager.hpp:4,
>                   from log_manager.cpp:3:
> elog_entry.hpp:38:7: note:   because the following virtual functions
> are 
> pure within 'phosphor::logging::Entry':
>     38 | class Entry : public EntryIfaces
>        |       ^~~~~
> In file included from elog_entry.hpp:3,
>                   from log_manager.hpp:4,
>                   from log_manager.cpp:3:
> /usr/local/include/xyz/openbmc_project/Logging/Entry/server.hpp:92:45
> : 
> note:     'virtual sdbusplus::message::unix_fd 
> sdbusplus::xyz::openbmc_project::Logging::server::Entry::getEntry()'
>     92 |         virtual sdbusplus::message::unix_fd getEntry(
>        |                                             ^~~~~~~~
> In file included from /usr/include/c++/10/memory:83,
>                   from /usr/local/include/sdbusplus/message.hpp:11,
>                   from /usr/local/include/sdbusplus/bus.hpp:7,
>                   from /usr/local/include/sdbusplus/server.hpp:3,
>                   from 
> /usr/local/include/xyz/openbmc_project/Logging/ErrorBlocksTransition/
> server.hpp:5,
>                   from elog_block.hpp:5,
>                   from log_manager.hpp:3,
>                   from log_manager.cpp:3:
> /usr/include/c++/10/bits/unique_ptr.h: In instantiation of 'typename 
> std::_MakeUniq<_Tp>::__single_object std::make_unique(_Args&& ...)
> [with 
> _Tp = phosphor::logging::Entry; _Args = {sdbusplus::bus::bus&, 
> std::__cxx11::basic_string<char, std::char_traits<char>, 
> std::allocator<char> >, long int&, 
> phosphor::logging::internal::Manager&}; typename 
> std::_MakeUniq<_Tp>::__single_object = 
> std::unique_ptr<phosphor::logging::Entry>]':
> log_manager.cpp:571:68:   required from here
> /usr/include/c++/10/bits/unique_ptr.h:962:30: error: invalid 
> new-expression of abstract class type 'phosphor::logging::Entry'
>    962 |     { return unique_ptr<_Tp>(new 
> _Tp(std::forward<_Args>(__args)...)); }
>        | 
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    CXXLD    libphosphor_logging.la
>    CXXLD    logging-test
>    CXXLD    callout-test
> make[2]: Leaving directory 
> '/phosphor-logging-b50c705c3bb3738673f98cd371b408a5b48e629a'
> make[2]: *** [Makefile:1631: phosphor_log_manager-log_manager.o]
> Error 1
> make[1]: *** [Makefile:2013: all-recursive] Error 1
> make[1]: Leaving directory 
> '/phosphor-logging-b50c705c3bb3738673f98cd371b408a5b48e629a'
> make: *** [Makefile:910: all] Error 2
> The command '/bin/sh -c curl -L 
> https://github.com/openbmc/phosphor-logging/archive/b50c705c3bb3738673f98cd371b408a5b48e629a.tar.gz 
> > tar -xz && cd phosphor-logging-* && ./bootstrap.sh && ./configure 
> --prefix=/usr/local --enable-metadata-processing 
> YAML_DIR=/usr/local/share/phosphor-dbus-yaml/yaml && make -j80 &&
> make 
> install' returned a non-zero code: 2
> 
> Thanks,
> -Jason
-- 
Best regards,
Andrei Kartashev


