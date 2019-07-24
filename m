Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D5172863
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 08:37:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tlyr6Yf8zDqJV
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 16:37:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=vishwa@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tlyF5ycjzDqJM
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 16:37:24 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6O6Y0dK121746
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 02:37:21 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2txf3n7g1w-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 02:37:20 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Wed, 24 Jul 2019 07:37:18 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 24 Jul 2019 07:37:17 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x6O6b1Nt29950262
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Jul 2019 06:37:01 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5DA395204F;
 Wed, 24 Jul 2019 06:37:16 +0000 (GMT)
Received: from [9.122.210.246] (unknown [9.122.210.246])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id DBF3F52051;
 Wed, 24 Jul 2019 06:37:15 +0000 (GMT)
Subject: Re: BMC util
To: Vijay Khemka <vijaykhemka@fb.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <1CE4F632-2F5F-4EA3-BCC1-0F76C0DFAFD6@fb.com>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Wed, 24 Jul 2019 12:07:15 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1CE4F632-2F5F-4EA3-BCC1-0F76C0DFAFD6@fb.com>
Content-Type: multipart/alternative;
 boundary="------------DDCE4191E3DEC42B5D009136"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19072406-0020-0000-0000-000003569B78
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19072406-0021-0000-0000-000021AA8938
Message-Id: <b92f4522-7d2c-d961-0089-c888dcf5335a@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-24_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907240073
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
--------------DDCE4191E3DEC42B5D009136
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Vijay,

On 7/24/19 12:21 AM, Vijay Khemka wrote:
>
> Hi,
>
> Do we have any repo which supports command line utility like
>
>  1. power on/off server,
>  2. reading all sensors
>  3. reading a dbus property values
>  4. printing fru data.
>
There are some here. https://github.com/openbmc/openbmc-tools

Below is what we use mostly.

https://github.com/openbmc/phosphor-state-manager/blob/master/obmcutil

# obmcutil --help
usage: obmcutil [-h] [--verbose] [--wait]
{bmcstate,bootprogress,chassiskill,chassisoff,chassison,chassisstate,hoststate,power,poweroff,poweron,state,status}

positional arguments:
{bmcstate,bootprogress,chassiskill,chassisoff,chassison,chassisstate,hoststate,power,poweroff,poweron,state,status}

optional arguments:
   -h, --help            show this help message and exit
   --verbose, -v         Verbose output
   --wait, -w            Block until the state transition succeeds or fails

> Also do we have any daemon to monitor gpio lines and report events on 
> changing values.
>
https://github.com/openbmc/phosphor-gpio-monitor

I am currently writing a README on how this works when the GPIO is 
asserted and how to configure the actions to be taken.

> Regards
>
> -Vijay
>

--------------DDCE4191E3DEC42B5D009136
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi Vijay,</p>
    <div class="moz-cite-prefix">On 7/24/19 12:21 AM, Vijay Khemka
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1CE4F632-2F5F-4EA3-BCC1-0F76C0DFAFD6@fb.com">
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
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
	{mso-list-id:1297183946;
	mso-list-type:hybrid;
	mso-list-template-ids:-632922662 67698703 67698713 67698715 67698703 67698713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style>
      <div class="WordSection1">
        <p class="MsoNormal"><span style="font-size:11.0pt">Hi,<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt">Do we have
            any repo which supports command line utility like
            <o:p></o:p></span></p>
        <ol style="margin-top:0in" start="1" type="1">
          <li class="MsoListParagraph"
            style="margin-left:0in;mso-list:l0 level1 lfo1"><span
              style="font-size:11.0pt">power on/off server,
              <o:p></o:p></span></li>
          <li class="MsoListParagraph"
            style="margin-left:0in;mso-list:l0 level1 lfo1"><span
              style="font-size:11.0pt">reading all sensors<o:p></o:p></span></li>
          <li class="MsoListParagraph"
            style="margin-left:0in;mso-list:l0 level1 lfo1"><span
              style="font-size:11.0pt">reading a dbus property values<o:p></o:p></span></li>
          <li class="MsoListParagraph"
            style="margin-left:0in;mso-list:l0 level1 lfo1"><span
              style="font-size:11.0pt">printing fru data.<o:p></o:p></span></li>
        </ol>
      </div>
    </blockquote>
    <p>There are some here. <a class="moz-txt-link-freetext" href="https://github.com/openbmc/openbmc-tools">https://github.com/openbmc/openbmc-tools</a></p>
    <p>Below is what we use mostly.</p>
    <p><a class="moz-txt-link-freetext" href="https://github.com/openbmc/phosphor-state-manager/blob/master/obmcutil">https://github.com/openbmc/phosphor-state-manager/blob/master/obmcutil</a><br>
    </p>
    <p># obmcutil --help<br>
      usage: obmcutil [-h] [--verbose] [--wait]<br>
                     
{bmcstate,bootprogress,chassiskill,chassisoff,chassison,chassisstate,hoststate,power,poweroff,poweron,state,status}<br>
      <br>
      positional arguments:<br>
       
{bmcstate,bootprogress,chassiskill,chassisoff,chassison,chassisstate,hoststate,power,poweroff,poweron,state,status}<br>
      <br>
      optional arguments:<br>
        -h, --help            show this help message and exit<br>
        --verbose, -v         Verbose output<br>
        --wait, -w            Block until the state transition succeeds
      or fails<br>
      <br>
    </p>
    <blockquote type="cite"
      cite="mid:1CE4F632-2F5F-4EA3-BCC1-0F76C0DFAFD6@fb.com">
      <div class="WordSection1">
        <p class="MsoNormal"><span style="font-size:11.0pt"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt">Also do we
            have any daemon to monitor gpio lines and report events on
            changing values.<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt"><o:p> </o:p></span></p>
      </div>
    </blockquote>
    <p><a class="moz-txt-link-freetext" href="https://github.com/openbmc/phosphor-gpio-monitor">https://github.com/openbmc/phosphor-gpio-monitor</a></p>
    <p>I am currently writing a README on how this works when the GPIO
      is asserted and how to configure the actions to be taken.<br>
    </p>
    <blockquote type="cite"
      cite="mid:1CE4F632-2F5F-4EA3-BCC1-0F76C0DFAFD6@fb.com">
      <div class="WordSection1">
        <p class="MsoNormal"><span style="font-size:11.0pt">Regards<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt">-Vijay<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt">               
            <o:p></o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="font-size:11.0pt">                                                
            <o:p></o:p></span></p>
      </div>
    </blockquote>
  </body>
</html>

--------------DDCE4191E3DEC42B5D009136--

