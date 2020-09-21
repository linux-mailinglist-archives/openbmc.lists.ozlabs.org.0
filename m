Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE4C272716
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 16:33:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bw6Np234hzDqfZ
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 00:32:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ratagupt@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Si3qjZ+z; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bw6L81ngWzDqHf
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 00:30:38 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08LEMDbn142036; Mon, 21 Sep 2020 10:29:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type; s=pp1; bh=IWermD3g0NsvydtygBczpSMF696TQEWTEXftPQThiGU=;
 b=Si3qjZ+zdAjBrg/J9af4NEmACvDBV0QcIN9fESMpmgahuDm/+RCe9CC0d6dsMPUHG7uy
 E8HQkL96SoNFufi/wv0Tz/O/VuBcUeaELX4OMzYuBZQvLSRTfYco2v0DW5dRwACOLdOR
 NxXy4pmP9dlYFMhq39TmpL4tKjLxq3NkMhWNj76Wn/Uek9O6g3KWotzGkPoBEiBnBpo+
 MUlxjsqzR3B2sMuLmlJnqgA4Ow128vUAOVmP7Jhgp44LZfZZIYGoAw1/slee4idHxin1
 DTheRyrEesk91r60jmkAeZ0tyyPuI+O9LiVW/JLGefgYn0KswdQTzmkL7hnrwwz3SqNQ Xg== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33pwa89pgv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Sep 2020 10:29:32 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08LESHWb030370;
 Mon, 21 Sep 2020 14:29:29 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 33n9m7s3f5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Sep 2020 14:29:29 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08LETReo25231808
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Sep 2020 14:29:27 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F64A42041;
 Mon, 21 Sep 2020 14:29:27 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B20A42042;
 Mon, 21 Sep 2020 14:29:25 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.79.217.195])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 21 Sep 2020 14:29:25 +0000 (GMT)
Subject: Re: OpenBMC LDAP server configuration assistance
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 "Gerhart, Donnie" <Donnie.Gerhart@dell.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "gkeishin@in.ibm.com" <gkeishin@in.ibm.com>
References: <BLAPR19MB43381522D073D4BFD348A7B993260@BLAPR19MB4338.namprd19.prod.outlook.com>
 <6b1406cd-1d70-7f62-6e2d-c33d80d02f1c@linux.intel.com>
 <BLAPR19MB433888EAE75ED273319EC97193240@BLAPR19MB4338.namprd19.prod.outlook.com>
 <a3c9f148-d624-ab31-b59b-8c6dcf126679@linux.intel.com>
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Message-ID: <8349ffa4-a809-6960-5eba-2583b070badd@linux.vnet.ibm.com>
Date: Mon, 21 Sep 2020 19:59:24 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <a3c9f148-d624-ab31-b59b-8c6dcf126679@linux.intel.com>
Content-Type: multipart/alternative;
 boundary="------------365A01D800F389C5FBBECC41"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-21_05:2020-09-21,
 2020-09-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0 clxscore=1011
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009210102
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
--------------365A01D800F389C5FBBECC41
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Donnie,

We didn't create the cheatsheet for ldap server configuration, we 
thought the enough documentation is there on the net to configure the 
ldap server.

But it is good to have this documentation, Are you doing it for openLDAP 
or the Active Directory also?

I thought George & team was having this when I was working with him.

Ratan

On 9/21/20 10:01 AM, Thomaiyar, Richard Marian wrote:
> Hi Donnie, Yes, Please go ahead and create Cheatsheet for LDAP 
> configuration....
> This Message Is From an External Sender
> This message came from outside your organization.
>
> Hi Donnie,
>
> Yes, Please go ahead and create Cheatsheet for LDAP configuration.
>
> Regards,
>
> Richard
>
> On 9/12/2020 12:44 AM, Gerhart, Donnie wrote:
>>
>> Hey Richard/Folks,
>>
>> Thanks for reaching out.  We really appreciate it.
>>
>> Per usual, shortly after we hit send, we found a GID anomaly that 
>> once corrected everything OpenBMC LDAP connected up and logged in nicely.
>>
>> To keep others from spinning in such an anomaly we’d be more than 
>> happy to post (ourselves or through you) a simple Ldap diff (LDIF) 
>> file containing a small working joe and jane LDAP server config.  The 
>> two places we thought such an example might valuable are phosphor 
>> user manager arch documentation and/or the LDAP test in 
>> openbmc-test-automation but we are happy to defer to your guidance 
>> regarding same.  Let us know your thoughts and we can post or provide 
>> the applicable file straight away.
>>
>> Thanks again!
>>
>> Best,
>>
>> Donnie
>>
>> *From:* Thomaiyar, Richard Marian 
>> <richard.marian.thomaiyar@linux.intel.com>
>> *Sent:* Thursday, September 10, 2020 8:53 AM
>> *To:* Gerhart, Donnie; openbmc@lists.ozlabs.org; 
>> ratagupt@linux.vnet.ibm.com; gkeishin@in.ibm.com
>> *Cc:* Mugunda, Chandra; Giles, Joshua; Cockrell, Trevor
>> *Subject:* Re: OpenBMC LDAP server configuration assistance
>>
>> [EXTERNAL EMAIL]
>>
>> Hi Donnie,
>>
>> Didn't tested it in latest tree, but you already cross verified this 
>> right --> 
>> https://github.com/openbmc/openbmc-test-automation/blob/master/redfish/account_service/test_ldap_configuration.robot
>>
>> ++ Ratan & George.
>>
>> Regards,
>>
>> Richard
>>
>> On 9/9/2020 10:02 PM, Gerhart, Donnie wrote:
>>
>>     Hello OpenBMC Community\SMEs,
>>
>>     We are investigating LDAP functionality on the 2.8 ‘top of tree’
>>     build; however, we are having some issues I believe you can help
>>     with straight away. Some of the many real failures we’ve
>>     encountered are:
>>
>>       * Bricked system due to locking out all users
>>
>> <Richard> You meant to say even `root` user is locked out is OpenBMC 
>> repo master or made more changes. By default user lock out is 
>> disabled, and still won't lock root user to avoid DOS attack.
>>
>>       * Ladap_result() failed:  Can’t contact LDAP server
>>
>>           o Believe we’ve fixed this one
>>
>> <Richard> Hope this as LDAP configuration issue you faced, and not 
>> related to OpenBMC code as such.
>>
>>       * Logins are restricted to the group priv-admin of but user
>>         ‘testuser’ is not a member
>>
>> <Richard>: Is this failure due to SSH login. Because SSH won't make 
>> use of ldap privilege mapping. You may need to change 
>> https://github.com/openbmc/meta-phosphor/blob/master/recipes-core/dropbear/dropbear/dropbear.default 
>> if needs LDAP testing in SSH.
>>
>> Have you tried bmcweb LDAP login ? Whether you are able to succeed in 
>> that ?
>>
>>       * Pam_authenticate() failed, rc=7, Authentication failure
>>       * Bad PAM password attempt for ‘testuser’ from: <LDAP server IP>
>>
>>     Some of these issues we’ve worked through; however, some are
>>     still dogging us.  To that end, can someone possibly list\post a
>>     basic LDAP server LDIF file with a single user, privilege role
>>     and group mapping that you’ve successfully used with OpenBMC?  We
>>     assume we are stuck on some trivial LDAP server topology anomaly
>>     that is completely escaping us at the moment.
>>
>>     As an fyi we have looked at:
>>
>>      1. Gone through everything obviously ‘ldap’ in the mailing
>>         lists: https://lists.ozlabs.org/pipermail/openbmc/
>>      2. Looked at OpenBMC learning series:
>>         https://github.com/openbmc/openbmc/wiki/Presentations
>>      3. Gone through the documents here:
>>         https://github.com/openbmc/docs/blob/master/architecture/user-management.md
>>      4. Looked at ldap tests and server:
>>         https://github.com/openbmc/openbmc-test-automation
>>      5. Spent more time tweaking Linux files and creating ldap server
>>         configs that I care to admit 😊
>>
>>     BIG thanks in advance!
>>
>>     Best,
>>
>>     Donnie
>>

--------------365A01D800F389C5FBBECC41
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Donnie,</p>
    <p>We didn't create the cheatsheet for ldap server configuration, we
      thought the enough documentation is there on the net to configure
      the ldap server.</p>
    <p>But it is good to have this documentation, Are you doing it for
      openLDAP or the Active Directory also?</p>
    <p>I thought George &amp; team was having this when I was working
      with him.<br>
    </p>
    <p>Ratan<br>
    </p>
    <div class="moz-cite-prefix">On 9/21/20 10:01 AM, Thomaiyar, Richard
      Marian wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a3c9f148-d624-ab31-b59b-8c6dcf126679@linux.intel.com">
      <!-- BaNnErBlUrFlE-HeAdEr-start -->
      <meta name="viewport" content="width=device-width;
        initial-scale=1.0; maximum-scale=1.0; user-scalable=no;">
      <style>
      /* Mobile */
      @media screen and (max-width: 630px){
        * {-webkit-text-size-adjust: none}
        a[href^="x-apple-data-detectors:"] { color: inherit; text-decoration: none; }
        .pfptTitle { font-size:22px !important; line-height:26px !important; text-align: center !important; }
        .pfptSubtitle { font-size:14px !important; line-height:18px !important; text-align: center !important; }
        
        .pfptMainWrapper { margin-top: 0 !important; margin-right: 0 !important; margin-left: 0 !important; }
        th[class="pfptTableColumnLeft"] {width:100% !important; height:auto !important; display:block !important; text-align: center !important; }
        th[class="pfptTableColumnRight"] {width:100% !important; height:auto !important; display:block !important; text-align: center !important; }

        .pfptButton { font-size:16px !important; line-height:16px !important; width: 50% !important; display:block !important; margin-right: auto!important; margin-left: auto!important; }   
        .pfptButton a { font-size: 16px; } 
        .pfptButton span { font-size: 16px; }     
      }
      /* Tablet, Laptop, Desktop */
      @media screen and (min-width: 631px){
        th[class="pfptTableColumnLeft"] { width: 50% !important; height:auto !important; }
        th[class="pfptTableColumnRight"] { width: 50% !important; height:auto !important; text-align: right !important; } 
      }
      .pfptPreheader { display:none !important; visibility:hidden; mso-hide:all; font-size:1px; line-height:1px; max-height:0px; max-width:0px; opacity:0; overflow:hidden; }
    </style>
      <!-- BaNnErBlUrFlE-HeAdEr-end -->
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <!-- BaNnErBlUrFlE-BoDy-start -->
      <!-- Preheader Text : BEGIN --> <span class="pfptPreheader"
        style="display:none
!important;visibility:hidden;mso-hide:all;font-size:1px;color:#ffffff;line-height:1px;max-height:0px;max-width:0px;opacity:0;overflow:hidden;">
        Hi Donnie, Yes, Please go ahead and create Cheatsheet for LDAP
        configuration.... 
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
              </span>
      <!-- Preheader Text : END -->
      <!-- Email Banner : BEGIN -->
      <table style="width:100%;border-radius:4px;margin-bottom:16px;"
        width="100%" cellspacing="0" cellpadding="16" border="0"
        bgcolor="#9CA3A7">
        <tbody>
          <tr>
            <td align="center">
              <table class="pfptMainWrapper" style="width:100%;"
                width="100%" cellspacing="0" cellpadding="0" border="0"
                align="center">
                <tbody>
                  <tr>
                    <td style="border-radius:4px;" valign="top"
                      align="center">
                      <table style="max-width:100%; width:100%;"
                        width="100%" cellspacing="0" cellpadding="0"
                        border="0" bgcolor="#9CA3A7" align="center">
                        <tbody>
                          <tr>
                            <!-- Message : BEGIN --> <th
                              class="pfptTableColumnLeft"
style="font-weight:normal;padding-top:0px;padding-right:0px;padding-bottom:0px;padding-left:0px;width:100%;height:auto;"
                              valign="top">
                              <table
                                style="width:100%;height:auto;text-align:left;vertical-align:middle;"
                                width="100%" cellspacing="0"
                                cellpadding="0">
                                <tbody>
                                  <tr>
                                    <td> <span class="pfptTitle"
style="font-family:'Roboto','Helvetica','Arial',sans-serif;font-weight:bold;font-size:18px;line-height:20px;display:block;margin-bottom:4px;word-wrap:normal;">This
                                        Message Is From an External
                                        Sender</span> </td>
                                  </tr>
                                  <tr>
                                    <td> <span class="pfptSubtitle"
style="font-weight:normal;font-family:'Roboto','Helvetica','Arial',sans-serif;font-size:13px;line-height:16px;display:block;word-wrap:normal;">This
                                        message came from outside your
                                        organization.</span> </td>
                                  </tr>
                                </tbody>
                              </table>
                            </th>
                            <!-- Message : END --> </tr>
                        </tbody>
                      </table>
                    </td>
                  </tr>
                </tbody>
              </table>
            </td>
          </tr>
        </tbody>
      </table>
      <!-- Email Banner : END -->
      <!-- BaNnErBlUrFlE-BoDy-end -->
      <p>Hi Donnie, <br>
      </p>
      <p>Yes, Please go ahead and create Cheatsheet for LDAP
        configuration.</p>
      <p>Regards,</p>
      <p>Richard<br>
      </p>
      <div class="moz-cite-prefix">On 9/12/2020 12:44 AM, Gerhart,
        Donnie wrote:<br>
      </div>
      <blockquote type="cite"
cite="mid:BLAPR19MB433888EAE75ED273319EC97193240@BLAPR19MB4338.namprd19.prod.outlook.com">
        <meta http-equiv="Content-Type" content="text/html;
          charset=UTF-8">
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
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle20
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
	{mso-list-id:384136804;
	mso-list-template-ids:1822620116;}
@list l2
	{mso-list-id:391270505;
	mso-list-template-ids:830654476;}
@list l2:level1
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l2:level2
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l2:level3
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l2:level4
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l2:level5
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l2:level6
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l2:level7
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l2:level8
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l2:level9
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l3
	{mso-list-id:639195202;
	mso-list-template-ids:1631762344;}
@list l3:level1
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l3:level2
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l3:level3
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l3:level4
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l3:level5
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l3:level6
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l3:level7
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l3:level8
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l3:level9
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l4
	{mso-list-id:780489114;
	mso-list-type:hybrid;
	mso-list-template-ids:-1797343294 67698703 67698713 67698715 67698703 67698713 67698715 67698703 67698713 67698715;}
@list l4:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l4:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l4:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l4:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l4:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l4:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l4:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l4:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l4:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l5
	{mso-list-id:1160468196;
	mso-list-template-ids:1271148706;}
@list l5:level1
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l5:level2
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l5:level3
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l5:level4
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l5:level5
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l5:level6
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l5:level7
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l5:level8
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l5:level9
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l6
	{mso-list-id:1941138384;
	mso-list-template-ids:-1364811478;}
@list l6:level1
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l6:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l6:level3
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l6:level4
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l6:level5
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l6:level6
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l6:level7
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l6:level8
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l6:level9
	{mso-level-number-format:bullet;
	mso-level-text:;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
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
          <p class="MsoNormal">Hey Richard/Folks,<o:p></o:p></p>
          <p class="MsoNormal"><o:p> </o:p></p>
          <p class="MsoNormal">Thanks for reaching out.  We really
            appreciate it.<o:p></o:p></p>
          <p class="MsoNormal"><o:p> </o:p></p>
          <p class="MsoNormal">Per usual, shortly after we hit send, we
            found a GID anomaly that once corrected everything OpenBMC
            LDAP connected up and logged in nicely.<o:p></o:p></p>
          <p class="MsoNormal"><o:p> </o:p></p>
          <p class="MsoNormal">To keep others from spinning in such an
            anomaly we’d be more than happy to post (ourselves or
            through you) a simple Ldap diff (LDIF) file containing a
            small working joe and jane LDAP server config.  The two
            places we thought such an example might valuable are
            phosphor user manager arch documentation and/or the LDAP
            test in openbmc-test-automation but we are happy to defer to
            your guidance regarding same.  Let us know your thoughts and
            we can post or provide the applicable file straight away.  <o:p></o:p></p>
          <p class="MsoNormal"><o:p> </o:p></p>
          <p class="MsoNormal">Thanks again!<o:p></o:p></p>
          <p class="MsoNormal"><o:p> </o:p></p>
          <p class="MsoNormal">Best,<o:p></o:p></p>
          <p class="MsoNormal">Donnie<o:p></o:p></p>
          <p class="MsoNormal"><o:p> </o:p></p>
          <p class="MsoNormal"><o:p> </o:p></p>
          <div>
            <div style="border:none;border-top:solid #E1E1E1
              1.0pt;padding:3.0pt 0in 0in 0in">
              <p class="MsoNormal"><b>From:</b> Thomaiyar, Richard
                Marian <a class="moz-txt-link-rfc2396E"
                  href="mailto:richard.marian.thomaiyar@linux.intel.com"
                  moz-do-not-send="true">&lt;richard.marian.thomaiyar@linux.intel.com&gt;</a>
                <br>
                <b>Sent:</b> Thursday, September 10, 2020 8:53 AM<br>
                <b>To:</b> Gerhart, Donnie; <a
                  class="moz-txt-link-abbreviated"
                  href="mailto:openbmc@lists.ozlabs.org"
                  moz-do-not-send="true">openbmc@lists.ozlabs.org</a>; <a
                  class="moz-txt-link-abbreviated"
                  href="mailto:ratagupt@linux.vnet.ibm.com"
                  moz-do-not-send="true">ratagupt@linux.vnet.ibm.com</a>;
                <a class="moz-txt-link-abbreviated"
                  href="mailto:gkeishin@in.ibm.com"
                  moz-do-not-send="true">gkeishin@in.ibm.com</a><br>
                <b>Cc:</b> Mugunda, Chandra; Giles, Joshua; Cockrell,
                Trevor<br>
                <b>Subject:</b> Re: OpenBMC LDAP server configuration
                assistance<o:p></o:p></p>
            </div>
          </div>
          <p class="MsoNormal"><o:p> </o:p></p>
          <div>
            <p><span style="color:#CE1126">[EXTERNAL EMAIL] <o:p></o:p></span></p>
          </div>
          <p class="MsoNormal">Hi Donnie, <o:p></o:p></p>
          <p>Didn't tested it in latest tree, but you already cross
            verified this right --&gt; <a
href="https://github.com/openbmc/openbmc-test-automation/blob/master/redfish/account_service/test_ldap_configuration.robot"
              moz-do-not-send="true">
https://github.com/openbmc/openbmc-test-automation/blob/master/redfish/account_service/test_ldap_configuration.robot</a><o:p></o:p></p>
          <p>++ Ratan &amp; George.<o:p></o:p></p>
          <p>Regards,<o:p></o:p></p>
          <p>Richard<o:p></o:p></p>
          <div>
            <p class="MsoNormal">On 9/9/2020 10:02 PM, Gerhart, Donnie
              wrote:<o:p></o:p></p>
          </div>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <p class="MsoNormal">Hello OpenBMC Community\SMEs,<o:p></o:p></p>
            <p class="MsoNormal"> <o:p></o:p></p>
            <p class="MsoNormal">We are investigating LDAP functionality
              on the 2.8 ‘top of tree’ build; however, we are having
              some issues I believe you can help with straight away. 
              Some of the many real failures we’ve encountered are:<o:p></o:p></p>
            <ul style="margin-top:0in" type="disc">
              <li class="MsoListParagraph"
                style="margin-left:0in;mso-list:l0 level1 lfo3">Bricked
                system due to locking out all users<o:p></o:p></li>
            </ul>
          </blockquote>
          <p class="MsoNormal">&lt;Richard&gt; You meant to say even
            `root` user is locked out is OpenBMC repo master or made
            more changes. By default user lock out is disabled, and
            still won't lock root user to avoid DOS attack. <o:p></o:p></p>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <ul style="margin-top:0in" type="disc">
              <li class="MsoListParagraph"
                style="margin-left:0in;mso-list:l0 level1 lfo3">Ladap_result()
                failed:  Can’t contact LDAP server<o:p></o:p></li>
            </ul>
            <ul style="margin-top:0in" type="disc">
              <ul style="margin-top:0in" type="circle">
                <li class="MsoListParagraph"
                  style="margin-left:0in;mso-list:l0 level2 lfo3">Believe
                  we’ve fixed this one<o:p></o:p></li>
              </ul>
            </ul>
          </blockquote>
          <p class="MsoNormal">&lt;Richard&gt; Hope this as LDAP
            configuration issue you faced, and not related to OpenBMC
            code as such.<br>
            <br>
            <o:p></o:p></p>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <ul style="margin-top:0in" type="disc">
              <li class="MsoListParagraph"
                style="margin-left:0in;mso-list:l0 level1 lfo3">Logins
                are restricted to the group priv-admin of but user
                ‘testuser’ is not a member<o:p></o:p></li>
            </ul>
          </blockquote>
          <p>&lt;Richard&gt;: Is this failure due to SSH login. Because
            SSH won't make use of ldap privilege mapping. You may need
            to change <a
href="https://github.com/openbmc/meta-phosphor/blob/master/recipes-core/dropbear/dropbear/dropbear.default"
              moz-do-not-send="true">
https://github.com/openbmc/meta-phosphor/blob/master/recipes-core/dropbear/dropbear/dropbear.default</a>
            if needs LDAP testing in SSH.<o:p></o:p></p>
          <p>Have you tried bmcweb LDAP login ? Whether you are able to
            succeed in that ?<o:p></o:p></p>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <ul style="margin-top:0in" type="disc">
              <li class="MsoListParagraph"
                style="margin-left:0in;mso-list:l0 level1 lfo3">Pam_authenticate()
                failed, rc=7, Authentication failure<o:p></o:p></li>
              <li class="MsoListParagraph"
                style="margin-left:0in;mso-list:l0 level1 lfo3">Bad PAM
                password attempt for ‘testuser’ from: &lt;LDAP server
                IP&gt;<o:p></o:p></li>
            </ul>
            <p class="MsoNormal"> <o:p></o:p></p>
            <p class="MsoNormal">Some of these issues we’ve worked
              through; however, some are still dogging us.  To that end,
              can someone possibly list\post a basic LDAP server LDIF
              file with a single user, privilege role and group mapping
              that you’ve successfully used with OpenBMC?  We assume we
              are stuck on some trivial LDAP server topology anomaly
              that is completely escaping us at the moment.<o:p></o:p></p>
            <p class="MsoNormal"> <o:p></o:p></p>
            <p class="MsoNormal">As an fyi we have looked at:<o:p></o:p></p>
            <ol style="margin-top:0in" type="1" start="1">
              <li class="MsoListParagraph"
                style="margin-left:0in;mso-list:l4 level1 lfo9">Gone
                through everything obviously ‘ldap’ in the mailing
                lists:  <a
                  href="https://lists.ozlabs.org/pipermail/openbmc/"
                  moz-do-not-send="true">https://lists.ozlabs.org/pipermail/openbmc/</a><o:p></o:p></li>
              <li class="MsoListParagraph"
                style="margin-left:0in;mso-list:l4 level1 lfo9">Looked
                at OpenBMC learning series:  <a
                  href="https://github.com/openbmc/openbmc/wiki/Presentations"
                  moz-do-not-send="true">https://github.com/openbmc/openbmc/wiki/Presentations</a><o:p></o:p></li>
              <li class="MsoListParagraph"
                style="margin-left:0in;mso-list:l4 level1 lfo9">Gone
                through the documents here:  <a
href="https://github.com/openbmc/docs/blob/master/architecture/user-management.md"
                  moz-do-not-send="true">
https://github.com/openbmc/docs/blob/master/architecture/user-management.md</a><o:p></o:p></li>
              <li class="MsoListParagraph"
                style="margin-left:0in;mso-list:l4 level1 lfo9">Looked
                at ldap tests and server:  <a
                  href="https://github.com/openbmc/openbmc-test-automation"
                  moz-do-not-send="true">https://github.com/openbmc/openbmc-test-automation</a><o:p></o:p></li>
              <li class="MsoListParagraph"
                style="margin-left:0in;mso-list:l4 level1 lfo9">Spent
                more time tweaking Linux files and creating ldap server
                configs that I care to admit <span
                  style="font-family:&quot;Segoe UI
                  Emoji&quot;,sans-serif">😊</span><o:p></o:p></li>
            </ol>
            <p class="MsoNormal"> <o:p></o:p></p>
            <p class="MsoNormal">BIG thanks in advance!<o:p></o:p></p>
            <p class="MsoNormal"> <o:p></o:p></p>
            <p class="MsoNormal">Best,<o:p></o:p></p>
            <p class="MsoNormal">Donnie<o:p></o:p></p>
            <p class="MsoNormal"> <o:p></o:p></p>
          </blockquote>
        </div>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------365A01D800F389C5FBBECC41--

