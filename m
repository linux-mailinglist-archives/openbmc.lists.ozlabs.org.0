Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4F719775F
	for <lists+openbmc@lfdr.de>; Mon, 30 Mar 2020 11:01:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rRKV2bTfzDqjJ
	for <lists+openbmc@lfdr.de>; Mon, 30 Mar 2020 20:01:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=mlCjVRfy; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rRHt2w4dzDqGq
 for <openbmc@lists.ozlabs.org>; Mon, 30 Mar 2020 20:00:26 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 590F541288
 for <openbmc@lists.ozlabs.org>; Mon, 30 Mar 2020 09:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1585558819;
 x=1587373220; bh=/xWJuq0QCP0qwPjmlFFZN+qPWJtAZ/u1YPEX4WhdD2Q=; b=
 mlCjVRfyptO4P95wbpwPdHCenztGG+JmEiiu0iSHLHbrVao3ar+Nhjy873rc6RLE
 m+QImJ9kZjmWQosnBaRZaIqSQoXtjkk/lfgXb77OIT5m9hJKiXC7gPxhJ9cvWW+5
 R5JuPJfPMkB/ygpOgxf5ctcfcKS/JGFtqNCZIP8kfIM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nV2BezITKfOM for <openbmc@lists.ozlabs.org>;
 Mon, 30 Mar 2020 12:00:19 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 12422412DB
 for <openbmc@lists.ozlabs.org>; Mon, 30 Mar 2020 12:00:19 +0300 (MSK)
Received: from localhost (172.17.14.122) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 30
 Mar 2020 12:00:19 +0300
Date: Mon, 30 Mar 2020 12:00:18 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: <openbmc@lists.ozlabs.org>
Subject: Re: Any idea of when qemu-system-arm will be supported for
 https://github.com/Intel-BMC/openbmc ?
Message-ID: <20200330090018.GA20872@bbwork.lan>
References: <1d854d104f3a48dd8f2c3929fc93a68b@SCL-EXCHMB-13.phoenix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1d854d104f3a48dd8f2c3929fc93a68b@SCL-EXCHMB-13.phoenix.com>
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

On Fri, Mar 27, 2020 at 05:17:37PM +0000, Bruce Mitchell wrote:
> Any idea of when qemu-system-arm will be supported for https://github.com/Intel-BMC/openbmc ?
> 
> 

It depends on what you want from qemu.

For example, I use qemu to check that the firmware image is bootable and works
fine:
```
qemu-system-arm -M ast2500-evb -m size=512M \
    -nographic -nodefaults -serial mon:stdio \
    -net nic,model=ftgmac100 \
    -drive file=<path-to-image-mtd>,format=raw,if=mtd
```

This way has some failures:
 - There is emulated MTD falsh drive only 32M size. As a result fit-image-b and
   u-boot-env partitions are unreadable.
 - There is no managed host. So there are not work the host power state
   management, KVM, Virtual Media and so on. 

Probably there are more failures, which I have not noticed.

While writing these lines I remembered that I use qemu-system-arm, built from
source on https://github.com/openbmc/qemu.
It's important, because the qemu-system-arm from my distro is too old and this
image is not working with it.


Alexander.
