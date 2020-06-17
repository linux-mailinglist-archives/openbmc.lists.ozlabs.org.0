Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FF21FD347
	for <lists+openbmc@lfdr.de>; Wed, 17 Jun 2020 19:17:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nBbG3PXZzDqB4
	for <lists+openbmc@lfdr.de>; Thu, 18 Jun 2020 03:17:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nBZS5jknzDqss
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jun 2020 03:17:03 +1000 (AEST)
IronPort-SDR: EqR4IyXCLRC3k+IgmGEDVQEn6K/jpwU3oRU8Esf0Y+DAWmMd8ztCM4Om1lQC5bjSbTGgfh+0OG
 oQe2oei89BZg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2020 10:16:59 -0700
IronPort-SDR: 7S1o7cB5+U8LeBWbtMxv9U/Wx2JWqFlIIMndZwvhEt/9Wgghn3rdsZ8u+zygjNLzM12lbcfFu7
 u1zTXvDbM2qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,523,1583222400"; d="scan'208";a="317584879"
Received: from jfeist-mobl2.amr.corp.intel.com (HELO [10.251.30.33])
 ([10.251.30.33])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Jun 2020 10:16:59 -0700
Subject: Re: Redfish EventService Implementation
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>,
 Patrick Williams <patrick@stwcx.xyz>
References: <019f5263-a7b2-9cb8-4420-cb597bd29afd@gmail.com>
 <b80d18b2bc2766d58158e9c93f05201e87b445cd.camel@fuzziesquirrel.com>
 <c31b2941-dc48-349a-68cf-c5292ccfc621@linux.intel.com>
 <1d2ad757-826d-1993-b88a-e92010b984ed@linux.vnet.ibm.com>
 <05ec7793-2efa-42da-ef56-94cc1477d2bb@linux.intel.com>
 <20200616152428.GA4618@heinlein>
 <7e16df1c-38b0-d488-dbbf-75fe9ac818ab@linux.intel.com>
 <68f31493-6db6-8e8e-8486-e03c14685abe@linux.vnet.ibm.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <983eb15a-13e3-43d0-1022-960ed44ac7e2@linux.intel.com>
Date: Wed, 17 Jun 2020 10:16:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <68f31493-6db6-8e8e-8486-e03c14685abe@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, "Bills,
 Jason M" <jason.m.bills@linux.intel.com>, "Puli,
 Apparao" <apparao.puli@linux.intel.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> My intention was not to re-implement the logging, my intention was to 
> extend/use the existing design which we already have it below.
> 
> https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in-bmcweb.md 
> 
> 
> I was trying not to bring the Redfish specific stuff in each individual 
> repo, instead each transport can listen for
> Dbus events and write to the journal which goes to their app specific file.
> 
> Your point is valid that we would be polluting the journal if each and 
> every transport start writing as per their needs.
> 
> ***** As per the Redfish one of the requirement is we need the log for 
> most of the Dbus Property update/interface added as they
> are mapped to some Redfish Resource and the bmcweb has to send the 
> Resource updated/modified signal to the
> Redfish client. ******
> 
> As we are in agreement that we want to use the journal for persistence 
> and log rotate feature.
> 
> We have two options:
>      1) Each transport interface listens for the Dbus signals and write 
> it to their app specific file.
>      2) Each openbmc repo must use log::report for each D-bus property 
> update/ interface added.

I'm assuming you meant each event added right? I don't see any reason 
that the logs have anything to do with d-bus, except maybe if it seems 
worth it for phosphor-logging to catch all the reports and log them to 
the journal. Although it would probably be more efficient (and easier 
for phased adoption) to just make the log::report call write to the 
journal as well.

>         To make this happen, we need the following
>          * common message format which can be used by the all other 
> application (SEL,Redfish) etc.

Agree.

>          * Transport application will read this common message from the 
> journal and use it as per their needs.
> 
> Option no 2:   It is ideal solution but that requires good amount of 
> work as
>               either each and every D-bus repo  should write to the 
> journal for any property update/interface added.

Why every property/interface added? This would make the logs much to 
large to be useful. And many times the information needed is specific to 
the log type. For instance a event for inventory discovered might need 
the type of inventory, the serial number, the model, etc. To get all 
that information would be multiple interfaces added events combined 
together. It would make more sense in this aspect for the inventory 
daemon to take the parts out of say the Asset, and Chassis interfaces 
along with the path identifier, and create an entry in the log that is 
use-able. It would be much more difficult and error-prone for the 
Redfish or SEL daemon to try to piece these multiple events together to 
form something useful.

>                       or
>               Should SDbusplus do this as each and every application 
> uses the sdbusplus framework to manage the dbus objects
> 
> Please let me know your thoughts.
> 
> Ratan
> 
