Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A4623480F
	for <lists+openbmc@lfdr.de>; Fri, 31 Jul 2020 16:56:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BJ9MX0YTwzDqg1
	for <lists+openbmc@lfdr.de>; Sat,  1 Aug 2020 00:56:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=suryakanth.sekar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BJ9L81WqFzDqBX
 for <openbmc@lists.ozlabs.org>; Sat,  1 Aug 2020 00:54:54 +1000 (AEST)
IronPort-SDR: iOwhzPb0re6dIg6XEzw1zr6Ah1HSeK1f3uKR/JMcytpanxUcoC1Y0jlalPYffxAaYvd8AdQXs6
 XKHnTBim+TwQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="150987249"
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; 
 d="scan'208,217";a="150987249"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2020 07:54:51 -0700
IronPort-SDR: S/s6DWB3ng6rOQurTaJjsdNrJL7/60OuGzPJ4vvhTqj+E4AFPMVbT9PR8mAaOxbypzQjXueVdG
 ijrDq7gZMJ5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; 
 d="scan'208,217";a="273220106"
Received: from ssekar-mobl.gar.corp.intel.com (HELO [10.215.201.149])
 ([10.215.201.149])
 by fmsmga007.fm.intel.com with ESMTP; 31 Jul 2020 07:54:48 -0700
Subject: Re: Question about OpenBMC Remote BIOS configuration proposal
To: "Chang, Abner (HPS SW/FW Technologist)" <abner.chang@hpe.com>,
 Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
References: <CS1PR8401MB11440816B91B39DAD21E3CB2FF760@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
 <687ea1e8-4abf-cc90-6777-a56a2416b08b@linux.vnet.ibm.com>
 <d10754e5-83b8-79fd-f407-de3d5f353ad0@linux.intel.com>
 <CS1PR8401MB1144910DFFF241DE9E603A1BFF4E0@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
From: "Sekar, Suryakanth" <suryakanth.sekar@linux.intel.com>
Message-ID: <5ad0514b-107b-523f-66d1-ca7ced54c9b3@linux.intel.com>
Date: Fri, 31 Jul 2020 20:24:48 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CS1PR8401MB1144910DFFF241DE9E603A1BFF4E0@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: multipart/alternative;
 boundary="------------9BFCE58D8F6B7BB289FC4F68"
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
Cc: "Garrett, Mike \(HPE Server Firmware\)" <mike.garrett@hpe.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Wu,
 Frank \(ISS Firmware\)" <frank.l.wu@hpe.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------9BFCE58D8F6B7BB289FC4F68
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Sure Abner.  We discussed the same earlier but I didnt follow up with 
latest Redfish Host interface spec.

I will sync with him on this.

On 7/31/2020 7:50 PM, Chang, Abner (HPS SW/FW Technologist) wrote:
> Hi Sakar, thanks for the response.
> After some conversations with OpenBMC people, I recognized RBC daemon 
> is standardized and Intel or IBM have their own implementations to 
> collaborate with RBC daemon.
>
> For the OEM ipmi commands defined for BIOS and bmc communication, you 
> probably can join  Redfish Host Interface meeting because we are 
> defining the IPMI Redfish command in this meeting. You may also reach 
> out to John Leun from intel, who is the representative of Intel for 
> that meeting.
>
> I may have PR of the Remote Bios  configuration document for some  
> cosmetic revises and make this spec more clear on system firmware 
> point of view.
>
> Thanks
> Abner
>
> ------------------------------------------------------------------------
> *From:* Sekar, Suryakanth <suryakanth.sekar@linux.intel.com>
> *Sent:* Wednesday, July 29, 2020 5:30:06 PM
> *To:* Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>; Chang, Abner 
> (HPS SW/FW Technologist) <abner.chang@hpe.com>
> *Cc:* Garrett, Mike (HPE Server Firmware) <mike.garrett@hpe.com>; 
> openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>; Wu, Frank (ISS 
> Firmware) <frank.l.wu@hpe.com>
> *Subject:* Re: Question about OpenBMC Remote BIOS configuration proposal
> Sorry, I was Out of Office  few days and busy in other priority.
>
> Abner,
>
> we are supporting Intel uses  OEM IPMI command , IBM uses  PLDM method
> is transfer data from BIOS to the BMC.
>
> In Intel, we are using (Intel prop) XML format which contain all needed
> info  from BIOS to the BMC.
>
> Let me know whats requirement. we can discuss the same.
>
> This BIOS config -setting   should be generic.
>
>
> Thanks
>
> Suryakanth.S
>
>
> On 7/23/2020 2:51 PM, Deepak Kodihalli wrote:
> > On 23/07/20 2:04 pm, Chang, Abner (HPS SW/FW Technologist) wrote:
> >> Hi Sekar,
> >> This is Abner Chang from HPE Server BIOS team, our team is also
> >> working on UEFI/EDK2 Redfish open source solution (just FYI the POC
> >> code is almost done).
> >>
> >> I read through the Remote BIOS configuration proposal and would like
> >> to see if we still have chance to make some changes on it to reduce
> >> the efforts on both BMC and BIOS. Also get rid of using PLDM BIOS
> >> control/Configuration methodology because we can find the equivalent
> >> method if use Redfish service.
> >
> > The design describes PLDM as one of the alternatives, but it is not
> > the only. The design talks about inband IPMI as well. In other words,
> > the design doesn't mandate what inband communication protocol BIOS and
> > BMC should use. On certain IBM systems, this protocol is PLDM.
> >
> > Regards,
> > Deepak
> >

--------------9BFCE58D8F6B7BB289FC4F68
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    <p>Sure Abner.  We discussed the same earlier but I didnt follow up
      with latest Redfish Host interface spec. <br>
    </p>
    <p>I will sync with him on this. <br>
    </p>
    <div class="moz-cite-prefix">On 7/31/2020 7:50 PM, Chang, Abner (HPS
      SW/FW Technologist) wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CS1PR8401MB1144910DFFF241DE9E603A1BFF4E0@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <div>
        <meta content="text/html; charset=us-ascii" data-ogsc=""
          style="">
      </div>
      <div dir="auto" style="direction: ltr; margin: 0px; padding: 0px;
        font-family: sans-serif; font-size: 11pt; color: black;">
        Hi Sakar, thanks for the response.<br>
      </div>
      <div dir="auto" style="direction: ltr; margin: 0px; padding: 0px;
        font-family: sans-serif; font-size: 11pt; color: black;">
        After some conversations with OpenBMC people, I recognized RBC
        daemon is standardized and Intel or IBM have their own
        implementations to collaborate with RBC daemon.<br>
      </div>
      <div dir="auto" style="direction: ltr; margin: 0px; padding: 0px;
        font-family: sans-serif; font-size: 11pt; color: black;">
        <br>
      </div>
      <div dir="auto" style="direction: ltr; margin: 0px; padding: 0px;
        font-family: sans-serif; font-size: 11pt; color: black;">
        For the OEM ipmi commands defined for BIOS and bmc
        communication, you probably can join  Redfish Host Interface
        meeting because we are defining the IPMI Redfish command in this
        meeting. You may also reach out to John Leun from intel, who is
        the representative of Intel for that meeting. <br>
      </div>
      <div dir="auto" style="direction: ltr; margin: 0px; padding: 0px;
        font-family: sans-serif; font-size: 11pt; color: black;">
        <br>
      </div>
      <div dir="auto" style="direction: ltr; margin: 0px; padding: 0px;
        font-family: sans-serif; font-size: 11pt; color: black;
        text-align: left;">
        I may have PR of the Remote Bios  configuration document for
        some  cosmetic revises and make this spec more clear on system
        firmware point of view.<br>
        <br>
      </div>
      <div dir="auto" style="direction: ltr; margin: 0px; padding: 0px;
        font-family: sans-serif; font-size: 11pt; color: black;">
        Thanks<br>
      </div>
      <div dir="auto" style="direction: ltr; margin: 0px; padding: 0px;
        font-family: sans-serif; font-size: 11pt; color: black;">
        Abner<br>
        <br>
      </div>
      <hr tabindex="-1" style="display: inline-block; width: 98%;"
        data-ogsc="">
      <div id="divRplyFwdMsg" dir="ltr" data-ogsc="" style=""><font
          style="font-size: 11pt;" data-ogsc="" face="Calibri,
          sans-serif" color="#000000"><b>From:</b> Sekar, Suryakanth
          <a class="moz-txt-link-rfc2396E" href="mailto:suryakanth.sekar@linux.intel.com">&lt;suryakanth.sekar@linux.intel.com&gt;</a><br>
          <b>Sent:</b> Wednesday, July 29, 2020 5:30:06 PM<br>
          <b>To:</b> Deepak Kodihalli
          <a class="moz-txt-link-rfc2396E" href="mailto:dkodihal@linux.vnet.ibm.com">&lt;dkodihal@linux.vnet.ibm.com&gt;</a>; Chang, Abner (HPS SW/FW
          Technologist) <a class="moz-txt-link-rfc2396E" href="mailto:abner.chang@hpe.com">&lt;abner.chang@hpe.com&gt;</a><br>
          <b>Cc:</b> Garrett, Mike (HPE Server Firmware)
          <a class="moz-txt-link-rfc2396E" href="mailto:mike.garrett@hpe.com">&lt;mike.garrett@hpe.com&gt;</a>; <a class="moz-txt-link-abbreviated" href="mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>
          <a class="moz-txt-link-rfc2396E" href="mailto:openbmc@lists.ozlabs.org">&lt;openbmc@lists.ozlabs.org&gt;</a>; Wu, Frank (ISS Firmware)
          <a class="moz-txt-link-rfc2396E" href="mailto:frank.l.wu@hpe.com">&lt;frank.l.wu@hpe.com&gt;</a><br>
          <b>Subject:</b> Re: Question about OpenBMC Remote BIOS
          configuration proposal</font>
        <div> </div>
      </div>
      <div class="BodyFragment" data-ogsc="" style=""><font size="2"><span
            style="font-size:11pt">
            <div class="PlainText">Sorry, I was Out of Office  few days
              and busy in other priority.<br>
              <br>
              Abner,<br>
              <br>
              we are supporting Intel uses  OEM IPMI command , IBM 
              uses  PLDM method <br>
              is transfer data from BIOS to the BMC.<br>
              <br>
              In Intel, we are using (Intel prop) XML format which
              contain all needed <br>
              info  from BIOS to the BMC.<br>
              <br>
              Let me know whats requirement. we can discuss the same.<br>
              <br>
              This BIOS config -setting   should be generic.<br>
              <br>
              <br>
              Thanks<br>
              <br>
              Suryakanth.S<br>
              <br>
              <br>
              On 7/23/2020 2:51 PM, Deepak Kodihalli wrote:<br>
              &gt; On 23/07/20 2:04 pm, Chang, Abner (HPS SW/FW
              Technologist) wrote:<br>
              &gt;&gt; Hi Sekar,<br>
              &gt;&gt; This is Abner Chang from HPE Server BIOS team,
              our team is also <br>
              &gt;&gt; working on UEFI/EDK2 Redfish open source solution
              (just FYI the POC <br>
              &gt;&gt; code is almost done).<br>
              &gt;&gt;<br>
              &gt;&gt; I read through the Remote BIOS configuration
              proposal and would like <br>
              &gt;&gt; to see if we still have chance to make some
              changes on it to reduce <br>
              &gt;&gt; the efforts on both BMC and BIOS. Also get rid of
              using PLDM BIOS <br>
              &gt;&gt; control/Configuration methodology because we can
              find the equivalent <br>
              &gt;&gt; method if use Redfish service.<br>
              &gt;<br>
              &gt; The design describes PLDM as one of the alternatives,
              but it is not <br>
              &gt; the only. The design talks about inband IPMI as well.
              In other words, <br>
              &gt; the design doesn't mandate what inband communication
              protocol BIOS and <br>
              &gt; BMC should use. On certain IBM systems, this protocol
              is PLDM.<br>
              &gt;<br>
              &gt; Regards,<br>
              &gt; Deepak<br>
              &gt;<br>
            </div>
          </span></font></div>
    </blockquote>
  </body>
</html>

--------------9BFCE58D8F6B7BB289FC4F68--
