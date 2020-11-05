Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 920E82A7D6B
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 12:44:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRhWh3rdWzDqLx
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 22:44:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRhNb5BhkzDqvj
 for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2020 22:38:19 +1100 (AEDT)
IronPort-SDR: c8xezYlUfxjt6pCN0CAtImbhyHyET6vLZ8f908Ohbs/s33vZSq7yHeW3sD4YyaLEmXtD/kH0/P
 ns+b//hnJWoA==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="157146031"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
 d="scan'208,217";a="157146031"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 03:38:14 -0800
IronPort-SDR: ZbC8pUfEDTWoq/piQYkyQmzUJCbh4RjyDWrTXh7Y+zWsHrMbh2QB8U0TkY7g9UH4B7f7236JcM
 rn/UnxV8JaIg==
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
 d="scan'208,217";a="539365250"
Received: from rthomaiy-mobl.gar.corp.intel.com (HELO [10.251.64.231])
 ([10.251.64.231])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 03:38:12 -0800
Subject: Re: OpenBMC Learning Series
To: Sai Dasari <sdasari@fb.com>, Openbmc <openbmc@lists.ozlabs.org>
References: <C24D4BAF-B185-4640-BFEF-D391E51A0A35@fb.com>
 <452FDC0B-2E4F-4AD9-97E6-DE9B2333D99B@fb.com>
 <8EE0F70D-78CB-4CDB-A51C-53FC33A2AC87@fb.com>
 <EFFBC9D1-BA53-4C61-8BC2-7F52320245F7@fb.com>
 <51C18C28-4894-4BEF-AAA6-BACE5B934B5C@fb.com>
 <AFA8029B-BBBC-41A5-9F66-671D41D0E624@fb.com>
 <D4F1F4FA-E1E2-425C-B685-D0BAE3D5E596@fb.com>
 <A6D2354C-DD02-4BCB-AAE2-2F6B16784DBD@fb.com>
 <A5439E11-28B2-4476-9A9E-D8A8CA525A32@fb.com>
 <179181C3-A497-4D36-8A73-F22DA7FF4D8B@fb.com>
 <9EDCD78E-A095-48AA-93BC-BF73AD8BD533@fb.com>
 <B765ACF5-8DD7-4995-8D62-8634F5A80243@fb.com>
 <091D0CE7-1D69-448E-8C82-C2EBA1DABF27@fb.com>
 <69F5B6C0-60A7-4D5D-A841-AB4CE7E9AD2D@fb.com>
 <FF528567-512C-4401-BD64-85551288618E@fb.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <896dd847-1155-9a51-37ed-6d52852387c5@linux.intel.com>
Date: Thu, 5 Nov 2020 17:07:45 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <FF528567-512C-4401-BD64-85551288618E@fb.com>
Content-Type: multipart/alternative;
 boundary="------------670514FDD0F8F732111F5C53"
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
--------------670514FDD0F8F732111F5C53
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

All,

Due to unforeseen circumstances, SPDM Learning series by Vikram 
Bodireddy has to be cancelled today. Vikram will work with Sai and 
communicate the session details, later.

Regards,

Richard

On 11/4/2020 11:03 PM, Sai Dasari wrote:
>
> Quick reminder about this week’s learning session about DMTF’s 
> “Security Protocol and Data Model” aka “*SPDM*” by  Vikram Bodireddy 
> on Thursday@10AM (*PST*). Following are the session details and also 
> attached meeting invite.
>
> Topic: SPDM
>
> Time: Nov 5, 2020 10:00 AM Pacific Time (US and Canada)
>
> Join Zoom Meeting
>
> https://us02web.zoom.us/j/9396880476?pwd=a2gyYkVpRjhBZEthQUQzcEF2QjRXUT09
>
> Meeting ID: 939 688 0476
>
> Passcode: openbmc
>
> One tap mobile
>
> +16699009128,,9396880476#,,,,,,0#,,8592515# US (San Jose)
>
> +12532158782,,9396880476#,,,,,,0#,,8592515# US (Tacoma)
>
> Dial by your location
>
>         +1 669 900 9128 US (San Jose)
>
>         +1 253 215 8782 US (Tacoma)
>
>         +1 346 248 7799 US (Houston)
>
>         +1 301 715 8592 US (Germantown)
>
>         +1 312 626 6799 US (Chicago)
>
>         +1 646 558 8656 US (New York)
>
> Meeting ID: 939 688 0476
>
> Passcode: 8592515
>
> Find your local number: https://us02web.zoom.us/u/kddfSpAkEj
>

--------------670514FDD0F8F732111F5C53
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>All, <br>
    </p>
    <p>Due to unforeseen circumstances, SPDM Learning series by Vikram
      Bodireddy has to be cancelled today. Vikram will work with Sai and
      communicate the session details, later. <br>
    </p>
    <p>Regards,</p>
    <p>Richard<br>
    </p>
    <div class="moz-cite-prefix">On 11/4/2020 11:03 PM, Sai Dasari
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:FF528567-512C-4401-BD64-85551288618E@fb.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}</style>
      <div class="WordSection1">
        <p class="MsoNormal">Quick reminder about this week’s learning
          session about DMTF’s “Security Protocol and Data Model” aka “<b>SPDM</b>”
          by  Vikram Bodireddy on Thursday@10AM (<b>PST</b>). Following
          are the session details and also attached meeting invite.<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">Topic: SPDM<o:p></o:p></p>
        <p class="MsoNormal">Time: Nov 5, 2020 10:00 AM Pacific Time (US
          and Canada)<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">Join Zoom Meeting<o:p></o:p></p>
        <p class="MsoNormal"><a class="moz-txt-link-freetext" href="https://us02web.zoom.us/j/9396880476?pwd=a2gyYkVpRjhBZEthQUQzcEF2QjRXUT09">https://us02web.zoom.us/j/9396880476?pwd=a2gyYkVpRjhBZEthQUQzcEF2QjRXUT09</a><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">Meeting ID: 939 688 0476<o:p></o:p></p>
        <p class="MsoNormal">Passcode: openbmc<o:p></o:p></p>
        <p class="MsoNormal">One tap mobile<o:p></o:p></p>
        <p class="MsoNormal">+16699009128,,9396880476#,,,,,,0#,,8592515#
          US (San Jose)<o:p></o:p></p>
        <p class="MsoNormal">+12532158782,,9396880476#,,,,,,0#,,8592515#
          US (Tacoma)<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">Dial by your location<o:p></o:p></p>
        <p class="MsoNormal">        +1 669 900 9128 US (San Jose)<o:p></o:p></p>
        <p class="MsoNormal">        +1 253 215 8782 US (Tacoma)<o:p></o:p></p>
        <p class="MsoNormal">        +1 346 248 7799 US (Houston)<o:p></o:p></p>
        <p class="MsoNormal">        +1 301 715 8592 US (Germantown)<o:p></o:p></p>
        <p class="MsoNormal">        +1 312 626 6799 US (Chicago)<o:p></o:p></p>
        <p class="MsoNormal">        +1 646 558 8656 US (New York)<o:p></o:p></p>
        <p class="MsoNormal">Meeting ID: 939 688 0476<o:p></o:p></p>
        <p class="MsoNormal">Passcode: 8592515<o:p></o:p></p>
        <p class="MsoNormal">Find your local number:
          <a class="moz-txt-link-freetext" href="https://us02web.zoom.us/u/kddfSpAkEj">https://us02web.zoom.us/u/kddfSpAkEj</a><o:p></o:p></p>
      </div>
    </blockquote>
  </body>
</html>

--------------670514FDD0F8F732111F5C53--
