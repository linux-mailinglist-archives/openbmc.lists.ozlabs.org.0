Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF581E4485
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 15:52:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XC2F06K5zDqTL
	for <lists+openbmc@lfdr.de>; Wed, 27 May 2020 23:52:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XBzP6BcLzDqKb
 for <openbmc@lists.ozlabs.org>; Wed, 27 May 2020 23:50:08 +1000 (AEST)
IronPort-SDR: eAv36v3zKONFdgZD2GKcpJvimHnspUnGXqmTZkMHgG9G6tm+zoPIkzLMnrN1jHx015J5ui2Xaz
 O4VD9yz3zARA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2020 06:50:05 -0700
IronPort-SDR: kS5twHX1D9G5nVIeKc+Fm9rkHt+P6SAjfNv5eaowa7SYCCAUxVjHMkdnL6hfWuwUdvqFJ3MWDj
 Gm+t2KYSbAPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,441,1583222400"; 
 d="scan'208,217";a="468746416"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.252.69.86])
 ([10.252.69.86])
 by fmsmga006.fm.intel.com with ESMTP; 27 May 2020 06:50:02 -0700
Subject: Re: D-Bus interface to provide data to entity manager
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 James Feist <james.feist@linux.intel.com>,
 "Bhat, Sumanth" <sumanth.bhat@intel.com>,
 Patrick Williams <patrick@stwcx.xyz>
References: <7d8ba039-377f-c567-6a3d-5a18c4789df2@linux.vnet.ibm.com>
 <5fc67500-b0f4-c964-fc9a-d3f5346e47ab@linux.vnet.ibm.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <0a9b8934-a3be-aaa0-90c0-134f286df951@linux.intel.com>
Date: Wed, 27 May 2020 19:20:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <5fc67500-b0f4-c964-fc9a-d3f5346e47ab@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------DBFA1E00A6D89F7E1FEC2BD4"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------DBFA1E00A6D89F7E1FEC2BD4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

I always view D-Bus interface as a specification / API which can work 
with different producers / consumers (correct me, if that's not what we 
intend with D-Bus interface here). Problem with Option 1 is, it will end 
up in having multiple producers exposing different interface, and 
thereby consumers(user interface facing applications) of D-Bus must be 
aware about all the D-Bus interfaces and always requires change.

Consider, we want to expose ChassisType, then irrespective of PLDM FRU / 
IPMI FRU / Proprietary FRU, Consumer applications must read it in the 
same manner. Having different interface / property types, requires 
update in both the end. PLDM FRU / IPMI FRU can be in common form 
(except few nit's /OEM's). We need to make sure it is represented in 
that angle. As of today phosphor-dbus-interfaces doesn't have FRU 
interface, but it has inventory related interfaces (exposed by 
Entity-Manager), which is what Redfish uses (i.e. Indirectly the 
FruDevice exposed interface is hidden by Entity-manager, and inventory 
interface exposed by entity-manager is used).

As of today, entity-manager doesn't add Inventory interface 
automatically for Add-on cards (which doesn't have any json 
configuration), but needs exposure (say PLDM based Add on card devices 
will be of this type), but shouldn't be hard to add it anyway.

Now the question is do we want to expose FRU as a separate interafce to 
be used in User facing application, or shall we just use Inventory based 
interface itself ?If inventory itself can be used, then let's go ahead 
and add more fields to those if missing anything / correct the same 
accordingly.

James, Deepak, Patrick - your thoughts ?


regards,

Richard


Say, we want to expose Manufacturer Name, then it can be produced by 
PLDM FRU application, IPMI Fru based application or even any proprietary 
application and consumed by applications like Redfish / any other 
proprietary one. In this way applications can get the data of what ever 
it is required. I don't find any data which is different in terms of 
PLDM FRU / IPMI FRU (ofcourse OEM fields will be there, but that can't 
be unique), but we need to implement things in common form though.

Say, ChassisType in IPMI FRU is single byte field, whereas in PLDM FRU 
it will be of string. But we need to represent the same in well 
established form (say SMBIOS System /Chassis Type enums). i.e. Producers 
(IPMI FRU must change it from one byte type to enum), and PLDM FRU from 
string to proper enum. Redfish will use this one and accordingly map it 
to the schema


On 5/26/2020 6:26 PM, Deepak Kodihalli wrote:
> On 19/05/20 9:10 am, Deepak Kodihalli wrote:
>> Hi,
>>
>> IBM systems have a requirement to consume FRU information sent down 
>> via the host firmware and then relay that onto D-Bus (and then onto 
>> Redfish). The host firmware will send down FRU information using PLDM.
>>
>> We wanted to use entity manager to enable transforming the PLDM FRU 
>> data to D-Bus properties that fall under D-Bus inventory interfaces 
>> such as the xyz.openbmc_project.Inventory.Decorator.Asset interface. 
>> I have an update to the PLDM design doc to capture this flow [1], and 
>> some D-Bus interfaces [2] proposed on Gerrit. Would appreciate 
>> feedback on the same. The high level idea is that the pldm daemon 
>> will host raw PLDM FRU information on D-Bus, and via JSON configs, 
>> entity manager can convert those to D-Bus inventory objects (which 
>> then can be found by bmcweb).
>>
>>  From an entity manager perspective, I had few questions :
>> - I see there is provision for persistence, but it looks like 
>> applying the persisted information works only if "D-Bus probes" 
>> succeed. We have a requirement to make the host-sent inventory 
>> information available even when the host is powered off. Now if the 
>> host has sent this, then powers off, and then BMC reboots, the BMC 
>> will no longer have the raw PLDM FRU information on D-Bus and hence 
>> the entity manager probe on the same will fail. Question is, can the 
>> probes be made optional when reading the persisted config (system.json)?
>>
>> - How are hierarchical relationships between FRUs supposed to be 
>> represented? Is that based on D-Bus pathnames? Or making use of 
>> something like the D-Bus Associations interface? Any thoughts on how 
>> representing such parent-child relation can be achieved via entity 
>> manager configs?
>>
>> [1] https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/32532/
>> [2] 
>> https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/32533/ 
>>
>>
>> Thanks,
>> Deepak
>>
>
> I've got some feedback on the proposal above, which is primarily 
> directed at/impacts how the PLDM daemon provides FRU information to 
> the entity manager daemon. Wanted to discuss the same here.
>
> Very briefly, the proposal was :
> a) The PLDM daemon will parse PLDM FRU format data and host the same 
> on D-Bus as a set of PLDM FRU properties (similar to how the FruDevice 
> daemon hosts properties under xyz.openbmc_project.FruDevice).
> b) Apply EM system/board specific configurations on a) to be able to 
> create specific inventory D-Bus objects (this is how EM works today).
>
>
> To do a) above, there are 3 options:
>
> 1) Propose a D-Bus interface in phosphor-dbus-interfaces. This was [2] 
> in my original email above. The concern raised by Patrick here is that 
> this interface is very specific to a protocol (PLDM in this case), 
> whereas the phosphor D-Bus interfaces are mostly abstract and protocol 
> agnostic.
>
> In my opinion, PLDM is also a data model, so PLDM specific D-Bus 
> interfaces can enable two apps that are PLDM aware (for eg a PLDM 
> requester app talking to the PLDM daemon) to talk to each other. I do 
> see other protocol specific D-Bus interfaces as well (for eg related 
> to SMBIOS). So I don't really understand the concern. The protocol 
> specific interfaces do not preclude other abstract interfaces.
>
>
>
> 2) Propose a generic/abstract 'FRU properties' kind of D-Bus 
> interface. This is something that both the PLDM daemon and FRU device 
> daemon could use to host FRU information on D-Bus, and to provide the 
> same as an intermediate FRU format data to apps like EM. The 
> suggestion on the docs commit above [2] was to have an interface like 
> {Enum[Protocol], array[byte]}. I think instead this could be a 
> dict[string, variant[string, int64]], for a FRU property to value 
> mapping.
>
> While this sounds interesting, are the maintainers of EM and FruDevice 
> interested in such an interface? Based on how this interface is 
> designed, it might imply changes to FruDevice and Entity Manager. I 
> might be interested in chasing this based on the feedback received, 
> and if this will really have users other than the PLDM daemon.
>
>
>
> 3) If everyone thinks option 1 is a bad idea, and if the interest in 
> option 2 is limited, I could do this based on how the FruDevice daemon 
> and EM interact today, which is based on kind of a private D-Bus 
> interface between the two apps. I don't think the Fru device daemon is 
> tied up to EM though, it could even be in its own repository.
>
>
> Thanks,
> Deepak

--------------DBFA1E00A6D89F7E1FEC2BD4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>I always view D-Bus interface as a specification / API which can
      work with different producers / consumers (correct me, if that's
      not what we intend with D-Bus interface here). Problem with Option
      1 is, it will end up in having multiple producers exposing
      different interface, and thereby consumers(user interface facing
      applications) of D-Bus must be aware about all the D-Bus
      interfaces and always requires change. <br>
    </p>
    <p>Consider, we want to expose ChassisType, then irrespective of
      PLDM FRU / IPMI FRU / Proprietary FRU, Consumer applications must
      read it in the same manner. Having different interface / property
      types, requires update in both the end. PLDM FRU / IPMI FRU can be
      in common form (except few nit's /OEM's). We need to make sure it
      is represented in that angle. As of today phosphor-dbus-interfaces
      doesn't have FRU interface, but it has inventory related
      interfaces (exposed by Entity-Manager), which is what Redfish uses
      (i.e. Indirectly the FruDevice exposed interface is hidden by
      Entity-manager, and inventory interface exposed by entity-manager
      is used). <br>
    </p>
    <p>As of today, entity-manager doesn't add Inventory interface
      automatically for Add-on cards (which doesn't have any json
      configuration), but needs exposure (say PLDM based Add on card
      devices will be of this type), but shouldn't be hard to add it
      anyway.</p>
    <p>Now the question is do we want to expose FRU as a separate
      interafce to be used in User facing application, or shall we just
      use Inventory based interface itself ?If inventory itself can be
      used, then let's go ahead and add more fields to those if missing
      anything / correct the same accordingly. <br>
    </p>
    <p>James, Deepak, Patrick - your thoughts ?<br>
    </p>
    <p><br>
    </p>
    <p>regards,</p>
    <p>Richard<br>
    </p>
    <p><br>
    </p>
    <p class="style-scope gr-formatted-text" style="box-sizing:
      border-box; margin: 0px 0px 0.8em; padding: 0px; border: 0px;
      font-style: normal; font-variant-ligatures: normal;
      font-variant-caps: normal; font-variant-numeric: inherit;
      font-variant-east-asian: inherit; font-weight: 400; font-stretch:
      inherit; font-size: 13px; line-height: inherit; font-family:
      Roboto, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;,
      Helvetica, Arial, sans-serif, &quot;Apple Color Emoji&quot;,
      &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;;
      vertical-align: baseline; max-width: 80ch; color: rgb(33, 33, 33);
      letter-spacing: normal; orphans: 2; text-align: start;
      text-indent: 0px; text-transform: none; white-space: normal;
      widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial;"><span id="output" class="style-scope gr-linked-text" style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; white-space: pre-wrap; overflow-wrap: break-word;">
Say, we want to expose Manufacturer Name, then it can be produced by PLDM FRU application, IPMI Fru based application or even any proprietary application and consumed by applications like Redfish / any other proprietary one. In this way applications can get the data of what ever it is required. 
I don't find any data which is different in terms of PLDM FRU / IPMI FRU (ofcourse OEM fields will be there, but that can't be unique), but we need to implement things in common form though.</span></p>
    <p class="style-scope gr-formatted-text" style="box-sizing:
      border-box; margin: 0px; padding: 0px; border: 0px; font-style:
      normal; font-variant-ligatures: normal; font-variant-caps: normal;
      font-variant-numeric: inherit; font-variant-east-asian: inherit;
      font-weight: 400; font-stretch: inherit; font-size: 13px;
      line-height: inherit; font-family: Roboto, -apple-system,
      BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial,
      sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI
      Emoji&quot;, &quot;Segoe UI Symbol&quot;; vertical-align:
      baseline; max-width: 80ch; color: rgb(33, 33, 33); letter-spacing:
      normal; orphans: 2; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 2;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); text-decoration-style:
      initial; text-decoration-color: initial;"><span id="output" class="style-scope gr-linked-text" style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; white-space: pre-wrap; overflow-wrap: break-word;">Say, ChassisType in IPMI FRU is single byte field, whereas in PLDM FRU it will be of string. But we need to represent the same in well established form (say SMBIOS System /Chassis Type enums). 
i.e. Producers (IPMI FRU must change it from one byte type to enum), and PLDM FRU from string to proper enum. Redfish will use this one and accordingly map it to the schema</span></p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/26/2020 6:26 PM, Deepak Kodihalli
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5fc67500-b0f4-c964-fc9a-d3f5346e47ab@linux.vnet.ibm.com">On
      19/05/20 9:10 am, Deepak Kodihalli wrote:
      <br>
      <blockquote type="cite">Hi,
        <br>
        <br>
        IBM systems have a requirement to consume FRU information sent
        down via the host firmware and then relay that onto D-Bus (and
        then onto Redfish). The host firmware will send down FRU
        information using PLDM.
        <br>
        <br>
        We wanted to use entity manager to enable transforming the PLDM
        FRU data to D-Bus properties that fall under D-Bus inventory
        interfaces such as the
        xyz.openbmc_project.Inventory.Decorator.Asset interface. I have
        an update to the PLDM design doc to capture this flow [1], and
        some D-Bus interfaces [2] proposed on Gerrit. Would appreciate
        feedback on the same. The high level idea is that the pldm
        daemon will host raw PLDM FRU information on D-Bus, and via JSON
        configs, entity manager can convert those to D-Bus inventory
        objects (which then can be found by bmcweb).
        <br>
        <br>
         From an entity manager perspective, I had few questions :
        <br>
        - I see there is provision for persistence, but it looks like
        applying the persisted information works only if "D-Bus probes"
        succeed. We have a requirement to make the host-sent inventory
        information available even when the host is powered off. Now if
        the host has sent this, then powers off, and then BMC reboots,
        the BMC will no longer have the raw PLDM FRU information on
        D-Bus and hence the entity manager probe on the same will fail.
        Question is, can the probes be made optional when reading the
        persisted config (system.json)?
        <br>
        <br>
        - How are hierarchical relationships between FRUs supposed to be
        represented? Is that based on D-Bus pathnames? Or making use of
        something like the D-Bus Associations interface? Any thoughts on
        how representing such parent-child relation can be achieved via
        entity manager configs?
        <br>
        <br>
        [1] <a class="moz-txt-link-freetext" href="https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/32532/">https://gerrit.openbmc-project.xyz/#/c/openbmc/docs/+/32532/</a>
        <br>
        [2]
<a class="moz-txt-link-freetext" href="https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/32533/">https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/32533/</a>
        <br>
        <br>
        Thanks,
        <br>
        Deepak
        <br>
        <br>
      </blockquote>
      <br>
      I've got some feedback on the proposal above, which is primarily
      directed at/impacts how the PLDM daemon provides FRU information
      to the entity manager daemon. Wanted to discuss the same here.
      <br>
      <br>
      Very briefly, the proposal was :
      <br>
      a) The PLDM daemon will parse PLDM FRU format data and host the
      same on D-Bus as a set of PLDM FRU properties (similar to how the
      FruDevice daemon hosts properties under
      xyz.openbmc_project.FruDevice).
      <br>
      b) Apply EM system/board specific configurations on a) to be able
      to create specific inventory D-Bus objects (this is how EM works
      today).
      <br>
      <br>
      <br>
      To do a) above, there are 3 options:
      <br>
      <br>
      1) Propose a D-Bus interface in phosphor-dbus-interfaces. This was
      [2] in my original email above. The concern raised by Patrick here
      is that this interface is very specific to a protocol (PLDM in
      this case), whereas the phosphor D-Bus interfaces are mostly
      abstract and protocol agnostic.
      <br>
      <br>
      In my opinion, PLDM is also a data model, so PLDM specific D-Bus
      interfaces can enable two apps that are PLDM aware (for eg a PLDM
      requester app talking to the PLDM daemon) to talk to each other. I
      do see other protocol specific D-Bus interfaces as well (for eg
      related to SMBIOS). So I don't really understand the concern. The
      protocol specific interfaces do not preclude other abstract
      interfaces.
      <br>
      <br>
      <br>
      <br>
      2) Propose a generic/abstract 'FRU properties' kind of D-Bus
      interface. This is something that both the PLDM daemon and FRU
      device daemon could use to host FRU information on D-Bus, and to
      provide the same as an intermediate FRU format data to apps like
      EM. The suggestion on the docs commit above [2] was to have an
      interface like {Enum[Protocol], array[byte]}. I think instead this
      could be a dict[string, variant[string, int64]], for a FRU
      property to value mapping.
      <br>
      <br>
      While this sounds interesting, are the maintainers of EM and
      FruDevice interested in such an interface? Based on how this
      interface is designed, it might imply changes to FruDevice and
      Entity Manager. I might be interested in chasing this based on the
      feedback received, and if this will really have users other than
      the PLDM daemon.
      <br>
      <br>
      <br>
      <br>
      3) If everyone thinks option 1 is a bad idea, and if the interest
      in option 2 is limited, I could do this based on how the FruDevice
      daemon and EM interact today, which is based on kind of a private
      D-Bus interface between the two apps. I don't think the Fru device
      daemon is tied up to EM though, it could even be in its own
      repository.
      <br>
      <br>
      <br>
      Thanks,
      <br>
      Deepak
      <br>
    </blockquote>
  </body>
</html>

--------------DBFA1E00A6D89F7E1FEC2BD4--
