Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B031324B58
	for <lists+openbmc@lfdr.de>; Tue, 21 May 2019 11:21:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457Vch1tjZzDqM7
	for <lists+openbmc@lfdr.de>; Tue, 21 May 2019 19:21:08 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 457Vc70VjLzDqL7
 for <openbmc@lists.ozlabs.org>; Tue, 21 May 2019 19:20:38 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4L97w0I143267
 for <openbmc@lists.ozlabs.org>; Tue, 21 May 2019 05:20:34 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2smdy31qbn-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 21 May 2019 05:20:34 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Tue, 21 May 2019 10:20:32 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 21 May 2019 10:20:30 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4L9KTEU28901540
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 May 2019 09:20:29 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E82D7A4069;
 Tue, 21 May 2019 09:20:28 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69069A4053;
 Tue, 21 May 2019 09:20:28 +0000 (GMT)
Received: from [9.199.74.37] (unknown [9.199.74.37])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 21 May 2019 09:20:28 +0000 (GMT)
Subject: Re: Platform telemetry and health monitoring
To: Neeraj Ladkani <neladk@microsoft.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <BL0PR2101MB0932AE0C63ADC3CBDAE0CF16C8060@BL0PR2101MB0932.namprd21.prod.outlook.com>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Tue, 21 May 2019 14:50:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <BL0PR2101MB0932AE0C63ADC3CBDAE0CF16C8060@BL0PR2101MB0932.namprd21.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------17463D85F8B30293975C5822"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19052109-0008-0000-0000-000002E8DD62
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052109-0009-0000-0000-0000225592C6
Message-Id: <4d082cf8-c99c-22ac-9a60-85f70abb8bd6@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-21_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905210059
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
--------------17463D85F8B30293975C5822
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Neeraj,

Please find my entry here.

!! Vishwa !!

On 5/21/19 1:54 AM, Neeraj Ladkani wrote:
>
> Hi All,
>
> As we discussed having a focused workstream for “/Platform telemetry 
> and health monitoring/” in one of email thread, Please let me know if 
> you would like to join this work stream. It would be great to have 
> participation from Silicon partners/ mainboard design and mfg 
> partners/ Memory/ NICs/ Firmware and other components.
>
> Name
>
> 	
>
> Preferred Timings
>
> 	
>
> Agenda / Contribution Areas
>
>  Vishwanatha Subbanna ( Vishwa )
>
> 	
>
>  6:00 PM - 7:00 PM IST ( +5:30 )
>
> 	
>
> Firmware --> BMC health, HW link monitoring from BMC, OCC sensors
>
> 	
>
> 	
>
> 	
>
> 	
>
> Once we have enough quorum, we will put together bi-weekly call to 
> brainstorm various ideas and proposals.
>
> Thanks
>
> Neeraj
>

--------------17463D85F8B30293975C5822
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Neeraj,</p>
    <p>Please find my entry here.</p>
    <p>!! Vishwa !!<br>
    </p>
    <div class="moz-cite-prefix">On 5/21/19 1:54 AM, Neeraj Ladkani
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:BL0PR2101MB0932AE0C63ADC3CBDAE0CF16C8060@BL0PR2101MB0932.namprd21.prod.outlook.com">
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
	color:#2F5496;
	font-weight:normal;
	font-style:normal;}
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
        <p class="MsoNormal"><span style="color:#2F5496">Hi All, <o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#2F5496"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="color:#2F5496">As we discussed
            having a focused workstream for “<i>Platform telemetry and
              health monitoring</i>” in one of email thread, Please let
            me know if you would like to join this work stream. It would
            be great to have participation from Silicon partners/
            mainboard design and mfg partners/ Memory/ NICs/ Firmware
            and other components.
            <o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#2F5496"><o:p> </o:p></span></p>
        <table class="MsoTableGrid"
          style="border-collapse:collapse;border:none" cellspacing="0"
          cellpadding="0" border="1">
          <tbody>
            <tr>
              <td style="width:155.8pt;border:solid windowtext
                1.0pt;padding:0in 5.4pt 0in 5.4pt" width="208"
                valign="top">
                <p class="MsoNormal"><span style="color:#2F5496">Name<o:p></o:p></span></p>
              </td>
              <td style="width:155.85pt;border:solid windowtext
                1.0pt;border-left:none;padding:0in 5.4pt 0in 5.4pt"
                width="208" valign="top">
                <p class="MsoNormal"><span style="color:#2F5496">Preferred
                    Timings<o:p></o:p></span></p>
              </td>
              <td style="width:155.85pt;border:solid windowtext
                1.0pt;border-left:none;padding:0in 5.4pt 0in 5.4pt"
                width="208" valign="top">
                <p class="MsoNormal"><span style="color:#2F5496">Agenda
                    / Contribution Areas<o:p></o:p></span></p>
              </td>
            </tr>
            <tr>
              <td style="width:155.8pt;border:solid windowtext
                1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt"
                width="208" valign="top">
                <p class="MsoNormal"><span style="color:#2F5496"><o:p> Vishwanatha
                      Subbanna ( Vishwa )<br>
                    </o:p></span></p>
              </td>
              <td
style="width:155.85pt;border-top:none;border-left:none;border-bottom:solid
                windowtext 1.0pt;border-right:solid windowtext
                1.0pt;padding:0in 5.4pt 0in 5.4pt" width="208"
                valign="top">
                <p class="MsoNormal"><span style="color:#2F5496"><o:p> 6:00
                      PM - 7:00 PM IST ( +5:30 )<br>
                    </o:p></span></p>
              </td>
              <td
style="width:155.85pt;border-top:none;border-left:none;border-bottom:solid
                windowtext 1.0pt;border-right:solid windowtext
                1.0pt;padding:0in 5.4pt 0in 5.4pt" width="208"
                valign="top">
                <p class="MsoNormal"><span style="color:#2F5496"><o:p>Firmware
                      --&gt; BMC health, HW link monitoring from BMC,
                      OCC sensors<br>
                    </o:p></span></p>
              </td>
            </tr>
            <tr>
              <td style="width:155.8pt;border:solid windowtext
                1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt"
                width="208" valign="top">
                <p class="MsoNormal"><span style="color:#2F5496"><o:p> </o:p></span></p>
              </td>
              <td
style="width:155.85pt;border-top:none;border-left:none;border-bottom:solid
                windowtext 1.0pt;border-right:solid windowtext
                1.0pt;padding:0in 5.4pt 0in 5.4pt" width="208"
                valign="top">
                <p class="MsoNormal"><span style="color:#2F5496"><o:p> </o:p></span></p>
              </td>
              <td
style="width:155.85pt;border-top:none;border-left:none;border-bottom:solid
                windowtext 1.0pt;border-right:solid windowtext
                1.0pt;padding:0in 5.4pt 0in 5.4pt" width="208"
                valign="top">
                <p class="MsoNormal"><span style="color:#2F5496"><o:p> </o:p></span></p>
              </td>
            </tr>
            <tr>
              <td style="width:155.8pt;border:solid windowtext
                1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt"
                width="208" valign="top">
                <p class="MsoNormal"><span style="color:#2F5496"><o:p> </o:p></span></p>
              </td>
              <td
style="width:155.85pt;border-top:none;border-left:none;border-bottom:solid
                windowtext 1.0pt;border-right:solid windowtext
                1.0pt;padding:0in 5.4pt 0in 5.4pt" width="208"
                valign="top">
                <p class="MsoNormal"><span style="color:#2F5496"><o:p> </o:p></span></p>
              </td>
              <td
style="width:155.85pt;border-top:none;border-left:none;border-bottom:solid
                windowtext 1.0pt;border-right:solid windowtext
                1.0pt;padding:0in 5.4pt 0in 5.4pt" width="208"
                valign="top">
                <p class="MsoNormal"><span style="color:#2F5496"><o:p> </o:p></span></p>
              </td>
            </tr>
          </tbody>
        </table>
        <p class="MsoNormal"><span style="color:#2F5496"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="color:#2F5496">Once we have
            enough quorum, we will put together bi-weekly call to
            brainstorm various ideas and proposals.
            <o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#2F5496"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="color:#2F5496">Thanks <o:p></o:p></span></p>
        <p class="MsoNormal"><span style="color:#2F5496">Neeraj<o:p></o:p></span></p>
        <p class="MsoNormal"><o:p> </o:p></p>
      </div>
    </blockquote>
  </body>
</html>

--------------17463D85F8B30293975C5822--

