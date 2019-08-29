Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 39374A187B
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 13:29:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46K0l74g8xzDrdR
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 21:29:55 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46K0kJ5kRDzDqmY
 for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2019 21:29:12 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7TBT2WS124815
 for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2019 07:29:07 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2upbuuckfe-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2019 07:29:06 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Thu, 29 Aug 2019 12:29:05 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 29 Aug 2019 12:29:02 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7TBT1lU56361008
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Aug 2019 11:29:01 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD68011C05E;
 Thu, 29 Aug 2019 11:29:01 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF13E11C04C;
 Thu, 29 Aug 2019 11:29:00 +0000 (GMT)
Received: from [9.85.110.149] (unknown [9.85.110.149])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 29 Aug 2019 11:29:00 +0000 (GMT)
Subject: Re: Document about the REST interface
To: =?UTF-8?B?WGlhb2NoYW8gTWEgKOmprOWwj+i2hSk=?= <maxiaochao@inspur.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <bcf71058f3494169b90ee051e0079bb6@inspur.com>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Thu, 29 Aug 2019 16:58:59 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <bcf71058f3494169b90ee051e0079bb6@inspur.com>
Content-Type: multipart/alternative;
 boundary="------------3FD9013DC3095FE48644E220"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19082911-0020-0000-0000-000003653AEC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082911-0021-0000-0000-000021BA92DA
Message-Id: <d0bbfd57-1b31-a34f-6629-896e963e357e@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-29_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=870 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908290127
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
--------------3FD9013DC3095FE48644E220
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ma,

Thanks for putting this together. Could you please create a pull request 
so that it can go through the review process ?

!! Vishwa !!

On 8/29/19 3:17 PM, Xiaochao Ma (马小超) wrote:
>
> I wrote a document about the REST interface (contains the REDFISH 
> section ).
> It contains all the commands in REST-cheatsheet.md , 
> REDFISH-cheatsheet.md and a REST related document.
> This document includes power, FW update, time settings, event log and 
> related commands.
> All commands have been run on the fp5280g2 machine.
> I want to upload this document to openbmc/docs because I think this 
> document is good for the community.
> Can this document be accepted?
> Here is the link:
> https://github.com/inspur-bmc/openbmc-doc/blob/master/user's%20guide.md
>

--------------3FD9013DC3095FE48644E220
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi Ma,</p>
    <p>Thanks for putting this together. Could you please create a pull
      request so that it can go through the review process ?</p>
    <p>!! Vishwa !!<br>
    </p>
    <div class="moz-cite-prefix">On 8/29/19 3:17 PM, Xiaochao Ma (马小超)
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:bcf71058f3494169b90ee051e0079bb6@inspur.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:宋体;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:宋体;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@宋体";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"纯文本 Char";
	margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:宋体;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.Char
	{mso-style-name:"纯文本 Char";
	mso-style-priority:99;
	mso-style-link:纯文本;
	font-family:宋体;}
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
        <p class="MsoPlainText"><span lang="EN-US">I wrote a document
            about the REST interface (contains the REDFISH section ).<br>
            It contains all the commands in REST-cheatsheet.md ,
            REDFISH-cheatsheet.md and a REST related document.<br>
            This document includes power, FW update, time settings,
            event log and related commands.<br>
            All commands have been run on the fp5280g2 machine.<br>
            I want to upload this document to openbmc/docs because I
            think this document is good for the community.<br>
            Can this document be accepted?<br>
            Here is the link:<br>
<a class="moz-txt-link-freetext" href="https://github.com/inspur-bmc/openbmc-doc/blob/master/user's%20guide.md">https://github.com/inspur-bmc/openbmc-doc/blob/master/user's%20guide.md</a><o:p></o:p></span></p>
        <p class="MsoNormal"><span lang="EN-US"><o:p> </o:p></span></p>
      </div>
    </blockquote>
  </body>
</html>

--------------3FD9013DC3095FE48644E220--

