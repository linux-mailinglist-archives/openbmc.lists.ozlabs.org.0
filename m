Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5693725B6
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 06:11:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45thjz48htzDqFt
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 14:11:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tPc911yRzDq5t
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 02:50:32 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2019 09:50:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,299,1559545200"; d="scan'208";a="368431687"
Received: from unknown (HELO [10.251.18.151]) ([10.251.18.151])
 by fmsmga005.fm.intel.com with ESMTP; 23 Jul 2019 09:50:26 -0700
Subject: Re: Address type in entity-manager repo
To: Deng Tyler <tyler.sabdon@gmail.com>
References: <CAO9PYRL-VUFar6MRFfEHxvx+XqSdybU-WdNkWxon8nzcU3DiMw@mail.gmail.com>
 <98d4b6e9-d4a8-c7cf-014d-64de2e6c8a5d@linux.intel.com>
 <CAO9PYRJ6FBP7DGBc_UPbB9LtDUckUY6zqZMvqtTpeWxuVJVrBA@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <72e5d489-2ec1-80f1-c642-33c8e8ad839b@linux.intel.com>
Date: Tue, 23 Jul 2019 09:50:26 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAO9PYRJ6FBP7DGBc_UPbB9LtDUckUY6zqZMvqtTpeWxuVJVrBA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 7/22/2019 6:50 PM, Deng Tyler wrote:
> Hi James:
>      Thank for your kindly reply and that really helps. I have another 
> question about entity-manager. In entity-manager, it add an dbus 
> interface "xyz.openbmc_project.Inventory.Manager" to object 
> "/xyz/openbmc_project/inventory" in its service.
> Why do that? I checked code and found there is no property or object 
> will be added under this interface. Meanwhile anther service 
> "xyz.openbmc_project.Inventory.Manager" has same interface and cause 
> ipmid get wrong service if receiving a fru ipmi command. Do you have any 
> suggestions? thanks. Regards

Currently I don't know of anyone who runs Inventory Manager and Entity 
Manager together, so you're a bit in untested waters. EntityManager has 
many of the same interfaces as Inventory Manager so that they can both 
work with bmcweb. There is a different fru ipmi command set in 
intel-ipmi-oem that works with fru-device that we use.

Thanks,

-James


> 
> Tyler
> 
> James Feist <james.feist@linux.intel.com 
> <mailto:james.feist@linux.intel.com>> 於 2019年7月18日 週四 上午7:01寫道：
> 
>     On 7/16/19 12:15 AM, Deng Tyler wrote:
>      > Hi All:
>      >      I am investigated entity-manager with dbus-sensors. In
>      > entity-manager, the schema define Address type is string as below
>      > ---------------------------------------------------
>      >              "type": "object",
>      >              "properties": {
>      >                  "Exposes": {
>      >                      "type": "array",
>      >                      "items": {
>      >                          "type": "object",
>      >                          "properties": {
>      >                              "Address": {
>      >                                  "type": "string"      <== here
>      >                              },
>      >                              "Name": {
>      >                                  "type": "string"
>      >                              },
>      > --------------------------------------------------------
>      > In dbus-sensor application, cpusensor get CPU configuration from
>     DBUS.
>      > But the type is mismatch and cause cpusensor terminated.
>      > *journalctl:*
>      > cpusensor[296]: terminate called after throwing an instance of
>      > 'std::invalid_argument'
>      > cpusensor[296]:   what():  Cannot translate type to unsigned int
>      >
>      > I found code in cpusensor to get "Address" and type shall be integer
>      > from dbus as below
>      > image.png
>      > But in dbus the Address property is string
>      > image.png
>      >
>      > Is this code error? or I miss something? thanks.
> 
>     I would suggest updating EntityManager, looks like you are using an old
>     version, SkylakeCPU change to XeonCpu a long time ago.
> 
>     Thanks,
> 
>     James
> 
> 
> 
>      >
>      > Tyler
> 
