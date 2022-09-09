Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FFB5B302A
	for <lists+openbmc@lfdr.de>; Fri,  9 Sep 2022 09:37:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MP79p5Tf5z3bnV
	for <lists+openbmc@lfdr.de>; Fri,  9 Sep 2022 17:37:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P/G7OHxg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=jiaqing.zhao@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P/G7OHxg;
	dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir; Fri, 09 Sep 2022 17:36:56 AEST
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MP79N0Zc5z2xHT
	for <openbmc@lists.ozlabs.org>; Fri,  9 Sep 2022 17:36:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662709016; x=1694245016;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=m3YnqdItTBfQHuTJjhU/D3X2vYT7bLo7zCxA7BZS5Gg=;
  b=P/G7OHxgOAkpmkTAx4t7cdbvOg4xrOw0GVfD/s58s/sPd/QdtH2JAfVg
   qEiezfDMaNc9HveGEtDzNmA6EidVFTPrpdWV+eQI6N7sH6KwTCl5mhtNg
   cLDNnOv4nRzqZ/ThdD8I8XkO5JIqW0lJPt6DB2xk9wYcsZtpF060h8xS2
   Wog+3iGUxMPK6FjEakApn9jaMDmimvm83YLK5fOLQgnV6hL9AODk3itpf
   coDwqzUE8eiwQPnm8T4GOez23IPRZwlWpQRWX6G8hd1LzvJykZWgoMhvP
   VnW/WuJXUOAoDA4ONLh5FNw2iKMjyw6bDR92Xxt1qCSWz3nSa4O5stY98
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="298757618"
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; 
   d="scan'208";a="298757618"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2022 00:35:16 -0700
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; 
   d="scan'208";a="645435049"
Received: from yuyongfe-mobl1.ccr.corp.intel.com (HELO [10.249.174.117]) ([10.249.174.117])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2022 00:35:11 -0700
Message-ID: <8eabb29b-7302-d0a2-5949-d7aa6bc59809@linux.intel.com>
Date: Fri, 9 Sep 2022 15:34:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] net/ncsi: Add Intel OS2BMC OEM command
To: Paul Fertser <fercerpav@gmail.com>
References: <20220909025716.2610386-1-jiaqing.zhao@linux.intel.com>
 <YxrWPfErV7tKRjyQ@home.paul.comp>
Content-Language: en-US
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
In-Reply-To: <YxrWPfErV7tKRjyQ@home.paul.comp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Samuel Mendoza-Jonas <sam@mendozajonas.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2022-09-09 13:59, Paul Fertser wrote:
> Hello,
> 
> On Fri, Sep 09, 2022 at 10:57:17AM +0800, Jiaqing Zhao wrote:
>> The Intel OS2BMC OEM NCSI command is used for controlling whether
>> network traffic between host and sideband is allowed or not. By
>> default such traffic is disallowed, meaning that if the device using
>> NCS (usually BMC) does not have extra active connection, it cannot
>> reach the host.
> 
> Can you please explain the rationale behind introducing this as a
> compile-time kernel config option? I can probably imagine how this can
> make sense as a DT switch (e.g. to describe hardware where there's no
> other communication channel between the host and BMC) but even this
> feels far-fetched.

Previously I submitted a patch to make the NCSI configurable in DT[1], but
it was not accepted by kernel community. A limitation is that currently NCSI
is not a standalone device node, it is controlled by "use-ncsi" option in the
MAC device DT node (like ftgmac100).

Other features like keep phy (also intel-specific oem) also uses kernel option.
(CONFIG_NCSI_OEM_CMD_KEEP_PHY)

[1] https://lore.kernel.org/netdev/20220610165940.2326777-4-jiaqing.zhao@linux.intel.com/T/

> Can you please outline some particular use cases for this feature?
> 
It enables access between host and BMC when BMC shares the network connection
with host using NCSI, like accessing BMC via HTTP or SSH from host. 
