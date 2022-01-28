Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 986084A002E
	for <lists+openbmc@lfdr.de>; Fri, 28 Jan 2022 19:34:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JlmMQ3X2Cz3bYv
	for <lists+openbmc@lfdr.de>; Sat, 29 Jan 2022 05:34:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tanous-net.20210112.gappssmtp.com header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=D4ZNaBC9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20210112.gappssmtp.com
 header.i=@tanous-net.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=D4ZNaBC9; dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JlmM26lvnz30NB
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jan 2022 05:34:06 +1100 (AEDT)
Received: by mail-lf1-x133.google.com with SMTP id x7so13476276lfu.8
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jan 2022 10:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eLRJTn5GsbamKNn07hp+RZjvAzqsD6x5O8RenRav3wY=;
 b=D4ZNaBC90clGvxlub/biJT1KPwvbyM8hBnxMMbU6kPOXUhYIJ7BubCbvnlj5jegfLV
 DRlKlD7rhFhujh98AEpZAeg1NMZTCdyxfRuU7wvoOVxncyBp1xbq+0fQUeJ65WAzwsap
 F5jIvssHGG+Q1c36aBzyXgueDrY2GaEqjhrpsSV/HYA0JAGCEdy1/VhwmbrIEIcN7lqz
 KtJTxrGMG7VgiACXVmp/OBA3AHMn1hw/9Ri5Mq7o4Lbb0NI23gj9Ju3hM4p0cyQcmuMd
 ltrfnTsEIsYYR0M9p2QnN+kSWoKSsR8CRyPR7EqUPGt0V94oqGjLM8Ccnf2y5DOVdOkj
 WDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eLRJTn5GsbamKNn07hp+RZjvAzqsD6x5O8RenRav3wY=;
 b=Lgnnat71PHNxBpGDpdGUrVwef6qXKL5rnBO0NiaG2yos3tfk2/vDSDVVDJYnuKo/5t
 lkToCvUp2P53Xav/Il5NWEn6nqGuNpaBSp4uqkY4S4957ch4iRghqR2H+DPyHeiKpK4J
 9aLON4YhWOqwFjkRmNfNEb7xyCb5wvkxGSAZtMehT/+vIbT8rB5EuuyI7xiqVFYufPzE
 0IFanc8QPO32x48FcxHlce266oW5Vxtf9ekoecyWbGuDg6bYWgnB3mxwDfaI98r84rzs
 gdVWozl/4Wq/pXkGBu/XlAiYMpYl4vq/Nv+L47zMfOY/R6CMEgrm5qqY9lEox9Q2nOEG
 nI+A==
X-Gm-Message-State: AOAM531R4eH1Aw8DpusbBHWLiyfgrJHEQRDiAMst6z1OrAg4m2/qpOq7
 3avE0gEkUsiRZcMkHnxQFTQR/LbEL8lFfwEDl8uuqQ==
X-Google-Smtp-Source: ABdhPJxBCVZZqljvD68jXBIrSKZLJTqRMaFOaXoGwpxH0KcsSlwuVw/2ok67yfjhSHCE2KHkEHbL42BIVKGI4r6ZogM=
X-Received: by 2002:a05:6512:782:: with SMTP id
 x2mr6792687lfr.183.1643394843429; 
 Fri, 28 Jan 2022 10:34:03 -0800 (PST)
MIME-Version: 1.0
References: <9ab8b62c-dd62-7dee-ba15-5785035bf343@linux.alibaba.com>
 <CACWQX80N9iT6j_MaZBdQbKj0DU_C4VYz-kYktOa0SK56Lm03kA@mail.gmail.com>
 <cfa9fa4f-09cd-1ca4-ce06-30bb9515c31e@linux.alibaba.com>
In-Reply-To: <cfa9fa4f-09cd-1ca4-ce06-30bb9515c31e@linux.alibaba.com>
From: Ed Tanous <ed@tanous.net>
Date: Fri, 28 Jan 2022 10:33:52 -0800
Message-ID: <CACWQX83C3rSkc=D1DQvM=vzf3r3o_7Oc7P-oFVYA-iVrWz9y9A@mail.gmail.com>
Subject: Re: netipmid consumes much CPU when obmc-console socket is shutdown
To: Heyi Guo <guoheyi@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Jan 14, 2022 at 6:08 AM Heyi Guo <guoheyi@linux.alibaba.com> wrote:
>
> Hi Ed,
>
> Thanks for your advice. I'll make a try later. But I'm still curious why
> boost read_some() function returns with 0 data byte and none error code,
> which seems to violate the reference obviously.

Like I said before, my guess is it's related to the fact that you're
combining an async_wait with a read_some in a way that asio didn't
intend in an evented system.

>
> Thanks,
>
> Heyi
>
> =E5=9C=A8 2022/1/6 =E4=B8=8B=E5=8D=8812:45, Ed Tanous =E5=86=99=E9=81=93:
> > On Tue, Jan 4, 2022 at 6:31 PM Heyi Guo <guoheyi@linux.alibaba.com> wro=
te:
> >> Hi all,
> >>
> >> We found netipmid will consumes much CPU when SOL is activated but
> >> obmc-console socket is shutdown by some reason (can simply shutdown
> >> obmc-console by systemctl stop ....).
> >>
> >> After obmc-console socket is closed, the async_wait() in
> >> startHostConsole() is always triggered, and consoleInputHandler() will
> >> read empty data (readSize =3D=3D 0 and readDataLen =3D=3D 0), but all =
the ec
> >> condition check will NOT hit!
> >>
> >>   From boost reference, it is said the function read_some() will:
> >>
> >> The function call will block until one or more bytes of data has been
> >> read successfully, or until an error occurs.
> >>
> >> Is it a bug of boost? Or is there anything wrong in ipmi-net? And how
> >> can we make netipmid more robust on obmc-console socket shutdown?
> >>
> > With not much knowledge of IPMI, but coming from a lot of knowledge of
> > boost and asio, that usage looks odd.  Instead of the
> > consoleSocket.async_wait done here:
> > https://github.com/openbmc/phosphor-net-ipmid/blob/12d199b27764496bfff8=
a45661239b1e509c336f/sol/sol_manager.cpp#L92
> > Which then calls into a blocking async_read on the socket, I would've
> > expected a consoleSocket.async_read_some with a given buffer to reduce
> > the number of system calls, and to read out partial data as it's
> > available.  Whether or not it would have different behavior in this
> > case, I can't say, but doing things the more expected way, and letting
> > asio handle it in the expected way in the past has netted us good
> > results in other applications.
> >
> > Another interesting thing is the use of std::deque for the console
> > buffer type here.
> > https://github.com/openbmc/phosphor-net-ipmid/blob/d4a4bed525f79c39705f=
a526b20ab663bb2c2069/sol/console_buffer.hpp#L12
> >
> > I would've expected to see one of the streaming buffer types like
> > flat_buffer (https://www.boost.org/doc/libs/develop/libs/beast/doc/html=
/beast/ref/boost__beast__flat_buffer.html)
> > or multi-buffer
> > (https://www.boost.org/doc/libs/1_78_0/libs/beast/doc/html/beast/ref/bo=
ost__beast__multi_buffer.html),
> > which are designed for exactly what's being done here, streaming data
> > in and out of a pipe of variable lengths, and can be streamed into and
> > out of directly without having the extra copy.  Additionally,
> > deque<uint8_t> is going to have a lot of memory overhead compared to a
> > flat buffer type.
> >
> > Not sure if any of the above is helpful to you or not, but it might
> > give you some things to try.
> >
> >> Thanks,
> >>
> >> Heyi
> >>
