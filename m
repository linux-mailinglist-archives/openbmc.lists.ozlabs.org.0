Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B605DDB225
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 18:18:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46vDpt0pVRzDqW9
	for <lists+openbmc@lfdr.de>; Fri, 18 Oct 2019 03:17:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46vDp31yyrzDqN7
 for <openbmc@lists.ozlabs.org>; Fri, 18 Oct 2019 03:17:13 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Oct 2019 09:17:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,308,1566889200"; d="scan'208";a="371183420"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga005.jf.intel.com with ESMTP; 17 Oct 2019 09:17:10 -0700
Subject: Re: FRU device entityId and entityInstance
To: Patrick Venture <venture@google.com>
References: <CAO=notzVe07GjrKj5ZLLVBA=mbx66aEWmYYfGhiTKpNoAmrEqw@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <e17f4bdf-e218-ce9b-c8dc-f408952eb4c2@linux.intel.com>
Date: Thu, 17 Oct 2019 09:17:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAO=notzVe07GjrKj5ZLLVBA=mbx66aEWmYYfGhiTKpNoAmrEqw@mail.gmail.com>
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/16/19 10:57 PM, Patrick Venture wrote:
> Because there's no association between an entity-manager board and the
> fru device entry, I added a new interface to the entity-manager
> hardware profile:
> 
> "xyz.openbmc_project.Inventory.Decorator.FruDevice": {
>      "Bus": "$bus",
>      "Address": "$address"
> }
> 
> I'm making the properties uppercase like they are with the FruDevice
> interface so that they match  -- BUS == BUS, but they are different
> types.  I haven't dug into the code, but interestingly these are
> uint64_t while the FruDevice Interface's BUS is 32-bit.

This is because Entity-Manager reads from json, and the native json 
types are uint64_t. I've considered using the size of the variable to 
determine this, but then guessing the type became confusing, and the 
usage of visitors went up, and in the end it didn't seem worth it.

> 
> This lets me, in intel-ipmi-oem go from a FruDevice entry to an
> EntityManager board entry.  From there, I added another interface:
> 
> "xyz.openbmc_project.Inventory.Decorator.Ipmi": {
>      "EntityId": "0x07",
>      "EntityInstance": 1

How / when will EntityInstance increment? Should you use $index here?

> }
> 
> If this interface is present, and those properties set, they are used
> in intel-ipmi-oem.  I have a patch for this that has been tested and
> works.  I haven't updated the schema yet, as I wanted to get a second
> opinion on it.

This looks very reasonable, and in line with current designs.

> 
> The sensors also need the Ipmi Decorators, but I just added the
> EntityId property to the "Exposes" entries that need it, and then it's
> in the Configuration interface.  However, I haven't yet pushed that
> into a sensor.  I see there's an association interface on a Sensor and
> that points back to the parent board, but it isn't immediately clear
> to me how to then travel to the sensor from there 

I'm a little lost on why you need to add this to the sensor. The 
association should point back to the base configuration that caused it, 
and you're adding the EntityId to the base right? So from current logic 
you would just need to take object that contains the managedObject of 
all the sensors, looks at the associations, that should point to a base 
object in EntityManager. If that base object has a Decorator.Ipmi, then 
you can get the Entity Information.. or am I missing something?

> -- by first thought
> was path swapping, but that won't work in cases like tmp441 where one
> sensor configuration feeds two sensors.  Anyways, I was thinking, what
> if the Sensor creation added another interface for decoration (if
> configured), so that intel-ipmi-oem can get the entityId and so on by
> just grabbing the sensor object -- it'd be yet another decoration
> interface?
> 
> Patrick
> 
