Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BF43B5C86
	for <lists+openbmc@lfdr.de>; Mon, 28 Jun 2021 12:35:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GD3s63MK6z30Hk
	for <lists+openbmc@lfdr.de>; Mon, 28 Jun 2021 20:35:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=P8xmtN6G;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.kononenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=P8xmtN6G; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GD3rn4X0lz2xfL
 for <openbmc@lists.ozlabs.org>; Mon, 28 Jun 2021 20:34:49 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id AD8BD412DD;
 Mon, 28 Jun 2021 10:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:content-language:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1624876485; x=1626690886; bh=h6J
 FlH/Jsd3hyI2eHMPt7WEF6GPQzhUy1Er1mZznFN0=; b=P8xmtN6G6PTjOl+AvDK
 L4mQgD0nXIHo2fhF2xMiE886ukY4W5Ud+PdprTA853/K2rut4X8HQbL132x1aUC7
 IJfPij0O9fF9snQhD1rIKPg5hqUZn76uSA4vxTDkTqVOGUtT/m9ta6DX93ExG2oR
 qf67hty2aYcCalVLCzVwWkM4=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6OTlD2IuWZds; Mon, 28 Jun 2021 13:34:45 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id A753141259;
 Mon, 28 Jun 2021 13:34:44 +0300 (MSK)
Received: from [10.199.0.61] (10.199.0.61) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 28
 Jun 2021 13:34:43 +0300
Subject: Re: [PATCH 5/6] FMS: Add the SCSI Get Configuration command.
To: Christoph Hellwig <hch@infradead.org>
References: <20210626211820.107310-1-i.kononenko@yadro.com>
 <20210626211820.107310-6-i.kononenko@yadro.com>
 <YNmcNvqvTFNCrMl9@infradead.org>
From: i.kononenko <i.kononenko@yadro.com>
Message-ID: <2eb28492-f604-9c26-06a2-57817ad28f52@yadro.com>
Date: Mon, 28 Jun 2021 13:34:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YNmcNvqvTFNCrMl9@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.61]
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
Cc: Jens Axboe <axboe@kernel.dk>, Felipe Balbi <balbi@kernel.org>,
 linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 28.06.2021 12:53, Christoph Hellwig wrote:
> What is FMS?  And why do only patches 5 and 6 show up on the list?
> And why does this mix changes to the SCSI layer, libata, usb-gadget and
> the CDROM UAPI in a single patch?
> 

It looks like my 'git email-send' has appended up the separate respondents
for each PATCH of the patchset. It is my first experience publishing 
patches for the community. Sorry, I will be careful in the future.

Several patches have already been reviewed, and these need to be improved.
I will prepare the new version of the patchset and will publish it with 
the appropriate list of respondents for each one.

From your letter, I noticed the commit messages also need to improve and
should be more clear. The descriptions will be updated either.

-- 
Best regards,

Igor Kononenko
