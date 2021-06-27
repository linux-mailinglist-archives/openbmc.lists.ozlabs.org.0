Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4B43B5402
	for <lists+openbmc@lfdr.de>; Sun, 27 Jun 2021 17:32:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GCZVg2Rlpz30D9
	for <lists+openbmc@lfdr.de>; Mon, 28 Jun 2021 01:32:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=QjKDQyON;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.kononenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=QjKDQyON; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GCZVN2wY6z2xfP
 for <openbmc@lists.ozlabs.org>; Mon, 28 Jun 2021 01:32:12 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id ED8CE412DE;
 Sun, 27 Jun 2021 15:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:content-language:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1624807925; x=1626622326; bh=G9N
 mYvFMtRDXXagbBYlhwEht3FaMOrQikuTDlVKjTzg=; b=QjKDQyONjPDNotQE/PJ
 yHhmuoohfEVmTv6GQeohYBpsrUxwuRX6fcH6CXkjjT9VZriQcP7Eyev/QIgsACy8
 F01+NfvHEEzZnhdUOqA+B6gw16SL2xK8lFvkDK4829oHk+9QRsnbxKNc6ml/pfg/
 nNcC8kwGQaLNBVfd9L1yicro=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CesKiO7NH2bd; Sun, 27 Jun 2021 18:32:05 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id B6E6741283;
 Sun, 27 Jun 2021 18:32:04 +0300 (MSK)
Received: from [10.199.0.27] (10.199.0.27) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Sun, 27
 Jun 2021 18:32:04 +0300
Subject: Re: [PATCH 1/6] usb:gadget:mass-storage: Improve the signature of
 SCSI handler function
To: Alan Stern <stern@rowland.harvard.edu>
References: <20210626211820.107310-1-i.kononenko@yadro.com>
 <20210626211820.107310-2-i.kononenko@yadro.com>
 <20210627141836.GC624763@rowland.harvard.edu>
From: i.kononenko <i.kononenko@yadro.com>
Message-ID: <ded6e647-6dd9-ebd0-0ea5-b20e113bf57f@yadro.com>
Date: Sun, 27 Jun 2021 18:32:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210627141836.GC624763@rowland.harvard.edu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.27]
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
Cc: Felipe Balbi <balbi@kernel.org>, openbmc@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Good morning, Alan!

First of all, thank you for your time to review my first patchset for 
the Linux Kernel and valuable advice on the right way of patchwriting!

On 27.06.2021 17:18, Alan Stern wrote:
> On Sun, Jun 27, 2021 at 12:18:14AM +0300, Igor Kononenko wrote:
>> SCSI command handlers currently have an ambiguous return value. This
> 
> (I dislike very much this way of writing patch descriptions.  Unless
> the reader has already looked at the email subject line and remembers
> that this patch affects the mass-storage gadget, he will think the
> sentence above is talking about command handlers in the SCSI core -- a
> completely different part of the kernel.  When writing patch
> descriptions, please do not assume that the reader already knows what
> the patch is about.)
> 
>> return value may indicate the length of the data written to the response
>> buffer and the command's processing status. Thus, the understanding of
>> command handling may be implicit.

First of all, thank you for your time to review my first patchset for the
Linux Kernel and valuable advice on the right way of patchwriting!

I noticed that the status/datasize return value pattern is pervasive for 
Linux and used through many subsystems. But for the f_mass_storage.c,
such approach use case is not documented anywhere, and implementation has 
too many magic-constant, e.g.
```
static int do_inquiry(struct fsg_common *common, struct fsg_buffhd *bh)
{
   ....
   return 36;
}
```
IMHO, this way is not giving the developer an explicit understanding of 
'what is the 36' and its origin.
If moving to the suggested way is unwanted, I'd keep the implementation 
as is with additional documentation for each function where uses this 
approach.
Additionally, I guess, define clarify macros of return value instead of 
magic numbers is required.

> 
> The return value is _not_ ambiguous.  If the value is >= 0 then it is
> a data length, otherwise it is a status.  Yes, this is implicit, but it
> is a very common pattern used throughout the kernel and everyone
> understands it.
> 
>> After this patch, the output buffer's size will be set in the
>> 'data_size_to_handle' field of 'struct fsg_common', and the command
>> handler's return value indicates only the processing status.
> 
> What is the reason for making this change?  Does it fix any problems
> or prepare the way for any future patches?  It seems like this is
> completely unnecessary.

Yes, the patch uses as part of the incoming implementation of refactoring
'usb:gadget:mass-storage:scsi' command handling.
I believed the suggested improvement would be useful for the community as 
an improvement of code.

> 
> Alan Stern
> 
>> Tested: By probing the USBGadget Mass-Storage on the YADRO VEGMAN
>> BMC(AST2500) sample, each SCSI command was sent through HOST->BMC; the
>> USBGadget MassStorage debug print showed all sent commands works
>> properly.
>>
>> Signed-off-by: Igor Kononenko <i.kononenko@yadro.com>


-- 
Best regards,

Igor Kononenko
