Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7419A2F188B
	for <lists+openbmc@lfdr.de>; Mon, 11 Jan 2021 15:44:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDxKs4jVwzDqft
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 01:44:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=Uq3oQwQP; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDxJm2NX4zDqdh
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 01:43:03 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id ECDCB41309
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2021 14:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1610376177; x=1612190578; bh=OjGVCwjhdCmEOx8nVNo3crpoF
 5+9WTNqQMmPYJAIDlo=; b=Uq3oQwQPGCPyTP0277XXVNn3UoA3S+5al6AefX2Xr
 Sba9ic7Xgnf7dwMv5Icjx4U23uy30UCa8E0vLgfWtaXAPpFTv5nV4AmOQecA1o2U
 rfCgQhQqU5yIIOFxPP4kB5p/qwdYkuodUNCOGp67WrKiOovyS5ieFw6lm0/3L2yR
 /Q=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vnQ2r4YLODWB for <openbmc@lists.ozlabs.org>;
 Mon, 11 Jan 2021 17:42:57 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id DD7884127E
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2021 17:42:57 +0300 (MSK)
Received: from [10.199.0.194] (10.199.0.194) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 11
 Jan 2021 17:42:57 +0300
Message-ID: <63eac02f4bed7ae42c87a938d1457cd5ef1f8b03.camel@yadro.com>
Subject: Re: Error Reporting and Decoding from Intel-based CPU (PECI daemon)
From: Andrei Kartashev <a.kartashev@yadro.com>
To: <openbmc@lists.ozlabs.org>
Date: Mon, 11 Jan 2021 17:42:56 +0300
In-Reply-To: <CALGRKGOb2jRTgVxpiH_36W6c5ft5faXPkATaXApXdNiQqd0knQ@mail.gmail.com>
References: <CALGRKGOb2jRTgVxpiH_36W6c5ft5faXPkATaXApXdNiQqd0knQ@mail.gmail.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.194]
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Brandon,

PECI-PCIe only deal with PCI bus, it doesn't man to read any
information regarding CPU. There are number of other daemons uses PECI:
* cpusensor from dbus-sensors reads CPU/DIMM temperature and power
using peci/hwmon
* CPUinfo from smbiosmdrv2 reads CPU info using PECI
* host-error-monitor reports CPU state using GPIO and PECI

I believe, last one is what you are looking for.

On Wed, 2021-01-06 at 18:02 -0800, Brandon Kim wrote:
> Hi everyone,
> 
> I was wondering if there were any ongoing efforts for a daemon using
> PECI for error reporting and decoding from the host CPU to the BMC
> (possibly from Intel?).
> 
> I see openbmc/peci-pcie which seems to be only for using PECI for
> PCIe devices.
> 
> Any pointers / updates would be greatly appreciated!
> 
> Thanks,
> Brandon
-- 
Best regards,
Andrei Kartashev


