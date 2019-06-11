Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE78E3D2DD
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2019 18:44:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NbS01vKJzDqsj
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 02:44:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NZ8h0L6mzDqpB
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jun 2019 01:45:37 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jun 2019 08:45:33 -0700
X-ExtLoop1: 1
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga007.fm.intel.com with ESMTP; 11 Jun 2019 08:45:33 -0700
Subject: Re: Removing sensors on standby
To: Thaj <tajudheenk@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAH2KKeYfWaaQHq2gcmBYZUedVz2hB0Bjbf8fzEN72JqBF3kpBg@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <32d55226-9dbe-7535-b69c-5b5e3a021a58@intel.com>
Date: Tue, 11 Jun 2019 08:45:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAH2KKeYfWaaQHq2gcmBYZUedVz2hB0Bjbf8fzEN72JqBF3kpBg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/11/19 3:07 AM, Thaj wrote:
> 
> Requirement is that, Sensor should be monitored only on host powered ON
> state.  
> 

The dbus-sensors project currently has handling of this;  I'm unsure of
whether phosphor-hwmon can monitor the host state, but I suspect there's
a way.

> 
> Is it a good idea to add a config file entry for this purpose (something
> like REMOVE_ON_STANDBY) ?
> 

Example of reading ADCs only when host is on:
https://github.com/openbmc/entity-manager/blob/3e5e41fb89b91234ef043df1137c8984f9cafdc4/configurations/WFT%20Baseboard.json#L6

Example of reading a temperature sensor only after host firmware has
been instantiated:
https://github.com/openbmc/entity-manager/blob/3e5e41fb89b91234ef043df1137c8984f9cafdc4/configurations/WFT%20Baseboard.json#L1172
