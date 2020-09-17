Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4195326DE12
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 16:22:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsfLP2YHRzDqfJ
	for <lists+openbmc@lfdr.de>; Fri, 18 Sep 2020 00:22:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsfK24jz5zDqGS
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 00:21:10 +1000 (AEST)
IronPort-SDR: uIVB981nzpeqPD9l/RFlIp0TH5BFyqAUa1uaE0QmfyixEwC+6rPhgDs6U+Yjx9uzSO/AZtdZP8
 c4rxjI46u45w==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="139709579"
X-IronPort-AV: E=Sophos;i="5.76,437,1592895600"; 
 d="scan'208,217";a="139709579"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 07:21:05 -0700
IronPort-SDR: a566sQ24wKWWIPJL9V7GiBkZ5tyV1yYwlr1ENvYWJn30Dsoxskrl0FbHzOBiaABRSU3Dvbpx3d
 WWkdJdqWZZYg==
X-IronPort-AV: E=Sophos;i="5.76,437,1592895600"; 
 d="scan'208,217";a="483765069"
Received: from rthomaiy-mobl.gar.corp.intel.com (HELO [10.215.118.31])
 ([10.215.118.31])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 07:21:02 -0700
Subject: Re: Using bios-settings-mgr for setting hypervisor network attributes
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org,
 "Sekar, Suryakanth" <suryakanth.sekar@intel.com>
References: <C9C88F03-4715-444E-9B1A-3834995458EA@getmailspring.com>
 <20200916172045.GD6152@heinlein>
 <CACWQX80BYYwPTN1PsbLfjFN5fQyjNGC1SxM9iyBKvxNiLh=WLQ@mail.gmail.com>
 <a5f0245d-703d-e0ba-0344-442c49a60cdf@linux.vnet.ibm.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <1239ac84-f36a-55b8-1bf4-8200f429c3e8@linux.intel.com>
Date: Thu, 17 Sep 2020 19:50:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <a5f0245d-703d-e0ba-0344-442c49a60cdf@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------FEBC5AB45A6748EE4D6BAEF5"
Content-Language: en-US
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

This is a multi-part message in MIME format.
--------------FEBC5AB45A6748EE4D6BAEF5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Ratan / Manoj,

Hypervisor (VM) Ethernet Interfaces is not a BIOS / Host firmware 
settings right?. Is there any model, where the BIOS Settings of Host 
Network interface like IPV4 / IPV6 is passed to the OS level (If yes, 
through what mechanism, proprietary ?). We have BIOS Network settings, 
but mostly that will be used in terms of PXE boot etc., but this will 
not be passed to the Host OS/ Hypervisor (which has to manage this on 
it's own). Let me know if i am missing anything here. So not sure, why 
Hypervisor / OS Ethernet interface must be passed to BIOS Settings 
instead of directly communicating to the Hypervisor / OS level software 
directly.

For BIOS settings --> Pending v/s configured value, Remote BIOS 
configuration design doc 
<https://github.com/openbmc/docs/blob/master/designs/remote-bios-configuration.md>, 
already handles the same using PendingAttributes. This is based on the 
AttributeRegistry and as per the design it don't advertise every single 
setting in D-Bus, instead it will be collection (dynamic in nature).

For Hypervisor / System Ethernet Interfaces I agree with James F, As 
long as bmcweb does the mapper query and / or association to determine 
the Service and Object path of the daemon, which will handle the 
ComputerSystem (Host) EthernetInterfaces it should be fine as the 
mechanism of forwarding the data to the OS will be different based on 
implementation.

Regards,

Richard

On 9/17/2020 1:10 PM, Ratan Gupta wrote:
> Hi Pattrick, Ed,
>
>
> We need to address the below two concerns with the existing settings 
> infra.
>
>   * Pending v/s configured value: Currently settings have single Dbus
>     Object, Some properties which is for host firmware we need to have
>     two placeholders one for Pending values and one for Configured
>     values. Bios settings have this concept.
>       o Should we add two Dbus objects in settings infra?
>   * Dynamic Dbus objects: Currently settings infrastructure is only
>     for static objects, Objects which gets added on runtime, settings
>     infra doesn't support that.
>       o Eg: IP address on ethernet interface is dynamic in nature, An
>         ethernet interface can have multiple IP address on it.
>         considering if SLAAC is enabled(ipV6).
>       o Seems this problem is common for both(settings v/s bios-settings)
>
> Regards
> Ratan Gupta
>
>
> On 9/16/20 11:14 PM, Ed Tanous wrote:
>> On Wed, Sep 16, 2020 at 10:20 AM Patrick Williams<patrick@stwcx.xyz>  wrote:
>>> On Wed, Sep 16, 2020 at 08:17:01PM +0530, manoj kiran wrote:
>>>> Hi Ed & James,
>>>>
>>>> Till now IBM was using phosphor-settings infrastructure as back-end and uses Ethernet Schema for Hypervisor computer system(hypervisor_ethernet.hpp) for setting the IP address of hypervisor. And now we are planning to leverage the capabilities of bios-settings-mgr(backend) as well to set the hypervisor attributes.
>>>> do you see any concerns here ?
>>>> Thanks,
>>>> Manoj
>>> These end up being two quite different implementations from a dbus
>>> perspective, which could have implications to Redfish and webui users.
>>>
>>> With 'settings' there is no generic settings interfacess on dbus; every
>>> setting is required to have some modeled interface.  This is great when
>>> you are exposing some hypervisor setting that the BMC also has for
>>> itself, such as network.  We have a single dbus interface for all
>>> network end-points and it doesn't matter if it is for the BMC or the
>>> Hypervisor.
>>>
>>> With 'bios-settings-mgr' there are only generic free-form settings
>>> values, which presently can be either int64 or string[1].
>> If this is correct, then I withdraw my support.  I had assumed
>> bios-settings-mgr would host several objects that contain an
>> EthernetInterface [1] api, similar to what phosphor-networkd does, and
>> whose endpoints require no new code in most of the endpoints.  If
>> we're talking about moving all this to a simple key-value store,
>> running on yet another representation of what a network interface
>> looks like, that's going in the wrong direction in terms of fidelity
>> and complexity.
>>
>> With that said, if I'm mistaken, let me know.
>>
>>>   This means
>>> there is no overlap with any similar settings we have on the BMC and
>>> there is no programatic way to ensure the data is of the right type and
>>> named with the right key.  This approach is better when you have large
>>> numbers of attributes for concepts which the BMC doesn't have itself.
>>>
>>> My understanding was that the 'bios-settings-mgr' was typically going to be
>>> used for uploading a large blob of configuration values and the external
>>> interfaces would have fairly minimal code related to individual
>>> settings.  My concern with using 'bios-settings-mgr' in general is that
>>> it will end up being very tight coupling between external interfaces
>>> (Redfish / webui) and BIOS implementations.  When you use 'settings',
>>> you can implement much more generic external interface code and likely
>>> limit the coupling, if any, to the PLDM provider.
>> I think we have one benefit here in that there's going to be several
>> implementations of the bios-settings-mgr for the various bios
>> implementations that will keep us more "honest" about our APIs.  It's
>> not a satisfying answer, I realize, but I think it's the best we can
>> do at the moment.
>>
>>> Net is, if you're expecting to be able to modify hypervisor values
>>> through Redfish or WebUI, I think the best approach is to use
>>> 'settings'.
>> The problem with the "settings" approach becomes error handling.
>> Settingsd has no context of a transaction, or a backend on the other
>> side, so when and if things fail, they fail silently, or possibly with
>> a log.  In the case of hosting this API in the BIOS daemon, it can
>> actually do the "commit" of the parameters to BIOS as part of the dbus
>> transaction, so once the return code is received from the method call,
>> the user can know that the values were "latched", and can knowingly
>> move on.  If they weren't latched, the client can know if it makes
>> sense to retry, or do some other procedure.
>> This also has nice properties for the BMC, as it never has to "own"
>> storage of the data, nor does it have to implement all the validation
>> routines, as it can rely on the actual data owner to do so.
>>
>>> 1.https://github.com/openbmc/phosphor-dbus-interfaces/blob/77a742627edde54aec625d7c1a200d9f4832f0ba/xyz/openbmc_project/BIOSConfig/Manager.interface.yaml#L44
>>>
>>> --
>>> Patrick Williams
>> 1.https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Network/EthernetInterface.interface.yaml

--------------FEBC5AB45A6748EE4D6BAEF5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Ratan / Manoj, <br>
    </p>
    <p>Hypervisor (VM) Ethernet Interfaces is not a BIOS / Host firmware
      settings right?. Is there any model, where the BIOS Settings of
      Host Network interface like IPV4 / IPV6 is passed to the OS level
      (If yes, through what mechanism, proprietary ?). We have BIOS
      Network settings, but mostly that will be used in terms of PXE
      boot etc., but this will not be passed to the Host OS/ Hypervisor
      (which has to manage this on it's own). Let me know if i am
      missing anything here. So not sure, why Hypervisor / OS Ethernet
      interface must be passed to BIOS Settings instead of directly
      communicating to the Hypervisor / OS level software directly.<br>
    </p>
    <p>For BIOS settings --&gt; Pending v/s configured value, <a
        moz-do-not-send="true"
href="https://github.com/openbmc/docs/blob/master/designs/remote-bios-configuration.md">Remote
        BIOS configuration design doc</a>, already handles the same
      using PendingAttributes. This is based on the AttributeRegistry
      and as per the design it don't advertise every single setting in
      D-Bus, instead it will be collection (dynamic in nature). <br>
    </p>
    <p>For Hypervisor / System Ethernet Interfaces I agree with James F,
      As long as bmcweb does the mapper query and / or association to
      determine the Service and Object path of the daemon, which will
      handle the ComputerSystem (Host) EthernetInterfaces it should be
      fine as the mechanism of forwarding the data to the OS will be
      different based on implementation.<br>
    </p>
    <p>Regards,</p>
    <p>Richard</p>
    <div class="moz-cite-prefix">On 9/17/2020 1:10 PM, Ratan Gupta
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a5f0245d-703d-e0ba-0344-442c49a60cdf@linux.vnet.ibm.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <tt>Hi Pattrick, Ed,</tt><tt><br>
      </tt><tt><br>
      </tt><tt><br>
      </tt><tt>We need to address the below two concerns with the
        existing settings infra.</tt>
      <ul>
        <li><tt>Pending v/s configured value: Currently settings have
            single Dbus Object, </tt><tt><tt> Some properties which is
              for host firmware we need to have </tt><tt>two
              placeholders one </tt>for Pending values and one for
            Configured values. </tt><tt>Bios settings have this
            concept.<br>
          </tt></li>
        <ul>
          <li><tt>Should we add two Dbus objects in settings infra?</tt><tt><br>
            </tt></li>
        </ul>
        <li><tt>Dynamic Dbus objects: Currently settings infrastructure
            is only for static objects, Objects which gets added on
            runtime, settings infra doesn't support that.</tt></li>
        <ul>
          <li><tt>Eg: IP address on ethernet interface is dynamic in
              nature, An ethernet interface can have multiple IP address
              on it. considering if SLAAC is enabled(ipV6).</tt></li>
          <li><tt>Seems this problem is common for both(settings v/s
              bios-settings)</tt><tt><br>
            </tt></li>
        </ul>
      </ul>
      <tt>Regards</tt><tt><br>
      </tt><tt>Ratan Gupta</tt><br>
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 9/16/20 11:14 PM, Ed Tanous wrote:<br>
      </div>
      <blockquote type="cite"
cite="mid:CACWQX80BYYwPTN1PsbLfjFN5fQyjNGC1SxM9iyBKvxNiLh=WLQ@mail.gmail.com">
        <pre class="moz-quote-pre" wrap="">On Wed, Sep 16, 2020 at 10:20 AM Patrick Williams <a class="moz-txt-link-rfc2396E" href="mailto:patrick@stwcx.xyz" moz-do-not-send="true">&lt;patrick@stwcx.xyz&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Wed, Sep 16, 2020 at 08:17:01PM +0530, manoj kiran wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Hi Ed &amp; James,

Till now IBM was using phosphor-settings infrastructure as back-end and uses Ethernet Schema for Hypervisor computer system(hypervisor_ethernet.hpp) for setting the IP address of hypervisor. And now we are planning to leverage the capabilities of bios-settings-mgr(backend) as well to set the hypervisor attributes.
do you see any concerns here ?
Thanks,
Manoj
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">These end up being two quite different implementations from a dbus
perspective, which could have implications to Redfish and webui users.

With 'settings' there is no generic settings interfacess on dbus; every
setting is required to have some modeled interface.  This is great when
you are exposing some hypervisor setting that the BMC also has for
itself, such as network.  We have a single dbus interface for all
network end-points and it doesn't matter if it is for the BMC or the
Hypervisor.

With 'bios-settings-mgr' there are only generic free-form settings
values, which presently can be either int64 or string[1].
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">If this is correct, then I withdraw my support.  I had assumed
bios-settings-mgr would host several objects that contain an
EthernetInterface [1] api, similar to what phosphor-networkd does, and
whose endpoints require no new code in most of the endpoints.  If
we're talking about moving all this to a simple key-value store,
running on yet another representation of what a network interface
looks like, that's going in the wrong direction in terms of fidelity
and complexity.

With that said, if I'm mistaken, let me know.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap=""> This means
there is no overlap with any similar settings we have on the BMC and
there is no programatic way to ensure the data is of the right type and
named with the right key.  This approach is better when you have large
numbers of attributes for concepts which the BMC doesn't have itself.

My understanding was that the 'bios-settings-mgr' was typically going to be
used for uploading a large blob of configuration values and the external
interfaces would have fairly minimal code related to individual
settings.  My concern with using 'bios-settings-mgr' in general is that
it will end up being very tight coupling between external interfaces
(Redfish / webui) and BIOS implementations.  When you use 'settings',
you can implement much more generic external interface code and likely
limit the coupling, if any, to the PLDM provider.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">I think we have one benefit here in that there's going to be several
implementations of the bios-settings-mgr for the various bios
implementations that will keep us more "honest" about our APIs.  It's
not a satisfying answer, I realize, but I think it's the best we can
do at the moment.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Net is, if you're expecting to be able to modify hypervisor values
through Redfish or WebUI, I think the best approach is to use
'settings'.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">The problem with the "settings" approach becomes error handling.
Settingsd has no context of a transaction, or a backend on the other
side, so when and if things fail, they fail silently, or possibly with
a log.  In the case of hosting this API in the BIOS daemon, it can
actually do the "commit" of the parameters to BIOS as part of the dbus
transaction, so once the return code is received from the method call,
the user can know that the values were "latched", and can knowingly
move on.  If they weren't latched, the client can know if it makes
sense to retry, or do some other procedure.
This also has nice properties for the BMC, as it never has to "own"
storage of the data, nor does it have to implement all the validation
routines, as it can rely on the actual data owner to do so.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">1. <a class="moz-txt-link-freetext" href="https://github.com/openbmc/phosphor-dbus-interfaces/blob/77a742627edde54aec625d7c1a200d9f4832f0ba/xyz/openbmc_project/BIOSConfig/Manager.interface.yaml#L44" moz-do-not-send="true">https://github.com/openbmc/phosphor-dbus-interfaces/blob/77a742627edde54aec625d7c1a200d9f4832f0ba/xyz/openbmc_project/BIOSConfig/Manager.interface.yaml#L44</a>

--
Patrick Williams
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">1. <a class="moz-txt-link-freetext" href="https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Network/EthernetInterface.interface.yaml" moz-do-not-send="true">https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Network/EthernetInterface.interface.yaml</a>
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------FEBC5AB45A6748EE4D6BAEF5--
