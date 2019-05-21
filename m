Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A08E924AB1
	for <lists+openbmc@lfdr.de>; Tue, 21 May 2019 10:47:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457Tsw6QZ6zDqMv
	for <lists+openbmc@lfdr.de>; Tue, 21 May 2019 18:47:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="FuCrsVmi"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457TsS6mTZzDqL7
 for <openbmc@lists.ozlabs.org>; Tue, 21 May 2019 18:47:04 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 8E901412D3
 for <openbmc@lists.ozlabs.org>; Tue, 21 May 2019 08:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 user-agent:in-reply-to:content-disposition:content-type
 :content-type:mime-version:references:message-id:subject:subject
 :from:from:date:date:received:received:received; s=mta-01; t=
 1558428418; x=1560242819; bh=VqUAxJW4z7Q4mw5CcGJjdFYCqLTBk4tqYqs
 hdXeKNaw=; b=FuCrsVmiJUWI+sWnnkOiNWmybCSO8w6mrHlpSDhaxm4S64J0baf
 akZU2kVzOdmMfNqVphIO1SrEwpSvMtKim2AizdC3YQz7KgqHYZla+RQfrkGJ7VKQ
 7VVZsQQO9DMxTcaI0S5rZBxtBC0bBLgeZl18gjC2pz2GKYl5Pg491z5U=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nsrpTmGlQH2O for <openbmc@lists.ozlabs.org>;
 Tue, 21 May 2019 11:46:58 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id F0836412D2
 for <openbmc@lists.ozlabs.org>; Tue, 21 May 2019 11:46:58 +0300 (MSK)
Received: from localhost (172.17.14.115) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 21
 May 2019 11:46:58 +0300
Date: Tue, 21 May 2019 11:46:58 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: <openbmc@lists.ozlabs.org>
Subject: Re: Design: Setting a unique hostname to the BMC machine on first boot
Message-ID: <20190521084658.GA28585@bbwork.lan>
References: <CANGK-S5uWkTdA1NJ1d5E5WtawK5Wpv=9GfV0JJ3HWfnNTYYMGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CANGK-S5uWkTdA1NJ1d5E5WtawK5Wpv=9GfV0JJ3HWfnNTYYMGw@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
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

On Tue, May 21, 2019 at 01:05:36PM +0530, Asmitha Karunanithi wrote:
> Hi Team,
> 
> I have been facing a problem and the details of which is mentioned below.
> 
> Problem Description:
> In OpenBMC, the hostname discovery is done by the avahi Dbus service at the
> startup. In a network where there are multiple OpenBMC machines, avahi keeps
> getting the hostname conflict and the service name conflict. Hence, the
> problem is to find a solution that resolves these conflicts.
> 
> Background and References:
> The detailed issue regarding the hostname and service name conflicts is
> described in the following links.
> https://github.com/openbmc/openbmc/issues/1741.
> https://lists.freedesktop.org/archives/avahi/2018-January/002492.html
> https://github.com/lathiat/avahi/issues/117
> 
> Requirements:
> None.
> 
> Proposed Design:
> To solve this, we are proposing a service which assigns a unique hostname to
> the BMC and runs on the very first boot. one of the ways to generate the
> unique
> hostname is to append the machine UUID to the existing default hostname.

We have already done it for our hardware, but we used the BMC's Serial Number
instead of UUID.

This service is very similar to meta-opepower/recipes-phosphor/network/first-boot-set-mac

How it works:
- openpower-vpd-parser read content of EEPROM VPD and fill corresponded fields
  in the inventory.
- the service reads serial number via DBus  and append it to the hostname if
  it has default value.

> 
> Alternatives Considered:
> None.
> 
> Impacts:
> None.
> 
> Testing:
> None.
> 
> If you have any suggestions, please feel free to let me know.
> -- 
> Thanks & Regards,
> Asmitha Karunanithi

--
Regards,
Alexander Filippov
Software Engineer, YADRO
