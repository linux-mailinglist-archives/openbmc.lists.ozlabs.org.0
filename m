Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 292A1124A8F
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2019 16:01:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dJB71tPLzDqjN
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2019 02:01:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=vishwa@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dJ982F2mzDqdl
 for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2019 02:00:42 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBIEr8in144798
 for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2019 10:00:37 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wyjb57q6w-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2019 10:00:36 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Wed, 18 Dec 2019 15:00:31 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 18 Dec 2019 15:00:29 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBIF0SX353870636
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Dec 2019 15:00:28 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A263A52078;
 Wed, 18 Dec 2019 15:00:27 +0000 (GMT)
Received: from [9.85.124.215] (unknown [9.85.124.215])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 006A152074;
 Wed, 18 Dec 2019 15:00:26 +0000 (GMT)
Subject: Re: *Request For Feedback*: TimeOwner in phosphor-timemanager
From: vishwa <vishwa@linux.vnet.ibm.com>
To: "Pine, Kathryn ElaineX" <kathryn.elainex.pine@intel.com>
References: <18332622-cec4-37ae-b617-b897622d0ea2@linux.vnet.ibm.com>
 <FD0BD680739BFC41807C96BD23118BB1321C1D@ORSMSX113.amr.corp.intel.com>
 <8b717e60-5733-c3ef-13ad-7016e89f932a@linux.vnet.ibm.com>
Date: Wed, 18 Dec 2019 20:30:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8b717e60-5733-c3ef-13ad-7016e89f932a@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="------------3B21553CD2D38F93CFFC267B"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19121815-0016-0000-0000-000002D634BA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19121815-0017-0000-0000-0000333873EE
Message-Id: <20e2aaad-dd30-d9b2-36aa-d07b51f9732b@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-18_04:2019-12-17,2019-12-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 spamscore=0 mlxlogscore=999 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912180124
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------3B21553CD2D38F93CFFC267B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello community,

Would be really great if there is any feedback on this.

Have a happy holidays !!

!! Vishwa !!

On 12/11/19 3:24 PM, vishwa wrote:
> On 12/11/19 12:17 AM, Pine, Kathryn ElaineX wrote:
>>
>> >*Do we need this going forward ?*: I am being asked by UX team about 
>> the need of this and I mentioned I would get the community feedback 
>> on this. Although, I feel this level of granularity gives control 
>> over how we can manage time, it would not justify the complexity if 
>> the customers don't appreciate it. Removing the TimeOwner would make 
>> the code a lot simpler.
>>
>> Hi,
>>
>> I am coming from the UX side of how we set the date time settings 
>> page up for phosphor-webui downstream recently. We switched our page 
>> to use Redfish, here’s how ours is set up now:
>>
>> There is no longer a “time owner” and the setting is either:
>>
>> NTPEnabled: true or false
>>
>> If false, we are not allowing the user to set the time, because the 
>> BMC is synching from the host time and therefore any settings we made 
>> to the time on the BMC would be overwritten.
>>
>> If true, we use the NTP server(s) the user provides.
>>
>> We are testing this currently.
>>
>
> Hi, Thank you for the response. From what I interpreted:
>
> - TimeOwner is not settable via GUI
> - Irrespective of NTP setting, the user is not allowed to set the time 
> on BMC
> - BMC is syncing the time from Host.
>    - This means, the current TimeOwner is "Host" and NTP is off. Is 
> that being set as default ?
>
> I am requesting for feedback from the community on the need of 
> TimeOwner feature that we have in Settings and timemanager code.
>
> !! Vishwa !!
>>

--------------3B21553CD2D38F93CFFC267B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hello community,<br>
    </p>
    <p>Would be really great if there is any feedback on this.</p>
    <p>Have a happy holidays !!<br>
    </p>
    <p>!! Vishwa !!</p>
    <div class="moz-cite-prefix">On 12/11/19 3:24 PM, vishwa wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:8b717e60-5733-c3ef-13ad-7016e89f932a@linux.vnet.ibm.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div class="moz-cite-prefix">On 12/11/19 12:17 AM, Pine, Kathryn
        ElaineX wrote:<br>
      </div>
      <blockquote type="cite"
cite="mid:FD0BD680739BFC41807C96BD23118BB1321C1D@ORSMSX113.amr.corp.intel.com">
        <meta http-equiv="Content-Type" content="text/html;
          charset=UTF-8">
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
	font-family:"Calibri",sans-serif;
	color:black;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
span.EmailStyle19
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
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
        <div class="WordSection1">
          <p><span style="color:windowtext">&gt;</span><b> Do we need
              this going forward ?</b>: I am being asked by UX team
            about the need of this and I mentioned I would get the
            community feedback on this. Although, I feel this level of
            granularity gives control over how we can manage time, it
            would not justify the complexity if the customers don't
            appreciate it. Removing the TimeOwner would make the code a
            lot simpler.<o:p></o:p></p>
          <p class="MsoNormal"><span style="color:windowtext">Hi,<o:p></o:p></span></p>
          <p class="MsoNormal"><span style="color:windowtext"><o:p> </o:p></span></p>
          <p class="MsoNormal"><span style="color:windowtext">I am
              coming from the UX side of how we set the date time
              settings page up for phosphor-webui downstream recently.
              We switched our page to use Redfish, here’s how ours is
              set up now:<o:p></o:p></span></p>
          <p class="MsoNormal"><span style="color:windowtext"><o:p> </o:p></span></p>
          <p class="MsoNormal"><span style="color:windowtext">There is
              no longer a “time owner” and the setting is either:<o:p></o:p></span></p>
          <p class="MsoNormal"><span style="color:windowtext">NTPEnabled:
              true or false<o:p></o:p></span></p>
          <p class="MsoNormal"><span style="color:windowtext">If false,
              we are not allowing the user to set the time, because the
              BMC is synching from the host time and therefore any
              settings we made to the time on the BMC would be
              overwritten. <o:p></o:p></span></p>
          <p class="MsoNormal"><span style="color:windowtext">If true,
              we use the NTP server(s) the user provides.<o:p></o:p></span></p>
          <p class="MsoNormal"><span style="color:windowtext"><o:p> </o:p></span></p>
          <p class="MsoNormal"><span style="color:windowtext">We are
              testing this currently.</span></p>
        </div>
      </blockquote>
      <div><br>
        Hi, Thank you for the response. From what I interpreted:<br>
        <br>
      </div>
      <div>- TimeOwner is not settable via GUI<br>
        - Irrespective of NTP setting, the user is not allowed to set
        the time on BMC<br>
        - BMC is syncing the time from Host.<br>
           - This means, the current TimeOwner is "Host" and NTP is off.
        Is that being set as default ?<br>
      </div>
      <div><br>
        I am requesting for feedback from the community on the need of
        TimeOwner feature that we have in Settings and timemanager code.<br>
      </div>
      <div><br>
        !! Vishwa !!<br>
      </div>
      <blockquote type="cite"
cite="mid:FD0BD680739BFC41807C96BD23118BB1321C1D@ORSMSX113.amr.corp.intel.com">
        <div class="WordSection1">
          <p class="MsoNormal"><span style="color:windowtext"><a
                name="_____replyseparator" moz-do-not-send="true"></a><o:p></o:p></span></p>
        </div>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------3B21553CD2D38F93CFFC267B--

