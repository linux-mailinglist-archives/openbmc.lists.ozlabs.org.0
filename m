Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D741CF1C59
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 18:22:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477YHf0MVGzF5ct
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2019 04:22:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477YGy4pGhzF5Zn
 for <openbmc@lists.ozlabs.org>; Thu,  7 Nov 2019 04:21:28 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 09:21:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; d="scan'208";a="402431017"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by fmsmga005.fm.intel.com with ESMTP; 06 Nov 2019 09:21:25 -0800
Subject: Re: HTTP redirect to HTTPS for web UI
To: George Liu <liuxiwei1013@gmail.com>, Lei YU <mine260309@gmail.com>
References: <CANFuQ7A8xB_xaqMB0fj394Ov9E3RvhOvj7OVVXgqDfA51YDsSg@mail.gmail.com>
 <CAARXrtnEOUuVdZpobxnQiJ-n0ve57fiP0nu8Yw-t5jMHWShXtA@mail.gmail.com>
 <E7046336-11A9-4D82-9DDC-6DB7DF94C8C5@fuzziesquirrel.com>
 <953ff1d9-294a-025e-7c10-91ec80b81e9e@linux.intel.com>
 <CAARXrtmYykUAGr015qhRc5VAZB20_cc7pqRXmDGYag_7vZiSvA@mail.gmail.com>
 <CANFuQ7D07LrT4SZNWKwuQwj2rQGv+Qzn_cKWWHaqoHKdTyuG5g@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <817bf150-3cab-bf90-0f72-7a2d71352764@linux.intel.com>
Date: Wed, 6 Nov 2019 09:21:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CANFuQ7D07LrT4SZNWKwuQwj2rQGv+Qzn_cKWWHaqoHKdTyuG5g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/5/19 7:23 PM, George Liu wrote:
> 
> 
> Lei YU <mine260309@gmail.com <mailto:mine260309@gmail.com>> 于2019年11月 
> 6日周三 上午10:02写道：
> 
>     On Wed, Nov 6, 2019 at 1:20 AM James Feist
>     <james.feist@linux.intel.com <mailto:james.feist@linux.intel.com>>
>     wrote:
>      >
>      > On 11/4/19 4:36 PM, Brad Bishop wrote:
>      > >
>      > >
>      > >> On Oct 31, 2019, at 11:26 PM, Lei YU <mine260309@gmail.com
>     <mailto:mine260309@gmail.com>> wrote:
>      > >>
>      > >> On Thu, Oct 31, 2019 at 9:48 PM George Liu
>     <liuxiwei1013@gmail.com <mailto:liuxiwei1013@gmail.com>> wrote:
>      > >>>
>      > >>> Hi All:
>      > >>> I'm working on http redirect to https
>     task(https://github.com/ibm-openbmc/dev/issues/895).
>      > >>> I took a cursory look at the
>     design(https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/24173)
>     and did some testing.
>      > >>>
>      > >>> In bmcweb, I find it the current communication logic can only
>     listen to one communication protocol (http or https). If you listen
>     to both protocols at the same time, you need to change a lot of code
>     and communication logic.
>      > >>> If we are going to implement this feature in bmcweb, it costs
>     extra effort and it's likely the implementation is no better than
>     Nginx. so I prefer to use Nginx.
>      > >>>
>      > >>
>      > >>>  From Ed's [mail in June][1], one approach is to use boost
>     asio async_detect_ssl.
>      > >>
>      > >> But I agree with George here that it costs extra and unnecessary
>      > >> effort, because with nginx it is so easy to config the http->https
>      > >> redirection, and it is easy to get all the https related configs
>      > >> right, including HSTS.
>      > >> In other words, we got such features for free (except for a
>     few binary
>      > >> size), why bother re-write it?
>      > >>
>      > >> Considering the binary size, maybe it's worth the effort to
>     check how
>      > >> many bytes are increased compared between:
>      > >> 1. Current implement that bmcweb handles https only
>      > >> 2. Enable BMCWEB_INSECURE, opt-out all https related code in
>     bmcweb,
>      > >> adding a basic nginx and a configure file that does the https
>      > >> redirect.
>      > >>
>      > >> We could check the binary size to see if it's acceptable. Be noted
>      > >> that implementing this feature in bmcweb increases the binary
>     size as
>      > >> well.
>      > >>
>      > >>
>      > >> [1]:
>     https://lists.ozlabs.org/pipermail/openbmc/2019-June/016557.html
>      > >
>      > > FWIW I generally support solutions that re-use existing
>     software and have large communities behind them already but I do
>     remember Ed having some concerns about using bmcweb behind a proxy.
>      > >
>      > > James any chance you recall what those concerns were?  I don’t
>     think I was ever able to wrap my head around them.  Do you share
>     Ed’s concerns?
>      >
>      > I think these were the main concerns:
>      > https://security.stackexchange.com/a/107106
>      >
>      > Basically that since you're using HTTP, you leave yourself open for a
>      > man-in-the-middle attack. bmcweb does do the header trick
>     mentioned in
>      > this post, so once you navigate to your bmc once, the browser
>     remembers
>      > to always use https. I think that, along with potential binary size
>      > increases, were the biggest concerns. We also try to keep open the
>      > minimum number of ports in general as a best practice.
>      >
> 
>     As the answer indicates "A way to mitigate this is to use an HSTS
>     HTTP header"
>     It's easy to configure nginx to use HSTS header, so it's no big deal.

bmcweb already does this 
https://github.com/openbmc/bmcweb/blob/07a602993f1007b0b0b764bdb3f14f302a8d2e26/http/websocket.h#L92

https://github.com/openbmc/bmcweb/blob/07a602993f1007b0b0b764bdb3f14f302a8d2e26/include/security_headers_middleware.hpp#L32


> 
>     The potential binary size increase is a valid concern, it's worthing
>     comparing the binary size with and without nginx.
> 
> 
> Just now, I did a test.
> 
> I completely copied the Nginx configuration of meta-ibm and compared the 
> rofs binary size after compilation.
> with Nginx: 18509824
> without Nginx: 18022400
> 
> refer to: 
> https://github.com/openbmc/openbmc/tree/837851ae37a67b84f0f8c0fd310d33b5a731cc80/meta-ibm/recipes-httpd
> 
> 
>      > >
>      > > thx - brad
>      > >
> 
