Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E349A35094
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 22:05:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JNFN3X3XzDqW4
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2019 06:05:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JNDx0XJYzDq5t
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jun 2019 06:04:47 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2019 13:04:45 -0700
X-ExtLoop1: 1
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga001.fm.intel.com with ESMTP; 04 Jun 2019 13:04:45 -0700
Subject: Re: [Questions]Can bmcweb support both ports 80 and 443
To: openbmc@lists.ozlabs.org
References: <B851B5C7-9CF8-4F8F-81D8-3A0B3C1A231F@inspur.com>
 <20190604181759.GB46814@mauery.jf.intel.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <1adb2efb-31c5-bbc7-5325-e9656d97f813@intel.com>
Date: Tue, 4 Jun 2019 13:04:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190604181759.GB46814@mauery.jf.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 6/4/19 11:17 AM, Vernon Mauery wrote:
> On 31-May-2019 01:01 AM, Simon Zhu(朱英澍) wrote:
>> Hello,
>>
>>     Can bmcweb support both ports 80 and 443?
>>     And then we can use http://IP <http://ip/> or https://IP
>> <https://ip/> to visit bmcweb.
> 
> In general, there should be no need to use http anymore. https provides
> security and integrity. It seems like a bad idea to put users'
> information at risk by not using https.

bmcweb can support non-TLS http via the BMCWEB_INSECURE* configuration
options, although as the name implies, they are insecure, and therefore
shouldn't be enabled for anything relating to production, but is useful
in a debug context, or to compare the performance effects of encryption
on the end result.

If what you've described is something you're wanting to enable, there's
a few options that have been discussed in the past.

1. An http redirect to https.  While not the most secure option, if
implemented with the correct security headers and in a way that can be
disabled by the end user for high security environments, it does improve
the user experience when using a browser.  I'd be in full support of
this being done, if done properly.
2. A port 80 socket that allows all functions over non-encrypted
channels.  This really shouldn't be implemented, as it would involve
sending passwords in plaintext over an unentrypted socket.
Functionally, it would almost be better to have no password at all,
which might work for some people.  If this is something you really want
to pursue, we can talk more.
3. A hybrid socket using the asio async_detect_ssl thing here:
https://www.boost.org/doc/libs/1_66_0/libs/beast/example/common/detect_ssl.hpp

I've thought this would be an interesting way to implement #1, as it
could give us a compile time option to do #2 for debugging, without a
lot of code bloat by implementing both in parallel.  It's something I've
been meaning to look into for a long time, I've just had other things.

Overall, my opinion is that in production default settings, we should
never be exposing anything of value over an unencrypted socket.

-Ed
