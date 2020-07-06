Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6912154D1
	for <lists+openbmc@lfdr.de>; Mon,  6 Jul 2020 11:38:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0gVw2rG9zDqck
	for <lists+openbmc@lfdr.de>; Mon,  6 Jul 2020 19:38:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=suryakanth.sekar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0gV45GvKzDqTN
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jul 2020 19:38:00 +1000 (AEST)
IronPort-SDR: RFN1OoHGrBC6AZtiU1XMFLisvBcPnyjJEiGF0BsxCFTQHT9RoZMjz6XXm7Nm7wkIGF+WUPQ7Hs
 GQrIOWFxBmoQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9673"; a="134841381"
X-IronPort-AV: E=Sophos;i="5.75,318,1589266800"; 
 d="scan'208,217";a="134841381"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2020 02:37:55 -0700
IronPort-SDR: lICrgy/vIJBiS/qOziKjyAo/BEgnH8bNPeF5Wpg+nm3irjAl2+so/TNukXufH0rBPZF9runkg7
 pBY3r8d0G+eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,318,1589266800"; 
 d="scan'208,217";a="305220676"
Received: from ssekar-mobl1.gar.corp.intel.com (HELO [10.215.206.224])
 ([10.215.206.224])
 by fmsmga004.fm.intel.com with ESMTP; 06 Jul 2020 02:37:52 -0700
Subject: Re: Reg new repository for Remote BIOS Configuration feature
To: Deepak Kodihalli <dkodihal@in.ibm.com>, openbmc@lists.ozlabs.org
References: <OF695C3E91.9C1FA4CC-ON00258598.00304468-00258598.00304971@LocalDomain>
 <8c52e6de-d785-6e28-c186-eb05bc405831@linux.intel.com>
 <OF4F9A7C8E.67B55B6A-ON00258598.00314874-00258598.003165E6@notes.na.collabserv.com>
From: "Sekar, Suryakanth" <suryakanth.sekar@linux.intel.com>
Message-ID: <3631d9fa-52b1-0918-bf9c-af8cb21e0c4f@linux.intel.com>
Date: Mon, 6 Jul 2020 15:07:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <OF4F9A7C8E.67B55B6A-ON00258598.00314874-00258598.003165E6@notes.na.collabserv.com>
Content-Type: multipart/alternative;
 boundary="------------F06A74273C7E8B269ABDD0E3"
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
--------------F06A74273C7E8B269ABDD0E3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Deepak,

I added the OpenBMC mail list.

Regarding the code development. I have code based on the old design 
implementation.  so I have to do rework based on the new design.

My plan is once new repository is created  within  week. i will submit 
the skeleton code  with basic functionality.

Thanks

Suryakanth.S


On 7/1/2020 2:29 PM, Deepak Kodihalli wrote:
> Surya,
> Can you pls also copy the OpenBMC mailing list? That is the process 
> for requesting a new repo.
> Also I had a question in terms of the next steps once the repo is 
> created. Do you have some initial code to push already? Or is nothing 
> written yet? Can we discuss a plan in the next PMCI WG meeting?
> Thanks,
> Deepak
>
>     ----- Original message -----
>     From: Deepak Kodihalli/India/IBM
>     To: suryakanth.sekar@linux.intel.com
>     Cc: bradleyb@fuzziesquirrel.com, jason.m.bills@linux.intel.com,
>     patrick@stwcx.xyz, richard.marian.thomaiyar@linux.intel.com
>     Subject: Re: [EXTERNAL] Reg new repository for Remote BIOS
>     Configuration feature
>     Date: Wed, Jul 1, 2020 2:17 PM
>     Please also copy the openbmc ML.
>     Thanks,
>     Deepak
>
>         ----- Original message -----
>         From: "Sekar, Suryakanth" <suryakanth.sekar@linux.intel.com>
>         To: dkodihal@in.ibm.com, bradleyb@fuzziesquirrel.com,
>         jason.m.bills@linux.intel.com, patrick@stwcx.xyz, "Thomaiyar,
>         Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
>         Cc:
>         Subject: [EXTERNAL] Reg new repository for Remote BIOS
>         Configuration feature
>         Date: Wed, Jul 1, 2020 2:12 PM
>         Hi Brad,
>
>         Can you please create new repository (repo name :
>         Remote-BIOSConfig )
>         for  start the coding and support this feature.
>
>         Please add me, Deepak, Patrick willams  as maintainer.
>
>         Please refer the below link for more details.
>
>         https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/29320
>
>         https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/18242
>
>
>         Background:
>
>         Remote BIOS Configuration provides ability for the user to
>         view and modify
>         BIOS setup configuration parameters remotely via a BMC at any
>         Host state.
>         New BIOS configuration parameters take effect immediately or next
>         system reboot based on the host firmware support model.
>
>         ## Requirements
>         1. Mechanism to configure BIOS settings remotely over network
>         interface.
>         2. BMC should support the ability to set the value of all BIOS
>         variables
>             to the factory default state.
>         3. Based on the host firmware support model, BMC should
>         support both
>             Immediate Update or Deferred update.
>         4. In deferred model, When the system is in S0, S3, S4 or S5
>         state.
>             BMC will send the updated BIOS variables on next BIOS boot
>         only.
>             It will not initiate a BIOS boot immediately.
>         5. In immediate model, BMC should send message to the system
>         firmware (BIOS)
>             Whenever settings are changed.
>         6. BMC should support BIOS attribute registry in redfish
>         schema for
>             BIOS configuration.
>         7. BMC should provide secure way for updating BIOS setup
>         password settings.
>             Detailed password handling design -TBD(will be resolve
>         using ARM
>         TrustZone)
>         Ex: Updating the BIOS password should be support only before
>         end of post.
>         8. Remote BIOS configuration daemon should be independent of
>         interface
>         specific
>             data format.
>         9. BMC should able to take default / current settings from
>         host and store &
>             expose that for out of band updates.
>         10.BMC should provide the new values to the host.
>
>
>         Thanks
>
>         Suryakanth.S
>
>

--------------F06A74273C7E8B269ABDD0E3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Deepak,</p>
    <p>I added the OpenBMC mail list.  <br>
    </p>
    <p>Regarding the code development. I have code based on the old
      design implementation.  so I have to do rework based on the new
      design. <br>
    </p>
    <p>My plan is once new repository is created  within  week. i will
      submit the skeleton code  with basic functionality. <br>
    </p>
    <p>Thanks</p>
    <p>Suryakanth.S<br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/1/2020 2:29 PM, Deepak Kodihalli
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:OF4F9A7C8E.67B55B6A-ON00258598.00314874-00258598.003165E6@notes.na.collabserv.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div class="socmaildefaultfont" dir="ltr"
        style="font-family:Arial, Helvetica, sans-serif;font-size:10pt">
        <div dir="ltr">Surya,</div>
        <div dir="ltr"> </div>
        <div dir="ltr">Can you pls also copy the OpenBMC mailing list?
          That is the process for requesting a new repo.</div>
        <div dir="ltr"> </div>
        <div dir="ltr">Also I had a question in terms of the next steps
          once the repo is created. Do you have some initial code to
          push already? Or is nothing written yet? Can we discuss a plan
          in the next PMCI WG meeting?</div>
        <div dir="ltr"> </div>
        <div dir="ltr">Thanks,</div>
        <div dir="ltr">Deepak</div>
        <div dir="ltr"> </div>
        <blockquote data-history-content-modified="1" dir="ltr"
          style="border-left:solid #aaaaaa 2px; margin-left:5px;
          padding-left:5px; direction:ltr; margin-right:0px">-----
          Original message -----<br>
          From: Deepak Kodihalli/India/IBM<br>
          To: <a class="moz-txt-link-abbreviated" href="mailto:suryakanth.sekar@linux.intel.com">suryakanth.sekar@linux.intel.com</a><br>
          Cc: <a class="moz-txt-link-abbreviated" href="mailto:bradleyb@fuzziesquirrel.com">bradleyb@fuzziesquirrel.com</a>,
          <a class="moz-txt-link-abbreviated" href="mailto:jason.m.bills@linux.intel.com">jason.m.bills@linux.intel.com</a>, <a class="moz-txt-link-abbreviated" href="mailto:patrick@stwcx.xyz">patrick@stwcx.xyz</a>,
          <a class="moz-txt-link-abbreviated" href="mailto:richard.marian.thomaiyar@linux.intel.com">richard.marian.thomaiyar@linux.intel.com</a><br>
          Subject: Re: [EXTERNAL] Reg new repository for Remote BIOS
          Configuration feature<br>
          Date: Wed, Jul 1, 2020 2:17 PM<br>
           
          <div dir="ltr" style="font-family:Arial, Helvetica,
            sans-serif;font-size:10pt">
            <div dir="ltr">Please also copy the openbmc ML.</div>
            <div dir="ltr"> </div>
            <div dir="ltr">Thanks,</div>
            <div dir="ltr">Deepak</div>
            <div dir="ltr"> </div>
            <blockquote data-history-content-modified="1" dir="ltr"
              style="border-left:solid #aaaaaa 2px; margin-left:5px;
              padding-left:5px; direction:ltr; margin-right:0px">-----
              Original message -----<br>
              From: "Sekar, Suryakanth"
              <a class="moz-txt-link-rfc2396E" href="mailto:suryakanth.sekar@linux.intel.com">&lt;suryakanth.sekar@linux.intel.com&gt;</a><br>
              To: <a class="moz-txt-link-abbreviated" href="mailto:dkodihal@in.ibm.com">dkodihal@in.ibm.com</a>, <a class="moz-txt-link-abbreviated" href="mailto:bradleyb@fuzziesquirrel.com">bradleyb@fuzziesquirrel.com</a>,
              <a class="moz-txt-link-abbreviated" href="mailto:jason.m.bills@linux.intel.com">jason.m.bills@linux.intel.com</a>, <a class="moz-txt-link-abbreviated" href="mailto:patrick@stwcx.xyz">patrick@stwcx.xyz</a>,
              "Thomaiyar, Richard Marian"
              <a class="moz-txt-link-rfc2396E" href="mailto:richard.marian.thomaiyar@linux.intel.com">&lt;richard.marian.thomaiyar@linux.intel.com&gt;</a><br>
              Cc:<br>
              Subject: [EXTERNAL] Reg new repository for Remote BIOS
              Configuration feature<br>
              Date: Wed, Jul 1, 2020 2:12 PM<br>
               
              <div><font size="2" face="Default Monospace,Courier
                  New,Courier,monospace">Hi Brad,<br>
                  <br>
                  Can you please create new repository (repo name :
                  Remote-BIOSConfig )<br>
                  for  start the coding and support this feature.<br>
                  <br>
                  Please add me, Deepak, Patrick willams  as maintainer.<br>
                  <br>
                  Please refer the below link for more details.<br>
                  <br>
                  <a
                    href="https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/29320"
                    target="_blank" moz-do-not-send="true">https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/29320</a> <br>
                  <br>
                  <a
href="https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/18242"
                    target="_blank" moz-do-not-send="true">https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/18242</a> <br>
                  <br>
                  Background:<br>
                  <br>
                  Remote BIOS Configuration provides ability for the
                  user to view and modify<br>
                  BIOS setup configuration parameters remotely via a BMC
                  at any Host state.<br>
                  New BIOS configuration parameters take effect
                  immediately or next<br>
                  system reboot based on the host firmware support
                  model.<br>
                  <br>
                  ## Requirements<br>
                  1. Mechanism to configure BIOS settings remotely over
                  network interface.<br>
                  2. BMC should support the ability to set the value of
                  all BIOS variables<br>
                      to the factory default state.<br>
                  3. Based on the host firmware support model, BMC
                  should support both<br>
                      Immediate Update or Deferred update.<br>
                  4. In deferred model, When the system is in S0, S3, S4
                  or S5 state.<br>
                      BMC will send the updated BIOS variables on next
                  BIOS boot only.<br>
                      It will not initiate a BIOS boot immediately.<br>
                  5. In immediate model, BMC should send message to the
                  system firmware (BIOS)<br>
                      Whenever settings are changed.<br>
                  6. BMC should support BIOS attribute registry in
                  redfish schema for<br>
                      BIOS configuration.<br>
                  7. BMC should provide secure way for updating BIOS
                  setup password settings.<br>
                      Detailed password handling design -TBD(will be
                  resolve using ARM<br>
                  TrustZone)<br>
                  Ex: Updating the BIOS password should be support only
                  before end of post.<br>
                  8. Remote BIOS configuration daemon should be
                  independent of interface<br>
                  specific<br>
                      data format.<br>
                  9. BMC should able to take default / current settings
                  from host and store &amp;<br>
                      expose that for out of band updates.<br>
                  10.BMC should provide the new values to the host.<br>
                  <br>
                  <br>
                  Thanks<br>
                  <br>
                  Suryakanth.S</font><br>
                <br>
                 </div>
            </blockquote>
            <div dir="ltr"> </div>
          </div>
        </blockquote>
        <div dir="ltr"> </div>
      </div>
      <br>
    </blockquote>
  </body>
</html>

--------------F06A74273C7E8B269ABDD0E3--
