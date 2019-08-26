Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7789D4D9
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2019 19:24:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HJl33ZG9zDqlP
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 03:23:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HJkL33bFzDqcM
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 03:23:20 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 10:23:17 -0700
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="185019922"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 10:23:16 -0700
Date: Mon, 26 Aug 2019 10:23:15 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: "Alexander A. Filippov" <a.filippov@yadro.com>
Subject: Re: custom ntp server in phosphor-networkd
Message-ID: <20190826172315.GB45301@mauery.jf.intel.com>
References: <20190826162517.GA19876@bbwork.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190826162517.GA19876@bbwork.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 26-Aug-2019 07:25 PM, Alexander A. Filippov wrote:
> Our customers complain that they can't set custom ntp while dhcp is enabled on
> bmc network interface.
> 
> I found out that the phosphor-networkd doesn't allow it in fact and it awaits
> the list of ntp-servers in response from dhcp server. When BMC is configured
> with a static IP address phosphor-networkd keep a list of ntp-service in the
> configuration file of the network interface. In my opinion it is wrong.

This is pretty common behavior for DHCP settings. The DHCP server can 
respond with all sorts of settings beyond just the ip/netmask/gateway. 
NTP, DNS, TFTP (for PXE), etc., are all things that might get returned 
by the DHCP server. Generally, if you are using DHCP, you just accept 
those responses and use them because you assume that the network 
administrator did the right thing and set them up.

> I propose to change this behavior: 
>  - the list of ntp-service should be kept in /etc/systemd/timesyncd.conf
>  - the customization of ntp-servers should be independent from the network
>    inferface configuration.
> 

It seems to me that if you are using static settings for your network, 
then you would also have static (or user-supplied) settings for NTP and 
DNS. But if you are using DHCP for the network, it would make sense to 
use the NTP and DNS settings supplied by the DHCP server.

Now it might also be nice to have some reasonable defaults for NTP 
servers. It is not uncommon to have IP gateways also be NTP servers, so 
it might be reasonable to attempt to use the gateway as an NTP server if 
none was specified in the DHCP response. I don't like the idea of 
setting the default NTP server to be something that is globally 
addressable because that makes the assumption that the BMC can reach 
global networks, which should not be the case.

--Vernon
