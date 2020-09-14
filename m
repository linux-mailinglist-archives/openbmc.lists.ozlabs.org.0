Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B1926931D
	for <lists+openbmc@lfdr.de>; Mon, 14 Sep 2020 19:26:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BqtZG0th7zDqP3
	for <lists+openbmc@lfdr.de>; Tue, 15 Sep 2020 03:26:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BqtYC2cBmzDqML
 for <openbmc@lists.ozlabs.org>; Tue, 15 Sep 2020 03:25:33 +1000 (AEST)
IronPort-SDR: oH18V+Tgkfw7Xe/HJmR5bjmwEFsH8dwGhSzNxIZl1eAgFEMJFCu6BF59rPFbPeTKMK1n7rWoRC
 bWx7ovYkHelg==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="177186142"
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; 
 d="scan'208,217";a="177186142"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 10:25:31 -0700
IronPort-SDR: Yk92CnJKLVoZ6/CPiNUnEFYKksPFrMKJZk+Zl/ghfBITebc/WAfhpXhts9isQO4Kbustmbq0u9
 NmF7IULN++Kw==
X-IronPort-AV: E=Sophos;i="5.76,426,1592895600"; 
 d="scan'208,217";a="507219923"
Received: from rthomaiy-mobl.gar.corp.intel.com (HELO [10.213.74.176])
 ([10.213.74.176])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2020 10:25:28 -0700
Subject: Re: Read FRU of host through ipmi in Entity manager.
To: Kumar Thangavel <thangavel.k@hcl.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <HK0PR04MB2964FFC6D5EF008F106FFC13FD230@HK0PR04MB2964.apcprd04.prod.outlook.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <f31aa36a-4519-7e68-7ff4-fab62b6bb42e@linux.intel.com>
Date: Mon, 14 Sep 2020 22:55:24 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <HK0PR04MB2964FFC6D5EF008F106FFC13FD230@HK0PR04MB2964.apcprd04.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------08F15B9053498176C6A9E590"
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Patrick Williams <patrickw3@fb.com>, James Feist <james.feist@linux.intel.com>,
 "Velumani T-ERS, HCLTech" <velumanit@hcl.com>,
 "vijaykhemka@fb.com" <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------08F15B9053498176C6A9E590
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Hi Kumar,

Better to expose IPMI FRU of the host read via IPMB through FRU 
Interface (i.e. say xyz.openbmc_project.IPMB.FruDevice daemon, which can 
expose all the FRU's read through the same). In this way, current 
EntityManager probe will still work. (Note: We can add the support in 
FRUDevice if it is IPMB read of raw FRU data, so that conversion code in 
FRUDevice can still be used).

Current plan (under discussion - Needs to finalize) to expose the PLDM 
FRU in separate daemon under interface 
(https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc_project/Inventory/Source/PLDM) 


James, Do you see any issue with this approach / comments ?

Regards,
Richard

On 9/14/2020 10:25 PM, Kumar Thangavel wrote:
>
> Classification: *HCL Internal*
>
> Hi All,
>
>          We are working on the Platform which has multi host and the 
> host are FRUs.  The host and BMC communication is based on IPMB. We 
> have each host is connected in separate ipmb bus.
>
>          Existing Entity manager has the FRU read info from EEPROM 
> (I2C)in the form of bin file.
>          We understand that entity manager does not support ipmb based 
> host fru.
>
>          So, we are proposing the design to support ipmb based FRU in 
> entity manager.
>          From Entity manager, we will send the generic "read host fru" 
> command request to ipmbbrige to read the host FRU.
>
>          Then, store the host fru info in the bin file to process and 
> creating dbus objects in the entity manager.
>
>          Please let us know your comments on this.
>
> Thanks,
>
> Kumar.
>
> ::DISCLAIMER::
> ------------------------------------------------------------------------
> The contents of this e-mail and any attachment(s) are confidential and 
> intended for the named recipient(s) only. E-mail transmission is not 
> guaranteed to be secure or error-free as information could be 
> intercepted, corrupted, lost, destroyed, arrive late or incomplete, or 
> may contain viruses in transmission. The e mail and its contents (with 
> or without referred errors) shall therefore not attach any liability 
> on the originator or HCL or its affiliates. Views or opinions, if any, 
> presented in this email are solely those of the author and may not 
> necessarily reflect the views or opinions of HCL or its affiliates. 
> Any form of reproduction, dissemination, copying, disclosure, 
> modification, distribution and / or publication of this message 
> without the prior written consent of authorized representative of HCL 
> is strictly prohibited. If you have received this email in error 
> please delete it and notify the sender immediately. Before opening any 
> email and/or attachments, please check them for viruses and other defects.
> ------------------------------------------------------------------------

--------------08F15B9053498176C6A9E590
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    <p>Hi Kumar,<br>
    </p>
    <p>Better to expose IPMI FRU of the host read via IPMB through FRU
      Interface (i.e. say xyz.openbmc_project.IPMB.FruDevice daemon,
      which can expose all the FRU's read through the same). In this
      way, current EntityManager probe will still work. (Note: We can
      add the support in FRUDevice if it is IPMB read of raw FRU data,
      so that conversion code in FRUDevice can still be used).<br>
    </p>
    <p>Current plan (under discussion - Needs to finalize) to expose the
      PLDM FRU in separate daemon under interface
(<a class="moz-txt-link-freetext" href="https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc_project/Inventory/Source/PLDM">https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc_project/Inventory/Source/PLDM</a>)
      <br>
    </p>
    <div class="moz-cite-prefix">James, Do you see any issue with this
      approach / comments ?<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Regards,</div>
    <div class="moz-cite-prefix">Richard<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 9/14/2020 10:25 PM, Kumar Thangavel
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:HK0PR04MB2964FFC6D5EF008F106FFC13FD230@HK0PR04MB2964.apcprd04.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal" style="margin-bottom:12.0pt">Classification:
          <b><span style="color:#08298A">HCL Internal</span></b><span
            style="font-size:12.0pt"><o:p></o:p></span></p>
        <p class="MsoNormal">Hi All,<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Segoe
            UI&quot;,sans-serif">         We are working on the Platform
            which has multi host and the host are FRUs.  The host and
            BMC communication is based on IPMB. We have each host
            is connected in separate ipmb bus.<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Segoe
            UI&quot;,sans-serif">         Existing Entity manager has
            the FRU read info from EEPROM (I2C)in the form of bin file.<br>
                     We understand that entity manager does not support
            ipmb based host fru.<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Segoe
            UI&quot;,sans-serif"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Segoe
            UI&quot;,sans-serif">         So, we are proposing the
            design to support ipmb based FRU in entity manager.<br>
                     From Entity manager, we will send the generic "read
            host fru" command request to ipmbbrige to read the host FRU.<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Segoe
            UI&quot;,sans-serif">         Then, store the host fru info
            in the bin file to process and creating dbus objects in the
            entity manager.<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Segoe
            UI&quot;,sans-serif"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Segoe
            UI&quot;,sans-serif">         Please let us know your
            comments on this. <o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Segoe
            UI&quot;,sans-serif"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Segoe
            UI&quot;,sans-serif">Thanks,<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Segoe
            UI&quot;,sans-serif">Kumar.<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Segoe
            UI&quot;,sans-serif"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span
            style="font-size:10.5pt;font-family:&quot;Segoe
            UI&quot;,sans-serif"><o:p> </o:p></span></p>
        <p class="MsoNormal"><o:p> </o:p></p>
      </div>
      <font size="1" face="Arial" color="Gray">::DISCLAIMER::<br>
        <hr>
        The contents of this e-mail and any attachment(s) are
        confidential and intended for the named recipient(s) only.
        E-mail transmission is not guaranteed to be secure or error-free
        as information could be intercepted, corrupted, lost, destroyed,
        arrive late or incomplete, or may contain viruses in
        transmission. The e mail and its contents (with or without
        referred errors) shall therefore not attach any liability on the
        originator or HCL or its affiliates. Views or opinions, if any,
        presented in this email are solely those of the author and may
        not necessarily reflect the views or opinions of HCL or its
        affiliates. Any form of reproduction, dissemination, copying,
        disclosure, modification, distribution and / or publication of
        this message without the prior written consent of authorized
        representative of HCL is strictly prohibited. If you have
        received this email in error please delete it and notify the
        sender immediately. Before opening any email and/or attachments,
        please check them for viruses and other defects.<br>
        <hr>
      </font>
    </blockquote>
  </body>
</html>

--------------08F15B9053498176C6A9E590--
