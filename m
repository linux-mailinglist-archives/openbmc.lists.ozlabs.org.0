Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3EB148DB0
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2020 19:18:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4846p91dVgzDqfX
	for <lists+openbmc@lfdr.de>; Sat, 25 Jan 2020 05:18:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4846mB1mF1zDqfF
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jan 2020 05:16:40 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jan 2020 10:10:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,358,1574150400"; d="scan'208";a="221092526"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148])
 ([10.7.153.148])
 by orsmga008.jf.intel.com with ESMTP; 24 Jan 2020 10:10:51 -0800
Subject: Re: ikvm on AST2500
To: Konstantin Klubnichkin <kitsok@yandex-team.ru>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <236301579791580@vla5-c30c59847b9e.qloud-c.yandex.net>
 <81118db3-4259-254f-9e91-0f26e6d84c0d@linux.intel.com>
 <278601579850868@vla1-bfecef18a7a0.qloud-c.yandex.net>
 <554421579867510@iva4-6d0ca09d92db.qloud-c.yandex.net>
 <2311579872845@myt4-457577cc370d.qloud-c.yandex.net>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <c390bf3d-dd34-8a65-99d2-d2ada525032b@linux.intel.com>
Date: Fri, 24 Jan 2020 10:10:51 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2311579872845@myt4-457577cc370d.qloud-c.yandex.net>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Konstantin,

The -p and -k options are required for mouse and keyboard supports in
ikvm. If you don't need to use these supports, it'd be okay to go with
your fixes. You may need to check kernel configs for USB virtual hub and
USB gadget supports in case if you are going to use the mouse and
keyboard support in ikvm.

Cheers,

Jae

On 1/24/2020 5:34 AM, Konstantin Klubnichkin wrote:
> Sorry for spamming, but may be my experience will help somebody.
> I've finally got an image both in vncviewer and web interface after 
> starting ikvm without -p and -k parameters.
> 24.01.2020, 15:29, "Konstantin Klubnichkin" <kitsok@yandex-team.ru>:
> 
>     Okay, I've got KVM in web interface after following patch:
>     =====================================================================
>      From c4fec3c77678318a54bb721633dd82d26ac80217 Mon Sep 17 00:00:00 2001
>     From: Konstantin Klubnichkin <kitsok@yandex-team.ru
>     <mailto:kitsok@yandex-team.ru>>
>     Date: Fri, 24 Jan 2020 12:15:39 +0300
>     Subject: [PATCH 1/1] Connect to 127.0.0.1 instead of ::1
>     ---
>     include/kvm_websocket.hpp | 2 +-
>     1 file changed, 1 insertion(+), 1 deletion(-)
>     diff --git a/include/kvm_websocket.hpp b/include/kvm_websocket.hpp
>     index 306c684..ed7c8cf 100644
>     --- a/include/kvm_websocket.hpp
>     +++ b/include/kvm_websocket.hpp
>     @@ -21,7 +21,7 @@ class KvmSession
>     conn(conn), hostSocket(conn.get_io_context()), doingWrite(false)
>     {
>     boost::asio::ip::tcp::endpoint endpoint(
>     - boost::asio::ip::make_address("::1"), 5900);
>     + boost::asio::ip::make_address("127.0.0.1"), 5900);
>     hostSocket.async_connect(
>     endpoint, [this, &conn](const boost::system::error_code& ec) {
>     if (ec)
>     --
>     1.9.1
>     =====================================================================
>     According to netstat -anp, obmc-ikvm really doesn't listen on IPv6
>     address:
>     tcp 7 0 127.0.0.1:5900 0.0.0.0:* LISTEN 272/obmc-ikvm
>     But still there is a black screen.
>     Will try to debug obmc-ikvm
>     Thank you!
>     24.01.2020, 10:28, "Konstantin Klubnichkin" <kitsok@yandex-team.ru
>     <mailto:kitsok@yandex-team.ru>>:
> 
>         Hello, Jae!
>         No luck with TightVNC.
>         I've started tcpdump -i lo port 5900 on my PC and found that
>         there are some packets during first VNC window draw, but then
>         there is no traffic even when the image is changing on the
>         hosts' screen.
>         bmcweb shows nothing at all on KVM page, will try to understand why.
>         Thank you!
>         23.01.2020, 20:22, "Jae Hyun Yoo" <jae.hyun.yoo@linux.intel.com
>         <mailto:jae.hyun.yoo@linux.intel.com>>:
> 
>             Hello Konstantin,
> 
>             Please give it a try again using TightVNC viewer. ikvm uses
>             the Tight
>             encoding so viewer should support the format. Or, you can
>             use bmcweb
>             instead.
> 
>             Cheers,
> 
>             Jae
> 
>                   Thank you!
>                   --
>                   Best regards,
>                   Konstantin Klubnichkin,
>                   lead firmware engineer,
>                   server hardware R&D group,
>                   Yandex Moscow office.
>                   tel: +7-903-510-33-33
> 
>         -- 
>         Best regards,
>         Konstantin Klubnichkin,
>         lead firmware engineer,
>         server hardware R&D group,
>         Yandex Moscow office.
>         tel: +7-903-510-33-33
> 
>     -- 
>     Best regards,
>     Konstantin Klubnichkin,
>     lead firmware engineer,
>     server hardware R&D group,
>     Yandex Moscow office.
>     tel: +7-903-510-33-33
> 
> -- 
> Best regards,
> Konstantin Klubnichkin,
> lead firmware engineer,
> server hardware R&D group,
> Yandex Moscow office.
> tel: +7-903-510-33-33
