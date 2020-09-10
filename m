Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FBB264783
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 15:54:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnL3t0NdlzDqYp
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 23:54:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=richard.marian.thomaiyar@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnL275bZbzDqXZ
 for <openbmc@lists.ozlabs.org>; Thu, 10 Sep 2020 23:53:18 +1000 (AEST)
IronPort-SDR: Fxy4AhZ2wxueZXscypZtoRJ0vnq838g4OfrvYMGgaevCGvWgOxS0nZ8+rsVe8BCnwNotiYVMKC
 u0Pm49dpLMdQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="159483260"
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; 
 d="scan'208,217";a="159483260"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 06:53:15 -0700
IronPort-SDR: 046fXh6+MWTaYRp6tOPNsbVBsbw3bvx59F7AFw96IoHGBONp8n07AZB8IGHg9/F2LvXbHW/5wP
 xkaalU7+rFAA==
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; 
 d="scan'208,217";a="480897254"
Received: from rthomaiy-mobl.gar.corp.intel.com (HELO [10.252.157.229])
 ([10.252.157.229])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 06:53:11 -0700
Subject: Re: OpenBMC LDAP server configuration assistance
To: "Gerhart, Donnie" <Donnie.Gerhart@dell.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 ratagupt@linux.vnet.ibm.com, gkeishin@in.ibm.com
References: <BLAPR19MB43381522D073D4BFD348A7B993260@BLAPR19MB4338.namprd19.prod.outlook.com>
From: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Message-ID: <6b1406cd-1d70-7f62-6e2d-c33d80d02f1c@linux.intel.com>
Date: Thu, 10 Sep 2020 19:23:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <BLAPR19MB43381522D073D4BFD348A7B993260@BLAPR19MB4338.namprd19.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------E165A6D163DA1FD59A6ADCED"
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
Cc: "Mugunda, Chandra" <Chandra.Mugunda@dell.com>, "Giles,
 Joshua" <Joshua.Giles@dell.com>, "Cockrell, Trevor" <Trevor.Cockrell@dell.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------E165A6D163DA1FD59A6ADCED
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Donnie,

Didn't tested it in latest tree, but you already cross verified this 
right --> 
https://github.com/openbmc/openbmc-test-automation/blob/master/redfish/account_service/test_ldap_configuration.robot

++ Ratan & George.

Regards,

Richard

On 9/9/2020 10:02 PM, Gerhart, Donnie wrote:
>
> Hello OpenBMC Community\SMEs,
>
> We are investigating LDAP functionality on the 2.8 ‘top of tree’ 
> build; however, we are having some issues I believe you can help with 
> straight away.  Some of the many real failures we’ve encountered are:
>
>   * Bricked system due to locking out all users
>
<Richard> You meant to say even `root` user is locked out is OpenBMC 
repo master or made more changes. By default user lock out is disabled, 
and still won't lock root user to avoid DOS attack.
>
>   * Ladap_result() failed:  Can’t contact LDAP server
>       o Believe we’ve fixed this one
>
<Richard> Hope this as LDAP configuration issue you faced, and not 
related to OpenBMC code as such.
>
>   * Logins are restricted to the group priv-admin of but user
>     ‘testuser’ is not a member
>
<Richard>: Is this failure due to SSH login. Because SSH won't make use 
of ldap privilege mapping. You may need to change 
https://github.com/openbmc/meta-phosphor/blob/master/recipes-core/dropbear/dropbear/dropbear.default 
if needs LDAP testing in SSH.

Have you tried bmcweb LDAP login ? Whether you are able to succeed in that ?

>   * Pam_authenticate() failed, rc=7, Authentication failure
>   * Bad PAM password attempt for ‘testuser’ from: <LDAP server IP>
>
> Some of these issues we’ve worked through; however, some are still 
> dogging us.  To that end, can someone possibly list\post a basic LDAP 
> server LDIF file with a single user, privilege role and group mapping 
> that you’ve successfully used with OpenBMC?  We assume we are stuck on 
> some trivial LDAP server topology anomaly that is completely escaping 
> us at the moment.
>
> As an fyi we have looked at:
>
>  1. Gone through everything obviously ‘ldap’ in the mailing lists:
>     https://lists.ozlabs.org/pipermail/openbmc/
>  2. Looked at OpenBMC learning series:
>     https://github.com/openbmc/openbmc/wiki/Presentations
>  3. Gone through the documents here:
>     https://github.com/openbmc/docs/blob/master/architecture/user-management.md
>  4. Looked at ldap tests and server:
>     https://github.com/openbmc/openbmc-test-automation
>  5. Spent more time tweaking Linux files and creating ldap server
>     configs that I care to admit 😊
>
> BIG thanks in advance!
>
> Best,
>
> Donnie
>

--------------E165A6D163DA1FD59A6ADCED
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Hi Donnie, <br>
    <p>Didn't tested it in latest tree, but you already cross verified
      this right --&gt;
<a class="moz-txt-link-freetext" href="https://github.com/openbmc/openbmc-test-automation/blob/master/redfish/account_service/test_ldap_configuration.robot">https://github.com/openbmc/openbmc-test-automation/blob/master/redfish/account_service/test_ldap_configuration.robot</a></p>
    <p>++ Ratan &amp; George.</p>
    <p>Regards,</p>
    <p>Richard<br>
    </p>
    <div class="moz-cite-prefix">On 9/9/2020 10:02 PM, Gerhart, Donnie
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:BLAPR19MB43381522D073D4BFD348A7B993260@BLAPR19MB4338.namprd19.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Segoe UI Emoji";
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
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
/* List Definitions */
@list l0
	{mso-list-id:80760137;
	mso-list-type:hybrid;
	mso-list-template-ids:1014133672 67698689 67698691 67698693 67698689 67698691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l1
	{mso-list-id:780489114;
	mso-list-type:hybrid;
	mso-list-template-ids:-1797343294 67698703 67698713 67698715 67698703 67698713 67698715 67698703 67698713 67698715;}
@list l1:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal">Hello OpenBMC Community\SMEs,<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">We are investigating LDAP functionality on
          the 2.8 ‘top of tree’ build; however, we are having some
          issues I believe you can help with straight away.  Some of the
          many real failures we’ve encountered are:<o:p></o:p></p>
        <ul style="margin-top:0in" type="disc">
          <li class="MsoListParagraph"
            style="margin-left:0in;mso-list:l0 level1 lfo1">Bricked
            system due to locking out all users</li>
        </ul>
      </div>
    </blockquote>
    &lt;Richard&gt; You meant to say even `root` user is locked out is
    OpenBMC repo master or made more changes. By default user lock out
    is disabled, and still won't lock root user to avoid DOS attack.
    <blockquote type="cite"
cite="mid:BLAPR19MB43381522D073D4BFD348A7B993260@BLAPR19MB4338.namprd19.prod.outlook.com">
      <div class="WordSection1">
        <ul style="margin-top:0in" type="disc">
          <li class="MsoListParagraph"
            style="margin-left:0in;mso-list:l0 level1 lfo1">Ladap_result()
            failed:  Can’t contact LDAP server<o:p></o:p></li>
          <ul style="margin-top:0in" type="circle">
            <li class="MsoListParagraph"
              style="margin-left:0in;mso-list:l0 level2 lfo1">Believe
              we’ve fixed this one</li>
          </ul>
        </ul>
      </div>
    </blockquote>
    &lt;Richard&gt; Hope this as LDAP configuration issue you faced, and
    not related to OpenBMC code as such.<br>
    <blockquote type="cite"
cite="mid:BLAPR19MB43381522D073D4BFD348A7B993260@BLAPR19MB4338.namprd19.prod.outlook.com">
      <div class="WordSection1">
        <ul style="margin-top:0in" type="disc">
          <li class="MsoListParagraph"
            style="margin-left:0in;mso-list:l0 level1 lfo1">Logins are
            restricted to the group priv-admin of but user ‘testuser’ is
            not a member</li>
        </ul>
      </div>
    </blockquote>
    <p>&lt;Richard&gt;: Is this failure due to SSH login. Because SSH
      won't make use of ldap privilege mapping. You may need to change
<a class="moz-txt-link-freetext" href="https://github.com/openbmc/meta-phosphor/blob/master/recipes-core/dropbear/dropbear/dropbear.default">https://github.com/openbmc/meta-phosphor/blob/master/recipes-core/dropbear/dropbear/dropbear.default</a>
      if needs LDAP testing in SSH.</p>
    <p>Have you tried bmcweb LDAP login ? Whether you are able to
      succeed in that ?<br>
    </p>
    <blockquote type="cite"
cite="mid:BLAPR19MB43381522D073D4BFD348A7B993260@BLAPR19MB4338.namprd19.prod.outlook.com">
      <div class="WordSection1">
        <ul style="margin-top:0in" type="disc">
          <li class="MsoListParagraph"
            style="margin-left:0in;mso-list:l0 level1 lfo1">Pam_authenticate()
            failed, rc=7, Authentication failure<o:p></o:p></li>
          <li class="MsoListParagraph"
            style="margin-left:0in;mso-list:l0 level1 lfo1">Bad PAM
            password attempt for ‘testuser’ from: &lt;LDAP server IP&gt;<o:p></o:p></li>
        </ul>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">Some of these issues we’ve worked through;
          however, some are still dogging us.  To that end, can someone
          possibly list\post a basic LDAP server LDIF file with a single
          user, privilege role and group mapping that you’ve
          successfully used with OpenBMC?  We assume we are stuck on
          some trivial LDAP server topology anomaly that is completely
          escaping us at the moment.<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">As an fyi we have looked at:<o:p></o:p></p>
        <ol style="margin-top:0in" type="1" start="1">
          <li class="MsoListParagraph"
            style="margin-left:0in;mso-list:l1 level1 lfo2">Gone through
            everything obviously ‘ldap’ in the mailing lists: 
            <a href="https://lists.ozlabs.org/pipermail/openbmc/"
              moz-do-not-send="true">https://lists.ozlabs.org/pipermail/openbmc/</a><o:p></o:p></li>
          <li class="MsoListParagraph"
            style="margin-left:0in;mso-list:l1 level1 lfo2">Looked at
            OpenBMC learning series: 
            <a
              href="https://github.com/openbmc/openbmc/wiki/Presentations"
              moz-do-not-send="true">https://github.com/openbmc/openbmc/wiki/Presentations</a><o:p></o:p></li>
          <li class="MsoListParagraph"
            style="margin-left:0in;mso-list:l1 level1 lfo2">Gone through
            the documents here: 
            <a
href="https://github.com/openbmc/docs/blob/master/architecture/user-management.md"
              moz-do-not-send="true">
https://github.com/openbmc/docs/blob/master/architecture/user-management.md</a><o:p></o:p></li>
          <li class="MsoListParagraph"
            style="margin-left:0in;mso-list:l1 level1 lfo2">Looked at
            ldap tests and server: 
            <a href="https://github.com/openbmc/openbmc-test-automation"
              moz-do-not-send="true">https://github.com/openbmc/openbmc-test-automation</a><o:p></o:p></li>
          <li class="MsoListParagraph"
            style="margin-left:0in;mso-list:l1 level1 lfo2">Spent more
            time tweaking Linux files and creating ldap server configs
            that I care to admit
            <span style="font-family:&quot;Segoe UI
              Emoji&quot;,sans-serif">😊</span><o:p></o:p></li>
        </ol>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">BIG thanks in advance!<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">Best,<o:p></o:p></p>
        <p class="MsoNormal">Donnie<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
      </div>
    </blockquote>
  </body>
</html>

--------------E165A6D163DA1FD59A6ADCED--
