Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F91E485FFD
	for <lists+openbmc@lfdr.de>; Thu,  6 Jan 2022 05:46:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JTv236R6mz2yfh
	for <lists+openbmc@lfdr.de>; Thu,  6 Jan 2022 15:46:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20210112.gappssmtp.com header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=gX65Y2AU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20210112.gappssmtp.com
 header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=gX65Y2AU; dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JTv1c1ll6z2xXV
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jan 2022 15:45:53 +1100 (AEDT)
Received: by mail-lf1-x12a.google.com with SMTP id h2so2491973lfv.9
 for <openbmc@lists.ozlabs.org>; Wed, 05 Jan 2022 20:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v9TCGCK4cneOe+VXdhiO0gpjBWVplAzA86MahTVbVfg=;
 b=gX65Y2AUM35B86UL3p0BzAOrvxu3bPsjqm2RfGMxJ/fB6cNancNXTPYtNFLY6sYk3r
 fr+rQHmCi/mfL6nDvy9vK6XQrAZVXiWOskxBOjUsMIoKONs9fp6AKqwb/kLvjn9lZuqo
 ryEFe3af+qE5iN6M3P/EYqvMr7tYhMGnkkoFtR7UoQmtCb1XybuREjmzCEfQkfffCD3R
 WvE5r2CsxTUcrMSyqwLHp1fwzQCjSANhvkZBzZJOQT2DiWn4a15dxMtPEp3i7mnHKXV8
 DHWI+Cwm/O9bpPkj3dy1hQesn99nh7PSUuPvH0WwQIf8w/6LzoHfLMKjXMwaqbzeR/6V
 qmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v9TCGCK4cneOe+VXdhiO0gpjBWVplAzA86MahTVbVfg=;
 b=5fzwQeg5MqIIZmcah72OT3ku84N3H7EKmgwsgFy5eyI4iKnf8cZ1sG78CSxm9gfjum
 8MyinALeJIlcKUEP/yF0hODg+eeRl7h1hl5Ck9rq6MAgt/qaXf5AYzG8p4+iIuQTxRRb
 m/D03xs7MdR6wYP+nNwZE7QOI8JzDef5JWvvdpbKBTiFpBDiYJKPaOaZjW13kzGL/aQA
 R/NYGORAsmnACibAhlZV6AJRxJdFBSrx5HE/iEfRIFE2Ak1h7uilBc2OEBGtYMGc6skH
 K6jVivwBv+v+dYlB6RwP3lgMVULp1a97axGzQuCcb/VwDgkcL9p4zo3Qy3vdhiqsFPVU
 EHAQ==
X-Gm-Message-State: AOAM533dFfUmUSFCK5nK1gRTEmCFR0SG/c4gtN5XjCEHwV/iixaNMa2s
 0cy7BQxIftoqkcpXPTCwbQ85gGIujF60NBXnUwMYnA==
X-Google-Smtp-Source: ABdhPJz821pu/BpLQ8oSBaeI5Z0OFcMM4v/P5JBEcSi1v6IzrbIoZEqmhX29GCU5Ugx3kpFXe4uEEngCoZRolyyc+KM=
X-Received: by 2002:a05:6512:b06:: with SMTP id
 w6mr44351448lfu.433.1641444346150; 
 Wed, 05 Jan 2022 20:45:46 -0800 (PST)
MIME-Version: 1.0
References: <9ab8b62c-dd62-7dee-ba15-5785035bf343@linux.alibaba.com>
In-Reply-To: <9ab8b62c-dd62-7dee-ba15-5785035bf343@linux.alibaba.com>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 5 Jan 2022 20:45:34 -0800
Message-ID: <CACWQX80N9iT6j_MaZBdQbKj0DU_C4VYz-kYktOa0SK56Lm03kA@mail.gmail.com>
Subject: Re: netipmid consumes much CPU when obmc-console socket is shutdown
To: Heyi Guo <guoheyi@linux.alibaba.com>
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
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>,
 openbmc <openbmc@lists.ozlabs.org>, Tom Joseph <rushtotom@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jan 4, 2022 at 6:31 PM Heyi Guo <guoheyi@linux.alibaba.com> wrote:
>
> Hi all,
>
> We found netipmid will consumes much CPU when SOL is activated but
> obmc-console socket is shutdown by some reason (can simply shutdown
> obmc-console by systemctl stop ....).
>
> After obmc-console socket is closed, the async_wait() in
> startHostConsole() is always triggered, and consoleInputHandler() will
> read empty data (readSize == 0 and readDataLen == 0), but all the ec
> condition check will NOT hit!
>
>  From boost reference, it is said the function read_some() will:
>
> The function call will block until one or more bytes of data has been
> read successfully, or until an error occurs.
>
> Is it a bug of boost? Or is there anything wrong in ipmi-net? And how
> can we make netipmid more robust on obmc-console socket shutdown?
>

With not much knowledge of IPMI, but coming from a lot of knowledge of
boost and asio, that usage looks odd.  Instead of the
consoleSocket.async_wait done here:
https://github.com/openbmc/phosphor-net-ipmid/blob/12d199b27764496bfff8a45661239b1e509c336f/sol/sol_manager.cpp#L92
Which then calls into a blocking async_read on the socket, I would've
expected a consoleSocket.async_read_some with a given buffer to reduce
the number of system calls, and to read out partial data as it's
available.  Whether or not it would have different behavior in this
case, I can't say, but doing things the more expected way, and letting
asio handle it in the expected way in the past has netted us good
results in other applications.

Another interesting thing is the use of std::deque for the console
buffer type here.
https://github.com/openbmc/phosphor-net-ipmid/blob/d4a4bed525f79c39705fa526b20ab663bb2c2069/sol/console_buffer.hpp#L12

I would've expected to see one of the streaming buffer types like
flat_buffer (https://www.boost.org/doc/libs/develop/libs/beast/doc/html/beast/ref/boost__beast__flat_buffer.html)
or multi-buffer
(https://www.boost.org/doc/libs/1_78_0/libs/beast/doc/html/beast/ref/boost__beast__multi_buffer.html),
which are designed for exactly what's being done here, streaming data
in and out of a pipe of variable lengths, and can be streamed into and
out of directly without having the extra copy.  Additionally,
deque<uint8_t> is going to have a lot of memory overhead compared to a
flat buffer type.

Not sure if any of the above is helpful to you or not, but it might
give you some things to try.

> Thanks,
>
> Heyi
>
