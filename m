Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 948B01980D0
	for <lists+openbmc@lfdr.de>; Mon, 30 Mar 2020 18:18:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rd1Y07W5zDqgN
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 03:18:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=MEgPVGRC; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rd0j6wS3zDqfN
 for <openbmc@lists.ozlabs.org>; Tue, 31 Mar 2020 03:17:57 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 6EB3A4126E
 for <openbmc@lists.ozlabs.org>; Mon, 30 Mar 2020 16:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1585585071;
 x=1587399472; bh=6ojDMFvpj/jiUxD9bcws6IPJKngTS3DEH+FXJeRdpJg=; b=
 MEgPVGRCX7ZBAVobeRw1IwOuQ5Q3R9AvyyqdFvs2TSpL4ZtVCr5bAJ1YvvQjjQ/2
 2Bi9QwmWvDzA0rJkBE1DcHxr2/uk81OR4vft9gN0SeNMPCmBb65nGLcKhM26aj5F
 njzAvX6bUAotuG8p64CQ0poz93bhYe6zrJSCm16JNo8=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MinvE63bXGQl for <openbmc@lists.ozlabs.org>;
 Mon, 30 Mar 2020 19:17:51 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 311FA4126B
 for <openbmc@lists.ozlabs.org>; Mon, 30 Mar 2020 19:17:51 +0300 (MSK)
Received: from localhost (172.17.14.122) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 30
 Mar 2020 19:17:51 +0300
Date: Mon, 30 Mar 2020 19:17:50 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: <openbmc@lists.ozlabs.org>
Subject: Re: Any idea of when qemu-system-arm will be supported for
 https://github.com/Intel-BMC/openbmc ?
Message-ID: <20200330161750.GA10520@bbwork.lan>
References: <1d854d104f3a48dd8f2c3929fc93a68b@SCL-EXCHMB-13.phoenix.com>
 <20200330090018.GA20872@bbwork.lan>
 <de86f16351804487b251000e03e28fe5@SCL-EXCHMB-13.phoenix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <de86f16351804487b251000e03e28fe5@SCL-EXCHMB-13.phoenix.com>
X-Originating-IP: [172.17.14.122]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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

On Mon, Mar 30, 2020 at 02:35:55PM +0000, Bruce Mitchell wrote:
> I was looking for something like a -M wolfpass-bmc command line option like Romulus has -M romulus-bmc
> (see here: https://github.com/openbmc/docs/blob/master/development/dev-environment.md )
> 
> Yet I find no wolfpass, S2600WF, nor Intel in the -machine help list. (see below)
> 

Yes, there is no full implemented platform.

As I know, the wolfpass bmc based on aspeed ast2500 SoC. 
I can't remember why I choose exactly ast2500-evb for the tests of wolfpass.
Probably it was reported somewhere in the internal documents.

If someone has other experience or more knowledge please share it.

Alexander.
