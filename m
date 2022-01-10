Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 234064896E5
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 12:02:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXW9f6xHKz2yPp
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 22:01:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=OersIMM5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.kononenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=OersIMM5; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXW9G1lTQz2yHM
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jan 2022 22:01:38 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id E1BA34758E;
 Mon, 10 Jan 2022 11:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:content-language:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1641812493; x=1643626894; bh=/DC
 6tINeiFmrDZAqRmTxHrAo9V4Xr79MYEkSms8JgDs=; b=OersIMM5qErBQjO54p6
 oDoQ6taeSY1zeBWLxb3HdhCJC48gG5PxLKObkJXgh0nIQjeI99G9rSlQsukeyY2d
 AVfhgUkvUX8I6FCU8bqCvS2nIp732AXe9IN+TnuXpjMAUTw6CoA2EB68GcBi74ba
 aIEJ6aiPqapHdEskZnj5+LhU=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vrVQeuDMfr1d; Mon, 10 Jan 2022 14:01:33 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id CD90946BB4;
 Mon, 10 Jan 2022 14:01:32 +0300 (MSK)
Received: from [10.199.10.196] (10.199.10.196) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 10
 Jan 2022 14:01:30 +0300
Subject: Re: Feature Enhancement - Virtual Media over HTML5
To: Dhines Kumar Eswaran <dhineskumare@ami.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "ed@tanous.net" <ed@tanous.net>, "jk@ozlabs.org"
 <jk@ozlabs.org>, "geissonator@yahoo.com" <geissonator@yahoo.com>,
 "raviteja28031990@gmail.com" <raviteja28031990@gmail.com>,
 "gmills@us.ibm.com" <gmills@us.ibm.com>
References: <CO1PR10MB4804435C69CA969461FCCF61C8509@CO1PR10MB4804.namprd10.prod.outlook.com>
From: i.kononenko <i.kononenko@yadro.com>
Message-ID: <dddccb48-51aa-b63a-5f7a-9ed16b14fa82@yadro.com>
Date: Mon, 10 Jan 2022 14:01:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CO1PR10MB4804435C69CA969461FCCF61C8509@CO1PR10MB4804.namprd10.prod.outlook.com>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.10.196]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
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
Cc: Gayatri L <gayathril@ami.com>, Pravinash Jeyapaul <pravinashj@ami.com>,
 Sanjay Ahuja <SanjayA@ami.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 10.01.2022 13:25, Dhines Kumar Eswaran wrote:
> Hi All,
> 
> We are planning to support multiple Virtual media redirection support simultaneously.
> The below is the proposed design.
> 

Do you already saw the current work upon redesigning the jsnbd? What backend you are want to use?
The current progress of the nbd-proxy(jsnbd) might conflict with your design if it is based on the current nbd-proxy.
Please, refer to the appropriate gerrit change (1). 

> Existing Virtual media implementation:
> 
> WebUI is having single browse slot. It is used to redirect any kind of media, which can be either CD or HDD media instance.
> It is mapped with "/vm/0/0" API endpoint, and media endpoint is hardcoded to 0(Zero).
> 
> Virtual media is using "/dev/nbd0" device, and Dump offload is using "/dev/nbd1" device. It is parsing from the jsnbd configuration file.
> 
> Enhancement: Multiple simultaneous media redirections feature in single WebUI session.
> 
> WebUI will have two different browse slots to select the file, (i.e., ) Virtual media device - HDD and Virtual media device - CD. Both slots will support media redirection concurrently.
> 

We already have worked in the past to make able configure virtual-media device type by client request. E.g. in the usb-ctrl, we have a flag to specify whether USB, USB-RO, HDD, CD(DVD) VM-type.
Is it really required to have separate VM-endpoints for the CD and HDD types?

> Virtual media device - HDD slot is mapped through "/vm/0/0" API endpoint and media endpoint is 0(zero) which is used for initiating the proxy handler, which is present in bmcweb package.
> HDD slot will use "/dev/nbd0" device for HDD media instance redirection.
> 
> Virtual media device - CD slot is mapped through "/vm/0/1" API endpoint and media endpoint is 1(one) which is used for initiating the proxy handler, which is present in bmcweb package.
> CD slot will use "/dev/nbd1" device for CD media instance redirection.
> 
> Dump offload will use "/dev/nbd2" device. It is also parsing the nbd device from jsnbd configuration file.
> 
> Configuration file looks like,
> [cid:image001.jpg@01D80639.FCBD3330]
> 
> This is an extension with what the community has implemented and I hope, it does not have any regression or conflict with others who are using virtual media and nbd devices.
> Please help to review the proposed implementation, so that, I can go ahead with implementing the enhancement.
> 
> Thanks,
> Dinesh E
> 
> 
> 
> -The information contained in this message may be confidential and proprietary to American Megatrends (AMI). This communication is intended to be read only by the individual or entity to whom it is addressed or by their designee. If the reader of this message is not the intended recipient, you are on notice that any distribution of this message, in any form, is strictly prohibited. Please promptly notify the sender by reply e-mail or by telephone at 770-246-8600, and then delete or destroy all copies of the transmission.
> 


Links:
[1] - https://gerrit.openbmc-project.xyz/c/openbmc/jsnbd/+/49944

-- 
Best regards,

Igor Kononenko
