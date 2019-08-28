Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18ABA9FD56
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2019 10:42:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JK461Y1MzDqmb
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2019 18:42:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="YuagXGqZ"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JK3W30bbzDr3j
 for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2019 18:41:43 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 7BFE542ECA
 for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2019 08:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:content-type:content-type:mime-version
 :references:message-id:subject:subject:from:from:date:date
 :received:received:received; s=mta-01; t=1566981696; x=
 1568796097; bh=RDhkqLtLcJKoZgqwPP45V72/ByCZ977dUuwY6MJK3GY=; b=Y
 uagXGqZuiMW1kJSx6Oa6PFHcmU+JycbaUYslm+mBIKfGqKVNVW23pXTqkihOfB8c
 SAaAPbPeKgqQ8ULhLZR9R/6EmLOG5MpLWfPedGzsQHu4JRxg8tKFJWX6UfFepEGB
 9mmlKmR6jdwmvZysruoJW/ShApO4RvMgJvTeDEjgf4=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m3bOmHBy_WZQ for <openbmc@lists.ozlabs.org>;
 Wed, 28 Aug 2019 11:41:36 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 35B0D404CB
 for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2019 11:41:36 +0300 (MSK)
Received: from localhost (172.17.14.115) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 28
 Aug 2019 11:41:35 +0300
Date: Wed, 28 Aug 2019 11:41:35 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: <openbmc@lists.ozlabs.org>
Subject: Re: custom ntp server in phosphor-networkd
Message-ID: <20190828084135.GA4047@bbwork.lan>
References: <20190826162517.GA19876@bbwork.lan>
 <20190826172315.GB45301@mauery.jf.intel.com>
 <6c7a1584-b35e-199b-e970-630ad6975125@linux.vnet.ibm.com>
 <20190827074336.GA14200@bbwork.lan>
 <93b03449-207d-cf0a-a454-ac32fef4f410@linux.vnet.ibm.com>
 <c1fb7fc5-3dc1-0937-476c-acb8b6f3cb84@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c1fb7fc5-3dc1-0937-476c-acb8b6f3cb84@intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Originating-IP: [172.17.14.115]
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

On Tue, Aug 27, 2019 at 07:52:12AM -0700, Johnathan Mantey wrote:
> Ratan, Alexander,
> 
> I've pushed code to improve DHCP recently which may be of value in this
> instance.
> 
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/24665
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-networkd/+/24666
> https://gerrit.openbmc-project.xyz/c/openbmc/bmcweb/+/24725
> 
> This implements a greater set of control over the DHCP from Redfish.  I
> believe I tested using DHCP, while UseNTPServers = false was active.  I
> then explicitly defined a static NTP server from one of the Intel
> chimers.  I was able to get my clock updated from the assigned NTP
> server.  Prior to this change NTP requests to the google chimers went
> unanswered, as our BMC network can't get to the internet.
> 

Thanks Johnathan, it looks like a solution for the issue.

Regards,
Alexander
