Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4737A597C86
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 05:58:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7WMH1Kgsz3c6b
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 13:58:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fPqYVR/o;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=jiaqing.zhao@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fPqYVR/o;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7WLs53Lhz3035
	for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 13:57:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660795077; x=1692331077;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eSA1RXaTniG3j4k0D+WHaVBruam4SxmwsY+/nW9/fz4=;
  b=fPqYVR/o0UuVgt8X6ab1FOnpGYqOHcIp7lkwNFC2tO8mFkI2+TJoqbK2
   HsQg/rHQZ+F9bXPFPb9oyoercNJHXqiAt8H8Y8u2J9N8Vx7Ru4Rh7IO1U
   3mlgtOAPK85fhDM+YGsOulCocbdblLN1iu8njiDDp2rBJInBZCUlb8y4I
   NJH3DTukonYYlJs4xktYPg9Z0XEWmkCfaYmQmyQHEi7LBQJ+MgbfP2E2m
   16kdKVJnfr8bsdIH19/skY8k6kRHr7xdW8dCJJ8MofKZMb48xqFYvQC75
   TBYC5hwX22wJ9rtk7PM729I2OKwI8+Y/IiSEwSGxuZFfEWiKK66YEIQND
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="292657259"
X-IronPort-AV: E=Sophos;i="5.93,245,1654585200"; 
   d="scan'208";a="292657259"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2022 20:57:52 -0700
X-IronPort-AV: E=Sophos;i="5.93,245,1654585200"; 
   d="scan'208";a="935635556"
Received: from jiaqingz-mobl.ccr.corp.intel.com (HELO [10.255.31.154]) ([10.255.31.154])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2022 20:57:51 -0700
Message-ID: <1d9222dc-da75-a976-e1c6-8f00354b76b3@linux.intel.com>
Date: Thu, 18 Aug 2022 11:57:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: Event Logs in Redfish
To: zehra.ozdemir@inventron.com.tr, openbmc@lists.ozlabs.org
References: <000001d8b21c$9b095c60$d11c1520$@inventron.com.tr>
Content-Language: en-US
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
In-Reply-To: <000001d8b21c$9b095c60$d11c1520$@inventron.com.tr>
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
Cc: "'M. Erhan Yigitbasi'" <erhan.yigitbasi@inventron.com.tr>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

There are 2 kinds of logging backend implemented in bmcweb, DBus-based and
journal-based. By default the journal-based one is used. To switch to the
DBus-based logging backend, add `EXTRA_OEMESON += "-Dredfish-dbus-log='enabled'"`
to your bmcweb bbappend file.

On 2022-08-17 17:34, zehra.ozdemir@inventron.com.tr wrote:
> Hello,
> 
>  
> 
> I am trying to get an event log and I created a sample log by calling
> logging create dbus interface as down below:
> 
>  
> 
> busctl call xyz.openbmc_project.Logging /xyz/openbmc_project/logging
> xyz.openbmc_project.Logging.Create Create ssa{ss} "Hata olustu"
> "xyz.openbmc_project.Logging.Entry.Level.Critical" 1 "CALLOUT_GPIO_NUM" "5"
> 
>  
> 
> It seems to created successfully when I viewed "GetManagedObjects" object of
> the interface :
> 
>  
> 
> busctl call xyz.openbmc_project.Logging /xyz/openbmc_project/logging
> org.freedesktop.DBus.ObjectManager GetManagedObjects
> 
>  
> 
> output:
> 
>  
> 
> a{oa{sa{sv}}} 2 "/xyz/openbmc_project/logging/entry/1" 8
> "org.freedesktop.DBus.Peer" 0 "org.freedesktop.DBus.Introspectable" 0
> "org.freedesktop.DBus.Properties" 0 "xyz.openbmc_project.Common.FilePath" 1
> "Path" s "/var/lib/phosphor-logging/errors/1"
> "xyz.openbmc_project.Software.Version" 2 "Version" s "0.1.0" "Purpose" s
> "xyz.openbmc_project.Software.Version.VersionPurpose.BMC"
> "xyz.openbmc_project.Association.Definitions" 1 "Associations" a(sss) 0
> "xyz.openbmc_project.Object.Delete" 0 "xyz.openbmc_project.Logging.Entry" 10
> "Id" u 1 "Timestamp" t 1660660714372 "Severity" s
> "xyz.openbmc_project.Logging.Entry.Level.Critical" "Message" s "Hata olustu"
> "EventId" s "" "AdditionalData" as 1 "CALLOUT_GPIO_NUM=5" "Resolution" s ""
> "Resolved" b false "ServiceProviderNotify" b false "UpdateTimestamp" t
> 1660660714372 "/xyz/openbmc_project/logging/internal/manager" 4
> "org.freedesktop.DBus.Peer" 0 "org.freedesktop.DBus.Introspectable" 0
> "org.freedesktop.DBus.Properties" 0
> "xyz.openbmc_project.Logging.Internal.Manager" 0
> 
>  
> 
> However, no data is displayed in the web-ui.  So, I examined the bmcweb
> method which deals with getting event log requests from dbus and nothing
> seems wrong. When I call this bmcweb method with redfish api, count returns
> zero.:
> 
>  
> 
> curl -c cjar -b cjar -k
> https://{$bmc}/redfish/v1/Systems/system/LogServices/EventLog/Entries
> <https://%7b$bmc%7d/redfish/v1/Systems/system/LogServices/EventLog/Entries/>
> 
> {
>   "@odata.id": "/redfish/v1/Systems/system/LogServices/EventLog/Entries",
>   "@odata.type": "#LogEntryCollection.LogEntryCollection",
>   "Description": "Collection of System Event Log Entries",
>   "Members": [],
>   "Members@odata.count": 0,
>   "Name": "System Event Log Entries"
> 
>  
> 
> In short, what exactly do I need to do to view these event logs in the web
> ui?
> 
>  
> 
> Thank you.
> 
