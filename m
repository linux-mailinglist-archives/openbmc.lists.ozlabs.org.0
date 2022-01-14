Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9875948EB46
	for <lists+openbmc@lfdr.de>; Fri, 14 Jan 2022 15:08:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jb36n3QVpz30jP
	for <lists+openbmc@lfdr.de>; Sat, 15 Jan 2022 01:08:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.43;
 helo=out30-43.freemail.mail.aliyun.com;
 envelope-from=guoheyi@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jb36V5xV2z2yLy
 for <openbmc@lists.ozlabs.org>; Sat, 15 Jan 2022 01:08:01 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R751e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=guoheyi@linux.alibaba.com;
 NM=1; PH=DS; RN=4; SR=0; TI=SMTPD_---0V1oh27f_1642169273; 
Received: from 30.39.196.58(mailfrom:guoheyi@linux.alibaba.com
 fp:SMTPD_---0V1oh27f_1642169273) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 14 Jan 2022 22:07:54 +0800
Message-ID: <cfa9fa4f-09cd-1ca4-ce06-30bb9515c31e@linux.alibaba.com>
Date: Fri, 14 Jan 2022 22:07:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: netipmid consumes much CPU when obmc-console socket is shutdown
Content-Language: en-US
To: Ed Tanous <ed@tanous.net>
References: <9ab8b62c-dd62-7dee-ba15-5785035bf343@linux.alibaba.com>
 <CACWQX80N9iT6j_MaZBdQbKj0DU_C4VYz-kYktOa0SK56Lm03kA@mail.gmail.com>
From: Heyi Guo <guoheyi@linux.alibaba.com>
In-Reply-To: <CACWQX80N9iT6j_MaZBdQbKj0DU_C4VYz-kYktOa0SK56Lm03kA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>,
 openbmc <openbmc@lists.ozlabs.org>, Tom Joseph <rushtotom@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ed,

Thanks for your advice. I'll make a try later. But I'm still curious why 
boost read_some() function returns with 0 data byte and none error code, 
which seems to violate the reference obviously.

Thanks,

Heyi

在 2022/1/6 下午12:45, Ed Tanous 写道:
> On Tue, Jan 4, 2022 at 6:31 PM Heyi Guo <guoheyi@linux.alibaba.com> wrote:
>> Hi all,
>>
>> We found netipmid will consumes much CPU when SOL is activated but
>> obmc-console socket is shutdown by some reason (can simply shutdown
>> obmc-console by systemctl stop ....).
>>
>> After obmc-console socket is closed, the async_wait() in
>> startHostConsole() is always triggered, and consoleInputHandler() will
>> read empty data (readSize == 0 and readDataLen == 0), but all the ec
>> condition check will NOT hit!
>>
>>   From boost reference, it is said the function read_some() will:
>>
>> The function call will block until one or more bytes of data has been
>> read successfully, or until an error occurs.
>>
>> Is it a bug of boost? Or is there anything wrong in ipmi-net? And how
>> can we make netipmid more robust on obmc-console socket shutdown?
>>
> With not much knowledge of IPMI, but coming from a lot of knowledge of
> boost and asio, that usage looks odd.  Instead of the
> consoleSocket.async_wait done here:
> https://github.com/openbmc/phosphor-net-ipmid/blob/12d199b27764496bfff8a45661239b1e509c336f/sol/sol_manager.cpp#L92
> Which then calls into a blocking async_read on the socket, I would've
> expected a consoleSocket.async_read_some with a given buffer to reduce
> the number of system calls, and to read out partial data as it's
> available.  Whether or not it would have different behavior in this
> case, I can't say, but doing things the more expected way, and letting
> asio handle it in the expected way in the past has netted us good
> results in other applications.
>
> Another interesting thing is the use of std::deque for the console
> buffer type here.
> https://github.com/openbmc/phosphor-net-ipmid/blob/d4a4bed525f79c39705fa526b20ab663bb2c2069/sol/console_buffer.hpp#L12
>
> I would've expected to see one of the streaming buffer types like
> flat_buffer (https://www.boost.org/doc/libs/develop/libs/beast/doc/html/beast/ref/boost__beast__flat_buffer.html)
> or multi-buffer
> (https://www.boost.org/doc/libs/1_78_0/libs/beast/doc/html/beast/ref/boost__beast__multi_buffer.html),
> which are designed for exactly what's being done here, streaming data
> in and out of a pipe of variable lengths, and can be streamed into and
> out of directly without having the extra copy.  Additionally,
> deque<uint8_t> is going to have a lot of memory overhead compared to a
> flat buffer type.
>
> Not sure if any of the above is helpful to you or not, but it might
> give you some things to try.
>
>> Thanks,
>>
>> Heyi
>>
