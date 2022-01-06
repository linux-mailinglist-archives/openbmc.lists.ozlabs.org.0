Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE00485E40
	for <lists+openbmc@lfdr.de>; Thu,  6 Jan 2022 02:54:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JTqCw6zMTz30QS
	for <lists+openbmc@lfdr.de>; Thu,  6 Jan 2022 12:54:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.57;
 helo=out30-57.freemail.mail.aliyun.com;
 envelope-from=guoheyi@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JTqCb1GyWz2x9b
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jan 2022 12:54:15 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R691e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426; MF=guoheyi@linux.alibaba.com;
 NM=1; PH=DS; RN=3; SR=0; TI=SMTPD_---0V13r5JL_1641434046; 
Received: from 30.225.140.71(mailfrom:guoheyi@linux.alibaba.com
 fp:SMTPD_---0V13r5JL_1641434046) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 06 Jan 2022 09:54:07 +0800
Message-ID: <36f102cc-e20c-cd57-f243-21e40600ec8e@linux.alibaba.com>
Date: Thu, 6 Jan 2022 09:54:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: netipmid consumes much CPU when obmc-console socket is shutdown
Content-Language: en-US
From: Heyi Guo <guoheyi@linux.alibaba.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <9ab8b62c-dd62-7dee-ba15-5785035bf343@linux.alibaba.com>
In-Reply-To: <9ab8b62c-dd62-7dee-ba15-5785035bf343@linux.alibaba.com>
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
 Tom Joseph <rushtotom@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi all,

Any comments?

Thanks,

Heyi

在 2022/1/5 上午10:25, Heyi Guo 写道:
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
> From boost reference, it is said the function read_some() will:
>
> The function call will block until one or more bytes of data has been 
> read successfully, or until an error occurs.
>
> Is it a bug of boost? Or is there anything wrong in ipmi-net? And how 
> can we make netipmid more robust on obmc-console socket shutdown?
>
> Thanks,
>
> Heyi
