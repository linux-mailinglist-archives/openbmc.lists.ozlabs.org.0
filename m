Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A85AF157317
	for <lists+openbmc@lfdr.de>; Mon, 10 Feb 2020 11:51:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GN5024pvzDqBy
	for <lists+openbmc@lfdr.de>; Mon, 10 Feb 2020 21:51:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=suryakanth.sekar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48GN231GBRzDqGY
 for <openbmc@lists.ozlabs.org>; Mon, 10 Feb 2020 21:49:10 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Feb 2020 02:49:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,424,1574150400"; 
 d="scan'208,217";a="226112656"
Received: from ssekar-mobl1.gar.corp.intel.com (HELO [10.66.114.123])
 ([10.66.114.123])
 by orsmga008.jf.intel.com with ESMTP; 10 Feb 2020 02:49:05 -0800
Subject: Re: FW: Exposing BIOS attributes to a remote management console
To: openbmc@lists.ozlabs.org, Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>, 
 suryakanth.sekar@linux.intel.com
References: <7622d97a-13f2-8c38-6ae8-9325923c3c83@linux.vnet.ibm.com>
 <48777ea3-0af2-4725-9304-64ae4edb71d9@email.android.com>
 <1504A9E7C77EF44697F386AD61B16260152FEBA5@BGSMSX105.gar.corp.intel.com>
From: "Sekar, Suryakanth" <suryakanth.sekar@linux.intel.com>
Message-ID: <a54b4da5-b7a9-423e-a01e-720808ae748c@linux.intel.com>
Date: Mon, 10 Feb 2020 16:19:04 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1504A9E7C77EF44697F386AD61B16260152FEBA5@BGSMSX105.gar.corp.intel.com>
Content-Type: multipart/alternative;
 boundary="------------91C2B5403BA14D7F4E91806C"
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
--------------91C2B5403BA14D7F4E91806C
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Hi Deepak,

OOB BIOS high level config design doc is in progress. I will send for 
review soon.

Yes, we need to support all interface -IPMI/ MCTP/ Redfish Host interface.

If BIOS is not booted at all. BMC wont have any attribute info. It will 
be empty in BMC side.

BIOS must provide BIOS OOB capability via KCS interface in early boot stage.
Like supported proprietary BIOS attribute file format or PLDM support 
via MCTP  or
Redfish BIOS attribute registry format to the BMC.

BIOS must send the master BIOS attributes file(Intel properitary - XML 
type 0)
via KCS interface or all attributes details via Bios configuration PLDM 
via MCTP or
Redfish host interface during first boot.

BIOS must collect the new attribute values from BMC and update the same 
in BIOS

BIOS must send the updated master attributes file to the BMC and once 
its updated in BIOS

and reset the system to reflect the BIOS configuration.

OOB daemon in BMC  must maintain and collect the  attribute registry 
file from MCTP/ IPMI/ Redfish interface.

Convert the proprietary XML format/ PLDM data  into BIOS attribute 
Registry format &
must support the below following dbus method.

https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/18242

Validate the BIOS input data or User attribute value.

MCTP / Redfish host interface / IPMI must communicate with OOB daemon in 
BMC via D bus

Thanks

Suryakanth.S



> ---------- Forwarded message ----------
> From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com 
> <mailto:dkodihal@linux.vnet.ibm.com>>
> Date: Feb 8, 2020 1:59 PM
> Subject: Exposing BIOS attributes to a remote management console
> To: openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>
> Cc:
>
> Hi,
>
> To enable remote updates (via a remote management console that talks to
> the BMC) to the host firmware's BIOS settings table on IBM systems,
> we're thinking of the following flow:
>
> a) The host firmware sends down a BIOS settings table to the BMC using
> PLDM [1].
> b) The BMC uses phosphor-settingsd [2] as the backend to store BIOS
> attributes on D-Bus.
> c) Bmcweb implements the Redfish BIOS schema [3] to enable remote
> reads/writes on the BIOS attributes.
>
> However, c) is a problem because one needs to write YAML files [4] for
> the BMC to determine what D-Bus objects to make corresponding to the
> BIOS attributes. This requires a unique D-Bus interface *per* BIOS
> attribute. This means the BMC must have prior knowledge about the BIOS
> attributes.
>
> I don't think that's the right way to go about this for two reasons. One
> - this creates a lockstep dependency on the host firmware when the BIOS
> settings table needs to be updated, and two - I think the OpenBMC
> implementation of this must be able to receive (via PLDM/IPMI/other
> standard in-band means) a set of BIOS attributes from different BIOS
> firmware stacks dynamically and expose them for out of band updates,
> without having prior/build-time knowledge of those attributes. So I
> think this calls for a different kind of D-Bus interface/infrastructure
> than what the phosphor-settingsd app relies on. Something that enables
> the BMC to add to D-Bus a BIOS attribute dynamically, knowing it's name,
> type and default value.
>
> Any thoughts on this flow? I'm also curious to know if the Redfish BIOS
> schema/attribute registry model requires the BMC to have prior knowledge
> about the system BIOS attributes to update the registry. This wasn't
> obvious to me from a quick read of the schema.
>
> Thanks,
> Deepak
>
> [1]
> https://www.dmtf.org/sites/default/files/standards/documents/DSP0247_1.0.0.pdf
> [2] https://github.com/openbmc/phosphor-settingsd
> [3] https://redfish.dmtf.org/schemas/v1/Bios.v1_1_0.json
> [4]
> https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-phosphor/settings/phosphor-settings-defaults/defaults.yaml
>

--------------91C2B5403BA14D7F4E91806C
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi Deepak,</p>
    <p>OOB BIOS high level config design doc is in progress. I will send
      for review soon. <br>
    </p>
    <p>Yes, we need to support all interface -IPMI/ MCTP/ Redfish Host
      interface. <br>
    </p>
    <p>If BIOS is not booted at all. BMC wont have any attribute info.
      It will be empty in BMC side.</p>
    <p>BIOS must provide BIOS OOB capability via KCS interface in early
      boot stage.<br>
      Like supported proprietary BIOS attribute file format or PLDM
      support via MCTP  or <br>
      Redfish BIOS attribute registry format to the BMC.</p>
    <p>BIOS must send the master BIOS attributes file(Intel properitary
      - XML type 0)<br>
      via KCS interface or all attributes details via Bios configuration
      PLDM via MCTP or<br>
      Redfish host interface during first boot.</p>
    BIOS must collect the new attribute values from BMC and update the
    same in BIOS<br>
    <p>BIOS must send the updated master attributes file to the BMC and 
      once its updated in BIOS</p>
    <p>and reset the system to reflect the BIOS configuration.<br>
    </p>
    <p>OOB daemon in BMC  must maintain and collect the  attribute
      registry file from MCTP/ IPMI/ Redfish interface.<br>
    </p>
    <p>Convert the proprietary XML format/ PLDM data  into BIOS
      attribute Registry format &amp;<br>
      must support the below following dbus method.</p>
    <p><a class="moz-txt-link-freetext" href="https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/18242">https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/18242</a></p>
    <p>Validate the BIOS input data or User attribute value.</p>
    <p>MCTP / Redfish host interface / IPMI must communicate with OOB
      daemon in BMC via D bus</p>
    <p>Thanks</p>
    <p>Suryakanth.S<br>
    </p>
    <p><br>
    </p>
    <br>
    <blockquote type="cite"
cite="mid:1504A9E7C77EF44697F386AD61B16260152FEBA5@BGSMSX105.gar.corp.intel.com">
      <div class="WordSection1">
        <div>
          <div>
            <p class="MsoNormal">---------- Forwarded message ----------<br>
              From: Deepak Kodihalli &lt;<a
                href="mailto:dkodihal@linux.vnet.ibm.com"
                moz-do-not-send="true">dkodihal@linux.vnet.ibm.com</a>&gt;<br>
              Date: Feb 8, 2020 1:59 PM<br>
              Subject: Exposing BIOS attributes to a remote management
              console<br>
              To: <a href="mailto:openbmc@lists.ozlabs.org"
                moz-do-not-send="true">openbmc@lists.ozlabs.org</a><br>
              Cc: <br>
              <br>
              <o:p></o:p></p>
          </div>
        </div>
        <div>
          <p class="MsoNormal" style="margin-bottom:12.0pt"><span
              style="font-size:10.0pt">Hi,<br>
              <br>
              To enable remote updates (via a remote management console
              that talks to <br>
              the BMC) to the host firmware's BIOS settings table on IBM
              systems, <br>
              we're thinking of the following flow:<br>
              <br>
              a) The host firmware sends down a BIOS settings table to
              the BMC using <br>
              PLDM [1].<br>
              b) The BMC uses phosphor-settingsd [2] as the backend to
              store BIOS <br>
              attributes on D-Bus.<br>
              c) Bmcweb implements the Redfish BIOS schema [3] to enable
              remote <br>
              reads/writes on the BIOS attributes.<br>
              <br>
              However, c) is a problem because one needs to write YAML
              files [4] for <br>
              the BMC to determine what D-Bus objects to make
              corresponding to the <br>
              BIOS attributes. This requires a unique D-Bus interface
              *per* BIOS <br>
              attribute. This means the BMC must have prior knowledge
              about the BIOS <br>
              attributes.<br>
              <br>
              I don't think that's the right way to go about this for
              two reasons. One <br>
              - this creates a lockstep dependency on the host firmware
              when the BIOS <br>
              settings table needs to be updated, and two - I think the
              OpenBMC <br>
              implementation of this must be able to receive (via
              PLDM/IPMI/other <br>
              standard in-band means) a set of BIOS attributes from
              different BIOS <br>
              firmware stacks dynamically and expose them for out of
              band updates, <br>
              without having prior/build-time knowledge of those
              attributes. So I <br>
              think this calls for a different kind of D-Bus
              interface/infrastructure <br>
              than what the phosphor-settingsd app relies on. Something
              that enables <br>
              the BMC to add to D-Bus a BIOS attribute dynamically,
              knowing it's name, <br>
              type and default value.<br>
              <br>
              Any thoughts on this flow? I'm also curious to know if the
              Redfish BIOS <br>
              schema/attribute registry model requires the BMC to have
              prior knowledge <br>
              about the system BIOS attributes to update the registry.
              This wasn't <br>
              obvious to me from a quick read of the schema.<br>
              <br>
              Thanks,<br>
              Deepak<br>
              <br>
              [1] <br>
              <a
href="https://www.dmtf.org/sites/default/files/standards/documents/DSP0247_1.0.0.pdf"
                moz-do-not-send="true">https://www.dmtf.org/sites/default/files/standards/documents/DSP0247_1.0.0.pdf</a><br>
              [2] <a
                href="https://github.com/openbmc/phosphor-settingsd"
                moz-do-not-send="true">https://github.com/openbmc/phosphor-settingsd</a><br>
              [3] <a
                href="https://redfish.dmtf.org/schemas/v1/Bios.v1_1_0.json"
                moz-do-not-send="true">https://redfish.dmtf.org/schemas/v1/Bios.v1_1_0.json</a><br>
              [4] <br>
              <a
href="https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-phosphor/settings/phosphor-settings-defaults/defaults.yaml"
                moz-do-not-send="true">https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-phosphor/settings/phosphor-settings-defaults/defaults.yaml</a><o:p></o:p></span></p>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------91C2B5403BA14D7F4E91806C--
