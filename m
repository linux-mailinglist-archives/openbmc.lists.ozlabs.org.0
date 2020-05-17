Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A901D65E5
	for <lists+openbmc@lfdr.de>; Sun, 17 May 2020 06:37:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Pq9p0RxtzDqGF
	for <lists+openbmc@lfdr.de>; Sun, 17 May 2020 14:37:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Pq915LtszDqZl
 for <openbmc@lists.ozlabs.org>; Sun, 17 May 2020 14:36:19 +1000 (AEST)
IronPort-SDR: wByI4KbPe238LSumxSqokOrz5vkP4HD6QNazTofQUpS96FnzmkoMvVF2+yaBoUw7457E3CaZQb
 YcgQVipuRcHw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2020 21:36:16 -0700
IronPort-SDR: N1v3LUIhBm0CVm9Ub2iTOp6rgiW1T709sEEH3I5A6ruZNT4w14QAUk12Db5Pj1G8m8FJs5xB99
 Osp0D4ToGNWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,402,1583222400"; 
 d="scan'208,217";a="465205405"
Received: from rthomaiy-mobl2.gar.corp.intel.com (HELO [10.252.84.62])
 ([10.252.84.62])
 by fmsmga005.fm.intel.com with ESMTP; 16 May 2020 21:36:14 -0700
Subject: Re: Redfish: Disable/enable out of band IPMI
To: TOM JOSEPH <tomjose@linux.vnet.ibm.com>, apparao.puli@linux.intel.com
References: <CALzeG+-bxR0oqA_h8Gaf-RQLJygL1QYXy3y2DU=GKdLC9nhWhw@mail.gmail.com>
 <aa329f9e-9e66-d5e7-ecac-e54c23e16a48@linux.ibm.com>
 <d6b94dbe-a6c5-1b19-63e7-1695c3794e78@linux.ibm.com>
 <CALzeG+-dbvwLseu9agpKp5L8vVkNMabM76UOmuDo2sh0uS_qFA@mail.gmail.com>
 <696721cc-2cf4-373e-027d-475ff8d357dc@linux.intel.com>
 <CALzeG+83r=v5G_jiCV2M9XErD3fXiMYcti3zknO-YY3_yL59DQ@mail.gmail.com>
 <7ff70ad6-8e51-93c3-1175-2bce01e4db77@linux.vnet.ibm.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <dd73bc52-641d-a763-bcb1-455bd0ddd58f@linux.intel.com>
Date: Sun, 17 May 2020 10:06:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <7ff70ad6-8e51-93c3-1175-2bce01e4db77@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------2D9CD7374AD0C2177D51AE04"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Joseph Reynolds <jrey@linux.ibm.com>, karo33bug@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------2D9CD7374AD0C2177D51AE04
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Tom,

Answers inline.

Regards,

Richard

On 5/15/2020 5:35 PM, TOM JOSEPH wrote:
>
> Hello AppaRao/Richard,
>
> I took a stab at service-config-manager. Got it running on one of our 
> systems. Thanks for upstreaming it. Few questions i had:
>
> 1) Are the Redfish changes yet to be upstreamed? 
> https://github.com/openbmc/bmcweb/commit/ec4974dd6a419b7f5556d4dcf4b8b836b5efbbd9 
> Why did we not leverage service-config-manager for the Get method?
>
[Richard]: In order to make use of Get method which is applicable to 
community, directly used the systemd query implementation, instead of 
service-config-manager as it was not used by all.
> 2) For the Patch method, do you have code yet to be upstreamed? If so 
> I will be interested in consuming it. Otherwise I can pick it up (This 
> is something which I am pursuing 
> https://github.com/ibm-openbmc/dev/issues/513).
>
[Richard]: bmcweb code is fully up-streamed. We don't have a code to do 
the patch method call. Please go ahead.
> 3) Are there plans to upstream the recipe file for service-config-manager?
>
[Richard]: Yes, need to. It is here 
https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-common/recipes-phosphor/srvcfg-manager/srvcfg-manager_git.bb 
(Don't mind if you can add the same).
> 4) The interface exposed by the application looked different from this 
> (https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Control/Service/Attributes.interface.yaml)
>
[Richard]: Yes, it got updated, as the plan was to allow the temporary 
disable of service, and similarly permanent blocking of service using 
mask functionality exposed by systemd1. Interface needs to be updated.
> 5) For disabling out of band IPMI, there could be multiple instances 
> of phosphor-ipmi-net that needs to be disabled/masked. How do we plan 
> to achieve that? I had couple of options in mind. Let me know your 
> thoughts.
>      a) Get all object paths of the service-config-manager which match 
> phosphor-ipmi-net( phosphor_2dipmi_2dnet) and then disable each interface.
>      b) Use the "ListUnits" method on "/org/freedesktop/systemd1" and 
> get the object paths of phosphor-ipmi-net instances.
>
[Richard]: Internally service-config-manager does ListUnits, and adds 
all the phosphor-ipmi-net instances in it's tree. From application 
level, querying all the objects exposed by service-config-manager itself 
is enough. This is done already in order to disable RMCP+ in one of our 
oem IPMI command - 
https://github.com/openbmc/intel-ipmi-oem/blob/master/src/bmccontrolservices.cpp#L141 

> Regards,
> Tom
> On 17-12-2019 08:29, Carol Wang wrote:
>> Ok, I got it. Thank you!
>> Waiting for the change then. :-)
>>
>> On Mon, Dec 16, 2019 at 9:48 PM Thomaiyar, Richard Marian
>> <richard.marian.thomaiyar@linux.intel.com>  wrote:
>>> This came a month back, and i wanted to push the changes in intel repo
>>> to the OpenBMC community repo, due to other priority missed to push the
>>> same.
>>>
>>> https://github.com/Intel-BMC/provingground/tree/master/srvcfg-manager
>>>
>>> Will push the document in few day and the changes for the same.
>>>
>>> Regards,
>>>
>>> Richard
>>>
>>> On 12/16/2019 11:38 AM, Carol Wang wrote:
>>>> rface in phosphor-dbus-interface to indicate the status
>>>> of net IPMI.
>>>> Have a daemon to monitor the status, if the status is changed, then
>>>> enable or
>>>> disable the net IPMI service and socket.
>>>> 2. Check the net IPMI socket state by getData()[1] in bmcweb. If the
>>>> state is
>>>> "running" or "listening", the net IPMI status is true, otherwise, the
>>>> status is
>>>> false. Then bmcweb can enable or disable the service and socket.
>>>>
>>>> Wondering if anyone has any thoughts on this feature, which way is
>>>> better.
>>>> If add interface, in which daemon this interface should be implemented?

--------------2D9CD7374AD0C2177D51AE04
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Tom, <br>
    </p>
    <p>Answers inline.</p>
    <p>Regards, <br>
    </p>
    <p>Richard</p>
    <div class="moz-cite-prefix">On 5/15/2020 5:35 PM, TOM JOSEPH wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:7ff70ad6-8e51-93c3-1175-2bce01e4db77@linux.vnet.ibm.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p>Hello AppaRao/Richard,</p>
      I took a stab at service-config-manager. Got it running on one of
      our systems. Thanks for upstreaming it. Few questions i had:<br>
      <p>1) Are the Redfish changes yet to be upstreamed? 
        <a class="moz-txt-link-freetext"
href="https://github.com/openbmc/bmcweb/commit/ec4974dd6a419b7f5556d4dcf4b8b836b5efbbd9"
          moz-do-not-send="true">https://github.com/openbmc/bmcweb/commit/ec4974dd6a419b7f5556d4dcf4b8b836b5efbbd9</a>
        Why did we not leverage service-config-manager for the Get
        method?</p>
    </blockquote>
    [Richard]: In order to make use of Get method which is applicable to
    community, directly used the systemd query implementation, instead
    of service-config-manager as it was not used by all.<br>
    <blockquote type="cite"
      cite="mid:7ff70ad6-8e51-93c3-1175-2bce01e4db77@linux.vnet.ibm.com">
      2) For the Patch method, do you have code yet to be upstreamed? If
      so I will be interested in consuming it. Otherwise I can pick it
      up (This is something which I am pursuing <a
        class="moz-txt-link-freetext"
        href="https://github.com/ibm-openbmc/dev/issues/513"
        moz-do-not-send="true">https://github.com/ibm-openbmc/dev/issues/513</a>).
      <br>
      <br>
    </blockquote>
    [Richard]: bmcweb code is fully up-streamed. We don't have a code to
    do the patch method call. Please go ahead.<br>
    <blockquote type="cite"
      cite="mid:7ff70ad6-8e51-93c3-1175-2bce01e4db77@linux.vnet.ibm.com">
      3) Are there plans to upstream the recipe file for
      service-config-manager?<br>
      <br>
    </blockquote>
    [Richard]: Yes, need to. It is here <a
href="https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-common/recipes-phosphor/srvcfg-manager/srvcfg-manager_git.bb">https://github.com/Intel-BMC/openbmc/blob/intel/meta-openbmc-mods/meta-common/recipes-phosphor/srvcfg-manager/srvcfg-manager_git.bb</a>
    (Don't mind if you can add the same).<br>
    <blockquote type="cite"
      cite="mid:7ff70ad6-8e51-93c3-1175-2bce01e4db77@linux.vnet.ibm.com">
      4) The interface exposed by the application looked different from
      this
      (<a class="moz-txt-link-freetext"
href="https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Control/Service/Attributes.interface.yaml"
        moz-do-not-send="true">https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Control/Service/Attributes.interface.yaml</a>)<br>
      <br>
    </blockquote>
    [Richard]: Yes, it got updated, as the plan was to allow the
    temporary disable of service, and similarly permanent blocking of
    service using mask functionality exposed by systemd1. Interface
    needs to be updated.<br>
    <blockquote type="cite"
      cite="mid:7ff70ad6-8e51-93c3-1175-2bce01e4db77@linux.vnet.ibm.com">
      5) For disabling out of band IPMI, there could be multiple
      instances of phosphor-ipmi-net that needs to be disabled/masked.
      How do we plan to achieve that? I had couple of options in mind.
      Let me know your thoughts.<br>
           a) Get all object paths of the service-config-manager which
      match phosphor-ipmi-net( phosphor_2dipmi_2dnet) and then disable
      each interface.<br>
           b) Use the "ListUnits" method on "/org/freedesktop/systemd1"
      and get the object paths of phosphor-ipmi-net instances.<span style="display: inline !important; float: none; background-color: rgb(255, 238, 240); color: rgb(3, 47, 98); font-family: SFMono-Regular,Consolas,Liberation Mono,Menlo,monospace; font-size: 12px; font-style: normal; font-variant: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: pre-wrap; word-spacing: 0px;"></span><br>
      <br>
    </blockquote>
    [Richard]: Internally service-config-manager does ListUnits, and
    adds all the phosphor-ipmi-net instances in it's tree. From
    application level, querying all the objects exposed by
    service-config-manager itself is enough. This is done already in
    order to disable RMCP+ in one of our oem IPMI command - <a
href="https://github.com/openbmc/intel-ipmi-oem/blob/master/src/bmccontrolservices.cpp#L141">https://github.com/openbmc/intel-ipmi-oem/blob/master/src/bmccontrolservices.cpp#L141</a>
    <blockquote type="cite"
      cite="mid:7ff70ad6-8e51-93c3-1175-2bce01e4db77@linux.vnet.ibm.com">
      Regards,<br>
      Tom<br>
      <div class="moz-cite-prefix">On 17-12-2019 08:29, Carol Wang
        wrote:<br>
      </div>
      <blockquote type="cite"
cite="mid:CALzeG+83r=v5G_jiCV2M9XErD3fXiMYcti3zknO-YY3_yL59DQ@mail.gmail.com">
        <pre class="moz-quote-pre" wrap="">Ok, I got it. Thank you!
Waiting for the change then. :-)

On Mon, Dec 16, 2019 at 9:48 PM Thomaiyar, Richard Marian
<a class="moz-txt-link-rfc2396E" href="mailto:richard.marian.thomaiyar@linux.intel.com" moz-do-not-send="true">&lt;richard.marian.thomaiyar@linux.intel.com&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">This came a month back, and i wanted to push the changes in intel repo
to the OpenBMC community repo, due to other priority missed to push the
same.

<a class="moz-txt-link-freetext" href="https://github.com/Intel-BMC/provingground/tree/master/srvcfg-manager" moz-do-not-send="true">https://github.com/Intel-BMC/provingground/tree/master/srvcfg-manager</a>

Will push the document in few day and the changes for the same.

Regards,

Richard

On 12/16/2019 11:38 AM, Carol Wang wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">rface in phosphor-dbus-interface to indicate the status
of net IPMI.
Have a daemon to monitor the status, if the status is changed, then
enable or
disable the net IPMI service and socket.
2. Check the net IPMI socket state by getData()[1] in bmcweb. If the
state is
"running" or "listening", the net IPMI status is true, otherwise, the
status is
false. Then bmcweb can enable or disable the service and socket.

Wondering if anyone has any thoughts on this feature, which way is
better.
If add interface, in which daemon this interface should be implemented?
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------2D9CD7374AD0C2177D51AE04--
