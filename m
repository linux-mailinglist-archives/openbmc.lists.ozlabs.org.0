Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5E86C360
	for <lists+openbmc@lfdr.de>; Thu, 18 Jul 2019 01:02:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pt7s2qg3zDqTp
	for <lists+openbmc@lfdr.de>; Thu, 18 Jul 2019 09:02:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pt783BRzzDqSZ
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jul 2019 09:01:38 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jul 2019 16:01:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,275,1559545200"; d="scan'208";a="251634888"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by orsmga001.jf.intel.com with ESMTP; 17 Jul 2019 16:01:34 -0700
Subject: Re: Address type in entity-manager repo
To: Deng Tyler <tyler.sabdon@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAO9PYRL-VUFar6MRFfEHxvx+XqSdybU-WdNkWxon8nzcU3DiMw@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <98d4b6e9-d4a8-c7cf-014d-64de2e6c8a5d@linux.intel.com>
Date: Wed, 17 Jul 2019 16:01:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAO9PYRL-VUFar6MRFfEHxvx+XqSdybU-WdNkWxon8nzcU3DiMw@mail.gmail.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 7/16/19 12:15 AM, Deng Tyler wrote:
> Hi All:
>      I am investigated entity-manager with dbus-sensors. In 
> entity-manager, the schema define Address type is string as below
> ---------------------------------------------------
>              "type": "object",
>              "properties": {
>                  "Exposes": {
>                      "type": "array",
>                      "items": {
>                          "type": "object",
>                          "properties": {
>                              "Address": {
>                                  "type": "string"      <== here
>                              },
>                              "Name": {
>                                  "type": "string"
>                              },
> --------------------------------------------------------
> In dbus-sensor application, cpusensor get CPU configuration from DBUS. 
> But the type is mismatch and cause cpusensor terminated.
> *journalctl:*
> cpusensor[296]: terminate called after throwing an instance of 
> 'std::invalid_argument'
> cpusensor[296]:   what():  Cannot translate type to unsigned int
> 
> I found code in cpusensor to get "Address" and type shall be integer 
> from dbus as below
> image.png
> But in dbus the Address property is string
> image.png
> 
> Is this code error? or I miss something? thanks.

I would suggest updating EntityManager, looks like you are using an old 
version, SkylakeCPU change to XeonCpu a long time ago.

Thanks,

James



> 
> Tyler
