Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5789DEF4
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 09:44:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Hgqf6mgPzDqb9
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 17:44:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="abpGLfy0"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Hgq61TrHzDqSd
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 17:43:45 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id F011C42ECA
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 07:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 user-agent:in-reply-to:content-disposition:content-type
 :content-type:mime-version:references:message-id:subject:subject
 :from:from:date:date:received:received:received; s=mta-01; t=
 1566891817; x=1568706218; bh=QIClCzJCpbUGgLmsEHXrmMO8VKWJ8gZihyE
 er0wOopg=; b=abpGLfy0PLOrQwwkawBXt0d1FHDTjIFaHcUXYrXWIOSvBbKtYZJ
 EqREuhvc311bSvyoH0jJqLzaYLJ7yMGdtb2ZIKLTwIDWn3R1W574H4pemywXdJRu
 /HcqlJoc+4gooLRvmt9ATSiAEvpVWqbwUXyaPa4tdxjxCeIA5TbCo8e8=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id np1BqjsIqXNO for <openbmc@lists.ozlabs.org>;
 Tue, 27 Aug 2019 10:43:37 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 0E90941209
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 10:43:37 +0300 (MSK)
Received: from localhost (172.17.14.115) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 27
 Aug 2019 10:43:36 +0300
Date: Tue, 27 Aug 2019 10:43:36 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: <openbmc@lists.ozlabs.org>
Subject: Re: custom ntp server in phosphor-networkd
Message-ID: <20190827074336.GA14200@bbwork.lan>
References: <20190826162517.GA19876@bbwork.lan>
 <20190826172315.GB45301@mauery.jf.intel.com>
 <6c7a1584-b35e-199b-e970-630ad6975125@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <6c7a1584-b35e-199b-e970-630ad6975125@linux.vnet.ibm.com>
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

On Mon, Aug 26, 2019 at 10:23:15AM -0700, Vernon Mauery wrote:
> This is pretty common behavior for DHCP settings.


On Tue, Aug 27, 2019 at 11:28:36AM +0530, Ratan Gupta wrote:
> Why this is wrong,

Ok, ok.  I wasn't clear enough. My appologies.

I've meant that the impossibility to add a custom ntp server while dhcp is
enabled is wrong. Of course, the list of ntp servers received from DHCP-server
must be used. And I propose to move only manual settings.

I believe that it is a same stuff with DNS-servers, routes. But probably, the
BMC is not such kind of devices which is required such deep settings. One of the
possible reasons was specified by Vernon quoted below:

On Mon, Aug 26, 2019 at 10:23:15AM -0700, Vernon Mauery wrote:
> It seems to me that if you are using static settings for your network, 
> then you would also have static (or user-supplied) settings for NTP and 
> DNS. But if you are using DHCP for the network, it would make sense to 
> use the NTP and DNS settings supplied by the DHCP server.
> 
> Now it might also be nice to have some reasonable defaults for NTP 
> servers. It is not uncommon to have IP gateways also be NTP servers, so 
> it might be reasonable to attempt to use the gateway as an NTP server if 
> none was specified in the DHCP response. I don't like the idea of 
> setting the default NTP server to be something that is globally 
> addressable because that makes the assumption that the BMC can reach 
> global networks, which should not be the case.


On Tue, Aug 27, 2019 at 11:28:36AM +0530, Ratan Gupta wrote:
>  * The NTP servers defined in|/etc/systemd/timesyncd.conf|will be
>    appended to the per-interface list at runtime and the daemon will
>    contact the servers in turn until one is found that responds.

So, my propose is to implement this point.

Regards,
Alexander
