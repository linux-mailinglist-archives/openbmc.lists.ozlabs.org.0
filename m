Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1400B13CAF3
	for <lists+openbmc@lfdr.de>; Wed, 15 Jan 2020 18:27:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yZ5f3vCtzDqTs
	for <lists+openbmc@lfdr.de>; Thu, 16 Jan 2020 04:27:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yZ4s5JWLzDqRJ
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jan 2020 04:26:51 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jan 2020 09:26:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,323,1574150400"; d="scan'208";a="273699526"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Jan 2020 09:26:48 -0800
Subject: Re: No sensors displayed in webUI
To: Max Power <max_power2005-openbmc@yahoo.com>, openbmc@lists.ozlabs.org
References: <138261238.19427827.1579077694127.ref@mail.yahoo.com>
 <138261238.19427827.1579077694127@mail.yahoo.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <3ae17538-5e0d-1228-a242-56ab25dd3229@linux.intel.com>
Date: Wed, 15 Jan 2020 09:26:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <138261238.19427827.1579077694127@mail.yahoo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 1/15/20 12:41 AM, Max Power wrote:
> Hi
> 
> What are the basic requirements for phosphor-webui to display the list
> the available sensors?
> 
> I've create a simple entity-manager configuration for my custom hardware
> containing some voltage and temp sensors definitions. All the configured
> sensors are accessible under "/sys/class/hwmon/hwmon*".
> "entity-manager" and "dbus-sensors" related services like "ADCSensor" or
> "CPUSensor" are up and running, "busctl tree" lists all the sensors
> under "/xyz/openbmc_project/sensors" and I'm able to read the sensors
> properities using "busctl introspect".
> 
> But the server-health/sensors-overview page in webUI always shows
> "There are no sensors found."

There was a thread about this last week:

https://lists.ozlabs.org/pipermail/openbmc/2020-January/020044.html
https://lists.ozlabs.org/pipermail/openbmc/2020-January/020136.html

TL;DR all the sensors are available in Redfish, but the WebUI hasn't 
move over to full Redfish support yet. There is a test patch that helps 
enable this in the thread.



> 
> Any hints or ideas what I am missing?
> Do I need any other services running besides "entity-manger" and
> "dbus-sensors"?
> 
> Max
> 
