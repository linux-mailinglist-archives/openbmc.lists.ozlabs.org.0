Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFFB2D49A5
	for <lists+openbmc@lfdr.de>; Wed,  9 Dec 2020 19:59:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrmZ13rQ1zDqtt
	for <lists+openbmc@lfdr.de>; Thu, 10 Dec 2020 05:59:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=jozef.wludzik@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrmVj6cs7zDqtW
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2020 05:56:44 +1100 (AEDT)
IronPort-SDR: NusVjgGsVuqvKplfs1dGNrF0yq1+ujzzP/TZ6udQ3xTjTbYBK+Xufp3oB9tDypQhYvBVkm4MYS
 rJQfitRRjTbw==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="174248115"
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; 
 d="scan'208,217";a="174248115"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 10:56:38 -0800
IronPort-SDR: siv+077/Dlz2tHuph9j+YQPXX31gpdB+yEtcDtw4Kc72D9cfAVGm6QA+ncv8kXak65FCyKGJGd
 FgAtYGkG/3KQ==
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; 
 d="scan'208,217";a="364263501"
Received: from jwludzik-mobl.ger.corp.intel.com (HELO [10.213.12.69])
 ([10.213.12.69])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 10:56:37 -0800
Subject: Re: OpenBMC CI issue
To: Jayashree D <jayashree-d@hcl.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <SG2PR04MB3093F18D320A5361E75D7EC5E1CC0@SG2PR04MB3093.apcprd04.prod.outlook.com>
From: "Wludzik, Jozef" <jozef.wludzik@linux.intel.com>
Message-ID: <30aef9df-2a96-9b27-52ba-fcaa6628f1c2@linux.intel.com>
Date: Wed, 9 Dec 2020 19:56:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <SG2PR04MB3093F18D320A5361E75D7EC5E1CC0@SG2PR04MB3093.apcprd04.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------5C417EDF081B1601CB48F760"
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
--------------5C417EDF081B1601CB48F760
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Yes, remove compilation flag '-fno-rtti' from you makefile or cmakefile. 
If you use meson, then set cpp_rtti to true in default_options for project.
It is known problem in boost 1.74.0
https://github.com/openbmc/x86-power-control/issues/7
Thanks,
Jozef

On 12/9/2020 17:00 PM, Jayashree D wrote:
>
> Classification: *Public*
>
> Hi Team,
>
> I am getting the following error in Gerrit OpenBMC CI issues. Please 
> provide some inputs/suggestions on this.
>
> /usr/local/include/boost/asio/execution/any_executor.hpp: In static 
> member function â€˜static const std::type_info& 
> boost::asio::execution::detail::any_executor_base::target_type_void()â€™:
>
> /usr/local/include/boost/asio/execution/any_executor.hpp:811:23: 
> error: cannot use â€˜typeidâ€™ with â€˜-fno-rttiâ€™
>
>   811 |     return typeid(void);
>
>       |                       ^
>
> /usr/local/include/boost/asio/execution/any_executor.hpp: In static 
> member function â€˜static const std::type_info& 
> boost::asio::execution::detail::any_executor_base::target_type_ex()â€™:
>
> /usr/local/include/boost/asio/execution/any_executor.hpp:851:21: 
> error: cannot use â€˜typeidâ€™ with â€˜-fno-rttiâ€™
>
>   851 |     return typeid(Ex);
>
> Regards,
>
> Jayashree
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

--------------5C417EDF081B1601CB48F760
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Yes, remove compilation flag '-fno-rtti' from you makefile or
      cmakefile. If you use meson, then set cpp_rtti to true in
      default_options for project.<br>
      It is known problem in boost 1.74.0<br>
      <a class="moz-txt-link-freetext" href="https://github.com/openbmc/x86-power-control/issues/7">https://github.com/openbmc/x86-power-control/issues/7</a><br>
      Thanks,<br>
      Jozef<br>
    </p>
    <div class="moz-cite-prefix">On 12/9/2020 17:00 PM, Jayashree D
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:SG2PR04MB3093F18D320A5361E75D7EC5E1CC0@SG2PR04MB3093.apcprd04.prod.outlook.com">
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
	font-family:"Calibri",sans-serif;}size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal" style="margin-bottom:12.0pt">Classification:
          <b><span style="color:green">Public</span></b><span
            style="font-size:12.0pt"><o:p></o:p></span></p>
        <p class="MsoNormal">Hi Team, <o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">I am getting the following error in Gerrit
          OpenBMC CI issues. Please provide some inputs/suggestions on
          this.<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">/usr/local/include/boost/asio/execution/any_executor.hpp:
          In static member function â€˜static const std::type_info&amp;
boost::asio::execution::detail::any_executor_base::target_type_void()â€™:<o:p></o:p></p>
        <p class="MsoNormal">/usr/local/include/boost/asio/execution/any_executor.hpp:811:23:
          error: cannot use â€˜typeidâ€™ with â€˜-fno-rttiâ€™<o:p></o:p></p>
        <p class="MsoNormal">  811 |     return typeid(void);<o:p></o:p></p>
        <p class="MsoNormal">      |                       ^<o:p></o:p></p>
        <p class="MsoNormal">/usr/local/include/boost/asio/execution/any_executor.hpp:
          In static member function â€˜static const std::type_info&amp;
boost::asio::execution::detail::any_executor_base::target_type_ex()â€™:<o:p></o:p></p>
        <p class="MsoNormal">/usr/local/include/boost/asio/execution/any_executor.hpp:851:21:
          error: cannot use â€˜typeidâ€™ with â€˜-fno-rttiâ€™<o:p></o:p></p>
        <p class="MsoNormal">  851 |     return typeid(Ex);<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">Regards,<o:p></o:p></p>
        <p class="MsoNormal">Jayashree<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
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

--------------5C417EDF081B1601CB48F760--
