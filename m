Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EBB2BB64C
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 21:14:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cd76z0cLDzDr0p
	for <lists+openbmc@lfdr.de>; Sat, 21 Nov 2020 07:14:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::733;
 helo=mail-qk1-x733.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=NflM21Zp; dkim-atps=neutral
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cd7683ZX7zDqfW
 for <openbmc@lists.ozlabs.org>; Sat, 21 Nov 2020 07:13:30 +1100 (AEDT)
Received: by mail-qk1-x733.google.com with SMTP id q5so10098626qkc.12
 for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2020 12:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YId9BRmWCUVFNJI9A6jYmUf7rHd1VAgoparyQ8VwfGE=;
 b=NflM21ZpB8R/A/9YuHxObE0eREpVXnoLMjLUdyGMQUMOcQZDjGUS8W9v+kfKXmtkZ5
 WYXNKVp+2LYcVEyrR17Kf8GsBsdcgGPHF1J0VUdCAgXgtL2zMElljxrMoLgqK0D0C0th
 tbTfduNrRcCsR5OvTGWNivecwGUF/ihLvztg75nNiWDrXsxykryOCbzOBiLBEjD+cV0q
 fyrbLtgcWFU9CwnLa33cGpN0ASri414llhSUUXNAh7EyIbV7zxUuBQo9OddE77YRWR39
 8fVjDTxTc1I14lsPqRYq8Zo4Vf+QTjGg9MdKiQ1ozmZd2G+EBx7l5VVkPjwzn6joSZbu
 gvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YId9BRmWCUVFNJI9A6jYmUf7rHd1VAgoparyQ8VwfGE=;
 b=RLaCYUhnLFgGx6UpAG/mGuad3X9eqmq54Ip4AQs0M9q2yBVyXf8wa7T3Zia0Bd18EF
 k2x/aykE4M9ofRUg7MSQeeWZ0yOV7vmZc+IXOHWHZRi4+eCH+WojYxnz+76xwg8pN1e3
 VEx1/c7xYh4jOn1DbAgTPXFCuW5/m08RUvBeg2qD/uYuZ13LdQsXXfXUybVKtz89u16/
 Fx0iKynxSbRDnmSYySxDV6o5FFhX2QEZp/Eb8hh7JdOyeR12jYmtO5408dLfYrpAtHBa
 +S76RONe9571/kRWq98ThvUn/qe2ooOq0/MwtbuilrEBoW2+OJWNZQjzlbH3Ge9FAKuI
 GhBw==
X-Gm-Message-State: AOAM531wFKYl9539sy4gJ4JtoVrExmNmAwH3qGLNXMVcQSc24wkvl7xi
 +Mor/Aw8jCwkIZfdQIDO6nkZS2PC5+Cd7msZ0/6+TQ==
X-Google-Smtp-Source: ABdhPJzL5NaKR/2ndgA/mbdJL9vOiroqvs0HnJ9DrRUo+195F+1nGUYl1qLkukM6PLhQ3VFXCCdZCYfm78VCCLV/YoQ=
X-Received: by 2002:a37:8041:: with SMTP id b62mr18563615qkd.244.1605903201523; 
 Fri, 20 Nov 2020 12:13:21 -0800 (PST)
MIME-Version: 1.0
References: <5af426cdbf754c2d898d37d7f591464d@SCL-EXCHMB-13.phoenix.com>
 <CAO=notxPWFReD04Rmqgnitot6VP6aEKLRmKyM4gce1s4VgQ_nw@mail.gmail.com>
 <CAPnigK=gakwpicdz7ut-TN5ShQZ8HKBvZkObEJcO6qvNrs=9Xg@mail.gmail.com>
In-Reply-To: <CAPnigK=gakwpicdz7ut-TN5ShQZ8HKBvZkObEJcO6qvNrs=9Xg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 20 Nov 2020 12:13:10 -0800
Message-ID: <CAO=notyu-QqXsy_mg8-O66-GN1krQsQBt3_SBahe-JVXKKVMHw@mail.gmail.com>
Subject: Re: Failure building burn_my_bmc
To: William Kennington <wak@google.com>
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
Cc: Patrick Voelker <Patrick_Voelker@phoenix.com>,
 "OpenBMC \(openbmc@lists.ozlabs.org\)" <openbmc@lists.ozlabs.org>,
 "anoo@us.ibm.com" <anoo@us.ibm.com>,
 "brandonkim@google.com" <brandonkim@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Nov 20, 2020 at 11:33 AM William Kennington <wak@google.com> wrote:
>
> Just make sure you have span-lite installed first if you are installing everything locally https://github.com/martinmoene/span-lite

William, if that isn't in the instructions, please update them.

Thanks!

>
> On Wed, Nov 18, 2020 at 7:28 PM Patrick Venture <venture@google.com> wrote:
>>
>> On Wed, Nov 18, 2020 at 3:18 PM Patrick Voelker
>> <Patrick_Voelker@phoenix.com> wrote:
>> >
>> > I'm having an issue building burn_my_bmc with the instructions listed on https://github.com/openbmc/phosphor-ipmi-flash . Got through building all the dependencies but I get the following errors when building
>> pci.cpp.  Looks like maybe stdplus changed?
>>
>> William, PTAL, thanks!
>>
>> >
>> > pvoelker@bmc-dev:~/bmc/host-tool/phosphor-ipmi-flash$ make
>> > make  all-recursive
>> > make[1]: Entering directory '/home/pvoelker/bmc/host-tool/phosphor-ipmi-flash'
>> > Making all in .
>> > make[2]: Entering directory '/home/pvoelker/bmc/host-tool/phosphor-ipmi-flash'
>> >   CXX      internal/libfirmware_common_la-sys.lo
>> >   CXXLD    libfirmware_common.la
>> > ar: `u' modifier ignored since `D' is the default (see `U')
>> > make[2]: Leaving directory '/home/pvoelker/bmc/host-tool/phosphor-ipmi-flash'
>> > Making all in tools
>> > make[2]: Entering directory '/home/pvoelker/bmc/host-tool/phosphor-ipmi-flash/tools'
>> > Making all in .
>> > make[3]: Entering directory '/home/pvoelker/bmc/host-tool/phosphor-ipmi-flash/tools'
>> >   CXX      libupdater_la-updater.lo
>> >   CXX      libupdater_la-handler.lo
>> >   CXX      libupdater_la-helper.lo
>> >   CXX      libupdater_la-bt.lo
>> >   CXX      libupdater_la-lpc.lo
>> >   CXX      libupdater_la-io.lo
>> >   CXX      libupdater_la-net.lo
>> >   CXX      libupdater_la-pci.lo
>> > In file included from pci.cpp:17:0:
>> > pci.hpp:40:39: error: 'span' in namespace 'stdplus' does not name a template type
>> >      virtual void write(const stdplus::span<const std::uint8_t> data) = 0;
>> >                                        ^~~~
>> > pci.hpp:40:43: error: expected ',' or '...' before '<' token
>> >      virtual void write(const stdplus::span<const std::uint8_t> data) = 0;
>> >                                            ^
>> > pci.hpp:51:39: error: 'span' in namespace 'stdplus' does not name a template type
>> >      virtual void write(const stdplus::span<const std::uint8_t> data) override;
>> >                                        ^~~~
>> > pci.hpp:51:43: error: expected ',' or '...' before '<' token
>> >      virtual void write(const stdplus::span<const std::uint8_t> data) override;
>> >                                            ^
>> > pci.cpp:105:44: error: 'span' in namespace 'stdplus' does not name a template type
>> >  void PciAccessBridge::write(const stdplus::span<const std::uint8_t> data)
>> >                                             ^~~~
>> > pci.cpp:105:48: error: expected ',' or '...' before '<' token
>> >  void PciAccessBridge::write(const stdplus::span<const std::uint8_t> data)
>> >                                                 ^
>> > pci.cpp: In member function 'virtual void host_tool::PciAccessBridge::write(int)':
>> > pci.cpp:107:9: error: 'data' was not declared in this scope
>> >      if (data.size() > dataLength)
>> >          ^~~~
>> > pci.cpp:107:9: note: suggested alternatives:
>> > In file included from /usr/include/c++/7/string:51:0,
>> >                  from /usr/include/c++/7/stdexcept:39,
>> >                  from /usr/include/c++/7/system_error:41,
>> >                  from ../internal/sys.hpp:19,
>> >                  from pci.hpp:20,
>> >                  from pci.cpp:17:
>> > /usr/include/c++/7/bits/range_access.h:318:5: note:   'std::data'
>> >      data(initializer_list<_Tp> __il) noexcept
>> >      ^~~~
>> > In file included from pci.cpp:26:0:
>> > /usr/local/include/fmt/format.h:952:8: note:   'fmt::v7::detail::data'
>> >  struct data : basic_data<> {};
>> >         ^~~~
>> > pci.cpp:114:36: error: 'data' was not declared in this scope
>> >      std::memcpy(addr + dataOffset, data.data(), data.size());
>> >                                     ^~~~
>> > pci.cpp:114:36: note: suggested alternatives:
>> > In file included from /usr/include/c++/7/string:51:0,
>> >                  from /usr/include/c++/7/stdexcept:39,
>> >                  from /usr/include/c++/7/system_error:41,
>> >                  from ../internal/sys.hpp:19,
>> >                  from pci.hpp:20,
>> >                  from pci.cpp:17:
>> > /usr/include/c++/7/bits/range_access.h:318:5: note:   'std::data'
>> >      data(initializer_list<_Tp> __il) noexcept
>> >      ^~~~
>> > In file included from pci.cpp:26:0:
>> > /usr/local/include/fmt/format.h:952:8: note:   'fmt::v7::detail::data'
>> >  struct data : basic_data<> {};
>> >         ^~~~
>> > Makefile:654: recipe for target 'libupdater_la-pci.lo' failed
>> > make[3]: *** [libupdater_la-pci.lo] Error 1
>> > make[3]: Leaving directory '/home/pvoelker/bmc/host-tool/phosphor-ipmi-flash/tools'
>> > Makefile:708: recipe for target 'all-recursive' failed
>> > make[2]: *** [all-recursive] Error 1
>> > make[2]: Leaving directory '/home/pvoelker/bmc/host-tool/phosphor-ipmi-flash/tools'
>> > Makefile:608: recipe for target 'all-recursive' failed
>> > make[1]: *** [all-recursive] Error 1
>> > make[1]: Leaving directory '/home/pvoelker/bmc/host-tool/phosphor-ipmi-flash'
>> > Makefile:474: recipe for target 'all' failed
>> > make: *** [all] Error 2
>> >
