Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5789B793
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 22:12:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FXd76GlpzDsMP
	for <lists+openbmc@lfdr.de>; Sat, 24 Aug 2019 06:12:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=vernon.mauery@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FXcV2FrszDrcN
 for <openbmc@lists.ozlabs.org>; Sat, 24 Aug 2019 06:12:10 +1000 (AEST)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 13:10:55 -0700
X-IronPort-AV: E=Sophos;i="5.64,422,1559545200"; d="scan'208";a="179259970"
Received: from vmauery-desk.jf.intel.com (HELO mauery.jf.intel.com)
 ([10.7.150.62])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 13:10:54 -0700
Date: Fri, 23 Aug 2019 13:10:53 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: Payne Yang <pyang4@lenovo.com>
Subject: Re: Question for ACPI status
Message-ID: <20190823200921.GC31389@mauery.jf.intel.com>
References: <a05edc724bdb4a10a5860c88ceef10c1@lenovo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <a05edc724bdb4a10a5860c88ceef10c1@lenovo.com>
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

On 23-Aug-2019 09:18 AM, Payne Yang wrote:
>Hi Team,
>
>Is there any ACPI service to update the ACPI state ?
>I could find that the property of ACPI state is defined in dbus, and the ipmi command is also done in package "phosphor-host-ipmid".
>https://github.com/openbmc/phosphor-host-ipmid/blob/b90a53280c74e8c65e8dc58c8964d93a08cfd65e/apphandler.cpp#L202
>
>However, I could not find other services to update the property "ACPIPowerState".
>https://github.com/search?q=org%3Aopenbmc+ACPIPowerState&type=Code

That is because the host is the only entity that should be modifying 
that property.

>Do I miss something ?
>If yes, please help to share your comment or suggestion:)

According to the IPMI specification:
	The Set ACPI Power State command can also be used as a mechanism for 
	setting elements of the platform management subsystem to a 
	particular power state. This is an independent setting that may not 
	necessarily match the actual power state of the system. This command 
	is used to enable the reporting of the power state, it does not 
	control or change the power state.

>If no, it seems to me that I have to write a service as ACPI state monitor.

Your particular platform may have different needs than other platforms 
running OpenBMC. A platform that needs to effect system-wide changes 
based on the Host-reported state (or possibly intended state) could 
listen for the property changed signal for the ACPIPowerState property 
and take action.

But as the command is currently written, it conforms to the IPMI 
specification. There just happens to be no public consumers of that 
property.

--Vernon
