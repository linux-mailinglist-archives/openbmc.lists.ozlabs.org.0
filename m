Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC49A19AF22
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 17:53:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48srMp5gLJzDrBh
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 02:53:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=i0X02yBU; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48srLx0DnXzDr6x
 for <openbmc@lists.ozlabs.org>; Thu,  2 Apr 2020 02:52:56 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 3DE1F41275;
 Wed,  1 Apr 2020 15:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-language:content-type:content-type:in-reply-to
 :mime-version:user-agent:date:date:message-id:from:from
 :references:subject:subject:received:received:received; s=
 mta-01; t=1585756369; x=1587570770; bh=UJz5sDGt2QInhKDFc4jt+m9J7
 5fC3zLdnMr8zStIAEs=; b=i0X02yBUzRByUW5Grge/GOkYiXY5NKSz6UEHBzz58
 xpmvYw5kwIIeOAbb/NY1KqiY6xPXkOOvBoIY8ccp4Qh1svlwQdUF9e1KR4Gm2mGe
 YglpX6/gnSzuDS5zLDESW5oxzTruHJbpvRCEK1yXKz5+RP4SPQNIYdaO9V4oQDYp
 dw=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XWyD3MofvXri; Wed,  1 Apr 2020 18:52:49 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 82E3941251;
 Wed,  1 Apr 2020 18:52:49 +0300 (MSK)
Received: from [10.199.0.98] (10.199.0.98) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 1 Apr
 2020 18:52:50 +0300
Subject: Re: Authorization of LDAP users in bmcweb
To: CS20 KFTing <KFTING@nuvoton.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
References: <HK0PR03MB4897F2703C45135D276DFFDFDBC90@HK0PR03MB4897.apcprd03.prod.outlook.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Message-ID: <cf96937a-8b21-6e44-47ed-77ce58b7f220@yadro.com>
Date: Wed, 1 Apr 2020 18:52:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <HK0PR03MB4897F2703C45135D276DFFDFDBC90@HK0PR03MB4897.apcprd03.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------77C9FE8BBEDB2C023A965882"
Content-Language: en-US
X-Originating-IP: [10.199.0.98]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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

--------------77C9FE8BBEDB2C023A965882
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

01.04.2020 10:40, CS20 KFTing пишет:
>
> Hi Alex:
>
> Please help try the patch from 
> https://github.com/Nuvoton-Israel/openbmc/blob/runbmc/meta-quanta/meta-olympus-nuvoton/recipes-extended/pam/libpam/pam_succeed_if_support_ldap_user_login.patch 
> to libpam and see how it goes.
>
> Besides the patch, the user from the ldap server needs to be in the 
> “redfish” group in the ldap server database and it’s already done 
> according to your description.
>
> The requirement "user in group redfish" is controlled by the 
> pam_succeed_if module when a user tries to login via WebUI and the 
> original implementation in pam_succeed_if module has some limitation 
> on group identification.
>
We've tested your patch. It works, but not every time.

I suspect that the groups check leads to requesting all groups from 
LDAP, and that takes a lot of time in our setup so authentication times 
out and fails. When I repeat the auth request, the list of groups is 
already in the memory and so authentication completes successfully.

I believe that there should be an easy way to make a mapping between 
LDAP and local permission (such as 'redfish', etc.) and privilege (such 
as 'priv-admin', etc.) groups. I'd say that there must be no need to add 
a user to LDAP `redfish` group, and I personally dislike that approach 
because it is prone to group name clashes. What I think would be great 
is have in WebUI a table like this:

LDAP Group | Privilege level | SSH | Redfish | Web
===========|=================|=====|=========|====
SomeGroup  | Administrator   |  Y  |    Y    |  Y
OtherGroup | Operator        |  N  |    Y    |  Y

* IPMI is not listed because it requires plain-text passwords and can't 
be authenticated against LDAP

What do you think?

WBR, Alexander


--------------77C9FE8BBEDB2C023A965882
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">01.04.2020 10:40, CS20 KFTing пишет:<br>
    </div>
    <blockquote type="cite"
cite="mid:HK0PR03MB4897F2703C45135D276DFFDFDBC90@HK0PR03MB4897.apcprd03.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
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
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal"><span lang="EN-US">Hi Alex:<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US">Please help try the
            patch from <a
href="https://github.com/Nuvoton-Israel/openbmc/blob/runbmc/meta-quanta/meta-olympus-nuvoton/recipes-extended/pam/libpam/pam_succeed_if_support_ldap_user_login.patch"
              moz-do-not-send="true">
https://github.com/Nuvoton-Israel/openbmc/blob/runbmc/meta-quanta/meta-olympus-nuvoton/recipes-extended/pam/libpam/pam_succeed_if_support_ldap_user_login.patch</a>
            to libpam and see how it goes.<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US">Besides the patch, the
            user from the ldap server needs to be in the “redfish” group
            in the ldap server database and it’s already done according
            to your description.<o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US">The requirement "user in
            group redfish" is controlled by the pam_succeed_if module
            when a user tries to login via WebUI and the original
            implementation in pam_succeed_if module has some limitation
            on group identification.<o:p></o:p></span></p>
        <span style="font-size:12pt;line-height:0.7;font-family:
          'Arial'; color:#808080"></span></div>
    </blockquote>
    We've tested your patch. It works, but not every time.<br>
    <p>I suspect that the groups check leads to requesting all groups
      from LDAP, and that takes a lot of time in our setup so
      authentication times out and fails. When I repeat the auth
      request, the list of groups is already in the memory and so
      authentication completes successfully.</p>
    <p>I believe that there should be an easy way to make a mapping
      between LDAP and local permission (such as 'redfish', etc.) and
      privilege (such as 'priv-admin', etc.) groups. I'd say that there
      must be no need to add a user to LDAP `redfish` group, and I
      personally dislike that approach because it is prone to group name
      clashes. What I think would be great is have in WebUI a table like
      this:</p>
    <p><tt>LDAP Group | Privilege level | SSH | Redfish | Web</tt><tt><br>
      </tt><tt>===========|=================|=====|=========|====<br>
        SomeGroup  | Administrator   |  Y  |    Y    |  Y<br>
        OtherGroup | Operator        |  N  |    Y    |  Y</tt></p>
    <p><tt>* IPMI is not listed because it requires plain-text passwords
        and can't be authenticated against LDAP<br>
      </tt></p>
    <p>What do you think?</p>
    <p>WBR, Alexander<br>
    </p>
  </body>
</html>

--------------77C9FE8BBEDB2C023A965882--
