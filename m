Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BE78461A
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2019 09:42:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463Nkp6tl4zDr8D
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2019 17:42:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=vishwa@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463Nk30LKdzDqg9
 for <openbmc@lists.ozlabs.org>; Wed,  7 Aug 2019 17:41:45 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x777Rcgn139545
 for <openbmc@lists.ozlabs.org>; Wed, 7 Aug 2019 03:41:42 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2u7t7wgjag-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 07 Aug 2019 03:41:41 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Wed, 7 Aug 2019 08:41:40 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 7 Aug 2019 08:41:38 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x777fbXX54853844
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Aug 2019 07:41:37 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34F2D4C04A;
 Wed,  7 Aug 2019 07:41:37 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74C444C044;
 Wed,  7 Aug 2019 07:41:36 +0000 (GMT)
Received: from [9.122.210.160] (unknown [9.122.210.160])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  7 Aug 2019 07:41:36 +0000 (GMT)
Subject: Re: Platform telemetry and health monitoring - PST AM
To: Neeraj Ladkani <neladk@microsoft.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <BYAPR21MB1191FD5198A9311CFA234CC5C8D50@BYAPR21MB1191.namprd21.prod.outlook.com>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Wed, 7 Aug 2019 13:11:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <BYAPR21MB1191FD5198A9311CFA234CC5C8D50@BYAPR21MB1191.namprd21.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------A6BC21BAF39D95CC60DE2A03"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19080707-4275-0000-0000-000003562C0A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19080707-4276-0000-0000-000038682D20
Message-Id: <6654073d-b4ff-474a-c85f-3cdd24a02584@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-07_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908070081
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
Cc: "Paul.Vancil@dell.com" <Paul.Vancil@dell.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------A6BC21BAF39D95CC60DE2A03
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I updated the wiki with the minutes from yesterday's discussion.

!! Vishwa !!

On 8/6/19 5:37 AM, Neeraj Ladkani wrote:
>
> Hello Everyone.
>
> This is a reminder for tomorrow’s OpenBMC platform telemetry workgroup 
> meeting ( Tuesday 08/06 -  9:30 AM PST)
>
> Neeraj
>
> -----Original Appointment-----
> *From:* Neeraj Ladkani
> *Sent:* Tuesday, June 4, 2019 12:09 AM
> *To:* Neeraj Ladkani; openbmc@lists.ozlabs.org
> *Cc:* Joe P Mulholland; Luke Chen; Matt Chen/WYHQ/Wiwynn; Dong Wei; 
> Jitendra_Kumar4@Dell.com; Reed B Frandsen; Michael Lim; Buddy Huang 
> (黃天鴻); Tom Sand; Asmaa Mnebhi; Paul.Vancil@dell.com; Tanous, Ed; 
> Christopher Bostic; James Morse; Vijay Khemka
> *Subject:* Platform telemetry and health monitoring - PST AM
> *When:* Tuesday, August 6, 2019 9:30 AM-10:30 AM (UTC-08:00) Pacific 
> Time (US & Canada).
> *Where:* Microsoft Teams Meeting
>
> https://github.com/openbmc/openbmc/wiki/Platform-telemetry-and-health-monitoring-Work-Group
>
> Join Microsoft Teams Meeting 
> <https://teams.microsoft.com/l/meetup-join/19%3ameeting_MDU1NDM2Y2EtOTZkYy00ZjI5LTkzMDctMjMxZDYyNzlhNjQy%40thread.v2/0?context=%7b%22Tid%22%3a%2272f988bf-86f1-41af-91ab-2d7cd011db47%22%2c%22Oid%22%3a%221c29c2f7-d386-4c5a-a3bc-0ee13b48bc65%22%7d> 
>
>
> +1 323-849-4874 <tel:+1%20323-849-4874,,73572842# >   United States, 
> Los Angeles (Toll)
>
> (866) 679-9995 <tel:(866)%20679-9995,,73572842# >   (Toll-free)
>
> Conference ID: 735 728 42#
>
> Local numbers 
> <https://dialin.teams.microsoft.com/8551f4c1-bea3-441a-8738-69aa517a91c5?id=73572842> 
> | Reset PIN <https://mysettings.lync.com/pstnconferencing> | Learn 
> more about Teams <https://go.microsoft.com/fwlink/?linkid=857250> | 
> Meeting options 
> <https://teams.microsoft.com/meetingOptions/?organizerId=1c29c2f7-d386-4c5a-a3bc-0ee13b48bc65&tenantId=72f988bf-86f1-41af-91ab-2d7cd011db47&threadId=19_meeting_MDU1NDM2Y2EtOTZkYy00ZjI5LTkzMDctMjMxZDYyNzlhNjQy@thread.v2&messageId=0&language=en-US> 
>
>
> Join with a video conferencing device
>
> 813878896@t.plcm.vc <mailto:813878896@t.plcm.vc>VTC Conference ID: 
> 017920684
>
> Alternate VTC dialing instructions 
> <https://dialin.plcm.vc/teams/?key=813878896&conf=017920684>
>

--------------A6BC21BAF39D95CC60DE2A03
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>I updated the wiki with the minutes from yesterday's discussion.<br>
    </p>
    <div class="moz-cite-prefix">!! Vishwa !!</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 8/6/19 5:37 AM, Neeraj Ladkani
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:BYAPR21MB1191FD5198A9311CFA234CC5C8D50@BYAPR21MB1191.namprd21.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:Gulim;
	panose-1:2 11 6 0 0 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
@font-face
	{font-family:"Segoe UI Semibold";
	panose-1:2 11 7 2 4 2 4 2 2 3;}
@font-face
	{font-family:"\@Gulim";
	panose-1:2 11 6 0 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:KO;}
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
	font-family:"Calibri",sans-serif;
	mso-fareast-language:KO;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:KO;}
span.EmailStyle19
	{mso-style-type:personal;
	color:#2F5496;
	font-weight:normal;
	font-style:normal;}
span.EmailStyle20
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#002060;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
        <p class="MsoNormal"><span
            style="color:#002060;mso-fareast-language:EN-US">Hello
            Everyone.
            <o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="color:#002060;mso-fareast-language:EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span
            style="color:#002060;mso-fareast-language:EN-US">This is a
            reminder for tomorrow’s OpenBMC platform telemetry workgroup
            meeting ( Tuesday 08/06 -  9:30 AM PST)
            <o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="color:#002060;mso-fareast-language:EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span
            style="color:#002060;mso-fareast-language:EN-US">Neeraj<o:p></o:p></span></p>
        <p class="MsoNormal"><span
            style="color:#002060;mso-fareast-language:EN-US"><o:p> </o:p></span></p>
        <div>
          <p class="MsoNormal">-----Original Appointment-----<br>
            <b>From:</b> Neeraj Ladkani <br>
            <b>Sent:</b> Tuesday, June 4, 2019 12:09 AM<br>
            <b>To:</b> Neeraj Ladkani; <a class="moz-txt-link-abbreviated" href="mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br>
            <b>Cc:</b> Joe P Mulholland; Luke Chen; Matt
            Chen/WYHQ/Wiwynn; Dong Wei; <a class="moz-txt-link-abbreviated" href="mailto:Jitendra_Kumar4@Dell.com">Jitendra_Kumar4@Dell.com</a>; Reed B
            Frandsen; Michael Lim; Buddy Huang (<span
              style="font-family:&quot;Gulim&quot;,sans-serif" lang="KO">黃天鴻</span>);
            Tom Sand; Asmaa Mnebhi; <a class="moz-txt-link-abbreviated" href="mailto:Paul.Vancil@dell.com">Paul.Vancil@dell.com</a>; Tanous, Ed;
            Christopher Bostic; James Morse; Vijay Khemka<br>
            <b>Subject:</b> Platform telemetry and health monitoring -
            PST AM <br>
            <b>When:</b> Tuesday, August 6, 2019 9:30 AM-10:30 AM
            (UTC-08:00) Pacific Time (US &amp; Canada).<br>
            <b>Where:</b> Microsoft Teams Meeting<o:p></o:p></p>
        </div>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><a
href="https://github.com/openbmc/openbmc/wiki/Platform-telemetry-and-health-monitoring-Work-Group"
            moz-do-not-send="true">https://github.com/openbmc/openbmc/wiki/Platform-telemetry-and-health-monitoring-Work-Group</a><o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal"><span style="font-family:&quot;Segoe
            UI&quot;,sans-serif;color:#252424"><a
href="https://teams.microsoft.com/l/meetup-join/19%3ameeting_MDU1NDM2Y2EtOTZkYy00ZjI5LTkzMDctMjMxZDYyNzlhNjQy%40thread.v2/0?context=%7b%22Tid%22%3a%2272f988bf-86f1-41af-91ab-2d7cd011db47%22%2c%22Oid%22%3a%221c29c2f7-d386-4c5a-a3bc-0ee13b48bc65%22%7d"
              target="_blank" moz-do-not-send="true"><span
                style="font-size:13.5pt;font-family:&quot;Segoe UI
                Semibold&quot;,sans-serif;color:#6264A7">Join Microsoft
                Teams Meeting</span></a> <o:p></o:p></span></p>
        <div>
          <div>
            <p class="MsoNormal"><span style="font-family:&quot;Segoe
                UI&quot;,sans-serif;color:#252424"><a
                  href="tel:+1%20323-849-4874,,73572842# "
                  target="_blank" moz-do-not-send="true"><span
                    style="font-size:10.5pt;color:#6264A7;text-decoration:none">+1
                    323-849-4874</span></a>
              </span><span
                style="font-size:9.0pt;font-family:&quot;Segoe
                UI&quot;,sans-serif;color:#252424">  United States, Los
                Angeles (Toll)
              </span><span style="font-family:&quot;Segoe
                UI&quot;,sans-serif;color:#252424"><o:p></o:p></span></p>
          </div>
          <div style="margin-bottom:3.0pt">
            <p class="MsoNormal"><span style="font-family:&quot;Segoe
                UI&quot;,sans-serif;color:#252424"><a
                  href="tel:(866)%20679-9995,,73572842# "
                  target="_blank" moz-do-not-send="true"><span
                    style="font-size:10.5pt;color:#6264A7;text-decoration:none">(866)
                    679-9995</span></a>
              </span><span
                style="font-size:9.0pt;font-family:&quot;Segoe
                UI&quot;,sans-serif;color:#252424">  (Toll-free)
              </span><span style="font-family:&quot;Segoe
                UI&quot;,sans-serif;color:#252424"><o:p></o:p></span></p>
          </div>
        </div>
        <div style="margin-top:7.5pt;margin-bottom:15.0pt">
          <p class="MsoNormal"><span
              style="font-size:9.0pt;font-family:&quot;Segoe
              UI&quot;,sans-serif;color:#252424">Conference ID:
            </span><span style="font-size:10.5pt;font-family:&quot;Segoe
              UI&quot;,sans-serif;color:#252424">735 728 42#
            </span><span style="font-family:&quot;Segoe
              UI&quot;,sans-serif;color:#252424"><o:p></o:p></span></p>
        </div>
        <div style="margin-bottom:.25in">
          <p class="MsoNormal"><span style="font-family:&quot;Segoe
              UI&quot;,sans-serif;color:#252424"><a
href="https://dialin.teams.microsoft.com/8551f4c1-bea3-441a-8738-69aa517a91c5?id=73572842"
                target="_blank" moz-do-not-send="true"><span
                  style="font-size:9.0pt;color:#6264A7;text-decoration:none">Local
                  numbers</span></a> | <a
                href="https://mysettings.lync.com/pstnconferencing"
                target="_blank" moz-do-not-send="true">
                <span
                  style="font-size:9.0pt;color:#6264A7;text-decoration:none">Reset
                  PIN</span></a> |
              <a href="https://go.microsoft.com/fwlink/?linkid=857250"
                target="_blank" moz-do-not-send="true"><span
                  style="font-size:9.0pt;color:#6264A7;text-decoration:none">Learn
                  more about Teams</span></a> |
              <a
href="https://teams.microsoft.com/meetingOptions/?organizerId=1c29c2f7-d386-4c5a-a3bc-0ee13b48bc65&amp;tenantId=72f988bf-86f1-41af-91ab-2d7cd011db47&amp;threadId=19_meeting_MDU1NDM2Y2EtOTZkYy00ZjI5LTkzMDctMjMxZDYyNzlhNjQy@thread.v2&amp;messageId=0&amp;language=en-US"
                target="_blank" moz-do-not-send="true">
                <span
                  style="font-size:9.0pt;color:#6264A7;text-decoration:none">Meeting
                  options</span></a>
              <o:p></o:p></span></p>
        </div>
        <div style="margin-bottom:3.0pt">
          <p class="MsoNormal"><span
              style="font-size:10.5pt;font-family:&quot;Segoe
              UI&quot;,sans-serif;color:#252424">Join with a video
              conferencing device
              <o:p></o:p></span></p>
        </div>
        <div style="margin-bottom:3.0pt">
          <p class="MsoNormal"><span class="MsoHyperlink"><span
                style="font-size:9.0pt;font-family:&quot;Segoe
                UI&quot;,sans-serif;color:#6264A7;text-decoration:none"><a
                  href="mailto:813878896@t.plcm.vc"
                  moz-do-not-send="true">813878896@t.plcm.vc</a></span></span><span
              style="font-size:9.0pt;font-family:&quot;Segoe
              UI&quot;,sans-serif;color:#252424"> VTC Conference ID:
              017920684 <o:p></o:p></span></p>
        </div>
        <div style="margin-bottom:15.0pt">
          <p class="MsoNormal"><span
              style="font-size:9.0pt;font-family:&quot;Segoe
              UI&quot;,sans-serif;color:#252424"><a
                href="https://dialin.plcm.vc/teams/?key=813878896&amp;conf=017920684"
                moz-do-not-send="true"><span
                  style="color:#6264A7;text-decoration:none">Alternate
                  VTC dialing instructions</span></a>
              <o:p></o:p></span></p>
        </div>
        <p class="MsoNormal"><o:p> </o:p></p>
      </div>
    </blockquote>
  </body>
</html>

--------------A6BC21BAF39D95CC60DE2A03--

