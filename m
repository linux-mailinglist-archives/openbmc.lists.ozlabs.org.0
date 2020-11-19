Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1CE2B8908
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 01:29:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cc0tQ3CMDzDqdL
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 11:29:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::835;
 helo=mail-qt1-x835.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=XQGfd63C; dkim-atps=neutral
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cc0sc5pHmzDqd7
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2020 11:28:49 +1100 (AEDT)
Received: by mail-qt1-x835.google.com with SMTP id b16so3168185qtb.6
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2020 16:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7Rj/3u61GwJewIt5QiSHLQ+sghdPXsVyvkkqIrW9how=;
 b=XQGfd63Cr0bhSyDyvnNv2YgD8sLfJZcJpH3oZo5Q1rEEIzO0zDQRxrKE+k/wKNtcu0
 jfSyGrgtE5Vogy1P7c3Q37wO+6kkgMtAqH3F0t8EazMJccDe3SZKGZ3nKyKR+znsQ1+E
 YmAPkRvd2Ok/L52rcUPtMr95qh+EEYfnLwfsRczg5HfrC06R7enMzHShdMo1ZKrVJ0M7
 T0S9PrO8Ir/9FIjpNW0ZZlDfNQHsVVSKeY9mbHS5w6xJkq/LavRCcIp2rBbKgdWdO0o1
 0AQU/WfQsm01MgbQf8xv8rbVMLupklcaOxxUE/+6uo0KkCACghQHroODE+BiqYysWO7p
 Ch4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Rj/3u61GwJewIt5QiSHLQ+sghdPXsVyvkkqIrW9how=;
 b=Al8dMAx9eY4B2Rt7piKy4M5CrgX42B7KczXHB3ELDPLDaGIN1D9dtKYZoSUBp4Cd7L
 FunQAgLb4lx6C3vRhJVjBLjgX/DIo6HqlSGQ29HWjCbjCPQsiKCYeHBzVOphXrpYlU8v
 JZ3dX4eT9iDrBVY7fhSnZZ9ZSrr887FfNKCs3Udp92XQvOK3RB0EW6Mw4/UMtogeoHgv
 9YSfnZFvzU62cBBdpuzvaPeeY//FP4BZm/72vvn1fP8RPwmJ9ONFwINh+RlzBj6kh9Vn
 A18X5yv+DoOn3UQ7J/8ZTR1i0AU26DCybVN1vL5SXvhAwWSxP5aTXGDwYyKvRHKJqU1G
 m2Rg==
X-Gm-Message-State: AOAM532B2FgXimauIgrdGlUrPPX8aymDGFOhQoFVUk/Ecmoj/COAyrWj
 gs4EF34RvSliFfUlMSsSpIiHep3xP+mF/KRsAc9EVg==
X-Google-Smtp-Source: ABdhPJyZ5lD+SC3WZ3ZZ2pkZF9SU07kMK06ZvV0rog9s2RPwgeKFteWZuJub8hkvOLwdSnHBXIaoZioMp63mqUG0ilw=
X-Received: by 2002:ac8:36bc:: with SMTP id a57mr7849560qtc.193.1605745725718; 
 Wed, 18 Nov 2020 16:28:45 -0800 (PST)
MIME-Version: 1.0
References: <5af426cdbf754c2d898d37d7f591464d@SCL-EXCHMB-13.phoenix.com>
In-Reply-To: <5af426cdbf754c2d898d37d7f591464d@SCL-EXCHMB-13.phoenix.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 18 Nov 2020 16:28:34 -0800
Message-ID: <CAO=notxPWFReD04Rmqgnitot6VP6aEKLRmKyM4gce1s4VgQ_nw@mail.gmail.com>
Subject: Re: Failure building burn_my_bmc
To: Patrick Voelker <Patrick_Voelker@phoenix.com>,
 William Kennington <wak@google.com>
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
Cc: "OpenBMC \(openbmc@lists.ozlabs.org\)" <openbmc@lists.ozlabs.org>,
 "anoo@us.ibm.com" <anoo@us.ibm.com>,
 "brandonkim@google.com" <brandonkim@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Nov 18, 2020 at 3:18 PM Patrick Voelker
<Patrick_Voelker@phoenix.com> wrote:
>
> I'm having an issue building burn_my_bmc with the instructions listed on https://github.com/openbmc/phosphor-ipmi-flash . Got through building all the dependencies but I get the following errors when building
pci.cpp.  Looks like maybe stdplus changed?

William, PTAL, thanks!

>
> pvoelker@bmc-dev:~/bmc/host-tool/phosphor-ipmi-flash$ make
> make  all-recursive
> make[1]: Entering directory '/home/pvoelker/bmc/host-tool/phosphor-ipmi-flash'
> Making all in .
> make[2]: Entering directory '/home/pvoelker/bmc/host-tool/phosphor-ipmi-flash'
>   CXX      internal/libfirmware_common_la-sys.lo
>   CXXLD    libfirmware_common.la
> ar: `u' modifier ignored since `D' is the default (see `U')
> make[2]: Leaving directory '/home/pvoelker/bmc/host-tool/phosphor-ipmi-flash'
> Making all in tools
> make[2]: Entering directory '/home/pvoelker/bmc/host-tool/phosphor-ipmi-flash/tools'
> Making all in .
> make[3]: Entering directory '/home/pvoelker/bmc/host-tool/phosphor-ipmi-flash/tools'
>   CXX      libupdater_la-updater.lo
>   CXX      libupdater_la-handler.lo
>   CXX      libupdater_la-helper.lo
>   CXX      libupdater_la-bt.lo
>   CXX      libupdater_la-lpc.lo
>   CXX      libupdater_la-io.lo
>   CXX      libupdater_la-net.lo
>   CXX      libupdater_la-pci.lo
> In file included from pci.cpp:17:0:
> pci.hpp:40:39: error: 'span' in namespace 'stdplus' does not name a template type
>      virtual void write(const stdplus::span<const std::uint8_t> data) = 0;
>                                        ^~~~
> pci.hpp:40:43: error: expected ',' or '...' before '<' token
>      virtual void write(const stdplus::span<const std::uint8_t> data) = 0;
>                                            ^
> pci.hpp:51:39: error: 'span' in namespace 'stdplus' does not name a template type
>      virtual void write(const stdplus::span<const std::uint8_t> data) override;
>                                        ^~~~
> pci.hpp:51:43: error: expected ',' or '...' before '<' token
>      virtual void write(const stdplus::span<const std::uint8_t> data) override;
>                                            ^
> pci.cpp:105:44: error: 'span' in namespace 'stdplus' does not name a template type
>  void PciAccessBridge::write(const stdplus::span<const std::uint8_t> data)
>                                             ^~~~
> pci.cpp:105:48: error: expected ',' or '...' before '<' token
>  void PciAccessBridge::write(const stdplus::span<const std::uint8_t> data)
>                                                 ^
> pci.cpp: In member function 'virtual void host_tool::PciAccessBridge::write(int)':
> pci.cpp:107:9: error: 'data' was not declared in this scope
>      if (data.size() > dataLength)
>          ^~~~
> pci.cpp:107:9: note: suggested alternatives:
> In file included from /usr/include/c++/7/string:51:0,
>                  from /usr/include/c++/7/stdexcept:39,
>                  from /usr/include/c++/7/system_error:41,
>                  from ../internal/sys.hpp:19,
>                  from pci.hpp:20,
>                  from pci.cpp:17:
> /usr/include/c++/7/bits/range_access.h:318:5: note:   'std::data'
>      data(initializer_list<_Tp> __il) noexcept
>      ^~~~
> In file included from pci.cpp:26:0:
> /usr/local/include/fmt/format.h:952:8: note:   'fmt::v7::detail::data'
>  struct data : basic_data<> {};
>         ^~~~
> pci.cpp:114:36: error: 'data' was not declared in this scope
>      std::memcpy(addr + dataOffset, data.data(), data.size());
>                                     ^~~~
> pci.cpp:114:36: note: suggested alternatives:
> In file included from /usr/include/c++/7/string:51:0,
>                  from /usr/include/c++/7/stdexcept:39,
>                  from /usr/include/c++/7/system_error:41,
>                  from ../internal/sys.hpp:19,
>                  from pci.hpp:20,
>                  from pci.cpp:17:
> /usr/include/c++/7/bits/range_access.h:318:5: note:   'std::data'
>      data(initializer_list<_Tp> __il) noexcept
>      ^~~~
> In file included from pci.cpp:26:0:
> /usr/local/include/fmt/format.h:952:8: note:   'fmt::v7::detail::data'
>  struct data : basic_data<> {};
>         ^~~~
> Makefile:654: recipe for target 'libupdater_la-pci.lo' failed
> make[3]: *** [libupdater_la-pci.lo] Error 1
> make[3]: Leaving directory '/home/pvoelker/bmc/host-tool/phosphor-ipmi-flash/tools'
> Makefile:708: recipe for target 'all-recursive' failed
> make[2]: *** [all-recursive] Error 1
> make[2]: Leaving directory '/home/pvoelker/bmc/host-tool/phosphor-ipmi-flash/tools'
> Makefile:608: recipe for target 'all-recursive' failed
> make[1]: *** [all-recursive] Error 1
> make[1]: Leaving directory '/home/pvoelker/bmc/host-tool/phosphor-ipmi-flash'
> Makefile:474: recipe for target 'all' failed
> make: *** [all] Error 2
>
